module: gobject
synopsis: generated bindings for the GObject library
copyright: See LICENSE file in this distribution.


define C-pointer-type <C-void**> => <C-void*>;
ignore(<C-void**>);

define C-pointer-type <GError*> => <GError>;
ignore(<GError*>);

define open C-subtype <GBinding> (<GObject>)
end C-subtype;

define C-pointer-type <GBinding*> => <GBinding>;

define sealed domain make (singleton(<GBinding*>));
define sealed domain initialize (<GBinding*>);

define inline-only C-function g-binding-dup-source
  input parameter self :: <GBinding>;
  result res :: <GObject>;
  c-name: "g_binding_dup_source";
end;

define inline-only C-function g-binding-dup-target
  input parameter self :: <GBinding>;
  result res :: <GObject>;
  c-name: "g_binding_dup_target";
end;

define inline-only C-function g-binding-get-flags
  input parameter self :: <GBinding>;
  result res :: <GBindingFlags>;
  c-name: "g_binding_get_flags";
end;

define inline-only C-function g-binding-get-source-property
  input parameter self :: <GBinding>;
  result res :: <C-string>;
  c-name: "g_binding_get_source_property";
end;

define inline-only C-function g-binding-get-target-property
  input parameter self :: <GBinding>;
  result res :: <C-string>;
  c-name: "g_binding_get_target_property";
end;

define inline-only C-function g-binding-unbind
  input parameter self :: <GBinding>;
  c-name: "g_binding_unbind";
end;

define inline-only constant $g-binding-default = 0;
define inline-only constant $g-binding-bidirectional = 1;
define inline-only constant $g-binding-sync-create = 2;
define inline-only constant $g-binding-invert-boolean = 4;
define constant <GBindingFlags> = <C-int>;
define C-pointer-type <GBindingFlags*> => <GBindingFlags>;

define open C-subtype <GBindingGroup> (<GObject>)
end C-subtype;

define C-pointer-type <GBindingGroup*> => <GBindingGroup>;

define sealed domain make (singleton(<GBindingGroup*>));
define sealed domain initialize (<GBindingGroup*>);

define inline-only C-function g-binding-group-new
  result res :: <GBindingGroup>;
  c-name: "g_binding_group_new";
end;

define inline-only C-function g-binding-group-bind
  input parameter self :: <GBindingGroup>;
  input parameter source_property_ :: <C-string>;
  input parameter target_ :: <GObject>;
  input parameter target_property_ :: <C-string>;
  input parameter flags_ :: <GBindingFlags>;
  c-name: "g_binding_group_bind";
end;

define inline-only C-function g-binding-group-bind-with-closures
  input parameter self :: <GBindingGroup>;
  input parameter source_property_ :: <C-string>;
  input parameter target_ :: <GObject>;
  input parameter target_property_ :: <C-string>;
  input parameter flags_ :: <GBindingFlags>;
  input parameter transform_to_ :: <GClosure>;
  input parameter transform_from_ :: <GClosure>;
  c-name: "g_binding_group_bind_with_closures";
end;

define inline-only C-function g-binding-group-dup-source
  input parameter self :: <GBindingGroup>;
  result res :: <GObject>;
  c-name: "g_binding_group_dup_source";
end;

define inline-only C-function g-binding-group-set-source
  input parameter self :: <GBindingGroup>;
  input parameter source_ :: <GObject>;
  c-name: "g_binding_group_set_source";
end;

define C-struct <_GCClosure>
  sealed inline-only slot g-c-closure-closure :: <GClosure>;
  sealed inline-only slot g-c-closure-callback :: <C-void*>;
  pointer-type-name: <GCClosure>;
end C-struct;

define sealed domain make (singleton(<GCClosure>));
define sealed domain initialize (<GCClosure>);

define inline-only C-function g-cclosure-marshal-boolean--boxed-boxed
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_BOOLEAN__BOXED_BOXED";
end;

define inline-only C-function g-cclosure-marshal-boolean--flags
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_BOOLEAN__FLAGS";
end;

define inline-only C-function g-cclosure-marshal-string--object-pointer
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_STRING__OBJECT_POINTER";
end;

define inline-only C-function g-cclosure-marshal-void--boolean
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__BOOLEAN";
end;

define inline-only C-function g-cclosure-marshal-void--boxed
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__BOXED";
end;

define inline-only C-function g-cclosure-marshal-void--char
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__CHAR";
end;

define inline-only C-function g-cclosure-marshal-void--double
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__DOUBLE";
end;

define inline-only C-function g-cclosure-marshal-void--enum
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__ENUM";
end;

define inline-only C-function g-cclosure-marshal-void--flags
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__FLAGS";
end;

define inline-only C-function g-cclosure-marshal-void--float
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__FLOAT";
end;

define inline-only C-function g-cclosure-marshal-void--int
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__INT";
end;

define inline-only C-function g-cclosure-marshal-void--long
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__LONG";
end;

define inline-only C-function g-cclosure-marshal-void--object
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__OBJECT";
end;

define inline-only C-function g-cclosure-marshal-void--param
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__PARAM";
end;

define inline-only C-function g-cclosure-marshal-void--pointer
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__POINTER";
end;

define inline-only C-function g-cclosure-marshal-void--string
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__STRING";
end;

define inline-only C-function g-cclosure-marshal-void--uchar
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__UCHAR";
end;

define inline-only C-function g-cclosure-marshal-void--uint
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__UINT";
end;

define inline-only C-function g-cclosure-marshal-void--uint-pointer
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__UINT_POINTER";
end;

define inline-only C-function g-cclosure-marshal-void--ulong
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__ULONG";
end;

define inline-only C-function g-cclosure-marshal-void--variant
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__VARIANT";
end;

define inline-only C-function g-cclosure-marshal-void--void
  input parameter closure_ :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_VOID__VOID";
end;

define inline-only C-function g-cclosure-marshal-generic
  input parameter closure_ :: <GClosure>;
  input parameter return_gvalue_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <GValue>;
  input parameter invocation_hint_ :: <C-void*>;
  input parameter marshal_data_ :: <C-void*>;
  c-name: "g_cclosure_marshal_generic";
end;

define C-struct <_GClosure>
  constant sealed inline-only slot g-closure-ref-count :: <C-unsigned-int>;
  constant sealed inline-only slot g-closure-meta-marshal-nouse :: <C-unsigned-int>;
  constant sealed inline-only slot g-closure-n-guards :: <C-unsigned-int>;
  constant sealed inline-only slot g-closure-n-fnotifiers :: <C-unsigned-int>;
  constant sealed inline-only slot g-closure-n-inotifiers :: <C-unsigned-int>;
  constant sealed inline-only slot g-closure-in-inotify :: <C-unsigned-int>;
  constant sealed inline-only slot g-closure-floating :: <C-unsigned-int>;
  constant sealed inline-only slot g-closure-derivative-flag :: <C-unsigned-int>;
  sealed inline-only slot g-closure-in-marshal :: <C-unsigned-int>;
  sealed inline-only slot g-closure-is-invalid :: <C-unsigned-int>;
  constant sealed inline-only slot g-closure-marshal :: <C-function-pointer>;
  constant sealed inline-only slot g-closure-data :: <C-void*>;
  constant sealed inline-only slot g-closure-notifiers :: <GClosureNotifyData>;
  pointer-type-name: <GClosure>;
end C-struct;

define sealed domain make (singleton(<GClosure>));
define sealed domain initialize (<GClosure>);

define inline-only C-function g-closure-new-object
  input parameter sizeof_closure_ :: <C-unsigned-int>;
  input parameter object_ :: <GObject>;
  result res :: <GClosure>;
  c-name: "g_closure_new_object";
end;

define inline-only C-function g-closure-new-simple
  input parameter sizeof_closure_ :: <C-unsigned-int>;
  input parameter data_ :: <C-void*>;
  result res :: <GClosure>;
  c-name: "g_closure_new_simple";
end;

define inline-only C-function g-closure-invalidate
  input parameter self :: <GClosure>;
  c-name: "g_closure_invalidate";
end;

define inline-only C-function g-closure-invoke
  input parameter self :: <GClosure>;
  input parameter return_value_ :: <GValue>;
  input parameter n_param_values_ :: <C-unsigned-int>;
  input parameter param_values_ :: <C-unsigned-char*> /* Not supported */;
  input parameter invocation_hint_ :: <C-void*>;
  c-name: "g_closure_invoke";
end;

define inline-only C-function g-closure-ref
  input parameter self :: <GClosure>;
  result res :: <GClosure>;
  c-name: "g_closure_ref";
end;

define inline-only C-function g-closure-sink
  input parameter self :: <GClosure>;
  c-name: "g_closure_sink";
end;

define inline-only C-function g-closure-unref
  input parameter self :: <GClosure>;
  c-name: "g_closure_unref";
end;

define C-struct <_GClosureNotifyData>
  sealed inline-only slot g-closure-notify-data-data :: <C-void*>;
  sealed inline-only slot g-closure-notify-data-notify :: <C-function-pointer>;
  pointer-type-name: <GClosureNotifyData>;
end C-struct;

define sealed domain make (singleton(<GClosureNotifyData>));
define sealed domain initialize (<GClosureNotifyData>);

define inline-only constant $g-connect-default = 0;
define inline-only constant $g-connect-after = 1;
define inline-only constant $g-connect-swapped = 2;
define constant <GConnectFlags> = <C-int>;
define C-pointer-type <GConnectFlags*> => <GConnectFlags>;

define C-struct <_GEnumClass>
  sealed inline-only slot g-enum-class-g-type-class :: <GTypeClass>;
  sealed inline-only slot g-enum-class-minimum :: <C-signed-int>;
  sealed inline-only slot g-enum-class-maximum :: <C-signed-int>;
  sealed inline-only slot g-enum-class-n-values :: <C-unsigned-int>;
  sealed inline-only slot g-enum-class-values :: <GEnumValue>;
  pointer-type-name: <GEnumClass>;
end C-struct;

define sealed domain make (singleton(<GEnumClass>));
define sealed domain initialize (<GEnumClass>);

define C-struct <_GEnumValue>
  sealed inline-only slot g-enum-value-value :: <C-signed-int>;
  sealed inline-only slot g-enum-value-value-name :: <C-string>;
  sealed inline-only slot g-enum-value-value-nick :: <C-string>;
  pointer-type-name: <GEnumValue>;
end C-struct;

define sealed domain make (singleton(<GEnumValue>));
define sealed domain initialize (<GEnumValue>);

define C-struct <_GFlagsClass>
  sealed inline-only slot g-flags-class-g-type-class :: <GTypeClass>;
  sealed inline-only slot g-flags-class-mask :: <C-unsigned-int>;
  sealed inline-only slot g-flags-class-n-values :: <C-unsigned-int>;
  sealed inline-only slot g-flags-class-values :: <GFlagsValue>;
  pointer-type-name: <GFlagsClass>;
end C-struct;

define sealed domain make (singleton(<GFlagsClass>));
define sealed domain initialize (<GFlagsClass>);

define C-struct <_GFlagsValue>
  sealed inline-only slot g-flags-value-value :: <C-unsigned-int>;
  sealed inline-only slot g-flags-value-value-name :: <C-string>;
  sealed inline-only slot g-flags-value-value-nick :: <C-string>;
  pointer-type-name: <GFlagsValue>;
