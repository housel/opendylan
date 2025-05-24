/* ********************************************************************* */
/* ** spy-interfaces.h                                                ** */
/* ** Prototypes for C Spy functions, callable by the debugger.       ** */
/* ** --------------------------------------------------------------- ** */
/* ** Author: Paul Howard                                             ** */
/* ** Copyright: (c) 1998 Functional Objects, Inc.                    ** */
/* **            All Rights Reserved                                  ** */
/* ********************************************************************* */

#define SPY_INTERFACE

/*
  NB: The following constants must match the definitions of
     $spy-load-extension-component-failed AND
     $spy-load-extension-component-succeeded
  in D-runtime-manager-debugger-manager!spy-catalogue.dylan
*/

#define SPY_LOAD_EXTENSION_COMPONENT_FAILED 0
#define SPY_LOAD_EXTENSION_COMPONENT_SUCCEEDED 1

/* Loads a named DLL into the runtime */
SPY_INTERFACE int spy_load_extension_component (char *name);

#ifdef OPEN_DYLAN_PLATFORM_UNIX
#define SPY_MAX_RUNTIME_SIGNALS 6

/* Returns the nth signal reserved for use by the garbage collector or
   other runtime support.  */
SPY_INTERFACE int spy_get_runtime_signal(size_t n);

/* Returns the virtual memory page size */
SPY_INTERFACE int spy_get_page_size(void);
#endif

/* Registers LLVM exception handler data with the unwinder */
SPY_INTERFACE int spy_register_exception_handler_data(void *base, void *limit);

/* Executes shared library initializations */
SPY_INTERFACE int spy_run_init_array(void *base, void *limit);
