//
// Example code for implementing IDL interfaces in file ../remote-nub.idl
//

#include <iostream>
#include <remote-nub.hh>

// End of example implementation code

//
// Example class implementing IDL interface Rtmgr::RemoteNub
//
class Rtmgr_RemoteNub_i : public POA_Rtmgr::RemoteNub {
private:
  // Make sure all instances are built on the heap by making the
  // destructor non-public
  //virtual ~Rtmgr_RemoteNub_i();

public:
  // standard constructor
  Rtmgr_RemoteNub_i();
  virtual ~Rtmgr_RemoteNub_i();

  // methods corresponding to defined IDL attributes and operations
  Rtmgr::RemoteNub::RNUB process()
  Rtmgr::AccessPath_ptr access_path()
  Rtmgr::RemoteNub::RNUB create_and_debug_process(const char* command, const char* args, Rtmgr::RemoteNub::NUBINT path_count, Rtmgr::RemoteNub::NUBINT lib_count, const char* working_dir, Rtmgr::RemoteNub::NUBINT create_shell);
  Rtmgr::RemoteNub::RNUB debug_active_process(const char* process_name, const char* process_id, ::CORBA::ULong actual_process_id, Rtmgr::RemoteNub::NUBINT path_count, const char* jit_info);
  Rtmgr::RemoteNub::NUBINT remote_value_byte_size();
  Rtmgr::RemoteNub::NUBINT get_process_page_fault_count();
  Rtmgr::RemoteNub::NUBINT thread_os_priority(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  Rtmgr::RemoteNub::NUBINT get_thread_cpu_time(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  Rtmgr::RemoteNub::RTARGET_ADDRESS get_library_base_address(Rtmgr::RemoteNub::RNUBLIBRARY dll);
  void get_library_version(Rtmgr::RemoteNub::RNUBLIBRARY dll, Rtmgr::RemoteNub::NUBINT& maj, Rtmgr::RemoteNub::NUBINT& min);
  char* get_library_filename(Rtmgr::RemoteNub::RNUBLIBRARY dll);
  char* get_library_undecorated_name(Rtmgr::RemoteNub::RNUBLIBRARY dll);
  char* get_register_name(Rtmgr::RemoteNub::NUB_INDEX reg);
  Rtmgr::RemoteNub::NUBINT get_register_enumeration_code(Rtmgr::RemoteNub::NUB_INDEX reg);
  void all_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last);
  void general_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last);
  void special_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last);
  void floating_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last);
  Rtmgr::RemoteNub::NUBINT page_read_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  Rtmgr::RemoteNub::NUBINT page_write_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  Rtmgr::RemoteNub::NUBINT page_relative_address(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT& offset);
  Rtmgr::RemoteNub::NUBINT virtual_page_size();
  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR& status);
  void write_value_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS val, Rtmgr::RemoteNub::NUBINT& status);
  Rtmgr::RemoteNub::RTARGET_ADDRESS calculate_stack_address(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT offset);
  char* target_address_to_string(Rtmgr::RemoteNub::RTARGET_ADDRESS x, Rtmgr::RemoteNub::NUBINT sz, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT pad, Rtmgr::RemoteNub::NUBINT& truncated);
  Rtmgr::RemoteNub::RTARGET_ADDRESS string_to_target_address(Rtmgr::RemoteNub::NUBINT sz, const char* buffer, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT& overflow);
  Rtmgr::RemoteNub::NUBFLOAT read_single_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR& status);
  void write_single_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR& status);
  Rtmgr::RemoteNub::NUBDOUBLE read_double_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR& status);
  void write_double_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR& status);
  void read_byte_string_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, ::CORBA::String_out buffer, Rtmgr::RemoteNub::NUB_ERROR& status);
  void write_byte_string_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, const char* buffer, Rtmgr::RemoteNub::NUB_ERROR& status);
  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_register_in_stack_frame(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_INDEX frame_index, Rtmgr::RemoteNub::NUB_ERROR& status);
  Rtmgr::RemoteNub::RTARGET_ADDRESS read_value_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR& status);
  void write_value_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::RTARGET_ADDRESS value, Rtmgr::RemoteNub::NUB_ERROR& status);
  Rtmgr::RemoteNub::NUBFLOAT read_single_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR& status);
  void write_single_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR& status);
  Rtmgr::RemoteNub::NUBDOUBLE read_double_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR& status);
  void write_double_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR& status);
  void application_restart();
  void application_stop();
  void application_continue();
  void application_continue_unhandled();
  void application_step(Rtmgr::RemoteNub::NUBINT n);
  void application_step_over(Rtmgr::RemoteNub::NUBINT n);
  void application_step_out();
  Rtmgr::RemoteNub::NUB_ERROR set_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RTARGET_ADDRESS calling_fp, Rtmgr::RemoteNub::NUBINT location_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ& locs, Rtmgr::RemoteNub::NUBINT operation);
  void clear_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  void thread_stop(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  void thread_continue(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  Rtmgr::RemoteNub::NUBINT thread_suspendedQ(Rtmgr::RemoteNub::RNUBTHREAD thread);
  void thread_suspended(Rtmgr::RemoteNub::RNUBTHREAD thread);
  void thread_resumed(Rtmgr::RemoteNub::RNUBTHREAD thread);
  Rtmgr::RemoteNub::NUB_ERROR kill_application();
  void close_application();
  void close_remote_tether();
  Rtmgr::RemoteNub::RTARGET_ADDRESS setup_function_call(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ& args, Rtmgr::RemoteNub::RNUBHANDLE& cx_handle);
  Rtmgr::RemoteNub::RTARGET_ADDRESS remote_call_spy(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ& args, Rtmgr::RemoteNub::NUB_ERROR& status);
  Rtmgr::RemoteNub::RTARGET_ADDRESS get_function_result(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  void restore_context(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RNUBHANDLE the_context);
  Rtmgr::RemoteNub::NUB_ERROR set_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  Rtmgr::RemoteNub::NUB_ERROR clear_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  Rtmgr::RemoteNub::NUBINT query_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address);
  void wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT& code);
  void profile_wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT profiling_interval, Rtmgr::RemoteNub::NUBINT& code);
  void inform_profiling_started();
  void inform_profiling_stopped();
  Rtmgr::RemoteNub::NUBINT can_receive_first_chance(Rtmgr::RemoteNub::NUBINT ecode);
  void set_first_chance(Rtmgr::RemoteNub::NUBINT ecode);
  void unset_first_chance(Rtmgr::RemoteNub::NUBINT ecode);
  Rtmgr::RemoteNub::NUBINT thread_stop_information(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT& fchance, Rtmgr::RemoteNub::NUBINT& fstart, Rtmgr::RemoteNub::RTARGET_ADDRESS& ret_addr);
  void wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT& ecode);
  void profile_wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT profile_interval, Rtmgr::RemoteNub::NUBINT& ecode);
  Rtmgr::RemoteNub::RNUB stop_reason_process();
  Rtmgr::RemoteNub::RNUBTHREAD stop_reason_thread();
  Rtmgr::RemoteNub::NUBINT first_hard_coded_breakpoint();
  Rtmgr::RemoteNub::NUBINT stop_reason_process_exit_code();
  Rtmgr::RemoteNub::NUBINT stop_reason_thread_exit_code();
  Rtmgr::RemoteNub::RNUBLIBRARY stop_reason_library();
  Rtmgr::RemoteNub::NUBINT stop_reason_violation_op();
  Rtmgr::RemoteNub::NUBINT exception_first_chance();
  Rtmgr::RemoteNub::RTARGET_ADDRESS stop_reason_violation_address();
  Rtmgr::RemoteNub::RTARGET_ADDRESS stop_reason_exception_address();
  Rtmgr::RemoteNub::RTARGET_ADDRESS stop_reason_debug_string_address();
  Rtmgr::RemoteNub::NUBINT stop_reason_debug_string_length();
  Rtmgr::RemoteNub::NUBINT stop_reason_debug_string_is_unicode();
  Rtmgr::RemoteNub::NUBINT initialize_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  void read_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT frame_count, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out frame_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out instruction_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out return_addresses);
  void all_frame_lexicals(Rtmgr::RemoteNub::RTARGET_ADDRESS frame, Rtmgr::RemoteNub::RTARGET_ADDRESS ip, Rtmgr::RemoteNub::NUB_INDEX& first, Rtmgr::RemoteNub::NUB_INDEX& last, Rtmgr::RemoteNub::RNUBHANDLE& table);
  void register_interactive_code_segment(Rtmgr::RemoteNub::RTARGET_ADDRESS lo, Rtmgr::RemoteNub::RTARGET_ADDRESS hi);
  char* get_lexical_variable_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lexical_variable_address(Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable, Rtmgr::RemoteNub::NUBINT& in_reg, Rtmgr::RemoteNub::NUB_INDEX& hireg, Rtmgr::RemoteNub::NUB_INDEX& loreg, Rtmgr::RemoteNub::NUBINT& arg);
  char* lookup_symbol_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_symbol_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_function_debug_start(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_function_debug_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::NUBINT lookup_symbol_language(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::RTARGET_ADDRESS lookup_function_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::NUBINT symbol_is_function(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym);
  Rtmgr::RemoteNub::NUBINT nearest_symbols(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY& lib, Rtmgr::RemoteNub::RNUBHANDLE& table);
  Rtmgr::RemoteNub::NUBINT closest_symbol(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY& lib, Rtmgr::RemoteNub::RTARGET_ADDRESS& actual_address, Rtmgr::RemoteNub::NUBINT& offset, Rtmgr::RemoteNub::NUBINT& name_length, Rtmgr::RemoteNub::NUBINT& type, Rtmgr::RemoteNub::NUBINT& is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_end, Rtmgr::RemoteNub::NUBINT& language, Rtmgr::RemoteNub::RTARGET_ADDRESS& final_address_of_definition);
  void function_bounding_addresses(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS& lower, Rtmgr::RemoteNub::RTARGET_ADDRESS& upper);
  char* closest_symbol_name(Rtmgr::RemoteNub::NUBINT sz);
  Rtmgr::RemoteNub::NUBINT find_symbol_in_library(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, Rtmgr::RemoteNub::NUBINT sz, const char* name, Rtmgr::RemoteNub::RTARGET_ADDRESS& address, Rtmgr::RemoteNub::NUBINT& type, Rtmgr::RemoteNub::NUBINT& is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_end, Rtmgr::RemoteNub::NUBINT& symbol_language, Rtmgr::RemoteNub::RTARGET_ADDRESS& final_address_of_definition);
  void dispose_lookups(Rtmgr::RemoteNub::RNUBHANDLE lookups);
  Rtmgr::RemoteNub::RTARGET_ADDRESS resolve_source_location(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char* filename, Rtmgr::RemoteNub::NUBINT line_number, Rtmgr::RemoteNub::NUBINT column_number, Rtmgr::RemoteNub::NUBINT& valid, Rtmgr::RemoteNub::NUBINT& path, Rtmgr::RemoteNub::RNUBHANDLE& search, Rtmgr::RemoteNub::NUBINT& exact);
  Rtmgr::RemoteNub::RNUBHANDLE fetch_source_locations(Rtmgr::RemoteNub::RTARGET_ADDRESS start_loc, Rtmgr::RemoteNub::RTARGET_ADDRESS end_loc);
  Rtmgr::RemoteNub::NUBINT source_location_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index);
  Rtmgr::RemoteNub::NUBINT source_location_linenumber(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index);
  char* source_location_filename(Rtmgr::RemoteNub::RNUBHANDLE table);
  Rtmgr::RemoteNub::NUBINT number_of_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table);
  void dispose_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table);
  void interpret_instruction_at_current_location(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT& flow, Rtmgr::RemoteNub::RTARGET_ADDRESS& destination, Rtmgr::RemoteNub::NUBINT& instruction_size);
  Rtmgr::RemoteNub::RTARGET_ADDRESS dylan_calculate_step_into(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT& function_register_live, Rtmgr::RemoteNub::NUBINT& ok);
  Rtmgr::RemoteNub::RTARGET_ADDRESS dylan_thread_environment_block_address(Rtmgr::RemoteNub::RNUBTHREAD thread, Rtmgr::RemoteNub::NUBINT& valid);
  Rtmgr::RemoteNub::NUBINT dylan_thread_mv_buffer_live(Rtmgr::RemoteNub::RNUBTHREAD thread);
  Rtmgr::RemoteNub::NUBINT older_stack_frame(Rtmgr::RemoteNub::RTARGET_ADDRESS this_one, Rtmgr::RemoteNub::RTARGET_ADDRESS than_this_one);
  Rtmgr::RemoteNub::RTARGET_ADDRESS dylan_current_function(Rtmgr::RemoteNub::RNUBTHREAD nubthread);
  Rtmgr::RemoteNub::NUBINT perform_absolute_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination);
  Rtmgr::RemoteNub::NUBINT perform_relative_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination);
  void recover_breakpoint(Rtmgr::RemoteNub::RNUBTHREAD thread);
  Rtmgr::RemoteNub::NUBINT get_process_wall_clock_time();
  void register_exit_process_function(Rtmgr::RemoteNub::RTARGET_ADDRESS ExitProcess);
  Rtmgr::RemoteNub::RNUB open_local_tether(const char* command, const char* args, const Rtmgr::RemoteNub::STRING_SEQ& paths, const Rtmgr::RemoteNub::STRING_SEQ& lib_paths, const char* working_directory, Rtmgr::RemoteNub::NUBINT create_shell, Rtmgr::RemoteNub::NUBINT& success);
  Rtmgr::RemoteNub::RNUB attach_local_tether(Rtmgr::RemoteNub::RNUBPROCESS process, const char* process_name, const char* process_system_id, Rtmgr::RemoteNub::RNUB process_actual_id, const Rtmgr::RemoteNub::STRING_SEQ& symbol_paths, const char* system_JIT_information, Rtmgr::RemoteNub::NUBINT& success);
  void OpenNub(Rtmgr::AccessPath_ptr access_path);
  void CloseNub();
};