end C-struct;

define sealed domain make (singleton(<GFlagsValue>));
define sealed domain initialize (<GFlagsValue>);

define open C-subtype <GInitiallyUnowned> (<GObject>)
  // g_type_instance
  // ref_count
  // qdata
end C-subtype;

define C-pointer-type <GInitiallyUnowned*> => <GInitiallyUnowned>;

define sealed domain make (singleton(<GInitiallyUnowned*>));
define sealed domain initialize (<GInitiallyUnowned*>);

define C-struct <_GInitiallyUnownedClass>
  constant sealed inline-only slot g-initially-unowned-class-g-type-class :: <GTypeClass>;
  constant sealed inline-only slot g-initially-unowned-class-construct-properties :: <GSList>;
  constant sealed inline-only slot g-initially-unowned-class-constructor :: <C-void*>;
  constant sealed inline-only slot g-initially-unowned-class-set-property :: <C-function-pointer>;
  constant sealed inline-only slot g-initially-unowned-class-get-property :: <C-function-pointer>;
  constant sealed inline-only slot g-initially-unowned-class-dispose :: <C-function-pointer>;
  constant sealed inline-only slot g-initially-unowned-class-finalize :: <C-function-pointer>;
  constant sealed inline-only slot g-initially-unowned-class-dispatch-properties-changed :: <C-function-pointer>;
  constant sealed inline-only slot g-initially-unowned-class-notify :: <C-function-pointer>;
  constant sealed inline-only slot g-initially-unowned-class-constructed :: <C-function-pointer>;
  constant sealed inline-only slot g-initially-unowned-class-flags :: <C-unsigned-long>;
  constant sealed inline-only slot g-initially-unowned-class-n-construct-properties :: <C-unsigned-long>;
  constant sealed inline-only slot g-initially-unowned-class-pspecs :: <C-void*>;
  constant sealed inline-only slot g-initially-unowned-class-n-pspecs :: <C-unsigned-long>;
  constant sealed inline-only slot g-initially-unowned-class-pdummy :: <C-void*>;
  pointer-type-name: <GInitiallyUnownedClass>;
end C-struct;

define sealed domain make (singleton(<GInitiallyUnownedClass>));
define sealed domain initialize (<GInitiallyUnownedClass>);

define C-struct <_GInterfaceInfo>
  sealed inline-only slot g-interface-info-interface-init :: <C-function-pointer>;
  sealed inline-only slot g-interface-info-interface-finalize :: <C-function-pointer>;
  sealed inline-only slot g-interface-info-interface-data :: <C-void*>;
  pointer-type-name: <GInterfaceInfo>;
end C-struct;

define sealed domain make (singleton(<GInterfaceInfo>));
define sealed domain initialize (<GInterfaceInfo>);

define open C-subtype <GObject> (<GTypeInstance>)
  // g_type_instance
  // ref_count
  // qdata
end C-subtype;

define C-pointer-type <GObject*> => <GObject>;

define sealed domain make (singleton(<GObject*>));
define sealed domain initialize (<GObject*>);

define inline-only C-function g-object-compat-control
  input parameter what_ :: <C-unsigned-long>;
  input parameter data_ :: <C-void*>;
  result res :: <C-unsigned-long>;
  c-name: "g_object_compat_control";
end;

define inline-only C-function g-object-interface-find-property
  input parameter g_iface_ :: <GTypeInterface>;
  input parameter property_name_ :: <C-string>;
  result res :: <GParamSpec>;
  c-name: "g_object_interface_find_property";
end;

define inline-only C-function g-object-interface-install-property
  input parameter g_iface_ :: <GTypeInterface>;
  input parameter pspec_ :: <GParamSpec>;
  c-name: "g_object_interface_install_property";
end;

define inline-only C-function g-object-interface-list-properties
  input parameter g_iface_ :: <GTypeInterface>;
  output parameter n_properties_p_ :: <C-unsigned-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "g_object_interface_list_properties";
end;

define inline-only C-function g-object-bind-property
  input parameter self :: <GObject>;
  input parameter source_property_ :: <C-string>;
  input parameter target_ :: <GObject>;
  input parameter target_property_ :: <C-string>;
  input parameter flags_ :: <GBindingFlags>;
  result res :: <GBinding>;
  c-name: "g_object_bind_property";
end;

define inline-only C-function g-object-bind-property-with-closures
  input parameter self :: <GObject>;
  input parameter source_property_ :: <C-string>;
  input parameter target_ :: <GObject>;
  input parameter target_property_ :: <C-string>;
  input parameter flags_ :: <GBindingFlags>;
  input parameter transform_to_ :: <GClosure>;
  input parameter transform_from_ :: <GClosure>;
  result res :: <GBinding>;
  c-name: "g_object_bind_property_with_closures";
end;

define inline-only C-function g-object-force-floating
  input parameter self :: <GObject>;
  c-name: "g_object_force_floating";
end;

define inline-only C-function g-object-freeze-notify
  input parameter self :: <GObject>;
  c-name: "g_object_freeze_notify";
end;

define inline-only C-function g-object-get-data
  input parameter self :: <GObject>;
  input parameter key_ :: <C-string>;
  result res :: <C-void*>;
  c-name: "g_object_get_data";
end;

define inline-only C-function g-object-get-property
  input parameter self :: <GObject>;
  input parameter property_name_ :: <C-string>;
  input parameter value_ :: <GValue>;
  c-name: "g_object_get_property";
end;

define inline-only C-function g-object-get-qdata
  input parameter self :: <GObject>;
  input parameter quark_ :: <C-unsigned-int>;
  result res :: <C-void*>;
  c-name: "g_object_get_qdata";
end;

define inline-only C-function g-object-getv
  input parameter self :: <GObject>;
  input parameter n_properties_ :: <C-unsigned-int>;
  input parameter names_ :: <C-string*>;
  input parameter values_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "g_object_getv";
end;

define inline-only C-function g-object-is-floating
  input parameter self :: <GObject>;
  result res :: <C-boolean>;
  c-name: "g_object_is_floating";
end;

define inline-only C-function g-object-notify
  input parameter self :: <GObject>;
  input parameter property_name_ :: <C-string>;
  c-name: "g_object_notify";
end;

define inline-only C-function g-object-notify-by-pspec
  input parameter self :: <GObject>;
  input parameter pspec_ :: <GParamSpec>;
  c-name: "g_object_notify_by_pspec";
end;

define inline-only C-function g-object-ref
  input parameter self :: <GObject>;
  result res :: <GObject>;
  c-name: "g_object_ref";
end;

define inline-only C-function g-object-ref-sink
  input parameter self :: <GObject>;
  result res :: <C-void*>;
  c-name: "g_object_ref_sink";
end;

define inline-only C-function g-object-run-dispose
  input parameter self :: <GObject>;
  c-name: "g_object_run_dispose";
end;

define inline-only C-function g-object-set-data
  input parameter self :: <GObject>;
  input parameter key_ :: <C-string>;
  input parameter data_ :: <C-void*>;
  c-name: "g_object_set_data";
end;

define inline-only C-function g-object-set-property
  input parameter self :: <GObject>;
  input parameter property_name_ :: <C-string>;
  input parameter value_ :: <GValue>;
  c-name: "g_object_set_property";
end;

define inline-only C-function g-object-steal-data
  input parameter self :: <GObject>;
  input parameter key_ :: <C-string>;
  result res :: <C-void*>;
  c-name: "g_object_steal_data";
end;

define inline-only C-function g-object-steal-qdata
  input parameter self :: <GObject>;
  input parameter quark_ :: <C-unsigned-int>;
  result res :: <C-void*>;
  c-name: "g_object_steal_qdata";
end;

define inline-only C-function g-object-thaw-notify
  input parameter self :: <GObject>;
  c-name: "g_object_thaw_notify";
end;

define inline-only C-function g-object-unref
  input parameter self :: <GObject>;
  c-name: "g_object_unref";
end;

define inline-only C-function g-object-watch-closure
  input parameter self :: <GObject>;
  input parameter closure_ :: <GClosure>;
  c-name: "g_object_watch_closure";
end;

define C-struct <_GObjectClass>
  constant sealed inline-only slot g-object-class-g-type-class :: <GTypeClass>;
  constant sealed inline-only slot g-object-class-construct-properties :: <GSList>;
  constant sealed inline-only slot g-object-class-constructor :: <C-void*>;
  constant sealed inline-only slot g-object-class-set-property :: <C-function-pointer>;
  constant sealed inline-only slot g-object-class-get-property :: <C-function-pointer>;
  constant sealed inline-only slot g-object-class-dispose :: <C-function-pointer>;
  constant sealed inline-only slot g-object-class-finalize :: <C-function-pointer>;
  constant sealed inline-only slot g-object-class-dispatch-properties-changed :: <C-function-pointer>;
  constant sealed inline-only slot g-object-class-notify :: <C-function-pointer>;
  constant sealed inline-only slot g-object-class-constructed :: <C-function-pointer>;
  constant sealed inline-only slot g-object-class-flags :: <C-unsigned-long>;
  constant sealed inline-only slot g-object-class-n-construct-properties :: <C-unsigned-long>;
  constant sealed inline-only slot g-object-class-pspecs :: <C-void*>;
  constant sealed inline-only slot g-object-class-n-pspecs :: <C-unsigned-long>;
  constant sealed inline-only slot g-object-class-pdummy :: <C-void*>;
  pointer-type-name: <GObjectClass>;
end C-struct;

define sealed domain make (singleton(<GObjectClass>));
define sealed domain initialize (<GObjectClass>);

define inline-only C-function g-object-class-find-property
  input parameter self :: <GObjectClass>;
  input parameter property_name_ :: <C-string>;
  result res :: <GParamSpec>;
  c-name: "g_object_class_find_property";
end;

define inline-only C-function g-object-class-install-properties
  input parameter self :: <GObjectClass>;
  input parameter n_pspecs_ :: <C-unsigned-int>;
  input parameter pspecs_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "g_object_class_install_properties";
end;

define inline-only C-function g-object-class-install-property
  input parameter self :: <GObjectClass>;
  input parameter property_id_ :: <C-unsigned-int>;
  input parameter pspec_ :: <GParamSpec>;
  c-name: "g_object_class_install_property";
end;

define inline-only C-function g-object-class-list-properties
  input parameter self :: <GObjectClass>;
  output parameter n_properties_ :: <C-unsigned-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "g_object_class_list_properties";
end;

define inline-only C-function g-object-class-override-property
  input parameter self :: <GObjectClass>;
  input parameter property_id_ :: <C-unsigned-int>;
  input parameter name_ :: <C-string>;
  c-name: "g_object_class_override_property";
end;

define C-struct <_GObjectConstructParam>
  sealed inline-only slot g-object-construct-param-pspec :: <GParamSpec>;
  sealed inline-only slot g-object-construct-param-value :: <GValue>;
  pointer-type-name: <GObjectConstructParam>;
end C-struct;

define sealed domain make (singleton(<GObjectConstructParam>));
define sealed domain initialize (<GObjectConstructParam>);

define inline-only constant $param-mask = 255;

define inline-only constant $param-static-strings = 224;

define inline-only constant $param-user-shift = 8;

