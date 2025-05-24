Module:      ddapp-access-path
synopsis:     Presenting the runtime view of source locations.
author:       Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// CONSTRUCT-SOURCE-LOCATION-MAP

define method construct-source-location-map
    (conn :: <ddapp-access-connection>, sym :: <remote-symbol>) => ()
  if (instance?(sym, <remote-function>))
    // We have a function, so build the map of source locations
    // if possible.
    error("Not implemented construct-source-location-map");
  else
    // For now, lets be uncooperative about non-function symbols,
    // and assume we won't want locators for them.
    sym.definitely-no-source-locations := #t;
    sym.remote-symbol-source-location-map := #f;
  end if;
end method;


///// RESOLVE-SOURCE-LOCATION

define method resolve-source-location-on-connection
    (conn :: <ddapp-access-connection>, lib :: <remote-library>,
     filename :: <string>, line :: <integer>, col :: <integer>,
     paths :: <sequence>)
 => (code-location :: false-or(<remote-value>), exact? :: <boolean>)
  error("Not implemented resolve-source-location-on-connection");
/*
  if (valid? == 1)
    values(as-remote-value(code-location), precise? == 1)
  else
    values(#f, #f);
  end if;
*/
end method;
