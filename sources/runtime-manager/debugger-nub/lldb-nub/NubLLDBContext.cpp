#include "NubProcess.h"
#include "NubLLDBContext.h"
#include "NubProcessMemoryManager.h"
#include "NubExecutorProcessControl.h"

#include <llvm/Support/Casting.h>
#include <llvm/Support/Format.h>
#include <llvm/Support/TargetSelect.h>

#include <llvm/ExecutionEngine/Orc/ObjectLinkingLayer.h>
#include <llvm/ExecutionEngine/Orc/Shared/ObjectFormats.h>

#include <dlfcn.h>

#ifdef HAVE_MACH_EXCEPTION_TYPES_H
#include <mach/exception_types.h>
#endif

namespace {
  /// Ensure LLDB initialization, deinitialization, and debugger
  /// singleton creation
  class DebuggerCreator {
  public:
    DebuggerCreator() {
      llvm::DebugFlag = true;

      // Initialize compilation support for JIT use
#if 0
      llvm::InitializeAllTargetInfos();
      llvm::InitializeAllTargets();
      llvm::InitializeAllTargetMCs();
      llvm::InitializeAllAsmPrinters();
#else
      llvm::InitializeNativeTarget();
      llvm::InitializeNativeTargetAsmPrinter();
#endif

      // Initialize LLDB
      lldb::SBDebugger::Initialize();
    }
    ~DebuggerCreator() {
      // Terminate LLDB
      lldb::SBDebugger::Terminate();
    }
    lldb::SBDebugger create() {
      if (!this->debugger_) {
        this->debugger_ = lldb::SBDebugger::Create(false);
#if 0
        const char *categories[] = {
          //"api",
          "dyld",
          "expr",
          //"event",
          "jit",
          "process",
          "state",
          "thread",
          nullptr
        };
        this->debugger_.EnableLog("lldb", categories);
#endif
      }
      return this->debugger_;
    }
  private:
    lldb::SBDebugger debugger_;
  };

  DebuggerCreator creator;

} // namespace

namespace nub_private {
  const char *const stop_reason_name[] = {
    "TIMED_OUT",                        // 0
    "ACCESS_VIOLATION_EXCEPTION",       // 1
    "ARRAY_BOUNDS_EXCEPTION",           // 2
    "ILLEGAL_INSTRUCTION_EXCEPTION",    // 3
    "PRIVILEGED_INSTRUCTION_EXCEPTION", // 4
    "DENORMAL_EXCEPTION",               // 5
    "FLOAT_DIVIDE_BY_ZERO_EXCEPTION",   // 6
    "INEXACT_RESULT_EXCEPTION",         // 7
    "INVALID_OPERATION_EXCEPTION",      // 8
    "FLOAT_OVERFLOW_EXCEPTION",         // 9
    "FLOAT_UNDERFLOW_EXCEPTION",        // 10
    "FLOAT_STACK_CHECK_EXCEPTION",      // 11
    "INTEGER_DIVIDE_BY_ZERO_EXCEPTION", // 12
    "NONCONTINUABLE_EXCEPTION",         // 13
    "BREAKPOINT_EXCEPTION",             // 14
    "HARD_CODED_BREAKPOINT",            // 15
    "SINGLE_STEP",                      // 16
    "CREATE_PROCESS",                   // 17
    "EXIT_PROCESS",                     // 18
    "CREATE_THREAD",                    // 19
    "EXIT_THREAD",                      // 20
    "LOAD_DLL",                         // 21
    "UNLOAD_DLL",                       // 22
    "RIP",                              // 23
    "OUTPUT_DEBUG_STRING",              // 24
    "PROFILER",                         // 25
    "UNCLASSIFIED",                     // 26
    "INTEGER_OVERFLOW_EXCEPTION",       // 27
    "STACK_OVERFLOW_EXCEPTION",         // 28
    "SOURCE_STEP_OVER",                 // 29
    "SOURCE_STEP_OUT",                  // 30
    "SOURCE_STEP_INTO",                 // 31
    "TIMED_OUT_HANDLED",                // 32
    "TIMED_OUT_UNHANDLED",              // 33
    "PROFILER_UNHANDLED",               // 34
  };

  class NubELFNixSectionPlugin : public llvm::orc::ObjectLinkingLayer::Plugin {
  public:
    NubELFNixSectionPlugin(NubLLDBContext &nlc) : nlc_(nlc) {}

    // Add passes to preserve initialization sections
    void modifyPassConfig(llvm::orc::MaterializationResponsibility &MR,
                          llvm::jitlink::LinkGraph &G,
                          llvm::jitlink::PassConfiguration &Config) override {
      Config.PrePrunePasses.push_back([this](llvm::jitlink::LinkGraph &G) -> llvm::Error {
        for (auto *block : G.blocks()) {
          auto section_name { block->getSection().getName() };
          if (llvm::orc::isELFInitializerSection(section_name)) {
            // Preserve this block by adding a live anonymous symbol
            G.addAnonymousSymbol(*block, 0, block->getSize(), false, true);
          }
        }
        return llvm::Error::success();
      });
      Config.PostFixupPasses.push_back([this, &MR](llvm::jitlink::LinkGraph &G) {
        auto &JD { MR.getTargetJITDylib() };
        NUB_DEBUG({
          llvm::dbgs() << "ELFNix post-fixup pass for "
                       << G.getName()
                       << " reports:\n";
        });
        for (auto &Sec : G.sections()) {
          auto name { Sec.getName() };
          auto range { llvm::jitlink::SectionRange(Sec) };
          NUB_DEBUG({
            llvm::dbgs() << "  section " << name
                         << " prot " << Sec.getMemProt()
                         << " " << range.getStart() << ".." << range.getEnd()
                         << "\n";
          });
          NubProcess::RegionKind kind;
          if (name == ".eh_frame") {
            kind = NubProcess::RegionKind::EHFrame;
          }
          else if (name == ".init_array"
                   || name == ".init_array.0") {
            kind = NubProcess::RegionKind::InitArray;
          }
          else if (name == ".dydat$m") {
            kind = NubProcess::RegionKind::DylanAmbiguous;
          }
          else if (name == ".dyobj$m") {
            kind = NubProcess::RegionKind::DylanStatic;
          }
          else if (name == ".dyutr$m" || name == ".dyutr$r") {
            kind = NubProcess::RegionKind::DylanUntraced;
          }
          else if (name == ".dyhis$m") {
            kind = NubProcess::RegionKind::DylanHistory;
          }
          else {
            continue;
          }
          this->nlc_.jd_regions[&JD].push_back
            (NubProcess::Region(kind,
                                range.getStart().getValue(),
                                range.getEnd().getValue()));
        }
        return llvm::Error::success();
      });
    }

