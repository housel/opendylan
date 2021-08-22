#include <cstdlib>
#include <unistd.h>
#include <wordexp.h>
#include <signal.h>

#include <memory>
#include <iostream>
#include <algorithm>
#include <set>

#include <lldb/API/LLDB.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/Format.h>
#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include <llvm/ExecutionEngine/Orc/ObjectLinkingLayer.h>
#include <llvm/ExecutionEngine/Orc/ELFNixPlatform.h>
#include <llvm/ExecutionEngine/Orc/LLJIT.h>

#include "nub-server-impl.h"
#include "remote-nub-jit.h"
#include "remote-nub-impl.h"

using namespace std;

namespace {
  llvm::Error errorFromSBError(lldb::SBError err)
  {
    return err.Success()
      ? llvm::Error::success()
      : llvm::createStringError(llvm::inconvertibleErrorCode(),
                                "lldb: %s", err.GetCString());
  }
}

NubExecutorProcessControl::NubExecutorProcessControl(std::shared_ptr<llvm::orc::SymbolStringPool> SSP,
                                                     std::unique_ptr<llvm::jitlink::JITLinkMemoryManager> MemMgr,
                                                     Rtmgr_RemoteNub_i &parent)
  : ExecutorProcessControl(std::move(SSP)),
    parent_(parent)
{
  this->owned_memory_manager_ = std::move(MemMgr);
  this->MemAccess = this;
  this->MemMgr = this->owned_memory_manager_.get();
}

llvm::Expected<llvm::orc::tpctypes::DylibHandle>
NubExecutorProcessControl::loadDylib(const char *DylibPath)
{
  llvm::errs() << __func__ << "\n";
  return llvm::createStringError(llvm::inconvertibleErrorCode(),
                                 "%s unimplemented", &__func__[0]);
}

llvm::Expected<std::vector<llvm::orc::tpctypes::LookupResult>>
NubExecutorProcessControl::lookupSymbols(llvm::ArrayRef<LookupRequest> Request)
{
  llvm::errs() << __func__ << "\n";
  return llvm::createStringError(llvm::inconvertibleErrorCode(),
                                 "%s unimplemented", &__func__[0]);
}

llvm::Expected<int32_t>
NubExecutorProcessControl::runAsMain(llvm::JITTargetAddress MainFnAddr,
                                   llvm::ArrayRef<std::string> Args)
{
  llvm::errs() << __func__ << "\n";
  return llvm::createStringError(llvm::inconvertibleErrorCode(),
                                 "%s unimplemented", &__func__[0]);
}

void
NubExecutorProcessControl::callWrapperAsync(llvm::orc::ExecutorProcessControl::SendResultFunction OnComplete,
                                         llvm::JITTargetAddress WrapperFnAddr,
                                         llvm::ArrayRef<char> ArgBuffer)
{
  llvm::errs() << __func__ << "\n";
}

llvm::Error NubExecutorProcessControl::disconnect()
{
  llvm::errs() << __func__ << "\n";
  return llvm::Error::success();
}

void
NubExecutorProcessControl::writeUInt8s(llvm::ArrayRef<llvm::orc::tpctypes::UInt8Write> Ws,
                                       WriteResultFn OnWriteComplete)
{
  llvm::errs() << "writeUInt8s " << Ws.size() << "\n";
  OnWriteComplete(llvm::createStringError(llvm::inconvertibleErrorCode(),
                                          "%s unimplemented", &__func__[0]));
}

void
NubExecutorProcessControl::writeUInt16s(llvm::ArrayRef<llvm::orc::tpctypes::UInt16Write> Ws,
                                        WriteResultFn OnWriteComplete)
{
  llvm::errs() << "writeUInt16s " << Ws.size() << "\n";
  OnWriteComplete(llvm::createStringError(llvm::inconvertibleErrorCode(),
                                          "%s unimplemented", &__func__[0]));
}