//
// Example implementation code for IDL interface 'Rtmgr::RemoteNub'
//
Rtmgr_RemoteNub_i::Rtmgr_RemoteNub_i(){
  // add extra constructor code here
}
Rtmgr_RemoteNub_i::~Rtmgr_RemoteNub_i(){
  // add extra destructor code here
}

// Methods corresponding to IDL attributes and operations
Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::process()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::process()>"
}

Rtmgr::AccessPath_ptr Rtmgr_RemoteNub_i::access_path()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::AccessPath_ptr Rtmgr_RemoteNub_i::access_path()>"
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::create_and_debug_process(const char* command, const char* args, Rtmgr::RemoteNub::NUBINT path_count, Rtmgr::RemoteNub::NUBINT lib_count, const char* working_dir, Rtmgr::RemoteNub::NUBINT create_shell)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::create_and_debug_process(const char* command, const char* args, Rtmgr::RemoteNub::NUBINT path_count, Rtmgr::RemoteNub::NUBINT lib_count, const char* working_dir, Rtmgr::RemoteNub::NUBINT create_shell)>"
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::debug_active_process(const char* process_name, const char* process_id, ::CORBA::ULong actual_process_id, Rtmgr::RemoteNub::NUBINT path_count, const char* jit_info)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::debug_active_process(const char* process_name, const char* process_id, ::CORBA::ULong actual_process_id, Rtmgr::RemoteNub::NUBINT path_count, const char* jit_info)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::remote_value_byte_size()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::remote_value_byte_size()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_process_page_fault_count()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_process_page_fault_count()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_os_priority(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_os_priority(Rtmgr::RemoteNub::RNUBTHREAD nubthread)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_thread_cpu_time(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_thread_cpu_time(Rtmgr::RemoteNub::RNUBTHREAD nubthread)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::get_library_base_address(Rtmgr::RemoteNub::RNUBLIBRARY dll)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::get_library_base_address(Rtmgr::RemoteNub::RNUBLIBRARY dll)>"
}

void Rtmgr_RemoteNub_i::get_library_version(Rtmgr::RemoteNub::RNUBLIBRARY dll, Rtmgr::RemoteNub::NUBINT& maj, Rtmgr::RemoteNub::NUBINT& min)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::get_library_version(Rtmgr::RemoteNub::RNUBLIBRARY dll, Rtmgr::RemoteNub::NUBINT& maj, Rtmgr::RemoteNub::NUBINT& min)>"
}

