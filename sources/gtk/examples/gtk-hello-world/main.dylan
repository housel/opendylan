Module: gtk-hello-world

define function print-hello(#rest args)
  format-out("Hello World\n");
  force-out();
end function;

define function app-activate(app :: <GtkApplication>, #rest args)
  let window = gtk-application-window-new(app);
  gtk-window-set-title(window, "Window");
  gtk-window-set-default-size(window, 200, 200);

  let button = gtk-button-new-with-label("Hello World");
  button.@halign := button.@valign := $GTK-ALIGN-CENTER;

  g-signal-connect(button, "clicked", print-hello);
  g-signal-connect(button, "clicked",
		   method (button :: <GtkButton>)
		     gtk-window-destroy(window);
		   end);

  window.@child := button;

  gtk-window-present(window);
end function;

define function main (name :: <string>, arguments :: <vector>)
  let app = gtk-application-new("org.opendylan.example.hello-world",
				$G-APPLICATION-DEFAULT-FLAGS);
  g-signal-connect(app, "activate", app-activate);
  let argv = make(<C-string*>, element-count: 1);
  argv[0] := as(<C-string>, name);
  let status = g-application-run(app, 1, argv);
  exit-application(status);
end function;

main(application-name(), application-arguments());
