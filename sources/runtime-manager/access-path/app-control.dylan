module:     access-path-implementation
synopsis:   Functions for debugee control
author:     Paul Howard
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


define constant $legal-application-states = #[#"running",
                                              #"unstarted",
                                              #"stopped",
                                              #"dead",
                                              #"post-mortem"];

define method set-application-state 
    (ap :: <access-path>, state :: <symbol>) => ()
  if (member? (state, $legal-application-states))
    ap.state := state;
  else
    error ("Attempted to set an illegal application state.");
  end if
end method;


///// EXPORTED GENERICS

define generic restart (ap :: <access-path>) => ();

define generic stop (ap :: <access-path>) => ();

define generic continue (ap :: <access-path>, #key resume) => ();

define generic continue-unhandled (ap :: <access-path>, #key resume) => ();

define generic suspend-thread
    (ap :: <access-path>, thread :: <remote-thread>) => ();

define generic resume-thread
    (ap :: <access-path>, thread :: <remote-thread>) => ();

define generic step (ap :: <access-path>, n :: <integer>) => ();

define generic step-over (ap :: <access-path>, n :: <integer>) => ();

define generic step-out (ap :: <access-path>) => ();

define generic application-state-running? 
    (ap :: <access-path>) => (running? :: <boolean>);

define generic application-state-stopped? 
    (ap :: <access-path>) => (stopped? :: <boolean>);

define generic application-state-unstarted? 
    (ap :: <access-path>) => (unstarted? :: <boolean>);

define generic application-state-post-mortem? 
    (ap :: <access-path>) => (post-mortem? :: <boolean>);

define generic kill-application 
    (ap :: <access-path>, #key do-cleanups? = #f) => (success? :: <boolean>);


///// RESTART
//    This operation is always legal.

define method restart (ap :: <access-path>) => ()
  restart-application (ap.connection);
  set-application-state (ap, #"running");
end method;

define open generic restart-application (conn :: <access-connection>) => ();

///// KILL-APPLICATION

define method kill-application 
    (ap :: <access-path>,
     #key do-cleanups? = #f) => (success? :: <boolean>)
  let success-code = kill-app-on-connection (ap.connection);
  set-application-state (ap, #"dead");
  success-code ~= -1;
end method;

define open generic kill-app-on-connection (conn :: <access-connection>)
    => (success-code :: <integer>);

define method register-exit-process-function
    (ap :: <access-path>, exit-process :: <remote-symbol>) => ()
  register-exit-process-function-on-connection (ap.connection, exit-process);
end method;

define open generic register-exit-process-function-on-connection
    (conn :: <access-connection>, exit-process :: <remote-symbol>)
    => ();


///// CLOSE-APPLICATION
//    While kill-application terminates the process, this gives the nub implementation
//    the chance to release all OS resources associated with the tether.

define method close-application (ap :: <access-path>) => ()
  deregister-access-path(ap);
  close-application-on-connection(ap.connection)
end method;

define open generic close-application-on-connection
   (conn :: <access-connection>) => ();

///// STOP
//    This operation is only legal if the application is running. 
//    This performs an immediate "stamp on the brakes".

define method stop (ap :: <access-path>) => ()
  if (application-state-running? (ap))
    stop-application (ap.connection);
    set-application-state (ap, #"stopped");
  else
    error ("Attempted to stop a non-running application.");
  end if
end method;

define open generic stop-application 
    (conn :: <access-connection>) => ();


///// CONTINUE

//  Now takes a resume keyword, which is a set of previously
//  suspended threads to explicitly resume


define method continue
    (ap :: <access-path>, #key resume) => ()

  // We're entering the running state, so throw out all cached
  // stack links.

  do-threads (method (t :: <remote-thread>)
                unless (thread-suspended?(t))
                  t.thread-stack := #f;
                  t.stack-size-valid? := #f;
                  t.stack-trace-valid? := #f;
                end unless;
              end method,
              ap);

  if (resume)
    for (thread :: <remote-thread> in resume)
      resume-application-thread (ap.connection, thread);
    end for;
  end if;

   // And continue.

   if (application-state-stopped? (ap))
     continue-application (ap.connection);
     set-application-state (ap, #"running");
   else
     error ("Attempted to continue a non-stopped application.");
   end if
end method;

define open generic continue-application 
    (conn :: <access-connection>) => ();

///// CONTINUE-UNHANDLED

//  Now takes a resume keyword, which is a set of previously
//  suspended threads to explicitly resume

define method continue-unhandled
    (ap :: <access-path>, #key resume) => ()

  // We're entering the running state, so throw out all cached
  // stack links.

  do-threads (method (t :: <remote-thread>)
                unless (thread-suspended?(t))
                  t.thread-stack := #f;
                  t.stack-size-valid? := #f;
                  t.stack-trace-valid? := #f;
                end unless;
              end method,
              ap);


  if (resume)
    for (thread :: <remote-thread> in resume)
      resume-application-thread (ap.connection, thread);
    end for;
  end if;

   // And continue.

   if (application-state-stopped? (ap))
     unhandled-continue-application (ap.connection);
     set-application-state (ap, #"running");
   else
     error ("Attempted to continue a non-stopped application.");
   end if
end method;

define open generic unhandled-continue-application 
    (conn :: <access-connection>) => ();


///// SUSPEND-THREAD

define method suspend-thread
    (ap :: <access-path>, thread :: <remote-thread>) => ()
  if (~thread-suspended? (thread))
    debugger-message("(AP app-control) suspend-thread %=", thread);
    thread-suspended?(thread) := #t;
    thread-state(thread) := "Suspended by debugger";
    suspend-application-thread (ap.connection, thread);
  end if
end method;

define open generic suspend-application-thread 
    (conn :: <access-connection>, thread :: <remote-thread>);


///// RESUME-THREAD

define method resume-thread
    (ap :: <access-path>, thread :: <remote-thread>) => ()
  if (thread-suspended? (thread))
    debugger-message("resume-thread %=", thread);
    thread-suspended?(thread) := #f;
    thread-state(thread) := "[Can't get thread state]";
    resume-application-thread (ap.connection, thread);
  end if
end method;

// Weakly resume Dylan threads at this level;
// The hard-coded assumption is that the micro-spy in the 
// debugger NUB will do the rest.
// This is important in order not to let suspended threads
// in an application run away on us.

define inline method dylan-resume-thread
    (ap :: <access-path>, thread :: <remote-thread>) => ()
  debugger-message("resume-thread %=", thread);
  thread-suspended?(thread) := #f;
  thread-state(thread) := "[Can't get thread state]";
end method;

define open generic resume-application-thread 
    (conn :: <access-connection>, thread :: <remote-thread>);


// Managing permanently debugger-suspended threads in an application.
// Query slots in the debugger NUB.

define method thread-permanently-suspended?
    (ap :: <access-path>, thread :: <remote-thread>) => (suspended? :: <boolean>)
  application-thread-permanently-suspended?(ap.connection, thread);
end method;

define open generic application-thread-permanently-suspended?
    (conn :: <access-connection>, thread :: <remote-thread>)
 => (suspended? :: <boolean>);

define method thread-permanently-suspended?-setter
    (suspend? :: <boolean>, ap :: <access-path>, thread :: <remote-thread>)
 => (suspend? :: <boolean>)
  debugger-message("thread-permanently-suspended?-setter %= %=", suspend?, thread);
  application-thread-permanently-suspended?(ap.connection, thread) := suspend?;
end method;

define open generic application-thread-permanently-suspended?-setter
    (suspend? :: <boolean>, conn :: <access-connection>,
     thread :: <remote-thread>)
 => (suspend? :: <boolean>);


///// STEP

define method step (ap :: <access-path>, n :: <integer>) => ()
  if (application-state-stopped? (ap))
    step-application (ap.connection, n);
    set-application-state (ap, #"running");
  else
    error ("Tried to step a non-stopped application.");
  end if
end method;

define open generic step-application 
    (conn :: <access-connection>, n :: <integer>) => ();


///// STEP-OVER

define method step-over (ap :: <access-path>, n :: <integer>) => ()
  if (application-state-stopped? (ap))
    step-over-application (ap.connection, n);
    set-application-state (ap, #"running");
  else
    error ("Tried to step a non-stopped application.");
  end if
end method;

define open generic step-over-application 
    (conn :: <access-connection>, n :: <integer>) => ();


///// STEP-OUT

define method step-out (ap :: <access-path>) => ()
  if (application-state-stopped? (ap))
    step-out-application (ap.connection);
    set-application-state (ap, #"running");
  else
    error ("Tried to step a non-stopped application.");
  end if
end method;

define open generic step-out-application
    (conn :: <access-connection>) => ();


///// APPLICATION-STATE-...?

define method application-state-running? 
    (ap :: <access-path>) => (running? :: <boolean>)
  ap.state == #"running"
end method;

define method application-state-stopped? 
    (ap :: <access-path>) => (stopped? :: <boolean>)
  ap.state == #"stopped"
end method;

define method application-state-unstarted? 
    (ap :: <access-path>) => (unstarted? :: <boolean>)
  ap.state == #"unstarted"
end method;

define method application-state-post-mortem? 
    (ap :: <access-path>) => (post-mortem? :: <boolean>)
  ap.state == #"post-mortem"
end method;
