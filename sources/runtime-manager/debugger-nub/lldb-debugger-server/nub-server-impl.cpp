#include "remote-nub.h"

#include "nub-server-impl.h"
#include "remote-nub-impl.h"

#include <iostream>

#include <unistd.h>

using namespace std;

#define NUB_SERVER_UNIMPLEMENTED() \
  { \
    std::cerr << __FILE__ << ':' << __LINE__ << ": "                    \
              << __func__ << " unimplemented"                           \
              << std::endl;                                             \
    throw CORBA::NO_IMPLEMENT(0, CORBA::COMPLETED_NO);                  \
  }

Rtmgr_NubServer_i::Rtmgr_NubServer_i(CORBA::ORB_ptr orb,
                                     lldb::SBDebugger debugger)
  : orb_(orb), debugger_(debugger)
{
  // add extra constructor code here
}

Rtmgr::NubServer::RemoteNub_SEQ *Rtmgr_NubServer_i::nubs()
{
  NUB_SERVER_UNIMPLEMENTED();
}

Rtmgr::RemoteNub_ptr Rtmgr_NubServer_i::CreateNub(const char *process_name, const char *remote_machine)
{
  auto nub_impl { new Rtmgr_RemoteNub_i(process_name, remote_machine, debugger_) };
  auto nub { nub_impl->_this() };
  //nub_impl->_remove_ref();
  return nub;
}

void Rtmgr_NubServer_i::DestroyNub(Rtmgr::RemoteNub_ptr nub)
{
  std::cerr << "DestroyNub" << std::endl;
  nub->CloseNub();
}

void Rtmgr_NubServer_i::RegisterNub(Rtmgr::RemoteNub_ptr nub,
                                    const char *process_name,
                                    const char *process_id,
                                    const char *remote_machine)
{
  NUB_SERVER_UNIMPLEMENTED();
}

void Rtmgr_NubServer_i::DeregisterNub(Rtmgr::RemoteNub_ptr nub)
{
  NUB_SERVER_UNIMPLEMENTED();
}

void Rtmgr_NubServer_i::ShutdownServer()
{
  orb_->shutdown(true);
}

char *Rtmgr_NubServer_i::get_local_hostname()
{
  char name[256];
  gethostname(name, sizeof name);
  return CORBA::string_dup(name);
}

Rtmgr::NubServer::NUBINT Rtmgr_NubServer_i::verify_local_password(const char *password, const char *remote_machine)
{
  return 1;                     // FIXME
}

Rtmgr::NubServer::NUBINT Rtmgr_NubServer_i::update_local_process_list()
{
  NUB_SERVER_UNIMPLEMENTED();
}

Rtmgr::NubServer::RNUBPROCESS Rtmgr_NubServer_i::local_process_nub_descriptor(Rtmgr::NubServer::NUB_INDEX i)
{
  NUB_SERVER_UNIMPLEMENTED();
}

Rtmgr::NubServer::NUBINT Rtmgr_NubServer_i::local_process_identifier(Rtmgr::NubServer::RNUBPROCESS nubprocess)
{
  NUB_SERVER_UNIMPLEMENTED();
}

char *Rtmgr_NubServer_i::local_process_name(Rtmgr::NubServer::NUB_INDEX i)
{
  NUB_SERVER_UNIMPLEMENTED();
}

char *Rtmgr_NubServer_i::local_process_system_identifier(Rtmgr::NubServer::NUB_INDEX i)
{
  NUB_SERVER_UNIMPLEMENTED();
}

Rtmgr::NubServer::RNUB Rtmgr_NubServer_i::local_process_actual_identifier(Rtmgr::NubServer::NUB_INDEX i)
{
  NUB_SERVER_UNIMPLEMENTED();
}

