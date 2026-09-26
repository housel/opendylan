// -*- C++ -*-

#include <lldb/API/LLDB.h>

class DebuggerNub {
public:
  explicit DebuggerNub(lldb::SBDebugger &debugger);
  ~DebuggerNub();

private:
  lldb::SBDebugger debugger_;
};
