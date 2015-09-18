#!/usr/bin/env python

import sys
import os.path
import socket
import inspect
import psutil
import threading
import time
from collections import deque
import lldb
import omniORB
from omniORB import CORBA, PortableServer
import Rtmgr, Rtmgr__POA

class StopReason:
    def __init__(self, code, **kwargs):
        self.code = code
        for keyword, val in kwargs.items():
            setattr(self, keyword, val)

    TIMED_OUT                           = 0
    TIMED_OUT_HANDLED                   = 32
    TIMED_OUT_UNHANDLED                 = 33
    ACCESS_VIOLATION                    = 1
    ARRAY_BOUNDS_EXCEPTION              = 2
    ILLEGAL_INSTRUCTION_EXCEPTION       = 3
    PRIVILEGED_INSTRUCTION_EXCEPTION    = 4
    DENORMAL_EXCEPTION                  = 5
    FLOAT_DIVIDE_BY_ZERO_EXCEPTION      = 6
    INEXACT_RESULT_EXCEPTION            = 7
    INVALID_FLOAT_OPERATION_EXCEPTION   = 8
    FLOAT_OVERFLOW_EXCEPTION            = 9
    FLOAT_UNDERFLOW_EXCEPTION           = 10
    FLOAT_STACK_CHECK_EXCEPTION         = 11
    INTEGER_DIVIDE_BY_ZERO_EXCEPTION    = 12
    NONCONTINUABLE_EXCEPTION            = 13
    BREAKPOINT_EXCEPTION                = 14
    HARD_CODED_BREAKPOINT_EXCEPTION     = 15
    SINGLE_STEP_EXCEPTION               = 16
    CREATE_PROCESS                      = 17
    EXIT_PROCESS                        = 18
    CREATE_THREAD                       = 19
    EXIT_THREAD                         = 20
    LOAD_DLL                            = 21
    UNLOAD_DLL                          = 22
    OUTPUT_DEBUG_STRING                 = 24
    PROFILER                            = 25
    PROFILER_UNHANDLED                  = 34
    UNCLASSIFIED                        = 26
    INTEGER_OVERFLOW_EXCEPTION          = 27
    STACK_OVERFLOW_EXCEPTION            = 28
    SOURCE_STEP_OVER                    = 29
    SOURCE_STEP_OUT                     = 30
    SOURCE_STEP_INTO                    = 31

class EventDispatcher (threading.Thread):
    def __init__(self, listener, consumer):
        threading.Thread.__init__(self)
        self._listener = listener
        self._consumer = consumer
        self._launching = False
        self._launching_lock = threading.Lock()

    def set_launching(self):
        with self._launching_lock:
            self._launching = True

    def run(self):
        event = lldb.SBEvent()
        while self._listener.WaitForEvent(lldb.UINT32_MAX, event):
            stream = lldb.SBStream()
            event.GetDescription(stream)
            sys.stdout.write("=> Event (data flavor %s): %s\n" %
                             (event.GetDataFlavor(), stream.GetData()))

            if lldb.SBThread.EventIsThreadEvent(event):
                thread = lldb.SBThread.GetThreadFromEvent(event)
                process = thread.process
                sys.stdout.write("  => Thread Event thread=%s\n" % thread)
            elif lldb.SBProcess.EventIsProcessEvent(event):
                state = lldb.SBProcess.GetStateFromEvent(event)
                process = lldb.SBProcess.GetProcessFromEvent(event)
                thread = process.selected_thread
                sys.stdout.write("  => Process Event, state=%d\n" % state)
                if state == lldb.eStateLaunching:
                    sys.stdout.write("  => Hey, launching!\n")
                    self._launching = True
                elif state == lldb.eStateStopped:
                    with self._launching_lock:
                        if self._launching:
                            stop = StopReason(StopReason.CREATE_PROCESS,
                                              process=process, thread=None)
                            self._consumer.notify_stop(stop)
                            stop = StopReason(StopReason.HARD_CODED_BREAKPOINT_EXCEPTION,
                                              process=process,
                                              thread=process.threads[0])
                            self._consumer.notify_stop(stop)
                        else:
                            stop = StopReason(StopReason.UNCLASSIFIED,
                                              process=process,
                                              thread=thread)
                            self._consumer.notify_stop(stop)
                elif state == lldb.eStateExited:
                    stop = StopReason(StopReason.EXIT_PROCESS, process=process, thread=None)
                    self._consumer.notify_stop(stop)
            else:
                sys.stdout.write("  => Something else event (%s)\n" % event.GetBroadcasterClass())

            event.Clear()

