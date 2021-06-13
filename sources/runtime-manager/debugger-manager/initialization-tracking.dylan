module:      dm-internals
synopsis:    Describing dylan libraries in the target application,
             and tracking their static and dynamic initializations.
author:      Paul Howard
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// NOTE-LIBRARY-LOADED
//    Records which Dylan libraries are included in a shared library
//    or executable, and installs initialization trackers when needed.

define function note-library-loaded
    (application :: <debug-target>, remote-library :: <remote-library>)
 => ()
  let top-level-name = application.top-level-library-definition-name;

  local
    method note-init-symbol (sym :: <remote-symbol>)
      let library-name
        = demangle-glue-init-name(sym.remote-symbol-name);
      application.library-component-names[library-name] := remote-library;
      debugger-message("Located %s library init", library-name);

      let needs-tracking? = #f;
      let top-level? = #f;
      if (library-name = "dylan")
        register-dylan-library(application, remote-library);
        register-dylan-runtime-library(application, remote-library);
        needs-tracking? := #t;
      elseif (library-name = top-level-name)
        needs-tracking? := #t;
        top-level? := #t;
      end if;
      debugger-message("%s needs-tracking?=%= top-level?=%=", library-name, needs-tracking?, top-level?);

      if (needs-tracking?)
        application.library-initialization-trackers[remote-library]
          := make(<dylan-library-initialization-tracker>,
                  debug-target: application,
                  remote-library: remote-library,
                  top-level?: top-level?,
                  initializer-function: sym);
      end if;
    end;

  let symbol-glob
    = if (application.debug-target-platform-name == #"x86-win32")
        "_Init_*_"
      else
        "_Init_*__X"
      end;
  do-symbols(note-init-symbol,
             application.debug-target-access-path,
             library: remote-library,
             matching: symbol-glob);
end function;


///// NOTE-LIBRARY-UNLOADED

define function note-library-unloaded
    (application :: <debug-target>, remote-library :: <remote-library>)
 => ()
  if (remote-library == application.application-dylan-library)
    deregister-dylan-library(application);
  end if;
  if (remote-library == application.application-dylan-runtime-library)
    deregister-dylan-runtime-library(application);
  end if;
  let tracker
    = element(application.library-initialization-trackers, remote-library,
              default: #f);
  if (tracker)
    tracker.tracker-initialization-state := #"unloaded";
  end if;
end function;


///// <INITIALIZATION-STATE>
//    Describes the states in which a dylan library can be.

define constant <initialization-state> =
   one-of(#"uninitialized", 
          #"statically-initialized", 
          #"dynamically-initialized",
          #"unloaded",
          #"foreign");


///// <LIBRARY-INITIALIZATION-PHASE>
//    Either START or END.

define constant <library-initialization-phase> = one-of(#"start", #"end");


///// HANDLE-LIBRARY-INITIALIZATION-PHASE
//    An open generic to allow clients to perform specific processing
//    when various libraries begin and end their initializations.
//    (The default method does nothing, and registers no interest).

define open generic handle-library-initialization-phase
    (application :: <debug-target>, thread :: <remote-thread>,
     remote-library :: <remote-library>, 
     phase :: <library-initialization-phase>, top-level? :: <boolean>)
 => (interested? :: <boolean>);

define method handle-library-initialization-phase
    (application :: <debug-target>, thread :: <remote-thread>,
     remote-library :: <remote-library>, 
     phase :: <library-initialization-phase>, top-level? :: <boolean>)
 => (interested? :: <boolean>)
  #f
end method;


///// <LIBRARY-INITIALIZATION-TRACKER>
//    Contains all of the information to associate <remote-library> with
//    <dylan-library>, and the information necessary to track the
//    initialization of libraries.

define abstract class <library-initialization-tracker> (<object>)
  constant slot tracker-debug-target :: <debug-target>,
    required-init-keyword: debug-target:;

  constant slot tracker-remote-library :: <remote-library>,
    required-init-keyword: remote-library:;

  slot tracker-initialization-state :: <initialization-state>;

  constant slot tracker-top-level? :: <boolean>,
    required-init-keyword: top-level?:;
end class;

/*
define class <foreign-library-initialization-tracker> 
    (<library-initialization-tracker>)
  inherited slot tracker-initialization-state,
    init-value: #"foreign";
end class;
*/

define class <dylan-library-initialization-tracker> 
    (<library-initialization-tracker>)
  inherited slot tracker-initialization-state,
    init-value: #"uninitialized";

  constant slot tracker-initialization-symbol :: <remote-symbol>,
    required-init-keyword: initializer-function:;
end class;


///// INITIALIZE (<DYLAN-LIBRARY-INITIALIZATION-TRACKER>)

define sealed method initialize
    (entry-init :: <dylan-library-initialization-tracker>, #key) => ()
  let lib = entry-init.tracker-remote-library;
  let target = entry-init.tracker-debug-target;
  let path = target.debug-target-access-path;
  let init-fun = entry-init.tracker-initialization-symbol;
  let tracer = make(<starting-dynamic-initialization>,
                    address: init-fun.remote-symbol-address,
                    callback: dynamic-initializer-start-callback,
                    return-callback: dynamic-initializer-done-callback,
                    tracker: entry-init);
  register-debug-point(target, tracer);
end method;


///// <STARTING-DYNAMIC-INITIALIZATION>
//    A one-shot entry tracepoint that is signalled when a dylan library
//    begins its dynamic initialization. When this tracepoint is
//    signalled, the library is known to be statically initialized.

define class <starting-dynamic-initialization> (<entry-tracepoint>)
  constant 
    slot 
      entry-initialization-tracker :: <dylan-library-initialization-tracker>,
      required-init-keyword: tracker:;
end class;


///// <DONE-DYNAMIC-INITIALIZATION>
//    A one-shot exit tracepoint that is signalled when a dylan library
//    has finished its dynamic initialization.

define class <done-dynamic-initialization> (<return-tracepoint>)
  constant
    slot 
      exit-initialization-tracker :: <dylan-library-initialization-tracker>,
      required-init-keyword: tracker:;
end class;


///// MAKE-RETURN-TRACEPOINT
//    Instructs the DM to make a <done-dynamic-initialization> object
//    when a <starting-dynamic-initialization> tracepoint is signalled.

define sealed method make-return-tracepoint
    (application :: <debug-target>, entry :: <starting-dynamic-initialization>,
     thread :: <remote-thread>, #rest keys, #key, #all-keys)
 => (ret :: <done-dynamic-initialization>)
  apply(make, <done-dynamic-initialization>, 
        tracker: entry.entry-initialization-tracker,
        keys)
end method;


///// DYNAMIC-INITIALIZER-START-CALLBACK
//    The callback routine for the entry tracepoint.

define method dynamic-initializer-start-callback
    (application :: <debug-target>, start :: <starting-dynamic-initialization>,
     thread :: <remote-thread>)
 => (interested? :: <boolean>)
  ignore
    (start.entry-initialization-tracker.tracker-initialization-state);
  start.entry-initialization-tracker.tracker-initialization-state :=
     #"statically-initialized";
  unless (application.temporary-download-block)
    allocate-temporary-download-block-in(application, thread);
  end unless;
  if (start.entry-initialization-tracker.tracker-top-level?)
    debugger-message("This is top-level, doing extra initialization now");
    initialize-static-keywords(application, thread);
    debugger-message("Extra top-level initialization done");
  end if;
  handle-library-initialization-phase
    (application, thread,
     start.entry-initialization-tracker.tracker-remote-library,
     #"start",
     start.entry-initialization-tracker.tracker-top-level?);
end method;


///// DYNAMIC-INITIALIZER-DONE-CALLBACK
//    The callback routine for the exit tracepoint.

define method dynamic-initializer-done-callback
    (application :: <debug-target>, done :: <done-dynamic-initialization>,
     thread :: <remote-thread>)
  => (interested? :: <boolean>)
  deregister-debug-point(application, done);
  deregister-debug-point(application, done.corresponding-entry-tracepoint);
  done.exit-initialization-tracker.tracker-initialization-state := 
     #"dynamically-initialized";
  debugger-message("Tracker for %s state set to dynamically-initialized (done)",
                done.exit-initialization-tracker.tracker-remote-library.library-core-name);
  handle-library-initialization-phase
    (application, thread,
     done.exit-initialization-tracker.tracker-remote-library,
     #"end",
     done.exit-initialization-tracker.tracker-top-level?);
end method;


///// REGISTER-DYLAN-RUNTIME-LIBRARY
//    Called when the target application loads the DLL that is known to
//    correspond to the Dylan library.
//    (At time of writing, it is called HQN-DYLAN.DLL, but we use a
//    compiler API to determine this where possible)

define method register-dylan-library
    (application :: <debug-target>, dylan-library :: <remote-library>)
 => ()
  debugger-message("Registering Dylan library %=", dylan-library);
  application.application-dylan-library := dylan-library;
  application.dylan-application? := #t;
  application.dylan-spy := make(<dylan-spy-catalogue>);
  initialize-static-wrappers(application);
  initialize-static-objects(application);
end method;

define method deregister-dylan-library (application :: <debug-target>) => ()
  application.application-dylan-library := #f;
  application.dylan-application? := #f;
  // Trash the directory of wrappers and objects.
  application.static-object-directory := make(<static-object-directory>);
end method;


///// REGISTER-DYLAN-RUNTIME-LIBRARY
//    Called when the target applications loads the DLL that is known to
//    contain the lowlevel dylan runtime system. We use a compiler API to
//    determine this. At time of writing, it is HQN-DYLAN.DLL, ie. the same
//    as the Dylan library.

define constant $running-under-dylan-debugger?
  = "%running-under-dylan-debugger?";

define method register-dylan-runtime-library
    (application :: <debug-target>, runtime-library :: <remote-library>)
  => ()
  debugger-message("Registering Dylan runtime library %=", runtime-library);
  let path = application.debug-target-access-path;
  let one = as-remote-value(1);
  application.application-dylan-runtime-library := runtime-library;
  application.C-spy := make(<C-spy-catalogue>);
  locate-runtime-primitives(application);
  let platform-name = application.debug-target-platform-name;
  let debug-variable-name
    = mangle-name-raw($basic-mangler, $running-under-dylan-debugger?);
  let mangled-variable-name
    = if (platform-name == #"x86-win32")
        concatenate("_", debug-variable-name)
      else
        debug-variable-name
      end if;
  let debug-variable-sym =
    find-symbol(path, mangled-variable-name,
                library: runtime-library);
  if (debug-variable-sym)
    write-value(path, debug-variable-sym.remote-symbol-address, one);
  end if;
end method;

define method deregister-dylan-runtime-library
    (application :: <debug-target>) => ()
  application.application-dylan-runtime-library := #f;
  invalidate-runtime-primitives(application);
end method;


///// TOP-LEVEL-LIBRARY-DEFINITION-NAME
//    Where possible, calls the compiler to determine the name of the
//    top-level dylan library. (This means "library" in the Dylan
//    language sense, and not the component sense). The result is coerced
//    to lower case.

define method top-level-library-definition-name
   (application :: <debug-target>) => (name :: <string>)
  let context = application.debug-target-compilation-context;
  let name =
    (context & context.compilation-context-library-name) |
    application.top-level-component-name |
    "unknown";
  as-lowercase(name);
end method;
