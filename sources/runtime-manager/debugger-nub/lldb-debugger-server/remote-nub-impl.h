// -*- C++ -*-

#include "remote-nub.h"

#include <lldb/API/LLDB.h>

#include <memory>
#include <deque>
#include <map>
#include <string>

class NubEventDispatcher;

// Implements IDL interface Rtmgr::RemoteNub
class Rtmgr_RemoteNub_i : public POA_Rtmgr::RemoteNub {
public:
  // standard constructor
  Rtmgr_RemoteNub_i(const char *process_name,
                    const char *remote_machine,
                    lldb::SBDebugger debugger);

  enum NubState {
    IDLE,
    OPEN,
    LAUNCHING,
    RUNNING,
  };
  NubState nub_state();

  enum StopReasonCode {
    // Constants used in mapping debug events to Access Path
    // <stop-reason> codes.
    // These MUST agree with the codes specified in the Access Path.
    TIMED_OUT = 0,
    TIMED_OUT_HANDLED = 32,
    TIMED_OUT_UNHANDLED = 33,
    ACCESS_VIOLATION_EXCEPTION_DBG_EVENT = 1,
    ARRAY_BOUNDS_EXCEPTION_DBG_EVENT = 2,
    ILLEGAL_INSTRUCTION_EXCEPTION_DBG_EVENT = 3,
    PRIVILEGED_INSTRUCTION_EXCEPTION_DBG_EVENT = 4,
    DENORMAL_EXCEPTION_DBG_EVENT = 5,
    FLOAT_DIVIDE_BY_ZERO_EXCEPTION_DBG_EVENT = 6,
    INEXACT_RESULT_EXCEPTION_DBG_EVENT = 7,
    INVALID_OPERATION_EXCEPTION_DBG_EVENT = 8,
    FLOAT_OVERFLOW_EXCEPTION_DBG_EVENT = 9,
    FLOAT_UNDERFLOW_EXCEPTION_DBG_EVENT = 10,
    FLOAT_STACK_CHECK_EXCEPTION_DBG_EVENT = 11,
    INTEGER_DIVIDE_BY_ZERO_EXCEPTION_DBG_EVENT = 12,
    NONCONTINUABLE_EXCEPTION_DBG_EVENT = 13,
    BREAKPOINT_EXCEPTION_DBG_EVENT = 14,
    HARD_CODED_BREAKPOINT_DBG_EVENT = 15,
    SINGLE_STEP_DBG_EVENT = 16,
    CREATE_PROCESS_DBG_EVENT = 17,
    EXIT_PROCESS_DBG_EVENT = 18,
    CREATE_THREAD_DBG_EVENT = 19,
    EXIT_THREAD_DBG_EVENT = 20,
    LOAD_DLL_DBG_EVENT = 21,
    UNLOAD_DLL_DBG_EVENT = 22,
    RIP_DBG_EVENT = 23,
    OUTPUT_DEBUG_STRING_DBG_EVENT = 24,
    PROFILER_DBG_EVENT = 25,
    PROFILER_UNHANDLED_DBG_EVENT = 34,
    UNCLASSIFIED_DBG_EVENT = 26,
    INTEGER_OVERFLOW_EXCEPTION_DBG_EVENT = 27,
    STACK_OVERFLOW_EXCEPTION_DBG_EVENT = 28,
    SOURCE_STEP_OVER_DBG_EVENT = 29,
    SOURCE_STEP_OUT_DBG_EVENT = 30,
    SOURCE_STEP_INTO_DBG_EVENT = 31,
  };

  void notify_process_stop(lldb::SBProcess &process, lldb::StateType state);

  enum OutputType {
    StdOut,
    StdErr,
  };
  void notify_process_output(lldb::SBProcess &process, OutputType type);

  void notify_target_modules_loaded(lldb::SBEvent &event);
  void notify_target_modules_unloaded(lldb::SBEvent &event);

  Rtmgr::RemoteNub::RNUBLIBRARY module_index(lldb::SBModule &module);

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

