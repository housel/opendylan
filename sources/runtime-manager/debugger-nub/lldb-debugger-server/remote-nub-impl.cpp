#include <cstdlib>
#include <unistd.h>
#include <wordexp.h>

#include <memory>
#include <iostream>
#include <algorithm>
#include <set>

#include <lldb/API/LLDB.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/Support/GlobPattern.h>

#include "nub-server-impl.h"
#include "remote-nub-impl.h"

using namespace std;

class NubEventDispatcher : public omni_thread {
private:
  lldb::SBListener listener_;
  lldb::SBBroadcaster exit_broadcaster_;
  Rtmgr_RemoteNub_i &nub_;

public:
  explicit NubEventDispatcher(lldb::SBListener listener, Rtmgr_RemoteNub_i &nub)
    : omni_thread(),
      listener_(listener),
      exit_broadcaster_("NubEventDispatcher exit"),
      nub_(nub) {
    this->exit_broadcaster_.AddListener(listener, 1);
    this->start_undetached();
  }

  void *run_undetached(void *) override {
    lldb::SBEvent event;
    while (listener_.WaitForEvent(UINT32_MAX, event)) {
      lldb::SBStream stream;
      event.GetDescription(stream);
      std::cerr << "Event ";
      if (event.GetDataFlavor() != nullptr) {
        std::cerr << "(data flavor " << event.GetDataFlavor() << "): ";
      }
      std::cerr << stream.GetData() << std::endl;

      auto event_type = event.GetType();
      if (lldb::SBProcess::EventIsProcessEvent(event)) {
        auto process = lldb::SBProcess::GetProcessFromEvent(event);
        if (event_type & lldb::SBProcess::eBroadcastBitStateChanged) {
          auto state { lldb::SBProcess::GetStateFromEvent(event) };
          if (state == lldb::eStateStopped || state == lldb::eStateExited) {
            // We only care if it's really stopped
            if (!lldb::SBProcess::GetRestartedFromEvent(event)) {
              nub_.notify_process_stop(process, state);
            }
          }
          else if (state == lldb::eStateRunning) {
            // Nice!
          }
          else {
            std::cerr << "PROCESS STATE " << state << " NOT HANDLED" << std::endl;
          }
        }
        else if (event_type & lldb::SBProcess::eBroadcastBitSTDOUT) {
          nub_.notify_process_output(process, Rtmgr_RemoteNub_i::StdOut);
        }
        else if (event_type & lldb::SBProcess::eBroadcastBitSTDERR) {
          nub_.notify_process_output(process, Rtmgr_RemoteNub_i::StdErr);
        }
        else {
          std::cerr << "PROCESS EVENT NOT HANDLED" << std::endl;
        }
      }
      else if (lldb::SBThread::EventIsThreadEvent(event)) {
        std::cerr << "THREAD EVENT NOT HANDLED" << std::endl;
      }
      else if (lldb::SBTarget::EventIsTargetEvent(event)) {
        if (event_type & lldb::SBTarget::eBroadcastBitModulesLoaded) {
          nub_.notify_target_modules_loaded(event);
        }
        else if (event_type & lldb::SBTarget::eBroadcastBitModulesUnloaded) {
          nub_.notify_target_modules_unloaded(event);
        }
      }
      else if (lldb::SBBreakpoint::EventIsBreakpointEvent(event)) {
        std::cerr << "BREAKPOINT EVENT NOT HANDLED" << std::endl;
      }
      else if (lldb::SBWatchpoint::EventIsWatchpointEvent(event)) {
        std::cerr << "WATCHPOINT EVENT NOT HANDLED" << std::endl;
      }
      else if (event.BroadcasterMatchesRef(this->exit_broadcaster_)) {
        std::cerr << "Nub event dispatcher exiting" << std::endl;
        return nullptr;
      }
      else {
        std::cerr << "SOME OTHER EVENT NOT HANDLED" << std::endl;
      }
      // MORE TO COME HERE
    }

    return nullptr;
  }

  void stop() {
    std::cerr << "Broadcast the lovely exit event" << std::endl;
    this->exit_broadcaster_.BroadcastEventByType(1, true);
    std::cerr << "Join the thread" << std::endl;
    this->join(nullptr);
  }
};

#define NUB_UNIMPLEMENTED() \
  { \
    std::cerr << __FILE__ << ':' << __LINE__ << ": "                    \
              << __func__ << " unimplemented"                           \
              << std::endl;                                             \
    throw CORBA::NO_IMPLEMENT(0, CORBA::COMPLETED_NO);                  \
  }


//
// Example implementation code for IDL interface 'Rtmgr::RemoteNub'
//
Rtmgr_RemoteNub_i::Rtmgr_RemoteNub_i(const char *process_name, const char *remote_machine, lldb::SBDebugger debugger)
  : process_name_(process_name),
    remote_machine_(remote_machine),
    debugger_(debugger),
    listener_(std::string("Listener for ").append(process_name).c_str()),
    launch_(nullptr),
    dispatcher_(new NubEventDispatcher(this->listener_, *this)),
    cond_(&this->mutex_),
    nub_state_(IDLE)
{
  std::cerr << "Instantiated RemoteNub" << std::endl;
}

Rtmgr_RemoteNub_i::~Rtmgr_RemoteNub_i(){
  // add extra destructor code here
  std::cerr << "~Rtmgr_RemoteNub_i()" << std::endl;
}

Rtmgr_RemoteNub_i::NubState Rtmgr_RemoteNub_i::nub_state()
{
  omni_mutex_lock lock(this->mutex_);
  return this->nub_state_;
}

