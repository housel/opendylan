Module:      ddapp-access-path
synopsis:   Descriptions of stack frames, and the implementation of building
            the stack trace, and reading lexical variables.
author:     Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// UPDATE-THREAD-STACK-SIZE-ON-CONNECTION

define method update-thread-stack-size-on-connection
    (connection :: <ddapp-access-connection>, thread :: <remote-thread>)
 => ()
  // Just request a single level to minimize communication overhead
  // since what we really want is totalFrames
  let trace-arguments = make(<string-table>);
  trace-arguments["threadId"] := thread.rnub-descriptor;
  trace-arguments["levels"] := 1;
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(connection, "stackTrace", trace-arguments);

  thread.stack-size := element(body, "totalFrames");
  thread.stack-size-valid? := #t;
end method;


///// UPDATE-THREAD-STACK-TRACE-ON-CONNECTION

define method update-thread-stack-trace-on-connection
    (connection :: <ddapp-access-connection>, thread :: <remote-thread>)
 => ()
  // Call the debugger nub to fill in the required data for each stack
  // frame.
  let trace-arguments = make(<string-table>);
  trace-arguments["threadId"] := thread.rnub-descriptor;
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(connection, "stackTrace", trace-arguments);

  let frames = element(body, "stackFrames");
  thread.stack-size := frames.size;
  thread.stack-size-valid? := #t;

  // Construct the higher-level <function-frame> objects themselves.
  let stack-frame-vector = make(<vector>, size: thread.stack-size);
  for (frame :: <string-table> in frames, i :: <integer> from 0)
    let fp = element(frame, "framePointerReference");
    let pc = element(frame, "instructionPointerReference");
    let ret = element(frame, "returnPointerReference");
    stack-frame-vector[i]
      := make(<function-frame>, index: i, thread: thread,
              pointer: ddapp-string-as-remote-value(fp),
              return-address: ddapp-string-as-remote-value(ret),
              next-instruction: ddapp-string-as-remote-value(pc));
  end for;

  let last-frame = thread.stack-size - 1;

  // Now see that the frames are correctly chained together. The frames are
  // chained in a two-way linked list.
  stack-frame-vector[0].link-next := #f;
  stack-frame-vector[last-frame].link-previous := #f;
  unless (last-frame == 0)
    stack-frame-vector[0].link-previous := stack-frame-vector[1];
    stack-frame-vector[last-frame].link-next
       := stack-frame-vector[last-frame - 1];
  end unless;
  for (i from 1 below last-frame)
    stack-frame-vector[i].link-previous := stack-frame-vector[i + 1];
    stack-frame-vector[i].link-next := stack-frame-vector[i - 1];
  end for;

  // Put a reference to the head of the chain into the <remote-thread>
  // itself. This serves as a cache that will remain valid until the
  // thread is allowed to continue and run some more code.
  thread.thread-stack := stack-frame-vector[0];
  thread.stack-trace-valid? := #t;
end method;


///// READ-FRAME-LEXICALS

define method read-frame-lexicals
  (conn :: <ddapp-access-connection>, frame :: <function-frame>) => ()
  unless (frame.partial-lexicals-read?)
    partial-read-frame-lexicals(conn, frame);
  end unless;

  let count = frame.lexicals-count;
  let lookups = as-integer(frame.lexicals-nub-table);

  frame.lexicals := make (<vector>, size: count);

  error("Not implemented read-frame-lexicals");

  frame.full-lexicals-read? := #t;
  frame.lexicals-nub-table := #f;
end method;


define method partial-read-frame-lexicals
  (conn :: <ddapp-access-connection>, frame :: <function-frame>) => ()
  error("Not implemented partial-read-frame-lexicals");

  frame.partial-lexicals-read? := #t;
  frame.full-lexicals-read? := #f;
  //frame.lexicals-count := count;
  //frame.lexicals-nub-table := as-remote-pointer(lookups);
end method;


///// OLDER-STACK-FRAME?

define method older-stack-frame-on-connection?
    (conn :: <ddapp-access-connection>, this-one :: <remote-value>,
     than-this-one :: <remote-value>)
 => (answer :: <boolean>)
  error("Not implemented older-stack-frame-on-connection?");
end method;


///// REGISTER-INTERACTIVE-CODE-SEGMENT

define method register-interactive-segment-on-connection
    (conn :: <ddapp-access-connection>,
     from :: <remote-value>, to :: <remote-value>)
 => ()
  error("Not implemented register-interactive-segment-on-connection");
end method;
