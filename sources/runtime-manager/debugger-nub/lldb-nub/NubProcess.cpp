#include "NubProcess.h"
#include "NubLLDBContext.h"
#include "NubProcessMemoryManager.h"
#include "NubExecutorProcessControl.h"

#include <lldb/API/LLDB.h>

#include <llvm/Support/Debug.h>
#include <llvm/Support/Endian.h>
#include <llvm/Support/GlobPattern.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Bitcode/BitcodeReader.h>

#include <llvm/ExecutionEngine/Orc/Core.h>
#include <llvm/ExecutionEngine/Orc/ObjectLinkingLayer.h>
#include <llvm/ExecutionEngine/Orc/LLJIT.h>

#include <chrono>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <deque>
#include <map>

#include <wordexp.h>
#include <unistd.h>

using namespace nub_private;


///

NubProcess::NubProcess(const char *process_name)
  : private_(new NubLLDBContext(process_name))
{
}

NubProcess::~NubProcess()
{
  delete private_;
}

bool NubProcess::open_process(const char *command, const char *args,
                              const char *working_directory)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);

  // Create an SBTarget for the executable to be debugged
  lldb::SBError error;
  np.target = np.debugger.CreateTarget(command, "", "", true, error);
  if (!np.target.IsValid()) {
    llvm::errs() << "Unable to create target for " << command
                 << ": " << error.GetCString()
                 << "\n";
    return false;
  }

  // Subscribe to target notifications
  auto flags
    = lldb::SBTarget::eBroadcastBitModulesLoaded
    | lldb::SBTarget::eBroadcastBitModulesUnloaded
    | lldb::SBTarget::eBroadcastBitSymbolsLoaded;
  np.target.GetBroadcaster().AddListener(np.listener, flags);

  // Prepare to launch this executable as a new process
  NUB_DEBUG(llvm::dbgs() << "command = " << command << "\n");

  np.launch.Clear();
  np.launch.SetListener(np.listener);
  np.launch.SetLaunchFlags(lldb::eLaunchFlagDebug
                           | lldb::eLaunchFlagStopAtEntry
                           | lldb::eLaunchFlagDisableASLR);
  // Set a breakpoint at the executable's "main" function
  lldb::SBFileSpecList module_list;
  module_list.Append(np.target.GetExecutable());
  lldb::SBFileSpecList comp_unit_list;
  np.main_breakpoint
    = np.target.BreakpointCreateByName("main", module_list, comp_unit_list);
  if (!np.main_breakpoint.IsValid()) {
    llvm::errs() << "main_breakpoint is not valid\n";
    return false;
  }

  // Parse the arguments as the shell would
  wordexp_t we;
  if (wordexp(args, &we, 0) != 0) {
    return false;
  }
  for (size_t i = 1; i < we.we_wordc; ++i) {
    NUB_DEBUG(llvm::dbgs() << "argv[" << i << "] = " << we.we_wordv[i] << "\n");
    const char *argv[2] = { we.we_wordv[i], nullptr };
    np.launch.SetArguments(&argv[0], true);
  }
  wordfree(&we);

  np.launch.SetWorkingDirectory(working_directory);

  np.nub_state = NubLLDBContext::OPEN;
  NUB_DEBUG(llvm::dbgs() << "Entering OPEN state\n");

  return true;
}

NubProcess::NUBPROCESS NubProcess::process() const
{
  return this->private_->process.GetProcessID();
}

NubProcess::NUBINT NubProcess::remote_value_byte_size() const
{
  return this->private_->process.GetAddressByteSize();
}

NubProcess::TARGET_ADDRESS NubProcess::get_library_base_address(NUBLIBRARY dll)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  lldb::SBModule &module { np.modules[dll] };
  auto address { module.GetObjectFileHeaderAddress() };
  return address.GetLoadAddress(np.target);
}

void NubProcess::get_library_version(NUBLIBRARY dll, NUBINT &maj, NUBINT &min)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  lldb::SBModule &module { np.modules[dll] };
  uint32_t versions[2];
  module.GetVersion(versions, 2);
  maj = versions[0];
  min = versions[1];
}

std::string NubProcess::get_library_filename(NUBLIBRARY dll)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  lldb::SBModule &module { np.modules[dll] };
  return module.GetFileSpec().GetFilename();
}

std::string NubProcess::get_register_name(NUB_INDEX reg)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  return np.register_names[reg - 1];
}

void NubProcess::all_registers(NUBINT &first, NUBINT &last)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetSelectedThread() };
  auto frame { thread.GetFrameAtIndex(0) };
  np.ensure_register_info(frame);
  first = 1;
  last = np.register_names.size();
 }

void NubProcess::general_registers(NUBINT &first, NUBINT &last)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetSelectedThread() };
  auto frame { thread.GetFrameAtIndex(0) };
  np.ensure_register_info(frame);
  first = np.general_registers.first + 1;
  last = np.general_registers.second;
}

void NubProcess::special_registers(NUBINT &first, NUBINT &last)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  // FIXME
  first = np.special_registers.first + 1;
  last = np.special_registers.second;
}

void NubProcess::floating_registers(NUBINT &first, NUBINT &last)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetSelectedThread() };
  auto frame { thread.GetFrameAtIndex(0) };
  np.ensure_register_info(frame);
  first = np.floating_registers.first + 1;
  last = np.floating_registers.second;
}

NubProcess::NUBINT NubProcess::page_read_permission(TARGET_ADDRESS address)
{
  return 1;                     // Debugger can always read
}

NubProcess::NUBINT NubProcess::page_write_permission(TARGET_ADDRESS address)
{
  return 1;                     // Debugger can always write
}