define inline-only constant $g-param-readable = 1;
define inline-only constant $g-param-writable = 2;
define inline-only constant $g-param-readwrite = 3;
define inline-only constant $g-param-construct = 4;
define inline-only constant $g-param-construct-only = 8;
define inline-only constant $g-param-lax-validation = 16;
define inline-only constant $g-param-static-name = 32;
define inline-only constant $g-param-private = 32;
define inline-only constant $g-param-static-nick = 64;
define inline-only constant $g-param-static-blurb = 128;
define inline-only constant $g-param-explicit-notify = 1073741824;
define inline-only constant $g-param-deprecated = 2147483648;
define constant <GParamFlags> = <C-int>;
define C-pointer-type <GParamFlags*> => <GParamFlags>;

define open C-subtype <GParamSpec> (<GTypeInstance>)
  // g_type_instance
  // name
  // flags
  // value_type
  // owner_type
  // _nick
  // _blurb
  // qdata
  // ref_count
  // param_id
end C-subtype;

define C-pointer-type <GParamSpec*> => <GParamSpec>;

define sealed domain make (singleton(<GParamSpec*>));
define sealed domain initialize (<GParamSpec*>);

define inline-only C-function g-param-spec-is-valid-name
  input parameter name_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "g_param_spec_is_valid_name";
end;

define inline-only C-function g-param-spec-get-blurb
  input parameter self :: <GParamSpec>;
  result res :: <C-string>;
  c-name: "g_param_spec_get_blurb";
end;

define inline-only C-function g-param-spec-get-default-value
  input parameter self :: <GParamSpec>;
  result res :: <GValue>;
  c-name: "g_param_spec_get_default_value";
end;

define inline-only C-function g-param-spec-get-name
  input parameter self :: <GParamSpec>;
  result res :: <C-string>;
  c-name: "g_param_spec_get_name";
end;

define inline-only C-function g-param-spec-get-name-quark
  input parameter self :: <GParamSpec>;
  result res :: <C-unsigned-int>;
  c-name: "g_param_spec_get_name_quark";
end;

define inline-only C-function g-param-spec-get-nick
  input parameter self :: <GParamSpec>;
  result res :: <C-string>;
  c-name: "g_param_spec_get_nick";
end;

define inline-only C-function g-param-spec-get-qdata
  input parameter self :: <GParamSpec>;
  input parameter quark_ :: <C-unsigned-int>;
  result res :: <C-void*>;
  c-name: "g_param_spec_get_qdata";
end;

define inline-only C-function g-param-spec-get-redirect-target
  input parameter self :: <GParamSpec>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_get_redirect_target";
end;

define inline-only C-function g-param-spec-set-qdata
  input parameter self :: <GParamSpec>;
  input parameter quark_ :: <C-unsigned-int>;
  input parameter data_ :: <C-void*>;
  c-name: "g_param_spec_set_qdata";
end;

define inline-only C-function g-param-spec-sink
  input parameter self :: <GParamSpec>;
  c-name: "g_param_spec_sink";
end;

define inline-only C-function g-param-spec-steal-qdata
  input parameter self :: <GParamSpec>;
  input parameter quark_ :: <C-unsigned-int>;
  result res :: <C-void*>;
  c-name: "g_param_spec_steal_qdata";
end;

define open C-subtype <GParamSpecBoolean> (<GParamSpec>)
  // parent_instance
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecBoolean*> => <GParamSpecBoolean>;

define sealed domain make (singleton(<GParamSpecBoolean*>));
define sealed domain initialize (<GParamSpecBoolean*>);

define open C-subtype <GParamSpecBoxed> (<GParamSpec>)
  // parent_instance
end C-subtype;

define C-pointer-type <GParamSpecBoxed*> => <GParamSpecBoxed>;

define sealed domain make (singleton(<GParamSpecBoxed*>));
define sealed domain initialize (<GParamSpecBoxed*>);

define open C-subtype <GParamSpecChar> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecChar*> => <GParamSpecChar>;

define sealed domain make (singleton(<GParamSpecChar*>));
define sealed domain initialize (<GParamSpecChar*>);

define C-struct <_GParamSpecClass>
  constant sealed inline-only slot g-param-spec-class-g-type-class :: <GTypeClass>;
  constant sealed inline-only slot g-param-spec-class-value-type :: <C-long>;
  constant sealed inline-only slot g-param-spec-class-finalize :: <C-function-pointer>;
  constant sealed inline-only slot g-param-spec-class-value-set-default :: <C-function-pointer>;
  constant sealed inline-only slot g-param-spec-class-value-validate :: <C-function-pointer>;
  constant sealed inline-only slot g-param-spec-class-values-cmp :: <C-function-pointer>;
  constant sealed inline-only slot g-param-spec-class-value-is-valid :: <C-function-pointer>;
  constant sealed inline-only slot g-param-spec-class-dummy :: <C-void*>;
  pointer-type-name: <GParamSpecClass>;
end C-struct;

define sealed domain make (singleton(<GParamSpecClass>));
define sealed domain initialize (<GParamSpecClass>);

define open C-subtype <GParamSpecDouble> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
  // epsilon
end C-subtype;

define C-pointer-type <GParamSpecDouble*> => <GParamSpecDouble>;

define sealed domain make (singleton(<GParamSpecDouble*>));
define sealed domain initialize (<GParamSpecDouble*>);

define open C-subtype <GParamSpecEnum> (<GParamSpec>)
  // parent_instance
  // enum_class
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecEnum*> => <GParamSpecEnum>;

define sealed domain make (singleton(<GParamSpecEnum*>));
define sealed domain initialize (<GParamSpecEnum*>);

define open C-subtype <GParamSpecFlags> (<GParamSpec>)
  // parent_instance
  // flags_class
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecFlags*> => <GParamSpecFlags>;

define sealed domain make (singleton(<GParamSpecFlags*>));
define sealed domain initialize (<GParamSpecFlags*>);

define open C-subtype <GParamSpecFloat> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
  // epsilon
end C-subtype;

define C-pointer-type <GParamSpecFloat*> => <GParamSpecFloat>;

define sealed domain make (singleton(<GParamSpecFloat*>));
define sealed domain initialize (<GParamSpecFloat*>);

define open C-subtype <GParamSpecGType> (<GParamSpec>)
  // parent_instance
  // is_a_type
end C-subtype;

define C-pointer-type <GParamSpecGType*> => <GParamSpecGType>;

define sealed domain make (singleton(<GParamSpecGType*>));
define sealed domain initialize (<GParamSpecGType*>);

define open C-subtype <GParamSpecInt> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecInt*> => <GParamSpecInt>;

define sealed domain make (singleton(<GParamSpecInt*>));
define sealed domain initialize (<GParamSpecInt*>);

define open C-subtype <GParamSpecInt64> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecInt64*> => <GParamSpecInt64>;

define sealed domain make (singleton(<GParamSpecInt64*>));
define sealed domain initialize (<GParamSpecInt64*>);

define open C-subtype <GParamSpecLong> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecLong*> => <GParamSpecLong>;

define sealed domain make (singleton(<GParamSpecLong*>));
define sealed domain initialize (<GParamSpecLong*>);

define open C-subtype <GParamSpecObject> (<GParamSpec>)
  // parent_instance
end C-subtype;

define C-pointer-type <GParamSpecObject*> => <GParamSpecObject>;

define sealed domain make (singleton(<GParamSpecObject*>));
define sealed domain initialize (<GParamSpecObject*>);

define open C-subtype <GParamSpecOverride> (<GParamSpec>)
  // parent_instance
  // overridden
end C-subtype;

define C-pointer-type <GParamSpecOverride*> => <GParamSpecOverride>;

define sealed domain make (singleton(<GParamSpecOverride*>));
define sealed domain initialize (<GParamSpecOverride*>);

define open C-subtype <GParamSpecParam> (<GParamSpec>)
  // parent_instance
end C-subtype;

define C-pointer-type <GParamSpecParam*> => <GParamSpecParam>;

define sealed domain make (singleton(<GParamSpecParam*>));
define sealed domain initialize (<GParamSpecParam*>);

define open C-subtype <GParamSpecPointer> (<GParamSpec>)
  // parent_instance
end C-subtype;

define C-pointer-type <GParamSpecPointer*> => <GParamSpecPointer>;

define sealed domain make (singleton(<GParamSpecPointer*>));
define sealed domain initialize (<GParamSpecPointer*>);

define C-struct <_GParamSpecPool>
  pointer-type-name: <GParamSpecPool>;
end C-struct;

define sealed domain make (singleton(<GParamSpecPool>));
define sealed domain initialize (<GParamSpecPool>);

define inline-only C-function g-param-spec-pool-insert
  input parameter self :: <GParamSpecPool>;
  input parameter pspec_ :: <GParamSpec>;
  input parameter owner_type_ :: <C-long>;
  c-name: "g_param_spec_pool_insert";
end;

define inline-only C-function g-param-spec-pool-list
  input parameter self :: <GParamSpecPool>;
  input parameter owner_type_ :: <C-long>;
  output parameter n_pspecs_p_ :: <C-unsigned-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "g_param_spec_pool_list";
end;

define inline-only C-function g-param-spec-pool-list-owned
  input parameter self :: <GParamSpecPool>;
  input parameter owner_type_ :: <C-long>;
  result res :: <GList>;
  c-name: "g_param_spec_pool_list_owned";
end;

define inline-only C-function g-param-spec-pool-lookup
  input parameter self :: <GParamSpecPool>;
  input parameter param_name_ :: <C-string>;
  input parameter owner_type_ :: <C-long>;
  input parameter walk_ancestors_ :: <C-boolean>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_pool_lookup";
end;

define inline-only C-function g-param-spec-pool-remove
  input parameter self :: <GParamSpecPool>;
  input parameter pspec_ :: <GParamSpec>;
  c-name: "g_param_spec_pool_remove";
end;

define open C-subtype <GParamSpecString> (<GParamSpec>)
  // parent_instance
  // default_value
  // cset_first
  // cset_nth
  // substitutor
  // null_fold_if_empty
  // ensure_non_null
end C-subtype;

define C-pointer-type <GParamSpecString*> => <GParamSpecString>;

define sealed domain make (singleton(<GParamSpecString*>));
define sealed domain initialize (<GParamSpecString*>);

define C-struct <_GParamSpecTypeInfo>
  sealed inline-only slot g-param-spec-type-info-instance-size :: <C-unsigned-short>;
  sealed inline-only slot g-param-spec-type-info-n-preallocs :: <C-unsigned-short>;
  constant sealed inline-only slot g-param-spec-type-info-instance-init :: <C-function-pointer>;
  sealed inline-only slot g-param-spec-type-info-value-type :: <C-long>;
  constant sealed inline-only slot g-param-spec-type-info-finalize :: <C-function-pointer>;
  constant sealed inline-only slot g-param-spec-type-info-value-set-default :: <C-function-pointer>;
  constant sealed inline-only slot g-param-spec-type-info-value-validate :: <C-function-pointer>;
  constant sealed inline-only slot g-param-spec-type-info-values-cmp :: <C-function-pointer>;
  pointer-type-name: <GParamSpecTypeInfo>;
end C-struct;

define sealed domain make (singleton(<GParamSpecTypeInfo>));
define sealed domain initialize (<GParamSpecTypeInfo>);

define open C-subtype <GParamSpecUChar> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecUChar*> => <GParamSpecUChar>;