char* Rtmgr_RemoteNub_i::get_library_filename(Rtmgr::RemoteNub::RNUBLIBRARY dll)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_RemoteNub_i::get_library_filename(Rtmgr::RemoteNub::RNUBLIBRARY dll)>"
}

char* Rtmgr_RemoteNub_i::get_library_undecorated_name(Rtmgr::RemoteNub::RNUBLIBRARY dll)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_RemoteNub_i::get_library_undecorated_name(Rtmgr::RemoteNub::RNUBLIBRARY dll)>"
}

char* Rtmgr_RemoteNub_i::get_register_name(Rtmgr::RemoteNub::NUB_INDEX reg)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_RemoteNub_i::get_register_name(Rtmgr::RemoteNub::NUB_INDEX reg)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_register_enumeration_code(Rtmgr::RemoteNub::NUB_INDEX reg)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_register_enumeration_code(Rtmgr::RemoteNub::NUB_INDEX reg)>"
}

void Rtmgr_RemoteNub_i::all_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::all_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last)>"
}

void Rtmgr_RemoteNub_i::general_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::general_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last)>"
}

void Rtmgr_RemoteNub_i::special_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::special_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last)>"
}

void Rtmgr_RemoteNub_i::floating_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::floating_registers(Rtmgr::RemoteNub::NUBINT& first, Rtmgr::RemoteNub::NUBINT& last)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_read_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_read_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_write_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_write_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_relative_address(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT& offset)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_relative_address(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT& offset)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::virtual_page_size()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::virtual_page_size()>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

