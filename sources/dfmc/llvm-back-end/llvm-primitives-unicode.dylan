Module: dfmc-llvm-back-end
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              Additional code is Copyright 2009-2026 Gwydion Dylan Maintainers
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define side-effect-free stateless dynamic-extent &c-primitive-descriptor primitive-utf-8-as-utf-32-size
    (x :: <object>, offset :: <raw-integer>, byte-offset :: <raw-integer>,
     size :: <raw-integer>)
 => (size :: <raw-integer>);
define side-effect-free stateless dynamic-extent &c-primitive-descriptor primitive-utf-32-as-utf-8-size
    (x :: <object>, offset :: <raw-integer>, codepoint-offset :: <raw-integer>,
     size :: <raw-integer>)
 => (size :: <raw-integer>);

define side-effect-free stateless dynamic-extent &c-primitive-descriptor primitive-validate-utf-8
    (x :: <object>, offset :: <raw-integer>, byte-offset :: <raw-integer>,
     size :: <raw-integer>)
 => (valid? :: <raw-boolean>);

define side-effecting stateless dynamic-extent &c-primitive-descriptor primitive-transcode-utf-8-as-utf-32
    (dst :: <object>, dst-base-offset :: <raw-integer>, dst-offset :: <raw-integer>,
     src :: <object>, src-base-offset :: <raw-integer>, src-offset :: <raw-integer>,
     size :: <raw-integer>)
 => (transcoded-size :: <raw-integer>);
define side-effecting stateless dynamic-extent &c-primitive-descriptor primitive-transcode-utf-32-as-utf-8
    (dst :: <object>, dst-base-offset :: <raw-integer>, dst-offset :: <raw-integer>,
     src :: <object>, src-base-offset :: <raw-integer>, src-offset :: <raw-integer>,
     size :: <raw-integer>)
 => (transcoded-size :: <raw-integer>);
