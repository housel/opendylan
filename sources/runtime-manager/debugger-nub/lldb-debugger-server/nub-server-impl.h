// -*- C++ -*-

#include "remote-nub.h"

#include <lldb/API/LLDB.h>

class Rtmgr_NubServer_i : public POA_Rtmgr::NubServer {
private:
  // Make sure all instances are built on the heap by making the
  // destructor non-public
  virtual ~Rtmgr_NubServer_i();

  CORBA::ORB_ptr orb_;
  lldb::SBDebugger debugger_;

public:
  // standard constructor
  Rtmgr_NubServer_i(CORBA::ORB_ptr orb, lldb::SBDebugger debugger);

  // methods corresponding to defined IDL attributes and operations
  Rtmgr::NubServer::RemoteNub_SEQ *nubs();

  Rtmgr::RemoteNub_ptr CreateNub(const char *process_name,
                                 const char *remote_machine);

  void DestroyNub(Rtmgr::RemoteNub_ptr nub);

  void RegisterNub(Rtmgr::RemoteNub_ptr nub,
                   const char *process_name,
                   const char *process_id,
                   const char *remote_machine);

  void DeregisterNub(Rtmgr::RemoteNub_ptr nub);

  void ShutdownServer();

  char *get_local_hostname();

  Rtmgr::NubServer::NUBINT verify_local_password(const char *password,
                                                 const char *remote_machine);

  Rtmgr::NubServer::NUBINT update_local_process_list();

  Rtmgr::NubServer::RNUBPROCESS local_process_nub_descriptor(Rtmgr::NubServer::NUB_INDEX i);

  Rtmgr::NubServer::NUBINT local_process_identifier(Rtmgr::NubServer::RNUBPROCESS nubprocess);

  char *local_process_name(Rtmgr::NubServer::NUB_INDEX i);

  char *local_process_system_identifier(Rtmgr::NubServer::NUB_INDEX i);

  Rtmgr::NubServer::RNUB local_process_actual_identifier(Rtmgr::NubServer::NUB_INDEX i);
};
