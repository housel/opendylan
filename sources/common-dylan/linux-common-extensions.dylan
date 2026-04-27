Module:       common-dylan-internals
Author:       Gary Palter
Synopsis:     Common extensions to Dylan
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define inline-only function get-application-filename
    () => (filename :: false-or(<byte-string>))
  let exe-path = "/proc/self/exe";
  let path-max = 8192;
  with-string-builder-byte-storage-to-string (buffer, path-max)
    let count
      = raw-as-integer
          (%call-c-function ("readlink")
               (path :: <raw-byte-string>,
                buffer :: <raw-pointer>,
                bufsize :: <raw-c-size-t>)
            => (count :: <raw-c-ssize-t>)
               (primitive-string-as-raw(exe-path),
                primitive-cast-raw-as-pointer
                  (primitive-unwrap-machine-word(buffer)),
                integer-as-raw(path-max))
           end);
    min(count, 0)
  end;
end;
