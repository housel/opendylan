module:    remote-access-path
synopsis:  The true and correct definition of remote values in the access
           path
author:    Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// STRING-AS-REMOTE-VALUE

define method string-as-remote-value-on-connection
    (conn :: <remote-access-connection>, sz :: <integer>,
     str :: <string>, radix :: <integer>)
         => (val :: <remote-value>)
  let (val :: <RTARGET-ADDRESS>, overflow?) =
    Rtmgr/RemoteNub/string-to-target-address(conn.nub, sz, str, radix);
  as-remote-value(val);
end method;
