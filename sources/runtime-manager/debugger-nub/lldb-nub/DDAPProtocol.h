// -*- C++ -*-

/// The Dylan Debugger Access Path Protocol is a JSON-based remote
/// procedure call protocol designed for implementing the Dylan
/// access-path interface. There are many similarities in the protocol
/// design to the Microsoft Debug Adapter Protocol
/// (https://microsoft.github.io/debug-adapter-protocol/specification).
/// In particular:
///  - The HTTP-like message framing
///  - The structure of JSON messages
///  - The names of requests and responses
///  - The names of arguments
/// are often similar to DAP when possible without sacrificing
/// compatibility with the access-path API.

class DDAPProtocol {
public:
  /// Constructor.
  DDAPProtocol(DebuggerNub &nub, int in_fd, int out_fd);

  /// Destructor.
  ~DDAPProtocol();

  /// Run protocol message processing loop until a Disconnect request
  /// is received.
  int run();

private:
  class DDAPProtocolPrivate;
  std::unique_ptr<DDAPProtocolPrivate> private_;
};
