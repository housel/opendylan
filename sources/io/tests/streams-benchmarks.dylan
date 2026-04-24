Module: io-test-suite
Synopsis: streams benchmarks

// These first two benchmarks compare writing to a string stream and building a
// string with a simple <string-builder> class, modeled after the one in Go.
// As of Open Dylan 2020.1pre, the string builder is 1.5x faster with 10k
// iterations. The string builder version allocates significantly less.

// Use the same number of iterations for both benchmarks.
define constant $builder-iterations = 1000;

define benchmark benchmark-output-to-string ()
  benchmark-repeat (iterations: $builder-iterations)
    let s = "The quick brown fox.";
    let buf :: <string-stream> = make(<string-stream>, direction: #"output");
    let s2 :: <string> = "";
    for (j from 1 to 1000)
      write(buf, s);
      write(buf, "\n");
    end;
    s2 := stream-contents(buf, clear-contents?: #t);
    // Open Dylan doesn't seem to need the following (i.e., it doesn't optimize
    // out the unused s2) but I leave this here to be similar to the Go version,
    // which *does* optimize away s2 (and gives a compiler error).
    if (s2[0] == 'a')           // never true
      s := s2;
    end;
  end;
end benchmark;

// Compare with string output streams.

define constant $builder-initial-size :: <integer> = 127;

define benchmark benchmark-string-builder ()
  benchmark-repeat (iterations: $builder-iterations)
    let s = "The quick brown fox.";
    let builder :: <string-builder> = make(<string-builder>, byte-capacity: $builder-initial-size);
    for (j from 1 to 1000)
      concatenate!(builder, s, "\n");
    end;
    let s2 = as(<string>, builder);
    // Open Dylan doesn't seem to need the following (i.e., it doesn't optimize
    // out the unused s2) but I leave this here to be similar to the Go version,
    // which *does* optimize away s2 (and gives a compiler error).
    if (s2[0] == 'a')           // never true
      s := s2;
    end;
  end;
end benchmark;