NubProcess::NUBINT NubProcess::page_relative_address
    (TARGET_ADDRESS address, NUBINT &offset)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  lldb::SBMemoryRegionInfo info;
  TARGET_ADDRESS pagesize = 0;
  if (np.process.GetMemoryRegionInfo(address, info).Success()
      && info.GetPageSize() != 0) {
    pagesize = info.GetPageSize();
  }
  else {
    pagesize = llvm::sys::Process::getPageSizeEstimate();
  }
  offset = address % pagesize;
  return address / pagesize;
}

NubProcess::NUBINT NubProcess::virtual_page_size()
{
  return getpagesize();
}

NubProcess::TARGET_ADDRESS NubProcess::read_value_from_process_memory
  (TARGET_ADDRESS address, NUB_ERROR &status)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);


  lldb::SBError error;
  auto value { np.process.ReadPointerFromMemory(address, error) };
  if (error.Success()) {
    status = 0;
    return value;
  }
  else {
    status = 1;
    llvm::errs() << "Error reading value at "
                 << llvm::format("0x%016" PRIx64, address)
                 << ": " << error.GetCString()
                 << "\n";
    return LLDB_INVALID_ADDRESS;
  }
}

void NubProcess::write_value_to_process_memory
    (TARGET_ADDRESS address, TARGET_ADDRESS val, NUBINT &status)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  uint8_t bytes[8];
  auto address_size { np.target.GetAddressByteSize() };
  switch (np.target.GetByteOrder()) {
  case lldb::eByteOrderLittle:
    switch (address_size) {
    case 4:
      llvm::support::endian::write32le(bytes, val);
      break;
    case 8:
      llvm::support::endian::write64le(bytes, val);
      break;
    default:
      abort();
    }
    break;
  case lldb::eByteOrderBig:
    switch (address_size) {
    case 4:
      llvm::support::endian::write32be(bytes, val);
      break;
    case 8:
      llvm::support::endian::write64be(bytes, val);
      break;
    default:
      abort();
    }
    break;
  default:
    llvm::errs() << "You monster!\n";
    abort();
  }
  lldb::SBError error;
  auto result { np.process.WriteMemory(address, bytes, address_size, error) };
  if (error.Success() && result == address_size) {
    status = 0;
  }
  else {
    llvm::errs() << "Error writing value to "
                 << llvm::format("0x%016" PRIx64, address)
                 << ": " << error.GetCString()
                 << "\n";
    status = 1;
  }
}

void NubProcess::read_byte_string_from_process_memory
    (TARGET_ADDRESS address, NUBINT sz, void *buffer, NUB_ERROR &status)
{
  if (sz > 0) {
    auto &np { *this->private_ };
    std::unique_lock<std::recursive_mutex> guard(np.mutex);

    lldb::SBError error;
    np.process.ReadMemory(address, buffer, sz, error);
    if (error.Success()) {
      std::string str(reinterpret_cast<const std::string::value_type*>(buffer), sz);
      NUB_DEBUG({
        llvm::dbgs() << "Read " << sz << " bytes from "
                     << llvm::format("0x%016" PRIx64, address)
                     << ": \"" << str << "\"\n";
      });
      status = 0;
    }
    else {
      llvm::errs() << "Process read error: " << error.GetCString() << "\n";
      status = 1;
    }
  }
}

void NubProcess::write_byte_string_to_process_memory
    (TARGET_ADDRESS address, NUBINT sz, const void *buffer, NUB_ERROR &status)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);

  lldb::SBError error;
  auto result { np.process.WriteMemory(address, buffer, sz, error) };
  if (error.Success() && result == sz) {
    status = 0;
  }
  else {
    llvm::errs() << "Process write error: " << error.GetCString() << "\n";
    status = 1;
  }
}

NubProcess::TARGET_ADDRESS NubProcess::read_value_from_process_register
    (NUBTHREAD nubthread, NUB_INDEX reg, NUB_ERROR &status)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  auto frame { thread.GetFrameAtIndex(0) };
  if (reg < 0) {
    // Virtual register
    status = 0;
    return np.virtual_register_value(reg);
  }
  else {
    const auto *reg_name { np.register_names[reg - 1].c_str() };
    auto reg_value { frame.FindRegister(reg_name) };
    NUB_DEBUG({
      lldb::SBStream description;
      reg_value.GetDescription(description);

      llvm::dbgs() << "read_value_from_process_register " << nubthread
                   << " " << reg_name
                   << description.GetData();
    });
    if (reg_value.IsValid() && reg_value.GetError().Success()) {
      status = 0;
      return reg_value.GetValueAsUnsigned();
    }
    else {
      status = 1;
      return LLDB_INVALID_ADDRESS;
    }
  }
}

NubProcess::TARGET_ADDRESS NubProcess::read_value_from_process_register_in_stack_frame
    (NUBTHREAD nubthread, NUB_INDEX reg,
     NUB_INDEX frame_index, NUB_ERROR &status)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  auto frame { thread.GetFrameAtIndex(frame_index) };
  const auto *reg_name { np.register_names[reg - 1].c_str() };
  auto reg_value { frame.FindRegister(reg_name) };
  NUB_DEBUG({
    lldb::SBStream description;
    reg_value.GetDescription(description);

    llvm::dbgs() << "read_value_from_process_register_in_stack_frame " << nubthread
                 << " frame " << frame_index << " " << reg_name 
                 << description.GetData();
    });
  if (reg_value.IsValid() && reg_value.GetError().Success()) {
    status = 0;
    return reg_value.GetValueAsUnsigned();
  }
  else {
    status = 1;
    return LLDB_INVALID_ADDRESS;
  }
}

