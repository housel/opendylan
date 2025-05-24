Module:      ddapp-access-path
synopsis:   Implementation of stop reasons
author:     Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// WAIT-FOR-STOP-REASON-WITH-TIMEOUT

define method wait-for-stop-reason-with-timeout
    (conn :: <ddapp-access-connection>, timeout :: <integer>,
     #key profile-at = #f)
 => (code :: <integer>)
  let wait-arguments = make(<string-table>);
  wait-arguments["timeout"] := timeout;
  if (profile-at)
    wait-arguments["profileAt"] := profile-at;
  end if;
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "waitForStop", wait-arguments);
  conn.connection-stop-reason := body;
  let code :: <integer> = element(body, "code", default: $timed-out);
  select (code)
    $create-process =>
      conn.connection-remote-value-size := element(body, "pointerSize");
      conn.connection-target-little-endian? := element(body, "littleEndian");
      code;
    otherwise =>
      code;
  end
end method;


///// WAIT-FOR-STOP-REASON-NO-TIMEOUT
//    Called if no timeout keyword is supplied.

define method wait-for-stop-reason-no-timeout
    (conn :: <ddapp-access-connection>,
     #key profile-at = #f)
 => (code :: <integer>)
  let wait-arguments = make(<string-table>);
  if (profile-at)
    wait-arguments["profileAt"] := profile-at;
  end if;
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "waitForStop", wait-arguments);
  conn.connection-stop-reason := body;
  element(body, "code", default: $timed-out)
end method;


///// GET-DEBUG-EVENT-PROCESS-EXIT-CODE

define method get-debug-event-process-exit-code
    (conn :: <ddapp-access-connection>) => (code :: <integer>)
  element(conn.connection-stop-reason, "exitCode")
end method;


///// GET-DEBUG-EVENT-THREAD-EXIT-CODE

define method get-debug-event-thread-exit-code
    (conn :: <ddapp-access-connection>) => (code :: <integer>)
  element(conn.connection-stop-reason, "exitCode")
end method;


///// GET-DEBUG-EVENT-STRING-INFORMATION

define method get-debug-event-string-information
    (conn :: <ddapp-access-connection>)
 => (addr :: <remote-value>, sz :: <integer>, unicode? :: <boolean>)
  error("Not implemented get-debug-event-string-information");
end method;


///// GET-DEBUG-EVENT-LIBRARY

define method get-debug-event-library
    (conn :: <ddapp-access-connection>) => (lib :: <NUBLIBRARY>)
  let module = element(conn.connection-stop-reason, "module");
  as-remote-pointer(element(module, "id"))
end method;


///// GET-DEBUG-EVENT-THREAD

define method get-debug-event-thread
    (conn :: <ddapp-access-connection>)
 => (thr :: <NUBTHREAD>)
  as-remote-pointer(element(conn.connection-stop-reason, "thread"))
end method;


///// GET-DEBUG-EVENT-PROCESS

define method get-debug-event-process
    (conn :: <ddapp-access-connection>)
 => (proc :: <remote-process>)
  let nub-process = element(conn.connection-stop-reason, "process");
  make(<remote-process>,
       nub-descriptor: as-remote-pointer(nub-process))
end method;


///// GET-EXCEPTION-ADDRESS

define method get-exception-address
    (conn :: <ddapp-access-connection>)
 => (ptr :: <remote-value>)
  let address = element(conn.connection-stop-reason, "exceptionAddress");
  ddapp-string-as-remote-value(address)
end method;


///// EXCEPTION-IS-FIRST-CHANCE?

define method exception-is-first-chance?
    (conn :: <ddapp-access-connection>)
 => (answer :: <boolean>)
  element(conn.connection-stop-reason, "firstChance", default: #f)
end method;


///// GET-EXCEPTION-VIOLATION-ADDRESS

define method get-exception-violation-address
    (conn :: <ddapp-access-connection>)
 => (ptr :: <remote-value>)
  error("Not implemented get-exception-violation-address");
end method;


///// GET-EXCEPTION-VIOLATION-OP

define method get-exception-violation-op
    (conn :: <ddapp-access-connection>)
 => (op :: <integer>)
  error("Not implemented get-exception-violation-op");
end method;


///// FIRST-DEBUGGER-INVOCATION?

define method first-debugger-invocation?
    (conn :: <ddapp-access-connection>)
 => (well? :: <boolean>)
  element(conn.connection-stop-reason, "firstHardCoded",
          default: #f)
end method;


///// CONNECTION-CAN-RECEIVE-FIRST-CHANCE

define method connection-can-receive-first-chance
    (conn :: <ddapp-access-connection>, code :: <integer>)
 => (well? :: <boolean>)
  error("Not implemented connection-can-receive-first-chance");
end method;


///// RECEIVING-FIRST-CHANCE?-SETTER

define method connection-set-first-chance
    (conn :: <ddapp-access-connection>, code :: <integer>) => ()
  error("Not implemented connection-set-first-chance");
end method;

define method connection-unset-first-chance
    (conn :: <ddapp-access-connection>, code :: <integer>) => ()
  error("Not implemented connection-unset-first-chance");
end method;


///// FIRST-CHANCE-EXCEPTION?

define method connection-thread-stopped-at-first-chance?
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
 => (b :: <boolean>)
  element(conn.connection-stop-reason, "firstChance",
          default: #f)
end method;
