module: gtk-unit-converter
synopsis: A simple unit converter that uses the Gtk+ toolkit
author: Francesco Ceccon, Peter S. Housel
License: See License.txt in this distribution for details.

define constant $fahrenheit2celsius = #"f2c";
define constant $celsius2fahrenheit = #"c2f";

define constant $conversion-types
  = vector($fahrenheit2celsius, $celsius2fahrenheit);

define table $available-conversions = {
  // Temperature
  $fahrenheit2celsius => "Fahrenheit to Celsius",
  $celsius2fahrenheit => "Celsius to Fahrenheit"
};

define method convert
    (type, value)
 => (result)
    "ERROR"
end;

define method convert
    (type == $fahrenheit2celsius, value :: <integer>)
 => (degrees-celsius :: <float>)
    (value - 32.0) * 5.0 / 9.0
end method convert;

define method convert
    (type == $celsius2fahrenheit, value :: <integer>)
 => (degrees-fahrenheit :: <float>)
    value * 9.0 / 5.0 + 32.0
end method convert;

define method conversion-values-changed
    (dropdown :: <GtkDropDown>, entry :: <GtkEntry>, text :: <GtkLabel>)
 => ()
  let active-id = $conversion-types[dropdown.@selected];
  let result = if (entry.@text-length > 0)
                 let buffer = entry.@buffer;
                 convert(active-id,
                         string-to-integer(buffer.@text, default: 0));
               else
                 "0";
               end if;
  text.@label := format-to-string("%s", result);
end method conversion-values-changed;

define function display-about-dialog () => ()
  let about = gtk-about-dialog-new();
  about.@license-type := $gtk-license-mit-x11;
  about.@program-name := "Gtk Unit Converter";
  about.@website := "http://opendylan.org";
  about.@comments := "Simple example demonstrating how to use Gtk with Dylan";
  gtk-window-present(about);
end function display-about-dialog;

define function app-activate (app :: <GtkApplication>, #rest args)
  let window = gtk-application-window-new(app);
  gtk-application-window-set-show-menubar(window, #t);

  gtk-window-set-title(window, "Gtk Unit Converter");
  gtk-window-set-default-size(window, 300, 200);

  // Setup UI
  let vbox = gtk-box-new($gtk-orientation-vertical, 5);
  vbox.@halign := vbox.@valign := $GTK-ALIGN-CENTER;

  // Model for dropdown
  let model = gtk-string-list-new(null-pointer(<C-string*>));
  for (type in $conversion-types)
    let value = $available-conversions[type];
    gtk-string-list-append(model, value);
  end for;

  let conversions-dropdown
    = gtk-drop-down-new(model, null-pointer(<GtkExpression>));
  gtk-drop-down-set-selected(conversions-dropdown, 0);
  gtk-box-append(vbox, conversions-dropdown);

  let text-entry = gtk-entry-new();
  text-entry.@input-purpose := $gtk-input-purpose-number;
  gtk-box-append(vbox, text-entry);
  let result-label = gtk-label-new("0");
  gtk-box-append(vbox, result-label);

  // Connect signals
  g-signal-connect(conversions-dropdown, "notify::selected",
                   method (widget :: <GtkWidget>, spec :: <GParamSpec>)
                     conversion-values-changed(conversions-dropdown, text-entry,
                                               result-label);
                   end);
  g-signal-connect(text-entry, "changed",
                   method (#rest args)
                     conversion-values-changed(conversions-dropdown, text-entry,
                                               result-label);
                   end);

  window.@child := vbox;

  // Define menu
  let menu = g-menu-new();
  let file-menu = g-menu-new();
  g-menu-append(file-menu, "Quit", "app.quit");
  g-menu-append-submenu(menu, "File", file-menu);
  let help-menu = g-menu-new();
  g-menu-append(help-menu, "About", "app.about");
  g-menu-append-submenu(menu, "Help", help-menu);

  gtk-application-set-menubar(app, menu);

  gtk-window-present(window);
end function;

define function app-startup (app :: <GtkApplication>, #rest args)
  // Establish actions
  let quit-action = g-simple-action-new("quit", null-pointer(<GVariantType>));
  g-signal-connect(quit-action, "activate",
                   method (#rest args)
                     g-application-quit(app);
                   end method);
  g-action-map-add-action(app, quit-action);

  let about-action = g-simple-action-new("about", null-pointer(<GVariantType>));
  g-signal-connect(about-action, "activate",
                   method (#rest args)
                     display-about-dialog();
                   end method);
  g-action-map-add-action(app, about-action);
end function;

define function main (name :: <string>, arguments :: <vector>)
  let app = gtk-application-new("org.opendylan.example.unit-converter",
				$G-APPLICATION-DEFAULT-FLAGS);
  g-signal-connect(app, "startup", app-startup);
  g-signal-connect(app, "activate", app-activate);
  let argv = make(<C-string*>, element-count: 1);
  argv[0] := as(<C-string>, name);
  let status = g-application-run(app, 1, argv);
  exit-application(status);
end function;

main(application-name(), application-arguments());
