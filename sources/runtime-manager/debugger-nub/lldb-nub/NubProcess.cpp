#include "NubProcess.h"

#include <lldb/API/LLDB.h>
#include <llvm/Support/Debug.h>
#include <llvm/Support/Endian.h>
#include <llvm/Support/GlobPattern.h>
#include <llvm/Support/raw_ostream.h>

#include <chrono>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <deque>
#include <map>

#include <wordexp.h>
#include <unistd.h>

#define NUB_DEBUG(X) DEBUG_WITH_TYPE("dylan-nub", X)

namespace {
  const char *const stop_reason_name[] = {
    "TIMED_OUT",                        // 0
    "ACCESS_VIOLATION_EXCEPTION",       // 1
    "ARRAY_BOUNDS_EXCEPTION",           // 2
    "ILLEGAL_INSTRUCTION_EXCEPTION",    // 3
    "PRIVILEGED_INSTRUCTION_EXCEPTION", // 4
    "DENORMAL_EXCEPTION",               // 5
    "FLOAT_DIVIDE_BY_ZERO_EXCEPTION",   // 6
    "INEXACT_RESULT_EXCEPTION",         // 7
    "INVALID_OPERATION_EXCEPTION",      // 8
    "FLOAT_OVERFLOW_EXCEPTION",         // 9
    "FLOAT_UNDERFLOW_EXCEPTION",        // 10
    "FLOAT_STACK_CHECK_EXCEPTION",      // 11
    "INTEGER_DIVIDE_BY_ZERO_EXCEPTION", // 12
    "NONCONTINUABLE_EXCEPTION",         // 13
    "BREAKPOINT_EXCEPTION",             // 14
    "HARD_CODED_BREAKPOINT",            // 15
    "SINGLE_STEP",                      // 16
    "CREATE_PROCESS",                   // 17
    "EXIT_PROCESS",                     // 18
    "CREATE_THREAD",                    // 19
    "EXIT_THREAD",                      // 20
    "LOAD_DLL",                         // 21
    "UNLOAD_DLL",                       // 22
    "RIP",                              // 23
    "OUTPUT_DEBUG_STRING",              // 24
    "PROFILER",                         // 25
    "UNCLASSIFIED",                     // 26
    "INTEGER_OVERFLOW_EXCEPTION",       // 27
    "STACK_OVERFLOW_EXCEPTION",         // 28
    "SOURCE_STEP_OVER",                 // 29
    "SOURCE_STEP_OUT",                  // 30
    "SOURCE_STEP_INTO",                 // 31
    "TIMED_OUT_HANDLED",                // 32
    "TIMED_OUT_UNHANDLED",              // 33
    "PROFILER_UNHANDLED",               // 34
  };

  /// Ensure LLDB initialization, deinitialization, and debugger
  /// singleton creation
  class DebuggerCreator {
  public:
    DebuggerCreator() {
      llvm::DebugFlag = true;

      // Initialize LLDB
      lldb::SBDebugger::Initialize();
    }
    ~DebuggerCreator() {
      // Terminate LLDB
      lldb::SBDebugger::Terminate();
    }
    lldb::SBDebugger create() {
      if (!this->debugger_) {
        this->debugger_ = lldb::SBDebugger::Create(false);
      }
      return this->debugger_;
    }
  private:
    lldb::SBDebugger debugger_;
  };

  DebuggerCreator creator;
}

class NubProcessPrivate {
public:
  NubProcessPrivate(const char *process_name);
  ~NubProcessPrivate();
  lldb::SBDebugger debugger;
  lldb::SBTarget target;
  lldb::SBProcess process;
  lldb::SBListener listener;
  lldb::SBLaunchInfo launch;

  NubProcess::LookupSymbol make_lookup_symbol(lldb::SBSymbol &symbol);

  lldb::SBValue evaluate(lldb::SBThread &thread, const char *expression,
                         bool stop_others = false, bool ignore_result = false);

  void shepherd_spy_created_threads(std::unique_lock<std::mutex> &guard,
                                    unsigned created_thread_count);

  void ensure_register_info(lldb::SBFrame &frame);
  void populate_register_group(lldb::SBValue &group);

  NubProcess::NUB_INDEX add_virtual_register(NubProcess::TARGET_ADDRESS);
  NubProcess::TARGET_ADDRESS virtual_register_value(NubProcess::NUB_INDEX reg);
  void clear_virtual_registers();

  std::mutex mutex;
  std::condition_variable queue_condition;

  std::deque<NubProcess::StopReason> stop_reason_queue;

  enum NubState {
    INITIAL,
    OPEN,
    LAUNCHING,
    RUNNING,
  } nub_state;

  // The system-initialized breakpoint
  lldb::SBBreakpoint main_breakpoint;
  // Dylan thread started breakpoint
  lldb::SBBreakpoint create_thread_breakpoint;

