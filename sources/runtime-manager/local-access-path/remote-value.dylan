module:    access-path-implementation
synopsis:  The true and correct definition of remote values in the access
           path
author:    Paul Howard
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// STRING-AS-REMOTE-VALUE
//    Converts a string to a <remote-value> on the application's machine.

define method string-as-remote-value-on-connection
    (conn :: <local-access-connection>, sz :: <integer>,
     str :: <string>, radix :: <integer>)
         => (val :: <remote-value>)
  let (val, overflow?) =
    nub-string-to-target-address(conn.connection-process, sz, str, radix);
  val;
end method;
