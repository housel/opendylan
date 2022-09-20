/* ********************************************************************* */
/* ** spy-interfaces.c                                                ** */
/* ** Implementations of C Spy functions, callable by the debugger.   ** */
/* ** --------------------------------------------------------------- ** */
/* ** Author: Paul Howard                                             ** */
/* ** Copyright: (c) 1998 Functional Objects, Inc.                    ** */
/* **            All Rights Reserved                                  ** */
/* ********************************************************************* */

#include <stdlib.h>
#include <dlfcn.h>
#include "unix-types.h"
#include "spy-interfaces.h"


SPY_INTERFACE int spy_load_extension_component (char *name)
{
  void * extension = dlopen(name, RTLD_NOW | RTLD_GLOBAL);
  if (extension == NULL) {
    return(SPY_LOAD_EXTENSION_COMPONENT_FAILED);
  } else {
    return(SPY_LOAD_EXTENSION_COMPONENT_SUCCEEDED);
  }
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
