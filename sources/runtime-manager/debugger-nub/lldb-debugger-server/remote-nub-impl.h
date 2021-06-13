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

  Rtmgr::RemoteNub::NUBINT add_virtual_register(uint64_t value);

  // methods corresponding to defined IDL attributes and operations
  Rtmgr::RemoteNub::RNUB process() override;
  Rtmgr::AccessPath_ptr access_path() override;

  Rtmgr::RemoteNub::NUBINT remote_value_byte_size() override;

  Rtmgr::RemoteNub::NUBINT get_process_page_fault_count() override;

  Rtmgr::RemoteNub::NUBINT thread_os_priority(Rtmgr::RemoteNub::RNUBTHREAD nubthread) override;
  Rtmgr::RemoteNub::NUBINT get_thread_cpu_time(Rtmgr::RemoteNub::RNUBTHREAD nubthread) override;

  Rtmgr::RemoteNub::RTARGET_ADDRESS get_library_base_address(Rtmgr::RemoteNub::RNUBLIBRARY dll) override;

  void get_library_version(Rtmgr::RemoteNub::RNUBLIBRARY dll, Rtmgr::RemoteNub::NUBINT &maj, Rtmgr::RemoteNub::NUBINT &min) override;
  char *get_library_filename(Rtmgr::RemoteNub::RNUBLIBRARY dll) override;
  //char *get_library_undecorated_name(Rtmgr::RemoteNub::RNUBLIBRARY dll) override;

  char *get_register_name(Rtmgr::RemoteNub::NUB_INDEX reg) override;
  Rtmgr::RemoteNub::NUBINT get_register_enumeration_code(Rtmgr::RemoteNub::NUB_INDEX reg) override;
  void all_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last) override;
  void general_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last) override;
  void special_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last) override;
  void floating_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last) override;

  Rtmgr::RemoteNub::NUBINT page_read_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address) override;
  Rtmgr::RemoteNub::NUBINT page_write_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address) override;
  Rtmgr::RemoteNub::NUBINT page_relative_address(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT &offset) override;
  Rtmgr::RemoteNub::NUBINT virtual_page_size() override;

  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  void write_value_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS val, Rtmgr::RemoteNub::NUBINT &status) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS calculate_stack_address(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT offset) override;
  char *target_address_to_string(Rtmgr::RemoteNub::RTARGET_ADDRESS x, Rtmgr::RemoteNub::NUBINT sz, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT pad, Rtmgr::RemoteNub::NUBINT &truncated) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS string_to_target_address(Rtmgr::RemoteNub::NUBINT sz, const char *buffer, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT &overflow) override;
  Rtmgr::RemoteNub::NUBFLOAT read_single_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  void write_single_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  Rtmgr::RemoteNub::NUBDOUBLE read_double_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  void write_double_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  void read_byte_string_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, ::CORBA::String_out buffer, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  void write_byte_string_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, const char *buffer, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_register_in_stack_frame(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_INDEX frame_index, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  void write_value_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::RTARGET_ADDRESS value, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  Rtmgr::RemoteNub::NUBFLOAT read_single_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  void write_single_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  Rtmgr::RemoteNub::NUBDOUBLE read_double_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  void write_double_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR &status) override;

  void application_restart() override;
  void application_stop() override;
  void application_continue() override;
  void application_continue_unhandled() override;
  void application_step(Rtmgr::RemoteNub::NUBINT n) override;
  void application_step_over(Rtmgr::RemoteNub::NUBINT n) override;
  void application_step_out() override;

  Rtmgr::RemoteNub::NUB_ERROR set_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RTARGET_ADDRESS calling_fp, Rtmgr::RemoteNub::NUBINT location_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &locs, Rtmgr::RemoteNub::NUBINT operation) override;
  void clear_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread) override;

  void thread_stop(Rtmgr::RemoteNub::RNUBTHREAD nubthread) override;
  void thread_continue(Rtmgr::RemoteNub::RNUBTHREAD nubthread) override;
  Rtmgr::RemoteNub::NUBINT thread_suspendedQ(Rtmgr::RemoteNub::RNUBTHREAD thread) override;
  void thread_suspended(Rtmgr::RemoteNub::RNUBTHREAD thread) override;
  void thread_resumed(Rtmgr::RemoteNub::RNUBTHREAD thread) override;

  Rtmgr::RemoteNub::NUB_ERROR kill_application() override;
  void close_application() override;
  void close_remote_tether() override;

  Rtmgr::RemoteNub::RTARGET_ADDRESS setup_function_call(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &args, Rtmgr::RemoteNub::RNUBHANDLE &cx_handle) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS remote_call_spy(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &args, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS get_function_result(Rtmgr::RemoteNub::RNUBTHREAD nubthread) override;
  void restore_context(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RNUBHANDLE the_context) override;
  Rtmgr::RemoteNub::NUB_ERROR set_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address) override;
  Rtmgr::RemoteNub::NUB_ERROR clear_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address) override;
  Rtmgr::RemoteNub::NUBINT query_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address) override;
  void wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT &code) override;
  void profile_wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT profiling_interval, Rtmgr::RemoteNub::NUBINT &code) override;

  void inform_profiling_started() override;
  void inform_profiling_stopped() override;

  Rtmgr::RemoteNub::NUBINT can_receive_first_chance(Rtmgr::RemoteNub::NUBINT ecode) override;
  void set_first_chance(Rtmgr::RemoteNub::NUBINT ecode) override;
  void unset_first_chance(Rtmgr::RemoteNub::NUBINT ecode) override;
  Rtmgr::RemoteNub::NUBINT thread_stop_information(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &fchance, Rtmgr::RemoteNub::NUBINT &fstart, Rtmgr::RemoteNub::RTARGET_ADDRESS &ret_addr) override;

  void wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT &ecode) override;

  void profile_wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT profile_interval, Rtmgr::RemoteNub::NUBINT &ecode) override;

  Rtmgr::RemoteNub::RNUB stop_reason_process() override;
  Rtmgr::RemoteNub::RNUBTHREAD stop_reason_thread() override;
  Rtmgr::RemoteNub::NUBINT stop_reason_process_exit_code() override;
  Rtmgr::RemoteNub::NUBINT stop_reason_thread_exit_code() override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS stop_reason_violation_address() override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS stop_reason_exception_address() override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS stop_reason_debug_string_address() override;
  Rtmgr::RemoteNub::NUBINT stop_reason_debug_string_length() override;
  Rtmgr::RemoteNub::NUBINT stop_reason_debug_string_is_unicode() override;

  Rtmgr::RemoteNub::NUBINT first_hard_coded_breakpoint() override;
  Rtmgr::RemoteNub::RNUBLIBRARY stop_reason_library() override;
  Rtmgr::RemoteNub::NUBINT stop_reason_violation_op() override;
  Rtmgr::RemoteNub::NUBINT exception_first_chance() override;

  Rtmgr::RemoteNub::NUBINT initialize_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread) override;

  void read_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT frame_count, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out frame_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out instruction_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out return_addresses) override;
  void all_frame_lexicals(Rtmgr::RemoteNub::RTARGET_ADDRESS frame, Rtmgr::RemoteNub::RTARGET_ADDRESS ip, Rtmgr::RemoteNub::NUB_INDEX &first, Rtmgr::RemoteNub::NUB_INDEX &last, Rtmgr::RemoteNub::RNUBHANDLE &table) override;

  void register_interactive_code_segment(Rtmgr::RemoteNub::RTARGET_ADDRESS lo, Rtmgr::RemoteNub::RTARGET_ADDRESS hi) override;

  char *get_lexical_variable_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS lexical_variable_address(Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable, Rtmgr::RemoteNub::NUBINT &in_reg, Rtmgr::RemoteNub::NUB_INDEX &hireg, Rtmgr::RemoteNub::NUB_INDEX &loreg, Rtmgr::RemoteNub::NUBINT &arg) override;
  char *lookup_symbol_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_symbol_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_function_debug_start(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_function_debug_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym) override;
  Rtmgr::RemoteNub::NUBINT lookup_symbol_language(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_function_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym) override;

  Rtmgr::RemoteNub::NUBINT symbol_is_function(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym) override;

  Rtmgr::RemoteNub::NUBINT nearest_symbols(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY &lib, Rtmgr::RemoteNub::RNUBHANDLE &table) override;
  Rtmgr::RemoteNub::NUBINT closest_symbol(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY &lib, Rtmgr::RemoteNub::RTARGET_ADDRESS &actual_address, Rtmgr::RemoteNub::NUBINT &offset, Rtmgr::RemoteNub::NUBINT &name_length, Rtmgr::RemoteNub::NUBINT &type, Rtmgr::RemoteNub::NUBINT &is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_end, Rtmgr::RemoteNub::NUBINT &language, Rtmgr::RemoteNub::RTARGET_ADDRESS &final_address_of_definition) override;

  void function_bounding_addresses(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS &lower, Rtmgr::RemoteNub::RTARGET_ADDRESS &upper) override;

  char *closest_symbol_name(Rtmgr::RemoteNub::NUBINT sz) override;

  Rtmgr::RemoteNub::NUBINT find_symbol_in_library(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, Rtmgr::RemoteNub::NUBINT sz, const char *name, Rtmgr::RemoteNub::RTARGET_ADDRESS &address, Rtmgr::RemoteNub::NUBINT &type, Rtmgr::RemoteNub::NUBINT &is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS &debug_end, Rtmgr::RemoteNub::NUBINT &symbol_language, Rtmgr::RemoteNub::RTARGET_ADDRESS &final_address_of_definition) override;

  void do_symbols(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char* match, Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last, Rtmgr::RemoteNub::RNUBHANDLE& lookups) override;

  void dispose_lookups(Rtmgr::RemoteNub::RNUBHANDLE lookups) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS resolve_source_location(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char *filename, Rtmgr::RemoteNub::NUBINT line_number, Rtmgr::RemoteNub::NUBINT column_number, Rtmgr::RemoteNub::NUBINT &valid, Rtmgr::RemoteNub::NUBINT &path, Rtmgr::RemoteNub::RNUBHANDLE &search, Rtmgr::RemoteNub::NUBINT &exact) override;
  Rtmgr::RemoteNub::RNUBHANDLE fetch_source_locations(Rtmgr::RemoteNub::RTARGET_ADDRESS start_loc, Rtmgr::RemoteNub::RTARGET_ADDRESS end_loc) override;
  Rtmgr::RemoteNub::NUBINT source_location_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index) override;
  Rtmgr::RemoteNub::NUBINT source_location_linenumber(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index) override;
  char *source_location_filename(Rtmgr::RemoteNub::RNUBHANDLE table) override;
  Rtmgr::RemoteNub::NUBINT number_of_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table) override;
  void dispose_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table) override;
  void interpret_instruction_at_current_location(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &flow, Rtmgr::RemoteNub::RTARGET_ADDRESS &destination, Rtmgr::RemoteNub::NUBINT &instruction_size) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS dylan_calculate_step_into(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT &function_register_live, Rtmgr::RemoteNub::NUBINT &ok) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS dylan_thread_environment_block_address(Rtmgr::RemoteNub::RNUBTHREAD thread, Rtmgr::RemoteNub::NUBINT &valid) override;
  Rtmgr::RemoteNub::NUBINT dylan_thread_mv_buffer_live(Rtmgr::RemoteNub::RNUBTHREAD thread) override;
  Rtmgr::RemoteNub::NUBINT older_stack_frame(Rtmgr::RemoteNub::RTARGET_ADDRESS this_one, Rtmgr::RemoteNub::RTARGET_ADDRESS than_this_one) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS dylan_current_function(Rtmgr::RemoteNub::RNUBTHREAD nubthread) override;

  Rtmgr::RemoteNub::NUBINT perform_absolute_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination) override;
  Rtmgr::RemoteNub::NUBINT perform_relative_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination) override;

  void recover_breakpoint(Rtmgr::RemoteNub::RNUBTHREAD thread) override;
  Rtmgr::RemoteNub::NUBINT get_process_wall_clock_time() override;

  void register_exit_process_function(Rtmgr::RemoteNub::RTARGET_ADDRESS ExitProcess) override;

  Rtmgr::RemoteNub::RNUB open_local_tether(const char *command, const char *args, const Rtmgr::RemoteNub::STRING_SEQ &paths, const Rtmgr::RemoteNub::STRING_SEQ &lib_paths, const char *working_directory, Rtmgr::RemoteNub::NUBINT create_shell, Rtmgr::RemoteNub::NUBINT &success) override;
  Rtmgr::RemoteNub::RNUB attach_local_tether(Rtmgr::RemoteNub::RNUBPROCESS process, const char *process_name, const char *process_system_id, Rtmgr::RemoteNub::RNUB process_actual_id, const Rtmgr::RemoteNub::STRING_SEQ &symbol_paths, const char *system_JIT_information, Rtmgr::RemoteNub::NUBINT &success) override;

  void OpenNub(Rtmgr::AccessPath_ptr access_path) override;
  void CloseNub() override;

