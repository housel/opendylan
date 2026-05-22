module: gmodule
synopsis: generated bindings for the GModule library
copyright: See LICENSE file in this distribution.


define C-pointer-type <C-void**> => <C-void*>;
ignore(<C-void**>);

define C-pointer-type <GError*> => <GError>;
ignore(<GError*>);

define C-struct <_GModule>
  pointer-type-name: <GModule>;
end C-struct;

define sealed domain make (singleton(<GModule>));
define sealed domain initialize (<GModule>);

define inline-only C-function g-module-close
  input parameter self :: <GModule>;
  result res :: <C-boolean>;
  c-name: "g_module_close";
end;

define inline-only C-function g-module-make-resident
  input parameter self :: <GModule>;
  c-name: "g_module_make_resident";
end;

define inline-only C-function g-module-name
  input parameter self :: <GModule>;
  result res :: <C-string>;
  c-name: "g_module_name";
end;

define inline-only C-function g-module-symbol
  input parameter self :: <GModule>;
  input parameter symbol_name_ :: <C-string>;
  output parameter symbol_ :: <C-void**>;
  result res :: <C-boolean>;
  c-name: "g_module_symbol";
end;

define inline-only C-function g-module-build-path
  input parameter directory_ :: <C-string>;
  input parameter module_name_ :: <C-string>;
  result res :: <C-string>;
  c-name: "g_module_build_path";
end;

define inline-only C-function g-module-error
  result res :: <C-string>;
  c-name: "g_module_error";
end;

define inline-only C-function g-module-error-quark
  result res :: <C-unsigned-int>;
  c-name: "g_module_error_quark";
end;

define inline-only C-function g-module-supported
  result res :: <C-boolean>;
  c-name: "g_module_supported";
end;

define inline-only constant $g-module-error-failed = 0;
define inline-only constant $g-module-error-check-failed = 1;
define constant <GModuleError> = <C-int>;
define C-pointer-type <GModuleError*> => <GModuleError>;

define inline-only constant $g-module-bind-lazy = 1;
define inline-only constant $g-module-bind-local = 2;
define inline-only constant $g-module-bind-mask = 3;
define constant <GModuleFlags> = <C-int>;
define C-pointer-type <GModuleFlags*> => <GModuleFlags>;

