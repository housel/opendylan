#include <lldb/API/LLDB.h>

#include "DebuggerNub.h"

DebuggerNub::DebuggerNub(lldb::SBDebugger &debugger)
  : debugger_(debugger)
{
}

DebuggerNub::~DebuggerNub()
{
}
