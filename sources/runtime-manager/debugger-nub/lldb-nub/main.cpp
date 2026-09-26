#include "DebuggerNub.h"
#include "DDAPProtocol.h"

int main(int argc, char *argv[])
{
  lldb::SBDebugger::Initialize();
  lldb::SBDebugger debugger { };
  DebuggerNub nub { debugger };
  DDAPProtocol ddapp(nub, 0, 1);
  return ddapp.run();
}
