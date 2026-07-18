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

define constant <utf-8-representation> = limited(<vector>, of: <byte>);
define constant <utf-32-representation> = limited(<vector>, of: <character>);
define constant <string-builder-representation>
  = type-union(<utf-8-representation>, <utf-32-representation>);

define constant $empty-<string-builder-representation>
  = make(<utf-8-representation>, size: 0);

define class <string-builder> (<mutable-sequence>, <stretchy-collection>)
  slot %size :: <integer>, init-value: 0;
  slot builder-representation :: <string-builder-representation>,
    init-value: $empty-<string-builder-representation>,
    init-keyword: representation:;
end class;

define sealed inline method make
    (class == <string-builder>, #rest all-keys, #key size = 0, byte-capacity = 0)
 => (builder :: <string-builder>);
  let representation
    = if (zero?(byte-capacity))
        $empty-<string-builder-representation>
      else
        make(<utf-8-representation>, size: byte-capacity)
      end if;
  let instance = next-method(class, representation: representation);
  if (size > 0)
    size-setter(size, instance);
  end;
  instance
end method;

define method type-for-copy (vector :: <string-builder>) => (type :: <type>)
  <string-builder>
end method type-for-copy;

define sealed inline method element-type
    (t :: <string-builder>) => (type :: <type>)
  <character>
end method;

define function builder-utf-8-representation
    (builder :: <string-builder>)
 => (representation :: <utf-8-representation>)
  builder-utf-8-representation-aux(builder, builder.builder-representation)
end function;

define method builder-utf-8-representation-aux
    (builder :: <string-builder>, representation :: <utf-8-representation>)
 => (representation :: <utf-8-representation>)
  representation
end method;

define method builder-utf-8-representation-aux
    (builder :: <string-builder>, representation :: <utf-32-representation>)
 => (representation :: <utf-8-representation>)
  let codepoints = builder.%size;
  let utf-8-size
    = raw-as-integer
        (primitive-utf-32-as-utf-8-size
           (representation,
            primitive-repeated-slot-offset(representation),
            integer-as-raw(0),
            integer-as-raw(codepoints)));
  let utf-8-representation = make(<utf-8-representation>, size: utf-8-size);
  let _transcoded-size
    = primitive-transcode-utf-32-as-utf-8
        (utf-8-representation,
         primitive-repeated-slot-offset(utf-8-representation),
         integer-as-raw(0),
         representation,
         primitive-repeated-slot-offset(representation),
         integer-as-raw(0),
         integer-as-raw(codepoints));
  //assert(utf-8-size = raw-as-integer(transcoded-size));
  builder.%size := utf-8-size;
  builder.builder-representation := utf-8-representation
end method;

define function builder-utf-32-representation
    (builder :: <string-builder>)
 => (representation :: <utf-32-representation>)
  builder-utf-32-representation-aux(builder, builder.builder-representation)
end function;

define method builder-utf-32-representation-aux
    (builder :: <string-builder>, representation :: <utf-8-representation>)
 => (representation :: <utf-32-representation>)
  let bytes = builder.%size;
  let utf-32-size
    = raw-as-integer
        (primitive-utf-8-as-utf-32-size
           (representation,
            primitive-repeated-slot-offset(representation),
            integer-as-raw(0),
            integer-as-raw(bytes)));
  let utf-32-representation = make(<utf-32-representation>, size: utf-32-size);
  let _transcoded-size
    = primitive-transcode-utf-8-as-utf-32
        (utf-32-representation,
         primitive-repeated-slot-offset(utf-32-representation),
         integer-as-raw(0),
         representation,
         primitive-repeated-slot-offset(representation),
         integer-as-raw(0),
         integer-as-raw(bytes));
  //assert(utf-32-size = raw-as-integer(transcoded-size));
  builder.%size := utf-32-size;
  builder.builder-representation := utf-32-representation
end method;

define method builder-utf-32-representation-aux
    (builder :: <string-builder>, representation :: <utf-32-representation>)
 => (representation :: <utf-32-representation>)
  representation
end method;

// Byte count for each of the possible top 4 bits of a UTF-8 byte
define constant $utf-8-increment
  = #[1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 2, 3, 4];

define inline function skip-utf-8
    (representation :: <utf-8-representation>, i :: <integer>)
 => (new-i :: <integer>)
  let skip
    = without-bounds-checks
        primitive-the(<integer>, $utf-8-increment[ash(representation[i], -4)])
      end;
  i + skip
end function;

/*
define inline function decode-utf-8
    (representation :: <utf-8-representation>, i :: <integer>,
     space :: <integer>)
 => (character :: <character>, new-i :: <integer>)
  let byte0 = without-bounds-checks representation[i] end;
  // See Unicode Standard Table 3-7
  case
    byte0 < #x80 =>
      values(as(<character>, byte0), i + 1);

    byte0 < #xC2 =>
      error("Invalid UTF-8 sequence %x", byte0);

    byte0 < #xE0 & space >= 2 =>
      // 00000yyyyyxxxxxx => 110yyyyy 10xxxxxx
      let byte1 = without-bounds-checks representation[i + 1] end;
      if (#x80 <= byte1 & byte1 <= #xBF)
        let code-point
          = logior(ash(logand(byte0, #b00011111), 6),
                   logand(byte1, #b111111));
        values(as(<character>, code-point), i + 2)
      else
        error("Invalid UTF-8 sequence");
      end if;

    byte0 < #xF0 & space >= 3 =>
      // zzzzyyyyyyxxxxxx => 1110zzzz 10yyyyyy 10xxxxxx
      let byte1 = without-bounds-checks representation[i + 1] end;
      let byte2 = without-bounds-checks representation[i + 2] end;
      if (#x80 <= byte1 & byte1 <= #xBF
            & #x80 <= byte2 & byte2 <= #xBF)
        let code-point
          = logior(ash(logand(byte0, #b00001111), 12),
                   ash(logand(byte1, #b111111), 6),
                   logand(byte2, #b111111));
        // NB not checking for the surrogate code points #D800 through #DFFF,
        // which fall into this range, or for other malformed ranges
        values(as(<character>, code-point), i + 3)
      else
        error("Invalid UTF-8 sequence");
      end if;

    byte0 < #xF5 & space >= 4 =>
      // 000uuuuuzzzzyyyyyyxxxxxx => 11110uuu 10uuzzzz 10yyyyyy 10xxxxxx
      let byte1 = without-bounds-checks representation[i + 1] end;
      let byte2 = without-bounds-checks representation[i + 2] end;
      let byte3 = without-bounds-checks representation[i + 2] end;
      if (#x80 <= byte1 & byte1 <= #xBF
            & #x80 <= byte2 & byte2 <= #xBF
            & #x80 <= byte3 & byte3 <= #xBF)
        let code-point
          = logior(ash(logand(byte0, #b00001111), 18),
                   ash(logand(byte1, #b111111), 12),
                   ash(logand(byte2, #b111111), 6),
                   logand(byte3, #b111111));
        // NB not checking for malformed ranges
        values(as(<character>, code-point), i + 3)
      else
        error("Invalid UTF-8 sequence");
      end if;

    otherwise =>
      error("Invalid UTF-8 sequence");
  end case
end function;
*/

define sealed method size
    (builder :: <string-builder>)
 => (character-count :: <integer>)
  let representation = builder.builder-representation;
  select (representation by instance?)
    <utf-8-representation> =>
      let bytes = builder.%size;
      raw-as-integer
        (primitive-utf-8-as-utf-32-size
           (representation,
            primitive-repeated-slot-offset(representation),
            integer-as-raw(0),
            integer-as-raw(bytes)));
    <utf-32-representation> =>
      builder.%size;
  end select
end method;

define function string-builder-reserve
    (builder :: <string-builder>, more-bytes :: <integer>)
 => (representation :: <string-builder-representation>, start :: <integer>);
  let old-representation = builder.builder-utf-8-representation;
  let start = builder.%size;
  let new-end = start + more-bytes;
  builder.%size := new-end;

  if (new-end > old-representation.size)
    // As a heuristic we want to allocate at least a word size of
    // capacity for the initial growth
    let new-representation-size
      = power-of-two-ceiling(max(new-end, truncate/($machine-word-size, 8)));
    let new-representation
      = make(<utf-8-representation>, size: new-representation-size);
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
  check-nat(new-size);
  let representation = builder.builder-representation;
  select (representation by instance?)
    <utf-8-representation> =>
      let bytes = builder.%size;
      for (i = 0 then skip-utf-8(representation, i), count from 0,
           while: count < new-size & i < bytes)
      finally
        if (count = new-size)
          builder.%size := i;
        else
          // Grow representation, fill with ' '
          let increment = new-size - count;
          let (representation, start)
            = string-builder-reserve(builder, increment);
          primitive-fill-bytes!(representation,
                                primitive-repeated-slot-offset(representation),
                                integer-as-raw(i), integer-as-raw(increment),
                                primitive-character-as-raw(' '));
        end if
      end for;
    <utf-32-representation> =>
      if (new-size > representation.size)
        let new-representation-size = power-of-two-ceiling(new-size);
        let new-representation
          = make(<utf-32-representation>, size: new-representation-size);
        without-bounds-checks
          for (i :: <integer> from 0 below builder.%size)
            new-representation[i] := representation[i];
          end for;
        end;
        builder.builder-representation := new-representation;
      end if;
      builder.%size := new-size;
  end select;
  new-size
end method;

define sealed method add!
    (builder :: <string-builder>, new-element :: <character>)
 => (builder :: <string-builder>);
  let representation = builder.builder-representation;
  select (representation by instance?)
    <utf-8-representation> =>
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

    <utf-32-representation> =>
      let index = builder.%size;
      let new-size = index + 1;
      let representation
        = if (new-size > representation.size)
            let new-representation-size = power-of-two-ceiling(new-size);
            let new-representation
              = make(<utf-32-representation>, size: new-representation-size);
            without-bounds-checks
              for (i :: <integer> from 0 below index)
                new-representation[i] := representation[i];
              end for;
            end;
            builder.builder-representation := new-representation
          else
            representation
          end if;
      builder.%size := new-size;
      without-bounds-checks
        representation[index] := new-element;
      end
  end select;
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
  let (representation, start)
    = string-builder-reserve(builder, size-increment);

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
  let s-size = builder.%size;
  if (zero?(s-size))
    ""
  else
    let s = make(<byte-string>, size: s-size);
    let representation = builder.builder-utf-8-representation;
    primitive-replace-bytes!
      (s, primitive-repeated-slot-offset(s),
       integer-as-raw(0),
       representation, primitive-repeated-slot-offset(representation),
       integer-as-raw(0),
       integer-as-raw(s.size));
    s
  end if
end method as;

define inline sealed method element
    (builder :: <string-builder>, index :: <integer>,
     #key default = unsupplied())
 => (character :: <character>)
  let representation = builder.builder-utf-32-representation;
  if (0 <= index & index < builder.%size)
    element-no-bounds-check(representation, index)
  elseif (unsupplied?(default))
    element-range-error(builder, index)
  else
    check-type(default, element-type(builder));
    default
  end if
end method;

define inline sealed method element-no-bounds-check
    (builder :: <string-builder>, index :: <integer>, #key default = unsupplied())
 => (character :: <character>)
  element(builder, index, default: default)
end method;

define inline sealed method element-setter
    (new-value :: <character>, builder :: <string-builder>,
     index :: <integer>)
 => (new-value :: <character>)
  let representation = builder.builder-utf-32-representation;
  if (index < 0)
    element-range-error(builder, index);
  elseif (index < builder.%size)
    element-no-bounds-check(representation, index) := new-value
  else
    builder.size := index;
    add!(builder, new-value);
    new-value
  end if
end method;

define inline sealed method element-no-bounds-check-setter
    (new-value :: <string-builder>, builder :: <string-builder>,
     index :: <integer>)
 => (new-value :: <character>)
  element-setter(new-value, builder, index)
end method;

define method copy-sequence
    (builder :: <string-builder>,
     #key start: first :: <integer> = 0, end: last = unsupplied())
 => (copy :: <string-builder>);
  let representation = builder.builder-utf-8-representation;
  let bytes = builder.%size;
  for (i = 0 then skip-utf-8(representation, i), count from 0,
       while: count < first & i < bytes)
  finally
    if (count = first)
      if (~supplied?(last))
        let instance = make(<string-builder>);
        instance.builder-representation
          := copy-sequence(builder.builder-representation, start: i, end: bytes);
        instance.%size := bytes - i;
        instance
      else
        error("Can't copy a non-empty <string-builder> yet");
      end if
    elseif (first < 0)
      invalid-sequence-start-error(builder, first);
    else
      invalid-sequence-bounds-error(builder, first, count);
    end if
  end for
end method;
