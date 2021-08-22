Module:    debugger-test-target-app
Author:    Peter S. Housel
Synopsis:  An application library for test-suite access-path-test-suite
Copyright:    Original Code is Copyright 2015 Gwydion Dylan Maintainers
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

// For testing primitive-invoke-debugger
define not-inline function test-invoke-debugger()
  break("invoking the debugger with %d and %=", 844, #(#"invoke" . #"debugger"));
end function;