def oops():
    m = "Unhandled method " + inspect.stack()[1][3]
    sys.stderr.write(m + "\n")
    raise RuntimeError(m)

class RemoteNub_i (Rtmgr__POA.RemoteNub):
    def __init__(self, process_name, remote_machine):
        self._process_name = process_name
        self._remote_machine = remote_machine
        self._access_path = None
        self._target = None
        self._process = None
        self._unstarted = True

        # Create the debugging event dispatcher thread
        self._condition = threading.Condition()
        self._stops = deque()
        self._listener = lldb.SBListener("Listener for %s" % process_name)
        self._dispatcher = EventDispatcher(self._listener, self)
        self._dispatcher.start()

        self._pending_stop = None

    def notify_stop(self, stop):
        with self._condition:
            self._stops.append(stop)
            self._condition.notify_all()

    def _wait_for_stop(self, deadline):
        with self._condition:
            while not len(self._stops):
                remaining = deadline - time.time()
                if remaining < 0:
                    return None
                else:
                    self._condition.wait(remaining)
            return self._stops.popleft()

    def _create_thread_stop_reason_handler(self, process, thread, priority):
        if self._access_path:
            self._access_path.create_thread_stop_reason_handler(process,
                                                                thread,
                                                                priority)

    def _debugger_message(self, string, arg1, arg2):
        if self._access_path:
            self._access_path.debugger_message(string, arg1, arg2)

    def _nub_debug_message(self, string, arg1, arg2):
        if self._access_path:
            self._access_path.nub_debug_message(string, arg1, arg2)

    def _debugger_error(self, string, arg1, arg2):
        if self._access_path:
            self._access_path.debugger_error(string, arg1, arg2)

    def _trace(self, string):
        sys.stderr.write(string)

    def create_and_debug_process(self, command, args, path_count, lib_count, \
                                 working_dir, create_shell):
        oops()

    def debug_active_process(self, process_name, process_id, actual_process_id, \
                             path_count, jit_info):
        oops()

    def remote_value_byte_size(self):
        oops()

    def get_process_page_fault_count(self):
        oops()

    def thread_os_priority(self, nubthread):
        self._trace("thread_os_priority %s\n" % nubthread)
        return 0                # FIXME

    def get_thread_cpu_time(self, nubthread):
        oops()

    def get_library_base_address(self, dll):
        self._trace("get_library_filename %d\n" % dll)
        module = self._target.modules[dll]
        for s in module.sections:
            a = s.GetLoadAddress(self._target)
            if a != lldb.LLDB_INVALID_ADDRESS:
                return a
        return lldb.LLDB_INVALID_ADDRESS

    def get_library_version(self, dll):
        self._trace("get_library_version %d\n" % dll)
        module = self._target.modules[dll]
        version = module.GetVersion()
        if len(version) > 1:
            return version[0], version[1]
        elif len(version) > 0:
            return version[0], 0
        else:
            return 0, 0

    def get_library_filename(self, dll):
        self._trace("get_library_filename %d\n" % dll)
        module = self._target.modules[dll]
        return module.GetFileSpec().GetFilename()

    def get_library_undecorated_name(self, dll):
        self._trace("get_library_undecorated_name %d\n" % dll)
        module = self._target.modules[dll]
        return os.path.basename(module.GetFileSpec().GetFilename())

    def get_register_name(self, reg):
        oops()

    def get_register_enumeration_code(self, reg):
        oops()

    def all_registers(self):
        oops()

    def general_registers(self):
        oops()

    def special_registers(self):
        oops()

    def floating_registers(self):
        oops()

    def page_read_permission(self, address):
        oops()

    def page_write_permission(self, address):
        oops()

    def page_relative_address(self, address):
        oops()

    def virtual_page_size(self):
        oops();

    def read_value_from_process_memory(self, address):
        oops()

    def write_value_to_process_memory(self, address, val):
        oops()

    def calculate_stack_address(self, nubthread, offset):
        oops()

    def target_address_to_string(self, x, sz, radix, pad):
        oops()

    def string_to_target_address(self, sz, buffer, radix, overflow):
        oops()

    def read_single_float_from_process_memory(self, address):
        oops()

    def write_single_float_to_process_memory(self, address, value):
        oops()

    def read_double_float_from_process_memory(self, address):
        oops()

    def write_double_float_to_process_memory(self, address, value):
        oops()

    def read_byte_string_from_process_memory(self, address, sz):
        oops()

    def write_byte_string_to_process_memory(self, address, sz, buffer):
        oops()

    def read_value_from_process_register_in_stack_frame(self, nubthread, reg, \
                                                        frame_index):
        oops()

    def read_value_from_process_register(self, nubthread, reg):
        oops()

    def write_value_to_process_register(self, nubthread, reg, value):
        oops()

    def read_single_float_from_process_register(self, nubthread, reg):
        oops()

    def write_single_float_to_process_register(self, nubthread, reg, value):
        oops()

    def read_double_float_from_process_register(self, nubthread, reg):
        oops()

    def write_double_float_to_process_register(self, nubthread, reg, value):
        oops()

    def application_restart(self):
        state = self._process.GetState()
        self._trace("application_restart: Process in state %d\n" % state)
        if self._unstarted:
            self._unstarted = False
            # self._process.Continue()
        else:
            m = "Restart from state %d" % state
            sys.stderr.write(m + "\n")
            raise RuntimeError(m)

    def application_stop(self):
        self._trace("application_stop\n");
        self._process.Stop()

    def application_continue(self):
        self._trace("application_continue\n");
        stop = self._pending_stop
        if stop and stop.code == StopReason.CREATE_PROCESS:
            return              # Don't actually continue
        self._process.Continue()

    def application_continue_unhandled(self):
        oops()

    def application_step(self, n):
        self._trace("application_step %d\n" % n);
        self._process.Step()

    def application_step_over(self, n):
        self._trace("application_step_over %d\n" % n);
        self._process.StepOver()
        oops()

    def application_step_out(self):
        oops()

    def set_stepping_control_on_thread(self, nubthread, fp, calling_fp, \
                                       location_count, locs, operation):
        oops()

    def clear_stepping_control_on_thread(self, nubthread):
        oops()

    def thread_stop(self, nubthread):
        oops()

    def thread_continue(self, nubthread):
        oops()

    def thread_suspendedQ(self, thread):
        oops()

    def thread_suspended(self, thread):
        oops()

    def thread_resumed(self, thread):
        oops()

    def kill_application(self):
        oops()

    def close_application(self):
        oops()

    def close_remote_tether(self):
        oops()

    def setup_function_call(self, nubthread, func, arg_count, args):
        oops()

    def remote_call_spy(self, nubthread, func, arg_count, args):
        oops()

    def get_function_result(self, nubthread):
        oops()

    def restore_context(self, nubthread, the_context):
        oops()

    def set_breakpoint(self, address):
        oops()

    def clear_breakpoint(self, address):
        oops()

    def query_breakpoint(self, address):
        oops()

    def wait_for_stop_reason_with_timeout(self, timeout_ms):
        self._trace("wait_for_stop_reason_with_timeout %d\n" % timeout_ms);
        deadline = time.time() + timeout_ms / 1000.0
        stop = self._wait_for_stop(deadline)
        if stop:
            self._pending_stop = stop
            self._trace("wait_for_stop_reason_with_timeout: code=%d\n" % stop.code)
            return stop.code
        else:
            return StopReason.TIMED_OUT

    def profile_wait_for_stop_reason_with_timeout(self, timeout_ms, \
                                                  profiling_interval):
        oops()

    def inform_profiling_started(self):
        oops()

    def inform_profiling_stopped(self):
        oops()

    def can_receive_first_chance(self, ecode):
        oops()

    def set_first_chance(self, ecode):
        oops()

    def unset_first_chance(self, ecode):
        oops()

    def thread_stop_information(self, nubthread):
        oops()

    def wait_for_stop_reason_no_timeout(self):
        oops()

    def profile_wait_for_stop_reason_no_timeout(self, profile_interval):
        oops()

    def stop_reason_process(self):
        self._trace("stop_reason_process\n");
        stop = self._pending_stop
        if stop and stop.process:
            return stop.process.id
        else:
            return 0

    def stop_reason_thread(self):
        self._trace("stop_reason_thread\n");
        stop = self._pending_stop
        if stop and stop.thread:
            return stop.thread.id
        else:
            return 0

    def first_hard_coded_breakpoint(self):
        self._trace("first_hard_coded_breakpoint\n");
        stop = self._pending_stop
        return 1                # FIXME

    def stop_reason_process_exit_code(self):
        self._trace("stop_reason_process_exit_code\n")
        return self._process.GetExitStatus()

    def stop_reason_thread_exit_code(self):
        oops()

    def stop_reason_library(self):
        self._trace("stop_reason_library\n")
        stop = self._pending_stop
        if stop.code == StopReason.CREATE_PROCESS:
            return 0
        else:
            raise RuntimeError("Unknown library for stop reason %d" % stop.code)

    def stop_reason_violation_op(self):
        oops()

    def exception_first_chance(self):
        self._trace("exception_first_chance\n")
        return 0

    def stop_reason_violation_address(self):
        oops()

    def stop_reason_exception_address(self):
        self._trace("stop_reason_exception_address\n")
        thread = self._pending_stop.thread
        frame = thread.GetFrameAtIndex(0)
        return frame.GetPC()

    def stop_reason_debug_string_address(self):
        oops()

    def stop_reason_debug_string_length(self):
        oops()

    def stop_reason_debug_string_is_unicode(self):
        oops()

    def initialize_stack_vectors(self, nubthread):
        self._trace("initialize_stack_vectors\n")
        thread = self._process.GetThreadByID(nubthread)
        return thread.GetNumFrames()

    def read_stack_vectors(self, nubthread, frame_count):
        oops()

    def all_frame_lexicals(self, frame, ip):
        oops()

    def register_interactive_code_segment(self, lo, hi):
        oops()

    def get_lexical_variable_name(self, table, variable):
        oops()

    def lexical_variable_address(self, fp, table, variable):
        oops()

    def lookup_symbol_name(self, table, sym):
        oops()

    def lookup_symbol_address(self, table, sym):
        oops()

    def lookup_function_debug_start(self, table, sym):
        oops()

    def lookup_function_debug_end(self, table, sym):
        oops()

    def lookup_symbol_language(self, table, sym):
        oops()

    def lookup_function_end(self, table, sym):
        oops()

    def symbol_is_function(self, table, sym):
        oops()

    def nearest_symbols(self, address):
        oops()

    def closest_symbol(self, address):
        oops()

    def function_bounding_addresses(self, address):
        oops()

    def closest_symbol_name(self, sz):
        oops()

    def find_symbol_in_library(self, nublibrary, sz, name):
        oops()

    def dispose_lookups(self, lookups):
        oops()

    def resolve_source_location(self, nublibrary, filename, \
                                line_number, column_number):
        oops()

    def fetch_source_locations(self, start_loc, end_loc):
        oops()

    def source_location_address(self, table, index):
        oops()

    def source_location_linenumber(self, table, index):
        oops()

    def source_location_filename(self, table):
        oops()

    def number_of_source_locations(self, table):
        oops()

    def dispose_source_locations(self, table):
        oops()

    def interpret_instruction_at_current_location(self, nubthread):
        oops()

    def dylan_calculate_step_into(self, nubthread):
        oops()

    def dylan_thread_environment_block_address(self, nubthread):
        oops()

    def dylan_thread_mv_buffer_live(self, nubthread):
        oops()

    def older_stack_frame(self, this_one, than_this_one):
        oops()

    def dylan_current_function(self, nubthread):
        oops()

    def perform_absolute_relocation(self, address, destination):
        oops()

    def recover_breakpoint(self, recover_breakpoint):
        oops()

    def get_process_wall_clock_time(self, thread):
        oops()

    def register_exit_process_function(self, exitprocess):
        oops()

    def open_local_tether(self, command, args, paths, lib_paths, \
                          working_directory, create_shell):
        self._dispatcher.set_launching()

        self._target = lldb.debugger.CreateTarget(command)
        if not self._target:
            return 0, 0

        # Subscribe to target notifications
        target_broadcaster = self._target.GetBroadcaster()
        flags = lldb.SBTarget.eBroadcastBitModulesLoaded | \
                lldb.SBTarget.eBroadcastBitModulesUnloaded
        target_broadcaster.AddListener(self._listener, flags)

        error = lldb.SBError()
        flags = lldb.eLaunchFlagDebug | lldb.eLaunchFlagStopAtEntry
        self._process = self._target.Launch (self._listener,
                                             None,      # argv
                                             None,      # envp
                                             None,      # stdin_path
                                             None,      # stdout_path
                                             None,      # stderr_path
                                             working_directory, # working directory
                                             flags,     # launch flags
                                             True,      # Stop at entry
                                             error)     # error
        sys.stderr.write("Created target for '%s'\n" % command)
        sys.stderr.write("  args         = '%s'\n" % args)
        sys.stderr.write("  paths        = '%s'\n" % paths)
        sys.stderr.write("  lib_paths    = '%s'\n" % lib_paths)
        sys.stderr.write("  working_dir  = '%s'\n" % working_directory)
        sys.stderr.write("  create_shell = %s\n" % create_shell)

        with self._condition:
            while self._process.GetState() < lldb.eStateStopped:
                sys.stderr.write("Waiting...\n")
                self._condition.wait()

        return self._process.id, 1

    def attach_local_tether(self, process, process_name, process_system_id, \
                            process_actual_id, symbol_paths, system_jit_info):
        oops()

    def OpenNub(self, access_path):
        sys.stderr.write("Opening nub for %s\n" % self._process_name)
        self._access_path = access_path

    def CloseNub(self):
        sys.stderr.write("Closing nub for %s\n" % self._process_name)
        if self._process:
            self._process.Destroy()
        self._access_path = None
        poa = self._default_POA()
        objid = poa.servant_to_id(self)
        poa.deactivate_object(objid)