    llvm::Error notifyFailed(llvm::orc::MaterializationResponsibility &MR) override {
      llvm::errs() << "NubELFNixSectionPlugin notifyFailed for "
                   << MR.getTargetJITDylib().getName()
                   << "\n";
      return llvm::Error::success();
    }
    llvm::Error notifyRemovingResources(llvm::orc::JITDylib &JD,
                                        llvm::orc::ResourceKey K) override {
      llvm::errs() << "NubELFNixSectionPlugin notifyRemovingResources "
                   << llvm::format_hex(K, 10)
                   << "\n";
      return llvm::Error::success();
    }
    void notifyTransferringResources(llvm::orc::JITDylib &JD,
                                     llvm::orc::ResourceKey DstKey,
                                     llvm::orc::ResourceKey SrcKey) override {
      llvm::errs() << "NubELFNixSectionPlugin notifyTransferringResources "
                   << llvm::format_hex(DstKey, 10)
                   << " <- " << llvm::format_hex(SrcKey, 10)
                   << "\n";
    }

  private:
    NubLLDBContext &nlc_;
  };

  class NubMachOSectionPlugin : public llvm::orc::ObjectLinkingLayer::Plugin {
  public:
    NubMachOSectionPlugin(NubLLDBContext &nlc) : nlc_(nlc) {}

    // Add passes to preserve initialization sections
    void modifyPassConfig(llvm::orc::MaterializationResponsibility &MR,
                          llvm::jitlink::LinkGraph &G,
                          llvm::jitlink::PassConfiguration &Config) override {
      Config.PrePrunePasses.push_back([this](llvm::jitlink::LinkGraph &G) -> llvm::Error {
        for (auto *block : G.blocks()) {
          auto section_name { block->getSection().getName() };
          auto is_initializer { llvm::orc::isMachOInitializerSection(section_name) };
          if (is_initializer) {
            // Preserve this block by adding a live anonymous symbol
            G.addAnonymousSymbol(*block, 0, block->getSize(), false, true);
          }
        }
        return llvm::Error::success();
      });
      Config.PostFixupPasses.push_back([this, &MR](llvm::jitlink::LinkGraph &G) {
        auto &JD { MR.getTargetJITDylib() };
        NUB_DEBUG({
          llvm::dbgs() << "MachO post-fixup pass for "
                       << G.getName()
                       << " reports:\n";
        });
        for (auto &Sec : G.sections()) {
          auto name { Sec.getName() };
          auto range { llvm::jitlink::SectionRange(Sec) };
          NUB_DEBUG({
            llvm::dbgs() << "  section " << name
                         << " prot " << Sec.getMemProt()
                         << " " << range.getStart() << ".." << range.getEnd()
                         << "\n";
          });
          NubProcess::RegionKind kind;
          if (name == "__TEXT,__eh_frame") {
            kind = NubProcess::RegionKind::EHFrame;
          }
          else if (name == "__DATA,__mod_init_func") {
            kind = NubProcess::RegionKind::InitArray;
          }
          else if (name == "__DATA,__dydat") { // FIXME
            kind = NubProcess::RegionKind::DylanAmbiguous;
          }
          else if (name == "__DATA,__dyobj") { // FIXME
            kind = NubProcess::RegionKind::DylanStatic;
          }
          else if (name == "__DATA,__dyutr") {
            kind = NubProcess::RegionKind::DylanUntraced;
          }
          else if (name == "__DATA,__dyhis") {
            kind = NubProcess::RegionKind::DylanHistory;
          }
          else {
            continue;
          }
          this->nlc_.jd_regions[&JD].push_back
            (NubProcess::Region(kind,
                                range.getStart().getValue(),
                                range.getEnd().getValue()));
        }
        return llvm::Error::success();
      });
    }

    llvm::Error notifyFailed(llvm::orc::MaterializationResponsibility &MR) override {
      auto &JD { MR.getTargetJITDylib() };
      this->nlc_.jd_regions[&JD].clear();
      llvm::errs() << "NubMachOSectionPlugin notifyFailed for "
                   << JD.getName()
                   << "\n";
      return llvm::Error::success();
    }
    llvm::Error notifyRemovingResources(llvm::orc::JITDylib &JD,
                                        llvm::orc::ResourceKey K) override {
      llvm::errs() << "NubMachOSectionPlugin notifyRemovingResources "
                   << llvm::format_hex(K, 10)
                   << "\n";
      return llvm::Error::success();
    }
    void notifyTransferringResources(llvm::orc::JITDylib &JD,
                                     llvm::orc::ResourceKey DstKey,
                                     llvm::orc::ResourceKey SrcKey) override {
      llvm::errs() << "NubMachOSectionPlugin notifyTransferringResources "
                   << llvm::format_hex(DstKey, 10)
                   << " <- " << llvm::format_hex(SrcKey, 10)
                   << "\n";
    }