private:
  // Make sure all instances are built on the heap by making the
  // destructor non-public
  ~Rtmgr_RemoteNub_i() override = default;

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

  class Lookup {
  private:
    std::string name_;
    Rtmgr::RemoteNub::RTARGET_ADDRESS address_;
    enum {
      LOOKUP_SYMBOL_FUNCTION,   // Function returned from symbol lookup
      LOOKUP_SYMBOL_DATA,
      LOOKUP_LEXICAL_LOCATION,
      LOOKUP_LEXICAL_VALUE,
      LOOKUP_LEXICAL_UNAVAILABLE,
    } tag_;
    union {
      struct {
        Rtmgr::RemoteNub::RTARGET_ADDRESS debug_start;
        Rtmgr::RemoteNub::RTARGET_ADDRESS debug_end;
        Rtmgr::RemoteNub::RTARGET_ADDRESS final_address_of_definition;
      } function_;
      struct {
        Rtmgr::RemoteNub::NUB_INDEX virtual_reg;
        bool arg;
      } lexical_;
    };

  public:
    Lookup(lldb::SBSymbol &symbol, lldb::SBTarget &target);
    explicit Lookup(lldb::SBValue &value, Rtmgr_RemoteNub_i *nub);

    const char *name() const {
      return this->name_.c_str();
    }

    Rtmgr::RemoteNub::RTARGET_ADDRESS address() {
      return address_;
    }

    Rtmgr::RemoteNub::RTARGET_ADDRESS debug_start() {
      return
        tag_ == LOOKUP_SYMBOL_FUNCTION
        ? function_.debug_start
        : LLDB_INVALID_ADDRESS;
    }
    Rtmgr::RemoteNub::RTARGET_ADDRESS debug_end() {
      return
        tag_ == LOOKUP_SYMBOL_FUNCTION
        ? function_.debug_end

        : LLDB_INVALID_ADDRESS;
    }
    Rtmgr::RemoteNub::RTARGET_ADDRESS final_address_of_definition() {
      return
        tag_ == LOOKUP_SYMBOL_FUNCTION
        ? function_.final_address_of_definition
        : LLDB_INVALID_ADDRESS;
    }

    bool is_function() {
      return tag_ == LOOKUP_SYMBOL_FUNCTION;
    }

    Rtmgr::RemoteNub::NUB_INDEX virtual_reg() {
      return (tag_ == LOOKUP_LEXICAL_VALUE) ? lexical_.virtual_reg : 0;
    }

    bool is_arg() {
      return
        (tag_ == LOOKUP_LEXICAL_LOCATION || tag_ == LOOKUP_LEXICAL_VALUE)
        && lexical_.arg;
    }
  };
  std::vector<std::vector<Lookup>> lookups_;

  std::vector<uint64_t> virtual_register_values_;

  std::vector<std::vector<lldb::SBLineEntry>> source_locations_;

  // The system-initialized breakpoint
  lldb::SBBreakpoint main_breakpoint_;
  // Dylan thread started breakpoint
  lldb::SBBreakpoint create_thread_breakpoint_;

  enum ThreadState {
    THREAD_NEW = 0,            // New, un-notified thread
    THREAD_NOTIFIED,           // CREATE_THREAD event sent
    THREAD_MAIN,               // Main thread
    THREAD_SYSTEM,             // GC or run-time thread
  };
  std::map<lldb::tid_t, ThreadState> thread_map_;

  std::map<lldb::addr_t, lldb::SBBreakpoint> breakpoint_map_;

  lldb::addr_t exit_process_function_;

  std::string closest_symbol_name_;

  lldb::SBValue evaluate(lldb::SBThread &thread, const char *expression,
                         bool stop_others = false, bool ignore_result = false);

  void shepherd_spy_created_threads(unsigned created_thread_count);

  std::vector<std::string> register_names_;
  using register_name_index = std::vector<std::string>::size_type;
  std::pair<register_name_index, register_name_index> general_registers_;
  std::pair<register_name_index, register_name_index> special_registers_;
  std::pair<register_name_index, register_name_index> floating_registers_;

  void populate_register_group(lldb::SBValue &group);
  void ensure_register_info();
};
