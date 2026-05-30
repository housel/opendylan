Module: dylan-user
Synopsis: Module and library definition for executable application

define library gtk-hello-world
  use common-dylan;
  use io;
  use c-ffi;
  use glib;
  use gobject;
  use gio;
  use gtk;
end library;

define module gtk-hello-world
  use common-dylan;
  use format-out;
  use c-ffi;
  use glib;
  use gobject;
  use gobject-glue;
  use gio;
  use gtk;
  use gtk-properties;
end module;
