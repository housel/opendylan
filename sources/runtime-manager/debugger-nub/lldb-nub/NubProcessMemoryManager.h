// -*- C++ -*-

#include "llvm/ExecutionEngine/Orc/Core.h"

#include <mutex>
#include <memory>

namespace nub_private {
  class NubLLDBContext;

  class NubProcessMemoryManager : public llvm::jitlink::JITLinkMemoryManager {
  public:
    NubProcessMemoryManager(NubLLDBContext &nlc) : nlc_(nlc) {}

    void allocate(const llvm::jitlink::JITLinkDylib *JD,
                  llvm::jitlink::LinkGraph &G,
                  OnAllocatedFunction OnAllocated) override;

    // Use overloads from base class.
    using JITLinkMemoryManager::allocate;

    void deallocate(std::vector<FinalizedAlloc> Alloc,
                    OnDeallocatedFunction OnDeallocated) override;

    // Use overloads from base class.
    using JITLinkMemoryManager::deallocate;

  private:
    class NubInFlightAlloc;

    NubLLDBContext &nlc_;
  };

}
