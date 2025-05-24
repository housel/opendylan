Module:      ddapp-access-path
synopsis:   Functions for debugee control
author:     Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND



///// RESTART

define method restart-application (conn :: <ddapp-access-connection>) => ()
  connection-send-request(conn, "restart", #f);
end method;

///// KILL-APPLICATION


define method kill-app-on-connection
    (conn :: <ddapp-access-connection>)
 => (success-code :: <integer>)
  connection-send-request(conn, "terminate", #f);
  0
end method;


define method register-exit-process-function-on-connection
    (conn :: <ddapp-access-connection>, exit-process :: <remote-symbol>)
 => ()
  // This was originally a workaround for a Win32 problem that
  // required that the debugged process had to call ExitProcess to
  // exit cleanly, and shouldn't be needed now.
end method;


///// CLOSE-APPLICATION

define method close-application-on-connection
    (conn :: <ddapp-access-connection>) => ()
  connection-send-request(conn, "disconnect", #f);
  let (exit-code :: <integer>, signal :: false-or(<integer>))
    = os/wait-for-application-process(conn.connection-process);
  debugger-message("Nub exited with code %d", exit-code);
  join-thread(conn.connection-input-thread);
end method;


///// STOP

define method stop-application
    (conn :: <ddapp-access-connection>) => ()
  error("Not implemented stop-application");
end method;


///// CONTINUE

define method continue-application
    (conn :: <ddapp-access-connection>) => ()
  connection-send-request(conn, "continue", #f);
end method;

///// CONTINUE-UNHANDLED

define method unhandled-continue-application
    (conn :: <ddapp-access-connection>) => ()
  let c-arguments = make(<string-table>);
  c-arguments["unhandled"] := #t;
  connection-send-request(conn, "continue", c-arguments);
end method;


///// SUSPEND-THREAD

define method suspend-application-thread
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
  let st-arguments = make(<string-table>);
  st-arguments["threadId"] := thread.rnub-descriptor;
  st-arguments["suspended"] := #t;
  connection-send-request(conn, "suspendThread", st-arguments);
end method;


///// RESUME-THREAD

define method resume-application-thread
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
  let st-arguments = make(<string-table>);
  st-arguments["threadId"] := thread.rnub-descriptor;
  st-arguments["suspended"] := #f;
  connection-send-request(conn, "suspendThread", st-arguments);
end method;


// Managing permanently debugger-suspended threads in an application.

define method application-thread-permanently-suspended?
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
 => (suspended? :: <boolean>)
  let st-arguments = make(<string-table>);
  st-arguments["threadId"] := thread.rnub-descriptor;
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "suspendThread", st-arguments);
  element(body, "suspended")
end method;

define method application-thread-permanently-suspended?-setter
    (suspend? :: <boolean>, conn :: <ddapp-access-connection>,
     thread :: <remote-thread>)
 => (suspend? :: <boolean>)
  if (suspend?)
    suspend-application-thread(conn, thread);
  else
    resume-application-thread(conn, thread);
  end if;
  suspend?
end method;



///// STEP

define method step-application
    (conn :: <ddapp-access-connection>, n :: <integer>) => ()
  error("Not implemented step-application");
end method;


///// STEP-OVER

define method step-over-application
    (conn :: <ddapp-access-connection>, n :: <integer>) => ()
  error("Not implemented step-over-application");
end method;


///// STEP-OUT

define method step-out-application
    (conn :: <ddapp-access-connection>) => ()
  error("Not implemented step-out-application");
end method;
