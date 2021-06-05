#ifndef LLVM_RUNTIME_H_
#define LLVM_RUNTIME_H_

#include <stddef.h>
#include <inttypes.h>

typedef void                   *dylan_value;
typedef void                   *D;
typedef char                   *DBSTR;
typedef const char             *DCBSTR;
typedef uint8_t                 DBYTE;
typedef intptr_t                DSINT;
typedef uintptr_t               DUINT;
typedef uintptr_t               DBOOL;
typedef uintptr_t               DADDR;
typedef uintptr_t               DWORD;
typedef float                   DSFLT;
typedef double                  DDFLT;

#define ITAG 1
#define I(n) ((dylan_value) (((unsigned long)(n) << 2) | ITAG))

#include OPEN_DYLAN_RUNTIME_HEADER

extern void EstablishDylanExceptionHandlers(void);
extern void RemoveDylanExceptionHandlers(void);

extern void spy_hold_threads(int hold);

#endif // LLVM_RUNTIME_H_
