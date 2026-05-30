module: dylan-user

define library gtk-unit-converter
  use common-dylan;
  use io;
  use c-ffi;
  use glib;
  use gobject;
  use gio;
  use gtk;
  use gdk;
end library;

define module gtk-unit-converter
  use common-dylan;
  use format;
  use format-out;
  use c-ffi;
  use glib;
  use gobject;
  use gobject-glue;
  use gio;
  use gtk;
  use gtk-properties;
end module;