  enum ThreadState {
    THREAD_NEW = 0,            // New, un-notified thread
    THREAD_NOTIFIED,           // CREATE_THREAD event sent
    THREAD_MAIN,               // Main thread
    THREAD_SYSTEM,             // GC or run-time thread
  };
  std::map<lldb::tid_t, ThreadState> thread_map;

  // Target modules, with a persistent RLIBRARY index value
  std::vector<lldb::SBModule> modules;

  enum BreakpointClassification {
    APPLICATION_BREAKPOINT = 3,
    CAPTURE_STEP_OUT_BREAKPOINT = 7,  // $step-operation-step-out
    CAPTURE_STEP_OVER_BREAKPOINT = 8, // $step-operation-step-over
    CAPTURE_STEP_INTO_BREAKPOINT = 9, // $step-operation-step-into
  };
  struct BreakpointData {
    BreakpointClassification classification;
    lldb::SBBreakpoint breakpoint;
  };
  std::map<lldb::addr_t, BreakpointData> breakpoint_map;
  std::vector<lldb::addr_t> stepping_breakpoint_addresses;

  lldb::addr_t exit_process_function;

  std::vector<std::string> register_names;
  using register_name_index = std::vector<std::string>::size_type;
  std::map<std::string, register_name_index> register_name_map;
  std::pair<register_name_index, register_name_index> general_registers;
  std::pair<register_name_index, register_name_index> special_registers;
  std::pair<register_name_index, register_name_index> floating_registers;

private:
  std::vector<NubProcess::TARGET_ADDRESS> virtual_register_values_;

  lldb::SBBroadcaster exit_broadcaster_;
  std::thread event_dispatcher_thread_;
  void dispatch_lldb_events();

  void dispatch_process_stop(lldb::SBProcess &process, lldb::StateType state);
  void dispatch_target_modules_loaded(lldb::SBEvent &event);
  void dispatch_target_modules_unloaded(lldb::SBEvent &event);
};

NubProcessPrivate::NubProcessPrivate(const char *process_name)
  : debugger(creator.create()),
    listener(std::string("Listener for ").append(process_name).c_str()),
    launch(nullptr),
    nub_state(INITIAL),
    exit_process_function(LLDB_INVALID_ADDRESS),
    exit_broadcaster_("nub event_dispatcher_thread"),
    event_dispatcher_thread_([&] { dispatch_lldb_events(); })
{
  this->exit_broadcaster_.AddListener(this->listener, 1);
}

NubProcessPrivate::~NubProcessPrivate()
{
  this->exit_broadcaster_.BroadcastEventByType(1, true);
  this->event_dispatcher_thread_.join();
}

NubProcess::LookupSymbol NubProcessPrivate::make_lookup_symbol(lldb::SBSymbol &symbol)
{
  auto start { symbol.GetStartAddress() };
  auto lookup {
    NubProcess::LookupSymbol(symbol.GetName(),
                             start.GetLoadAddress(this->target),
                             symbol.GetType() == lldb::eSymbolTypeCode)
  };
  if (lookup.address == LLDB_INVALID_ADDRESS) {
    abort();
  }
  if (lookup.is_function) {
    // FIXME start.GetSymbolContext(0).GetFunction().GetLanguage()
    lookup.language = 0;
    if (start.IsValid()) {
      lookup.debug_start = lookup.address + symbol.GetPrologueByteSize();
    }
    else {
      lookup.debug_start = LLDB_INVALID_ADDRESS;
    }
    auto end { symbol.GetEndAddress() };
    lookup.debug_end = lookup.function_end = end.GetLoadAddress(target);
  }
  return lookup;
}

