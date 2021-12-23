// -*- C++ -*-

#include <llvm/ExecutionEngine/Orc/ExecutorProcessControl.h>

namespace nub_private {
  class NubLLDBContext;

  class NubExecutorProcessControl : public llvm::orc::ExecutorProcessControl,
                                    private llvm::orc::ExecutorProcessControl::MemoryAccess {
  public:
    NubExecutorProcessControl(std::shared_ptr<llvm::orc::SymbolStringPool> SSP,
                              std::unique_ptr<llvm::orc::TaskDispatcher> D,
                              std::unique_ptr<llvm::jitlink::JITLinkMemoryManager> MemMgr,
                              NubLLDBContext &nlc);

    llvm::Expected<llvm::orc::tpctypes::DylibHandle>
      loadDylib(const char *DylibPath) override;

    llvm::Expected<std::vector<llvm::orc::tpctypes::LookupResult>>
      lookupSymbols(llvm::ArrayRef<LookupRequest> Request) override;

    llvm::Expected<int32_t> runAsMain(llvm::orc::ExecutorAddr MainFnAddr,
                                      llvm::ArrayRef<std::string> Args) override;

    void callWrapperAsync(llvm::orc::ExecutorAddr WrapperFnAddr,
                          IncomingWFRHandler OnComplete,
                          llvm::ArrayRef<char> ArgBuffer) override;

    llvm::Error disconnect() override;
  private:
    // MemoryAccess methods
    virtual void writeUInt8sAsync(llvm::ArrayRef<llvm::orc::tpctypes::UInt8Write> Ws,
                                  WriteResultFn OnWriteComplete) override;

    virtual void writeUInt16sAsync(llvm::ArrayRef<llvm::orc::tpctypes::UInt16Write> Ws,
                                   WriteResultFn OnWriteComplete) override;

    virtual void writeUInt32sAsync(llvm::ArrayRef<llvm::orc::tpctypes::UInt32Write> Ws,
                                   WriteResultFn OnWriteComplete) override;

    virtual void writeUInt64sAsync(llvm::ArrayRef<llvm::orc::tpctypes::UInt64Write> Ws,
                                   WriteResultFn OnWriteComplete) override;

    virtual void writeBuffersAsync(llvm::ArrayRef<llvm::orc::tpctypes::BufferWrite> Ws,
                                   WriteResultFn OnWriteComplete) override;

    //
    NubLLDBContext &nlc_;
    std::unique_ptr<llvm::jitlink::JITLinkMemoryManager> owned_memory_manager_;
  };

} // namespace nub_private


