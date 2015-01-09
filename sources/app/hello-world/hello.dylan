Module:    hello-world
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define method say-hello()
  format(*standard-output*, "hello there!\n");
  force-output(*standard-output*);
  for (i in range(from: 0.0, to: 1.0, by: 0.1)) end
end method say-hello;

say-hello();
