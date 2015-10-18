Module:       access-path-test-suite
Author:       Peter S. Housel
Copyright:    Original Code is Copyright 2015 Gwydion Dylan Maintainers
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define constant $library-mangler = make(<mangler>);

define test do-symbols-test ()
  let access-path = #f;
  check-no-errors("Instantiate access path",
                  access-path := make-test-access-path(""));

  restart(access-path);

  let collected = make(<stretchy-object-vector>);
  local
    method collect-symbol (symbol)
      add!(collected, symbol.remote-symbol-name);
    end method;

  block (done)
    while (#t)
      let stop-reason
        = wait-for-stop-reason(access-path, timeout: $debugger-wait-timeout);
      select (stop-reason by instance?)
        <create-process-stop-reason> =>
          do-symbols(collect-symbol, access-path,
                     library: stop-reason.stop-reason-executable-component,
                     matching: "_Init_*_");
        <load-library-stop-reason> =>
          do-symbols(collect-symbol, access-path,
                     library: stop-reason.stop-reason-library,
                     matching: "_Init_*_");
        <exit-process-stop-reason> =>
          done();
        otherwise =>
          #f;
      end select;
      continue(access-path);
    end while;
  end block;

  let library-names = vector($test-library-name, "common-dylan", "dylan");
  for (library-name in library-names)
    let init-name
      = concatenate("_Init_",
                    mangle-name-locally($library-mangler, library-name));
    check-true(format-to-string("Found symbol %s in %s",
                                init-name, library-name),
               member?(init-name, collected, test: \=));
  end for;

  check-no-errors("Close access path", close-application(access-path));
end test;
