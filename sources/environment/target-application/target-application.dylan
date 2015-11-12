Module:    target-application-internals
Synopsis:  Defining a <debug-target> class that has special functionality
           for multi-threaded access.
Author:    Paul Howard, Andy Armstrong, Peter S. Housel
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

///// <TARGET-APPLICATION>
//    A <debug-target> that contains synchronization functionality. This
//    class is used by the debugger and by the application-server backend
//    for environment objects.

define class <target-application> (<debug-target>)
  // Callbacks invoked via GF methods
  slot stored-library-initialization-phase-handler :: <function> = ignore;
  slot stored-interactor-handler :: <function> = ignore;

  // Application manager thread
  slot manager-thread :: <thread>;

  // Application state
  constant slot target-application-state-lock :: <simple-lock> 
    = make(<simple-lock>);
  slot target-application-state-notification :: <notification>;
  slot target-application-state :: <symbol>,
    init-value: #"closed";

  // Application control
  slot target-application-wanted-state :: <symbol>,
    init-value: #"closed";

  // Transaction queue
  constant slot transaction-lock :: <simple-lock> = make(<simple-lock>);
  slot transaction-request-notification :: <notification>;
  constant slot transaction-request-queue :: <deque> = make(<deque>);
  slot transaction-complete-notification :: <notification>;
  constant slot transaction-complete-set :: <object-set> = make(<object-set>);
end class;

///// INITIALIZE (<TARGET-APPLICATION>)
//    Sets up the notification fields, and associates them with the
//    debugger transaction lock.