define sealed domain make (singleton(<GParamSpecUChar*>));
define sealed domain initialize (<GParamSpecUChar*>);

define open C-subtype <GParamSpecUInt> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecUInt*> => <GParamSpecUInt>;

define sealed domain make (singleton(<GParamSpecUInt*>));
define sealed domain initialize (<GParamSpecUInt*>);

define open C-subtype <GParamSpecUInt64> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecUInt64*> => <GParamSpecUInt64>;

define sealed domain make (singleton(<GParamSpecUInt64*>));
define sealed domain initialize (<GParamSpecUInt64*>);

define open C-subtype <GParamSpecULong> (<GParamSpec>)
  // parent_instance
  // minimum
  // maximum
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecULong*> => <GParamSpecULong>;

define sealed domain make (singleton(<GParamSpecULong*>));
define sealed domain initialize (<GParamSpecULong*>);

define open C-subtype <GParamSpecUnichar> (<GParamSpec>)
  // parent_instance
  // default_value
end C-subtype;

define C-pointer-type <GParamSpecUnichar*> => <GParamSpecUnichar>;

define sealed domain make (singleton(<GParamSpecUnichar*>));
define sealed domain initialize (<GParamSpecUnichar*>);

define open C-subtype <GParamSpecValueArray> (<GParamSpec>)
  // parent_instance
  // element_spec
  // fixed_n_elements
end C-subtype;

define C-pointer-type <GParamSpecValueArray*> => <GParamSpecValueArray>;

define sealed domain make (singleton(<GParamSpecValueArray*>));
define sealed domain initialize (<GParamSpecValueArray*>);

define open C-subtype <GParamSpecVariant> (<GParamSpec>)
  // parent_instance
  // type
  // default_value
  // padding
end C-subtype;

define C-pointer-type <GParamSpecVariant*> => <GParamSpecVariant>;

define sealed domain make (singleton(<GParamSpecVariant*>));
define sealed domain initialize (<GParamSpecVariant*>);

define inline-only constant $signal-flags-mask = 511;

define inline-only constant $signal-match-mask = 63;

define inline-only constant $g-signal-run-first = 1;
define inline-only constant $g-signal-run-last = 2;
define inline-only constant $g-signal-run-cleanup = 4;
define inline-only constant $g-signal-no-recurse = 8;
define inline-only constant $g-signal-detailed = 16;
define inline-only constant $g-signal-action = 32;
define inline-only constant $g-signal-no-hooks = 64;
define inline-only constant $g-signal-must-collect = 128;
define inline-only constant $g-signal-deprecated = 256;
define inline-only constant $g-signal-accumulator-first-run = 131072;
define constant <GSignalFlags> = <C-int>;
define C-pointer-type <GSignalFlags*> => <GSignalFlags>;

define open C-subtype <GSignalGroup> (<GObject>)
end C-subtype;

define C-pointer-type <GSignalGroup*> => <GSignalGroup>;

define sealed domain make (singleton(<GSignalGroup*>));
define sealed domain initialize (<GSignalGroup*>);

define inline-only C-function g-signal-group-new
  input parameter target_type_ :: <C-long>;
  result res :: <GSignalGroup>;
  c-name: "g_signal_group_new";
end;

define inline-only C-function g-signal-group-block
  input parameter self :: <GSignalGroup>;
  c-name: "g_signal_group_block";
end;

define inline-only C-function g-signal-group-connect-closure
  input parameter self :: <GSignalGroup>;
  input parameter detailed_signal_ :: <C-string>;
  input parameter closure_ :: <GClosure>;
  input parameter after_ :: <C-boolean>;
  c-name: "g_signal_group_connect_closure";
end;

define inline-only C-function g-signal-group-connect-data
  input parameter self :: <GSignalGroup>;
  input parameter detailed_signal_ :: <C-string>;
  input parameter c_handler_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter notify_ :: <C-function-pointer>;
  input parameter flags_ :: <GConnectFlags>;
  c-name: "g_signal_group_connect_data";
end;

define inline-only C-function g-signal-group-connect-swapped
  input parameter self :: <GSignalGroup>;
  input parameter detailed_signal_ :: <C-string>;
  input parameter c_handler_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  c-name: "g_signal_group_connect_swapped";
end;

define inline-only C-function g-signal-group-dup-target
  input parameter self :: <GSignalGroup>;
  result res :: <GObject>;
  c-name: "g_signal_group_dup_target";
end;

define inline-only C-function g-signal-group-set-target
  input parameter self :: <GSignalGroup>;
  input parameter target_ :: <GObject>;
  c-name: "g_signal_group_set_target";
end;

define inline-only C-function g-signal-group-unblock
  input parameter self :: <GSignalGroup>;
  c-name: "g_signal_group_unblock";
end;

define C-struct <_GSignalInvocationHint>
  sealed inline-only slot g-signal-invocation-hint-signal-id :: <C-unsigned-int>;
  sealed inline-only slot g-signal-invocation-hint-detail :: <C-unsigned-int>;
  sealed inline-only slot g-signal-invocation-hint-run-type :: <GSignalFlags>;
  pointer-type-name: <GSignalInvocationHint>;
end C-struct;

define sealed domain make (singleton(<GSignalInvocationHint>));
define sealed domain initialize (<GSignalInvocationHint>);

define inline-only constant $g-signal-match-id = 1;
define inline-only constant $g-signal-match-detail = 2;
define inline-only constant $g-signal-match-closure = 4;
define inline-only constant $g-signal-match-func = 8;
define inline-only constant $g-signal-match-data = 16;
define inline-only constant $g-signal-match-unblocked = 32;
define constant <GSignalMatchType> = <C-int>;
define C-pointer-type <GSignalMatchType*> => <GSignalMatchType>;

define C-struct <_GSignalQuery>
  sealed inline-only slot g-signal-query-signal-id :: <C-unsigned-int>;
  sealed inline-only slot g-signal-query-signal-name :: <C-string>;
  sealed inline-only slot g-signal-query-itype :: <C-long>;
  sealed inline-only slot g-signal-query-signal-flags :: <GSignalFlags>;
  sealed inline-only slot g-signal-query-return-type :: <C-long>;
  sealed inline-only slot g-signal-query-n-params :: <C-unsigned-int>;
  sealed inline-only slot g-signal-query-param-types :: <C-long*>;
  pointer-type-name: <GSignalQuery>;
end C-struct;

define sealed domain make (singleton(<GSignalQuery>));
define sealed domain initialize (<GSignalQuery>);

define inline-only constant $type-flag-reserved-id-bit = 1;

define inline-only constant $type-fundamental-max = 255;

define inline-only constant $type-fundamental-shift = 2;

define inline-only constant $type-reserved-bse-first = 32;

define inline-only constant $type-reserved-bse-last = 48;

define inline-only constant $type-reserved-glib-first = 22;

define inline-only constant $type-reserved-glib-last = 31;

define inline-only constant $type-reserved-user-first = 49;

define C-union <_GTypeCValue>
  pointer-type-name: <GTypeCValue>;
end C-union;

define sealed domain make (singleton(<GTypeCValue>));
define sealed domain initialize (<GTypeCValue>);

define C-struct <_GTypeClass>
  constant sealed inline-only slot g-type-class-g-type :: <C-long>;
  pointer-type-name: <GTypeClass>;
end C-struct;

define sealed domain make (singleton(<GTypeClass>));
define sealed domain initialize (<GTypeClass>);

define inline-only C-function g-type-class-get-private
  input parameter self :: <GTypeClass>;
  input parameter private_type_ :: <C-long>;
  result res :: <C-void*>;
  c-name: "g_type_class_get_private";
end;

define inline-only C-function g-type-class-peek-parent
  input parameter self :: <GTypeClass>;
  result res :: <GTypeClass>;
  c-name: "g_type_class_peek_parent";
end;

define inline-only C-function g-type-class-unref
  input parameter self :: <GTypeClass>;
  c-name: "g_type_class_unref";
end;

define inline-only C-function g-type-class-adjust-private-offset
  input parameter g_class_ :: <C-void*>;
  input parameter private_size_or_offset_ :: <C-signed-int*>;
  c-name: "g_type_class_adjust_private_offset";
end;

define inline-only C-function g-type-class-peek
  input parameter type_ :: <C-long>;
  result res :: <GTypeClass>;
  c-name: "g_type_class_peek";
end;

define inline-only C-function g-type-class-peek-static
  input parameter type_ :: <C-long>;
  result res :: <GTypeClass>;
  c-name: "g_type_class_peek_static";
end;

define inline-only C-function g-type-class-ref
  input parameter type_ :: <C-long>;
  result res :: <GTypeClass>;
  c-name: "g_type_class_ref";
end;

define inline-only constant $g-type-flag-none = 0;
define inline-only constant $g-type-flag-abstract = 16;
define inline-only constant $g-type-flag-value-abstract = 32;
define inline-only constant $g-type-flag-final = 64;
define constant <GTypeFlags> = <C-int>;
define C-pointer-type <GTypeFlags*> => <GTypeFlags>;

define inline-only constant $g-type-flag-classed = 1;
define inline-only constant $g-type-flag-instantiatable = 2;
define inline-only constant $g-type-flag-derivable = 4;
define inline-only constant $g-type-flag-deep-derivable = 8;
define constant <GTypeFundamentalFlags> = <C-int>;
define C-pointer-type <GTypeFundamentalFlags*> => <GTypeFundamentalFlags>;

define C-struct <_GTypeFundamentalInfo>
  sealed inline-only slot g-type-fundamental-info-type-flags :: <GTypeFundamentalFlags>;
  pointer-type-name: <GTypeFundamentalInfo>;
end C-struct;

define sealed domain make (singleton(<GTypeFundamentalInfo>));
define sealed domain initialize (<GTypeFundamentalInfo>);

define C-struct <_GTypeInfo>
  sealed inline-only slot g-type-info-class-size :: <C-unsigned-short>;
  sealed inline-only slot g-type-info-base-init :: <C-function-pointer>;
  sealed inline-only slot g-type-info-base-finalize :: <C-function-pointer>;
  sealed inline-only slot g-type-info-class-init :: <C-function-pointer>;
  sealed inline-only slot g-type-info-class-finalize :: <C-function-pointer>;
  sealed inline-only slot g-type-info-class-data :: <C-void*>;
  sealed inline-only slot g-type-info-instance-size :: <C-unsigned-short>;
  sealed inline-only slot g-type-info-n-preallocs :: <C-unsigned-short>;
  sealed inline-only slot g-type-info-instance-init :: <C-function-pointer>;
  sealed inline-only slot g-type-info-value-table :: <GTypeValueTable>;
  pointer-type-name: <GTypeInfo>;
end C-struct;

define sealed domain make (singleton(<GTypeInfo>));
define sealed domain initialize (<GTypeInfo>);

define C-struct <_GTypeInstance>
  constant sealed inline-only slot g-type-instance-g-class :: <GTypeClass>;
  pointer-type-name: <GTypeInstance>;
end C-struct;

define sealed domain make (singleton(<GTypeInstance>));
define sealed domain initialize (<GTypeInstance>);

define inline-only C-function g-type-instance-get-private
  input parameter self :: <GTypeInstance>;
  input parameter private_type_ :: <C-long>;
  result res :: <C-void*>;
  c-name: "g_type_instance_get_private";