  // methods corresponding to defined IDL attributes and operations
  Rtmgr::RemoteNub::RNUB process();
  Rtmgr::AccessPath_ptr access_path();

  Rtmgr::RemoteNub::NUBINT remote_value_byte_size();

  Rtmgr::RemoteNub::NUBINT get_process_page_fault_count();

  Rtmgr::RemoteNub::NUBINT thread_os_priority(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  Rtmgr::RemoteNub::NUBINT get_thread_cpu_time(Rtmgr::RemoteNub::RNUBTHREAD nubthread);

  Rtmgr::RemoteNub::RTARGET_ADDRESS get_library_base_address(Rtmgr::RemoteNub::RNUBLIBRARY dll);

  void get_library_version(Rtmgr::RemoteNub::RNUBLIBRARY dll, Rtmgr::RemoteNub::NUBINT &maj, Rtmgr::RemoteNub::NUBINT &min);
  char *get_library_filename(Rtmgr::RemoteNub::RNUBLIBRARY dll);
  char *get_library_undecorated_name(Rtmgr::RemoteNub::RNUBLIBRARY dll);

  char *get_register_name(Rtmgr::RemoteNub::NUB_INDEX reg);
  Rtmgr::RemoteNub::NUBINT get_register_enumeration_code(Rtmgr::RemoteNub::NUB_INDEX reg);
  void all_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last);
  void general_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last);
  void special_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last);
  void floating_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last);

  Rtmgr::RemoteNub::NUBINT page_read_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  Rtmgr::RemoteNub::NUBINT page_write_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  Rtmgr::RemoteNub::NUBINT page_relative_address(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT &offset);
  Rtmgr::RemoteNub::NUBINT virtual_page_size();

  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status);
  void write_value_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS val, Rtmgr::RemoteNub::NUBINT &status);
  Rtmgr::RemoteNub::RTARGET_ADDRESS calculate_stack_address(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT offset);
  char *target_address_to_string(Rtmgr::RemoteNub::RTARGET_ADDRESS x, Rtmgr::RemoteNub::NUBINT sz, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT pad, Rtmgr::RemoteNub::NUBINT &truncated);
  Rtmgr::RemoteNub::RTARGET_ADDRESS string_to_target_address(Rtmgr::RemoteNub::NUBINT sz, const char *buffer, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT &overflow);
  Rtmgr::RemoteNub::NUBFLOAT read_single_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status);
  void write_single_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR &status);
  Rtmgr::RemoteNub::NUBDOUBLE read_double_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status);
  void write_double_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR &status);
  void read_byte_string_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, ::CORBA::String_out buffer, Rtmgr::RemoteNub::NUB_ERROR &status);
  void write_byte_string_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, const char *buffer, Rtmgr::RemoteNub::NUB_ERROR &status);
  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_register_in_stack_frame(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_INDEX frame_index, Rtmgr::RemoteNub::NUB_ERROR &status);
  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status);
  void write_value_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::RTARGET_ADDRESS value, Rtmgr::RemoteNub::NUB_ERROR &status);
  Rtmgr::RemoteNub::NUBFLOAT read_single_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status);
  void write_single_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR &status);
  Rtmgr::RemoteNub::NUBDOUBLE read_double_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status);
  void write_double_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR &status);

  void application_restart();
  void application_stop();
  void application_continue();
  void application_continue_unhandled();
  void application_step(Rtmgr::RemoteNub::NUBINT n);
  void application_step_over(Rtmgr::RemoteNub::NUBINT n);
  void application_step_out();

  Rtmgr::RemoteNub::NUB_ERROR set_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RTARGET_ADDRESS calling_fp, Rtmgr::RemoteNub::NUBINT location_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &locs, Rtmgr::RemoteNub::NUBINT operation);
  void clear_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread);

  void thread_stop(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  void thread_continue(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  Rtmgr::RemoteNub::NUBINT thread_suspendedQ(Rtmgr::RemoteNub::RNUBTHREAD thread);
  void thread_suspended(Rtmgr::RemoteNub::RNUBTHREAD thread);
  void thread_resumed(Rtmgr::RemoteNub::RNUBTHREAD thread);

  Rtmgr::RemoteNub::NUB_ERROR kill_application();
  void close_application();
  void close_remote_tether();

  Rtmgr::RemoteNub::RTARGET_ADDRESS setup_function_call(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &args, Rtmgr::RemoteNub::RNUBHANDLE &cx_handle);
  Rtmgr::RemoteNub::RTARGET_ADDRESS remote_call_spy(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &args, Rtmgr::RemoteNub::NUB_ERROR &status);
  Rtmgr::RemoteNub::RTARGET_ADDRESS get_function_result(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  void restore_context(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RNUBHANDLE the_context);
  Rtmgr::RemoteNub::NUB_ERROR set_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  Rtmgr::RemoteNub::NUB_ERROR clear_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  Rtmgr::RemoteNub::NUBINT query_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  void wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT &code);
  void profile_wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT profiling_interval, Rtmgr::RemoteNub::NUBINT &code);

  void inform_profiling_started();
  void inform_profiling_stopped();

  Rtmgr::RemoteNub::NUBINT can_receive_first_chance(Rtmgr::RemoteNub::NUBINT ecode);
  void set_first_chance(Rtmgr::RemoteNub::NUBINT ecode);
  void unset_first_chance(Rtmgr::RemoteNub::NUBINT ecode);
  Rtmgr::RemoteNub::NUBINT thread_stop_information(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &fchance, Rtmgr::RemoteNub::NUBINT &fstart, Rtmgr::RemoteNub::RTARGET_ADDRESS &ret_addr);

  void wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT &ecode);

  void profile_wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT profile_interval, Rtmgr::RemoteNub::NUBINT &ecode);

  Rtmgr::RemoteNub::RNUB stop_reason_process();
  Rtmgr::RemoteNub::RNUBTHREAD stop_reason_thread();
  Rtmgr::RemoteNub::NUBINT stop_reason_process_exit_code();
  Rtmgr::RemoteNub::NUBINT stop_reason_thread_exit_code();
  Rtmgr::RemoteNub::RTARGET_ADDRESS stop_reason_violation_address();
  Rtmgr::RemoteNub::RTARGET_ADDRESS stop_reason_exception_address();
  Rtmgr::RemoteNub::RTARGET_ADDRESS stop_reason_debug_string_address();
  Rtmgr::RemoteNub::NUBINT stop_reason_debug_string_length();
  Rtmgr::RemoteNub::NUBINT stop_reason_debug_string_is_unicode();

  Rtmgr::RemoteNub::NUBINT first_hard_coded_breakpoint();
  Rtmgr::RemoteNub::RNUBLIBRARY stop_reason_library();
  Rtmgr::RemoteNub::NUBINT stop_reason_violation_op();
  Rtmgr::RemoteNub::NUBINT exception_first_chance();

  Rtmgr::RemoteNub::NUBINT initialize_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread);

  void read_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT frame_count, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out frame_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out instruction_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out return_addresses);
  void all_frame_lexicals(Rtmgr::RemoteNub::RTARGET_ADDRESS frame, Rtmgr::RemoteNub::RTARGET_ADDRESS ip, Rtmgr::RemoteNub::NUB_INDEX &first, Rtmgr::RemoteNub::NUB_INDEX &last, Rtmgr::RemoteNub::RNUBHANDLE &table);

  void register_interactive_code_segment(Rtmgr::RemoteNub::RTARGET_ADDRESS lo, Rtmgr::RemoteNub::RTARGET_ADDRESS hi);

  char *get_lexical_variable_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lexical_variable_address(Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable, Rtmgr::RemoteNub::NUBINT &in_reg, Rtmgr::RemoteNub::NUB_INDEX &hireg, Rtmgr::RemoteNub::NUB_INDEX &loreg, Rtmgr::RemoteNub::NUBINT &arg);
  char *lookup_symbol_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_symbol_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_function_debug_start(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_function_debug_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::NUBINT lookup_symbol_language(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_function_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);

  Rtmgr::RemoteNub::NUBINT symbol_is_function(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);

  Rtmgr::RemoteNub::NUBINT nearest_symbols(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY &lib, Rtmgr::RemoteNub::RNUBHANDLE &table);
  Rtmgr::RemoteNub::NUBINT closest_symbol(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY &lib, Rtmgr::RemoteNub::RTARGET_ADDRESS &actual_address, Rtmgr::RemoteNub::NUBINT &offset, Rtmgr::RemoteNub::NUBINT &name_length, Rtmgr::RemoteNub::NUBINT &type, Rtmgr::RemoteNub::NUBINT &is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_end, Rtmgr::RemoteNub::NUBINT &language, Rtmgr::RemoteNub::RTARGET_ADDRESS &final_address_of_definition);

  void function_bounding_addresses(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS &lower, Rtmgr::RemoteNub::RTARGET_ADDRESS &upper);

  char *closest_symbol_name(Rtmgr::RemoteNub::NUBINT sz);

  Rtmgr::RemoteNub::NUBINT find_symbol_in_library(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, Rtmgr::RemoteNub::NUBINT sz, const char *name, Rtmgr::RemoteNub::RTARGET_ADDRESS &address, Rtmgr::RemoteNub::NUBINT &type, Rtmgr::RemoteNub::NUBINT &is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_end, Rtmgr::RemoteNub::NUBINT &symbol_language, Rtmgr::RemoteNub::RTARGET_ADDRESS &final_address_of_definition);

  void do_symbols(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char* match, Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last, Rtmgr::RemoteNub::RNUBHANDLE& lookups);

  void dispose_lookups(Rtmgr::RemoteNub::RNUBHANDLE lookups);
  Rtmgr::RemoteNub::RTARGET_ADDRESS resolve_source_location(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char *filename, Rtmgr::RemoteNub::NUBINT line_number, Rtmgr::RemoteNub::NUBINT column_number, Rtmgr::RemoteNub::NUBINT &valid, Rtmgr::RemoteNub::NUBINT &path, Rtmgr::RemoteNub::RNUBHANDLE &search, Rtmgr::RemoteNub::NUBINT &exact);
  Rtmgr::RemoteNub::RNUBHANDLE fetch_source_locations(Rtmgr::RemoteNub::RTARGET_ADDRESS start_loc, Rtmgr::RemoteNub::RTARGET_ADDRESS end_loc);
  Rtmgr::RemoteNub::NUBINT source_location_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index);
  Rtmgr::RemoteNub::NUBINT source_location_linenumber(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index);
  char *source_location_filename(Rtmgr::RemoteNub::RNUBHANDLE table);
  Rtmgr::RemoteNub::NUBINT number_of_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table);
  void dispose_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table);
  void interpret_instruction_at_current_location(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &flow, Rtmgr::RemoteNub::RTARGET_ADDRESS &destination, Rtmgr::RemoteNub::NUBINT &instruction_size);
  Rtmgr::RemoteNub::RTARGET_ADDRESS dylan_calculate_step_into(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &function_register_live, Rtmgr::RemoteNub::NUBINT &ok);
  Rtmgr::RemoteNub::RTARGET_ADDRESS dylan_thread_environment_block_address(Rtmgr::RemoteNub::RNUBTHREAD thread, Rtmgr::RemoteNub::NUBINT &valid);
  Rtmgr::RemoteNub::NUBINT dylan_thread_mv_buffer_live(Rtmgr::RemoteNub::RNUBTHREAD thread);
  Rtmgr::RemoteNub::NUBINT older_stack_frame(Rtmgr::RemoteNub::RTARGET_ADDRESS this_one, Rtmgr::RemoteNub::RTARGET_ADDRESS than_this_one);
  Rtmgr::RemoteNub::RTARGET_ADDRESS dylan_current_function(Rtmgr::RemoteNub::RNUBTHREAD nubthread);

  Rtmgr::RemoteNub::NUBINT perform_absolute_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination);
  Rtmgr::RemoteNub::NUBINT perform_relative_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination);

  void recover_breakpoint(Rtmgr::RemoteNub::RNUBTHREAD thread);
  Rtmgr::RemoteNub::NUBINT get_process_wall_clock_time();

  void register_exit_process_function(Rtmgr::RemoteNub::RTARGET_ADDRESS ExitProcess);

  Rtmgr::RemoteNub::RNUB open_local_tether(const char *command, const char *args, const Rtmgr::RemoteNub::STRING_SEQ &paths, const Rtmgr::RemoteNub::STRING_SEQ &lib_paths, const char *working_directory, Rtmgr::RemoteNub::NUBINT create_shell, Rtmgr::RemoteNub::NUBINT &success);
  Rtmgr::RemoteNub::RNUB attach_local_tether(Rtmgr::RemoteNub::RNUBPROCESS process, const char *process_name, const char *process_system_id, Rtmgr::RemoteNub::RNUB process_actual_id, const Rtmgr::RemoteNub::STRING_SEQ &symbol_paths, const char *system_JIT_information, Rtmgr::RemoteNub::NUBINT &success);

  void OpenNub(Rtmgr::AccessPath_ptr access_path);
  void CloseNub();

