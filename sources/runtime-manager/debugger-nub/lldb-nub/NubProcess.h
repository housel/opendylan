// -*- C++ -*-

#include <cstdint>
#include <memory>
#include <string>
#include <vector>

namespace nub_private {;
  class NubLLDBContext;
};

class NubProcess {
public:
  using NUBHANDLE = unsigned;
  using NUBINT = int;
  using NUB_INDEX = int;
  using NUB_ERROR = int;
  using NUBPROCESS = uint64_t; // cf lldb::pid_t
  using NUBTHREAD = uint64_t;  // cf lldb::tid_t
  using NUBLIBRARY = uint32_t; // Library index within target
  using FLOAT = float;
  using DOUBLE = double;
  using TARGET_ADDRESS = uint64_t; // cf lldb::addr_t

  enum OutputType {
    StdOut,
    StdErr,
  };

  explicit NubProcess(const char *process_name);
  ~NubProcess();

  bool open_process(const char *command, const char *args,
                    const char *working_directory);
  bool attach_process(NUBPROCESS process);

  NUBPROCESS process() const;

  NUBINT remote_value_byte_size() const;
  NUBINT get_process_page_fault_count();
  NUBINT thread_os_priority(NUBTHREAD nubthread);
  NUBINT get_thread_cpu_time(NUBTHREAD nubthread);

  TARGET_ADDRESS get_library_base_address(NUBLIBRARY dll);

  void get_library_version(NUBLIBRARY dll, NUBINT &maj, NUBINT &min);

  std::string get_library_filename(NUBLIBRARY dll);
  std::string get_library_undecorated_name(NUBLIBRARY dll);

  std::string get_register_name(NUB_INDEX reg);
  NUBINT get_register_enumeration_code(NUB_INDEX reg);
  void all_registers(NUBINT &first, NUBINT &last);
  void general_registers(NUBINT &first, NUBINT &last);
  void special_registers(NUBINT &first, NUBINT &last);
  void floating_registers(NUBINT &first, NUBINT &last);

  NUBINT page_read_permission(TARGET_ADDRESS address);
  NUBINT page_write_permission(TARGET_ADDRESS address);

  NUBINT page_relative_address(TARGET_ADDRESS address, NUBINT &offset);
  NUBINT virtual_page_size();

  TARGET_ADDRESS read_value_from_process_memory(TARGET_ADDRESS address,
                                               NUB_ERROR &status);
  void write_value_to_process_memory
    (TARGET_ADDRESS address, TARGET_ADDRESS val, NUBINT &status);

  TARGET_ADDRESS calculate_stack_address(NUBTHREAD nubthread,
                                         NUBINT offset);

  TARGET_ADDRESS string_to_target_address
    (std::string &string, NUBINT radix, NUBINT &overflow);

  FLOAT read_single_float_from_process_memory
    (TARGET_ADDRESS address, NUB_ERROR &status);
  void write_single_float_to_process_memory
    (TARGET_ADDRESS address, FLOAT value,
     NUB_ERROR &status);
  DOUBLE read_double_float_from_process_memory
    (TARGET_ADDRESS address, NUB_ERROR &status);
  void write_double_float_to_process_memory
    (TARGET_ADDRESS address, DOUBLE value,
     NUB_ERROR &status);
  void read_byte_string_from_process_memory
    (TARGET_ADDRESS address, NUBINT sz, void *buffer, NUB_ERROR &status);
  void write_byte_string_to_process_memory
    (TARGET_ADDRESS address, NUBINT sz, const void *buffer, NUB_ERROR &status);

  TARGET_ADDRESS read_value_from_process_register_in_stack_frame
    (NUBTHREAD nubthread, NUB_INDEX reg,
     NUB_INDEX frame_index, NUB_ERROR &status);

  TARGET_ADDRESS read_value_from_process_register
    (NUBTHREAD nubthread, NUB_INDEX reg, NUB_ERROR &status);
  void write_value_to_process_register
    (NUBTHREAD nubthread, NUB_INDEX reg,
     TARGET_ADDRESS value, NUB_ERROR &status);
  FLOAT read_single_float_from_process_register
    (NUBTHREAD nubthread, NUB_INDEX reg, NUB_ERROR &status);
  void write_single_float_to_process_register
    (NUBTHREAD nubthread, NUB_INDEX reg, FLOAT value, NUB_ERROR &status);
  DOUBLE read_double_float_from_process_register
    (NUBTHREAD nubthread, NUB_INDEX reg, NUB_ERROR &status);
  void write_double_float_to_process_register
    (NUBTHREAD nubthread, NUB_INDEX reg, DOUBLE value, NUB_ERROR &status);

