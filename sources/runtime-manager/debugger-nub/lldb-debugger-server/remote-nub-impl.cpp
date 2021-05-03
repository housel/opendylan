#include <cstdlib>
#include <unistd.h>
#include <wordexp.h>

#include <memory>
#include <iostream>

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
          auto state = lldb::SBProcess::GetStateFromEvent(event);
          if (state == lldb::eStateStopped || state == lldb::eStateExited) {
            nub_.notify_process_stop(process, state);
          }
        }
        else if (event_type & lldb::SBProcess::eBroadcastBitSTDOUT) {
          nub_.notify_process_output(process, Rtmgr_RemoteNub_i::StdOut);
        }
        else if (event_type & lldb::SBProcess::eBroadcastBitSTDERR) {
          nub_.notify_process_output(process, Rtmgr_RemoteNub_i::StdErr);
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
  omni_mutex_lock lock(this->mutex_);
  lldb::pid_t pid = process.GetProcessID();
  lldb::tid_t tid = process.GetThreadAtIndex(0).GetThreadID();
  switch (state) {
  case lldb::eStateStopped:
    switch (this->nub_state_) {
    case IDLE:
      std::cerr << "Stopped in IDLE? What???" << std:: endl;
      abort();                  // This shouldn't happen
      break;
    case LAUNCHING:
      {
        // This is the initial stop, so we create the sequence of stop
        // events that the debugger is expecting
        StopReason create_process(CREATE_PROCESS_DBG_EVENT, true,
                                  pid, tid);
        this->stop_reason_queue_.push_back(create_process);

        // Insert LOAD_DLL events
        for (std::vector<lldb::SBModule>::size_type i = 0, e = this->modules_.size(); i != e; ++i) {
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
      }
    case RUNNING:
      break;
    }
    break;
  case lldb::eStateExited:
    {
      StopReason exit_process(EXIT_PROCESS_DBG_EVENT, false,
                              pid, tid);
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
  std::cerr << "NOT HANDLING Output " << type << std::endl;
}

void Rtmgr_RemoteNub_i::notify_target_modules_loaded(lldb::SBEvent &event)
{
  omni_mutex_lock lock(this->mutex_);
  lldb::pid_t pid = this->process_.GetProcessID();
  lldb::tid_t tid = this->process_.GetThreadAtIndex(0).GetThreadID();
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
  lldb::pid_t pid = this->process_.GetProcessID();
  lldb::tid_t tid = this->process_.GetThreadAtIndex(0).GetThreadID();
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
  return this->process_.GetProcessID();
}

Rtmgr::AccessPath_ptr Rtmgr_RemoteNub_i::access_path()
{
  return access_path_;
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::create_and_debug_process(const char *command, const char *args, Rtmgr::RemoteNub::NUBINT path_count, Rtmgr::RemoteNub::NUBINT lib_count, const char *working_dir, Rtmgr::RemoteNub::NUBINT create_shell)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::debug_active_process(const char *process_name, const char *process_id, ::CORBA::ULong actual_process_id, Rtmgr::RemoteNub::NUBINT path_count, const char *jit_info)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::remote_value_byte_size()
{
  return process_.GetAddressByteSize();
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
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_write_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_relative_address(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT &offset)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::virtual_page_size()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::write_value_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS val, Rtmgr::RemoteNub::NUBINT &status)
{
  NUB_UNIMPLEMENTED();
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
  NUB_UNIMPLEMENTED();
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
  auto state = this->process_.GetState();
  std::cerr << "application_restart from "
            << lldb::SBDebugger::StateAsCString(state)
            << " state" << std::endl;
  omni_mutex_lock lock(this->mutex_);
  if (this->nub_state_ == LAUNCHING) {
    // restart is called right after launch to put the target into
    // normal RUNNING state
    this->nub_state_ = RUNNING;
  }
  else {
    // FIXME should implement relaunch
    abort();
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
    this->process_.Continue();
  }
}

void Rtmgr_RemoteNub_i::application_continue_unhandled()
{
  NUB_UNIMPLEMENTED();
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
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::thread_continue(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_suspendedQ(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::thread_suspended(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::thread_resumed(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::kill_application()
{
  NUB_UNIMPLEMENTED();
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

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::remote_call_spy(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &args, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  NUB_UNIMPLEMENTED();
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
  NUB_UNIMPLEMENTED();
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
  NUB_UNIMPLEMENTED();
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
  auto thread { this->process_.GetThreadByID(tid) };
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
  auto thread { this->process_.GetThreadByID(nubthread) };
  return thread.GetNumFrames();
}

void Rtmgr_RemoteNub_i::read_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT frame_count, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out frame_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out instruction_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out return_addresses)
{
  NUB_UNIMPLEMENTED();
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
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_symbol_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_start(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::lookup_symbol_language(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::symbol_is_function(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::nearest_symbols(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY &lib, Rtmgr::RemoteNub::RNUBHANDLE &table)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::closest_symbol(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY &lib, Rtmgr::RemoteNub::RTARGET_ADDRESS &actual_address, Rtmgr::RemoteNub::NUBINT &offset, Rtmgr::RemoteNub::NUBINT &name_length, Rtmgr::RemoteNub::NUBINT &type, Rtmgr::RemoteNub::NUBINT &is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_end, Rtmgr::RemoteNub::NUBINT &language, Rtmgr::RemoteNub::RTARGET_ADDRESS &final_address_of_definition)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::function_bounding_addresses(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS &lower, Rtmgr::RemoteNub::RTARGET_ADDRESS &upper)
{
  NUB_UNIMPLEMENTED();
}

char *Rtmgr_RemoteNub_i::closest_symbol_name(Rtmgr::RemoteNub::NUBINT sz)
{
  NUB_UNIMPLEMENTED();
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
    switch (symbol_type) {
    case lldb::eSymbolTypeCode:
      {
        type = symbol_language = -1; // Currently ignored
        if (address == LLDB_INVALID_ADDRESS) {
          debug_start = LLDB_INVALID_ADDRESS;
        }
        else {
          debug_start = address + symbol.GetPrologueByteSize();
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
  return 0;
}

void Rtmgr_RemoteNub_i::do_symbols(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char* match, Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last, Rtmgr::RemoteNub::RNUBHANDLE& lookups)
{
  auto &module { this->modules_[nublibrary] };
  auto pattern { llvm::GlobPattern::create(llvm::StringRef(match)) };
  size_t nsyms = module.GetNumSymbols();
  std::cerr << "Faithfully scanning " << nsyms << " symbols" << std::endl;
  for (size_t idx = 0; idx < nsyms; ++idx) {
    auto symbol { module.GetSymbolAtIndex(idx) };
    auto type { symbol.GetType() };
    if (type != lldb::eSymbolTypeTrampoline
        && type != lldb::eSymbolTypeUndefined
        && pattern->match(symbol.GetName())) {
      std::cerr << "Matches: " << symbol.GetName() << std::endl;
    }
  }
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::dispose_lookups(Rtmgr::RemoteNub::RNUBHANDLE lookups)
{
  NUB_UNIMPLEMENTED();
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

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_thread_environment_block_address(Rtmgr::RemoteNub::RNUBTHREAD thread, Rtmgr::RemoteNub::NUBINT &valid)
{
  NUB_UNIMPLEMENTED();
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

void Rtmgr_RemoteNub_i::recover_breakpoint(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_process_wall_clock_time()
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::register_exit_process_function(Rtmgr::RemoteNub::RTARGET_ADDRESS ExitProcess)
{
  NUB_UNIMPLEMENTED();
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

  // Assign indices to all of the shared libraries referenced by the
  // executable
  auto nmodules = this->target_.GetNumModules();
  for (uint32_t idx = 0; idx < nmodules; ++idx) {
    auto module { this->target_.GetModuleAtIndex(idx) };
    std::cerr << "INITIALLY Loaded " << idx
              << ": " << module.GetFileSpec().GetFilename()
              << std::endl;
    this->modules_.push_back(module);
  }

  // Subscribe to target notifications
  auto flags
    = lldb::SBTarget::eBroadcastBitModulesLoaded
    | lldb::SBTarget::eBroadcastBitModulesUnloaded
    | lldb::SBTarget::eBroadcastBitSymbolsLoaded;
  this->target_.GetBroadcaster().AddListener(this->listener_, flags);

  // Prepare to launch this executable as a new process
  std::cerr << "command = " << command << std::endl;

  lldb::SBLaunchInfo launch(nullptr);
  launch.SetListener(this->listener_);
  launch.SetLaunchFlags(lldb::eLaunchFlagDebug | lldb::eLaunchFlagStopAtEntry);

  // Parse the arguments as the shell would
  wordexp_t we;
  if (wordexp(args, &we, 0) != 0) {
    success = 0;
    return 0;
  }
  for (size_t i = 0; i < we.we_wordc; ++i) {
    std::cerr << "argv[" << i << "] = " << we.we_wordv[i] << std::endl;
    const char *argv[2] = { we.we_wordv[i], nullptr };
    launch.SetArguments(&argv[0], true);
  }
  wordfree(&we);

  launch.SetWorkingDirectory(working_directory);

  this->process_ = this->target_.Launch(launch, error);
  if (error.Fail()) {
    std::cerr << "Launch error: " << error.GetCString() << std::endl;
    success = 0;
    return 0;
  }

  this->nub_state_ = LAUNCHING;
  while (this->process_.GetState() < lldb::eStateStopped) {
    std::cerr << "Waiting..." << std::endl;
    this->cond_.wait();
  }

  success = 1;
  return this->process_.GetProcessID();
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