void NubProcess::application_restart()
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);

  auto state { np.process.GetState() };
  NUB_DEBUG({
    llvm::dbgs() << "application_restart from {"
                 << lldb::SBDebugger::StateAsCString(state)
                 << "} process state\n";
  });

  switch (np.nub_state) {
  case NubLLDBContext::OPEN:
    {
    }
    break;
  default:
    {
      // FIXME should implement relaunch
      llvm::errs() << "Oops, nub state is " << np.nub_state
                   << ", relaunch isn't implemented yet\n";
      abort();
    }
    break;
  }

  np.main_breakpoint.SetEnabled(true);

  lldb::SBError error;
  np.target.Launch(np.launch, error);
  if (error.Fail()) {
    llvm::errs() << "Launch error: " << error.GetCString() << "\n";
  }
  else {
    np.nub_state = NubLLDBContext::LAUNCHING;
    NUB_DEBUG(llvm::dbgs() << "Entering LAUNCHING state\n");
  }
}

void NubProcess::application_stop()
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  NUB_DEBUG(llvm::dbgs() << "Stop\n");
  np.process.Stop();
}

void NubProcess::application_continue()
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  np.clear_virtual_registers();
  bool synthetic = np.stop_reason_queue.front().synthetic;
  if (np.stop_reason_queue.front().code == NubProcess::EXIT_PROCESS_DBG_EVENT) {
    llvm::errs() << "He's dead, Jim.\n";
    abort();
  }
  NUB_DEBUG({
      llvm::dbgs() << "Continue from "
                   << stop_reason_name[np.stop_reason_queue.front().code]
                   << " synthetic: " << synthetic;
      if (!np.function_call_expression.empty()) {
        llvm::dbgs() << " call: " << np.function_call_expression;
      }
      llvm::dbgs() << "\n";
  });
  np.stop_reason_queue.pop_front();
  if (!np.function_call_expression.empty()) {
    np.evaluate_function_call();
  }
  else if (!synthetic) {
    if (!np.stop_reason_queue.empty()) {
      llvm::errs() << "Continuing with items in queue:\n";
      for (auto &stop : np.stop_reason_queue) {
        llvm::errs() << "  thread " << stop.thread
                     << " stop " << stop_reason_name[stop.code] << "\n";
      }
      abort();
    }
    np.process.Continue();
  }
}

void NubProcess::application_continue_unhandled()
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  np.clear_virtual_registers();
  bool synthetic = np.stop_reason_queue.front().synthetic;
  if (np.stop_reason_queue.front().code == NubProcess::EXIT_PROCESS_DBG_EVENT) {
    llvm::errs() << "He's dead, Jim.\n";
    abort();
  }
  NUB_DEBUG({
    llvm::dbgs() << "Continue (unhandled) from "
                 << stop_reason_name[np.stop_reason_queue.front().code]
                 << " synthetic: " << synthetic << "\n";
  });
  np.stop_reason_queue.pop_front();
  if (!np.function_call_expression.empty()) {
    np.evaluate_function_call();
  }
  else if (!synthetic) {
    if (!np.stop_reason_queue.empty()) {
      llvm::errs() << "Continuing with items in queue:\n";
      for (auto &stop : np.stop_reason_queue) {
        llvm::errs() << "  thread " << stop.thread
                     << " stop " << stop_reason_name[stop.code] << "\n";
      }
      abort();
    }
    np.process.Continue();
  }
}

NubProcess::NUB_ERROR NubProcess::set_stepping_control_on_thread
    (NUBTHREAD nubthread,
     TARGET_ADDRESS fp, TARGET_ADDRESS calling_fp,
     const std::vector<TARGET_ADDRESS> &locs,
     NUBINT operation)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  NUB_DEBUG({
    lldb::SBStream stream;
    thread.GetDescription(stream);
    llvm::dbgs() << "set_stepping_control_on_thread " << stream.GetData()
                 << " fp=" << llvm::format("0x%016" PRIx64, fp)
                 << " calling_fp=" << llvm::format("0x%016" PRIx64, calling_fp)
                 << " operation=" << operation
                 << "\n";
  });
  for (auto &loc : locs) {
    NUB_DEBUG({
      llvm::dbgs() << "  location: "
                   << llvm::format("0x%016" PRIx64, loc)
                   << "\n";
    });

    auto breakpoint_i { np.breakpoint_map.find(loc) };
    if (breakpoint_i == np.breakpoint_map.end()) {
      auto breakpoint { np.target.BreakpointCreateByAddress(loc) };
      if (breakpoint.GetNumLocations() == 1) {
        breakpoint.SetEnabled(true);
        auto id { breakpoint.GetID() };
        np.breakpoint_map[loc]
          = { NubLLDBContext::BreakpointClassification(operation),
              std::move(breakpoint) };
        NUB_DEBUG({
            llvm::dbgs() << "    Created a breakpoint (ID " << id << ") at "
                         << llvm::format("0x%016" PRIx64, loc)
                         << " for step operation " << operation << "\n";
          });

          np.stepping_breakpoint_addresses.push_back(loc);
        }
        else {
          NUB_DEBUG(llvm::dbgs() << "    Breakpoint couldn't be created\n");
        }
      }
      else {
        NUB_DEBUG(llvm::dbgs() << "    Breakpoint already existed there\n");
      }
    }
  return 0;
}

NubProcess::NUB_ERROR NubProcess::clear_stepping_control_on_thread
    (NUBTHREAD nubthread)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  NUB_DEBUG({
    lldb::SBStream stream;
    thread.GetDescription(stream);
    llvm::dbgs() << "clear_stepping_control_on_thread " << stream.GetData() << "\n";
  });
  for (auto &address : np.stepping_breakpoint_addresses) {
    auto breakpoint_i { np.breakpoint_map.find(address) };
    if (breakpoint_i != np.breakpoint_map.end()) {
      auto id { breakpoint_i->second.breakpoint.GetID() };
      NUB_DEBUG({
          llvm::dbgs() << "Deleting breakpoint "
                       << id << "\n";
      });
      np.target.BreakpointDelete(id);
      np.breakpoint_map.erase(breakpoint_i);
    }
  }
  return 0;
}

