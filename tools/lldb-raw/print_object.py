#!/usr/bin/env python

import lldb
import shlex
import sys
import struct

OBJECT_TAG = 0
INTEGER_TAG = 1
BYTE_CHARACTER_TAG = 2
UNICODE_CHARACTER_TAG = 3

class DylanObjectPrinter:
    def __init__(self, target, stream):
        self.target = target
        self.process = target.process
        self.word_size = target.GetAddressByteSize()
        self.stream = stream

    def get_wrapper(self, addr):
        error = lldb.SBError()
        wrapper = self.process.ReadPointerFromMemory(addr, error)
        if error.Success():
            return wrapper
        else:
            raise Exception(error.description)

    def get_slot(self, addr, slot):
        error = lldb.SBError()
        slot_ptr = addr + (slot + 1) * self.word_size
        value = self.process.ReadPointerFromMemory(slot_ptr, error)
        if error.Success():
            return value
        else:
            raise Exception(error.description)

    def get_string(self, addr):
        wrapper = self.get_wrapper(addr)
        wrapperaddr = self.target.ResolveLoadAddress(wrapper)
        wrappersym = wrapperaddr.symbol.name
        if wrappersym != 'KLbyte_stringGVKdW':
            raise Exception("%#x is not a <byte-string>" % addr)

        size = self.get_slot(addr, 0) >> 2
        string_addr = addr + 2 * self.word_size
        error = lldb.SBError()
        if size == 0:
            return ""
        elif size < 256:
            value = self.process.ReadMemory(string_addr, size, error)
            return value
        else:
            value = self.process.ReadMemory(string_addr, 256, error)
            return value + "... [size=%d]" % size

    def get_class_name(self, addr):
        wrapper = self.get_wrapper(addr)
        implementation_class_addr = self.get_slot(wrapper, 0)
        object_class_addr = self.get_slot(implementation_class_addr, 1)
        debug_name_addr = self.get_slot(object_class_addr, 1)
        return self.get_string(debug_name_addr)

    def print_object(self, addr):
        tag = addr & 3
        if addr == 0:
            self.stream.write("nullptr")
        elif tag == OBJECT_TAG:
            wrapper = self.get_wrapper(addr)
            wrapperaddr = self.target.ResolveLoadAddress(wrapper)
            wrappersym = wrapperaddr.symbol.name

            if wrappersym in DylanObjectPrinter.WRAPPER_PRINTER:
                print_method = DylanObjectPrinter.WRAPPER_PRINTER[wrappersym]
                print_method(self, addr)
            else:
                try:
                    self.stream.write("{%s: #x%x}" % (self.get_class_name(addr), addr))
                except Exception:
                    resolved = self.target.ResolveLoadAddress(addr)
                    addrsym = resolved.symbol.name
                    if addrsym:
                        self.stream.write("{???: #x%x (%s)}" % (addr, addrsym))
                    else:
                        self.stream.write("{???: #x%x}" % addr)
        elif tag == INTEGER_TAG:
            self.stream.write("%d" % (addr >> 2))
        else:
            self.stream.write("'%c'" % chr(addr >> 2))

    def print_sov(self, addr):
        size = self.get_slot(addr, 0) >> 2
        self.stream.write('#[')
        for i in range(0, size):
            if i > 0: self.stream.write(', ')
            self.print_object(self.get_slot(addr, 1 + i))
        self.stream.write(']')

    def print_pair(self, addr):
        self.stream.write('#(')
        while True:
            head = self.get_slot(addr, 0)
            self.print_object(head)
            addr = self.get_slot(addr, 1)
            wrapper = self.get_wrapper(addr)
            wrapperaddr = self.target.ResolveLoadAddress(wrapper)
            if wrapperaddr.symbol.name != 'KLpairGVKdW': break
            self.stream.write(', ')
        self.stream.write(')')

    def print_nil(self, addr):
        self.stream.write('#()')

    def print_byte_string(self, addr):
        value = self.get_string(addr)
        self.stream.write('"%s"' % value)

    def print_symbol(self, addr):
        self.stream.write('#')
        self.print_byte_string(self.get_slot(addr, 0))

    def print_boolean(self, addr):
        resolved = self.target.ResolveLoadAddress(addr)
        if resolved.symbol.name == 'KPfalseVKi':
            self.stream.write('#f')
        elif resolved.symbol.name == 'KPtrueVKi':
            self.stream.write('#t')
        else:
            raise Exception('Bad <boolean>')

    def print_class(self, addr):
        name_addr = self.get_slot(addr, 1)
        name = self.get_string(name_addr)
        self.stream.write("{<class>: %s #x%x}" % (name, addr))

    def print_gf(self, addr):
        name_addr = self.get_slot(addr, 3)
        name = self.get_string(name_addr)
        self.stream.write("{%s: %s #x%x}" % (self.get_class_name(addr), name, addr))

    def print_single_float(self, addr):
        error = lldb.SBError()
        float_addr = addr + 1 * self.word_size
        float_bytes = self.process.ReadMemory(float_addr, 4, error)
        float_value, = struct.unpack('f', float_bytes)
        self.stream.write("{%s: %g #x%x}" % (self.get_class_name(addr), float_value, addr))

    WRAPPER_PRINTER = { 'KLsimple_object_vectorGVKdW' : print_sov,
                        'KLpairGVKdW' : print_pair,
                        'KLempty_listGVKdW' : print_nil,
                        'KLbyte_stringGVKdW' : print_byte_string,
                        'KLsymbolGVKdW' : print_symbol,
                        'KLbooleanGVKdW' : print_boolean,
                        'KLclassGVKdW' : print_class,
                        'KLincremental_generic_functionGVKeW' : print_gf,
                        'KLsealed_generic_functionGVKeW' : print_gf,
                        'KLsingle_floatGVKdW' : print_single_float }

    def print_slots(self, addr):
        tag = addr & 3
        if tag == OBJECT_TAG:
            wrapper = self.get_wrapper(addr)
            implementation_class_addr = self.get_slot(wrapper, 0)
            instance_slots = self.get_slot(implementation_class_addr, 4)
            instance_slots_size = self.get_slot(instance_slots, 0) >> 2
            for i in range(0, instance_slots_size):
                slot_descriptor = self.get_slot(instance_slots, 1 + i)
                slot_getter = self.get_slot(slot_descriptor, 4)
                getter_name = self.get_slot(slot_getter, 3)
                self.stream.write("%s :: " % self.get_string(getter_name))
                slot_type = self.get_slot(slot_descriptor, 6)
                self.print_object(slot_type)
                self.stream.write("\n    ")
                self.print_object(self.get_slot(addr, i))
                self.stream.write("\n")

            vw = self.get_slot(wrapper, 3)
            vf = vw & 7
            if vf == 2:
                repeated_size = self.get_slot(addr, instance_slots_size - 1) >> 2
                for i in range(0, repeated_size):
                    self.stream.write("[%d]\n    " % i)
                    value = self.get_slot(addr, instance_slots_size + i)
                    self.print_object(value)
                    self.stream.write("\n")
            elif vf == 4 or vf == 5:
                repeated_size = self.get_slot(addr, instance_slots_size - 1) >> 2
                es = 1 << ((vw >> 3) & 0xFFFF)
                if es == 8:
                    error = lldb.SBError()
                    repeated_addr = addr + (instance_slots_size + 1) * self.word_size
                    bytes = self.process.ReadMemory(repeated_addr, repeated_size, error)
                    for i in range(0, repeated_size):
                        if (i % 16) > 0: self.stream.write(" ")
                        self.stream.write("%02x" % ord(bytes[i]))
                        if (i % 16) == 15: self.stream.write("\n")
            elif vf != 7:
                self.stream.write("vf = %d\n" % vf)
        elif tag == INTEGER_TAG:
            raise Exception("An <integer> has no slots")
        else:
            raise Exception("A <character> has no slots")

def print_object_cmd(debugger, command, result, dict):
    target = debugger.GetSelectedTarget()
    printer = DylanObjectPrinter(target, sys.stdout)

    for arg in shlex.split(command):
        printer.print_object(int(arg, 0))
        sys.stdout.write("\n")

def print_slots_cmd(debugger, command, result, dict):
    target = debugger.GetSelectedTarget()
    printer = DylanObjectPrinter(target, sys.stdout)

    for arg in shlex.split(command):
        printer.print_slots(int(arg, 0))

lldb.debugger.HandleCommand('command script add -f %s.print_object_cmd print_object' % __name__)
lldb.debugger.HandleCommand('command script add -f %s.print_slots_cmd print_slots' % __name__)
