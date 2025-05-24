Module:      ddapp-access-path
synopsis:   Implementation of the <access-path> class
author:     Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define method make-access-connection
    (ap :: <access-path>, conn :: <local-ddapp-debugger-connection>,
     #key description = ap.access-path-application)
 => (conn :: <ddapp-access-connection>)
  make(<ddapp-access-connection>,
       debugger-connection: conn,
       description: description)
end method;