void NubProcessPrivate::dispatch_lldb_events()
{
  NUB_DEBUG(llvm::dbgs() << "Dispatching LLDB events...\n");
  lldb::SBEvent event;
  while (listener.WaitForEvent(UINT32_MAX, event)) {
    NUB_DEBUG({
      lldb::SBStream stream;
      event.GetDescription(stream);
      llvm::dbgs() << "Event ";
      if (event.GetDataFlavor() != nullptr) {
        llvm::dbgs() << "(data flavor " << event.GetDataFlavor() << "): ";
      }
      llvm::dbgs() << stream.GetData() << "\n";
    });

    auto event_type { event.GetType() };
    if (lldb::SBProcess::EventIsProcessEvent(event)) {
      auto process { lldb::SBProcess::GetProcessFromEvent(event) };
      if (event_type & lldb::SBProcess::eBroadcastBitStateChanged) {
        auto state { lldb::SBProcess::GetStateFromEvent(event) };
        if (state == lldb::eStateStopped || state == lldb::eStateExited) {
          // We only care if it's really stopped
          if (!lldb::SBProcess::GetRestartedFromEvent(event)) {
            this->dispatch_process_stop(process, state);
          }
        }
        else if (state == lldb::eStateRunning) {
          // Nice!
        }
        else {
          NUB_DEBUG(llvm::dbgs() << "PROCESS STATE " << state << " NOT HANDLED\n");
        }
      }
      else if (event_type & lldb::SBProcess::eBroadcastBitSTDOUT) {
        //this->dispatch_process_output(process, Rtmgr_RemoteNub_i::StdOut);
      }
      else if (event_type & lldb::SBProcess::eBroadcastBitSTDERR) {
        //this->dispatch_process_output(process, Rtmgr_RemoteNub_i::StdErr);
      }
      else {
        NUB_DEBUG(llvm::dbgs() << "PROCESS EVENT NOT HANDLED\n");
      }
    }
    else if (lldb::SBThread::EventIsThreadEvent(event)) {
      NUB_DEBUG(llvm::dbgs() << "THREAD EVENT NOT HANDLED\n");
    }
    else if (lldb::SBTarget::EventIsTargetEvent(event)) {
      if (event_type & lldb::SBTarget::eBroadcastBitModulesLoaded) {
        this->dispatch_target_modules_loaded(event);
      }
      else if (event_type & lldb::SBTarget::eBroadcastBitModulesUnloaded) {
        this->dispatch_target_modules_unloaded(event);
      }
    }
    else if (lldb::SBBreakpoint::EventIsBreakpointEvent(event)) {
      NUB_DEBUG(llvm::dbgs() << "BREAKPOINT EVENT NOT HANDLED\n");
    }
    else if (lldb::SBWatchpoint::EventIsWatchpointEvent(event)) {
      NUB_DEBUG(llvm::dbgs() << "WATCHPOINT EVENT NOT HANDLED\n");
    }
    else if (event.BroadcasterMatchesRef(this->exit_broadcaster_)) {
      NUB_DEBUG(llvm::dbgs() << "Nub event dispatcher exiting\n");
      break;
    }
    else {
      llvm::dbgs() << "SOME OTHER EVENT NOT HANDLED\n";
    }
    // PERHAPS MORE TO COME HERE
  }
}