void Rtmgr_RemoteNub_i::write_value_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS val, Rtmgr::RemoteNub::NUBINT& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::write_value_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS val, Rtmgr::RemoteNub::NUBINT& status)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::calculate_stack_address(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT offset)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::calculate_stack_address(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT offset)>"
}

char* Rtmgr_RemoteNub_i::target_address_to_string(Rtmgr::RemoteNub::RTARGET_ADDRESS x, Rtmgr::RemoteNub::NUBINT sz, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT pad, Rtmgr::RemoteNub::NUBINT& truncated)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_RemoteNub_i::target_address_to_string(Rtmgr::RemoteNub::RTARGET_ADDRESS x, Rtmgr::RemoteNub::NUBINT sz, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT pad, Rtmgr::RemoteNub::NUBINT& truncated)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::string_to_target_address(Rtmgr::RemoteNub::NUBINT sz, const char* buffer, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT& overflow)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::string_to_target_address(Rtmgr::RemoteNub::NUBINT sz, const char* buffer, Rtmgr::RemoteNub::NUBINT radix, Rtmgr::RemoteNub::NUBINT& overflow)>"
}

Rtmgr::RemoteNub::NUBFLOAT Rtmgr_RemoteNub_i::read_single_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBFLOAT Rtmgr_RemoteNub_i::read_single_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

void Rtmgr_RemoteNub_i::write_single_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::write_single_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

Rtmgr::RemoteNub::NUBDOUBLE Rtmgr_RemoteNub_i::read_double_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBDOUBLE Rtmgr_RemoteNub_i::read_double_float_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

void Rtmgr_RemoteNub_i::write_double_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::write_double_float_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

void Rtmgr_RemoteNub_i::read_byte_string_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, ::CORBA::String_out buffer, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::read_byte_string_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, ::CORBA::String_out buffer, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

void Rtmgr_RemoteNub_i::write_byte_string_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, const char* buffer, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::write_byte_string_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, const char* buffer, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_register_in_stack_frame(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_INDEX frame_index, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_register_in_stack_frame(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_INDEX frame_index, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

void Rtmgr_RemoteNub_i::write_value_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::RTARGET_ADDRESS value, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::write_value_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::RTARGET_ADDRESS value, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

Rtmgr::RemoteNub::NUBFLOAT Rtmgr_RemoteNub_i::read_single_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBFLOAT Rtmgr_RemoteNub_i::read_single_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

void Rtmgr_RemoteNub_i::write_single_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::write_single_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBFLOAT value, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

Rtmgr::RemoteNub::NUBDOUBLE Rtmgr_RemoteNub_i::read_double_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBDOUBLE Rtmgr_RemoteNub_i::read_double_float_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

void Rtmgr_RemoteNub_i::write_double_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::write_double_float_to_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUBDOUBLE value, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

void Rtmgr_RemoteNub_i::application_restart()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::application_restart()>"
}

void Rtmgr_RemoteNub_i::application_stop()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::application_stop()>"
}

void Rtmgr_RemoteNub_i::application_continue()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::application_continue()>"
}

void Rtmgr_RemoteNub_i::application_continue_unhandled()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::application_continue_unhandled()>"
}

void Rtmgr_RemoteNub_i::application_step(Rtmgr::RemoteNub::NUBINT n)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::application_step(Rtmgr::RemoteNub::NUBINT n)>"
}

void Rtmgr_RemoteNub_i::application_step_over(Rtmgr::RemoteNub::NUBINT n)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::application_step_over(Rtmgr::RemoteNub::NUBINT n)>"
}

void Rtmgr_RemoteNub_i::application_step_out()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::application_step_out()>"
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::set_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RTARGET_ADDRESS calling_fp, Rtmgr::RemoteNub::NUBINT location_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ& locs, Rtmgr::RemoteNub::NUBINT operation)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::set_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RTARGET_ADDRESS calling_fp, Rtmgr::RemoteNub::NUBINT location_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ& locs, Rtmgr::RemoteNub::NUBINT operation)>"
}

void Rtmgr_RemoteNub_i::clear_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::clear_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread)>"
}

void Rtmgr_RemoteNub_i::thread_stop(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::thread_stop(Rtmgr::RemoteNub::RNUBTHREAD nubthread)>"
}

void Rtmgr_RemoteNub_i::thread_continue(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::thread_continue(Rtmgr::RemoteNub::RNUBTHREAD nubthread)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_suspendedQ(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_suspendedQ(Rtmgr::RemoteNub::RNUBTHREAD thread)>"
}

void Rtmgr_RemoteNub_i::thread_suspended(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::thread_suspended(Rtmgr::RemoteNub::RNUBTHREAD thread)>"
}

void Rtmgr_RemoteNub_i::thread_resumed(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::thread_resumed(Rtmgr::RemoteNub::RNUBTHREAD thread)>"
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::kill_application()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::kill_application()>"
}

void Rtmgr_RemoteNub_i::close_application()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::close_application()>"
}

void Rtmgr_RemoteNub_i::close_remote_tether()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::close_remote_tether()>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::setup_function_call(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ& args, Rtmgr::RemoteNub::RNUBHANDLE& cx_handle)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::setup_function_call(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ& args, Rtmgr::RemoteNub::RNUBHANDLE& cx_handle)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::remote_call_spy(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ& args, Rtmgr::RemoteNub::NUB_ERROR& status)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::remote_call_spy(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RTARGET_ADDRESS func, Rtmgr::RemoteNub::NUBINT arg_count, const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ& args, Rtmgr::RemoteNub::NUB_ERROR& status)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::get_function_result(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::get_function_result(Rtmgr::RemoteNub::RNUBTHREAD nubthread)>"
}