  private:
    NubLLDBContext &nlc_;
  };

  NubLLDBContext::NubLLDBContext(const char *process_name)
    : debugger(creator.create()),
      listener(std::string("Listener for ").append(process_name).c_str()),
      launch(nullptr),
      nub_state(INERT),
      exit_process_function(LLDB_INVALID_ADDRESS),
      ssp(std::make_shared<llvm::orc::SymbolStringPool>()),
      exit_broadcaster_("nub event_dispatcher_thread"),
      event_dispatcher_thread_([&] { dispatch_lldb_events(); })
  {
    this->exit_broadcaster_.AddListener(this->listener, 1);
  }

  NubLLDBContext::~NubLLDBContext()
  {
    NUB_DEBUG(llvm::dbgs() << "~NubLLDBContext() begins\n");

    // Tell the listener dispatch thread to exit, and join it when it
    // does
    this->exit_broadcaster_.BroadcastEventByType(1, true);
    this->event_dispatcher_thread_.join();
    NUB_DEBUG(llvm::dbgs() << "~NubLLDBContext(), dispatcher joined\n");

    this->function_call_result.Clear();
    this->launch.Clear();
    this->listener.Clear();
    this->process.Clear();
    this->target.Clear();
  }

  NubProcess::LookupSymbol NubLLDBContext::make_lookup_symbol(lldb::SBSymbol &symbol) const
  {
    auto start { symbol.GetStartAddress() };
    auto lookup {
      NubProcess::LookupSymbol(symbol.GetName(),
                               start.GetLoadAddress(this->target),
                               symbol.GetType() == lldb::eSymbolTypeCode)
    };
    if (lookup.address == LLDB_INVALID_ADDRESS) {
      abort();
    }
    if (lookup.is_function) {
      // FIXME start.GetSymbolContext(0).GetFunction().GetLanguage()
      lookup.language = 0;
      if (start.IsValid()) {
        lookup.debug_start = lookup.address + symbol.GetPrologueByteSize();
      }
      else {
        lookup.debug_start = LLDB_INVALID_ADDRESS;
      }
      auto end { symbol.GetEndAddress() };
      lookup.debug_end = lookup.function_end = end.GetLoadAddress(target);
    }
    return lookup;
  }

  NubProcess::LookupSymbol NubLLDBContext::make_lookup_symbol
      (const std::string &name,
       const llvm::orc::ExecutorSymbolDef &symboldef)
  {
    auto callable { symboldef.getFlags().isCallable() };
    auto address { symboldef.getAddress().getValue() };
    auto lookup { NubProcess::LookupSymbol(name, address, callable) };
    if (callable) {
      lookup.language = 0;
      lookup.debug_start = LLDB_INVALID_ADDRESS;
      lookup.debug_end = LLDB_INVALID_ADDRESS;
      lookup.function_end = LLDB_INVALID_ADDRESS;
    }
    return lookup;
  }

  bool NubLLDBContext::initialize_jit()
  {
    // The JIT target
    auto triple { llvm::Triple(this->target.GetTriple()) };
    NUB_DEBUG({
      llvm::dbgs() << "JIT Triple " << triple.str()
                   << " (" << triple.normalize() <<")\n";
    });

    auto JTMB { llvm::orc::JITTargetMachineBuilder(triple) };
    JTMB.setRelocationModel(llvm::Reloc::PIC_);
    JTMB.setCodeModel(llvm::CodeModel::Large);

    // Build the LLJIT using ObjectLinkingLayer
    auto TD { std::make_unique<llvm::orc::InPlaceTaskDispatcher>() };
    auto MM { std::make_unique<NubProcessMemoryManager>(*this) };
    auto EPC { NubExecutorProcessControl::Create(this->ssp, std::move(TD), std::move(MM), *this) };
    if (!EPC) {
      llvm::logAllUnhandledErrors(EPC.takeError(), llvm::errs(),
                                  "initialize_jit: ");
      return false;
    }
    auto Creator {
      [this](llvm::orc::ExecutionSession &ES, const llvm::Triple &TT) -> llvm::Expected<std::unique_ptr<llvm::orc::ObjectLayer>> {
        NUB_DEBUG(llvm::dbgs() << "Creating ObjectLinkingLayer\n");
        auto OLL { std::make_unique<llvm::orc::ObjectLinkingLayer>(ES) };
        if (TT.isOSBinFormatELF()) {
          NUB_DEBUG(llvm::dbgs() << "Adding the illustrious NubELFNixSectionPlugin\n");
          OLL->addPlugin(std::make_unique<NubELFNixSectionPlugin>(*this));
        }
        else if (TT.isOSBinFormatMachO()) {
          NUB_DEBUG(llvm::dbgs() << "Adding the alluring NubMachOSectionPlugin\n");
          OLL->addPlugin(std::make_unique<NubMachOSectionPlugin>(*this));
        }
        else {
          return llvm::make_error<llvm::StringError>("No plugin support for '" + TT.str() + "'",
                                                     llvm::inconvertibleErrorCode());
        }
        OLL->setReturnObjectBuffer([](std::unique_ptr<llvm::MemoryBuffer> buf) {
          NUB_DEBUG(llvm::dbgs() << "Return buffer " << buf->getBufferSize() << "\n");
        });
        return std::move(OLL);
      }
    };
    auto PlatformSetUp {
      [this](llvm::orc::LLJIT &J) -> llvm::Expected<llvm::orc::JITDylibSP> {
        auto &TT { J.getTargetTriple() };
        NUB_DEBUG(llvm::dbgs() << "PlatformSetUp " << TT.str() << "\n");

        auto &ES { J.getExecutionSession() };
        ES.setErrorReporter([this](llvm::Error Err) {
          llvm::logAllUnhandledErrors(std::move(Err), llvm::errs(),
                                      "NubLLDBContext JIT session error: ");
          this->jit_error_code = -1;
        });
        return nullptr; // no need for a platform JITDylib
      }
    };
    auto EJ { llvm::orc::LLJITBuilder()
      .setJITTargetMachineBuilder(std::move(JTMB))
      .setObjectLinkingLayerCreator(Creator)
      .setPlatformSetUp(PlatformSetUp)
      .setExecutorProcessControl(std::move(*EPC))
      .create() };
    if (!EJ) {
      llvm::logAllUnhandledErrors(EJ.takeError(), llvm::errs(),
                                  "initialize_jit: ");
      return false;
    }

    // Save this wonderful JIT
    std::swap(this->jit, *EJ);

    return true;
  }