define method initialize
    (application :: <target-application>, #rest keys, #key, #all-keys)
 => ()
  next-method();

  // Application state
  application.target-application-state-notification
    := make(<notification>, lock: application.target-application-state-lock);

  // Transaction queue
  application.transaction-request-notification
    := make(<notification>, lock: application.transaction-lock);
  application.transaction-complete-notification
    := make(<notification>, lock: application.transaction-lock);
end method;

///// <TEMPORARY-INTERNAL-DEBUGGER-TRANSACTION-STOP>
//    A stop reason that is not propagated to the environment.

define class <temporary-internal-debugger-transaction-stop>
    (<debugger-generated-stop-reason>)
end class;


define method stop-application-request
    (application :: <target-application>) => ()
  debugger-message("Stopping target application temporarily");
  stop-application
    (application,
     stop-reason: make(<temporary-internal-debugger-transaction-stop>));
end method;


define inline function temporary-stop-reason?
    (stop-reason :: <stop-reason>) => (temporary? :: <boolean>)
  instance?(stop-reason, <temporary-internal-debugger-transaction-stop>)
end function;


///// <TRANSACTION-REQUEST>
//
define class <transaction-request> (<object>)
  constant slot transaction-request-function :: <function>,
    required-init-keyword: function:;
  constant slot transaction-request-continue :: false-or(<function>),
    required-init-keyword: continue:;
  slot transaction-request-failed? :: <boolean>,
    init-value: #f;
  slot transaction-request-results :: <sequence>,
    init-value: #[];
end class;


///// RUN-TARGET-APPLICATION
//    This is basically like MANAGE-RUNNING-APPLICATION, except that
//    it handles thread coordination issues. This function runs on the
//    calling thread, and does not return until the application quits.

define method run-target-application
    (application :: <target-application>,
     #key stop-reason-callback :: <function>,
          debugger-transaction-prolog :: <function>,
          debugger-transaction-epilog :: <function>,
          interactor-callback :: <function>,
          library-init-callback :: <function>,
          application-state-callback :: <function>)
 => ();
  // Callbacks invoked via generic function methods
  application.stored-library-initialization-phase-handler
    := library-init-callback;
  application.stored-interactor-handler
    := interactor-callback;

  application.manager-thread := current-thread();

  // Callback methods passed to manage-running-application()
  local
    method transition-application-state
        (application :: <target-application>, state :: <symbol>)
      debugger-message("transition-application-state: %s", state);
      with-lock (application.target-application-state-lock)
        application.target-application-state := state;
        if (state == #"closed")
          release-all(application.target-application-state-notification);
        end if;
      end;
      application-state-callback(application, state);
    end method,
    method handle-stop-reason
        (application :: <target-application>,
         stop-reason :: <stop-reason>)
     => (keep-stopped? :: <boolean>)
      temporary-stop-reason?(stop-reason)
        | block ()
            debugger-message("Calling stop-reason callback on %=",
                             stop-reason);
            let keep-stopped?
              = stop-reason-callback(application, stop-reason);
            debugger-message("The stop-reason callback on %= yielded %=",
                             stop-reason, keep-stopped?);
            if (keep-stopped?)
              application.target-application-wanted-state := #"stopped";
            end if;
            keep-stopped?
          exception (e :: <abort>)
            debugger-message("Stop reason callback failure: %=", e);
            #f
          end block
        | begin
            sequence-point();
            application.target-application-wanted-state ~== #"running"
          end
    end method,
    method handle-ready-to-continue
        (application :: <target-application>,
         stop-reason :: <stop-reason>)
     => ();
      // Pre-transaction
      transition-application-state(application, #"stopped");
      unless (temporary-stop-reason?(stop-reason))
        block ()
          debugger-message("Running debugger transaction prolog on %=",
                           stop-reason);
          debugger-transaction-prolog(application, stop-reason)
        exception (e :: <abort>)
          // Do nothing
          debugger-message("Transaction prolog failure: %=", e);
        end block;
      end unless;

      // Handle transaction requests until the client doesn't want the
      // target stopped anymore
      with-lock (application.transaction-lock)
        iterate loop()
          debugger-message("transaction loop: wanted-state=%s queue-size=%d",
                           application.target-application-wanted-state,
                           application.transaction-request-queue.size);
          if (empty?(application.transaction-request-queue))
            sequence-point();
            if (application.target-application-wanted-state == #"stopped")
              debugger-message("Waiting for transactions to be submitted");
              wait-for(application.transaction-request-notification);

              // Try again
              loop();
            end if;
          else
            // Get a request from the queue and execute it
            let request = pop(application.transaction-request-queue);
            debugger-message("Processing request %=", request);
            block ()
              let (#rest results) = request.transaction-request-function();
              request.transaction-request-results := results;
            exception (e :: <abort>)
              debugger-message("Transaction abort %=: %s", request, e);
              request.transaction-request-failed? := #t;
            end block;

            // Post it onto the completed queue
            add!(application.transaction-complete-set, request);
            release-all(application.transaction-complete-notification);
            debugger-message("Completed request %=", request);

            // Continue if this transaction wanted it
            if (request.transaction-request-continue)
              debugger-message("Requesting continue from request %=", request);
              request.transaction-request-continue();
            end if;

            loop();
          end if;
        end iterate;
      end with-lock;

      // Post-transaction
      unless (temporary-stop-reason?(stop-reason))
        block ()
          debugger-message("Running debugger transaction epilog on %=",
                           stop-reason);
          debugger-transaction-epilog(application, stop-reason);
        exception (e :: <abort>)
          // Do nothing
          debugger-message("Transaction epilog failure: %=", e);
        end block;
      end unless;

      transition-application-state(application, #"running");
    end method;

  // Run the application until it exits
  application.target-application-wanted-state := #"running";
  transition-application-state(application, #"uninitialized");
  manage-running-application
    (application,
     stop-reason-callback: handle-stop-reason,
     ready-to-continue-callback: handle-ready-to-continue);

  // Cancel any leftover transactions without running them
  debugger-message("Cancelling leftover requests");
  with-lock (application.transaction-lock)
    transition-application-state(application, #"closed");
    for (request in application.transaction-request-queue)
      request.transaction-request-failed? := #t;
      add!(application.transaction-complete-set, request);
      debugger-message("Cancelled request %=", request);
    end for;
    release-all(application.transaction-complete-notification);
  end with-lock;
end method;

///// STOP-TARGET-APPLICATION
//    This can be hooked up to a STOP button,
//    asynchronously pausing running applications

define method stop-target-application
    (application :: <target-application>, #key client-data = #f)
 => ()
  debugger-message("stop-target-application");
  application.target-application-wanted-state := #"stopped";
  synchronize-side-effects();
end method;


///// CONTINUE-TARGET-APPLICATION
//    This can be hooked up to a CONTINUE button
//    It is a requirement that this continues the current
//    application; clients will await confirmation of this.

define method continue-target-application
    (application :: <target-application>, remote-thread)
 => ()
  debugger-message("continue-target-application");
  ignore(remote-thread);
  application.target-application-wanted-state := #"running";
  synchronize-side-effects();

  // Notify the manager thread
  if (current-thread() ~== application.manager-thread)
    with-lock (application.transaction-lock)
      release(application.transaction-request-notification);
    end with-lock;
  end if;
end method;


///// KILL-TARGET-APPLICATION

define method kill-target-application(application :: <target-application>)
  debugger-message("kill-target-application");
  dm-kill-application(application);
  application.target-application-wanted-state := #"closed";
  synchronize-side-effects();

  // Notify the manager thread
  if (current-thread() ~== application.manager-thread)
    with-lock (application.transaction-lock)
      release(application.transaction-request-notification);
    end with-lock;
  end if;
end method;


///// WITH-DEBUGGER-TRANSACTION

define macro with-debugger-transaction
  { with-debugger-transaction (?application:name, ?options:*)
      ?body:body
      ?failure
    end }
 => { perform-debugger-transaction
        (?application, method () ?body end,
         on-failure: method () ?failure end,
         ?options) }
failure:
  { failure ?:body }
    => { ?body }
  { }
    => { values() }
end macro with-debugger-transaction;


///// PERFORM-DEBUGGER-TRANSACTION
//    Takes a <target-application> and a <function>.
//    With a claim on debugger access to the application, ensures that a
//    debugger transaction is in effect. (It will force one to begin, if
//    one is not in effect already). Calls back to the supplied function,
//    and then ends the debugger transaction if it had to start one
//    specifically.
//    (All environment protocol queries can take place inside a call to
//    this function).

define method perform-debugger-transaction
    (application :: <target-application>, transaction :: <function>,
     #key continue,
          temporary-stop? = #t,
          on-failure = method () values() end)
 => (#rest results)
  if (current-thread() == application.manager-thread)
    assert(~continue,
           "Cannot continue from inside another debugger transaction");
    block ()
      transaction()
    exception (<abort>)
      debugger-message("Aborted transaction");
      on-failure()
    end block
  else
    let request
      = make(<transaction-request>, function: transaction, continue: continue);
    with-lock (application.transaction-lock)
      if (temporary-stop?)
        stop-application-request(application);
      end if;

      if (application.target-application-state == #"uninitialized"
            | application.target-application-state == #"closed")
        debugger-message("Application is not active, failing transaction");
        request.transaction-request-failed? := #t;
      else
        // Put this request on the request queue
        push-last(application.transaction-request-queue, request);
        release(application.transaction-request-notification);
        debugger-message("%s: Submitted request %=",
                         current-thread().thread-name, request);

        // Wait for it to appear in the completion set
        while (~member?(request, application.transaction-complete-set))
          debugger-message("%s: Wait for request %=",
                           current-thread().thread-name, request);
          wait-for(application.transaction-complete-notification);
        end while;
        remove!(application.transaction-complete-set, request);
        debugger-message("%s: Received completed request %=",
                         current-thread().thread-name, request);
      end if;
    end with-lock;

    // Return the results
    if (request.transaction-request-failed?)
      on-failure()
    else
      apply(values, request.transaction-request-results)
    end if
  end if
end method;


///// PERFORM-REQUIRING-DEBUGGER-TRANSACTION
//    Takes a <target-application> and a <function>.
//    With a claim on debugger access to the application, checks to see
//    that a debugger transaction is in effect. If so, the client's
//    callback is performed, otherwise just return to caller.

define method perform-requiring-debugger-transaction
    (application :: <target-application>, transaction :: <function>) => ()
  if (current-thread() == application.manager-thread)
    transaction()
  else
    error("perform-requiring-debugger-transaction isn't within a transaction");
  end if
end method;


///// WAIT-FOR-TARGET-APPLICATION-CLOSED
//    Waits until the application enters the #"closed" state, or
//    signals an error if does not do so before the timeout.

define method wait-for-target-application-closed
    (application :: <target-application>, timeout :: <real>) => ()
  with-lock (application.target-application-state-lock)
    while (application.target-application-state ~== #"closed")
      if (wait-for(application.target-application-state-notification,
                   timeout: timeout) == #f)
        error("Timeout expired in terminating application");
      end if;
    end while;
  end;
end method;


///// CALL-DEBUGGER-FUNCTION
//

define method call-debugger-function
    (application :: <target-application>, function :: <function>,
     #rest arguments)
 => (#rest vals :: <object>)
  debugger-message("call-debugger-function");
  let thunk = method() apply(function, arguments) end;
  perform-debugger-transaction(application, thunk, temporary-stop?: #f)
end method;


///// HANDLE-LIBRARY-INITIALIZATION-PHASE
//    Called from within manage-running-application when
//    initialization of a library reaches the given phase.

define method handle-library-initialization-phase
    (application :: <target-application>, thread :: <remote-thread>,
     remote-library :: <remote-library>,
     phase :: <library-initialization-phase>, top-level? :: <boolean>)
 => (interested? :: <boolean>);
  application.stored-library-initialization-phase-handler
    (application, thread, remote-library, phase, top-level?)
end method;


///// HANDLE-INTERACTOR-RETURN
//    The method for an environment <target-application>.

define method handle-interactor-return
    (application :: <target-application>, thread :: <remote-thread>,
     transaction-id :: <object>, #rest return-values)
 => (answer :: <boolean>)
  next-method();
  apply(application.stored-interactor-handler,
        application, thread, transaction-id,
        return-values)
end method;