void Rtmgr_RemoteNub_i::notify_process_stop(lldb::SBProcess &process, lldb::StateType state)
{
  //this->debugger_.HandleCommand("bt");
  omni_mutex_lock lock(this->mutex_);
  lldb::pid_t pid { process.GetProcessID() };
  switch (state) {
  case lldb::eStateStopped:
    switch (this->nub_state_) {
    case IDLE:
      std::cerr << "Stopped in IDLE? What???" << std:: endl;
      abort();                  // This shouldn't happen
      break;
    case OPEN:
      std::cerr << "Stopped in OPEN? What???" << std:: endl;
      abort();                  // This shouldn't happen
      break;
    case LAUNCHING:
      {
        lldb::tid_t tid = LLDB_INVALID_THREAD_ID;
        for (size_t ti = 0, te = process.GetNumThreads(); ti != te; ++ti) {
          auto thread { process.GetThreadAtIndex(ti) };
          char description[8192];
          thread.GetStopDescription(description, sizeof description);
          std::cerr << "Thread " << thread.GetThreadID()
                    << " stop reason: " << thread.GetStopReason()
                    << " description: " << description
                    << std::endl;
          if (thread.GetStopReason() == lldb::eStopReasonBreakpoint
              && thread.GetStopReasonDataAtIndex(0) == this->main_breakpoint_.GetID()) {
            tid = thread.GetThreadID();
            break;
          }
        }
        if (tid == LLDB_INVALID_THREAD_ID) {
          std::cerr << "I don't know what we're doing here";
          abort();
        }

        // We won't need to stop at this breakpoint again (unless the
        // application is restarted)
        this->main_breakpoint_.SetEnabled(false);

        // This is the initial stop, so we create the sequence of stop
        // events that the debugger is expecting
        StopReason create_process(CREATE_PROCESS_DBG_EVENT, true,
                                  pid, tid);
        this->stop_reason_queue_.push_back(create_process);

        // Assign indices to all of the shared libraries referenced by
        // the executable, and insert LOAD_DLL events
        for (std::vector<lldb::SBModule>::size_type i = 0, e = this->target_.GetNumModules(); i != e; ++i) {
          auto module { this->target_.GetModuleAtIndex(i) };
          this->modules_.push_back(module);

          StopReason load_dll(LOAD_DLL_DBG_EVENT, true, pid, tid);
          load_dll.library = i;
          this->stop_reason_queue_.push_back(load_dll);
        }

        // A stop reason of this type for which first_hard_coded_breakpoint()
        // returns true is interpreted as <system-initialized-stop-reason>
        StopReason system_initialized(HARD_CODED_BREAKPOINT_DBG_EVENT, false,
                                      pid, tid);
        system_initialized.datum = 1;
        this->stop_reason_queue_.push_back(system_initialized);
        this->cond_.signal();

        this->nub_state_ = RUNNING;
        std::cerr << "Entering RUNNING state" << std::endl;
      }
      break;

    case RUNNING:
      std::cerr << "Stopped in RUNNING, for whatever reason" << std::endl;
      for (size_t ti = 0, te = process.GetNumThreads(); ti != te; ++ti) {
        auto thread { process.GetThreadAtIndex(ti) };
        char description[8192];
        thread.GetStopDescription(description, sizeof description);
        std::cerr << "Thread " << thread.GetThreadID()
                  << " stop reason: " << thread.GetStopReason()
                  << " description: " << description
                  << std::endl;
        switch (thread.GetStopReason()) {
        case lldb::eStopReasonBreakpoint:
          {
            StopReason breakpoint_stop(BREAKPOINT_EXCEPTION_DBG_EVENT, false,
                                       pid, thread.GetThreadID());
            this->stop_reason_queue_.push_back(breakpoint_stop);
            this->cond_.signal();
            std::cerr << "  Pushed BREAKPOINT_EXCEPTION for that one" << std::endl;
          }
          break;
        case lldb::eStopReasonException:
          std::cerr << "  What to do???" << std::endl;
          break;
        default:
          std::cerr << "  Letting that go for now" << std::endl;
          break;
        }
      }
      break;
    }
    break;

  case lldb::eStateExited:
    {
      StopReason exit_process(EXIT_PROCESS_DBG_EVENT, false,
                              pid, LLDB_INVALID_THREAD_ID);
      exit_process.datum = process.GetExitStatus();
      std::cerr << "Exit process " << exit_process.datum << std::endl;
      this->stop_reason_queue_.push_back(exit_process);
      this->cond_.signal();
    }
    break;
  default:
    std::cerr << "Process stopped in state " << state << std:: endl;
    abort();
    break;
  }
}

void Rtmgr_RemoteNub_i::notify_process_output(lldb::SBProcess &process, OutputType type)
{
  char buf[4096];
  size_t len;
  switch (type) {
  case StdOut:
    len = process.GetSTDOUT(buf, sizeof buf);
    break;
  case StdErr:
    len = process.GetSTDERR(buf, sizeof buf);
    break;
  }
  std::cerr << "Output " << type << ": " << std::string(buf, len) << std::endl;
}

void Rtmgr_RemoteNub_i::notify_target_modules_loaded(lldb::SBEvent &event)
{
  omni_mutex_lock lock(this->mutex_);
  auto process { this->target_.GetProcess() };
  lldb::pid_t pid = process.GetProcessID();
  lldb::tid_t tid = process.GetThreadAtIndex(0).GetThreadID();
  auto nmodules = this->target_.GetNumModulesFromEvent(event);
  for (uint32_t idx = 0; idx < nmodules; ++idx) {
    auto module { this->target_.GetModuleAtIndexFromEvent(idx, event) };
    std::cerr << "Loaded " << idx
              << ": " << module.GetFileSpec().GetFilename()
              << std::endl;
    if (this->nub_state_ == RUNNING) {
#if 0
      StopReason load_dll(LOAD_DLL_DBG_EVENT, true,
                          pid, tid);
      load_dll.library = this->module_index(module);
      this->stop_reason_queue_.push_back(load_dll);
      this->cond_.signal();
#endif
    }
  }
}

