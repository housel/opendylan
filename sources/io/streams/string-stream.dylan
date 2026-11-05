Module:       streams-internals
Synopsis:     Implementation of streams for streaming over sequences
Author:       Scott McKay, Marc Ferguson, Eliot Miranda
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define primary class <string-stream> (<basic-positionable-stream>)
  constant slot stream-string-builder :: <string-builder> = make(<string-builder>),
    init-keyword: string-builder:;
  slot stream-limit :: false-or(<position-type>) = #f;
end class <string-stream>;

define sealed domain make (singleton(<string-stream>));

define sealed method initialize
    (stream :: <string-stream>,
     #key direction, contents = unsupplied(),
          start: _start :: <position-type> = 0, end: _end) => ()
  next-method();
  if (supplied?(contents))
    concatenate!(stream.stream-string-builder, contents);
  end if;
  stream.initial-position := _start;
  stream.current-position := _start;
  stream.stream-limit := _end;
  if (direction == #"output")
    stream.final-position := _start
  else
    stream.final-position := size(stream.stream-string-builder);
  end;
  stream.stream-element-type := <character>;
end method initialize;

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


/// Readable stream protocol

define sealed method read-element
    (stream :: <string-stream>,
     #key on-end-of-stream = unsupplied())
 => (element :: <object>)
  ensure-readable(stream);
  let builder :: <string-builder> = stream-string-builder(stream);
  let pos   :: <integer>  = stream.current-position;
  let limit :: <integer>  = stream-limit(stream) | stream.final-position;
  if (pos < limit)
    let elt = builder[pos];
    stream.current-position := pos + 1;
    elt
  else
    end-of-stream-value(stream, on-end-of-stream)
  end
end method read-element;

define sealed method unread-element
    (stream :: <string-stream>, elt :: <object>)
 => (element :: <object>)
  ensure-readable(stream);
  let pos   :: <integer>  = stream.current-position;
  if (pos > 0)
    stream.current-position := pos - 1;
    let builder = stream-string-builder(stream);
    if (builder[pos - 1] ~== elt)
      builder[pos - 1] := elt
    end
  end;
  elt
end method unread-element;

define sealed method peek
    (stream :: <string-stream>,
     #key on-end-of-stream = unsupplied())
 => (element :: <object>)
  ensure-readable(stream);
  let builder :: <string-builder> = stream-string-builder(stream);
  let pos   :: <integer>  = stream.current-position;
  let limit :: <integer>  = stream-limit(stream) | stream.final-position;
  if (pos < limit)
    builder[pos]
  else
    end-of-stream-value(stream, on-end-of-stream)
  end
end method peek;

define sealed method read
    (stream :: <string-stream>, n :: <integer>,
     #key on-end-of-stream = unsupplied())
 => (elements)
  ensure-readable(stream);
  let builder :: <string-builder> = stream-string-builder(stream);
  let pos     :: <integer> = stream.current-position;
  let src-n   :: <integer> = (stream-limit(stream) | stream.final-position) - pos;
  if (n > src-n)
    stream.current-position := pos + src-n;
    if (unsupplied?(on-end-of-stream))
      if (zero?(src-n))
        error(make(<end-of-stream-error>, stream: stream))
      else
        error(make(<incomplete-read-error>,
                    stream: stream,
                    count: src-n,
                    sequence: copy-sequence(builder, start: pos, end: pos + src-n)));
      end;
    else
      on-end-of-stream
    end;
  else
    let elements = copy-sequence-as(<string>, builder, start: pos, end: pos + n);
    stream.current-position := pos + n;
    elements
  end;
end method read;

define sealed method read-into!
    (stream :: <string-stream>, n :: <integer>, dst :: <mutable-sequence>,
     #key start = 0, on-end-of-stream = unsupplied())
 => (n-read)
  ensure-readable(stream);
  let builder :: <string-builder> = stream-string-builder(stream);
  let pos     :: <integer> = stream.current-position;
  let src-n   :: <integer> = (stream-limit(stream) | stream.final-position) - pos;
  stream.current-position := pos + src-n;
  if (n > src-n)
    if (unsupplied?(on-end-of-stream))
      if (zero?(src-n))
        error(make(<end-of-stream-error>, stream: stream))
      else
        error(make(<incomplete-read-error>,
                    stream: stream,
                    count: src-n,
                    sequence: copy-sequence(builder, start: pos, end: pos + src-n)));
      end;
    else
      on-end-of-stream
    end;
  else
    for (i from 0 below src-n)
      dst[i + start] := builder[i + pos]
    end;
    src-n
  end if
end method read-into!;

define sealed method stream-input-available?
    (stream :: <string-stream>) => (available? :: <boolean>)
  readable?(stream)
    & ~stream-at-end?(stream)
end method stream-input-available?;


/// Writable stream protocol

define sealed method write-element
    (stream :: <string-stream>, elt :: <object>) => ()
  ensure-writable(stream);
  let builder :: <string-builder> = stream-string-builder(stream);
  let pos     :: <integer>        = stream.current-position;
  let limit   :: <integer>        = stream.final-position;
  if (pos < limit)
    builder[pos] := elt;
  else
    if (pos > limit)
      builder.size := pos;
    end if;
    add!(builder, elt);
  end if;
  stream.current-position := pos + 1;
  if (pos >= limit)
    stream.final-position := pos + 1
  end
end method write-element;

define sealed method write
    (stream :: <string-stream>, src :: <sequence>,
     #key start: start-index :: <integer> = 0, end: _end :: false-or(<integer>) = #f) => ()
  ensure-writable(stream);
  let builder :: <string-builder> = stream-string-builder(stream);
  let pos   :: <integer>  = stream.current-position;
  let limit :: <integer>  = stream.final-position;
  let count :: <integer>  = (_end | src.size) - start-index;
  if (pos >= limit)
    if (pos > limit)
      builder.size := pos;
    end if;
    if (_end)
      concatenate-subsequence!(builder, src, start: start-index, end: _end);
    else
      concatenate-subsequence!(builder, src, start: start-index);
    end if;
    stream.final-position := stream.current-position := pos + count;
  else
    let new-pos = pos + count;
    stream.current-position := new-pos;
    replace-subsequence!(builder, src, start: pos);
    if (new-pos > stream.final-position)
      stream.final-position := new-pos;
    end
  end if;
end method write;

define sealed copy-down-method write
  (stream :: <string-stream>, elements :: <byte-string>,
   #key start: _start :: <integer> = 0, end: _end = #f) => ();

/// Stream query and contents accessing

define sealed method stream-at-end?
    (stream :: <string-stream>) => (at-end? :: <boolean>)
  if (write-only?(stream))
    #f
  else
    let limit = (read-only?(stream) & stream-limit(stream));
    stream.current-position >= (limit | stream.final-position)
  end
end method stream-at-end?;

define sealed method stream-size
    (stream :: <string-stream>) => (size :: <integer>)
  (stream-limit(stream) | stream.final-position)
    - stream.initial-position
end method stream-size;

define sealed method clear-contents (stream :: <string-stream>) => ()
  let builder :: <string-builder> = stream-string-builder(stream);
  builder.size := 0;
  stream.current-position := 0;
  stream.final-position := stream-limit(stream) | 0
end method clear-contents;

define sealed method stream-contents
    (stream :: <string-stream>, #key clear-contents? = #t)
 => (contents :: <sequence>)
  stream-contents-as(<string>, stream, clear-contents?: clear-contents?)
end method stream-contents;

define sealed inline method stream-contents-as
    (type :: <type>, stream :: <string-stream>, #key clear-contents? = #t)
 => (contents :: <sequence>)
  let result = as(type, stream-string-builder(stream));
  if (clear-contents?)
    clear-contents(stream)
  end;
  result
end method stream-contents-as;

define sealed method stream-sequence-class
    (stream :: <string-stream>) => (class :: <class>)
  <string>
end method stream-sequence-class;