end;

define C-struct <_GTypeInterface>
  constant sealed inline-only slot g-type-interface-g-type :: <C-long>;
  constant sealed inline-only slot g-type-interface-g-instance-type :: <C-long>;
  pointer-type-name: <GTypeInterface>;
end C-struct;

define sealed domain make (singleton(<GTypeInterface>));
define sealed domain initialize (<GTypeInterface>);

define inline-only C-function g-type-interface-peek-parent
  input parameter self :: <GTypeInterface>;
  result res :: <GTypeInterface>;
  c-name: "g_type_interface_peek_parent";
end;

define inline-only C-function g-type-interface-add-prerequisite
  input parameter interface_type_ :: <C-long>;
  input parameter prerequisite_type_ :: <C-long>;
  c-name: "g_type_interface_add_prerequisite";
end;

define inline-only C-function g-type-interface-get-plugin
  input parameter instance_type_ :: <C-long>;
  input parameter interface_type_ :: <C-long>;
  result res :: <GTypePlugin>;
  c-name: "g_type_interface_get_plugin";
end;

define inline-only C-function g-type-interface-instantiatable-prerequisite
  input parameter interface_type_ :: <C-long>;
  result res :: <C-long>;
  c-name: "g_type_interface_instantiatable_prerequisite";
end;

define inline-only C-function g-type-interface-peek
  input parameter instance_class_ :: <GTypeClass>;
  input parameter iface_type_ :: <C-long>;
  result res :: <GTypeInterface>;
  c-name: "g_type_interface_peek";
end;

define inline-only C-function g-type-interface-prerequisites
  input parameter interface_type_ :: <C-long>;
  output parameter n_prerequisites_ :: <C-unsigned-int*>;
  result res :: <C-long*>;
  c-name: "g_type_interface_prerequisites";
end;

define open C-subtype <GTypeModule> (<GObject>, <GTypePlugin>)
  // parent_instance
  // use_count
  // type_infos
  // interface_infos
  // name
end C-subtype;

define C-pointer-type <GTypeModule*> => <GTypeModule>;

define sealed domain make (singleton(<GTypeModule*>));
define sealed domain initialize (<GTypeModule*>);

define inline-only C-function g-type-module-add-interface
  input parameter self :: <GTypeModule>;
  input parameter instance_type_ :: <C-long>;
  input parameter interface_type_ :: <C-long>;
  input parameter interface_info_ :: <GInterfaceInfo>;
  c-name: "g_type_module_add_interface";
end;

define inline-only C-function g-type-module-register-enum
  input parameter self :: <GTypeModule>;
  input parameter name_ :: <C-string>;
  input parameter const_static_values_ :: <GEnumValue>;
  result res :: <C-long>;
  c-name: "g_type_module_register_enum";
end;

define inline-only C-function g-type-module-register-flags
  input parameter self :: <GTypeModule>;
  input parameter name_ :: <C-string>;
  input parameter const_static_values_ :: <GFlagsValue>;
  result res :: <C-long>;
  c-name: "g_type_module_register_flags";
end;

define inline-only C-function g-type-module-register-type
  input parameter self :: <GTypeModule>;
  input parameter parent_type_ :: <C-long>;
  input parameter type_name_ :: <C-string>;
  input parameter type_info_ :: <GTypeInfo>;
  input parameter flags_ :: <GTypeFlags>;
  result res :: <C-long>;
  c-name: "g_type_module_register_type";
end;

define inline-only C-function g-type-module-set-name
  input parameter self :: <GTypeModule>;
  input parameter name_ :: <C-string>;
  c-name: "g_type_module_set_name";
end;

define inline-only C-function g-type-module-unuse
  input parameter self :: <GTypeModule>;
  c-name: "g_type_module_unuse";
end;

define inline-only C-function g-type-module-use
  input parameter self :: <GTypeModule>;
  result res :: <C-boolean>;
  c-name: "g_type_module_use";
end;

define C-struct <_GTypeModuleClass>
  constant sealed inline-only slot g-type-module-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot g-type-module-class-load :: <C-function-pointer>;
  constant sealed inline-only slot g-type-module-class-unload :: <C-function-pointer>;
  constant sealed inline-only slot g-type-module-class-reserved1 :: <C-function-pointer>;
  constant sealed inline-only slot g-type-module-class-reserved2 :: <C-function-pointer>;
  constant sealed inline-only slot g-type-module-class-reserved3 :: <C-function-pointer>;
  constant sealed inline-only slot g-type-module-class-reserved4 :: <C-function-pointer>;
  pointer-type-name: <GTypeModuleClass>;
end C-struct;

define sealed domain make (singleton(<GTypeModuleClass>));
define sealed domain initialize (<GTypeModuleClass>);

// Interface
define open C-subtype <GTypePlugin> (<C-void*>)
end C-subtype;

define C-pointer-type <GTypePlugin*> => <GTypePlugin>;

define sealed domain make (singleton(<GTypePlugin*>));
define sealed domain initialize (<GTypePlugin*>);

define inline-only C-function g-type-plugin-complete-interface-info
  input parameter self :: <GTypePlugin>;
  input parameter instance_type_ :: <C-long>;
  input parameter interface_type_ :: <C-long>;
  input parameter info_ :: <GInterfaceInfo>;
  c-name: "g_type_plugin_complete_interface_info";
end;

define inline-only C-function g-type-plugin-complete-type-info
  input parameter self :: <GTypePlugin>;
  input parameter g_type_ :: <C-long>;
  input parameter info_ :: <GTypeInfo>;
  input parameter value_table_ :: <GTypeValueTable>;
  c-name: "g_type_plugin_complete_type_info";
end;

define inline-only C-function g-type-plugin-unuse
  input parameter self :: <GTypePlugin>;
  c-name: "g_type_plugin_unuse";
end;

define inline-only C-function g-type-plugin-use
  input parameter self :: <GTypePlugin>;
  c-name: "g_type_plugin_use";
end;

define C-struct <_GTypePluginClass>
  constant sealed inline-only slot g-type-plugin-class-base-iface :: <GTypeInterface>;
  sealed inline-only slot g-type-plugin-class-use-plugin :: <C-function-pointer>;
  sealed inline-only slot g-type-plugin-class-unuse-plugin :: <C-function-pointer>;
  sealed inline-only slot g-type-plugin-class-complete-type-info :: <C-function-pointer>;
  sealed inline-only slot g-type-plugin-class-complete-interface-info :: <C-function-pointer>;
  pointer-type-name: <GTypePluginClass>;
end C-struct;

define sealed domain make (singleton(<GTypePluginClass>));
define sealed domain initialize (<GTypePluginClass>);

define C-struct <_GTypeQuery>
  sealed inline-only slot g-type-query-type :: <C-long>;
  sealed inline-only slot g-type-query-type-name :: <C-string>;
  sealed inline-only slot g-type-query-class-size :: <C-unsigned-int>;
  sealed inline-only slot g-type-query-instance-size :: <C-unsigned-int>;
  pointer-type-name: <GTypeQuery>;
end C-struct;

define sealed domain make (singleton(<GTypeQuery>));
define sealed domain initialize (<GTypeQuery>);

define C-struct <_GTypeValueTable>
  constant sealed inline-only slot g-type-value-table-value-init :: <C-function-pointer>;
  constant sealed inline-only slot g-type-value-table-value-free :: <C-function-pointer>;
  constant sealed inline-only slot g-type-value-table-value-copy :: <C-function-pointer>;
  constant sealed inline-only slot g-type-value-table-value-peek-pointer :: <C-function-pointer>;
  sealed inline-only slot g-type-value-table-collect-format :: <C-string>;
  constant sealed inline-only slot g-type-value-table-collect-value :: <C-function-pointer>;
  sealed inline-only slot g-type-value-table-lcopy-format :: <C-string>;
  constant sealed inline-only slot g-type-value-table-lcopy-value :: <C-function-pointer>;
  pointer-type-name: <GTypeValueTable>;
end C-struct;

define sealed domain make (singleton(<GTypeValueTable>));
define sealed domain initialize (<GTypeValueTable>);

define inline-only constant $value-interned-string = 268435456;

define inline-only constant $value-nocopy-contents = 134217728;

define C-struct <_GValue>
  constant sealed inline-only slot g-value-g-type :: <C-long>;
  sealed inline-only slot g-value-data :: <C-unsigned-char*> /* Not supported */;
  pointer-type-name: <GValue>;
end C-struct;

define sealed domain make (singleton(<GValue>));
define sealed domain initialize (<GValue>);

define inline-only C-function g-value-copy
  input parameter self :: <GValue>;
  input parameter dest_value_ :: <GValue>;
  c-name: "g_value_copy";
end;

define inline-only C-function g-value-dup-object
  input parameter self :: <GValue>;
  result res :: <GObject>;
  c-name: "g_value_dup_object";
end;

define inline-only C-function g-value-dup-string
  input parameter self :: <GValue>;
  result res :: <C-string>;
  c-name: "g_value_dup_string";
end;

define inline-only C-function g-value-dup-variant
  input parameter self :: <GValue>;
  result res :: <GVariant>;
  c-name: "g_value_dup_variant";
end;

define inline-only C-function g-value-fits-pointer
  input parameter self :: <GValue>;
  result res :: <C-boolean>;
  c-name: "g_value_fits_pointer";
end;

define inline-only C-function g-value-get-boolean
  input parameter self :: <GValue>;
  result res :: <C-boolean>;
  c-name: "g_value_get_boolean";
end;

define inline-only C-function g-value-get-boxed
  input parameter self :: <GValue>;
  result res :: <C-void*>;
  c-name: "g_value_get_boxed";
end;

define inline-only C-function g-value-get-double
  input parameter self :: <GValue>;
  result res :: <C-double>;
  c-name: "g_value_get_double";
end;

define inline-only C-function g-value-get-enum
  input parameter self :: <GValue>;
  result res :: <C-signed-int>;
  c-name: "g_value_get_enum";
end;

define inline-only C-function g-value-get-flags
  input parameter self :: <GValue>;
  result res :: <C-unsigned-int>;
  c-name: "g_value_get_flags";
end;

define inline-only C-function g-value-get-float
  input parameter self :: <GValue>;
  result res :: <C-float>;
  c-name: "g_value_get_float";
end;

define inline-only C-function g-value-get-gtype
  input parameter self :: <GValue>;
  result res :: <C-long>;
  c-name: "g_value_get_gtype";
end;

define inline-only C-function g-value-get-int
  input parameter self :: <GValue>;
  result res :: <C-signed-int>;
  c-name: "g_value_get_int";
end;

define inline-only C-function g-value-get-int64
  input parameter self :: <GValue>;
  result res :: <C-signed-long>;
  c-name: "g_value_get_int64";
end;

define inline-only C-function g-value-get-long
  input parameter self :: <GValue>;
  result res :: <C-signed-long>;
  c-name: "g_value_get_long";
end;

define inline-only C-function g-value-get-object
  input parameter self :: <GValue>;
  result res :: <GObject>;
  c-name: "g_value_get_object";
end;

define inline-only C-function g-value-get-param
  input parameter self :: <GValue>;
  result res :: <GParamSpec>;
  c-name: "g_value_get_param";
end;

