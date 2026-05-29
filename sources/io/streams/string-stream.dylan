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

define sealed domain lock-stream (<string-stream>);
define sealed domain unlock-stream (<string-stream>);


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

/// Seal some domains

define sealed domain make (singleton(<string-stream>));
define sealed domain initialize (<string-stream>);
define sealed domain read-element (<string-stream>);
define sealed domain unread-element (<string-stream>, <object>);
define sealed domain peek (<string-stream>);
define sealed domain read (<string-stream>, <integer>);
define sealed domain read-into! (<string-stream>, <integer>, <mutable-sequence>);
define sealed domain stream-input-available? (<string-stream>);
define sealed domain write-element (<string-stream>, <object>);
define sealed domain write (<string-stream>, <sequence>);
define sealed domain stream-at-end? (<string-stream>);
define sealed domain stream-size (<string-stream>);
define sealed domain clear-contents (<string-stream>);
define sealed domain stream-contents (<string-stream>);
define sealed domain stream-contents-as (<type>, <string-stream>);