void NubProcess::thread_stop(NUBTHREAD nubthread)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  NUB_DEBUG({
    lldb::SBStream stream;
    thread.GetDescription(stream);
    llvm::dbgs() << "thread_stop " << nubthread << " (" << stream.GetData() << ")\n";
  });
  // Doing nothing for now
}

void NubProcess::thread_continue(NUBTHREAD nubthread)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  NUB_DEBUG({
    lldb::SBStream stream;
    thread.GetDescription(stream);
    llvm::dbgs() << "thread_continue " << nubthread << " (" << stream.GetData() << ")\n";
  });
  // Doing nothing for now
}

void NubProcess::thread_suspended(NUBTHREAD nubthread)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  NUB_DEBUG({
    lldb::SBStream stream;
    thread.GetDescription(stream);
    llvm::dbgs() << "thread_suspended " << nubthread << " (" << stream.GetData() << ")\n";
  });
  thread.Suspend();
}

bool NubProcess::thread_suspendedQ(NUBTHREAD nubthread)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  bool suspendedQ { thread.IsSuspended() };
  NUB_DEBUG({
    lldb::SBStream stream;
    thread.GetDescription(stream);
    llvm::dbgs() << "thread_suspendedQ " << nubthread
                 << " (" << stream.GetData() << ") "
                 << suspendedQ << "\n";
  });
  return suspendedQ;
}

void NubProcess::thread_resumed(NUBTHREAD nubthread)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  NUB_DEBUG({
    lldb::SBStream stream;
    thread.GetDescription(stream);
    llvm::dbgs() << "thread_suspended " << nubthread << " (" << stream.GetData() << ")\n";
  });
  thread.Resume();
}

void NubProcess::register_exit_process_function(TARGET_ADDRESS ExitProcess)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  np.exit_process_function = ExitProcess;
}

NubProcess::NUB_ERROR NubProcess::kill_application()
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto e { np.process.Kill() };
  if (e.Success()) {
    return 0;
  }
  else {
    llvm::errs() << "kill_application failed: " << e.GetCString() << "\n";
    return 1;
  }
}

NubProcess::NUB_ERROR NubProcess::set_breakpoint(TARGET_ADDRESS address)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto i = np.breakpoint_map.find(address);
  if (i != np.breakpoint_map.end()) {
    if (i->second.breakpoint.IsEnabled()) {
      llvm::errs() << "BREAKPOINT_ALREADY_EXISTS\n";
      return BREAKPOINT_ALREADY_EXISTS;
    }
    else {
      NUB_DEBUG({
        llvm::dbgs() << "Enabling breakpoint (ID "
                     << i->second.breakpoint.GetID() << ") at "
                     << llvm::format("0x%016" PRIx64, address)
                     << "\n";
        llvm::dbgs().flush();
      });
      i->second.breakpoint.SetEnabled(true);
      //np.debugger.HandleCommand("breakpoint list");
      return OK;
    }
  }
  else {
    auto breakpoint { np.target.BreakpointCreateByAddress(address) };
    if (breakpoint.GetNumLocations() == 1) {
      breakpoint.SetEnabled(true);
      auto id { breakpoint.GetID() };
      np.breakpoint_map[address]
        = {NubLLDBContext::APPLICATION_BREAKPOINT, std::move(breakpoint)};
      NUB_DEBUG({
        llvm::dbgs() << "Created a breakpoint (ID " << id << ") at "
                     << llvm::format("0x%016" PRIx64, address)
                     << "\n";
        llvm::dbgs().flush();
      });
      //np.debugger.HandleCommand("breakpoint list");
      return OK;
    }
    else {
      llvm::errs() << "SET_BREAKPOINT_FAILED\n";
      return SET_BREAKPOINT_FAILED;
    }
  }
}

NubProcess::NUB_ERROR NubProcess::clear_breakpoint(TARGET_ADDRESS address)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto i = np.breakpoint_map.find(address);
  if (i != np.breakpoint_map.end()) {
    if (np.target.BreakpointDelete(i->second.breakpoint.GetID())) {
      return OK;
    }
    else {
      NUB_DEBUG(llvm::dbgs() << "CLEAR_BREAKPOINT_FAILED\n");
      return CLEAR_BREAKPOINT_FAILED;
    }
  }
  else {
    NUB_DEBUG(llvm::dbgs() << "BREAKPOINT_DOES_NOT_EXIST\n");
    return BREAKPOINT_DOES_NOT_EXIST;
  }
}

NubProcess::NUBINT NubProcess::query_breakpoint(TARGET_ADDRESS address)
{
  return 0;                     // FIXME
}

void NubProcess::wait_for_stop_reason_with_timeout
    (NUBINT timeout, StopReason &stop)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  if (np.queue_condition.wait_for(guard, std::chrono::milliseconds(timeout),
                                  [&]{ return !np.stop_reason_queue.empty(); })) {
    stop = np.stop_reason_queue.front();
  }
  else {
    NUB_DEBUG(llvm::dbgs() << "TIMED OUT (" << timeout << ")\n");
    stop.code = TIMED_OUT;
    stop.thread = 0;
  }
  NUB_DEBUG({
    llvm::dbgs() << "RETURNING stop reason code " << stop.code
                 << " (" << stop_reason_name[stop.code] << ") "
                 << "thread " << stop.thread
                 << "\n";
  });
}