void Rtmgr_RemoteNub_i::restore_context(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RNUBHANDLE the_context)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::restore_context(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RNUBHANDLE the_context)>"
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::set_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::set_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)>"
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::clear_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::clear_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::query_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::query_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)>"
}

void Rtmgr_RemoteNub_i::wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT& code)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT& code)>"
}

void Rtmgr_RemoteNub_i::profile_wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT profiling_interval, Rtmgr::RemoteNub::NUBINT& code)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::profile_wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout, Rtmgr::RemoteNub::NUBINT profiling_interval, Rtmgr::RemoteNub::NUBINT& code)>"
}

void Rtmgr_RemoteNub_i::inform_profiling_started()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::inform_profiling_started()>"
}

void Rtmgr_RemoteNub_i::inform_profiling_stopped()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::inform_profiling_stopped()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::can_receive_first_chance(Rtmgr::RemoteNub::NUBINT ecode)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::can_receive_first_chance(Rtmgr::RemoteNub::NUBINT ecode)>"
}

void Rtmgr_RemoteNub_i::set_first_chance(Rtmgr::RemoteNub::NUBINT ecode)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::set_first_chance(Rtmgr::RemoteNub::NUBINT ecode)>"
}

void Rtmgr_RemoteNub_i::unset_first_chance(Rtmgr::RemoteNub::NUBINT ecode)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::unset_first_chance(Rtmgr::RemoteNub::NUBINT ecode)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_stop_information(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT& fchance, Rtmgr::RemoteNub::NUBINT& fstart, Rtmgr::RemoteNub::RTARGET_ADDRESS& ret_addr)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_stop_information(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT& fchance, Rtmgr::RemoteNub::NUBINT& fstart, Rtmgr::RemoteNub::RTARGET_ADDRESS& ret_addr)>"
}

void Rtmgr_RemoteNub_i::wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT& ecode)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT& ecode)>"
}

void Rtmgr_RemoteNub_i::profile_wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT profile_interval, Rtmgr::RemoteNub::NUBINT& ecode)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::profile_wait_for_stop_reason_no_timeout(Rtmgr::RemoteNub::NUBINT profile_interval, Rtmgr::RemoteNub::NUBINT& ecode)>"
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::stop_reason_process()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::stop_reason_process()>"
}

Rtmgr::RemoteNub::RNUBTHREAD Rtmgr_RemoteNub_i::stop_reason_thread()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RNUBTHREAD Rtmgr_RemoteNub_i::stop_reason_thread()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::first_hard_coded_breakpoint()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::first_hard_coded_breakpoint()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_process_exit_code()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_process_exit_code()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_thread_exit_code()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_thread_exit_code()>"
}

Rtmgr::RemoteNub::RNUBLIBRARY Rtmgr_RemoteNub_i::stop_reason_library()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RNUBLIBRARY Rtmgr_RemoteNub_i::stop_reason_library()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_violation_op()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_violation_op()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::exception_first_chance()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::exception_first_chance()>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_violation_address()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_violation_address()>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_exception_address()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_exception_address()>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_debug_string_address()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_debug_string_address()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_debug_string_length()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_debug_string_length()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_debug_string_is_unicode()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_debug_string_is_unicode()>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::initialize_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::initialize_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread)>"
}

void Rtmgr_RemoteNub_i::read_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT frame_count, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out frame_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out instruction_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out return_addresses)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::read_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT frame_count, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out frame_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out instruction_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out return_addresses)>"
}

void Rtmgr_RemoteNub_i::all_frame_lexicals(Rtmgr::RemoteNub::RTARGET_ADDRESS frame, Rtmgr::RemoteNub::RTARGET_ADDRESS ip, Rtmgr::RemoteNub::NUB_INDEX& first, Rtmgr::RemoteNub::NUB_INDEX& last, Rtmgr::RemoteNub::RNUBHANDLE& table)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::all_frame_lexicals(Rtmgr::RemoteNub::RTARGET_ADDRESS frame, Rtmgr::RemoteNub::RTARGET_ADDRESS ip, Rtmgr::RemoteNub::NUB_INDEX& first, Rtmgr::RemoteNub::NUB_INDEX& last, Rtmgr::RemoteNub::RNUBHANDLE& table)>"
}

void Rtmgr_RemoteNub_i::register_interactive_code_segment(Rtmgr::RemoteNub::RTARGET_ADDRESS lo, Rtmgr::RemoteNub::RTARGET_ADDRESS hi)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::register_interactive_code_segment(Rtmgr::RemoteNub::RTARGET_ADDRESS lo, Rtmgr::RemoteNub::RTARGET_ADDRESS hi)>"
}

char* Rtmgr_RemoteNub_i::get_lexical_variable_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_RemoteNub_i::get_lexical_variable_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lexical_variable_address(Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable, Rtmgr::RemoteNub::NUBINT& in_reg, Rtmgr::RemoteNub::NUB_INDEX& hireg, Rtmgr::RemoteNub::NUB_INDEX& loreg, Rtmgr::RemoteNub::NUBINT& arg)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lexical_variable_address(Rtmgr::RemoteNub::RTARGET_ADDRESS fp, Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable, Rtmgr::RemoteNub::NUBINT& in_reg, Rtmgr::RemoteNub::NUB_INDEX& hireg, Rtmgr::RemoteNub::NUB_INDEX& loreg, Rtmgr::RemoteNub::NUBINT& arg)>"
}

