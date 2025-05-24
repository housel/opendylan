Module:      ddapp-access-path
synopsis:   Functions for looking up remote symbols
author:     Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define function as-remote-symbol
    (conn :: <ddapp-access-connection>, library :: <remote-library>,
     object :: <string-table>)
 => (sym :: <remote-symbol>)
  let name = element(object, "name");
  let address = ddapp-string-as-remote-value(element(object, "address"));
  let language = classify-symbolic-name(conn, name);

  if (element(object, "isFunction", default: #f))
    let debug-start = ddapp-string-as-remote-value(element(object, "debugStartAddress"));
    let debug-end = ddapp-string-as-remote-value(element(object, "debugEndAddress"));
    let end-address = ddapp-string-as-remote-value(element(object, "endAddress"));
    make(<remote-function>,
         name: name,
         address: address,
         language: language,
         library: library,
         debug-start: debug-start,
         debug-end: debug-end,
         absolute-end: end-address)
  else
    make(<remote-symbol>,
         name: name,
         address: address,
         language: language,
         library: library)
  end if
end function;

///// DO-SYMBOLS-IN-LIBRARY

define method do-symbols-in-library
    (function :: <function>, conn :: <ddapp-access-connection>,
     library :: <remote-library>,
     #key matching = "*", type = #f)
 => ();
  let symbols-arguments = make(<string-table>);
  symbols-arguments["moduleId"] := library.rnub-descriptor;
  symbols-arguments["pattern"] := matching;
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "symbols", symbols-arguments);
  let symbols = element(body, "symbols", default: #[]);
  let mapped = map(curry(as-remote-symbol, conn, library), symbols);
  do(function, mapped);
end method;

///// NEAREST-SYMBOLS-FROM-NUB

define method nearest-symbols-from-nub
    (conn :: <ddapp-access-connection>, address :: <remote-value>)
 => (any-luck? :: <boolean>,
     where-is-it? :: <NUBLIBRARY>,
     gimme-handle :: <NUBHANDLE>)
  // Wraps up the debugger nub function which does a brute-force
  // search in the debug map for the three nearest symbols and
  // constructs an opaque lookup table which is passed back later
  // to get information about the symbols.
  error("Not implemented nearest-symbols-from-nub");
end method;

///// COLLECT-NEAREST-SYMBOLS

define method collect-nearest-symbols
    (conn :: <ddapp-access-connection>, lib :: <remote-library>,
     lookups :: <NUBHANDLE>)
 => (closest :: <remote-symbol>,
     prev :: <remote-symbol>,
     nxt :: <remote-symbol>)
  // For nearest-symbols, the nub creates a quick lookup table with
  // three entries: 1. The nearest symbol, 2. The closest symbol
  // preceding the nearest, 3. The closest symbol following the
  // nearest (in that order).

  // Pull nub information for the nearest symbol, and make a
  // <remote-symbol> object to represent it.

  error("Not implemented collect-nearest-symbols");
end method;


///// FIND-SYMBOL-IN-LIBRARY

define method find-symbol-in-library
    (conn :: <ddapp-access-connection>,
     library :: <remote-library>,
     name :: <string>)
 => (maybe-sym :: false-or(<remote-symbol>))
  let symbols-arguments = make(<string-table>);
  symbols-arguments["moduleId"] := library.rnub-descriptor;
  symbols-arguments["name"] := name;
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "symbols", symbols-arguments);
  let symbols = element(body, "symbols", default: #[]);
  symbols.size = 1
    & as-remote-symbol(conn, library, first(symbols))
end method;


///// SYMBOL-RELATIVE-ADDRESS

define method symbol-relative-address-on-connection
    (conn :: <ddapp-access-connection>,
     path :: <access-path>, address :: <remote-value>)
 => (sym-if-found :: false-or(<remote-symbol>),
     offset       :: <abstract-integer>)
  let symbols-arguments = make(<string-table>);
  symbols-arguments["memoryReference"] := remote-value-as-ddapp-string(address);
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "symbols", symbols-arguments);
  let symbols = element(body, "symbols", default: #[]);
  if (symbols.size = 1)
    let symbol = first(symbols);
    let rlib = symbol["moduleId"];
    let library = find-or-make-library(path, as-remote-pointer(rlib));
    let remote-symbol = as-remote-symbol(conn, library, symbol);
    let offset = u%-(address, remote-symbol.remote-symbol-address);
    values(remote-symbol, as(<abstract-integer>, offset))
  else
    values(#f, 0)
  end if
end method;

///// FUNCTION-BOUNDING-ADDRESSES

define method function-bounding-addresses-on-connection
    (conn :: <ddapp-access-connection>, address :: <remote-value>)
 => (lowerbound :: <remote-value>, upperbound :: <remote-value>)
  error("Not implemented function-bounding-addresses-on-connection");
end method;
