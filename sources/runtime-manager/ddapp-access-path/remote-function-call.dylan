Module:      ddapp-access-path
synopsis:      Making remote function calls in the application
author:        Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// REMOTE-CALL-ON-CONNECTION

define method remote-call-on-connection
    (conn :: <ddapp-access-connection>, thr :: <remote-thread>,
     function :: <remote-value>,
     thread-was-suspended? :: <boolean>,
     #rest arguments)
 => (ra :: <remote-value>, cookie :: <object>)
  error("Not implemented remote-call-on-connection");
end method;


///// REMOTE-CALL-RESULT-ON-CONNECTION

define method remote-call-result-on-connection
    (conn :: <ddapp-access-connection>, thr :: <remote-thread>)
 => (result :: <remote-value>)
  error("Not implemented remote-call-result-on-connection");
end method;


///// REMOTE-RESTORE-CONTEXT-ON-CONNECTION

define method remote-restore-context-on-connection
    (conn :: <ddapp-access-connection>, thr :: <remote-thread>,
     ctx :: <THREAD-CONTEXT>)
 => ()
  error("Not implemented remote-restore-context-on-connection");
end method;


///// REMOTE-CALL-SPY-ON-CONNECTION

define method remote-call-spy-on-connection
    (ap :: <access-path>, conn :: <ddapp-access-connection>, thr :: <remote-thread>,
     function :: <remote-value>, #rest arguments)
 => (result :: <remote-value>, errcode :: <integer>)
  //let arg-vector :: <RTARGET-ADDRESS-SEQ> = ap.%spy-function-argument-remote-vector;


  // Construct the vector of arguments
  let arg-count :: <integer> = size(arguments);

  if (arg-count > $max-spy-function-arguments)
    error("Serious internal debugger error: Exceeded maximum arg count "
          "in a spy call.")
  end if;

  error("Not implemented remote-call-spy-on-connection");
end method;