void NubProcessPrivate::dispatch_process_stop(lldb::SBProcess &process, lldb::StateType state)
{
  std::unique_lock<std::mutex> guard(this->mutex);
  lldb::pid_t pid { process.GetProcessID() };
  switch (state) {
  case lldb::eStateStopped:
    switch (this->nub_state) {
    case INITIAL:
      abort();                  // This shouldn't happen
      break;
    case OPEN:
      llvm::errs() << "Stopped in OPEN? What???\n";
      abort();                  // This shouldn't happen
      break;
    case LAUNCHING:
      {
        // We have a process now
        this->process = this->target.GetProcess();

        // Enumerate the initial set of threads
        lldb::tid_t tid = LLDB_INVALID_THREAD_ID;
        for (size_t ti = 0, te = process.GetNumThreads(); ti != te; ++ti) {
          auto thread { process.GetThreadAtIndex(ti) };

          char description[8192];
          thread.GetStopDescription(description, sizeof description);
          NUB_DEBUG({
            llvm::dbgs() << "Thread " << thread.GetThreadID()
                         << " stop reason: " << thread.GetStopReason()
                         << " description: " << description
                         << "\n";
          });
          if (thread.GetStopReason() == lldb::eStopReasonBreakpoint
              && thread.GetStopReasonDataAtIndex(0) == this->main_breakpoint.GetID()) {
            tid = thread.GetThreadID();
            this->thread_map[tid] = THREAD_MAIN;
          }
          else {
            // This thread was created by the GC or the Dylan
            // run-time, so we won't need to notify of its existence
            this->thread_map[thread.GetThreadID()] = THREAD_SYSTEM;
          }
        }
        if (tid == LLDB_INVALID_THREAD_ID) {
          llvm::errs() << "I don't know what we're doing here\n";
          abort();
        }

        // We won't need to stop at this breakpoint again (unless the
        // application is restarted)
        this->main_breakpoint.SetEnabled(false);

        // Set up a breakpoint at the thread trampoline
        this->create_thread_breakpoint
          = this->target.BreakpointCreateByName("dylan_thread_trampoline");
        this->create_thread_breakpoint.SetEnabled(true);
        //this->debugger.HandleCommand("breakpoint list");

        // This is the initial stop, so we create the sequence of stop
        // events that the debugger is expecting
        NubProcess::StopReason create_process
          (NubProcess::CREATE_PROCESS_DBG_EVENT, true, tid);
        //create_process.library
        this->stop_reason_queue.emplace_back(create_process);

        // Assign indices to all of the shared libraries referenced by
        // the executable, and insert LOAD_DLL events
        for (std::vector<lldb::SBModule>::size_type i = 0, e = this->target.GetNumModules(); i != e; ++i) {
          auto module { this->target.GetModuleAtIndex(i) };
          this->modules.push_back(module);

          NubProcess::StopReason load_dll(NubProcess::LOAD_DLL_DBG_EVENT, true, tid);
          load_dll.library = i;
          this->stop_reason_queue.emplace_back(load_dll);
        }

        // A stop reason of this type for which first_hard_coded_breakpoint()
        // returns true is interpreted as <system-initialized-stop-reason>
        auto thread { this->process.GetSelectedThread() };
        auto frame { thread.GetFrameAtIndex(0) };
        NubProcess::StopReason system_initialized
          (NubProcess::HARD_CODED_BREAKPOINT_DBG_EVENT, false, tid);
        system_initialized.first_hard_coded_breakpoint = 1;
        system_initialized.exception_address = frame.GetPC();
        this->stop_reason_queue.emplace_back(system_initialized);
        this->queue_condition.notify_all();

        this->nub_state = RUNNING;
        NUB_DEBUG(llvm::dbgs() << "Entering RUNNING state\n");
      }
      break;

    case RUNNING:
      llvm::dbgs() << "Stopped in RUNNING, for whatever reason\n";
      //this->debugger.HandleCommand("bt all");
      {
        auto queue_count { this->stop_reason_queue.size() };
        for (size_t ti = 0, te = process.GetNumThreads(); ti != te; ++ti) {
          auto thread { process.GetThreadAtIndex(ti) };
          auto tid { thread.GetThreadID() };
          auto frame { thread.GetFrameAtIndex(0) };
          lldb::SBStream frame_stream;
          frame.GetDescription(frame_stream);
          auto exception_address { frame.GetPC() };

          char description[8192];
          thread.GetStopDescription(description, sizeof description);
          llvm::dbgs() << "Thread " << tid
                       << " stop reason: " << thread.GetStopReason()
                       << " description: " << description
                       << "\n  " << frame_stream.GetData();
          if (thread.IsSuspended()) {
            llvm::dbgs() << "  That's suspended, ignore for now\n";
            continue;
          }
          switch (thread.GetStopReason()) {
          case lldb::eStopReasonBreakpoint:
            if (thread.GetStopReasonDataAtIndex(0) == this->create_thread_breakpoint.GetID()) {
              this->thread_map[tid] = THREAD_NOTIFIED;
              NubProcess::StopReason create_thread_stop
                (NubProcess::CREATE_THREAD_DBG_EVENT, false, tid);
              this->stop_reason_queue.emplace_back(create_thread_stop);
              this->queue_condition.notify_all();
              NUB_DEBUG(llvm::dbgs() << "  Pushed CREATE_THREAD for that one\n");
            }
            else {
              auto breakpoint_i { this->breakpoint_map.find(exception_address) };
              if (breakpoint_i != this->breakpoint_map.end()) {
                NubProcess::StopReasonCode code;
                switch (breakpoint_i->second.classification) {
                case APPLICATION_BREAKPOINT:
                  code = NubProcess::BREAKPOINT_EXCEPTION_DBG_EVENT;
                  break;
                case CAPTURE_STEP_OUT_BREAKPOINT:
                  code = NubProcess::SOURCE_STEP_OUT_DBG_EVENT;
                  break;
                case CAPTURE_STEP_OVER_BREAKPOINT:
                  code = NubProcess::SOURCE_STEP_OVER_DBG_EVENT;
                  break;
                case CAPTURE_STEP_INTO_BREAKPOINT:
                  code = NubProcess::SOURCE_STEP_INTO_DBG_EVENT;
                  break;
                default:
                  abort();
                }
                NubProcess::StopReason breakpoint_stop(code, false, tid);
                breakpoint_stop.exception_address = exception_address;
                this->stop_reason_queue.emplace_back(breakpoint_stop);
                this->queue_condition.notify_all();
                NUB_DEBUG(llvm::dbgs() << "  Pushed " << stop_reason_name[code]
                                       << " for that one, index="
                                       << thread.GetStopReasonDataAtIndex(0) << "\n");
              }
              else {
                llvm::errs() << "  Breakpoint that's not known\n";
              }
            }
            break;
          case lldb::eStopReasonException:
            {
              auto code { thread.GetStopReasonDataAtIndex(0) };
              if (code == 6) {    // FIXME
                NubProcess::StopReason system_initialized
                  (NubProcess::HARD_CODED_BREAKPOINT_DBG_EVENT, false, tid);
                system_initialized.exception_address = exception_address;
                system_initialized.first_hard_coded_breakpoint = 0;
                this->stop_reason_queue.emplace_back(system_initialized);
                this->queue_condition.notify_all();
                llvm::dbgs() << "  Pushed HARD_CODED_BREAKPOINT for that one\n";
                //this->debugger_.HandleCommand("bt all");
              }
              else {
                llvm::dbgs() << "  What to do??? "
                          << thread.GetStopReasonDataCount() << " data"
                          << " (0) = " << thread.GetStopReasonDataAtIndex(0)
                          << "\n";
              }
            }
            break;
          case lldb::eStopReasonSignal:
            {
              auto sig { thread.GetStopReasonDataAtIndex(0) };
              if (sig == process.GetUnixSignals().GetSignalNumberFromName("SIGTRAP")) {
                NubProcess::StopReason hard_coded_breakpoint
                  (NubProcess::HARD_CODED_BREAKPOINT_DBG_EVENT, false, tid);
                hard_coded_breakpoint.exception_address = exception_address;
                hard_coded_breakpoint.first_hard_coded_breakpoint = 0;
                this->stop_reason_queue.emplace_back(hard_coded_breakpoint);
                this->queue_condition.notify_all();
                NUB_DEBUG(llvm::dbgs() << "  Pushed HARD_CODED_BREAKPOINT for that one\n");
                //this->debugger_.HandleCommand("bt all");
              }
              else {
                NUB_DEBUG(llvm::dbgs() << "  What to do??? signal = " << sig << "\n");
              }
            }
            break;

          default:
            NUB_DEBUG(llvm::dbgs() << "  Letting that go for now\n");
            break;
          }
        }
        // If there are no stop reasons we care about (for
        // poorly-understood reasons) then we just continue
        if (queue_count == this->stop_reason_queue.size()) {
          NUB_DEBUG(llvm::dbgs() << "OK GO!\n");
          process.Continue();
        }
      }
      break;
    }
    break;

  case lldb::eStateExited:
    {
      lldb::tid_t main_tid { LLDB_INVALID_THREAD_ID };
      for (auto &e : this->thread_map) {
        if (e.second == THREAD_MAIN) {
          main_tid = e.first;
          break;
        }
      }
      NubProcess::StopReason exit_process
        (NubProcess::EXIT_PROCESS_DBG_EVENT, false, main_tid);
      exit_process.exit_code = process.GetExitStatus();
      NUB_DEBUG(llvm::dbgs() << "Exit process " << exit_process.exit_code << "\n");
      this->stop_reason_queue.emplace_back(exit_process);
      this->queue_condition.notify_all();
    }
    break;
  default:
    llvm::errs() << "Process stopped in state " << state << "\n";
    abort();
    break;
  }
}