  void NubLLDBContext::dispatch_lldb_events()
  {
    NUB_DEBUG(llvm::dbgs() << "Dispatching LLDB events...\n");
    lldb::SBEvent event;
    while (listener.WaitForEvent(UINT32_MAX, event)) {
      NUB_DEBUG({
        lldb::SBStream stream;
        event.GetDescription(stream);
        llvm::dbgs() << "Event ";
        if (event.GetDataFlavor() != nullptr) {
          llvm::dbgs() << "(data flavor " << event.GetDataFlavor() << "): ";
        }
        llvm::dbgs() << stream.GetData() << "\n";
      });

      auto event_type { event.GetType() };
      if (lldb::SBProcess::EventIsProcessEvent(event)) {
        auto process { lldb::SBProcess::GetProcessFromEvent(event) };
        if (event_type & lldb::SBProcess::eBroadcastBitStateChanged) {
          auto state { lldb::SBProcess::GetStateFromEvent(event) };
          if (state == lldb::eStateStopped || state == lldb::eStateExited) {
            // We only care if it's really stopped
            if (!lldb::SBProcess::GetRestartedFromEvent(event)) {
              this->dispatch_process_stop(process, state);
            }
          }
          else if (state == lldb::eStateRunning) {
            // Nice!
          }
          else {
            NUB_DEBUG(llvm::dbgs() << "PROCESS STATE " << state << " NOT HANDLED\n");
          }
        }
        else if (event_type & lldb::SBProcess::eBroadcastBitSTDOUT) {
          this->dispatch_process_output(process, NubProcess::StdOut);
        }
        else if (event_type & lldb::SBProcess::eBroadcastBitSTDERR) {
          this->dispatch_process_output(process, NubProcess::StdErr);
        }
        else {
          NUB_DEBUG(llvm::dbgs() << "PROCESS EVENT NOT HANDLED\n");
        }
      }
      else if (lldb::SBThread::EventIsThreadEvent(event)) {
        NUB_DEBUG(llvm::dbgs() << "THREAD EVENT NOT HANDLED\n");
      }
      else if (lldb::SBTarget::EventIsTargetEvent(event)) {
        if ((event_type & lldb::SBTarget::eBroadcastBitModulesLoaded) != 0) {
          this->dispatch_target_modules_loaded(event);
        }
        else if ((event_type & lldb::SBTarget::eBroadcastBitModulesUnloaded) != 0) {
          this->dispatch_target_modules_unloaded(event);
        }
      }
      else if (lldb::SBBreakpoint::EventIsBreakpointEvent(event)) {
        NUB_DEBUG(llvm::dbgs() << "BREAKPOINT EVENT NOT HANDLED\n");
      }
      else if (lldb::SBWatchpoint::EventIsWatchpointEvent(event)) {
        NUB_DEBUG(llvm::dbgs() << "WATCHPOINT EVENT NOT HANDLED\n");
      }
      else if (event.BroadcasterMatchesRef(this->exit_broadcaster_)) {
        NUB_DEBUG(llvm::dbgs() << "Nub event dispatcher exiting\n");
        break;
      }
      else {
        llvm::dbgs() << "SOME OTHER EVENT NOT HANDLED\n";
      }
      // PERHAPS MORE TO COME HERE
    }
  }

