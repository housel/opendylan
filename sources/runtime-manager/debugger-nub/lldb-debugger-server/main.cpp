#include "remote-nub.h"

#include <lldb/API/LLDB.h>

#include <iostream>

#include <unistd.h>

#include "nub-server-impl.h"
#include "omnithread.h"

using namespace std;

int main(int argc, char *argv[])
{
  try {
    // Initialize the debugger
    lldb::SBDebugger::Initialize();
    lldb::SBDebugger debugger{lldb::SBDebugger::Create(false)};
    debugger.SetAsync(true);

    // Initialize the ORB
    CORBA::ORB_var orb = CORBA::ORB_init(argc, argv);

    // Obtain a reference to the root POA
    CORBA::Object_var obj = orb->resolve_initial_references("RootPOA");
    PortableServer::POA_var root_poa = PortableServer::POA::_narrow(obj);

    // Obtain the POAManager
    PortableServer::POAManager_var pman = root_poa->the_POAManager();

    // Create a child POA
    CORBA::PolicyList policies;
    policies.length(2);
    policies[0] = root_poa->create_id_assignment_policy(PortableServer::USER_ID);
    policies[1] = root_poa->create_lifespan_policy(PortableServer::PERSISTENT);

    PortableServer::POA_var child_poa
      = root_poa->create_POA("DebuggerServerPOA", pman, policies);

    // We allocate the objects on the heap.  Since these are reference
    // counted objects, they will be deleted by the POA when they are no
    // longer needed.
    Rtmgr_NubServer_i *myRtmgr_NubServer_i{new Rtmgr_NubServer_i(orb, debugger)};

    // Activate the main server object
    PortableServer::ObjectId_var oid
      = PortableServer::string_to_ObjectId("Open Dylan Debugger Server");
    child_poa->activate_object_with_id(oid, myRtmgr_NubServer_i);

    {
      CORBA::Object_var ref = myRtmgr_NubServer_i->_this();
      CORBA::String_var sior(orb->object_to_string(ref));
      std::cout << (char *) sior
                << std::endl;
    }

    // Tell the POA to start accepting requests on its objects
    pman->activate();

    orb->run();
    orb->destroy();
  }
  catch (CORBA::TRANSIENT&) {
    std::cerr << "Caught system exception TRANSIENT -- unable to contact the "
              << "server." << std::endl;
  }
  catch (CORBA::SystemException &ex) {
    std::cerr << "Caught a CORBA::" << ex._name() << std::endl;
  }
  catch (CORBA::Exception &ex) {
    std::cerr << "Caught CORBA::Exception: " << ex._name() << std::endl;
  }
  return 0;
}