class NubServer_i (Rtmgr__POA.NubServer):
    def __init__(self):
        self._local_processes = []

    def _trace(self, string):
        sys.stderr.write(string)

    def CreateNub(self, process_name, remote_machine):
        servant = RemoteNub_i(process_name, remote_machine)
        poa = self._default_POA()
        objid  = poa.activate_object(servant)
        ref = poa.id_to_reference(objid)
        return ref

    def DestroyNub(self, nub):
        self._trace("DestroyNub\n")
        nub.CloseNub();

    def RegisterNub(self, nub, process_name, process_id, remote_machine):
        oops()

    def ShutdownServer(self, nub):
        oops()

    def get_local_hostname(self):
        return socket.gethostname()

    def verify_local_password(self, password, remote_machine):
        self._trace("Verify password %s for %s\n" % (password, remote_machine))
        return 1

    def update_local_process_list(self):
        self._local_processes = [p for p in psutil.process_iter()]
        return len(self._local_processes)

    def local_process_nub_descriptor(self, i):
        oops()

    def local_process_identifier(self, nubprocess):
        oops()

    def local_process_name(self, i):
        return self._local_processes[i].name()

    def local_process_system_identifier(self, i):
        return str(self._local_processes[i].pid)

    def local_process_actual_identifier(self, i):
        self._local_processes[i].pid