  void application_restart();
  void application_stop();
  void application_continue();
  void application_continue_unhandled();
  void application_step(NUBINT n);
  void application_step_over(NUBINT n);
  void application_step_out();

  enum StepOperationCode {
    STEP_NONE = 0,
    STEP_OUT = 7,
    STEP_OVER = 8,
    STEP_INTO = 9,
  };

  NUB_ERROR set_stepping_control_on_thread
    (NUBTHREAD nubthread,
     TARGET_ADDRESS fp, TARGET_ADDRESS calling_fp,
     const std::vector<TARGET_ADDRESS> &locs,
     NUBINT operation);
  NUB_ERROR clear_stepping_control_on_thread(NUBTHREAD nubthread);

  void thread_stop(NUBTHREAD nubthread);
  void thread_continue(NUBTHREAD nubthread);
  void thread_suspended(NUBTHREAD thread);
  bool thread_suspendedQ(NUBTHREAD thread);
  void thread_resumed(NUBTHREAD thread);

  void register_exit_process_function(TARGET_ADDRESS ExitProcess);

  NUB_ERROR kill_application();
  void close_application();
  void remote_debugger_nub_shutdown();

  void debug_message(const char *, TARGET_ADDRESS, TARGET_ADDRESS);

  enum BreakpointStatusCode {
    NOT_SUPPORTED = 0,
    BREAKPOINT_ALREADY_EXISTS = 1,
    BREAKPOINT_DOES_NOT_EXIST = 2,
    WATCHPOINT_ALREADY_EXISTS = 3,
    WATCHPOINT_DOES_NOT_EXIST = 4,
    SET_BREAKPOINT_FAILED = 5,
    CLEAR_BREAKPOINT_FAILED = 6,
    OK = 7,
    BREAKPOINT_WAS_DISABLED = 8,
  };

  NUB_ERROR set_breakpoint(TARGET_ADDRESS address);
  NUB_ERROR clear_breakpoint(TARGET_ADDRESS address);\
  // void recover_breakpoint(NUBTHREAD thread);
  NUBINT query_breakpoint(TARGET_ADDRESS address);

