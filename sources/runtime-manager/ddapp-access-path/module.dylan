module:       dylan-user
synopsis:     Module definitions for the remote-access-path library
author:       Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


define module ddapp-access-path
  use common-dylan;
  use dylan-extensions,
    import: { <machine-word>,
              <abstract-integer>,
              <double-integer>,
              $minimum-unsigned-machine-word,
              integer-as-raw };
  use dylan-primitives;
  use machine-words;
  use threads, exclude: { thread-name };
  use format;
  use format-out;
  use print;
  use streams;
  use operating-system, prefix: "os/";
  use byte-vector;
  use table-extensions, import: { <string-table> };
  use locators;
  use access-path;
  use access-path-nub;
  use json;
end module;

