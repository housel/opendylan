module:     interactive-downloader-internals
synopsis:   Top level processing of the interactive <coff-file>.
author:     Paul Howard, Peter S. Housel
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


///// DOWNLOAD-OBJECT-FILES
//    A top-level interface to the functionality of the downloader.
//    Downloads a sequence of <coff-file> objects into the interactive
//    dylan application defined by the <debug-target>.
//    (This interface is only used by devel-dbg-ui, not by the environment)
define method download-object-files
    (application :: <debug-target>, coff-files :: <sequence>,
     #key library = "dylan") => ()
  let transaction =
    open-interactive-transaction(application, coff-files, dll-name: library);
  download-all-raw-data(transaction);
  define-all-symbols(transaction);
  perform-all-relocations(transaction);
  perform-all-registrations(transaction);
end method;


///// DOWNLOAD-FOR-INTERACTIVE-EXECUTION
//    The main interface to the interactive linker.

define sideways method download-for-interactive-execution
    (context :: <runtime-context>, downloadable-records :: <sequence>,
     library :: <byte-string>, entry-point :: <byte-string>)
 => (transaction-id)
  // Unpick the execution context to get the debug target, and the
  // required thread.
  let application = context.runtime-context-debug-target;

  let download-function
    = select (first(downloadable-records) by instance?)
        <coff-file> =>
          download-for-interactive-execution-coff;
        otherwise =>
          download-for-interactive-execution-nub;
      end select;
  call-debugger-function(application, download-function,
			 context, application, downloadable-records,
			 library, entry-point)
end method;

///// DOWNLOAD-FOR-INTERACTIVE-EXECUTION-COFF
//    The internal interface must be called on the thread managing the
//    application

define method download-for-interactive-execution-coff
    (context :: <runtime-context>, application :: <debug-target>,
     coff-files :: <sequence>, library :: <byte-string>,
     entry-point :: <byte-string>)
 => (transaction-id)
  let thread = context.runtime-context-thread;

  // If we've been given a thread suitable for interactivity, we know
  // we can use that same thread for any spy activity during the download.
  use-thread-for-spy-functions(application, thread);

  // Now open the interactive transaction, and perform all of the COFF
  // object file processing.
  let transaction
    = open-interactive-transaction(application, coff-files,
                                   runtime-context: context,
                                   dll-name: library,
                                   thread: thread);
  download-all-raw-data(transaction);
  define-all-symbols(transaction);
  perform-all-relocations(transaction);
  perform-all-registrations(transaction);

  // Call the appropriate DM functionality to begin executing interactive
  // Dylan code. This will return a (pre-registered) breakpoint, which we
  // can use as our transaction ID.
  setup-interactor(application, thread, entry-point, library,
                   #"multiple-value")
end method;

///// DOWNLOAD-FOR-INTERACTIVE-EXECUTION-NUB
//    The internal interface must be called on the thread managing the
//    application

define method download-for-interactive-execution-nub
    (context :: <runtime-context>, application :: <debug-target>,
     downloadable-records :: <sequence>, library :: <byte-string>,
     entry-point :: <byte-string>)
 => (transaction-id)
  let thread = context.runtime-context-thread;

  // If we've been given a thread suitable for interactivity, we know
  // we can use that same thread for any spy activity during the
  // download.
  use-thread-for-spy-functions(application, thread);

  let lib = find-library-called(application, library);
  let path = application.debug-target-access-path;
  let (regions, symbols)
    = download-code(path, thread, downloadable-records,
                    lib, entry-point);

  let public-table = application.debug-target-symbol-table;
  for (symbol in symbols)
    debugger-message("Download defined symbol %s", symbol.remote-symbol-name);
    symbol-table-add-symbol(public-table, symbol);
  end for;

  perform-registrations-and-initializations(context, application, thread, regions);

  // Call the appropriate DM functionality to begin executing interactive
  // Dylan code. This will return a (pre-registered) breakpoint, which we
  // can use as our transaction ID.
  setup-interactor(application, thread, entry-point, library,
                   #"multiple-value")
end method;
