#include <cstdlib>
#include <unistd.h>
#include <wordexp.h>
#include <signal.h>

#include <memory>
#include <iostream>
#include <algorithm>
#include <set>

#include "nub-server-impl.h"
#include "remote-nub-impl.h"

using namespace std;

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
Rtmgr_RemoteNub_i::Rtmgr_RemoteNub_i(const char *process_name, const char *remote_machine)
  : process_name_(process_name),
    remote_machine_(remote_machine),
    nub_process_(std::make_unique<NubProcess>(process_name))
{
  std::cerr << "Instantiated RemoteNub" << std::endl;
}

// Methods corresponding to IDL attributes and operations
Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::process()
{
  return this->nub_process_->process();
}

Rtmgr::AccessPath_ptr Rtmgr_RemoteNub_i::access_path()
{
  return access_path_;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::remote_value_byte_size()
{
  return this->nub_process_->remote_value_byte_size();
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
  return this->nub_process_->get_library_base_address(dll);
}

void Rtmgr_RemoteNub_i::get_library_version(Rtmgr::RemoteNub::RNUBLIBRARY dll, Rtmgr::RemoteNub::NUBINT &maj, Rtmgr::RemoteNub::NUBINT &min)
{
  this->nub_process_->get_library_version(dll, maj, min);
}

char *Rtmgr_RemoteNub_i::get_library_filename(Rtmgr::RemoteNub::RNUBLIBRARY dll)
{
  return CORBA::string_dup(this->nub_process_->get_library_filename(dll).c_str());
}

#if 0
char *Rtmgr_RemoteNub_i::get_library_undecorated_name(Rtmgr::RemoteNub::RNUBLIBRARY dll)
{
  NUB_UNIMPLEMENTED();
}
#endif

char *Rtmgr_RemoteNub_i::get_register_name(Rtmgr::RemoteNub::NUB_INDEX reg)
{
  return CORBA::string_dup(this->nub_process_->get_register_name(reg).c_str());
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::get_register_enumeration_code(Rtmgr::RemoteNub::NUB_INDEX reg)
{
  // No separate enumeration value, just use the index
  return reg;
}

void Rtmgr_RemoteNub_i::all_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last)
{
  return this->nub_process_->general_registers(first, last);
}

void Rtmgr_RemoteNub_i::general_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last)
{
  return this->nub_process_->general_registers(first, last);
}

void Rtmgr_RemoteNub_i::special_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last)
{
  return this->nub_process_->special_registers(first, last);
}

