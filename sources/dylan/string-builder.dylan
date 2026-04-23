Module:    internal
Author:    Peter S. Housel
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              Additional code is Copyright 2026 Gwydion Dylan Maintainers
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

//
// STRING-BUILDER
//

define constant <string-builder-representation> = limited(<vector>, of: <byte>);

define constant $empty-<string-builder-representation>
  = make(<string-builder-representation>, size: 0);

define class <string-builder> (<mutable-sequence>, <stretchy-collection>)
  slot byte-size :: <integer>, init-value: 0;
  slot builder-representation :: <string-builder-representation>,
    init-value: $empty-<string-builder-representation>,
    init-keyword: representation:;
end class;

define sealed inline method make
    (class == <string-builder>, #rest all-keys, #key byte-capacity = 0)
 => (builder :: <string-builder>);
  let representation
    = if (zero?(byte-capacity))
        $empty-<string-builder-representation>
      else
        make(<string-builder-representation>, size: byte-capacity)
      end if;
  next-method(class, representation: representation)
end method;

define sealed inline method element-type
    (t :: <string-builder>) => (type :: <type>)
  <character>
end method;

// Byte count for each of the possible top 4 bits of a UTF-8 byte
define constant $utf-8-increment
  = #[1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 2, 3, 4];

define inline function skip-utf-8
    (representation :: <string-builder-representation>, i :: <integer>)
 => (new-i :: <integer>)
  let skip
    = without-bounds-checks
        primitive-the(<integer>, $utf-8-increment[ash(representation[i], -4)])
      end;
  i + skip
end function;

define sealed method size
    (builder :: <string-builder>)
 => (character-count :: <integer>)
  let bytes = builder.byte-size;
  let representation = builder.builder-representation;
  for (i = 0 then skip-utf-8(representation, i), count from 0,
       while: i < bytes)
  finally
    count
  end for
end method;

define function string-builder-reserve
    (builder :: <string-builder>, more-bytes :: <integer>)
 => (representation :: <string-builder-representation>, start :: <integer>);
  let start = builder.byte-size;
  let new-end = start + more-bytes;
  builder.byte-size := new-end;

  let old-representation = builder.builder-representation;
  if (new-end > old-representation.size)
    // As a heuristic we want to allocate at least a word size of
    // capacity for the initial growth
    let new-representation-size
      = power-of-two-ceiling(max(new-end, truncate/($machine-word-size, 8)));
    let new-representation
      = make(<string-builder-representation>, size: new-representation-size);
    primitive-replace-bytes!
      (new-representation, primitive-repeated-slot-offset(new-representation),
       integer-as-raw(0),
       old-representation, primitive-repeated-slot-offset(old-representation),
       integer-as-raw(0),
       integer-as-raw(start));
    values(builder.builder-representation := new-representation, start)
  else
    values(old-representation, start)
  end if
end function;

define method size-setter
    (new-size :: <integer>, builder :: <string-builder>)
 => (new-size :: <integer>);
  let bytes = builder.byte-size;
  let representation = builder.builder-representation;
  for (i = 0 then skip-utf-8(representation, i), count from 0,
       while: count < new-size & i < bytes)
  finally
    if (count = new-size)
      builder.byte-size := i;
    else
      // Grow representation, fill with ' '
      let increment = new-size - count;
      let (representation, start) = string-builder-reserve(builder, increment);
      primitive-fill-bytes!(representation,
                            primitive-repeated-slot-offset(representation),
                            integer-as-raw(i), integer-as-raw(increment),
                            primitive-character-as-raw(' '));
    end if
  end for;
  new-size
end method;

define sealed method add!
    (builder :: <string-builder>, new-element :: <character>)
 => (builder :: <string-builder>);
  let code-point = as(<integer>, new-element);
  case
    code-point < #x80 =>
      let (representation, start) = string-builder-reserve(builder, 1);
      without-bounds-checks
        representation[start] := code-point;
      end;

    code-point < #x800 =>
      // 00000yyyyyxxxxxx => 110yyyyy 10xxxxxx
      let (representation, start) = string-builder-reserve(builder, 2);
      without-bounds-checks
        representation[start]
          := logior(#b1100_0000, ash(code-point, -6));
        representation[start + 1]
          := logior(#b1000_0000, logand(code-point, #b111111));
      end;

    code-point < #x10000 =>
      // zzzzyyyyyyxxxxxx => 1110zzzz 10yyyyyy 10xxxxxx
      let (representation, start) = string-builder-reserve(builder, 3);
      without-bounds-checks
        representation[start]
          := logior(#b1110_0000, ash(code-point, -12));
        representation[start + 1]
          := logior(#b1000_0000, logand(ash(code-point, -6), #b111111));
        representation[start + 2]
          := logior(#b1000_0000, logand(code-point, #b111111));
      end;

    code-point < #x110000 =>
      // 000uuuuuzzzzyyyyyyxxxxxx => 11110uuu 10uuzzzz 10yyyyyy 10xxxxxx
      let (representation, start) = string-builder-reserve(builder, 4);
      without-bounds-checks
        representation[start]
          := logior(#b1111_0000, ash(code-point, -18));
        representation[start + 1]
          := logior(#b1000_0000, logand(ash(code-point, -12), #b111111));
        representation[start + 2]
          := logior(#b1000_0000, logand(ash(code-point, -6), #b111111));
        representation[start + 3]
          := logior(#b1000_0000, logand(code-point, #b111111));
      end;

    otherwise =>
      error("Invalid Unicode code point U+%x", code-point);
  end case;
  builder
end method;

define sealed method concatenate!
    (builder :: <string-builder>, #rest more)
 => (builder :: <string-builder>)
  // Determine in advance the final needed representation capacity
  let size-increment
    = for (s in more, increment = 0 then increment + s.size)
      finally
        increment
      end for;
  let (representation, start) = string-builder-reserve(builder, size-increment);

  // Loop again to append the strings
  for (s in more,
       offset = start
         then select (s by instance?)
                <byte-string> =>
                  primitive-replace-bytes!
                    (representation,
                     primitive-repeated-slot-offset(representation),
                     integer-as-raw(offset),
                     s,
                     primitive-repeated-slot-offset(s),
                     integer-as-raw(0),
                     integer-as-raw(s.size));
                   offset + s.size;
                otherwise =>
                  error("Concatenate of %= not yet supported", s);
              end select)
  end for;
  builder
end method concatenate!;

define sealed inline method as (class == <string>, builder :: <string-builder>)
 => (s :: <string>)
  let s-size = builder.byte-size;
  if (zero?(s-size))
    ""
  else
    let s = make(<byte-string>, size: s-size);
    let representation = builder.builder-representation;
    primitive-replace-bytes!
      (s, primitive-repeated-slot-offset(s),
       integer-as-raw(0),
       representation, primitive-repeated-slot-offset(representation),
       integer-as-raw(0),
       integer-as-raw(s.size));
    s
  end if
end method as;