void
NubExecutorProcessControl::writeUInt32s(llvm::ArrayRef<llvm::orc::tpctypes::UInt32Write> Ws,
                                        WriteResultFn OnWriteComplete)
{
  llvm::errs() << "writeUInt32s " << Ws.size() << "\n";
  OnWriteComplete(llvm::createStringError(llvm::inconvertibleErrorCode(),
                                          "%s unimplemented", &__func__[0]));
}

void
NubExecutorProcessControl::writeUInt64s(llvm::ArrayRef<llvm::orc::tpctypes::UInt64Write> Ws,
                                        WriteResultFn OnWriteComplete)
{
  llvm::errs() << "writeUInt64s " << Ws.size() << "\n";
  OnWriteComplete(llvm::createStringError(llvm::inconvertibleErrorCode(),
                                          "%s unimplemented", &__func__[0]));
}

void
NubExecutorProcessControl::writeBuffers(llvm::ArrayRef<llvm::orc::tpctypes::BufferWrite> Ws,
                                        WriteResultFn OnWriteComplete)
{
  llvm::errs() << "writeBuffers " << Ws.size() << "\n";
  for (auto &wr : Ws) {
    auto error { this->parent_.do_with_process([&wr](lldb::SBProcess &process) {
      lldb::SBError error;
      process.WriteMemory(wr.Address, wr.Buffer.data(), wr.Buffer.size(), error);
      return error;
    }) };
    if (error.Fail()) {
      OnWriteComplete(errorFromSBError(std::move(error)));
      return;
    }
  }
  OnWriteComplete(llvm::Error::success());
}


// ------------------------------------------------------------------------

namespace {
  class NubAllocation : public llvm::jitlink::JITLinkMemoryManager::Allocation {
    using ProtectionFlags = llvm::sys::Memory::ProtectionFlags;

    lldb::SBProcess &process_;  // Worrisome
    struct HostMemory {
      std::unique_ptr<char[]> memory;
      size_t size;
    };
    llvm::DenseMap<unsigned, HostMemory> workingMap_;
    llvm::DenseMap<unsigned, lldb::addr_t> targetMap_;

  public:
    ~NubAllocation() {
      llvm::errs() << "Goodbye NubAllocation with "
                   << this->targetMap_.size()
                   << " target blocks\n";
    }

    struct TargetMemory {
      lldb::addr_t memory;
      size_t size;
    };
    using AllocationMap = llvm::DenseMap<unsigned, TargetMemory>;
    NubAllocation(lldb::SBProcess &process, const AllocationMap &map)
      : process_(process) {
      for (auto &entry : map) {
        this->workingMap_[entry.first] = {
          std::make_unique<char[]>(entry.second.size),
          entry.second.size
        };
        this->targetMap_[entry.first] = entry.second.memory;
      }
    }

    llvm::MutableArrayRef<char> getWorkingMemory(ProtectionFlags seg) override {
      auto &entry { this->workingMap_[seg] };
      return llvm::MutableArrayRef<char>(entry.memory.get(), entry.size);
    }

    llvm::JITTargetAddress getTargetMemory(ProtectionFlags seg) override {
      return this->targetMap_[seg];
    }

    void finalizeAsync(FinalizeContinuation OnFinalize) override {
      // Construct writes to transfer the working memory into the target
      lldb::SBError error;
      for (auto &entry : this->targetMap_) {
        auto &working_memory { this->workingMap_[entry.first] };
        process_.WriteMemory(entry.second, working_memory.memory.get(), working_memory.size, error);
        if (error.Fail()) {
          break;
        }
        llvm::errs() << "Finalize " << llvm::format_hex(entry.second, 18) << "\n";
      }

      // After transfer we're done with the working memory
      this->workingMap_.clear();

      OnFinalize(std::move(errorFromSBError(error)));
    }

    llvm::Error deallocate() override {
      llvm::errs() << "NubAllocation deallocate!\n";
      for (auto &entry : this->targetMap_) {
        // auto error { this->process_.DeallocateMemory(entry.second) };
      }
      return llvm::Error::success();
    }
  };

  class NubMemoryManager : public llvm::jitlink::JITLinkMemoryManager {
  public:
    NubMemoryManager(lldb::SBProcess process)
      : process_(process) {
    }

