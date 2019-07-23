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
// MAKE
//

define method make
    (class == <string>,
     #key fill :: <character> = ' ', size :: <integer> = 0)
 => (res :: <string>)
  if (size = 0)
    empty(class)
  else
    system-allocate-repeated-instance
      (<string>, <character>, unbound(), size, fill);
  end if
end method;

define sealed inline method concrete-limited-string-class
    (of == <character>)
 => (type :: singleton(<string>))
  <string>
end method;

define inline sealed method element
    (string :: <string>, index :: <integer>,
     #key default = unsupplied())
 => (character :: <character>)
  if (element-range-check(index, size(string)))
    primitive-raw-as-character(string-element(string, index))
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
    (string :: <string>, index :: <integer>, #key default)
 => (character :: <character>)
  primitive-raw-as-character(string-element(string, index))
end method element-no-bounds-check;

define inline sealed method element-setter
    (new-value :: <character>,
     string :: <string>, index :: <integer>)
 => (character :: <character>)
  if (element-range-check(index, size(string)))
    string-element(string, index)
      := primitive-cast-machine-word(<raw-byte>, primitive-character-as-raw(new-value));
    new-value
  else
    element-range-error(string, index)
  end if
end method element-setter;

define inline sealed method element-no-bounds-check-setter
    (new-value :: <character>,
     string :: <string>, index :: <integer>)
 => (character :: <character>)
  string-element(string, index)
    := primitive-cast-machine-word(<raw-byte>, primitive-character-as-raw(new-value));
  new-value
end method element-no-bounds-check-setter;

define sealed inline method type-for-copy
    (object :: <string>) => (c :: <class>)
  <string>
end method type-for-copy;

define sealed inline method element-type
    (t :: <string>) => (type :: <type>)
  <character>
end method;

define sealed inline method as
    (class == <string>, string :: <string>)
 => (s :: <string>)
  string
end method as;

define method as
    (class == <string>, collection :: <collection>)
 => (s :: <string>);
  let new-string :: <string>
    = make(<string>, size: collection.size);
  replace-subsequence!(new-string, collection);
  new-string
end method as;

define inline function string-current-element
    (string :: <string>, state :: <integer>)
  primitive-raw-as-character(string-element(string, state))
end function;

define inline function string-current-element-setter
    (new-value :: <character>, string :: <string>,
     state :: <integer>)
  string-element(string, state)
    := primitive-cast-machine-word(<raw-byte>, primitive-character-as-raw(as(<character>, new-value)));
  new-value
end function;

define sealed inline method forward-iteration-protocol
    (sequence :: <string>)
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
         string-current-element,
         string-current-element-setter,
         identity-copy-state)
end method forward-iteration-protocol;

define sealed inline method backward-iteration-protocol
    (sequence :: <string>)
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
         string-current-element,
         string-current-element-setter,
         identity-copy-state)
end method backward-iteration-protocol;

define sealed domain size (<string>);
define sealed domain make (singleton(<string>));
define sealed domain initialize (<string>);

define inline sealed method empty?
    (string :: <string>) => (result :: <boolean>)
  string.size = 0
end method empty?;

define sealed method \<
    (string-1 :: <string>, string-2 :: <string>)
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
    (string-1 :: <string>, string-2 :: <string>)
 => (eq :: <boolean>)
  unless (string-1.size ~= string-2.size)
    for (c1 :: <character> in string-1,
         c2 :: <character> in string-2,
         eq = #t then c1 == c2,
         while: eq)
    finally
      eq
    end
  end
end;

define sealed method case-insensitive-equal
    (string-1 :: <string>, string-2 :: <string>)
 => (eq :: <boolean>)
  unless (string-1.size ~= string-2.size)
    for (c1 :: <character> in string-1,
         c2 :: <character> in string-2,
         eq = #t then c1 == c2 | as-lowercase(c1) == as-lowercase(c2),
         while: eq)
    finally
      eq
    end
  end
end;

define sealed method as-lowercase (string :: <string>)
  => (new-string :: <string>)
  let new-string :: <string>
    = make(<string>, size: string.size);
  for (i :: <integer> from 0 below string.size)
    string-element(new-string, i)
      := primitive-cast-machine-word(<raw-byte>, primitive-character-as-raw(as-lowercase(primitive-raw-as-character(string-element(string, i)))));
  end for;
  new-string
end method as-lowercase;

define sealed method as-lowercase! (string :: <string>)
 => (string :: <string>)
  for (i :: <integer> from 0 below string.size)
    string-element(string, i)
      := primitive-cast-machine-word(<raw-byte>, primitive-character-as-raw(as-lowercase(primitive-raw-as-character(string-element(string, i)))));
  end for;
  string
end method as-lowercase!;

define sealed method as-uppercase (string :: <string>)
  => (new-string :: <string>)
  let new-string :: <string>
    = make(<string>, size: string.size);
  for (i :: <integer> from 0 below string.size)
    string-element(new-string, i)
      := primitive-cast-machine-word(<raw-byte>, primitive-character-as-raw(as-uppercase(primitive-raw-as-character(string-element(string, i)))));
  end for;
  new-string
end method as-uppercase;

define sealed method as-uppercase! (string :: <string>)
 => (string :: <string>)
  for (i :: <integer> from 0 below string.size)
    string-element(string, i)
      := primitive-cast-machine-word(<raw-byte>, primitive-character-as-raw(as-uppercase(primitive-raw-as-character(string-element(string, i)))));
  end for;
  string
end method as-uppercase!;

define sealed method add (string :: <string>, object) => (s :: <string>)
  let new-string :: <string>
    = make(<string>, size: string.size + 1, fill: object);
  without-bounds-checks
    for (i :: <integer> from 0 below string.size)
      new-string[i] := string[i]
    end;
    //new-string[string.size] := object;
  end without-bounds-checks;
  new-string
end method add;

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

define sealed method empty
    (class == <string>) => (res :: <string>)
 ""
end method;

define inline method system-allocate-repeated-instance
    (class == <string>, type == <character>, fill,
     repeated-size :: <integer>, repeated-fill :: <character>)
 => (instance :: <string>)
  system-allocate-repeated-byte-instance-terminated
    (<string>, repeated-size, repeated-fill);
end method;