  enum StopReasonCode {
    // Constants used in mapping debug events to Access Path
    // <stop-reason> codes.
    // These MUST agree with the codes specified in the Access Path.
    TIMED_OUT = 0,
    // process thread exception-address first-chance?
    // violation-address violation-operation
    ACCESS_VIOLATION_EXCEPTION_DBG_EVENT = 1,
    // process thread exception-address first-chance?
    ARRAY_BOUNDS_EXCEPTION_DBG_EVENT = 2,
    // process thread exception-address first-chance?
    ILLEGAL_INSTRUCTION_EXCEPTION_DBG_EVENT = 3,
    // exception-address first-chance?
    PRIVILEGED_INSTRUCTION_EXCEPTION_DBG_EVENT = 4,
    // process thread exception-address first-chance?
    DENORMAL_EXCEPTION_DBG_EVENT = 5,
    // process thread exception-address first-chance?
    FLOAT_DIVIDE_BY_ZERO_EXCEPTION_DBG_EVENT = 6,
    // process thread exception-address first-chance?
    INEXACT_RESULT_EXCEPTION_DBG_EVENT = 7,
    // process thread exception-address first-chance?
    INVALID_OPERATION_EXCEPTION_DBG_EVENT = 8,
    // process thread exception-address first-chance?
    FLOAT_OVERFLOW_EXCEPTION_DBG_EVENT = 9,
    // process thread exception-address first-chance?
    FLOAT_UNDERFLOW_EXCEPTION_DBG_EVENT = 10,
    // process thread exception-address first-chance?
    FLOAT_STACK_CHECK_EXCEPTION_DBG_EVENT = 11,
    // process thread exception-address first-chance?
    INTEGER_DIVIDE_BY_ZERO_EXCEPTION_DBG_EVENT = 12,
    // process thread exception-address first-chance?
    NONCONTINUABLE_EXCEPTION_DBG_EVENT = 13,
    // process thread exception-address
    BREAKPOINT_EXCEPTION_DBG_EVENT = 14,
    // process thread exception-address first-chance?
    // first-debugger-invocation?
    HARD_CODED_BREAKPOINT_DBG_EVENT = 15,
    // process thread exception-address
    SINGLE_STEP_DBG_EVENT = 16,
    // process thread executable
    CREATE_PROCESS_DBG_EVENT = 17,
    // process thread process-exit-code
    EXIT_PROCESS_DBG_EVENT = 18,
    // process thread
    CREATE_THREAD_DBG_EVENT = 19,
    // process thread thread-exit-code
    EXIT_THREAD_DBG_EVENT = 20,
    // process thread library
    LOAD_DLL_DBG_EVENT = 21,
    // process thread library
    UNLOAD_DLL_DBG_EVENT = 22,
    // (unused)
    RIP_DBG_EVENT = 23,
    // process thread debug-string
    OUTPUT_DEBUG_STRING_DBG_EVENT = 24,
    // (none)
    PROFILER_DBG_EVENT = 25,
    // (none)
    PROFILER_UNHANDLED_DBG_EVENT = 34,
    // process thread first-chance? exception-address
    UNCLASSIFIED_DBG_EVENT = 26,
    // process thread exception-address first-chance?
    INTEGER_OVERFLOW_EXCEPTION_DBG_EVENT = 27,
    // process thread exception-address first-chance?
    STACK_OVERFLOW_EXCEPTION_DBG_EVENT = 28,
    // process thread exception-address
    SOURCE_STEP_OVER_DBG_EVENT = 29,
    // process thread exception-address
    SOURCE_STEP_OUT_DBG_EVENT = 30,
    // process thread exception-address
    SOURCE_STEP_INTO_DBG_EVENT = 31,
    TIMED_OUT_HANDLED = 32,
    TIMED_OUT_UNHANDLED = 33,
  };
  struct StopReason {
    StopReasonCode code;
    NUBTHREAD thread;
    NUBLIBRARY library;
    NUBINT first_hard_coded_breakpoint;
    NUBINT exit_code;
    NUBINT violation_op;
    NUBINT exception_first_chance;
    TARGET_ADDRESS violation_address;
    TARGET_ADDRESS exception_address;
    TARGET_ADDRESS debug_string_address;
    NUBINT debug_string_length;
    NUBINT debug_string_is_unicode;
    bool synthetic;

    StopReason() : code(TIMED_OUT) {}
    StopReason(StopReasonCode code, bool synthetic, NUBTHREAD thread)
      : code(code), thread(thread),
        library(0), first_hard_coded_breakpoint(0),
        exit_code(0), violation_op(0),
        exception_first_chance(1),
        violation_address(0), exception_address(0),
        synthetic(synthetic) {
    }
  };

  void wait_for_stop_reason_with_timeout
    (NUBINT timeout, StopReason &stop);
  void profile_wait_for_stop_reason_with_timeout
    (NUBINT timeout, NUBINT profiling_interval,
     StopReason &stop);
  void inform_profiling_started();
  void inform_profiling_stopped();

  TARGET_ADDRESS setup_function_call
    (NUBTHREAD nubthread,  TARGET_ADDRESS func,
     NUBINT arg_count, const std::vector<TARGET_ADDRESS> &args,
     NUBHANDLE &cx_handle);
  TARGET_ADDRESS remote_call_spy
    (NUBTHREAD nubthread, TARGET_ADDRESS func,
     const std::vector<TARGET_ADDRESS> &args,
     NUB_ERROR &status, StopReason &stop,
     std::vector<NUBTHREAD> &created_threads);
  TARGET_ADDRESS get_function_result(NUBTHREAD nubthread);
  void nub_restore_context(NUBTHREAD nubthread, NUBHANDLE context);

  NUBINT can_receive_first_chance(NUBINT ecode);
  void set_first_chance(NUBINT ecode);
  void unset_first_chance(NUBINT ecode);
  NUBINT thread_stop_information
    (NUBTHREAD nubthread,
     NUBINT &fchance, NUBINT &fstart,
     TARGET_ADDRESS &ret_addr);