char* Rtmgr_RemoteNub_i::lookup_symbol_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_RemoteNub_i::lookup_symbol_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_symbol_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_symbol_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_start(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_start(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::lookup_symbol_language(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::lookup_symbol_language(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::symbol_is_function(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::symbol_is_function(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::nearest_symbols(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY& lib, Rtmgr::RemoteNub::RNUBHANDLE& table)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::nearest_symbols(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY& lib, Rtmgr::RemoteNub::RNUBHANDLE& table)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::closest_symbol(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY& lib, Rtmgr::RemoteNub::RTARGET_ADDRESS& actual_address, Rtmgr::RemoteNub::NUBINT& offset, Rtmgr::RemoteNub::NUBINT& name_length, Rtmgr::RemoteNub::NUBINT& type, Rtmgr::RemoteNub::NUBINT& is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_end, Rtmgr::RemoteNub::NUBINT& language, Rtmgr::RemoteNub::RTARGET_ADDRESS& final_address_of_definition)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::closest_symbol(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RNUBLIBRARY& lib, Rtmgr::RemoteNub::RTARGET_ADDRESS& actual_address, Rtmgr::RemoteNub::NUBINT& offset, Rtmgr::RemoteNub::NUBINT& name_length, Rtmgr::RemoteNub::NUBINT& type, Rtmgr::RemoteNub::NUBINT& is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_end, Rtmgr::RemoteNub::NUBINT& language, Rtmgr::RemoteNub::RTARGET_ADDRESS& final_address_of_definition)>"
}

void Rtmgr_RemoteNub_i::function_bounding_addresses(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS& lower, Rtmgr::RemoteNub::RTARGET_ADDRESS& upper)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::function_bounding_addresses(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS& lower, Rtmgr::RemoteNub::RTARGET_ADDRESS& upper)>"
}

char* Rtmgr_RemoteNub_i::closest_symbol_name(Rtmgr::RemoteNub::NUBINT sz)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_RemoteNub_i::closest_symbol_name(Rtmgr::RemoteNub::NUBINT sz)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::find_symbol_in_library(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, Rtmgr::RemoteNub::NUBINT sz, const char* name, Rtmgr::RemoteNub::RTARGET_ADDRESS& address, Rtmgr::RemoteNub::NUBINT& type, Rtmgr::RemoteNub::NUBINT& is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_end, Rtmgr::RemoteNub::NUBINT& symbol_language, Rtmgr::RemoteNub::RTARGET_ADDRESS& final_address_of_definition)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::find_symbol_in_library(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, Rtmgr::RemoteNub::NUBINT sz, const char* name, Rtmgr::RemoteNub::RTARGET_ADDRESS& address, Rtmgr::RemoteNub::NUBINT& type, Rtmgr::RemoteNub::NUBINT& is_function, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_start, Rtmgr::RemoteNub::RTARGET_ADDRESS& debug_end, Rtmgr::RemoteNub::NUBINT& symbol_language, Rtmgr::RemoteNub::RTARGET_ADDRESS& final_address_of_definition)>"
}

void Rtmgr_RemoteNub_i::dispose_lookups(Rtmgr::RemoteNub::RNUBHANDLE lookups)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::dispose_lookups(Rtmgr::RemoteNub::RNUBHANDLE lookups)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::resolve_source_location(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char* filename, Rtmgr::RemoteNub::NUBINT line_number, Rtmgr::RemoteNub::NUBINT column_number, Rtmgr::RemoteNub::NUBINT& valid, Rtmgr::RemoteNub::NUBINT& path, Rtmgr::RemoteNub::RNUBHANDLE& search, Rtmgr::RemoteNub::NUBINT& exact)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::resolve_source_location(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary, const char* filename, Rtmgr::RemoteNub::NUBINT line_number, Rtmgr::RemoteNub::NUBINT column_number, Rtmgr::RemoteNub::NUBINT& valid, Rtmgr::RemoteNub::NUBINT& path, Rtmgr::RemoteNub::RNUBHANDLE& search, Rtmgr::RemoteNub::NUBINT& exact)>"
}

Rtmgr::RemoteNub::RNUBHANDLE Rtmgr_RemoteNub_i::fetch_source_locations(Rtmgr::RemoteNub::RTARGET_ADDRESS start_loc, Rtmgr::RemoteNub::RTARGET_ADDRESS end_loc)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RNUBHANDLE Rtmgr_RemoteNub_i::fetch_source_locations(Rtmgr::RemoteNub::RTARGET_ADDRESS start_loc, Rtmgr::RemoteNub::RTARGET_ADDRESS end_loc)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::source_location_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::source_location_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::source_location_linenumber(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::source_location_linenumber(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index)>"
}

char* Rtmgr_RemoteNub_i::source_location_filename(Rtmgr::RemoteNub::RNUBHANDLE table)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_RemoteNub_i::source_location_filename(Rtmgr::RemoteNub::RNUBHANDLE table)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::number_of_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::number_of_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table)>"
}

void Rtmgr_RemoteNub_i::dispose_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::dispose_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table)>"
}