  void NubLLDBContext::dispatch_process_stop(lldb::SBProcess &process, lldb::StateType state)
  {
    std::unique_lock<std::recursive_mutex> guard(this->mutex);
    lldb::pid_t pid { process.GetProcessID() };
    switch (state) {
    case lldb::eStateStopped:
      switch (this->nub_state) {
      case INERT:
        abort();                  // This shouldn't happen
        break;
      case OPEN:
        llvm::errs() << "Stopped in OPEN? What???\n";
        abort();                  // This shouldn't happen
        break;
      case LAUNCHING:
        {
          // We have a process now
          this->process = this->target.GetProcess();
          auto main_thread { this->process.GetSelectedThread() };
          auto tid { main_thread.GetThreadID() };

          llvm::errs() << "We have a process now (main thread " << tid << ")\n";
          this->debugger.HandleCommand("breakpoint list");

          // This had better be stopped at entry
          auto us { this->process.GetUnixSignals() };
          auto sigstop { us.GetSignalNumberFromName("SIGSTOP") };
          if (main_thread.GetStopReason() != lldb::eStopReasonSignal
              || main_thread.GetStopReasonDataAtIndex(0) != sigstop) {
            llvm::errs() << "I don't know why we stopped here ("
                         << main_thread.GetStopReason()
                         << ", "
                         << main_thread.GetStopReasonDataAtIndex(0)
                         << ")\n";
            this->backtrace(main_thread);
            abort();
          }

          // During run-time initialization, we need to ignore SIGSEGV
          // and SIGBUS because BDW GC uses these to find memory area
          // limits
          auto sigsegv { us.GetSignalNumberFromName("SIGSEGV") };
          us.SetShouldStop(sigsegv, false);
          auto sigbus { us.GetSignalNumberFromName("SIGBUS") };
          us.SetShouldStop(sigbus, false);

          this->nub_state = INITIALIZING;
          NUB_DEBUG(llvm::dbgs() << "Entering INITIALIZING state, initial thread " << tid << "\n");

          // The debugger expects a CREATE_PROCESS event at this point
          NubProcess::StopReason create_process
            (NubProcess::CREATE_PROCESS_DBG_EVENT, false, tid);
          this->stop_reason_queue.emplace_back(create_process);

          // Any modules-loaded events that happened before now were
          // deferred (since no thread ID was available), so we post
          // them now.
          for (auto index = 0; index < this->modules.size(); ++index) {
            NubProcess::StopReason load_dll(NubProcess::LOAD_DLL_DBG_EVENT, true, tid);
            load_dll.library = index;
            this->stop_reason_queue.emplace_back(load_dll);
          }

          this->queue_condition.notify_all();
        }
        break;

      case INITIALIZING:
        {
          // Enumerate the initial set of threads
          lldb::SBThread main_thread;
          for (size_t ti = 0, te = process.GetNumThreads(); ti != te; ++ti) {
            auto thread { process.GetThreadAtIndex(ti) };

            char description[8192];
            thread.GetStopDescription(description, sizeof description);
            NUB_DEBUG({
                llvm::dbgs() << "Thread " << thread.GetThreadID()
                             << " stop reason: " << thread.GetStopReason()
                             << " description: " << description
                             << "\n";
            });
            if (thread.GetStopReason() == lldb::eStopReasonBreakpoint
                && thread.GetStopReasonDataAtIndex(0) == this->main_breakpoint.GetID()) {
              this->thread_map[thread.GetThreadID()] = THREAD_MAIN;
              main_thread = thread;
            }
            else {
              // This thread was created by the GC or the Dylan
              // run-time, so we won't need to notify of its existence
              this->thread_map[thread.GetThreadID()] = THREAD_SYSTEM;
            }
          }
          if (!main_thread.IsValid()) {
            llvm::errs() << "I don't know what we're doing here\n";
            abort();
          }
          auto tid { main_thread.GetThreadID() };

          if (auto us = this->process.GetUnixSignals()) {
            // It should be safe to re-enable SIGSEGV and SIGBUS now
            // that the garbage collector has finished initializing
            auto sigsegv { us.GetSignalNumberFromName("SIGSEGV") };
            us.SetShouldStop(sigsegv, true);
            auto sigbus { us.GetSignalNumberFromName("SIGBUS") };
            us.SetShouldStop(sigbus, true);

            // Enumerate the signals reserved by the runtime
            for (size_t n = 0; ; n++) {
              lldb::SBStream expression;
              expression.Printf("spy_get_runtime_signal(%zu)", n);
              auto value { this->evaluate(main_thread, expression.GetData()) };
              auto sig { value.GetValueAsSigned(-1) };
              if (sig == -1) {
                break;
              }
              NUB_DEBUG({
                llvm::dbgs() << "Runtime reserves signal "
                             << sig << ": " << us.GetSignalAsCString(sig)
                             << "\n";
              });
              us.SetShouldStop(sig, false);
            }
          }

          // We won't need to stop at this breakpoint again (unless the
          // application is restarted)
          this->main_breakpoint.SetEnabled(false);

          // Set up a breakpoint at the thread trampoline
          this->create_thread_breakpoint
            = this->target.BreakpointCreateByName("dylan_thread_trampoline");
          this->create_thread_breakpoint.SetEnabled(true);
          //this->debugger.HandleCommand("breakpoint list");

          // A stop reason of this type for which first_hard_coded_breakpoint()
          // returns true is interpreted as <system-initialized-stop-reason>
          auto thread { this->process.GetSelectedThread() };
          auto frame { thread.GetFrameAtIndex(0) };
          NubProcess::StopReason system_initialized
            (NubProcess::HARD_CODED_BREAKPOINT_DBG_EVENT, false, tid);
          system_initialized.first_hard_coded_breakpoint = 1;
          system_initialized.exception_address = frame.GetPC();
          this->stop_reason_queue.emplace_back(system_initialized);
          this->queue_condition.notify_all();

          this->nub_state = RUNNING;
          NUB_DEBUG(llvm::dbgs() << "Entering RUNNING state\n");
        }
        break;

      case RUNNING:
        NUB_DEBUG(llvm::dbgs() << "Stopped in RUNNING, for whatever reason\n");
        //this->debugger.HandleCommand("bt all");
        {
          auto queue_count { this->stop_reason_queue.size() };
          for (size_t ti = 0, te = process.GetNumThreads(); ti != te; ++ti) {
            auto thread { process.GetThreadAtIndex(ti) };
            auto tid { thread.GetThreadID() };
            auto frame { thread.GetFrameAtIndex(0) };
            lldb::SBStream frame_stream;
            frame.GetDescription(frame_stream);
            auto exception_address { frame.GetPC() };

            NUB_DEBUG({
              char description[8192];
              thread.GetStopDescription(description, sizeof description);
              llvm::dbgs() << "Thread " << tid
                           << " stop reason: " << thread.GetStopReason()
                           << " description: " << description
                           << "\n  " << frame_stream.GetData();
            });
            if (thread.IsSuspended()) {
              NUB_DEBUG(llvm::dbgs() << "  That's suspended, ignore for now\n");
              continue;
            }
            switch (thread.GetStopReason()) {
            case lldb::eStopReasonBreakpoint:
              if (thread.GetStopReasonDataAtIndex(0) == this->create_thread_breakpoint.GetID()) {
                this->thread_map[tid] = THREAD_NOTIFIED;
                NubProcess::StopReason create_thread_stop
                  (NubProcess::CREATE_THREAD_DBG_EVENT, false, tid);
                this->stop_reason_queue.emplace_back(create_thread_stop);
                this->queue_condition.notify_all();
                NUB_DEBUG(llvm::dbgs() << "  Pushed CREATE_THREAD for that one\n");
              }
              else {
                auto breakpoint_i { this->breakpoint_map.find(exception_address) };
                if (breakpoint_i != this->breakpoint_map.end()) {
                  NubProcess::StopReasonCode code;
                  switch (breakpoint_i->second.classification) {
                  case APPLICATION_BREAKPOINT:
                    code = NubProcess::BREAKPOINT_EXCEPTION_DBG_EVENT;
                    break;
                  case CAPTURE_STEP_OUT_BREAKPOINT:
                    code = NubProcess::SOURCE_STEP_OUT_DBG_EVENT;
                    break;
                  case CAPTURE_STEP_OVER_BREAKPOINT:
                    code = NubProcess::SOURCE_STEP_OVER_DBG_EVENT;
                    break;
                  case CAPTURE_STEP_INTO_BREAKPOINT:
                    code = NubProcess::SOURCE_STEP_INTO_DBG_EVENT;
                    break;
                  default:
                    abort();
                  }
                  NubProcess::StopReason breakpoint_stop(code, false, tid);
                  breakpoint_stop.exception_address = exception_address;
                  this->stop_reason_queue.emplace_back(breakpoint_stop);
                  this->queue_condition.notify_all();
                  NUB_DEBUG(llvm::dbgs() << "  Pushed " << stop_reason_name[code]
                                         << " for that one, index="
                                         << thread.GetStopReasonDataAtIndex(0) << "\n");
                }
                else {
                  llvm::errs() << "  Breakpoint that's not known\n";
                }
              }
              break;
            case lldb::eStopReasonException:
              {
                auto code { thread.GetStopReasonDataAtIndex(0) };
                switch (code) {
#ifdef EXC_BAD_ACCESS
                case EXC_BAD_ACCESS:
                  {
                    NubProcess::StopReason access_violation
                      (NubProcess::ACCESS_VIOLATION_EXCEPTION_DBG_EVENT, false, tid);
                    access_violation.exception_address = exception_address;
                    // FIXME violation-address
                    // FIXME violation-operation
                    this->stop_reason_queue.emplace_back(access_violation);
                    this->queue_condition.notify_all();
                    NUB_DEBUG(llvm::dbgs() << "  Pushed ACCESS_VIOLATION_EXCEPTION for that one\n");
                  }
                  break;
#endif
#ifdef EXC_BREAKPOINT
                case EXC_BREAKPOINT:
                  {
                    NubProcess::StopReason system_initialized
                      (NubProcess::HARD_CODED_BREAKPOINT_DBG_EVENT, false, tid);
                    system_initialized.exception_address = exception_address;
                    system_initialized.first_hard_coded_breakpoint = 0;
                    this->stop_reason_queue.emplace_back(system_initialized);
                    this->queue_condition.notify_all();
                    NUB_DEBUG(llvm::dbgs() << "  Pushed HARD_CODED_BREAKPOINT for that one\n");
                    //this->debugger_.HandleCommand("bt all");
                  }
                  break;
#endif
                default:
                  llvm::errs() << "  Unhandled exception code " << code << ": "
                               << thread.GetStopReasonDataCount() << " data"
                               << " (0) = " << thread.GetStopReasonDataAtIndex(0)
                               << "\n";
                  abort();
                }
              }
              break;
            case lldb::eStopReasonSignal:
              {
                auto sig { thread.GetStopReasonDataAtIndex(0) };
                auto us { process.GetUnixSignals() };
                if (sig == us.GetSignalNumberFromName("SIGTRAP")) {
                  NubProcess::StopReason hard_coded_breakpoint
                    (NubProcess::HARD_CODED_BREAKPOINT_DBG_EVENT, false, tid);
                  hard_coded_breakpoint.exception_address = exception_address;
                  hard_coded_breakpoint.first_hard_coded_breakpoint = 0;
                  this->stop_reason_queue.emplace_back(hard_coded_breakpoint);
                  this->queue_condition.notify_all();
                  NUB_DEBUG(llvm::dbgs() << "  Pushed HARD_CODED_BREAKPOINT for that one\n");
                  //this->debugger_.HandleCommand("bt all");
                }
                else if (sig == us.GetSignalNumberFromName("SIGSEGV")) {
                  NubProcess::StopReason access_violation_exception
                    (NubProcess::ACCESS_VIOLATION_EXCEPTION_DBG_EVENT, false, tid);
                  access_violation_exception.exception_address = exception_address;
                  access_violation_exception.first_hard_coded_breakpoint = 0;
                  this->stop_reason_queue.emplace_back(access_violation_exception);
                  this->queue_condition.notify_all();
                  NUB_DEBUG(llvm::dbgs() << "  Pushed ACCESS_VIOLATION_EXCEPTION for that one\n");
                }
                else {
                  NUB_DEBUG(llvm::dbgs() << "  What to do??? signal = " << sig << "\n");
                  abort();
                }
              }
              break;

            default:
              NUB_DEBUG(llvm::dbgs() << "  Letting that go for now\n");
              break;
            }
          }
          // If there are no stop reasons we care about (for
          // poorly-understood reasons) then we just continue
          if (queue_count == this->stop_reason_queue.size()) {
            NUB_DEBUG(llvm::dbgs() << "OK GO!\n");
            process.Continue();
          }
        }
        break;

      case STOPPING:
        NUB_DEBUG(llvm::dbgs() << "Stopped in STOPPING, as expected\n");
        break;
      }
      break;

    case lldb::eStateExited:
      {
        lldb::tid_t main_tid { LLDB_INVALID_THREAD_ID };
        for (auto &e : this->thread_map) {
          if (e.second == THREAD_MAIN) {
            main_tid = e.first;
            break;
          }
        }
        NubProcess::StopReason exit_process
          (NubProcess::EXIT_PROCESS_DBG_EVENT, false, main_tid);
        exit_process.exit_code = process.GetExitStatus();
        NUB_DEBUG(llvm::dbgs() << "Exit process " << exit_process.exit_code << "\n");
        this->stop_reason_queue.emplace_back(exit_process);
        this->queue_condition.notify_all();
      }
      break;
    default:
      llvm::errs() << "Process stopped in state " << state << "\n";
      abort();
      break;
    }
  }