NubProcess::TARGET_ADDRESS NubProcess::setup_function_call
  (NUBTHREAD nubthread, TARGET_ADDRESS func,
   NUBINT arg_count, const std::vector<TARGET_ADDRESS> &args,
   NUBHANDLE &cx_handle)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  auto frame { thread.GetFrameAtIndex(0) };

  lldb::SBStream expression;
  expression.Print("((struct dylan_mv (*)(");
  for (size_t i = 0; i < arg_count; ++i) {
     if (i > 0) {
      expression.Print(",");
    }
    expression.Print("void *");
  }
  expression.Printf(")) %#" PRIx64  ")(", func);
  for (size_t i = 0; i < arg_count; ++i) {
    if (i > 0) {
      expression.Print(",");
    }
    expression.Printf("(void *) %#" PRIx64, args[i]);
  }
  expression.Print(")");
  np.function_call_thread = nubthread;
  np.function_call_expression = expression.GetData();

  return frame.GetPC();
}

NubProcess::TARGET_ADDRESS NubProcess::get_function_result(NUBTHREAD nubthread)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  return np.function_call_result.GetChildAtIndex(0).GetValueAsUnsigned();
}

NubProcess::TARGET_ADDRESS NubProcess::remote_call_spy
    (NUBTHREAD nubthread, TARGET_ADDRESS func,
     const std::vector<TARGET_ADDRESS> &args,
     NUB_ERROR &status, StopReason &stop,
     std::vector<NUBTHREAD> &created_threads)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };

  NUB_DEBUG({
    llvm::dbgs() << "remote_call_spy on thread " << nubthread << "\n";
    if (thread.IsSuspended()) {
      llvm::dbgs() << "Thread is suspended!\n";
    }
    auto func_addr { lldb::SBAddress(func, np.target) };
    if (func_addr.IsValid()) {
      auto symbol { func_addr.GetSymbol() };
      if (symbol.IsValid()) {
        std::string name(symbol.GetName());
        llvm::dbgs() << "Calling " << name;
        if (name == "spy_call_dylan_function"
            || name == "call_dylan_function") {
          auto callee_addr { lldb::SBAddress(args[0], np.target) };
          auto callee_symbol { callee_addr.GetSymbol() };
          llvm::dbgs() << " => " << callee_symbol.GetName();
        }
        llvm::dbgs() << "\n";
      }
    }
  });

  // Suspend any other threads so they don't interfere
  std::vector<lldb::SBThread> suspended_threads;
  for (size_t ti = 0, te = np.process.GetNumThreads(); ti != te; ++ti) {
    auto thread { np.process.GetThreadAtIndex(ti) };
    auto tid { thread.GetThreadID() };
    if (tid != nubthread
        && (np.thread_map[tid] == NubLLDBContext::THREAD_MAIN
            || np.thread_map[tid] == NubLLDBContext::THREAD_NOTIFIED)
        && !thread.IsSuspended()) {
      thread.Suspend();
      suspended_threads.emplace_back(thread);
      NUB_DEBUG({
        llvm::dbgs() << "Temporarily suspending " << tid
                     << " during spy call\n";
      });
    }
  }

  // Temporarily disable the thread creation breakpoint since we will
  // be tracking new threads using other means
  np.create_thread_breakpoint.SetEnabled(false);

  // Hold any newly-created Dylan threads within the trampoline until
  // we're ready to shepherd them
  np.evaluate(thread, "(void) spy_hold_threads(1)", true, true);

  // Construct a C99 expression for the call
  lldb::SBStream expression;
  expression.Print("((void *(*)(");
  for (size_t i = 0; i < args.size(); ++i) {
    if (i > 0) {
      expression.Print(",");
    }
    expression.Print("void *");
  }
  expression.Printf(")) %#" PRIx64 ")(", func);
  for (size_t i = 0; i < args.size(); ++i) {
    if (i > 0) {
      expression.Print(",");
    }
    expression.Printf("(void *) %#" PRIx64, args[i]);
  }
  expression.Print(")");

  // Evaluate it
  auto value { np.evaluate(thread, expression.GetData()) };

  // Release the hold on new threads
  np.evaluate(thread, "(void) spy_hold_threads(0)", true, true);

  // Check if any new threads were created during the call. If so, run
  // them until they reach the state that the environment is
  // expecting.
  //auto pid { np.process.GetProcessID() };
  for (size_t ti = 0, te = np.process.GetNumThreads(); ti != te; ++ti) {
    auto thread { np.process.GetThreadAtIndex(ti) };
    auto tid { thread.GetThreadID() };
    if (np.thread_map[tid] == NubLLDBContext::THREAD_NEW) {
      NUB_DEBUG(llvm::dbgs() << "Thread " << tid << " was created\n");
      // Within spy calls we return the set of newly-created threads
      // rather than adding a stop-reason.
      created_threads.push_back(tid);
    }
  }

  if (!created_threads.empty()) {
    // Before shepherding the spy call thread needs to be suspended too
    thread.Suspend();
    suspended_threads.emplace_back(thread);
    NUB_DEBUG({
      llvm::dbgs() << "Temporarily suspending " << nubthread
                   << " during spy call\n";
    });

    np.shepherd_spy_created_threads(guard, created_threads.size());
  }

  // Update the client's idea of the current stop reason
  stop = np.stop_reason_queue.front();

  // Re-enable the thread creation breakpoint
  np.create_thread_breakpoint.SetEnabled(true);

  // Resume any threads we might have suspended
  for (auto &thread : suspended_threads) {
    NUB_DEBUG({
      llvm::dbgs() << "Unsuspending " << thread.GetThreadID()
                   << " after shepherding\n";
      });
    thread.Resume();
  }

  if (value.IsValid() && value.GetError().Success()) {
    status = 0;
    return value.GetValueAsUnsigned();
  }
  else {
    status = 1;
    return 0;
  }
}

