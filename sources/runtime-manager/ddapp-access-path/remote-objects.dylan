Module:      ddapp-access-path
synopsis:    Modelling remote objects
author:      Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND



///// DO-PROCESSES

define method do-processes
    (function :: <function>, dc :: <local-ddapp-debugger-connection>) => ()
  error("Not implemented do-processes");
end method;

///// GET-PROCESS-PAGE-FAULT-COUNT

define method get-process-page-fault-count-on-connection
    (conn :: <ddapp-access-connection>) => (count :: <integer>)
  error("Not implemented get-process-page-fault-count-on-connection");
end method;


///// GET-THREAD-CPU-TIME

define method get-thread-cpu-time-on-connection
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>)
 => (timer :: <integer>)
  error("Not implemented get-thread-cpu-time-on-connection");
end method;


///// CONSTRUCT-THREAD-OBJECT

define method construct-thread-object
   (conn :: <ddapp-access-connection>, thread :: <NUBTHREAD>,
     #key path, priority = 0)
      => (thread :: <remote-thread>)
  let thread-name = format-to-string ("DBGTHREAD%d", *next-thread-id*);
  *next-thread-id* := *next-thread-id* + 1;

  let rthread = as-integer(thread);

  make(<remote-thread>,
       name: thread-name,
       access-path: path,
       os-priority: priority,
       nub-descriptor: thread,
       rnub-descriptor: rthread)
end method;


///// CONSTRUCT-LIBRARY-OBJECT

define method construct-library-object
    (conn :: <ddapp-access-connection>, lib :: <NUBLIBRARY>)
 => (lib :: <remote-library>)
  let rlib = as-integer(lib);
  let module = element(conn.connection-stop-reason, "module");
  if (element(module, "id") = rlib)
    let version = element(module, "version", default: "");
    let (major-v :: <integer>, next-key :: <integer>) = string-to-integer(version, default: 0);
    let minor-v
      = if (next-key ~= 0)
          string-to-integer(version, start: next-key + 1, default: 0);
        else
          0
        end if;
    let filename = element(module, "name");
    let address-range = element(module, "addressRange");
    let base-addr = ddapp-string-as-remote-value(address-range);
    make(<remote-library>,
         nub-descriptor: lib,
         rnub-descriptor: rlib,
         locator: filename,
         core-name: locator-base(as(<file-locator>, filename)),
         version-major: major-v,
         version-minor: minor-v,
         base-address: base-addr)
  else
   error("construct-library-object called without appropriate stop reason");
  end if
end method;
