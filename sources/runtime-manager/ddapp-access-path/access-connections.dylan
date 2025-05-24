Module:      ddapp-access-path
synopsis:   Implementation of debugger connections
author:     Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define class <local-ddapp-debugger-connection> (<local-debugger-connection>)
  // FIXME
end class;

*default-local-debugger-connection* := make(<local-ddapp-debugger-connection>);

// define class <remote-ddapp-debugger-connection> (<remote-debugger-connection>)
//    ...
// end class;

define class <ddapp-access-connection> (<access-connection>)
  slot connection-process :: false-or(os/<application-process>) = #f;

  // Input from nub
  slot connection-input-thread :: <thread>;
  constant slot connection-input-queue :: <object-deque> = make(<object-deque>);
  constant slot connection-input-lock :: <simple-lock> = make(<simple-lock>);
  slot connection-input-notification :: <notification>;

  // Output to nub
  slot connection-output :: false-or(<stream>) = #f;

  // Next outgoing request message sequence number
  slot connection-message-seq :: <integer>, init-value: 1;

  // Last received stop-reason body
  slot connection-stop-reason :: <string-table> = make(<string-table>);

  // Process remote value size and target byte order
  slot connection-remote-value-size :: <integer> = $machine-word-size;
  slot connection-target-little-endian? :: <boolean>
    = os/$architecture-little-endian?;

  // Current set of configured target instruction breakpoints
  constant slot connection-instruction-breakpoints :: <stretchy-object-vector>
    = make(<stretchy-object-vector>);
end class;

define sealed method initialize
    (instance :: <ddapp-access-connection>, #next next-method, #key) => ();
  instance.connection-input-notification
    := make(<notification>, lock: instance.connection-input-lock);
end method;

define method connection-send-request
    (conn :: <ddapp-access-connection>,
     command :: <string>,
     arguments :: <object>,
     #key error? = #t)
 => (success? :: <boolean>, body :: <object>)
  let seq = conn.connection-message-seq;
  conn.connection-message-seq := seq + 1;

  let content
    = with-output-to-string(s)
        format(s, "{\"type\":\"request\",\"seq\":%d,\"command\":\"%s\"",
               seq, command);
        if (arguments)
          write(s, ",\"arguments\":");
          print-json(arguments, s);
        end if;
        write(s, "}");
      end;
  debugger-message("A->N: %s", content);
  format(conn.connection-output, "Content-Length: %d", content.size);
  write(conn.connection-output, "\r\n\r\n");
  write(conn.connection-output, content);
  force-output(conn.connection-output);

  /// Await response
  let response
    = with-lock (conn.connection-input-lock)
        while (empty?(conn.connection-input-queue))
          wait-for(conn.connection-input-notification);
        end while;
        pop(conn.connection-input-queue)
      end with-lock;
  let success? = true?(element(response, "success", default: #f));
  if (~success? & error?)
    let message = element(response, "message", default: #f);
    error("Nub command %s error: %s", command, message);
  else
    let body = element(response, "body", default: #f);
    values(success?, body)
  end if
end method;

///// START-APPLICATION-ON-CONNECTION
//    This function is called to initialize an instance of
//    <application-access-path> and calls the server function to create
//    the running process. If the access connection is local, then the
//    server returns a packaged process descriptor (a <NUB>) which is
//    saved in the access connection.

define method start-application-on-connection
  (conn :: <ddapp-access-connection>,
   command :: <string>,
   arguments :: <string>,
   symbol-file-directories :: <sequence>,
   working-directory :: false-or(<string>),
   library-search-paths :: <sequence>,
   #key own-shell? = #t)
 => ()
  let exe = as(<file-locator>, application-filename());
  let bin = exe.locator-directory;
  let nub = merge-locators(as(<file-locator>, "dylan-debugger-nub"), bin);
  debugger-message("Nub: %s", nub);

  // Start the nub process
  let (exit-code :: <integer>, _sig :: false-or(<integer>),
       child :: false-or(os/<application-process>),
       nub-input :: <stream>, nub-output :: <stream>)
    = os/run-application(vector(as(<string>, nub)),
                         under-shell?: #f,
                         asynchronous?: #t,
                         input: #"stream", output: #"stream");
  if (exit-code ~= 0)
    signal(make(<access-path-creation-error>));
  else
    conn.connection-process := child;
    conn.connection-output := nub-input;

    conn.connection-input-thread
      := make(<thread>,
              name: "Nub input reader",
              function:
                method ()
                  let cl-header = "Content-Length: ";
                  let cl-header-s = cl-header.size;
                  local
                    method header (line :: false-or(<string>), n :: <integer>)
                      if (line)
                        if (empty?(line))
                          body(n)
                        elseif (copy-sequence(line, end: cl-header-s) = cl-header)
                          let n = string-to-integer(line, start: cl-header-s);
                          header(read-line(nub-output, on-end-of-stream: #f), n);
                         else
                           error("Unrecognized line: %s%s", line, read-to-end(nub-output));
                         end if;
                      else
                        debugger-message("Nub EOF");
                      end if;
                    end method,
                    method body (n :: <integer>)
                      let payload = read(nub-output, n);
                      debugger-message("N->A: %s", payload);
                      let message = parse-json(payload);
                      with-lock (conn.connection-input-lock)
                        push-last(conn.connection-input-queue, message);
                        release(conn.connection-input-notification);
                      end with-lock;
                      header(read-line(nub-output, on-end-of-stream: #f), 0);
                    end method body;
                  header(read-line(nub-output, on-end-of-stream: #f), 0);
                end method);

    add!(conn.access-debugger-connection.connection-open-tethers, conn);

    // Ask it to launch the target
    let launch-arguments = make(<string-table>);
    launch-arguments["program"] := command;
    launch-arguments["args"] := arguments;
    if (working-directory)
      launch-arguments["cwd"] := working-directory;
    end if;
    connection-send-request(conn, "launch", launch-arguments);
  end if;
end method;


///// ATTACH-APPLICATION-ON-CONNECTION
//    This function is called to initialize an instance of
//    <process-access-path> and calls the server function to attach to
//    the running process. If the access connection is local, then the
//    server returns a packaged process descriptor (a <NUB>) which is
//    saved in the access connection.

define method attach-application-on-connection
  (conn :: <ddapp-access-connection>,
   process :: <remote-process>,
   symbol-file-directories :: <sequence>,
   system-info :: <string>)
 => ()
  if (#t)
    signal(make(<access-path-creation-error>));
  else
    add!(conn.access-debugger-connection.connection-open-tethers, conn);
  end if;
end method;
