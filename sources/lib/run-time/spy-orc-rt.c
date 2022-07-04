#include <inttypes.h>
#include <memory.h>
#include <stddef.h>
#include <orc/c_api.h>

// Context for calls into and out of the ORC runtime
struct spy_orc_rt_jit_dispatch_ctx {
  char data[512];
  size_t size;
  const void *fntag;
} spy_orc_rt_jit_dispatch_ctx;

// Entry point used by ORC-RT routines to make calls to the ORC Platform.
__orc_rt_CWrapperFunctionResult
spy_orc_rt_jit_dispatch(struct spy_orc_rt_jit_dispatch_ctx *DispatchCtx,
                        const void *FnTag,
                        const char *Data, size_t Size)
{
  DispatchCtx->fntag = FnTag;
  if (Size < sizeof DispatchCtx->data) {
    memcpy(DispatchCtx->data, Data, Size);
  }
  else {
    abort();
  }

  // Tell the debugger we want to make a call by trapping here
  __builtin_debugtrap();

  // Return the return value stored by the debugger as a wrapper
  // function result
  return __orc_rt_CreateCWrapperFunctionResultFromRange
    (DispatchCtx->data, DispatchCtx->size);
}

// Helper function used by nub's ExecutorProcessControl implementation
// to make calls into ORC-RT
void spy_orc_rt_call_wrapper(uintptr_t wrapper_addr)
{
  __orc_rt_CWrapperFunctionResult (*wrapper_fn)(const char *, size_t)
    = (__orc_rt_CWrapperFunctionResult (*)(const char *, size_t)) wrapper_addr;
  __orc_rt_CWrapperFunctionResult result
    = wrapper_fn(spy_orc_rt_jit_dispatch_ctx.data,
                 spy_orc_rt_jit_dispatch_ctx.size);
  spy_orc_rt_jit_dispatch_ctx.size = __orc_rt_CWrapperFunctionResultSize(&result);
  if (spy_orc_rt_jit_dispatch_ctx.size < sizeof spy_orc_rt_jit_dispatch_ctx.data) {
    memcpy(spy_orc_rt_jit_dispatch_ctx.data,
           __orc_rt_CWrapperFunctionResultData(&result),
           spy_orc_rt_jit_dispatch_ctx.size);
    __orc_rt_DisposeCWrapperFunctionResult(&result);
  }
  else {
    abort();
  }
}
