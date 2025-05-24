Module:      ddapp-access-path
synopsis:  Access path support for profiling
author:    Keith Dennison, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// INFORM-PROFILING-STARTED (Added by phoward, 1-APR-1997)

define method inform-profiling-started-on-connection
    (conn :: <ddapp-access-connection>) => ()
  error("Not implemented inform-profiling-started-on-connection");
end method;


///// INFORM-PROFILING-STOPPED (Added by phoward, 1-APR-1997)

define method inform-profiling-stopped-on-connection
    (conn :: <ddapp-access-connection>) => ()
  error("Not implemented inform-profiling-stopped-on-connection");
end method;


///// GET-PROCESS-WALL-CLOCK-TIME

define method get-process-wc-time-on-connection
    (conn :: <ddapp-access-connection>)
 => (timer :: <integer>)
  error("Not implemented get-process-wc-time-on-connection");
end method;