    llvm::Expected<std::unique_ptr<Allocation>>
    allocate(const llvm::jitlink::JITLinkDylib *JD, const SegmentsRequestMap &Request) override {
      NubAllocation::AllocationMap map;
      for (auto &re : Request) {
        uint32_t protection = 0;
        if (re.first & llvm::sys::Memory::MF_WRITE) {
          protection |= lldb::ePermissionsWritable;
        }
        if (re.first & llvm::sys::Memory::MF_READ) {
          protection |= lldb::ePermissionsReadable;
        }
        if (re.first & llvm::sys::Memory::MF_EXEC) {
          protection |= lldb::ePermissionsExecutable;
        }
        auto size { re.second.getContentSize() };
        llvm::errs() << "Request " << llvm::format_hex(re.first, 10) << ":\n";
        llvm::errs()
          << "  Size " << re.second.getContentSize()
          << " ZFSize " << re.second.getZeroFillSize()
          << " Align " << re.second.getAlignment()
          << "\n";
        lldb::SBError error;
        auto addr { this->process_.AllocateMemory(size, protection, error) };
        llvm::errs() << "  Allocated " << llvm::format_hex(addr, 18) << "\n";
        if (error.Success()) {
          map[re.first] = { addr, size };
        }
        else {
          // FIXME deallocate anything already allocated
          return errorFromSBError(std::move(error));
        }
      }
      return std::make_unique<NubAllocation>(process_, map);
    }
  private:
    lldb::SBProcess process_;
  };

  class NubDebutPlugin : public llvm::orc::ObjectLinkingLayer::Plugin {
  public:
    // Add passes to print the set of defined symbols after dead-stripping.
    void modifyPassConfig(llvm::orc::MaterializationResponsibility &MR,
                          llvm::jitlink::LinkGraph &G,
                          llvm::jitlink::PassConfiguration &Config) override {
      llvm::errs() << "Debut modifyPassConfig\n";
      Config.PostPrunePasses.push_back([this](llvm::jitlink::LinkGraph &G) {
        llvm::errs() << "Debut post-prune pass for "
                     << G.getName()
                     << " reports:\n";
        return this->printAllSymbols(G);
      });
      Config.PostAllocationPasses.push_back([this](llvm::jitlink::LinkGraph &G) {
        llvm::errs() << "Debut post-allocation pass for "
                     << G.getName()
                     << " reports:\n";
        for (auto *block : G.blocks()) {
          llvm::errs() << "  block from " << block->getSection().getName()
                       << " address " << llvm::format_hex(block->getAddress(), 18)
                       << " size " << block->getSize()
                       << "\n";
        }
        for (auto *Sym : G.defined_symbols()) {
          if (Sym->hasName()) {
            llvm::errs() << "  " << Sym->getName();
            if (Sym->isDefined()) {
              llvm::errs() << " address " << llvm::format_hex(Sym->getAddress(), 18);
              auto &block { Sym->getBlock() };
              llvm::errs() << " in section " << block.getSection().getName();
            }
            llvm::errs() << "\n";
          }
        }
        return llvm::Error::success();
      });
    }

    virtual void notifyLoaded(llvm::orc::MaterializationResponsibility &MR) override {
      llvm::errs() << "Debut notifyLoaded for "
                   << MR.getTargetJITDylib().getName();
      auto is { MR.getInitializerSymbol() };
      if (is) {
        llvm::errs() << " init symbol " << is;
      }
      llvm::errs() << "\n";
    }
    virtual llvm::Error notifyEmitted(llvm::orc::MaterializationResponsibility &MR) override {
      llvm::errs() << "Debut notifyEmitted for "
                   << MR.getTargetJITDylib().getName()
                   << "\n";
      return llvm::Error::success();
    }