NubProcess::NUBINT NubProcess::thread_stop_information
    (NUBTHREAD nubthread,
     NUBINT &fchance, NUBINT &fstart,
     TARGET_ADDRESS &ret_addr)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto code { np.stop_reason_queue.front().code };
  fchance = 0;                  // FIXME
  fstart = 0;                   // Unused
  ret_addr = 0;                 // Unused
  return code;
}

NubProcess::NUBINT NubProcess::initialize_stack_vectors(NUBTHREAD nubthread)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  auto real_frame_count { thread.GetNumFrames() };
  auto frame { thread.GetFrameAtIndex(0) };
  np.ensure_register_info(frame);
  NUB_DEBUG({
    llvm::dbgs() << "initialize_stack_vectors " << nubthread << ": at "
                 << llvm::format("0x%016" PRIx64, frame.GetPC())
                 << ", " << real_frame_count << " frames\n";
  });
  return real_frame_count;
}

/*
  struct StackFrame {
    TARGET_ADDRESS frame_pointer;
    TARGET_ADDRESS instruction_pointer;
    TARGET_ADDRESS return_address;
  };
*/
std::vector<NubProcess::StackFrame> NubProcess::read_stack_vectors
    (NUBTHREAD nubthread, NUBINT frame_count)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  auto real_frame_count { thread.GetNumFrames() };
  NUB_DEBUG({
    llvm::dbgs() << "read_stack_vectors " << nubthread
                 << ": reading " << frame_count
                 << " of " << real_frame_count << " frames\n";
  });
  std::vector<NubProcess::StackFrame> result(real_frame_count);
  for (uint32_t i = 0; i < frame_count; ++i) {
    auto frame { thread.GetFrameAtIndex(i) };
    result[i].frame_pointer = frame.GetFP();
    result[i].instruction_pointer = frame.GetPC();
    if (i + 1 < real_frame_count) {
      auto inner_frame { thread.GetFrameAtIndex(i + 1) };
      result[i].return_address = inner_frame.GetPC();
    }
    else {
      result[i].return_address = LLDB_INVALID_ADDRESS;
    }
    NUB_DEBUG({
      lldb::SBStream stream;
      frame.GetDescription(stream);
      llvm::dbgs() << "  [" << i << "]: FP="
                   << llvm::format("0x%016" PRIx64, result[i].frame_pointer)
                   << " PC="
                   << llvm::format("0x%016" PRIx64, result[i].instruction_pointer)
                   << " RET="
                   << llvm::format("0x%016" PRIx64, result[i].return_address)
                   << "\n      " << stream.GetData();
    });
  }
  return result;
}

std::vector<NubProcess::FrameLexical> NubProcess::all_frame_lexicals
    (TARGET_ADDRESS frame, TARGET_ADDRESS ip)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);

  std::vector<FrameLexical> result;

  // Find the thread with matching FP and PC
  lldb::SBFrame matching_frame;
  for (size_t ti = 0, te = np.process.GetNumThreads(); ti != te; ++ti) {
    auto thread { np.process.GetThreadAtIndex(ti) };
    for (size_t fi = 0, fe = thread.GetNumFrames(); fi != fe; ++fi) {
      auto thread_frame { thread.GetFrameAtIndex(fi) };
      if (thread_frame.GetFP() == frame && thread_frame.GetPC() == ip) {
        NUB_DEBUG({
            llvm::dbgs() << "Found frame for thread " << thread.GetThreadID()
                         << " frame " << thread_frame.GetFrameID() << "\n";
        });
        matching_frame = thread_frame;
        goto found;
      }
    }
  }
 found:
  lldb::SBValueList values { matching_frame.GetVariables(true, true, false, true) };
  for (uint32_t vi = 0, ve = values.GetSize(); vi != ve; ++vi) {
    auto value { values.GetValueAtIndex(vi) };
    const auto *name { value.GetName() };
    auto addr { value.AddressOf() };
    NUB_DEBUG({
      lldb::SBStream stream;
      value.GetDescription(stream);
      llvm::dbgs() << "variable " << value.GetName()
                   << " vt " << value.GetValueType()
                   << " location " << value.GetLocation()
                   << " address "
                   << llvm::format("0x%016" PRIx64, value.AddressOf().GetLoadAddress())
                   << " (" << value.IsValid() << ", " << addr.IsValid()
                   << ") error " << value.GetError().GetCString()
                   << "\n  " << stream.GetData();
    });
    bool is_arg = value.GetValueType() == lldb::eValueTypeVariableArgument;
    if (addr.IsValid()) {
      auto variable_address { addr.GetLoadAddress() };
      auto lexical { NubProcess::FrameLexical(name, variable_address, false, is_arg) };
      result.emplace_back(lexical);
    }
    else if (value.GetError().Success()) {
      // We can't provide a stack address for this variable, so we
      // allocate a virtual register index from which the actual value
      // can be retrieved.
      auto lexical { NubProcess::FrameLexical(name, LLDB_INVALID_ADDRESS, true, is_arg) };
      lexical.hi_register
        = lexical.lo_register
        = np.add_virtual_register(value.GetValueAsUnsigned());
      result.emplace_back(lexical);
    }
  }
  return result;
}

