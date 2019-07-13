Module:    internal
Author:    Jonathan Bachrach
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

// BOOTED: define ... class <character> ... end;

define open generic as-uppercase (object :: <object>) => (result :: <object>);
define open generic as-lowercase (object :: <object>) => (result :: <object>);

define sealed inline method \=
    (character-1 :: <character>, character-2 :: <character>) => (well? :: <boolean>)
  as(<integer>, character-1) = as(<integer>, character-2)
end method \=;

define sealed inline method \<
    (character-1 :: <character>, character-2 :: <character>) => (well? :: <boolean>)
  as(<integer>, character-1) < as(<integer>, character-2)
end method \<;

define sealed method as-uppercase (character :: <character>)
 => (uppercase-character :: <character>)
  if (character.lowercase?)
    as(<character>,
       as(<integer>, character) + (as(<integer>, 'A') - as(<integer>, 'a')))
  else
    character
  end if
end method as-uppercase;

define inline function as-lowercase-guts (character :: <character>)
 => (lowercase-character :: <character>)
  if (character.uppercase?)
    as(<character>,
       as(<integer>, character) + (as(<integer>, 'a') - as(<integer>, 'A')))
  else
    character
  end if
end function as-lowercase-guts;

define sealed method as-lowercase (character :: <character>)
 => (lowercase-character :: <character>)
  as-lowercase-guts(character);
end method as-lowercase;

///// EXTRAS FROM COMMON LISP

define inline function lowercase? (character :: <character>) => (result :: <boolean>)
  let code :: <integer> = as(<integer>, character);
  code >= as(<integer>, 'a') & code <= as(<integer>, 'z')
end function lowercase?;

define inline function uppercase? (character :: <character>) => (result :: <boolean>)
  let code :: <integer> = as(<integer>, character);
  code >= as(<integer>, 'A') & code <= as(<integer>, 'Z')
end function uppercase?;

define sealed inline method make
    (class == <character>,
     #key code :: <integer>)
 => (character :: <character>)
  as(<character>, code)
end method make;

define sealed inline method as
    (class == <abstract-integer>, character :: <character>)
 => (code :: <integer>);
  as(<integer>, character)
end method as;

define sealed inline method as
    (type :: <limited-integer>, character :: <character>)
 => (code :: <integer>);
  as(<integer>, character)
end method as;

define sealed inline method as
    (class == <integer>, character :: <character>)
 => (code :: <integer>)
  raw-as-integer(primitive-character-as-raw(character))
end method as;

define sealed inline method as
    (class == <character>, integer :: <integer>)
 => (result :: <character>)
  primitive-raw-as-character(integer-as-raw(integer))
end method as;
