package server.pseudoobjects;

import java.io.*;
import IE.Iona.OrbixWeb._CORBA;
import IE.Iona.OrbixWeb.Features.Config;
import org.omg.CORBA.SystemException;

import shared._tie_PseudoObjectsTest;

/**
 * The PseudoObjectsTest server.
 */
public class Server {

  public static void init_server (org.omg.CORBA.ORB orb) {
    _tie_PseudoObjectsTest PseudoObjectsTestImpl = null;
    PseudoObjectsTestImpl  = new _tie_PseudoObjectsTest( new PseudoObjectsTestImplementation() );

    FileOutputStream PseudoObjectsTest_ior_file;
    try {
      PseudoObjectsTest_ior_file = new FileOutputStream("PseudoObjectsTest.ior");
      String ior_string = orb.object_to_string(PseudoObjectsTestImpl);
      PrintStream print_stream = new PrintStream(PseudoObjectsTest_ior_file);
      print_stream.print(ior_string);
      print_stream.close();}
    catch (IOException e) {System.err.println(e.getMessage());}
  };

  public static void main(String args[]) {

      org.omg.CORBA.ORB orb = org.omg.CORBA.ORB.init();

      Config.setConfigItem("IT_IIOP_LISTEN_PORT",String.valueOf(7902));

      _CORBA.Orbix.setDiagnostics(2);

      try {
	init_server(orb);
	try {
	  System.out.println("-- Standalone OrbixWeb server started on port " + Config.get_IIOP_LISTEN_PORT());
	  _CORBA.Orbix.processEvents(10000*60);
	  System.out.println("-- Server Timedout");
	}
	catch(SystemException se) {
          System.out.println("Exception during creation of implementation : " + se.toString());
          System.exit(1);
	}
      }
      catch (SystemException se)
	{
	  System.out.println("Exception in new PseudoObjectsTestImplementation: ");
	  System.out.println(se.toString());
	  System.exit(1); 
	}
  } // main
}