  void NubLLDBContext::dispatch_process_output(lldb::SBProcess &process, NubProcess::OutputType type)
  {
    char buf[4096];
    size_t len;
    switch (type) {
    case NubProcess::StdOut:
      len = process.GetSTDOUT(buf, sizeof buf);
      break;
    case NubProcess::StdErr:
      len = process.GetSTDERR(buf, sizeof buf);
      break;
    }
    llvm::errs() << "Output " << type << ": "
                 << std::string(buf, len)
                 << "\n";
  }

  void NubLLDBContext::dispatch_target_modules_loaded(lldb::SBEvent &event)
  {
    std::unique_lock<std::recursive_mutex> guard(this->mutex);
    auto num_modules { lldb::SBTarget::GetNumModulesFromEvent(event) };
    for (uint32_t i = 0; i < num_modules; ++i) {
      auto module { lldb::SBTarget::GetModuleAtIndexFromEvent(i, event) };
      auto index { this->modules.size() };
      this->modules.push_back(module);

      bool real_stop = false;
      for (auto &stop : this->stop_reason_queue) {
        if (!stop.synthetic) {
          real_stop = true;
          break;
        }
      }
      if (real_stop) {
        llvm::errs() << "LOAD_DLL but we're already stopped for real, ignoring\n";
      }
      else if (this->process.IsValid()) {
        auto current_thread { this->process.GetSelectedThread() };
        auto tid { current_thread.GetThreadID() };
        NubProcess::StopReason load_dll(NubProcess::LOAD_DLL_DBG_EVENT, true, tid);
        load_dll.library = index;
        this->stop_reason_queue.emplace_back(load_dll);
      }
      else {
        NUB_DEBUG(llvm::dbgs() << "LOAD_DLL before process create, defer\n");
      }
    }
  }

