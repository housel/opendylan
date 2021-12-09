// -*- C++ -*-

#include "llvm/ExecutionEngine/Orc/Core.h"

#include <mutex>
#include <memory>

namespace nub_private {
  class NubLLDBContext;

  class NubTargetDefinitionGenerator : public llvm::orc::DefinitionGenerator {
  public:
    NubTargetDefinitionGenerator(NubLLDBContext &nlc)
      : DefinitionGenerator(),
      nlc_(nlc) {
    }

    llvm::Error tryToGenerate(llvm::orc::LookupState &LS, llvm::orc::LookupKind K,
                              llvm::orc::JITDylib &JD,
                              llvm::orc::JITDylibLookupFlags JDLookupFlags,
                              const llvm::orc::SymbolLookupSet &LookupSet) override;

  private:
    NubLLDBContext &nlc_;
  };
} // namespace nub_private