private:
  // Make sure all instances are built on the heap by making the
  // destructor non-public
  virtual ~Rtmgr_RemoteNub_i();

  CORBA::String_var process_name_;
  CORBA::String_var remote_machine_;

  Rtmgr::AccessPath_var access_path_;

  lldb::SBDebugger debugger_;
  lldb::SBTarget target_;
  lldb::SBListener listener_;
  lldb::SBLaunchInfo launch_;

  // LLDB event dispatcher thread
  std::unique_ptr<NubEventDispatcher> dispatcher_;

  omni_mutex mutex_;
  omni_condition cond_;

  enum NubState nub_state_;

  // Stops (both real and synthetic) queued for retrieval by via
  // wait_for_stop_reason_{with,no}_timeout
  struct StopReason {
    StopReasonCode code;        // Reason for this stop event
    bool synthetic;             // True if process didn't really stop
    Rtmgr::RemoteNub::RNUB process; // Process where the stop occurred
    Rtmgr::RemoteNub::RNUBTHREAD thread; // Thread where the stop occurred
    Rtmgr::RemoteNub::RNUBLIBRARY library; // Library loaded/unloaded
    Rtmgr::RemoteNub::NUBINT datum;
    // breakpoint_id
    // NUBINT stop_reason_process_exit_code
    // NUBINT stop_reason_thread_exit_code
    // NUBINT stop_reason_violation_op
    // RTARGET_ADDRESS stop_reason_violation_address
    // RTARGET_ADDRESS stop_reason_exception_address
    // defer_continue
    // synthetic

    StopReason(StopReasonCode code, bool synthetic,
               Rtmgr::RemoteNub::RNUB process, Rtmgr::RemoteNub::RNUBTHREAD thread)
      : code(code), synthetic(synthetic),
        process(process), thread(thread),
        library(0), datum(0) {
    }
  };
  std::deque<StopReason> stop_reason_queue_;

  // Target modules, with a persistent RLIBRARY index value
  std::vector<lldb::SBModule> modules_;

  struct SymbolLookup {
    std::string name;
    Rtmgr::RemoteNub::RTARGET_ADDRESS address;
    Rtmgr::RemoteNub::RTARGET_ADDRESS debug_start;
    Rtmgr::RemoteNub::RTARGET_ADDRESS debug_end;
    Rtmgr::RemoteNub::RTARGET_ADDRESS final_address_of_definition;
    bool is_function;

    SymbolLookup(lldb::SBSymbol &symbol, lldb::SBTarget &target);
  };
  std::vector<std::vector<SymbolLookup>> lookups_;

  // The system-initialized breakpoint
  lldb::SBBreakpoint main_breakpoint_;

  std::map<lldb::addr_t, lldb::SBBreakpoint> breakpoint_map_;

  lldb::addr_t exit_process_function_;

  std::string closest_symbol_name_;

  lldb::SBValue evaluate(lldb::SBThread &thread, const char *expression,
                         bool stop_others = false);
};
