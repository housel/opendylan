Module:       access-path-test-suite
Author:       Peter S. Housel
Copyright:    Original Code is Copyright 2015 Gwydion Dylan Maintainers
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define constant $debugger-wait-timeout = 10000;

define constant $test-module-name = "debugger-test-target-app";
define constant $test-library-name = "debugger-test-target-app";

define constant $iep-mangler = make(<mangler-with-options>, iep-extension: #t);

define function mangle-iep-name
    (binding-name :: <string>,
     module-name :: <string>,
     library-name :: <string>)
 => (mangled :: <string>);
  mangle-binding-spread($iep-mangler, binding-name, module-name, library-name)
end function;

define test simple-breakpoint-test ()
  let access-path = #f;
  assert-no-errors(access-path := make-test-access-path("simple-breakpoint"),
                   "Instantiate access path");

  restart(access-path);

  local
    method wait-for-stop-reason-aux(access-path :: <access-path>) => (stop-reason :: <stop-reason>);
      let stop-reason
        = wait-for-stop-reason(access-path, timeout: $debugger-wait-timeout);
      test-output("Stop-reason %=\n", stop-reason);
      if (instance?(stop-reason, <load-library-stop-reason>)
            | instance?(stop-reason, <unload-library-stop-reason>)
            | instance?(stop-reason, <create-thread-stop-reason>)
            | instance?(stop-reason, <exit-thread-stop-reason>))
        continue(access-path);
        wait-for-stop-reason-aux(access-path)
      elseif (~stop-reason)
        error("Timed out waiting for stop");
      else
        stop-reason
      end if;
    end method;

  assert-instance?(<create-process-stop-reason>,
                   wait-for-stop-reason-aux(access-path),
                   "Stop at process creation");

  continue(access-path);
  assert-instance?(<system-initialized-stop-reason>,
                   wait-for-stop-reason-aux(access-path),
                   "Stop at system initialized");

/*
  let name
    = mangle-iep-name("simple-breakpoint",
                      $test-module-name,
                      $test-library-name);
  let place = find-symbol(access-path, name);
  assert-true("Symbol for simple-breakpoint found", place);
  assert-true(enable-breakpoint(access-path,
                                first-frame-breakable-address(place)),
              "Set breakpoint at simple-breakpoint");

  continue(access-path);
  assert-instance?(<breakpoint-stop-reason>,
                   wait-for-stop-reason-aux(access-path),
                   "Stop at breakpoint");
*/

  continue(access-path);
  assert-instance?(<exit-process-stop-reason>,
                   wait-for-stop-reason-aux(access-path),
                   "Stop at process exit");

  check-no-errors(close-application(access-path),
                  "Close access path");
end test;