void Rtmgr_RemoteNub_i::interpret_instruction_at_current_location(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT& flow, Rtmgr::RemoteNub::RTARGET_ADDRESS& destination, Rtmgr::RemoteNub::NUBINT& instruction_size)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::interpret_instruction_at_current_location(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT& flow, Rtmgr::RemoteNub::RTARGET_ADDRESS& destination, Rtmgr::RemoteNub::NUBINT& instruction_size)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_calculate_step_into(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT& function_register_live, Rtmgr::RemoteNub::NUBINT& ok)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_calculate_step_into(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT& function_register_live, Rtmgr::RemoteNub::NUBINT& ok)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_thread_environment_block_address(Rtmgr::RemoteNub::RNUBTHREAD thread, Rtmgr::RemoteNub::NUBINT& valid)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_thread_environment_block_address(Rtmgr::RemoteNub::RNUBTHREAD thread, Rtmgr::RemoteNub::NUBINT& valid)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::dylan_thread_mv_buffer_live(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::dylan_thread_mv_buffer_live(Rtmgr::RemoteNub::RNUBTHREAD thread)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::older_stack_frame(Rtmgr::RemoteNub::RTARGET_ADDRESS this_one, Rtmgr::RemoteNub::RTARGET_ADDRESS than_this_one)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::older_stack_frame(Rtmgr::RemoteNub::RTARGET_ADDRESS this_one, Rtmgr::RemoteNub::RTARGET_ADDRESS than_this_one)>"
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_current_function(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::dylan_current_function(Rtmgr::RemoteNub::RNUBTHREAD nubthread)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::perform_absolute_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::perform_absolute_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::perform_relative_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::perform_relative_relocation(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS destination)>"
}

void Rtmgr_RemoteNub_i::recover_breakpoint(Rtmgr::RemoteNub::RNUBTHREAD thread)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::recover_breakpoint(Rtmgr::RemoteNub::RNUBTHREAD thread)>"
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_process_wall_clock_time()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_process_wall_clock_time()>"
}

void Rtmgr_RemoteNub_i::register_exit_process_function(Rtmgr::RemoteNub::RTARGET_ADDRESS ExitProcess)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::register_exit_process_function(Rtmgr::RemoteNub::RTARGET_ADDRESS ExitProcess)>"
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::open_local_tether(const char* command, const char* args, const Rtmgr::RemoteNub::STRING_SEQ& paths, const Rtmgr::RemoteNub::STRING_SEQ& lib_paths, const char* working_directory, Rtmgr::RemoteNub::NUBINT create_shell, Rtmgr::RemoteNub::NUBINT& success)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::open_local_tether(const char* command, const char* args, const Rtmgr::RemoteNub::STRING_SEQ& paths, const Rtmgr::RemoteNub::STRING_SEQ& lib_paths, const char* working_directory, Rtmgr::RemoteNub::NUBINT create_shell, Rtmgr::RemoteNub::NUBINT& success)>"
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::attach_local_tether(Rtmgr::RemoteNub::RNUBPROCESS process, const char* process_name, const char* process_system_id, Rtmgr::RemoteNub::RNUB process_actual_id, const Rtmgr::RemoteNub::STRING_SEQ& symbol_paths, const char* system_JIT_information, Rtmgr::RemoteNub::NUBINT& success)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::attach_local_tether(Rtmgr::RemoteNub::RNUBPROCESS process, const char* process_name, const char* process_system_id, Rtmgr::RemoteNub::RNUB process_actual_id, const Rtmgr::RemoteNub::STRING_SEQ& symbol_paths, const char* system_JIT_information, Rtmgr::RemoteNub::NUBINT& success)>"
}

void Rtmgr_RemoteNub_i::OpenNub(Rtmgr::AccessPath_ptr access_path)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::OpenNub(Rtmgr::AccessPath_ptr access_path)>"
}

void Rtmgr_RemoteNub_i::CloseNub()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_RemoteNub_i::CloseNub()>"
}



// End of example implementation code

//
// Example class implementing IDL interface Rtmgr::NubServer
//
class Rtmgr_NubServer_i : public POA_Rtmgr::NubServer {
private:
  // Make sure all instances are built on the heap by making the
  // destructor non-public
  //virtual ~Rtmgr_NubServer_i();

public:
  // standard constructor
  Rtmgr_NubServer_i();
  virtual ~Rtmgr_NubServer_i();

  // methods corresponding to defined IDL attributes and operations
  Rtmgr::NubServer::RemoteNub_SEQ* nubs()
  Rtmgr::RemoteNub_ptr CreateNub(const char* process_name, const char* remote_machine);
  void DestroyNub(Rtmgr::RemoteNub_ptr nub);
  void RegisterNub(Rtmgr::RemoteNub_ptr nub, const char* process_name, const char* process_id, const char* remote_machine);
  void DeregisterNub(Rtmgr::RemoteNub_ptr nub);
  void ShutdownServer();
  char* get_local_hostname();
  Rtmgr::NubServer::NUBINT verify_local_password(const char* password, const char* remote_machine);
  Rtmgr::NubServer::NUBINT update_local_process_list();
  Rtmgr::NubServer::RNUBPROCESS local_process_nub_descriptor(Rtmgr::NubServer::NUB_INDEX i);
  Rtmgr::NubServer::NUBINT local_process_identifier(Rtmgr::NubServer::RNUBPROCESS nubprocess);
  char* local_process_name(Rtmgr::NubServer::NUB_INDEX i);
  char* local_process_system_identifier(Rtmgr::NubServer::NUB_INDEX i);
  Rtmgr::NubServer::RNUB local_process_actual_identifier(Rtmgr::NubServer::NUB_INDEX i);
};

//
// Example implementation code for IDL interface 'Rtmgr::NubServer'
//
Rtmgr_NubServer_i::Rtmgr_NubServer_i(){
  // add extra constructor code here
}
Rtmgr_NubServer_i::~Rtmgr_NubServer_i(){
  // add extra destructor code here
}

// Methods corresponding to IDL attributes and operations
Rtmgr::NubServer::RemoteNub_SEQ* Rtmgr_NubServer_i::nubs()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::NubServer::RemoteNub_SEQ* Rtmgr_NubServer_i::nubs()>"
}

Rtmgr::RemoteNub_ptr Rtmgr_NubServer_i::CreateNub(const char* process_name, const char* remote_machine)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::RemoteNub_ptr Rtmgr_NubServer_i::CreateNub(const char* process_name, const char* remote_machine)>"
}

void Rtmgr_NubServer_i::DestroyNub(Rtmgr::RemoteNub_ptr nub)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_NubServer_i::DestroyNub(Rtmgr::RemoteNub_ptr nub)>"
}