  void NubLLDBContext::dispatch_target_modules_unloaded(lldb::SBEvent &event)
  {
    std::unique_lock<std::recursive_mutex> guard(this->mutex);
    llvm::errs() << "Not ready to deal with module unload yet\n";
    abort();
  }

  void NubLLDBContext::evaluate_function_call()
  {
    auto pid { this->process.GetProcessID() };
    auto thread { this->process.GetThreadByID(this->function_call_thread) };

    std::string expression;
    std::swap(expression, function_call_expression);

    this->function_call_result
      = this->evaluate(thread, expression.c_str(), false, false);

    if (this->function_call_result.IsValid()
        && this->function_call_result.GetError().Success()) {
      auto frame { thread.GetFrameAtIndex(0) };
      NubProcess::StopReason breakpoint_stop(NubProcess::BREAKPOINT_EXCEPTION_DBG_EVENT, false,
                                             this->function_call_thread);
      breakpoint_stop.exception_address = frame.GetPC();
      this->stop_reason_queue.emplace_back(breakpoint_stop);
      this->queue_condition.notify_all();

      NUB_DEBUG(llvm::dbgs() << "  Pushed BREAKPOINT_EXCEPTION after function call evaluation\n");
    }
  }

  lldb::SBValue NubLLDBContext::evaluate
    (lldb::SBThread &thread, const char *expression,
     bool stop_others, bool ignore_result)
  {
    NUB_DEBUG(llvm::dbgs() << "Evaluating: " << expression << "\n");
    lldb::SBExpressionOptions options;
    options.SetTimeoutInMicroSeconds(0); // Wait forever
    options.SetIgnoreBreakpoints(false);
    options.SetLanguage(lldb::eLanguageTypeC99);
    options.SetTryAllThreads(false);
    options.SetStopOthers(stop_others);
    options.SetUnwindOnError(false);

    NUB_DEBUG({
      llvm::dbgs() << "Before evaluate on " << thread.GetThreadID() << "\n";
      this->backtrace(thread);

      for (size_t ti = 0, te = this->process.GetNumThreads(); ti != te; ++ti) {
        auto tt { process.GetThreadAtIndex(ti) };
        auto tid { tt.GetThreadID() };
        llvm::dbgs() << "Thread " << tid
                     << " kind=" << this->thread_map[tid]
                     << " suspended=" << thread.IsSuspended()
                     << "\n";
      }
    });

    // If we're currently stopped at a breakpoint then we need to
    // temporarily disable it
    auto frame { thread.GetFrameAtIndex(0) };
    auto breakpoint_i { this->breakpoint_map.find(frame.GetPC()) };
    if (breakpoint_i != this->breakpoint_map.end()) {
      NUB_DEBUG({
          llvm::dbgs() << "Temporarily disabling breakpoint (ID "
                       << breakpoint_i->second.breakpoint.GetID() << ") at "
                       << llvm::format("0x%016" PRIx64, breakpoint_i->first)
                       << "\n";
      });
      breakpoint_i->second.breakpoint.SetEnabled(false);
    }

    auto value { frame.EvaluateExpression(expression, options) };
    NUB_DEBUG({
      lldb::SBStream description;
      value.GetDescription(description);
      llvm::dbgs() << "Result: " << description.GetData();
    });
    if (!ignore_result && !value.IsValid()) {
      lldb::SBError e { value.GetError() };
      if (e.Fail()) {
        llvm::errs() << "Error: " << e.GetCString() << "\n";
      }
    }

    // Restore the breakpoint if we disabled it
    if (breakpoint_i != this->breakpoint_map.end()) {
      NUB_DEBUG({
        llvm::dbgs() << "Re-enabling breakpoint (ID "
                     << breakpoint_i->second.breakpoint.GetID() << ") at "
                     << llvm::format("0x%016" PRIx64, breakpoint_i->first)
                     << "\n";
      });
      breakpoint_i->second.breakpoint.SetEnabled(true);
    }

    NUB_DEBUG({
      llvm::dbgs() << "After evaluate on " << thread.GetThreadID() << "\n";
      this->backtrace(thread);
    });

    return value;
  }

