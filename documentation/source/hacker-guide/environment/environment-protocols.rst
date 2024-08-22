*********************************
The ENVIRONMENT-PROTOCOLS library
*********************************

.. current-library:: environment-protocols


The ENVIRONMENT-PROTOCOLS module
********************************

.. current-module:: environment-protocols

Server Objects
==============

.. class:: <server>
   :open:
   :abstract:

   :superclasses: :class:`<object>`


.. class:: <closed-server-error>

   :superclasses: :class:`<simple-error>`


.. class:: <invalid-object-error>

   :superclasses: :class:`<simple-error>`

   :keyword required object: An instance of :class:`<environment-object>`.
   :keyword required project: An instance of :class:`<project-object>`.

.. generic-function:: condition-project

   :signature: condition-project (object) => (value)

   :parameter object: An instance of :class:`<invalid-object-error>`.
   :value value: An instance of :class:`<project-object>`.

.. generic-function:: condition-object

   :signature: condition-object (object) => (value)

   :parameter object: An instance of :class:`<invalid-object-error>`.
   :value value: An instance of :class:`<environment-object>`.

.. generic-function:: record-client-query
   :open:

   :signature: record-client-query (server client object type) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter client: An instance of :class:`<object>`.
   :parameter object: An instance of :class:`<object>`.
   :parameter type: An instance of :const:`<query-type>`.

.. method:: record-client-query
   :specializer: <project-object>, <object>, <environment-object>, <query-type>

.. method:: record-client-query
   :specializer: <compiler-database>, <object>, <compiler-object>, <query-type>

.. method:: record-client-query
   :specializer: <application>, <object>, <application-object>, <query-type>

.. generic-function:: server-project
   :open:

   :signature: server-project (server) => (project)

   :parameter server: An instance of :class:`<server>`.
   :value project: An instance of :class:`<project-object>`.

.. method:: server-project
   :specializer: <project-object>

.. method:: server-project
   :specializer: <compiler-database>

.. method:: server-project
   :specializer: <application>

Identifiers
===========

.. class:: <id>
   :abstract:

   :superclasses: :class:`<object>`


.. class:: <library-id>

   :superclasses: :class:`<named-id>`


.. class:: <module-id>

   :superclasses: :class:`<named-id>`

   :keyword required library: An instance of :class:`<library-id>`.

.. class:: <definition-id>

   :superclasses: :class:`<named-id>`

   :keyword required module: An instance of :class:`<module-id>`.

.. class:: <method-id>

   :superclasses: :class:`<unique-id>`

   :keyword required generic-function: An instance of :class:`<definition-id>`.
   :keyword required specializers: An instance of :class:`<simple-object-vector>`.

.. class:: <object-location-id>

   :superclasses: :class:`<id>`

   :keyword required filename: An instance of :class:`<file-locator>`.
   :keyword required line-number: An instance of :class:`<integer>`.

.. class:: <library-object-location-id>

   :superclasses: :class:`<object-location-id>`

   :keyword required library: An instance of :class:`<library-id>`.

.. generic-function:: id-filename

   :signature: id-filename (object) => (value)

   :parameter object: An instance of :class:`<object-location-id>`.
   :value value: An instance of :class:`<file-locator>`.

.. generic-function:: id-generic-function

   :signature: id-generic-function (object) => (value)

   :parameter object: An instance of :class:`<method-id>`.
   :value value: An instance of :class:`<definition-id>`.

.. generic-function:: id-library

   :signature: id-library (object) => (id)

   :parameter object: An instance of :class:`<object>`.
   :value id: An instance of :class:`<library-id>`.

.. method:: id-library
   :specializer: <module-id>

.. method:: id-library
   :specializer: <library-object-location-id>

.. generic-function:: id-line-number

   :signature: id-line-number (object) => (value)

   :parameter object: An instance of :class:`<object-location-id>`.
   :value value: An instance of :class:`<integer>`.

.. generic-function:: id-module

   :signature: id-module (object) => (value)

   :parameter object: An instance of :class:`<definition-id>`.
   :value value: An instance of :class:`<module-id>`.

.. generic-function:: id-name

   :signature: id-name (object) => (value)

   :parameter object: An instance of :class:`<named-id>`.
   :value value: An instance of :class:`<string>`.

.. generic-function:: id-specializers

   :signature: id-specializers (object) => (value)

   :parameter object: An instance of :class:`<method-id>`.
   :value value: An instance of :class:`<simple-object-vector>`.

Environment Objects
===================

.. class:: <environment-object>
   :open:
   :abstract:
   :primary:

   :superclasses: :class:`<object>`

   :keyword library: An instance of :drm:`<object>`.
   :keyword name: An instance of :class:`<string>`, or ``#f``.

.. class:: <environment-object-with-id>
   :open:
   :abstract:
   :primary:

   :superclasses: :class:`<environment-object>`

   :keyword required id: An instance of :class:`<id-or-integer>`, or ``#f``.

.. class:: <environment-object-with-library>
   :open:
   :abstract:

   :superclasses: :class:`<environment-object>`

   :keyword required library: An instance of :class:`<library-object>`.

.. generic-function:: note-object-properties-changed
   :open:

   :signature: note-object-properties-changed (client object type) => ()

   :parameter client: An instance of :class:`<object>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :parameter type: An instance of :const:`<query-type>`.

.. method:: note-object-properties-changed
   :specializer: <project-object>, <environment-object>, <query-type>

.. generic-function:: environment-object-id
   :open:

   :signature: environment-object-id (server object) => (id)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value id: An instance of :class:`<id-or-integer>`, or ``#f``.

.. method:: environment-object-id
   :specializer: <server>, <environment-object>

.. method:: environment-object-id
   :specializer: <server>, <environment-object-with-id>

.. generic-function:: environment-object-exists?
   :open:

   :signature: environment-object-exists? (server object) => (exists?)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value exists?: An instance of :class:`<boolean>`.

.. method:: environment-object-exists?
   :specializer: <project-object>, <environment-object>

.. method:: environment-object-exists?
   :specializer: <project-object>, <application-object>

.. method:: environment-object-exists?
   :specializer: <project-object>, <compiler-object>

.. method:: environment-object-exists?
   :specializer: <project-object>, <application-and-compiler-object>

.. generic-function:: environment-object-primitive-name
   :open:

   :signature: environment-object-primitive-name (server object) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value name: An instance of :class:`<string>`, or ``#f``.

.. method:: environment-object-primitive-name
   :specializer: <server>, <environment-object>

.. method:: environment-object-primitive-name
   :specializer: <server>, <unbound-object>

.. method:: environment-object-primitive-name
   :specializer: <server>, <complex-type-expression-object>

.. method:: environment-object-primitive-name
   :specializer: <server>, <thread-object>

.. generic-function:: get-environment-object-primitive-name
   :open:

   :signature: get-environment-object-primitive-name (server object) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value name: An instance of :class:`<string>`, or ``#f``.

.. method:: get-environment-object-primitive-name
   :specializer: <server>, <environment-object>

.. method:: get-environment-object-primitive-name
   :specializer: <project-object>, <environment-object>

.. method:: get-environment-object-primitive-name
   :specializer: <project-object>, <boolean-object>

.. method:: get-environment-object-primitive-name
   :specializer: <project-object>, <duim-object>

.. method:: get-environment-object-primitive-name
   :specializer: <project-object>, <duim-frame>

.. method:: get-environment-object-primitive-name
   :specializer: <project-object>, <duim-gadget>

.. generic-function:: environment-object-basic-name
   :open:

   :signature: environment-object-basic-name (server object #key #all-keys) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value name: An instance of :class:`<string>`, or ``#f``.

.. method:: environment-object-basic-name
   :specializer: <server>, <environment-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <module-name-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <binding-name-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <user-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <collection-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <character-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <string-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <symbol-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <boolean-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <number-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <library-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <project-object>

.. method:: environment-object-basic-name
   :specializer: <server>, <warning-object>

.. generic-function:: environment-object-display-name
   :open:

   :signature: environment-object-display-name (server object namespace #key #all-keys) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :parameter namespace: An instance of :class:`<namespace-object>`, or ``#f``.
   :value name: An instance of :class:`<string>`, or ``#f``.

.. method:: environment-object-display-name
   :specializer: <server>, <environment-object>, false-or(<namespace-object>)

.. generic-function:: environment-object-unique-name
   :open:

   :signature: environment-object-unique-name (server object namespace #key #all-keys) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :parameter namespace: An instance of :class:`<namespace-object>`, or ``#f``.
   :value name: An instance of :class:`<string>`.

.. method:: environment-object-unique-name
   :specializer: <server>, <environment-object>, false-or(<namespace-object>)

.. method:: environment-object-unique-name
   :specializer: <server>, <project-object>, false-or(<namespace-object>)

.. method:: environment-object-unique-name
   :specializer: <server>, <definition-object>, false-or(<namespace-object>)

.. method:: environment-object-unique-name
   :specializer: <server>, <module-object>, false-or(<namespace-object>)

.. method:: environment-object-unique-name
   :specializer: <server>, <library-object>, false-or(<namespace-object>)

.. method:: environment-object-unique-name
   :specializer: <server>, <domain-object>, false-or(<namespace-object>)

.. method:: environment-object-unique-name
   :specializer: <server>, <method-object>, false-or(<namespace-object>)

.. generic-function:: environment-object-type
   :open:

   :signature: environment-object-type (server object) => (type)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value type: An instance of :class:`<environment-object>`, or ``#f``.

.. method:: environment-object-type
   :specializer: <server>, <environment-object>

.. method:: environment-object-type
   :specializer: <server>, <variable-object>

.. method:: environment-object-type
   :specializer: <server>, <application-object>

.. method:: environment-object-type
   :specializer: <server>, <slot-object>

.. generic-function:: environment-object-type-name
   :open:

   :signature: environment-object-type-name (object) => (type-name)

   :parameter object: An instance of :class:`<environment-object>`.
   :value type-name: An instance of :class:`<string>`.

.. method:: environment-object-type-name
   :specializer: <environment-object>

.. method:: environment-object-type-name
   :specializer: <project-object>

.. method:: environment-object-type-name
   :specializer: <name-object>

.. method:: environment-object-type-name
   :specializer: <compiler-database>

.. method:: environment-object-type-name
   :specializer: <application>

.. method:: environment-object-type-name
   :specializer: <user-object>

.. method:: environment-object-type-name
   :specializer: <foreign-object>

.. method:: environment-object-type-name
   :specializer: <number-object>

.. method:: environment-object-type-name
   :specializer: <integer-object>

.. method:: environment-object-type-name
   :specializer: <character-object>

.. method:: environment-object-type-name
   :specializer: <string-object>

.. method:: environment-object-type-name
   :specializer: <boolean-object>

.. method:: environment-object-type-name
   :specializer: <symbol-object>

.. method:: environment-object-type-name
   :specializer: <collection-object>

.. method:: environment-object-type-name
   :specializer: <pair-object>

.. method:: environment-object-type-name
   :specializer: <range-object>

.. method:: environment-object-type-name
   :specializer: <top-level-expression-object>

.. method:: environment-object-type-name
   :specializer: <simple-macro-call-object>

.. method:: environment-object-type-name
   :specializer: <expression-object>

.. method:: environment-object-type-name
   :specializer: <type-expression-object>

.. method:: environment-object-type-name
   :specializer: <complex-type-expression-object>

.. method:: environment-object-type-name
   :specializer: <thread-object>

.. method:: environment-object-type-name
   :specializer: <library-object>

.. method:: environment-object-type-name
   :specializer: <module-object>

.. method:: environment-object-type-name
   :specializer: <macro-object>

.. method:: environment-object-type-name
   :specializer: <global-variable-object>

.. method:: environment-object-type-name
   :specializer: <thread-variable-object>

.. method:: environment-object-type-name
   :specializer: <constant-object>

.. method:: environment-object-type-name
   :specializer: <generic-function-object>

.. method:: environment-object-type-name
   :specializer: <method-object>

.. method:: environment-object-type-name
   :specializer: <method-constant-object>

.. method:: environment-object-type-name
   :specializer: <foreign-function-object>

.. method:: environment-object-type-name
   :specializer: <domain-object>

.. method:: environment-object-type-name
   :specializer: <type-object>

.. method:: environment-object-type-name
   :specializer: <singleton-object>

.. method:: environment-object-type-name
   :specializer: <class-object>

.. method:: environment-object-type-name
   :specializer: <slot-object>

.. method:: environment-object-type-name
   :specializer: <local-variable-object>

.. method:: environment-object-type-name
   :specializer: <stack-frame-object>

.. method:: environment-object-type-name
   :specializer: <restart-object>

.. method:: environment-object-type-name
   :specializer: <condition-object>

.. method:: environment-object-type-name
   :specializer: <duim-sheet>

.. method:: environment-object-type-name
   :specializer: <duim-frame>

.. method:: environment-object-type-name
   :specializer: <duim-gadget>

.. method:: environment-object-type-name
   :specializer: <warning-object>

.. method:: environment-object-type-name
   :specializer: <serious-compiler-warning-object>

.. method:: environment-object-type-name
   :specializer: <compiler-error-object>

.. generic-function:: environment-object-source
   :open:

   :signature: environment-object-source (server object) => (source)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value source: An instance of :class:`<string>`, or ``#f``.

.. method:: environment-object-source
   :specializer: <server>, <environment-object>

.. method:: environment-object-source
   :specializer: <project-object>, <compiler-object>

.. method:: environment-object-source
   :specializer: <server>, <compiler-warning-object>

.. generic-function:: environment-object-source-location
   :open:

   :signature: environment-object-source-location (server object) => (location)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value location: An instance of :class:`<source-location>`, or ``#f``.

.. method:: environment-object-source-location
   :specializer: <project-object>, <environment-object>

.. method:: environment-object-source-location
   :specializer: <server>, <environment-object>

.. method:: environment-object-source-location
   :specializer: <project-object>, <source-location-breakpoint-object>

.. method:: environment-object-source-location
   :specializer: <project-object>, <function-breakpoint-object>

.. method:: environment-object-source-location
   :specializer: <project-object>, <stack-frame-object>

.. generic-function:: environment-object-home-server?

   :signature: environment-object-home-server? (project object) => (home?)

   :parameter project: An instance of :class:`<object>`.
   :parameter object: An instance of :class:`<object>`.
   :value home?: An instance of :class:`<boolean>`.

.. method:: environment-object-home-server?
   :specializer: <project-object>, <application-object>

.. method:: environment-object-home-server?
   :specializer: <project-object>, <compiler-object>

.. method:: environment-object-home-server?
   :specializer: <project-object>, <application-and-compiler-object>

.. method:: environment-object-home-server?
   :specializer: <compiler-database>, <compiler-object>

.. method:: environment-object-home-server?
   :specializer: <application>, <application-object>

.. generic-function:: environment-object-home-name
   :open:

   :signature: environment-object-home-name (server object) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value name: An instance of :class:`<name-object>`, or ``#f``.

.. method:: environment-object-home-name
   :specializer: <project-object>, <environment-object>

.. method:: environment-object-home-name
   :specializer: <project-object>, <compiler-object>

.. method:: environment-object-home-name
   :specializer: <server>, <environment-object>

.. method:: environment-object-home-name
   :specializer: <project-object>, <compiler-warning-object>

.. generic-function:: environment-object-name
   :open:

   :signature: environment-object-name (server object namespace) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :parameter namespace: An instance of :class:`<namespace-object>`.
   :value name: An instance of :class:`<name-object>`, or ``#f``.

.. method:: environment-object-name
   :specializer: <project-object>, <environment-object>, <namespace-object>

.. method:: environment-object-name
   :specializer: <project-object>, <compiler-object>, <namespace-object>

.. method:: environment-object-name
   :specializer: <server>, <environment-object>, <namespace-object>

.. method:: environment-object-name
   :specializer: <project-object>, <compiler-warning-object>, <namespace-object>

.. generic-function:: environment-object-library
   :open:

   :signature: environment-object-library (server object) => (library)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value library: An instance of :class:`<library-object>`, or ``#f``.

.. method:: environment-object-library
   :specializer: <project-object>, <environment-object>

.. method:: environment-object-library
   :specializer: <project-object>, <environment-object-with-library>

.. method:: environment-object-library
   :specializer: <server>, <environment-object>

.. method:: environment-object-library
   :specializer: <server>, <environment-object-breakpoint-object>

.. method:: environment-object-library
   :specializer: <server>, <source-location-breakpoint-object>

.. generic-function:: find-environment-object
   :open:

   :signature: find-environment-object (server name #key #all-keys) => (object)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of ``type-union(<string>, <id-or-integer>)``.
   :value object: An instance of :class:`<environment-object>`, or ``#f``.

.. method:: find-environment-object
   :specializer: <server>, <id>

.. method:: find-environment-object
   :specializer: <server>, <integer>

.. method:: find-environment-object
   :specializer: <server>, <string>

.. method:: find-environment-object
   :specializer: <project-object>, <definition-id>

.. method:: find-environment-object
   :specializer: <project-object>, <integer>

.. generic-function:: make-environment-object

   :signature: make-environment-object (class #key project library id application-object-proxy compiler-object-proxy) => (object)

   :parameter class: An instance of ``subclass(<environment-object>)``.
   :parameter #key project: An instance of :class:`<project-object>`.
   :parameter #key library: An instance of :class:`<library-object>`, or ``#f``.
   :parameter #key id: An instance of :class:`<id-or-integer>`, or ``#f``.
   :parameter #key application-object-proxy: An instance of :class:`<object>`.
   :parameter #key compiler-object-proxy: An instance of :class:`<object>`.
   :value object: An instance of :class:`<environment-object>`.

.. method:: make-environment-object
   :specializer: subclass(<application-object>)

.. method:: make-environment-object
   :specializer: subclass(<compiler-object>)

.. method:: make-environment-object
   :specializer: subclass(<application-and-compiler-object>)

.. generic-function:: parse-environment-object-name

   :signature: parse-environment-object-name (name #key module library #all-keys) => (id)

   :parameter name: An instance of :class:`<string>`.
   :parameter #key module: An instance of :class:`<module-id>`, or ``#f``.
   :parameter #key library: An instance of :class:`<library-id>`, or ``#f``.
   :value id: An instance of :class:`<id-or-integer>`, or ``#f``.

.. generic-function:: parse-module-name

   :signature: parse-module-name (name #key library) => (id)

   :parameter name: An instance of :class:`<string>`.
   :parameter #key library: An instance of :class:`<library-id>`, or ``#f``.
   :value id: An instance of :class:`<module-id>`, or ``#f``.

.. generic-function:: print-environment-object
   :open:

   :signature: print-environment-object (stream server object #key #all-keys) => ()

   :parameter stream: An instance of :class:`<stream>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.

.. method:: print-environment-object
   :specializer: <stream>, <server>, <environment-object>

