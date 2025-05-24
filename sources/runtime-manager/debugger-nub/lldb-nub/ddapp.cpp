#include "ddapp.h"

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

#include "NubProcess.h"

using namespace std;

namespace nub_private {
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
      string content;
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

  class RequestHandler {
  public:
    virtual llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                                     NubProcess *nub_process,
                                                     const llvm::json::Object &request) = 0;

    virtual ~RequestHandler() = default;
  };

  class LaunchRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class RestartRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class ContinueRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class TerminateRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class WaitForStopRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class StackTraceRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class SymbolsRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class SetInstructionBreakpointsRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class SuspendThreadRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class ReadThreadEnvironmentRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class MemoryRegionInfoRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class ReadMemoryRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class WriteMemoryRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class DisconnectRequestHandler : public RequestHandler {
    llvm::Expected<llvm::json::Value> handle(DDAPProtocolPrivate &ddapp,
                                             NubProcess *nub_process,
                                             const llvm::json::Object &request) override;
  };

  class DDAPProtocolPrivate {
  public:
    DDAPProtocolPrivate(int in_fd, int out_fd)
      : framer_(DDAPProtocolFramer(in_fd, out_fd)),
        running_(true)
    {
    }

    void set_nub_process(const char *program) {
      nub_process_.reset(new NubProcess(program));
    }

    NubProcess &nub_process() {
      return *nub_process_;
    }

    int init() {
      request_handlers_.try_emplace("launch", std::make_unique<LaunchRequestHandler>());
      request_handlers_.try_emplace("restart", std::make_unique<RestartRequestHandler>());
      request_handlers_.try_emplace("continue", std::make_unique<ContinueRequestHandler>());
      request_handlers_.try_emplace("terminate", std::make_unique<TerminateRequestHandler>());
      request_handlers_.try_emplace("waitForStop", std::make_unique<WaitForStopRequestHandler>());
      request_handlers_.try_emplace("stackTrace", std::make_unique<StackTraceRequestHandler>());
      request_handlers_.try_emplace("symbols", std::make_unique<SymbolsRequestHandler>());
      request_handlers_.try_emplace("setInstructionBreakpoints", std::make_unique<SetInstructionBreakpointsRequestHandler>());
      request_handlers_.try_emplace("suspendThread", std::make_unique<SuspendThreadRequestHandler>());
      request_handlers_.try_emplace("readThreadEnvironment", std::make_unique<ReadThreadEnvironmentRequestHandler>());
      request_handlers_.try_emplace("memoryRegionInfo", std::make_unique<MemoryRegionInfoRequestHandler>());
      request_handlers_.try_emplace("readMemory", std::make_unique<ReadMemoryRequestHandler>());
      request_handlers_.try_emplace("writeMemory", std::make_unique<WriteMemoryRequestHandler>());
      request_handlers_.try_emplace("disconnect", std::make_unique<DisconnectRequestHandler>());
      return framer_.init();
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
      if (auto TS = message.getString("type")) {
        if (TS == "request") {
          auto E = handleRequest(message);
          llvm::json::Object response {
            {"type", "response"},
            {"seq", response_seq++},
            {"command", message.getString("command")},
            {"request_seq", message.getInteger("seq")},
          };
          if (E) {
            response["success"] = true;
            // If the handler returned a non-null value, return it as
            // the response body
            if (!E->getAsNull()) {
              response["body"] = *E;
            }
          }
          else {
            response["success"] = false;
            response["message"] = llvm::toString(E.takeError());
          }
          framer_.send(std::move((response)));
        }
        else {
          llvm::errs() << "Don't give me type " << TS << "\n";
        }
      }
    }

    llvm::Expected<llvm::json::Value> handleRequest(const llvm::json::Object &request) {
      if (auto C = request.getString("command")) {
        auto I = request_handlers_.find(*C), E = request_handlers_.end();
        if (I != E) {
          return I->second->handle(*this, nub_process_.get(), request);
        }
        else {
          return llvm::createStringError("Request command " + *C + " not handled");
        }
      }
      else {
        return llvm::createStringError("Request without command");
      }
    }

    DDAPProtocolFramer framer_;
    llvm::StringMap<std::unique_ptr<RequestHandler>> request_handlers_;
    std::unique_ptr<NubProcess> nub_process_;
    bool running_;
  };

  llvm::Expected<llvm::json::Value> LaunchRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                 NubProcess *nub_process,
                                                                 const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      auto program = A->getString("program").value_or("").data();
      auto args = A->getString("args").value_or("").data();
      auto cwd = A->getString("cwd").value_or("").data();

      // // Instantiate the NubProcess
      ddapp.set_nub_process(program);

      if (!ddapp.nub_process().open_process(program, args, cwd)) {
        return llvm::createStringError("Process launch failed");
      }

      // Success
      return nullptr;
    }
    else {
      return llvm::createStringError("Launch request without arguments");
    }
  }

  llvm::Expected<llvm::json::Value> RestartRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                  NubProcess *nub_process,
                                                                  const llvm::json::Object &request)
  {
    nub_process->application_restart();

    // Success
    return nullptr;
  }

  llvm::Expected<llvm::json::Value> ContinueRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                   NubProcess *nub_process,
                                                                   const llvm::json::Object &request)
  {
    bool unhandled = false;
    if (auto *A = request.getObject("arguments")) {
      if (auto U = A->getBoolean("unhandled")) {
        unhandled = U.value();
      }
    }
    if (unhandled) {
      nub_process->application_continue_unhandled();
    }
    else {
      nub_process->application_continue();
    }

    // Success
    return nullptr;
  }

  llvm::Expected<llvm::json::Value> TerminateRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                    NubProcess *nub_process,
                                                                    const llvm::json::Object &request)
  {
    nub_process->kill_application();

    // Success
    return nullptr;
  }

  llvm::Expected<llvm::json::Value> WaitForStopRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                      NubProcess *nub_process,
                                                                      const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      NubProcess::NUBINT timeout_ms
        = A->getInteger("timeout").value_or(0);
      NubProcess::StopReason stop_reason;
      nub_process->wait_for_stop_reason_with_timeout(timeout_ms, stop_reason);

      uint64_t process = nub_process->process();
      llvm::json::Object body {
        {"code", uint64_t(stop_reason.code)},
        {"process", process},
      };
      switch (stop_reason.code) {
      case NubProcess::TIMED_OUT:
        break;

      case NubProcess::BREAKPOINT_EXCEPTION_DBG_EVENT:
        // process thread exception-address
        body["thread"] = stop_reason.thread;
        body["exceptionAddress"] = "0x" + llvm::utohexstr(stop_reason.exception_address);
        break;

      case NubProcess::HARD_CODED_BREAKPOINT_DBG_EVENT:
        // process thread exception-address first-chance?
        // first-debugger-invocation?
        body["thread"] = stop_reason.thread;
        if (stop_reason.first_hard_coded_breakpoint) {
          body["firstHardCoded"] = true;
        }
        if (stop_reason.exception_first_chance) {
          body["firstChance"] = true;
        }
        body["exceptionAddress"] = "0x" + llvm::utohexstr(stop_reason.exception_address);
        break;

      case NubProcess::CREATE_PROCESS_DBG_EVENT:
        body["pointerSize"] = uint64_t(nub_process->remote_value_byte_size());
        body["littleEndian"] = nub_process->little_endianQ();
        // FALL THROUGH
      case NubProcess::LOAD_DLL_DBG_EVENT:
        // process thread executable/library
        body["thread"] = stop_reason.thread;
        {
          llvm::json::Object mod {
            {"id", uint64_t(stop_reason.library)},
            {"name", nub_process->get_library_filename(stop_reason.library)},
            {"version", nub_process->get_library_version(stop_reason.library)},
            {"addressRange", "0x" + llvm::utohexstr(nub_process->get_library_base_address(stop_reason.library))},
          };
          body["module"] = std::move(mod);
        }
        break;

      case NubProcess::EXIT_PROCESS_DBG_EVENT:
        // process thread process-exit-code
        body["thread"] = stop_reason.thread;
        body["exitCode"] = int64_t(stop_reason.exit_code);
        break;

      default:
        llvm::errs() << "Not handling stop " << stop_reason.code << "\n";
        return llvm::createStringError("Unhandled stop reason");
      }

      return std::move(body);
    }
    else {
      return llvm::createStringError("WaitForStop request without arguments");
    }

    ddapp.nub_process().application_restart();

    // Success
    return nullptr;
  }

  llvm::Expected<llvm::json::Value> StackTraceRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                     NubProcess *nub_process,
                                                                     const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      NubProcess::NUBTHREAD thread = A->getInteger("threadId").value_or(0);
      NubProcess::NUBINT frame_count = 0;
      if (auto L = A->getInteger("levels")) {
        frame_count = L.value();
      }
      NubProcess::NUBINT totalFrames
        = nub_process->initialize_stack_vectors(thread);
      llvm::json::Array stackFrames;
      for (auto &frame : nub_process->read_stack_vectors(thread, frame_count)) {
        llvm::json::Object sf {
          {"framePointerReference",
           "0x" + llvm::utohexstr(frame.frame_pointer)},
          {"instructionPointerReference",
           "0x" + llvm::utohexstr(frame.instruction_pointer)},
          {"returnPointerReference",
           "0x" + llvm::utohexstr(frame.return_address)},
        };
        stackFrames.emplace_back(std::move(sf));
      }

      llvm::json::Object body {
        {"stackFrames", std::move(stackFrames)},
        {"totalFrames", uint64_t(totalFrames)},
      };
      return std::move(body);
    }
    else {
      return llvm::createStringError("StackTrace request without arguments");
    }
  }

  llvm::json::Object make_symbol(NubProcess::LookupSymbol lookup) {
    llvm::json::Object symbol {
      {"name", lookup.name},
      {"address", "0x" + llvm::utohexstr(lookup.address)},
    };
    if (lookup.is_function) {
      symbol["isFunction"] = true;
      symbol["debugStartAddress"] = "0x" + llvm::utohexstr(lookup.debug_start);
      symbol["debugEndAddress"] = "0x" + llvm::utohexstr(lookup.debug_end);
      symbol["endAddress"] = "0x" + llvm::utohexstr(lookup.function_end);
    }

    return std::move(symbol);
  }

  llvm::Expected<llvm::json::Value> SymbolsRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                  NubProcess *nub_process,
                                                                  const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      llvm::json::Array symbols;

      if (auto N = A->getString("name")) {
        NubProcess::NUBLIBRARY library = A->getInteger("moduleId").value_or(0);
        NubProcess::LookupSymbol lookup;
        if (nub_process->find_symbol_in_library(library, N->data(), lookup) != 0) {
          symbols.emplace_back(std::move(make_symbol(lookup)));
        }
      }
      else if (auto P = A->getString("pattern")) {
        NubProcess::NUBLIBRARY library = A->getInteger("moduleId").value_or(0);
        auto lookup = nub_process->lookup_symbols(library, P->data());
        for (auto &s : lookup) {
          symbols.emplace_back(std::move(make_symbol(s)));
        }
      }
      else if (auto MR = A->getString("memoryReference")) {
        NubProcess::TARGET_ADDRESS addr;
        if (MR->getAsInteger(0, addr)) {
          return llvm::createStringError("Symbols command invalid memoryReference");
        }

        NubProcess::NUBLIBRARY lib;
        NubProcess::TARGET_ADDRESS target_actual_address;
        NubProcess::NUBINT offset;
        NubProcess::LookupSymbol lookup;
        auto status
          = nub_process->closest_symbol(addr, lib, target_actual_address,
                                        offset, lookup);

        if (status) {
          auto symbol { make_symbol(lookup) };
          symbol["moduleId"] = uint32_t(lib);
          symbols.emplace_back(std::move(symbol));
        }
      }
      else {
        return llvm::createStringError("Symbols command invalid arguments");
      }

      llvm::json::Object body {
        {"symbols", std::move(symbols)},
      };
      return std::move(body);
    }
    else {
      return llvm::createStringError("Symbols request without arguments");
    }
  }

  llvm::Expected<llvm::json::Value> SetInstructionBreakpointsRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                                    NubProcess *nub_process,
                                                                                    const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      if (auto *breakpoints = A->getArray("breakpoints")) {
        std::vector<NubProcess::TARGET_ADDRESS> addresses;
        for (const auto &ib : *breakpoints) {
          if (const auto *O = ib.getAsObject()) {
            NubProcess::TARGET_ADDRESS addr;
            if (!O->getString("instructionReference").value_or("").getAsInteger(0, addr)) {
              addresses.push_back(addr);
            }
            else {
              llvm::errs() << "Invalid InstructionBreakpoint " << ib << "\n";
            }
          }
        }
        if (nub_process->set_breakpoints(addresses) == NubProcess::OK) {
          // Success
          return nullptr;
        }
        else {
          return llvm::createStringError("SetInstructionBreakpoints failed");
        }
      }
      else {
        return llvm::createStringError("SetInstructionBreakpointsRequestHandler command arguments missing breakpoints");
      }
    }
    else {
      return llvm::createStringError("SetInstructionBreakpointsRequestHandler request without arguments");
    }
  }

    llvm::Expected<llvm::json::Value> SuspendThreadRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                          NubProcess *nub_process,
                                                                          const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      NubProcess::NUBTHREAD thread = A->getInteger("threadId").value_or(0);
      if (auto S = A->getBoolean("suspended")) {
        if (S.value()) {
          nub_process->thread_stop(thread);
        }
        else {
          nub_process->thread_continue(thread);
        }
      }

      bool suspended = nub_process->thread_suspendedQ(thread);
      llvm::json::Object body {
        {"suspended", suspended},
      };
      return std::move(body);
    }
    else {
      return llvm::createStringError("SuspendThread request without arguments");
    }
  }

  llvm::Expected<llvm::json::Value> ReadThreadEnvironmentRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                                NubProcess *nub_process,
                                                                                const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      NubProcess::NUBTHREAD thread = A->getInteger("threadId").value_or(0);

      NubProcess::NUBINT valid;
      NubProcess::TARGET_ADDRESS teb = nub_process->dylan_thread_environment_block_address(thread, valid);
      llvm::json::Object body;
      if (valid) {
        body["teb"] = "0x" + llvm::utohexstr(teb);
      }
      return std::move(body);
    }
    else {
      return llvm::createStringError("ReadThreadEnvironment request without arguments");
    }
  }

  llvm::Expected<llvm::json::Value> MemoryRegionInfoRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                           NubProcess *nub_process,
                                                                           const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      NubProcess::TARGET_ADDRESS addr;
      if (A->getString("memoryReference").value_or("").getAsInteger(0, addr)) {
        return llvm::createStringError("MemoryRegionInfo request invalid memoryReference");
      }
      NubProcess::MemoryRegionInfo info;
      if (nub_process->get_memory_region_info(addr, info) != 0) {
        return llvm::createStringError("MemoryRegionInfo fail");
      }

      std::string permissions { info.readable ? "r" : "-" };
      permissions += (info.writable ? "w" : "-");
      permissions += (info.executable ? "x" : "-");

      llvm::json::Object body {
        {"address", "0x" + llvm::utohexstr(info.start)},
        {"endAddress", "0x" + llvm::utohexstr(info.end)},
        {"pageSize", uint64_t(info.page_size)},
        {"permissions", permissions},
      };
      return std::move(body);
    }
    else {
      return llvm::createStringError("MemoryRegionInfo request without arguments");
    }
  }

  llvm::Expected<llvm::json::Value> ReadMemoryRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                     NubProcess *nub_process,
                                                                     const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      NubProcess::TARGET_ADDRESS addr;
      if (A->getString("memoryReference").value_or("").getAsInteger(0, addr)) {
        return llvm::createStringError("ReadMemory request invalid memoryReference");
      }
      int64_t count = A->getInteger("count").value_or(0);

      std::vector<uint8_t> raw_data;
      raw_data.resize(count);

      NubProcess::NUB_ERROR error;
      nub_process->read_from_process_memory(addr, count, raw_data.data(),
                                            error);
      if (error) {
              return llvm::createStringError("ReadMemory request process read error");
      }

      llvm::json::Object body {
        {"address", "0x" + llvm::utohexstr(addr)},
        {"data", llvm::encodeBase64(raw_data)},
      };
      return std::move(body);
    }
    else {
      return llvm::createStringError("ReadMemory request without arguments");
    }
  }

  llvm::Expected<llvm::json::Value> WriteMemoryRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                      NubProcess *nub_process,
                                                                      const llvm::json::Object &request)
  {
    if (auto *A = request.getObject("arguments")) {
      NubProcess::TARGET_ADDRESS addr;
      if (A->getString("memoryReference").value_or("").getAsInteger(0, addr)) {
        return llvm::createStringError("WriteMemory request invalid memoryReference");
      }
      auto D = A->getString("data");
      if (!D) {
        return llvm::createStringError("WriteMemory request missing data");
      }
      std::vector<char> data;
      if (auto E = llvm::decodeBase64(*D, data)) {
        return E;
      }

      // Success
      return nullptr;
    }
    else {
      return llvm::createStringError("WriteMemory request without arguments");
    }
  }

  llvm::Expected<llvm::json::Value> DisconnectRequestHandler::handle(DDAPProtocolPrivate &ddapp,
                                                                     NubProcess *nub_process,
                                                                     const llvm::json::Object &request)
  {
    ddapp.done();

    // Success
    return nullptr;
  }

};
using namespace nub_private;

DDAPProtocol::DDAPProtocol(int in_fd, int out_fd)
  : private_(new DDAPProtocolPrivate(in_fd, out_fd))
{
}

DDAPProtocol::~DDAPProtocol()
{
  delete private_;
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
