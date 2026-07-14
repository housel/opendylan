#define SIMDUTF_NO_LIBCXX 1

#include "simdutf.h"

extern "C" {
#if defined OPEN_DYLAN_BACKEND_LLVM
  #include "llvm-runtime.h"
#elif defined OPEN_DYLAN_BACKEND_C
  #include "run-time.h"
#endif
};

#include "simdutf.cpp"
