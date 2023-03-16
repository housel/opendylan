// -*- C++ -*-

#include "llvm/ExecutionEngine/Orc/Core.h"
#include "llvm/TargetParser/Triple.h"

#include <mutex>
#include <memory>

namespace nub_private {
  class NubLLDBContext;

  class NubTargetDefinitionGenerator : public llvm::orc::DefinitionGenerator {
  public:
    NubTargetDefinitionGenerator(NubLLDBContext &nlc, const llvm::Triple &triple)
      : DefinitionGenerator(),
        nlc_(nlc), triple_(triple) {
    }

    llvm::Error tryToGenerate(llvm::orc::LookupState &LS, llvm::orc::LookupKind K,
                              llvm::orc::JITDylib &JD,
                              llvm::orc::JITDylibLookupFlags JDLookupFlags,
                              const llvm::orc::SymbolLookupSet &LookupSet) override;

  private:
    NubLLDBContext &nlc_;
    llvm::Triple triple_;
  };
} // namespace nub_private