    // Implement mandatory overrides:
    llvm::Error notifyFailed(llvm::orc::MaterializationResponsibility &MR) override {
      llvm::errs() << "Debut notifyFailed for "
                   << MR.getTargetJITDylib().getName()
                   << "\n";
      return llvm::Error::success();
    }
    llvm::Error notifyRemovingResources(llvm::orc::ResourceKey K) override {
      llvm::errs() << "Debut notifyRemovingResources "
                   << llvm::format_hex(K, 10)
                   << "\n";
      return llvm::Error::success();
    }
    void notifyTransferringResources(llvm::orc::ResourceKey DstKey,
                                     llvm::orc::ResourceKey SrcKey) override {
      llvm::errs() << "Debut notifyTransferringResources "
                   << llvm::format_hex(DstKey, 10)
                   << " <- " << llvm::format_hex(SrcKey, 10)
                   << "\n";
    }

    // JITLink pass to print all defined symbols in G.
    llvm::Error printAllSymbols(llvm::jitlink::LinkGraph &G) {
      for (auto *Sym : G.defined_symbols()) {
        if (Sym->hasName()) {
          llvm::errs() << "  " << Sym->getName() << "\n";
        }
      }

      return llvm::Error::success();
    }
  };

  // Generator for looking up symbols in the debug target
  class NubTargetDefinitionGenerator : public llvm::orc::DefinitionGenerator {
  public:
    NubTargetDefinitionGenerator(Rtmgr_RemoteNub_i &nub)
      : DefinitionGenerator(),
        nub_(nub) {
    }

    llvm::Error tryToGenerate(llvm::orc::LookupState &LS, llvm::orc::LookupKind K,
                              llvm::orc::JITDylib &JD,
                              llvm::orc::JITDylibLookupFlags JDLookupFlags,
                              const llvm::orc::SymbolLookupSet &LookupSet) override {
      llvm::orc::SymbolMap FoundSymbols;
      nub_.do_with_process([LookupSet, &FoundSymbols](lldb::SBProcess &process) {
        auto target { process.GetTarget() };
        for (auto &kv : LookupSet) {
          const auto &name = kv.first;
          llvm::errs() << "Lookup " << name << "\n";
          auto context_list { target.FindSymbols((*name).str().c_str()) };
          for (uint32_t i = 0, e = context_list.GetSize(); i != e; ++i) {
            auto context { context_list.GetContextAtIndex(i) };
            // lldb::SBStream stream;
            // context.GetDescription(stream);
            // llvm::errs() << stream.GetData();
            auto symbol { context.GetSymbol() };
            auto address { symbol.GetStartAddress() };
            if (address.IsValid()) {
              auto load_addr { address.GetLoadAddress(target) };
              llvm::JITSymbolFlags flags = llvm::JITSymbolFlags::None;
              if (symbol.GetType() == lldb::eSymbolTypeCode) {
                flags |= llvm::JITSymbolFlags::Callable;
              }
              if (symbol.IsExternal()) {
                flags |= llvm::JITSymbolFlags::Exported;
              }
              FoundSymbols[name] = llvm::JITEvaluatedSymbol(load_addr, flags);
            }
          }
        }
        return lldb::SBError();
      });

      if (FoundSymbols.empty()) {
        return llvm::Error::success();
      }
      return JD.define(llvm::orc::absoluteSymbols(std::move(FoundSymbols)));
    }

  private:
    Rtmgr_RemoteNub_i &nub_;
  };
}