.. generic-function:: print-environment-object-to-string

   :signature: print-environment-object-to-string (server object #rest args #key namespace #all-keys) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :parameter #rest args: An instance of :class:`<object>`.
   :parameter #key namespace: An instance of :class:`<object>`.
   :value name: An instance of :class:`<string>`.

.. generic-function:: print-environment-object-name
   :open:

   :signature: print-environment-object-name (stream server object #key #all-keys) => ()

   :parameter stream: An instance of :class:`<stream>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.

.. method:: print-environment-object-name
   :specializer: <stream>, <server>, <environment-object>

.. method:: print-environment-object-name
   :specializer: <stream>, <server>, <module-name-object>

.. method:: print-environment-object-name
   :specializer: <stream>, <server>, <binding-name-object>

.. method:: print-environment-object-name
   :specializer: <stream>, <server>, <method-object>

.. method:: print-environment-object-name
   :specializer: <stream>, <server>, <domain-object>

.. method:: print-environment-object-name
   :specializer: <stream>, <server>, <singleton-object>

.. method:: print-environment-object-name
   :specializer: <stream>, <server>, <warning-object>

.. method:: print-environment-object-name
   :specializer: <stream>, <server>, <thread-object>

.. generic-function:: print-environment-object-name-to-string

   :signature: print-environment-object-name-to-string (server object #rest args #key namespace #all-keys) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :parameter #rest args: An instance of :class:`<object>`.
   :parameter #key namespace: An instance of :class:`<object>`.
   :value name: An instance of :class:`<string>`.

.. generic-function:: source-location-environment-object
   :open:

   :signature: source-location-environment-object (server location) => (object)

   :parameter server: An instance of :class:`<server>`.
   :parameter location: An instance of :class:`<source-location>`.
   :value object: An instance of :class:`<environment-object>`, or ``#f``.

.. method:: source-location-environment-object
   :specializer: <project-object>, <source-location>

.. method:: source-location-environment-object
   :specializer: <server>, <source-location>

Environment Options
===================

.. class:: <environment-options>

   :superclasses: :class:`<environment-object>`

Compiler Objects
================

.. class:: <compiler-object>
   :abstract:

   :superclasses: :class:`<environment-object>`

   :keyword required compiler-object-proxy: An instance of :class:`<object>`.

.. generic-function:: compiler-object-proxy

   :signature: compiler-object-proxy (object) => (value)

   :parameter object: An instance of :class:`<compiler-object>`.
   :value value: An instance of :class:`<object>`.

.. generic-function:: invalidate-compiler-proxy
   :open:

   :signature: invalidate-compiler-proxy (server object) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<compiler-object>`.

.. method:: invalidate-compiler-proxy
   :specializer: <project-object>, <compiler-object>

Application Objects
===================

.. class:: <application-object>
   :abstract:

   :superclasses: :class:`<environment-object>`

   :keyword application-object-proxy: An instance of :class:`<object>`.

.. class:: <application-code-object>
   :abstract:

   :superclasses: :class:`<application-object>`


.. generic-function:: application-object-class
   :open:

   :signature: application-object-class (server object) => (class)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<application-object>`.
   :value class: An instance of :class:`<class-object>`, or ``#f``.

.. method:: application-object-class
   :specializer: <project-object>, <boolean-object>

.. method:: application-object-class
   :specializer: <project-object>, <application-object>

.. generic-function:: application-object-proxy

   :signature: application-object-proxy (object) => (value)

   :parameter object: An instance of :class:`<application-object>`.
   :value value: An instance of :class:`<object>`.

.. generic-function:: application-object-proxy-setter

   :signature: application-object-proxy-setter (value object) => (value)

   :parameter value: An instance of :class:`<object>`.
   :parameter object: An instance of :class:`<application-object>`.
   :value value: An instance of :class:`<object>`.

.. generic-function:: application-object-address
   :open:

   :signature: application-object-address (server object) => (address)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<application-object>`.
   :value address: An instance of :class:`<address-object>`, or ``#f``.

.. method:: application-object-address
   :specializer: <project-object>, <application-object>

.. generic-function:: invalidate-application-proxy
   :open:

   :signature: invalidate-application-proxy (server object) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<application-object>`.

.. method:: invalidate-application-proxy
   :specializer: <project-object>, <application-object>

Unbound Objects
===============

.. class:: <unbound-object>

   :superclasses: :class:`<application-object>`


.. constant:: $unbound-object

Address Objects
===============

.. constant:: <address-display-format>

.. constant:: <data-display-format>

.. constant:: <data-display-size>

.. class:: <address-object>

   :superclasses: :class:`<application-object>`


.. constant:: $invalid-address-object

.. generic-function:: address-application-object
   :open:

   :signature: address-application-object (server addr) => (obj)

   :parameter server: An instance of :class:`<server>`.
   :parameter addr: An instance of :class:`<address-object>`.
   :value obj: An instance of :class:`<application-object>`.

.. method:: address-application-object
   :specializer: <project-object>, <address-object>

.. generic-function:: address-to-string
   :open:

   :signature: address-to-string (server address #key format) => (s)

   :parameter server: An instance of :class:`<server>`.
   :parameter address: An instance of :class:`<address-object>`.
   :parameter #key format: An instance of :const:`<address-display-format>`.
   :value s: An instance of :class:`<string>`.

.. method:: address-to-string
   :specializer: <project-object>, <address-object>

.. generic-function:: string-to-address
   :open:

   :signature: string-to-address (server str #key format) => (addr)

   :parameter server: An instance of :class:`<server>`.
   :parameter str: An instance of :class:`<string>`.
   :parameter #key format: An instance of :const:`<address-display-format>`.
   :value addr: An instance of :class:`<address-object>`.

.. method:: string-to-address
   :specializer: <project-object>, <string>

.. generic-function:: indirect-address
   :open:

   :signature: indirect-address (server addr) => (i-addr)

   :parameter server: An instance of :class:`<server>`.
   :parameter addr: An instance of :class:`<address-object>`.
   :value i-addr: An instance of :class:`<address-object>`.

.. method:: indirect-address
   :specializer: <project-object>, <address-object>

.. generic-function:: indexed-address
   :open:

   :signature: indexed-address (server addr i #key size) => (i-addr)

   :parameter server: An instance of :class:`<server>`.
   :parameter addr: An instance of :class:`<address-object>`.
   :parameter i: An instance of :class:`<integer>`.
   :parameter #key size: An instance of :const:`<data-display-size>`.
   :value i-addr: An instance of :class:`<address-object>`.

.. method:: indexed-address
   :specializer: <project-object>, <address-object>, <integer>

.. generic-function:: address-read-memory-contents
   :open:

   :signature: address-read-memory-contents (server addr #key size format from-index to-index) => (printable-strings nxt)

   :parameter server: An instance of :class:`<server>`.
   :parameter addr: An instance of :class:`<address-object>`.
   :parameter #key size: An instance of :const:`<data-display-size>`.
   :parameter #key format: An instance of :const:`<data-display-format>`.
   :parameter #key from-index: An instance of :class:`<integer>`.
   :parameter #key to-index: An instance of :class:`<integer>`.
   :value printable-strings: An instance of :class:`<sequence>`.
   :value nxt: An instance of :class:`<address-object>`.

.. method:: address-read-memory-contents
   :specializer: <project-object>, <address-object>

.. generic-function:: address-read-application-object
   :open:

   :signature: address-read-application-object (server addr) => (obj)

   :parameter server: An instance of :class:`<server>`.
   :parameter addr: An instance of :class:`<address-object>`.
   :value obj: An instance of :class:`<application-object>`, or ``#f``.

.. method:: address-read-application-object
   :specializer: <project-object>, <address-object>

Register Objects
================

.. constant:: <register-category>

.. class:: <register-object>

   :superclasses: :class:`<application-object>`


.. function:: application-registers

   :signature: application-registers (server #key category) => (classes)

   :parameter server: An instance of :class:`<server>`.
   :parameter #key category: An instance of :class:`<object>`.
   :value classes: An instance of :class:`<sequence>`.

.. generic-function:: do-application-registers
   :open:

   :signature: do-application-registers (f server #key category) => ()

   :parameter f: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter #key category: An instance of :class:`<object>`.

.. method:: do-application-registers
   :specializer: <function>, <project-object>

.. generic-function:: register-contents
   :open:

   :signature: register-contents (server reg thread #key stack-frame-context) => (obj)

   :parameter server: An instance of :class:`<server>`.
   :parameter reg: An instance of :class:`<register-object>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :parameter #key stack-frame-context: An instance of :class:`<object>`.
   :value obj: An instance of :class:`<application-object>`, or ``#f``.

.. method:: register-contents
   :specializer: <project-object>, <register-object>, <thread-object>

.. generic-function:: register-contents-address
   :open:

   :signature: register-contents-address (server reg thread #key stack-frame-context) => (obj)

   :parameter server: An instance of :class:`<server>`.
   :parameter reg: An instance of :class:`<register-object>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :parameter #key stack-frame-context: An instance of :class:`<object>`.
   :value obj: An instance of :class:`<address-object>`, or ``#f``.

.. method:: register-contents-address
   :specializer: <project-object>, <register-object>, <thread-object>

.. generic-function:: lookup-register-by-name
   :open:

   :signature: lookup-register-by-name (server name) => (reg)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of :class:`<string>`.
   :value reg: An instance of :class:`<register-object>`, or ``#f``.

.. method:: lookup-register-by-name
   :specializer: <project-object>, <string>

Component Objects
=================

.. class:: <component-object>

   :superclasses: :class:`<application-object>`


.. generic-function:: component-image-filename
   :open:

   :signature: component-image-filename (server component) => (file)

   :parameter server: An instance of :class:`<server>`.
   :parameter component: An instance of :class:`<component-object>`.
   :value file: An instance of :class:`<file-locator>`, or ``#f``.

.. method:: component-image-filename
   :specializer: <project-object>, <component-object>

.. generic-function:: component-version
   :open:

   :signature: component-version (server component) => (major-version-index minor-version-index)

   :parameter server: An instance of :class:`<server>`.
   :parameter component: An instance of :class:`<component-object>`.
   :value major-version-index: An instance of :class:`<integer>`.
   :value minor-version-index: An instance of :class:`<integer>`.

.. method:: component-version
   :specializer: <project-object>, <component-object>

.. function:: component-version-string

   :signature: component-version-string (server component) => (version-string)

   :parameter server: An instance of :class:`<server>`.
   :parameter component: An instance of :class:`<component-object>`.
   :value version-string: An instance of :class:`<string>`.

.. function:: application-components

   :signature: application-components (server) => (components)

   :parameter server: An instance of :class:`<server>`.
   :value components: An instance of :class:`<sequence>`.

.. generic-function:: do-application-components
   :open:

   :signature: do-application-components (f server) => ()

   :parameter f: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.

.. method:: do-application-components
   :specializer: <function>, <project-object>

Application and Compiler Objects
================================

.. class:: <application-and-compiler-object>
   :open:
   :abstract:

   :superclasses: :class:`<application-object>`, :class:`<compiler-object>`

Composite Objects
=================

.. class:: <composite-object>
   :abstract:

   :superclasses: :class:`<application-object>`


.. generic-function:: composite-object-size
   :open:

   :signature: composite-object-size (server object #key inherited?) => (size)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<composite-object>`.
   :parameter #key inherited?: An instance of :class:`<object>`.
   :value size: An instance of :class:`<integer>`, or ``#f``.

.. method:: composite-object-size
   :specializer: <project-object>, <composite-object>

.. generic-function:: composite-object-contents
   :open:

   :signature: composite-object-contents (server object #key inherited?) => (names values)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<composite-object>`.
   :parameter #key inherited?: An instance of :class:`<object>`.
   :value names: An instance of :class:`<sequence>`.
   :value values: An instance of :class:`<sequence>`.

.. method:: composite-object-contents
   :specializer: <project-object>, <composite-object>

User Objects
============

.. class:: <user-object>

   :superclasses: :class:`<composite-object>`, :class:`<environment-object-with-id>`


.. generic-function:: user-object-slot-value
   :open:

   :signature: user-object-slot-value (server obj slot #key repeated-element) => (value)

   :parameter server: An instance of :class:`<server>`.
   :parameter obj: An instance of :class:`<user-object>`.
   :parameter slot: An instance of ``type-union(<definition-id>, <slot-object>)``.
   :parameter #key repeated-element: An instance of :class:`<object>`.
   :value value: An instance of :class:`<environment-object>`, or ``#f``.

.. method:: user-object-slot-value
   :specializer: <project-object>, <user-object>, <slot-object>

.. method:: user-object-slot-value
   :specializer: <project-object>, <user-object>, <definition-id>

.. generic-function:: user-object-slot-values
   :open:

   :signature: user-object-slot-values (server object) => (functions values)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<user-object>`.
   :value functions: An instance of :class:`<sequence>`.
   :value values: An instance of :class:`<sequence>`.

.. method:: user-object-slot-values
   :specializer: <project-object>, <user-object>

User Class Info
===============

.. class:: <user-class-info>

   :superclasses: :class:`<object>`

   :keyword required class: An instance of :class:`<class>`.
   :keyword required id: An instance of :class:`<definition-id>`.

.. generic-function:: user-class-info-class

   :signature: user-class-info-class (object) => (value)

   :parameter object: An instance of :class:`<user-class-info>`.
   :value value: An instance of :class:`<class>`.

.. generic-function:: user-class-info-id

   :signature: user-class-info-id (object) => (value)

   :parameter object: An instance of :class:`<user-class-info>`.
   :value value: An instance of :class:`<definition-id>`.

.. function:: user-object-class-mappings

   :signature: user-object-class-mappings () => (mappings)

   :value mappings: An instance of :class:`<sequence>`.

Internal Objects
================

.. class:: <internal-object>

   :superclasses: :class:`<user-object>`

Foreign Objects
===============

.. class:: <foreign-object>

   :superclasses: :class:`<application-code-object>`

Dylan Objects
=============

.. class:: <dylan-object>
   :open:
   :abstract:

   :superclasses: :class:`<environment-object>`


.. class:: <dylan-application-object>
   :open:
   :abstract:

   :superclasses: :class:`<dylan-object>`, :class:`<application-object>`


.. class:: <immediate-application-object>
   :open:
   :abstract:

   :superclasses: :class:`<dylan-application-object>`


.. class:: <dylan-compiler-object>
   :open:
   :abstract:

   :superclasses: :class:`<dylan-object>`, :class:`<compiler-object>`


.. constant:: $dylan-library-id

.. constant:: $dylan-module-id

.. constant:: $dylan-extensions-module-id

.. constant:: $dispatch-engine-module-id

.. constant:: $<object>-id

.. constant:: $<class>-id

.. constant:: $<method>-id

.. constant:: $<generic-function>-id

Dylan Expression Objects
========================

.. class:: <expression-object>
   :open:
   :abstract:

   :superclasses: :class:`<dylan-compiler-object>`


.. class:: <type-expression-object>
   :open:

   :superclasses: :class:`<expression-object>`


.. class:: <complex-type-expression-object>
   :open:

   :superclasses: :class:`<type-expression-object>`

Dylan Application Objects
=========================

.. class:: <character-object>

   :superclasses: :class:`<immediate-application-object>`


.. class:: <string-object>

   :superclasses: :class:`<sequence-object>`


.. class:: <symbol-object>

   :superclasses: :class:`<dylan-application-object>`


.. class:: <number-object>

   :superclasses: :class:`<immediate-application-object>`


.. class:: <integer-object>

   :superclasses: :class:`<number-object>`


.. generic-function:: number-object-to-string
   :open:

   :signature: number-object-to-string (server number #key prefix? format) => (string)

   :parameter server: An instance of :class:`<server>`.
   :parameter number: An instance of :class:`<number-object>`.
   :parameter #key prefix?: An instance of :class:`<boolean>`.
   :parameter #key format: An instance of :class:`<symbol>`, or ``#f``.
   :value string: An instance of :class:`<string>`, or ``#f``.

.. method:: number-object-to-string
   :specializer: <project-object>, <number-object>

Boolean Objects
===============

.. class:: <boolean-object>

   :superclasses: :class:`<immediate-application-object>`

   :keyword required true?: An instance of :class:`<boolean>`.

.. generic-function:: boolean-object-true?

   :signature: boolean-object-true? (object) => (value)

   :parameter object: An instance of :class:`<boolean-object>`.
   :value value: An instance of :class:`<boolean>`.

.. constant:: $true-object

.. constant:: $false-object

Collection Objects
==================

.. class:: <collection-object>

   :superclasses: :class:`<composite-object>`, :class:`<dylan-application-object>`


.. class:: <sequence-object>

   :superclasses: :class:`<collection-object>`


.. class:: <explicit-key-collection-object>

   :superclasses: :class:`<internal-object>`, :class:`<collection-object>`


.. class:: <array-object>

   :superclasses: :class:`<sequence-object>`


.. class:: <range-object>

   :superclasses: :class:`<user-object>`, :class:`<sequence-object>`


.. class:: <pair-object>

   :superclasses: :class:`<user-object>`


.. generic-function:: collection-size
   :open:

   :signature: collection-size (server collection) => (size)

   :parameter server: An instance of :class:`<server>`.
   :parameter collection: An instance of :class:`<collection-object>`.
   :value size: An instance of :class:`<integer>`, or ``#f``.

.. method:: collection-size
   :specializer: <project-object>, <collection-object>

.. generic-function:: collection-keys
   :open:

   :signature: collection-keys (server collection #key range) => (keys)

   :parameter server: An instance of :class:`<server>`.
   :parameter collection: An instance of :class:`<collection-object>`.
   :parameter #key range: An instance of :class:`<object>`.
   :value keys: An instance of :class:`<sequence>`, or ``#f``.

.. method:: collection-keys
   :specializer: <project-object>, <collection-object>

.. generic-function:: collection-elements
   :open:

   :signature: collection-elements (server collection #key range) => (elements)

   :parameter server: An instance of :class:`<server>`.
   :parameter collection: An instance of :class:`<collection-object>`.
   :parameter #key range: An instance of :class:`<object>`.
   :value elements: An instance of :class:`<sequence>`, or ``#f``.

.. method:: collection-elements
   :specializer: <project-object>, <collection-object>

.. generic-function:: do-collection-keys
   :open:

   :signature: do-collection-keys (function server collection) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter collection: An instance of :class:`<collection-object>`.

.. method:: do-collection-keys
   :specializer: <function>, <project-object>, <collection-object>

.. generic-function:: do-collection-elements
   :open:

   :signature: do-collection-elements (function server collection) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter collection: An instance of :class:`<collection-object>`.

.. method:: do-collection-elements
   :specializer: <function>, <project-object>, <collection-object>

.. generic-function:: range-start
   :open:

   :signature: range-start (server range) => (_start)

   :parameter server: An instance of :class:`<server>`.
   :parameter range: An instance of :class:`<range-object>`.
   :value _start: An instance of :class:`<number-object>`, or ``#f``.

.. method:: range-start
   :specializer: <project-object>, <range-object>

.. generic-function:: range-end
   :open:

   :signature: range-end (server range) => (_end)

   :parameter server: An instance of :class:`<server>`.
   :parameter range: An instance of :class:`<range-object>`.
   :value _end: An instance of :class:`<number-object>`, or ``#f``.

.. method:: range-end
   :specializer: <project-object>, <range-object>

.. generic-function:: range-by
   :open:

   :signature: range-by (server range) => (by)

   :parameter server: An instance of :class:`<server>`.
   :parameter range: An instance of :class:`<range-object>`.
   :value by: An instance of :class:`<number-object>`, or ``#f``.

.. method:: range-by
   :specializer: <project-object>, <range-object>

.. generic-function:: pair-head
   :open:

   :signature: pair-head (server pair) => (head)

   :parameter server: An instance of :class:`<server>`.
   :parameter pair: An instance of :class:`<pair-object>`.
   :value head: An instance of :class:`<application-object>`, or ``#f``.

.. method:: pair-head
   :specializer: <project-object>, <pair-object>

.. generic-function:: pair-tail
   :open:

   :signature: pair-tail (server pair) => (head)

   :parameter server: An instance of :class:`<server>`.
   :parameter pair: An instance of :class:`<pair-object>`.
   :value head: An instance of :class:`<application-object>`, or ``#f``.

.. method:: pair-tail
   :specializer: <project-object>, <pair-object>

Source Forms
============

.. class:: <source-form-object>
   :open:
   :abstract:

   :superclasses: :class:`<application-code-object>`, :class:`<application-and-compiler-object>`, :class:`<environment-object-with-id>`


.. generic-function:: do-used-definitions
   :open:

   :signature: do-used-definitions (function server object #key modules libraries client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<source-form-object>`.
   :parameter #key modules: An instance of :class:`<object>`.
   :parameter #key libraries: An instance of :class:`<object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-used-definitions
   :specializer: <function>, <project-object>, <source-form-object>

.. generic-function:: do-client-source-forms
   :open:

   :signature: do-client-source-forms (function server object #key modules libraries client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<source-form-object>`.
   :parameter #key modules: An instance of :class:`<object>`.
   :parameter #key libraries: An instance of :class:`<object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-client-source-forms
   :specializer: <function>, <project-object>, <source-form-object>

.. generic-function:: source-form-has-clients?
   :open:

   :signature: source-form-has-clients? (server object #key modules libraries client) => (has-clients?)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<source-form-object>`.
   :parameter #key modules: An instance of :class:`<object>`.
   :parameter #key libraries: An instance of :class:`<object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :value has-clients?: An instance of :class:`<boolean>`.

.. method:: source-form-has-clients?
   :specializer: <project-object>, <source-form-object>

.. generic-function:: source-form-uses-definitions?
   :open:

   :signature: source-form-uses-definitions? (server object #key modules libraries client) => (uses-definitions?)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<source-form-object>`.
   :parameter #key modules: An instance of :class:`<object>`.
   :parameter #key libraries: An instance of :class:`<object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :value uses-definitions?: An instance of :class:`<boolean>`.

.. method:: source-form-uses-definitions?
   :specializer: <project-object>, <source-form-object>

.. function:: source-form-used-definitions

   :signature: source-form-used-definitions (server source-form #key libraries modules client) => (used-definitions)

   :parameter server: An instance of :class:`<server>`.
   :parameter source-form: An instance of :class:`<source-form-object>`.
   :parameter #key libraries: An instance of :class:`<object>`.
   :parameter #key modules: An instance of :class:`<object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :value used-definitions: An instance of :class:`<sequence>`.

.. function:: source-form-clients

   :signature: source-form-clients (server source-form #key libraries modules client) => (clients)

   :parameter server: An instance of :class:`<server>`.
   :parameter source-form: An instance of :class:`<source-form-object>`.
   :parameter #key libraries: An instance of :class:`<object>`.
   :parameter #key modules: An instance of :class:`<object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :value clients: An instance of :class:`<sequence>`.

Macro Calls
===========

.. class:: <macro-call-object>
   :abstract:

   :superclasses: :class:`<source-form-object>`


.. generic-function:: do-macro-call-source-forms
   :open:

   :signature: do-macro-call-source-forms (function server object) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<macro-call-object>`.

.. method:: do-macro-call-source-forms
   :specializer: <function>, <project-object>, <macro-call-object>

.. function:: macro-call-source-forms

   :signature: macro-call-source-forms (server source-form) => (source-forms)

   :parameter server: An instance of :class:`<server>`.
   :parameter source-form: An instance of :class:`<macro-call-object>`.
   :value source-forms: An instance of :class:`<sequence>`.

Non-definition Source Forms
===========================

.. class:: <simple-macro-call-object>

   :superclasses: :class:`<top-level-expression-object>`, :class:`<macro-call-object>`


.. class:: <top-level-expression-object>

   :superclasses: :class:`<source-form-object>`


Definition Objects
==================

.. class:: <definition-object>
   :open:
   :abstract:

   :superclasses: :class:`<macro-call-object>`, :class:`<dylan-object>`, :class:`<environment-object-with-id>`


.. generic-function:: definition-modifiers
   :open:

   :signature: definition-modifiers (server object) => (modifiers)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<definition-object>`.
   :value modifiers: An instance of :class:`<sequence>`.

.. method:: definition-modifiers
   :specializer: <project-object>, <definition-object>

.. generic-function:: definition-interactive-locations
   :open:

   :signature: definition-interactive-locations (server object) => (locations)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<definition-object>`.
   :value locations: An instance of :class:`<sequence>`.

.. method:: definition-interactive-locations
   :specializer: <project-object>, <definition-object>

.. generic-function:: definition-known-locations
   :open:

   :signature: definition-known-locations (server object) => (locations)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<definition-object>`.
   :value locations: An instance of :class:`<sequence>`.

.. method:: definition-known-locations
   :specializer: <project-object>, <definition-object>

.. function:: find-named-definition

   :signature: find-named-definition (project module name #key imported?) => (definition)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter module: An instance of :class:`<module-object>`.
   :parameter name: An instance of :class:`<string>`.
   :parameter #key imported?: An instance of :class:`<object>`.
   :value definition: An instance of :class:`<definition-object>`, or ``#f``.

Breakpoints
===========

.. class:: <breakpoint-object>
   :abstract:

   :superclasses: :class:`<application-object>`

   :keyword enabled?: An instance of :class:`<boolean>`.
   :keyword library: An instance of :class:`<library-object>`, or ``#f``.
   :keyword message?: An instance of :class:`<string>`, or ``#f``.
   :keyword object: An instance of :class:`<object>`.
   :keyword profile?: An instance of :class:`<boolean>`.
   :keyword required project: An instance of :class:`<project-object>`.
   :keyword stop?: An instance of :class:`<boolean>`.
   :keyword test: An instance of :class:`<object>`.
   :keyword transient?: An instance of :class:`<boolean>`.

.. class:: <environment-object-breakpoint-object>
   :abstract:

   :superclasses: :class:`<breakpoint-object>`


.. class:: <class-breakpoint-object>

   :superclasses: :class:`<environment-object-breakpoint-object>`


.. class:: <function-breakpoint-object>
   :abstract:

   :superclasses: :class:`<environment-object-breakpoint-object>`

   :keyword directions: An instance of :class:`<sequence>`.
   :keyword entry-function?: An instance of :class:`<boolean>`.
   :keyword entry-point?: An instance of :class:`<boolean>`.

.. class:: <simple-function-breakpoint-object>

   :superclasses: :class:`<function-breakpoint-object>`


.. class:: <generic-function-breakpoint-object>

   :superclasses: :class:`<function-breakpoint-object>`


.. class:: <method-breakpoint-object>

   :superclasses: :class:`<function-breakpoint-object>`


.. class:: <source-location-breakpoint-object>

   :superclasses: :class:`<breakpoint-object>`


.. constant:: <breakpoint-state>

.. constant:: <breakpoint-direction>

.. constant:: $default-breakpoint-stop?

.. constant:: $default-breakpoint-message?

.. constant:: $default-breakpoint-transient?

.. constant:: $default-breakpoint-enabled?

.. constant:: $default-breakpoint-profile?

.. constant:: $default-breakpoint-test

.. constant:: $default-breakpoint-entry-function?

.. constant:: $default-breakpoint-directions

.. generic-function:: destroy-breakpoint
   :open:

   :signature: destroy-breakpoint (breakpoint) => ()

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.

.. method:: destroy-breakpoint
   :specializer: <breakpoint-object>

.. method:: destroy-breakpoint
   :specializer: <source-location-breakpoint-object>

.. method:: destroy-breakpoint
   :specializer: <environment-object-breakpoint-object>

.. method:: destroy-breakpoint
   :specializer: <generic-function-breakpoint-object>

.. method:: destroy-breakpoint
   :specializer: <method-breakpoint-object>

.. generic-function:: initialize-breakpoint
   :open:

   :signature: initialize-breakpoint (breakpoint #key #all-keys) => ()

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.

.. method:: initialize-breakpoint
   :specializer: <breakpoint-object>

.. method:: initialize-breakpoint
   :specializer: <source-location-breakpoint-object>

.. method:: initialize-breakpoint
   :specializer: <environment-object-breakpoint-object>

.. method:: initialize-breakpoint
   :specializer: <generic-function-breakpoint-object>

.. generic-function:: reinitialize-breakpoint
   :open:

   :signature: reinitialize-breakpoint (breakpoint #rest args #key #all-keys) => ()

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :parameter #rest args: An instance of :class:`<object>`.

.. method:: reinitialize-breakpoint
   :specializer: <breakpoint-object>

.. method:: reinitialize-breakpoint
   :specializer: <function-breakpoint-object>

.. method:: reinitialize-breakpoint
   :specializer: <generic-function-breakpoint-object>

.. generic-function:: do-generic-breakpoint-methods
   :open:

   :signature: do-generic-breakpoint-methods (operation breakpoint) => ()

   :parameter operation: An instance of :class:`<function>`.
   :parameter breakpoint: An instance of :class:`<generic-function-breakpoint-object>`.

.. method:: do-generic-breakpoint-methods
   :specializer: <function>, <generic-function-breakpoint-object>

.. generic-function:: current-stop-breakpoints
   :open:

   :signature: current-stop-breakpoints (server thread) => (breakpoints)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value breakpoints: An instance of :class:`<sequence>`.

.. method:: current-stop-breakpoints
   :specializer: <project-object>, <thread-object>

.. generic-function:: find-breakpoint
   :open:

   :signature: find-breakpoint (class #rest args #key #all-keys) => (breakpoint)

   :parameter class: An instance of ``subclass(<breakpoint-object>)``.
   :parameter #rest args: An instance of :class:`<object>`.
   :value breakpoint: An instance of :class:`<breakpoint-object>`, or ``#f``.

.. method:: find-breakpoint
   :specializer: singleton(<breakpoint-object>)

.. method:: find-breakpoint
   :specializer: subclass(<environment-object-breakpoint-object>)

.. method:: find-breakpoint
   :specializer: subclass(<source-location-breakpoint-object>)

.. generic-function:: project-breakpoints
   :open:

   :signature: project-breakpoints (project) => (breakpoints)

   :parameter project: An instance of :class:`<project-object>`.
   :value breakpoints: An instance of :class:`<collection>`.

.. method:: project-breakpoints
   :specializer: <project-object>

.. generic-function:: source-location-breakpoints
   :open:

   :signature: source-location-breakpoints (project) => (breakpoints)

   :parameter project: An instance of :class:`<project-object>`.
   :value breakpoints: An instance of :class:`<collection>`.

.. method:: source-location-breakpoints
   :specializer: <project-object>

.. generic-function:: environment-object-breakpoints
   :open:

   :signature: environment-object-breakpoints (project) => (breakpoints)

   :parameter project: An instance of :class:`<project-object>`.
   :value breakpoints: An instance of :class:`<collection>`.

.. method:: environment-object-breakpoints
   :specializer: <project-object>

.. generic-function:: breakpoint-object
   :open:

   :signature: breakpoint-object (breakpoint) => (object)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value object: An instance of :class:`<object>`.

.. method:: breakpoint-object
   :specializer: <breakpoint-object>

.. generic-function:: breakpoint-object-setter
   :open:

   :signature: breakpoint-object-setter (object breakpoint) => (object)

   :parameter object: An instance of :class:`<object>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value object: An instance of :class:`<object>`.

.. method:: breakpoint-object-setter
   :specializer: <object>, <breakpoint-object>

.. generic-function:: breakpoint-project
   :open:

   :signature: breakpoint-project (breakpoint) => (project)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value project: An instance of :class:`<project-object>`.

.. method:: breakpoint-project
   :specializer: <breakpoint-object>

.. generic-function:: breakpoint-stop?
   :open:

   :signature: breakpoint-stop? (breakpoint) => (stop?)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value stop?: An instance of :class:`<boolean>`.

.. method:: breakpoint-stop?
   :specializer: <breakpoint-object>

.. generic-function:: breakpoint-stop?-setter
   :open:

   :signature: breakpoint-stop?-setter (stop? breakpoint) => (stop?)

   :parameter stop?: An instance of :class:`<boolean>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value stop?: An instance of :class:`<boolean>`.

.. method:: breakpoint-stop?-setter
   :specializer: <boolean>, <breakpoint-object>

.. method:: breakpoint-stop?-setter
   :specializer: <boolean>, <generic-function-breakpoint-object>

.. generic-function:: breakpoint-message?
   :open:

   :signature: breakpoint-message? (breakpoint) => (message?)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value message?: An instance of :class:`<string>`, or ``#f``.

.. method:: breakpoint-message?
   :specializer: <breakpoint-object>

.. generic-function:: breakpoint-message?-setter
   :open:

   :signature: breakpoint-message?-setter (message? breakpoint) => (message?)

   :parameter message?: An instance of :class:`<string>`, or ``#f``.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value message?: An instance of :class:`<string>`, or ``#f``.

.. method:: breakpoint-message?-setter
   :specializer: false-or(<string>), <breakpoint-object>

.. method:: breakpoint-message?-setter
   :specializer: false-or(<string>), <generic-function-breakpoint-object>

.. generic-function:: breakpoint-transient?
   :open:

   :signature: breakpoint-transient? (breakpoint) => (transient?)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value transient?: An instance of :class:`<boolean>`.

.. method:: breakpoint-transient?
   :specializer: <breakpoint-object>

.. generic-function:: breakpoint-transient?-setter
   :open:

   :signature: breakpoint-transient?-setter (transient? breakpoint) => (transient?)

   :parameter transient?: An instance of :class:`<boolean>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value transient?: An instance of :class:`<boolean>`.

.. method:: breakpoint-transient?-setter
   :specializer: <boolean>, <breakpoint-object>

.. method:: breakpoint-transient?-setter
   :specializer: <boolean>, <generic-function-breakpoint-object>

.. generic-function:: breakpoint-enabled?
   :open:

   :signature: breakpoint-enabled? (breakpoint) => (enabled?)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value enabled?: An instance of :class:`<boolean>`.

.. method:: breakpoint-enabled?
   :specializer: <breakpoint-object>

.. generic-function:: breakpoint-enabled?-setter
   :open:

   :signature: breakpoint-enabled?-setter (enabled? breakpoint) => (enabled?)

   :parameter enabled?: An instance of :class:`<boolean>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value enabled?: An instance of :class:`<boolean>`.

.. method:: breakpoint-enabled?-setter
   :specializer: <boolean>, <breakpoint-object>

.. method:: breakpoint-enabled?-setter
   :specializer: <boolean>, <generic-function-breakpoint-object>

.. generic-function:: breakpoint-profile?
   :open:

   :signature: breakpoint-profile? (breakpoint) => (profile?)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value profile?: An instance of :class:`<boolean>`.

.. method:: breakpoint-profile?
   :specializer: <breakpoint-object>

.. generic-function:: breakpoint-profile?-setter
   :open:

   :signature: breakpoint-profile?-setter (profile? breakpoint) => (profile?)

   :parameter profile?: An instance of :class:`<boolean>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value profile?: An instance of :class:`<boolean>`.

.. method:: breakpoint-profile?-setter
   :specializer: <boolean>, <breakpoint-object>

.. method:: breakpoint-profile?-setter
   :specializer: <boolean>, <generic-function-breakpoint-object>

.. generic-function:: breakpoint-test
   :open:

   :signature: breakpoint-test (breakpoint) => (test)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value test: An instance of :class:`<object>`.

.. method:: breakpoint-test
   :specializer: <breakpoint-object>

.. generic-function:: breakpoint-test-setter
   :open:

   :signature: breakpoint-test-setter (test breakpoint) => (test)

   :parameter test: An instance of :class:`<object>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value test: An instance of :class:`<object>`.

.. method:: breakpoint-test-setter
   :specializer: <object>, <breakpoint-object>

.. method:: breakpoint-test-setter
   :specializer: <object>, <generic-function-breakpoint-object>

.. generic-function:: breakpoint-entry-function?
   :open:

   :signature: breakpoint-entry-function? (breakpoint) => (entry-function?)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value entry-function?: An instance of :class:`<boolean>`.

.. method:: breakpoint-entry-function?
   :specializer: <function-breakpoint-object>

.. generic-function:: breakpoint-entry-function?-setter
   :open:

   :signature: breakpoint-entry-function?-setter (entry-function? breakpoint) => (entry-function?)

   :parameter entry-function?: An instance of :class:`<boolean>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value entry-function?: An instance of :class:`<boolean>`.

.. method:: breakpoint-entry-function?-setter
   :specializer: <boolean>, <function-breakpoint-object>

.. method:: breakpoint-entry-function?-setter
   :specializer: <boolean>, <generic-function-breakpoint-object>

.. generic-function:: breakpoint-entry-point?

   :signature: breakpoint-entry-point? (object) => (value)

   :parameter object: An instance of :class:`<function-breakpoint-object>`.
   :value value: An instance of :class:`<boolean>`.

.. generic-function:: breakpoint-entry-point?-setter
   :open:

   :signature: breakpoint-entry-point?-setter (entry-point? breakpoint) => (entry-point?)

   :parameter entry-point?: An instance of :class:`<boolean>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value entry-point?: An instance of :class:`<boolean>`.

.. method:: breakpoint-entry-point?-setter
   :specializer: <boolean>, <function-breakpoint-object>

.. method:: breakpoint-entry-point?-setter
   :specializer: <boolean>, <generic-function-breakpoint-object>

.. generic-function:: breakpoint-directions
   :open:

   :signature: breakpoint-directions (breakpoint) => (directions)

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value directions: An instance of :class:`<sequence>`.

.. method:: breakpoint-directions
   :specializer: <function-breakpoint-object>

.. generic-function:: breakpoint-directions-setter
   :open:

   :signature: breakpoint-directions-setter (directions breakpoint) => (directions)

   :parameter directions: An instance of :class:`<sequence>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :value directions: An instance of :class:`<sequence>`.

.. method:: breakpoint-directions-setter
   :specializer: <sequence>, <function-breakpoint-object>

.. method:: breakpoint-directions-setter
   :specializer: <sequence>, <generic-function-breakpoint-object>

.. generic-function:: note-breakpoint-state-changed
   :open:

   :signature: note-breakpoint-state-changed (breakpoint state) => ()

   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :parameter state: An instance of :const:`<breakpoint-state>`.

.. method:: note-breakpoint-state-changed
   :specializer: <breakpoint-object>, <breakpoint-state>

.. generic-function:: server-note-breakpoint-state-changed
   :open:

   :signature: server-note-breakpoint-state-changed (server breakpoint state #key use-project-proxy) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter breakpoint: An instance of :class:`<breakpoint-object>`.
   :parameter state: An instance of :const:`<breakpoint-state>`.
   :parameter #key use-project-proxy: An instance of :class:`<object>`.

.. method:: server-note-breakpoint-state-changed
   :specializer: <project-object>, <breakpoint-object>, <breakpoint-state>

.. macro:: with-compressed-breakpoint-state-changes

.. function:: do-with-compressed-breakpoint-state-changes

   :signature: do-with-compressed-breakpoint-state-changes (continuation) => ()

   :parameter continuation: An instance of :class:`<function>`.

.. generic-function:: note-breakpoint-state-changes-failed
   :open:

   :signature: note-breakpoint-state-changes-failed (server breakpoints state) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter breakpoints: An instance of :class:`<sequence>`.
   :parameter state: An instance of :const:`<breakpoint-state>`.

.. method:: note-breakpoint-state-changes-failed
   :specializer: <project-object>, <sequence>, <breakpoint-state>

.. function:: trace-function

   :signature: trace-function (project function) => (breakpoint)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter function: An instance of :class:`<function-object>`.
   :value breakpoint: An instance of :class:`<function-breakpoint-object>`.

Threads Objects
===============

.. class:: <thread-object>

   :superclasses: :class:`<application-object>`


.. generic-function:: thread-stack-trace
   :open:

   :signature: thread-stack-trace (server thread) => (top-frame)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value top-frame: An instance of :class:`<stack-frame-object>`.

.. method:: thread-stack-trace
   :specializer: <project-object>, <thread-object>

.. generic-function:: thread-complete-stack-trace
   :open:

   :signature: thread-complete-stack-trace (server thread) => (all-frames)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value all-frames: An instance of :class:`<sequence>`.

.. method:: thread-complete-stack-trace
   :specializer: <project-object>, <thread-object>

.. generic-function:: thread-index
   :open:

   :signature: thread-index (server thread) => (index)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value index: An instance of :class:`<integer>`.

.. method:: thread-index
   :specializer: <project-object>, <thread-object>

.. generic-function:: thread-state
   :open:

   :signature: thread-state (server thread) => (state)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value state: An instance of :class:`<symbol>`.

.. method:: thread-state
   :specializer: <project-object>, <thread-object>

.. generic-function:: thread-runtime-state

   :signature: thread-runtime-state (object) => (value)

   :parameter object: An instance of :class:`<thread-object>`.
   :value value: An instance of :class:`<symbol>`.

.. generic-function:: thread-runtime-state-setter

   :signature: thread-runtime-state-setter (value object) => (value)

   :parameter value: An instance of :class:`<symbol>`.
   :parameter object: An instance of :class:`<thread-object>`.
   :value value: An instance of :class:`<symbol>`.

.. generic-function:: thread-suspended?

   :signature: thread-suspended? (object) => (value)

   :parameter object: An instance of :class:`<thread-object>`.
   :value value: An instance of :class:`<boolean>`.

.. generic-function:: thread-suspended?-setter

   :signature: thread-suspended?-setter (value object) => (value)

   :parameter value: An instance of :class:`<boolean>`.
   :parameter object: An instance of :class:`<thread-object>`.
   :value value: An instance of :class:`<boolean>`.

.. generic-function:: create-application-thread
   :open:

   :signature: create-application-thread (server title) => (thread)

   :parameter server: An instance of :class:`<server>`.
   :parameter title: An instance of :class:`<string>`.
   :value thread: An instance of :class:`<thread-object>`.

.. method:: create-application-thread
   :specializer: <project-object>, <string>

.. generic-function:: suspend-application-thread
   :open:

   :signature: suspend-application-thread (server thread) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.

.. method:: suspend-application-thread
   :specializer: <project-object>, <thread-object>

.. generic-function:: resume-application-thread
   :open:

   :signature: resume-application-thread (server thread) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.

.. method:: resume-application-thread
   :specializer: <project-object>, <thread-object>

.. generic-function:: thread-current-interactor-level
   :open:

   :signature: thread-current-interactor-level (server thread) => (level)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value level: An instance of :class:`<integer>`.

.. method:: thread-current-interactor-level
   :specializer: <project-object>, <thread-object>

.. generic-function:: add-application-object-to-thread-history
   :open:

   :signature: add-application-object-to-thread-history (server thread application-object) => (varname)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :parameter application-object: An instance of :class:`<application-object>`.
   :value varname: An instance of :class:`<string>`, or ``#f``.

.. method:: add-application-object-to-thread-history
   :specializer: <project-object>, <thread-object>, <application-object>

.. generic-function:: application-default-interactor-thread
   :open:

   :signature: application-default-interactor-thread (server) => (thread)

   :parameter server: An instance of :class:`<server>`.
   :value thread: An instance of :class:`<thread-object>`, or ``#f``.

.. method:: application-default-interactor-thread
   :specializer: <project-object>

Restarts
========

.. class:: <restart-object>

   :superclasses: :class:`<application-object>`


.. generic-function:: application-thread-restarts
   :open:

   :signature: application-thread-restarts (server thread) => (sequence-of-restart-objects)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value sequence-of-restart-objects: An instance of :class:`<sequence>`.

.. method:: application-thread-restarts
   :specializer: <project-object>, <thread-object>

.. generic-function:: application-restart-message
   :open:

   :signature: application-restart-message (server rst) => (printable-string)

   :parameter server: An instance of :class:`<server>`.
   :parameter rst: An instance of :class:`<restart-object>`.
   :value printable-string: An instance of :class:`<string>`.

.. method:: application-restart-message
   :specializer: <project-object>, <restart-object>

.. generic-function:: application-restart-abort?
   :open:

   :signature: application-restart-abort? (server rst) => (is-abort?)

   :parameter server: An instance of :class:`<server>`.
   :parameter rst: An instance of :class:`<restart-object>`.
   :value is-abort?: An instance of :class:`<boolean>`.

.. method:: application-restart-abort?
   :specializer: <project-object>, <restart-object>

.. generic-function:: invoke-application-restart
   :open:

   :signature: invoke-application-restart (server thread rst) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :parameter rst: An instance of :class:`<restart-object>`.

.. method:: invoke-application-restart
   :specializer: <project-object>, <thread-object>, <restart-object>

Machines
========

.. class:: <machine>
   :open:
   :abstract:

   :superclasses: :class:`<object>`

   :keyword required network-address: An instance of :class:`<string>`, or ``#f``.

.. function:: machine-network-address

   :signature: machine-network-address (m) => (a)

   :parameter m: An instance of :class:`<machine>`.
   :value a: An instance of :class:`<string>`.

.. generic-function:: machine-hostname
   :open:

   :signature: machine-hostname (m) => (h)

   :parameter m: An instance of :class:`<machine>`.
   :value h: An instance of :class:`<string>`.

.. method:: machine-hostname
   :specializer: <machine>

.. function:: environment-host-machine

   :signature: environment-host-machine () => (m)

   :value m: An instance of :class:`<machine>`.

.. function:: do-machine-connections

   :signature: do-machine-connections (itr #key include-local?) => (#rest results)

   :parameter itr: An instance of :class:`<function>`.
   :parameter #key include-local?: An instance of :class:`<object>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: close-connection-to-machine
   :open:

   :signature: close-connection-to-machine (m) => ()

   :parameter m: An instance of :class:`<machine>`.

.. method:: close-connection-to-machine
   :specializer: <machine>

.. generic-function:: machine-connection-open?
   :open:

   :signature: machine-connection-open? (m) => (well?)

   :parameter m: An instance of :class:`<machine>`.
   :value well?: An instance of :class:`<boolean>`.

.. class:: <remote-debug-connection-error>
   :abstract:

   :superclasses: :class:`<error>`


.. class:: <remote-connection-closed-error>

   :superclasses: :class:`<remote-debug-connection-error>`

   :keyword required failed-connection: An instance of :class:`<machine>`.

.. class:: <remote-connection-failed-error>

   :superclasses: :class:`<remote-debug-connection-error>`

   :keyword required network-address: An instance of :class:`<string>`.

.. class:: <remote-connection-password-mismatch-error>

   :superclasses: :class:`<remote-debug-connection-error>`

   :keyword required password: An instance of :class:`<string>`.

.. generic-function:: failed-connection

   :signature: failed-connection (object) => (value)

   :parameter object: An instance of :class:`<remote-connection-closed-error>`.
   :value value: An instance of :class:`<machine>`.

.. generic-function:: failed-network-address

   :signature: failed-network-address (object) => (value)

   :parameter object: An instance of :class:`<remote-connection-failed-error>`.
   :value value: An instance of :class:`<string>`.

.. generic-function:: failed-password

   :signature: failed-password (object) => (value)

   :parameter object: An instance of :class:`<remote-connection-password-mismatch-error>`.
   :value value: An instance of :class:`<string>`.

.. class:: <attempted-to-close-local-connection>

   :superclasses: :class:`<remote-debug-connection-error>`

Processes
=========

.. class:: <process>
   :open:
   :abstract:

   :superclasses: :class:`<object>`

   :keyword required process-debuggable?: An instance of :class:`<boolean>`.
   :keyword required process-executable-file: An instance of :class:`<file-locator>`.
   :keyword required process-host-machine: An instance of :class:`<machine>`.
   :keyword required process-id: An instance of :class:`<string>`.

.. generic-function:: process-host-machine

   :signature: process-host-machine (object) => (value)

   :parameter object: An instance of :class:`<process>`.
   :value value: An instance of :class:`<machine>`.

.. generic-function:: process-executable-file

   :signature: process-executable-file (object) => (value)

   :parameter object: An instance of :class:`<process>`.
   :value value: An instance of :class:`<file-locator>`.

.. generic-function:: process-id

   :signature: process-id (object) => (value)

   :parameter object: An instance of :class:`<process>`.
   :value value: An instance of :class:`<string>`.

.. function:: lookup-process-by-id

   :signature: lookup-process-by-id (id #key machine) => (proc)

   :parameter id: An instance of :class:`<string>`.
   :parameter #key machine: An instance of :class:`<object>`.
   :value proc: An instance of :class:`<process>`, or ``#f``.

.. generic-function:: process-debuggable?

   :signature: process-debuggable? (object) => (value)

   :parameter object: An instance of :class:`<process>`.
   :value value: An instance of :class:`<boolean>`.

.. function:: do-active-processes

   :signature: do-active-processes (f #key machine) => ()

   :parameter f: An instance of :class:`<function>`.
   :parameter #key machine: An instance of :class:`<object>`.

.. generic-function:: do-processes-on-machine
   :open:

   :signature: do-processes-on-machine (m function) => ()

   :parameter m: An instance of :class:`<machine>`.
   :parameter function: An instance of :class:`<function>`.

.. method:: do-processes-on-machine
   :specializer: <machine>, <function>

Applications
============

.. class:: <application>
   :open:
   :abstract:
   :primary:

   :superclasses: :class:`<server>`, :class:`<environment-object>`

   :keyword arguments: An instance of :class:`<string>`.
   :keyword required client: An instance of :class:`<object>`.
   :keyword required filename: An instance of :class:`<file-locator>`.
   :keyword required machine: An instance of :class:`<machine>`.
   :keyword required project: An instance of :class:`<project-object>`.

.. constant:: <application-state>

.. constant:: <application-startup-option>

.. macro:: with-application-transaction

.. generic-function:: perform-application-transaction
   :open:

   :signature: perform-application-transaction (server function) => (#rest values)

   :parameter server: An instance of :class:`<server>`.
   :parameter function: An instance of :class:`<function>`.
   :value #rest values: An instance of :class:`<object>`.

.. method:: perform-application-transaction
   :specializer: <project-object>, <function>

.. generic-function:: application-startup-option
   :open:

   :signature: application-startup-option (server) => (opt)

   :parameter server: An instance of :class:`<server>`.
   :value opt: An instance of :const:`<application-startup-option>`.

.. method:: application-startup-option
   :specializer: <project-object>

.. generic-function:: application-client

   :signature: application-client (object) => (value)

   :parameter object: An instance of :class:`<application>`.
   :value value: An instance of :class:`<object>`.

.. generic-function:: application-machine
   :open:

   :signature: application-machine (server) => (machine)

   :parameter server: An instance of :class:`<server>`.
   :value machine: An instance of :class:`<machine>`, or ``#f``.

.. method:: application-machine
   :specializer: <application>

.. generic-function:: application-filename

   :signature: application-filename (object) => (value)

   :parameter object: An instance of :class:`<application>`.
   :value value: An instance of :class:`<file-locator>`.

.. generic-function:: application-arguments

   :signature: application-arguments (object) => (value)

   :parameter object: An instance of :class:`<application>`.
   :value value: An instance of :class:`<string>`.

.. generic-function:: application-temporary-stop?

   :signature: application-temporary-stop? (object) => (value)

   :parameter object: An instance of :class:`<application>`.
   :value value: An instance of :class:`<boolean>`.

.. generic-function:: application-temporary-stop?-setter

   :signature: application-temporary-stop?-setter (value object) => (value)

   :parameter value: An instance of :class:`<boolean>`.
   :parameter object: An instance of :class:`<application>`.
   :value value: An instance of :class:`<boolean>`.

.. generic-function:: application-state

   :signature: application-state (object) => (value)

   :parameter object: An instance of :class:`<application>`.
   :value value: An instance of :const:`<application-state>`.

.. generic-function:: application-state-setter

   :signature: application-state-setter (state application) => (state)

   :parameter state: An instance of :const:`<application-state>`.
   :parameter application: An instance of :class:`<application>`.
   :value state: An instance of :const:`<application-state>`.

.. generic-function:: application-threads
   :open:

   :signature: application-threads (application #key client) => (threads)

   :parameter application: An instance of :class:`<application>`.
   :parameter #key client: An instance of :class:`<object>`.
   :value threads: An instance of :class:`<sequence>`.

.. generic-function:: application-running?
   :open:

   :signature: application-running? (application) => (running?)

   :parameter application: An instance of :class:`<application>`.
   :value running?: An instance of :class:`<boolean>`.

.. method:: application-running?
   :specializer: <application>

.. generic-function:: application-stopped?
   :open:

   :signature: application-stopped? (application) => (stopped?)

   :parameter application: An instance of :class:`<application>`.
   :value stopped?: An instance of :class:`<boolean>`.

.. method:: application-stopped?
   :specializer: <application>

.. generic-function:: application-closed?
   :open:

   :signature: application-closed? (application) => (closed?)

   :parameter application: An instance of :class:`<application>`.
   :value closed?: An instance of :class:`<boolean>`.

.. method:: application-closed?
   :specializer: <application>

.. function:: application-tethered?

   :signature: application-tethered? (server) => (tethered?)

   :parameter server: An instance of :class:`<server>`.
   :value tethered?: An instance of :class:`<boolean>`.

.. generic-function:: application-pause-before-termination?
   :open:

   :signature: application-pause-before-termination? (server) => (well?)

   :parameter server: An instance of :class:`<server>`.
   :value well?: An instance of :class:`<boolean>`.

.. method:: application-pause-before-termination?
   :specializer: <project-object>

.. generic-function:: application-just-hit-breakpoint?
   :open:

   :signature: application-just-hit-breakpoint? (server thread) => (hit?)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value hit?: An instance of :class:`<boolean>`.

.. method:: application-just-hit-breakpoint?
   :specializer: <project-object>, <thread-object>

.. generic-function:: application-just-hit-dylan-error?
   :open:

   :signature: application-just-hit-dylan-error? (server thread) => (hit?)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value hit?: An instance of :class:`<boolean>`.

.. method:: application-just-hit-dylan-error?
   :specializer: <project-object>, <thread-object>

.. generic-function:: application-just-hit-error?
   :open:

   :signature: application-just-hit-error? (server thread) => (hit?)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value hit?: An instance of :class:`<boolean>`.

.. method:: application-just-hit-error?
   :specializer: <project-object>, <thread-object>

.. generic-function:: application-just-interacted?
   :open:

   :signature: application-just-interacted? (server thread) => (interacted?)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value interacted?: An instance of :class:`<boolean>`.

.. method:: application-just-interacted?
   :specializer: <project-object>, <thread-object>

.. generic-function:: application-just-stepped?
   :open:

   :signature: application-just-stepped? (server thread) => (stepped?)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value stepped?: An instance of :class:`<boolean>`.

.. method:: application-just-stepped?
   :specializer: <project-object>, <thread-object>

.. generic-function:: application-stop-reason-message
   :open:

   :signature: application-stop-reason-message (application) => (message)

   :parameter application: An instance of :class:`<application>`.
   :value message: An instance of :class:`<string>`, or ``#f``.

.. generic-function:: close-application
   :open:

   :signature: close-application (server #key wait-for-termination?) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter #key wait-for-termination?: An instance of :class:`<boolean>`.

.. method:: close-application
   :specializer: <project-object>

.. generic-function:: continue-application
   :open:

   :signature: continue-application (server #key thread) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter #key thread: An instance of :class:`<object>`.

.. method:: continue-application
   :specializer: <project-object>

.. function:: ensure-application-proxy

   :signature: ensure-application-proxy (application object) => (proxy)

   :parameter application: An instance of :class:`<application>`.
   :parameter object: An instance of :class:`<application-object>`.
   :value proxy: An instance of :class:`<object>`.

.. generic-function:: find-application-proxy
   :open:

   :signature: find-application-proxy (application id) => (application-proxy)

   :parameter application: An instance of :class:`<application>`.
   :parameter id: An instance of :class:`<id>`.
   :value application-proxy: An instance of :class:`<object>`.

.. method:: find-application-proxy
   :specializer: <application>, <id>

.. generic-function:: application-proxy-id
   :open:

   :signature: application-proxy-id (application proxy) => (id)

   :parameter application: An instance of :class:`<application>`.
   :parameter proxy: An instance of :class:`<object>`.
   :value id: An instance of :class:`<id>`, or ``#f``.

.. generic-function:: run-application
   :open:

   :signature: run-application (server #key startup-option client filename arguments pause-before-termination? library-search-paths working-directory machine) => (application)

   :parameter server: An instance of :class:`<server>`.
   :parameter #key startup-option: An instance of :class:`<object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :parameter #key filename: An instance of :class:`<object>`.
   :parameter #key arguments: An instance of :class:`<object>`.
   :parameter #key pause-before-termination?: An instance of :class:`<object>`.
   :parameter #key library-search-paths: An instance of :class:`<object>`.
   :parameter #key working-directory: An instance of :class:`<object>`.
   :parameter #key machine: An instance of :class:`<object>`.
   :value application: An instance of :class:`<application>`.

.. method:: run-application
   :specializer: <project-object>

.. generic-function:: attach-live-application
   :open:

   :signature: attach-live-application (server process #key client system-data) => (app)

   :parameter server: An instance of :class:`<server>`.
   :parameter process: An instance of :class:`<process>`.
   :parameter #key client: An instance of :class:`<object>`.
   :parameter #key system-data: An instance of :class:`<object>`.
   :value app: An instance of :class:`<application>`.

.. method:: attach-live-application
   :specializer: <project-object>, <process>

.. generic-function:: note-run-application-failed
   :open:

   :signature: note-run-application-failed (application) => ()

   :parameter application: An instance of :class:`<application>`.

.. method:: note-run-application-failed
   :specializer: <application>

.. generic-function:: stop-application
   :open:

   :signature: stop-application (server #key client-data) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter #key client-data: An instance of :class:`<object>`.

.. method:: stop-application
   :specializer: <project-object>

.. generic-function:: make-project-application
   :open:

   :signature: make-project-application (project #key #all-keys) => (application)

   :parameter project: An instance of :class:`<project-object>`.
   :value application: An instance of :class:`<application>`.

.. generic-function:: step-application-into
   :open:

   :signature: step-application-into (server thread) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.

.. method:: step-application-into
   :specializer: <project-object>, <thread-object>

.. generic-function:: step-application-over
   :open:

   :signature: step-application-over (server thread #key stack-frame) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :parameter #key stack-frame: An instance of :class:`<object>`.

.. method:: step-application-over
   :specializer: <project-object>, <thread-object>

.. generic-function:: step-application-out
   :open:

   :signature: step-application-out (server thread #key stack-frame) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :parameter #key stack-frame: An instance of :class:`<object>`.

.. method:: step-application-out
   :specializer: <project-object>, <thread-object>

.. generic-function:: update-application
   :open:

   :signature: update-application (server #key progress-callback) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter #key progress-callback: An instance of :class:`<object>`.

.. method:: update-application
   :specializer: <project-object>

.. generic-function:: note-application-initialized
   :open:

   :signature: note-application-initialized (project) => ()

   :parameter project: An instance of :class:`<project-object>`.

.. method:: note-application-initialized
   :specializer: <project-object>

Compiler Databases
==================

.. class:: <compiler-database>
   :open:
   :abstract:
   :primary:

   :superclasses: :class:`<server>`, :class:`<environment-object>`

   :keyword required project: An instance of :class:`<project-object>`.

.. function:: ensure-database-proxy

   :signature: ensure-database-proxy (database object) => (proxy)

   :parameter database: An instance of :class:`<compiler-database>`.
   :parameter object: An instance of :class:`<compiler-object>`.
   :value proxy: An instance of :class:`<object>`.

.. generic-function:: find-compiler-database-proxy
   :open:

   :signature: find-compiler-database-proxy (database id #key imported?) => (compiler-proxy)

   :parameter database: An instance of :class:`<compiler-database>`.
   :parameter id: An instance of :class:`<id>`.
   :parameter #key imported?: An instance of :class:`<object>`.
   :value compiler-proxy: An instance of :class:`<object>`.

.. method:: find-compiler-database-proxy
   :specializer: <compiler-database>, <id>

.. generic-function:: compiler-database-proxy-id
   :open:

   :signature: compiler-database-proxy-id (database proxy) => (id)

   :parameter database: An instance of :class:`<compiler-database>`.
   :parameter proxy: An instance of :class:`<object>`.
   :value id: An instance of :class:`<id>`, or ``#f``.

.. function:: invalidate-compiler-database

   :signature: invalidate-compiler-database (database) => ()

   :parameter database: An instance of :class:`<compiler-database>`.

Project Objects
===============

.. class:: <project-object>
   :open:
   :abstract:
   :primary:

   :superclasses: :class:`<server>`, :class:`<environment-object>`

   :keyword application: An instance of :class:`<application>`, or ``#f``.
   :keyword compiler-database: An instance of :class:`<compiler-database>`, or ``#f``.
   :keyword proxy: An instance of :class:`<object>`.
   :keyword server-path: An instance of :const:`<server-path-type>`.

.. constant:: <compilation-mode>

.. constant:: <project-target-type>

.. constant:: <project-interface-type>

.. function:: active-project

   :signature: active-project () => (project)

   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. function:: active-project-setter

   :signature: active-project-setter (project) => (project)

   :parameter project: An instance of :class:`<project-object>`, or ``#f``.
   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. function:: project-name

   :signature: project-name (project) => (name)

   :parameter project: An instance of :class:`<project-object>`.
   :value name: An instance of :class:`<string>`.

.. generic-function:: project-properties

   :signature: project-properties (object) => (value)

   :parameter object: An instance of :class:`<project-object>`.
   :value value: An instance of :class:`<list>`.

.. generic-function:: project-properties-setter

   :signature: project-properties-setter (value object) => (value)

   :parameter value: An instance of :class:`<list>`.
   :parameter object: An instance of :class:`<project-object>`.
   :value value: An instance of :class:`<list>`.

.. generic-function:: project-proxy
   :open:

   :signature: project-proxy (project) => (proxy)

   :parameter project: An instance of :class:`<project-object>`.
   :value proxy: An instance of :class:`<object>`.

.. method:: project-proxy
   :specializer: <project-object>

.. generic-function:: project-proxy-setter

   :signature: project-proxy-setter (value object) => (value)

   :parameter value: An instance of :class:`<object>`.
   :parameter object: An instance of :class:`<project-object>`.
   :value value: An instance of :class:`<object>`.

.. generic-function:: project-application
   :open:

   :signature: project-application (project) => (application)

   :parameter project: An instance of :class:`<project-object>`.
   :value application: An instance of :class:`<application>`, or ``#f``.

.. method:: project-application
   :specializer: <project-object>

.. generic-function:: project-application-setter

   :signature: project-application-setter (value object) => (value)

   :parameter value: An instance of :class:`<application>`, or ``#f``.
   :parameter object: An instance of :class:`<project-object>`.
   :value value: An instance of :class:`<application>`, or ``#f``.

.. generic-function:: project-compiler-database
   :open:

   :signature: project-compiler-database (project) => (compiler-database)

   :parameter project: An instance of :class:`<project-object>`.
   :value compiler-database: An instance of :class:`<compiler-database>`, or ``#f``.

.. method:: project-compiler-database
   :specializer: <project-object>

.. generic-function:: project-compiler-database-setter

   :signature: project-compiler-database-setter (value object) => (value)

   :parameter value: An instance of :class:`<compiler-database>`, or ``#f``.
   :parameter object: An instance of :class:`<project-object>`.
   :value value: An instance of :class:`<compiler-database>`, or ``#f``.

.. generic-function:: project-database-changed?
   :open:

   :signature: project-database-changed? (project) => (yes?)

   :parameter project: An instance of :class:`<project-object>`.
   :value yes?: An instance of :class:`<boolean>`.

.. generic-function:: project-sources-changed?
   :open:

   :signature: project-sources-changed? (project) => (yes?)

   :parameter project: An instance of :class:`<project-object>`.
   :value yes?: An instance of :class:`<boolean>`.

.. generic-function:: project-opened-by-user?
   :open:

   :signature: project-opened-by-user? (project) => (by-user?)

   :parameter project: An instance of :class:`<project-object>`.
   :value by-user?: An instance of :class:`<boolean>`.

.. generic-function:: project-opened-by-user?-setter
   :open:

   :signature: project-opened-by-user?-setter (by-user? project) => (by-user?)

   :parameter by-user?: An instance of :class:`<boolean>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value by-user?: An instance of :class:`<boolean>`.

.. function:: project-used-libraries

   :signature: project-used-libraries (server project) => (libraries)

   :parameter server: An instance of :class:`<server>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value libraries: An instance of :class:`<sequence>`.

.. function:: project-used-projects

   :signature: project-used-projects (project #key indirect? read-only?) => (projects)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key indirect?: An instance of :class:`<object>`.
   :parameter #key read-only?: An instance of :class:`<object>`.
   :value projects: An instance of :class:`<sequence>`.

.. generic-function:: do-project-used-libraries
   :open:

   :signature: do-project-used-libraries (function server project) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter project: An instance of :class:`<project-object>`.

.. method:: do-project-used-libraries
   :specializer: <function>, <project-object>, <project-object>

.. generic-function:: do-project-file-libraries
   :open:

   :signature: do-project-file-libraries (function server file) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter file: An instance of :class:`<file-locator>`.

.. method:: do-project-file-libraries
   :specializer: <function>, <project-object>, <file-locator>

.. generic-function:: do-used-projects
   :open:

   :signature: do-used-projects (function project #key indirect? read-only?) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key indirect?: An instance of :class:`<object>`.
   :parameter #key read-only?: An instance of :class:`<object>`.

.. generic-function:: edit-source-location
   :open:

   :signature: edit-source-location (server source-location) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter source-location: An instance of :class:`<source-location>`.

.. generic-function:: edit-source-record
   :open:

   :signature: edit-source-record (server source-record #key start-line start-column end-line end-column) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter source-record: An instance of :class:`<source-record>`.
   :parameter #key start-line: An instance of :class:`<object>`.
   :parameter #key start-column: An instance of :class:`<object>`.
   :parameter #key end-line: An instance of :class:`<object>`.
   :parameter #key end-column: An instance of :class:`<object>`.

.. generic-function:: edit-definition
   :open:

   :signature: edit-definition (server object) => (found-definition?)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value found-definition?: An instance of :class:`<boolean>`.

.. generic-function:: open-project
   :open:

   :signature: open-project (locator) => (project)

   :parameter locator: An instance of :class:`<file-locator>`.
   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. method:: open-project
   :specializer: <file-locator>

.. generic-function:: find-project
   :open:

   :signature: find-project (name) => (project)

   :parameter name: An instance of :class:`<string>`.
   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. generic-function:: create-new-user-project
   :open:

   :signature: create-new-user-project (name location) => (project)

   :parameter name: An instance of :class:`<object>`.
   :parameter location: An instance of :class:`<object>`.
   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. generic-function:: open-project-from-file
   :open:

   :signature: open-project-from-file (locator) => (project)

   :parameter locator: An instance of :class:`<file-locator>`.
   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. generic-function:: create-exe-project-from-file
   :open:

   :signature: create-exe-project-from-file (locator) => (project)

   :parameter locator: An instance of :class:`<file-locator>`.
   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. generic-function:: import-project-from-file
   :open:

   :signature: import-project-from-file (locator #key filename) => (project)

   :parameter locator: An instance of :class:`<file-locator>`.
   :parameter #key filename: An instance of :class:`<object>`.
   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. generic-function:: close-project
   :open:

   :signature: close-project (project) => ()

   :parameter project: An instance of :class:`<project-object>`.

.. generic-function:: project-add-source-record
   :open:

   :signature: project-add-source-record (project record) => ()

   :parameter project: An instance of :class:`<project-object>`.
   :parameter record: An instance of :class:`<object>`.

.. generic-function:: project-remove-source-record
   :open:

   :signature: project-remove-source-record (project record) => ()

   :parameter project: An instance of :class:`<project-object>`.
   :parameter record: An instance of :class:`<object>`.

.. generic-function:: project-reorder-source-records
   :open:

   :signature: project-reorder-source-records (project compare-function) => ()

   :parameter project: An instance of :class:`<project-object>`.
   :parameter compare-function: An instance of :class:`<function>`.

.. generic-function:: save-project
   :open:

   :signature: save-project (project #key save-database? filename) => ()

   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key save-database?: An instance of :class:`<boolean>`.
   :parameter #key filename: An instance of :class:`<file-locator>`, or ``#f``.

.. generic-function:: save-project-database
   :open:

   :signature: save-project-database (project) => ()

   :parameter project: An instance of :class:`<project-object>`.

.. generic-function:: open-projects
   :open:

   :signature: open-projects () => (projects)

   :value projects: An instance of :class:`<sequence>`.

.. function:: current-project

   :signature: current-project () => (project)

   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. function:: current-project-setter

   :signature: current-project-setter (project) => (project)

   :parameter project: An instance of :class:`<project-object>`, or ``#f``.
   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. generic-function:: project-library
   :open:

   :signature: project-library (server) => (library)

   :parameter server: An instance of :class:`<server>`.
   :value library: An instance of :class:`<library-object>`, or ``#f``.

.. method:: project-library
   :specializer: <project-object>

.. generic-function:: project-start-function-name
   :open:

   :signature: project-start-function-name (project) => (name)

   :parameter project: An instance of :class:`<project-object>`.
   :value name: An instance of :class:`<string>`, or ``#f``.

.. generic-function:: project-start-function-name-setter
   :open:

   :signature: project-start-function-name-setter (name project) => (name)

   :parameter name: An instance of :class:`<string>`, or ``#f``.
   :parameter project: An instance of :class:`<project-object>`.
   :value name: An instance of :class:`<string>`, or ``#f``.

.. function:: project-start-function

   :signature: project-start-function (project) => (function)

   :parameter project: An instance of :class:`<project-object>`.
   :value function: An instance of :class:`<function-object>`, or ``#f``.

.. generic-function:: project-read-only?
   :open:

   :signature: project-read-only? (project) => (read-only?)

   :parameter project: An instance of :class:`<project-object>`.
   :value read-only?: An instance of :class:`<boolean>`.

.. generic-function:: project-can-be-built?
   :open:

   :signature: project-can-be-built? (project) => (can-be-built?)

   :parameter project: An instance of :class:`<project-object>`.
   :value can-be-built?: An instance of :class:`<boolean>`.

.. generic-function:: project-can-be-debugged?
   :open:

   :signature: project-can-be-debugged? (project) => (can-be-debugged?)

   :parameter project: An instance of :class:`<project-object>`.
   :value can-be-debugged?: An instance of :class:`<boolean>`.

.. generic-function:: project-compiled?
   :open:

   :signature: project-compiled? (project) => (compiled?)

   :parameter project: An instance of :class:`<project-object>`.
   :value compiled?: An instance of :class:`<boolean>`.

.. generic-function:: project-sources
   :open:

   :signature: project-sources (project) => (sources)

   :parameter project: An instance of :class:`<project-object>`.
   :value sources: An instance of :class:`<sequence>`.

.. generic-function:: project-canonical-sources
   :open:

   :signature: project-canonical-sources (project) => (sources)

   :parameter project: An instance of :class:`<project-object>`.
   :value sources: An instance of :class:`<sequence>`.

.. generic-function:: project-canonical-source-record

   :signature: project-canonical-source-record (project record) => (canonical-record)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter record: An instance of :class:`<source-record>`.
   :value canonical-record: An instance of :class:`<source-record>`, or ``#f``.

.. generic-function:: project-canonical-filename

   :signature: project-canonical-filename (project file) => (canonical-filename)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter file: An instance of :class:`<file-locator>`.
   :value canonical-filename: An instance of :class:`<file-locator>`, or ``#f``.

.. generic-function:: project-other-sources
   :open:

   :signature: project-other-sources (project) => (sources)

   :parameter project: An instance of :class:`<project-object>`.
   :value sources: An instance of :class:`<sequence>`.

.. generic-function:: project-directory
   :open:

   :signature: project-directory (project) => (directory)

   :parameter project: An instance of :class:`<project-object>`.
   :value directory: An instance of :class:`<directory-locator>`.

.. generic-function:: project-filename
   :open:

   :signature: project-filename (project) => (filename)

   :parameter project: An instance of :class:`<project-object>`.
   :value filename: An instance of :class:`<file-locator>`, or ``#f``.

.. generic-function:: project-build-filename
   :open:

   :signature: project-build-filename (project) => (filename)

   :parameter project: An instance of :class:`<project-object>`.
   :value filename: An instance of :class:`<file-locator>`, or ``#f``.

.. generic-function:: project-build-filename-setter
   :open:

   :signature: project-build-filename-setter (filename project) => (filename)

   :parameter filename: An instance of :class:`<file-locator>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value filename: An instance of :class:`<file-locator>`.

.. function:: project-full-build-filename

   :signature: project-full-build-filename (project) => (pathname)

   :parameter project: An instance of :class:`<project-object>`.
   :value pathname: An instance of :class:`<file-locator>`.

.. generic-function:: project-debug-filename
   :open:

   :signature: project-debug-filename (project) => (filename)

   :parameter project: An instance of :class:`<project-object>`.
   :value filename: An instance of :class:`<file-locator>`, or ``#f``.

.. generic-function:: project-debug-filename-setter
   :open:

   :signature: project-debug-filename-setter (filename project) => (filename)

   :parameter filename: An instance of :class:`<file-locator>`, or ``#f``.
   :parameter project: An instance of :class:`<project-object>`.
   :value filename: An instance of :class:`<file-locator>`, or ``#f``.

.. generic-function:: project-debug-arguments
   :open:

   :signature: project-debug-arguments (project) => (arguments)

   :parameter project: An instance of :class:`<project-object>`.
   :value arguments: An instance of :class:`<string>`.

.. generic-function:: project-debug-arguments-setter
   :open:

   :signature: project-debug-arguments-setter (arguments project) => (arguments)

   :parameter arguments: An instance of :class:`<string>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value arguments: An instance of :class:`<string>`.

.. generic-function:: project-debug-machine-address
   :open:

   :signature: project-debug-machine-address (project) => (name)

   :parameter project: An instance of :class:`<project-object>`.
   :value name: An instance of :class:`<string>`, or ``#f``.

.. generic-function:: project-debug-machine-address-setter
   :open:

   :signature: project-debug-machine-address-setter (name project) => (name)

   :parameter name: An instance of :class:`<string>`, or ``#f``.
   :parameter project: An instance of :class:`<project-object>`.
   :value name: An instance of :class:`<string>`, or ``#f``.

.. generic-function:: project-debug-machine
   :open:

   :signature: project-debug-machine (project) => (machine)

   :parameter project: An instance of :class:`<project-object>`.
   :value machine: An instance of :class:`<machine>`, or ``#f``.

.. method:: project-debug-machine
   :specializer: <project-object>

.. generic-function:: project-debug-machine-setter
   :open:

   :signature: project-debug-machine-setter (machine project) => (machine)

   :parameter machine: An instance of :class:`<machine>`, or ``#f``.
   :parameter project: An instance of :class:`<project-object>`.
   :value machine: An instance of :class:`<machine>`, or ``#f``.

.. method:: project-debug-machine-setter
   :specializer: false-or(<machine>), <project-object>

.. generic-function:: project-debug-directory
   :open:

   :signature: project-debug-directory (project) => (directory)

   :parameter project: An instance of :class:`<project-object>`.
   :value directory: An instance of :class:`<directory-locator>`, or ``#f``.

.. generic-function:: project-debug-directory-setter
   :open:

   :signature: project-debug-directory-setter (directory project) => (directory)

   :parameter directory: An instance of :class:`<directory-locator>`, or ``#f``.
   :parameter project: An instance of :class:`<project-object>`.
   :value directory: An instance of :class:`<directory-locator>`, or ``#f``.

.. generic-function:: project-build-directory
   :open:

   :signature: project-build-directory (project) => (directory)

   :parameter project: An instance of :class:`<project-object>`.
   :value directory: An instance of :class:`<directory-locator>`, or ``#f``.

.. generic-function:: project-bin-directory
   :open:

   :signature: project-bin-directory (project) => (directory)

   :parameter project: An instance of :class:`<project-object>`.
   :value directory: An instance of :class:`<directory-locator>`.

.. generic-function:: project-release-directory
   :open:

   :signature: project-release-directory (project) => (directory)

   :parameter project: An instance of :class:`<project-object>`.
   :value directory: An instance of :class:`<directory-locator>`.

.. generic-function:: project-server-path

   :signature: project-server-path (object) => (value)

   :parameter object: An instance of :class:`<project-object>`.
   :value value: An instance of :const:`<server-path-type>`.

.. generic-function:: project-compilation-mode
   :open:

   :signature: project-compilation-mode (project) => (mode)

   :parameter project: An instance of :class:`<project-object>`.
   :value mode: An instance of :const:`<compilation-mode>`.

.. generic-function:: project-compilation-mode-setter
   :open:

   :signature: project-compilation-mode-setter (mode project) => (mode)

   :parameter mode: An instance of :const:`<compilation-mode>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value mode: An instance of :const:`<compilation-mode>`.

.. generic-function:: project-compiler-back-end
   :open:

   :signature: project-compiler-back-end (project) => (back-end)

   :parameter project: An instance of :class:`<project-object>`.
   :value back-end: An instance of :class:`<symbol>`.

.. generic-function:: project-compiler-back-end-setter
   :open:

   :signature: project-compiler-back-end-setter (back-end project) => (back-end)

   :parameter back-end: An instance of :class:`<symbol>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value back-end: An instance of :class:`<symbol>`.

.. generic-function:: project-executable-name
   :open:

   :signature: project-executable-name (project) => (executable-name)

   :parameter project: An instance of :class:`<project-object>`.
   :value executable-name: An instance of :class:`<string>`.

.. generic-function:: project-executable-name-setter
   :open:

   :signature: project-executable-name-setter (executable-name project) => (executable-name)

   :parameter executable-name: An instance of :class:`<string>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value executable-name: An instance of :class:`<string>`.

.. generic-function:: project-target-type
   :open:

   :signature: project-target-type (project) => (target-type)

   :parameter project: An instance of :class:`<project-object>`.
   :value target-type: An instance of :const:`<project-target-type>`.

.. generic-function:: project-target-type-setter
   :open:

   :signature: project-target-type-setter (target-type project) => (target-type)

   :parameter target-type: An instance of :const:`<project-target-type>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value target-type: An instance of :const:`<project-target-type>`.

.. generic-function:: project-interface-type
   :open:

   :signature: project-interface-type (project) => (interface-type)

   :parameter project: An instance of :class:`<project-object>`.
   :value interface-type: An instance of :const:`<project-interface-type>`.

.. generic-function:: project-interface-type-setter
   :open:

   :signature: project-interface-type-setter (interface-type project) => (interface-type)

   :parameter interface-type: An instance of :const:`<project-interface-type>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value interface-type: An instance of :const:`<project-interface-type>`.

.. generic-function:: project-base-address
   :open:

   :signature: project-base-address (project) => (address)

   :parameter project: An instance of :class:`<project-object>`.
   :value address: An instance of :class:`<machine-word>`, or ``#f``.

.. generic-function:: project-base-address-setter
   :open:

   :signature: project-base-address-setter (address project) => (address)

   :parameter address: An instance of :class:`<machine-word>`, or ``#f``.
   :parameter project: An instance of :class:`<project-object>`.
   :value address: An instance of :class:`<machine-word>`, or ``#f``.

.. generic-function:: project-major-version
   :open:

   :signature: project-major-version (project) => (version)

   :parameter project: An instance of :class:`<project-object>`.
   :value version: An instance of :class:`<integer>`.

.. generic-function:: project-major-version-setter
   :open:

   :signature: project-major-version-setter (version project) => (version)

   :parameter version: An instance of :class:`<integer>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value version: An instance of :class:`<integer>`.

.. generic-function:: project-minor-version
   :open:

   :signature: project-minor-version (project) => (version)

   :parameter project: An instance of :class:`<project-object>`.
   :value version: An instance of :class:`<integer>`.

.. generic-function:: project-minor-version-setter
   :open:

   :signature: project-minor-version-setter (version project) => (version)

   :parameter version: An instance of :class:`<integer>`.
   :parameter project: An instance of :class:`<project-object>`.
   :value version: An instance of :class:`<integer>`.

.. generic-function:: find-project-source-record
   :open:

   :signature: find-project-source-record (project filename) => (record)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter filename: An instance of :class:`<file-locator>`.
   :value record: An instance of :class:`<source-record>`, or ``#f``.

.. method:: find-project-source-record
   :specializer: <project-object>, <file-locator>

.. generic-function:: find-source-record-library
   :open:

   :signature: find-source-record-library (project record) => (library)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter record: An instance of :class:`<source-record>`.
   :value library: An instance of :class:`<library-object>`, or ``#f``.

.. generic-function:: session-property
   :open:

   :signature: session-property (key) => (value)

   :parameter key: An instance of :class:`<symbol>`.
   :value value: An instance of :class:`<object>`.

.. generic-function:: session-property-setter
   :open:

   :signature: session-property-setter (value key) => (value)

   :parameter value: An instance of :class:`<object>`.
   :parameter key: An instance of :class:`<symbol>`.
   :value value: An instance of :class:`<object>`.

.. generic-function:: source-record-top-level-forms
   :open:

   :signature: source-record-top-level-forms (server sr #key project) => (source-forms)

   :parameter server: An instance of :class:`<server>`.
   :parameter sr: An instance of :class:`<source-record>`.
   :parameter #key project: An instance of :class:`<object>`.
   :value source-forms: An instance of :class:`<sequence>`.

.. method:: source-record-top-level-forms
   :specializer: <project-object>, <source-record>

.. generic-function:: source-record-projects
   :open:

   :signature: source-record-projects (source-record) => (projects)

   :parameter source-record: An instance of :class:`<source-record>`.
   :value projects: An instance of :class:`<sequence>`.

.. method:: source-record-projects
   :specializer: <source-record>

.. method:: source-record-projects
   :specializer: <interactive-source-record>

.. generic-function:: source-record-colorization-info
   :open:

   :signature: source-record-colorization-info (project source-record) => (info)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter source-record: An instance of :class:`<source-record>`.
   :value info: An instance of :class:`<object>`.

.. generic-function:: open-project-compiler-database
   :open:

   :signature: open-project-compiler-database (project #key warning-callback error-handler) => (database)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key warning-callback: An instance of :class:`<object>`.
   :parameter #key error-handler: An instance of :class:`<object>`.
   :value database: An instance of :class:`<compiler-database>`, or ``#f``.

.. generic-function:: parse-project-source
   :open:

   :signature: parse-project-source (project #key warning-callback progress-callback error-handler process-subprojects?) => (well?)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key warning-callback: An instance of :class:`<object>`.
   :parameter #key progress-callback: An instance of :class:`<object>`.
   :parameter #key error-handler: An instance of :class:`<object>`.
   :parameter #key process-subprojects?: An instance of :class:`<object>`.
   :value well?: An instance of :class:`<boolean>`.

.. generic-function:: build-project
   :open:

   :signature: build-project (project #key clean? link? release? output warning-callback progress-callback error-handler save-databases? process-subprojects? messages) => (built?)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key clean?: An instance of :class:`<object>`.
   :parameter #key link?: An instance of :class:`<object>`.
   :parameter #key release?: An instance of :class:`<object>`.
   :parameter #key output: An instance of :class:`<object>`.
   :parameter #key warning-callback: An instance of :class:`<object>`.
   :parameter #key progress-callback: An instance of :class:`<object>`.
   :parameter #key error-handler: An instance of :class:`<object>`.
   :parameter #key save-databases?: An instance of :class:`<object>`.
   :parameter #key process-subprojects?: An instance of :class:`<object>`.
   :parameter #key messages: An instance of :class:`<object>`.
   :value built?: An instance of :class:`<boolean>`.

.. generic-function:: clean-project
   :open:

   :signature: clean-project (project #key error-handler process-subprojects?) => ()

   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key error-handler: An instance of :class:`<object>`.
   :parameter #key process-subprojects?: An instance of :class:`<object>`.

.. generic-function:: link-project
   :open:

   :signature: link-project (project #key progress-callback error-handler process-subprojects? build-script target force? unify? release? messages) => ()

   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key progress-callback: An instance of :class:`<object>`.
   :parameter #key error-handler: An instance of :class:`<object>`.
   :parameter #key process-subprojects?: An instance of :class:`<object>`.
   :parameter #key build-script: An instance of :class:`<object>`.
   :parameter #key target: An instance of :class:`<object>`.
   :parameter #key force?: An instance of :class:`<object>`.
   :parameter #key unify?: An instance of :class:`<object>`.
   :parameter #key release?: An instance of :class:`<object>`.
   :parameter #key messages: An instance of :class:`<object>`.

.. generic-function:: note-user-project-opened

   :signature: note-user-project-opened (project-object) => ()

   :parameter project-object: An instance of :class:`<project-object>`.

Playground
==========

.. function:: find-playground-project

   :signature: find-playground-project () => (project)

   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. function:: playground-project-name

   :signature: playground-project-name () => (name)

   :value name: An instance of :class:`<string>`.

.. function:: playground-project?

   :signature: playground-project? (project #key just-name?) => (playground?)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key just-name?: An instance of :class:`<boolean>`.
   :value playground?: An instance of :class:`<boolean>`.

.. function:: playground-application-filename

   :signature: playground-application-filename (project) => (filename)

   :parameter project: An instance of :class:`<project-object>`.
   :value filename: An instance of :class:`<file-locator>`, or ``#f``.

File Extensions
===============

.. function:: environment-locator-type

   :signature: environment-locator-type (locator) => (type)

   :parameter locator: An instance of :class:`<file-locator>`.
   :value type: An instance of :class:`<symbol>`, or ``#f``.

.. generic-function:: executable-file-extension
   :open:

   :signature: executable-file-extension () => (extension)

   :value extension: An instance of :class:`<string>`.

.. generic-function:: project-file-extension
   :open:

   :signature: project-file-extension () => (extension)

   :value extension: An instance of :class:`<string>`.

.. generic-function:: lid-file-extension
   :open:

   :signature: lid-file-extension () => (extension)

   :value extension: An instance of :class:`<string>`.

.. generic-function:: dylan-file-extension
   :open:

   :signature: dylan-file-extension () => (extension)

   :value extension: An instance of :class:`<string>`.

Interactive Evaluation
======================

.. generic-function:: project-execute-code
   :open:

   :signature: project-execute-code (server code thread #key module runtime-context stack-frame) => (execution-id deferred-execution?)

   :parameter server: An instance of :class:`<server>`.
   :parameter code: An instance of :class:`<string>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :parameter #key module: An instance of :class:`<object>`.
   :parameter #key runtime-context: An instance of :class:`<object>`.
   :parameter #key stack-frame: An instance of :class:`<object>`.
   :value execution-id: An instance of :const:`<execution-id>`.
   :value deferred-execution?: An instance of :class:`<boolean>`.

.. method:: project-execute-code
   :specializer: <project-object>, <string>, <thread-object>

.. generic-function:: project-macroexpand-code
   :open:

   :signature: project-macroexpand-code (server module code #key expansion-stream) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter module: An instance of :class:`<module-object>`.
   :parameter code: An instance of :class:`<string>`.
   :parameter #key expansion-stream: An instance of :class:`<stream>`.

.. method:: project-macroexpand-code
   :specializer: <project-object>, <module-object>, <string>

.. generic-function:: project-valid-code?
   :open:

   :signature: project-valid-code? (server code thread #key module runtime-context stack-frame) => (valid? warnings)

   :parameter server: An instance of :class:`<server>`.
   :parameter code: An instance of :class:`<string>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :parameter #key module: An instance of :class:`<object>`.
   :parameter #key runtime-context: An instance of :class:`<object>`.
   :parameter #key stack-frame: An instance of :class:`<object>`.
   :value valid?: An instance of :class:`<boolean>`.
   :value warnings: An instance of :class:`<sequence>`.

.. method:: project-valid-code?
   :specializer: <project-object>, <string>, <thread-object>

.. generic-function:: project-runtime-context
   :open:

   :signature: project-runtime-context (server thread #key stack-frame) => (runtime-context)

   :parameter server: An instance of :class:`<server>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :parameter #key stack-frame: An instance of :class:`<object>`.
   :value runtime-context: An instance of :class:`<object>`.

.. method:: project-runtime-context
   :specializer: <project-object>, <thread-object>

.. generic-function:: record-return-values
   :open:

   :signature: record-return-values (project execution-id values) => ()

   :parameter project: An instance of :class:`<project-object>`.
   :parameter execution-id: An instance of :const:`<execution-id>`.
   :parameter values: An instance of :class:`<sequence>`.

.. generic-function:: application-state-at-code-entry
   :open:

   :signature: application-state-at-code-entry (id) => (state)

   :parameter id: An instance of :class:`<object>`.
   :value state: An instance of :const:`<application-state>`.

.. constant:: <execution-id>

.. class:: <execution-info>

   :superclasses: :class:`<object>`

   :keyword required id: An instance of :const:`<execution-id>`.
   :keyword required thread: An instance of :class:`<thread-object>`.

.. generic-function:: execution-info-id

   :signature: execution-info-id (object) => (value)

   :parameter object: An instance of :class:`<execution-info>`.
   :value value: An instance of :const:`<execution-id>`.

.. generic-function:: execution-info-thread

   :signature: execution-info-thread (object) => (value)

   :parameter object: An instance of :class:`<execution-info>`.
   :value value: An instance of :class:`<thread-object>`.

.. generic-function:: project-execution-info
   :open:

   :signature: project-execution-info (project id) => (info)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter id: An instance of :const:`<execution-id>`.
   :value info: An instance of :class:`<execution-info>`, or ``#f``.

.. generic-function:: project-remove-execution-info
   :open:

   :signature: project-remove-execution-info (project info) => ()

   :parameter project: An instance of :class:`<project-object>`.
   :parameter info: An instance of :class:`<execution-info>`.

.. generic-function:: project-bind-variable
   :open:

   :signature: project-bind-variable (server variable-name object #key module) => (success?)

   :parameter server: An instance of :class:`<server>`.
   :parameter variable-name: An instance of :class:`<string>`.
   :parameter object: An instance of :class:`<application-object>`.
   :parameter #key module: An instance of :class:`<object>`.
   :value success?: An instance of :class:`<boolean>`.

.. generic-function:: fetch-interactor-return-values
   :open:

   :signature: fetch-interactor-return-values (server execution-id) => (environment-objects)

   :parameter server: An instance of :class:`<server>`.
   :parameter execution-id: An instance of :const:`<execution-id>`.
   :value environment-objects: An instance of :class:`<sequence>`.

.. method:: fetch-interactor-return-values
   :specializer: <project-object>, <execution-id>

.. generic-function:: dispose-interactor-return-values
   :open:

   :signature: dispose-interactor-return-values (server execution-id) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter execution-id: An instance of :const:`<execution-id>`.

.. method:: dispose-interactor-return-values
   :specializer: <project-object>, <execution-id>

.. generic-function:: transaction-id-source-record
   :open:

   :signature: transaction-id-source-record (server id) => (source-record)

   :parameter server: An instance of :class:`<server>`.
   :parameter id: An instance of :const:`<execution-id>`.
   :value source-record: An instance of :class:`<interactive-source-record>`, or ``#f``.

.. method:: transaction-id-source-record
   :specializer: <project-object>, <execution-id>

Name Objects
============

.. class:: <name-object>

   :superclasses: :class:`<compiler-object>`


.. class:: <module-name-object>

   :superclasses: :class:`<name-object>`


.. class:: <binding-name-object>

   :superclasses: :class:`<name-object>`


.. generic-function:: name-value
   :open:

   :signature: name-value (server name) => (value)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of :class:`<name-object>`.
   :value value: An instance of :class:`<environment-object>`, or ``#f``.

.. method:: name-value
   :specializer: <project-object>, <name-object>

.. generic-function:: name-type
   :open:

   :signature: name-type (server name) => (type)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of :class:`<name-object>`.
   :value type: An instance of :class:`<environment-object>`.

.. method:: name-type
   :specializer: <project-object>, <name-object>

.. generic-function:: name-imported?
   :open:

   :signature: name-imported? (server name) => (imported?)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of :class:`<name-object>`.
   :value imported?: An instance of :class:`<boolean>`.

.. method:: name-imported?
   :specializer: <project-object>, <name-object>

.. generic-function:: name-exported?
   :open:

   :signature: name-exported? (server name) => (exported?)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of :class:`<name-object>`.
   :value exported?: An instance of :class:`<boolean>`.

.. method:: name-exported?
   :specializer: <project-object>, <name-object>

Namespace Objects
=================

.. class:: <namespace-object>

   :superclasses: :class:`<definition-object>`


.. generic-function:: find-name
   :open:

   :signature: find-name (server name namespace #key imported?) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of :class:`<string>`.
   :parameter namespace: An instance of :class:`<namespace-object>`.
   :parameter #key imported?: An instance of :class:`<object>`.
   :value name: An instance of :class:`<name-object>`, or ``#f``.

.. method:: find-name
   :specializer: <project-object>, <string>, <namespace-object>

.. method:: find-name
   :specializer: <server>, <string>, <namespace-object>

.. generic-function:: name-namespace
   :open:

   :signature: name-namespace (server name) => (namespace)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of :class:`<name-object>`.
   :value namespace: An instance of :class:`<namespace-object>`.

.. method:: name-namespace
   :specializer: <project-object>, <name-object>

.. function:: namespace-names

   :signature: namespace-names (server namespace #key client imported?) => (names)

   :parameter server: An instance of :class:`<server>`.
   :parameter namespace: An instance of :class:`<namespace-object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :parameter #key imported?: An instance of :class:`<object>`.
   :value names: An instance of :class:`<sequence>`.

.. generic-function:: do-namespace-names
   :open:

   :signature: do-namespace-names (function server namespace #key imported? client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter namespace: An instance of :class:`<namespace-object>`.
   :parameter #key imported?: An instance of :class:`<object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-namespace-names
   :specializer: <function>, <project-object>, <namespace-object>

Library Objects
===============

.. class:: <library-object>

   :superclasses: :class:`<namespace-object>`


.. generic-function:: find-library
   :open:

   :signature: find-library (server name) => (library)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of :class:`<string>`.
   :value library: An instance of :class:`<library-object>`, or ``#f``.

.. method:: find-library
   :specializer: <project-object>, <string>

.. method:: find-library
   :specializer: <server>, <string>

.. function:: library-modules

   :signature: library-modules (server library #key client imported?) => (modules)

   :parameter server: An instance of :class:`<server>`.
   :parameter library: An instance of :class:`<library-object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :parameter #key imported?: An instance of :class:`<object>`.
   :value modules: An instance of :class:`<sequence>`.

.. function:: library-default-module

   :signature: library-default-module (server library) => (module)

   :parameter server: An instance of :class:`<server>`.
   :parameter library: An instance of :class:`<library-object>`.
   :value module: An instance of :class:`<module-object>`, or ``#f``.

.. generic-function:: library-project
   :open:

   :signature: library-project (server library) => (project)

   :parameter server: An instance of :class:`<server>`.
   :parameter library: An instance of :class:`<library-object>`.
   :value project: An instance of :class:`<project-object>`, or ``#f``.

.. method:: library-project
   :specializer: <project-object>, <library-object>

.. generic-function:: library-project-filename
   :open:

   :signature: library-project-filename (server library) => (filename)

   :parameter server: An instance of :class:`<server>`.
   :parameter library: An instance of :class:`<library-object>`.
   :value filename: An instance of :class:`<file-locator>`, or ``#f``.

.. method:: library-project-filename
   :specializer: <project-object>, <library-object>

.. generic-function:: library-filename
   :open:

   :signature: library-filename (server library) => (filename)

   :parameter server: An instance of :class:`<server>`.
   :parameter library: An instance of :class:`<library-object>`.
   :value filename: An instance of :class:`<file-locator>`, or ``#f``.

.. method:: library-filename
   :specializer: <project-object>, <library-object>

.. generic-function:: library-interactive?
   :open:

   :signature: library-interactive? (server library) => (interactive?)

   :parameter server: An instance of :class:`<server>`.
   :parameter library: An instance of :class:`<library-object>`.
   :value interactive?: An instance of :class:`<boolean>`.

.. method:: library-interactive?
   :specializer: <project-object>, <library-object>

.. generic-function:: library-read-only?
   :open:

   :signature: library-read-only? (server library) => (read-only?)

   :parameter server: An instance of :class:`<server>`.
   :parameter library: An instance of :class:`<library-object>`.
   :value read-only?: An instance of :class:`<boolean>`.

.. method:: library-read-only?
   :specializer: <project-object>, <library-object>

.. generic-function:: library-read-only?-setter
   :open:

   :signature: library-read-only?-setter (read-only? server library) => (read-only?)

   :parameter read-only?: An instance of :class:`<boolean>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter library: An instance of :class:`<library-object>`.
   :value read-only?: An instance of :class:`<boolean>`.

.. method:: library-read-only?-setter
   :specializer: <boolean>, <project-object>, <library-object>

.. function:: do-library-modules

   :signature: do-library-modules (function server library #key client imported?) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter library: An instance of :class:`<library-object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :parameter #key imported?: An instance of :class:`<object>`.

Module Objects
==============

.. class:: <module-object>

   :superclasses: :class:`<namespace-object>`


.. generic-function:: file-module
   :open:

   :signature: file-module (project filename) => (module library)

   :parameter project: An instance of :class:`<project-object>`, or ``#f``.
   :parameter filename: An instance of ``type-union(<file-locator>, <string>)``.
   :value module: An instance of :class:`<module-object>`, or ``#f``.
   :value library: An instance of :class:`<library-object>`, or ``#f``.

.. method:: file-module
   :specializer: false-or(<project-object>), type-union(<file-locator>, <string>)

.. generic-function:: find-module
   :open:

   :signature: find-module (server name #key library imported? all-libraries?) => (module)

   :parameter server: An instance of :class:`<server>`.
   :parameter name: An instance of :class:`<string>`.
   :parameter #key library: An instance of :class:`<object>`.
   :parameter #key imported?: An instance of :class:`<object>`.
   :parameter #key all-libraries?: An instance of :class:`<object>`.
   :value module: An instance of :class:`<module-object>`, or ``#f``.

.. method:: find-module
   :specializer: <project-object>, <string>

.. method:: find-module
   :specializer: <server>, <string>

.. generic-function:: module-project-proxy
   :open:

   :signature: module-project-proxy (server module) => (proxy)

   :parameter server: An instance of :class:`<server>`.
   :parameter module: An instance of :class:`<module-object>`.
   :value proxy: An instance of :class:`<object>`.

.. method:: module-project-proxy
   :specializer: <project-object>, <module-object>

.. generic-function:: do-module-definitions
   :open:

   :signature: do-module-definitions (function server module #key imported? client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter module: An instance of :class:`<module-object>`.
   :parameter #key imported?: An instance of :class:`<object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-module-definitions
   :specializer: <function>, <project-object>, <module-object>

.. function:: module-definitions

   :signature: module-definitions (server module #key client imported?) => (names)

   :parameter server: An instance of :class:`<server>`.
   :parameter module: An instance of :class:`<module-object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :parameter #key imported?: An instance of :class:`<object>`.
   :value names: An instance of :class:`<sequence>`.

Macros
======

.. class:: <macro-object>

   :superclasses: :class:`<definition-object>`

Variable Objects
================

.. class:: <variable-object>
   :abstract:

   :superclasses: :class:`<application-and-compiler-object>`


.. class:: <module-variable-object>
   :abstract:

   :superclasses: :class:`<variable-object>`, :class:`<definition-object>`


.. class:: <global-variable-object>

   :superclasses: :class:`<module-variable-object>`


.. class:: <thread-variable-object>

   :superclasses: :class:`<module-variable-object>`


.. generic-function:: variable-type
   :open:

   :signature: variable-type (server variable) => (type)

   :parameter server: An instance of :class:`<server>`.
   :parameter variable: An instance of :class:`<variable-object>`.
   :value type: An instance of :class:`<environment-object>`, or ``#f``.

.. method:: variable-type
   :specializer: <project-object>, <variable-object>

.. generic-function:: variable-value
   :open:

   :signature: variable-value (server variable #key thread) => (value)

   :parameter server: An instance of :class:`<server>`.
   :parameter variable: An instance of :class:`<variable-object>`.
   :parameter #key thread: An instance of :class:`<object>`.
   :value value: An instance of :class:`<application-object>`, or ``#f``.

.. method:: variable-value
   :specializer: <project-object>, <variable-object>

Constant Objects
================

.. class:: <constant-object>

   :superclasses: :class:`<variable-object>`, :class:`<definition-object>`

Functions
=========

.. class:: <function-object>
   :abstract:

   :superclasses: :class:`<application-code-object>`


.. class:: <foreign-function-object>

   :superclasses: :class:`<function-object>`, :class:`<foreign-object>`


.. class:: <dylan-function-object>

   :superclasses: :class:`<internal-object>`, :class:`<function-object>`, :class:`<definition-object>`, :class:`<application-and-compiler-object>`


.. class:: <simple-function-object>

   :superclasses: :class:`<dylan-function-object>`


.. class:: <generic-function-object>

   :superclasses: :class:`<dylan-function-object>`


.. class:: <method-object>

   :superclasses: :class:`<dylan-function-object>`


.. class:: <method-constant-object>

   :superclasses: :class:`<method-object>`


.. class:: <internal-method-object>

   :superclasses: :class:`<method-object>`


.. class:: <parameter>

   :superclasses: :class:`<object>`

   :keyword required name: An instance of :class:`<string>`.
   :keyword required type: An instance of :class:`<environment-object>`.

.. constant:: <parameters>

.. class:: <optional-parameter>

   :superclasses: :class:`<parameter>`

   :keyword required default-value: An instance of :class:`<object>`.
   :keyword keyword: An instance of :class:`<string>`, or ``#f``.

.. constant:: <optional-parameters>

.. generic-function:: function-parameters
   :open:

   :signature: function-parameters (server function) => (required rest keys all-keys? next values rest-value)

   :parameter server: An instance of :class:`<server>`.
   :parameter function: An instance of :class:`<dylan-function-object>`.
   :value required: An instance of :const:`<parameters>`.
   :value rest: An instance of :class:`<parameter>`, or ``#f``.
   :value keys: An instance of :const:`<optional-parameters>`.
   :value all-keys?: An instance of :class:`<boolean>`.
   :value next: An instance of :class:`<parameter>`, or ``#f``.
   :value values: An instance of :const:`<parameters>`.
   :value rest-value: An instance of :class:`<parameter>`, or ``#f``.

.. method:: function-parameters
   :specializer: <project-object>, <dylan-function-object>

.. generic-function:: do-generic-function-methods
   :open:

   :signature: do-generic-function-methods (function server generic-function #key client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter generic-function: An instance of :class:`<generic-function-object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-generic-function-methods
   :specializer: <function>, <project-object>, <generic-function-object>

.. function:: generic-function-object-methods

   :signature: generic-function-object-methods (server function) => (methods)

   :parameter server: An instance of :class:`<server>`.
   :parameter function: An instance of :class:`<generic-function-object>`.
   :value methods: An instance of :class:`<sequence>`.

.. generic-function:: method-generic-function
   :open:

   :signature: method-generic-function (server object) => (function)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<method-object>`.
   :value function: An instance of :class:`<generic-function-object>`, or ``#f``.

.. method:: method-generic-function
   :specializer: <project-object>, <method-object>

.. generic-function:: method-specializers
   :open:

   :signature: method-specializers (server object) => (specializers)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<method-object>`.
   :value specializers: An instance of :class:`<sequence>`.

.. method:: method-specializers
   :specializer: <project-object>, <method-object>

.. generic-function:: parameter-name

   :signature: parameter-name (object) => (value)

   :parameter object: An instance of :class:`<parameter>`.
   :value value: An instance of :class:`<string>`.

.. generic-function:: parameter-type

   :signature: parameter-type (object) => (value)

   :parameter object: An instance of :class:`<parameter>`.
   :value value: An instance of :class:`<environment-object>`.

.. generic-function:: parameter-keyword

   :signature: parameter-keyword (object) => (value)

   :parameter object: An instance of :class:`<optional-parameter>`.
   :value value: An instance of :class:`<string>`, or ``#f``.

.. generic-function:: parameter-default-value

   :signature: parameter-default-value (object) => (value)

   :parameter object: An instance of :class:`<optional-parameter>`.
   :value value: An instance of :class:`<object>`.

Domains
=======

.. class:: <domain-object>

   :superclasses: :class:`<definition-object>`


.. generic-function:: domain-specializers
   :open:

   :signature: domain-specializers (server object) => (specializers)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<domain-object>`.
   :value specializers: An instance of :class:`<sequence>`.

.. method:: domain-specializers
   :specializer: <project-object>, <domain-object>

Type Objects
============

.. class:: <type-object>

   :superclasses: :class:`<internal-object>`, :class:`<definition-object>`, :class:`<application-and-compiler-object>`

Singleton Objects
=================

.. class:: <singleton-object>

   :superclasses: :class:`<type-object>`


.. generic-function:: singleton-value
   :open:

   :signature: singleton-value (server object) => (value)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<singleton-object>`.
   :value value: An instance of :class:`<environment-object>`.

.. method:: singleton-value
   :specializer: <project-object>, <singleton-object>

Classes
=======

.. class:: <class-object>

   :superclasses: :class:`<type-object>`


.. generic-function:: do-direct-subclasses
   :open:

   :signature: do-direct-subclasses (function server class #key client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-direct-subclasses
   :specializer: <function>, <project-object>, <class-object>

.. generic-function:: do-direct-superclasses
   :open:

   :signature: do-direct-superclasses (function server class #key client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-direct-superclasses
   :specializer: <function>, <project-object>, <class-object>

.. generic-function:: do-direct-methods
   :open:

   :signature: do-direct-methods (function server class #key client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-direct-methods
   :specializer: <function>, <project-object>, <class-object>

.. generic-function:: do-direct-slots
   :open:

   :signature: do-direct-slots (function server class #key client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-direct-slots
   :specializer: <function>, <project-object>, <class-object>

.. generic-function:: do-all-methods
   :open:

   :signature: do-all-methods (function server class #key client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-all-methods
   :specializer: <function>, <project-object>, <class-object>

.. generic-function:: do-all-superclasses
   :open:

   :signature: do-all-superclasses (function server class #key client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-all-superclasses
   :specializer: <function>, <project-object>, <class-object>

.. generic-function:: do-all-slots
   :open:

   :signature: do-all-slots (function server class #key client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-all-slots
   :specializer: <function>, <project-object>, <class-object>

.. generic-function:: do-init-keywords
   :open:

   :signature: do-init-keywords (function server class #key client inherited?) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :parameter #key inherited?: An instance of :class:`<boolean>`.

.. method:: do-init-keywords
   :specializer: <function>, <project-object>, <class-object>

.. function:: class-direct-subclasses

   :signature: class-direct-subclasses (server class) => (classes)

   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :value classes: An instance of :class:`<sequence>`.

.. function:: class-direct-superclasses

   :signature: class-direct-superclasses (server class) => (classes)

   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :value classes: An instance of :class:`<sequence>`.

.. function:: class-direct-methods

   :signature: class-direct-methods (server class) => (methods)

   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :value methods: An instance of :class:`<sequence>`.

.. function:: class-direct-slots

   :signature: class-direct-slots (server class) => (slots)

   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :value slots: An instance of :class:`<sequence>`.

.. function:: class-slots

   :signature: class-slots (server class) => (slots)

   :parameter server: An instance of :class:`<server>`.
   :parameter class: An instance of :class:`<class-object>`.
   :value slots: An instance of :class:`<sequence>`.

Slots
=====

.. class:: <slot-object>

   :superclasses: :class:`<application-and-compiler-object>`


.. generic-function:: slot-class
   :open:

   :signature: slot-class (server slot) => (class)

   :parameter server: An instance of :class:`<server>`.
   :parameter slot: An instance of :class:`<slot-object>`.
   :value class: An instance of :class:`<class-object>`.

.. method:: slot-class
   :specializer: <project-object>, <slot-object>

.. generic-function:: slot-getter
   :open:

   :signature: slot-getter (server slot) => (getter)

   :parameter server: An instance of :class:`<server>`.
   :parameter slot: An instance of :class:`<slot-object>`.
   :value getter: An instance of :class:`<function-object>`, or ``#f``.

.. method:: slot-getter
   :specializer: <project-object>, <slot-object>

.. generic-function:: slot-setter
   :open:

   :signature: slot-setter (server slot) => (setter)

   :parameter server: An instance of :class:`<server>`.
   :parameter slot: An instance of :class:`<slot-object>`.
   :value setter: An instance of :class:`<function-object>`, or ``#f``.

.. method:: slot-setter
   :specializer: <project-object>, <slot-object>

.. generic-function:: slot-type
   :open:

   :signature: slot-type (server slot) => (type)

   :parameter server: An instance of :class:`<server>`.
   :parameter slot: An instance of :class:`<slot-object>`.
   :value type: An instance of :class:`<environment-object>`.

.. method:: slot-type
   :specializer: <project-object>, <slot-object>

.. generic-function:: slot-init-kind
   :open:

   :signature: slot-init-kind (server slot) => (kind)

   :parameter server: An instance of :class:`<server>`.
   :parameter slot: An instance of :class:`<slot-object>`.
   :value kind: An instance of :class:`<symbol>`, or ``#f``.

.. method:: slot-init-kind
   :specializer: <project-object>, <slot-object>

.. generic-function:: slot-init-keyword
   :open:

   :signature: slot-init-keyword (server slot) => (keyword required?)

   :parameter server: An instance of :class:`<server>`.
   :parameter slot: An instance of :class:`<slot-object>`.
   :value keyword: An instance of :class:`<symbol>`, or ``#f``.
   :value required?: An instance of :class:`<boolean>`.

.. method:: slot-init-keyword
   :specializer: <project-object>, <slot-object>

.. generic-function:: slot-allocation
   :open:

   :signature: slot-allocation (server slot) => (keywords)

   :parameter server: An instance of :class:`<server>`.
   :parameter slot: An instance of :class:`<slot-object>`.
   :value keywords: An instance of :class:`<sequence>`.

.. method:: slot-allocation
   :specializer: <project-object>, <slot-object>

Local Variable Objects
======================

.. class:: <local-variable-object>

   :superclasses: :class:`<variable-object>`

Stack Frame Objects
===================

.. class:: <stack-frame-object>

   :superclasses: :class:`<application-object>`


.. generic-function:: stack-frame-function
   :open:

   :signature: stack-frame-function (server stack-frame) => (function)

   :parameter server: An instance of :class:`<server>`.
   :parameter stack-frame: An instance of :class:`<stack-frame-object>`.
   :value function: An instance of :class:`<application-code-object>`, or ``#f``.

.. method:: stack-frame-function
   :specializer: <project-object>, <stack-frame-object>

.. generic-function:: stack-frame-environment-object
   :open:

   :signature: stack-frame-environment-object (server stack-frame) => (object)

   :parameter server: An instance of :class:`<server>`.
   :parameter stack-frame: An instance of :class:`<stack-frame-object>`.
   :value object: An instance of :class:`<environment-object>`, or ``#f``.

.. method:: stack-frame-environment-object
   :specializer: <project-object>, <stack-frame-object>

.. generic-function:: stack-frame-source-location
   :open:

   :signature: stack-frame-source-location (server stack-frame) => (location exact? dylan?)

   :parameter server: An instance of :class:`<server>`.
   :parameter stack-frame: An instance of :class:`<stack-frame-object>`.
   :value location: An instance of :class:`<source-location>`, or ``#f``.
   :value exact?: An instance of :class:`<boolean>`.
   :value dylan?: An instance of :class:`<boolean>`.

.. method:: stack-frame-source-location
   :specializer: <project-object>, <stack-frame-object>

.. generic-function:: stack-frame-thread
   :open:

   :signature: stack-frame-thread (server stack-frame) => (thread)

   :parameter server: An instance of :class:`<server>`.
   :parameter stack-frame: An instance of :class:`<stack-frame-object>`.
   :value thread: An instance of :class:`<thread-object>`.

.. method:: stack-frame-thread
   :specializer: <project-object>, <stack-frame-object>

.. generic-function:: stack-frame-type
   :open:

   :signature: stack-frame-type (server stack-frame) => (type)

   :parameter server: An instance of :class:`<server>`.
   :parameter stack-frame: An instance of :class:`<stack-frame-object>`.
   :value type: An instance of :class:`<symbol>`.

.. method:: stack-frame-type
   :specializer: <project-object>, <stack-frame-object>

.. generic-function:: stack-frame-next-frame
   :open:

   :signature: stack-frame-next-frame (server stack-frame) => (next-one)

   :parameter server: An instance of :class:`<server>`.
   :parameter stack-frame: An instance of :class:`<stack-frame-object>`.
   :value next-one: An instance of :class:`<stack-frame-object>`, or ``#f``.

.. method:: stack-frame-next-frame
   :specializer: <project-object>, <stack-frame-object>

.. generic-function:: stack-frame-previous-frame
   :open:

   :signature: stack-frame-previous-frame (server stack-frame) => (previous-one)

   :parameter server: An instance of :class:`<server>`.
   :parameter stack-frame: An instance of :class:`<stack-frame-object>`.
   :value previous-one: An instance of :class:`<stack-frame-object>`, or ``#f``.

.. method:: stack-frame-previous-frame
   :specializer: <project-object>, <stack-frame-object>

.. generic-function:: stack-frame-local-variables
   :open:

   :signature: stack-frame-local-variables (server stack-frame) => (locals)

   :parameter server: An instance of :class:`<server>`.
   :parameter stack-frame: An instance of :class:`<stack-frame-object>`.
   :value locals: An instance of :class:`<sequence>`.

.. method:: stack-frame-local-variables
   :specializer: <project-object>, <stack-frame-object>

.. generic-function:: stack-frame-local-variable-count
   :open:

   :signature: stack-frame-local-variable-count (server stack-frame) => (locals-count)

   :parameter server: An instance of :class:`<server>`.
   :parameter stack-frame: An instance of :class:`<stack-frame-object>`.
   :value locals-count: An instance of :class:`<integer>`.

.. method:: stack-frame-local-variable-count
   :specializer: <project-object>, <stack-frame-object>

Compiler Warnings
=================

.. class:: <warning-object>
   :abstract:

   :superclasses: :class:`<environment-object>`


.. class:: <project-warning-object>

   :superclasses: :class:`<warning-object>`

   :keyword required proxy: An instance of :class:`<object>`.

.. class:: <compiler-warning-object>

   :superclasses: :class:`<compiler-object>`, :class:`<environment-object-with-library>`, :class:`<warning-object>`


.. class:: <serious-compiler-warning-object>

   :superclasses: :class:`<compiler-warning-object>`


.. class:: <compiler-error-object>

   :superclasses: :class:`<compiler-warning-object>`


.. generic-function:: compiler-warning-short-message
   :open:

   :signature: compiler-warning-short-message (server warning) => (message)

   :parameter server: An instance of :class:`<server>`.
   :parameter warning: An instance of :class:`<warning-object>`.
   :value message: An instance of :class:`<string>`.

.. method:: compiler-warning-short-message
   :specializer: <project-object>, <compiler-warning-object>

.. generic-function:: compiler-warning-full-message
   :open:

   :signature: compiler-warning-full-message (server warning) => (message)

   :parameter server: An instance of :class:`<server>`.
   :parameter warning: An instance of :class:`<warning-object>`.
   :value message: An instance of :class:`<string>`.

.. method:: compiler-warning-full-message
   :specializer: <project-object>, <compiler-warning-object>

.. generic-function:: environment-object-proxy

   :signature: environment-object-proxy (object) => (value)

   :parameter object: An instance of :class:`<project-warning-object>`.
   :value value: An instance of :class:`<object>`.

.. generic-function:: warning-owner
   :open:

   :signature: warning-owner (server warning) => (owner)

   :parameter server: An instance of :class:`<server>`.
   :parameter warning: An instance of :class:`<warning-object>`.
   :value owner: An instance of :class:`<environment-object>`, or ``#f``.

.. method:: warning-owner
   :specializer: <project-object>, <compiler-warning-object>

.. generic-function:: do-compiler-warnings
   :open:

   :signature: do-compiler-warnings (function server object #key client) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :parameter #key client: An instance of :class:`<object>`.

.. method:: do-compiler-warnings
   :specializer: <function>, <project-object>, <environment-object>

.. method:: do-compiler-warnings
   :specializer: <function>, <project-object>, <project-object>

.. function:: project-warnings

   :signature: project-warnings (project #key client) => (warnings)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :value warnings: An instance of :class:`<sequence>`.

.. function:: source-form-compiler-warnings

   :signature: source-form-compiler-warnings (server object #key client) => (warnings)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<source-form-object>`.
   :parameter #key client: An instance of :class:`<object>`.
   :value warnings: An instance of :class:`<sequence>`.

Condition Objects
=================

.. class:: <condition-object>

   :superclasses: :class:`<user-object>`

DUIM Objects
============

.. class:: <duim-object>

   :superclasses: :class:`<user-object>`


.. class:: <duim-frame-manager>

   :superclasses: :class:`<duim-object>`


.. class:: <duim-frame>

   :superclasses: :class:`<duim-object>`


.. class:: <duim-port>

   :superclasses: :class:`<duim-object>`


.. class:: <duim-sheet>

   :superclasses: :class:`<duim-object>`


.. class:: <duim-gadget>

   :superclasses: :class:`<duim-sheet>`


.. generic-function:: duim-object-composite?
   :open:

   :signature: duim-object-composite? (server duim-object) => (composite?)

   :parameter server: An instance of :class:`<server>`.
   :parameter duim-object: An instance of :class:`<duim-object>`.
   :value composite?: An instance of :class:`<boolean>`.

.. method:: duim-object-composite?
   :specializer: <server>, <duim-object>

.. method:: duim-object-composite?
   :specializer: <server>, <duim-sheet>

.. generic-function:: do-duim-object-children
   :open:

   :signature: do-duim-object-children (function server duim-object) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter server: An instance of :class:`<server>`.
   :parameter duim-object: An instance of :class:`<duim-object>`.

.. method:: do-duim-object-children
   :specializer: <function>, <server>, <duim-object>

.. method:: do-duim-object-children
   :specializer: <function>, <server>, <duim-port>

.. method:: do-duim-object-children
   :specializer: <function>, <server>, <duim-frame-manager>

.. method:: do-duim-object-children
   :specializer: <function>, <server>, <duim-sheet>

.. method:: do-duim-object-children
   :specializer: <function>, <server>, <duim-frame>

.. function:: duim-object-children

   :signature: duim-object-children (server object) => (children)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<duim-object>`.
   :value children: An instance of :class:`<sequence>`.

Profiling
=========

.. class:: <profile-state>

   :superclasses: :class:`<object>`


.. generic-function:: profiling-enabled?

   :signature: profiling-enabled? (server) => (enabled?)

   :parameter server: An instance of :class:`<server>`.
   :value enabled?: An instance of :class:`<boolean>`.

.. generic-function:: project-default-profile-options

   :signature: project-default-profile-options (project) => (options)

   :parameter project: An instance of :class:`<project-object>`.
   :value options: An instance of :class:`<profile-options>`, or ``#f``.

.. generic-function:: project-default-profile-options-setter

   :signature: project-default-profile-options-setter (options project) => (options)

   :parameter options: An instance of :class:`<profile-options>`, or ``#f``.
   :parameter project: An instance of :class:`<project-object>`.
   :value options: An instance of :class:`<profile-options>`, or ``#f``.

.. generic-function:: project-last-profile

   :signature: project-last-profile (project) => (profile)

   :parameter project: An instance of :class:`<project-object>`.
   :value profile: An instance of :class:`<application-profile>`, or ``#f``.

.. generic-function:: profile-snapshot-available-values
   :open:

   :signature: profile-snapshot-available-values (server) => (values)

   :parameter server: An instance of :class:`<server>`.
   :value values: An instance of :class:`<sequence>`.

.. method:: profile-snapshot-available-values
   :specializer: <project-object>

.. generic-function:: start-profiling-application
   :open:

   :signature: start-profiling-application (server #key options) => ()

   :parameter server: An instance of :class:`<server>`.
   :parameter #key options: An instance of :class:`<profile-options>`, or ``#f``.

.. method:: start-profiling-application
   :specializer: <project-object>

.. function:: ensure-profiling-started

   :signature: ensure-profiling-started (application) => ()

   :parameter application: An instance of :class:`<application>`.

.. generic-function:: stop-profiling-application
   :open:

   :signature: stop-profiling-application (server) => (profile)

   :parameter server: An instance of :class:`<server>`.
   :value profile: An instance of :class:`<application-profile>`, or ``#f``.

.. method:: stop-profiling-application
   :specializer: <project-object>

.. generic-function:: clear-profiling-results

   :signature: clear-profiling-results (server) => ()

   :parameter server: An instance of :class:`<server>`.

.. generic-function:: process-profiling-results
   :open:

   :signature: process-profiling-results (application) => (profile)

   :parameter application: An instance of :class:`<application>`.
   :value profile: An instance of :class:`<application-profile>`, or ``#f``.

Profiling Options
=================

.. class:: <profile-options>

   :superclasses: :class:`<object>`

   :keyword required sampling-options: An instance of :class:`<profile-sampling-options>`.
   :keyword required snapshot-options: An instance of :class:`<profile-snapshot-options>`.

.. class:: <profile-sampling-options>

   :superclasses: :class:`<object>`

   :keyword rate: An instance of :class:`<integer>`, or ``#f``.
   :keyword required style: An instance of :const:`<profile-sampling-style>`.

.. constant:: <profile-sampling-style>

.. class:: <profile-snapshot-options>

   :superclasses: :class:`<object>`

   :keyword stack-depth: An instance of :class:`<integer>`, or ``#f``.
   :keyword required values: An instance of :class:`<sequence>`.

.. generic-function:: profile-sampling-options

   :signature: profile-sampling-options (object) => (value)

   :parameter object: An instance of :class:`<profile-options>`.
   :value value: An instance of :class:`<profile-sampling-options>`.

.. generic-function:: profile-sampling-style

   :signature: profile-sampling-style (object) => (value)

   :parameter object: An instance of :class:`<profile-sampling-options>`.
   :value value: An instance of :const:`<profile-sampling-style>`.

.. generic-function:: profile-sampling-rate

   :signature: profile-sampling-rate (object) => (value)

   :parameter object: An instance of :class:`<profile-sampling-options>`.
   :value value: An instance of :class:`<integer>`, or ``#f``.

.. generic-function:: profile-snapshot-options

   :signature: profile-snapshot-options (object) => (value)

   :parameter object: An instance of :class:`<profile-options>`.
   :value value: An instance of :class:`<profile-snapshot-options>`.

.. generic-function:: profile-snapshot-values

   :signature: profile-snapshot-values (object) => (value)

   :parameter object: An instance of :class:`<profile-snapshot-options>`.
   :value value: An instance of :class:`<sequence>`.

.. generic-function:: profile-snapshot-stack-depth

   :signature: profile-snapshot-stack-depth (object) => (value)

   :parameter object: An instance of :class:`<profile-snapshot-options>`.
   :value value: An instance of :class:`<integer>`, or ``#f``.

Profile Results
===============

.. class:: <application-profile>
   :open:
   :abstract:

   :superclasses: :class:`<object>`

   :keyword required options: An instance of :class:`<profile-options>`.

.. generic-function:: application-profile-options
   :open:

   :signature: application-profile-options (profile) => (options)

   :parameter profile: An instance of :class:`<application-profile>`.
   :value options: An instance of :class:`<profile-options>`.

.. method:: application-profile-options
   :specializer: <application-profile>

.. generic-function:: application-profile-snapshots

   :signature: application-profile-snapshots (object) => (value)

   :parameter object: An instance of :class:`<application-profile>`.
   :value value: An instance of :class:`<stretchy-object-vector>`.

.. function:: do-application-profile-snapshots

   :signature: do-application-profile-snapshots (function profile) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter profile: An instance of :class:`<application-profile>`.

.. generic-function:: application-profile-threads

   :signature: application-profile-threads (object) => (value)

   :parameter object: An instance of :class:`<application-profile>`.
   :value value: An instance of :class:`<stretchy-object-vector>`.

.. function:: do-application-profile-threads

   :signature: do-application-profile-threads (function profile) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter profile: An instance of :class:`<application-profile>`.

.. function:: application-total-snapshots

   :signature: application-total-snapshots (profile) => (total)

   :parameter profile: An instance of :class:`<application-profile>`.
   :value total: An instance of :class:`<integer>`.

.. generic-function:: application-total-wall-time

   :signature: application-total-wall-time (object) => (value)

   :parameter object: An instance of :class:`<application-profile>`.
   :value value: An instance of :class:`<integer>`.

.. generic-function:: application-total-wall-time-setter

   :signature: application-total-wall-time-setter (value object) => (value)

   :parameter value: An instance of :class:`<integer>`.
   :parameter object: An instance of :class:`<application-profile>`.
   :value value: An instance of :class:`<integer>`.

.. generic-function:: application-total-page-faults

   :signature: application-total-page-faults (object) => (value)

   :parameter object: An instance of :class:`<application-profile>`.
   :value value: An instance of :class:`<integer>`.

.. generic-function:: application-total-page-faults-setter

   :signature: application-total-page-faults-setter (value object) => (value)

   :parameter value: An instance of :class:`<integer>`.
   :parameter object: An instance of :class:`<application-profile>`.
   :value value: An instance of :class:`<integer>`.

.. class:: <application-snapshot>
   :open:
   :abstract:

   :superclasses: :class:`<object>`

   :keyword required page-faults: An instance of :class:`<integer>`, or ``#f``.
   :keyword required thread-snapshots: An instance of :class:`<simple-object-vector>`.
   :keyword required wall-time: An instance of :class:`<integer>`, or ``#f``.

.. generic-function:: application-snapshot-wall-time

   :signature: application-snapshot-wall-time (object) => (value)

   :parameter object: An instance of :class:`<application-snapshot>`.
   :value value: An instance of :class:`<integer>`, or ``#f``.

.. generic-function:: application-snapshot-page-faults

   :signature: application-snapshot-page-faults (object) => (value)

   :parameter object: An instance of :class:`<application-snapshot>`.
   :value value: An instance of :class:`<integer>`, or ``#f``.

.. function:: application-snapshot-thread-snapshot

   :signature: application-snapshot-thread-snapshot (snapshot thread) => (thread-snapshot)

   :parameter snapshot: An instance of :class:`<application-snapshot>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value thread-snapshot: An instance of :class:`<thread-snapshot>`, or ``#f``.

.. generic-function:: application-snapshot-thread-snapshots

   :signature: application-snapshot-thread-snapshots (object) => (value)

   :parameter object: An instance of :class:`<application-snapshot>`.
   :value value: An instance of :class:`<simple-object-vector>`.

.. function:: do-application-snapshot-thread-snapshots

   :signature: do-application-snapshot-thread-snapshots (function snapshot) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter snapshot: An instance of :class:`<application-snapshot>`.

.. function:: thread-profile-snapshots

   :signature: thread-profile-snapshots (application profile thread) => (threads)

   :parameter application: An instance of :class:`<application>`.
   :parameter profile: An instance of :class:`<application-profile>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value threads: An instance of :class:`<sequence>`.

.. function:: do-thread-profile-snapshots

   :signature: do-thread-profile-snapshots (function application profile thread) => (threads)

   :parameter function: An instance of :class:`<function>`.
   :parameter application: An instance of :class:`<application>`.
   :parameter profile: An instance of :class:`<application-profile>`.
   :parameter thread: An instance of :class:`<thread-object>`.
   :value threads: An instance of :class:`<sequence>`.

.. class:: <thread-snapshot>
   :open:
   :abstract:

   :superclasses: :class:`<object>`

   :keyword required allocated-class: An instance of :class:`<class-object>`, or ``#f``.
   :keyword required allocation: An instance of :class:`<integer>`, or ``#f``.
   :keyword required cpu-time: An instance of :class:`<integer>`, or ``#f``.
   :keyword required thread: An instance of :class:`<thread-object>`.

.. generic-function:: thread-snapshot-thread

   :signature: thread-snapshot-thread (object) => (value)

   :parameter object: An instance of :class:`<thread-snapshot>`.
   :value value: An instance of :class:`<thread-object>`.

.. generic-function:: thread-snapshot-cpu-time

   :signature: thread-snapshot-cpu-time (object) => (value)

   :parameter object: An instance of :class:`<thread-snapshot>`.
   :value value: An instance of :class:`<integer>`, or ``#f``.

.. generic-function:: thread-snapshot-allocated-class

   :signature: thread-snapshot-allocated-class (object) => (value)

   :parameter object: An instance of :class:`<thread-snapshot>`.
   :value value: An instance of :class:`<class-object>`, or ``#f``.

.. generic-function:: thread-snapshot-allocation

   :signature: thread-snapshot-allocation (object) => (value)

   :parameter object: An instance of :class:`<thread-snapshot>`.
   :value value: An instance of :class:`<integer>`, or ``#f``.

.. generic-function:: thread-snapshot-stack-size
   :open:

   :signature: thread-snapshot-stack-size (application snapshot) => (size)

   :parameter application: An instance of :class:`<application>`.
   :parameter snapshot: An instance of :class:`<thread-snapshot>`.
   :value size: An instance of :class:`<integer>`.

.. function:: thread-snapshot-frame-snapshots

   :signature: thread-snapshot-frame-snapshots (application snapshot) => (snapshots)

   :parameter application: An instance of :class:`<application>`.
   :parameter snapshot: An instance of :class:`<thread-snapshot>`.
   :value snapshots: An instance of :class:`<simple-object-vector>`.

.. generic-function:: process-thread-snapshot-frame-snapshots
   :open:

   :signature: process-thread-snapshot-frame-snapshots (application snapshot) => (frame-snapshots)

   :parameter application: An instance of :class:`<application>`.
   :parameter snapshot: An instance of :class:`<thread-snapshot>`.
   :value frame-snapshots: An instance of :class:`<simple-object-vector>`.

.. function:: thread-snapshot-functions

   :signature: thread-snapshot-functions (application snapshot) => (functions)

   :parameter application: An instance of :class:`<application>`.
   :parameter snapshot: An instance of :class:`<thread-snapshot>`.
   :value functions: An instance of :class:`<sequence>`.

.. function:: do-thread-snapshot-functions

   :signature: do-thread-snapshot-functions (function application snapshot) => ()

   :parameter function: An instance of :class:`<function>`.
   :parameter application: An instance of :class:`<application>`.
   :parameter snapshot: An instance of :class:`<thread-snapshot>`.

.. class:: <thread-frame-snapshot>
   :open:
   :abstract:

   :superclasses: :class:`<object>`

   :keyword required function: An instance of :class:`<application-code-object>`, or ``#f``.
   :keyword required source-location: An instance of :class:`<source-location>`, or ``#f``.

.. generic-function:: frame-snapshot-function

   :signature: frame-snapshot-function (object) => (value)

   :parameter object: An instance of :class:`<thread-frame-snapshot>`.
   :value value: An instance of :class:`<application-code-object>`, or ``#f``.

.. generic-function:: frame-snapshot-source-location

   :signature: frame-snapshot-source-location (object) => (value)

   :parameter object: An instance of :class:`<thread-frame-snapshot>`.
   :value value: An instance of :class:`<source-location>`, or ``#f``.

Channels
========

.. constant:: $project-channel

   Some channel stuff for communicating project messages to interested
   parties.

.. class:: <project-message>
   :abstract:

   :superclasses: :class:`<object>`


.. class:: <project-object-message>
   :abstract:

   :superclasses: :class:`<project-message>`

   :keyword required project: An instance of :class:`<project-object>`.

.. class:: <project-opened-message>

   :superclasses: :class:`<project-object-message>`


.. class:: <project-closed-message>

   :superclasses: :class:`<project-object-message>`


.. class:: <project-now-active-message>

   :superclasses: :class:`<project-object-message>`


.. class:: <no-active-project-message>

   :superclasses: :class:`<project-message>`


.. class:: <project-sources-updated-message>

   :superclasses: :class:`<project-object-message>`


.. class:: <project-database-updated-message>

   :superclasses: :class:`<project-object-message>`


.. class:: <project-warnings-updated-message>

   :superclasses: :class:`<project-object-message>`


.. generic-function:: message-project

   :signature: message-project (object) => (value)

   :parameter object: An instance of :class:`<project-object-message>`.
   :value value: An instance of :class:`<project-object>`.

.. class:: <breakpoint-state-change-message>
   :abstract:

   :superclasses: :class:`<project-object-message>`

   :keyword required state: An instance of :const:`<breakpoint-state>`.

.. class:: <all-breakpoints-state-change-message>

   :superclasses: :class:`<breakpoint-state-change-message>`


.. class:: <single-breakpoint-state-change-message>

   :superclasses: :class:`<breakpoint-state-change-message>`

   :keyword required breakpoint: An instance of :class:`<breakpoint-object>`.

.. class:: <breakpoint-state-changes-failed-message>

   :superclasses: :class:`<breakpoint-state-change-message>`

   :keyword required breakpoints: An instance of :class:`<sequence>`.

.. generic-function:: message-breakpoint-state

   :signature: message-breakpoint-state (object) => (value)

   :parameter object: An instance of :class:`<breakpoint-state-change-message>`.
   :value value: An instance of :const:`<breakpoint-state>`.

.. generic-function:: message-breakpoint

   :signature: message-breakpoint (object) => (value)

   :parameter object: An instance of :class:`<single-breakpoint-state-change-message>`.
   :value value: An instance of :class:`<breakpoint-object>`.

.. generic-function:: message-breakpoints

   :signature: message-breakpoints (object) => (value)

   :parameter object: An instance of :class:`<breakpoint-state-changes-failed-message>`.
   :value value: An instance of :class:`<sequence>`.

.. class:: <profiling-message>
   :abstract:

   :superclasses: :class:`<project-object-message>`


.. class:: <profiling-state-change-message>

   :superclasses: :class:`<profiling-message>`

   :keyword required enabled?: An instance of :class:`<boolean>`.

.. generic-function:: message-enabled?

   :signature: message-enabled? (object) => (value)

   :parameter object: An instance of :class:`<profiling-state-change-message>`.
   :value value: An instance of :class:`<boolean>`.

Application Messages
====================

.. class:: <application-message>
   :abstract:

   :superclasses: :class:`<project-object-message>`


.. class:: <run-application-requested-message>

   :superclasses: :class:`<application-message>`


.. class:: <run-application-failed-message>

   :superclasses: :class:`<application-message>`


.. class:: <application-initialized-message>

   :superclasses: :class:`<application-message>`


.. class:: <application-state-changed-message>

   :superclasses: :class:`<application-message>`


.. class:: <application-threads-changed-message>

   :superclasses: :class:`<application-message>`


.. class:: <thread-message>
   :abstract:

   :superclasses: :class:`<application-message>`

   :keyword required thread: An instance of :class:`<thread-object>`.

.. class:: <thread-interactive-warnings-message>

   :superclasses: :class:`<thread-message>`

   :keyword required transaction-id: An instance of :class:`<object>`.
   :keyword required warnings: An instance of :class:`<object>`.

.. generic-function:: message-thread

   :signature: message-thread (object) => (value)

   :parameter object: An instance of :class:`<thread-message>`.
   :value value: An instance of :class:`<thread-object>`.

.. generic-function:: message-transaction-id

   :signature: message-transaction-id (object) => (value)

   :parameter object: An instance of :class:`<thread-interactive-warnings-message>`.
   :value value: An instance of :class:`<object>`.

.. generic-function:: message-warnings

   :signature: message-warnings (object) => (value)

   :parameter object: An instance of :class:`<thread-interactive-warnings-message>`.
   :value value: An instance of :class:`<object>`.

Printing Utilities
==================

.. generic-function:: print-source-location

   :signature: print-source-location (stream location #key line-number) => ()

   :parameter stream: An instance of :class:`<stream>`.
   :parameter location: An instance of :class:`<source-location>`.
   :parameter #key line-number: An instance of :class:`<integer>`, or ``#f``.

.. function:: application-state-label

   :signature: application-state-label (project) => (label)

   :parameter project: An instance of :class:`<project-object>`.
   :value label: An instance of :class:`<string>`.

.. function:: thread-state-label

   :signature: thread-state-label (project state) => (label)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter state: An instance of :class:`<symbol>`.
   :value label: An instance of :class:`<string>`.

.. generic-function:: environment-object-contents

   :signature: environment-object-contents (project object) => (contents)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :value contents: An instance of :class:`<string>`.

.. generic-function:: environment-object-description

   :signature: environment-object-description (project object module) => (description)

   :parameter project: An instance of :class:`<project-object>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :parameter module: An instance of :class:`<module-object>`.
   :value description: An instance of :class:`<string>`.

.. method:: environment-object-description
   :specializer: <project-object>, <environment-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <definition-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <user-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <collection-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <class-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <domain-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <dylan-function-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <library-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <macro-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <module-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <module-variable-object>, <module-object>

.. method:: environment-object-description
   :specializer: <project-object>, <constant-object>, <module-object>

.. function:: print-function-parameters

   :signature: print-function-parameters (server function-object namespace) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter function-object: An instance of :class:`<function-object>`.
   :parameter namespace: An instance of :class:`<namespace-object>`, or ``#f``.
   :value name: An instance of :class:`<string>`.

.. function:: print-function-values

   :signature: print-function-values (server function-object namespace) => (name)

   :parameter server: An instance of :class:`<server>`.
   :parameter function-object: An instance of :class:`<function-object>`.
   :parameter namespace: An instance of :class:`<namespace-object>`, or ``#f``.
   :value name: An instance of :class:`<string>`.

.. generic-function:: print-environment-object-location
   :open:

   :signature: print-environment-object-location (server object #key absolute-path?) => (location)

   :parameter server: An instance of :class:`<server>`.
   :parameter object: An instance of :class:`<environment-object>`.
   :parameter #key absolute-path?: An instance of :class:`<boolean>`.
   :value location: An instance of :class:`<string>`.

.. method:: print-environment-object-location
   :specializer: <project-object>, <environment-object>

.. method:: print-environment-object-location
   :specializer: <project-object>, <project-object>

.. constant:: $n/a

.. constant:: $type-n/a

.. constant:: $no-information-available

.. constant:: $unknown-name

.. constant:: $unknown

.. constant:: $project-not-built

.. constant:: $interactive-definition

.. constant:: $not-available

.. constant:: $not-applicable
