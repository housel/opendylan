Module:      ddapp-access-path
synopsis:        Special access-path functions that take advantage of low-level
                 knowledge of the dylan implementation.
author:          Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// DYLAN-CALCULATE-DESTINATION-FOR-STEP-INTO

define method calculate-step-into-on-connection
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
 => (address :: <remote-value>,
     use-function-register? :: <boolean>,
     success? :: <boolean>)
  error("Not implemented calculate-step-into-on-connection");
end method;


///// DYLAN-THREAD-ENVIRONMENT-BLOCK-ADDRESS

define method teb-on-connection
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
 => (teb :: <remote-value>)
  let st-arguments = make(<string-table>);
  st-arguments["threadId"] := thread.rnub-descriptor;
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "readThreadEnvironment", st-arguments);
  ddapp-string-as-remote-value(element(body, "teb", default: "0"))
end method;


///// DYLAN-CURRENT-FUNCTION

define method current-function-on-connection
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
 => (remote-lambda :: <remote-value>)
  error("Not implemented current-function-on-connection");
end method;


///// DYLAN-THREAD-MV-BUFFER-LIVE?

define method mv-buffer-live-on-connection
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
 => (code :: <integer>)
  error("Not implemented mv-buffer-live-on-connection");
end method;