// ------------------------------------------------------------------------

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::download_code
    (Rtmgr::RemoteNub::RNUBTHREAD nubthread,
     const Rtmgr::RemoteNub::CODE_SEQ &download_records,
     const char *entry_point,
     Rtmgr::RemoteNub::REGION_SEQ_out regions,
     Rtmgr::RemoteNub::NUBINT &first,
     Rtmgr::RemoteNub::NUBINT &last,
     Rtmgr::RemoteNub::RNUBHANDLE &lookups)
{
  // FIXME
  regions = new Rtmgr::RemoteNub::REGION_SEQ(0);
  regions->length(0);

  // Allocate a slot for the symbols to be returned
  lookups = this->lookups_.size();
  this->lookups_.emplace_back(std::vector<Lookup>());

  std::cerr << "download_code " << download_records.length()
            << " records, entry point " << entry_point
            << std::endl;

  auto JTMB { llvm::orc::JITTargetMachineBuilder::detectHost() };
  JTMB->setCodeModel(llvm::CodeModel::Large);

  auto DL { JTMB->getDefaultDataLayoutForTarget() };
  if (!DL) {
    llvm::errs() << DL.takeError() << "\n";
    return -1;
  }

  // Build the LLJIT using ObjectLinkingLayer
  auto MM { std::make_unique<NubMemoryManager>(this->target_.GetProcess()) };
  auto EPC { std::make_unique<NubExecutorProcessControl>(this->ssp_, std::move(MM), *this) };
  auto Creator {
    [](llvm::orc::ExecutionSession &ES, const llvm::Triple &) -> llvm::Expected<std::unique_ptr<llvm::orc::ObjectLayer>> {
      auto OLL { std::make_unique<llvm::orc::ObjectLinkingLayer>(ES) };
      OLL->addPlugin(std::make_unique<NubDebutPlugin>());
      OLL->setReturnObjectBuffer([](std::unique_ptr<llvm::MemoryBuffer> buf) {
        llvm::errs() << "Return buffer " << buf->getBufferSize() << "\n";
      });
      return std::move(OLL);
    }
  };
  auto EJ { llvm::orc::LLJITBuilder()
    .setJITTargetMachineBuilder(std::move(*JTMB))
    .setObjectLinkingLayerCreator(Creator)
    .setExecutorProcessControl(std::move(EPC))
    .create() };
  if (!EJ) {
    llvm::errs() << EJ.takeError() << "\n";
    return -1;
  }

  // Add a JITDylib to represent symbols defined in the target image
  auto EJD { (*EJ)->createJITDylib("target") };
  if (!EJD) {
    llvm::errs() << EJD.takeError() << "\n";
    return -1;
  }
  EJD->addGenerator(std::make_unique<NubTargetDefinitionGenerator>(*this));
  (*EJ)->getMainJITDylib().addToLinkOrder(*EJD);

  // Parse the passed-in bitcode records and add them to the JIT
  for (CORBA::ULong ri = 0, re = download_records.length(); ri != re; ++ri) {
    auto &codeseq { download_records[ri] };
    auto codebuf { reinterpret_cast<const char *>(codeseq.get_buffer()) };
    auto codemem { llvm::MemoryBufferRef(llvm::StringRef(codebuf, codeseq.length()),
                                         "download_code") };
    auto context { std::make_unique<llvm::LLVMContext>() };
    auto M { llvm::parseBitcodeFile(codemem, *context) };
    if (!M) {
      std::cerr << "Parsing download record failed" << std::endl;
      return -1;
    }
    // Force the data layout to match the one identified by the JIT
    // compiler; the one supplied by DFMC should be compatible but
    // might not be identical
    (*M)->setDataLayout(*DL);
    llvm::errs() << "Record [" << ri
                 << "] ----------------------------------------\n";
    (*M)->print(llvm::errs(), nullptr);

    // Package the parsed module as a ThreadSafeModule and add it to
    // the JIT
    auto TSM { llvm::orc::ThreadSafeModule(std::move(*M), std::move(context)) };
    if (auto E = (*EJ)->addIRModule(std::move(TSM))) {
      llvm::errs() << E << "\n";
      return -1;
    };
  }

  // Locate the entry point, generating code as needed
  auto Entry { (*EJ)->lookup(entry_point) };
  if (!Entry) {
    llvm::errs() << Entry.takeError() << "\n";
    (*EJ)->getExecutionSession().dump(llvm::errs());
    return -1;
  }
  llvm::errs() << "Entry is " << llvm::format_hex(Entry->getAddress(), 18)
               << "\n";

  (*EJ)->getExecutionSession().dump(llvm::errs());

  // Insert it into the symbol lookups
  this->lookups_.back().push_back(Lookup(entry_point, Entry->getAddress(),
                                         true));

  first = 1;
  last = lookups_.back().size();
  llvm::errs() << "first=" << first << " last=" << last << " lookups=" << lookups << "\n";

  return 0;
}
