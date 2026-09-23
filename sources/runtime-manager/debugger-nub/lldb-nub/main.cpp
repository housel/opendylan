#include <lldb/API/LLDB.h>

int main(int argc, char *argv[])
{
  lldb::SBDebugger::Initialize();
  lldb::SBDebugger debugger;

  return 0;
}
