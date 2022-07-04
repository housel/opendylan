#include "NubProcess.h"
#include "NubLLDBContext.h"
#include "NubExecutorProcessControl.h"

#include "llvm/Support/FormatVariadic.h"

namespace nub_private {

NubExecutorProcessControl::NubExecutorProcessControl(std::shared_ptr<llvm::orc::SymbolStringPool> SSP,
                                                     std::unique_ptr<llvm::orc::TaskDispatcher> D,
                                                     std::unique_ptr<llvm::jitlink::JITLinkMemoryManager> MemMgr,
                                                     NubLLDBContext &nlc)
  : ExecutorProcessControl(std::move(SSP), std::move(D)),
    nlc_(nlc),
    owned_memory_manager_(std::move(MemMgr))
{
  this->TargetTriple = llvm::Triple(nlc.target.GetTriple());
  this->MemAccess = this;
  this->MemMgr = this->owned_memory_manager_.get();
}

llvm::Expected<llvm::orc::tpctypes::DylibHandle> NubExecutorProcessControl::loadDylib(const char *DylibPath)
{
  llvm::errs() << __func__ << "\n";
  return llvm::createStringError(llvm::inconvertibleErrorCode(),
                                 "%s unimplemented", &__func__[0]);
}

llvm::Expected<std::vector<llvm::orc::tpctypes::LookupResult>> NubExecutorProcessControl::lookupSymbols(llvm::ArrayRef<LookupRequest> Request)
{
  llvm::errs() << __func__ << "\n";
  std::vector<llvm::orc::tpctypes::LookupResult> result;
  for (auto &Item : Request) {
    
  }
  return llvm::createStringError(llvm::inconvertibleErrorCode(),
                                 "%s unimplemented", &__func__[0]);
}

llvm::Expected<int32_t> NubExecutorProcessControl::runAsMain(llvm::orc::ExecutorAddr MainFnAddr,
                                                             llvm::ArrayRef<std::string> Args)
{
  llvm::errs() << __func__ << "\n";
  return llvm::createStringError(llvm::inconvertibleErrorCode(),
                                 "%s unimplemented", &__func__[0]);
}

void NubExecutorProcessControl::callWrapperAsync(llvm::orc::ExecutorAddr WrapperFnAddr,
                                                 IncomingWFRHandler OnComplete,
                                                 llvm::ArrayRef<char> ArgBuffer)
{
  std::unique_lock<std::recursive_mutex> guard(this->nlc_.mutex);
  llvm::errs() << __func__
               << ":" << WrapperFnAddr
               << " (" << ArgBuffer.size() << " arg bytes)\n";
  // Construct a C99 expression for the call, turning ArgBuffer into a
  // string literal
  lldb::SBStream expression;
  expression.Printf("((__orc_rt_CWrapperFunctionResult (*)(const char *, size_t)) %#" PRIx64 ")(\"",
                    WrapperFnAddr.getValue());
  for (auto &c : ArgBuffer) {
    expression.Printf("\\x%02x", c & 0xFF);
  }
  expression.Printf("\", %zu)", ArgBuffer.size());
  auto thread { this->nlc_.process.GetSelectedThread() };
  auto result { this->nlc_.evaluate(thread, expression.GetData()) };
  if (result.IsValid()) {
    auto Size = result.GetChildAtIndex(1).GetValueAsUnsigned();
    auto address_size { this->nlc_.target.GetAddressByteSize() };
    if (Size == 0) {
      auto ErrMsg { result.GetChildAtIndex(0).GetChildAtIndex(0).GetValueAsUnsigned() };
      if (ErrMsg == 0) {
        OnComplete(std::move(llvm::orc::shared::WrapperFunctionResult()));
      }
      else {
        OnComplete(llvm::orc::shared::WrapperFunctionResult::createOutOfBandError("callWrapperAsync OOB Error"));
      }
    }
    else if (Size <= address_size) {
      auto Value { result.GetChildAtIndex(0).GetChildAtIndex(1).GetData() };
      auto Result { llvm::orc::shared::WrapperFunctionResult::allocate(Size) };
      lldb::SBError error;
      Value.ReadRawData(error, 0, Result.data(), Size);
      OnComplete(std::move(Result));
    }
    else {
      auto Result { llvm::orc::shared::WrapperFunctionResult::allocate(Size) };
      lldb::SBError error;
      auto DataPtr { result.GetChildAtIndex(0).GetChildAtIndex(0).GetValueAsUnsigned() };
      this->nlc_.process.ReadMemory(DataPtr, Result.data(), Size, error);
      // FIXME free
      OnComplete(llvm::orc::shared::WrapperFunctionResult::createOutOfBandError("callWrapperAsync nonempty"));
    }
  }
  else {
    OnComplete(llvm::orc::shared::WrapperFunctionResult::createOutOfBandError("callWrapperAsync error"));
  }
}

llvm::Error NubExecutorProcessControl::disconnect()
{
  llvm::errs() << __func__ << "\n";
  return llvm::Error::success();
}

void NubExecutorProcessControl::writeUInt8sAsync(llvm::ArrayRef<llvm::orc::tpctypes::UInt8Write> Ws,
                                                 WriteResultFn OnWriteComplete)
{
  llvm::errs() << "writeUInt8s " << Ws.size() << "\n";
  OnWriteComplete(llvm::createStringError(llvm::inconvertibleErrorCode(),
                                          "%s unimplemented", &__func__[0]));
}

void NubExecutorProcessControl::writeUInt16sAsync(llvm::ArrayRef<llvm::orc::tpctypes::UInt16Write> Ws,
                                                  WriteResultFn OnWriteComplete)
{
  llvm::errs() << "writeUInt16s " << Ws.size() << "\n";
  OnWriteComplete(llvm::createStringError(llvm::inconvertibleErrorCode(),
                                          "%s unimplemented", &__func__[0]));
}

void NubExecutorProcessControl::writeUInt32sAsync(llvm::ArrayRef<llvm::orc::tpctypes::UInt32Write> Ws,
                                                  WriteResultFn OnWriteComplete)
{
  llvm::errs() << "writeUInt32s " << Ws.size() << "\n";
  OnWriteComplete(llvm::createStringError(llvm::inconvertibleErrorCode(),
                                          "%s unimplemented", &__func__[0]));
}

void NubExecutorProcessControl::writeUInt64sAsync(llvm::ArrayRef<llvm::orc::tpctypes::UInt64Write> Ws,
                                                  WriteResultFn OnWriteComplete)
{
  llvm::errs() << "writeUInt64s " << Ws.size() << "\n";
  OnWriteComplete(llvm::createStringError(llvm::inconvertibleErrorCode(),
                                          "%s unimplemented", &__func__[0]));
}

void NubExecutorProcessControl::writeBuffersAsync(llvm::ArrayRef<llvm::orc::tpctypes::BufferWrite> Ws,
                                                  WriteResultFn OnWriteComplete)
{
  NUB_DEBUG(llvm::dbgs() << "writeBuffersAsync " << Ws.size() << "\n");
  this->nlc_.mutex.lock();
  for (const auto &wr : Ws) {
    lldb::SBError error;
      this->nlc_.process.WriteMemory(wr.Addr.getValue(), wr.Buffer.data(), wr.Buffer.size(), error);
    if (error.Fail()) {
      this->nlc_.mutex.unlock();
      OnWriteComplete(errorFromSBError(std::move(error)));
      return;
    }
  }
  this->nlc_.mutex.unlock();
  OnWriteComplete(llvm::Error::success());
}

llvm::Error NubExecutorProcessControl::setup()
{
  
  return getBootstrapSymbols
    ({{JDI.JITDispatchContext, "spy_orc_rt_jit_dispatch_ctx"},
      {JDI.JITDispatchFunction, "spy_orc_rt_jit_dispatch"}});
}

} // namespace nub_private
