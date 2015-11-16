#!/usr/bin/env python

import argparse
import sys
import os.path
import socket
import re
import fnmatch
import inspect
import psutil
import threading
import time
from collections import deque
import struct
import resource
import lldb
import lldb.formatters.Logger
import omniORB
from omniORB import CORBA, PortableServer
import Rtmgr
import Rtmgr__POA

MAX_PSEUDO_REGISTERS = 256

class StopReason:
    def __init__(self, code, **kwargs):
        self.code = code
        self.defer_continue = False
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
    IDLE = 0
    LAUNCHING = 1
    INITIALIZING = 2
    RUNNING = 3

    def __init__(self, listener, consumer, spy_broadcaster):
        threading.Thread.__init__(self)
        self._listener = listener
        self._consumer = consumer
        self._spy_broadcaster = spy_broadcaster
        self._launch_state = EventDispatcher.IDLE
        self._launching_lock = threading.Lock()
        self._process = None

    def _trace(self, string):
        logger = lldb.formatters.Logger.Logger()
        logger.write(string)

    def set_launch_state(self, state):
        with self._launching_lock:
            self._launch_state = state

    def run(self):
        event = lldb.SBEvent()
        while self._listener.WaitForEvent(lldb.UINT32_MAX, event):
            stream = lldb.SBStream()
            event.GetDescription(stream)
            self._trace("=> Event (data flavor %s): %s" %
                        (event.GetDataFlavor(), stream.GetData()))

            if event.BroadcasterMatchesRef(self._spy_broadcaster):
                self._trace("  => Spy event")
                if event.GetType() == 2:
                    self.handle_process_stop(self._process)
            elif lldb.SBThread.EventIsThreadEvent(event):
                thread = lldb.SBThread.GetThreadFromEvent(event)
                process = thread.process
                self._trace("  => Thread Event thread=%s" % thread)
            elif lldb.SBProcess.EventIsProcessEvent(event):
                state = lldb.SBProcess.GetStateFromEvent(event)
                process = lldb.SBProcess.GetProcessFromEvent(event)
                thread = process.selected_thread
                self._trace("  => Process Event, state=%d" % state)
                if state == lldb.eStateLaunching:
                    self._trace("  => Hey, launching!")
                    self._launch_state = EventDispatcher.LAUNCHING
                elif state == lldb.eStateStopped:
                    #lldb.debugger.HandleCommand('bt')
                    with self._launching_lock:
                        self._trace("  => launch state %d" % self._launch_state)
                        if self._launch_state == EventDispatcher.LAUNCHING:
                            self._launch_state = EventDispatcher.INITIALIZING
                            self._process = process
                            stop = StopReason(StopReason.CREATE_PROCESS,
                                              process=process,
                                              thread=process.threads[0])
                            self._consumer.notify_stop(stop)
                        elif self._launch_state == EventDispatcher.INITIALIZING:
                            self._launch_state = EventDispatcher.RUNNING

                            target = process.target

                            modules = target.modules
                            for i in range(1, len(modules)):
                                stop = StopReason(StopReason.LOAD_DLL,
                                                  process=process,
                                                  thread=process.threads[0],
                                                  defer_continue=True,
                                                  library=i)
                                self._consumer.notify_stop(stop)

                            stop = StopReason(StopReason.HARD_CODED_BREAKPOINT_EXCEPTION,
                                              process=process,
                                              thread=process.threads[0],
                                              synthetic=True)
                            self._consumer.notify_stop(stop)
                        else:
                            self.handle_process_stop(process)

                elif state == lldb.eStateExited:
                    stop = StopReason(StopReason.EXIT_PROCESS,
                                      process=process,
                                      thread=process.selected_thread)
                    self._consumer.notify_stop(stop)
                else:
                    self._trace("  => Unhandled process state %d" % state)
            else:
                self._trace("  => Something else event (%s)"
                            % event.GetBroadcasterClass())

            event.Clear()


    def handle_process_stop(self, process):
        target = process.target
        stops = []
        for t in process:
            self._trace("    => Thread %#x: stop reason %d"
                        % (t.id, t.stop_reason))

            if t.stop_reason == lldb.eStopReasonBreakpoint:
                #lldb.debugger.HandleCommand('bt')
                breakpoint_id = t.GetStopReasonDataAtIndex(0)
                self._trace("      => breakpoint = %d" % breakpoint_id)
                if breakpoint_id != 0:
                    stop = StopReason(StopReason.BREAKPOINT_EXCEPTION,
                                      process=process,
                                      thread=t,
                                      breakpoint_id=breakpoint_id)
                    stops.append(stop)
            elif t.stop_reason == lldb.eStopReasonException:
                #process.SetSelectedThread(t)
                #lldb.debugger.HandleCommand('bt')
                description = t.GetStopDescription(128)
                self._trace("  => Exception %s" % description)
                if description.startswith('EXC_BREAKPOINT'):
                    stop = StopReason(StopReason.HARD_CODED_BREAKPOINT_EXCEPTION,
                                      process=process,
                                      thread=t,
                                      synthetic=False)
                    stops.append(stop)
                else:
                    stop = StopReason(StopReason.UNCLASSIFIED,
                                      process=process,
                                      thread=t)
                    stops.append(stop)

        for i, stop in zip(range(len(stops)), stops):
            stop.defer_continue = (i != len(stops) - 1)
            self._consumer.notify_stop(stop)

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
        self._create_thread_notified = set()
        self._stop_thread_notified = set()
        self._breakpoints = {}
        self._lookups = []
        self._name_cache = None
        self._create_thread_breakpoint = None
        self._system_threads = None

        self._register_index = None
        self._register_name = {}
        self._register_collection = {}

        self._pseudo_register_values = []

        # Create the debugging event dispatcher thread
        self._condition = threading.Condition()
        self._stops = deque()
        self._listener = lldb.SBListener("Listener for %s" % process_name)

        self._spy_broadcaster = lldb.SBBroadcaster("Spy broadaster")
        self._spy_broadcaster.AddListener(self._listener, 0xFFFFFFFF)

        self._dispatcher = EventDispatcher(self._listener, self, self._spy_broadcaster)
        self._dispatcher.start()

        self._pending_stop = None

    def notify_stop(self, stop):
        self._trace("notify_stop: code=%d, thread=%#x"
                    % (stop.code, stop.thread.id))
        with self._condition:
            if stop.thread and not stop.defer_continue:
                # Don't notify again for stops on threads that remained suspended
                if stop.thread.id in self._stop_thread_notified:
                    self._trace("(thread stop %#x already notified)"
                                % stop.thread.id)
                    return
                self._stop_thread_notified.add(stop.thread.id)

            if stop.code == StopReason.HARD_CODED_BREAKPOINT_EXCEPTION and stop.synthetic:
                self._create_thread_breakpoint = self._target.BreakpointCreateByName("dylan_thread_trampoline")
                self._create_thread_breakpoint.enabled = True
                #lldb.debugger.HandleCommand('breakpoint list')
            elif stop.code == StopReason.BREAKPOINT_EXCEPTION:
                if self._system_threads is None:
                    # If this is the first breakpoint we've hit,
                    # record all of the threads other than the main
                    # thread
                    sys = [t.id for t in self._process.threads[1:]]
                    for i in sys:
                        self._trace("Identified system thread %#x" % i)
                    self._system_threads = set(sys)

                if stop.breakpoint_id == self._create_thread_breakpoint.id:
                    self._trace("Thread creation tracking breakpoint")
                    self._create_thread_notified.add(stop.thread.id)
                    stop.code = StopReason.CREATE_THREAD

            if stop.thread and stop.thread.id not in self._create_thread_notified:
                # We haven't already notified about this thread's
                # creation; do so now
                self._create_thread_notified.add(stop.thread.id)
                self._create_thread_stop_reason_handler(stop.process.id,
                                                        stop.thread.id, 0)

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
        if self._access_path and not self._unstarted:
            self._trace("create_thread_stop_reason_handler %d %#x %d"
                        % (process, thread, priority))
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
        logger = lldb.formatters.Logger.Logger()
        logger.write(string)

    def create_and_debug_process(self, command, args, path_count, lib_count,
                                 working_dir, create_shell):
        oops()

    def debug_active_process(self, process_name, process_id, actual_process_id,
                             path_count, jit_info):
        oops()

    def remote_value_byte_size(self):
        self._trace("remote_value_byte_size")
        return self._process.GetAddressByteSize()

    def get_process_page_fault_count(self):
        oops()

    def thread_os_priority(self, nubthread):
        self._trace("thread_os_priority %#x" % nubthread)
        return 0                # FIXME

    def get_thread_cpu_time(self, nubthread):
        oops()

    def get_library_base_address(self, dll):
        self._trace("get_library_base_address %d" % dll)
        module = self._target.modules[dll]
        for s in module.sections:
            a = s.GetLoadAddress(self._target)
            if a != lldb.LLDB_INVALID_ADDRESS:
                return a
        return lldb.LLDB_INVALID_ADDRESS

    def get_library_version(self, dll):
        self._trace("get_library_version %d" % dll)
        module = self._target.modules[dll]
        version = module.GetVersion()
        if len(version) > 1:
            return version[0], version[1]
        elif len(version) > 0:
            return version[0], 0
        else:
            return 0, 0

    def get_library_filename(self, dll):
        self._trace("get_library_filename %d" % dll)
        module = self._target.modules[dll]
        return module.GetFileSpec().GetFilename()

    def get_library_undecorated_name(self, dll):
        self._trace("get_library_undecorated_name %d" % dll)
        module = self._target.modules[dll]
        return os.path.basename(module.GetFileSpec().GetFilename())

    class RegisterInfo:
        def __init__(self, name, index):
            self.name = name
            self.index = index

    def _do_register_collection(self, collection_name, register_names):
        first = len(self._register_index)
        for name in register_names:
            info = RemoteNub_i.RegisterInfo(name, len(self._register_index))
            self._register_index.append(info)
            self._register_name[name] = info
        last = len(self._register_index) - 1
        self._register_collection[collection_name] = (first, last)

    def _ensure_register_info(self, frame):
        if self._register_index:
            return
        self._register_index = [None]

        # Populate the standard collections
        target = self._process.target
        arch = target.triple.split('-')[0]

        if arch == 'i386':
            general = ['eax', 'edx', 'ecx', 'ebx', 'ebp', 'esi', 'edi']
            special = ['esp', 'eip', 'eflags', 'cs', 'ds', 'es', 'fs', 'gs']
            floating = ['stmm0', 'stmm1', 'stmm2', 'stmm3',
                        'stmm4', 'stmm5', 'stmm6', 'stmm7',
                        'ymm0', 'ymm1', 'ymm2', 'ymm3',
                        'ymm4', 'ymm5', 'ymm6', 'ymm7',
                        'xmm0', 'xmm1', 'xmm2', 'xmm3',
                        'xmm4', 'xmm5', 'xmm6', 'xmm7']
        elif arch == 'x86_64':
            general = ['rax', 'rdx', 'rcx', 'rbx', 'rbp', 'rsi', 'rdi',
                       'r8', 'r9', 'r9', 'r10', 'r11', 'r12', 'r13',
                       'r14', 'r15']
            special = ['rsp', 'rip', 'rflags', 'cs', 'ds', 'es', 'fs', 'gs']
            floating = ['stmm0', 'stmm1', 'stmm2', 'stmm3',
                        'stmm4', 'stmm5', 'stmm6', 'stmm7',
                        'ymm0', 'ymm1', 'ymm2', 'ymm3',
                        'ymm4', 'ymm5', 'ymm6', 'ymm7',
                        'xmm0', 'xmm1', 'xmm2', 'xmm3',
                        'xmm4', 'xmm5', 'xmm6', 'xmm7']

        self._do_register_collection('general', general)
        self._do_register_collection('special', special)
        self._do_register_collection('floating', floating)

        # Note which LLVM register set each register comes from, and
        # assign indices to registers that aren't in any of the collections
        for regset in frame.registers:
            for register in regset:
                index = len(self._register_index)
                info = RemoteNub_i.RegisterInfo(register.name, index)
                info.set = regset.name
                self._register_index.append(info)
                self._register_name[register.name] = info

    def get_register_name(self, reg):
        self._trace("get_register_name %d" % reg)
        if reg < len(self._register_index):
            return self._register_index[reg].name
        else:
            return "SBValue%d" % (reg - len(self._register_index))

    def get_register_enumeration_code(self, reg):
        return reg

    def all_registers(self):
        thread = self._process.threads[0]
        frame = thread.frames[0]
        self._ensure_register_info(frame)
        last = (len(self._register_index) - 1) + MAX_PSEUDO_REGISTERS
        self._trace("all_registers: 1 %d" % last)
        return (1, last)

    def general_registers(self):
        thread = self._process.threads[0]
        frame = thread.frames[0]
        self._ensure_register_info(frame)
        first, last = self._register_collection['general']
        self._trace("general_registers: %d %d" % (first, last))
        return (first, last)

    def special_registers(self):
        thread = self._process.threads[0]
        frame = thread.frames[0]
        self._ensure_register_info(frame)
        first, last = self._register_collection['special']
        self._trace("special_registers: %d %d" % (first, last))
        return (first, last)

    def floating_registers(self):
        thread = self._process.threads[0]
        frame = thread.frames[0]
        self._ensure_register_info(frame)
        first, last = self._register_collection['floating']
        self._trace("floating_registers: %d %d" % (first, last))
        return (first, last)

    def page_read_permission(self, address):
        self._trace("page_read_permission %#x" % address)
        error = lldb.SBError()
        sz = self._process.GetAddressByteSize()
        value = self._process.ReadMemory(address, sz, error)
        if error.Success():
            return 1
        else:
            return 0

    def page_write_permission(self, address):
        self._trace("page_write_permission %#x" % address)
        return 1  # FIXME

    def page_relative_address(self, address):
        self._trace("page_relative_address %#x" % address)
        pagesize = resource.getpagesize()
        return (address / pagesize, address % pagesize)

    def virtual_page_size(self):
        self._trace("virtual_page_size")
        return resource.getpagesize()

    def read_value_from_process_memory(self, address):
        self._trace("read_value_from_process_memory %#x" % address)
        error = lldb.SBError()
        value = self._process.ReadPointerFromMemory(address, error)
        if error.Success():
            self._trace("read value %#x" % value)
            return (value, 0)
        else:
            self._trace("read failed: %s" % error)
            return (lldb.LLDB_INVALID_ADDRESS, 1)

    def write_value_to_process_memory(self, address, val):
        self._trace("write_value_to_process_memory %#x -> %#x"
                    % (address, val))
        endian = self._process.GetByteOrder()
        if endian == lldb.eByteOrderLittle:
            fmt = '<'
        else:
            fmt = '>'
        word_size = self._process.GetAddressByteSize()
        if word_size == 4:
            packed_val = struct.pack(fmt + 'i', val)
        else:
            packed_val = struct.pack(fmt + 'q', val)
        bytes = bytearray(map(ord, packed_val))
        error = lldb.SBError()
        result = self._process.WriteMemory(address, bytes, error)
        if error.Success() and result == len(bytes):
            self._trace("write succeeded")
            return 0
        else:
            self._trace("write failed: %s" % error)
            return 1

    def calculate_stack_address(self, nubthread, offset):
        oops()

    def target_address_to_string(self, x, sz, radix, pad):
        self._trace("target_address_to_string %#x %d %d %d"
                    % (x, sz, radix, pad))
        return ("%08x" % x, 0)  # FIXME

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
        self._trace("read_byte_string_from_process_memory %#x %d"
                    % (address, sz))
        error = lldb.SBError()
        if sz > 0:
            value = self._process.ReadMemory(address, sz, error)
        else:
            value = ""
        if error.Success():
            return (value, 0)
        else:
            self._trace("Read error: %s" % error)
            return ("", 1)

    def write_byte_string_to_process_memory(self, address, sz, buffer):
        self._trace("write_byte_string_to_process_memory %#x %d"
                    % (address, sz))
        error = lldb.SBError()
        result = self._process.WriteMemory(address, buffer, error)
        if error.Success() and result == sz:
            self._trace("write succeeded")
            return 0
        else:
            self._trace("write failed: %s" % error)
            return 1

    def read_value_from_process_register_in_stack_frame(self, nubthread, reg, \
                                                        frame_index):
        self._trace("read_value_from_process_register_in_stack_frame %#x %d %d"
                    % (nubthread, reg, frame_index))
        if reg < len(self._register_index):
            thread = self._process.GetThreadByID(nubthread)
            frame = thread.GetFrameAtIndex(frame_index)

            reginfo = self._register_index[reg]
            regset_name = reginfo.set
            regset_value = next(v for v in frame.registers if v.name == regset_name)
            register_value = regset_value.GetChildMemberWithName(reginfo.name)
            if register_value.IsValid() and register_value.GetError().Success():
                return (register_value.GetValueAsUnsigned(), 0)
            else:
                return (0, 1)
        else:
            index = reg - len(self._register_index)
            if index < len(self._pseudo_register_values):
                value = self._pseudo_register_values[index]
                return (value.GetValueAsUnsigned(), 0)
            else:
                return (0, 1)

    def read_value_from_process_register(self, nubthread, reg):
        self._trace("read_value_from_process_register %#x %d"
                    % (nubthread, reg))
        if reg < len(self._register_index):
            thread = self._process.GetThreadByID(nubthread)
            frame = thread.GetFrameAtIndex(0)

            reginfo = self._register_index[reg]
            regset_name = reginfo.set
            regset_value = next(v for v in frame.registers if v.name == regset_name)
            register_value = regset_value.GetChildMemberWithName(reginfo.name)
            if register_value.IsValid() and register_value.GetError().Success():
                return (register_value.GetValueAsUnsigned(), 0)
            else:
                return (0, 1)
        else:
            index = reg - len(self._register_index)
            if index < len(self._pseudo_register_values):
                value = self._pseudo_register_values[index]
                return (value.GetValueAsUnsigned(), 0)
            else:
                return (0, 1)

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
        self._trace("application_restart: Process in state %d" % state)
        if self._unstarted:
            self._unstarted = False
            # self._process.Continue()
        else:
            m = "Restart from state %d" % state
            sys.stderr.write(m + "\n")
            raise RuntimeError(m)

    def application_stop(self):
        self._trace("application_stop")
        self._process.Stop()

    def application_continue(self):
        self._trace("application_continue")
        stop = self._pending_stop
        if stop and stop.defer_continue:
            self._trace("Continue deferred")
            return              # Don't actually continue
        for t in self._process:
            self._trace("    => Thread %#x: suspended=%d\n"
                        % (t.id, t.is_suspended))
            if not t.is_suspended:
                self._stop_thread_notified.discard(t.id)
        self._process.Continue()

    def application_continue_unhandled(self):
        oops()

    def application_step(self, n):
        self._trace("application_step %d" % n)
        self._process.Step()

    def application_step_over(self, n):
        self._trace("application_step_over %d" % n)
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
        self._trace("thread_stop %#x" % nubthread)
        thread = self._process.GetThreadByID(nubthread)
        # thread.Suspend()

    def thread_continue(self, nubthread):
        self._trace("thread_continue %#x" % nubthread)
        thread = self._process.GetThreadByID(nubthread)
        if thread.IsSuspended():
            raise RuntimeError("Trying to continue a suspended thread")

    def thread_suspendedQ(self, nubthread):
        self._trace("thread_suspendedQ %#x" % nubthread)
        thread = self._process.GetThreadByID(nubthread)
        if thread.IsSuspended():
            self._trace(" => 1")
            return 1
        else:
            self._trace(" => 0")
            return 0

    def thread_suspended(self, nubthread):
        self._trace("thread_suspended %#x" % nubthread)
        thread = self._process.GetThreadByID(nubthread)
        thread.Suspend()

    def thread_resumed(self, nubthread):
        self._trace("thread_resumed %#x" % nubthread)
        thread = self._process.GetThreadByID(nubthread)
        thread.Resume()

    def kill_application(self):
        self._trace("kill_application")
        # FIXME allow to exit cleanly?
        e = self._process.Kill()
        if e.Success():
            return 0;
        else:
            self._trace("kill_application failed: %s" % e)
            return 1;

    def close_application(self):
        oops()

    def close_remote_tether(self):
        oops()

    def setup_function_call(self, nubthread, func, arg_count, args):
        oops()


    def _evaluate(self, thread, expression, stop_others=False):
        self._trace("evaluating: %s" % expression)

        options = lldb.SBExpressionOptions()
        options.SetIgnoreBreakpoints(False)
        options.SetLanguage(lldb.eLanguageTypeC99)
        options.SetTryAllThreads(False)
        options.SetStopOthers(stop_others)
        options.SetUnwindOnError(False)
        options.SetIgnoreBreakpoints(False)
        options.SetLanguage(lldb.eLanguageTypeC99)

        frame = thread.GetFrameAtIndex(0)
        hex_address = "%016x" % frame.GetPC()
        if hex_address in self._breakpoints:
            breakpoint = self._breakpoints[hex_address]
            breakpoint.SetEnabled(False)
        else:
            breakpoint = None

        self._spy_broadcaster.BroadcastEvent(lldb.SBEvent(1, "Spy Start"))
        v = frame.EvaluateExpression(expression, options)
        self._trace("result: %s" % v)
        self._spy_broadcaster.BroadcastEvent(lldb.SBEvent(2, "Spy Stop"))

        if breakpoint is not None:
            breakpoint.SetEnabled(True)

        return v

    def remote_call_spy(self, nubthread, func, arg_count, args):
        args = args[0 : arg_count]
        func_addr = lldb.SBAddress(func, self._target)
        self._trace("remote_call_spy %#x %s %d %s"
                    % (nubthread, func_addr, arg_count, args))

        # Record threads existing before the call
        pre_call_threads = set([t.id for t in self._process])

        # Construct a C99 expression for the call
        formals = ["void *" for i in range(arg_count)]
        c_args = ["(void *) %#x" % a for a in args]
        expression = ("((void *(*)(" \
                      + ", ".join(formals) \
                      + ")) %#x)(" % func) \
                      + ", ".join(c_args) \
                      + ")"

        # Evaluate it
        thread = self._process.GetThreadByID(nubthread)
        v = self._evaluate(thread, expression)

        # Check if any new threads were created during the call. If
        # so, run them until they reach the state that the environment
        # is expecting.
        post_call_threads = set([t.id for t in self._process])
        new_threads = post_call_threads - pre_call_threads
        if new_threads:
            self._prepare_spy_threads(new_threads)

        if v.IsValid() and v.GetError().Success():
            return (v.GetValueAsUnsigned(), 0)
        else:
            lldb.debugger.HandleCommand('bt')
            return (0, 1)       # aborted

    def _prepare_spy_threads(self, new_threads):
        # Suspend all of the (pre-existing, non-system) threads that
        # weren't already suspended
        suspended = []
        for thread in self._process:
            if thread.id not in new_threads \
               and not thread.id in self._system_threads \
               and not thread.is_suspended:
                self._trace("Temporarily suspending thread %#x" % thread.id)
                thread.Suspend()
                suspended.append(thread)

        # Continue the process and wait for events until the new
        # threads reach a breakpoint instruction
        deadline = time.time() + 5
        stop = self._pending_stop
        while new_threads:
            if not stop.defer_continue:
                self._process.Continue()

            stop = self._wait_for_stop(deadline)
            if not stop:
                self._trace("Prepare %s threads timeout" % new_threads)
                break
            elif stop.code == StopReason.CREATE_THREAD:
                self._trace("Notifying for creation of thread %#x"
                            % stop.thread.id)
                self._create_thread_stop_reason_handler(stop.process.id,
                                                        stop.thread.id, 0)
                self._stop_thread_notified.remove(stop.thread.id)
            elif stop.code == StopReason.HARD_CODED_BREAKPOINT_EXCEPTION:
                self._trace("Hit hard-coded breakpoint in thread %#x"
                            % stop.thread.id)
                self._pending_stop = stop
                new_threads.remove(stop.thread.id)
            else:
                self._trace("Hit unexpected stop code=%d" % stop.code)

        # Unsuspend the threads suspended above
        for thread in suspended:
            self._trace("Resuming thread %#x" % thread.id)
            thread.Resume()

        #lldb.debugger.HandleCommand('bt all')

    def get_function_result(self, nubthread):
        oops()

    def restore_context(self, nubthread, the_context):
        oops()

    NOT_SUPPORTED = 0
    BREAKPOINT_ALREADY_EXISTS = 1
    BREAKPOINT_DOES_NOT_EXIST = 2
    WATCHPOINT_ALREADY_EXISTS = 3
    WATCHPOINT_DOES_NOT_EXIST = 4
    SET_BREAKPOINT_FAILED = 5
    CLEAR_BREAKPOINT_FAILED = 6
    OK = 7
    BREAKPOINT_WAS_DISABLED = 8

    def set_breakpoint(self, address):
        self._trace("set_breakpoint %016x" % address)
        hex_address = "%016x" % address
        if hex_address in self._breakpoints:
            breakpoint = self._breakpoints[hex_address]
            if breakpoint.enabled:
                self._trace("ALREADY EXISTS")
                return RemoteNub_i.BREAKPOINT_ALREADY_EXISTS
            else:
                breakpoint.enabled = True
                return RemoteNub_i.OK
        else:
            breakpoint = self._target.BreakpointCreateByAddress(address)
            if breakpoint.GetNumLocations() == 1:
                self._trace("OK")
                self._breakpoints[hex_address] = breakpoint
                #lldb.debugger.HandleCommand('breakpoint list')
                return RemoteNub_i.OK
            else:
                self._trace("FAILED")
                return RemoteNub_i.SET_BREAKPOINT_FAILED

    def clear_breakpoint(self, address):
        self._trace("clear_breakpoint %016x" % address)
        hex_address = "%016x" % address
        if hex_address not in self._breakpoints:
            self._trace("DOES NOT EXIST")
            return RemoteNub_i.BREAKPOINT_DOES_NOT_EXIST
        okay = self._target.BreakpointDelete(self._breakpoints[hex_address].id)
        if okay:
            self._trace("OK")
            del self._breakpoints[hex_address]
            return RemoteNub_i.OK
        else:
            self._trace("FAILED")
            return RemoteNub_i.CLEAR_BREAKPOINT_FAILED

    def query_breakpoint(self, address):
        oops()

    def wait_for_stop_reason_with_timeout(self, timeout_ms):
        self._trace("wait_for_stop_reason_with_timeout %d" % timeout_ms)
        deadline = time.time() + timeout_ms / 1000.0
        stop = self._wait_for_stop(deadline)
        if stop:
            self._pending_stop = stop
            self._trace("wait_for_stop_reason_with_timeout: code=%d"
                        % stop.code)
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
        self._trace("thread_stop_infomrmation %#x" % nubthread)
        stop = self._pending_stop
        fchance = 0             # FIXME
        fstart = 0              # (unused)
        ret_addr = 0            # (unused)
        return (stop.code, fchance, fstart, ret_addr)

    def wait_for_stop_reason_no_timeout(self):
        oops()

    def profile_wait_for_stop_reason_no_timeout(self, profile_interval):
        oops()

    def stop_reason_process(self):
        self._trace("stop_reason_process")
        stop = self._pending_stop
        if stop and stop.process:
            return stop.process.id
        else:
            return 0

    def stop_reason_thread(self):
        stop = self._pending_stop
        if stop and stop.thread:
            self._trace("stop_reason_thread %#x" % stop.thread.id)
            return stop.thread.id
        else:
            self._trace("stop_reason_thread ?")
            return 0

    def first_hard_coded_breakpoint(self):
        self._trace("first_hard_coded_breakpoint")
        stop = self._pending_stop
        if stop and stop.code == StopReason.HARD_CODED_BREAKPOINT_EXCEPTION:
            return 1 if stop.synthetic else 0
        else:
            self._trace("But... code=%d" % stop.code)
            return 0

    def stop_reason_process_exit_code(self):
        self._trace("stop_reason_process_exit_code")
        return self._process.GetExitStatus()

    def stop_reason_thread_exit_code(self):
        oops()

    def stop_reason_library(self):
        self._trace("stop_reason_library")
        stop = self._pending_stop
        if stop.code == StopReason.CREATE_PROCESS:
            return 0
        elif stop.code == StopReason.LOAD_DLL or stop.code == StopReason.UNLOAD_DLL:
            return stop.library
        else:
            raise RuntimeError("Unknown library for stop reason %d" % stop.code)

    def stop_reason_violation_op(self):
        oops()

    def exception_first_chance(self):
        self._trace("exception_first_chance")
        return 0

    def stop_reason_violation_address(self):
        oops()

    def stop_reason_exception_address(self):
        self._trace("stop_reason_exception_address")
        thread = self._pending_stop.thread
        frame = thread.GetFrameAtIndex(0)
        return frame.GetPC()

    def stop_reason_debug_string_address(self):
        oops()

    def stop_reason_debug_string_length(self):
        oops()

    def stop_reason_debug_string_is_unicode(self):
        oops()

    def register_interactive_code_segment(self, lo, hi):
        oops()

    def initialize_stack_vectors(self, nubthread):
        self._trace("initialize_stack_vectors %#x" % nubthread)
        thread = self._process.GetThreadByID(nubthread)
        return thread.GetNumFrames()

    def read_stack_vectors(self, nubthread, frame_count):
        self._trace("read_stack_vectors %#x %d" % (nubthread, frame_count))
        thread = self._process.GetThreadByID(nubthread)
        real_frame_count = thread.GetNumFrames()
        frame_pointers = []
        instruction_pointers = []
        return_addresses = []
        for idx in range(frame_count):
            frame = thread.GetFrameAtIndex(idx)
            frame_pointers.append(frame.GetFP())
            instruction_pointers.append(frame.GetPC())
            if idx + 1 < real_frame_count:
                inner_frame = thread.GetFrameAtIndex(idx + 1)
                return_addresses.append(inner_frame.GetPC())
            else:
                return_addresses.append(lldb.LLDB_INVALID_ADDRESS)
            self._trace("frame %d: fp=%#x ip=%#x"
                        % (idx, frame.GetFP(), frame.GetPC()))
        #lldb.debugger.HandleCommand('bt all')
        return (frame_pointers, instruction_pointers, return_addresses)

    def all_frame_lexicals(self, fp, ip):
        self._trace("all_frame_lexicals %#x %#x" % (fp, ip))
        for thread in self._process:
            matching = [frame for frame in thread.frames if frame.fp == fp]
            if matching:
                break
        frame = matching[0]
        self._ensure_register_info(frame)

        # Get the variables that are in-scope and accessible here
        variables = [v for v in frame.GetVariables(True, True, False, True)
                     if v.error.success and not v.name.startswith('.')]

        for v in variables:
            self._trace("variable %s location %s" % (v.name, v.location))

        first = 1;
        last = len(variables)
        lookups = len(self._lookups)
        self._lookups.append(variables)
        return (first, last, lookups)

    def get_lexical_variable_name(self, table, variable):
        value = self._lookups[table][variable - 1]
        return value.name

    def lexical_variable_address(self, fp, table, variable):
        value = self._lookups[table][variable - 1]

        arg = 1 if value.value_type == lldb.eValueTypeVariableArgument else 0

        addr = value.AddressOf()
        if addr.IsValid():
            return (addr.load_addr, 0, 0, 0, arg)
        elif value.location in self._register_name:
            reg = self._register_name[value.location].index
            return (lldb.LLDB_INVALID_ADDRESS, 1, reg, reg, arg)
        else:
            index = len(self._register_index) + len(self._pseudo_register_values)
            self._trace("Assigning register index %d to %s (ID %d)"
                        % (index, value, value.GetID()))
            self._pseudo_register_values.append(value)
            return (lldb.LLDB_INVALID_ADDRESS, 1, index, index, arg)

    def lookup_symbol_name(self, table, sym):
        symbol = self._lookups[table][sym - 1]
        name = symbol.mangled
        if name == "":
            name = symbol.name
        return name

    def lookup_symbol_address(self, table, sym):
        symbol = self._lookups[table][sym - 1]
        start = symbol.addr
        address = start.GetLoadAddress(self._target)
        return address;

    def lookup_function_debug_start(self, table, sym):
        symbol = self._lookups[table][sym - 1]
        start = symbol.addr
        address = start.GetLoadAddress(self._target)
        if address != lldb.LLDB_INVALID_ADDRESS:
            debug_start = address + symbol.prologue_size
        else:
            debug_start = lldb.LLDB_INVALID_ADDRESS
        return debug_start

    def lookup_function_debug_end(self, table, sym):
        symbol = self._lookups[table][sym - 1]
        end = symbol.end_addr
        debug_end_address = end.GetLoadAddress(self._target)
        return debug_end_address

    def lookup_symbol_language(self, table, sym):
        oops()

    def lookup_function_end(self, table, sym):
        symbol = self._lookups[table][sym - 1]
        end = symbol.end_addr
        end_address = end.GetLoadAddress(self._target)
        return end_address

    def symbol_is_function(self, table, sym):
        symbol = self._lookups[table][sym - 1]
        if symbol.type == lldb.eSymbolTypeCode:
            return 1
        else:
            return 0

    def nearest_symbols(self, address):
        oops()

    def closest_symbol(self, address):
        self._trace("closest_symbol %#x" % address)
        addr = lldb.SBAddress(address, self._target)
        if addr.IsValid() and addr.module:
            module = addr.module
            lib = self._target.modules.index(module)
            symbol = addr.symbol
            actual_address = symbol.addr.GetLoadAddress(self._target)
            offset = address - actual_address
            self._name_cache = symbol.mangled
            if self._name_cache is None or self._name_cache == "":
                self._name_cache = symbol.name
            name_length = len(self._name_cache)
            type = 0
            if symbol.type == lldb.eSymbolTypeCode:
                is_function = 1
            else:
                is_function = 0
            debug_start = actual_address + symbol.prologue_size
            debug_end = symbol.end_addr.GetLoadAddress(self._target)
            language = 0
            final_address = debug_end
            return (1, lib, actual_address, offset, name_length, type,
                    is_function, debug_start, debug_end, language,
                    final_address)
        else:
            return (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    def function_bounding_addresses(self, address):
        oops()

    def closest_symbol_name(self, sz):
        self._trace("closest_symbol_name: %s" % self._name_cache)
        return self._name_cache

    def find_symbol_in_library(self, nublibrary, sz, name):
        name = name[0:sz]
        self._trace("find_symbol_in_library %d %s" % (nublibrary, name))
        module = self._target.modules[nublibrary]
        symbol = module.FindSymbol(name)
        start = symbol.addr
        address = start.GetLoadAddress(self._target)
        if symbol.type == lldb.eSymbolTypeInvalid:
            self._trace("Not found: %s" % name)
            return (0, 0, -1, 0, 0, 0, -1, 0)  # not found
        if symbol.type == lldb.eSymbolTypeCode:
            self._trace("  address = %#x" % address)
            type = -1           # currenly ignored
            if address != lldb.LLDB_INVALID_ADDRESS:
                debug_start = address + symbol.prologue_size
            else:
                debug_start = lldb.LLDB_INVALID_ADDRESS
            self._trace("  debug_start = %#x" % debug_start)
            final_address_of_definition = symbol.end_addr.GetLoadAddress(self._target)
            debug_end = final_address_of_definition
            self._trace("  final_address = %#x" % final_address_of_definition)
            symbol_language = -1
            return (1, address, type, 1,
                    debug_start, debug_end,
                    symbol_language, final_address_of_definition)
        elif symbol.type == lldb.eSymbolTypeData:
            return (1, address, -1, 0, 0, 0, -1, 0)
        else:
            raise RuntimeError("Unknown symbol type %d for %s" %
                               (symbol.type, name))
        oops()
        return (result, address, type, is_function,
                debug_start, debug_end,
                symbol_language, final_address_of_definition)

    def do_symbols(self, nublibrary, match):
        self._trace("do_symbols library:%d match: %s" % (nublibrary, match))
        module = self._target.modules[nublibrary]
        match_re = fnmatch.translate(match)
        symbols = [sym for sym in module.symbol[re.compile(match_re)]
                   if sym.type != lldb.eSymbolTypeTrampoline
                   and sym.type != lldb.eSymbolTypeUndefined]

        first = 1;
        last = len(symbols)
        lookups = len(self._lookups)
        self._lookups.append(symbols)
        return (first, last, lookups)

    def dispose_lookups(self, lookups):
        self._trace("dispose_lookups %d" % lookups)
        self._lookups[lookups] = None
        while len(self._lookups) > 0 and self._lookups[-1] is None:
            del self._lookups[-1]

    def resolve_source_location(self, nublibrary, filename, \
                                line_number, column_number):
        self._trace("resolve_source_location %d '%s' %d %d"
                    % (nublibrary, filename, line_number, column_number))
        module = self._target.modules[nublibrary]
        filespec = lldb.SBFileSpec(filename)
        for cu in module.compile_units:
            if cu.GetFileSpec() == filespec:
                candidates = [le for le in cu if le.line >= line_number]
                le = min(candidates, key=lambda le: le.line)
                if le:
                    address = le.addr.GetLoadAddress(self._target)
                    if le.line == line_number:
                        return (address, 1, 0, 0, 1)
                    else:
                        return (address, 1, 0, 0, 0)
        return (lldb.LLDB_INVALID_ADDRESS, 0, 0, 0, 0)

    def fetch_source_locations(self, start_loc, end_loc):
        self._trace("fetch_source_locations %#x %#x" % (start_loc, end_loc))
        start_addr = lldb.SBAddress(start_loc, self._target)
        end_addr = lldb.SBAddress(end_loc, self._target)

        locations = []
        if start_addr.module == end_addr.module:
            for cu in start_addr.module.compile_units:
                for le in cu:
                    address = le.addr.GetLoadAddress(self._target)
                    if start_loc <= address and address <= end_loc:
                        locations.append(le)

        table = len(self._lookups)
        self._lookups.append(locations)
        return table

    def source_location_address(self, table, index):
        le = self._lookups[table][index]
        return le.addr.GetLoadAddress(self._target)

    def source_location_linenumber(self, table, index):
        le = self._lookups[table][index]
        return le.line

    def source_location_filename(self, table):
        le = self._lookups[table][0]
        return str(le.file)

    def number_of_source_locations(self, table):
        self._trace("number_of_source_locations %d" % table)
        return len(self._lookups[table])

    def dispose_source_locations(self, table):
        self._trace("dispose_source_locations %d" % table)
        self._lookups[table] = None
        while len(self._lookups) > 0 and self._lookups[-1] is None:
            del self._lookups[-1]

    def interpret_instruction_at_current_location(self, nubthread):
        oops()

    def dylan_calculate_step_into(self, nubthread):
        oops()

    def dylan_thread_environment_block_address(self, nubthread):
        self._trace("dylan_thread_environment_block_address %#x" % nubthread)
        #lldb.debugger.HandleCommand('thread list')

        thread = self._process.GetThreadByID(nubthread)
        suspended = thread.is_suspended
        if suspended:
            self._trace("Temporarily resuming thread %#x" % nubthread)
            thread.Resume()

        v = self._evaluate(thread, "spy_teb()", stop_others=True)

        if suspended:
            self._trace("Suspending thread %#x" % nubthread)
            thread.Suspend()

        if v.IsValid() and v.GetError().Success():
            self._trace("TEB for %#x: %s" % (nubthread, v))
            return (v.GetValueAsUnsigned(), 1)
        else:
            return (0, 0)

    def dylan_thread_mv_buffer_live(self, nubthread):
        oops()

    def older_stack_frame(self, this_one, than_this_one):
        oops()

    def dylan_current_function(self, nubthread):
        oops()

    def perform_absolute_relocation(self, address, destination):
        oops()

    def recover_breakpoint(self, nubthread):
        self._trace("recover_breakpoint %#x" % nubthread)
        # FIXME don't need to do anything?

    def get_process_wall_clock_time(self, thread):
        oops()

    def register_exit_process_function(self, exitprocess):
        self._trace("register_exit_process_function %#x" % exitprocess)
        # don't need to do anything

    def open_local_tether(self, command, args, paths, lib_paths,
                          working_directory, create_shell):
        self._dispatcher.set_launch_state(EventDispatcher.LAUNCHING)

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
        argv = args.split()
        self._process = self._target.Launch(self._listener,
                                            argv[1:], # argv
                                            None,     # envp
                                            None,     # stdin_path
                                            '/tmp/stdout.txt',      # stdout_path
                                            '/tmp/stderr.txt',      # stderr_path
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
        logger = lldb.formatters.Logger.Logger()
        logger.write(string)

    def CreateNub(self, process_name, remote_machine):
        servant = RemoteNub_i(process_name, remote_machine)
        poa = self._default_POA()
        objid  = poa.activate_object(servant)
        ref = poa.id_to_reference(objid)
        return ref

    def DestroyNub(self, nub):
        self._trace("DestroyNub")
        nub.CloseNub()

    def RegisterNub(self, nub, process_name, process_id, remote_machine):
        oops()

    def ShutdownServer(self, nub):
        oops()

    def get_local_hostname(self):
        return socket.gethostname()

    def verify_local_password(self, password, remote_machine):
        self._trace("Verify password %s for %s" % (password, remote_machine))
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
    #lldb.debugger.EnableLog("lldb", ["all"])

    parser = argparse.ArgumentParser(description='Open Dylan debugger server')
    parser.add_argument('--debug', default=False, action='store_true', 
                        help='Enable debugging log')

    args = parser.parse_args()
    if args.debug:
        lldb.formatters.Logger._lldb_formatters_debug_level = 2

    # Stop when a shared library is loaded
    lldb.debugger.HandleCommand('settings set target.process.stop-on-sharedlibrary-events true')

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