void Rtmgr_RemoteNub_i::notify_target_modules_unloaded(lldb::SBEvent &event)
{
  omni_mutex_lock lock(this->mutex_);
  auto process { this->target_.GetProcess() };
  lldb::pid_t pid = process.GetProcessID();
  lldb::tid_t tid = process.GetThreadAtIndex(0).GetThreadID();
  auto nmodules = this->target_.GetNumModulesFromEvent(event);
  for (uint32_t idx = 0; idx < nmodules; ++idx) {
    auto module { this->target_.GetModuleAtIndexFromEvent(idx, event) };
    std::cerr << "Unloaded " << idx
              << ": " << module.GetFileSpec().GetFilename()
              << std::endl;
    if (this->nub_state_ == RUNNING) {
      StopReason load_dll(UNLOAD_DLL_DBG_EVENT, true,
                          pid, tid);
      load_dll.library = this->module_index(module);
      this->stop_reason_queue_.push_back(load_dll);
      this->cond_.signal();
    }
  }
}

Rtmgr::RemoteNub::RNUBLIBRARY Rtmgr_RemoteNub_i::module_index(lldb::SBModule &module)
{
  abort();
}

// Methods corresponding to IDL attributes and operations
Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::process()
{
  return this->target_.GetProcess().GetProcessID();
}

