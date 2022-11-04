// -*- C++ -*-

#include "remote-nub.h"
#include "NubProcess.h"

#include <memory>
#include <vector>
#include <string>

// Implements IDL interface Rtmgr::RemoteNub
class Rtmgr_RemoteNub_i : public POA_Rtmgr::RemoteNub {
public:
  // standard constructor
  Rtmgr_RemoteNub_i(const char *process_name,
                    const char *remote_machine);

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

  Rtmgr::RemoteNub::NUB_ERROR download_code
      (Rtmgr::RemoteNub::RNUBTHREAD nubthread,
       const Rtmgr::RemoteNub::CODE_SEQ &download_records,
       const char *entry_point,
       Rtmgr::RemoteNub::REGION_SEQ_out regions,
       Rtmgr::RemoteNub::NUBINT &first,
       Rtmgr::RemoteNub::NUBINT &last,
       Rtmgr::RemoteNub::RNUBHANDLE &lookups) override;

  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status) override;
  void write_value_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS val, Rtmgr::RemoteNub::NUBINT &status) override;
  Rtmgr::RemoteNub::RTARGET_ADDRESS calculate_stack_address(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT offset) override;
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

  Rtmgr::RemoteNub::NUB_ERROR set_stepping_control_on_thread
    (Rtmgr::RemoteNub::RNUBTHREAD nubthread,
     Rtmgr::RemoteNub::RTARGET_ADDRESS fp,
     Rtmgr::RemoteNub::RTARGET_ADDRESS calling_fp,
     Rtmgr::RemoteNub::NUBINT location_count,
     const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &locs,
     Rtmgr::RemoteNub::NUBINT operation) override;
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

  std::unique_ptr<NubProcess> nub_process_;
  NubProcess::StopReason stop_reason_; // FIXME
  std::vector<NubProcess::LookupSymbol> lookup_symbols_;
  std::vector<NubProcess::FrameLexical> lookup_lexicals_;
  std::vector<NubProcess::SourceLocation> source_locations_;
  std::string closest_symbol_name_;
};