void NubProcessPrivate::dispatch_target_modules_loaded(lldb::SBEvent &event)
{
}

void NubProcessPrivate::dispatch_target_modules_unloaded(lldb::SBEvent &event)
{
}

lldb::SBValue NubProcessPrivate::evaluate
    (lldb::SBThread &thread, const char *expression,
     bool stop_others, bool ignore_result)
{
  NUB_DEBUG(llvm::dbgs() << "Evaluating: " << expression << "\n");
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
  auto breakpoint_i { this->breakpoint_map.find(frame.GetPC()) };
  if (breakpoint_i != this->breakpoint_map.end()) {
    NUB_DEBUG({
      llvm::dbgs() << "Temporarily disabling breakpoint (ID "
                   << breakpoint_i->second.breakpoint.GetID() << ") at "
                   << llvm::format("0x%016" PRIx64, breakpoint_i->first)
                   << "\n";
    });
    breakpoint_i->second.breakpoint.SetEnabled(false);
  }

  auto value { frame.EvaluateExpression(expression, options) };
  NUB_DEBUG({
    lldb::SBStream description;
    value.GetDescription(description);
    llvm::dbgs() << "Result: " << description.GetData();
  });
  auto value_type { value.GetType() };
  if (!ignore_result) {
    lldb::SBError e { value.GetError() };
    if (e.Fail()) {
      llvm::errs() << "Error: " << e.GetCString() << "\n";
    }
  }

  // Restore the breakpoint if we disabled it
  if (breakpoint_i != this->breakpoint_map.end()) {
    NUB_DEBUG({
      llvm::dbgs() << "Re-enabling breakpoint (ID "
                   << breakpoint_i->second.breakpoint.GetID() << ") at "
                   << llvm::format("0x%016" PRIx64, breakpoint_i->first)
                   << "\n";
    });
    breakpoint_i->second.breakpoint.SetEnabled(true);
  }

  return value;
}


///

NubProcess::NubProcess(const char *process_name)
  : private_(new NubProcessPrivate(process_name))
{
}

NubProcess::~NubProcess()
{
  delete private_;
}