define inline-only C-function g-value-get-pointer
  input parameter self :: <GValue>;
  result res :: <C-void*>;
  c-name: "g_value_get_pointer";
end;

define inline-only C-function g-value-get-schar
  input parameter self :: <GValue>;
  result res :: <C-signed-char>;
  c-name: "g_value_get_schar";
end;

define inline-only C-function g-value-get-string
  input parameter self :: <GValue>;
  result res :: <C-string>;
  c-name: "g_value_get_string";
end;

define inline-only C-function g-value-get-uchar
  input parameter self :: <GValue>;
  result res :: <C-unsigned-char>;
  c-name: "g_value_get_uchar";
end;

define inline-only C-function g-value-get-uint
  input parameter self :: <GValue>;
  result res :: <C-unsigned-int>;
  c-name: "g_value_get_uint";
end;

define inline-only C-function g-value-get-uint64
  input parameter self :: <GValue>;
  result res :: <C-unsigned-long>;
  c-name: "g_value_get_uint64";
end;

define inline-only C-function g-value-get-ulong
  input parameter self :: <GValue>;
  result res :: <C-unsigned-long>;
  c-name: "g_value_get_ulong";
end;

define inline-only C-function g-value-get-variant
  input parameter self :: <GValue>;
  result res :: <GVariant>;
  c-name: "g_value_get_variant";
end;

define inline-only C-function g-value-init
  input parameter self :: <GValue>;
  input parameter g_type_ :: <C-long>;
  result res :: <GValue>;
  c-name: "g_value_init";
end;

define inline-only C-function g-value-init-from-instance
  input parameter self :: <GValue>;
  input parameter instance_ :: <GTypeInstance>;
  c-name: "g_value_init_from_instance";
end;

define inline-only C-function g-value-peek-pointer
  input parameter self :: <GValue>;
  result res :: <C-void*>;
  c-name: "g_value_peek_pointer";
end;

define inline-only C-function g-value-reset
  input parameter self :: <GValue>;
  result res :: <GValue>;
  c-name: "g_value_reset";
end;

define inline-only C-function g-value-set-boolean
  input parameter self :: <GValue>;
  input parameter v_boolean_ :: <C-boolean>;
  c-name: "g_value_set_boolean";
end;

define inline-only C-function g-value-set-boxed
  input parameter self :: <GValue>;
  input parameter v_boxed_ :: <C-void*>;
  c-name: "g_value_set_boxed";
end;

define inline-only C-function g-value-set-double
  input parameter self :: <GValue>;
  input parameter v_double_ :: <C-double>;
  c-name: "g_value_set_double";
end;

define inline-only C-function g-value-set-enum
  input parameter self :: <GValue>;
  input parameter v_enum_ :: <C-signed-int>;
  c-name: "g_value_set_enum";
end;

define inline-only C-function g-value-set-flags
  input parameter self :: <GValue>;
  input parameter v_flags_ :: <C-unsigned-int>;
  c-name: "g_value_set_flags";
end;

define inline-only C-function g-value-set-float
  input parameter self :: <GValue>;
  input parameter v_float_ :: <C-float>;
  c-name: "g_value_set_float";
end;

define inline-only C-function g-value-set-gtype
  input parameter self :: <GValue>;
  input parameter v_gtype_ :: <C-long>;
  c-name: "g_value_set_gtype";
end;

define inline-only C-function g-value-set-instance
  input parameter self :: <GValue>;
  input parameter instance_ :: <C-void*>;
  c-name: "g_value_set_instance";
end;

define inline-only C-function g-value-set-int
  input parameter self :: <GValue>;
  input parameter v_int_ :: <C-signed-int>;
  c-name: "g_value_set_int";
end;

define inline-only C-function g-value-set-int64
  input parameter self :: <GValue>;
  input parameter v_int64_ :: <C-signed-long>;
  c-name: "g_value_set_int64";
end;

define inline-only C-function g-value-set-interned-string
  input parameter self :: <GValue>;
  input parameter v_string_ :: <C-string>;
  c-name: "g_value_set_interned_string";
end;

define inline-only C-function g-value-set-long
  input parameter self :: <GValue>;
  input parameter v_long_ :: <C-signed-long>;
  c-name: "g_value_set_long";
end;

define inline-only C-function g-value-set-object
  input parameter self :: <GValue>;
  input parameter v_object_ :: <GObject>;
  c-name: "g_value_set_object";
end;

define inline-only C-function g-value-set-param
  input parameter self :: <GValue>;
  input parameter param_ :: <GParamSpec>;
  c-name: "g_value_set_param";
end;

define inline-only C-function g-value-set-pointer
  input parameter self :: <GValue>;
  input parameter v_pointer_ :: <C-void*>;
  c-name: "g_value_set_pointer";
end;

define inline-only C-function g-value-set-schar
  input parameter self :: <GValue>;
  input parameter v_char_ :: <C-signed-char>;
  c-name: "g_value_set_schar";
end;

define inline-only C-function g-value-set-static-boxed
  input parameter self :: <GValue>;
  input parameter v_boxed_ :: <C-void*>;
  c-name: "g_value_set_static_boxed";
end;

define inline-only C-function g-value-set-static-string
  input parameter self :: <GValue>;
  input parameter v_string_ :: <C-string>;
  c-name: "g_value_set_static_string";
end;

define inline-only C-function g-value-set-string
  input parameter self :: <GValue>;
  input parameter v_string_ :: <C-string>;
  c-name: "g_value_set_string";
end;

define inline-only C-function g-value-set-uchar
  input parameter self :: <GValue>;
  input parameter v_uchar_ :: <C-unsigned-char>;
  c-name: "g_value_set_uchar";
end;

define inline-only C-function g-value-set-uint
  input parameter self :: <GValue>;
  input parameter v_uint_ :: <C-unsigned-int>;
  c-name: "g_value_set_uint";
end;

define inline-only C-function g-value-set-uint64
  input parameter self :: <GValue>;
  input parameter v_uint64_ :: <C-unsigned-long>;
  c-name: "g_value_set_uint64";
end;

define inline-only C-function g-value-set-ulong
  input parameter self :: <GValue>;
  input parameter v_ulong_ :: <C-unsigned-long>;
  c-name: "g_value_set_ulong";
end;

define inline-only C-function g-value-set-variant
  input parameter self :: <GValue>;
  input parameter variant_ :: <GVariant>;
  c-name: "g_value_set_variant";
end;

define inline-only C-function g-value-take-boxed
  input parameter self :: <GValue>;
  input parameter v_boxed_ :: <C-void*>;
  c-name: "g_value_take_boxed";
end;

define inline-only C-function g-value-take-string
  input parameter self :: <GValue>;
  input parameter v_string_ :: <C-string>;
  c-name: "g_value_take_string";
end;

define inline-only C-function g-value-take-variant
  input parameter self :: <GValue>;
  input parameter variant_ :: <GVariant>;
  c-name: "g_value_take_variant";
end;

define inline-only C-function g-value-transform
  input parameter self :: <GValue>;
  input parameter dest_value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "g_value_transform";
end;

define inline-only C-function g-value-unset
  input parameter self :: <GValue>;
  c-name: "g_value_unset";
end;

define inline-only C-function g-value-type-compatible
  input parameter src_type_ :: <C-long>;
  input parameter dest_type_ :: <C-long>;
  result res :: <C-boolean>;
  c-name: "g_value_type_compatible";
end;

define inline-only C-function g-value-type-transformable
  input parameter src_type_ :: <C-long>;
  input parameter dest_type_ :: <C-long>;
  result res :: <C-boolean>;
  c-name: "g_value_type_transformable";
end;

define C-struct <_GValueArray>
  sealed inline-only slot g-value-array-n-values :: <C-unsigned-int>;
  sealed inline-only slot g-value-array-values :: <GValue>;
  constant sealed inline-only slot g-value-array-n-prealloced :: <C-unsigned-int>;
  pointer-type-name: <GValueArray>;
end C-struct;

define sealed domain make (singleton(<GValueArray>));
define sealed domain initialize (<GValueArray>);

define C-struct <_GWeakRef>
  pointer-type-name: <GWeakRef>;
end C-struct;

define sealed domain make (singleton(<GWeakRef>));
define sealed domain initialize (<GWeakRef>);

define C-union <_G_Value--data--union>
  sealed inline-only slot g-_value--data--union-v-int :: <C-signed-int>;
  sealed inline-only slot g-_value--data--union-v-uint :: <C-unsigned-int>;
  sealed inline-only slot g-_value--data--union-v-long :: <C-signed-long>;
  sealed inline-only slot g-_value--data--union-v-ulong :: <C-unsigned-long>;
  sealed inline-only slot g-_value--data--union-v-int64 :: <C-signed-long>;
  sealed inline-only slot g-_value--data--union-v-uint64 :: <C-unsigned-long>;
  sealed inline-only slot g-_value--data--union-v-float :: <C-float>;
  sealed inline-only slot g-_value--data--union-v-double :: <C-double>;
  sealed inline-only slot g-_value--data--union-v-pointer :: <C-void*>;
  pointer-type-name: <G_Value--data--union>;
end C-union;

define sealed domain make (singleton(<G_Value--data--union>));
define sealed domain initialize (<G_Value--data--union>);

define inline-only C-function g-boxed-copy
  input parameter boxed_type_ :: <C-long>;
  input parameter src_boxed_ :: <C-void*>;
  result res :: <C-void*>;
  c-name: "g_boxed_copy";
end;

define inline-only C-function g-boxed-free
  input parameter boxed_type_ :: <C-long>;
  input parameter boxed_ :: <C-void*>;
  c-name: "g_boxed_free";
end;

define inline-only C-function g-clear-signal-handler
  input parameter handler_id_ptr_ :: <C-unsigned-long*>;
  input parameter instance_ :: <GObject>;
  c-name: "g_clear_signal_handler";
end;

define inline-only C-function g-enum-complete-type-info
  input parameter g_enum_type_ :: <C-long>;
  input parameter info_ :: <GTypeInfo>;
  input parameter const_values_ :: <GEnumValue>;
  c-name: "g_enum_complete_type_info";
end;

define inline-only C-function g-enum-get-value
  input parameter enum_class_ :: <GEnumClass>;
  input parameter value_ :: <C-signed-int>;
  result res :: <GEnumValue>;
  c-name: "g_enum_get_value";
end;

define inline-only C-function g-enum-get-value-by-name
  input parameter enum_class_ :: <GEnumClass>;
  input parameter name_ :: <C-string>;
  result res :: <GEnumValue>;
  c-name: "g_enum_get_value_by_name";
end;

define inline-only C-function g-enum-get-value-by-nick
  input parameter enum_class_ :: <GEnumClass>;
  input parameter nick_ :: <C-string>;
  result res :: <GEnumValue>;
  c-name: "g_enum_get_value_by_nick";
end;

define inline-only C-function g-enum-register-static
  input parameter name_ :: <C-string>;
  input parameter const_static_values_ :: <GEnumValue>;
  result res :: <C-long>;
  c-name: "g_enum_register_static";
end;

define inline-only C-function g-enum-to-string
  input parameter g_enum_type_ :: <C-long>;
  input parameter value_ :: <C-signed-int>;
  result res :: <C-string>;
  c-name: "g_enum_to_string";
end;

