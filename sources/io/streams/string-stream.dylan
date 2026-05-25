Module:       streams-internals
Synopsis:     Implementation of streams for streaming over sequences
Author:       Scott McKay, Marc Ferguson, Eliot Miranda
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define open primary class <string-stream> (<sequence-stream>)
  inherited slot stream-sequence = make(<string>);
end class <string-stream>;

define sealed class <byte-string-stream> (<string-stream>)
  inherited slot stream-sequence = make(<byte-string>);
end class <byte-string-stream>;

define sealed domain lock-stream (<byte-string-stream>);
define sealed domain unlock-stream (<byte-string-stream>);


/// Macros

define macro with-output-to-string
  { with-output-to-string (?stream:name, #rest ?options:*)
      ?body:body
    end }
 => { let ?stream :: <string-stream>
        = make(<string-stream>, direction: #"output", ?options);
      ?body;
      stream-contents(?stream, clear-contents?: #f) }
  { with-output-to-string (?stream:name :: ?class:name, #rest ?options:*)
      ?body:body
    end }
 => { let ?stream :: ?class = make(?class, direction: #"output", ?options);
      ?body;
      stream-contents(?stream, clear-contents?: #f) }
end macro with-output-to-string;

define macro with-input-from-string
  { with-input-from-string (?stream:name = ?string:expression, #rest ?options:*)
      ?body:body
    end }
 => { let ?stream :: <string-stream>
        = make(<string-stream>, contents: ?string, direction: #"input", ?options);
      ?body;
    }
  { with-input-from-string (?stream:name :: ?class:name = ?string:expression, #rest ?options:*)
      ?body:body
    end }
 => { let ?stream :: ?class = make(?class, contents: ?string, direction: #"input", ?options);
      ?body;
    }
end macro with-input-from-string;

define method type-for-sequence-stream
    (contents :: <string>) => (type :: singleton(<string-stream>))
  <string-stream>
end method type-for-sequence-stream;

define method type-for-sequence-stream
    (contents :: <byte-string>) => (type :: singleton(<byte-string-stream>))
  <byte-string-stream>
end method type-for-sequence-stream;

/// Seal some domains

define sealed domain make (singleton(<byte-string-stream>));
define sealed domain initialize (<byte-string-stream>);
define sealed domain read-element (<byte-string-stream>);
define sealed domain unread-element (<byte-string-stream>, <object>);
define sealed domain peek (<byte-string-stream>);
define sealed domain read (<byte-string-stream>, <integer>);
define sealed domain read-into! (<byte-string-stream>, <integer>, <mutable-sequence>);
define sealed domain stream-input-available? (<byte-string-stream>);
define sealed domain write-element (<byte-string-stream>, <object>);
define sealed domain write (<byte-string-stream>, <sequence>);
define sealed domain stream-at-end? (<byte-string-stream>);
define sealed domain stream-size (<byte-string-stream>);
define sealed domain clear-contents (<byte-string-stream>);
define sealed domain stream-contents (<byte-string-stream>);
define sealed domain stream-contents-as (<type>, <byte-string-stream>);