bool NubProcess::launch_process(const char *command, const char *args,
                                const char *working_directory)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);

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
  np.launch.SetLaunchFlags(lldb::eLaunchFlagDebug); // | lldb::eLaunchFlagStopAtEntry

  // Set a breakpoint at the executable's "main" function
  lldb::SBFileSpecList module_list, comp_unit_list;
  module_list.Append(np.target.GetExecutable());
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

  np.nub_state = NubProcessPrivate::OPEN;
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
  std::unique_lock<std::mutex> guard(np.mutex);
  lldb::SBModule &module { np.modules[dll] };
  auto address { module.GetObjectFileHeaderAddress() };
  return address.GetLoadAddress(np.target);
}

void NubProcess::get_library_version(NUBLIBRARY dll, NUBINT &maj, NUBINT &min)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  lldb::SBModule &module { np.modules[dll] };
  uint32_t versions[2];
  module.GetVersion(versions, 2);
  maj = versions[0];
  min = versions[1];
}

std::string NubProcess::get_library_filename(NUBLIBRARY dll)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  lldb::SBModule &module { np.modules[dll] };
  return module.GetFileSpec().GetFilename();
}

std::string NubProcess::get_register_name(NUB_INDEX reg)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  return np.register_names[reg - 1];
}

void NubProcess::all_registers(NUBINT &first, NUBINT &last)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  auto thread { np.process.GetSelectedThread() };
  auto frame { thread.GetFrameAtIndex(0) };
  np.ensure_register_info(frame);
  first = 1;
  last = np.register_names.size();
 }

void NubProcess::general_registers(NUBINT &first, NUBINT &last)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  auto thread { np.process.GetSelectedThread() };
  auto frame { thread.GetFrameAtIndex(0) };
  np.ensure_register_info(frame);
  first = np.general_registers.first + 1;
  last = np.general_registers.second;
}

void NubProcess::special_registers(NUBINT &first, NUBINT &last)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  // FIXME
  first = np.special_registers.first + 1;
  last = np.special_registers.second;
}

