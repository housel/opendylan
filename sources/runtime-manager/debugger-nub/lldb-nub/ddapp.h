// -*- C++ -*-

namespace nub_private {
  class DDAPProtocolPrivate;
};

class DDAPProtocol {
public:
  /// Constructor.
  DDAPProtocol(int in_fd, int out_fd);

  /// Destructor.
  ~DDAPProtocol();

  /// Run protocol message processing loop until a Disconnect request
  /// is received.
  int run();

private:
  nub_private::DDAPProtocolPrivate *private_;
};
