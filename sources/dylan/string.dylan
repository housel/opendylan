Module:    internal
Author:    Jonathan Bachrach
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


// BOOTED: define ... abstract class <string> ... end;


/////////////////
// IMPLEMENTATION
/////////////////


// STRING

//
// AS
//

define sealed inline method as (class == <string>, string :: <string>)
 => (s :: <string>)
  string
end method as;

define method as (class == <string>, collection :: <collection>)
 => (bs :: <byte-string>)
  as(<byte-string>, collection)
end method as;


//
// MAKE
//

define sealed inline method make (class == <string>, #key size = 0, fill = ' ')
 => (result :: <byte-string>)
  make(<byte-string>, size: size, fill: fill)
end method make;

//
// SHARED STRING
//

define method make
    (class == <byte-string>,
     #key fill :: <byte-character> = ' ', size :: <integer> = 0)
 => (res :: <byte-string>)
  if (size = 0)
    empty(class)
  else
    system-allocate-repeated-instance
      (<byte-string>, <byte-character>, unbound(), size, fill);
  end if
end method;

define sealed inline method concrete-limited-string-class
    (of == <byte-character>)
 => (type :: singleton(<byte-string>))
  <byte-string>
end method;

define inline sealed method element
    (string :: <byte-string>, index :: <integer>,
     #key default = unsupplied())
 => (character :: <byte-character>)
  if (element-range-check(index, size(string)))
    primitive-raw-as-byte-character(string-element(string, index))
  else
    if (unsupplied?(default))
      element-range-error(string, index)
    else
      check-type(default, element-type(string));
      default
    end if
  end if
end method element;

define inline sealed method element-no-bounds-check
    (string :: <byte-string>, index :: <integer>, #key default)
 => (character :: <byte-character>)
  primitive-raw-as-byte-character(string-element(string, index))
end method element-no-bounds-check;

define inline sealed method element-setter
    (new-value :: <byte-character>,
     string :: <byte-string>, index :: <integer>)
 => (character :: <byte-character>)
  if (element-range-check(index, size(string)))
    string-element(string, index)
      := primitive-cast-machine-word(<raw-byte>, primitive-byte-character-as-raw(new-value));
    new-value
  else
    element-range-error(string, index)
  end if
end method element-setter;

define inline sealed method element-setter
    (new-value :: <character>,
     string :: <byte-string>, index :: <integer>)
 => (character :: <byte-character>)
  string[index] := new-value;
end method element-setter;

define inline sealed method element-no-bounds-check-setter
    (new-value :: <byte-character>,
     string :: <byte-string>, index :: <integer>)
 => (character :: <byte-character>)
  string-element(string, index)
    := primitive-cast-machine-word(<raw-byte>, primitive-byte-character-as-raw(new-value));
  new-value
end method element-no-bounds-check-setter;

define sealed inline method type-for-copy
    (object :: <byte-string>) => (c :: <class>)
  <byte-string>
end method type-for-copy;

define sealed inline method element-type
    (t :: <byte-string>) => (type :: <type>)
  <character>
end method;

define sealed inline method as
    (class == <byte-string>, string :: <byte-string>)
 => (s :: <byte-string>)
  string
end method as;

define method as
    (class == <byte-string>, collection :: <collection>)
 => (s :: <byte-string>);
  let new-string :: <byte-string>
    = make(<byte-string>, size: collection.size);
  replace-subsequence!(new-string, collection);
  new-string
end method as;

define inline function byte-string-current-element
    (string :: <byte-string>, state :: <integer>)
  primitive-raw-as-byte-character(string-element(string, state))
end function;

define inline function byte-string-current-element-setter
    (new-value :: <character>, string :: <byte-string>,
     state :: <integer>)
  string-element(string, state)
    := primitive-cast-machine-word(<raw-byte>, primitive-byte-character-as-raw(as(<byte-character>, new-value)));
  new-value
end function;

define sealed inline method forward-iteration-protocol
    (sequence :: <byte-string>)
 => (initial-state :: <integer>, limit :: <integer>,
     next-state :: <function>, finished-state? :: <function>,
     current-key :: <function>,
     current-element :: <function>, current-element-setter :: <function>,
     copy-state :: <function>)
  values(0,
         sequence.size,
         sequence-next-state,
         sequence-finished-state?,
         sequence-current-key,
         byte-string-current-element,
         byte-string-current-element-setter,
         identity-copy-state)
end method forward-iteration-protocol;

define sealed inline method backward-iteration-protocol
    (sequence :: <byte-string>)
 => (final-state :: <integer>,
     limit :: <integer>,
     previous-state :: <function>,
     finished-state? :: <function>,
     current-key :: <function>,
     current-element :: <function>,
     current-element-setter :: <function>,
     copy-state :: <function>)
  values(sequence.size - 1,
         -1,
         sequence-previous-state,
         sequence-finished-state?,
         sequence-current-key,
         byte-string-current-element,
         byte-string-current-element-setter,
         identity-copy-state)
end method backward-iteration-protocol;

define sealed domain size (<byte-string>);
define sealed domain make (singleton(<byte-string>));
define sealed domain initialize (<byte-string>);

define inline sealed method empty?
    (string :: <byte-string>) => (result :: <boolean>)
  string.size = 0
end method empty?;

define sealed method \<
    (string-1 :: <byte-string>, string-2 :: <byte-string>)
  => (well? :: <boolean>)
  let min-size :: <integer> = min(string-1.size, string-2.size);
  iterate grovel (index :: <integer> = 0)
    if (index >= min-size)
      string-1.size < string-2.size
    else
      let character-1 = string-element(string-1, index);
      let character-2 = string-element(string-2, index);
      if (primitive-machine-word-equal?(character-1, character-2))
        grovel(index + 1)
      else
        raw-as-integer(character-1) < raw-as-integer(character-2)
      end if
    end if
  end iterate
end method \<;

define sealed method \=
    (string-1 :: <byte-string>, string-2 :: <byte-string>)
 => (eq :: <boolean>)
  unless (string-1.size ~= string-2.size)
    for (c1 :: <byte-character> in string-1,
         c2 :: <byte-character> in string-2,
         eq = #t then c1 == c2,
         while: eq)
    finally
      eq
    end
  end
end;

define sealed method case-insensitive-equal
    (string-1 :: <byte-string>, string-2 :: <byte-string>)
 => (eq :: <boolean>)
  unless (string-1.size ~= string-2.size)
    for (c1 :: <byte-character> in string-1,
         c2 :: <byte-character> in string-2,
         eq = #t then c1 == c2 | as-lowercase(c1) == as-lowercase(c2),
         while: eq)
    finally
      eq
    end
  end
end;

define sealed method as-lowercase (string :: <byte-string>)
  => (new-string :: <byte-string>)
  let new-string :: <byte-string>
    = make(<byte-string>, size: string.size);
  for (i :: <integer> from 0 below string.size)
    string-element(new-string, i)
      := primitive-cast-machine-word(<raw-byte>, primitive-byte-character-as-raw(as-lowercase(primitive-raw-as-byte-character(string-element(string, i)))));
  end for;
  new-string
end method as-lowercase;

define sealed method as-lowercase! (string :: <byte-string>)
 => (string :: <byte-string>)
  for (i :: <integer> from 0 below string.size)
    string-element(string, i)
      := primitive-cast-machine-word(<raw-byte>, primitive-byte-character-as-raw(as-lowercase(primitive-raw-as-byte-character(string-element(string, i)))));
  end for;
  string
end method as-lowercase!;

define sealed method as-uppercase (string :: <byte-string>)
  => (new-string :: <byte-string>)
  let new-string :: <byte-string>
    = make(<byte-string>, size: string.size);
  for (i :: <integer> from 0 below string.size)
    string-element(new-string, i)
      := primitive-cast-machine-word(<raw-byte>, primitive-byte-character-as-raw(as-uppercase(primitive-raw-as-byte-character(string-element(string, i)))));
  end for;
  new-string
end method as-uppercase;

define sealed method as-uppercase! (string :: <byte-string>)
 => (string :: <byte-string>)
  for (i :: <integer> from 0 below string.size)
    string-element(string, i)
      := primitive-cast-machine-word(<raw-byte>, primitive-byte-character-as-raw(as-uppercase(primitive-raw-as-byte-character(string-element(string, i)))));
  end for;
  string
end method as-uppercase!;

define constant <string-type>
  = type-union(subclass(<string>), <limited-string-type>);

define method limited-string
    (of :: <type>, size :: false-or(<integer>)) => (type :: <string-type>)
  let concrete-class
    = concrete-limited-string-class(of);
  if (size)
    make(<limited-string-type>,
         class:          <string>,
         element-type:   of,
         concrete-class: concrete-class,
         size:           size)
  else
    concrete-class
  end if;
end method;

//
// BYTE-STRING
//

// BOOTED: define ... class <byte-string> ... end;


define sealed method empty
    (class == <byte-string>) => (res :: <byte-string>)
 ""
end method;

define inline method system-allocate-repeated-instance
    (class == <byte-string>, type == <byte-character>, fill,
     repeated-size :: <integer>, repeated-fill :: <byte-character>)
 => (instance :: <byte-string>)
  system-allocate-repeated-byte-instance-terminated
    (<byte-string>, repeated-size, repeated-fill);
end method;