void NubProcess::floating_registers(NUBINT &first, NUBINT &last)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
  lldb::SBMemoryRegionInfo info;
  TARGET_ADDRESS pagesize = getpagesize();
  if (np.process.GetMemoryRegionInfo(address, info).Success()) {
    if (info.GetPageSize() != 0) {
      pagesize = info.GetPageSize();
    }
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
  std::unique_lock<std::mutex> guard(np.mutex);


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
  std::unique_lock<std::mutex> guard(np.mutex);
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
    std::unique_lock<std::mutex> guard(np.mutex);

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
  std::unique_lock<std::mutex> guard(np.mutex);

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
  std::unique_lock<std::mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  auto frame { thread.GetFrameAtIndex(0) };
  if (reg < 0) {
    // Virtual register
    status = 0;
    return np.virtual_register_value(reg);
  }
  else {
    auto reg_name { np.register_names[reg - 1].c_str() };
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
  std::unique_lock<std::mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  auto frame { thread.GetFrameAtIndex(frame_index) };
  auto reg_name { np.register_names[reg - 1].c_str() };
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
  std::unique_lock<std::mutex> guard(np.mutex);

  auto state { np.process.GetState() };
  NUB_DEBUG({
    llvm::dbgs() << "application_restart from {"
                 << lldb::SBDebugger::StateAsCString(state)
                 << "} state\n";
  });

  switch (np.nub_state) {
  case NubProcessPrivate::OPEN:
    {
    }
    break;
  default:
    {
      // FIXME should implement relaunch
      llvm::errs() << "Oops, nub state is " << np.nub_state << "\n";
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
    np.nub_state = NubProcessPrivate::LAUNCHING;
    NUB_DEBUG(llvm::dbgs() << "Entering LAUNCHING state\n");
  }
}

void NubProcess::application_stop()
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  NUB_DEBUG(llvm::dbgs() << "Stop\n");
  np.process.Stop();
}

void NubProcess::application_continue()
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  np.clear_virtual_registers();
  bool synthetic = np.stop_reason_queue.front().synthetic;
  NUB_DEBUG({
      llvm::dbgs() << "Continue from "
                   << stop_reason_name[np.stop_reason_queue.front().code]
                   << " synthetic: " << synthetic << "\n";
  });
  np.stop_reason_queue.pop_front();
#if 0
  if (!this->function_call_expression_.empty()) {
    this->evaluate_function_call();
  } else
#endif
  if (!synthetic) {
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
  std::unique_lock<std::mutex> guard(np.mutex);
  np.clear_virtual_registers();
  bool synthetic = np.stop_reason_queue.front().synthetic;
  NUB_DEBUG({
      llvm::dbgs() << "Continue (unhandled) from "
                   << stop_reason_name[np.stop_reason_queue.front().code]
                   << " synthetic: " << synthetic << "\n";
  });
  np.stop_reason_queue.pop_front();
#if 0
  if (!np.function_call_expression_.empty()) {
    np.evaluate_function_call();
  } else
#endif
  if (!synthetic) {
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
          = { NubProcessPrivate::BreakpointClassification(operation),
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
  np.exit_process_function = ExitProcess;
}

NubProcess::NUB_ERROR NubProcess::kill_application()
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
      np.debugger.HandleCommand("breakpoint list");
      return OK;
    }
  }
  else {
    auto breakpoint { np.target.BreakpointCreateByAddress(address) };
    if (breakpoint.GetNumLocations() == 1) {
      breakpoint.SetEnabled(true);
      auto id { breakpoint.GetID() };
      np.breakpoint_map[address]
        = {NubProcessPrivate::APPLICATION_BREAKPOINT, std::move(breakpoint)};
      NUB_DEBUG({
        llvm::dbgs() << "Created a breakpoint (ID " << id << ") at "
                     << llvm::format("0x%016" PRIx64, address)
                     << "\n";
        llvm::dbgs().flush();
      });
      np.debugger.HandleCommand("breakpoint list");
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
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

NubProcess::TARGET_ADDRESS NubProcess::remote_call_spy
    (NUBTHREAD nubthread, TARGET_ADDRESS func,
     const std::vector<TARGET_ADDRESS> &args,
     NUB_ERROR &status, StopReason &stop,
     std::vector<NUBTHREAD> &created_threads)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
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
  expression.Printf(")) %#lx)(", func);
  for (size_t i = 0; i < args.size(); ++i) {
    if (i > 0) {
      expression.Print(",");
    }
    expression.Printf("(void *) %#lx", args[i]);
  }
  expression.Print(")");

  // Evaluate it
  auto value { np.evaluate(thread, expression.GetData()) };

  // Release the hold on new threads
  np.evaluate(thread, "(void) spy_hold_threads(0)", true, true);

  // Check if any new threads were created during the call. If so, run
  // them until they reach the state that the environment is
  // expecting.
  auto pid { np.process.GetProcessID() };
  for (size_t ti = 0, te = np.process.GetNumThreads(); ti != te; ++ti) {
    auto thread { np.process.GetThreadAtIndex(ti) };
    auto tid { thread.GetThreadID() };
    if (np.thread_map[tid] == NubProcessPrivate::THREAD_NEW) {
      NUB_DEBUG(llvm::dbgs() << "Thread " << tid << " was created\n");
      // Within spy calls we return the set of newly-created threads
      // rather than adding a stop-reason.
      created_threads.push_back(tid);
    }
  }
  np.shepherd_spy_created_threads(guard, created_threads.size());

  // Update the client's idea of the current stop reason
  stop = np.stop_reason_queue.front();

  // Re-enable the thread creation breakpoint
  np.create_thread_breakpoint.SetEnabled(true);

  if (value.IsValid() && value.GetError().Success()) {
    status = 0;
    return value.GetValueAsUnsigned();
  }
  else {
    status = 1;
    return 0;
  }
}

void NubProcessPrivate::shepherd_spy_created_threads(std::unique_lock<std::mutex> &guard, unsigned created_thread_count)
{
  if (created_thread_count == 0) {
    return;
  }

  NUB_DEBUG(llvm::dbgs() << "Shepherding " << created_thread_count
                         << " spy-created thread(s)\n");

  // Suspend any pre-existing threads so they don't interfere
  std::vector<lldb::SBThread> suspended_threads;
  for (size_t ti = 0, te = this->process.GetNumThreads(); ti != te; ++ti) {
    auto thread { process.GetThreadAtIndex(ti) };
    auto tid { thread.GetThreadID() };
    if ((this->thread_map[tid] == THREAD_MAIN
         || this->thread_map[tid] == THREAD_NOTIFIED)
        && !thread.IsSuspended()) {
      thread.Suspend();
      suspended_threads.emplace_back(thread);
      NUB_DEBUG(llvm::dbgs() << "Temporarily suspending " << tid
                             << " during shepherding\n");
    }
  }

  // Continue the new thread until it stops within
  // primitive-invoke-debugger (see spy-create-application-thread)
  while (created_thread_count > 0) {
    this->stop_reason_queue.pop_front();
    process.Continue();
    this->queue_condition.wait(guard,
                               [&]{ return !stop_reason_queue.empty(); });

    if (this->stop_reason_queue.front().code != NubProcess::HARD_CODED_BREAKPOINT_DBG_EVENT) {
      abort();
    }
    auto tid { this->stop_reason_queue.front().thread };
    this->thread_map[tid] = THREAD_NOTIFIED;
    --created_thread_count;
    auto thread { process.GetThreadByID(tid) };
    NUB_DEBUG({
      auto frame { thread.GetFrameAtIndex(0) };
      lldb::SBStream stream;
      frame.GetDescription(stream);
      llvm::dbgs() << "Successfully shepherded " << tid
                   << ", suspending it at "
                   << stream.GetData();
    });
    thread.Suspend();
  }

  // Resume any threads we might have suspended
  for (auto &thread : suspended_threads) {
    NUB_DEBUG(llvm::dbgs() << "Unsuspending " << thread.GetThreadID()
                           << " after shepherding\n");
    thread.Resume();
  }
}

void NubProcessPrivate::ensure_register_info(lldb::SBFrame &frame)
{
  if (!this->register_names.empty()) {
    return;
  }
  auto registers { frame.GetRegisters() };
  {
    // "General Purpose Registers"
    this->general_registers.first = this->register_names.size();
    auto group_gpr { registers.GetFirstValueByName("General Purpose Registers") };
    this->populate_register_group(group_gpr);
    this->general_registers.second = this->register_names.size();
  }

  {
    // "Floating Point Registers"
    this->floating_registers.first = this->register_names.size();
    auto group_fpu { registers.GetFirstValueByName("Floating Point Registers") };
    this->populate_register_group(group_fpu);
    this->floating_registers.second = this->register_names.size();
  }
}

void NubProcessPrivate::populate_register_group(lldb::SBValue &group)
{
  for (uint32_t ci = 0, ce = group.GetNumChildren(); ci != ce; ++ci) {
    auto reg { group.GetChildAtIndex(ci) };
    auto index { this->register_names.size() };
    llvm::dbgs() << "[" << index << "] = " << reg.GetName() << "\n";
    this->register_names.emplace_back(reg.GetName());
    this->register_name_map.insert({reg.GetName(), index});
  }
}

NubProcess::NUB_INDEX NubProcessPrivate::add_virtual_register(NubProcess::TARGET_ADDRESS value)
{
  auto virtual_reg { -1 - NubProcess::NUB_INDEX(this->virtual_register_values_.size()) };
  NUB_DEBUG({
    llvm::dbgs() << "Assigning virtual register " << virtual_reg
                 << " to value " << llvm::format("0x%016" PRIx64, value)
                 << "\n";
  });
  this->virtual_register_values_.push_back(value);
  return virtual_reg;
}

NubProcess::TARGET_ADDRESS NubProcessPrivate::virtual_register_value(NubProcess::NUB_INDEX reg)
{
  std::vector<NubProcess::TARGET_ADDRESS>::size_type index = -1 - reg;
  return this->virtual_register_values_[index];
}

void NubProcessPrivate::clear_virtual_registers()
{
  this->virtual_register_values_.clear();
}

NubProcess::NUBINT NubProcess::thread_stop_information
    (NUBTHREAD nubthread,
     NUBINT &fchance, NUBINT &fstart,
     TARGET_ADDRESS &ret_addr)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  auto code { np.stop_reason_queue.front().code };
  fchance = 0;                  // FIXME
  fstart = 0;                   // Unused
  ret_addr = 0;                 // Unused
  return code;
}

NubProcess::NUBINT NubProcess::initialize_stack_vectors(NUBTHREAD nubthread)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);

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
    auto name { value.GetName() };
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
     NUBINT &offset, LookupSymbol &lookup)
{
  auto &np { *this->private_ };
  std::unique_lock<std::mutex> guard(np.mutex);
  auto addr { lldb::SBAddress(address, np.target) };
  if (addr.IsValid()) {
    auto symbol { addr.GetSymbol() };
    if (symbol.IsValid()) {
      NUB_DEBUG({
        llvm::dbgs() << "closest to "
                     << llvm::format("0x%016" PRIx64, address)
                     << ": " << symbol.GetName() << "\n";
      });
      auto module { addr.GetModule() };
      lib = std::find(np.modules.begin(), np.modules.end(), module)
          - np.modules.begin();
      actual_address = symbol.GetStartAddress().GetLoadAddress(np.target);
      offset = address - actual_address;
      lookup = np.make_lookup_symbol(symbol);
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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
  auto &module { np.modules[library] };
  std::vector<NubProcess::LookupSymbol> result;
  auto pattern { llvm::GlobPattern::create(llvm::StringRef(match)) };
  if (!pattern) {
    llvm::errs() << "lookup_symbols pattern error: "<< pattern.takeError() << "\n";
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
  std::unique_lock<std::mutex> guard(np.mutex);

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
  std::unique_lock<std::mutex> guard(np.mutex);
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
  std::unique_lock<std::mutex> guard(np.mutex);
  auto thread { np.process.GetThreadByID(nubthread) };
  auto suspended { thread.IsSuspended() };
  if (suspended) {
    NUB_DEBUG(llvm::dbgs() << "Temporarily resuming thread!\n");
    thread.Resume();
  }
  auto value { np.evaluate(thread, "(D) spy_teb()", true) };
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
