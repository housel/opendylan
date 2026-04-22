Module:       dylan-test-suite
Synopsis:     Dylan test suite
Author:       Andy Armstrong
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define test test-concatenate! ()
  let my-list = #(3, 4);
  check("test concatenate! on a list", \=, concatenate!(my-list, #(5), #(6)),
        #(3, 4, 5, 6));
  check("concatenate! should have not affected my-list", \=, my-list, #(3, 4));
  let my-stretchy-vector = make(<stretchy-vector>);
  add!(my-stretchy-vector, 3);
  add!(my-stretchy-vector, 4);
  let my-stretchy-vector-afterwards = make(<stretchy-vector>);
  add!(my-stretchy-vector-afterwards, 3);
  add!(my-stretchy-vector-afterwards, 4);
  add!(my-stretchy-vector-afterwards, 5);
  add!(my-stretchy-vector-afterwards, 6);
  check("test concatenate! on a stretchy-vector", \=,
        concatenate!(my-stretchy-vector, #(5, 6)),
        my-stretchy-vector-afterwards);
  check("concatenate! should have changed my-stretchy-vector",
        \=, my-stretchy-vector, my-stretchy-vector-afterwards);
end test;

define suite dylan-functions-test-suite ()
  test test-concatenate!;
end suite;
