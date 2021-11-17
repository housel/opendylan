// -*- C++ -*-

#include <lldb/API/LLDB.h>
#include <llvm/Support/Debug.h>
#include <llvm/Support/raw_ostream.h>

#include <deque>
#include <map>
#include <mutex>
#include <thread>

#define NUB_DEBUG(X) DEBUG_WITH_TYPE("dylan-nub", X)

namespace nub_private {
  extern const char *const stop_reason_name[];

  class NubLLDBContext {
  public:
    NubLLDBContext(const char *process_name);
    ~NubLLDBContext();
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
}
