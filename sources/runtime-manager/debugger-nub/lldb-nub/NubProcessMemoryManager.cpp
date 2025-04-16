#include "NubProcess.h"
#include "NubLLDBContext.h"
#include "NubProcessMemoryManager.h"

#include <llvm/Support/FormatVariadic.h>

namespace nub_private {

struct FinalizedAllocInfo {
  FinalizedAllocInfo(std::vector<lldb::addr_t> addresses)
    : addresses(std::move(addresses)) {
  }
  std::vector<lldb::addr_t> addresses;
};

class NubProcessMemoryManager::NubInFlightAlloc : public llvm::jitlink::JITLinkMemoryManager::InFlightAlloc {
private:
  NubProcessMemoryManager &Parent;
  std::vector<lldb::addr_t> allocations;
  llvm::jitlink::BasicLayout BL;

public:
  NubInFlightAlloc(NubProcessMemoryManager &Parent, std::vector<lldb::addr_t> allocations, llvm::jitlink::BasicLayout BL)
    : Parent(Parent), allocations(std::move(allocations)), BL(std::move(BL)) {
  }

  virtual void abandon(OnAbandonedFunction OnAbandoned) override {
    this->Parent.nlc_.mutex.lock();
    lldb::SBProcess &process = this->Parent.nlc_.process;
    for (auto &KV : this->BL.segments()) {
      auto &Seg = KV.second;
      delete [] Seg.WorkingMem;
    }
    for (auto addr : this->allocations) {
      NUB_DEBUG(llvm::errs() << "Abandoning " << llvm::format_hex(addr, 18) << "\n");
      lldb::SBError error { process.DeallocateMemory(addr) };
      if (error.Fail()) {
        this->Parent.nlc_.mutex.unlock();
        OnAbandoned(errorFromSBError(std::move(error)));
        return;
      }
    }
    this->Parent.nlc_.mutex.unlock();
    OnAbandoned(llvm::Error::success());
  }

  virtual void finalize(OnFinalizedFunction OnFinalized) override {
    this->Parent.nlc_.mutex.lock();
    lldb::SBProcess &process = this->Parent.nlc_.process;
    auto i = 0;
    for (auto &KV : BL.segments()) {
      auto &AG = KV.first;
      auto &Seg = KV.second;
      auto Size { Seg.ContentSize + Seg.ZeroFillSize };
      auto Addr { this->allocations[i++] };
      NUB_DEBUG({
          llvm::dbgs() << "Finalizing " << AG.getMemProt() << " segment at "
                       << llvm::format_hex(Addr, 18) << "\n";
      });
      lldb::SBError error;
      process.WriteMemory(Addr, Seg.WorkingMem, Size, error);
      delete [] Seg.WorkingMem;
      if (error.Fail()) {
        this->Parent.nlc_.mutex.unlock();
        OnFinalized(errorFromSBError(std::move(error)));
        return;
      }
    }
    this->Parent.nlc_.mutex.unlock();
    OnFinalized(FinalizedAlloc(llvm::orc::ExecutorAddr::fromPtr(new FinalizedAllocInfo(this->allocations))));
  }
};

void NubProcessMemoryManager::allocate(const llvm::jitlink::JITLinkDylib *JD,
                                       llvm::jitlink::LinkGraph &G,
                                       OnAllocatedFunction OnAllocated)
{
  std::vector<lldb::addr_t> allocations;
  llvm::jitlink::BasicLayout BL(G);

  for (auto &KV : BL.segments()) {
    auto &AG = KV.first;
    auto &Seg = KV.second;

    using namespace llvm;
    using namespace llvm::jitlink;

    if (AG.getMemLifetime() != llvm::orc::MemLifetime::Standard) {
      OnAllocated(llvm::createStringError(llvm::inconvertibleErrorCode(),
                                          "Non-Standard dealloc policy not implemented"));
      return;
    }

    llvm::orc::MemProt segment_prot = AG.getMemProt();
    uint32_t protection = 0;
    if ((segment_prot & llvm::orc::MemProt::Read) != llvm::orc::MemProt::None) {
      protection |= lldb::ePermissionsWritable;
    }
    if ((segment_prot & llvm::orc::MemProt::Read) != llvm::orc::MemProt::None) {
      protection |= lldb::ePermissionsReadable;
    }
    if ((segment_prot & llvm::orc::MemProt::Exec) != llvm::orc::MemProt::None) {
      protection |= lldb::ePermissionsExecutable;
    }
    auto size { Seg.ContentSize + Seg.ZeroFillSize };
    NUB_DEBUG({
      llvm::dbgs() << "Request " << AG << ":\n";
      llvm::dbgs() << "  Size " << Seg.ContentSize
                   << " ZFSize " << Seg.ZeroFillSize
                   << " Align " << llvm::formatv("{0:x}", Seg.Alignment.value())
                   << "\n";
    });
    lldb::SBError error;
    {
      std::unique_lock<std::recursive_mutex> guard(this->nlc_.mutex);
      auto addr { this->nlc_.process.AllocateMemory(size, protection, error) };
      Seg.Addr = llvm::orc::ExecutorAddr(addr);
      allocations.push_back(addr);
    }
    NUB_DEBUG(llvm::dbgs() << "  Allocated " << Seg.Addr << "\n");
    if (error.Success()) {
      Seg.WorkingMem = new char[size];
      if (Seg.ZeroFillSize != 0) {
        memset(Seg.WorkingMem + Seg.ContentSize, 0, Seg.ZeroFillSize);
      }
    }
    else {
      // FIXME deallocate anything already allocated
    }
  }

  if (auto Err = BL.apply()) {
    OnAllocated(std::move(Err));
    return;
  }

  OnAllocated(std::make_unique<NubInFlightAlloc>(*this, std::move(allocations), std::move(BL)));
}

void NubProcessMemoryManager::deallocate(std::vector<FinalizedAlloc> Allocs,
                                         OnDeallocatedFunction OnDeallocated)
{
  // Unconditionally release the finalized allocations and collect
  // their addresses
  std::vector<lldb::addr_t> addresses;
  for (auto &Alloc : Allocs) {
    std::unique_ptr<FinalizedAllocInfo> FAI
      { Alloc.release().toPtr<FinalizedAllocInfo *>() };
    for (auto Addr : FAI->addresses) {
      NUB_DEBUG(llvm::errs() << "Hoarded " << llvm::format_hex(Addr, 18) << "\n");
      addresses.push_back(Addr);
    }
  }

  llvm::Error deallocate_error = llvm::Error::success();
#if 0
  this->nlc_.mutex.lock();
  for (auto Addr : addresses) {
    lldb::SBError error = this->nlc_.process.DeallocateMemory(Addr);
    if (error.Fail()) {
      llvm::errs() << "Fail: " << error.GetCString() << "\n";
      deallocate_error = llvm::joinErrors(std::move(deallocate_error),
                                          errorFromSBError(std::move(error)));
    }
  }
  this->nlc_.mutex.unlock();
#endif
  OnDeallocated(std::move(deallocate_error));
}

} // namespace nub_private

