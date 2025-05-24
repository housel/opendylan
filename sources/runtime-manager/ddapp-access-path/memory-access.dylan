Module:      ddapp-access-path
synopsis:   Implementation of functions for memory access
author:     Paul Howard, Nosa Omo
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


define method register-vector-on-connection
    (conn :: <ddapp-access-connection>) => (vec :: <vector>)
  error("Not implemented register-vector-on-connection");
end method;


///// READ-VALUE

define method read-value-from-register
    (conn :: <ddapp-access-connection>, register :: <active-remote-register>,
     #key frame-index = #f)
 => (val :: <remote-value>)
  error("Not implemented read-value-from-register");
end method;

define method read-value-from-memory
    (conn :: <ddapp-access-connection>, location :: <remote-value>)
 => (val :: <remote-value>)
  let rm-arguments = make(<string-table>);
  rm-arguments["memoryReference"] := remote-value-as-ddapp-string(location);
  rm-arguments["count"] := conn.connection-remote-value-size;
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "readMemory", rm-arguments, error?: #f);
  if (~success?)
    signal(make (<remote-access-violation-error>));
  end if;
  let data = element(body, "data");
  error("Not implemented read-value-from-memory");
end method;

///// WRITE-VALUE

define method write-value-to-register
    (conn :: <ddapp-access-connection>,
     register :: <active-remote-register>,
     value :: <remote-value>)
 => ()
  error("Not implemented write-value-to-register");
  // if (err ~= $access-ok)
  //   signal(make(<remote-access-violation-error>));
  // end if;
end method;

define method write-value-to-memory
    (conn :: <ddapp-access-connection>, address :: <remote-value>,
     value :: <remote-value>)
 => ()
  let bytes = make(<byte-vector>, size: conn.connection-remote-value-size);
  if (conn.connection-target-little-endian?)
    for (i from 0 below bytes.size,
         value = value then %shift-right(value, 8))
      bytes[i] := as(<integer>, %logand(value, #xFF));
    end for;
  else
    error("Big endian? That's nostalgic");
  end if;

  let wm-arguments = make(<string-table>);
  wm-arguments["memoryReference"] := remote-value-as-ddapp-string(address);
  wm-arguments["data"] := base64-encode(bytes);
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "writeMemory", wm-arguments, error?: #f);
  if (~success?)
    signal(make (<remote-access-violation-error>));
  end if;
end method;

///// READ-SINGLE-FLOAT

define method read-single-float-from-register
    (conn :: <ddapp-access-connection>, register :: <active-remote-register>)
 => (val :: <single-float>)
  error("Not implemented read-single-float-from-register");
  // if (err ~= $access-ok)
  //   signal(make(<remote-access-violation-error>));
  // end if;
end method;

define method read-single-float-from-memory
    (conn :: <ddapp-access-connection>, location :: <remote-value>)
 => (val :: <single-float>)
  error("Not implemented read-single-float-from-memory");
  // if (err ~= $access-ok)
  //   signal(make(<remote-access-violation-error>));
  // end if;
end method;


///// WRITE-SINGLE-FLOAT

define method write-single-float-to-register
    (conn :: <ddapp-access-connection>,
     register :: <active-remote-register>,
     value :: <single-float>)
 => ()
  error("Not implemented write-single-float-to-register");
end method;

define method write-single-float-to-memory
    (conn :: <ddapp-access-connection>, address :: <remote-value>,
     value :: <single-float>)
 => ()
  error("Not implemented write-single-float-to-memory");
end method;

///// READ-DOUBLE-FLOAT

define method read-double-float-from-register
    (conn :: <ddapp-access-connection>,
     register :: <active-remote-register>)
 => (val :: <double-float>)
  error("Not implemented read-double-float-from-register");
end method;

define method read-double-float-from-memory
    (conn :: <ddapp-access-connection>, location :: <remote-value>)
 => (val :: <double-float>)
  error("Not implemented read-double-float-from-memory");
end method;

///// WRITE-DOUBLE-FLOAT

define method write-double-float-to-register
    (conn :: <ddapp-access-connection>,
     register :: <active-remote-register>,
     value :: <double-float>)
 => ()
  error("Not implemented write-double-float-to-register");
end method;

define method write-double-float-to-memory
    (conn :: <ddapp-access-connection>, address :: <remote-value>,
     value :: <double-float>)
 => ()
  error("Not implemented write-double-float-to-memory");
end method;

///// READ-BYTE-STRING

define method read-byte-string-from-memory
   (conn :: <ddapp-access-connection>, address :: <remote-value>,
    length :: <integer>)
 => (val :: <byte-string>)
  error("Not implemented read-byte-string-from-memory");
end method;

///// WRITE-BYTE-STRING

define method write-byte-string-to-memory
    (conn :: <ddapp-access-connection>, address :: <remote-value>,
     string-source :: <byte-string>, ending-index :: <integer>)
 => ()
  error("Not implemented write-byte-string-to-memory");
end method;

///// CALCULATE-STACK-ADDRESS

define method calculate-stack-address-on-connection
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>,
     offset :: <integer>)
 => (addr :: <remote-value>)
  error("Not implemented calculate-stack-address-on-connection");
end method;


///// REMOTE-VIRTUAL-PAGE-SIZE

define method virtual-page-size-on-connection
    (conn :: <ddapp-access-connection>) => (page-size :: <integer>)
  error("Not implemented virtual-page-size-on-connection");
end method;


///// REMOTE-VALUE-BYTE-SIZE

define method remote-value-byte-size-on-connection
    (conn :: <ddapp-access-connection>) => (value-size :: <integer>)
  // Initialized at process create time
  conn.connection-remote-value-size
end method;


///// PAGE-READ-PERMISSION?

define method page-read-permission-on-connection?
    (conn :: <ddapp-access-connection>, address :: <remote-value>)
 => (answer :: <boolean>)
  error("Not implemented page-read-permission-on-connection?");
end method;


///// PAGE-WRITE-PERMISSION?

define method page-write-permission-on-connection?
    (conn :: <ddapp-access-connection>, address :: <remote-value>)
 => (answer :: <boolean>)
  error("Not implemented page-write-permission-on-connection?");
end method;


///// PAGE-RELATIVE-ADDRESS

define method page-relative-address-on-connection
    (conn :: <ddapp-access-connection>, addr :: <remote-value>)
 => (id :: <integer>, offset :: <integer>)
  let mri-arguments = make(<string-table>);
  mri-arguments["memoryReference"] := remote-value-as-ddapp-string(addr);
  let (success? :: <boolean>, body :: <object>)
    = connection-send-request(conn, "memoryRegionInfo", mri-arguments);

  let page-size = as-remote-value(element(body, "pageSize"));
  let (quot, rem) = %divide(addr, page-size);
  debugger-message("%= page-relative: page %= offset %=", addr, quot, rem);
  values(as-integer(quot), as-integer(rem))
end method;


///// DOWNLOAD-CODE-ON-CONNECTION

define method download-code-on-connection
    (conn :: <ddapp-access-connection>, thread :: <remote-thread>,
     downloadable-records :: <sequence>,
     library :: false-or(<remote-library>), entry-point :: <byte-string>)
 => (regions :: <sequence>, symbols :: <sequence>);
  error("Not implemented download-code-on-connection");
  // debugger-message("Regions: %=", regions);
  // let regions
  //   = map-as(<vector>,
  //            method (region :: Rtmgr/RemoteNub/<Region>)
  //              let classification
  //                = select (region.Rtmgr/RemoteNub/REGION/kind)
  //                    #"DylanExact" => #"dylan-exact";
  //                    #"DylanStatic" => #"dylan-static";
  //                    #"DylanAmbiguous" => #"dylan-ambiguous";
  //                    #"DylanFixup" => #"dylan-fixup";
  //                    #"DylanImport" => #"dylan-import";
  //                    #"DylanUntraced" => #"dylan-untraced";
  //                    #"DylanHistory" => #"dylan-history";
  //                    #"CompiledCode" => #"compiled-code";
  //                    #"InitArray" => #"init-array";
  //                    #"EHFrame" => #"eh-frame";
  //                  end;
  //              let lower-bound
  //                = as-remote-value(region.Rtmgr/RemoteNub/REGION/lower);
  //              let upper-bound
  //                = as-remote-value(region.Rtmgr/RemoteNub/REGION/upper);
  //              make(<remote-memory-region>,
  //                   classification: classification,
  //                   lower-bound: lower-bound,
  //                   upper-bound: upper-bound)
  //            end,
  //            regions);
  // let symbols = make(<stretchy-object-vector>);
  // do-symbols-aux(conn, curry(add!, symbols), library,
  //                first-sym, last-sym, lookups);
  // values(regions, symbols)
end method;

///// PERFORM-COFF-RELOCATION

define method perform-coff-relocation-on-connection
    (conn :: <ddapp-access-connection>,
     ra :: <remote-value>, da :: <remote-value>,
     #key relative? = #f)
 => (worked? :: <boolean>)
  error("Not implemented perform-coff-relocation-on-connection");
end method;
