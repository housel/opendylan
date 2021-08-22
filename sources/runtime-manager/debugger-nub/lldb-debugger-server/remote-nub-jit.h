// -*- C++ -*-

#include <llvm/ExecutionEngine/JITSymbol.h>
#include <llvm/ExecutionEngine/Orc/ExecutorProcessControl.h>

class Rtmgr_RemoteNub_i;

class NubExecutorProcessControl : public llvm::orc::ExecutorProcessControl,
                                  private llvm::orc::ExecutorProcessControl::MemoryAccess {
private:
  Rtmgr_RemoteNub_i &parent_;
  std::unique_ptr<llvm::jitlink::JITLinkMemoryManager> owned_memory_manager_;

public:
  NubExecutorProcessControl(std::shared_ptr<llvm::orc::SymbolStringPool> SSP,
                            std::unique_ptr<llvm::jitlink::JITLinkMemoryManager> MemMgr,
                            Rtmgr_RemoteNub_i &parent);

  llvm::Expected<llvm::orc::tpctypes::DylibHandle>
  loadDylib(const char *DylibPath) override;

  llvm::Expected<std::vector<llvm::orc::tpctypes::LookupResult>>
  lookupSymbols(llvm::ArrayRef<LookupRequest> Request) override;

  llvm::Expected<int32_t>
  runAsMain(llvm::JITTargetAddress MainFnAddr,
            llvm::ArrayRef<std::string> Args) override;
  void callWrapperAsync(llvm::orc::ExecutorProcessControl::SendResultFunction OnComplete,
                       llvm::JITTargetAddress WrapperFnAddr,
                       llvm::ArrayRef<char> ArgBuffer) override;

  llvm::Error disconnect() override;

private:
  // MemoryAccess methods
  void writeUInt8s(llvm::ArrayRef<llvm::orc::tpctypes::UInt8Write> Ws,
                   WriteResultFn OnWriteComplete) override;

  void writeUInt16s(llvm::ArrayRef<llvm::orc::tpctypes::UInt16Write> Ws,
                    WriteResultFn OnWriteComplete) override;

  void writeUInt32s(llvm::ArrayRef<llvm::orc::tpctypes::UInt32Write> Ws,
                    WriteResultFn OnWriteComplete) override;

  void writeUInt64s(llvm::ArrayRef<llvm::orc::tpctypes::UInt64Write> Ws,
                    WriteResultFn OnWriteComplete) override;

  void writeBuffers(llvm::ArrayRef<llvm::orc::tpctypes::BufferWrite> Ws,
                    WriteResultFn OnWriteComplete) override;


  // JITLinkMemoryManager methods
};