  void NubLLDBContext::shepherd_spy_created_threads(std::unique_lock<std::recursive_mutex> &guard, unsigned created_thread_count)
  {
    NUB_DEBUG({
      llvm::dbgs() << "Shepherding " << created_thread_count
                   << " spy-created thread(s)\n";
    });

    // Continue the new thread until it stops within
    // primitive-invoke-debugger (see spy-create-application-thread)
    while (created_thread_count > 0) {
      this->stop_reason_queue.pop_front();
      process.Continue();
      this->queue_condition.wait(guard,
                                 [&]{ return !stop_reason_queue.empty(); });

      if (this->stop_reason_queue.front().code != NubProcess::HARD_CODED_BREAKPOINT_DBG_EVENT) {
        auto code { this->stop_reason_queue.front().code };
        llvm::errs() << "Shepherding unexpectedly stopped with code " << stop_reason_name[code]
                     << " in thread " << this->stop_reason_queue.front().thread
                     << "\n";
        abort();
      }
      auto tid { this->stop_reason_queue.front().thread };
      this->thread_map[tid] = THREAD_NOTIFIED;
      --created_thread_count;
      auto thread { process.GetThreadByID(tid) };
      NUB_DEBUG({
        auto frame { thread.GetFrameAtIndex(0) };
        lldb::SBStream stream;
        frame.GetDescription(stream);
        llvm::dbgs() << "Successfully shepherded " << tid
                     << ", suspending it at "
                     << stream.GetData();
        });
      thread.Suspend();
    }
  }

  void NubLLDBContext::ensure_register_info(lldb::SBFrame &frame)
  {
    if (!this->register_names.empty()) {
      return;
    }
    auto registers { frame.GetRegisters() };
    {
      // "General Purpose Registers"
      this->general_registers.first = this->register_names.size();
      auto group_gpr { registers.GetFirstValueByName("General Purpose Registers") };
      this->populate_register_group(group_gpr);
      this->general_registers.second = this->register_names.size();
    }

    {
      // "Floating Point Registers"
      this->floating_registers.first = this->register_names.size();
      auto group_fpu { registers.GetFirstValueByName("Floating Point Registers") };
      this->populate_register_group(group_fpu);
      this->floating_registers.second = this->register_names.size();
    }
  }

  void NubLLDBContext::populate_register_group(lldb::SBValue &group)
  {
    for (uint32_t ci = 0, ce = group.GetNumChildren(); ci != ce; ++ci) {
      auto reg { group.GetChildAtIndex(ci) };
      auto index { this->register_names.size() };
      this->register_names.emplace_back(reg.GetName());
      this->register_name_map.insert({reg.GetName(), index});
    }
  }

  NubProcess::NUB_INDEX NubLLDBContext::add_virtual_register(NubProcess::TARGET_ADDRESS value)
  {
    auto virtual_reg { -1 - NubProcess::NUB_INDEX(this->virtual_register_values_.size()) };
    NUB_DEBUG({
        llvm::dbgs() << "Assigning virtual register " << virtual_reg
                     << " to value " << llvm::format("0x%016" PRIx64, value)
                     << "\n";
    });
    this->virtual_register_values_.push_back(value);
    return virtual_reg;
  }

  NubProcess::TARGET_ADDRESS NubLLDBContext::virtual_register_value(NubProcess::NUB_INDEX reg)
  {
    std::vector<NubProcess::TARGET_ADDRESS>::size_type index = -1 - reg;
    return this->virtual_register_values_[index];
  }

  void NubLLDBContext::clear_virtual_registers()
  {
    this->virtual_register_values_.clear();
  }

  void NubLLDBContext::backtrace(lldb::SBThread &thread)
  {
    auto real_frame_count { thread.GetNumFrames() };
    for (uint32_t i = 0; i < real_frame_count; ++i) {
      auto frame { thread.GetFrameAtIndex(i) };
      lldb::addr_t return_address;
      if (i + 1 < real_frame_count) {
        auto inner_frame { thread.GetFrameAtIndex(i + 1) };
        return_address = inner_frame.GetPC();
      }
      else {
        return_address = LLDB_INVALID_ADDRESS;
      }
      NUB_DEBUG({
        lldb::SBStream stream;
        frame.GetDescription(stream);
        llvm::dbgs() << "  [" << i << "]: FP="
                     << llvm::format("0x%016" PRIx64, frame.GetFP())
                     << " PC="
                     << llvm::format("0x%016" PRIx64, frame.GetPC())
                     << " RET="
                     << llvm::format("0x%016" PRIx64, return_address)
                     << "\n      " << stream.GetData();
      });
    }
  }
} // namespace nub_private