Rtmgr::AccessPath_ptr Rtmgr_RemoteNub_i::access_path()
{
  return access_path_;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::remote_value_byte_size()
{
  return target_.GetProcess().GetAddressByteSize();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_process_page_fault_count()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_os_priority(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // FIXME no lldb API for returning this
  return 0;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_thread_cpu_time(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
    NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::get_library_base_address(Rtmgr::RemoteNub::RNUBLIBRARY dll)
{
  lldb::SBModule &module { this->modules_[dll] };
  size_t nsections = module.GetNumSections();
  for (size_t i = 0; i < nsections; ++i) {
    lldb::SBSection section { module.GetSectionAtIndex(i) };
    auto address = section.GetLoadAddress(this->target_);
    if (address != LLDB_INVALID_ADDRESS) {
      return address;
    }
  }
  return LLDB_INVALID_ADDRESS;
}

void Rtmgr_RemoteNub_i::get_library_version(Rtmgr::RemoteNub::RNUBLIBRARY dll, Rtmgr::RemoteNub::NUBINT &maj, Rtmgr::RemoteNub::NUBINT &min)
{
  // FIXME lldb::SBModule::GetVersion
  maj = 0;
  min = 0;
}

char *Rtmgr_RemoteNub_i::get_library_filename(Rtmgr::RemoteNub::RNUBLIBRARY dll)
{
  lldb::SBModule &module { this->modules_[dll] };
  auto filename { module.GetFileSpec().GetFilename() };
  std::cerr << "get_library_filename " << dll << ": " << filename << std::endl;
  return CORBA::string_dup(filename);
}

char *Rtmgr_RemoteNub_i::get_library_undecorated_name(Rtmgr::RemoteNub::RNUBLIBRARY dll)
{
  NUB_UNIMPLEMENTED();
}

char *Rtmgr_RemoteNub_i::get_register_name(Rtmgr::RemoteNub::NUB_INDEX reg)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_register_enumeration_code(Rtmgr::RemoteNub::NUB_INDEX reg)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::all_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::general_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::special_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::floating_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_read_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  return 1;                     // FIXME
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_write_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  return 1;                     // FIXME
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_relative_address(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT &offset)
{
  Rtmgr::RemoteNub::NUBINT pagesize { getpagesize() };
  offset = address % pagesize;
  return address / pagesize;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::virtual_page_size()
{
  return getpagesize();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  lldb::SBError error;
  auto value { this->target_.GetProcess().ReadPointerFromMemory(address, error) };
  if (error.Success()) {
    status = 0;
    return value;
  }
  else {
    status = 1;
    return LLDB_INVALID_ADDRESS;
  }
}

void Rtmgr_RemoteNub_i::write_value_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS val, Rtmgr::RemoteNub::NUBINT &status)
{
  uint8_t bytes[sizeof(lldb::addr_t)];
  auto address_size { this->target_.GetAddressByteSize() };
  switch (this->target_.GetByteOrder()) {
  case lldb::eByteOrderLittle:
    switch (address_size) {
    case 4:
      bytes[0] = val & 0xFF;
      bytes[1] = (val >> 8) & 0xFF;
      bytes[2] = (val >> 16) & 0xFF;
      bytes[3] = (val >> 24) & 0xFF;
      break;
    case 8:
      bytes[0] = val & 0xFF;
      bytes[1] = (val >> 8) & 0xFF;
      bytes[2] = (val >> 16) & 0xFF;
      bytes[3] = (val >> 24) & 0xFF;
      bytes[4] = (val >> 32) & 0xFF;
      bytes[5] = (val >> 40) & 0xFF;
      bytes[6] = (val >> 48) & 0xFF;
      bytes[7] = (val >> 56) & 0xFF;
      break;
    }
    break;
  case lldb::eByteOrderBig:
    switch (address_size) {
    case 4:
      bytes[0] = (val >> 24) & 0xFF;
      bytes[1] = (val >> 16) & 0xFF;
      bytes[2] = (val >> 8) & 0xFF;
      bytes[3] = val & 0xFF;
      break;
    case 8:
      bytes[0] = (val >> 56) & 0xFF;
      bytes[1] = (val >> 48) & 0xFF;
      bytes[2] = (val >> 40) & 0xFF;
      bytes[3] = (val >> 32) & 0xFF;
      bytes[4] = (val >> 24) & 0xFF;
      bytes[5] = (val >> 16) & 0xFF;
      bytes[6] = (val >> 8) & 0xFF;
      bytes[7] = val & 0xFF;
      break;
    }
    break;
  default:
    std::cerr << "You monster!" << std::endl;
    abort();
  }
  lldb::SBError error;
  auto result { this->target_.GetProcess().WriteMemory(address, bytes, address_size, error) };
  if (error.Success() && result == address_size) {
    status = 0;
  }
  else {
    std::cerr << "Process write error: " << error.GetCString() << std::endl;
    status = 1;
  }
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::calculate_stack_address(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT offset)
{
  NUB_UNIMPLEMENTED();
}

char *Rtmgr_RemoteNub_i::target_address_to_string(Rtmgr::RemoteNub::RTARGET_ADDRESS x, Rtmgr::RemoteNub::NUBINT sz, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT pad, Rtmgr::RemoteNub::NUBINT &truncated)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::string_to_target_address(Rtmgr::RemoteNub::NUBINT sz, const char *buffer, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT &overflow)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBFLOAT Rtmgr_RemoteNub_i::read_single_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::write_single_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBDOUBLE Rtmgr_RemoteNub_i::read_double_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::write_double_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::read_byte_string_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, ::CORBA::String_out buffer, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  lldb::SBError error;
  buffer = CORBA::string_alloc(sz);
  if (sz > 0) {
    auto process { this->target_.GetProcess() };
    auto result { process.ReadMemory(address, buffer.ptr(), sz, error) };
    if (error.Success()) {
      status = 0;
    }
    else {
      status = 1;
    }
  }
}

void Rtmgr_RemoteNub_i::write_byte_string_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, const char *buffer, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_register_in_stack_frame(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_INDEX frame_index, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::write_value_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::RTARGET_ADDRESS value, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBFLOAT Rtmgr_RemoteNub_i::read_single_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::write_single_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBDOUBLE Rtmgr_RemoteNub_i::read_double_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::write_double_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::application_restart()
{
  auto state = this->target_.GetProcess().GetState();
  std::cerr << "application_restart from "
            << lldb::SBDebugger::StateAsCString(state)
            << " state" << std::endl;
  omni_mutex_lock lock(this->mutex_);
  if (this->nub_state_ == OPEN) {
    // restart is called right after launch to put the target into
    // normal RUNNING state
    this->nub_state_ = LAUNCHING;
    std::cerr << "Entering LAUNCHING state" << std::endl;
  }
  else {
    // FIXME should implement relaunch
    std::cerr << "Oops, nub state is " << this->nub_state_ << std::endl;
    abort();
  }
  this->main_breakpoint_.SetEnabled(true);

  lldb::SBError error;
  this->target_.Launch(this->launch_, error);
  if (error.Fail()) {
    std::cerr << "Launch error: " << error.GetCString() << std::endl;
  }
  else {
    this->nub_state_ = LAUNCHING;
  }
}

void Rtmgr_RemoteNub_i::application_stop()
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::application_continue()
{
  omni_mutex_lock lock(this->mutex_);
  bool synthetic = this->stop_reason_queue_.front().synthetic;
  std::cerr << "Continue from " << this->stop_reason_queue_.front().code
            << " synthetic: " << synthetic << std::endl;
  this->stop_reason_queue_.pop_front();
  if (!synthetic) {
    std::cerr << "GO!" << std::endl;
    this->target_.GetProcess().Continue();
  }
}

void Rtmgr_RemoteNub_i::application_continue_unhandled()
{
  omni_mutex_lock lock(this->mutex_);
  bool synthetic = this->stop_reason_queue_.front().synthetic;
  std::cerr << "Continue from " << this->stop_reason_queue_.front().code
            << " synthetic: " << synthetic << std::endl;
  this->stop_reason_queue_.pop_front();
  if (!synthetic) {
    std::cerr << "GO U!" << std::endl;
    this->target_.GetProcess().Continue();
  }
}

void Rtmgr_RemoteNub_i::application_step(Rtmgr::RemoteNub::NUBINT n)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::application_step_over(Rtmgr::RemoteNub::NUBINT n)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::application_step_out()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::set_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RTARGET_ADDRESS calling_fp, Rtmgr::RemoteNub::NUBINT location_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &locs, Rtmgr::RemoteNub::NUBINT operation)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::clear_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::thread_stop(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  auto thread { this->target_.GetProcess().GetThreadByID(nubthread) };
  lldb::SBStream stream;
  thread.GetDescription(stream);
  std::cerr << "thread_stop " << nubthread << " (" << stream.GetData() << ")" << std::endl;
  //thread.Suspend();
}

void Rtmgr_RemoteNub_i::thread_continue(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  auto thread { this->target_.GetProcess().GetThreadByID(nubthread) };
  lldb::SBStream stream;
  thread.GetDescription(stream);
  std::cerr << "thread_continue " << nubthread << " (" << stream.GetData() << ")" << std::endl;
  //thread.Resume();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_suspendedQ(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  auto thread { this->target_.GetProcess().GetThreadByID(nubthread) };
  lldb::SBStream stream;
  thread.GetDescription(stream);
  std::cerr << "thread_suspendedQ " << nubthread << " (" << stream.GetData() << ") ";
  bool suspendedQ { thread.IsSuspended() };
  std::cerr << suspendedQ << std::endl;
  return suspendedQ;
}

void Rtmgr_RemoteNub_i::thread_suspended(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  auto thread { this->target_.GetProcess().GetThreadByID(nubthread) };
  lldb::SBStream stream;
  thread.GetDescription(stream);
  std::cerr << "thread_suspended " << nubthread << " (" << stream.GetData() << ") ";
  thread.Suspend();
}

void Rtmgr_RemoteNub_i::thread_resumed(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  auto thread { this->target_.GetProcess().GetThreadByID(nubthread) };
  lldb::SBStream stream;
  thread.GetDescription(stream);
  std::cerr << "thread_resumed " << nubthread << " (" << stream.GetData() << ") ";
  thread.Resume();
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::kill_application()
{
  auto e { this->target_.GetProcess().Kill() };
  if (e.Success()) {
    return 0;
  }
  else {
    std::cerr << "kill_application failed: "
              << e.GetCString()
              << std::endl;
    return 1;
  }
}

void Rtmgr_RemoteNub_i::close_application()
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::close_remote_tether()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::setup_function_call(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &args, Rtmgr::RemoteNub::RNUBHANDLE &cx_handle)
{
  NUB_UNIMPLEMENTED();
}

lldb::SBValue Rtmgr_RemoteNub_i::evaluate(lldb::SBThread &thread, const char *expression, bool stop_others)
{
  std::cerr << "Evaluating: " << expression << endl;
  lldb::SBExpressionOptions options;
  options.SetTimeoutInMicroSeconds(0); // Wait forever
  options.SetIgnoreBreakpoints(false);
  options.SetLanguage(lldb::eLanguageTypeC99);
  options.SetTryAllThreads(false);
  options.SetStopOthers(stop_others);
  options.SetUnwindOnError(false);

  // If we're currently stopped at a breakpoint then we need to
  // temporarily disable it
  auto frame { thread.GetFrameAtIndex(0) };
  auto breakpoint_i { this->breakpoint_map_.find(frame.GetPC()) };
  if (breakpoint_i != this->breakpoint_map_.end()) {
    breakpoint_i->second.SetEnabled(false);
  }

  auto value { frame.EvaluateExpression(expression, options) };
  lldb::SBStream description;
  value.GetDescription(description);
  std::cerr << "Result: " << description.GetData() << std::endl;
  lldb::SBError e { value.GetError() };
  if (e.Fail()) {
    std::cerr << "Error: " << value.GetError().GetCString() << std::endl;
  }

  // Restore the breakpoint if we disabled it
  if (breakpoint_i != this->breakpoint_map_.end()) {
    breakpoint_i->second.SetEnabled(true);
  }

  return value;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::remote_call_spy
    (Rtmgr::RemoteNub::RNUBTHREAD nubthread,
     Rtmgr::RemoteNub::RTARGET_ADDRESS func,
     Rtmgr::RemoteNub::NUBINT arg_count,
     const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &args,
     Rtmgr::RemoteNub::NUB_ERROR &status)
{
  std::cerr << "remote_call_spy on thread " << nubthread << std::endl;
  auto func_addr { lldb::SBAddress(func, this->target_) };
  if (func_addr.IsValid()) {
    auto symbol { func_addr.GetSymbol() };
    if (symbol.IsValid()) {
      std::string name(symbol.GetName());
      std::cerr << "Calling " << name;
      if (name == "spy_call_dylan_function") {
        auto callee_addr { lldb::SBAddress(args[0], this->target_) };
        auto callee_symbol { callee_addr.GetSymbol() };
        std::cerr << " => " << callee_symbol.GetName();
      }
      std::cerr << std::endl;
    }
  }

  // Record threads existing before the call
  std::set<lldb::tid_t> pre_call_threads;
  auto process { this->target_.GetProcess() };
  for (uint32_t i = 0, e = process.GetNumThreads(); i < e; ++i) {
    pre_call_threads.insert(process.GetThreadAtIndex(i).GetThreadID());
  }

  // Construct a C99 expression for the call
  lldb::SBStream expression;
  expression.Print("((void *(*)(");
  for (size_t i = 0; i < arg_count; ++i) {
    if (i > 0) {
      expression.Print(",");
    }
    expression.Print("void *");
  }
  expression.Printf(")) %#lx)(", func);
  for (size_t i = 0; i < arg_count; ++i) {
    if (i > 0) {
      expression.Print(",");
    }
    expression.Printf("(void *) %#lx", args[i]);
  }
  expression.Print(")");

  // Evaluate it
  auto thread { this->target_.GetProcess().GetThreadByID(nubthread) };
  if (thread.IsSuspended()) {
    std::cerr << "Thread is suspended!" << std::endl;
  }
  auto value { this->evaluate(thread, expression.GetData()) };

  // Check if any new threads were created during the call. If so, run
  // them until they reach the state that the environment is
  // expecting.

  if (value.IsValid() && value.GetError().Success()) {
    status = 0;
    return value.GetValueAsUnsigned();
  }
  else {
    status = 1;
    return 0;
  }
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::get_function_result(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::restore_context(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RNUBHANDLE the_context)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::set_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  auto i = this->breakpoint_map_.find(address);
  if (i != this->breakpoint_map_.end()) {
    if (i->second.IsEnabled()) {
      std::cerr << "BREAKPOINT_ALREADY_EXISTS" << std::endl;
      return BREAKPOINT_ALREADY_EXISTS;
    }
    else {
      std::cerr << "Enabling breakpoint at " << std::hex << address << std::dec << std::endl;
      i->second.SetEnabled(true);
      //this->debugger_.HandleCommand("breakpoint list");
      return OK;
    }
  }
  else {
    auto breakpoint { this->target_.BreakpointCreateByAddress(address) };
    if (breakpoint.GetNumLocations() == 1) {
      breakpoint.SetEnabled(true);
      this->breakpoint_map_[address] = breakpoint;
      std::cerr << "Created a breakpoint at " << std::hex << address << std::dec << std::endl;
      this->debugger_.HandleCommand("breakpoint list");
      return OK;
    }
    else {
      std::cerr << "SET_BREAKPOINT_FAILED" << std::endl;
      return SET_BREAKPOINT_FAILED;
    }
  }
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::clear_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::query_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout_ms, Rtmgr::RemoteNub::NUBINT &code)
{
  omni_time_t timeout(timeout_ms / 1000, (timeout_ms % 1000) * 1000000);
  omni_time_t deadline;
  omni_thread::get_time(deadline, timeout);

  omni_mutex_lock lock(this->mutex_);
  while (this->stop_reason_queue_.empty()) {
    std::cerr << "Wait..." << std::endl;
    if (!this->cond_.timedwait(deadline)) {
      code = TIMED_OUT;
      return;
    }
  }

  code = this->stop_reason_queue_.front().code;
  std::cerr << "RETURNING stop reason code " << code << std::endl;
}

void Rtmgr_RemoteNub_i::profile_wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT profiling_interval, Rtmgr::RemoteNub::NUBINT &code)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::inform_profiling_started()
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::inform_profiling_stopped()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::can_receive_first_chance(Rtmgr::RemoteNub::NUBINT ecode)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::set_first_chance(Rtmgr::RemoteNub::NUBINT ecode)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::unset_first_chance(Rtmgr::RemoteNub::NUBINT ecode)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_stop_information(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &fchance, Rtmgr::RemoteNub::NUBINT &fstart, Rtmgr::RemoteNub::RTARGET_ADDRESS &ret_addr)
{
  omni_mutex_lock lock(this->mutex_);
  auto code { this->stop_reason_queue_.front().code };
  fchance = 0;                  // FIXME
  fstart = 0;                   // Unused
  ret_addr = 0;                 // Unused
  return code;
}

void Rtmgr_RemoteNub_i::wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT &ecode)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::profile_wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT profile_interval, Rtmgr::RemoteNub::NUBINT &ecode)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::stop_reason_process()
{
  omni_mutex_lock lock(this->mutex_);
  return this->stop_reason_queue_.front().process;
}

Rtmgr::RemoteNub::RNUBTHREAD Rtmgr_RemoteNub_i::stop_reason_thread()
{
  omni_mutex_lock lock(this->mutex_);
  return this->stop_reason_queue_.front().thread;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::first_hard_coded_breakpoint()
{
  omni_mutex_lock lock(this->mutex_);
  return this->stop_reason_queue_.front().datum;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_process_exit_code()
{
  omni_mutex_lock lock(this->mutex_);
  return this->stop_reason_queue_.front().datum;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_thread_exit_code()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RNUBLIBRARY Rtmgr_RemoteNub_i::stop_reason_library()
{
  omni_mutex_lock lock(this->mutex_);
  return this->stop_reason_queue_.front().library;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_violation_op()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::exception_first_chance()
{
  return 0;                     // FIXME
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_violation_address()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_exception_address()
{
  omni_mutex_lock lock(this->mutex_);
  lldb::tid_t tid = this->stop_reason_queue_.front().thread;
  auto thread { this->target_.GetProcess().GetThreadByID(tid) };
  auto frame { thread.GetFrameAtIndex(0) };
  return frame.GetPC();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_debug_string_address()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_debug_string_length()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_debug_string_is_unicode()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::initialize_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  auto thread { this->target_.GetProcess().GetThreadByID(nubthread) };
  return thread.GetNumFrames();
}

void Rtmgr_RemoteNub_i::read_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT frame_count, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out frame_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out instruction_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out return_addresses)
{
  auto thread { this->target_.GetProcess().GetThreadByID(nubthread) };
  auto real_frame_count { thread.GetNumFrames() };
  frame_pointers = new Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ(frame_count);
  frame_pointers->length(frame_count);
  instruction_pointers = new Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ(frame_count);
  instruction_pointers->length(frame_count);
  return_addresses = new Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ(frame_count);
  return_addresses->length(frame_count);

  for (uint32_t i = 0; i < frame_count; ++i) {
    auto frame { thread.GetFrameAtIndex(i) };
    frame_pointers[i] = frame.GetFP();
    instruction_pointers[i] = frame.GetPC();
    if (i + 1 < real_frame_count) {
      auto inner_frame { thread.GetFrameAtIndex(i + 1) };
      return_addresses[i] = inner_frame.GetPC();
    }
    else {
      return_addresses[i] = LLDB_INVALID_ADDRESS;
    }
  }
}

void Rtmgr_RemoteNub_i::all_frame_lexicals(Rtmgr::RemoteNub::RTARGET_ADDRESS frame, Rtmgr::RemoteNub::RTARGET_ADDRESS ip, Rtmgr::RemoteNub::NUB_INDEX &first, Rtmgr::RemoteNub::NUB_INDEX &last, Rtmgr::RemoteNub::RNUBHANDLE &table)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::register_interactive_code_segment(Rtmgr::RemoteNub::RTARGET_ADDRESS lo, Rtmgr::RemoteNub::RTARGET_ADDRESS hi)
{
  NUB_UNIMPLEMENTED();
}

char *Rtmgr_RemoteNub_i::get_lexical_variable_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lexical_variable_address(Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable, Rtmgr::RemoteNub::NUBINT &in_reg, Rtmgr::RemoteNub::NUB_INDEX &hireg, Rtmgr::RemoteNub::NUB_INDEX &loreg, Rtmgr::RemoteNub::NUBINT &arg)
{
  NUB_UNIMPLEMENTED();

}

char *Rtmgr_RemoteNub_i::lookup_symbol_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return CORBA::string_dup(this->lookups_[table][sym - 1].name.c_str());
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_symbol_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookups_[table][sym - 1].address;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_start(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookups_[table][sym - 1].debug_start;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookups_[table][sym - 1].debug_end;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::lookup_symbol_language(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookups_[table][sym - 1].final_address_of_definition;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::symbol_is_function(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookups_[table][sym - 1].is_function;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::nearest_symbols(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY &lib, Rtmgr::RemoteNub::RNUBHANDLE &table)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::closest_symbol
    (Rtmgr::RemoteNub::RTARGET_ADDRESS address,
     Rtmgr::RemoteNub::RNUBLIBRARY &lib,
     Rtmgr::RemoteNub::RTARGET_ADDRESS &actual_address,
     Rtmgr::RemoteNub::NUBINT &offset,
     Rtmgr::RemoteNub::NUBINT &name_length,
     Rtmgr::RemoteNub::NUBINT &type,
     Rtmgr::RemoteNub::NUBINT &is_function,
     Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_start,
     Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_end,
     Rtmgr::RemoteNub::NUBINT &language,
     Rtmgr::RemoteNub::RTARGET_ADDRESS &final_address_of_definition)
{
  auto addr { lldb::SBAddress(address, this->target_) };
  if (addr.IsValid()) {
    auto symbol { addr.GetSymbol() };
    if (symbol.IsValid()) {
      std::cerr << "closest: " << symbol.GetName() << std::endl;
      auto module { addr.GetModule() };
      lib = std::find(this->modules_.begin(), this->modules_.end(), module)
          - this->modules_.begin();
      actual_address = symbol.GetStartAddress().GetLoadAddress(this->target_);
      offset = address - actual_address;
      auto name { symbol.GetMangledName() };
      if (name == nullptr) {
        name = symbol.GetName();
      }
      this->closest_symbol_name_ = name;
      name_length = this->closest_symbol_name_.size();
      type = 0;
      is_function = (symbol.GetType() == lldb::eSymbolTypeCode);
      debug_start = actual_address + symbol.GetPrologueByteSize();
      debug_end = symbol.GetEndAddress().GetLoadAddress(this->target_);
      language = 0;
      final_address_of_definition = debug_end;
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

void Rtmgr_RemoteNub_i::function_bounding_addresses(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS &lower, Rtmgr::RemoteNub::RTARGET_ADDRESS &upper)
{
  NUB_UNIMPLEMENTED();
}

char *Rtmgr_RemoteNub_i::closest_symbol_name(Rtmgr::RemoteNub::NUBINT sz)
{
  return CORBA::string_dup(this->closest_symbol_name_.c_str());
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::find_symbol_in_library
    (Rtmgr::RemoteNub::RNUBLIBRARY nublibrary,
     Rtmgr::RemoteNub::NUBINT sz,
     const char *name,
     Rtmgr::RemoteNub::RTARGET_ADDRESS &address,
     Rtmgr::RemoteNub::NUBINT &type,
     Rtmgr::RemoteNub::NUBINT &is_function,
     Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_start,
     Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_end,
     Rtmgr::RemoteNub::NUBINT &symbol_language,
     Rtmgr::RemoteNub::RTARGET_ADDRESS &final_address_of_definition)
{
  auto &module { this->modules_[nublibrary] };
  auto symbol { module.FindSymbol(name) };
  if (symbol.IsValid()) {
    auto start { symbol.GetStartAddress() }, end { symbol.GetEndAddress() };
    address = start.GetLoadAddress(this->target_);
    auto symbol_type { symbol.GetType() };
    std::cerr << "find_symbol_in_library " << name
              << " within " << module.GetFileSpec().GetFilename()
              << ": type " << symbol_type
              << std::endl;
    switch (symbol_type) {
    case lldb::eSymbolTypeCode:
      {
        type = symbol_language = -1; // Currently ignored
        if (address == LLDB_INVALID_ADDRESS) {
          debug_start = LLDB_INVALID_ADDRESS;
        }
        else {
          debug_start = address + symbol.GetPrologueByteSize();
          std::cerr << "address " << std::hex << address
                    << " debug_start " << debug_start
                    << std::dec
                    << std::endl;
        }
        final_address_of_definition = end.GetLoadAddress(this->target_);
        debug_end = final_address_of_definition;
        return 1;
      }
    case lldb::eSymbolTypeData:
      return 1;
    default:
      std::cerr << "Unrecognized symbol type for " << name << ": "
                << symbol_type << std::endl;
      break;
    }
  }
  std::cerr << "find_symbol_in_library " << name
            << " within " << module.GetFileSpec().GetFilename()
            << " FAILED" << std::endl;
  return 0;
}

void Rtmgr_RemoteNub_i::do_symbols(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char* match, Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last, Rtmgr::RemoteNub::RNUBHANDLE& lookups)
{
  // Allocate a slot for this lookup
  lookups = this->lookups_.size();
  this->lookups_.push_back(std::vector<SymbolLookup>());
  
  auto &module { this->modules_[nublibrary] };
  auto pattern { llvm::GlobPattern::create(llvm::StringRef(match)) };
  size_t nsyms = module.GetNumSymbols();
  std::cerr << "Faithfully scanning " << nsyms << " symbols from "
            << module.GetFileSpec().GetFilename()
            << " against " << match << std::endl;
  for (size_t idx = 0; idx < nsyms; ++idx) {
    auto symbol { module.GetSymbolAtIndex(idx) };
    auto type { symbol.GetType() };
    if ((type == lldb::eSymbolTypeCode || type == lldb::eSymbolTypeData)
        && pattern->match(symbol.GetName())) {
      std::cerr << "Matches: " << symbol.GetName()
                << " type " << type 
                << std::endl;
      this->lookups_.back().push_back(SymbolLookup(symbol, this->target_));
    }
    // else {
    //   std::cerr << "Does not match: " << symbol.GetName()
    //             << " type " << type 
    //             << std::endl;
    // }
  }

  first = 1;
  last = lookups_.back().size();
  std::cerr << "first=" << first << " last=" << last << " lookups=" << lookups << std::endl;
}

void Rtmgr_RemoteNub_i::dispose_lookups(Rtmgr::RemoteNub::RNUBHANDLE lookups)
{
  // Clear the requested slot
  this->lookups_[lookups].clear();
  // Drop any lookup slots at the end that have already been cleared
  while (!this->lookups_.empty() && this->lookups_.back().empty()) {
    this->lookups_.pop_back();
  }
}

Rtmgr_RemoteNub_i::SymbolLookup::SymbolLookup(lldb::SBSymbol &symbol, lldb::SBTarget &target)
  : name(symbol.GetName()),
    is_function(symbol.GetType() == lldb::eSymbolTypeCode)
{
  auto start { symbol.GetStartAddress() }, end { symbol.GetEndAddress() };
  address = start.GetLoadAddress(target);
  if (is_function) {
    if (address == LLDB_INVALID_ADDRESS) {
      debug_start = LLDB_INVALID_ADDRESS;
    }
    else {
      debug_start = address + symbol.GetPrologueByteSize();
    }
    final_address_of_definition = end.GetLoadAddress(target);
    debug_end = final_address_of_definition;
  }
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::resolve_source_location(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char *filename, Rtmgr::RemoteNub::NUBINT line_number, Rtmgr::RemoteNub::NUBINT column_number, Rtmgr::RemoteNub::NUBINT &valid, Rtmgr::RemoteNub::NUBINT &path, Rtmgr::RemoteNub::RNUBHANDLE &search, Rtmgr::RemoteNub::NUBINT &exact)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RNUBHANDLE Rtmgr_RemoteNub_i::fetch_source_locations(Rtmgr::RemoteNub::RTARGET_ADDRESS start_loc, Rtmgr::RemoteNub::RTARGET_ADDRESS end_loc)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::source_location_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::source_location_linenumber(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index)
{
  NUB_UNIMPLEMENTED();
}

char *Rtmgr_RemoteNub_i::source_location_filename(Rtmgr::RemoteNub::RNUBHANDLE table)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::number_of_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::dispose_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::interpret_instruction_at_current_location(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &flow, Rtmgr::RemoteNub::RTARGET_ADDRESS &destination, Rtmgr::RemoteNub::NUBINT &instruction_size)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_calculate_step_into(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &function_register_live, Rtmgr::RemoteNub::NUBINT &ok)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_thread_environment_block_address(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &valid)
{
  std::cerr << "dylan_thread_environment_block_address on thread " << nubthread << std::endl;

  auto thread { this->target_.GetProcess().GetThreadByID(nubthread) };
  auto suspended { thread.IsSuspended() };
  if (suspended) {
    std::cerr << "Temporarily resuming thread!" << std::endl;
    thread.Resume();
  }
  auto value { this->evaluate(thread, "(D) spy_teb()", true) };
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

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::dylan_thread_mv_buffer_live(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::older_stack_frame(Rtmgr::RemoteNub::RTARGET_ADDRESS this_one, Rtmgr::RemoteNub::RTARGET_ADDRESS than_this_one)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_current_function(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::perform_absolute_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::perform_relative_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::recover_breakpoint(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // Don't need to do anything
  (void) nubthread;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_process_wall_clock_time()
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::register_exit_process_function(Rtmgr::RemoteNub::RTARGET_ADDRESS ExitProcess)
{
  this->exit_process_function_ = ExitProcess;
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::open_local_tether(const char *command, const char *args, const Rtmgr::RemoteNub::STRING_SEQ &paths, const Rtmgr::RemoteNub::STRING_SEQ &lib_paths, const char *working_directory, Rtmgr::RemoteNub::NUBINT create_shell, Rtmgr::RemoteNub::NUBINT &success)
{
  // Create an SBTarget for the executable to be debugged
  lldb::SBError error;
  this->target_ = debugger_.CreateTarget(command, "", "", true, error);
  if (!this->target_.IsValid()) {
    std::cerr << "Unable to create target for " << command
              << ": " << error.GetCString()
              << std::endl;
    success = 0;
    return 0;
  }

  omni_mutex_lock lock(this->mutex_);

  // Subscribe to target notifications
  auto flags
    = lldb::SBTarget::eBroadcastBitModulesLoaded
    | lldb::SBTarget::eBroadcastBitModulesUnloaded
    | lldb::SBTarget::eBroadcastBitSymbolsLoaded;
  this->target_.GetBroadcaster().AddListener(this->listener_, flags);

  // Prepare to launch this executable as a new process
  std::cerr << "command = " << command << std::endl;

  this->launch_.Clear();
  this->launch_.SetListener(this->listener_);
  this->launch_.SetLaunchFlags(lldb::eLaunchFlagDebug); // | lldb::eLaunchFlagStopAtEntry

  // Set a one-shot breakpoint at the executable's "main" function
  lldb::SBFileSpecList module_list, comp_unit_list;
  module_list.Append(this->target_.GetExecutable());
  this->main_breakpoint_
    = this->target_.BreakpointCreateByName("main", module_list, comp_unit_list);
  if (!this->main_breakpoint_.IsValid()) {
    std::cerr << "main_breakpoint is not valid" << std::endl;
    success = 0;
    return 0;
  }

  // Parse the arguments as the shell would
  wordexp_t we;
  if (wordexp(args, &we, 0) != 0) {
    success = 0;
    return 0;
  }
  for (size_t i = 1; i < we.we_wordc; ++i) {
    std::cerr << "argv[" << i << "] = " << we.we_wordv[i] << std::endl;
    const char *argv[2] = { we.we_wordv[i], nullptr };
    this->launch_.SetArguments(&argv[0], true);
  }
  wordfree(&we);

  this->launch_.SetWorkingDirectory(working_directory);

  this->nub_state_ = OPEN;
  std::cerr << "Entering OPEN state" << std::endl;

  success = 1;
  return 0; // FIXME
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::attach_local_tether(Rtmgr::RemoteNub::RNUBPROCESS process, const char *process_name, const char *process_system_id, Rtmgr::RemoteNub::RNUB process_actual_id, const Rtmgr::RemoteNub::STRING_SEQ &symbol_paths, const char *system_JIT_information, Rtmgr::RemoteNub::NUBINT &success)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::OpenNub(Rtmgr::AccessPath_ptr access_path)
{
  access_path_ = access_path;
}

void Rtmgr_RemoteNub_i::CloseNub()
{
  std::cerr << "CloseNub " << this << std::endl;
  //this->access_path_ = Rtmgr::AccessPath::_nil();
  std::cerr << "Stop the dispatcher" << std::endl;
  this->dispatcher_->stop();
  std::cerr << "Deactivate" << std::endl;
  PortableServer::POA_var poa = _default_POA();
  PortableServer::ObjectId_var id = poa->servant_to_id(this);
  poa->deactivate_object(id);
}


////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////

