Module:       common-dylan-internals
Author: Hannes Mehnert
Synopsis:     Common extensions to Dylan
Copyright:    Original Code is Copyright (c) 2008 Dylan Hackers
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define inline-only function get-application-filename () => (res :: <string>)
  let length = raw-as-integer(%call-c-function("application_filename_length")
                                ()
                                => (length :: <raw-c-unsigned-int>)
                                ()
                             end);

  with-string-builder-byte-storage-to-string (buffer, length + 1)
    let raw-length
      = %call-c-function("application_filename_name")
            (buffer :: <raw-pointer>,
             length :: <raw-c-unsigned-int>)
         => (res :: <raw-c-unsigned-int>)
            (primitive-cast-raw-as-pointer
               (primitive-unwrap-machine-word(buffer)),
             integer-as-raw(length))
        end;
    raw-as-integer(raw-length)
  end
end;