NubProcess::NUBINT NubProcess::closest_symbol
    (TARGET_ADDRESS address, NUBLIBRARY &lib, TARGET_ADDRESS &actual_address,
     NUBINT &offset, LookupSymbol &symbol)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto addr { lldb::SBAddress(address, np.target) };
  if (addr.IsValid()) {
    auto addr_symbol { addr.GetSymbol() };
    if (addr_symbol.IsValid()) {
      NUB_DEBUG({
        llvm::dbgs() << "closest to "
                     << llvm::format("0x%016" PRIx64, address)
                     << ": " << addr_symbol.GetName() << "\n";
      });
      auto module { addr.GetModule() };
      lib = std::find(np.modules.begin(), np.modules.end(), module)
          - np.modules.begin();
      actual_address = addr_symbol.GetStartAddress().GetLoadAddress(np.target);
      offset = address - actual_address;
      symbol = np.make_lookup_symbol(addr_symbol);
      return 1;
    }
    else {
      return 0;
    }
  }
  else {
    return 0;
  }
}

NubProcess::NUBINT NubProcess::find_symbol_in_library
    (NUBLIBRARY nublibrary, const char *name,
     LookupSymbol &symbol)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto &module { np.modules[nublibrary] };
  auto named_symbol { module.FindSymbol(name) };
  if (named_symbol.IsValid()) {
    NUB_DEBUG({
      llvm::dbgs() << "find_symbol_in_library " << name
                   << " within " << module.GetFileSpec().GetFilename()
                   << ": type " << named_symbol.GetType()
                   << "\n";
    });
    symbol = np.make_lookup_symbol(named_symbol);
    if (symbol.is_function) {
      NUB_DEBUG({
        llvm::dbgs() << "  address "
                     << llvm::format("0x%016" PRIx64, symbol.address)
                     << " debug_start "
                     << llvm::format("0x%016" PRIx64, symbol.debug_start)
                     << "\n";
      });
    }
    return 1;
  }
  else {
    NUB_DEBUG({
      llvm::dbgs() << "find_symbol_in_library " << name
                   << " within " << module.GetFileSpec().GetFilename()
                   << " FAILED\n";
    });
    return 0;
  }
}

std::vector<NubProcess::LookupSymbol> NubProcess::lookup_symbols
    (NUBLIBRARY library, const char *match)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto &module { np.modules[library] };
  std::vector<NubProcess::LookupSymbol> result;
  auto pattern { llvm::GlobPattern::create(llvm::StringRef(match)) };
  if (!pattern) {
    llvm::logAllUnhandledErrors(pattern.takeError(), llvm::errs(),
                                "lookup_symbols pattern error: ");
    return result;
  }

  size_t nsyms = module.GetNumSymbols();
  NUB_DEBUG(llvm::dbgs() << "Faithfully scanning " << nsyms << " symbols from "
                         << module.GetFileSpec().GetFilename()
                         << " against <" << match << ">\n");
  for (size_t idx = 0; idx < nsyms; ++idx) {
    auto symbol { module.GetSymbolAtIndex(idx) };
    auto type { symbol.GetType() };
    if ((type == lldb::eSymbolTypeCode || type == lldb::eSymbolTypeData)
        && pattern->match(symbol.GetName())) {
      NUB_DEBUG(llvm::dbgs() << "Matches: " << symbol.GetName()
                             << " type " << type << "\n");
      result.emplace_back(np.make_lookup_symbol(symbol));
    }
  }

  return result;
}

NubProcess::TARGET_ADDRESS NubProcess::resolve_source_location
    (NUBLIBRARY nublibrary, const char *filename,
     NUBINT line_number, NUBINT column_number,
     NUBINT &valid, NUBINT &exact)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);

  auto &module { np.modules[nublibrary] };
  NUB_DEBUG(llvm::dbgs() << "resolve_source_location "
                         << module.GetFileSpec().GetFilename()
                         << " " << filename << ":" << line_number << ":" << column_number
                         << "\n");
  auto filespec { lldb::SBFileSpec(filename, false) };

  for (uint32_t ci = 0, ce = module.GetNumCompileUnits(); ci != ce; ++ci) {
    auto cu { module.GetCompileUnitAtIndex(ci) };
    NUB_DEBUG(llvm::dbgs() << "  Checking " << cu.GetFileSpec().GetFilename() << "\n");
    if (filespec == cu.GetFileSpec()) {
      std::vector<lldb::SBLineEntry> candidates;
      for (uint32_t li = 0, le = cu.GetNumLineEntries(); li != le; ++li) {
        auto entry { cu.GetLineEntryAtIndex(li) };
        if (entry.GetLine() >= line_number) {
          candidates.push_back(entry);
        }
      }
      // FIXME this is not ideal
      auto min_i = std::min_element(candidates.begin(), candidates.end(),
                                    [](const lldb::SBLineEntry &a,
                                       const lldb::SBLineEntry &b) {
                                      return a.GetLine() < b.GetLine();
                                    });
      if (min_i != candidates.end()) {
        valid = 1;
        exact = (min_i->GetLine() == line_number);
        auto entry_address { min_i->GetStartAddress().GetLoadAddress(np.target) };
        return entry_address;
      }
      else {
        valid = 0;
        return LLDB_INVALID_ADDRESS;
      }
    }
  }
  valid = 0;
  return LLDB_INVALID_ADDRESS;
}

