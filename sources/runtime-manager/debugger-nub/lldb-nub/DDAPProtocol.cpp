#include "DebuggerNub.h"
#include "DDAPProtocol.h"

#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <cinttypes>
#include <unistd.h>
#include <fcntl.h>
#include <sys/select.h>

#include <iostream>

#include "llvm/ADT/StringMap.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/Base64.h"

namespace {
  const size_t IN_BUFFER_SIZE = 8192;
  static constexpr llvm::StringLiteral CONTENT_LENGTH = "Content-Length: ";
  static constexpr llvm::StringLiteral HEADER_TERMINATOR = "\r\n";

  class DDAPProtocolFramer {
  public:
    DDAPProtocolFramer(int in_fd, int out_fd)
      : in_fd_(in_fd), in_pos_(0), in_limit_(0),
        out_(llvm::raw_fd_ostream(out_fd, true))
    {
      FD_ZERO(&infds_);
      FD_SET(in_fd, &infds_);
    }

    int init() {
      // Set non-blocking input mode
      if (fcntl(in_fd_, F_SETFL, O_NONBLOCK) < 0) {
        perror("fcntl");
        return -1;
      }
      return 0;
    }

    llvm::Expected<llvm::json::Value> receive() {
      if (need(1) < 0) {
        return nullptr;
      }
      else if (!match(CONTENT_LENGTH)) {
        return llvm::createStringError("Missing Content-Length header");
      }
      size_t content_length = 0;
      while (char c = at()) {
        if (llvm::isDigit(c)) {
          content_length = content_length * 10 + (c - '0');
          advance(1);
        }
        else {
          break;
        }
      }

      if (!match(HEADER_TERMINATOR)) {
        return llvm::createStringError("Invalid Content-Length header");
      }
      if (!match(HEADER_TERMINATOR)) {
        return llvm::createStringError("Missing header termination");
      }

      if (content_length > IN_BUFFER_SIZE) {
        return llvm::createStringError("Oops too big (for now)");
      }

      if (need(content_length) < 0) {
        return llvm::createStringError("Did not get it");
      }

      llvm::StringRef contents(in_buffer_ + in_pos_, content_length);
      advance(content_length);
      return llvm::json::parse(contents);
    }

    void send(llvm::json::Value &&message) {
      std::string content;
      llvm::raw_string_ostream content_stream(content);
      content_stream << message;

      out_ << CONTENT_LENGTH << content.size() << HEADER_TERMINATOR
           << HEADER_TERMINATOR
           << content;
      out_.flush();
    }

  private:
    int need(size_t nbytes) {
      while (in_limit_ - in_pos_ < nbytes) {
        // If fulfilling this request would go past the end of the
        // buffer, move the current contents to the beginning
        if (in_pos_ + nbytes > IN_BUFFER_SIZE) {
          memmove(in_buffer_, in_buffer_ + in_pos_, in_limit_ - in_pos_);
          in_limit_ -= in_pos_;
          in_pos_ = 0;
        }

        // Wait for available input
        int rc = select(in_fd_ + 1, &infds_, nullptr, nullptr, nullptr);
        if (rc < 0) {
          perror("select");
          return rc;
        }

        // Read everything available that will fit in the buffer
        ssize_t count
          = read(in_fd_, in_buffer_ + in_limit_, IN_BUFFER_SIZE - in_limit_);
        if (count < 0) {
          perror("read");
          return count;
        }
        else if (count == 0) {
          return -1;
        }
        in_limit_ += count;
      }

      return 0;
    }

    void advance(size_t skip) {
      in_pos_ += skip;
    }

    bool match(llvm::StringRef s) {
      if (need(s.size()) < 0) {
        return false;
      }
      llvm::StringRef contents(in_buffer_ + in_pos_, in_limit_ - in_pos_);
      if (contents.starts_with(s)) {
        advance(s.size());
        return true;
      }
      return false;
    }

    char at() {
      if (need(1) < 0 || in_pos_ >= IN_BUFFER_SIZE) {
        return 0;
      }
      return in_buffer_[in_pos_];
    }

    int in_fd_;
    fd_set infds_;

    char in_buffer_[IN_BUFFER_SIZE];
    size_t in_pos_;             // Input buffer cursor
    size_t in_limit_;           // Input buffer limit

    llvm::raw_fd_ostream out_;
  };
};

class DDAPProtocol::DDAPProtocolPrivate {
public:
  DDAPProtocolPrivate(DebuggerNub &nub, int in_fd, int out_fd)
    : nub_(nub),
      framer_(DDAPProtocolFramer(in_fd, out_fd)),
      running_(true) {
  }

  int init() {
    return 0;
  }

  void done() {
    running_ = false;
  }

  int run() {
    uint64_t response_seq = 1;
    while (running_) {
      if (auto E = framer_.receive()) {
        if (const auto *O = E->getAsObject()) {
          handleMessage(*O, response_seq);
        }
        else if (E->getAsNull()) {
          break;
        }
        else {
          llvm::errs() << "Non-object DDAPP message\n";
          return -1;
        }
      }
      else {
        llvm::logAllUnhandledErrors(E.takeError(), llvm::errs(),
                                    "DDAPP receive: ");
        return -1;
      }
    }
    return 0;
  }

private:
  void handleMessage(const llvm::json::Object &message, uint64_t &response_seq) {
    llvm::errs() << "Not handling messages yet\n";
  }

  DebuggerNub &nub_;
  DDAPProtocolFramer framer_;
  bool running_;
};

DDAPProtocol::DDAPProtocol(DebuggerNub &nub, int in_fd, int out_fd)
  : private_(std::make_unique<DDAPProtocolPrivate>(nub, in_fd, out_fd))
{
}

DDAPProtocol::~DDAPProtocol()
{
}

int DDAPProtocol::run()
{
  if (private_->init() < 0) {
    return EXIT_FAILURE;
  }
  if (private_->run() < 0) {
    return EXIT_FAILURE;
  }
  return EXIT_SUCCESS;
}
