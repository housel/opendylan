#include "NubProcess.h"
#include "NubLLDBContext.h"
#include "NubTargetDefinitionGenerator.h"

#include <llvm/Support/FormatVariadic.h>
#include "llvm/ExecutionEngine/Orc/SymbolStringPool.h"

namespace nub_private {

llvm::Error NubTargetDefinitionGenerator::tryToGenerate(llvm::orc::LookupState &LS, llvm::orc::LookupKind K,
                                                        llvm::orc::JITDylib &JD,
                                                        llvm::orc::JITDylibLookupFlags JDLookupFlags,
                                                        const llvm::orc::SymbolLookupSet &LookupSet) {
  std::unique_lock<std::recursive_mutex> guard(this->nlc_.mutex);
  llvm::orc::SymbolMap FoundSymbols;
  for (const auto &kv : LookupSet) {
    const auto &name = kv.first;
    NUB_DEBUG(llvm::dbgs() << "Lookup " << *name << "\n");
    auto name_str { (*name).str() };
    const char *name_raw { name_str.c_str() };
    if (this->triple_.isOSBinFormatMachO() && name_raw[0] == '_') {
      ++name_raw;
    }
    auto context_list { this->nlc_.target.FindSymbols(name_raw) };
    for (uint32_t i = 0, e = context_list.GetSize(); i != e; ++i) {
      auto context { context_list.GetContextAtIndex(i) };
      auto symbol { context.GetSymbol() };
      auto address { symbol.GetStartAddress() };
      if (address.IsValid()) {
        auto load_addr { address.GetLoadAddress(this->nlc_.target) };
        NUB_DEBUG({
          llvm::dbgs() << "  Found at "
                       << llvm::format_hex(load_addr, 18)
                       << "\n";
        });
        llvm::JITSymbolFlags flags = llvm::JITSymbolFlags::None;
        if (symbol.GetType() == lldb::eSymbolTypeCode) {
          flags |= llvm::JITSymbolFlags::Callable;
        }
        if (symbol.IsExternal()) {
          flags |= llvm::JITSymbolFlags::Exported;
        }
        FoundSymbols[name] = {llvm::orc::ExecutorAddr(load_addr), flags};
      }
      else {
        NUB_DEBUG(llvm::dbgs() << "  Not found\n");
      }
    }
  }

  if (FoundSymbols.empty()) {
    return llvm::Error::success();
  }
  return JD.define(llvm::orc::absoluteSymbols(std::move(FoundSymbols)));
}

} // namespace nub_private