std::vector<NubProcess::SourceLocation> NubProcess::fetch_source_locations
    (TARGET_ADDRESS start_loc, TARGET_ADDRESS end_loc)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  std::vector<SourceLocation> result;

  auto addr { lldb::SBAddress(start_loc, np.target) };
  NUB_DEBUG({
    llvm::dbgs() << "fetch_source_locations "
                 << llvm::format("0x%016" PRIx64 " - 0x%016" PRIx64,
                                 start_loc, end_loc)
                 << "\n";
  });
  auto cu { addr.GetCompileUnit() };
  auto fs { cu.GetFileSpec() };
  if (fs.IsValid()) {
    NUB_DEBUG(llvm::dbgs() << "  in " << fs.GetFilename() << "\n");
  }
  char path[PATH_MAX];
  fs.GetPath(path, sizeof path);

  for (uint32_t li = 0, le = cu.GetNumLineEntries(); li != le; ++li) {
    auto entry { cu.GetLineEntryAtIndex(li) };
    auto entry_start_address { entry.GetStartAddress().GetLoadAddress(np.target) };
    auto entry_end_address { entry.GetEndAddress().GetLoadAddress(np.target) };
    if (start_loc <= entry_start_address && entry_start_address <= end_loc) {
      NUB_DEBUG({
        llvm::dbgs() << "  "
                     << llvm::format("0x%016" PRIx64 " - 0x%016" PRIx64,
                                     entry_start_address, entry_end_address)
                     << " line " << entry.GetLine() << "\n";
      });
      SourceLocation location(entry_start_address - start_loc, entry.GetLine(), path);
      result.emplace_back(location);
    }
  }

  return result;
}

NubProcess::TARGET_ADDRESS NubProcess::dylan_thread_environment_block_address
    (NUBTHREAD nubthread, NUBINT &valid)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  auto suspended { thread.IsSuspended() };
  if (suspended) {
    NUB_DEBUG(llvm::dbgs() << "Temporarily resuming thread!\n");
    thread.Resume();
  }
  auto value { np.evaluate(thread, "(D) dylan_teb()", true) };
  if (suspended) {
    thread.Suspend();
  }
  if (value.IsValid() && value.GetError().Success()) {
    valid = 1;
    return value.GetValueAsUnsigned();
  }
  else {
    valid = 0;
    return 0;
  }
}

NubProcess::NUBINT NubProcess::download_code(NUBTHREAD nubthread, const std::vector<NubProcess::DownloadRecord> &records, const char *entry_name, std::vector<NubProcess::Region> &regions, std::vector<NubProcess::LookupSymbol> &symbols)
{
  auto &np { *this->private_ };
  std::unique_lock<std::recursive_mutex> guard(np.mutex);

  // The JIT target
  if (!np.jit) {
    if (!np.initialize_jit()) {
      llvm::errs() << "download_code: JIT initialization failed\n";
      return -1;
    }
  }

  // Create a JITDylib to represent this code download
  auto id { static_cast<unsigned>(np.jds.size()) };
  auto name { std::string(llvm::Twine("download_code_").concat(llvm::Twine(id)).str()) };
  auto EJD { np.jit->createJITDylib(name) };
  if (!EJD) {
    llvm::logAllUnhandledErrors(EJD.takeError(), llvm::errs(),
                                "download_code: ");
    return -1;
  }

  // Add the target and any previous downloads to the dynamic linking
  // resolution order
  NUB_DEBUG(llvm::dbgs() << "Add target to new JITDylib " << name << "\n");
  EJD->addToLinkOrder(np.jit->getMainJITDylib());
  for (auto &JDP : np.jds) {
    NUB_DEBUG(llvm::dbgs() << "Add prev to JITDylib " << name << "\n");
    EJD->addToLinkOrder(*JDP);
  }

  np.jds.push_back(&*EJD);
  np.jit_error_code = 0;

  // Parse the passed-in bitcode records and add them to the JIT
  for (const auto &record : records) {
    auto codemem { llvm::MemoryBufferRef(llvm::StringRef(record.data, record.length),
                                         "download_code") };
    auto context { std::make_unique<llvm::LLVMContext>() };
    auto M { llvm::parseBitcodeFile(codemem, *context) };
    if (!M) {
      llvm::errs() << "Parsing download record failed\n";
      return -1;
    }

    // Force the data layout to match the one identified by the JIT
    // compiler; the one supplied by DFMC should be compatible, but it
    // might not be identical
    (*M)->setDataLayout(np.jit->getDataLayout());

    NUB_DEBUG({
      llvm::dbgs() << "Record ----------------------------------------\n";
      (*M)->print(llvm::dbgs(), nullptr);
    });

    // Package the parsed module as a ThreadSafeModule and add it to
    // the JIT
    auto TSM { llvm::orc::ThreadSafeModule(std::move(*M), std::move(context)) };
    if (auto E = np.jit->addIRModule(*np.jds.back(), std::move(TSM))) {
      llvm::logAllUnhandledErrors(std::move(E), llvm::errs());
      return -1;
    };
  }

  // Locate the entry point, generating code as needed
  bool debug { llvm::DebugFlag };
  llvm::DebugFlag = false;
  auto &ES { np.jit->getExecutionSession() };
  auto SearchOrder {
    llvm::orc::makeJITDylibSearchOrder(np.jds.back(),
                                       llvm::orc::JITDylibLookupFlags::MatchAllSymbols)
  };
  auto mangled_entry_name { np.jit->mangleAndIntern(entry_name) };
  auto Entry { ES.lookup(SearchOrder, mangled_entry_name) };
  llvm::DebugFlag = debug;
  if (!Entry) {
    llvm::logAllUnhandledErrors(Entry.takeError(), llvm::errs(),
                                "download_code: ");
    return -1;
  }
  else if (np.jit_error_code) {
    ES.dump(llvm::errs());
    return np.jit_error_code;
  }
  NUB_DEBUG({
    llvm::dbgs() << "Entry " << mangled_entry_name
                 << " is " << llvm::formatv("{0:x}", Entry->getAddress())
                 << "\n";
    ES.dump(llvm::dbgs());
  });

  symbols.emplace_back(np.make_lookup_symbol(entry_name, *Entry));

  auto *JD { np.jds.back() };
  regions = np.jd_regions[JD];

  NUB_DEBUG(llvm::dbgs() << "download_code JITDylib " << name << " succeeded\n");
  return 0;
}