define inline-only C-function g-flags-complete-type-info
  input parameter g_flags_type_ :: <C-long>;
  input parameter info_ :: <GTypeInfo>;
  input parameter const_values_ :: <GFlagsValue>;
  c-name: "g_flags_complete_type_info";
end;

define inline-only C-function g-flags-get-first-value
  input parameter flags_class_ :: <GFlagsClass>;
  input parameter value_ :: <C-unsigned-int>;
  result res :: <GFlagsValue>;
  c-name: "g_flags_get_first_value";
end;

define inline-only C-function g-flags-get-value-by-name
  input parameter flags_class_ :: <GFlagsClass>;
  input parameter name_ :: <C-string>;
  result res :: <GFlagsValue>;
  c-name: "g_flags_get_value_by_name";
end;

define inline-only C-function g-flags-get-value-by-nick
  input parameter flags_class_ :: <GFlagsClass>;
  input parameter nick_ :: <C-string>;
  result res :: <GFlagsValue>;
  c-name: "g_flags_get_value_by_nick";
end;

define inline-only C-function g-flags-register-static
  input parameter name_ :: <C-string>;
  input parameter const_static_values_ :: <GFlagsValue>;
  result res :: <C-long>;
  c-name: "g_flags_register_static";
end;

define inline-only C-function g-flags-to-string
  input parameter flags_type_ :: <C-long>;
  input parameter value_ :: <C-unsigned-int>;
  result res :: <C-string>;
  c-name: "g_flags_to_string";
end;

define inline-only C-function g-gtype-get-type
  result res :: <C-long>;
  c-name: "g_gtype_get_type";
end;

define inline-only C-function g-param-spec-boolean
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter default_value_ :: <C-boolean>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_boolean";
end;

define inline-only C-function g-param-spec-boxed
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter boxed_type_ :: <C-long>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_boxed";
end;

define inline-only C-function g-param-spec-char
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-signed-char>;
  input parameter maximum_ :: <C-signed-char>;
  input parameter default_value_ :: <C-signed-char>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_char";
end;

define inline-only C-function g-param-spec-double
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-double>;
  input parameter maximum_ :: <C-double>;
  input parameter default_value_ :: <C-double>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_double";
end;

define inline-only C-function g-param-spec-enum
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter enum_type_ :: <C-long>;
  input parameter default_value_ :: <C-signed-int>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_enum";
end;

define inline-only C-function g-param-spec-flags
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter flags_type_ :: <C-long>;
  input parameter default_value_ :: <C-unsigned-int>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_flags";
end;

define inline-only C-function g-param-spec-float
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-float>;
  input parameter maximum_ :: <C-float>;
  input parameter default_value_ :: <C-float>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_float";
end;

define inline-only C-function g-param-spec-gtype
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter is_a_type_ :: <C-long>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_gtype";
end;

define inline-only C-function g-param-spec-int
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-signed-int>;
  input parameter maximum_ :: <C-signed-int>;
  input parameter default_value_ :: <C-signed-int>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_int";
end;

define inline-only C-function g-param-spec-int64
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-signed-long>;
  input parameter maximum_ :: <C-signed-long>;
  input parameter default_value_ :: <C-signed-long>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_int64";
end;

define inline-only C-function g-param-spec-long
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-signed-long>;
  input parameter maximum_ :: <C-signed-long>;
  input parameter default_value_ :: <C-signed-long>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_long";
end;

define inline-only C-function g-param-spec-object
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter object_type_ :: <C-long>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_object";
end;

define inline-only C-function g-param-spec-param
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter param_type_ :: <C-long>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_param";
end;

define inline-only C-function g-param-spec-pointer
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_pointer";
end;

define inline-only C-function g-param-spec-string
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter default_value_ :: <C-string>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_string";
end;

define inline-only C-function g-param-spec-uchar
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-unsigned-char>;
  input parameter maximum_ :: <C-unsigned-char>;
  input parameter default_value_ :: <C-unsigned-char>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_uchar";
end;

define inline-only C-function g-param-spec-uint
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-unsigned-int>;
  input parameter maximum_ :: <C-unsigned-int>;
  input parameter default_value_ :: <C-unsigned-int>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_uint";
end;

define inline-only C-function g-param-spec-uint64
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-unsigned-long>;
  input parameter maximum_ :: <C-unsigned-long>;
  input parameter default_value_ :: <C-unsigned-long>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_uint64";
end;

define inline-only C-function g-param-spec-ulong
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter minimum_ :: <C-unsigned-long>;
  input parameter maximum_ :: <C-unsigned-long>;
  input parameter default_value_ :: <C-unsigned-long>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_ulong";
end;

define inline-only C-function g-param-spec-unichar
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter default_value_ :: <C-unsigned-int>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_unichar";
end;

define inline-only C-function g-param-spec-variant
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter type_ :: <GVariantType>;
  input parameter default_value_ :: <GVariant>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "g_param_spec_variant";
end;

define inline-only C-function g-param-type-register-static
  input parameter name_ :: <C-string>;
  input parameter pspec_info_ :: <GParamSpecTypeInfo>;
  result res :: <C-long>;
  c-name: "g_param_type_register_static";
end;

define inline-only C-function g-param-value-convert
  input parameter pspec_ :: <GParamSpec>;
  input parameter src_value_ :: <GValue>;
  input parameter dest_value_ :: <GValue>;
  input parameter strict_validation_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "g_param_value_convert";
end;

define inline-only C-function g-param-value-defaults
  input parameter pspec_ :: <GParamSpec>;
  input parameter value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "g_param_value_defaults";
end;

define inline-only C-function g-param-value-is-valid
  input parameter pspec_ :: <GParamSpec>;
  input parameter value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "g_param_value_is_valid";
end;

define inline-only C-function g-param-value-set-default
  input parameter pspec_ :: <GParamSpec>;
  input parameter value_ :: <GValue>;
  c-name: "g_param_value_set_default";
end;

define inline-only C-function g-param-value-validate
  input parameter pspec_ :: <GParamSpec>;
  input parameter value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "g_param_value_validate";
end;

define inline-only C-function g-param-values-cmp
  input parameter pspec_ :: <GParamSpec>;
  input parameter value1_ :: <GValue>;
  input parameter value2_ :: <GValue>;
  result res :: <C-signed-int>;
  c-name: "g_param_values_cmp";
end;

define inline-only C-function g-pointer-type-register-static
  input parameter name_ :: <C-string>;
  result res :: <C-long>;
  c-name: "g_pointer_type_register_static";
end;

define inline-only C-function g-signal-accumulator-first-wins
  input parameter ihint_ :: <GSignalInvocationHint>;
  input parameter return_accu_ :: <GValue>;
  input parameter handler_return_ :: <GValue>;
  input parameter dummy_ :: <C-void*>;
  result res :: <C-boolean>;
  c-name: "g_signal_accumulator_first_wins";
end;

define inline-only C-function g-signal-accumulator-true-handled
  input parameter ihint_ :: <GSignalInvocationHint>;
  input parameter return_accu_ :: <GValue>;
  input parameter handler_return_ :: <GValue>;
  input parameter dummy_ :: <C-void*>;
  result res :: <C-boolean>;
  c-name: "g_signal_accumulator_true_handled";
end;

define inline-only C-function g-signal-add-emission-hook
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter detail_ :: <C-unsigned-int>;
  input parameter hook_func_ :: <C-function-pointer>;
  input parameter hook_data_ :: <C-void*>;
  input parameter data_destroy_ :: <C-function-pointer>;
  result res :: <C-unsigned-long>;
  c-name: "g_signal_add_emission_hook";
end;

define inline-only C-function g-signal-chain-from-overridden
  input parameter instance_and_params_ :: <C-unsigned-char*> /* Not supported */;
  input parameter return_value_ :: <GValue>;
  c-name: "g_signal_chain_from_overridden";
end;

define inline-only C-function g-signal-connect-closure
  input parameter instance_ :: <GObject>;
  input parameter detailed_signal_ :: <C-string>;
  input parameter closure_ :: <GClosure>;
  input parameter after_ :: <C-boolean>;
  result res :: <C-unsigned-long>;
  c-name: "g_signal_connect_closure";
end;

define inline-only C-function g-signal-connect-closure-by-id
  input parameter instance_ :: <GObject>;
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter detail_ :: <C-unsigned-int>;
  input parameter closure_ :: <GClosure>;
  input parameter after_ :: <C-boolean>;
  result res :: <C-unsigned-long>;
  c-name: "g_signal_connect_closure_by_id";
end;

define inline-only C-function g-signal-emitv
  input parameter instance_and_params_ :: <C-unsigned-char*> /* Not supported */;
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter detail_ :: <C-unsigned-int>;
  input parameter return_value_ :: <GValue>;
  c-name: "g_signal_emitv";
end;

define inline-only C-function g-signal-get-invocation-hint
  input parameter instance_ :: <GObject>;
  result res :: <GSignalInvocationHint>;
  c-name: "g_signal_get_invocation_hint";
end;

define inline-only C-function g-signal-handler-block
  input parameter instance_ :: <GObject>;
  input parameter handler_id_ :: <C-unsigned-long>;
  c-name: "g_signal_handler_block";
end;

define inline-only C-function g-signal-handler-disconnect
  input parameter instance_ :: <GObject>;
  input parameter handler_id_ :: <C-unsigned-long>;
  c-name: "g_signal_handler_disconnect";
end;

define inline-only C-function g-signal-handler-find
  input parameter instance_ :: <GObject>;
  input parameter mask_ :: <GSignalMatchType>;
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter detail_ :: <C-unsigned-int>;
  input parameter closure_ :: <GClosure>;
  input parameter func_ :: <C-void*>;
  input parameter data_ :: <C-void*>;
  result res :: <C-unsigned-long>;
  c-name: "g_signal_handler_find";
end;

define inline-only C-function g-signal-handler-is-connected
  input parameter instance_ :: <GObject>;
  input parameter handler_id_ :: <C-unsigned-long>;
  result res :: <C-boolean>;
  c-name: "g_signal_handler_is_connected";
end;

define inline-only C-function g-signal-handler-unblock
  input parameter instance_ :: <GObject>;
  input parameter handler_id_ :: <C-unsigned-long>;
  c-name: "g_signal_handler_unblock";
end;

define inline-only C-function g-signal-handlers-block-matched
  input parameter instance_ :: <GObject>;
  input parameter mask_ :: <GSignalMatchType>;
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter detail_ :: <C-unsigned-int>;
  input parameter closure_ :: <GClosure>;
  input parameter func_ :: <C-void*>;
  input parameter data_ :: <C-void*>;
  result res :: <C-unsigned-int>;
  c-name: "g_signal_handlers_block_matched";
end;

define inline-only C-function g-signal-handlers-destroy
  input parameter instance_ :: <GObject>;
  c-name: "g_signal_handlers_destroy";
end;

define inline-only C-function g-signal-handlers-disconnect-matched
  input parameter instance_ :: <GObject>;
  input parameter mask_ :: <GSignalMatchType>;
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter detail_ :: <C-unsigned-int>;
  input parameter closure_ :: <GClosure>;
  input parameter func_ :: <C-void*>;
  input parameter data_ :: <C-void*>;
  result res :: <C-unsigned-int>;
  c-name: "g_signal_handlers_disconnect_matched";
end;