void Rtmgr_NubServer_i::RegisterNub(Rtmgr::RemoteNub_ptr nub, const char* process_name, const char* process_id, const char* remote_machine)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_NubServer_i::RegisterNub(Rtmgr::RemoteNub_ptr nub, const char* process_name, const char* process_id, const char* remote_machine)>"
}

void Rtmgr_NubServer_i::DeregisterNub(Rtmgr::RemoteNub_ptr nub)
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_NubServer_i::DeregisterNub(Rtmgr::RemoteNub_ptr nub)>"
}

void Rtmgr_NubServer_i::ShutdownServer()
{
  // insert code here and remove the warning
  #warning "Code missing in function <void Rtmgr_NubServer_i::ShutdownServer()>"
}

char* Rtmgr_NubServer_i::get_local_hostname()
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_NubServer_i::get_local_hostname()>"
}

Rtmgr::NubServer::NUBINT Rtmgr_NubServer_i::verify_local_password(const char* password, const char* remote_machine)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::NubServer::NUBINT Rtmgr_NubServer_i::verify_local_password(const char* password, const char* remote_machine)>"
}

Rtmgr::NubServer::NUBINT Rtmgr_NubServer_i::update_local_process_list()
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::NubServer::NUBINT Rtmgr_NubServer_i::update_local_process_list()>"
}

Rtmgr::NubServer::RNUBPROCESS Rtmgr_NubServer_i::local_process_nub_descriptor(Rtmgr::NubServer::NUB_INDEX i)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::NubServer::RNUBPROCESS Rtmgr_NubServer_i::local_process_nub_descriptor(Rtmgr::NubServer::NUB_INDEX i)>"
}

Rtmgr::NubServer::NUBINT Rtmgr_NubServer_i::local_process_identifier(Rtmgr::NubServer::RNUBPROCESS nubprocess)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::NubServer::NUBINT Rtmgr_NubServer_i::local_process_identifier(Rtmgr::NubServer::RNUBPROCESS nubprocess)>"
}

char* Rtmgr_NubServer_i::local_process_name(Rtmgr::NubServer::NUB_INDEX i)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_NubServer_i::local_process_name(Rtmgr::NubServer::NUB_INDEX i)>"
}

char* Rtmgr_NubServer_i::local_process_system_identifier(Rtmgr::NubServer::NUB_INDEX i)
{
  // insert code here and remove the warning
  #warning "Code missing in function <char* Rtmgr_NubServer_i::local_process_system_identifier(Rtmgr::NubServer::NUB_INDEX i)>"
}

Rtmgr::NubServer::RNUB Rtmgr_NubServer_i::local_process_actual_identifier(Rtmgr::NubServer::NUB_INDEX i)
{
  // insert code here and remove the warning
  #warning "Code missing in function <Rtmgr::NubServer::RNUB Rtmgr_NubServer_i::local_process_actual_identifier(Rtmgr::NubServer::NUB_INDEX i)>"
}



// End of example implementation code



int main(int argc, char** argv)
{
  try {
    // Initialise the ORB.
    CORBA::ORB_var orb = CORBA::ORB_init(argc, argv);

    // Obtain a reference to the root POA.
    CORBA::Object_var obj = orb->resolve_initial_references("RootPOA");
    PortableServer::POA_var poa = PortableServer::POA::_narrow(obj);

    // We allocate the objects on the heap.  Since these are reference
    // counted objects, they will be deleted by the POA when they are no
    // longer needed.
    Rtmgr_AccessPath_i* myRtmgr_AccessPath_i = new Rtmgr_AccessPath_i();
    Rtmgr_RemoteNub_i* myRtmgr_RemoteNub_i = new Rtmgr_RemoteNub_i();
    Rtmgr_NubServer_i* myRtmgr_NubServer_i = new Rtmgr_NubServer_i();


    // Activate the objects.  This tells the POA that the objects are
    // ready to accept requests.
    PortableServer::ObjectId_var myRtmgr_AccessPath_iid = poa->activate_object(myRtmgr_AccessPath_i);
    PortableServer::ObjectId_var myRtmgr_RemoteNub_iid = poa->activate_object(myRtmgr_RemoteNub_i);
    PortableServer::ObjectId_var myRtmgr_NubServer_iid = poa->activate_object(myRtmgr_NubServer_i);


    // Obtain a reference to each object and output the stringified
    // IOR to stdout
    {
      // IDL interface: Rtmgr::AccessPath
      CORBA::Object_var ref = myRtmgr_AccessPath_i->_this();
      CORBA::String_var sior(orb->object_to_string(ref));
      std::cout << "IDL object Rtmgr::AccessPath IOR = '" << (char*)sior << "'" << std::endl;
    }

    {
      // IDL interface: Rtmgr::RemoteNub
      CORBA::Object_var ref = myRtmgr_RemoteNub_i->_this();
      CORBA::String_var sior(orb->object_to_string(ref));
      std::cout << "IDL object Rtmgr::RemoteNub IOR = '" << (char*)sior << "'" << std::endl;
    }

    {
      // IDL interface: Rtmgr::NubServer
      CORBA::Object_var ref = myRtmgr_NubServer_i->_this();
      CORBA::String_var sior(orb->object_to_string(ref));
      std::cout << "IDL object Rtmgr::NubServer IOR = '" << (char*)sior << "'" << std::endl;
    }



    // Obtain a POAManager, and tell the POA to start accepting
    // requests on its objects.
    PortableServer::POAManager_var pman = poa->the_POAManager();
    pman->activate();

    orb->run();
    orb->destroy();
  }
  catch(CORBA::TRANSIENT&) {
    std::cerr << "Caught system exception TRANSIENT -- unable to contact the "
              << "server." << std::endl;
  }
  catch(CORBA::SystemException& ex) {
    std::cerr << "Caught a CORBA::" << ex._name() << std::endl;
  }
  catch(CORBA::Exception& ex) {
    std::cerr << "Caught CORBA::Exception: " << ex._name() << std::endl;
  }
  return 0;
}

