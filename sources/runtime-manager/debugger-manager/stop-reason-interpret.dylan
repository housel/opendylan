module:       dm-internals
synopsis:     Building DM-level stop-reasons out of access-path stop reasons.
author:       Paul Howard
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


// HACK! We need some standard initializers for self-contained
// Dylan components; here is one such marker for Win32 OLE components

// define constant $standard-dylan-component-initializer
//   = "_DllGetClassObject@12";


///// INTERPRET-STOP-REASON
//    Takes a stop reason, and returns #f if the stop reason can be
//    handled by the DM internals. Otherwise, it returns a stop reason
//    which may or may not be modified from the original.

//    The second return value will be #t if some debug points were
//    processed, and one or more of them registered interest at the
//    current context. 

//    Example:
//    The low-level <invoke-debugger-stop-reason> may translate to 
//    <dylan-invoke-debugger-stop-reason> (corresponding to an unhandled
//    dylan condition), or a <dylan-debug-message-stop-reason>.

//    All housekeeping is performed within this function.

define method interpret-stop-reason
    (application :: <debug-target>, stop-reason :: <stop-reason>)
       => (maybe-modified-stop-reason :: false-or(<stop-reason>),
           interesting-debug-points? :: <boolean>,
           original-stop-reason :: <stop-reason>);

  let maybe-modified-stop-reason = #f;
  let path = application.debug-target-access-path;
  let interesting-debug-points? = #f;

  select (stop-reason by instance?)

    <invoke-debugger-stop-reason> =>

       // If this is a dylan-level invocation of the debugger,
       // generate the required high-level stop reason. Otherwise,
       // just keep with this stop reason.

       let thread = stop-reason.stop-reason-thread;
       let process = stop-reason.stop-reason-process;
       let dm-thread = find-thread(application, thread);
       dm-thread.thread-pause-state-description := #"known-location";

       let top-stack-frame =
         initialize-stack-trace(path, thread);
       let code-location =
         frame-instruction-address(path, top-stack-frame);
       if (address-corresponds-to-primitive?
            (application, code-location, 
             application.debug-message-primitive))

         // This is a hard-coded breakpoint within primitive-debug-message.
         // We know that the control string for the message is at top of
         // stack, followed by a (raw) integer counting the format arguments,
         // followed in turn by each format argument. We calculate the
         // stack relative addresses and read the relevant values.

         use-thread-for-spy-functions(application, thread);
         dm-thread.thread-pause-state-description := #"interactive-location";

         block ()
           let platform-name = application.debug-target-platform-name;
           let (control-string, arg-vector)
             = debug-primitive-format-arguments(application, thread,
                                                top-stack-frame);

           // Construct our language-level stop reason for the dylan
           // debugging message. Note we are not formatting the string and
           // arguments at this stage. We will do that later on demand.

           maybe-modified-stop-reason :=
              make(<dylan-debug-message-stop-reason>,
                   process: process,
                   thread: thread,
                   target: application,
                   string-instance: control-string,
                   format-args: arg-vector);

         exception (<remote-access-violation-error>)
           maybe-modified-stop-reason := stop-reason;
         end block;

       elseif (address-corresponds-to-primitive?
                (application, code-location,
                 application.invoke-debugger-primitive))

         // This is a hard-coded breakpoint within primitive-invoke-debugger.

         use-thread-for-spy-functions(application, thread);
         dm-thread.thread-pause-state-description := #"unhandled-condition";

         // Initialize the static-keywords
         // now if they have not been initialized already.
         unless (application.temporary-download-block)
          allocate-temporary-download-block-in(application, thread);
          initialize-static-keywords(application, thread);
         end unless;

         block ()
           let (control-string, arg-vector)
             = debug-primitive-format-arguments(application, thread,
                                                top-stack-frame);

           // Construct our language-level stop reason for the dylan
           // error. Note we are not formatting the string and
           // arguments at this stage. We will do that later on demand.

	   maybe-modified-stop-reason :=
	     make(<dylan-invoke-debugger-stop-reason>,
		  process: process,
		  thread: thread,
		  target: application,
		  string-instance: control-string,
		  format-args: arg-vector);

         exception (<remote-access-violation-error>)
           maybe-modified-stop-reason := stop-reason;
         end block;

       elseif (address-corresponds-to-primitive?
                (application, code-location,
                 application.class-breakpoint-primitive))

         // This is a hard-coded breakpoint within primitive-invoke-debugger.
         // We know that the control string for the error msg is at top of
         // stack, followed by a (raw) integer counting the format arguments,
         // followed in turn by each format argument. We calculate the
         // stack relative addresses and read the relevant values.

         use-thread-for-spy-functions(application, thread);
         dm-thread.thread-pause-state-description := #"unhandled-condition";

         block ()

	   let class-address
	     = calculate-stack-address(path, thread, 0);
	   let size-address 
	     = calculate-stack-address(path, thread, 1);
	   let size = as-integer(read-value(path, size-address));
           let class = read-value(path, class-address);

           // Construct our language-level stop reason for the dylan
           // error. Note we are not formatting the string and
           // arguments at this stage. We will do that later on demand.

	   maybe-modified-stop-reason :=
	     make(<class-breakpoint-stop-reason>,
		  process: process,
		  thread: thread,
		  size: size,
		  class: class);

         exception (<remote-access-violation-error>)
           maybe-modified-stop-reason := stop-reason;
         end block;

       else
         maybe-modified-stop-reason := stop-reason;
       end if;

    <create-thread-stop-reason> =>
       maybe-modified-stop-reason := stop-reason;
       create-thread-descriptor(application, stop-reason.stop-reason-thread);

    <exit-thread-stop-reason> =>
       maybe-modified-stop-reason := stop-reason;
       stop-profiling-thread(application, stop-reason.stop-reason-thread);

    <create-process-stop-reason> =>
       maybe-modified-stop-reason := stop-reason;
       application.up-and-running? := #t;
       create-thread-descriptor(application, stop-reason.stop-reason-thread);
       application.application-primary-thread := 
           stop-reason.stop-reason-thread;
       let lib = stop-reason.stop-reason-executable-component;
       application.application-executable := lib;
       note-library-loaded(application, lib);

    <exit-process-stop-reason> =>
       stop-profiling(application);
       maybe-modified-stop-reason := stop-reason;
       application.up-and-running? := #f;

    <load-library-stop-reason> =>
       maybe-modified-stop-reason := stop-reason;
       let lib :: <remote-library> = stop-reason.stop-reason-library;
       note-library-loaded(application, lib);

    <unload-library-stop-reason> =>
       maybe-modified-stop-reason := stop-reason;
       let lib = stop-reason.stop-reason-library;
       note-library-unloaded(application, lib);

    <source-step-stop-reason> =>
      // We have performed a source-stepping operation. If this was
      // due to a request for source-code alignment, we need to
      // modify the stop-reason.

      let dm-thread = find-thread(application, stop-reason.stop-reason-thread);
      use-thread-for-spy-functions
        (application, stop-reason.stop-reason-thread);
      dm-thread.thread-pause-state-description := #"known-location";
      if (dm-thread.stepping-mode == $thread-aligning-to-recorded-location)
        maybe-modified-stop-reason :=
          make(<source-code-alignment-stop-reason>,
               process: stop-reason.stop-reason-process,
               thread: stop-reason.stop-reason-thread)
      else
        maybe-modified-stop-reason := stop-reason;
      end if;

    <debug-point-stop-reason> =>
      // Select the registered debug points for processing. Generate a
      // list of all of those that registered interest in the current
      // context. Discard the stop reason if no callbacks registered any
      // interest.

      let dm-thread = find-thread(application, stop-reason.stop-reason-thread);
      use-thread-for-spy-functions
         (application, stop-reason.stop-reason-thread);
      dm-thread.thread-pause-state-description := #"known-location";

      let interesting-debug-points =
        process-debug-points(application, stop-reason);
      if (size(interesting-debug-points) == 0)
        clear-deregistered-debug-points(application);
      else
        application.signalling-debug-points := interesting-debug-points;
        interesting-debug-points? := #t;
      end if;

    <profiler-stop-reason> =>
      // Just call the function to take another application snapshot.
      take-application-snapshot(application);

    // For now make timeouts triggered on an incoming event uninteresting,
    // but this requires more work; in particular, this should behave the
    // same way as normal timeouts (not currently modelled as a stop-reason),
    // and poll for stop callbacks before waiting on the running application

    <timeout-stop-reason> => #f;

    otherwise =>
      // Just keep with this stop reason.
      maybe-modified-stop-reason := stop-reason;

  end select;
  values(maybe-modified-stop-reason, interesting-debug-points?, stop-reason);