  NUBINT initialize_stack_vectors(NUBTHREAD nubthread);
  struct StackFrame {
    TARGET_ADDRESS frame_pointer;
    TARGET_ADDRESS instruction_pointer;
    TARGET_ADDRESS return_address;
  };
  std::vector<StackFrame> read_stack_vectors
    (NUBTHREAD nubthread, NUBINT frame_count);

  struct FrameLexical {
    std::string name;
    TARGET_ADDRESS variable_address;
    bool in_register;
    NUB_INDEX hi_register;
    NUB_INDEX lo_register;
    bool is_arg;

    FrameLexical() = default;
    FrameLexical(std::string name, TARGET_ADDRESS variable_address,
                 bool in_register, bool is_arg)
      : name(name), variable_address(variable_address),
        in_register(in_register), is_arg(is_arg) {
    }
  };
  std::vector<FrameLexical> all_frame_lexicals
    (TARGET_ADDRESS frame, TARGET_ADDRESS ip);

  struct LookupSymbol {
    std::string name;
    TARGET_ADDRESS address;
    TARGET_ADDRESS debug_start;
    TARGET_ADDRESS debug_end;
    TARGET_ADDRESS function_end;
    NUBINT language;
    bool is_function;

    LookupSymbol() = default;
    LookupSymbol(std::string name, TARGET_ADDRESS address, bool is_function)
      : name(name),
        address(address),
        is_function(is_function) {
    }
  };

  NUBINT closest_symbol
    (TARGET_ADDRESS address,
     NUBLIBRARY &lib,
     TARGET_ADDRESS &actual_address,
     NUBINT &offset,
     LookupSymbol &symbol);
  NUBINT find_symbol_in_library
    (NUBLIBRARY nublibrary, const char *name,
     LookupSymbol &symbol);

  std::vector<LookupSymbol> lookup_symbols(NUBLIBRARY library, const char *match);

  TARGET_ADDRESS resolve_source_location
    (NUBLIBRARY nublibrary, const char *filename,
     NUBINT line_number, NUBINT column_number,
     NUBINT &valid, NUBINT &exact);

  struct SourceLocation {
    TARGET_ADDRESS relative_address; // Offset from function start
    NUBINT linenumber;
    std::string filename;

    SourceLocation(TARGET_ADDRESS relative_address,
                   NUBINT linenumber,
                   std::string filename)
      : relative_address(relative_address),
        linenumber(linenumber),
        filename(filename) {
    }
  };
  std::vector<SourceLocation> fetch_source_locations
    (TARGET_ADDRESS start_loc, TARGET_ADDRESS end_loc);

  TARGET_ADDRESS dylan_thread_environment_block_address
    (NUBTHREAD thread, NUBINT &valid);
  NUBINT dylan_thread_mv_buffer_live(NUBTHREAD thread);
  NUBINT older_stack_frame(TARGET_ADDRESS this_one,
                           TARGET_ADDRESS than_this_one);
  TARGET_ADDRESS dylan_current_function(NUBTHREAD nubthread);

  struct DownloadRecord {
    const char *data;
    size_t length;

    DownloadRecord(const char *data, size_t length) : data(data), length(length) {}
  };
  
  enum class RegionKind {
    DylanExact,                 // .dyvar
    DylanStatic,                // .dyobj
    DylanAmbiguous,             // .dydat
    DylanFixup,                 // .dyfix
    DylanImport,                // .dyimp
    DylanUntraced,              // .dyutr
    DylanHistory,               // .dyhis
    CompiledCode,               // .text
    InitArray,                  // .init_array
    EHFrame,                    // .eh_frame
  };
  struct Region {
    RegionKind kind;
    TARGET_ADDRESS start;
    TARGET_ADDRESS end;

    Region(RegionKind kind, TARGET_ADDRESS start, TARGET_ADDRESS end)
      : kind(kind), start(start), end(end) {
    }
  };
  NUBINT download_code(NUBTHREAD nubthread, const std::vector<DownloadRecord> &records, const char *entry, std::vector<Region> &regions, std::vector<LookupSymbol> &symbols);

private:
  nub_private::NubLLDBContext *private_;
};