if __name__ == '__main__':
    lldb.debugger = lldb.SBDebugger.Create()
    lldb.debugger.SetAsync(True)
    #lldb.debugger.EnableLog("lldb", ["api"])

    # giop:tcp:<host>:<port>

    # Initialize the ORB
    endpoint = ['-ORBendPoint', 'giop:tcp::7777',
                '-ORBmaxGIOPVersion', '1.0']
                # '-ORBtraceLevel', '40',
                # '-ORBtraceInvocations', '1',
                # '-ORBtraceInvocationReturns', '1'
    orb = CORBA.ORB_init(sys.argv + endpoint, CORBA.ORB_ID)
    poa = orb.resolve_initial_references("RootPOA")

    # Actiate the POAManager
    poaManager = poa._get_the_POAManager()
    poaManager.activate()

    # Create a child POA
    policies = [poa.create_id_assignment_policy(PortableServer.USER_ID),
                poa.create_lifespan_policy(PortableServer.PERSISTENT)]
    child_poa = poa.create_POA("DebuggerServerPOA", poaManager, policies)

    # Activate the NubServer servant object (with a known object id)
    servant = NubServer_i()
    object_id = 'Open Dylan Debugger Server'
    child_poa.activate_object_with_id(object_id, servant)

    # and print an IOR string to stdout
    ref = servant._this()
    sys.stdout.write(orb.object_to_string(ref) + "\n")

    # and to this nifty file
    f = open("/tmp/nub.ior", "w")
    f.write(orb.object_to_string(ref) + "\n")
    f.close()

    orb.run()
