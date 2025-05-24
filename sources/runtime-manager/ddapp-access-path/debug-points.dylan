Module:      ddapp-access-path
synopsis:    Implementation of debug points.
author:      Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define function ddapp-set-instruction-breakpoints
    (conn :: <ddapp-access-connection>)
 => (success :: <integer>)
  let sib-arguments = make(<string-table>);
  sib-arguments["breakpoints"]
    := map(method (ra :: <remote-value>) => (object :: <string-table>)
             let object = make(<string-table>);
             object["instructionReference"]
               := remote-value-as-ddapp-string(ra);
             object
           end, conn.connection-instruction-breakpoints);
  connection-send-request(conn, "setInstructionBreakpoints", sib-arguments);
  $breakpoint-ok
end function;

///// ENABLE-BREAKPOINT

define method set-breakpoint-in-application
    (conn :: <ddapp-access-connection>, ra :: <remote-value>)
 => (success :: <integer>)
  if (member?(ra, conn.connection-instruction-breakpoints, test: \=))
    $breakpoint-exists
  else
    add!(conn.connection-instruction-breakpoints, ra);
    ddapp-set-instruction-breakpoints(conn)
  end if
end method;


///// DISABLE-BREAKPOINT

define method clear-breakpoint-in-application
    (conn :: <ddapp-access-connection>, ra :: <remote-value>)
 => (success :: <integer>)
  if (member?(ra, conn.connection-instruction-breakpoints, test: \=))
    remove!(conn.connection-instruction-breakpoints, ra, test: \=);
    ddapp-set-instruction-breakpoints(conn)
  else
    $breakpoint-does-not-exist
  end if
end method;


define method recover-breakpoint-in-application
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
 => ()
  // The current nub handles this automatically
end method;


///// QUERY-BREAKPOINT?

define method query-breakpoint-in-application
    (conn :: <ddapp-access-connection>, ra :: <remote-value>)
 => (success :: <integer>)
  error("Not implemented query-breakpoint-in-application");
end method;


///// APPLY-THREAD-STEPPING-CONTROL

define method apply-thread-stepping-control-on-connection
    (ap :: <access-path>, conn :: <ddapp-access-connection>, thread :: <remote-thread>,
     fp :: <remote-value>, calling-fp :: <remote-value>, count :: <integer>,
     locations :: <sequence>, operation :: <integer>)
  => ()
  //let ap-locations :: <RTARGET-ADDRESS-SEQ> = ap.%stepping-locations-remote-vector;
  error("Not implemented apply-thread-stepping-control-on-connection");
end method;


///// REMOVE-ALL-STEPPING-CONTROL-FOR-THREAD

define method remove-all-stepping-control-for-thread-on-connection
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>) => ()
  error("Not implemented remove-all-stepping-control-for-thread-on-connection");
end method;
