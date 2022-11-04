module:       interactive-downloader-internals
synopsis:     Regstration of interactive memory with the Memory Manager
author:       Paul Howard
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// PERFORM-ALL-REGISTRATIONS
//    By now, the relocations have been performed, and the sections of
//    memory that require GC registration can in fact be registered.
//    The DM provides functions to actually perform the registration -
//    which it implements by calling SPY functions.

define method perform-all-registrations (trans :: <interactive-transaction>)
     => ()
  let application =
    trans.transaction-downloader-target.interactive-application;
  let thread = trans.transaction-thread;
  for (registration in trans.transaction-deferred-registrations)
    let lo = registration.memory-registration-lower-address;
    let hi = registration.memory-registration-upper-address;
    select (registration.memory-registration-style)
      $registration-style-fixup =>
         fixup-imported-data-region(application, lo, hi, thread: thread);
      $registration-style-import =>
         fixup-unimported-data-region(application, lo, hi, thread: thread);
      $registration-style-exact =>
         register-exact-roots(application, lo, hi, thread: thread);
      $registration-style-ambiguous =>
         register-ambiguous-roots(application, lo, hi, thread: thread);
      $registration-style-static =>
         register-static-roots(application, lo, hi, thread: thread);
      $registration-style-code =>
         register-interactive-code(application, lo, hi);
    end select
  end for;
end method;

///// PERFORM-REGISTRATIONS-AND-INITIALIZATIONS
//    After the nub has completed code generation, it has identified
//    regions of memory that require GC or other registration.
//    The DM provides functions to actually perform the registrations
//    and initializations, which it implements by calling SPY functions.

define function perform-registrations-and-initializations
    (context :: <runtime-context>, application :: <debug-target>,
     thread :: <remote-thread>, regions :: <sequence>)
 => ();
  // First perform the needed registrations
  for (region in regions)
    debugger-message("Region %s: %=-%=",
                     region.remote-memory-region-classification,
                     region.remote-memory-region-lower-bound,
                     region.remote-memory-region-upper-bound);
    let lo = region.remote-memory-region-lower-bound;
    let hi = region.remote-memory-region-upper-bound;
    select (region.remote-memory-region-classification)
      #"dylan-exact" =>
        register-exact-roots(application, lo, hi, thread: thread);
      #"dylan-static" =>
        register-static-roots(application, lo, hi, thread: thread);
      #"dylan-ambiguous" =>
        register-ambiguous-roots(application, lo, hi, thread: thread);
      #"dylan-fixup" =>
        fixup-imported-data-region(application, lo, hi, thread: thread);
      #"dylan-import" =>
        fixup-unimported-data-region(application, lo, hi, thread: thread);
      #"dylan-untraced" =>
        #f;                     // Nothing needs to know about this
      #"dylan-history" =>
        fixup-interactor-history-data-region(context, application, lo, hi);
        register-exact-roots(application, lo, hi, thread: thread);
      #"compiled-code" =>
        #f;
      #"init-array" =>
        #f;                     // Do nothing on this first pass
      #"eh-frame" =>
        register-exception-handler-data-region
          (application, lo, hi, thread: thread);
    end select;
  end for;

  // Next, traverse the set again to find things that need doing on
  // the second pass
  for (region in regions)
    let lo = region.remote-memory-region-lower-bound;
    let hi = region.remote-memory-region-upper-bound;
    select (region.remote-memory-region-classification)
      #"init-array" =>
        run-initializer-array-region(application, lo, hi, thread: thread);
      otherwise =>
        #f;
    end select;
  end for;
end function;

///// FIXUP-INTERACTOR-HISTORY-DATA-REGION
//

define method fixup-interactor-history-data-region
    (context :: <runtime-context>, application :: <debug-target>,
     lo :: <remote-value>, hi :: <remote-value>)
 => ();
  debugger-message("fixup-interactor-history-data-region %= - %=", lo, hi);
  let access-path = application.debug-target-access-path;
  let stride = access-path.remote-value-byte-size;
  for (address :: <remote-value> = lo
         then byte-indexed-remote-value(address, stride),
       while: remote-value-<(address, hi))
    let raw-interactor-id = read-value(access-path, address);
    let interactor-id = tagged-remote-value-as-integer(raw-interactor-id);
    debugger-message("reaffirm %=: %= (%d)",
                     address, raw-interactor-id, interactor-id);
    let actual-value
      = runtime-context-lexical-variable-value(context, interactor-id);
    debugger-message("Actually, that's %=", actual-value);
    write-value(access-path, address, actual-value);
  end for;
end method;
