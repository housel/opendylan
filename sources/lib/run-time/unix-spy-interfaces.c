/* ********************************************************************* */
/* ** spy-interfaces.c                                                ** */
/* ** Implementations of C Spy functions, callable by the debugger.   ** */
/* ** --------------------------------------------------------------- ** */
/* ** Author: Paul Howard                                             ** */
/* ** Copyright: (c) 1998 Functional Objects, Inc.                    ** */
/* **            All Rights Reserved                                  ** */
/* ********************************************************************* */

#include <stdlib.h>
#include <unistd.h>
#include <dlfcn.h>
#include "unix-types.h"
#include "spy-interfaces.h"

#ifdef GC_USE_BOEHM
#include <gc/gc.h>
#endif

SPY_INTERFACE int spy_load_extension_component (char *name)
{
  void * extension = dlopen(name, RTLD_NOW | RTLD_GLOBAL);
  if (extension == NULL) {
    return(SPY_LOAD_EXTENSION_COMPONENT_FAILED);
  } else {
    return(SPY_LOAD_EXTENSION_COMPONENT_SUCCEEDED);
  }
}

static int runtime_signals[SPY_MAX_RUNTIME_SIGNALS];
static size_t runtime_signals_count;

SPY_INTERFACE int spy_get_runtime_signal(size_t n)
{
  if (n == 0) {
    // Initialize the set of signals reserved by the runtime
    runtime_signals_count = 0;
#ifdef GC_USE_BOEHM
    int suspend_signal = GC_get_suspend_signal();
    if (suspend_signal != -1) {
      runtime_signals[runtime_signals_count++] = suspend_signal;
    }
    int restart_signal = GC_get_thr_restart_signal();
    if (restart_signal != -1) {
      runtime_signals[runtime_signals_count++] = restart_signal;
    }
#endif
  }

  if (n < runtime_signals_count) {
    return runtime_signals[n];
  }
  else {
    return -1;
  }
}

SPY_INTERFACE int spy_get_page_size(void)
{
  return sysconf(_SC_PAGESIZE);
}

SPY_INTERFACE int spy_register_exception_handler_data(void *base, void *limit)
{
  // FIXME handle both this and __unw_add_dynamic_eh_frame_section
  extern void __register_frame(void *begin);

  __register_frame(base);
  return 0;
}

typedef void (*init_function)(int argc, char **argv, char **environ);

extern int TargcT;
extern char **TargvT;
extern char **environ;

SPY_INTERFACE int spy_run_init_array(void *base, void *limit)
{
  // (((InitArrFunc)(target))(main_argc, main_argv, environ))
  init_function *p = (init_function *) base;
  while (p < (init_function *) limit) {
    (*p)(TargcT, TargvT, environ);
    p++;
  }
  return 0;
}