define inline-only C-function g-signal-handlers-unblock-matched
  input parameter instance_ :: <GObject>;
  input parameter mask_ :: <GSignalMatchType>;
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter detail_ :: <C-unsigned-int>;
  input parameter closure_ :: <GClosure>;
  input parameter func_ :: <C-void*>;
  input parameter data_ :: <C-void*>;
  result res :: <C-unsigned-int>;
  c-name: "g_signal_handlers_unblock_matched";
end;

define inline-only C-function g-signal-has-handler-pending
  input parameter instance_ :: <GObject>;
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter detail_ :: <C-unsigned-int>;
  input parameter may_be_blocked_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "g_signal_has_handler_pending";
end;

define inline-only C-function g-signal-is-valid-name
  input parameter name_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "g_signal_is_valid_name";
end;

define inline-only C-function g-signal-list-ids
  input parameter itype_ :: <C-long>;
  output parameter n_ids_ :: <C-unsigned-int*>;
  result res :: <C-unsigned-int*>;
  c-name: "g_signal_list_ids";
end;

define inline-only C-function g-signal-lookup
  input parameter name_ :: <C-string>;
  input parameter itype_ :: <C-long>;
  result res :: <C-unsigned-int>;
  c-name: "g_signal_lookup";
end;

define inline-only C-function g-signal-name
  input parameter signal_id_ :: <C-unsigned-int>;
  result res :: <C-string>;
  c-name: "g_signal_name";
end;

define inline-only C-function g-signal-override-class-closure
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter instance_type_ :: <C-long>;
  input parameter class_closure_ :: <GClosure>;
  c-name: "g_signal_override_class_closure";
end;

define inline-only C-function g-signal-parse-name
  input parameter detailed_signal_ :: <C-string>;
  input parameter itype_ :: <C-long>;
  output parameter signal_id_p_ :: <C-unsigned-int*>;
  output parameter detail_p_ :: <C-unsigned-int*>;
  input parameter force_detail_quark_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "g_signal_parse_name";
end;

define inline-only C-function g-signal-query
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter query_ :: <GSignalQuery>;
  c-name: "g_signal_query";
end;

define inline-only C-function g-signal-remove-emission-hook
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter hook_id_ :: <C-unsigned-long>;
  c-name: "g_signal_remove_emission_hook";
end;

define inline-only C-function g-signal-stop-emission
  input parameter instance_ :: <GObject>;
  input parameter signal_id_ :: <C-unsigned-int>;
  input parameter detail_ :: <C-unsigned-int>;
  c-name: "g_signal_stop_emission";
end;

define inline-only C-function g-signal-stop-emission-by-name
  input parameter instance_ :: <GObject>;
  input parameter detailed_signal_ :: <C-string>;
  c-name: "g_signal_stop_emission_by_name";
end;

define inline-only C-function g-signal-type-cclosure-new
  input parameter itype_ :: <C-long>;
  input parameter struct_offset_ :: <C-unsigned-int>;
  result res :: <GClosure>;
  c-name: "g_signal_type_cclosure_new";
end;

define inline-only C-function g-source-set-closure
  input parameter source_ :: <GSource>;
  input parameter closure_ :: <GClosure>;
  c-name: "g_source_set_closure";
end;

define inline-only C-function g-source-set-dummy-callback
  input parameter source_ :: <GSource>;
  c-name: "g_source_set_dummy_callback";
end;

define inline-only C-function g-strdup-value-contents
  input parameter value_ :: <GValue>;
  result res :: <C-string>;
  c-name: "g_strdup_value_contents";
end;

define inline-only C-function g-type-add-class-private
  input parameter class_type_ :: <C-long>;
  input parameter private_size_ :: <C-unsigned-long>;
  c-name: "g_type_add_class_private";
end;

define inline-only C-function g-type-add-instance-private
  input parameter class_type_ :: <C-long>;
  input parameter private_size_ :: <C-unsigned-long>;
  result res :: <C-signed-int>;
  c-name: "g_type_add_instance_private";
end;

define inline-only C-function g-type-add-interface-dynamic
  input parameter instance_type_ :: <C-long>;
  input parameter interface_type_ :: <C-long>;
  input parameter plugin_ :: <GTypePlugin>;
  c-name: "g_type_add_interface_dynamic";
end;

define inline-only C-function g-type-add-interface-static
  input parameter instance_type_ :: <C-long>;
  input parameter interface_type_ :: <C-long>;
  input parameter info_ :: <GInterfaceInfo>;
  c-name: "g_type_add_interface_static";
end;

define inline-only C-function g-type-check-class-is-a
  input parameter g_class_ :: <GTypeClass>;
  input parameter is_a_type_ :: <C-long>;
  result res :: <C-boolean>;
  c-name: "g_type_check_class_is_a";
end;

define inline-only C-function g-type-check-instance
  input parameter instance_ :: <GTypeInstance>;
  result res :: <C-boolean>;
  c-name: "g_type_check_instance";
end;

define inline-only C-function g-type-check-instance-is-a
  input parameter instance_ :: <GTypeInstance>;
  input parameter iface_type_ :: <C-long>;
  result res :: <C-boolean>;
  c-name: "g_type_check_instance_is_a";
end;

define inline-only C-function g-type-check-instance-is-fundamentally-a
  input parameter instance_ :: <GTypeInstance>;
  input parameter fundamental_type_ :: <C-long>;
  result res :: <C-boolean>;
  c-name: "g_type_check_instance_is_fundamentally_a";
end;

define inline-only C-function g-type-check-is-value-type
  input parameter type_ :: <C-long>;
  result res :: <C-boolean>;
  c-name: "g_type_check_is_value_type";
end;

define inline-only C-function g-type-check-value
  input parameter value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "g_type_check_value";
end;

define inline-only C-function g-type-check-value-holds
  input parameter value_ :: <GValue>;
  input parameter type_ :: <C-long>;
  result res :: <C-boolean>;
  c-name: "g_type_check_value_holds";
end;

define inline-only C-function g-type-children
  input parameter type_ :: <C-long>;
  output parameter n_children_ :: <C-unsigned-int*>;
  result res :: <C-long*>;
  c-name: "g_type_children";
end;

define inline-only C-function g-type-default-interface-peek
  input parameter g_type_ :: <C-long>;
  result res :: <GTypeInterface>;
  c-name: "g_type_default_interface_peek";
end;

define inline-only C-function g-type-default-interface-ref
  input parameter g_type_ :: <C-long>;
  result res :: <GTypeInterface>;
  c-name: "g_type_default_interface_ref";
end;

define inline-only C-function g-type-default-interface-unref
  input parameter g_iface_ :: <GTypeInterface>;
  c-name: "g_type_default_interface_unref";
end;

define inline-only C-function g-type-depth
  input parameter type_ :: <C-long>;
  result res :: <C-unsigned-int>;
  c-name: "g_type_depth";
end;

define inline-only C-function g-type-ensure
  input parameter type_ :: <C-long>;
  c-name: "g_type_ensure";
end;

define inline-only C-function g-type-free-instance
  input parameter instance_ :: <GTypeInstance>;
  c-name: "g_type_free_instance";
end;

define inline-only C-function g-type-from-name
  input parameter name_ :: <C-string>;
  result res :: <C-long>;
  c-name: "g_type_from_name";
end;

define inline-only C-function g-type-fundamental
  input parameter type_id_ :: <C-long>;
  result res :: <C-long>;
  c-name: "g_type_fundamental";
end;

define inline-only C-function g-type-fundamental-next
  result res :: <C-long>;
  c-name: "g_type_fundamental_next";
end;

define inline-only C-function g-type-get-instance-count
  input parameter type_ :: <C-long>;
  result res :: <C-signed-int>;
  c-name: "g_type_get_instance_count";
end;

define inline-only C-function g-type-get-plugin
  input parameter type_ :: <C-long>;
  result res :: <GTypePlugin>;
  c-name: "g_type_get_plugin";
end;

define inline-only C-function g-type-get-qdata
  input parameter type_ :: <C-long>;
  input parameter quark_ :: <C-unsigned-int>;
  result res :: <C-void*>;
  c-name: "g_type_get_qdata";
end;

define inline-only C-function g-type-get-type-registration-serial
  result res :: <C-unsigned-int>;
  c-name: "g_type_get_type_registration_serial";
end;

define inline-only C-function g-type-interfaces
  input parameter type_ :: <C-long>;
  output parameter n_interfaces_ :: <C-unsigned-int*>;
  result res :: <C-long*>;
  c-name: "g_type_interfaces";
end;

define inline-only C-function g-type-is-a
  input parameter type_ :: <C-long>;
  input parameter is_a_type_ :: <C-long>;
  result res :: <C-boolean>;
  c-name: "g_type_is_a";
end;

define inline-only C-function g-type-name
  input parameter type_ :: <C-long>;
  result res :: <C-string>;
  c-name: "g_type_name";
end;

define inline-only C-function g-type-name-from-class
  input parameter g_class_ :: <GTypeClass>;
  result res :: <C-string>;
  c-name: "g_type_name_from_class";
end;

define inline-only C-function g-type-name-from-instance
  input parameter instance_ :: <GTypeInstance>;
  result res :: <C-string>;
  c-name: "g_type_name_from_instance";
end;

define inline-only C-function g-type-next-base
  input parameter leaf_type_ :: <C-long>;
  input parameter root_type_ :: <C-long>;
  result res :: <C-long>;
  c-name: "g_type_next_base";
end;

define inline-only C-function g-type-parent
  input parameter type_ :: <C-long>;
  result res :: <C-long>;
  c-name: "g_type_parent";
end;

define inline-only C-function g-type-qname
  input parameter type_ :: <C-long>;
  result res :: <C-unsigned-int>;
  c-name: "g_type_qname";
end;

define inline-only C-function g-type-query
  input parameter type_ :: <C-long>;
  input parameter query_ :: <GTypeQuery>;
  c-name: "g_type_query";
end;

define inline-only C-function g-type-register-dynamic
  input parameter parent_type_ :: <C-long>;
  input parameter type_name_ :: <C-string>;
  input parameter plugin_ :: <GTypePlugin>;
  input parameter flags_ :: <GTypeFlags>;
  result res :: <C-long>;
  c-name: "g_type_register_dynamic";
end;

define inline-only C-function g-type-register-fundamental
  input parameter type_id_ :: <C-long>;
  input parameter type_name_ :: <C-string>;
  input parameter info_ :: <GTypeInfo>;
  input parameter finfo_ :: <GTypeFundamentalInfo>;
  input parameter flags_ :: <GTypeFlags>;
  result res :: <C-long>;
  c-name: "g_type_register_fundamental";
end;

define inline-only C-function g-type-register-static
  input parameter parent_type_ :: <C-long>;
  input parameter type_name_ :: <C-string>;
  input parameter info_ :: <GTypeInfo>;
  input parameter flags_ :: <GTypeFlags>;
  result res :: <C-long>;
  c-name: "g_type_register_static";
end;

define inline-only C-function g-type-set-qdata
  input parameter type_ :: <C-long>;
  input parameter quark_ :: <C-unsigned-int>;
  input parameter data_ :: <C-void*>;
  c-name: "g_type_set_qdata";
end;

define inline-only C-function g-type-test-flags
  input parameter type_ :: <C-long>;
  input parameter flags_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "g_type_test_flags";
end;