void Rtmgr_RemoteNub_i::floating_registers(Rtmgr::RemoteNub::NUBINT &first, Rtmgr::RemoteNub::NUBINT &last)
{
  return this->nub_process_->floating_registers(first, last);
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_read_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  return this->nub_process_->page_read_permission(address);
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_write_permission(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  return this->nub_process_->page_write_permission(address);
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::page_relative_address(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT &offset)
{
  return this->nub_process_->page_relative_address(address, offset);
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::virtual_page_size()
{
  return this->nub_process_->virtual_page_size();
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::download_code
    (Rtmgr::RemoteNub::RNUBTHREAD nubthread,
     const Rtmgr::RemoteNub::CODE_SEQ &download_records,
     const char *entry_point,
     Rtmgr::RemoteNub::REGION_SEQ_out regions,
     Rtmgr::RemoteNub::NUBINT &first,
     Rtmgr::RemoteNub::NUBINT &last,
     Rtmgr::RemoteNub::RNUBHANDLE &lookups)
{
  // FIXME
  regions = new Rtmgr::RemoteNub::REGION_SEQ(0);
  regions->length(0);

  if (!this->lookup_symbols_.empty()) {
    std::cerr << "Improper symbol lookup nesting (download_code)"
              << std::endl;
    abort();
  }

  std::vector<NubProcess::DownloadRecord> records;
  for (CORBA::ULong ri = 0, re = download_records.length(); ri != re; ++ri) {
    auto &codeseq { download_records[ri] };
    auto codebuf { reinterpret_cast<const char *>(codeseq.get_buffer()) };

    records.emplace_back(NubProcess::DownloadRecord(codebuf, codeseq.length()));
  }

  NubProcess::NUBINT rc = this->nub_process_->download_code(nubthread, records, entry_point, this->lookup_symbols_);
  first = 1;
  last = this->lookup_symbols_.size();
  lookups = 0;

  return rc;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  return this->nub_process_->read_value_from_process_memory(address, status);
}

void Rtmgr_RemoteNub_i::write_value_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS val, Rtmgr::RemoteNub::NUBINT &status)
{
  return this->nub_process_->write_value_to_process_memory(address, val, status);
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
  buffer = CORBA::string_alloc(sz);
  this->nub_process_->read_byte_string_from_process_memory(address, sz, buffer.ptr(), status);
  if (status == 0) {
    buffer[sz] = '\0';
  }
}

void Rtmgr_RemoteNub_i::write_byte_string_to_process_memory(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::NUBINT sz, const char *buffer, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  this->nub_process_->write_byte_string_to_process_memory(address, sz, buffer, status);
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_register_in_stack_frame
    (Rtmgr::RemoteNub::RNUBTHREAD nubthread,
     Rtmgr::RemoteNub::NUB_INDEX reg,
     Rtmgr::RemoteNub::NUB_INDEX frame_index,
     Rtmgr::RemoteNub::NUB_ERROR &status)
{
  return this->nub_process_->read_value_from_process_register_in_stack_frame(nubthread, reg, frame_index, status);
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::read_value_from_process_register(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUB_INDEX reg, Rtmgr::RemoteNub::NUB_ERROR &status)
{
  return this->nub_process_->read_value_from_process_register(nubthread, reg, status);
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
  this->nub_process_->application_restart();
}

void Rtmgr_RemoteNub_i::application_stop()
{
  this->nub_process_->application_stop();
}

void Rtmgr_RemoteNub_i::application_continue()
{
  this->nub_process_->application_continue();
}

void Rtmgr_RemoteNub_i::application_continue_unhandled()
{
  this->nub_process_->application_continue_unhandled();
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

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::set_stepping_control_on_thread
    (Rtmgr::RemoteNub::RNUBTHREAD nubthread,
     Rtmgr::RemoteNub::RTARGET_ADDRESS fp,
     Rtmgr::RemoteNub::RTARGET_ADDRESS calling_fp,
     Rtmgr::RemoteNub::NUBINT location_count,
     const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &locs,
     Rtmgr::RemoteNub::NUBINT operation)
{
  std::vector<NubProcess::TARGET_ADDRESS> vlocs;
  for (Rtmgr::RemoteNub::NUBINT i = 0; i < location_count; ++i) {
    vlocs.push_back(locs[i]);
  }
  return this->nub_process_->set_stepping_control_on_thread(nubthread, fp, calling_fp, vlocs, operation);
}

void Rtmgr_RemoteNub_i::clear_stepping_control_on_thread(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  this->nub_process_->clear_stepping_control_on_thread(nubthread);
}

void Rtmgr_RemoteNub_i::thread_stop(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  this->nub_process_->thread_stop(nubthread);
}

void Rtmgr_RemoteNub_i::thread_continue(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  this->nub_process_->thread_continue(nubthread);
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::thread_suspendedQ(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  return this->nub_process_->thread_suspendedQ(nubthread);
}

void Rtmgr_RemoteNub_i::thread_suspended(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  this->nub_process_->thread_suspended(nubthread);
}

void Rtmgr_RemoteNub_i::thread_resumed(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  this->nub_process_->thread_resumed(nubthread);
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::kill_application()
{
  return this->nub_process_->kill_application();
}

void Rtmgr_RemoteNub_i::close_application()
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::close_remote_tether()
{
  NUB_UNIMPLEMENTED();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::setup_function_call
    (Rtmgr::RemoteNub::RNUBTHREAD nubthread,
     Rtmgr::RemoteNub::RTARGET_ADDRESS func,
     Rtmgr::RemoteNub::NUBINT arg_count,
     const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &args_seq,
     Rtmgr::RemoteNub::RNUBHANDLE &cx_handle)
{
  std::vector<NubProcess::TARGET_ADDRESS> args;
  for (size_t i = 0; i < arg_count; ++i) {
    args.push_back(args_seq[i]);
  }
  return this->nub_process_->setup_function_call(nubthread, func, arg_count, args, cx_handle);
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::get_function_result(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  return this->nub_process_->get_function_result(nubthread);
}

void Rtmgr_RemoteNub_i::restore_context
    (Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::RNUBHANDLE the_context)
{
  // Nothing to do
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::remote_call_spy
    (Rtmgr::RemoteNub::RNUBTHREAD nubthread,
     Rtmgr::RemoteNub::RTARGET_ADDRESS func,
     Rtmgr::RemoteNub::NUBINT arg_count,
     const Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ &args,
     Rtmgr::RemoteNub::NUB_ERROR &status)
{
  std::vector<NubProcess::TARGET_ADDRESS> np_args;
  for (Rtmgr::RemoteNub::NUBINT i = 0; i < arg_count; ++i) {
    np_args.push_back(args[i]);
  }
  std::vector<NubProcess::NUBTHREAD> created_threads;
  auto result { this->nub_process_->remote_call_spy(nubthread, func, np_args,
                                                    status, this->stop_reason_,
                                                    created_threads) };

  // The access path expects that threads created during a spy call
  // will be notified via callback rather than as stop reasons
  auto pid { this->process() };
  for (auto &tid : created_threads) {
    this->access_path_->create_thread_stop_reason_handler(pid, tid, 0);
  }

  return result;
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::set_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  return this->nub_process_->set_breakpoint(address);
}

Rtmgr::RemoteNub::NUB_ERROR Rtmgr_RemoteNub_i::clear_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  return this->nub_process_->clear_breakpoint(address);
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::query_breakpoint(Rtmgr::RemoteNub::RTARGET_ADDRESS address)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::wait_for_stop_reason_with_timeout(Rtmgr::RemoteNub::NUBINT timeout_ms, Rtmgr::RemoteNub::NUBINT &code)
{
  this->nub_process_->wait_for_stop_reason_with_timeout(timeout_ms, this->stop_reason_);
  code = this->stop_reason_.code;
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
  return this->nub_process_->thread_stop_information
    (nubthread, fchance, fstart, ret_addr);
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
  return this->nub_process_->process(); // FIXME all stops from the same process?
}

Rtmgr::RemoteNub::RNUBTHREAD Rtmgr_RemoteNub_i::stop_reason_thread()
{
  return this->stop_reason_.thread;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::first_hard_coded_breakpoint()
{
  return this->stop_reason_.first_hard_coded_breakpoint;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_process_exit_code()
{
  return this->stop_reason_.exit_code;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_thread_exit_code()
{
  return this->stop_reason_.exit_code;
}

Rtmgr::RemoteNub::RNUBLIBRARY Rtmgr_RemoteNub_i::stop_reason_library()
{
  return this->stop_reason_.library;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_violation_op()
{
  return this->stop_reason_.violation_op;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::exception_first_chance()
{
  return this->stop_reason_.exception_first_chance;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_violation_address()
{
  return this->stop_reason_.violation_address;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_exception_address()
{
  return this->stop_reason_.exception_address;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::stop_reason_debug_string_address()
{
  return this->stop_reason_.debug_string_address;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_debug_string_length()
{
  return this->stop_reason_.debug_string_length;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::stop_reason_debug_string_is_unicode()
{
  return this->stop_reason_.debug_string_is_unicode;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::initialize_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
{
  return this->nub_process_->initialize_stack_vectors(nubthread);
}

void Rtmgr_RemoteNub_i::read_stack_vectors(Rtmgr::RemoteNub::RNUBTHREAD nubthread, Rtmgr::RemoteNub::NUBINT frame_count, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out frame_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out instruction_pointers, Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ_out return_addresses)
{
  auto stack_vectors { this->nub_process_->read_stack_vectors(nubthread, frame_count) };
  frame_pointers = new Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ(frame_count);
  frame_pointers->length(frame_count);
  instruction_pointers = new Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ(frame_count);
  instruction_pointers->length(frame_count);
  return_addresses = new Rtmgr::RemoteNub::RTARGET_ADDRESS_SEQ(frame_count);
  return_addresses->length(frame_count);

  for (uint32_t i = 0; i < frame_count; ++i) {
    frame_pointers[i] = stack_vectors[i].frame_pointer;
    instruction_pointers[i] = stack_vectors[i].instruction_pointer;
    return_addresses[i] = stack_vectors[i].return_address;
  }
}

void Rtmgr_RemoteNub_i::all_frame_lexicals(Rtmgr::RemoteNub::RTARGET_ADDRESS frame,
                                           Rtmgr::RemoteNub::RTARGET_ADDRESS ip,
                                           Rtmgr::RemoteNub::NUB_INDEX &first,
                                           Rtmgr::RemoteNub::NUB_INDEX &last,
                                           Rtmgr::RemoteNub::RNUBHANDLE &table)
{
  this->lookup_lexicals_ = this->nub_process_->all_frame_lexicals(frame, ip);
  first = 1;
  last = this->lookup_lexicals_.size();
  table = 0;
}

void Rtmgr_RemoteNub_i::register_interactive_code_segment(Rtmgr::RemoteNub::RTARGET_ADDRESS lo, Rtmgr::RemoteNub::RTARGET_ADDRESS hi)
{
  NUB_UNIMPLEMENTED();
}

char *Rtmgr_RemoteNub_i::get_lexical_variable_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX variable)
{
  return CORBA::string_dup(this->lookup_lexicals_[variable - 1].name.c_str());
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lexical_variable_address
    (Rtmgr::RemoteNub::RTARGET_ADDRESS fp,
     Rtmgr::RemoteNub::RNUBHANDLE table,
     Rtmgr::RemoteNub::NUB_INDEX variable,
     Rtmgr::RemoteNub::NUBINT &in_reg,
     Rtmgr::RemoteNub::NUB_INDEX &hireg,
     Rtmgr::RemoteNub::NUB_INDEX &loreg,
     Rtmgr::RemoteNub::NUBINT &arg)
{
  auto &entry { this->lookup_lexicals_[variable - 1] };
  auto address { entry.variable_address };
  in_reg = entry.in_register;
  if (entry.in_register) {
    hireg = entry.hi_register;
    loreg = entry.lo_register;
  }
  arg = entry.is_arg;
  return address;
}

char *Rtmgr_RemoteNub_i::lookup_symbol_name(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return CORBA::string_dup(this->lookup_symbols_[sym - 1].name.c_str());
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_symbol_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookup_symbols_[sym - 1].address;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_start(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookup_symbols_[sym - 1].debug_start;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_debug_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookup_symbols_[sym - 1].debug_end;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::lookup_symbol_language(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookup_symbols_[sym - 1].language;
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::lookup_function_end(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookup_symbols_[sym - 1].function_end;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::symbol_is_function(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX sym)
{
  return this->lookup_symbols_[sym - 1].is_function;
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
  NubProcess::LookupSymbol lookup;
  auto status { this->nub_process_->closest_symbol(address, lib, actual_address,
                                                   offset, lookup) };
  this->closest_symbol_name_ = lookup.name;
  name_length = lookup.name.size();
  type = 0;
  is_function = lookup.is_function;
  debug_start = lookup.debug_start;
  debug_end = lookup.debug_end;
  language = lookup.language;
  final_address_of_definition = lookup.function_end;
  return status;
}

void Rtmgr_RemoteNub_i::function_bounding_addresses(Rtmgr::RemoteNub::RTARGET_ADDRESS address, Rtmgr::RemoteNub::RTARGET_ADDRESS &lower, Rtmgr::RemoteNub::RTARGET_ADDRESS &upper)
{
  NUB_UNIMPLEMENTED();
}

char *Rtmgr_RemoteNub_i::closest_symbol_name(Rtmgr::RemoteNub::NUBINT sz)
{
  char *result = CORBA::string_dup(this->closest_symbol_name_.c_str());
  return result;
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
  NubProcess::LookupSymbol lookup;
  if (this->nub_process_->find_symbol_in_library(nublibrary, name, lookup) != 0) {
    address = lookup.address;
    type = 0;
    is_function = lookup.is_function;
    debug_start = lookup.debug_start;
    debug_end = lookup.debug_end;
    symbol_language = 0;
    final_address_of_definition = lookup.function_end;
    return 1;
  }
  else {
    return 0;
  }
}

void Rtmgr_RemoteNub_i::do_symbols(Rtmgr::RemoteNub::RNUBLIBRARY nublibrary,
                                   const char *match,
                                   Rtmgr::RemoteNub::NUBINT &first,
                                   Rtmgr::RemoteNub::NUBINT &last,
                                   Rtmgr::RemoteNub::RNUBHANDLE &lookups)
{
  if (!this->lookup_symbols_.empty()) {
    std::cerr << "Improper symbol lookup nesting" << std::endl;
    abort();
  }
  this->lookup_symbols_ = this->nub_process_->lookup_symbols(nublibrary, match);
  first = 1;
  last = this->lookup_symbols_.size();
  lookups = 0;
}

void Rtmgr_RemoteNub_i::dispose_lookups(Rtmgr::RemoteNub::RNUBHANDLE lookups)
{
  this->lookup_symbols_.clear();
  this->lookup_lexicals_.clear();
}

Rtmgr::RemoteNub::RTARGET_ADDRESS Rtmgr_RemoteNub_i::resolve_source_location
    (Rtmgr::RemoteNub::RNUBLIBRARY nublibrary,
     const char *filename,
     Rtmgr::RemoteNub::NUBINT line_number,
     Rtmgr::RemoteNub::NUBINT column_number,
     Rtmgr::RemoteNub::NUBINT &valid,
     Rtmgr::RemoteNub::NUBINT &path,
     Rtmgr::RemoteNub::RNUBHANDLE &search,
     Rtmgr::RemoteNub::NUBINT &exact)
{
  return this->nub_process_->resolve_source_location
    (nublibrary, filename, line_number, column_number, valid, exact);
}

Rtmgr::RemoteNub::RNUBHANDLE Rtmgr_RemoteNub_i::fetch_source_locations(Rtmgr::RemoteNub::RTARGET_ADDRESS start_loc, Rtmgr::RemoteNub::RTARGET_ADDRESS end_loc)
{
  this->source_locations_ = this->nub_process_->fetch_source_locations
    (start_loc, end_loc);
  return 0;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::source_location_address(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index)
{
  return this->source_locations_[index].relative_address;
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::source_location_linenumber(Rtmgr::RemoteNub::RNUBHANDLE table, Rtmgr::RemoteNub::NUB_INDEX index)
{
  return this->source_locations_[index].linenumber;
}

char *Rtmgr_RemoteNub_i::source_location_filename(Rtmgr::RemoteNub::RNUBHANDLE table)
{
  // FIXME inlining makes it impossible to assume that all source
  // locations in the requested range belong to the same source file
  return CORBA::string_dup(this->source_locations_[0].filename.c_str());
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::number_of_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table)
{
  return this->source_locations_.size();
}

void Rtmgr_RemoteNub_i::dispose_source_locations(Rtmgr::RemoteNub::RNUBHANDLE table)
{
  this->source_locations_.clear();
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
  return this->nub_process_->dylan_thread_environment_block_address(nubthread, valid);
}

Rtmgr::RemoteNub::NUBINT Rtmgr_RemoteNub_i::dylan_thread_mv_buffer_live(Rtmgr::RemoteNub::RNUBTHREAD nubthread)
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
  this->nub_process_->register_exit_process_function(ExitProcess);
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::open_local_tether(const char *command, const char *args, const Rtmgr::RemoteNub::STRING_SEQ &paths, const Rtmgr::RemoteNub::STRING_SEQ &lib_paths, const char *working_directory, Rtmgr::RemoteNub::NUBINT create_shell, Rtmgr::RemoteNub::NUBINT &success)
{
  auto result { this->nub_process_->launch_process(command, args, working_directory) };
  success = result ? 1 : 0;
  return 0;                     // FIXME
}

Rtmgr::RemoteNub::RNUB Rtmgr_RemoteNub_i::attach_local_tether(Rtmgr::RemoteNub::RNUBPROCESS process, const char *process_name, const char *process_system_id, Rtmgr::RemoteNub::RNUB process_actual_id, const Rtmgr::RemoteNub::STRING_SEQ &symbol_paths, const char *system_JIT_information, Rtmgr::RemoteNub::NUBINT &success)
{
  NUB_UNIMPLEMENTED();
}

void Rtmgr_RemoteNub_i::OpenNub(Rtmgr::AccessPath_ptr access_path)
{
  access_path_ = Rtmgr::AccessPath::_duplicate(access_path);
}

void Rtmgr_RemoteNub_i::CloseNub()
{
  //this->access_path_ = Rtmgr::AccessPath::_nil();
  std::cerr << "Deactivate" << std::endl;
  PortableServer::POA_var poa = _default_POA();
  PortableServer::ObjectId_var id = poa->servant_to_id(this);
  poa->deactivate_object(id);
}