end method;

define function debug-primitive-format-arguments
    (application :: <debug-target>, thread :: <remote-thread>,
     top-frame :: <function-frame>)
 => (control-string :: <remote-value>, arg-vector :: <vector>);
  let path = application.debug-target-access-path;
  let platform-name = application.debug-target-platform-name;
  if (platform-name == #"x86-win32")
    // We know that the control string for the error msg is at top of
    // stack, followed by a (raw) integer counting the format arguments,
    // followed in turn by each format argument. We calculate the
    // stack relative addresses and read the relevant values.
    let control-string-address
      = calculate-stack-address(path, thread, 0);
    let format-arg-count-address
      = calculate-stack-address(path, thread, 1);
    let control-string :: <remote-value>
      = read-value(path, control-string-address);
    let counter-value :: <remote-value>
      = read-value(path, format-arg-count-address);
    let actual-counter = as-integer(counter-value);

    // Now build a vector of the right size to hold the format
    // arguments. Pull each one off the stack in turn.

    let arg-vector = make(<vector>, size: actual-counter);
    for (i from 0 below actual-counter)
      let arg-address
        = calculate-stack-address(path, thread, i + 2);
      arg-vector[i] := read-value(path, arg-address);
    end for;
    values (control-string, arg-vector)
  else
    // For other platforms, we make use of lexical variable debug
    // information to obtain the format-string and argument vector
    // from the debug primitive's argument list.
    let format-string = #f;
    let arguments = #f;
    do-frame-arguments(method (lexical :: <lexical-variable>)
                         let name = lexical.lexical-variable-name;
                         let value
                           = read-value(path, lexical.lexical-variable-address);
                         if (name = "format-string")
                           format-string := value;
                           debugger-message("format-string = %=", value);
                         elseif (name = "arguments")
                           arguments := value;
                           debugger-message("arguments = %=", value);
                         end if;
                       end,
                       path, top-frame);
    let count = dylan-vector-size(application, arguments);
    let arg-vector = make(<vector>, size: count);
    for (i :: <integer> from 0 below count)
      arg-vector[i] := dylan-vector-element(application, arguments, i);
    end for;
    values (format-string, arg-vector)
  end if
end function;


// Callback functions for the Debugger NUB to do explicit
// stop-reason handling for clients during spy calls

// This registers a thread created as part of a spy call in
// the client

define method create-thread-event-handler
    (application :: <debug-target>, #rest keys, #key, #all-keys)
 => (stop-reason :: <stop-reason>)
  let stop-reason :: <stop-reason> =
    apply(create-thread-event-handler,
	  application.debug-target-access-path, keys);
  interpret-stop-reason(application, stop-reason);
end method;


// This processes the initial pre-arranged breakpoint event on a
// newly spawned interactive thread

define method interactive-thread-break-event-handler
    (application :: <debug-target>)
 => (stop-reason :: <stop-reason>)
  let stop-reason :: <stop-reason> =
    interactive-thread-break-event-handler(application.debug-target-access-path);

  interpret-stop-reason(application, stop-reason);
end method;
