Module:    dfmc-application
Synopsis:  Implementation of the <component-object> protocols.
Author:    Paul Howard
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

///// COMPONENT-IMAGE-FILENAME (Environment Protocols)

define method component-image-filename
    (application :: <dfmc-application>, component :: <component-object>)
 => (name :: <file-locator>)
  as(<file-locator>, component.application-object-proxy.library-image-name)
end method;


///// COMPONENT-VERSION (Environment Protocols)

define method component-version
    (application :: <dfmc-application>, component :: <component-object>)
 => (major-version :: <integer>, minor-version :: <integer>)
  component.application-object-proxy.library-version
end method;


///// DO-APPLICATION-COMPONENTS (Environment Protocols)

define method do-application-components
    (f :: <function>, application :: <dfmc-application>)
 => ()
  let target = application.application-target-app;

  local method wrap-for-env (l :: <remote-library>) => (c :: <component-object>)
          make-environment-object(<component-object>,
                                  project: application.server-project,
                                  application-object-proxy: l)
        end method;

  perform-debugger-transaction
    (target,
     method ()
       let path = target.debug-target-access-path;
       do-libraries(method (l :: <remote-library>) => ()
                      f(wrap-for-env(l))
                    end method,
                    path);
     end method);
end method;
