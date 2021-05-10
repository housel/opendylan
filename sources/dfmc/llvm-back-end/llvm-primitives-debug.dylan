Module: dfmc-llvm-back-end
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              Additional code is Copyright 2009-2013 Gwydion Dylan Maintainers
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

// %running-under-dylan-debugger? is a variable which indicates
// whether there is an interest in communicating with the debugger. By
// default it is set to 0. The Dylan debugger will set it to something
// else if it is involved in communication with the app.
//
define runtime-variable %running-under-dylan-debugger? :: <raw-integer>
  = make-raw-literal(0);

define function op--inside-debugger? (be :: <llvm-back-end>) => (debugging-cmp :: <llvm-value>)
  let m = be.llvm-builder-module;
  let global
    = llvm-runtime-variable(be, m, %running-under-dylan-debugger?-descriptor);
  let inside?-raw = ins--load(be, global, volatile?: #t);
  ins--icmp-ne(be, inside?-raw, 0)
end function;

define side-effecting stateless dynamic-extent &runtime-primitive-descriptor primitive-inside-debugger? () => (debugging? :: <boolean>);
  let inside-cmp = op--inside-debugger?(be);
  op--boolean(be, inside-cmp)
end;

/*
define side-effecting stateful dynamic-extent &runtime-primitive-descriptor primitive-break () => ()
  //---*** Fill this in...
end;
*/

define side-effecting stateful dynamic-extent &runtime-primitive-descriptor primitive-invoke-debugger
    (format-string :: <byte-string>, arguments :: <simple-object-vector>)
 => ();
  ins--call-intrinsic(be, "llvm.debugtrap", vector())
end;

define side-effecting stateless dynamic-extent &runtime-primitive-descriptor primitive-debug-message
    (format-string :: <byte-string>, arguments :: <simple-object-vector>)
 => ()
  let inside-cmp = op--inside-debugger?(be);
  ins--if (be, inside-cmp)
    ins--call-intrinsic(be, "llvm.debugtrap", #[]);
  end ins--if
end;

// Called by the GC
define c-callable auxiliary &runtime-primitive-descriptor class-allocation-break
    (string :: <raw-byte-string>, class :: <class>,
     count :: <raw-c-signed-int>, size :: <raw-c-signed-int>)
 => (result :: <object>);
  let module = be.llvm-builder-module;
  ins--call-intrinsic(be, "llvm.debugtrap", #[]);
  emit-reference(be, module, &false)
end;

// %running-dylan-spy-function? is a variable that indicates
// whether or not the debugger is executing a function via the spy thread.
// By default it is set to 0. The Dylan debugger will set it to something
// else if it is executing code within the app.
//
define runtime-variable %running-dylan-spy-function? :: <raw-integer>
  = make-raw-literal(0);

// This is just like call-dylan-function except that it sets
// %running-dylan-spy-function? while it is active
define c-callable auxiliary &runtime-primitive-descriptor spy-call-dylan-function
    (fn :: <function>, n :: <raw-integer>, #rest args)
 => (primary :: <object>)
  let word-size = back-end-word-size(be);
  let m = be.llvm-builder-module;

  let va-list = op--va-decl-start(be);
  let optargs = op--va-list-to-stack-vector(be, va-list, n);
  op--va-end(be, va-list);

  let args = op--stack-allocate-vector(be, 1);
  call-primitive(be, primitive-vector-element-setter-descriptor,
                 optargs, args, llvm-back-end-value-function(be, 0));

  let global
    = llvm-runtime-variable(be, m, %running-dylan-spy-function?-descriptor);
  ins--store(be, 1, global, alignment: word-size);

  let fn-cast = op--object-pointer-cast(be, fn, #"<function>");
  let args-cast = op--object-pointer-cast(be, args, #"<simple-object-vector>");

  let mv = call-primitive(be, primitive-apply-descriptor, fn-cast, args-cast);

  ins--store(be, 0, global, alignment: word-size);

  ins--extractvalue(be, mv, 0)
end;

// Read memory on behalf of the debugger, using code so that garbage
// collector read barriers will have a chance to take effect.
define c-callable auxiliary &runtime-primitive-descriptor spy-read-location-through-barrier
    (address :: <raw-pointer>) => (value :: <raw-machine-word>);
  let word-size = back-end-word-size(be);
  let raw-machine-word-type
    = llvm-reference-type(be, dylan-value(#"<raw-machine-word>"));
  let ptr = ins--bitcast(be, address, llvm-pointer-to(be, raw-machine-word-type));
  ins--load(be, ptr, alignment: word-size)
end;

// Write memory on behalf of the debugger, using code so that garbage
// collector write barriers will have a chance to take effect.
define c-callable auxiliary &runtime-primitive-descriptor spy-write-location-through-barrier
    (address :: <raw-pointer>, value :: <raw-machine-word>) => ();
  let word-size = back-end-word-size(be);
  let raw-machine-word-type
    = llvm-reference-type(be, dylan-value(#"<raw-machine-word>"));
  let ptr = ins--bitcast(be, address, llvm-pointer-to(be, raw-machine-word-type));
  ins--store(be, value, ptr, alignment: word-size);
end;

define c-callable auxiliary &runtime-primitive-descriptor spy-exit-application
    () => ();
  let zero = llvm-back-end-value-function(be, 0);
  call-primitive(be, primitive-exit-application-descriptor, zero);
end;

define c-callable auxiliary &runtime-primitive-descriptor spy-fixup-imported-dylan-data
    (lo :: <raw-pointer>, hi :: <raw-pointer>) => ();
  ins--call-intrinsic(be, "llvm.trap", vector()); // FIXME
  ins--unreachable(be);
end;

define c-callable auxiliary &runtime-primitive-descriptor spy-fixup-unimported-dylan-data
    (lo :: <raw-pointer>, hi :: <raw-pointer>) => ();
  ins--call-intrinsic(be, "llvm.trap", vector()); // FIXME
  ins--unreachable(be);
end;

define C-callable auxiliary &runtime-primitive-descriptor spy-teb
  () => (teb :: <raw-pointer>);
  let raw-pointer-type = llvm-reference-type(be, dylan-value(#"<raw-pointer>"));
  ins--bitcast(be, op--teb(be), raw-pointer-type)
end;
