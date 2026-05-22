module: gtk
synopsis: generated bindings for the Gtk library
copyright: See LICENSE file in this distribution.


define C-pointer-type <C-void**> => <C-void*>;
ignore(<C-void**>);

define C-pointer-type <GError*> => <GError>;
ignore(<GError*>);

define inline-only constant $accessible-value-undefined = -1;

define open C-subtype <GtkATContext> (<GObject>)
end C-subtype;

define C-pointer-type <GtkATContext*> => <GtkATContext>;

define sealed domain make (singleton(<GtkATContext*>));
define sealed domain initialize (<GtkATContext*>);

define inline-only C-function gtk-at-context-create
  input parameter accessible_role_ :: <GtkAccessibleRole>;
  input parameter accessible_ :: <GtkAccessible>;
  input parameter display_ :: <GdkDisplay>;
  result res :: <GtkATContext>;
  c-name: "gtk_at_context_create";
end;

define inline-only C-function gtk-at-context-get-accessible
  input parameter self :: <GtkATContext>;
  result res :: <GtkAccessible>;
  c-name: "gtk_at_context_get_accessible";
end;

define inline-only C-function gtk-at-context-get-accessible-role
  input parameter self :: <GtkATContext>;
  result res :: <GtkAccessibleRole>;
  c-name: "gtk_at_context_get_accessible_role";
end;

define C-struct <_GtkATContextClass>
  pointer-type-name: <GtkATContextClass>;
end C-struct;

define sealed domain make (singleton(<GtkATContextClass>));
define sealed domain initialize (<GtkATContextClass>);

define open C-subtype <GtkAboutDialog> (<GtkWindow>)
end C-subtype;

define C-pointer-type <GtkAboutDialog*> => <GtkAboutDialog>;

define sealed domain make (singleton(<GtkAboutDialog*>));
define sealed domain initialize (<GtkAboutDialog*>);

define inline-only C-function gtk-about-dialog-new
  result res :: <GtkWidget>;
  c-name: "gtk_about_dialog_new";
end;

define inline-only C-function gtk-about-dialog-add-credit-section
  input parameter self :: <GtkAboutDialog>;
  input parameter section_name_ :: <C-string>;
  input parameter people_ :: <C-string*>;
  c-name: "gtk_about_dialog_add_credit_section";
end;

define inline-only C-function gtk-about-dialog-get-artists
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string*>;
  c-name: "gtk_about_dialog_get_artists";
end;

define inline-only C-function gtk-about-dialog-get-authors
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string*>;
  c-name: "gtk_about_dialog_get_authors";
end;

define inline-only C-function gtk-about-dialog-get-comments
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_comments";
end;

define inline-only C-function gtk-about-dialog-get-copyright
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_copyright";
end;

define inline-only C-function gtk-about-dialog-get-documenters
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string*>;
  c-name: "gtk_about_dialog_get_documenters";
end;

define inline-only C-function gtk-about-dialog-get-license
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_license";
end;

define inline-only C-function gtk-about-dialog-get-license-type
  input parameter self :: <GtkAboutDialog>;
  result res :: <GtkLicense>;
  c-name: "gtk_about_dialog_get_license_type";
end;

define inline-only C-function gtk-about-dialog-get-logo
  input parameter self :: <GtkAboutDialog>;
  result res :: <GdkPaintable>;
  c-name: "gtk_about_dialog_get_logo";
end;

define inline-only C-function gtk-about-dialog-get-logo-icon-name
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_logo_icon_name";
end;

define inline-only C-function gtk-about-dialog-get-program-name
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_program_name";
end;

define inline-only C-function gtk-about-dialog-get-system-information
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_system_information";
end;

define inline-only C-function gtk-about-dialog-get-translator-credits
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_translator_credits";
end;

define inline-only C-function gtk-about-dialog-get-version
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_version";
end;

define inline-only C-function gtk-about-dialog-get-website
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_website";
end;

define inline-only C-function gtk-about-dialog-get-website-label
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-string>;
  c-name: "gtk_about_dialog_get_website_label";
end;

define inline-only C-function gtk-about-dialog-get-wrap-license
  input parameter self :: <GtkAboutDialog>;
  result res :: <C-boolean>;
  c-name: "gtk_about_dialog_get_wrap_license";
end;

define inline-only C-function gtk-about-dialog-set-artists
  input parameter self :: <GtkAboutDialog>;
  input parameter artists_ :: <C-string*>;
  c-name: "gtk_about_dialog_set_artists";
end;

define inline-only C-function gtk-about-dialog-set-authors
  input parameter self :: <GtkAboutDialog>;
  input parameter authors_ :: <C-string*>;
  c-name: "gtk_about_dialog_set_authors";
end;

define inline-only C-function gtk-about-dialog-set-comments
  input parameter self :: <GtkAboutDialog>;
  input parameter comments_ :: <C-string>;
  c-name: "gtk_about_dialog_set_comments";
end;

define inline-only C-function gtk-about-dialog-set-copyright
  input parameter self :: <GtkAboutDialog>;
  input parameter copyright_ :: <C-string>;
  c-name: "gtk_about_dialog_set_copyright";
end;

define inline-only C-function gtk-about-dialog-set-documenters
  input parameter self :: <GtkAboutDialog>;
  input parameter documenters_ :: <C-string*>;
  c-name: "gtk_about_dialog_set_documenters";
end;

define inline-only C-function gtk-about-dialog-set-license
  input parameter self :: <GtkAboutDialog>;
  input parameter license_ :: <C-string>;
  c-name: "gtk_about_dialog_set_license";
end;

define inline-only C-function gtk-about-dialog-set-license-type
  input parameter self :: <GtkAboutDialog>;
  input parameter license_type_ :: <GtkLicense>;
  c-name: "gtk_about_dialog_set_license_type";
end;

define inline-only C-function gtk-about-dialog-set-logo
  input parameter self :: <GtkAboutDialog>;
  input parameter logo_ :: <GdkPaintable>;
  c-name: "gtk_about_dialog_set_logo";
end;

define inline-only C-function gtk-about-dialog-set-logo-icon-name
  input parameter self :: <GtkAboutDialog>;
  input parameter icon_name_ :: <C-string>;
  c-name: "gtk_about_dialog_set_logo_icon_name";
end;

define inline-only C-function gtk-about-dialog-set-program-name
  input parameter self :: <GtkAboutDialog>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_about_dialog_set_program_name";
end;

define inline-only C-function gtk-about-dialog-set-system-information
  input parameter self :: <GtkAboutDialog>;
  input parameter system_information_ :: <C-string>;
  c-name: "gtk_about_dialog_set_system_information";
end;

define inline-only C-function gtk-about-dialog-set-translator-credits
  input parameter self :: <GtkAboutDialog>;
  input parameter translator_credits_ :: <C-string>;
  c-name: "gtk_about_dialog_set_translator_credits";
end;

define inline-only C-function gtk-about-dialog-set-version
  input parameter self :: <GtkAboutDialog>;
  input parameter version_ :: <C-string>;
  c-name: "gtk_about_dialog_set_version";
end;

define inline-only C-function gtk-about-dialog-set-website
  input parameter self :: <GtkAboutDialog>;
  input parameter website_ :: <C-string>;
  c-name: "gtk_about_dialog_set_website";
end;

define inline-only C-function gtk-about-dialog-set-website-label
  input parameter self :: <GtkAboutDialog>;
  input parameter website_label_ :: <C-string>;
  c-name: "gtk_about_dialog_set_website_label";
end;

define inline-only C-function gtk-about-dialog-set-wrap-license
  input parameter self :: <GtkAboutDialog>;
  input parameter wrap_license_ :: <C-boolean>;
  c-name: "gtk_about_dialog_set_wrap_license";
end;

// Interface
define open C-subtype <GtkAccessible> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkAccessible*> => <GtkAccessible>;

define sealed domain make (singleton(<GtkAccessible*>));
define sealed domain initialize (<GtkAccessible*>);

define inline-only C-function gtk-accessible-get-accessible-role
  input parameter self :: <GtkAccessible>;
  result res :: <GtkAccessibleRole>;
  c-name: "gtk_accessible_get_accessible_role";
end;

define inline-only C-function gtk-accessible-reset-property
  input parameter self :: <GtkAccessible>;
  input parameter property_ :: <GtkAccessibleProperty>;
  c-name: "gtk_accessible_reset_property";
end;

define inline-only C-function gtk-accessible-reset-relation
  input parameter self :: <GtkAccessible>;
  input parameter relation_ :: <GtkAccessibleRelation>;
  c-name: "gtk_accessible_reset_relation";
end;

define inline-only C-function gtk-accessible-reset-state
  input parameter self :: <GtkAccessible>;
  input parameter state_ :: <GtkAccessibleState>;
  c-name: "gtk_accessible_reset_state";
end;

define inline-only C-function gtk-accessible-update-property-value
  input parameter self :: <GtkAccessible>;
  input parameter n_properties_ :: <C-signed-int>;
  input parameter properties_ :: <C-unsigned-char*> /* Not supported */;
  input parameter values_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "gtk_accessible_update_property_value";
end;

define inline-only C-function gtk-accessible-update-relation-value
  input parameter self :: <GtkAccessible>;
  input parameter n_relations_ :: <C-signed-int>;
  input parameter relations_ :: <C-unsigned-char*> /* Not supported */;
  input parameter values_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "gtk_accessible_update_relation_value";
end;

define inline-only C-function gtk-accessible-update-state-value
  input parameter self :: <GtkAccessible>;
  input parameter n_states_ :: <C-signed-int>;
  input parameter states_ :: <C-unsigned-char*> /* Not supported */;
  input parameter values_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "gtk_accessible_update_state_value";
end;

define inline-only constant $gtk-accessible-autocomplete-none = 0;
define inline-only constant $gtk-accessible-autocomplete-inline = 1;
define inline-only constant $gtk-accessible-autocomplete-list = 2;
define inline-only constant $gtk-accessible-autocomplete-both = 3;
define constant <GtkAccessibleAutocomplete> = <C-int>;
define C-pointer-type <GtkAccessibleAutocomplete*> => <GtkAccessibleAutocomplete>;

define C-struct <_GtkAccessibleInterface>
  pointer-type-name: <GtkAccessibleInterface>;
end C-struct;

define sealed domain make (singleton(<GtkAccessibleInterface>));
define sealed domain initialize (<GtkAccessibleInterface>);

define inline-only constant $gtk-accessible-invalid-false = 0;
define inline-only constant $gtk-accessible-invalid-true = 1;
define inline-only constant $gtk-accessible-invalid-grammar = 2;
define inline-only constant $gtk-accessible-invalid-spelling = 3;
define constant <GtkAccessibleInvalidState> = <C-int>;
define C-pointer-type <GtkAccessibleInvalidState*> => <GtkAccessibleInvalidState>;

define inline-only constant $gtk-accessible-property-autocomplete = 0;
define inline-only constant $gtk-accessible-property-description = 1;
define inline-only constant $gtk-accessible-property-has-popup = 2;
define inline-only constant $gtk-accessible-property-key-shortcuts = 3;
define inline-only constant $gtk-accessible-property-label = 4;
define inline-only constant $gtk-accessible-property-level = 5;
define inline-only constant $gtk-accessible-property-modal = 6;
define inline-only constant $gtk-accessible-property-multi-line = 7;
define inline-only constant $gtk-accessible-property-multi-selectable = 8;
define inline-only constant $gtk-accessible-property-orientation = 9;
define inline-only constant $gtk-accessible-property-placeholder = 10;
define inline-only constant $gtk-accessible-property-read-only = 11;
define inline-only constant $gtk-accessible-property-required = 12;
define inline-only constant $gtk-accessible-property-role-description = 13;
define inline-only constant $gtk-accessible-property-sort = 14;
define inline-only constant $gtk-accessible-property-value-max = 15;
define inline-only constant $gtk-accessible-property-value-min = 16;
define inline-only constant $gtk-accessible-property-value-now = 17;
define inline-only constant $gtk-accessible-property-value-text = 18;
define constant <GtkAccessibleProperty> = <C-int>;
define C-pointer-type <GtkAccessibleProperty*> => <GtkAccessibleProperty>;

define inline-only constant $gtk-accessible-relation-active-descendant = 0;
define inline-only constant $gtk-accessible-relation-col-count = 1;
define inline-only constant $gtk-accessible-relation-col-index = 2;
define inline-only constant $gtk-accessible-relation-col-index-text = 3;
define inline-only constant $gtk-accessible-relation-col-span = 4;
define inline-only constant $gtk-accessible-relation-controls = 5;
define inline-only constant $gtk-accessible-relation-described-by = 6;
define inline-only constant $gtk-accessible-relation-details = 7;
define inline-only constant $gtk-accessible-relation-error-message = 8;
define inline-only constant $gtk-accessible-relation-flow-to = 9;
define inline-only constant $gtk-accessible-relation-labelled-by = 10;
define inline-only constant $gtk-accessible-relation-owns = 11;
define inline-only constant $gtk-accessible-relation-pos-in-set = 12;
define inline-only constant $gtk-accessible-relation-row-count = 13;
define inline-only constant $gtk-accessible-relation-row-index = 14;
define inline-only constant $gtk-accessible-relation-row-index-text = 15;
define inline-only constant $gtk-accessible-relation-row-span = 16;
define inline-only constant $gtk-accessible-relation-set-size = 17;
define constant <GtkAccessibleRelation> = <C-int>;
define C-pointer-type <GtkAccessibleRelation*> => <GtkAccessibleRelation>;

define inline-only constant $gtk-accessible-role-alert = 0;
define inline-only constant $gtk-accessible-role-alert-dialog = 1;
define inline-only constant $gtk-accessible-role-banner = 2;
define inline-only constant $gtk-accessible-role-button = 3;
define inline-only constant $gtk-accessible-role-caption = 4;
define inline-only constant $gtk-accessible-role-cell = 5;
define inline-only constant $gtk-accessible-role-checkbox = 6;
define inline-only constant $gtk-accessible-role-column-header = 7;
define inline-only constant $gtk-accessible-role-combo-box = 8;
define inline-only constant $gtk-accessible-role-command = 9;
define inline-only constant $gtk-accessible-role-composite = 10;
define inline-only constant $gtk-accessible-role-dialog = 11;
define inline-only constant $gtk-accessible-role-document = 12;
define inline-only constant $gtk-accessible-role-feed = 13;
define inline-only constant $gtk-accessible-role-form = 14;
define inline-only constant $gtk-accessible-role-generic = 15;
define inline-only constant $gtk-accessible-role-grid = 16;
define inline-only constant $gtk-accessible-role-grid-cell = 17;
define inline-only constant $gtk-accessible-role-group = 18;
define inline-only constant $gtk-accessible-role-heading = 19;
define inline-only constant $gtk-accessible-role-img = 20;
define inline-only constant $gtk-accessible-role-input = 21;
define inline-only constant $gtk-accessible-role-label = 22;
define inline-only constant $gtk-accessible-role-landmark = 23;
define inline-only constant $gtk-accessible-role-legend = 24;
define inline-only constant $gtk-accessible-role-link = 25;
define inline-only constant $gtk-accessible-role-list = 26;
define inline-only constant $gtk-accessible-role-list-box = 27;
define inline-only constant $gtk-accessible-role-list-item = 28;
define inline-only constant $gtk-accessible-role-log = 29;
define inline-only constant $gtk-accessible-role-main = 30;
define inline-only constant $gtk-accessible-role-marquee = 31;
define inline-only constant $gtk-accessible-role-math = 32;
define inline-only constant $gtk-accessible-role-meter = 33;
define inline-only constant $gtk-accessible-role-menu = 34;
define inline-only constant $gtk-accessible-role-menu-bar = 35;
define inline-only constant $gtk-accessible-role-menu-item = 36;
define inline-only constant $gtk-accessible-role-menu-item-checkbox = 37;
define inline-only constant $gtk-accessible-role-menu-item-radio = 38;
define inline-only constant $gtk-accessible-role-navigation = 39;
define inline-only constant $gtk-accessible-role-none = 40;
define inline-only constant $gtk-accessible-role-note = 41;
define inline-only constant $gtk-accessible-role-option = 42;
define inline-only constant $gtk-accessible-role-presentation = 43;
define inline-only constant $gtk-accessible-role-progress-bar = 44;
define inline-only constant $gtk-accessible-role-radio = 45;
define inline-only constant $gtk-accessible-role-radio-group = 46;
define inline-only constant $gtk-accessible-role-range = 47;
define inline-only constant $gtk-accessible-role-region = 48;
define inline-only constant $gtk-accessible-role-row = 49;
define inline-only constant $gtk-accessible-role-row-group = 50;
define inline-only constant $gtk-accessible-role-row-header = 51;
define inline-only constant $gtk-accessible-role-scrollbar = 52;
define inline-only constant $gtk-accessible-role-search = 53;
define inline-only constant $gtk-accessible-role-search-box = 54;
define inline-only constant $gtk-accessible-role-section = 55;
define inline-only constant $gtk-accessible-role-section-head = 56;
define inline-only constant $gtk-accessible-role-select = 57;
define inline-only constant $gtk-accessible-role-separator = 58;
define inline-only constant $gtk-accessible-role-slider = 59;
define inline-only constant $gtk-accessible-role-spin-button = 60;
define inline-only constant $gtk-accessible-role-status = 61;
define inline-only constant $gtk-accessible-role-structure = 62;
define inline-only constant $gtk-accessible-role-switch = 63;
define inline-only constant $gtk-accessible-role-tab = 64;
define inline-only constant $gtk-accessible-role-table = 65;
define inline-only constant $gtk-accessible-role-tab-list = 66;
define inline-only constant $gtk-accessible-role-tab-panel = 67;
define inline-only constant $gtk-accessible-role-text-box = 68;
define inline-only constant $gtk-accessible-role-time = 69;
define inline-only constant $gtk-accessible-role-timer = 70;
define inline-only constant $gtk-accessible-role-toolbar = 71;
define inline-only constant $gtk-accessible-role-tooltip = 72;
define inline-only constant $gtk-accessible-role-tree = 73;
define inline-only constant $gtk-accessible-role-tree-grid = 74;
define inline-only constant $gtk-accessible-role-tree-item = 75;
define inline-only constant $gtk-accessible-role-widget = 76;
define inline-only constant $gtk-accessible-role-window = 77;
define constant <GtkAccessibleRole> = <C-int>;
define C-pointer-type <GtkAccessibleRole*> => <GtkAccessibleRole>;

define inline-only constant $gtk-accessible-sort-none = 0;
define inline-only constant $gtk-accessible-sort-ascending = 1;
define inline-only constant $gtk-accessible-sort-descending = 2;
define inline-only constant $gtk-accessible-sort-other = 3;
define constant <GtkAccessibleSort> = <C-int>;
define C-pointer-type <GtkAccessibleSort*> => <GtkAccessibleSort>;

define inline-only constant $gtk-accessible-state-busy = 0;
define inline-only constant $gtk-accessible-state-checked = 1;
define inline-only constant $gtk-accessible-state-disabled = 2;
define inline-only constant $gtk-accessible-state-expanded = 3;
define inline-only constant $gtk-accessible-state-hidden = 4;
define inline-only constant $gtk-accessible-state-invalid = 5;
define inline-only constant $gtk-accessible-state-pressed = 6;
define inline-only constant $gtk-accessible-state-selected = 7;
define constant <GtkAccessibleState> = <C-int>;
define C-pointer-type <GtkAccessibleState*> => <GtkAccessibleState>;

define inline-only constant $gtk-accessible-tristate-false = 0;
define inline-only constant $gtk-accessible-tristate-true = 1;
define inline-only constant $gtk-accessible-tristate-mixed = 2;
define constant <GtkAccessibleTristate> = <C-int>;
define C-pointer-type <GtkAccessibleTristate*> => <GtkAccessibleTristate>;

define open C-subtype <GtkActionBar> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkActionBar*> => <GtkActionBar>;

define sealed domain make (singleton(<GtkActionBar*>));
define sealed domain initialize (<GtkActionBar*>);

define inline-only C-function gtk-action-bar-new
  result res :: <GtkWidget>;
  c-name: "gtk_action_bar_new";
end;

define inline-only C-function gtk-action-bar-get-center-widget
  input parameter self :: <GtkActionBar>;
  result res :: <GtkWidget>;
  c-name: "gtk_action_bar_get_center_widget";
end;

define inline-only C-function gtk-action-bar-get-revealed
  input parameter self :: <GtkActionBar>;
  result res :: <C-boolean>;
  c-name: "gtk_action_bar_get_revealed";
end;

define inline-only C-function gtk-action-bar-pack-end
  input parameter self :: <GtkActionBar>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_action_bar_pack_end";
end;

define inline-only C-function gtk-action-bar-pack-start
  input parameter self :: <GtkActionBar>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_action_bar_pack_start";
end;

define inline-only C-function gtk-action-bar-remove
  input parameter self :: <GtkActionBar>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_action_bar_remove";
end;

define inline-only C-function gtk-action-bar-set-center-widget
  input parameter self :: <GtkActionBar>;
  input parameter center_widget_ :: <GtkWidget>;
  c-name: "gtk_action_bar_set_center_widget";
end;

define inline-only C-function gtk-action-bar-set-revealed
  input parameter self :: <GtkActionBar>;
  input parameter revealed_ :: <C-boolean>;
  c-name: "gtk_action_bar_set_revealed";
end;

// Interface
define open C-subtype <GtkActionable> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkActionable*> => <GtkActionable>;

define sealed domain make (singleton(<GtkActionable*>));
define sealed domain initialize (<GtkActionable*>);

define inline-only C-function gtk-actionable-get-action-name
  input parameter self :: <GtkActionable>;
  result res :: <C-string>;
  c-name: "gtk_actionable_get_action_name";
end;

define inline-only C-function gtk-actionable-get-action-target-value
  input parameter self :: <GtkActionable>;
  result res :: <GVariant>;
  c-name: "gtk_actionable_get_action_target_value";
end;

define inline-only C-function gtk-actionable-set-action-name
  input parameter self :: <GtkActionable>;
  input parameter action_name_ :: <C-string>;
  c-name: "gtk_actionable_set_action_name";
end;

define inline-only C-function gtk-actionable-set-action-target-value
  input parameter self :: <GtkActionable>;
  input parameter target_value_ :: <GVariant>;
  c-name: "gtk_actionable_set_action_target_value";
end;

define inline-only C-function gtk-actionable-set-detailed-action-name
  input parameter self :: <GtkActionable>;
  input parameter detailed_action_name_ :: <C-string>;
  c-name: "gtk_actionable_set_detailed_action_name";
end;

define C-struct <_GtkActionableInterface>
  constant sealed inline-only slot gtk-actionable-interface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-actionable-interface-get-action-name :: <C-function-pointer>;
  constant sealed inline-only slot gtk-actionable-interface-set-action-name :: <C-function-pointer>;
  constant sealed inline-only slot gtk-actionable-interface-get-action-target-value :: <C-function-pointer>;
  constant sealed inline-only slot gtk-actionable-interface-set-action-target-value :: <C-function-pointer>;
  pointer-type-name: <GtkActionableInterface>;
end C-struct;

define sealed domain make (singleton(<GtkActionableInterface>));
define sealed domain initialize (<GtkActionableInterface>);

define open C-subtype <GtkActivateAction> (<GtkShortcutAction>)
end C-subtype;

define C-pointer-type <GtkActivateAction*> => <GtkActivateAction>;

define sealed domain make (singleton(<GtkActivateAction*>));
define sealed domain initialize (<GtkActivateAction*>);

define inline-only C-function gtk-activate-action-get
  result res :: <GtkActivateAction>;
  c-name: "gtk_activate_action_get";
end;

define C-struct <_GtkActivateActionClass>
  pointer-type-name: <GtkActivateActionClass>;
end C-struct;

define sealed domain make (singleton(<GtkActivateActionClass>));
define sealed domain initialize (<GtkActivateActionClass>);

define open C-subtype <GtkAdjustment> (<GInitiallyUnowned>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkAdjustment*> => <GtkAdjustment>;

define sealed domain make (singleton(<GtkAdjustment*>));
define sealed domain initialize (<GtkAdjustment*>);

define inline-only C-function gtk-adjustment-new
  input parameter value_ :: <C-double>;
  input parameter lower_ :: <C-double>;
  input parameter upper_ :: <C-double>;
  input parameter step_increment_ :: <C-double>;
  input parameter page_increment_ :: <C-double>;
  input parameter page_size_ :: <C-double>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_adjustment_new";
end;

define inline-only C-function gtk-adjustment-clamp-page
  input parameter self :: <GtkAdjustment>;
  input parameter lower_ :: <C-double>;
  input parameter upper_ :: <C-double>;
  c-name: "gtk_adjustment_clamp_page";
end;

define inline-only C-function gtk-adjustment-configure
  input parameter self :: <GtkAdjustment>;
  input parameter value_ :: <C-double>;
  input parameter lower_ :: <C-double>;
  input parameter upper_ :: <C-double>;
  input parameter step_increment_ :: <C-double>;
  input parameter page_increment_ :: <C-double>;
  input parameter page_size_ :: <C-double>;
  c-name: "gtk_adjustment_configure";
end;

define inline-only C-function gtk-adjustment-get-lower
  input parameter self :: <GtkAdjustment>;
  result res :: <C-double>;
  c-name: "gtk_adjustment_get_lower";
end;

define inline-only C-function gtk-adjustment-get-minimum-increment
  input parameter self :: <GtkAdjustment>;
  result res :: <C-double>;
  c-name: "gtk_adjustment_get_minimum_increment";
end;

define inline-only C-function gtk-adjustment-get-page-increment
  input parameter self :: <GtkAdjustment>;
  result res :: <C-double>;
  c-name: "gtk_adjustment_get_page_increment";
end;

define inline-only C-function gtk-adjustment-get-page-size
  input parameter self :: <GtkAdjustment>;
  result res :: <C-double>;
  c-name: "gtk_adjustment_get_page_size";
end;

define inline-only C-function gtk-adjustment-get-step-increment
  input parameter self :: <GtkAdjustment>;
  result res :: <C-double>;
  c-name: "gtk_adjustment_get_step_increment";
end;

define inline-only C-function gtk-adjustment-get-upper
  input parameter self :: <GtkAdjustment>;
  result res :: <C-double>;
  c-name: "gtk_adjustment_get_upper";
end;

define inline-only C-function gtk-adjustment-get-value
  input parameter self :: <GtkAdjustment>;
  result res :: <C-double>;
  c-name: "gtk_adjustment_get_value";
end;

define inline-only C-function gtk-adjustment-set-lower
  input parameter self :: <GtkAdjustment>;
  input parameter lower_ :: <C-double>;
  c-name: "gtk_adjustment_set_lower";
end;

define inline-only C-function gtk-adjustment-set-page-increment
  input parameter self :: <GtkAdjustment>;
  input parameter page_increment_ :: <C-double>;
  c-name: "gtk_adjustment_set_page_increment";
end;

define inline-only C-function gtk-adjustment-set-page-size
  input parameter self :: <GtkAdjustment>;
  input parameter page_size_ :: <C-double>;
  c-name: "gtk_adjustment_set_page_size";
end;

define inline-only C-function gtk-adjustment-set-step-increment
  input parameter self :: <GtkAdjustment>;
  input parameter step_increment_ :: <C-double>;
  c-name: "gtk_adjustment_set_step_increment";
end;

define inline-only C-function gtk-adjustment-set-upper
  input parameter self :: <GtkAdjustment>;
  input parameter upper_ :: <C-double>;
  c-name: "gtk_adjustment_set_upper";
end;

define inline-only C-function gtk-adjustment-set-value
  input parameter self :: <GtkAdjustment>;
  input parameter value_ :: <C-double>;
  c-name: "gtk_adjustment_set_value";
end;

define C-struct <_GtkAdjustmentClass>
  constant sealed inline-only slot gtk-adjustment-class-parent-class :: <GInitiallyUnownedClass>;
  constant sealed inline-only slot gtk-adjustment-class-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-adjustment-class-value-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-adjustment-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-adjustment-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-adjustment-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-adjustment-class-_gtk-reserved4 :: <C-void*>;
  pointer-type-name: <GtkAdjustmentClass>;
end C-struct;

define sealed domain make (singleton(<GtkAdjustmentClass>));
define sealed domain initialize (<GtkAdjustmentClass>);

define inline-only constant $gtk-align-fill = 0;
define inline-only constant $gtk-align-start = 1;
define inline-only constant $gtk-align-end = 2;
define inline-only constant $gtk-align-center = 3;
define inline-only constant $gtk-align-baseline = 4;
define constant <GtkAlign> = <C-int>;
define C-pointer-type <GtkAlign*> => <GtkAlign>;

define open C-subtype <GtkAlternativeTrigger> (<GtkShortcutTrigger>)
end C-subtype;

define C-pointer-type <GtkAlternativeTrigger*> => <GtkAlternativeTrigger>;

define sealed domain make (singleton(<GtkAlternativeTrigger*>));
define sealed domain initialize (<GtkAlternativeTrigger*>);

define inline-only C-function gtk-alternative-trigger-new
  input parameter first_ :: <GtkShortcutTrigger>;
  input parameter second_ :: <GtkShortcutTrigger>;
  result res :: <GtkShortcutTrigger>;
  c-name: "gtk_alternative_trigger_new";
end;

define inline-only C-function gtk-alternative-trigger-get-first
  input parameter self :: <GtkAlternativeTrigger>;
  result res :: <GtkShortcutTrigger>;
  c-name: "gtk_alternative_trigger_get_first";
end;

define inline-only C-function gtk-alternative-trigger-get-second
  input parameter self :: <GtkAlternativeTrigger>;
  result res :: <GtkShortcutTrigger>;
  c-name: "gtk_alternative_trigger_get_second";
end;

define C-struct <_GtkAlternativeTriggerClass>
  pointer-type-name: <GtkAlternativeTriggerClass>;
end C-struct;

define sealed domain make (singleton(<GtkAlternativeTriggerClass>));
define sealed domain initialize (<GtkAlternativeTriggerClass>);

define open C-subtype <GtkAnyFilter> (<GtkMultiFilter>)
end C-subtype;

define C-pointer-type <GtkAnyFilter*> => <GtkAnyFilter>;

define sealed domain make (singleton(<GtkAnyFilter*>));
define sealed domain initialize (<GtkAnyFilter*>);

define inline-only C-function gtk-any-filter-new
  result res :: <GtkAnyFilter>;
  c-name: "gtk_any_filter_new";
end;

define C-struct <_GtkAnyFilterClass>
  pointer-type-name: <GtkAnyFilterClass>;
end C-struct;

define sealed domain make (singleton(<GtkAnyFilterClass>));
define sealed domain initialize (<GtkAnyFilterClass>);

// Interface
define open C-subtype <GtkAppChooser> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkAppChooser*> => <GtkAppChooser>;

define sealed domain make (singleton(<GtkAppChooser*>));
define sealed domain initialize (<GtkAppChooser*>);

define inline-only C-function gtk-app-chooser-get-app-info
  input parameter self :: <GtkAppChooser>;
  result res :: <GAppInfo>;
  c-name: "gtk_app_chooser_get_app_info";
end;

define inline-only C-function gtk-app-chooser-get-content-type
  input parameter self :: <GtkAppChooser>;
  result res :: <C-string>;
  c-name: "gtk_app_chooser_get_content_type";
end;

define inline-only C-function gtk-app-chooser-refresh
  input parameter self :: <GtkAppChooser>;
  c-name: "gtk_app_chooser_refresh";
end;

define open C-subtype <GtkAppChooserButton> (<GtkAppChooser>)
end C-subtype;

define C-pointer-type <GtkAppChooserButton*> => <GtkAppChooserButton>;

define sealed domain make (singleton(<GtkAppChooserButton*>));
define sealed domain initialize (<GtkAppChooserButton*>);

define inline-only C-function gtk-app-chooser-button-new
  input parameter content_type_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_app_chooser_button_new";
end;

define inline-only C-function gtk-app-chooser-button-append-custom-item
  input parameter self :: <GtkAppChooserButton>;
  input parameter name_ :: <C-string>;
  input parameter label_ :: <C-string>;
  input parameter icon_ :: <GIcon>;
  c-name: "gtk_app_chooser_button_append_custom_item";
end;

define inline-only C-function gtk-app-chooser-button-append-separator
  input parameter self :: <GtkAppChooserButton>;
  c-name: "gtk_app_chooser_button_append_separator";
end;

define inline-only C-function gtk-app-chooser-button-get-heading
  input parameter self :: <GtkAppChooserButton>;
  result res :: <C-string>;
  c-name: "gtk_app_chooser_button_get_heading";
end;

define inline-only C-function gtk-app-chooser-button-get-modal
  input parameter self :: <GtkAppChooserButton>;
  result res :: <C-boolean>;
  c-name: "gtk_app_chooser_button_get_modal";
end;

define inline-only C-function gtk-app-chooser-button-get-show-default-item
  input parameter self :: <GtkAppChooserButton>;
  result res :: <C-boolean>;
  c-name: "gtk_app_chooser_button_get_show_default_item";
end;

define inline-only C-function gtk-app-chooser-button-get-show-dialog-item
  input parameter self :: <GtkAppChooserButton>;
  result res :: <C-boolean>;
  c-name: "gtk_app_chooser_button_get_show_dialog_item";
end;

define inline-only C-function gtk-app-chooser-button-set-active-custom-item
  input parameter self :: <GtkAppChooserButton>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_app_chooser_button_set_active_custom_item";
end;

define inline-only C-function gtk-app-chooser-button-set-heading
  input parameter self :: <GtkAppChooserButton>;
  input parameter heading_ :: <C-string>;
  c-name: "gtk_app_chooser_button_set_heading";
end;

define inline-only C-function gtk-app-chooser-button-set-modal
  input parameter self :: <GtkAppChooserButton>;
  input parameter modal_ :: <C-boolean>;
  c-name: "gtk_app_chooser_button_set_modal";
end;

define inline-only C-function gtk-app-chooser-button-set-show-default-item
  input parameter self :: <GtkAppChooserButton>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_app_chooser_button_set_show_default_item";
end;

define inline-only C-function gtk-app-chooser-button-set-show-dialog-item
  input parameter self :: <GtkAppChooserButton>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_app_chooser_button_set_show_dialog_item";
end;

define open C-subtype <GtkAppChooserDialog> (<GtkDialog>, <GtkAppChooser>)
end C-subtype;

define C-pointer-type <GtkAppChooserDialog*> => <GtkAppChooserDialog>;

define sealed domain make (singleton(<GtkAppChooserDialog*>));
define sealed domain initialize (<GtkAppChooserDialog*>);

define inline-only C-function gtk-app-chooser-dialog-new
  input parameter parent_ :: <GtkWindow>;
  input parameter flags_ :: <GtkDialogFlags>;
  input parameter file_ :: <GFile>;
  result res :: <GtkWidget>;
  c-name: "gtk_app_chooser_dialog_new";
end;

define inline-only C-function gtk-app-chooser-dialog-new-for-content-type
  input parameter parent_ :: <GtkWindow>;
  input parameter flags_ :: <GtkDialogFlags>;
  input parameter content_type_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_app_chooser_dialog_new_for_content_type";
end;

define inline-only C-function gtk-app-chooser-dialog-get-heading
  input parameter self :: <GtkAppChooserDialog>;
  result res :: <C-string>;
  c-name: "gtk_app_chooser_dialog_get_heading";
end;

define inline-only C-function gtk-app-chooser-dialog-get-widget
  input parameter self :: <GtkAppChooserDialog>;
  result res :: <GtkWidget>;
  c-name: "gtk_app_chooser_dialog_get_widget";
end;

define inline-only C-function gtk-app-chooser-dialog-set-heading
  input parameter self :: <GtkAppChooserDialog>;
  input parameter heading_ :: <C-string>;
  c-name: "gtk_app_chooser_dialog_set_heading";
end;

define open C-subtype <GtkAppChooserWidget> (<GtkAppChooser>)
end C-subtype;

define C-pointer-type <GtkAppChooserWidget*> => <GtkAppChooserWidget>;

define sealed domain make (singleton(<GtkAppChooserWidget*>));
define sealed domain initialize (<GtkAppChooserWidget*>);

define inline-only C-function gtk-app-chooser-widget-new
  input parameter content_type_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_app_chooser_widget_new";
end;

define inline-only C-function gtk-app-chooser-widget-get-default-text
  input parameter self :: <GtkAppChooserWidget>;
  result res :: <C-string>;
  c-name: "gtk_app_chooser_widget_get_default_text";
end;

define inline-only C-function gtk-app-chooser-widget-get-show-all
  input parameter self :: <GtkAppChooserWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_get_show_all";
end;

define inline-only C-function gtk-app-chooser-widget-get-show-default
  input parameter self :: <GtkAppChooserWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_get_show_default";
end;

define inline-only C-function gtk-app-chooser-widget-get-show-fallback
  input parameter self :: <GtkAppChooserWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_get_show_fallback";
end;

define inline-only C-function gtk-app-chooser-widget-get-show-other
  input parameter self :: <GtkAppChooserWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_get_show_other";
end;

define inline-only C-function gtk-app-chooser-widget-get-show-recommended
  input parameter self :: <GtkAppChooserWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_get_show_recommended";
end;

define inline-only C-function gtk-app-chooser-widget-set-default-text
  input parameter self :: <GtkAppChooserWidget>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_app_chooser_widget_set_default_text";
end;

define inline-only C-function gtk-app-chooser-widget-set-show-all
  input parameter self :: <GtkAppChooserWidget>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_set_show_all";
end;

define inline-only C-function gtk-app-chooser-widget-set-show-default
  input parameter self :: <GtkAppChooserWidget>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_set_show_default";
end;

define inline-only C-function gtk-app-chooser-widget-set-show-fallback
  input parameter self :: <GtkAppChooserWidget>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_set_show_fallback";
end;

define inline-only C-function gtk-app-chooser-widget-set-show-other
  input parameter self :: <GtkAppChooserWidget>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_set_show_other";
end;

define inline-only C-function gtk-app-chooser-widget-set-show-recommended
  input parameter self :: <GtkAppChooserWidget>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_app_chooser_widget_set_show_recommended";
end;

define open C-subtype <GtkApplication> (<GApplication>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkApplication*> => <GtkApplication>;

define sealed domain make (singleton(<GtkApplication*>));
define sealed domain initialize (<GtkApplication*>);

define inline-only C-function gtk-application-new
  input parameter application_id_ :: <C-string>;
  input parameter flags_ :: <GApplicationFlags>;
  result res :: <GtkApplication>;
  c-name: "gtk_application_new";
end;

define inline-only C-function gtk-application-add-window
  input parameter self :: <GtkApplication>;
  input parameter window_ :: <GtkWindow>;
  c-name: "gtk_application_add_window";
end;

define inline-only C-function gtk-application-get-accels-for-action
  input parameter self :: <GtkApplication>;
  input parameter detailed_action_name_ :: <C-string>;
  result res :: <C-string*>;
  c-name: "gtk_application_get_accels_for_action";
end;

define inline-only C-function gtk-application-get-actions-for-accel
  input parameter self :: <GtkApplication>;
  input parameter accel_ :: <C-string>;
  result res :: <C-string*>;
  c-name: "gtk_application_get_actions_for_accel";
end;

define inline-only C-function gtk-application-get-active-window
  input parameter self :: <GtkApplication>;
  result res :: <GtkWindow>;
  c-name: "gtk_application_get_active_window";
end;

define inline-only C-function gtk-application-get-menu-by-id
  input parameter self :: <GtkApplication>;
  input parameter id_ :: <C-string>;
  result res :: <GMenu>;
  c-name: "gtk_application_get_menu_by_id";
end;

define inline-only C-function gtk-application-get-menubar
  input parameter self :: <GtkApplication>;
  result res :: <GMenuModel>;
  c-name: "gtk_application_get_menubar";
end;

define inline-only C-function gtk-application-get-window-by-id
  input parameter self :: <GtkApplication>;
  input parameter id_ :: <C-unsigned-int>;
  result res :: <GtkWindow>;
  c-name: "gtk_application_get_window_by_id";
end;

define inline-only C-function gtk-application-get-windows
  input parameter self :: <GtkApplication>;
  result res :: <GList>;
  c-name: "gtk_application_get_windows";
end;

define inline-only C-function gtk-application-inhibit
  input parameter self :: <GtkApplication>;
  input parameter window_ :: <GtkWindow>;
  input parameter flags_ :: <GtkApplicationInhibitFlags>;
  input parameter reason_ :: <C-string>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_application_inhibit";
end;

define inline-only C-function gtk-application-list-action-descriptions
  input parameter self :: <GtkApplication>;
  result res :: <C-string*>;
  c-name: "gtk_application_list_action_descriptions";
end;

define inline-only C-function gtk-application-remove-window
  input parameter self :: <GtkApplication>;
  input parameter window_ :: <GtkWindow>;
  c-name: "gtk_application_remove_window";
end;

define inline-only C-function gtk-application-set-accels-for-action
  input parameter self :: <GtkApplication>;
  input parameter detailed_action_name_ :: <C-string>;
  input parameter accels_ :: <C-string*>;
  c-name: "gtk_application_set_accels_for_action";
end;

define inline-only C-function gtk-application-set-menubar
  input parameter self :: <GtkApplication>;
  input parameter menubar_ :: <GMenuModel>;
  c-name: "gtk_application_set_menubar";
end;

define inline-only C-function gtk-application-uninhibit
  input parameter self :: <GtkApplication>;
  input parameter cookie_ :: <C-unsigned-int>;
  c-name: "gtk_application_uninhibit";
end;

define C-struct <_GtkApplicationClass>
  constant sealed inline-only slot gtk-application-class-parent-class :: <GApplicationClass>;
  constant sealed inline-only slot gtk-application-class-window-added :: <C-function-pointer>;
  constant sealed inline-only slot gtk-application-class-window-removed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-application-class-padding :: <C-void*>;
  pointer-type-name: <GtkApplicationClass>;
end C-struct;

define sealed domain make (singleton(<GtkApplicationClass>));
define sealed domain initialize (<GtkApplicationClass>);

define inline-only constant $gtk-application-inhibit-logout = 1;
define inline-only constant $gtk-application-inhibit-switch = 2;
define inline-only constant $gtk-application-inhibit-suspend = 4;
define inline-only constant $gtk-application-inhibit-idle = 8;
define constant <GtkApplicationInhibitFlags> = <C-int>;
define C-pointer-type <GtkApplicationInhibitFlags*> => <GtkApplicationInhibitFlags>;

define open C-subtype <GtkApplicationWindow> (<GtkWindow>, <GActionGroup>, <GActionMap>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkApplicationWindow*> => <GtkApplicationWindow>;

define sealed domain make (singleton(<GtkApplicationWindow*>));
define sealed domain initialize (<GtkApplicationWindow*>);

define inline-only C-function gtk-application-window-new
  input parameter application_ :: <GtkApplication>;
  result res :: <GtkWidget>;
  c-name: "gtk_application_window_new";
end;

define inline-only C-function gtk-application-window-get-help-overlay
  input parameter self :: <GtkApplicationWindow>;
  result res :: <GtkShortcutsWindow>;
  c-name: "gtk_application_window_get_help_overlay";
end;

define inline-only C-function gtk-application-window-get-id
  input parameter self :: <GtkApplicationWindow>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_application_window_get_id";
end;

define inline-only C-function gtk-application-window-get-show-menubar
  input parameter self :: <GtkApplicationWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_application_window_get_show_menubar";
end;

define inline-only C-function gtk-application-window-set-help-overlay
  input parameter self :: <GtkApplicationWindow>;
  input parameter help_overlay_ :: <GtkShortcutsWindow>;
  c-name: "gtk_application_window_set_help_overlay";
end;

define inline-only C-function gtk-application-window-set-show-menubar
  input parameter self :: <GtkApplicationWindow>;
  input parameter show_menubar_ :: <C-boolean>;
  c-name: "gtk_application_window_set_show_menubar";
end;

define C-struct <_GtkApplicationWindowClass>
  constant sealed inline-only slot gtk-application-window-class-parent-class :: <GtkWindowClass>;
  constant sealed inline-only slot gtk-application-window-class-padding :: <C-void*>;
  pointer-type-name: <GtkApplicationWindowClass>;
end C-struct;

define sealed domain make (singleton(<GtkApplicationWindowClass>));
define sealed domain initialize (<GtkApplicationWindowClass>);

define inline-only constant $gtk-arrow-up = 0;
define inline-only constant $gtk-arrow-down = 1;
define inline-only constant $gtk-arrow-left = 2;
define inline-only constant $gtk-arrow-right = 3;
define inline-only constant $gtk-arrow-none = 4;
define constant <GtkArrowType> = <C-int>;
define C-pointer-type <GtkArrowType*> => <GtkArrowType>;

define open C-subtype <GtkAspectFrame> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkAspectFrame*> => <GtkAspectFrame>;

define sealed domain make (singleton(<GtkAspectFrame*>));
define sealed domain initialize (<GtkAspectFrame*>);

define inline-only C-function gtk-aspect-frame-new
  input parameter xalign_ :: <C-float>;
  input parameter yalign_ :: <C-float>;
  input parameter ratio_ :: <C-float>;
  input parameter obey_child_ :: <C-boolean>;
  result res :: <GtkWidget>;
  c-name: "gtk_aspect_frame_new";
end;

define inline-only C-function gtk-aspect-frame-get-child
  input parameter self :: <GtkAspectFrame>;
  result res :: <GtkWidget>;
  c-name: "gtk_aspect_frame_get_child";
end;

define inline-only C-function gtk-aspect-frame-get-obey-child
  input parameter self :: <GtkAspectFrame>;
  result res :: <C-boolean>;
  c-name: "gtk_aspect_frame_get_obey_child";
end;

define inline-only C-function gtk-aspect-frame-get-ratio
  input parameter self :: <GtkAspectFrame>;
  result res :: <C-float>;
  c-name: "gtk_aspect_frame_get_ratio";
end;

define inline-only C-function gtk-aspect-frame-get-xalign
  input parameter self :: <GtkAspectFrame>;
  result res :: <C-float>;
  c-name: "gtk_aspect_frame_get_xalign";
end;

define inline-only C-function gtk-aspect-frame-get-yalign
  input parameter self :: <GtkAspectFrame>;
  result res :: <C-float>;
  c-name: "gtk_aspect_frame_get_yalign";
end;

define inline-only C-function gtk-aspect-frame-set-child
  input parameter self :: <GtkAspectFrame>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_aspect_frame_set_child";
end;

define inline-only C-function gtk-aspect-frame-set-obey-child
  input parameter self :: <GtkAspectFrame>;
  input parameter obey_child_ :: <C-boolean>;
  c-name: "gtk_aspect_frame_set_obey_child";
end;

define inline-only C-function gtk-aspect-frame-set-ratio
  input parameter self :: <GtkAspectFrame>;
  input parameter ratio_ :: <C-float>;
  c-name: "gtk_aspect_frame_set_ratio";
end;

define inline-only C-function gtk-aspect-frame-set-xalign
  input parameter self :: <GtkAspectFrame>;
  input parameter xalign_ :: <C-float>;
  c-name: "gtk_aspect_frame_set_xalign";
end;

define inline-only C-function gtk-aspect-frame-set-yalign
  input parameter self :: <GtkAspectFrame>;
  input parameter yalign_ :: <C-float>;
  c-name: "gtk_aspect_frame_set_yalign";
end;

define open C-subtype <GtkAssistant> (<GtkWindow>)
end C-subtype;

define C-pointer-type <GtkAssistant*> => <GtkAssistant>;

define sealed domain make (singleton(<GtkAssistant*>));
define sealed domain initialize (<GtkAssistant*>);

define inline-only C-function gtk-assistant-new
  result res :: <GtkWidget>;
  c-name: "gtk_assistant_new";
end;

define inline-only C-function gtk-assistant-add-action-widget
  input parameter self :: <GtkAssistant>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_assistant_add_action_widget";
end;

define inline-only C-function gtk-assistant-append-page
  input parameter self :: <GtkAssistant>;
  input parameter page_ :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_assistant_append_page";
end;

define inline-only C-function gtk-assistant-commit
  input parameter self :: <GtkAssistant>;
  c-name: "gtk_assistant_commit";
end;

define inline-only C-function gtk-assistant-get-current-page
  input parameter self :: <GtkAssistant>;
  result res :: <C-signed-int>;
  c-name: "gtk_assistant_get_current_page";
end;

define inline-only C-function gtk-assistant-get-n-pages
  input parameter self :: <GtkAssistant>;
  result res :: <C-signed-int>;
  c-name: "gtk_assistant_get_n_pages";
end;

define inline-only C-function gtk-assistant-get-nth-page
  input parameter self :: <GtkAssistant>;
  input parameter page_num_ :: <C-signed-int>;
  result res :: <GtkWidget>;
  c-name: "gtk_assistant_get_nth_page";
end;

define inline-only C-function gtk-assistant-get-page
  input parameter self :: <GtkAssistant>;
  input parameter child_ :: <GtkWidget>;
  result res :: <GtkAssistantPage>;
  c-name: "gtk_assistant_get_page";
end;

define inline-only C-function gtk-assistant-get-page-complete
  input parameter self :: <GtkAssistant>;
  input parameter page_ :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_assistant_get_page_complete";
end;

define inline-only C-function gtk-assistant-get-page-title
  input parameter self :: <GtkAssistant>;
  input parameter page_ :: <GtkWidget>;
  result res :: <C-string>;
  c-name: "gtk_assistant_get_page_title";
end;

define inline-only C-function gtk-assistant-get-page-type
  input parameter self :: <GtkAssistant>;
  input parameter page_ :: <GtkWidget>;
  result res :: <GtkAssistantPageType>;
  c-name: "gtk_assistant_get_page_type";
end;

define inline-only C-function gtk-assistant-get-pages
  input parameter self :: <GtkAssistant>;
  result res :: <GListModel>;
  c-name: "gtk_assistant_get_pages";
end;

define inline-only C-function gtk-assistant-insert-page
  input parameter self :: <GtkAssistant>;
  input parameter page_ :: <GtkWidget>;
  input parameter position_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gtk_assistant_insert_page";
end;

define inline-only C-function gtk-assistant-next-page
  input parameter self :: <GtkAssistant>;
  c-name: "gtk_assistant_next_page";
end;

define inline-only C-function gtk-assistant-prepend-page
  input parameter self :: <GtkAssistant>;
  input parameter page_ :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_assistant_prepend_page";
end;

define inline-only C-function gtk-assistant-previous-page
  input parameter self :: <GtkAssistant>;
  c-name: "gtk_assistant_previous_page";
end;

define inline-only C-function gtk-assistant-remove-action-widget
  input parameter self :: <GtkAssistant>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_assistant_remove_action_widget";
end;

define inline-only C-function gtk-assistant-remove-page
  input parameter self :: <GtkAssistant>;
  input parameter page_num_ :: <C-signed-int>;
  c-name: "gtk_assistant_remove_page";
end;

define inline-only C-function gtk-assistant-set-current-page
  input parameter self :: <GtkAssistant>;
  input parameter page_num_ :: <C-signed-int>;
  c-name: "gtk_assistant_set_current_page";
end;

define inline-only C-function gtk-assistant-set-forward-page-func
  input parameter self :: <GtkAssistant>;
  input parameter page_func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_assistant_set_forward_page_func";
end;

define inline-only C-function gtk-assistant-set-page-complete
  input parameter self :: <GtkAssistant>;
  input parameter page_ :: <GtkWidget>;
  input parameter complete_ :: <C-boolean>;
  c-name: "gtk_assistant_set_page_complete";
end;

define inline-only C-function gtk-assistant-set-page-title
  input parameter self :: <GtkAssistant>;
  input parameter page_ :: <GtkWidget>;
  input parameter title_ :: <C-string>;
  c-name: "gtk_assistant_set_page_title";
end;

define inline-only C-function gtk-assistant-set-page-type
  input parameter self :: <GtkAssistant>;
  input parameter page_ :: <GtkWidget>;
  input parameter type_ :: <GtkAssistantPageType>;
  c-name: "gtk_assistant_set_page_type";
end;

define inline-only C-function gtk-assistant-update-buttons-state
  input parameter self :: <GtkAssistant>;
  c-name: "gtk_assistant_update_buttons_state";
end;

define open C-subtype <GtkAssistantPage> (<GObject>)
end C-subtype;

define C-pointer-type <GtkAssistantPage*> => <GtkAssistantPage>;

define sealed domain make (singleton(<GtkAssistantPage*>));
define sealed domain initialize (<GtkAssistantPage*>);

define inline-only C-function gtk-assistant-page-get-child
  input parameter self :: <GtkAssistantPage>;
  result res :: <GtkWidget>;
  c-name: "gtk_assistant_page_get_child";
end;

define inline-only constant $gtk-assistant-page-content = 0;
define inline-only constant $gtk-assistant-page-intro = 1;
define inline-only constant $gtk-assistant-page-confirm = 2;
define inline-only constant $gtk-assistant-page-summary = 3;
define inline-only constant $gtk-assistant-page-progress = 4;
define inline-only constant $gtk-assistant-page-custom = 5;
define constant <GtkAssistantPageType> = <C-int>;
define C-pointer-type <GtkAssistantPageType*> => <GtkAssistantPageType>;

define inline-only constant $gtk-binary-age = 803;

define inline-only constant $gtk-baseline-position-top = 0;
define inline-only constant $gtk-baseline-position-center = 1;
define inline-only constant $gtk-baseline-position-bottom = 2;
define constant <GtkBaselinePosition> = <C-int>;
define C-pointer-type <GtkBaselinePosition*> => <GtkBaselinePosition>;

define open C-subtype <GtkBinLayout> (<GtkLayoutManager>)
end C-subtype;

define C-pointer-type <GtkBinLayout*> => <GtkBinLayout>;

define sealed domain make (singleton(<GtkBinLayout*>));
define sealed domain initialize (<GtkBinLayout*>);

define inline-only C-function gtk-bin-layout-new
  result res :: <GtkLayoutManager>;
  c-name: "gtk_bin_layout_new";
end;

define C-struct <_GtkBinLayoutClass>
  constant sealed inline-only slot gtk-bin-layout-class-parent-class :: <GtkLayoutManagerClass>;
  pointer-type-name: <GtkBinLayoutClass>;
end C-struct;

define sealed domain make (singleton(<GtkBinLayoutClass>));
define sealed domain initialize (<GtkBinLayoutClass>);

define C-struct <_GtkBitset>
  pointer-type-name: <GtkBitset>;
end C-struct;

define sealed domain make (singleton(<GtkBitset>));
define sealed domain initialize (<GtkBitset>);

define inline-only C-function gtk-bitset-new-empty
  result res :: <GtkBitset>;
  c-name: "gtk_bitset_new_empty";
end;

define inline-only C-function gtk-bitset-new-range
  input parameter start_ :: <C-unsigned-int>;
  input parameter n_items_ :: <C-unsigned-int>;
  result res :: <GtkBitset>;
  c-name: "gtk_bitset_new_range";
end;

define inline-only C-function gtk-bitset-add
  input parameter self :: <GtkBitset>;
  input parameter value_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_add";
end;

define inline-only C-function gtk-bitset-add-range
  input parameter self :: <GtkBitset>;
  input parameter start_ :: <C-unsigned-int>;
  input parameter n_items_ :: <C-unsigned-int>;
  c-name: "gtk_bitset_add_range";
end;

define inline-only C-function gtk-bitset-add-range-closed
  input parameter self :: <GtkBitset>;
  input parameter first_ :: <C-unsigned-int>;
  input parameter last_ :: <C-unsigned-int>;
  c-name: "gtk_bitset_add_range_closed";
end;

define inline-only C-function gtk-bitset-add-rectangle
  input parameter self :: <GtkBitset>;
  input parameter start_ :: <C-unsigned-int>;
  input parameter width_ :: <C-unsigned-int>;
  input parameter height_ :: <C-unsigned-int>;
  input parameter stride_ :: <C-unsigned-int>;
  c-name: "gtk_bitset_add_rectangle";
end;

define inline-only C-function gtk-bitset-contains
  input parameter self :: <GtkBitset>;
  input parameter value_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_contains";
end;

define inline-only C-function gtk-bitset-copy
  input parameter self :: <GtkBitset>;
  result res :: <GtkBitset>;
  c-name: "gtk_bitset_copy";
end;

define inline-only C-function gtk-bitset-difference
  input parameter self :: <GtkBitset>;
  input parameter other_ :: <GtkBitset>;
  c-name: "gtk_bitset_difference";
end;

define inline-only C-function gtk-bitset-equals
  input parameter self :: <GtkBitset>;
  input parameter other_ :: <GtkBitset>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_equals";
end;

define inline-only C-function gtk-bitset-get-maximum
  input parameter self :: <GtkBitset>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_bitset_get_maximum";
end;

define inline-only C-function gtk-bitset-get-minimum
  input parameter self :: <GtkBitset>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_bitset_get_minimum";
end;

define inline-only C-function gtk-bitset-get-nth
  input parameter self :: <GtkBitset>;
  input parameter nth_ :: <C-unsigned-int>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_bitset_get_nth";
end;

define inline-only C-function gtk-bitset-get-size
  input parameter self :: <GtkBitset>;
  result res :: <C-unsigned-long>;
  c-name: "gtk_bitset_get_size";
end;

define inline-only C-function gtk-bitset-get-size-in-range
  input parameter self :: <GtkBitset>;
  input parameter first_ :: <C-unsigned-int>;
  input parameter last_ :: <C-unsigned-int>;
  result res :: <C-unsigned-long>;
  c-name: "gtk_bitset_get_size_in_range";
end;

define inline-only C-function gtk-bitset-intersect
  input parameter self :: <GtkBitset>;
  input parameter other_ :: <GtkBitset>;
  c-name: "gtk_bitset_intersect";
end;

define inline-only C-function gtk-bitset-is-empty
  input parameter self :: <GtkBitset>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_is_empty";
end;

define inline-only C-function gtk-bitset-ref
  input parameter self :: <GtkBitset>;
  result res :: <GtkBitset>;
  c-name: "gtk_bitset_ref";
end;

define inline-only C-function gtk-bitset-remove
  input parameter self :: <GtkBitset>;
  input parameter value_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_remove";
end;

define inline-only C-function gtk-bitset-remove-all
  input parameter self :: <GtkBitset>;
  c-name: "gtk_bitset_remove_all";
end;

define inline-only C-function gtk-bitset-remove-range
  input parameter self :: <GtkBitset>;
  input parameter start_ :: <C-unsigned-int>;
  input parameter n_items_ :: <C-unsigned-int>;
  c-name: "gtk_bitset_remove_range";
end;

define inline-only C-function gtk-bitset-remove-range-closed
  input parameter self :: <GtkBitset>;
  input parameter first_ :: <C-unsigned-int>;
  input parameter last_ :: <C-unsigned-int>;
  c-name: "gtk_bitset_remove_range_closed";
end;

define inline-only C-function gtk-bitset-remove-rectangle
  input parameter self :: <GtkBitset>;
  input parameter start_ :: <C-unsigned-int>;
  input parameter width_ :: <C-unsigned-int>;
  input parameter height_ :: <C-unsigned-int>;
  input parameter stride_ :: <C-unsigned-int>;
  c-name: "gtk_bitset_remove_rectangle";
end;

define inline-only C-function gtk-bitset-shift-left
  input parameter self :: <GtkBitset>;
  input parameter amount_ :: <C-unsigned-int>;
  c-name: "gtk_bitset_shift_left";
end;

define inline-only C-function gtk-bitset-shift-right
  input parameter self :: <GtkBitset>;
  input parameter amount_ :: <C-unsigned-int>;
  c-name: "gtk_bitset_shift_right";
end;

define inline-only C-function gtk-bitset-splice
  input parameter self :: <GtkBitset>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter removed_ :: <C-unsigned-int>;
  input parameter added_ :: <C-unsigned-int>;
  c-name: "gtk_bitset_splice";
end;

define inline-only C-function gtk-bitset-subtract
  input parameter self :: <GtkBitset>;
  input parameter other_ :: <GtkBitset>;
  c-name: "gtk_bitset_subtract";
end;

define inline-only C-function gtk-bitset-union
  input parameter self :: <GtkBitset>;
  input parameter other_ :: <GtkBitset>;
  c-name: "gtk_bitset_union";
end;

define inline-only C-function gtk-bitset-unref
  input parameter self :: <GtkBitset>;
  c-name: "gtk_bitset_unref";
end;

define C-struct <_GtkBitsetIter>
  constant sealed inline-only slot gtk-bitset-iter-private-data :: <C-void*>;
  pointer-type-name: <GtkBitsetIter>;
end C-struct;

define sealed domain make (singleton(<GtkBitsetIter>));
define sealed domain initialize (<GtkBitsetIter>);

define inline-only C-function gtk-bitset-iter-get-value
  input parameter self :: <GtkBitsetIter>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_bitset_iter_get_value";
end;

define inline-only C-function gtk-bitset-iter-is-valid
  input parameter self :: <GtkBitsetIter>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_iter_is_valid";
end;

define inline-only C-function gtk-bitset-iter-next
  input parameter self :: <GtkBitsetIter>;
  output parameter value_ :: <C-unsigned-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_iter_next";
end;

define inline-only C-function gtk-bitset-iter-previous
  input parameter self :: <GtkBitsetIter>;
  output parameter value_ :: <C-unsigned-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_iter_previous";
end;

define inline-only C-function gtk-bitset-iter-init-at
  input parameter iter_ :: <GtkBitsetIter>;
  input parameter set_ :: <GtkBitset>;
  input parameter target_ :: <C-unsigned-int>;
  output parameter value_ :: <C-unsigned-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_iter_init_at";
end;

define inline-only C-function gtk-bitset-iter-init-first
  input parameter iter_ :: <GtkBitsetIter>;
  input parameter set_ :: <GtkBitset>;
  output parameter value_ :: <C-unsigned-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_iter_init_first";
end;

define inline-only C-function gtk-bitset-iter-init-last
  input parameter iter_ :: <GtkBitsetIter>;
  input parameter set_ :: <GtkBitset>;
  output parameter value_ :: <C-unsigned-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_bitset_iter_init_last";
end;

define open C-subtype <GtkBookmarkList> (<GObject>, <GListModel>)
end C-subtype;

define C-pointer-type <GtkBookmarkList*> => <GtkBookmarkList>;

define sealed domain make (singleton(<GtkBookmarkList*>));
define sealed domain initialize (<GtkBookmarkList*>);

define inline-only C-function gtk-bookmark-list-new
  input parameter filename_ :: <C-string>;
  input parameter attributes_ :: <C-string>;
  result res :: <GtkBookmarkList>;
  c-name: "gtk_bookmark_list_new";
end;

define inline-only C-function gtk-bookmark-list-get-attributes
  input parameter self :: <GtkBookmarkList>;
  result res :: <C-string>;
  c-name: "gtk_bookmark_list_get_attributes";
end;

define inline-only C-function gtk-bookmark-list-get-filename
  input parameter self :: <GtkBookmarkList>;
  result res :: <C-string>;
  c-name: "gtk_bookmark_list_get_filename";
end;

define inline-only C-function gtk-bookmark-list-get-io-priority
  input parameter self :: <GtkBookmarkList>;
  result res :: <C-signed-int>;
  c-name: "gtk_bookmark_list_get_io_priority";
end;

define inline-only C-function gtk-bookmark-list-is-loading
  input parameter self :: <GtkBookmarkList>;
  result res :: <C-boolean>;
  c-name: "gtk_bookmark_list_is_loading";
end;

define inline-only C-function gtk-bookmark-list-set-attributes
  input parameter self :: <GtkBookmarkList>;
  input parameter attributes_ :: <C-string>;
  c-name: "gtk_bookmark_list_set_attributes";
end;

define inline-only C-function gtk-bookmark-list-set-io-priority
  input parameter self :: <GtkBookmarkList>;
  input parameter io_priority_ :: <C-signed-int>;
  c-name: "gtk_bookmark_list_set_io_priority";
end;

define C-struct <_GtkBookmarkListClass>
  constant sealed inline-only slot gtk-bookmark-list-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkBookmarkListClass>;
end C-struct;

define sealed domain make (singleton(<GtkBookmarkListClass>));
define sealed domain initialize (<GtkBookmarkListClass>);

define open C-subtype <GtkBoolFilter> (<GtkFilter>)
end C-subtype;

define C-pointer-type <GtkBoolFilter*> => <GtkBoolFilter>;

define sealed domain make (singleton(<GtkBoolFilter*>));
define sealed domain initialize (<GtkBoolFilter*>);

define inline-only C-function gtk-bool-filter-new
  input parameter expression_ :: <GtkExpression>;
  result res :: <GtkBoolFilter>;
  c-name: "gtk_bool_filter_new";
end;

define inline-only C-function gtk-bool-filter-get-expression
  input parameter self :: <GtkBoolFilter>;
  result res :: <GtkExpression>;
  c-name: "gtk_bool_filter_get_expression";
end;

define inline-only C-function gtk-bool-filter-get-invert
  input parameter self :: <GtkBoolFilter>;
  result res :: <C-boolean>;
  c-name: "gtk_bool_filter_get_invert";
end;

define inline-only C-function gtk-bool-filter-set-expression
  input parameter self :: <GtkBoolFilter>;
  input parameter expression_ :: <GtkExpression>;
  c-name: "gtk_bool_filter_set_expression";
end;

define inline-only C-function gtk-bool-filter-set-invert
  input parameter self :: <GtkBoolFilter>;
  input parameter invert_ :: <C-boolean>;
  c-name: "gtk_bool_filter_set_invert";
end;

define C-struct <_GtkBoolFilterClass>
  constant sealed inline-only slot gtk-bool-filter-class-parent-class :: <GtkFilterClass>;
  pointer-type-name: <GtkBoolFilterClass>;
end C-struct;

define sealed domain make (singleton(<GtkBoolFilterClass>));
define sealed domain initialize (<GtkBoolFilterClass>);

define C-struct <_GtkBorder>
  sealed inline-only slot gtk-border-left :: <C-signed-short>;
  sealed inline-only slot gtk-border-right :: <C-signed-short>;
  sealed inline-only slot gtk-border-top :: <C-signed-short>;
  sealed inline-only slot gtk-border-bottom :: <C-signed-short>;
  pointer-type-name: <GtkBorder>;
end C-struct;

define sealed domain make (singleton(<GtkBorder>));
define sealed domain initialize (<GtkBorder>);

define inline-only C-function gtk-border-new
  result res :: <GtkBorder>;
  c-name: "gtk_border_new";
end;

define inline-only C-function gtk-border-copy
  input parameter self :: <GtkBorder>;
  result res :: <GtkBorder>;
  c-name: "gtk_border_copy";
end;

define inline-only C-function gtk-border-free
  input parameter self :: <GtkBorder>;
  c-name: "gtk_border_free";
end;

define inline-only constant $gtk-border-style-none = 0;
define inline-only constant $gtk-border-style-hidden = 1;
define inline-only constant $gtk-border-style-solid = 2;
define inline-only constant $gtk-border-style-inset = 3;
define inline-only constant $gtk-border-style-outset = 4;
define inline-only constant $gtk-border-style-dotted = 5;
define inline-only constant $gtk-border-style-dashed = 6;
define inline-only constant $gtk-border-style-double = 7;
define inline-only constant $gtk-border-style-groove = 8;
define inline-only constant $gtk-border-style-ridge = 9;
define constant <GtkBorderStyle> = <C-int>;
define C-pointer-type <GtkBorderStyle*> => <GtkBorderStyle>;

define open C-subtype <GtkBox> (<GtkWidget>, <GtkOrientable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkBox*> => <GtkBox>;

define sealed domain make (singleton(<GtkBox*>));
define sealed domain initialize (<GtkBox*>);

define inline-only C-function gtk-box-new
  input parameter orientation_ :: <GtkOrientation>;
  input parameter spacing_ :: <C-signed-int>;
  result res :: <GtkWidget>;
  c-name: "gtk_box_new";
end;

define inline-only C-function gtk-box-append
  input parameter self :: <GtkBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_box_append";
end;

define inline-only C-function gtk-box-get-baseline-position
  input parameter self :: <GtkBox>;
  result res :: <GtkBaselinePosition>;
  c-name: "gtk_box_get_baseline_position";
end;

define inline-only C-function gtk-box-get-homogeneous
  input parameter self :: <GtkBox>;
  result res :: <C-boolean>;
  c-name: "gtk_box_get_homogeneous";
end;

define inline-only C-function gtk-box-get-spacing
  input parameter self :: <GtkBox>;
  result res :: <C-signed-int>;
  c-name: "gtk_box_get_spacing";
end;

define inline-only C-function gtk-box-insert-child-after
  input parameter self :: <GtkBox>;
  input parameter child_ :: <GtkWidget>;
  input parameter sibling_ :: <GtkWidget>;
  c-name: "gtk_box_insert_child_after";
end;

define inline-only C-function gtk-box-prepend
  input parameter self :: <GtkBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_box_prepend";
end;

define inline-only C-function gtk-box-remove
  input parameter self :: <GtkBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_box_remove";
end;

define inline-only C-function gtk-box-reorder-child-after
  input parameter self :: <GtkBox>;
  input parameter child_ :: <GtkWidget>;
  input parameter sibling_ :: <GtkWidget>;
  c-name: "gtk_box_reorder_child_after";
end;

define inline-only C-function gtk-box-set-baseline-position
  input parameter self :: <GtkBox>;
  input parameter position_ :: <GtkBaselinePosition>;
  c-name: "gtk_box_set_baseline_position";
end;

define inline-only C-function gtk-box-set-homogeneous
  input parameter self :: <GtkBox>;
  input parameter homogeneous_ :: <C-boolean>;
  c-name: "gtk_box_set_homogeneous";
end;

define inline-only C-function gtk-box-set-spacing
  input parameter self :: <GtkBox>;
  input parameter spacing_ :: <C-signed-int>;
  c-name: "gtk_box_set_spacing";
end;

define C-struct <_GtkBoxClass>
  constant sealed inline-only slot gtk-box-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-box-class-padding :: <C-void*>;
  pointer-type-name: <GtkBoxClass>;
end C-struct;

define sealed domain make (singleton(<GtkBoxClass>));
define sealed domain initialize (<GtkBoxClass>);

define open C-subtype <GtkBoxLayout> (<GtkLayoutManager>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkBoxLayout*> => <GtkBoxLayout>;

define sealed domain make (singleton(<GtkBoxLayout*>));
define sealed domain initialize (<GtkBoxLayout*>);

define inline-only C-function gtk-box-layout-new
  input parameter orientation_ :: <GtkOrientation>;
  result res :: <GtkLayoutManager>;
  c-name: "gtk_box_layout_new";
end;

define inline-only C-function gtk-box-layout-get-baseline-position
  input parameter self :: <GtkBoxLayout>;
  result res :: <GtkBaselinePosition>;
  c-name: "gtk_box_layout_get_baseline_position";
end;

define inline-only C-function gtk-box-layout-get-homogeneous
  input parameter self :: <GtkBoxLayout>;
  result res :: <C-boolean>;
  c-name: "gtk_box_layout_get_homogeneous";
end;

define inline-only C-function gtk-box-layout-get-spacing
  input parameter self :: <GtkBoxLayout>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_box_layout_get_spacing";
end;

define inline-only C-function gtk-box-layout-set-baseline-position
  input parameter self :: <GtkBoxLayout>;
  input parameter position_ :: <GtkBaselinePosition>;
  c-name: "gtk_box_layout_set_baseline_position";
end;

define inline-only C-function gtk-box-layout-set-homogeneous
  input parameter self :: <GtkBoxLayout>;
  input parameter homogeneous_ :: <C-boolean>;
  c-name: "gtk_box_layout_set_homogeneous";
end;

define inline-only C-function gtk-box-layout-set-spacing
  input parameter self :: <GtkBoxLayout>;
  input parameter spacing_ :: <C-unsigned-int>;
  c-name: "gtk_box_layout_set_spacing";
end;

define C-struct <_GtkBoxLayoutClass>
  constant sealed inline-only slot gtk-box-layout-class-parent-class :: <GtkLayoutManagerClass>;
  pointer-type-name: <GtkBoxLayoutClass>;
end C-struct;

define sealed domain make (singleton(<GtkBoxLayoutClass>));
define sealed domain initialize (<GtkBoxLayoutClass>);

// Interface
define open C-subtype <GtkBuildable> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkBuildable*> => <GtkBuildable>;

define sealed domain make (singleton(<GtkBuildable*>));
define sealed domain initialize (<GtkBuildable*>);

define inline-only C-function gtk-buildable-get-buildable-id
  input parameter self :: <GtkBuildable>;
  result res :: <C-string>;
  c-name: "gtk_buildable_get_buildable_id";
end;

define C-struct <_GtkBuildableIface>
  constant sealed inline-only slot gtk-buildable-iface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-buildable-iface-set-id :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-iface-get-id :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-iface-add-child :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-iface-set-buildable-property :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-iface-construct-child :: <C-void*>;
  constant sealed inline-only slot gtk-buildable-iface-custom-tag-start :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-iface-custom-tag-end :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-iface-custom-finished :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-iface-parser-finished :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-iface-get-internal-child :: <C-function-pointer>;
  pointer-type-name: <GtkBuildableIface>;
end C-struct;

define sealed domain make (singleton(<GtkBuildableIface>));
define sealed domain initialize (<GtkBuildableIface>);

define C-struct <_GtkBuildableParseContext>
  pointer-type-name: <GtkBuildableParseContext>;
end C-struct;

define sealed domain make (singleton(<GtkBuildableParseContext>));
define sealed domain initialize (<GtkBuildableParseContext>);

define inline-only C-function gtk-buildable-parse-context-get-element
  input parameter self :: <GtkBuildableParseContext>;
  result res :: <C-string>;
  c-name: "gtk_buildable_parse_context_get_element";
end;

define inline-only C-function gtk-buildable-parse-context-get-element-stack
  input parameter self :: <GtkBuildableParseContext>;
  result res :: <GPtrArray>;
  c-name: "gtk_buildable_parse_context_get_element_stack";
end;

define inline-only C-function gtk-buildable-parse-context-get-position
  input parameter self :: <GtkBuildableParseContext>;
  output parameter line_number_ :: <C-signed-int*>;
  output parameter char_number_ :: <C-signed-int*>;
  c-name: "gtk_buildable_parse_context_get_position";
end;

define inline-only C-function gtk-buildable-parse-context-pop
  input parameter self :: <GtkBuildableParseContext>;
  result res :: <C-void*>;
  c-name: "gtk_buildable_parse_context_pop";
end;

define inline-only C-function gtk-buildable-parse-context-push
  input parameter self :: <GtkBuildableParseContext>;
  input parameter parser_ :: <GtkBuildableParser>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gtk_buildable_parse_context_push";
end;

define C-struct <_GtkBuildableParser>
  constant sealed inline-only slot gtk-buildable-parser-start-element :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-parser-end-element :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-parser-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-parser-error :: <C-function-pointer>;
  constant sealed inline-only slot gtk-buildable-parser-padding :: <C-void*>;
  pointer-type-name: <GtkBuildableParser>;
end C-struct;

define sealed domain make (singleton(<GtkBuildableParser>));
define sealed domain initialize (<GtkBuildableParser>);

define open C-subtype <GtkBuilder> (<GObject>)
end C-subtype;

define C-pointer-type <GtkBuilder*> => <GtkBuilder>;

define sealed domain make (singleton(<GtkBuilder*>));
define sealed domain initialize (<GtkBuilder*>);

define inline-only C-function gtk-builder-new
  result res :: <GtkBuilder>;
  c-name: "gtk_builder_new";
end;

define inline-only C-function gtk-builder-new-from-file
  input parameter filename_ :: <C-string>;
  result res :: <GtkBuilder>;
  c-name: "gtk_builder_new_from_file";
end;

define inline-only C-function gtk-builder-new-from-resource
  input parameter resource_path_ :: <C-string>;
  result res :: <GtkBuilder>;
  c-name: "gtk_builder_new_from_resource";
end;

define inline-only C-function gtk-builder-new-from-string
  input parameter string_ :: <C-string>;
  input parameter length_ :: <C-signed-long>;
  result res :: <GtkBuilder>;
  c-name: "gtk_builder_new_from_string";
end;

define inline-only C-function gtk-builder-add-from-file
  input parameter self :: <GtkBuilder>;
  input parameter filename_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_builder_add_from_file";
end;

define inline-only C-function gtk-builder-add-from-resource
  input parameter self :: <GtkBuilder>;
  input parameter resource_path_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_builder_add_from_resource";
end;

define inline-only C-function gtk-builder-add-from-string
  input parameter self :: <GtkBuilder>;
  input parameter buffer_ :: <C-string>;
  input parameter length_ :: <C-signed-long>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_builder_add_from_string";
end;

define inline-only C-function gtk-builder-add-objects-from-file
  input parameter self :: <GtkBuilder>;
  input parameter filename_ :: <C-string>;
  input parameter object_ids_ :: <C-string*>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_builder_add_objects_from_file";
end;

define inline-only C-function gtk-builder-add-objects-from-resource
  input parameter self :: <GtkBuilder>;
  input parameter resource_path_ :: <C-string>;
  input parameter object_ids_ :: <C-string*>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_builder_add_objects_from_resource";
end;

define inline-only C-function gtk-builder-add-objects-from-string
  input parameter self :: <GtkBuilder>;
  input parameter buffer_ :: <C-string>;
  input parameter length_ :: <C-signed-long>;
  input parameter object_ids_ :: <C-string*>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_builder_add_objects_from_string";
end;

define inline-only C-function gtk-builder-create-closure
  input parameter self :: <GtkBuilder>;
  input parameter function_name_ :: <C-string>;
  input parameter flags_ :: <GtkBuilderClosureFlags>;
  input parameter object_ :: <GObject>;
  output parameter error_ :: <GError*>;
  result res :: <GClosure>;
  c-name: "gtk_builder_create_closure";
end;

define inline-only C-function gtk-builder-expose-object
  input parameter self :: <GtkBuilder>;
  input parameter name_ :: <C-string>;
  input parameter object_ :: <GObject>;
  c-name: "gtk_builder_expose_object";
end;

define inline-only C-function gtk-builder-extend-with-template
  input parameter self :: <GtkBuilder>;
  input parameter object_ :: <GObject>;
  input parameter template_type_ :: <C-long>;
  input parameter buffer_ :: <C-string>;
  input parameter length_ :: <C-signed-long>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_builder_extend_with_template";
end;

define inline-only C-function gtk-builder-get-current-object
  input parameter self :: <GtkBuilder>;
  result res :: <GObject>;
  c-name: "gtk_builder_get_current_object";
end;

define inline-only C-function gtk-builder-get-object
  input parameter self :: <GtkBuilder>;
  input parameter name_ :: <C-string>;
  result res :: <GObject>;
  c-name: "gtk_builder_get_object";
end;

define inline-only C-function gtk-builder-get-objects
  input parameter self :: <GtkBuilder>;
  result res :: <GSList>;
  c-name: "gtk_builder_get_objects";
end;

define inline-only C-function gtk-builder-get-scope
  input parameter self :: <GtkBuilder>;
  result res :: <GtkBuilderScope>;
  c-name: "gtk_builder_get_scope";
end;

define inline-only C-function gtk-builder-get-translation-domain
  input parameter self :: <GtkBuilder>;
  result res :: <C-string>;
  c-name: "gtk_builder_get_translation_domain";
end;

define inline-only C-function gtk-builder-get-type-from-name
  input parameter self :: <GtkBuilder>;
  input parameter type_name_ :: <C-string>;
  result res :: <C-long>;
  c-name: "gtk_builder_get_type_from_name";
end;

define inline-only C-function gtk-builder-set-current-object
  input parameter self :: <GtkBuilder>;
  input parameter current_object_ :: <GObject>;
  c-name: "gtk_builder_set_current_object";
end;

define inline-only C-function gtk-builder-set-scope
  input parameter self :: <GtkBuilder>;
  input parameter scope_ :: <GtkBuilderScope>;
  c-name: "gtk_builder_set_scope";
end;

define inline-only C-function gtk-builder-set-translation-domain
  input parameter self :: <GtkBuilder>;
  input parameter domain_ :: <C-string>;
  c-name: "gtk_builder_set_translation_domain";
end;

define inline-only C-function gtk-builder-value-from-string
  input parameter self :: <GtkBuilder>;
  input parameter pspec_ :: <GParamSpec>;
  input parameter string_ :: <C-string>;
  input parameter value_ :: <GValue>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_builder_value_from_string";
end;

define inline-only C-function gtk-builder-value-from-string-type
  input parameter self :: <GtkBuilder>;
  input parameter type_ :: <C-long>;
  input parameter string_ :: <C-string>;
  input parameter value_ :: <GValue>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_builder_value_from_string_type";
end;

define open C-subtype <GtkBuilderCScope> (<GObject>, <GtkBuilderScope>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkBuilderCScope*> => <GtkBuilderCScope>;

define sealed domain make (singleton(<GtkBuilderCScope*>));
define sealed domain initialize (<GtkBuilderCScope*>);

define inline-only C-function gtk-builder-cscope-new
  result res :: <GtkBuilderCScope>;
  c-name: "gtk_builder_cscope_new";
end;

define inline-only C-function gtk-builder-cscope-add-callback-symbol
  input parameter self :: <GtkBuilderCScope>;
  input parameter callback_name_ :: <C-string>;
  input parameter callback_symbol_ :: <C-function-pointer>;
  c-name: "gtk_builder_cscope_add_callback_symbol";
end;

define C-struct <_GtkBuilderCScopeClass>
  constant sealed inline-only slot gtk-builder-c-scope-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkBuilderCScopeClass>;
end C-struct;

define sealed domain make (singleton(<GtkBuilderCScopeClass>));
define sealed domain initialize (<GtkBuilderCScopeClass>);

define C-struct <_GtkBuilderClass>
  pointer-type-name: <GtkBuilderClass>;
end C-struct;

define sealed domain make (singleton(<GtkBuilderClass>));
define sealed domain initialize (<GtkBuilderClass>);

define inline-only constant $gtk-builder-closure-swapped = 1;
define constant <GtkBuilderClosureFlags> = <C-int>;
define C-pointer-type <GtkBuilderClosureFlags*> => <GtkBuilderClosureFlags>;

define inline-only constant $gtk-builder-error-invalid-type-function = 0;
define inline-only constant $gtk-builder-error-unhandled-tag = 1;
define inline-only constant $gtk-builder-error-missing-attribute = 2;
define inline-only constant $gtk-builder-error-invalid-attribute = 3;
define inline-only constant $gtk-builder-error-invalid-tag = 4;
define inline-only constant $gtk-builder-error-missing-property-value = 5;
define inline-only constant $gtk-builder-error-invalid-value = 6;
define inline-only constant $gtk-builder-error-version-mismatch = 7;
define inline-only constant $gtk-builder-error-duplicate-id = 8;
define inline-only constant $gtk-builder-error-object-type-refused = 9;
define inline-only constant $gtk-builder-error-template-mismatch = 10;
define inline-only constant $gtk-builder-error-invalid-property = 11;
define inline-only constant $gtk-builder-error-invalid-signal = 12;
define inline-only constant $gtk-builder-error-invalid-id = 13;
define inline-only constant $gtk-builder-error-invalid-function = 14;
define constant <GtkBuilderError> = <C-int>;
define C-pointer-type <GtkBuilderError*> => <GtkBuilderError>;

define open C-subtype <GtkBuilderListItemFactory> (<GtkListItemFactory>)
end C-subtype;

define C-pointer-type <GtkBuilderListItemFactory*> => <GtkBuilderListItemFactory>;

define sealed domain make (singleton(<GtkBuilderListItemFactory*>));
define sealed domain initialize (<GtkBuilderListItemFactory*>);

define inline-only C-function gtk-builder-list-item-factory-new-from-bytes
  input parameter scope_ :: <GtkBuilderScope>;
  input parameter bytes_ :: <GBytes>;
  result res :: <GtkListItemFactory>;
  c-name: "gtk_builder_list_item_factory_new_from_bytes";
end;

define inline-only C-function gtk-builder-list-item-factory-new-from-resource
  input parameter scope_ :: <GtkBuilderScope>;
  input parameter resource_path_ :: <C-string>;
  result res :: <GtkListItemFactory>;
  c-name: "gtk_builder_list_item_factory_new_from_resource";
end;

define inline-only C-function gtk-builder-list-item-factory-get-bytes
  input parameter self :: <GtkBuilderListItemFactory>;
  result res :: <GBytes>;
  c-name: "gtk_builder_list_item_factory_get_bytes";
end;

define inline-only C-function gtk-builder-list-item-factory-get-resource
  input parameter self :: <GtkBuilderListItemFactory>;
  result res :: <C-string>;
  c-name: "gtk_builder_list_item_factory_get_resource";
end;

define inline-only C-function gtk-builder-list-item-factory-get-scope
  input parameter self :: <GtkBuilderListItemFactory>;
  result res :: <GtkBuilderScope>;
  c-name: "gtk_builder_list_item_factory_get_scope";
end;

define C-struct <_GtkBuilderListItemFactoryClass>
  pointer-type-name: <GtkBuilderListItemFactoryClass>;
end C-struct;

define sealed domain make (singleton(<GtkBuilderListItemFactoryClass>));
define sealed domain initialize (<GtkBuilderListItemFactoryClass>);

// Interface
define open C-subtype <GtkBuilderScope> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkBuilderScope*> => <GtkBuilderScope>;

define sealed domain make (singleton(<GtkBuilderScope*>));
define sealed domain initialize (<GtkBuilderScope*>);

define C-struct <_GtkBuilderScopeInterface>
  constant sealed inline-only slot gtk-builder-scope-interface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-builder-scope-interface-get-type-from-name :: <C-function-pointer>;
  constant sealed inline-only slot gtk-builder-scope-interface-get-type-from-function :: <C-function-pointer>;
  constant sealed inline-only slot gtk-builder-scope-interface-create-closure :: <C-function-pointer>;
  pointer-type-name: <GtkBuilderScopeInterface>;
end C-struct;

define sealed domain make (singleton(<GtkBuilderScopeInterface>));
define sealed domain initialize (<GtkBuilderScopeInterface>);

define open C-subtype <GtkButton> (<GtkActionable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkButton*> => <GtkButton>;

define sealed domain make (singleton(<GtkButton*>));
define sealed domain initialize (<GtkButton*>);

define inline-only C-function gtk-button-new
  result res :: <GtkWidget>;
  c-name: "gtk_button_new";
end;

define inline-only C-function gtk-button-new-from-icon-name
  input parameter icon_name_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_button_new_from_icon_name";
end;

define inline-only C-function gtk-button-new-with-label
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_button_new_with_label";
end;

define inline-only C-function gtk-button-new-with-mnemonic
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_button_new_with_mnemonic";
end;

define inline-only C-function gtk-button-get-child
  input parameter self :: <GtkButton>;
  result res :: <GtkWidget>;
  c-name: "gtk_button_get_child";
end;

define inline-only C-function gtk-button-get-has-frame
  input parameter self :: <GtkButton>;
  result res :: <C-boolean>;
  c-name: "gtk_button_get_has_frame";
end;

define inline-only C-function gtk-button-get-icon-name
  input parameter self :: <GtkButton>;
  result res :: <C-string>;
  c-name: "gtk_button_get_icon_name";
end;

define inline-only C-function gtk-button-get-label
  input parameter self :: <GtkButton>;
  result res :: <C-string>;
  c-name: "gtk_button_get_label";
end;

define inline-only C-function gtk-button-get-use-underline
  input parameter self :: <GtkButton>;
  result res :: <C-boolean>;
  c-name: "gtk_button_get_use_underline";
end;

define inline-only C-function gtk-button-set-child
  input parameter self :: <GtkButton>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_button_set_child";
end;

define inline-only C-function gtk-button-set-has-frame
  input parameter self :: <GtkButton>;
  input parameter has_frame_ :: <C-boolean>;
  c-name: "gtk_button_set_has_frame";
end;

define inline-only C-function gtk-button-set-icon-name
  input parameter self :: <GtkButton>;
  input parameter icon_name_ :: <C-string>;
  c-name: "gtk_button_set_icon_name";
end;

define inline-only C-function gtk-button-set-label
  input parameter self :: <GtkButton>;
  input parameter label_ :: <C-string>;
  c-name: "gtk_button_set_label";
end;

define inline-only C-function gtk-button-set-use-underline
  input parameter self :: <GtkButton>;
  input parameter use_underline_ :: <C-boolean>;
  c-name: "gtk_button_set_use_underline";
end;

define C-struct <_GtkButtonClass>
  constant sealed inline-only slot gtk-button-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-button-class-clicked :: <C-function-pointer>;
  constant sealed inline-only slot gtk-button-class-activate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-button-class-padding :: <C-void*>;
  pointer-type-name: <GtkButtonClass>;
end C-struct;

define sealed domain make (singleton(<GtkButtonClass>));
define sealed domain initialize (<GtkButtonClass>);

define C-struct <_GtkButtonPrivate>
  pointer-type-name: <GtkButtonPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkButtonPrivate>));
define sealed domain initialize (<GtkButtonPrivate>);

define inline-only constant $gtk-buttons-none = 0;
define inline-only constant $gtk-buttons-ok = 1;
define inline-only constant $gtk-buttons-close = 2;
define inline-only constant $gtk-buttons-cancel = 3;
define inline-only constant $gtk-buttons-yes-no = 4;
define inline-only constant $gtk-buttons-ok-cancel = 5;
define constant <GtkButtonsType> = <C-int>;
define C-pointer-type <GtkButtonsType*> => <GtkButtonsType>;

define open C-subtype <GtkCClosureExpression> (<GtkExpression>)
end C-subtype;

define C-pointer-type <GtkCClosureExpression*> => <GtkCClosureExpression>;

define sealed domain make (singleton(<GtkCClosureExpression*>));
define sealed domain initialize (<GtkCClosureExpression*>);

define inline-only C-function gtk-cclosure-expression-new
  input parameter value_type_ :: <C-long>;
  input parameter marshal_ :: <C-function-pointer>;
  input parameter n_params_ :: <C-unsigned-int>;
  input parameter params_ :: <C-unsigned-char*> /* Not supported */;
  input parameter callback_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_destroy_ :: <C-function-pointer>;
  result res :: <GtkCClosureExpression>;
  c-name: "gtk_cclosure_expression_new";
end;

define open C-subtype <GtkCalendar> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkCalendar*> => <GtkCalendar>;

define sealed domain make (singleton(<GtkCalendar*>));
define sealed domain initialize (<GtkCalendar*>);

define inline-only C-function gtk-calendar-new
  result res :: <GtkWidget>;
  c-name: "gtk_calendar_new";
end;

define inline-only C-function gtk-calendar-clear-marks
  input parameter self :: <GtkCalendar>;
  c-name: "gtk_calendar_clear_marks";
end;

define inline-only C-function gtk-calendar-get-date
  input parameter self :: <GtkCalendar>;
  result res :: <GDateTime>;
  c-name: "gtk_calendar_get_date";
end;

define inline-only C-function gtk-calendar-get-day-is-marked
  input parameter self :: <GtkCalendar>;
  input parameter day_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "gtk_calendar_get_day_is_marked";
end;

define inline-only C-function gtk-calendar-get-show-day-names
  input parameter self :: <GtkCalendar>;
  result res :: <C-boolean>;
  c-name: "gtk_calendar_get_show_day_names";
end;

define inline-only C-function gtk-calendar-get-show-heading
  input parameter self :: <GtkCalendar>;
  result res :: <C-boolean>;
  c-name: "gtk_calendar_get_show_heading";
end;

define inline-only C-function gtk-calendar-get-show-week-numbers
  input parameter self :: <GtkCalendar>;
  result res :: <C-boolean>;
  c-name: "gtk_calendar_get_show_week_numbers";
end;

define inline-only C-function gtk-calendar-mark-day
  input parameter self :: <GtkCalendar>;
  input parameter day_ :: <C-unsigned-int>;
  c-name: "gtk_calendar_mark_day";
end;

define inline-only C-function gtk-calendar-select-day
  input parameter self :: <GtkCalendar>;
  input parameter date_ :: <GDateTime>;
  c-name: "gtk_calendar_select_day";
end;

define inline-only C-function gtk-calendar-set-show-day-names
  input parameter self :: <GtkCalendar>;
  input parameter value_ :: <C-boolean>;
  c-name: "gtk_calendar_set_show_day_names";
end;

define inline-only C-function gtk-calendar-set-show-heading
  input parameter self :: <GtkCalendar>;
  input parameter value_ :: <C-boolean>;
  c-name: "gtk_calendar_set_show_heading";
end;

define inline-only C-function gtk-calendar-set-show-week-numbers
  input parameter self :: <GtkCalendar>;
  input parameter value_ :: <C-boolean>;
  c-name: "gtk_calendar_set_show_week_numbers";
end;

define inline-only C-function gtk-calendar-unmark-day
  input parameter self :: <GtkCalendar>;
  input parameter day_ :: <C-unsigned-int>;
  c-name: "gtk_calendar_unmark_day";
end;

define open C-subtype <GtkCallbackAction> (<GtkShortcutAction>)
end C-subtype;

define C-pointer-type <GtkCallbackAction*> => <GtkCallbackAction>;

define sealed domain make (singleton(<GtkCallbackAction*>));
define sealed domain initialize (<GtkCallbackAction*>);

define inline-only C-function gtk-callback-action-new
  input parameter callback_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  result res :: <GtkCallbackAction>;
  c-name: "gtk_callback_action_new";
end;

define C-struct <_GtkCallbackActionClass>
  pointer-type-name: <GtkCallbackActionClass>;
end C-struct;

define sealed domain make (singleton(<GtkCallbackActionClass>));
define sealed domain initialize (<GtkCallbackActionClass>);

define open C-subtype <GtkCellArea> (<GInitiallyUnowned>, <GtkBuildable>, <GtkCellLayout>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkCellArea*> => <GtkCellArea>;

define sealed domain make (singleton(<GtkCellArea*>));
define sealed domain initialize (<GtkCellArea*>);

define inline-only C-function gtk-cell-area-activate
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter flags_ :: <GtkCellRendererState>;
  input parameter edit_only_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_area_activate";
end;

define inline-only C-function gtk-cell-area-activate-cell
  input parameter self :: <GtkCellArea>;
  input parameter widget_ :: <GtkWidget>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter event_ :: <GdkEvent>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter flags_ :: <GtkCellRendererState>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_area_activate_cell";
end;

define inline-only C-function gtk-cell-area-add
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  c-name: "gtk_cell_area_add";
end;

define inline-only C-function gtk-cell-area-add-focus-sibling
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter sibling_ :: <GtkCellRenderer>;
  c-name: "gtk_cell_area_add_focus_sibling";
end;

define inline-only C-function gtk-cell-area-apply-attributes
  input parameter self :: <GtkCellArea>;
  input parameter tree_model_ :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter is_expander_ :: <C-boolean>;
  input parameter is_expanded_ :: <C-boolean>;
  c-name: "gtk_cell_area_apply_attributes";
end;

define inline-only C-function gtk-cell-area-attribute-connect
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter attribute_ :: <C-string>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_cell_area_attribute_connect";
end;

define inline-only C-function gtk-cell-area-attribute-disconnect
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter attribute_ :: <C-string>;
  c-name: "gtk_cell_area_attribute_disconnect";
end;

define inline-only C-function gtk-cell-area-attribute-get-column
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter attribute_ :: <C-string>;
  result res :: <C-signed-int>;
  c-name: "gtk_cell_area_attribute_get_column";
end;

define inline-only C-function gtk-cell-area-cell-get-property
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter property_name_ :: <C-string>;
  input parameter value_ :: <GValue>;
  c-name: "gtk_cell_area_cell_get_property";
end;

define inline-only C-function gtk-cell-area-cell-set-property
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter property_name_ :: <C-string>;
  input parameter value_ :: <GValue>;
  c-name: "gtk_cell_area_cell_set_property";
end;

define inline-only C-function gtk-cell-area-copy-context
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  result res :: <GtkCellAreaContext>;
  c-name: "gtk_cell_area_copy_context";
end;

define inline-only C-function gtk-cell-area-create-context
  input parameter self :: <GtkCellArea>;
  result res :: <GtkCellAreaContext>;
  c-name: "gtk_cell_area_create_context";
end;

define inline-only C-function gtk-cell-area-event
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  input parameter event_ :: <GdkEvent>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter flags_ :: <GtkCellRendererState>;
  result res :: <C-signed-int>;
  c-name: "gtk_cell_area_event";
end;

define inline-only C-function gtk-cell-area-focus
  input parameter self :: <GtkCellArea>;
  input parameter direction_ :: <GtkDirectionType>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_area_focus";
end;

define inline-only C-function gtk-cell-area-foreach
  input parameter self :: <GtkCellArea>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter callback_data_ :: <C-void*>;
  c-name: "gtk_cell_area_foreach";
end;

define inline-only C-function gtk-cell-area-foreach-alloc
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter background_area_ :: <GdkRectangle>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter callback_data_ :: <C-void*>;
  c-name: "gtk_cell_area_foreach_alloc";
end;

define inline-only C-function gtk-cell-area-get-cell-allocation
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter allocation_ :: <GdkRectangle>;
  c-name: "gtk_cell_area_get_cell_allocation";
end;

define inline-only C-function gtk-cell-area-get-cell-at-position
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  input parameter alloc_area_ :: <GdkRectangle>;
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_area_get_cell_at_position";
end;

define inline-only C-function gtk-cell-area-get-current-path-string
  input parameter self :: <GtkCellArea>;
  result res :: <C-string>;
  c-name: "gtk_cell_area_get_current_path_string";
end;

define inline-only C-function gtk-cell-area-get-edit-widget
  input parameter self :: <GtkCellArea>;
  result res :: <GtkCellEditable>;
  c-name: "gtk_cell_area_get_edit_widget";
end;

define inline-only C-function gtk-cell-area-get-edited-cell
  input parameter self :: <GtkCellArea>;
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_area_get_edited_cell";
end;

define inline-only C-function gtk-cell-area-get-focus-cell
  input parameter self :: <GtkCellArea>;
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_area_get_focus_cell";
end;

define inline-only C-function gtk-cell-area-get-focus-from-sibling
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_area_get_focus_from_sibling";
end;

define inline-only C-function gtk-cell-area-get-focus-siblings
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  result res :: <GList>;
  c-name: "gtk_cell_area_get_focus_siblings";
end;

define inline-only C-function gtk-cell-area-get-preferred-height
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  output parameter minimum_height_ :: <C-signed-int*>;
  output parameter natural_height_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_get_preferred_height";
end;

define inline-only C-function gtk-cell-area-get-preferred-height-for-width
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  input parameter width_ :: <C-signed-int>;
  output parameter minimum_height_ :: <C-signed-int*>;
  output parameter natural_height_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_get_preferred_height_for_width";
end;

define inline-only C-function gtk-cell-area-get-preferred-width
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  output parameter minimum_width_ :: <C-signed-int*>;
  output parameter natural_width_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_get_preferred_width";
end;

define inline-only C-function gtk-cell-area-get-preferred-width-for-height
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  input parameter height_ :: <C-signed-int>;
  output parameter minimum_width_ :: <C-signed-int*>;
  output parameter natural_width_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_get_preferred_width_for_height";
end;

define inline-only C-function gtk-cell-area-get-request-mode
  input parameter self :: <GtkCellArea>;
  result res :: <GtkSizeRequestMode>;
  c-name: "gtk_cell_area_get_request_mode";
end;

define inline-only C-function gtk-cell-area-has-renderer
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_area_has_renderer";
end;

define inline-only C-function gtk-cell-area-inner-cell-area
  input parameter self :: <GtkCellArea>;
  input parameter widget_ :: <GtkWidget>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter inner_area_ :: <GdkRectangle>;
  c-name: "gtk_cell_area_inner_cell_area";
end;

define inline-only C-function gtk-cell-area-is-activatable
  input parameter self :: <GtkCellArea>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_area_is_activatable";
end;

define inline-only C-function gtk-cell-area-is-focus-sibling
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter sibling_ :: <GtkCellRenderer>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_area_is_focus_sibling";
end;

define inline-only C-function gtk-cell-area-remove
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  c-name: "gtk_cell_area_remove";
end;

define inline-only C-function gtk-cell-area-remove-focus-sibling
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter sibling_ :: <GtkCellRenderer>;
  c-name: "gtk_cell_area_remove_focus_sibling";
end;

define inline-only C-function gtk-cell-area-request-renderer
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter orientation_ :: <GtkOrientation>;
  input parameter widget_ :: <GtkWidget>;
  input parameter for_size_ :: <C-signed-int>;
  output parameter minimum_size_ :: <C-signed-int*>;
  output parameter natural_size_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_request_renderer";
end;

define inline-only C-function gtk-cell-area-set-focus-cell
  input parameter self :: <GtkCellArea>;
  input parameter renderer_ :: <GtkCellRenderer>;
  c-name: "gtk_cell_area_set_focus_cell";
end;

define inline-only C-function gtk-cell-area-snapshot
  input parameter self :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  input parameter widget_ :: <GtkWidget>;
  input parameter snapshot_ :: <GtkSnapshot>;
  input parameter background_area_ :: <GdkRectangle>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter flags_ :: <GtkCellRendererState>;
  input parameter paint_focus_ :: <C-boolean>;
  c-name: "gtk_cell_area_snapshot";
end;

define inline-only C-function gtk-cell-area-stop-editing
  input parameter self :: <GtkCellArea>;
  input parameter canceled_ :: <C-boolean>;
  c-name: "gtk_cell_area_stop_editing";
end;

define open C-subtype <GtkCellAreaBox> (<GtkCellArea>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkCellAreaBox*> => <GtkCellAreaBox>;

define sealed domain make (singleton(<GtkCellAreaBox*>));
define sealed domain initialize (<GtkCellAreaBox*>);

define inline-only C-function gtk-cell-area-box-new
  result res :: <GtkCellArea>;
  c-name: "gtk_cell_area_box_new";
end;

define inline-only C-function gtk-cell-area-box-get-spacing
  input parameter self :: <GtkCellAreaBox>;
  result res :: <C-signed-int>;
  c-name: "gtk_cell_area_box_get_spacing";
end;

define inline-only C-function gtk-cell-area-box-pack-end
  input parameter self :: <GtkCellAreaBox>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter expand_ :: <C-boolean>;
  input parameter align_ :: <C-boolean>;
  input parameter fixed_ :: <C-boolean>;
  c-name: "gtk_cell_area_box_pack_end";
end;

define inline-only C-function gtk-cell-area-box-pack-start
  input parameter self :: <GtkCellAreaBox>;
  input parameter renderer_ :: <GtkCellRenderer>;
  input parameter expand_ :: <C-boolean>;
  input parameter align_ :: <C-boolean>;
  input parameter fixed_ :: <C-boolean>;
  c-name: "gtk_cell_area_box_pack_start";
end;

define inline-only C-function gtk-cell-area-box-set-spacing
  input parameter self :: <GtkCellAreaBox>;
  input parameter spacing_ :: <C-signed-int>;
  c-name: "gtk_cell_area_box_set_spacing";
end;

define C-struct <_GtkCellAreaClass>
  constant sealed inline-only slot gtk-cell-area-class-parent-class :: <GInitiallyUnownedClass>;
  constant sealed inline-only slot gtk-cell-area-class-add :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-remove :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-foreach :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-foreach-alloc :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-event :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-snapshot :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-apply-attributes :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-create-context :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-copy-context :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-get-request-mode :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-get-preferred-width :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-get-preferred-height-for-width :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-get-preferred-height :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-get-preferred-width-for-height :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-set-cell-property :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-get-cell-property :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-focus :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-is-activatable :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-activate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-class-padding :: <C-void*>;
  pointer-type-name: <GtkCellAreaClass>;
end C-struct;

define sealed domain make (singleton(<GtkCellAreaClass>));
define sealed domain initialize (<GtkCellAreaClass>);

define inline-only C-function gtk-cell-area-class-find-cell-property
  input parameter self :: <GtkCellAreaClass>;
  input parameter property_name_ :: <C-string>;
  result res :: <GParamSpec>;
  c-name: "gtk_cell_area_class_find_cell_property";
end;

define inline-only C-function gtk-cell-area-class-install-cell-property
  input parameter self :: <GtkCellAreaClass>;
  input parameter property_id_ :: <C-unsigned-int>;
  input parameter pspec_ :: <GParamSpec>;
  c-name: "gtk_cell_area_class_install_cell_property";
end;

define inline-only C-function gtk-cell-area-class-list-cell-properties
  input parameter self :: <GtkCellAreaClass>;
  output parameter n_properties_ :: <C-unsigned-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "gtk_cell_area_class_list_cell_properties";
end;

define open C-subtype <GtkCellAreaContext> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkCellAreaContext*> => <GtkCellAreaContext>;

define sealed domain make (singleton(<GtkCellAreaContext*>));
define sealed domain initialize (<GtkCellAreaContext*>);

define inline-only C-function gtk-cell-area-context-allocate
  input parameter self :: <GtkCellAreaContext>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_cell_area_context_allocate";
end;

define inline-only C-function gtk-cell-area-context-get-allocation
  input parameter self :: <GtkCellAreaContext>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_context_get_allocation";
end;

define inline-only C-function gtk-cell-area-context-get-area
  input parameter self :: <GtkCellAreaContext>;
  result res :: <GtkCellArea>;
  c-name: "gtk_cell_area_context_get_area";
end;

define inline-only C-function gtk-cell-area-context-get-preferred-height
  input parameter self :: <GtkCellAreaContext>;
  output parameter minimum_height_ :: <C-signed-int*>;
  output parameter natural_height_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_context_get_preferred_height";
end;

define inline-only C-function gtk-cell-area-context-get-preferred-height-for-width
  input parameter self :: <GtkCellAreaContext>;
  input parameter width_ :: <C-signed-int>;
  output parameter minimum_height_ :: <C-signed-int*>;
  output parameter natural_height_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_context_get_preferred_height_for_width";
end;

define inline-only C-function gtk-cell-area-context-get-preferred-width
  input parameter self :: <GtkCellAreaContext>;
  output parameter minimum_width_ :: <C-signed-int*>;
  output parameter natural_width_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_context_get_preferred_width";
end;

define inline-only C-function gtk-cell-area-context-get-preferred-width-for-height
  input parameter self :: <GtkCellAreaContext>;
  input parameter height_ :: <C-signed-int>;
  output parameter minimum_width_ :: <C-signed-int*>;
  output parameter natural_width_ :: <C-signed-int*>;
  c-name: "gtk_cell_area_context_get_preferred_width_for_height";
end;

define inline-only C-function gtk-cell-area-context-push-preferred-height
  input parameter self :: <GtkCellAreaContext>;
  input parameter minimum_height_ :: <C-signed-int>;
  input parameter natural_height_ :: <C-signed-int>;
  c-name: "gtk_cell_area_context_push_preferred_height";
end;

define inline-only C-function gtk-cell-area-context-push-preferred-width
  input parameter self :: <GtkCellAreaContext>;
  input parameter minimum_width_ :: <C-signed-int>;
  input parameter natural_width_ :: <C-signed-int>;
  c-name: "gtk_cell_area_context_push_preferred_width";
end;

define inline-only C-function gtk-cell-area-context-reset
  input parameter self :: <GtkCellAreaContext>;
  c-name: "gtk_cell_area_context_reset";
end;

define C-struct <_GtkCellAreaContextClass>
  constant sealed inline-only slot gtk-cell-area-context-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-cell-area-context-class-allocate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-context-class-reset :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-context-class-get-preferred-height-for-width :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-context-class-get-preferred-width-for-height :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-area-context-class-padding :: <C-void*>;
  pointer-type-name: <GtkCellAreaContextClass>;
end C-struct;

define sealed domain make (singleton(<GtkCellAreaContextClass>));
define sealed domain initialize (<GtkCellAreaContextClass>);

define C-struct <_GtkCellAreaContextPrivate>
  pointer-type-name: <GtkCellAreaContextPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkCellAreaContextPrivate>));
define sealed domain initialize (<GtkCellAreaContextPrivate>);

// Interface
define open C-subtype <GtkCellEditable> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkCellEditable*> => <GtkCellEditable>;

define sealed domain make (singleton(<GtkCellEditable*>));
define sealed domain initialize (<GtkCellEditable*>);

define inline-only C-function gtk-cell-editable-editing-done
  input parameter self :: <GtkCellEditable>;
  c-name: "gtk_cell_editable_editing_done";
end;

define inline-only C-function gtk-cell-editable-remove-widget
  input parameter self :: <GtkCellEditable>;
  c-name: "gtk_cell_editable_remove_widget";
end;

define inline-only C-function gtk-cell-editable-start-editing
  input parameter self :: <GtkCellEditable>;
  input parameter event_ :: <GdkEvent>;
  c-name: "gtk_cell_editable_start_editing";
end;

define C-struct <_GtkCellEditableIface>
  constant sealed inline-only slot gtk-cell-editable-iface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-cell-editable-iface-editing-done :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-editable-iface-remove-widget :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-editable-iface-start-editing :: <C-function-pointer>;
  pointer-type-name: <GtkCellEditableIface>;
end C-struct;

define sealed domain make (singleton(<GtkCellEditableIface>));
define sealed domain initialize (<GtkCellEditableIface>);

// Interface
define open C-subtype <GtkCellLayout> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkCellLayout*> => <GtkCellLayout>;

define sealed domain make (singleton(<GtkCellLayout*>));
define sealed domain initialize (<GtkCellLayout*>);

define inline-only C-function gtk-cell-layout-add-attribute
  input parameter self :: <GtkCellLayout>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter attribute_ :: <C-string>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_cell_layout_add_attribute";
end;

define inline-only C-function gtk-cell-layout-clear
  input parameter self :: <GtkCellLayout>;
  c-name: "gtk_cell_layout_clear";
end;

define inline-only C-function gtk-cell-layout-clear-attributes
  input parameter self :: <GtkCellLayout>;
  input parameter cell_ :: <GtkCellRenderer>;
  c-name: "gtk_cell_layout_clear_attributes";
end;

define inline-only C-function gtk-cell-layout-get-area
  input parameter self :: <GtkCellLayout>;
  result res :: <GtkCellArea>;
  c-name: "gtk_cell_layout_get_area";
end;

define inline-only C-function gtk-cell-layout-get-cells
  input parameter self :: <GtkCellLayout>;
  result res :: <GList>;
  c-name: "gtk_cell_layout_get_cells";
end;

define inline-only C-function gtk-cell-layout-pack-end
  input parameter self :: <GtkCellLayout>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter expand_ :: <C-boolean>;
  c-name: "gtk_cell_layout_pack_end";
end;

define inline-only C-function gtk-cell-layout-pack-start
  input parameter self :: <GtkCellLayout>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter expand_ :: <C-boolean>;
  c-name: "gtk_cell_layout_pack_start";
end;

define inline-only C-function gtk-cell-layout-reorder
  input parameter self :: <GtkCellLayout>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_cell_layout_reorder";
end;

define inline-only C-function gtk-cell-layout-set-cell-data-func
  input parameter self :: <GtkCellLayout>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter func_ :: <C-function-pointer>;
  input parameter func_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_cell_layout_set_cell_data_func";
end;

define C-struct <_GtkCellLayoutIface>
  constant sealed inline-only slot gtk-cell-layout-iface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-cell-layout-iface-pack-start :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-layout-iface-pack-end :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-layout-iface-clear :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-layout-iface-add-attribute :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-layout-iface-set-cell-data-func :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-layout-iface-clear-attributes :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-layout-iface-reorder :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-layout-iface-get-cells :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-layout-iface-get-area :: <C-function-pointer>;
  pointer-type-name: <GtkCellLayoutIface>;
end C-struct;

define sealed domain make (singleton(<GtkCellLayoutIface>));
define sealed domain initialize (<GtkCellLayoutIface>);

define open C-subtype <GtkCellRenderer> (<GInitiallyUnowned>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GtkCellRenderer*> => <GtkCellRenderer>;

define sealed domain make (singleton(<GtkCellRenderer*>));
define sealed domain initialize (<GtkCellRenderer*>);

define inline-only C-function gtk-cell-renderer-activate
  input parameter self :: <GtkCellRenderer>;
  input parameter event_ :: <GdkEvent>;
  input parameter widget_ :: <GtkWidget>;
  input parameter path_ :: <C-string>;
  input parameter background_area_ :: <GdkRectangle>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter flags_ :: <GtkCellRendererState>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_renderer_activate";
end;

define inline-only C-function gtk-cell-renderer-get-aligned-area
  input parameter self :: <GtkCellRenderer>;
  input parameter widget_ :: <GtkWidget>;
  input parameter flags_ :: <GtkCellRendererState>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter aligned_area_ :: <GdkRectangle>;
  c-name: "gtk_cell_renderer_get_aligned_area";
end;

define inline-only C-function gtk-cell-renderer-get-alignment
  input parameter self :: <GtkCellRenderer>;
  output parameter xalign_ :: <C-float*>;
  output parameter yalign_ :: <C-float*>;
  c-name: "gtk_cell_renderer_get_alignment";
end;

define inline-only C-function gtk-cell-renderer-get-fixed-size
  input parameter self :: <GtkCellRenderer>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_cell_renderer_get_fixed_size";
end;

define inline-only C-function gtk-cell-renderer-get-is-expanded
  input parameter self :: <GtkCellRenderer>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_renderer_get_is_expanded";
end;

define inline-only C-function gtk-cell-renderer-get-is-expander
  input parameter self :: <GtkCellRenderer>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_renderer_get_is_expander";
end;

define inline-only C-function gtk-cell-renderer-get-padding
  input parameter self :: <GtkCellRenderer>;
  output parameter xpad_ :: <C-signed-int*>;
  output parameter ypad_ :: <C-signed-int*>;
  c-name: "gtk_cell_renderer_get_padding";
end;

define inline-only C-function gtk-cell-renderer-get-preferred-height
  input parameter self :: <GtkCellRenderer>;
  input parameter widget_ :: <GtkWidget>;
  output parameter minimum_size_ :: <C-signed-int*>;
  output parameter natural_size_ :: <C-signed-int*>;
  c-name: "gtk_cell_renderer_get_preferred_height";
end;

define inline-only C-function gtk-cell-renderer-get-preferred-height-for-width
  input parameter self :: <GtkCellRenderer>;
  input parameter widget_ :: <GtkWidget>;
  input parameter width_ :: <C-signed-int>;
  output parameter minimum_height_ :: <C-signed-int*>;
  output parameter natural_height_ :: <C-signed-int*>;
  c-name: "gtk_cell_renderer_get_preferred_height_for_width";
end;

define inline-only C-function gtk-cell-renderer-get-preferred-size
  input parameter self :: <GtkCellRenderer>;
  input parameter widget_ :: <GtkWidget>;
  input parameter minimum_size_ :: <GtkRequisition>;
  input parameter natural_size_ :: <GtkRequisition>;
  c-name: "gtk_cell_renderer_get_preferred_size";
end;

define inline-only C-function gtk-cell-renderer-get-preferred-width
  input parameter self :: <GtkCellRenderer>;
  input parameter widget_ :: <GtkWidget>;
  output parameter minimum_size_ :: <C-signed-int*>;
  output parameter natural_size_ :: <C-signed-int*>;
  c-name: "gtk_cell_renderer_get_preferred_width";
end;

define inline-only C-function gtk-cell-renderer-get-preferred-width-for-height
  input parameter self :: <GtkCellRenderer>;
  input parameter widget_ :: <GtkWidget>;
  input parameter height_ :: <C-signed-int>;
  output parameter minimum_width_ :: <C-signed-int*>;
  output parameter natural_width_ :: <C-signed-int*>;
  c-name: "gtk_cell_renderer_get_preferred_width_for_height";
end;

define inline-only C-function gtk-cell-renderer-get-request-mode
  input parameter self :: <GtkCellRenderer>;
  result res :: <GtkSizeRequestMode>;
  c-name: "gtk_cell_renderer_get_request_mode";
end;

define inline-only C-function gtk-cell-renderer-get-sensitive
  input parameter self :: <GtkCellRenderer>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_renderer_get_sensitive";
end;

define inline-only C-function gtk-cell-renderer-get-state
  input parameter self :: <GtkCellRenderer>;
  input parameter widget_ :: <GtkWidget>;
  input parameter cell_state_ :: <GtkCellRendererState>;
  result res :: <GtkStateFlags>;
  c-name: "gtk_cell_renderer_get_state";
end;

define inline-only C-function gtk-cell-renderer-get-visible
  input parameter self :: <GtkCellRenderer>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_renderer_get_visible";
end;

define inline-only C-function gtk-cell-renderer-is-activatable
  input parameter self :: <GtkCellRenderer>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_renderer_is_activatable";
end;

define inline-only C-function gtk-cell-renderer-set-alignment
  input parameter self :: <GtkCellRenderer>;
  input parameter xalign_ :: <C-float>;
  input parameter yalign_ :: <C-float>;
  c-name: "gtk_cell_renderer_set_alignment";
end;

define inline-only C-function gtk-cell-renderer-set-fixed-size
  input parameter self :: <GtkCellRenderer>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_cell_renderer_set_fixed_size";
end;

define inline-only C-function gtk-cell-renderer-set-is-expanded
  input parameter self :: <GtkCellRenderer>;
  input parameter is_expanded_ :: <C-boolean>;
  c-name: "gtk_cell_renderer_set_is_expanded";
end;

define inline-only C-function gtk-cell-renderer-set-is-expander
  input parameter self :: <GtkCellRenderer>;
  input parameter is_expander_ :: <C-boolean>;
  c-name: "gtk_cell_renderer_set_is_expander";
end;

define inline-only C-function gtk-cell-renderer-set-padding
  input parameter self :: <GtkCellRenderer>;
  input parameter xpad_ :: <C-signed-int>;
  input parameter ypad_ :: <C-signed-int>;
  c-name: "gtk_cell_renderer_set_padding";
end;

define inline-only C-function gtk-cell-renderer-set-sensitive
  input parameter self :: <GtkCellRenderer>;
  input parameter sensitive_ :: <C-boolean>;
  c-name: "gtk_cell_renderer_set_sensitive";
end;

define inline-only C-function gtk-cell-renderer-set-visible
  input parameter self :: <GtkCellRenderer>;
  input parameter visible_ :: <C-boolean>;
  c-name: "gtk_cell_renderer_set_visible";
end;

define inline-only C-function gtk-cell-renderer-snapshot
  input parameter self :: <GtkCellRenderer>;
  input parameter snapshot_ :: <GtkSnapshot>;
  input parameter widget_ :: <GtkWidget>;
  input parameter background_area_ :: <GdkRectangle>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter flags_ :: <GtkCellRendererState>;
  c-name: "gtk_cell_renderer_snapshot";
end;

define inline-only C-function gtk-cell-renderer-start-editing
  input parameter self :: <GtkCellRenderer>;
  input parameter event_ :: <GdkEvent>;
  input parameter widget_ :: <GtkWidget>;
  input parameter path_ :: <C-string>;
  input parameter background_area_ :: <GdkRectangle>;
  input parameter cell_area_ :: <GdkRectangle>;
  input parameter flags_ :: <GtkCellRendererState>;
  result res :: <GtkCellEditable>;
  c-name: "gtk_cell_renderer_start_editing";
end;

define inline-only C-function gtk-cell-renderer-stop-editing
  input parameter self :: <GtkCellRenderer>;
  input parameter canceled_ :: <C-boolean>;
  c-name: "gtk_cell_renderer_stop_editing";
end;

define open C-subtype <GtkCellRendererAccel> (<GtkCellRendererText>)
end C-subtype;

define C-pointer-type <GtkCellRendererAccel*> => <GtkCellRendererAccel>;

define sealed domain make (singleton(<GtkCellRendererAccel*>));
define sealed domain initialize (<GtkCellRendererAccel*>);

define inline-only C-function gtk-cell-renderer-accel-new
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_renderer_accel_new";
end;

define inline-only constant $gtk-cell-renderer-accel-mode-gtk = 0;
define inline-only constant $gtk-cell-renderer-accel-mode-other = 1;
define constant <GtkCellRendererAccelMode> = <C-int>;
define C-pointer-type <GtkCellRendererAccelMode*> => <GtkCellRendererAccelMode>;

define C-struct <_GtkCellRendererClass>
  constant sealed inline-only slot gtk-cell-renderer-class-parent-class :: <GInitiallyUnownedClass>;
  constant sealed inline-only slot gtk-cell-renderer-class-get-request-mode :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-get-preferred-width :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-get-preferred-height-for-width :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-get-preferred-height :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-get-preferred-width-for-height :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-get-aligned-area :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-snapshot :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-activate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-start-editing :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-editing-canceled :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-editing-started :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-class-padding :: <C-void*>;
  pointer-type-name: <GtkCellRendererClass>;
end C-struct;

define sealed domain make (singleton(<GtkCellRendererClass>));
define sealed domain initialize (<GtkCellRendererClass>);

define C-struct <_GtkCellRendererClassPrivate>
  pointer-type-name: <GtkCellRendererClassPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkCellRendererClassPrivate>));
define sealed domain initialize (<GtkCellRendererClassPrivate>);

define open C-subtype <GtkCellRendererCombo> (<GtkCellRendererText>)
end C-subtype;

define C-pointer-type <GtkCellRendererCombo*> => <GtkCellRendererCombo>;

define sealed domain make (singleton(<GtkCellRendererCombo*>));
define sealed domain initialize (<GtkCellRendererCombo*>);

define inline-only C-function gtk-cell-renderer-combo-new
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_renderer_combo_new";
end;

define inline-only constant $gtk-cell-renderer-mode-inert = 0;
define inline-only constant $gtk-cell-renderer-mode-activatable = 1;
define inline-only constant $gtk-cell-renderer-mode-editable = 2;
define constant <GtkCellRendererMode> = <C-int>;
define C-pointer-type <GtkCellRendererMode*> => <GtkCellRendererMode>;

define open C-subtype <GtkCellRendererPixbuf> (<GtkCellRenderer>)
end C-subtype;

define C-pointer-type <GtkCellRendererPixbuf*> => <GtkCellRendererPixbuf>;

define sealed domain make (singleton(<GtkCellRendererPixbuf*>));
define sealed domain initialize (<GtkCellRendererPixbuf*>);

define inline-only C-function gtk-cell-renderer-pixbuf-new
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_renderer_pixbuf_new";
end;

define C-struct <_GtkCellRendererPrivate>
  pointer-type-name: <GtkCellRendererPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkCellRendererPrivate>));
define sealed domain initialize (<GtkCellRendererPrivate>);

define open C-subtype <GtkCellRendererProgress> (<GtkCellRenderer>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkCellRendererProgress*> => <GtkCellRendererProgress>;

define sealed domain make (singleton(<GtkCellRendererProgress*>));
define sealed domain initialize (<GtkCellRendererProgress*>);

define inline-only C-function gtk-cell-renderer-progress-new
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_renderer_progress_new";
end;

define open C-subtype <GtkCellRendererSpin> (<GtkCellRendererText>)
end C-subtype;

define C-pointer-type <GtkCellRendererSpin*> => <GtkCellRendererSpin>;

define sealed domain make (singleton(<GtkCellRendererSpin*>));
define sealed domain initialize (<GtkCellRendererSpin*>);

define inline-only C-function gtk-cell-renderer-spin-new
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_renderer_spin_new";
end;

define open C-subtype <GtkCellRendererSpinner> (<GtkCellRenderer>)
end C-subtype;

define C-pointer-type <GtkCellRendererSpinner*> => <GtkCellRendererSpinner>;

define sealed domain make (singleton(<GtkCellRendererSpinner*>));
define sealed domain initialize (<GtkCellRendererSpinner*>);

define inline-only C-function gtk-cell-renderer-spinner-new
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_renderer_spinner_new";
end;

define inline-only constant $gtk-cell-renderer-selected = 1;
define inline-only constant $gtk-cell-renderer-prelit = 2;
define inline-only constant $gtk-cell-renderer-insensitive = 4;
define inline-only constant $gtk-cell-renderer-sorted = 8;
define inline-only constant $gtk-cell-renderer-focused = 16;
define inline-only constant $gtk-cell-renderer-expandable = 32;
define inline-only constant $gtk-cell-renderer-expanded = 64;
define constant <GtkCellRendererState> = <C-int>;
define C-pointer-type <GtkCellRendererState*> => <GtkCellRendererState>;

define open C-subtype <GtkCellRendererText> (<GtkCellRenderer>)
  // parent
end C-subtype;

define C-pointer-type <GtkCellRendererText*> => <GtkCellRendererText>;

define sealed domain make (singleton(<GtkCellRendererText*>));
define sealed domain initialize (<GtkCellRendererText*>);

define inline-only C-function gtk-cell-renderer-text-new
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_renderer_text_new";
end;

define inline-only C-function gtk-cell-renderer-text-set-fixed-height-from-font
  input parameter self :: <GtkCellRendererText>;
  input parameter number_of_rows_ :: <C-signed-int>;
  c-name: "gtk_cell_renderer_text_set_fixed_height_from_font";
end;

define C-struct <_GtkCellRendererTextClass>
  constant sealed inline-only slot gtk-cell-renderer-text-class-parent-class :: <GtkCellRendererClass>;
  constant sealed inline-only slot gtk-cell-renderer-text-class-edited :: <C-function-pointer>;
  constant sealed inline-only slot gtk-cell-renderer-text-class-padding :: <C-void*>;
  pointer-type-name: <GtkCellRendererTextClass>;
end C-struct;

define sealed domain make (singleton(<GtkCellRendererTextClass>));
define sealed domain initialize (<GtkCellRendererTextClass>);

define open C-subtype <GtkCellRendererToggle> (<GtkCellRenderer>)
end C-subtype;

define C-pointer-type <GtkCellRendererToggle*> => <GtkCellRendererToggle>;

define sealed domain make (singleton(<GtkCellRendererToggle*>));
define sealed domain initialize (<GtkCellRendererToggle*>);

define inline-only C-function gtk-cell-renderer-toggle-new
  result res :: <GtkCellRenderer>;
  c-name: "gtk_cell_renderer_toggle_new";
end;

define inline-only C-function gtk-cell-renderer-toggle-get-activatable
  input parameter self :: <GtkCellRendererToggle>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_renderer_toggle_get_activatable";
end;

define inline-only C-function gtk-cell-renderer-toggle-get-active
  input parameter self :: <GtkCellRendererToggle>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_renderer_toggle_get_active";
end;

define inline-only C-function gtk-cell-renderer-toggle-get-radio
  input parameter self :: <GtkCellRendererToggle>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_renderer_toggle_get_radio";
end;

define inline-only C-function gtk-cell-renderer-toggle-set-activatable
  input parameter self :: <GtkCellRendererToggle>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_cell_renderer_toggle_set_activatable";
end;

define inline-only C-function gtk-cell-renderer-toggle-set-active
  input parameter self :: <GtkCellRendererToggle>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_cell_renderer_toggle_set_active";
end;

define inline-only C-function gtk-cell-renderer-toggle-set-radio
  input parameter self :: <GtkCellRendererToggle>;
  input parameter radio_ :: <C-boolean>;
  c-name: "gtk_cell_renderer_toggle_set_radio";
end;

define open C-subtype <GtkCellView> (<GtkWidget>, <GtkCellLayout>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkCellView*> => <GtkCellView>;

define sealed domain make (singleton(<GtkCellView*>));
define sealed domain initialize (<GtkCellView*>);

define inline-only C-function gtk-cell-view-new
  result res :: <GtkWidget>;
  c-name: "gtk_cell_view_new";
end;

define inline-only C-function gtk-cell-view-new-with-context
  input parameter area_ :: <GtkCellArea>;
  input parameter context_ :: <GtkCellAreaContext>;
  result res :: <GtkWidget>;
  c-name: "gtk_cell_view_new_with_context";
end;

define inline-only C-function gtk-cell-view-new-with-markup
  input parameter markup_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_cell_view_new_with_markup";
end;

define inline-only C-function gtk-cell-view-new-with-text
  input parameter text_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_cell_view_new_with_text";
end;

define inline-only C-function gtk-cell-view-new-with-texture
  input parameter texture_ :: <GdkTexture>;
  result res :: <GtkWidget>;
  c-name: "gtk_cell_view_new_with_texture";
end;

define inline-only C-function gtk-cell-view-get-displayed-row
  input parameter self :: <GtkCellView>;
  result res :: <GtkTreePath>;
  c-name: "gtk_cell_view_get_displayed_row";
end;

define inline-only C-function gtk-cell-view-get-draw-sensitive
  input parameter self :: <GtkCellView>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_view_get_draw_sensitive";
end;

define inline-only C-function gtk-cell-view-get-fit-model
  input parameter self :: <GtkCellView>;
  result res :: <C-boolean>;
  c-name: "gtk_cell_view_get_fit_model";
end;

define inline-only C-function gtk-cell-view-get-model
  input parameter self :: <GtkCellView>;
  result res :: <GtkTreeModel>;
  c-name: "gtk_cell_view_get_model";
end;

define inline-only C-function gtk-cell-view-set-displayed-row
  input parameter self :: <GtkCellView>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_cell_view_set_displayed_row";
end;

define inline-only C-function gtk-cell-view-set-draw-sensitive
  input parameter self :: <GtkCellView>;
  input parameter draw_sensitive_ :: <C-boolean>;
  c-name: "gtk_cell_view_set_draw_sensitive";
end;

define inline-only C-function gtk-cell-view-set-fit-model
  input parameter self :: <GtkCellView>;
  input parameter fit_model_ :: <C-boolean>;
  c-name: "gtk_cell_view_set_fit_model";
end;

define inline-only C-function gtk-cell-view-set-model
  input parameter self :: <GtkCellView>;
  input parameter model_ :: <GtkTreeModel>;
  c-name: "gtk_cell_view_set_model";
end;

define open C-subtype <GtkCenterBox> (<GtkWidget>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkCenterBox*> => <GtkCenterBox>;

define sealed domain make (singleton(<GtkCenterBox*>));
define sealed domain initialize (<GtkCenterBox*>);

define inline-only C-function gtk-center-box-new
  result res :: <GtkWidget>;
  c-name: "gtk_center_box_new";
end;

define inline-only C-function gtk-center-box-get-baseline-position
  input parameter self :: <GtkCenterBox>;
  result res :: <GtkBaselinePosition>;
  c-name: "gtk_center_box_get_baseline_position";
end;

define inline-only C-function gtk-center-box-get-center-widget
  input parameter self :: <GtkCenterBox>;
  result res :: <GtkWidget>;
  c-name: "gtk_center_box_get_center_widget";
end;

define inline-only C-function gtk-center-box-get-end-widget
  input parameter self :: <GtkCenterBox>;
  result res :: <GtkWidget>;
  c-name: "gtk_center_box_get_end_widget";
end;

define inline-only C-function gtk-center-box-get-start-widget
  input parameter self :: <GtkCenterBox>;
  result res :: <GtkWidget>;
  c-name: "gtk_center_box_get_start_widget";
end;

define inline-only C-function gtk-center-box-set-baseline-position
  input parameter self :: <GtkCenterBox>;
  input parameter position_ :: <GtkBaselinePosition>;
  c-name: "gtk_center_box_set_baseline_position";
end;

define inline-only C-function gtk-center-box-set-center-widget
  input parameter self :: <GtkCenterBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_center_box_set_center_widget";
end;

define inline-only C-function gtk-center-box-set-end-widget
  input parameter self :: <GtkCenterBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_center_box_set_end_widget";
end;

define inline-only C-function gtk-center-box-set-start-widget
  input parameter self :: <GtkCenterBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_center_box_set_start_widget";
end;

define C-struct <_GtkCenterBoxClass>
  pointer-type-name: <GtkCenterBoxClass>;
end C-struct;

define sealed domain make (singleton(<GtkCenterBoxClass>));
define sealed domain initialize (<GtkCenterBoxClass>);

define open C-subtype <GtkCenterLayout> (<GtkLayoutManager>)
end C-subtype;

define C-pointer-type <GtkCenterLayout*> => <GtkCenterLayout>;

define sealed domain make (singleton(<GtkCenterLayout*>));
define sealed domain initialize (<GtkCenterLayout*>);

define inline-only C-function gtk-center-layout-new
  result res :: <GtkLayoutManager>;
  c-name: "gtk_center_layout_new";
end;

define inline-only C-function gtk-center-layout-get-baseline-position
  input parameter self :: <GtkCenterLayout>;
  result res :: <GtkBaselinePosition>;
  c-name: "gtk_center_layout_get_baseline_position";
end;

define inline-only C-function gtk-center-layout-get-center-widget
  input parameter self :: <GtkCenterLayout>;
  result res :: <GtkWidget>;
  c-name: "gtk_center_layout_get_center_widget";
end;

define inline-only C-function gtk-center-layout-get-end-widget
  input parameter self :: <GtkCenterLayout>;
  result res :: <GtkWidget>;
  c-name: "gtk_center_layout_get_end_widget";
end;

define inline-only C-function gtk-center-layout-get-orientation
  input parameter self :: <GtkCenterLayout>;
  result res :: <GtkOrientation>;
  c-name: "gtk_center_layout_get_orientation";
end;

define inline-only C-function gtk-center-layout-get-start-widget
  input parameter self :: <GtkCenterLayout>;
  result res :: <GtkWidget>;
  c-name: "gtk_center_layout_get_start_widget";
end;

define inline-only C-function gtk-center-layout-set-baseline-position
  input parameter self :: <GtkCenterLayout>;
  input parameter baseline_position_ :: <GtkBaselinePosition>;
  c-name: "gtk_center_layout_set_baseline_position";
end;

define inline-only C-function gtk-center-layout-set-center-widget
  input parameter self :: <GtkCenterLayout>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_center_layout_set_center_widget";
end;

define inline-only C-function gtk-center-layout-set-end-widget
  input parameter self :: <GtkCenterLayout>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_center_layout_set_end_widget";
end;

define inline-only C-function gtk-center-layout-set-orientation
  input parameter self :: <GtkCenterLayout>;
  input parameter orientation_ :: <GtkOrientation>;
  c-name: "gtk_center_layout_set_orientation";
end;

define inline-only C-function gtk-center-layout-set-start-widget
  input parameter self :: <GtkCenterLayout>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_center_layout_set_start_widget";
end;

define C-struct <_GtkCenterLayoutClass>
  constant sealed inline-only slot gtk-center-layout-class-parent-class :: <GtkLayoutManagerClass>;
  pointer-type-name: <GtkCenterLayoutClass>;
end C-struct;

define sealed domain make (singleton(<GtkCenterLayoutClass>));
define sealed domain initialize (<GtkCenterLayoutClass>);

define open C-subtype <GtkCheckButton> (<GtkActionable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkCheckButton*> => <GtkCheckButton>;

define sealed domain make (singleton(<GtkCheckButton*>));
define sealed domain initialize (<GtkCheckButton*>);

define inline-only C-function gtk-check-button-new
  result res :: <GtkWidget>;
  c-name: "gtk_check_button_new";
end;

define inline-only C-function gtk-check-button-new-with-label
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_check_button_new_with_label";
end;

define inline-only C-function gtk-check-button-new-with-mnemonic
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_check_button_new_with_mnemonic";
end;

define inline-only C-function gtk-check-button-get-active
  input parameter self :: <GtkCheckButton>;
  result res :: <C-boolean>;
  c-name: "gtk_check_button_get_active";
end;

define inline-only C-function gtk-check-button-get-child
  input parameter self :: <GtkCheckButton>;
  result res :: <GtkWidget>;
  c-name: "gtk_check_button_get_child";
end;

define inline-only C-function gtk-check-button-get-inconsistent
  input parameter self :: <GtkCheckButton>;
  result res :: <C-boolean>;
  c-name: "gtk_check_button_get_inconsistent";
end;

define inline-only C-function gtk-check-button-get-label
  input parameter self :: <GtkCheckButton>;
  result res :: <C-string>;
  c-name: "gtk_check_button_get_label";
end;

define inline-only C-function gtk-check-button-get-use-underline
  input parameter self :: <GtkCheckButton>;
  result res :: <C-boolean>;
  c-name: "gtk_check_button_get_use_underline";
end;

define inline-only C-function gtk-check-button-set-active
  input parameter self :: <GtkCheckButton>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_check_button_set_active";
end;

define inline-only C-function gtk-check-button-set-child
  input parameter self :: <GtkCheckButton>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_check_button_set_child";
end;

define inline-only C-function gtk-check-button-set-group
  input parameter self :: <GtkCheckButton>;
  input parameter group_ :: <GtkCheckButton>;
  c-name: "gtk_check_button_set_group";
end;

define inline-only C-function gtk-check-button-set-inconsistent
  input parameter self :: <GtkCheckButton>;
  input parameter inconsistent_ :: <C-boolean>;
  c-name: "gtk_check_button_set_inconsistent";
end;

define inline-only C-function gtk-check-button-set-label
  input parameter self :: <GtkCheckButton>;
  input parameter label_ :: <C-string>;
  c-name: "gtk_check_button_set_label";
end;

define inline-only C-function gtk-check-button-set-use-underline
  input parameter self :: <GtkCheckButton>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_check_button_set_use_underline";
end;

define C-struct <_GtkCheckButtonClass>
  constant sealed inline-only slot gtk-check-button-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-check-button-class-toggled :: <C-function-pointer>;
  constant sealed inline-only slot gtk-check-button-class-activate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-check-button-class-padding :: <C-void*>;
  pointer-type-name: <GtkCheckButtonClass>;
end C-struct;

define sealed domain make (singleton(<GtkCheckButtonClass>));
define sealed domain initialize (<GtkCheckButtonClass>);

define open C-subtype <GtkClosureExpression> (<GtkExpression>)
end C-subtype;

define C-pointer-type <GtkClosureExpression*> => <GtkClosureExpression>;

define sealed domain make (singleton(<GtkClosureExpression*>));
define sealed domain initialize (<GtkClosureExpression*>);

define inline-only C-function gtk-closure-expression-new
  input parameter value_type_ :: <C-long>;
  input parameter closure_ :: <GClosure>;
  input parameter n_params_ :: <C-unsigned-int>;
  input parameter params_ :: <C-unsigned-char*> /* Not supported */;
  result res :: <GtkClosureExpression>;
  c-name: "gtk_closure_expression_new";
end;

define open C-subtype <GtkColorButton> (<GtkWidget>, <GtkColorChooser>)
end C-subtype;

define C-pointer-type <GtkColorButton*> => <GtkColorButton>;

define sealed domain make (singleton(<GtkColorButton*>));
define sealed domain initialize (<GtkColorButton*>);

define inline-only C-function gtk-color-button-new
  result res :: <GtkWidget>;
  c-name: "gtk_color_button_new";
end;

define inline-only C-function gtk-color-button-new-with-rgba
  input parameter rgba_ :: <GdkRGBA>;
  result res :: <GtkWidget>;
  c-name: "gtk_color_button_new_with_rgba";
end;

define inline-only C-function gtk-color-button-get-modal
  input parameter self :: <GtkColorButton>;
  result res :: <C-boolean>;
  c-name: "gtk_color_button_get_modal";
end;

define inline-only C-function gtk-color-button-get-title
  input parameter self :: <GtkColorButton>;
  result res :: <C-string>;
  c-name: "gtk_color_button_get_title";
end;

define inline-only C-function gtk-color-button-set-modal
  input parameter self :: <GtkColorButton>;
  input parameter modal_ :: <C-boolean>;
  c-name: "gtk_color_button_set_modal";
end;

define inline-only C-function gtk-color-button-set-title
  input parameter self :: <GtkColorButton>;
  input parameter title_ :: <C-string>;
  c-name: "gtk_color_button_set_title";
end;

// Interface
define open C-subtype <GtkColorChooser> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkColorChooser*> => <GtkColorChooser>;

define sealed domain make (singleton(<GtkColorChooser*>));
define sealed domain initialize (<GtkColorChooser*>);

define inline-only C-function gtk-color-chooser-add-palette
  input parameter self :: <GtkColorChooser>;
  input parameter orientation_ :: <GtkOrientation>;
  input parameter colors_per_line_ :: <C-signed-int>;
  input parameter n_colors_ :: <C-signed-int>;
  input parameter colors_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "gtk_color_chooser_add_palette";
end;

define inline-only C-function gtk-color-chooser-get-rgba
  input parameter self :: <GtkColorChooser>;
  input parameter color_ :: <GdkRGBA>;
  c-name: "gtk_color_chooser_get_rgba";
end;

define inline-only C-function gtk-color-chooser-get-use-alpha
  input parameter self :: <GtkColorChooser>;
  result res :: <C-boolean>;
  c-name: "gtk_color_chooser_get_use_alpha";
end;

define inline-only C-function gtk-color-chooser-set-rgba
  input parameter self :: <GtkColorChooser>;
  input parameter color_ :: <GdkRGBA>;
  c-name: "gtk_color_chooser_set_rgba";
end;

define inline-only C-function gtk-color-chooser-set-use-alpha
  input parameter self :: <GtkColorChooser>;
  input parameter use_alpha_ :: <C-boolean>;
  c-name: "gtk_color_chooser_set_use_alpha";
end;

define open C-subtype <GtkColorChooserDialog> (<GtkDialog>, <GtkColorChooser>)
end C-subtype;

define C-pointer-type <GtkColorChooserDialog*> => <GtkColorChooserDialog>;

define sealed domain make (singleton(<GtkColorChooserDialog*>));
define sealed domain initialize (<GtkColorChooserDialog*>);

define inline-only C-function gtk-color-chooser-dialog-new
  input parameter title_ :: <C-string>;
  input parameter parent_ :: <GtkWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_color_chooser_dialog_new";
end;

define C-struct <_GtkColorChooserInterface>
  constant sealed inline-only slot gtk-color-chooser-interface-base-interface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-color-chooser-interface-get-rgba :: <C-function-pointer>;
  constant sealed inline-only slot gtk-color-chooser-interface-set-rgba :: <C-function-pointer>;
  constant sealed inline-only slot gtk-color-chooser-interface-add-palette :: <C-function-pointer>;
  constant sealed inline-only slot gtk-color-chooser-interface-color-activated :: <C-function-pointer>;
  constant sealed inline-only slot gtk-color-chooser-interface-padding :: <C-void*>;
  pointer-type-name: <GtkColorChooserInterface>;
end C-struct;

define sealed domain make (singleton(<GtkColorChooserInterface>));
define sealed domain initialize (<GtkColorChooserInterface>);

define open C-subtype <GtkColorChooserWidget> (<GtkWidget>, <GtkColorChooser>)
end C-subtype;

define C-pointer-type <GtkColorChooserWidget*> => <GtkColorChooserWidget>;

define sealed domain make (singleton(<GtkColorChooserWidget*>));
define sealed domain initialize (<GtkColorChooserWidget*>);

define inline-only C-function gtk-color-chooser-widget-new
  result res :: <GtkWidget>;
  c-name: "gtk_color_chooser_widget_new";
end;

define open C-subtype <GtkColumnView> (<GtkWidget>, <GtkScrollable>)
end C-subtype;

define C-pointer-type <GtkColumnView*> => <GtkColumnView>;

define sealed domain make (singleton(<GtkColumnView*>));
define sealed domain initialize (<GtkColumnView*>);

define inline-only C-function gtk-column-view-new
  input parameter model_ :: <GtkSelectionModel>;
  result res :: <GtkWidget>;
  c-name: "gtk_column_view_new";
end;

define inline-only C-function gtk-column-view-append-column
  input parameter self :: <GtkColumnView>;
  input parameter column_ :: <GtkColumnViewColumn>;
  c-name: "gtk_column_view_append_column";
end;

define inline-only C-function gtk-column-view-get-columns
  input parameter self :: <GtkColumnView>;
  result res :: <GListModel>;
  c-name: "gtk_column_view_get_columns";
end;

define inline-only C-function gtk-column-view-get-enable-rubberband
  input parameter self :: <GtkColumnView>;
  result res :: <C-boolean>;
  c-name: "gtk_column_view_get_enable_rubberband";
end;

define inline-only C-function gtk-column-view-get-model
  input parameter self :: <GtkColumnView>;
  result res :: <GtkSelectionModel>;
  c-name: "gtk_column_view_get_model";
end;

define inline-only C-function gtk-column-view-get-reorderable
  input parameter self :: <GtkColumnView>;
  result res :: <C-boolean>;
  c-name: "gtk_column_view_get_reorderable";
end;

define inline-only C-function gtk-column-view-get-show-column-separators
  input parameter self :: <GtkColumnView>;
  result res :: <C-boolean>;
  c-name: "gtk_column_view_get_show_column_separators";
end;

define inline-only C-function gtk-column-view-get-show-row-separators
  input parameter self :: <GtkColumnView>;
  result res :: <C-boolean>;
  c-name: "gtk_column_view_get_show_row_separators";
end;

define inline-only C-function gtk-column-view-get-single-click-activate
  input parameter self :: <GtkColumnView>;
  result res :: <C-boolean>;
  c-name: "gtk_column_view_get_single_click_activate";
end;

define inline-only C-function gtk-column-view-get-sorter
  input parameter self :: <GtkColumnView>;
  result res :: <GtkSorter>;
  c-name: "gtk_column_view_get_sorter";
end;

define inline-only C-function gtk-column-view-insert-column
  input parameter self :: <GtkColumnView>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter column_ :: <GtkColumnViewColumn>;
  c-name: "gtk_column_view_insert_column";
end;

define inline-only C-function gtk-column-view-remove-column
  input parameter self :: <GtkColumnView>;
  input parameter column_ :: <GtkColumnViewColumn>;
  c-name: "gtk_column_view_remove_column";
end;

define inline-only C-function gtk-column-view-set-enable-rubberband
  input parameter self :: <GtkColumnView>;
  input parameter enable_rubberband_ :: <C-boolean>;
  c-name: "gtk_column_view_set_enable_rubberband";
end;

define inline-only C-function gtk-column-view-set-model
  input parameter self :: <GtkColumnView>;
  input parameter model_ :: <GtkSelectionModel>;
  c-name: "gtk_column_view_set_model";
end;

define inline-only C-function gtk-column-view-set-reorderable
  input parameter self :: <GtkColumnView>;
  input parameter reorderable_ :: <C-boolean>;
  c-name: "gtk_column_view_set_reorderable";
end;

define inline-only C-function gtk-column-view-set-show-column-separators
  input parameter self :: <GtkColumnView>;
  input parameter show_column_separators_ :: <C-boolean>;
  c-name: "gtk_column_view_set_show_column_separators";
end;

define inline-only C-function gtk-column-view-set-show-row-separators
  input parameter self :: <GtkColumnView>;
  input parameter show_row_separators_ :: <C-boolean>;
  c-name: "gtk_column_view_set_show_row_separators";
end;

define inline-only C-function gtk-column-view-set-single-click-activate
  input parameter self :: <GtkColumnView>;
  input parameter single_click_activate_ :: <C-boolean>;
  c-name: "gtk_column_view_set_single_click_activate";
end;

define inline-only C-function gtk-column-view-sort-by-column
  input parameter self :: <GtkColumnView>;
  input parameter column_ :: <GtkColumnViewColumn>;
  input parameter direction_ :: <GtkSortType>;
  c-name: "gtk_column_view_sort_by_column";
end;

define C-struct <_GtkColumnViewClass>
  pointer-type-name: <GtkColumnViewClass>;
end C-struct;

define sealed domain make (singleton(<GtkColumnViewClass>));
define sealed domain initialize (<GtkColumnViewClass>);

define open C-subtype <GtkColumnViewColumn> (<GObject>)
end C-subtype;

define C-pointer-type <GtkColumnViewColumn*> => <GtkColumnViewColumn>;

define sealed domain make (singleton(<GtkColumnViewColumn*>));
define sealed domain initialize (<GtkColumnViewColumn*>);

define inline-only C-function gtk-column-view-column-new
  input parameter title_ :: <C-string>;
  input parameter factory_ :: <GtkListItemFactory>;
  result res :: <GtkColumnViewColumn>;
  c-name: "gtk_column_view_column_new";
end;

define inline-only C-function gtk-column-view-column-get-column-view
  input parameter self :: <GtkColumnViewColumn>;
  result res :: <GtkColumnView>;
  c-name: "gtk_column_view_column_get_column_view";
end;

define inline-only C-function gtk-column-view-column-get-expand
  input parameter self :: <GtkColumnViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_column_view_column_get_expand";
end;

define inline-only C-function gtk-column-view-column-get-factory
  input parameter self :: <GtkColumnViewColumn>;
  result res :: <GtkListItemFactory>;
  c-name: "gtk_column_view_column_get_factory";
end;

define inline-only C-function gtk-column-view-column-get-fixed-width
  input parameter self :: <GtkColumnViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_column_view_column_get_fixed_width";
end;

define inline-only C-function gtk-column-view-column-get-header-menu
  input parameter self :: <GtkColumnViewColumn>;
  result res :: <GMenuModel>;
  c-name: "gtk_column_view_column_get_header_menu";
end;

define inline-only C-function gtk-column-view-column-get-resizable
  input parameter self :: <GtkColumnViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_column_view_column_get_resizable";
end;

define inline-only C-function gtk-column-view-column-get-sorter
  input parameter self :: <GtkColumnViewColumn>;
  result res :: <GtkSorter>;
  c-name: "gtk_column_view_column_get_sorter";
end;

define inline-only C-function gtk-column-view-column-get-title
  input parameter self :: <GtkColumnViewColumn>;
  result res :: <C-string>;
  c-name: "gtk_column_view_column_get_title";
end;

define inline-only C-function gtk-column-view-column-get-visible
  input parameter self :: <GtkColumnViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_column_view_column_get_visible";
end;

define inline-only C-function gtk-column-view-column-set-expand
  input parameter self :: <GtkColumnViewColumn>;
  input parameter expand_ :: <C-boolean>;
  c-name: "gtk_column_view_column_set_expand";
end;

define inline-only C-function gtk-column-view-column-set-factory
  input parameter self :: <GtkColumnViewColumn>;
  input parameter factory_ :: <GtkListItemFactory>;
  c-name: "gtk_column_view_column_set_factory";
end;

define inline-only C-function gtk-column-view-column-set-fixed-width
  input parameter self :: <GtkColumnViewColumn>;
  input parameter fixed_width_ :: <C-signed-int>;
  c-name: "gtk_column_view_column_set_fixed_width";
end;

define inline-only C-function gtk-column-view-column-set-header-menu
  input parameter self :: <GtkColumnViewColumn>;
  input parameter menu_ :: <GMenuModel>;
  c-name: "gtk_column_view_column_set_header_menu";
end;

define inline-only C-function gtk-column-view-column-set-resizable
  input parameter self :: <GtkColumnViewColumn>;
  input parameter resizable_ :: <C-boolean>;
  c-name: "gtk_column_view_column_set_resizable";
end;

define inline-only C-function gtk-column-view-column-set-sorter
  input parameter self :: <GtkColumnViewColumn>;
  input parameter sorter_ :: <GtkSorter>;
  c-name: "gtk_column_view_column_set_sorter";
end;

define inline-only C-function gtk-column-view-column-set-title
  input parameter self :: <GtkColumnViewColumn>;
  input parameter title_ :: <C-string>;
  c-name: "gtk_column_view_column_set_title";
end;

define inline-only C-function gtk-column-view-column-set-visible
  input parameter self :: <GtkColumnViewColumn>;
  input parameter visible_ :: <C-boolean>;
  c-name: "gtk_column_view_column_set_visible";
end;

define C-struct <_GtkColumnViewColumnClass>
  pointer-type-name: <GtkColumnViewColumnClass>;
end C-struct;

define sealed domain make (singleton(<GtkColumnViewColumnClass>));
define sealed domain initialize (<GtkColumnViewColumnClass>);

define open C-subtype <GtkComboBox> (<GtkCellEditable>, <GtkCellLayout>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkComboBox*> => <GtkComboBox>;

define sealed domain make (singleton(<GtkComboBox*>));
define sealed domain initialize (<GtkComboBox*>);

define inline-only C-function gtk-combo-box-new
  result res :: <GtkWidget>;
  c-name: "gtk_combo_box_new";
end;

define inline-only C-function gtk-combo-box-new-with-entry
  result res :: <GtkWidget>;
  c-name: "gtk_combo_box_new_with_entry";
end;

define inline-only C-function gtk-combo-box-new-with-model
  input parameter model_ :: <GtkTreeModel>;
  result res :: <GtkWidget>;
  c-name: "gtk_combo_box_new_with_model";
end;

define inline-only C-function gtk-combo-box-new-with-model-and-entry
  input parameter model_ :: <GtkTreeModel>;
  result res :: <GtkWidget>;
  c-name: "gtk_combo_box_new_with_model_and_entry";
end;

define inline-only C-function gtk-combo-box-get-active
  input parameter self :: <GtkComboBox>;
  result res :: <C-signed-int>;
  c-name: "gtk_combo_box_get_active";
end;

define inline-only C-function gtk-combo-box-get-active-id
  input parameter self :: <GtkComboBox>;
  result res :: <C-string>;
  c-name: "gtk_combo_box_get_active_id";
end;

define inline-only C-function gtk-combo-box-get-active-iter
  input parameter self :: <GtkComboBox>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_combo_box_get_active_iter";
end;

define inline-only C-function gtk-combo-box-get-button-sensitivity
  input parameter self :: <GtkComboBox>;
  result res :: <GtkSensitivityType>;
  c-name: "gtk_combo_box_get_button_sensitivity";
end;

define inline-only C-function gtk-combo-box-get-child
  input parameter self :: <GtkComboBox>;
  result res :: <GtkWidget>;
  c-name: "gtk_combo_box_get_child";
end;

define inline-only C-function gtk-combo-box-get-entry-text-column
  input parameter self :: <GtkComboBox>;
  result res :: <C-signed-int>;
  c-name: "gtk_combo_box_get_entry_text_column";
end;

define inline-only C-function gtk-combo-box-get-has-entry
  input parameter self :: <GtkComboBox>;
  result res :: <C-boolean>;
  c-name: "gtk_combo_box_get_has_entry";
end;

define inline-only C-function gtk-combo-box-get-id-column
  input parameter self :: <GtkComboBox>;
  result res :: <C-signed-int>;
  c-name: "gtk_combo_box_get_id_column";
end;

define inline-only C-function gtk-combo-box-get-model
  input parameter self :: <GtkComboBox>;
  result res :: <GtkTreeModel>;
  c-name: "gtk_combo_box_get_model";
end;

define inline-only C-function gtk-combo-box-get-popup-fixed-width
  input parameter self :: <GtkComboBox>;
  result res :: <C-boolean>;
  c-name: "gtk_combo_box_get_popup_fixed_width";
end;

define inline-only C-function gtk-combo-box-popdown
  input parameter self :: <GtkComboBox>;
  c-name: "gtk_combo_box_popdown";
end;

define inline-only C-function gtk-combo-box-popup
  input parameter self :: <GtkComboBox>;
  c-name: "gtk_combo_box_popup";
end;

define inline-only C-function gtk-combo-box-popup-for-device
  input parameter self :: <GtkComboBox>;
  input parameter device_ :: <GdkDevice>;
  c-name: "gtk_combo_box_popup_for_device";
end;

define inline-only C-function gtk-combo-box-set-active
  input parameter self :: <GtkComboBox>;
  input parameter index__ :: <C-signed-int>;
  c-name: "gtk_combo_box_set_active";
end;

define inline-only C-function gtk-combo-box-set-active-id
  input parameter self :: <GtkComboBox>;
  input parameter active_id_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_combo_box_set_active_id";
end;

define inline-only C-function gtk-combo-box-set-active-iter
  input parameter self :: <GtkComboBox>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_combo_box_set_active_iter";
end;

define inline-only C-function gtk-combo-box-set-button-sensitivity
  input parameter self :: <GtkComboBox>;
  input parameter sensitivity_ :: <GtkSensitivityType>;
  c-name: "gtk_combo_box_set_button_sensitivity";
end;

define inline-only C-function gtk-combo-box-set-child
  input parameter self :: <GtkComboBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_combo_box_set_child";
end;

define inline-only C-function gtk-combo-box-set-entry-text-column
  input parameter self :: <GtkComboBox>;
  input parameter text_column_ :: <C-signed-int>;
  c-name: "gtk_combo_box_set_entry_text_column";
end;

define inline-only C-function gtk-combo-box-set-id-column
  input parameter self :: <GtkComboBox>;
  input parameter id_column_ :: <C-signed-int>;
  c-name: "gtk_combo_box_set_id_column";
end;

define inline-only C-function gtk-combo-box-set-model
  input parameter self :: <GtkComboBox>;
  input parameter model_ :: <GtkTreeModel>;
  c-name: "gtk_combo_box_set_model";
end;

define inline-only C-function gtk-combo-box-set-popup-fixed-width
  input parameter self :: <GtkComboBox>;
  input parameter fixed_ :: <C-boolean>;
  c-name: "gtk_combo_box_set_popup_fixed_width";
end;

define inline-only C-function gtk-combo-box-set-row-separator-func
  input parameter self :: <GtkComboBox>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_combo_box_set_row_separator_func";
end;

define C-struct <_GtkComboBoxClass>
  constant sealed inline-only slot gtk-combo-box-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-combo-box-class-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-combo-box-class-format-entry-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-combo-box-class-activate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-combo-box-class-padding :: <C-void*>;
  pointer-type-name: <GtkComboBoxClass>;
end C-struct;

define sealed domain make (singleton(<GtkComboBoxClass>));
define sealed domain initialize (<GtkComboBoxClass>);

define open C-subtype <GtkComboBoxText> (<GtkComboBox>)
end C-subtype;

define C-pointer-type <GtkComboBoxText*> => <GtkComboBoxText>;

define sealed domain make (singleton(<GtkComboBoxText*>));
define sealed domain initialize (<GtkComboBoxText*>);

define inline-only C-function gtk-combo-box-text-new
  result res :: <GtkWidget>;
  c-name: "gtk_combo_box_text_new";
end;

define inline-only C-function gtk-combo-box-text-new-with-entry
  result res :: <GtkWidget>;
  c-name: "gtk_combo_box_text_new_with_entry";
end;

define inline-only C-function gtk-combo-box-text-append
  input parameter self :: <GtkComboBoxText>;
  input parameter id_ :: <C-string>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_combo_box_text_append";
end;

define inline-only C-function gtk-combo-box-text-append-text
  input parameter self :: <GtkComboBoxText>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_combo_box_text_append_text";
end;

define inline-only C-function gtk-combo-box-text-get-active-text
  input parameter self :: <GtkComboBoxText>;
  result res :: <C-string>;
  c-name: "gtk_combo_box_text_get_active_text";
end;

define inline-only C-function gtk-combo-box-text-insert
  input parameter self :: <GtkComboBoxText>;
  input parameter position_ :: <C-signed-int>;
  input parameter id_ :: <C-string>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_combo_box_text_insert";
end;

define inline-only C-function gtk-combo-box-text-insert-text
  input parameter self :: <GtkComboBoxText>;
  input parameter position_ :: <C-signed-int>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_combo_box_text_insert_text";
end;

define inline-only C-function gtk-combo-box-text-prepend
  input parameter self :: <GtkComboBoxText>;
  input parameter id_ :: <C-string>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_combo_box_text_prepend";
end;

define inline-only C-function gtk-combo-box-text-prepend-text
  input parameter self :: <GtkComboBoxText>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_combo_box_text_prepend_text";
end;

define inline-only C-function gtk-combo-box-text-remove
  input parameter self :: <GtkComboBoxText>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_combo_box_text_remove";
end;

define inline-only C-function gtk-combo-box-text-remove-all
  input parameter self :: <GtkComboBoxText>;
  c-name: "gtk_combo_box_text_remove_all";
end;

define open C-subtype <GtkConstantExpression> (<GtkExpression>)
end C-subtype;

define C-pointer-type <GtkConstantExpression*> => <GtkConstantExpression>;

define sealed domain make (singleton(<GtkConstantExpression*>));
define sealed domain initialize (<GtkConstantExpression*>);

define inline-only C-function gtk-constant-expression-new-for-value
  input parameter value_ :: <GValue>;
  result res :: <GtkConstantExpression>;
  c-name: "gtk_constant_expression_new_for_value";
end;

define inline-only C-function gtk-constant-expression-get-value
  input parameter self :: <GtkConstantExpression>;
  result res :: <GValue>;
  c-name: "gtk_constant_expression_get_value";
end;

define open C-subtype <GtkConstraint> (<GObject>)
end C-subtype;

define C-pointer-type <GtkConstraint*> => <GtkConstraint>;

define sealed domain make (singleton(<GtkConstraint*>));
define sealed domain initialize (<GtkConstraint*>);

define inline-only C-function gtk-constraint-new
  input parameter target_ :: <GtkConstraintTarget>;
  input parameter target_attribute_ :: <GtkConstraintAttribute>;
  input parameter relation_ :: <GtkConstraintRelation>;
  input parameter source_ :: <GtkConstraintTarget>;
  input parameter source_attribute_ :: <GtkConstraintAttribute>;
  input parameter multiplier_ :: <C-double>;
  input parameter constant_ :: <C-double>;
  input parameter strength_ :: <C-signed-int>;
  result res :: <GtkConstraint>;
  c-name: "gtk_constraint_new";
end;

define inline-only C-function gtk-constraint-new-constant
  input parameter target_ :: <GtkConstraintTarget>;
  input parameter target_attribute_ :: <GtkConstraintAttribute>;
  input parameter relation_ :: <GtkConstraintRelation>;
  input parameter constant_ :: <C-double>;
  input parameter strength_ :: <C-signed-int>;
  result res :: <GtkConstraint>;
  c-name: "gtk_constraint_new_constant";
end;

define inline-only C-function gtk-constraint-get-constant
  input parameter self :: <GtkConstraint>;
  result res :: <C-double>;
  c-name: "gtk_constraint_get_constant";
end;

define inline-only C-function gtk-constraint-get-multiplier
  input parameter self :: <GtkConstraint>;
  result res :: <C-double>;
  c-name: "gtk_constraint_get_multiplier";
end;

define inline-only C-function gtk-constraint-get-relation
  input parameter self :: <GtkConstraint>;
  result res :: <GtkConstraintRelation>;
  c-name: "gtk_constraint_get_relation";
end;

define inline-only C-function gtk-constraint-get-source
  input parameter self :: <GtkConstraint>;
  result res :: <GtkConstraintTarget>;
  c-name: "gtk_constraint_get_source";
end;

define inline-only C-function gtk-constraint-get-source-attribute
  input parameter self :: <GtkConstraint>;
  result res :: <GtkConstraintAttribute>;
  c-name: "gtk_constraint_get_source_attribute";
end;

define inline-only C-function gtk-constraint-get-strength
  input parameter self :: <GtkConstraint>;
  result res :: <C-signed-int>;
  c-name: "gtk_constraint_get_strength";
end;

define inline-only C-function gtk-constraint-get-target
  input parameter self :: <GtkConstraint>;
  result res :: <GtkConstraintTarget>;
  c-name: "gtk_constraint_get_target";
end;

define inline-only C-function gtk-constraint-get-target-attribute
  input parameter self :: <GtkConstraint>;
  result res :: <GtkConstraintAttribute>;
  c-name: "gtk_constraint_get_target_attribute";
end;

define inline-only C-function gtk-constraint-is-attached
  input parameter self :: <GtkConstraint>;
  result res :: <C-boolean>;
  c-name: "gtk_constraint_is_attached";
end;

define inline-only C-function gtk-constraint-is-constant
  input parameter self :: <GtkConstraint>;
  result res :: <C-boolean>;
  c-name: "gtk_constraint_is_constant";
end;

define inline-only C-function gtk-constraint-is-required
  input parameter self :: <GtkConstraint>;
  result res :: <C-boolean>;
  c-name: "gtk_constraint_is_required";
end;

define inline-only constant $gtk-constraint-attribute-none = 0;
define inline-only constant $gtk-constraint-attribute-left = 1;
define inline-only constant $gtk-constraint-attribute-right = 2;
define inline-only constant $gtk-constraint-attribute-top = 3;
define inline-only constant $gtk-constraint-attribute-bottom = 4;
define inline-only constant $gtk-constraint-attribute-start = 5;
define inline-only constant $gtk-constraint-attribute-end = 6;
define inline-only constant $gtk-constraint-attribute-width = 7;
define inline-only constant $gtk-constraint-attribute-height = 8;
define inline-only constant $gtk-constraint-attribute-center-x = 9;
define inline-only constant $gtk-constraint-attribute-center-y = 10;
define inline-only constant $gtk-constraint-attribute-baseline = 11;
define constant <GtkConstraintAttribute> = <C-int>;
define C-pointer-type <GtkConstraintAttribute*> => <GtkConstraintAttribute>;

define C-struct <_GtkConstraintClass>
  constant sealed inline-only slot gtk-constraint-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkConstraintClass>;
end C-struct;

define sealed domain make (singleton(<GtkConstraintClass>));
define sealed domain initialize (<GtkConstraintClass>);

define open C-subtype <GtkConstraintGuide> (<GObject>, <GtkConstraintTarget>)
end C-subtype;

define C-pointer-type <GtkConstraintGuide*> => <GtkConstraintGuide>;

define sealed domain make (singleton(<GtkConstraintGuide*>));
define sealed domain initialize (<GtkConstraintGuide*>);

define inline-only C-function gtk-constraint-guide-new
  result res :: <GtkConstraintGuide>;
  c-name: "gtk_constraint_guide_new";
end;

define inline-only C-function gtk-constraint-guide-get-max-size
  input parameter self :: <GtkConstraintGuide>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_constraint_guide_get_max_size";
end;

define inline-only C-function gtk-constraint-guide-get-min-size
  input parameter self :: <GtkConstraintGuide>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_constraint_guide_get_min_size";
end;

define inline-only C-function gtk-constraint-guide-get-name
  input parameter self :: <GtkConstraintGuide>;
  result res :: <C-string>;
  c-name: "gtk_constraint_guide_get_name";
end;

define inline-only C-function gtk-constraint-guide-get-nat-size
  input parameter self :: <GtkConstraintGuide>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_constraint_guide_get_nat_size";
end;

define inline-only C-function gtk-constraint-guide-get-strength
  input parameter self :: <GtkConstraintGuide>;
  result res :: <GtkConstraintStrength>;
  c-name: "gtk_constraint_guide_get_strength";
end;

define inline-only C-function gtk-constraint-guide-set-max-size
  input parameter self :: <GtkConstraintGuide>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_constraint_guide_set_max_size";
end;

define inline-only C-function gtk-constraint-guide-set-min-size
  input parameter self :: <GtkConstraintGuide>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_constraint_guide_set_min_size";
end;

define inline-only C-function gtk-constraint-guide-set-name
  input parameter self :: <GtkConstraintGuide>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_constraint_guide_set_name";
end;

define inline-only C-function gtk-constraint-guide-set-nat-size
  input parameter self :: <GtkConstraintGuide>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_constraint_guide_set_nat_size";
end;

define inline-only C-function gtk-constraint-guide-set-strength
  input parameter self :: <GtkConstraintGuide>;
  input parameter strength_ :: <GtkConstraintStrength>;
  c-name: "gtk_constraint_guide_set_strength";
end;

define C-struct <_GtkConstraintGuideClass>
  constant sealed inline-only slot gtk-constraint-guide-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkConstraintGuideClass>;
end C-struct;

define sealed domain make (singleton(<GtkConstraintGuideClass>));
define sealed domain initialize (<GtkConstraintGuideClass>);

define open C-subtype <GtkConstraintLayout> (<GtkLayoutManager>, <GtkBuildable>)
end C-subtype;

define C-pointer-type <GtkConstraintLayout*> => <GtkConstraintLayout>;

define sealed domain make (singleton(<GtkConstraintLayout*>));
define sealed domain initialize (<GtkConstraintLayout*>);

define inline-only C-function gtk-constraint-layout-new
  result res :: <GtkLayoutManager>;
  c-name: "gtk_constraint_layout_new";
end;

define inline-only C-function gtk-constraint-layout-add-constraint
  input parameter self :: <GtkConstraintLayout>;
  input parameter constraint_ :: <GtkConstraint>;
  c-name: "gtk_constraint_layout_add_constraint";
end;

define inline-only C-function gtk-constraint-layout-add-constraints-from-descriptionv
  input parameter self :: <GtkConstraintLayout>;
  input parameter lines_ :: <C-string*>;
  input parameter n_lines_ :: <C-unsigned-long>;
  input parameter hspacing_ :: <C-signed-int>;
  input parameter vspacing_ :: <C-signed-int>;
  input parameter views_ :: <GHashTable>;
  output parameter error_ :: <GError*>;
  result res :: <GList>;
  c-name: "gtk_constraint_layout_add_constraints_from_descriptionv";
end;

define inline-only C-function gtk-constraint-layout-add-guide
  input parameter self :: <GtkConstraintLayout>;
  input parameter guide_ :: <GtkConstraintGuide>;
  c-name: "gtk_constraint_layout_add_guide";
end;

define inline-only C-function gtk-constraint-layout-observe-constraints
  input parameter self :: <GtkConstraintLayout>;
  result res :: <GListModel>;
  c-name: "gtk_constraint_layout_observe_constraints";
end;

define inline-only C-function gtk-constraint-layout-observe-guides
  input parameter self :: <GtkConstraintLayout>;
  result res :: <GListModel>;
  c-name: "gtk_constraint_layout_observe_guides";
end;

define inline-only C-function gtk-constraint-layout-remove-all-constraints
  input parameter self :: <GtkConstraintLayout>;
  c-name: "gtk_constraint_layout_remove_all_constraints";
end;

define inline-only C-function gtk-constraint-layout-remove-constraint
  input parameter self :: <GtkConstraintLayout>;
  input parameter constraint_ :: <GtkConstraint>;
  c-name: "gtk_constraint_layout_remove_constraint";
end;

define inline-only C-function gtk-constraint-layout-remove-guide
  input parameter self :: <GtkConstraintLayout>;
  input parameter guide_ :: <GtkConstraintGuide>;
  c-name: "gtk_constraint_layout_remove_guide";
end;

define open C-subtype <GtkConstraintLayoutChild> (<GtkLayoutChild>)
end C-subtype;

define C-pointer-type <GtkConstraintLayoutChild*> => <GtkConstraintLayoutChild>;

define sealed domain make (singleton(<GtkConstraintLayoutChild*>));
define sealed domain initialize (<GtkConstraintLayoutChild*>);

define C-struct <_GtkConstraintLayoutChildClass>
  constant sealed inline-only slot gtk-constraint-layout-child-class-parent-class :: <GtkLayoutChildClass>;
  pointer-type-name: <GtkConstraintLayoutChildClass>;
end C-struct;

define sealed domain make (singleton(<GtkConstraintLayoutChildClass>));
define sealed domain initialize (<GtkConstraintLayoutChildClass>);

define C-struct <_GtkConstraintLayoutClass>
  constant sealed inline-only slot gtk-constraint-layout-class-parent-class :: <GtkLayoutManagerClass>;
  pointer-type-name: <GtkConstraintLayoutClass>;
end C-struct;

define sealed domain make (singleton(<GtkConstraintLayoutClass>));
define sealed domain initialize (<GtkConstraintLayoutClass>);

define inline-only constant $gtk-constraint-relation-le = -1;
define inline-only constant $gtk-constraint-relation-eq = 0;
define inline-only constant $gtk-constraint-relation-ge = 1;
define constant <GtkConstraintRelation> = <C-int>;
define C-pointer-type <GtkConstraintRelation*> => <GtkConstraintRelation>;

define inline-only constant $gtk-constraint-strength-required = 1001001000;
define inline-only constant $gtk-constraint-strength-strong = 1000000000;
define inline-only constant $gtk-constraint-strength-medium = 1000;
define inline-only constant $gtk-constraint-strength-weak = 1;
define constant <GtkConstraintStrength> = <C-int>;
define C-pointer-type <GtkConstraintStrength*> => <GtkConstraintStrength>;

// Interface
define open C-subtype <GtkConstraintTarget> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkConstraintTarget*> => <GtkConstraintTarget>;

define sealed domain make (singleton(<GtkConstraintTarget*>));
define sealed domain initialize (<GtkConstraintTarget*>);

define C-struct <_GtkConstraintTargetInterface>
  pointer-type-name: <GtkConstraintTargetInterface>;
end C-struct;

define sealed domain make (singleton(<GtkConstraintTargetInterface>));
define sealed domain initialize (<GtkConstraintTargetInterface>);

define inline-only constant $gtk-constraint-vfl-parser-error-invalid-symbol = 0;
define inline-only constant $gtk-constraint-vfl-parser-error-invalid-attribute = 1;
define inline-only constant $gtk-constraint-vfl-parser-error-invalid-view = 2;
define inline-only constant $gtk-constraint-vfl-parser-error-invalid-metric = 3;
define inline-only constant $gtk-constraint-vfl-parser-error-invalid-priority = 4;
define inline-only constant $gtk-constraint-vfl-parser-error-invalid-relation = 5;
define constant <GtkConstraintVflParserError> = <C-int>;
define C-pointer-type <GtkConstraintVflParserError*> => <GtkConstraintVflParserError>;

define inline-only constant $gtk-content-fit-fill = 0;
define inline-only constant $gtk-content-fit-contain = 1;
define inline-only constant $gtk-content-fit-cover = 2;
define inline-only constant $gtk-content-fit-scale-down = 3;
define constant <GtkContentFit> = <C-int>;
define C-pointer-type <GtkContentFit*> => <GtkContentFit>;

define inline-only constant $gtk-corner-top-left = 0;
define inline-only constant $gtk-corner-bottom-left = 1;
define inline-only constant $gtk-corner-top-right = 2;
define inline-only constant $gtk-corner-bottom-right = 3;
define constant <GtkCornerType> = <C-int>;
define C-pointer-type <GtkCornerType*> => <GtkCornerType>;

define C-struct <_GtkCssLocation>
  sealed inline-only slot gtk-css-location-bytes :: <C-unsigned-long>;
  sealed inline-only slot gtk-css-location-chars :: <C-unsigned-long>;
  sealed inline-only slot gtk-css-location-lines :: <C-unsigned-long>;
  sealed inline-only slot gtk-css-location-line-bytes :: <C-unsigned-long>;
  sealed inline-only slot gtk-css-location-line-chars :: <C-unsigned-long>;
  pointer-type-name: <GtkCssLocation>;
end C-struct;

define sealed domain make (singleton(<GtkCssLocation>));
define sealed domain initialize (<GtkCssLocation>);

define inline-only constant $gtk-css-parser-error-failed = 0;
define inline-only constant $gtk-css-parser-error-syntax = 1;
define inline-only constant $gtk-css-parser-error-import = 2;
define inline-only constant $gtk-css-parser-error-name = 3;
define inline-only constant $gtk-css-parser-error-unknown-value = 4;
define constant <GtkCssParserError> = <C-int>;
define C-pointer-type <GtkCssParserError*> => <GtkCssParserError>;

define inline-only constant $gtk-css-parser-warning-deprecated = 0;
define inline-only constant $gtk-css-parser-warning-syntax = 1;
define inline-only constant $gtk-css-parser-warning-unimplemented = 2;
define constant <GtkCssParserWarning> = <C-int>;
define C-pointer-type <GtkCssParserWarning*> => <GtkCssParserWarning>;

define open C-subtype <GtkCssProvider> (<GObject>, <GtkStyleProvider>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkCssProvider*> => <GtkCssProvider>;

define sealed domain make (singleton(<GtkCssProvider*>));
define sealed domain initialize (<GtkCssProvider*>);

define inline-only C-function gtk-css-provider-new
  result res :: <GtkCssProvider>;
  c-name: "gtk_css_provider_new";
end;

define inline-only C-function gtk-css-provider-load-from-data
  input parameter self :: <GtkCssProvider>;
  input parameter data_ :: <C-unsigned-char*>;
  input parameter length_ :: <C-signed-long>;
  c-name: "gtk_css_provider_load_from_data";
end;

define inline-only C-function gtk-css-provider-load-from-file
  input parameter self :: <GtkCssProvider>;
  input parameter file_ :: <GFile>;
  c-name: "gtk_css_provider_load_from_file";
end;

define inline-only C-function gtk-css-provider-load-from-path
  input parameter self :: <GtkCssProvider>;
  input parameter path_ :: <C-string>;
  c-name: "gtk_css_provider_load_from_path";
end;

define inline-only C-function gtk-css-provider-load-from-resource
  input parameter self :: <GtkCssProvider>;
  input parameter resource_path_ :: <C-string>;
  c-name: "gtk_css_provider_load_from_resource";
end;

define inline-only C-function gtk-css-provider-load-named
  input parameter self :: <GtkCssProvider>;
  input parameter name_ :: <C-string>;
  input parameter variant_ :: <C-string>;
  c-name: "gtk_css_provider_load_named";
end;

define inline-only C-function gtk-css-provider-to-string
  input parameter self :: <GtkCssProvider>;
  result res :: <C-string>;
  c-name: "gtk_css_provider_to_string";
end;

define C-struct <_GtkCssProviderClass>
  pointer-type-name: <GtkCssProviderClass>;
end C-struct;

define sealed domain make (singleton(<GtkCssProviderClass>));
define sealed domain initialize (<GtkCssProviderClass>);

define C-struct <_GtkCssProviderPrivate>
  pointer-type-name: <GtkCssProviderPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkCssProviderPrivate>));
define sealed domain initialize (<GtkCssProviderPrivate>);

define C-struct <_GtkCssSection>
  pointer-type-name: <GtkCssSection>;
end C-struct;

define sealed domain make (singleton(<GtkCssSection>));
define sealed domain initialize (<GtkCssSection>);

define inline-only C-function gtk-css-section-new
  input parameter file_ :: <GFile>;
  input parameter start_ :: <GtkCssLocation>;
  input parameter end_ :: <GtkCssLocation>;
  result res :: <GtkCssSection>;
  c-name: "gtk_css_section_new";
end;

define inline-only C-function gtk-css-section-get-end-location
  input parameter self :: <GtkCssSection>;
  result res :: <GtkCssLocation>;
  c-name: "gtk_css_section_get_end_location";
end;

define inline-only C-function gtk-css-section-get-file
  input parameter self :: <GtkCssSection>;
  result res :: <GFile>;
  c-name: "gtk_css_section_get_file";
end;

define inline-only C-function gtk-css-section-get-parent
  input parameter self :: <GtkCssSection>;
  result res :: <GtkCssSection>;
  c-name: "gtk_css_section_get_parent";
end;

define inline-only C-function gtk-css-section-get-start-location
  input parameter self :: <GtkCssSection>;
  result res :: <GtkCssLocation>;
  c-name: "gtk_css_section_get_start_location";
end;

define inline-only C-function gtk-css-section-print
  input parameter self :: <GtkCssSection>;
  input parameter string_ :: <GString>;
  c-name: "gtk_css_section_print";
end;

define inline-only C-function gtk-css-section-ref
  input parameter self :: <GtkCssSection>;
  result res :: <GtkCssSection>;
  c-name: "gtk_css_section_ref";
end;

define inline-only C-function gtk-css-section-to-string
  input parameter self :: <GtkCssSection>;
  result res :: <C-string>;
  c-name: "gtk_css_section_to_string";
end;

define inline-only C-function gtk-css-section-unref
  input parameter self :: <GtkCssSection>;
  c-name: "gtk_css_section_unref";
end;

define C-struct <_GtkCssStyleChange>
  pointer-type-name: <GtkCssStyleChange>;
end C-struct;

define sealed domain make (singleton(<GtkCssStyleChange>));
define sealed domain initialize (<GtkCssStyleChange>);

define open C-subtype <GtkCustomFilter> (<GtkFilter>)
end C-subtype;

define C-pointer-type <GtkCustomFilter*> => <GtkCustomFilter>;

define sealed domain make (singleton(<GtkCustomFilter*>));
define sealed domain initialize (<GtkCustomFilter*>);

define inline-only C-function gtk-custom-filter-new
  input parameter match_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_destroy_ :: <C-function-pointer>;
  result res :: <GtkCustomFilter>;
  c-name: "gtk_custom_filter_new";
end;

define inline-only C-function gtk-custom-filter-set-filter-func
  input parameter self :: <GtkCustomFilter>;
  input parameter match_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_destroy_ :: <C-function-pointer>;
  c-name: "gtk_custom_filter_set_filter_func";
end;

define C-struct <_GtkCustomFilterClass>
  constant sealed inline-only slot gtk-custom-filter-class-parent-class :: <GtkFilterClass>;
  pointer-type-name: <GtkCustomFilterClass>;
end C-struct;

define sealed domain make (singleton(<GtkCustomFilterClass>));
define sealed domain initialize (<GtkCustomFilterClass>);

define open C-subtype <GtkCustomLayout> (<GtkLayoutManager>)
end C-subtype;

define C-pointer-type <GtkCustomLayout*> => <GtkCustomLayout>;

define sealed domain make (singleton(<GtkCustomLayout*>));
define sealed domain initialize (<GtkCustomLayout*>);

define inline-only C-function gtk-custom-layout-new
  input parameter request_mode_ :: <C-function-pointer>;
  input parameter measure_ :: <C-function-pointer>;
  input parameter allocate_ :: <C-function-pointer>;
  result res :: <GtkLayoutManager>;
  c-name: "gtk_custom_layout_new";
end;

define C-struct <_GtkCustomLayoutClass>
  constant sealed inline-only slot gtk-custom-layout-class-parent-class :: <GtkLayoutManagerClass>;
  pointer-type-name: <GtkCustomLayoutClass>;
end C-struct;

define sealed domain make (singleton(<GtkCustomLayoutClass>));
define sealed domain initialize (<GtkCustomLayoutClass>);

define open C-subtype <GtkCustomSorter> (<GtkSorter>)
end C-subtype;

define C-pointer-type <GtkCustomSorter*> => <GtkCustomSorter>;

define sealed domain make (singleton(<GtkCustomSorter*>));
define sealed domain initialize (<GtkCustomSorter*>);

define inline-only C-function gtk-custom-sorter-new
  input parameter sort_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_destroy_ :: <C-function-pointer>;
  result res :: <GtkCustomSorter>;
  c-name: "gtk_custom_sorter_new";
end;

define inline-only C-function gtk-custom-sorter-set-sort-func
  input parameter self :: <GtkCustomSorter>;
  input parameter sort_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_destroy_ :: <C-function-pointer>;
  c-name: "gtk_custom_sorter_set_sort_func";
end;

define C-struct <_GtkCustomSorterClass>
  constant sealed inline-only slot gtk-custom-sorter-class-parent-class :: <GtkSorterClass>;
  pointer-type-name: <GtkCustomSorterClass>;
end C-struct;

define sealed domain make (singleton(<GtkCustomSorterClass>));
define sealed domain initialize (<GtkCustomSorterClass>);

define inline-only constant $gtk-debug-text = 1;
define inline-only constant $gtk-debug-tree = 2;
define inline-only constant $gtk-debug-keybindings = 4;
define inline-only constant $gtk-debug-modules = 8;
define inline-only constant $gtk-debug-geometry = 16;
define inline-only constant $gtk-debug-icontheme = 32;
define inline-only constant $gtk-debug-printing = 64;
define inline-only constant $gtk-debug-builder = 128;
define inline-only constant $gtk-debug-size-request = 256;
define inline-only constant $gtk-debug-no-css-cache = 512;
define inline-only constant $gtk-debug-interactive = 1024;
define inline-only constant $gtk-debug-touchscreen = 2048;
define inline-only constant $gtk-debug-actions = 4096;
define inline-only constant $gtk-debug-layout = 8192;
define inline-only constant $gtk-debug-snapshot = 16384;
define inline-only constant $gtk-debug-constraints = 32768;
define inline-only constant $gtk-debug-builder-objects = 65536;
define inline-only constant $gtk-debug-a11y = 131072;
define inline-only constant $gtk-debug-iconfallback = 262144;
define inline-only constant $gtk-debug-invert-text-dir = 524288;
define constant <GtkDebugFlags> = <C-int>;
define C-pointer-type <GtkDebugFlags*> => <GtkDebugFlags>;

define inline-only constant $gtk-delete-chars = 0;
define inline-only constant $gtk-delete-word-ends = 1;
define inline-only constant $gtk-delete-words = 2;
define inline-only constant $gtk-delete-display-lines = 3;
define inline-only constant $gtk-delete-display-line-ends = 4;
define inline-only constant $gtk-delete-paragraph-ends = 5;
define inline-only constant $gtk-delete-paragraphs = 6;
define inline-only constant $gtk-delete-whitespace = 7;
define constant <GtkDeleteType> = <C-int>;
define C-pointer-type <GtkDeleteType*> => <GtkDeleteType>;

define open C-subtype <GtkDialog> (<GtkWindow>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkDialog*> => <GtkDialog>;

define sealed domain make (singleton(<GtkDialog*>));
define sealed domain initialize (<GtkDialog*>);

define inline-only C-function gtk-dialog-new
  result res :: <GtkWidget>;
  c-name: "gtk_dialog_new";
end;

define inline-only C-function gtk-dialog-add-action-widget
  input parameter self :: <GtkDialog>;
  input parameter child_ :: <GtkWidget>;
  input parameter response_id_ :: <C-signed-int>;
  c-name: "gtk_dialog_add_action_widget";
end;

define inline-only C-function gtk-dialog-add-button
  input parameter self :: <GtkDialog>;
  input parameter button_text_ :: <C-string>;
  input parameter response_id_ :: <C-signed-int>;
  result res :: <GtkWidget>;
  c-name: "gtk_dialog_add_button";
end;

define inline-only C-function gtk-dialog-get-content-area
  input parameter self :: <GtkDialog>;
  result res :: <GtkBox>;
  c-name: "gtk_dialog_get_content_area";
end;

define inline-only C-function gtk-dialog-get-header-bar
  input parameter self :: <GtkDialog>;
  result res :: <GtkHeaderBar>;
  c-name: "gtk_dialog_get_header_bar";
end;

define inline-only C-function gtk-dialog-get-response-for-widget
  input parameter self :: <GtkDialog>;
  input parameter widget_ :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_dialog_get_response_for_widget";
end;

define inline-only C-function gtk-dialog-get-widget-for-response
  input parameter self :: <GtkDialog>;
  input parameter response_id_ :: <C-signed-int>;
  result res :: <GtkWidget>;
  c-name: "gtk_dialog_get_widget_for_response";
end;

define inline-only C-function gtk-dialog-response
  input parameter self :: <GtkDialog>;
  input parameter response_id_ :: <C-signed-int>;
  c-name: "gtk_dialog_response";
end;

define inline-only C-function gtk-dialog-set-default-response
  input parameter self :: <GtkDialog>;
  input parameter response_id_ :: <C-signed-int>;
  c-name: "gtk_dialog_set_default_response";
end;

define inline-only C-function gtk-dialog-set-response-sensitive
  input parameter self :: <GtkDialog>;
  input parameter response_id_ :: <C-signed-int>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_dialog_set_response_sensitive";
end;

define C-struct <_GtkDialogClass>
  constant sealed inline-only slot gtk-dialog-class-parent-class :: <GtkWindowClass>;
  constant sealed inline-only slot gtk-dialog-class-response :: <C-function-pointer>;
  constant sealed inline-only slot gtk-dialog-class-close :: <C-function-pointer>;
  constant sealed inline-only slot gtk-dialog-class-padding :: <C-void*>;
  pointer-type-name: <GtkDialogClass>;
end C-struct;

define sealed domain make (singleton(<GtkDialogClass>));
define sealed domain initialize (<GtkDialogClass>);

define inline-only constant $gtk-dialog-modal = 1;
define inline-only constant $gtk-dialog-destroy-with-parent = 2;
define inline-only constant $gtk-dialog-use-header-bar = 4;
define constant <GtkDialogFlags> = <C-int>;
define C-pointer-type <GtkDialogFlags*> => <GtkDialogFlags>;

define inline-only constant $gtk-dir-tab-forward = 0;
define inline-only constant $gtk-dir-tab-backward = 1;
define inline-only constant $gtk-dir-up = 2;
define inline-only constant $gtk-dir-down = 3;
define inline-only constant $gtk-dir-left = 4;
define inline-only constant $gtk-dir-right = 5;
define constant <GtkDirectionType> = <C-int>;
define C-pointer-type <GtkDirectionType*> => <GtkDirectionType>;

define open C-subtype <GtkDirectoryList> (<GObject>, <GListModel>)
end C-subtype;

define C-pointer-type <GtkDirectoryList*> => <GtkDirectoryList>;

define sealed domain make (singleton(<GtkDirectoryList*>));
define sealed domain initialize (<GtkDirectoryList*>);

define inline-only C-function gtk-directory-list-new
  input parameter attributes_ :: <C-string>;
  input parameter file_ :: <GFile>;
  result res :: <GtkDirectoryList>;
  c-name: "gtk_directory_list_new";
end;

define inline-only C-function gtk-directory-list-get-attributes
  input parameter self :: <GtkDirectoryList>;
  result res :: <C-string>;
  c-name: "gtk_directory_list_get_attributes";
end;

define inline-only C-function gtk-directory-list-get-error
  input parameter self :: <GtkDirectoryList>;
  result res :: <GError>;
  c-name: "gtk_directory_list_get_error";
end;

define inline-only C-function gtk-directory-list-get-file
  input parameter self :: <GtkDirectoryList>;
  result res :: <GFile>;
  c-name: "gtk_directory_list_get_file";
end;

define inline-only C-function gtk-directory-list-get-io-priority
  input parameter self :: <GtkDirectoryList>;
  result res :: <C-signed-int>;
  c-name: "gtk_directory_list_get_io_priority";
end;

define inline-only C-function gtk-directory-list-get-monitored
  input parameter self :: <GtkDirectoryList>;
  result res :: <C-boolean>;
  c-name: "gtk_directory_list_get_monitored";
end;

define inline-only C-function gtk-directory-list-is-loading
  input parameter self :: <GtkDirectoryList>;
  result res :: <C-boolean>;
  c-name: "gtk_directory_list_is_loading";
end;

define inline-only C-function gtk-directory-list-set-attributes
  input parameter self :: <GtkDirectoryList>;
  input parameter attributes_ :: <C-string>;
  c-name: "gtk_directory_list_set_attributes";
end;

define inline-only C-function gtk-directory-list-set-file
  input parameter self :: <GtkDirectoryList>;
  input parameter file_ :: <GFile>;
  c-name: "gtk_directory_list_set_file";
end;

define inline-only C-function gtk-directory-list-set-io-priority
  input parameter self :: <GtkDirectoryList>;
  input parameter io_priority_ :: <C-signed-int>;
  c-name: "gtk_directory_list_set_io_priority";
end;

define inline-only C-function gtk-directory-list-set-monitored
  input parameter self :: <GtkDirectoryList>;
  input parameter monitored_ :: <C-boolean>;
  c-name: "gtk_directory_list_set_monitored";
end;

define C-struct <_GtkDirectoryListClass>
  constant sealed inline-only slot gtk-directory-list-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkDirectoryListClass>;
end C-struct;

define sealed domain make (singleton(<GtkDirectoryListClass>));
define sealed domain initialize (<GtkDirectoryListClass>);

define open C-subtype <GtkDragIcon> (<GtkRoot>)
end C-subtype;

define C-pointer-type <GtkDragIcon*> => <GtkDragIcon>;

define sealed domain make (singleton(<GtkDragIcon*>));
define sealed domain initialize (<GtkDragIcon*>);

define inline-only C-function gtk-drag-icon-create-widget-for-value
  input parameter value_ :: <GValue>;
  result res :: <GtkWidget>;
  c-name: "gtk_drag_icon_create_widget_for_value";
end;

define inline-only C-function gtk-drag-icon-get-for-drag
  input parameter drag_ :: <GdkDrag>;
  result res :: <GtkWidget>;
  c-name: "gtk_drag_icon_get_for_drag";
end;

define inline-only C-function gtk-drag-icon-set-from-paintable
  input parameter drag_ :: <GdkDrag>;
  input parameter paintable_ :: <GdkPaintable>;
  input parameter hot_x_ :: <C-signed-int>;
  input parameter hot_y_ :: <C-signed-int>;
  c-name: "gtk_drag_icon_set_from_paintable";
end;

define inline-only C-function gtk-drag-icon-get-child
  input parameter self :: <GtkDragIcon>;
  result res :: <GtkWidget>;
  c-name: "gtk_drag_icon_get_child";
end;

define inline-only C-function gtk-drag-icon-set-child
  input parameter self :: <GtkDragIcon>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_drag_icon_set_child";
end;

define C-struct <_GtkDragIconClass>
  constant sealed inline-only slot gtk-drag-icon-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkDragIconClass>;
end C-struct;

define sealed domain make (singleton(<GtkDragIconClass>));
define sealed domain initialize (<GtkDragIconClass>);

define open C-subtype <GtkDragSource> (<GtkGestureSingle>)
end C-subtype;

define C-pointer-type <GtkDragSource*> => <GtkDragSource>;

define sealed domain make (singleton(<GtkDragSource*>));
define sealed domain initialize (<GtkDragSource*>);

define inline-only C-function gtk-drag-source-new
  result res :: <GtkDragSource>;
  c-name: "gtk_drag_source_new";
end;

define inline-only C-function gtk-drag-source-drag-cancel
  input parameter self :: <GtkDragSource>;
  c-name: "gtk_drag_source_drag_cancel";
end;

define inline-only C-function gtk-drag-source-get-actions
  input parameter self :: <GtkDragSource>;
  result res :: <GdkDragAction>;
  c-name: "gtk_drag_source_get_actions";
end;

define inline-only C-function gtk-drag-source-get-content
  input parameter self :: <GtkDragSource>;
  result res :: <GdkContentProvider>;
  c-name: "gtk_drag_source_get_content";
end;

define inline-only C-function gtk-drag-source-get-drag
  input parameter self :: <GtkDragSource>;
  result res :: <GdkDrag>;
  c-name: "gtk_drag_source_get_drag";
end;

define inline-only C-function gtk-drag-source-set-actions
  input parameter self :: <GtkDragSource>;
  input parameter actions_ :: <GdkDragAction>;
  c-name: "gtk_drag_source_set_actions";
end;

define inline-only C-function gtk-drag-source-set-content
  input parameter self :: <GtkDragSource>;
  input parameter content_ :: <GdkContentProvider>;
  c-name: "gtk_drag_source_set_content";
end;

define inline-only C-function gtk-drag-source-set-icon
  input parameter self :: <GtkDragSource>;
  input parameter paintable_ :: <GdkPaintable>;
  input parameter hot_x_ :: <C-signed-int>;
  input parameter hot_y_ :: <C-signed-int>;
  c-name: "gtk_drag_source_set_icon";
end;

define C-struct <_GtkDragSourceClass>
  pointer-type-name: <GtkDragSourceClass>;
end C-struct;

define sealed domain make (singleton(<GtkDragSourceClass>));
define sealed domain initialize (<GtkDragSourceClass>);

define open C-subtype <GtkDrawingArea> (<GtkWidget>)
  // widget
end C-subtype;

define C-pointer-type <GtkDrawingArea*> => <GtkDrawingArea>;

define sealed domain make (singleton(<GtkDrawingArea*>));
define sealed domain initialize (<GtkDrawingArea*>);

define inline-only C-function gtk-drawing-area-new
  result res :: <GtkWidget>;
  c-name: "gtk_drawing_area_new";
end;

define inline-only C-function gtk-drawing-area-get-content-height
  input parameter self :: <GtkDrawingArea>;
  result res :: <C-signed-int>;
  c-name: "gtk_drawing_area_get_content_height";
end;

define inline-only C-function gtk-drawing-area-get-content-width
  input parameter self :: <GtkDrawingArea>;
  result res :: <C-signed-int>;
  c-name: "gtk_drawing_area_get_content_width";
end;

define inline-only C-function gtk-drawing-area-set-content-height
  input parameter self :: <GtkDrawingArea>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_drawing_area_set_content_height";
end;

define inline-only C-function gtk-drawing-area-set-content-width
  input parameter self :: <GtkDrawingArea>;
  input parameter width_ :: <C-signed-int>;
  c-name: "gtk_drawing_area_set_content_width";
end;

define inline-only C-function gtk-drawing-area-set-draw-func
  input parameter self :: <GtkDrawingArea>;
  input parameter draw_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_drawing_area_set_draw_func";
end;

define C-struct <_GtkDrawingAreaClass>
  constant sealed inline-only slot gtk-drawing-area-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-drawing-area-class-resize :: <C-function-pointer>;
  constant sealed inline-only slot gtk-drawing-area-class-padding :: <C-void*>;
  pointer-type-name: <GtkDrawingAreaClass>;
end C-struct;

define sealed domain make (singleton(<GtkDrawingAreaClass>));
define sealed domain initialize (<GtkDrawingAreaClass>);

define open C-subtype <GtkDropControllerMotion> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkDropControllerMotion*> => <GtkDropControllerMotion>;

define sealed domain make (singleton(<GtkDropControllerMotion*>));
define sealed domain initialize (<GtkDropControllerMotion*>);

define inline-only C-function gtk-drop-controller-motion-new
  result res :: <GtkEventController>;
  c-name: "gtk_drop_controller_motion_new";
end;

define inline-only C-function gtk-drop-controller-motion-contains-pointer
  input parameter self :: <GtkDropControllerMotion>;
  result res :: <C-boolean>;
  c-name: "gtk_drop_controller_motion_contains_pointer";
end;

define inline-only C-function gtk-drop-controller-motion-get-drop
  input parameter self :: <GtkDropControllerMotion>;
  result res :: <GdkDrop>;
  c-name: "gtk_drop_controller_motion_get_drop";
end;

define inline-only C-function gtk-drop-controller-motion-is-pointer
  input parameter self :: <GtkDropControllerMotion>;
  result res :: <C-boolean>;
  c-name: "gtk_drop_controller_motion_is_pointer";
end;

define C-struct <_GtkDropControllerMotionClass>
  pointer-type-name: <GtkDropControllerMotionClass>;
end C-struct;

define sealed domain make (singleton(<GtkDropControllerMotionClass>));
define sealed domain initialize (<GtkDropControllerMotionClass>);

define open C-subtype <GtkDropDown> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkDropDown*> => <GtkDropDown>;

define sealed domain make (singleton(<GtkDropDown*>));
define sealed domain initialize (<GtkDropDown*>);

define inline-only C-function gtk-drop-down-new
  input parameter model_ :: <GListModel>;
  input parameter expression_ :: <GtkExpression>;
  result res :: <GtkWidget>;
  c-name: "gtk_drop_down_new";
end;

define inline-only C-function gtk-drop-down-new-from-strings
  input parameter strings_ :: <C-string*>;
  result res :: <GtkWidget>;
  c-name: "gtk_drop_down_new_from_strings";
end;

define inline-only C-function gtk-drop-down-get-enable-search
  input parameter self :: <GtkDropDown>;
  result res :: <C-boolean>;
  c-name: "gtk_drop_down_get_enable_search";
end;

define inline-only C-function gtk-drop-down-get-expression
  input parameter self :: <GtkDropDown>;
  result res :: <GtkExpression>;
  c-name: "gtk_drop_down_get_expression";
end;

define inline-only C-function gtk-drop-down-get-factory
  input parameter self :: <GtkDropDown>;
  result res :: <GtkListItemFactory>;
  c-name: "gtk_drop_down_get_factory";
end;

define inline-only C-function gtk-drop-down-get-list-factory
  input parameter self :: <GtkDropDown>;
  result res :: <GtkListItemFactory>;
  c-name: "gtk_drop_down_get_list_factory";
end;

define inline-only C-function gtk-drop-down-get-model
  input parameter self :: <GtkDropDown>;
  result res :: <GListModel>;
  c-name: "gtk_drop_down_get_model";
end;

define inline-only C-function gtk-drop-down-get-selected
  input parameter self :: <GtkDropDown>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_drop_down_get_selected";
end;

define inline-only C-function gtk-drop-down-get-selected-item
  input parameter self :: <GtkDropDown>;
  result res :: <GObject>;
  c-name: "gtk_drop_down_get_selected_item";
end;

define inline-only C-function gtk-drop-down-get-show-arrow
  input parameter self :: <GtkDropDown>;
  result res :: <C-boolean>;
  c-name: "gtk_drop_down_get_show_arrow";
end;

define inline-only C-function gtk-drop-down-set-enable-search
  input parameter self :: <GtkDropDown>;
  input parameter enable_search_ :: <C-boolean>;
  c-name: "gtk_drop_down_set_enable_search";
end;

define inline-only C-function gtk-drop-down-set-expression
  input parameter self :: <GtkDropDown>;
  input parameter expression_ :: <GtkExpression>;
  c-name: "gtk_drop_down_set_expression";
end;

define inline-only C-function gtk-drop-down-set-factory
  input parameter self :: <GtkDropDown>;
  input parameter factory_ :: <GtkListItemFactory>;
  c-name: "gtk_drop_down_set_factory";
end;

define inline-only C-function gtk-drop-down-set-list-factory
  input parameter self :: <GtkDropDown>;
  input parameter factory_ :: <GtkListItemFactory>;
  c-name: "gtk_drop_down_set_list_factory";
end;

define inline-only C-function gtk-drop-down-set-model
  input parameter self :: <GtkDropDown>;
  input parameter model_ :: <GListModel>;
  c-name: "gtk_drop_down_set_model";
end;

define inline-only C-function gtk-drop-down-set-selected
  input parameter self :: <GtkDropDown>;
  input parameter position_ :: <C-unsigned-int>;
  c-name: "gtk_drop_down_set_selected";
end;

define inline-only C-function gtk-drop-down-set-show-arrow
  input parameter self :: <GtkDropDown>;
  input parameter show_arrow_ :: <C-boolean>;
  c-name: "gtk_drop_down_set_show_arrow";
end;

define C-struct <_GtkDropDownClass>
  constant sealed inline-only slot gtk-drop-down-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkDropDownClass>;
end C-struct;

define sealed domain make (singleton(<GtkDropDownClass>));
define sealed domain initialize (<GtkDropDownClass>);

define open C-subtype <GtkDropTarget> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkDropTarget*> => <GtkDropTarget>;

define sealed domain make (singleton(<GtkDropTarget*>));
define sealed domain initialize (<GtkDropTarget*>);

define inline-only C-function gtk-drop-target-new
  input parameter type_ :: <C-long>;
  input parameter actions_ :: <GdkDragAction>;
  result res :: <GtkDropTarget>;
  c-name: "gtk_drop_target_new";
end;

define inline-only C-function gtk-drop-target-get-actions
  input parameter self :: <GtkDropTarget>;
  result res :: <GdkDragAction>;
  c-name: "gtk_drop_target_get_actions";
end;

define inline-only C-function gtk-drop-target-get-current-drop
  input parameter self :: <GtkDropTarget>;
  result res :: <GdkDrop>;
  c-name: "gtk_drop_target_get_current_drop";
end;

define inline-only C-function gtk-drop-target-get-formats
  input parameter self :: <GtkDropTarget>;
  result res :: <GdkContentFormats>;
  c-name: "gtk_drop_target_get_formats";
end;

define inline-only C-function gtk-drop-target-get-gtypes
  input parameter self :: <GtkDropTarget>;
  output parameter n_types_ :: <C-unsigned-long*>;
  result res :: <C-long*>;
  c-name: "gtk_drop_target_get_gtypes";
end;

define inline-only C-function gtk-drop-target-get-preload
  input parameter self :: <GtkDropTarget>;
  result res :: <C-boolean>;
  c-name: "gtk_drop_target_get_preload";
end;

define inline-only C-function gtk-drop-target-get-value
  input parameter self :: <GtkDropTarget>;
  result res :: <GValue>;
  c-name: "gtk_drop_target_get_value";
end;

define inline-only C-function gtk-drop-target-reject
  input parameter self :: <GtkDropTarget>;
  c-name: "gtk_drop_target_reject";
end;

define inline-only C-function gtk-drop-target-set-actions
  input parameter self :: <GtkDropTarget>;
  input parameter actions_ :: <GdkDragAction>;
  c-name: "gtk_drop_target_set_actions";
end;

define inline-only C-function gtk-drop-target-set-gtypes
  input parameter self :: <GtkDropTarget>;
  input parameter types_ :: <C-long*>;
  input parameter n_types_ :: <C-unsigned-long>;
  c-name: "gtk_drop_target_set_gtypes";
end;

define inline-only C-function gtk-drop-target-set-preload
  input parameter self :: <GtkDropTarget>;
  input parameter preload_ :: <C-boolean>;
  c-name: "gtk_drop_target_set_preload";
end;

define open C-subtype <GtkDropTargetAsync> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkDropTargetAsync*> => <GtkDropTargetAsync>;

define sealed domain make (singleton(<GtkDropTargetAsync*>));
define sealed domain initialize (<GtkDropTargetAsync*>);

define inline-only C-function gtk-drop-target-async-new
  input parameter formats_ :: <GdkContentFormats>;
  input parameter actions_ :: <GdkDragAction>;
  result res :: <GtkDropTargetAsync>;
  c-name: "gtk_drop_target_async_new";
end;

define inline-only C-function gtk-drop-target-async-get-actions
  input parameter self :: <GtkDropTargetAsync>;
  result res :: <GdkDragAction>;
  c-name: "gtk_drop_target_async_get_actions";
end;

define inline-only C-function gtk-drop-target-async-get-formats
  input parameter self :: <GtkDropTargetAsync>;
  result res :: <GdkContentFormats>;
  c-name: "gtk_drop_target_async_get_formats";
end;

define inline-only C-function gtk-drop-target-async-reject-drop
  input parameter self :: <GtkDropTargetAsync>;
  input parameter drop_ :: <GdkDrop>;
  c-name: "gtk_drop_target_async_reject_drop";
end;

define inline-only C-function gtk-drop-target-async-set-actions
  input parameter self :: <GtkDropTargetAsync>;
  input parameter actions_ :: <GdkDragAction>;
  c-name: "gtk_drop_target_async_set_actions";
end;

define inline-only C-function gtk-drop-target-async-set-formats
  input parameter self :: <GtkDropTargetAsync>;
  input parameter formats_ :: <GdkContentFormats>;
  c-name: "gtk_drop_target_async_set_formats";
end;

define C-struct <_GtkDropTargetAsyncClass>
  pointer-type-name: <GtkDropTargetAsyncClass>;
end C-struct;

define sealed domain make (singleton(<GtkDropTargetAsyncClass>));
define sealed domain initialize (<GtkDropTargetAsyncClass>);

define C-struct <_GtkDropTargetClass>
  pointer-type-name: <GtkDropTargetClass>;
end C-struct;

define sealed domain make (singleton(<GtkDropTargetClass>));
define sealed domain initialize (<GtkDropTargetClass>);

// Interface
define open C-subtype <GtkEditable> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkEditable*> => <GtkEditable>;

define sealed domain make (singleton(<GtkEditable*>));
define sealed domain initialize (<GtkEditable*>);

define inline-only C-function gtk-editable-delegate-get-property
  input parameter object_ :: <GObject>;
  input parameter prop_id_ :: <C-unsigned-int>;
  input parameter value_ :: <GValue>;
  input parameter pspec_ :: <GParamSpec>;
  result res :: <C-boolean>;
  c-name: "gtk_editable_delegate_get_property";
end;

define inline-only C-function gtk-editable-delegate-set-property
  input parameter object_ :: <GObject>;
  input parameter prop_id_ :: <C-unsigned-int>;
  input parameter value_ :: <GValue>;
  input parameter pspec_ :: <GParamSpec>;
  result res :: <C-boolean>;
  c-name: "gtk_editable_delegate_set_property";
end;

define inline-only C-function gtk-editable-install-properties
  input parameter object_class_ :: <GObjectClass>;
  input parameter first_prop_ :: <C-unsigned-int>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_editable_install_properties";
end;

define inline-only C-function gtk-editable-delete-selection
  input parameter self :: <GtkEditable>;
  c-name: "gtk_editable_delete_selection";
end;

define inline-only C-function gtk-editable-delete-text
  input parameter self :: <GtkEditable>;
  input parameter start_pos_ :: <C-signed-int>;
  input parameter end_pos_ :: <C-signed-int>;
  c-name: "gtk_editable_delete_text";
end;

define inline-only C-function gtk-editable-finish-delegate
  input parameter self :: <GtkEditable>;
  c-name: "gtk_editable_finish_delegate";
end;

define inline-only C-function gtk-editable-get-alignment
  input parameter self :: <GtkEditable>;
  result res :: <C-float>;
  c-name: "gtk_editable_get_alignment";
end;

define inline-only C-function gtk-editable-get-chars
  input parameter self :: <GtkEditable>;
  input parameter start_pos_ :: <C-signed-int>;
  input parameter end_pos_ :: <C-signed-int>;
  result res :: <C-string>;
  c-name: "gtk_editable_get_chars";
end;

define inline-only C-function gtk-editable-get-delegate
  input parameter self :: <GtkEditable>;
  result res :: <GtkEditable>;
  c-name: "gtk_editable_get_delegate";
end;

define inline-only C-function gtk-editable-get-editable
  input parameter self :: <GtkEditable>;
  result res :: <C-boolean>;
  c-name: "gtk_editable_get_editable";
end;

define inline-only C-function gtk-editable-get-enable-undo
  input parameter self :: <GtkEditable>;
  result res :: <C-boolean>;
  c-name: "gtk_editable_get_enable_undo";
end;

define inline-only C-function gtk-editable-get-max-width-chars
  input parameter self :: <GtkEditable>;
  result res :: <C-signed-int>;
  c-name: "gtk_editable_get_max_width_chars";
end;

define inline-only C-function gtk-editable-get-position
  input parameter self :: <GtkEditable>;
  result res :: <C-signed-int>;
  c-name: "gtk_editable_get_position";
end;

define inline-only C-function gtk-editable-get-selection-bounds
  input parameter self :: <GtkEditable>;
  output parameter start_pos_ :: <C-signed-int*>;
  output parameter end_pos_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_editable_get_selection_bounds";
end;

define inline-only C-function gtk-editable-get-text
  input parameter self :: <GtkEditable>;
  result res :: <C-string>;
  c-name: "gtk_editable_get_text";
end;

define inline-only C-function gtk-editable-get-width-chars
  input parameter self :: <GtkEditable>;
  result res :: <C-signed-int>;
  c-name: "gtk_editable_get_width_chars";
end;

define inline-only C-function gtk-editable-init-delegate
  input parameter self :: <GtkEditable>;
  c-name: "gtk_editable_init_delegate";
end;

define inline-only C-function gtk-editable-insert-text
  input parameter self :: <GtkEditable>;
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input output parameter position_ :: <C-signed-int*>;
  c-name: "gtk_editable_insert_text";
end;

define inline-only C-function gtk-editable-select-region
  input parameter self :: <GtkEditable>;
  input parameter start_pos_ :: <C-signed-int>;
  input parameter end_pos_ :: <C-signed-int>;
  c-name: "gtk_editable_select_region";
end;

define inline-only C-function gtk-editable-set-alignment
  input parameter self :: <GtkEditable>;
  input parameter xalign_ :: <C-float>;
  c-name: "gtk_editable_set_alignment";
end;

define inline-only C-function gtk-editable-set-editable
  input parameter self :: <GtkEditable>;
  input parameter is_editable_ :: <C-boolean>;
  c-name: "gtk_editable_set_editable";
end;

define inline-only C-function gtk-editable-set-enable-undo
  input parameter self :: <GtkEditable>;
  input parameter enable_undo_ :: <C-boolean>;
  c-name: "gtk_editable_set_enable_undo";
end;

define inline-only C-function gtk-editable-set-max-width-chars
  input parameter self :: <GtkEditable>;
  input parameter n_chars_ :: <C-signed-int>;
  c-name: "gtk_editable_set_max_width_chars";
end;

define inline-only C-function gtk-editable-set-position
  input parameter self :: <GtkEditable>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_editable_set_position";
end;

define inline-only C-function gtk-editable-set-text
  input parameter self :: <GtkEditable>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_editable_set_text";
end;

define inline-only C-function gtk-editable-set-width-chars
  input parameter self :: <GtkEditable>;
  input parameter n_chars_ :: <C-signed-int>;
  c-name: "gtk_editable_set_width_chars";
end;

define C-struct <_GtkEditableInterface>
  constant sealed inline-only slot gtk-editable-interface-base-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-editable-interface-insert-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-editable-interface-delete-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-editable-interface-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-editable-interface-get-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-editable-interface-do-insert-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-editable-interface-do-delete-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-editable-interface-get-selection-bounds :: <C-function-pointer>;
  constant sealed inline-only slot gtk-editable-interface-set-selection-bounds :: <C-function-pointer>;
  constant sealed inline-only slot gtk-editable-interface-get-delegate :: <C-function-pointer>;
  pointer-type-name: <GtkEditableInterface>;
end C-struct;

define sealed domain make (singleton(<GtkEditableInterface>));
define sealed domain initialize (<GtkEditableInterface>);

define open C-subtype <GtkEditableLabel> (<GtkEditable>)
end C-subtype;

define C-pointer-type <GtkEditableLabel*> => <GtkEditableLabel>;

define sealed domain make (singleton(<GtkEditableLabel*>));
define sealed domain initialize (<GtkEditableLabel*>);

define inline-only C-function gtk-editable-label-new
  input parameter str_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_editable_label_new";
end;

define inline-only C-function gtk-editable-label-get-editing
  input parameter self :: <GtkEditableLabel>;
  result res :: <C-boolean>;
  c-name: "gtk_editable_label_get_editing";
end;

define inline-only C-function gtk-editable-label-start-editing
  input parameter self :: <GtkEditableLabel>;
  c-name: "gtk_editable_label_start_editing";
end;

define inline-only C-function gtk-editable-label-stop-editing
  input parameter self :: <GtkEditableLabel>;
  input parameter commit_ :: <C-boolean>;
  c-name: "gtk_editable_label_stop_editing";
end;

define C-struct <_GtkEditableLabelClass>
  constant sealed inline-only slot gtk-editable-label-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkEditableLabelClass>;
end C-struct;

define sealed domain make (singleton(<GtkEditableLabelClass>));
define sealed domain initialize (<GtkEditableLabelClass>);

define inline-only constant $gtk-editable-prop-text = 0;
define inline-only constant $gtk-editable-prop-cursor-position = 1;
define inline-only constant $gtk-editable-prop-selection-bound = 2;
define inline-only constant $gtk-editable-prop-editable = 3;
define inline-only constant $gtk-editable-prop-width-chars = 4;
define inline-only constant $gtk-editable-prop-max-width-chars = 5;
define inline-only constant $gtk-editable-prop-xalign = 6;
define inline-only constant $gtk-editable-prop-enable-undo = 7;
define inline-only constant $gtk-editable-num-properties = 8;
define constant <GtkEditableProperties> = <C-int>;
define C-pointer-type <GtkEditableProperties*> => <GtkEditableProperties>;

define open C-subtype <GtkEmojiChooser> (<GtkPopover>)
end C-subtype;

define C-pointer-type <GtkEmojiChooser*> => <GtkEmojiChooser>;

define sealed domain make (singleton(<GtkEmojiChooser*>));
define sealed domain initialize (<GtkEmojiChooser*>);

define inline-only C-function gtk-emoji-chooser-new
  result res :: <GtkWidget>;
  c-name: "gtk_emoji_chooser_new";
end;

define C-struct <_GtkEmojiChooserClass>
  pointer-type-name: <GtkEmojiChooserClass>;
end C-struct;

define sealed domain make (singleton(<GtkEmojiChooserClass>));
define sealed domain initialize (<GtkEmojiChooserClass>);

define open C-subtype <GtkEntry> (<GtkCellEditable>, <GtkEditable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkEntry*> => <GtkEntry>;

define sealed domain make (singleton(<GtkEntry*>));
define sealed domain initialize (<GtkEntry*>);

define inline-only C-function gtk-entry-new
  result res :: <GtkWidget>;
  c-name: "gtk_entry_new";
end;

define inline-only C-function gtk-entry-new-with-buffer
  input parameter buffer_ :: <GtkEntryBuffer>;
  result res :: <GtkWidget>;
  c-name: "gtk_entry_new_with_buffer";
end;

define inline-only C-function gtk-entry-get-activates-default
  input parameter self :: <GtkEntry>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_get_activates_default";
end;

define inline-only C-function gtk-entry-get-alignment
  input parameter self :: <GtkEntry>;
  result res :: <C-float>;
  c-name: "gtk_entry_get_alignment";
end;

define inline-only C-function gtk-entry-get-attributes
  input parameter self :: <GtkEntry>;
  result res :: <PangoAttrList>;
  c-name: "gtk_entry_get_attributes";
end;

define inline-only C-function gtk-entry-get-buffer
  input parameter self :: <GtkEntry>;
  result res :: <GtkEntryBuffer>;
  c-name: "gtk_entry_get_buffer";
end;

define inline-only C-function gtk-entry-get-completion
  input parameter self :: <GtkEntry>;
  result res :: <GtkEntryCompletion>;
  c-name: "gtk_entry_get_completion";
end;

define inline-only C-function gtk-entry-get-current-icon-drag-source
  input parameter self :: <GtkEntry>;
  result res :: <C-signed-int>;
  c-name: "gtk_entry_get_current_icon_drag_source";
end;

define inline-only C-function gtk-entry-get-extra-menu
  input parameter self :: <GtkEntry>;
  result res :: <GMenuModel>;
  c-name: "gtk_entry_get_extra_menu";
end;

define inline-only C-function gtk-entry-get-has-frame
  input parameter self :: <GtkEntry>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_get_has_frame";
end;

define inline-only C-function gtk-entry-get-icon-activatable
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_get_icon_activatable";
end;

define inline-only C-function gtk-entry-get-icon-area
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  input parameter icon_area_ :: <GdkRectangle>;
  c-name: "gtk_entry_get_icon_area";
end;

define inline-only C-function gtk-entry-get-icon-at-pos
  input parameter self :: <GtkEntry>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gtk_entry_get_icon_at_pos";
end;

define inline-only C-function gtk-entry-get-icon-gicon
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  result res :: <GIcon>;
  c-name: "gtk_entry_get_icon_gicon";
end;

define inline-only C-function gtk-entry-get-icon-name
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  result res :: <C-string>;
  c-name: "gtk_entry_get_icon_name";
end;

define inline-only C-function gtk-entry-get-icon-paintable
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  result res :: <GdkPaintable>;
  c-name: "gtk_entry_get_icon_paintable";
end;

define inline-only C-function gtk-entry-get-icon-sensitive
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_get_icon_sensitive";
end;

define inline-only C-function gtk-entry-get-icon-storage-type
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  result res :: <GtkImageType>;
  c-name: "gtk_entry_get_icon_storage_type";
end;

define inline-only C-function gtk-entry-get-icon-tooltip-markup
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  result res :: <C-string>;
  c-name: "gtk_entry_get_icon_tooltip_markup";
end;

define inline-only C-function gtk-entry-get-icon-tooltip-text
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  result res :: <C-string>;
  c-name: "gtk_entry_get_icon_tooltip_text";
end;

define inline-only C-function gtk-entry-get-input-hints
  input parameter self :: <GtkEntry>;
  result res :: <GtkInputHints>;
  c-name: "gtk_entry_get_input_hints";
end;

define inline-only C-function gtk-entry-get-input-purpose
  input parameter self :: <GtkEntry>;
  result res :: <GtkInputPurpose>;
  c-name: "gtk_entry_get_input_purpose";
end;

define inline-only C-function gtk-entry-get-invisible-char
  input parameter self :: <GtkEntry>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_entry_get_invisible_char";
end;

define inline-only C-function gtk-entry-get-max-length
  input parameter self :: <GtkEntry>;
  result res :: <C-signed-int>;
  c-name: "gtk_entry_get_max_length";
end;

define inline-only C-function gtk-entry-get-overwrite-mode
  input parameter self :: <GtkEntry>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_get_overwrite_mode";
end;

define inline-only C-function gtk-entry-get-placeholder-text
  input parameter self :: <GtkEntry>;
  result res :: <C-string>;
  c-name: "gtk_entry_get_placeholder_text";
end;

define inline-only C-function gtk-entry-get-progress-fraction
  input parameter self :: <GtkEntry>;
  result res :: <C-double>;
  c-name: "gtk_entry_get_progress_fraction";
end;

define inline-only C-function gtk-entry-get-progress-pulse-step
  input parameter self :: <GtkEntry>;
  result res :: <C-double>;
  c-name: "gtk_entry_get_progress_pulse_step";
end;

define inline-only C-function gtk-entry-get-tabs
  input parameter self :: <GtkEntry>;
  result res :: <PangoTabArray>;
  c-name: "gtk_entry_get_tabs";
end;

define inline-only C-function gtk-entry-get-text-length
  input parameter self :: <GtkEntry>;
  result res :: <C-unsigned-short>;
  c-name: "gtk_entry_get_text_length";
end;

define inline-only C-function gtk-entry-get-visibility
  input parameter self :: <GtkEntry>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_get_visibility";
end;

define inline-only C-function gtk-entry-grab-focus-without-selecting
  input parameter self :: <GtkEntry>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_grab_focus_without_selecting";
end;

define inline-only C-function gtk-entry-progress-pulse
  input parameter self :: <GtkEntry>;
  c-name: "gtk_entry_progress_pulse";
end;

define inline-only C-function gtk-entry-reset-im-context
  input parameter self :: <GtkEntry>;
  c-name: "gtk_entry_reset_im_context";
end;

define inline-only C-function gtk-entry-set-activates-default
  input parameter self :: <GtkEntry>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_entry_set_activates_default";
end;

define inline-only C-function gtk-entry-set-alignment
  input parameter self :: <GtkEntry>;
  input parameter xalign_ :: <C-float>;
  c-name: "gtk_entry_set_alignment";
end;

define inline-only C-function gtk-entry-set-attributes
  input parameter self :: <GtkEntry>;
  input parameter attrs_ :: <PangoAttrList>;
  c-name: "gtk_entry_set_attributes";
end;

define inline-only C-function gtk-entry-set-buffer
  input parameter self :: <GtkEntry>;
  input parameter buffer_ :: <GtkEntryBuffer>;
  c-name: "gtk_entry_set_buffer";
end;

define inline-only C-function gtk-entry-set-completion
  input parameter self :: <GtkEntry>;
  input parameter completion_ :: <GtkEntryCompletion>;
  c-name: "gtk_entry_set_completion";
end;

define inline-only C-function gtk-entry-set-extra-menu
  input parameter self :: <GtkEntry>;
  input parameter model_ :: <GMenuModel>;
  c-name: "gtk_entry_set_extra_menu";
end;

define inline-only C-function gtk-entry-set-has-frame
  input parameter self :: <GtkEntry>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_entry_set_has_frame";
end;

define inline-only C-function gtk-entry-set-icon-activatable
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  input parameter activatable_ :: <C-boolean>;
  c-name: "gtk_entry_set_icon_activatable";
end;

define inline-only C-function gtk-entry-set-icon-drag-source
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  input parameter provider_ :: <GdkContentProvider>;
  input parameter actions_ :: <GdkDragAction>;
  c-name: "gtk_entry_set_icon_drag_source";
end;

define inline-only C-function gtk-entry-set-icon-from-gicon
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  input parameter icon_ :: <GIcon>;
  c-name: "gtk_entry_set_icon_from_gicon";
end;

define inline-only C-function gtk-entry-set-icon-from-icon-name
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  input parameter icon_name_ :: <C-string>;
  c-name: "gtk_entry_set_icon_from_icon_name";
end;

define inline-only C-function gtk-entry-set-icon-from-paintable
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  input parameter paintable_ :: <GdkPaintable>;
  c-name: "gtk_entry_set_icon_from_paintable";
end;

define inline-only C-function gtk-entry-set-icon-sensitive
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  input parameter sensitive_ :: <C-boolean>;
  c-name: "gtk_entry_set_icon_sensitive";
end;

define inline-only C-function gtk-entry-set-icon-tooltip-markup
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  input parameter tooltip_ :: <C-string>;
  c-name: "gtk_entry_set_icon_tooltip_markup";
end;

define inline-only C-function gtk-entry-set-icon-tooltip-text
  input parameter self :: <GtkEntry>;
  input parameter icon_pos_ :: <GtkEntryIconPosition>;
  input parameter tooltip_ :: <C-string>;
  c-name: "gtk_entry_set_icon_tooltip_text";
end;

define inline-only C-function gtk-entry-set-input-hints
  input parameter self :: <GtkEntry>;
  input parameter hints_ :: <GtkInputHints>;
  c-name: "gtk_entry_set_input_hints";
end;

define inline-only C-function gtk-entry-set-input-purpose
  input parameter self :: <GtkEntry>;
  input parameter purpose_ :: <GtkInputPurpose>;
  c-name: "gtk_entry_set_input_purpose";
end;

define inline-only C-function gtk-entry-set-invisible-char
  input parameter self :: <GtkEntry>;
  input parameter ch_ :: <C-unsigned-int>;
  c-name: "gtk_entry_set_invisible_char";
end;

define inline-only C-function gtk-entry-set-max-length
  input parameter self :: <GtkEntry>;
  input parameter max_ :: <C-signed-int>;
  c-name: "gtk_entry_set_max_length";
end;

define inline-only C-function gtk-entry-set-overwrite-mode
  input parameter self :: <GtkEntry>;
  input parameter overwrite_ :: <C-boolean>;
  c-name: "gtk_entry_set_overwrite_mode";
end;

define inline-only C-function gtk-entry-set-placeholder-text
  input parameter self :: <GtkEntry>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_entry_set_placeholder_text";
end;

define inline-only C-function gtk-entry-set-progress-fraction
  input parameter self :: <GtkEntry>;
  input parameter fraction_ :: <C-double>;
  c-name: "gtk_entry_set_progress_fraction";
end;

define inline-only C-function gtk-entry-set-progress-pulse-step
  input parameter self :: <GtkEntry>;
  input parameter fraction_ :: <C-double>;
  c-name: "gtk_entry_set_progress_pulse_step";
end;

define inline-only C-function gtk-entry-set-tabs
  input parameter self :: <GtkEntry>;
  input parameter tabs_ :: <PangoTabArray>;
  c-name: "gtk_entry_set_tabs";
end;

define inline-only C-function gtk-entry-set-visibility
  input parameter self :: <GtkEntry>;
  input parameter visible_ :: <C-boolean>;
  c-name: "gtk_entry_set_visibility";
end;

define inline-only C-function gtk-entry-unset-invisible-char
  input parameter self :: <GtkEntry>;
  c-name: "gtk_entry_unset_invisible_char";
end;

define open C-subtype <GtkEntryBuffer> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkEntryBuffer*> => <GtkEntryBuffer>;

define sealed domain make (singleton(<GtkEntryBuffer*>));
define sealed domain initialize (<GtkEntryBuffer*>);

define inline-only C-function gtk-entry-buffer-new
  input parameter initial_chars_ :: <C-string>;
  input parameter n_initial_chars_ :: <C-signed-int>;
  result res :: <GtkEntryBuffer>;
  c-name: "gtk_entry_buffer_new";
end;

define inline-only C-function gtk-entry-buffer-delete-text
  input parameter self :: <GtkEntryBuffer>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter n_chars_ :: <C-signed-int>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_entry_buffer_delete_text";
end;

define inline-only C-function gtk-entry-buffer-emit-deleted-text
  input parameter self :: <GtkEntryBuffer>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter n_chars_ :: <C-unsigned-int>;
  c-name: "gtk_entry_buffer_emit_deleted_text";
end;

define inline-only C-function gtk-entry-buffer-emit-inserted-text
  input parameter self :: <GtkEntryBuffer>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter chars_ :: <C-string>;
  input parameter n_chars_ :: <C-unsigned-int>;
  c-name: "gtk_entry_buffer_emit_inserted_text";
end;

define inline-only C-function gtk-entry-buffer-get-bytes
  input parameter self :: <GtkEntryBuffer>;
  result res :: <C-unsigned-long>;
  c-name: "gtk_entry_buffer_get_bytes";
end;

define inline-only C-function gtk-entry-buffer-get-length
  input parameter self :: <GtkEntryBuffer>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_entry_buffer_get_length";
end;

define inline-only C-function gtk-entry-buffer-get-max-length
  input parameter self :: <GtkEntryBuffer>;
  result res :: <C-signed-int>;
  c-name: "gtk_entry_buffer_get_max_length";
end;

define inline-only C-function gtk-entry-buffer-get-text
  input parameter self :: <GtkEntryBuffer>;
  result res :: <C-string>;
  c-name: "gtk_entry_buffer_get_text";
end;

define inline-only C-function gtk-entry-buffer-insert-text
  input parameter self :: <GtkEntryBuffer>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter chars_ :: <C-string>;
  input parameter n_chars_ :: <C-signed-int>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_entry_buffer_insert_text";
end;

define inline-only C-function gtk-entry-buffer-set-max-length
  input parameter self :: <GtkEntryBuffer>;
  input parameter max_length_ :: <C-signed-int>;
  c-name: "gtk_entry_buffer_set_max_length";
end;

define inline-only C-function gtk-entry-buffer-set-text
  input parameter self :: <GtkEntryBuffer>;
  input parameter chars_ :: <C-string>;
  input parameter n_chars_ :: <C-signed-int>;
  c-name: "gtk_entry_buffer_set_text";
end;

define C-struct <_GtkEntryBufferClass>
  constant sealed inline-only slot gtk-entry-buffer-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-entry-buffer-class-inserted-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-entry-buffer-class-deleted-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-entry-buffer-class-get-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-entry-buffer-class-get-length :: <C-function-pointer>;
  constant sealed inline-only slot gtk-entry-buffer-class-insert-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-entry-buffer-class-delete-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-entry-buffer-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-entry-buffer-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-entry-buffer-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-entry-buffer-class-_gtk-reserved4 :: <C-void*>;
  constant sealed inline-only slot gtk-entry-buffer-class-_gtk-reserved5 :: <C-void*>;
  constant sealed inline-only slot gtk-entry-buffer-class-_gtk-reserved6 :: <C-void*>;
  constant sealed inline-only slot gtk-entry-buffer-class-_gtk-reserved7 :: <C-void*>;
  constant sealed inline-only slot gtk-entry-buffer-class-_gtk-reserved8 :: <C-void*>;
  pointer-type-name: <GtkEntryBufferClass>;
end C-struct;

define sealed domain make (singleton(<GtkEntryBufferClass>));
define sealed domain initialize (<GtkEntryBufferClass>);

define C-struct <_GtkEntryClass>
  constant sealed inline-only slot gtk-entry-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-entry-class-activate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-entry-class-padding :: <C-void*>;
  pointer-type-name: <GtkEntryClass>;
end C-struct;

define sealed domain make (singleton(<GtkEntryClass>));
define sealed domain initialize (<GtkEntryClass>);

define open C-subtype <GtkEntryCompletion> (<GObject>, <GtkBuildable>, <GtkCellLayout>)
end C-subtype;

define C-pointer-type <GtkEntryCompletion*> => <GtkEntryCompletion>;

define sealed domain make (singleton(<GtkEntryCompletion*>));
define sealed domain initialize (<GtkEntryCompletion*>);

define inline-only C-function gtk-entry-completion-new
  result res :: <GtkEntryCompletion>;
  c-name: "gtk_entry_completion_new";
end;

define inline-only C-function gtk-entry-completion-new-with-area
  input parameter area_ :: <GtkCellArea>;
  result res :: <GtkEntryCompletion>;
  c-name: "gtk_entry_completion_new_with_area";
end;

define inline-only C-function gtk-entry-completion-complete
  input parameter self :: <GtkEntryCompletion>;
  c-name: "gtk_entry_completion_complete";
end;

define inline-only C-function gtk-entry-completion-compute-prefix
  input parameter self :: <GtkEntryCompletion>;
  input parameter key_ :: <C-string>;
  result res :: <C-string>;
  c-name: "gtk_entry_completion_compute_prefix";
end;

define inline-only C-function gtk-entry-completion-get-completion-prefix
  input parameter self :: <GtkEntryCompletion>;
  result res :: <C-string>;
  c-name: "gtk_entry_completion_get_completion_prefix";
end;

define inline-only C-function gtk-entry-completion-get-entry
  input parameter self :: <GtkEntryCompletion>;
  result res :: <GtkWidget>;
  c-name: "gtk_entry_completion_get_entry";
end;

define inline-only C-function gtk-entry-completion-get-inline-completion
  input parameter self :: <GtkEntryCompletion>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_completion_get_inline_completion";
end;

define inline-only C-function gtk-entry-completion-get-inline-selection
  input parameter self :: <GtkEntryCompletion>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_completion_get_inline_selection";
end;

define inline-only C-function gtk-entry-completion-get-minimum-key-length
  input parameter self :: <GtkEntryCompletion>;
  result res :: <C-signed-int>;
  c-name: "gtk_entry_completion_get_minimum_key_length";
end;

define inline-only C-function gtk-entry-completion-get-model
  input parameter self :: <GtkEntryCompletion>;
  result res :: <GtkTreeModel>;
  c-name: "gtk_entry_completion_get_model";
end;

define inline-only C-function gtk-entry-completion-get-popup-completion
  input parameter self :: <GtkEntryCompletion>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_completion_get_popup_completion";
end;

define inline-only C-function gtk-entry-completion-get-popup-set-width
  input parameter self :: <GtkEntryCompletion>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_completion_get_popup_set_width";
end;

define inline-only C-function gtk-entry-completion-get-popup-single-match
  input parameter self :: <GtkEntryCompletion>;
  result res :: <C-boolean>;
  c-name: "gtk_entry_completion_get_popup_single_match";
end;

define inline-only C-function gtk-entry-completion-get-text-column
  input parameter self :: <GtkEntryCompletion>;
  result res :: <C-signed-int>;
  c-name: "gtk_entry_completion_get_text_column";
end;

define inline-only C-function gtk-entry-completion-insert-prefix
  input parameter self :: <GtkEntryCompletion>;
  c-name: "gtk_entry_completion_insert_prefix";
end;

define inline-only C-function gtk-entry-completion-set-inline-completion
  input parameter self :: <GtkEntryCompletion>;
  input parameter inline_completion_ :: <C-boolean>;
  c-name: "gtk_entry_completion_set_inline_completion";
end;

define inline-only C-function gtk-entry-completion-set-inline-selection
  input parameter self :: <GtkEntryCompletion>;
  input parameter inline_selection_ :: <C-boolean>;
  c-name: "gtk_entry_completion_set_inline_selection";
end;

define inline-only C-function gtk-entry-completion-set-match-func
  input parameter self :: <GtkEntryCompletion>;
  input parameter func_ :: <C-function-pointer>;
  input parameter func_data_ :: <C-void*>;
  input parameter func_notify_ :: <C-function-pointer>;
  c-name: "gtk_entry_completion_set_match_func";
end;

define inline-only C-function gtk-entry-completion-set-minimum-key-length
  input parameter self :: <GtkEntryCompletion>;
  input parameter length_ :: <C-signed-int>;
  c-name: "gtk_entry_completion_set_minimum_key_length";
end;

define inline-only C-function gtk-entry-completion-set-model
  input parameter self :: <GtkEntryCompletion>;
  input parameter model_ :: <GtkTreeModel>;
  c-name: "gtk_entry_completion_set_model";
end;

define inline-only C-function gtk-entry-completion-set-popup-completion
  input parameter self :: <GtkEntryCompletion>;
  input parameter popup_completion_ :: <C-boolean>;
  c-name: "gtk_entry_completion_set_popup_completion";
end;

define inline-only C-function gtk-entry-completion-set-popup-set-width
  input parameter self :: <GtkEntryCompletion>;
  input parameter popup_set_width_ :: <C-boolean>;
  c-name: "gtk_entry_completion_set_popup_set_width";
end;

define inline-only C-function gtk-entry-completion-set-popup-single-match
  input parameter self :: <GtkEntryCompletion>;
  input parameter popup_single_match_ :: <C-boolean>;
  c-name: "gtk_entry_completion_set_popup_single_match";
end;

define inline-only C-function gtk-entry-completion-set-text-column
  input parameter self :: <GtkEntryCompletion>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_entry_completion_set_text_column";
end;

define inline-only constant $gtk-entry-icon-primary = 0;
define inline-only constant $gtk-entry-icon-secondary = 1;
define constant <GtkEntryIconPosition> = <C-int>;
define C-pointer-type <GtkEntryIconPosition*> => <GtkEntryIconPosition>;

define open C-subtype <GtkEventController> (<GObject>)
end C-subtype;

define C-pointer-type <GtkEventController*> => <GtkEventController>;

define sealed domain make (singleton(<GtkEventController*>));
define sealed domain initialize (<GtkEventController*>);

define inline-only C-function gtk-event-controller-get-current-event
  input parameter self :: <GtkEventController>;
  result res :: <GdkEvent>;
  c-name: "gtk_event_controller_get_current_event";
end;

define inline-only C-function gtk-event-controller-get-current-event-device
  input parameter self :: <GtkEventController>;
  result res :: <GdkDevice>;
  c-name: "gtk_event_controller_get_current_event_device";
end;

define inline-only C-function gtk-event-controller-get-current-event-state
  input parameter self :: <GtkEventController>;
  result res :: <GdkModifierType>;
  c-name: "gtk_event_controller_get_current_event_state";
end;

define inline-only C-function gtk-event-controller-get-current-event-time
  input parameter self :: <GtkEventController>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_event_controller_get_current_event_time";
end;

define inline-only C-function gtk-event-controller-get-name
  input parameter self :: <GtkEventController>;
  result res :: <C-string>;
  c-name: "gtk_event_controller_get_name";
end;

define inline-only C-function gtk-event-controller-get-propagation-limit
  input parameter self :: <GtkEventController>;
  result res :: <GtkPropagationLimit>;
  c-name: "gtk_event_controller_get_propagation_limit";
end;

define inline-only C-function gtk-event-controller-get-propagation-phase
  input parameter self :: <GtkEventController>;
  result res :: <GtkPropagationPhase>;
  c-name: "gtk_event_controller_get_propagation_phase";
end;

define inline-only C-function gtk-event-controller-get-widget
  input parameter self :: <GtkEventController>;
  result res :: <GtkWidget>;
  c-name: "gtk_event_controller_get_widget";
end;

define inline-only C-function gtk-event-controller-reset
  input parameter self :: <GtkEventController>;
  c-name: "gtk_event_controller_reset";
end;

define inline-only C-function gtk-event-controller-set-name
  input parameter self :: <GtkEventController>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_event_controller_set_name";
end;

define inline-only C-function gtk-event-controller-set-propagation-limit
  input parameter self :: <GtkEventController>;
  input parameter limit_ :: <GtkPropagationLimit>;
  c-name: "gtk_event_controller_set_propagation_limit";
end;

define inline-only C-function gtk-event-controller-set-propagation-phase
  input parameter self :: <GtkEventController>;
  input parameter phase_ :: <GtkPropagationPhase>;
  c-name: "gtk_event_controller_set_propagation_phase";
end;

define inline-only C-function gtk-event-controller-set-static-name
  input parameter self :: <GtkEventController>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_event_controller_set_static_name";
end;

define C-struct <_GtkEventControllerClass>
  pointer-type-name: <GtkEventControllerClass>;
end C-struct;

define sealed domain make (singleton(<GtkEventControllerClass>));
define sealed domain initialize (<GtkEventControllerClass>);

define open C-subtype <GtkEventControllerFocus> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkEventControllerFocus*> => <GtkEventControllerFocus>;

define sealed domain make (singleton(<GtkEventControllerFocus*>));
define sealed domain initialize (<GtkEventControllerFocus*>);

define inline-only C-function gtk-event-controller-focus-new
  result res :: <GtkEventController>;
  c-name: "gtk_event_controller_focus_new";
end;

define inline-only C-function gtk-event-controller-focus-contains-focus
  input parameter self :: <GtkEventControllerFocus>;
  result res :: <C-boolean>;
  c-name: "gtk_event_controller_focus_contains_focus";
end;

define inline-only C-function gtk-event-controller-focus-is-focus
  input parameter self :: <GtkEventControllerFocus>;
  result res :: <C-boolean>;
  c-name: "gtk_event_controller_focus_is_focus";
end;

define C-struct <_GtkEventControllerFocusClass>
  pointer-type-name: <GtkEventControllerFocusClass>;
end C-struct;

define sealed domain make (singleton(<GtkEventControllerFocusClass>));
define sealed domain initialize (<GtkEventControllerFocusClass>);

define open C-subtype <GtkEventControllerKey> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkEventControllerKey*> => <GtkEventControllerKey>;

define sealed domain make (singleton(<GtkEventControllerKey*>));
define sealed domain initialize (<GtkEventControllerKey*>);

define inline-only C-function gtk-event-controller-key-new
  result res :: <GtkEventController>;
  c-name: "gtk_event_controller_key_new";
end;

define inline-only C-function gtk-event-controller-key-forward
  input parameter self :: <GtkEventControllerKey>;
  input parameter widget_ :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_event_controller_key_forward";
end;

define inline-only C-function gtk-event-controller-key-get-group
  input parameter self :: <GtkEventControllerKey>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_event_controller_key_get_group";
end;

define inline-only C-function gtk-event-controller-key-get-im-context
  input parameter self :: <GtkEventControllerKey>;
  result res :: <GtkIMContext>;
  c-name: "gtk_event_controller_key_get_im_context";
end;

define inline-only C-function gtk-event-controller-key-set-im-context
  input parameter self :: <GtkEventControllerKey>;
  input parameter im_context_ :: <GtkIMContext>;
  c-name: "gtk_event_controller_key_set_im_context";
end;

define C-struct <_GtkEventControllerKeyClass>
  pointer-type-name: <GtkEventControllerKeyClass>;
end C-struct;

define sealed domain make (singleton(<GtkEventControllerKeyClass>));
define sealed domain initialize (<GtkEventControllerKeyClass>);

define open C-subtype <GtkEventControllerLegacy> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkEventControllerLegacy*> => <GtkEventControllerLegacy>;

define sealed domain make (singleton(<GtkEventControllerLegacy*>));
define sealed domain initialize (<GtkEventControllerLegacy*>);

define inline-only C-function gtk-event-controller-legacy-new
  result res :: <GtkEventController>;
  c-name: "gtk_event_controller_legacy_new";
end;

define C-struct <_GtkEventControllerLegacyClass>
  pointer-type-name: <GtkEventControllerLegacyClass>;
end C-struct;

define sealed domain make (singleton(<GtkEventControllerLegacyClass>));
define sealed domain initialize (<GtkEventControllerLegacyClass>);

define open C-subtype <GtkEventControllerMotion> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkEventControllerMotion*> => <GtkEventControllerMotion>;

define sealed domain make (singleton(<GtkEventControllerMotion*>));
define sealed domain initialize (<GtkEventControllerMotion*>);

define inline-only C-function gtk-event-controller-motion-new
  result res :: <GtkEventController>;
  c-name: "gtk_event_controller_motion_new";
end;

define inline-only C-function gtk-event-controller-motion-contains-pointer
  input parameter self :: <GtkEventControllerMotion>;
  result res :: <C-boolean>;
  c-name: "gtk_event_controller_motion_contains_pointer";
end;

define inline-only C-function gtk-event-controller-motion-is-pointer
  input parameter self :: <GtkEventControllerMotion>;
  result res :: <C-boolean>;
  c-name: "gtk_event_controller_motion_is_pointer";
end;

define C-struct <_GtkEventControllerMotionClass>
  pointer-type-name: <GtkEventControllerMotionClass>;
end C-struct;

define sealed domain make (singleton(<GtkEventControllerMotionClass>));
define sealed domain initialize (<GtkEventControllerMotionClass>);

define open C-subtype <GtkEventControllerScroll> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkEventControllerScroll*> => <GtkEventControllerScroll>;

define sealed domain make (singleton(<GtkEventControllerScroll*>));
define sealed domain initialize (<GtkEventControllerScroll*>);

define inline-only C-function gtk-event-controller-scroll-new
  input parameter flags_ :: <GtkEventControllerScrollFlags>;
  result res :: <GtkEventController>;
  c-name: "gtk_event_controller_scroll_new";
end;

define inline-only C-function gtk-event-controller-scroll-get-flags
  input parameter self :: <GtkEventControllerScroll>;
  result res :: <GtkEventControllerScrollFlags>;
  c-name: "gtk_event_controller_scroll_get_flags";
end;

define inline-only C-function gtk-event-controller-scroll-get-unit
  input parameter self :: <GtkEventControllerScroll>;
  result res :: <GdkScrollUnit>;
  c-name: "gtk_event_controller_scroll_get_unit";
end;

define inline-only C-function gtk-event-controller-scroll-set-flags
  input parameter self :: <GtkEventControllerScroll>;
  input parameter flags_ :: <GtkEventControllerScrollFlags>;
  c-name: "gtk_event_controller_scroll_set_flags";
end;

define C-struct <_GtkEventControllerScrollClass>
  pointer-type-name: <GtkEventControllerScrollClass>;
end C-struct;

define sealed domain make (singleton(<GtkEventControllerScrollClass>));
define sealed domain initialize (<GtkEventControllerScrollClass>);

define inline-only constant $gtk-event-controller-scroll-none = 0;
define inline-only constant $gtk-event-controller-scroll-vertical = 1;
define inline-only constant $gtk-event-controller-scroll-horizontal = 2;
define inline-only constant $gtk-event-controller-scroll-discrete = 4;
define inline-only constant $gtk-event-controller-scroll-kinetic = 8;
define inline-only constant $gtk-event-controller-scroll-both-axes = 3;
define constant <GtkEventControllerScrollFlags> = <C-int>;
define C-pointer-type <GtkEventControllerScrollFlags*> => <GtkEventControllerScrollFlags>;

define inline-only constant $gtk-event-sequence-none = 0;
define inline-only constant $gtk-event-sequence-claimed = 1;
define inline-only constant $gtk-event-sequence-denied = 2;
define constant <GtkEventSequenceState> = <C-int>;
define C-pointer-type <GtkEventSequenceState*> => <GtkEventSequenceState>;

define open C-subtype <GtkEveryFilter> (<GtkMultiFilter>)
end C-subtype;

define C-pointer-type <GtkEveryFilter*> => <GtkEveryFilter>;

define sealed domain make (singleton(<GtkEveryFilter*>));
define sealed domain initialize (<GtkEveryFilter*>);

define inline-only C-function gtk-every-filter-new
  result res :: <GtkEveryFilter>;
  c-name: "gtk_every_filter_new";
end;

define C-struct <_GtkEveryFilterClass>
  pointer-type-name: <GtkEveryFilterClass>;
end C-struct;

define sealed domain make (singleton(<GtkEveryFilterClass>));
define sealed domain initialize (<GtkEveryFilterClass>);

define open C-subtype <GtkExpander> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkExpander*> => <GtkExpander>;

define sealed domain make (singleton(<GtkExpander*>));
define sealed domain initialize (<GtkExpander*>);

define inline-only C-function gtk-expander-new
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_expander_new";
end;

define inline-only C-function gtk-expander-new-with-mnemonic
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_expander_new_with_mnemonic";
end;

define inline-only C-function gtk-expander-get-child
  input parameter self :: <GtkExpander>;
  result res :: <GtkWidget>;
  c-name: "gtk_expander_get_child";
end;

define inline-only C-function gtk-expander-get-expanded
  input parameter self :: <GtkExpander>;
  result res :: <C-boolean>;
  c-name: "gtk_expander_get_expanded";
end;

define inline-only C-function gtk-expander-get-label
  input parameter self :: <GtkExpander>;
  result res :: <C-string>;
  c-name: "gtk_expander_get_label";
end;

define inline-only C-function gtk-expander-get-label-widget
  input parameter self :: <GtkExpander>;
  result res :: <GtkWidget>;
  c-name: "gtk_expander_get_label_widget";
end;

define inline-only C-function gtk-expander-get-resize-toplevel
  input parameter self :: <GtkExpander>;
  result res :: <C-boolean>;
  c-name: "gtk_expander_get_resize_toplevel";
end;

define inline-only C-function gtk-expander-get-use-markup
  input parameter self :: <GtkExpander>;
  result res :: <C-boolean>;
  c-name: "gtk_expander_get_use_markup";
end;

define inline-only C-function gtk-expander-get-use-underline
  input parameter self :: <GtkExpander>;
  result res :: <C-boolean>;
  c-name: "gtk_expander_get_use_underline";
end;

define inline-only C-function gtk-expander-set-child
  input parameter self :: <GtkExpander>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_expander_set_child";
end;

define inline-only C-function gtk-expander-set-expanded
  input parameter self :: <GtkExpander>;
  input parameter expanded_ :: <C-boolean>;
  c-name: "gtk_expander_set_expanded";
end;

define inline-only C-function gtk-expander-set-label
  input parameter self :: <GtkExpander>;
  input parameter label_ :: <C-string>;
  c-name: "gtk_expander_set_label";
end;

define inline-only C-function gtk-expander-set-label-widget
  input parameter self :: <GtkExpander>;
  input parameter label_widget_ :: <GtkWidget>;
  c-name: "gtk_expander_set_label_widget";
end;

define inline-only C-function gtk-expander-set-resize-toplevel
  input parameter self :: <GtkExpander>;
  input parameter resize_toplevel_ :: <C-boolean>;
  c-name: "gtk_expander_set_resize_toplevel";
end;

define inline-only C-function gtk-expander-set-use-markup
  input parameter self :: <GtkExpander>;
  input parameter use_markup_ :: <C-boolean>;
  c-name: "gtk_expander_set_use_markup";
end;

define inline-only C-function gtk-expander-set-use-underline
  input parameter self :: <GtkExpander>;
  input parameter use_underline_ :: <C-boolean>;
  c-name: "gtk_expander_set_use_underline";
end;

define open C-subtype <GtkExpression> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkExpression*> => <GtkExpression>;

define sealed domain make (singleton(<GtkExpression*>));
define sealed domain initialize (<GtkExpression*>);

define inline-only C-function gtk-expression-bind
  input parameter self :: <GtkExpression>;
  input parameter target_ :: <GObject>;
  input parameter property_ :: <C-string>;
  input parameter this__ :: <GObject>;
  result res :: <GtkExpressionWatch>;
  c-name: "gtk_expression_bind";
end;

define inline-only C-function gtk-expression-evaluate
  input parameter self :: <GtkExpression>;
  input parameter this__ :: <GObject>;
  input parameter value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "gtk_expression_evaluate";
end;

define inline-only C-function gtk-expression-get-value-type
  input parameter self :: <GtkExpression>;
  result res :: <C-long>;
  c-name: "gtk_expression_get_value_type";
end;

define inline-only C-function gtk-expression-is-static
  input parameter self :: <GtkExpression>;
  result res :: <C-boolean>;
  c-name: "gtk_expression_is_static";
end;

define inline-only C-function gtk-expression-ref
  input parameter self :: <GtkExpression>;
  result res :: <GtkExpression>;
  c-name: "gtk_expression_ref";
end;

define inline-only C-function gtk-expression-unref
  input parameter self :: <GtkExpression>;
  c-name: "gtk_expression_unref";
end;

define inline-only C-function gtk-expression-watch
  input parameter self :: <GtkExpression>;
  input parameter this__ :: <GObject>;
  input parameter notify_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_destroy_ :: <C-function-pointer>;
  result res :: <GtkExpressionWatch>;
  c-name: "gtk_expression_watch";
end;

define C-struct <_GtkExpressionWatch>
  pointer-type-name: <GtkExpressionWatch>;
end C-struct;

define sealed domain make (singleton(<GtkExpressionWatch>));
define sealed domain initialize (<GtkExpressionWatch>);

define inline-only C-function gtk-expression-watch-evaluate
  input parameter self :: <GtkExpressionWatch>;
  input parameter value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "gtk_expression_watch_evaluate";
end;

define inline-only C-function gtk-expression-watch-ref
  input parameter self :: <GtkExpressionWatch>;
  result res :: <GtkExpressionWatch>;
  c-name: "gtk_expression_watch_ref";
end;

define inline-only C-function gtk-expression-watch-unref
  input parameter self :: <GtkExpressionWatch>;
  c-name: "gtk_expression_watch_unref";
end;

define inline-only C-function gtk-expression-watch-unwatch
  input parameter self :: <GtkExpressionWatch>;
  c-name: "gtk_expression_watch_unwatch";
end;

// Interface
define open C-subtype <GtkFileChooser> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkFileChooser*> => <GtkFileChooser>;

define sealed domain make (singleton(<GtkFileChooser*>));
define sealed domain initialize (<GtkFileChooser*>);

define inline-only C-function gtk-file-chooser-add-choice
  input parameter self :: <GtkFileChooser>;
  input parameter id_ :: <C-string>;
  input parameter label_ :: <C-string>;
  input parameter options_ :: <C-string*>;
  input parameter option_labels_ :: <C-string*>;
  c-name: "gtk_file_chooser_add_choice";
end;

define inline-only C-function gtk-file-chooser-add-filter
  input parameter self :: <GtkFileChooser>;
  input parameter filter_ :: <GtkFileFilter>;
  c-name: "gtk_file_chooser_add_filter";
end;

define inline-only C-function gtk-file-chooser-add-shortcut-folder
  input parameter self :: <GtkFileChooser>;
  input parameter folder_ :: <GFile>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_file_chooser_add_shortcut_folder";
end;

define inline-only C-function gtk-file-chooser-get-action
  input parameter self :: <GtkFileChooser>;
  result res :: <GtkFileChooserAction>;
  c-name: "gtk_file_chooser_get_action";
end;

define inline-only C-function gtk-file-chooser-get-choice
  input parameter self :: <GtkFileChooser>;
  input parameter id_ :: <C-string>;
  result res :: <C-string>;
  c-name: "gtk_file_chooser_get_choice";
end;

define inline-only C-function gtk-file-chooser-get-create-folders
  input parameter self :: <GtkFileChooser>;
  result res :: <C-boolean>;
  c-name: "gtk_file_chooser_get_create_folders";
end;

define inline-only C-function gtk-file-chooser-get-current-folder
  input parameter self :: <GtkFileChooser>;
  result res :: <GFile>;
  c-name: "gtk_file_chooser_get_current_folder";
end;

define inline-only C-function gtk-file-chooser-get-current-name
  input parameter self :: <GtkFileChooser>;
  result res :: <C-string>;
  c-name: "gtk_file_chooser_get_current_name";
end;

define inline-only C-function gtk-file-chooser-get-file
  input parameter self :: <GtkFileChooser>;
  result res :: <GFile>;
  c-name: "gtk_file_chooser_get_file";
end;

define inline-only C-function gtk-file-chooser-get-files
  input parameter self :: <GtkFileChooser>;
  result res :: <GListModel>;
  c-name: "gtk_file_chooser_get_files";
end;

define inline-only C-function gtk-file-chooser-get-filter
  input parameter self :: <GtkFileChooser>;
  result res :: <GtkFileFilter>;
  c-name: "gtk_file_chooser_get_filter";
end;

define inline-only C-function gtk-file-chooser-get-filters
  input parameter self :: <GtkFileChooser>;
  result res :: <GListModel>;
  c-name: "gtk_file_chooser_get_filters";
end;

define inline-only C-function gtk-file-chooser-get-select-multiple
  input parameter self :: <GtkFileChooser>;
  result res :: <C-boolean>;
  c-name: "gtk_file_chooser_get_select_multiple";
end;

define inline-only C-function gtk-file-chooser-get-shortcut-folders
  input parameter self :: <GtkFileChooser>;
  result res :: <GListModel>;
  c-name: "gtk_file_chooser_get_shortcut_folders";
end;

define inline-only C-function gtk-file-chooser-remove-choice
  input parameter self :: <GtkFileChooser>;
  input parameter id_ :: <C-string>;
  c-name: "gtk_file_chooser_remove_choice";
end;

define inline-only C-function gtk-file-chooser-remove-filter
  input parameter self :: <GtkFileChooser>;
  input parameter filter_ :: <GtkFileFilter>;
  c-name: "gtk_file_chooser_remove_filter";
end;

define inline-only C-function gtk-file-chooser-remove-shortcut-folder
  input parameter self :: <GtkFileChooser>;
  input parameter folder_ :: <GFile>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_file_chooser_remove_shortcut_folder";
end;

define inline-only C-function gtk-file-chooser-set-action
  input parameter self :: <GtkFileChooser>;
  input parameter action_ :: <GtkFileChooserAction>;
  c-name: "gtk_file_chooser_set_action";
end;

define inline-only C-function gtk-file-chooser-set-choice
  input parameter self :: <GtkFileChooser>;
  input parameter id_ :: <C-string>;
  input parameter option_ :: <C-string>;
  c-name: "gtk_file_chooser_set_choice";
end;

define inline-only C-function gtk-file-chooser-set-create-folders
  input parameter self :: <GtkFileChooser>;
  input parameter create_folders_ :: <C-boolean>;
  c-name: "gtk_file_chooser_set_create_folders";
end;

define inline-only C-function gtk-file-chooser-set-current-folder
  input parameter self :: <GtkFileChooser>;
  input parameter file_ :: <GFile>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_file_chooser_set_current_folder";
end;

define inline-only C-function gtk-file-chooser-set-current-name
  input parameter self :: <GtkFileChooser>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_file_chooser_set_current_name";
end;

define inline-only C-function gtk-file-chooser-set-file
  input parameter self :: <GtkFileChooser>;
  input parameter file_ :: <GFile>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_file_chooser_set_file";
end;

define inline-only C-function gtk-file-chooser-set-filter
  input parameter self :: <GtkFileChooser>;
  input parameter filter_ :: <GtkFileFilter>;
  c-name: "gtk_file_chooser_set_filter";
end;

define inline-only C-function gtk-file-chooser-set-select-multiple
  input parameter self :: <GtkFileChooser>;
  input parameter select_multiple_ :: <C-boolean>;
  c-name: "gtk_file_chooser_set_select_multiple";
end;

define inline-only constant $gtk-file-chooser-action-open = 0;
define inline-only constant $gtk-file-chooser-action-save = 1;
define inline-only constant $gtk-file-chooser-action-select-folder = 2;
define constant <GtkFileChooserAction> = <C-int>;
define C-pointer-type <GtkFileChooserAction*> => <GtkFileChooserAction>;

define open C-subtype <GtkFileChooserDialog> (<GtkDialog>, <GtkFileChooser>)
end C-subtype;

define C-pointer-type <GtkFileChooserDialog*> => <GtkFileChooserDialog>;

define sealed domain make (singleton(<GtkFileChooserDialog*>));
define sealed domain initialize (<GtkFileChooserDialog*>);

define inline-only constant $gtk-file-chooser-error-nonexistent = 0;
define inline-only constant $gtk-file-chooser-error-bad-filename = 1;
define inline-only constant $gtk-file-chooser-error-already-exists = 2;
define inline-only constant $gtk-file-chooser-error-incomplete-hostname = 3;
define constant <GtkFileChooserError> = <C-int>;
define C-pointer-type <GtkFileChooserError*> => <GtkFileChooserError>;

define open C-subtype <GtkFileChooserNative> (<GtkNativeDialog>, <GtkFileChooser>)
end C-subtype;

define C-pointer-type <GtkFileChooserNative*> => <GtkFileChooserNative>;

define sealed domain make (singleton(<GtkFileChooserNative*>));
define sealed domain initialize (<GtkFileChooserNative*>);

define inline-only C-function gtk-file-chooser-native-new
  input parameter title_ :: <C-string>;
  input parameter parent_ :: <GtkWindow>;
  input parameter action_ :: <GtkFileChooserAction>;
  input parameter accept_label_ :: <C-string>;
  input parameter cancel_label_ :: <C-string>;
  result res :: <GtkFileChooserNative>;
  c-name: "gtk_file_chooser_native_new";
end;

define inline-only C-function gtk-file-chooser-native-get-accept-label
  input parameter self :: <GtkFileChooserNative>;
  result res :: <C-string>;
  c-name: "gtk_file_chooser_native_get_accept_label";
end;

define inline-only C-function gtk-file-chooser-native-get-cancel-label
  input parameter self :: <GtkFileChooserNative>;
  result res :: <C-string>;
  c-name: "gtk_file_chooser_native_get_cancel_label";
end;

define inline-only C-function gtk-file-chooser-native-set-accept-label
  input parameter self :: <GtkFileChooserNative>;
  input parameter accept_label_ :: <C-string>;
  c-name: "gtk_file_chooser_native_set_accept_label";
end;

define inline-only C-function gtk-file-chooser-native-set-cancel-label
  input parameter self :: <GtkFileChooserNative>;
  input parameter cancel_label_ :: <C-string>;
  c-name: "gtk_file_chooser_native_set_cancel_label";
end;

define C-struct <_GtkFileChooserNativeClass>
  constant sealed inline-only slot gtk-file-chooser-native-class-parent-class :: <GtkNativeDialogClass>;
  pointer-type-name: <GtkFileChooserNativeClass>;
end C-struct;

define sealed domain make (singleton(<GtkFileChooserNativeClass>));
define sealed domain initialize (<GtkFileChooserNativeClass>);

define open C-subtype <GtkFileChooserWidget> (<GtkWidget>, <GtkFileChooser>)
end C-subtype;

define C-pointer-type <GtkFileChooserWidget*> => <GtkFileChooserWidget>;

define sealed domain make (singleton(<GtkFileChooserWidget*>));
define sealed domain initialize (<GtkFileChooserWidget*>);

define inline-only C-function gtk-file-chooser-widget-new
  input parameter action_ :: <GtkFileChooserAction>;
  result res :: <GtkWidget>;
  c-name: "gtk_file_chooser_widget_new";
end;

define open C-subtype <GtkFileFilter> (<GtkFilter>, <GtkBuildable>)
end C-subtype;

define C-pointer-type <GtkFileFilter*> => <GtkFileFilter>;

define sealed domain make (singleton(<GtkFileFilter*>));
define sealed domain initialize (<GtkFileFilter*>);

define inline-only C-function gtk-file-filter-new
  result res :: <GtkFileFilter>;
  c-name: "gtk_file_filter_new";
end;

define inline-only C-function gtk-file-filter-new-from-gvariant
  input parameter variant_ :: <GVariant>;
  result res :: <GtkFileFilter>;
  c-name: "gtk_file_filter_new_from_gvariant";
end;

define inline-only C-function gtk-file-filter-add-mime-type
  input parameter self :: <GtkFileFilter>;
  input parameter mime_type_ :: <C-string>;
  c-name: "gtk_file_filter_add_mime_type";
end;

define inline-only C-function gtk-file-filter-add-pattern
  input parameter self :: <GtkFileFilter>;
  input parameter pattern_ :: <C-string>;
  c-name: "gtk_file_filter_add_pattern";
end;

define inline-only C-function gtk-file-filter-add-pixbuf-formats
  input parameter self :: <GtkFileFilter>;
  c-name: "gtk_file_filter_add_pixbuf_formats";
end;

define inline-only C-function gtk-file-filter-add-suffix
  input parameter self :: <GtkFileFilter>;
  input parameter suffix_ :: <C-string>;
  c-name: "gtk_file_filter_add_suffix";
end;

define inline-only C-function gtk-file-filter-get-attributes
  input parameter self :: <GtkFileFilter>;
  result res :: <C-string*>;
  c-name: "gtk_file_filter_get_attributes";
end;

define inline-only C-function gtk-file-filter-get-name
  input parameter self :: <GtkFileFilter>;
  result res :: <C-string>;
  c-name: "gtk_file_filter_get_name";
end;

define inline-only C-function gtk-file-filter-set-name
  input parameter self :: <GtkFileFilter>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_file_filter_set_name";
end;

define inline-only C-function gtk-file-filter-to-gvariant
  input parameter self :: <GtkFileFilter>;
  result res :: <GVariant>;
  c-name: "gtk_file_filter_to_gvariant";
end;

define open C-subtype <GtkFilter> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkFilter*> => <GtkFilter>;

define sealed domain make (singleton(<GtkFilter*>));
define sealed domain initialize (<GtkFilter*>);

define inline-only C-function gtk-filter-changed
  input parameter self :: <GtkFilter>;
  input parameter change_ :: <GtkFilterChange>;
  c-name: "gtk_filter_changed";
end;

define inline-only C-function gtk-filter-get-strictness
  input parameter self :: <GtkFilter>;
  result res :: <GtkFilterMatch>;
  c-name: "gtk_filter_get_strictness";
end;

define inline-only C-function gtk-filter-match
  input parameter self :: <GtkFilter>;
  input parameter item_ :: <GObject>;
  result res :: <C-boolean>;
  c-name: "gtk_filter_match";
end;

define inline-only constant $gtk-filter-change-different = 0;
define inline-only constant $gtk-filter-change-less-strict = 1;
define inline-only constant $gtk-filter-change-more-strict = 2;
define constant <GtkFilterChange> = <C-int>;
define C-pointer-type <GtkFilterChange*> => <GtkFilterChange>;

define C-struct <_GtkFilterClass>
  constant sealed inline-only slot gtk-filter-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-filter-class-match :: <C-function-pointer>;
  constant sealed inline-only slot gtk-filter-class-get-strictness :: <C-function-pointer>;
  constant sealed inline-only slot gtk-filter-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-filter-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-filter-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-filter-class-_gtk-reserved4 :: <C-void*>;
  constant sealed inline-only slot gtk-filter-class-_gtk-reserved5 :: <C-void*>;
  constant sealed inline-only slot gtk-filter-class-_gtk-reserved6 :: <C-void*>;
  constant sealed inline-only slot gtk-filter-class-_gtk-reserved7 :: <C-void*>;
  constant sealed inline-only slot gtk-filter-class-_gtk-reserved8 :: <C-void*>;
  pointer-type-name: <GtkFilterClass>;
end C-struct;

define sealed domain make (singleton(<GtkFilterClass>));
define sealed domain initialize (<GtkFilterClass>);

define open C-subtype <GtkFilterListModel> (<GObject>, <GListModel>)
end C-subtype;

define C-pointer-type <GtkFilterListModel*> => <GtkFilterListModel>;

define sealed domain make (singleton(<GtkFilterListModel*>));
define sealed domain initialize (<GtkFilterListModel*>);

define inline-only C-function gtk-filter-list-model-new
  input parameter model_ :: <GListModel>;
  input parameter filter_ :: <GtkFilter>;
  result res :: <GtkFilterListModel>;
  c-name: "gtk_filter_list_model_new";
end;

define inline-only C-function gtk-filter-list-model-get-filter
  input parameter self :: <GtkFilterListModel>;
  result res :: <GtkFilter>;
  c-name: "gtk_filter_list_model_get_filter";
end;

define inline-only C-function gtk-filter-list-model-get-incremental
  input parameter self :: <GtkFilterListModel>;
  result res :: <C-boolean>;
  c-name: "gtk_filter_list_model_get_incremental";
end;

define inline-only C-function gtk-filter-list-model-get-model
  input parameter self :: <GtkFilterListModel>;
  result res :: <GListModel>;
  c-name: "gtk_filter_list_model_get_model";
end;

define inline-only C-function gtk-filter-list-model-get-pending
  input parameter self :: <GtkFilterListModel>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_filter_list_model_get_pending";
end;

define inline-only C-function gtk-filter-list-model-set-filter
  input parameter self :: <GtkFilterListModel>;
  input parameter filter_ :: <GtkFilter>;
  c-name: "gtk_filter_list_model_set_filter";
end;

define inline-only C-function gtk-filter-list-model-set-incremental
  input parameter self :: <GtkFilterListModel>;
  input parameter incremental_ :: <C-boolean>;
  c-name: "gtk_filter_list_model_set_incremental";
end;

define inline-only C-function gtk-filter-list-model-set-model
  input parameter self :: <GtkFilterListModel>;
  input parameter model_ :: <GListModel>;
  c-name: "gtk_filter_list_model_set_model";
end;

define C-struct <_GtkFilterListModelClass>
  constant sealed inline-only slot gtk-filter-list-model-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkFilterListModelClass>;
end C-struct;

define sealed domain make (singleton(<GtkFilterListModelClass>));
define sealed domain initialize (<GtkFilterListModelClass>);

define inline-only constant $gtk-filter-match-some = 0;
define inline-only constant $gtk-filter-match-none = 1;
define inline-only constant $gtk-filter-match-all = 2;
define constant <GtkFilterMatch> = <C-int>;
define C-pointer-type <GtkFilterMatch*> => <GtkFilterMatch>;

define open C-subtype <GtkFixed> (<GtkWidget>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkFixed*> => <GtkFixed>;

define sealed domain make (singleton(<GtkFixed*>));
define sealed domain initialize (<GtkFixed*>);

define inline-only C-function gtk-fixed-new
  result res :: <GtkWidget>;
  c-name: "gtk_fixed_new";
end;

define inline-only C-function gtk-fixed-get-child-position
  input parameter self :: <GtkFixed>;
  input parameter widget_ :: <GtkWidget>;
  output parameter x_ :: <C-double*>;
  output parameter y_ :: <C-double*>;
  c-name: "gtk_fixed_get_child_position";
end;

define inline-only C-function gtk-fixed-get-child-transform
  input parameter self :: <GtkFixed>;
  input parameter widget_ :: <GtkWidget>;
  result res :: <GskTransform>;
  c-name: "gtk_fixed_get_child_transform";
end;

define inline-only C-function gtk-fixed-move
  input parameter self :: <GtkFixed>;
  input parameter widget_ :: <GtkWidget>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  c-name: "gtk_fixed_move";
end;

define inline-only C-function gtk-fixed-put
  input parameter self :: <GtkFixed>;
  input parameter widget_ :: <GtkWidget>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  c-name: "gtk_fixed_put";
end;

define inline-only C-function gtk-fixed-remove
  input parameter self :: <GtkFixed>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_fixed_remove";
end;

define inline-only C-function gtk-fixed-set-child-transform
  input parameter self :: <GtkFixed>;
  input parameter widget_ :: <GtkWidget>;
  input parameter transform_ :: <GskTransform>;
  c-name: "gtk_fixed_set_child_transform";
end;

define C-struct <_GtkFixedClass>
  constant sealed inline-only slot gtk-fixed-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-fixed-class-padding :: <C-void*>;
  pointer-type-name: <GtkFixedClass>;
end C-struct;

define sealed domain make (singleton(<GtkFixedClass>));
define sealed domain initialize (<GtkFixedClass>);

define open C-subtype <GtkFixedLayout> (<GtkLayoutManager>)
end C-subtype;

define C-pointer-type <GtkFixedLayout*> => <GtkFixedLayout>;

define sealed domain make (singleton(<GtkFixedLayout*>));
define sealed domain initialize (<GtkFixedLayout*>);

define inline-only C-function gtk-fixed-layout-new
  result res :: <GtkLayoutManager>;
  c-name: "gtk_fixed_layout_new";
end;

define open C-subtype <GtkFixedLayoutChild> (<GtkLayoutChild>)
end C-subtype;

define C-pointer-type <GtkFixedLayoutChild*> => <GtkFixedLayoutChild>;

define sealed domain make (singleton(<GtkFixedLayoutChild*>));
define sealed domain initialize (<GtkFixedLayoutChild*>);

define inline-only C-function gtk-fixed-layout-child-get-transform
  input parameter self :: <GtkFixedLayoutChild>;
  result res :: <GskTransform>;
  c-name: "gtk_fixed_layout_child_get_transform";
end;

define inline-only C-function gtk-fixed-layout-child-set-transform
  input parameter self :: <GtkFixedLayoutChild>;
  input parameter transform_ :: <GskTransform>;
  c-name: "gtk_fixed_layout_child_set_transform";
end;

define C-struct <_GtkFixedLayoutChildClass>
  constant sealed inline-only slot gtk-fixed-layout-child-class-parent-class :: <GtkLayoutChildClass>;
  pointer-type-name: <GtkFixedLayoutChildClass>;
end C-struct;

define sealed domain make (singleton(<GtkFixedLayoutChildClass>));
define sealed domain initialize (<GtkFixedLayoutChildClass>);

define C-struct <_GtkFixedLayoutClass>
  constant sealed inline-only slot gtk-fixed-layout-class-parent-class :: <GtkLayoutManagerClass>;
  pointer-type-name: <GtkFixedLayoutClass>;
end C-struct;

define sealed domain make (singleton(<GtkFixedLayoutClass>));
define sealed domain initialize (<GtkFixedLayoutClass>);

define open C-subtype <GtkFlattenListModel> (<GObject>, <GListModel>)
end C-subtype;

define C-pointer-type <GtkFlattenListModel*> => <GtkFlattenListModel>;

define sealed domain make (singleton(<GtkFlattenListModel*>));
define sealed domain initialize (<GtkFlattenListModel*>);

define inline-only C-function gtk-flatten-list-model-new
  input parameter model_ :: <GListModel>;
  result res :: <GtkFlattenListModel>;
  c-name: "gtk_flatten_list_model_new";
end;

define inline-only C-function gtk-flatten-list-model-get-model
  input parameter self :: <GtkFlattenListModel>;
  result res :: <GListModel>;
  c-name: "gtk_flatten_list_model_get_model";
end;

define inline-only C-function gtk-flatten-list-model-get-model-for-item
  input parameter self :: <GtkFlattenListModel>;
  input parameter position_ :: <C-unsigned-int>;
  result res :: <GListModel>;
  c-name: "gtk_flatten_list_model_get_model_for_item";
end;

define inline-only C-function gtk-flatten-list-model-set-model
  input parameter self :: <GtkFlattenListModel>;
  input parameter model_ :: <GListModel>;
  c-name: "gtk_flatten_list_model_set_model";
end;

define C-struct <_GtkFlattenListModelClass>
  constant sealed inline-only slot gtk-flatten-list-model-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkFlattenListModelClass>;
end C-struct;

define sealed domain make (singleton(<GtkFlattenListModelClass>));
define sealed domain initialize (<GtkFlattenListModelClass>);

define open C-subtype <GtkFlowBox> (<GtkWidget>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkFlowBox*> => <GtkFlowBox>;

define sealed domain make (singleton(<GtkFlowBox*>));
define sealed domain initialize (<GtkFlowBox*>);

define inline-only C-function gtk-flow-box-new
  result res :: <GtkWidget>;
  c-name: "gtk_flow_box_new";
end;

define inline-only C-function gtk-flow-box-append
  input parameter self :: <GtkFlowBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_flow_box_append";
end;

define inline-only C-function gtk-flow-box-bind-model
  input parameter self :: <GtkFlowBox>;
  input parameter model_ :: <GListModel>;
  input parameter create_widget_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_data_free_func_ :: <C-function-pointer>;
  c-name: "gtk_flow_box_bind_model";
end;

define inline-only C-function gtk-flow-box-get-activate-on-single-click
  input parameter self :: <GtkFlowBox>;
  result res :: <C-boolean>;
  c-name: "gtk_flow_box_get_activate_on_single_click";
end;

define inline-only C-function gtk-flow-box-get-child-at-index
  input parameter self :: <GtkFlowBox>;
  input parameter idx_ :: <C-signed-int>;
  result res :: <GtkFlowBoxChild>;
  c-name: "gtk_flow_box_get_child_at_index";
end;

define inline-only C-function gtk-flow-box-get-child-at-pos
  input parameter self :: <GtkFlowBox>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  result res :: <GtkFlowBoxChild>;
  c-name: "gtk_flow_box_get_child_at_pos";
end;

define inline-only C-function gtk-flow-box-get-column-spacing
  input parameter self :: <GtkFlowBox>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_flow_box_get_column_spacing";
end;

define inline-only C-function gtk-flow-box-get-homogeneous
  input parameter self :: <GtkFlowBox>;
  result res :: <C-boolean>;
  c-name: "gtk_flow_box_get_homogeneous";
end;

define inline-only C-function gtk-flow-box-get-max-children-per-line
  input parameter self :: <GtkFlowBox>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_flow_box_get_max_children_per_line";
end;

define inline-only C-function gtk-flow-box-get-min-children-per-line
  input parameter self :: <GtkFlowBox>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_flow_box_get_min_children_per_line";
end;

define inline-only C-function gtk-flow-box-get-row-spacing
  input parameter self :: <GtkFlowBox>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_flow_box_get_row_spacing";
end;

define inline-only C-function gtk-flow-box-get-selected-children
  input parameter self :: <GtkFlowBox>;
  result res :: <GList>;
  c-name: "gtk_flow_box_get_selected_children";
end;

define inline-only C-function gtk-flow-box-get-selection-mode
  input parameter self :: <GtkFlowBox>;
  result res :: <GtkSelectionMode>;
  c-name: "gtk_flow_box_get_selection_mode";
end;

define inline-only C-function gtk-flow-box-insert
  input parameter self :: <GtkFlowBox>;
  input parameter widget_ :: <GtkWidget>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_flow_box_insert";
end;

define inline-only C-function gtk-flow-box-invalidate-filter
  input parameter self :: <GtkFlowBox>;
  c-name: "gtk_flow_box_invalidate_filter";
end;

define inline-only C-function gtk-flow-box-invalidate-sort
  input parameter self :: <GtkFlowBox>;
  c-name: "gtk_flow_box_invalidate_sort";
end;

define inline-only C-function gtk-flow-box-prepend
  input parameter self :: <GtkFlowBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_flow_box_prepend";
end;

define inline-only C-function gtk-flow-box-remove
  input parameter self :: <GtkFlowBox>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_flow_box_remove";
end;

define inline-only C-function gtk-flow-box-select-all
  input parameter self :: <GtkFlowBox>;
  c-name: "gtk_flow_box_select_all";
end;

define inline-only C-function gtk-flow-box-select-child
  input parameter self :: <GtkFlowBox>;
  input parameter child_ :: <GtkFlowBoxChild>;
  c-name: "gtk_flow_box_select_child";
end;

define inline-only C-function gtk-flow-box-selected-foreach
  input parameter self :: <GtkFlowBox>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  c-name: "gtk_flow_box_selected_foreach";
end;

define inline-only C-function gtk-flow-box-set-activate-on-single-click
  input parameter self :: <GtkFlowBox>;
  input parameter single_ :: <C-boolean>;
  c-name: "gtk_flow_box_set_activate_on_single_click";
end;

define inline-only C-function gtk-flow-box-set-column-spacing
  input parameter self :: <GtkFlowBox>;
  input parameter spacing_ :: <C-unsigned-int>;
  c-name: "gtk_flow_box_set_column_spacing";
end;

define inline-only C-function gtk-flow-box-set-filter-func
  input parameter self :: <GtkFlowBox>;
  input parameter filter_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_flow_box_set_filter_func";
end;

define inline-only C-function gtk-flow-box-set-hadjustment
  input parameter self :: <GtkFlowBox>;
  input parameter adjustment_ :: <GtkAdjustment>;
  c-name: "gtk_flow_box_set_hadjustment";
end;

define inline-only C-function gtk-flow-box-set-homogeneous
  input parameter self :: <GtkFlowBox>;
  input parameter homogeneous_ :: <C-boolean>;
  c-name: "gtk_flow_box_set_homogeneous";
end;

define inline-only C-function gtk-flow-box-set-max-children-per-line
  input parameter self :: <GtkFlowBox>;
  input parameter n_children_ :: <C-unsigned-int>;
  c-name: "gtk_flow_box_set_max_children_per_line";
end;

define inline-only C-function gtk-flow-box-set-min-children-per-line
  input parameter self :: <GtkFlowBox>;
  input parameter n_children_ :: <C-unsigned-int>;
  c-name: "gtk_flow_box_set_min_children_per_line";
end;

define inline-only C-function gtk-flow-box-set-row-spacing
  input parameter self :: <GtkFlowBox>;
  input parameter spacing_ :: <C-unsigned-int>;
  c-name: "gtk_flow_box_set_row_spacing";
end;

define inline-only C-function gtk-flow-box-set-selection-mode
  input parameter self :: <GtkFlowBox>;
  input parameter mode_ :: <GtkSelectionMode>;
  c-name: "gtk_flow_box_set_selection_mode";
end;

define inline-only C-function gtk-flow-box-set-sort-func
  input parameter self :: <GtkFlowBox>;
  input parameter sort_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_flow_box_set_sort_func";
end;

define inline-only C-function gtk-flow-box-set-vadjustment
  input parameter self :: <GtkFlowBox>;
  input parameter adjustment_ :: <GtkAdjustment>;
  c-name: "gtk_flow_box_set_vadjustment";
end;

define inline-only C-function gtk-flow-box-unselect-all
  input parameter self :: <GtkFlowBox>;
  c-name: "gtk_flow_box_unselect_all";
end;

define inline-only C-function gtk-flow-box-unselect-child
  input parameter self :: <GtkFlowBox>;
  input parameter child_ :: <GtkFlowBoxChild>;
  c-name: "gtk_flow_box_unselect_child";
end;

define open C-subtype <GtkFlowBoxChild> (<GtkWidget>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkFlowBoxChild*> => <GtkFlowBoxChild>;

define sealed domain make (singleton(<GtkFlowBoxChild*>));
define sealed domain initialize (<GtkFlowBoxChild*>);

define inline-only C-function gtk-flow-box-child-new
  result res :: <GtkWidget>;
  c-name: "gtk_flow_box_child_new";
end;

define inline-only C-function gtk-flow-box-child-changed
  input parameter self :: <GtkFlowBoxChild>;
  c-name: "gtk_flow_box_child_changed";
end;

define inline-only C-function gtk-flow-box-child-get-child
  input parameter self :: <GtkFlowBoxChild>;
  result res :: <GtkWidget>;
  c-name: "gtk_flow_box_child_get_child";
end;

define inline-only C-function gtk-flow-box-child-get-index
  input parameter self :: <GtkFlowBoxChild>;
  result res :: <C-signed-int>;
  c-name: "gtk_flow_box_child_get_index";
end;

define inline-only C-function gtk-flow-box-child-is-selected
  input parameter self :: <GtkFlowBoxChild>;
  result res :: <C-boolean>;
  c-name: "gtk_flow_box_child_is_selected";
end;

define inline-only C-function gtk-flow-box-child-set-child
  input parameter self :: <GtkFlowBoxChild>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_flow_box_child_set_child";
end;

define C-struct <_GtkFlowBoxChildClass>
  constant sealed inline-only slot gtk-flow-box-child-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-flow-box-child-class-activate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-flow-box-child-class-padding :: <C-void*>;
  pointer-type-name: <GtkFlowBoxChildClass>;
end C-struct;

define sealed domain make (singleton(<GtkFlowBoxChildClass>));
define sealed domain initialize (<GtkFlowBoxChildClass>);

define open C-subtype <GtkFontButton> (<GtkWidget>, <GtkFontChooser>)
end C-subtype;

define C-pointer-type <GtkFontButton*> => <GtkFontButton>;

define sealed domain make (singleton(<GtkFontButton*>));
define sealed domain initialize (<GtkFontButton*>);

define inline-only C-function gtk-font-button-new
  result res :: <GtkWidget>;
  c-name: "gtk_font_button_new";
end;

define inline-only C-function gtk-font-button-new-with-font
  input parameter fontname_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_font_button_new_with_font";
end;

define inline-only C-function gtk-font-button-get-modal
  input parameter self :: <GtkFontButton>;
  result res :: <C-boolean>;
  c-name: "gtk_font_button_get_modal";
end;

define inline-only C-function gtk-font-button-get-title
  input parameter self :: <GtkFontButton>;
  result res :: <C-string>;
  c-name: "gtk_font_button_get_title";
end;

define inline-only C-function gtk-font-button-get-use-font
  input parameter self :: <GtkFontButton>;
  result res :: <C-boolean>;
  c-name: "gtk_font_button_get_use_font";
end;

define inline-only C-function gtk-font-button-get-use-size
  input parameter self :: <GtkFontButton>;
  result res :: <C-boolean>;
  c-name: "gtk_font_button_get_use_size";
end;

define inline-only C-function gtk-font-button-set-modal
  input parameter self :: <GtkFontButton>;
  input parameter modal_ :: <C-boolean>;
  c-name: "gtk_font_button_set_modal";
end;

define inline-only C-function gtk-font-button-set-title
  input parameter self :: <GtkFontButton>;
  input parameter title_ :: <C-string>;
  c-name: "gtk_font_button_set_title";
end;

define inline-only C-function gtk-font-button-set-use-font
  input parameter self :: <GtkFontButton>;
  input parameter use_font_ :: <C-boolean>;
  c-name: "gtk_font_button_set_use_font";
end;

define inline-only C-function gtk-font-button-set-use-size
  input parameter self :: <GtkFontButton>;
  input parameter use_size_ :: <C-boolean>;
  c-name: "gtk_font_button_set_use_size";
end;

// Interface
define open C-subtype <GtkFontChooser> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkFontChooser*> => <GtkFontChooser>;

define sealed domain make (singleton(<GtkFontChooser*>));
define sealed domain initialize (<GtkFontChooser*>);

define inline-only C-function gtk-font-chooser-get-font
  input parameter self :: <GtkFontChooser>;
  result res :: <C-string>;
  c-name: "gtk_font_chooser_get_font";
end;

define inline-only C-function gtk-font-chooser-get-font-desc
  input parameter self :: <GtkFontChooser>;
  result res :: <PangoFontDescription>;
  c-name: "gtk_font_chooser_get_font_desc";
end;

define inline-only C-function gtk-font-chooser-get-font-face
  input parameter self :: <GtkFontChooser>;
  result res :: <PangoFontFace>;
  c-name: "gtk_font_chooser_get_font_face";
end;

define inline-only C-function gtk-font-chooser-get-font-family
  input parameter self :: <GtkFontChooser>;
  result res :: <PangoFontFamily>;
  c-name: "gtk_font_chooser_get_font_family";
end;

define inline-only C-function gtk-font-chooser-get-font-features
  input parameter self :: <GtkFontChooser>;
  result res :: <C-string>;
  c-name: "gtk_font_chooser_get_font_features";
end;

define inline-only C-function gtk-font-chooser-get-font-map
  input parameter self :: <GtkFontChooser>;
  result res :: <PangoFontMap>;
  c-name: "gtk_font_chooser_get_font_map";
end;

define inline-only C-function gtk-font-chooser-get-font-size
  input parameter self :: <GtkFontChooser>;
  result res :: <C-signed-int>;
  c-name: "gtk_font_chooser_get_font_size";
end;

define inline-only C-function gtk-font-chooser-get-language
  input parameter self :: <GtkFontChooser>;
  result res :: <C-string>;
  c-name: "gtk_font_chooser_get_language";
end;

define inline-only C-function gtk-font-chooser-get-level
  input parameter self :: <GtkFontChooser>;
  result res :: <GtkFontChooserLevel>;
  c-name: "gtk_font_chooser_get_level";
end;

define inline-only C-function gtk-font-chooser-get-preview-text
  input parameter self :: <GtkFontChooser>;
  result res :: <C-string>;
  c-name: "gtk_font_chooser_get_preview_text";
end;

define inline-only C-function gtk-font-chooser-get-show-preview-entry
  input parameter self :: <GtkFontChooser>;
  result res :: <C-boolean>;
  c-name: "gtk_font_chooser_get_show_preview_entry";
end;

define inline-only C-function gtk-font-chooser-set-filter-func
  input parameter self :: <GtkFontChooser>;
  input parameter filter_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_font_chooser_set_filter_func";
end;

define inline-only C-function gtk-font-chooser-set-font
  input parameter self :: <GtkFontChooser>;
  input parameter fontname_ :: <C-string>;
  c-name: "gtk_font_chooser_set_font";
end;

define inline-only C-function gtk-font-chooser-set-font-desc
  input parameter self :: <GtkFontChooser>;
  input parameter font_desc_ :: <PangoFontDescription>;
  c-name: "gtk_font_chooser_set_font_desc";
end;

define inline-only C-function gtk-font-chooser-set-font-map
  input parameter self :: <GtkFontChooser>;
  input parameter fontmap_ :: <PangoFontMap>;
  c-name: "gtk_font_chooser_set_font_map";
end;

define inline-only C-function gtk-font-chooser-set-language
  input parameter self :: <GtkFontChooser>;
  input parameter language_ :: <C-string>;
  c-name: "gtk_font_chooser_set_language";
end;

define inline-only C-function gtk-font-chooser-set-level
  input parameter self :: <GtkFontChooser>;
  input parameter level_ :: <GtkFontChooserLevel>;
  c-name: "gtk_font_chooser_set_level";
end;

define inline-only C-function gtk-font-chooser-set-preview-text
  input parameter self :: <GtkFontChooser>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_font_chooser_set_preview_text";
end;

define inline-only C-function gtk-font-chooser-set-show-preview-entry
  input parameter self :: <GtkFontChooser>;
  input parameter show_preview_entry_ :: <C-boolean>;
  c-name: "gtk_font_chooser_set_show_preview_entry";
end;

define open C-subtype <GtkFontChooserDialog> (<GtkDialog>, <GtkFontChooser>)
end C-subtype;

define C-pointer-type <GtkFontChooserDialog*> => <GtkFontChooserDialog>;

define sealed domain make (singleton(<GtkFontChooserDialog*>));
define sealed domain initialize (<GtkFontChooserDialog*>);

define inline-only C-function gtk-font-chooser-dialog-new
  input parameter title_ :: <C-string>;
  input parameter parent_ :: <GtkWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_font_chooser_dialog_new";
end;

define C-struct <_GtkFontChooserIface>
  constant sealed inline-only slot gtk-font-chooser-iface-base-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-font-chooser-iface-get-font-family :: <C-function-pointer>;
  constant sealed inline-only slot gtk-font-chooser-iface-get-font-face :: <C-function-pointer>;
  constant sealed inline-only slot gtk-font-chooser-iface-get-font-size :: <C-function-pointer>;
  constant sealed inline-only slot gtk-font-chooser-iface-set-filter-func :: <C-function-pointer>;
  constant sealed inline-only slot gtk-font-chooser-iface-font-activated :: <C-function-pointer>;
  constant sealed inline-only slot gtk-font-chooser-iface-set-font-map :: <C-function-pointer>;
  constant sealed inline-only slot gtk-font-chooser-iface-get-font-map :: <C-function-pointer>;
  constant sealed inline-only slot gtk-font-chooser-iface-padding :: <C-void*>;
  pointer-type-name: <GtkFontChooserIface>;
end C-struct;

define sealed domain make (singleton(<GtkFontChooserIface>));
define sealed domain initialize (<GtkFontChooserIface>);

define inline-only constant $gtk-font-chooser-level-family = 0;
define inline-only constant $gtk-font-chooser-level-style = 1;
define inline-only constant $gtk-font-chooser-level-size = 2;
define inline-only constant $gtk-font-chooser-level-variations = 4;
define inline-only constant $gtk-font-chooser-level-features = 8;
define constant <GtkFontChooserLevel> = <C-int>;
define C-pointer-type <GtkFontChooserLevel*> => <GtkFontChooserLevel>;

define open C-subtype <GtkFontChooserWidget> (<GtkWidget>, <GtkFontChooser>)
end C-subtype;

define C-pointer-type <GtkFontChooserWidget*> => <GtkFontChooserWidget>;

define sealed domain make (singleton(<GtkFontChooserWidget*>));
define sealed domain initialize (<GtkFontChooserWidget*>);

define inline-only C-function gtk-font-chooser-widget-new
  result res :: <GtkWidget>;
  c-name: "gtk_font_chooser_widget_new";
end;

define open C-subtype <GtkFrame> (<GtkWidget>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkFrame*> => <GtkFrame>;

define sealed domain make (singleton(<GtkFrame*>));
define sealed domain initialize (<GtkFrame*>);

define inline-only C-function gtk-frame-new
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_frame_new";
end;

define inline-only C-function gtk-frame-get-child
  input parameter self :: <GtkFrame>;
  result res :: <GtkWidget>;
  c-name: "gtk_frame_get_child";
end;

define inline-only C-function gtk-frame-get-label
  input parameter self :: <GtkFrame>;
  result res :: <C-string>;
  c-name: "gtk_frame_get_label";
end;

define inline-only C-function gtk-frame-get-label-align
  input parameter self :: <GtkFrame>;
  result res :: <C-float>;
  c-name: "gtk_frame_get_label_align";
end;

define inline-only C-function gtk-frame-get-label-widget
  input parameter self :: <GtkFrame>;
  result res :: <GtkWidget>;
  c-name: "gtk_frame_get_label_widget";
end;

define inline-only C-function gtk-frame-set-child
  input parameter self :: <GtkFrame>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_frame_set_child";
end;

define inline-only C-function gtk-frame-set-label
  input parameter self :: <GtkFrame>;
  input parameter label_ :: <C-string>;
  c-name: "gtk_frame_set_label";
end;

define inline-only C-function gtk-frame-set-label-align
  input parameter self :: <GtkFrame>;
  input parameter xalign_ :: <C-float>;
  c-name: "gtk_frame_set_label_align";
end;

define inline-only C-function gtk-frame-set-label-widget
  input parameter self :: <GtkFrame>;
  input parameter label_widget_ :: <GtkWidget>;
  c-name: "gtk_frame_set_label_widget";
end;

define C-struct <_GtkFrameClass>
  constant sealed inline-only slot gtk-frame-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-frame-class-compute-child-allocation :: <C-function-pointer>;
  constant sealed inline-only slot gtk-frame-class-padding :: <C-void*>;
  pointer-type-name: <GtkFrameClass>;
end C-struct;

define sealed domain make (singleton(<GtkFrameClass>));
define sealed domain initialize (<GtkFrameClass>);

define open C-subtype <GtkGLArea> (<GtkWidget>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkGLArea*> => <GtkGLArea>;

define sealed domain make (singleton(<GtkGLArea*>));
define sealed domain initialize (<GtkGLArea*>);

define inline-only C-function gtk-gl-area-new
  result res :: <GtkWidget>;
  c-name: "gtk_gl_area_new";
end;

define inline-only C-function gtk-gl-area-attach-buffers
  input parameter self :: <GtkGLArea>;
  c-name: "gtk_gl_area_attach_buffers";
end;

define inline-only C-function gtk-gl-area-get-auto-render
  input parameter self :: <GtkGLArea>;
  result res :: <C-boolean>;
  c-name: "gtk_gl_area_get_auto_render";
end;

define inline-only C-function gtk-gl-area-get-context
  input parameter self :: <GtkGLArea>;
  result res :: <GdkGLContext>;
  c-name: "gtk_gl_area_get_context";
end;

define inline-only C-function gtk-gl-area-get-error
  input parameter self :: <GtkGLArea>;
  result res :: <GError>;
  c-name: "gtk_gl_area_get_error";
end;

define inline-only C-function gtk-gl-area-get-has-depth-buffer
  input parameter self :: <GtkGLArea>;
  result res :: <C-boolean>;
  c-name: "gtk_gl_area_get_has_depth_buffer";
end;

define inline-only C-function gtk-gl-area-get-has-stencil-buffer
  input parameter self :: <GtkGLArea>;
  result res :: <C-boolean>;
  c-name: "gtk_gl_area_get_has_stencil_buffer";
end;

define inline-only C-function gtk-gl-area-get-required-version
  input parameter self :: <GtkGLArea>;
  output parameter major_ :: <C-signed-int*>;
  output parameter minor_ :: <C-signed-int*>;
  c-name: "gtk_gl_area_get_required_version";
end;

define inline-only C-function gtk-gl-area-get-use-es
  input parameter self :: <GtkGLArea>;
  result res :: <C-boolean>;
  c-name: "gtk_gl_area_get_use_es";
end;

define inline-only C-function gtk-gl-area-make-current
  input parameter self :: <GtkGLArea>;
  c-name: "gtk_gl_area_make_current";
end;

define inline-only C-function gtk-gl-area-queue-render
  input parameter self :: <GtkGLArea>;
  c-name: "gtk_gl_area_queue_render";
end;

define inline-only C-function gtk-gl-area-set-auto-render
  input parameter self :: <GtkGLArea>;
  input parameter auto_render_ :: <C-boolean>;
  c-name: "gtk_gl_area_set_auto_render";
end;

define inline-only C-function gtk-gl-area-set-error
  input parameter self :: <GtkGLArea>;
  input parameter error_ :: <GError>;
  c-name: "gtk_gl_area_set_error";
end;

define inline-only C-function gtk-gl-area-set-has-depth-buffer
  input parameter self :: <GtkGLArea>;
  input parameter has_depth_buffer_ :: <C-boolean>;
  c-name: "gtk_gl_area_set_has_depth_buffer";
end;

define inline-only C-function gtk-gl-area-set-has-stencil-buffer
  input parameter self :: <GtkGLArea>;
  input parameter has_stencil_buffer_ :: <C-boolean>;
  c-name: "gtk_gl_area_set_has_stencil_buffer";
end;

define inline-only C-function gtk-gl-area-set-required-version
  input parameter self :: <GtkGLArea>;
  input parameter major_ :: <C-signed-int>;
  input parameter minor_ :: <C-signed-int>;
  c-name: "gtk_gl_area_set_required_version";
end;

define inline-only C-function gtk-gl-area-set-use-es
  input parameter self :: <GtkGLArea>;
  input parameter use_es_ :: <C-boolean>;
  c-name: "gtk_gl_area_set_use_es";
end;

define C-struct <_GtkGLAreaClass>
  constant sealed inline-only slot gtk-gl-area-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-gl-area-class-render :: <C-function-pointer>;
  constant sealed inline-only slot gtk-gl-area-class-resize :: <C-function-pointer>;
  constant sealed inline-only slot gtk-gl-area-class-create-context :: <C-void*>;
  constant sealed inline-only slot gtk-gl-area-class-_padding :: <C-void*>;
  pointer-type-name: <GtkGLAreaClass>;
end C-struct;

define sealed domain make (singleton(<GtkGLAreaClass>));
define sealed domain initialize (<GtkGLAreaClass>);

define open C-subtype <GtkGesture> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkGesture*> => <GtkGesture>;

define sealed domain make (singleton(<GtkGesture*>));
define sealed domain initialize (<GtkGesture*>);

define inline-only C-function gtk-gesture-get-bounding-box
  input parameter self :: <GtkGesture>;
  input parameter rect_ :: <GdkRectangle>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_get_bounding_box";
end;

define inline-only C-function gtk-gesture-get-bounding-box-center
  input parameter self :: <GtkGesture>;
  output parameter x_ :: <C-double*>;
  output parameter y_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_get_bounding_box_center";
end;

define inline-only C-function gtk-gesture-get-device
  input parameter self :: <GtkGesture>;
  result res :: <GdkDevice>;
  c-name: "gtk_gesture_get_device";
end;

define inline-only C-function gtk-gesture-get-group
  input parameter self :: <GtkGesture>;
  result res :: <GList>;
  c-name: "gtk_gesture_get_group";
end;

define inline-only C-function gtk-gesture-get-last-event
  input parameter self :: <GtkGesture>;
  input parameter sequence_ :: <GdkEventSequence>;
  result res :: <GdkEvent>;
  c-name: "gtk_gesture_get_last_event";
end;

define inline-only C-function gtk-gesture-get-last-updated-sequence
  input parameter self :: <GtkGesture>;
  result res :: <GdkEventSequence>;
  c-name: "gtk_gesture_get_last_updated_sequence";
end;

define inline-only C-function gtk-gesture-get-point
  input parameter self :: <GtkGesture>;
  input parameter sequence_ :: <GdkEventSequence>;
  output parameter x_ :: <C-double*>;
  output parameter y_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_get_point";
end;

define inline-only C-function gtk-gesture-get-sequence-state
  input parameter self :: <GtkGesture>;
  input parameter sequence_ :: <GdkEventSequence>;
  result res :: <GtkEventSequenceState>;
  c-name: "gtk_gesture_get_sequence_state";
end;

define inline-only C-function gtk-gesture-get-sequences
  input parameter self :: <GtkGesture>;
  result res :: <GList>;
  c-name: "gtk_gesture_get_sequences";
end;

define inline-only C-function gtk-gesture-group
  input parameter self :: <GtkGesture>;
  input parameter gesture_ :: <GtkGesture>;
  c-name: "gtk_gesture_group";
end;

define inline-only C-function gtk-gesture-handles-sequence
  input parameter self :: <GtkGesture>;
  input parameter sequence_ :: <GdkEventSequence>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_handles_sequence";
end;

define inline-only C-function gtk-gesture-is-active
  input parameter self :: <GtkGesture>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_is_active";
end;

define inline-only C-function gtk-gesture-is-grouped-with
  input parameter self :: <GtkGesture>;
  input parameter other_ :: <GtkGesture>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_is_grouped_with";
end;

define inline-only C-function gtk-gesture-is-recognized
  input parameter self :: <GtkGesture>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_is_recognized";
end;

define inline-only C-function gtk-gesture-set-sequence-state
  input parameter self :: <GtkGesture>;
  input parameter sequence_ :: <GdkEventSequence>;
  input parameter state_ :: <GtkEventSequenceState>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_set_sequence_state";
end;

define inline-only C-function gtk-gesture-set-state
  input parameter self :: <GtkGesture>;
  input parameter state_ :: <GtkEventSequenceState>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_set_state";
end;

define inline-only C-function gtk-gesture-ungroup
  input parameter self :: <GtkGesture>;
  c-name: "gtk_gesture_ungroup";
end;

define C-struct <_GtkGestureClass>
  pointer-type-name: <GtkGestureClass>;
end C-struct;

define sealed domain make (singleton(<GtkGestureClass>));
define sealed domain initialize (<GtkGestureClass>);

define open C-subtype <GtkGestureClick> (<GtkGestureSingle>)
end C-subtype;

define C-pointer-type <GtkGestureClick*> => <GtkGestureClick>;

define sealed domain make (singleton(<GtkGestureClick*>));
define sealed domain initialize (<GtkGestureClick*>);

define inline-only C-function gtk-gesture-click-new
  result res :: <GtkGesture>;
  c-name: "gtk_gesture_click_new";
end;

define C-struct <_GtkGestureClickClass>
  pointer-type-name: <GtkGestureClickClass>;
end C-struct;

define sealed domain make (singleton(<GtkGestureClickClass>));
define sealed domain initialize (<GtkGestureClickClass>);

define open C-subtype <GtkGestureDrag> (<GtkGestureSingle>)
end C-subtype;

define C-pointer-type <GtkGestureDrag*> => <GtkGestureDrag>;

define sealed domain make (singleton(<GtkGestureDrag*>));
define sealed domain initialize (<GtkGestureDrag*>);

define inline-only C-function gtk-gesture-drag-new
  result res :: <GtkGesture>;
  c-name: "gtk_gesture_drag_new";
end;

define inline-only C-function gtk-gesture-drag-get-offset
  input parameter self :: <GtkGestureDrag>;
  output parameter x_ :: <C-double*>;
  output parameter y_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_drag_get_offset";
end;

define inline-only C-function gtk-gesture-drag-get-start-point
  input parameter self :: <GtkGestureDrag>;
  output parameter x_ :: <C-double*>;
  output parameter y_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_drag_get_start_point";
end;

define C-struct <_GtkGestureDragClass>
  pointer-type-name: <GtkGestureDragClass>;
end C-struct;

define sealed domain make (singleton(<GtkGestureDragClass>));
define sealed domain initialize (<GtkGestureDragClass>);

define open C-subtype <GtkGestureLongPress> (<GtkGestureSingle>)
end C-subtype;

define C-pointer-type <GtkGestureLongPress*> => <GtkGestureLongPress>;

define sealed domain make (singleton(<GtkGestureLongPress*>));
define sealed domain initialize (<GtkGestureLongPress*>);

define inline-only C-function gtk-gesture-long-press-new
  result res :: <GtkGesture>;
  c-name: "gtk_gesture_long_press_new";
end;

define inline-only C-function gtk-gesture-long-press-get-delay-factor
  input parameter self :: <GtkGestureLongPress>;
  result res :: <C-double>;
  c-name: "gtk_gesture_long_press_get_delay_factor";
end;

define inline-only C-function gtk-gesture-long-press-set-delay-factor
  input parameter self :: <GtkGestureLongPress>;
  input parameter delay_factor_ :: <C-double>;
  c-name: "gtk_gesture_long_press_set_delay_factor";
end;

define C-struct <_GtkGestureLongPressClass>
  pointer-type-name: <GtkGestureLongPressClass>;
end C-struct;

define sealed domain make (singleton(<GtkGestureLongPressClass>));
define sealed domain initialize (<GtkGestureLongPressClass>);

define open C-subtype <GtkGesturePan> (<GtkGestureDrag>)
end C-subtype;

define C-pointer-type <GtkGesturePan*> => <GtkGesturePan>;

define sealed domain make (singleton(<GtkGesturePan*>));
define sealed domain initialize (<GtkGesturePan*>);

define inline-only C-function gtk-gesture-pan-new
  input parameter orientation_ :: <GtkOrientation>;
  result res :: <GtkGesture>;
  c-name: "gtk_gesture_pan_new";
end;

define inline-only C-function gtk-gesture-pan-get-orientation
  input parameter self :: <GtkGesturePan>;
  result res :: <GtkOrientation>;
  c-name: "gtk_gesture_pan_get_orientation";
end;

define inline-only C-function gtk-gesture-pan-set-orientation
  input parameter self :: <GtkGesturePan>;
  input parameter orientation_ :: <GtkOrientation>;
  c-name: "gtk_gesture_pan_set_orientation";
end;

define C-struct <_GtkGesturePanClass>
  pointer-type-name: <GtkGesturePanClass>;
end C-struct;

define sealed domain make (singleton(<GtkGesturePanClass>));
define sealed domain initialize (<GtkGesturePanClass>);

define open C-subtype <GtkGestureRotate> (<GtkGesture>)
end C-subtype;

define C-pointer-type <GtkGestureRotate*> => <GtkGestureRotate>;

define sealed domain make (singleton(<GtkGestureRotate*>));
define sealed domain initialize (<GtkGestureRotate*>);

define inline-only C-function gtk-gesture-rotate-new
  result res :: <GtkGesture>;
  c-name: "gtk_gesture_rotate_new";
end;

define inline-only C-function gtk-gesture-rotate-get-angle-delta
  input parameter self :: <GtkGestureRotate>;
  result res :: <C-double>;
  c-name: "gtk_gesture_rotate_get_angle_delta";
end;

define C-struct <_GtkGestureRotateClass>
  pointer-type-name: <GtkGestureRotateClass>;
end C-struct;

define sealed domain make (singleton(<GtkGestureRotateClass>));
define sealed domain initialize (<GtkGestureRotateClass>);

define open C-subtype <GtkGestureSingle> (<GtkGesture>)
end C-subtype;

define C-pointer-type <GtkGestureSingle*> => <GtkGestureSingle>;

define sealed domain make (singleton(<GtkGestureSingle*>));
define sealed domain initialize (<GtkGestureSingle*>);

define inline-only C-function gtk-gesture-single-get-button
  input parameter self :: <GtkGestureSingle>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_gesture_single_get_button";
end;

define inline-only C-function gtk-gesture-single-get-current-button
  input parameter self :: <GtkGestureSingle>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_gesture_single_get_current_button";
end;

define inline-only C-function gtk-gesture-single-get-current-sequence
  input parameter self :: <GtkGestureSingle>;
  result res :: <GdkEventSequence>;
  c-name: "gtk_gesture_single_get_current_sequence";
end;

define inline-only C-function gtk-gesture-single-get-exclusive
  input parameter self :: <GtkGestureSingle>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_single_get_exclusive";
end;

define inline-only C-function gtk-gesture-single-get-touch-only
  input parameter self :: <GtkGestureSingle>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_single_get_touch_only";
end;

define inline-only C-function gtk-gesture-single-set-button
  input parameter self :: <GtkGestureSingle>;
  input parameter button_ :: <C-unsigned-int>;
  c-name: "gtk_gesture_single_set_button";
end;

define inline-only C-function gtk-gesture-single-set-exclusive
  input parameter self :: <GtkGestureSingle>;
  input parameter exclusive_ :: <C-boolean>;
  c-name: "gtk_gesture_single_set_exclusive";
end;

define inline-only C-function gtk-gesture-single-set-touch-only
  input parameter self :: <GtkGestureSingle>;
  input parameter touch_only_ :: <C-boolean>;
  c-name: "gtk_gesture_single_set_touch_only";
end;

define C-struct <_GtkGestureSingleClass>
  pointer-type-name: <GtkGestureSingleClass>;
end C-struct;

define sealed domain make (singleton(<GtkGestureSingleClass>));
define sealed domain initialize (<GtkGestureSingleClass>);

define open C-subtype <GtkGestureStylus> (<GtkGestureSingle>)
end C-subtype;

define C-pointer-type <GtkGestureStylus*> => <GtkGestureStylus>;

define sealed domain make (singleton(<GtkGestureStylus*>));
define sealed domain initialize (<GtkGestureStylus*>);

define inline-only C-function gtk-gesture-stylus-new
  result res :: <GtkGesture>;
  c-name: "gtk_gesture_stylus_new";
end;

define inline-only C-function gtk-gesture-stylus-get-axes
  input parameter self :: <GtkGestureStylus>;
  input parameter axes_ :: <C-unsigned-char*> /* Not supported */;
  output parameter values_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_stylus_get_axes";
end;

define inline-only C-function gtk-gesture-stylus-get-axis
  input parameter self :: <GtkGestureStylus>;
  input parameter axis_ :: <GdkAxisUse>;
  output parameter value_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_stylus_get_axis";
end;

define inline-only C-function gtk-gesture-stylus-get-backlog
  input parameter self :: <GtkGestureStylus>;
  output parameter backlog_ :: <C-unsigned-char*> /* Not supported */;
  output parameter n_elems_ :: <C-unsigned-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_stylus_get_backlog";
end;

define inline-only C-function gtk-gesture-stylus-get-device-tool
  input parameter self :: <GtkGestureStylus>;
  result res :: <GdkDeviceTool>;
  c-name: "gtk_gesture_stylus_get_device_tool";
end;

define C-struct <_GtkGestureStylusClass>
  pointer-type-name: <GtkGestureStylusClass>;
end C-struct;

define sealed domain make (singleton(<GtkGestureStylusClass>));
define sealed domain initialize (<GtkGestureStylusClass>);

define open C-subtype <GtkGestureSwipe> (<GtkGestureSingle>)
end C-subtype;

define C-pointer-type <GtkGestureSwipe*> => <GtkGestureSwipe>;

define sealed domain make (singleton(<GtkGestureSwipe*>));
define sealed domain initialize (<GtkGestureSwipe*>);

define inline-only C-function gtk-gesture-swipe-new
  result res :: <GtkGesture>;
  c-name: "gtk_gesture_swipe_new";
end;

define inline-only C-function gtk-gesture-swipe-get-velocity
  input parameter self :: <GtkGestureSwipe>;
  output parameter velocity_x_ :: <C-double*>;
  output parameter velocity_y_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_gesture_swipe_get_velocity";
end;

define C-struct <_GtkGestureSwipeClass>
  pointer-type-name: <GtkGestureSwipeClass>;
end C-struct;

define sealed domain make (singleton(<GtkGestureSwipeClass>));
define sealed domain initialize (<GtkGestureSwipeClass>);

define open C-subtype <GtkGestureZoom> (<GtkGesture>)
end C-subtype;

define C-pointer-type <GtkGestureZoom*> => <GtkGestureZoom>;

define sealed domain make (singleton(<GtkGestureZoom*>));
define sealed domain initialize (<GtkGestureZoom*>);

define inline-only C-function gtk-gesture-zoom-new
  result res :: <GtkGesture>;
  c-name: "gtk_gesture_zoom_new";
end;

define inline-only C-function gtk-gesture-zoom-get-scale-delta
  input parameter self :: <GtkGestureZoom>;
  result res :: <C-double>;
  c-name: "gtk_gesture_zoom_get_scale_delta";
end;

define C-struct <_GtkGestureZoomClass>
  pointer-type-name: <GtkGestureZoomClass>;
end C-struct;

define sealed domain make (singleton(<GtkGestureZoomClass>));
define sealed domain initialize (<GtkGestureZoomClass>);

define open C-subtype <GtkGrid> (<GtkWidget>, <GtkOrientable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkGrid*> => <GtkGrid>;

define sealed domain make (singleton(<GtkGrid*>));
define sealed domain initialize (<GtkGrid*>);

define inline-only C-function gtk-grid-new
  result res :: <GtkWidget>;
  c-name: "gtk_grid_new";
end;

define inline-only C-function gtk-grid-attach
  input parameter self :: <GtkGrid>;
  input parameter child_ :: <GtkWidget>;
  input parameter column_ :: <C-signed-int>;
  input parameter row_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_grid_attach";
end;

define inline-only C-function gtk-grid-attach-next-to
  input parameter self :: <GtkGrid>;
  input parameter child_ :: <GtkWidget>;
  input parameter sibling_ :: <GtkWidget>;
  input parameter side_ :: <GtkPositionType>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_grid_attach_next_to";
end;

define inline-only C-function gtk-grid-get-baseline-row
  input parameter self :: <GtkGrid>;
  result res :: <C-signed-int>;
  c-name: "gtk_grid_get_baseline_row";
end;

define inline-only C-function gtk-grid-get-child-at
  input parameter self :: <GtkGrid>;
  input parameter column_ :: <C-signed-int>;
  input parameter row_ :: <C-signed-int>;
  result res :: <GtkWidget>;
  c-name: "gtk_grid_get_child_at";
end;

define inline-only C-function gtk-grid-get-column-homogeneous
  input parameter self :: <GtkGrid>;
  result res :: <C-boolean>;
  c-name: "gtk_grid_get_column_homogeneous";
end;

define inline-only C-function gtk-grid-get-column-spacing
  input parameter self :: <GtkGrid>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_grid_get_column_spacing";
end;

define inline-only C-function gtk-grid-get-row-baseline-position
  input parameter self :: <GtkGrid>;
  input parameter row_ :: <C-signed-int>;
  result res :: <GtkBaselinePosition>;
  c-name: "gtk_grid_get_row_baseline_position";
end;

define inline-only C-function gtk-grid-get-row-homogeneous
  input parameter self :: <GtkGrid>;
  result res :: <C-boolean>;
  c-name: "gtk_grid_get_row_homogeneous";
end;

define inline-only C-function gtk-grid-get-row-spacing
  input parameter self :: <GtkGrid>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_grid_get_row_spacing";
end;

define inline-only C-function gtk-grid-insert-column
  input parameter self :: <GtkGrid>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_grid_insert_column";
end;

define inline-only C-function gtk-grid-insert-next-to
  input parameter self :: <GtkGrid>;
  input parameter sibling_ :: <GtkWidget>;
  input parameter side_ :: <GtkPositionType>;
  c-name: "gtk_grid_insert_next_to";
end;

define inline-only C-function gtk-grid-insert-row
  input parameter self :: <GtkGrid>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_grid_insert_row";
end;

define inline-only C-function gtk-grid-query-child
  input parameter self :: <GtkGrid>;
  input parameter child_ :: <GtkWidget>;
  output parameter column_ :: <C-signed-int*>;
  output parameter row_ :: <C-signed-int*>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_grid_query_child";
end;

define inline-only C-function gtk-grid-remove
  input parameter self :: <GtkGrid>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_grid_remove";
end;

define inline-only C-function gtk-grid-remove-column
  input parameter self :: <GtkGrid>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_grid_remove_column";
end;

define inline-only C-function gtk-grid-remove-row
  input parameter self :: <GtkGrid>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_grid_remove_row";
end;

define inline-only C-function gtk-grid-set-baseline-row
  input parameter self :: <GtkGrid>;
  input parameter row_ :: <C-signed-int>;
  c-name: "gtk_grid_set_baseline_row";
end;

define inline-only C-function gtk-grid-set-column-homogeneous
  input parameter self :: <GtkGrid>;
  input parameter homogeneous_ :: <C-boolean>;
  c-name: "gtk_grid_set_column_homogeneous";
end;

define inline-only C-function gtk-grid-set-column-spacing
  input parameter self :: <GtkGrid>;
  input parameter spacing_ :: <C-unsigned-int>;
  c-name: "gtk_grid_set_column_spacing";
end;

define inline-only C-function gtk-grid-set-row-baseline-position
  input parameter self :: <GtkGrid>;
  input parameter row_ :: <C-signed-int>;
  input parameter pos_ :: <GtkBaselinePosition>;
  c-name: "gtk_grid_set_row_baseline_position";
end;

define inline-only C-function gtk-grid-set-row-homogeneous
  input parameter self :: <GtkGrid>;
  input parameter homogeneous_ :: <C-boolean>;
  c-name: "gtk_grid_set_row_homogeneous";
end;

define inline-only C-function gtk-grid-set-row-spacing
  input parameter self :: <GtkGrid>;
  input parameter spacing_ :: <C-unsigned-int>;
  c-name: "gtk_grid_set_row_spacing";
end;

define C-struct <_GtkGridClass>
  constant sealed inline-only slot gtk-grid-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-grid-class-padding :: <C-void*>;
  pointer-type-name: <GtkGridClass>;
end C-struct;

define sealed domain make (singleton(<GtkGridClass>));
define sealed domain initialize (<GtkGridClass>);

define open C-subtype <GtkGridLayout> (<GtkLayoutManager>)
end C-subtype;

define C-pointer-type <GtkGridLayout*> => <GtkGridLayout>;

define sealed domain make (singleton(<GtkGridLayout*>));
define sealed domain initialize (<GtkGridLayout*>);

define inline-only C-function gtk-grid-layout-new
  result res :: <GtkLayoutManager>;
  c-name: "gtk_grid_layout_new";
end;

define inline-only C-function gtk-grid-layout-get-baseline-row
  input parameter self :: <GtkGridLayout>;
  result res :: <C-signed-int>;
  c-name: "gtk_grid_layout_get_baseline_row";
end;

define inline-only C-function gtk-grid-layout-get-column-homogeneous
  input parameter self :: <GtkGridLayout>;
  result res :: <C-boolean>;
  c-name: "gtk_grid_layout_get_column_homogeneous";
end;

define inline-only C-function gtk-grid-layout-get-column-spacing
  input parameter self :: <GtkGridLayout>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_grid_layout_get_column_spacing";
end;

define inline-only C-function gtk-grid-layout-get-row-baseline-position
  input parameter self :: <GtkGridLayout>;
  input parameter row_ :: <C-signed-int>;
  result res :: <GtkBaselinePosition>;
  c-name: "gtk_grid_layout_get_row_baseline_position";
end;

define inline-only C-function gtk-grid-layout-get-row-homogeneous
  input parameter self :: <GtkGridLayout>;
  result res :: <C-boolean>;
  c-name: "gtk_grid_layout_get_row_homogeneous";
end;

define inline-only C-function gtk-grid-layout-get-row-spacing
  input parameter self :: <GtkGridLayout>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_grid_layout_get_row_spacing";
end;

define inline-only C-function gtk-grid-layout-set-baseline-row
  input parameter self :: <GtkGridLayout>;
  input parameter row_ :: <C-signed-int>;
  c-name: "gtk_grid_layout_set_baseline_row";
end;

define inline-only C-function gtk-grid-layout-set-column-homogeneous
  input parameter self :: <GtkGridLayout>;
  input parameter homogeneous_ :: <C-boolean>;
  c-name: "gtk_grid_layout_set_column_homogeneous";
end;

define inline-only C-function gtk-grid-layout-set-column-spacing
  input parameter self :: <GtkGridLayout>;
  input parameter spacing_ :: <C-unsigned-int>;
  c-name: "gtk_grid_layout_set_column_spacing";
end;

define inline-only C-function gtk-grid-layout-set-row-baseline-position
  input parameter self :: <GtkGridLayout>;
  input parameter row_ :: <C-signed-int>;
  input parameter pos_ :: <GtkBaselinePosition>;
  c-name: "gtk_grid_layout_set_row_baseline_position";
end;

define inline-only C-function gtk-grid-layout-set-row-homogeneous
  input parameter self :: <GtkGridLayout>;
  input parameter homogeneous_ :: <C-boolean>;
  c-name: "gtk_grid_layout_set_row_homogeneous";
end;

define inline-only C-function gtk-grid-layout-set-row-spacing
  input parameter self :: <GtkGridLayout>;
  input parameter spacing_ :: <C-unsigned-int>;
  c-name: "gtk_grid_layout_set_row_spacing";
end;

define open C-subtype <GtkGridLayoutChild> (<GtkLayoutChild>)
end C-subtype;

define C-pointer-type <GtkGridLayoutChild*> => <GtkGridLayoutChild>;

define sealed domain make (singleton(<GtkGridLayoutChild*>));
define sealed domain initialize (<GtkGridLayoutChild*>);

define inline-only C-function gtk-grid-layout-child-get-column
  input parameter self :: <GtkGridLayoutChild>;
  result res :: <C-signed-int>;
  c-name: "gtk_grid_layout_child_get_column";
end;

define inline-only C-function gtk-grid-layout-child-get-column-span
  input parameter self :: <GtkGridLayoutChild>;
  result res :: <C-signed-int>;
  c-name: "gtk_grid_layout_child_get_column_span";
end;

define inline-only C-function gtk-grid-layout-child-get-row
  input parameter self :: <GtkGridLayoutChild>;
  result res :: <C-signed-int>;
  c-name: "gtk_grid_layout_child_get_row";
end;

define inline-only C-function gtk-grid-layout-child-get-row-span
  input parameter self :: <GtkGridLayoutChild>;
  result res :: <C-signed-int>;
  c-name: "gtk_grid_layout_child_get_row_span";
end;

define inline-only C-function gtk-grid-layout-child-set-column
  input parameter self :: <GtkGridLayoutChild>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_grid_layout_child_set_column";
end;

define inline-only C-function gtk-grid-layout-child-set-column-span
  input parameter self :: <GtkGridLayoutChild>;
  input parameter span_ :: <C-signed-int>;
  c-name: "gtk_grid_layout_child_set_column_span";
end;

define inline-only C-function gtk-grid-layout-child-set-row
  input parameter self :: <GtkGridLayoutChild>;
  input parameter row_ :: <C-signed-int>;
  c-name: "gtk_grid_layout_child_set_row";
end;

define inline-only C-function gtk-grid-layout-child-set-row-span
  input parameter self :: <GtkGridLayoutChild>;
  input parameter span_ :: <C-signed-int>;
  c-name: "gtk_grid_layout_child_set_row_span";
end;

define C-struct <_GtkGridLayoutChildClass>
  constant sealed inline-only slot gtk-grid-layout-child-class-parent-class :: <GtkLayoutChildClass>;
  pointer-type-name: <GtkGridLayoutChildClass>;
end C-struct;

define sealed domain make (singleton(<GtkGridLayoutChildClass>));
define sealed domain initialize (<GtkGridLayoutChildClass>);

define C-struct <_GtkGridLayoutClass>
  constant sealed inline-only slot gtk-grid-layout-class-parent-class :: <GtkLayoutManagerClass>;
  pointer-type-name: <GtkGridLayoutClass>;
end C-struct;

define sealed domain make (singleton(<GtkGridLayoutClass>));
define sealed domain initialize (<GtkGridLayoutClass>);

define open C-subtype <GtkGridView> (<GtkListBase>)
end C-subtype;

define C-pointer-type <GtkGridView*> => <GtkGridView>;

define sealed domain make (singleton(<GtkGridView*>));
define sealed domain initialize (<GtkGridView*>);

define inline-only C-function gtk-grid-view-new
  input parameter model_ :: <GtkSelectionModel>;
  input parameter factory_ :: <GtkListItemFactory>;
  result res :: <GtkWidget>;
  c-name: "gtk_grid_view_new";
end;

define inline-only C-function gtk-grid-view-get-enable-rubberband
  input parameter self :: <GtkGridView>;
  result res :: <C-boolean>;
  c-name: "gtk_grid_view_get_enable_rubberband";
end;

define inline-only C-function gtk-grid-view-get-factory
  input parameter self :: <GtkGridView>;
  result res :: <GtkListItemFactory>;
  c-name: "gtk_grid_view_get_factory";
end;

define inline-only C-function gtk-grid-view-get-max-columns
  input parameter self :: <GtkGridView>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_grid_view_get_max_columns";
end;

define inline-only C-function gtk-grid-view-get-min-columns
  input parameter self :: <GtkGridView>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_grid_view_get_min_columns";
end;

define inline-only C-function gtk-grid-view-get-model
  input parameter self :: <GtkGridView>;
  result res :: <GtkSelectionModel>;
  c-name: "gtk_grid_view_get_model";
end;

define inline-only C-function gtk-grid-view-get-single-click-activate
  input parameter self :: <GtkGridView>;
  result res :: <C-boolean>;
  c-name: "gtk_grid_view_get_single_click_activate";
end;

define inline-only C-function gtk-grid-view-set-enable-rubberband
  input parameter self :: <GtkGridView>;
  input parameter enable_rubberband_ :: <C-boolean>;
  c-name: "gtk_grid_view_set_enable_rubberband";
end;

define inline-only C-function gtk-grid-view-set-factory
  input parameter self :: <GtkGridView>;
  input parameter factory_ :: <GtkListItemFactory>;
  c-name: "gtk_grid_view_set_factory";
end;

define inline-only C-function gtk-grid-view-set-max-columns
  input parameter self :: <GtkGridView>;
  input parameter max_columns_ :: <C-unsigned-int>;
  c-name: "gtk_grid_view_set_max_columns";
end;

define inline-only C-function gtk-grid-view-set-min-columns
  input parameter self :: <GtkGridView>;
  input parameter min_columns_ :: <C-unsigned-int>;
  c-name: "gtk_grid_view_set_min_columns";
end;

define inline-only C-function gtk-grid-view-set-model
  input parameter self :: <GtkGridView>;
  input parameter model_ :: <GtkSelectionModel>;
  c-name: "gtk_grid_view_set_model";
end;

define inline-only C-function gtk-grid-view-set-single-click-activate
  input parameter self :: <GtkGridView>;
  input parameter single_click_activate_ :: <C-boolean>;
  c-name: "gtk_grid_view_set_single_click_activate";
end;

define C-struct <_GtkGridViewClass>
  pointer-type-name: <GtkGridViewClass>;
end C-struct;

define sealed domain make (singleton(<GtkGridViewClass>));
define sealed domain initialize (<GtkGridViewClass>);

define open C-subtype <GtkHeaderBar> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkHeaderBar*> => <GtkHeaderBar>;

define sealed domain make (singleton(<GtkHeaderBar*>));
define sealed domain initialize (<GtkHeaderBar*>);

define inline-only C-function gtk-header-bar-new
  result res :: <GtkWidget>;
  c-name: "gtk_header_bar_new";
end;

define inline-only C-function gtk-header-bar-get-decoration-layout
  input parameter self :: <GtkHeaderBar>;
  result res :: <C-string>;
  c-name: "gtk_header_bar_get_decoration_layout";
end;

define inline-only C-function gtk-header-bar-get-show-title-buttons
  input parameter self :: <GtkHeaderBar>;
  result res :: <C-boolean>;
  c-name: "gtk_header_bar_get_show_title_buttons";
end;

define inline-only C-function gtk-header-bar-get-title-widget
  input parameter self :: <GtkHeaderBar>;
  result res :: <GtkWidget>;
  c-name: "gtk_header_bar_get_title_widget";
end;

define inline-only C-function gtk-header-bar-pack-end
  input parameter self :: <GtkHeaderBar>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_header_bar_pack_end";
end;

define inline-only C-function gtk-header-bar-pack-start
  input parameter self :: <GtkHeaderBar>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_header_bar_pack_start";
end;

define inline-only C-function gtk-header-bar-remove
  input parameter self :: <GtkHeaderBar>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_header_bar_remove";
end;

define inline-only C-function gtk-header-bar-set-decoration-layout
  input parameter self :: <GtkHeaderBar>;
  input parameter layout_ :: <C-string>;
  c-name: "gtk_header_bar_set_decoration_layout";
end;

define inline-only C-function gtk-header-bar-set-show-title-buttons
  input parameter self :: <GtkHeaderBar>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_header_bar_set_show_title_buttons";
end;

define inline-only C-function gtk-header-bar-set-title-widget
  input parameter self :: <GtkHeaderBar>;
  input parameter title_widget_ :: <GtkWidget>;
  c-name: "gtk_header_bar_set_title_widget";
end;

define open C-subtype <GtkIMContext> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkIMContext*> => <GtkIMContext>;

define sealed domain make (singleton(<GtkIMContext*>));
define sealed domain initialize (<GtkIMContext*>);

define inline-only C-function gtk-im-context-delete-surrounding
  input parameter self :: <GtkIMContext>;
  input parameter offset_ :: <C-signed-int>;
  input parameter n_chars_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_im_context_delete_surrounding";
end;

define inline-only C-function gtk-im-context-filter-key
  input parameter self :: <GtkIMContext>;
  input parameter press_ :: <C-boolean>;
  input parameter surface_ :: <GdkSurface>;
  input parameter device_ :: <GdkDevice>;
  input parameter time_ :: <C-unsigned-int>;
  input parameter keycode_ :: <C-unsigned-int>;
  input parameter state_ :: <GdkModifierType>;
  input parameter group_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_im_context_filter_key";
end;

define inline-only C-function gtk-im-context-filter-keypress
  input parameter self :: <GtkIMContext>;
  input parameter event_ :: <GdkEvent>;
  result res :: <C-boolean>;
  c-name: "gtk_im_context_filter_keypress";
end;

define inline-only C-function gtk-im-context-focus-in
  input parameter self :: <GtkIMContext>;
  c-name: "gtk_im_context_focus_in";
end;

define inline-only C-function gtk-im-context-focus-out
  input parameter self :: <GtkIMContext>;
  c-name: "gtk_im_context_focus_out";
end;

define inline-only C-function gtk-im-context-get-preedit-string
  input parameter self :: <GtkIMContext>;
  output parameter str_ :: <C-string>;
  input parameter attrs_ :: <PangoAttrList>;
  output parameter cursor_pos_ :: <C-signed-int*>;
  c-name: "gtk_im_context_get_preedit_string";
end;

define inline-only C-function gtk-im-context-get-surrounding-with-selection
  input parameter self :: <GtkIMContext>;
  output parameter text_ :: <C-string>;
  output parameter cursor_index_ :: <C-signed-int*>;
  output parameter anchor_index_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_im_context_get_surrounding_with_selection";
end;

define inline-only C-function gtk-im-context-reset
  input parameter self :: <GtkIMContext>;
  c-name: "gtk_im_context_reset";
end;

define inline-only C-function gtk-im-context-set-client-widget
  input parameter self :: <GtkIMContext>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_im_context_set_client_widget";
end;

define inline-only C-function gtk-im-context-set-cursor-location
  input parameter self :: <GtkIMContext>;
  input parameter area_ :: <GdkRectangle>;
  c-name: "gtk_im_context_set_cursor_location";
end;

define inline-only C-function gtk-im-context-set-surrounding-with-selection
  input parameter self :: <GtkIMContext>;
  input parameter text_ :: <C-string>;
  input parameter len_ :: <C-signed-int>;
  input parameter cursor_index_ :: <C-signed-int>;
  input parameter anchor_index_ :: <C-signed-int>;
  c-name: "gtk_im_context_set_surrounding_with_selection";
end;

define inline-only C-function gtk-im-context-set-use-preedit
  input parameter self :: <GtkIMContext>;
  input parameter use_preedit_ :: <C-boolean>;
  c-name: "gtk_im_context_set_use_preedit";
end;

define C-struct <_GtkIMContextClass>
  constant sealed inline-only slot gtk-im-context-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-im-context-class-preedit-start :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-preedit-end :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-preedit-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-commit :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-retrieve-surrounding :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-delete-surrounding :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-set-client-widget :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-get-preedit-string :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-filter-keypress :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-focus-in :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-focus-out :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-reset :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-set-cursor-location :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-set-use-preedit :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-set-surrounding :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-get-surrounding :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-set-surrounding-with-selection :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-get-surrounding-with-selection :: <C-function-pointer>;
  constant sealed inline-only slot gtk-im-context-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-im-context-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-im-context-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-im-context-class-_gtk-reserved4 :: <C-void*>;
  constant sealed inline-only slot gtk-im-context-class-_gtk-reserved5 :: <C-void*>;
  pointer-type-name: <GtkIMContextClass>;
end C-struct;

define sealed domain make (singleton(<GtkIMContextClass>));
define sealed domain initialize (<GtkIMContextClass>);

define open C-subtype <GtkIMContextSimple> (<GtkIMContext>)
  // object
  // priv
end C-subtype;

define C-pointer-type <GtkIMContextSimple*> => <GtkIMContextSimple>;

define sealed domain make (singleton(<GtkIMContextSimple*>));
define sealed domain initialize (<GtkIMContextSimple*>);

define inline-only C-function gtk-im-context-simple-new
  result res :: <GtkIMContext>;
  c-name: "gtk_im_context_simple_new";
end;

define inline-only C-function gtk-im-context-simple-add-compose-file
  input parameter self :: <GtkIMContextSimple>;
  input parameter compose_file_ :: <C-string>;
  c-name: "gtk_im_context_simple_add_compose_file";
end;

define C-struct <_GtkIMContextSimpleClass>
  constant sealed inline-only slot gtk-im-context-simple-class-parent-class :: <GtkIMContextClass>;
  pointer-type-name: <GtkIMContextSimpleClass>;
end C-struct;

define sealed domain make (singleton(<GtkIMContextSimpleClass>));
define sealed domain initialize (<GtkIMContextSimpleClass>);

define C-struct <_GtkIMContextSimplePrivate>
  pointer-type-name: <GtkIMContextSimplePrivate>;
end C-struct;

define sealed domain make (singleton(<GtkIMContextSimplePrivate>));
define sealed domain initialize (<GtkIMContextSimplePrivate>);

define open C-subtype <GtkIMMulticontext> (<GtkIMContext>)
  // object
  // priv
end C-subtype;

define C-pointer-type <GtkIMMulticontext*> => <GtkIMMulticontext>;

define sealed domain make (singleton(<GtkIMMulticontext*>));
define sealed domain initialize (<GtkIMMulticontext*>);

define inline-only C-function gtk-im-multicontext-new
  result res :: <GtkIMContext>;
  c-name: "gtk_im_multicontext_new";
end;

define inline-only C-function gtk-im-multicontext-get-context-id
  input parameter self :: <GtkIMMulticontext>;
  result res :: <C-string>;
  c-name: "gtk_im_multicontext_get_context_id";
end;

define inline-only C-function gtk-im-multicontext-set-context-id
  input parameter self :: <GtkIMMulticontext>;
  input parameter context_id_ :: <C-string>;
  c-name: "gtk_im_multicontext_set_context_id";
end;

define C-struct <_GtkIMMulticontextClass>
  constant sealed inline-only slot gtk-im-multicontext-class-parent-class :: <GtkIMContextClass>;
  constant sealed inline-only slot gtk-im-multicontext-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-im-multicontext-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-im-multicontext-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-im-multicontext-class-_gtk-reserved4 :: <C-void*>;
  pointer-type-name: <GtkIMMulticontextClass>;
end C-struct;

define sealed domain make (singleton(<GtkIMMulticontextClass>));
define sealed domain initialize (<GtkIMMulticontextClass>);

define C-struct <_GtkIMMulticontextPrivate>
  pointer-type-name: <GtkIMMulticontextPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkIMMulticontextPrivate>));
define sealed domain initialize (<GtkIMMulticontextPrivate>);

define inline-only constant $im-module-extension-point-name = "gtk-im-module";

define inline-only constant $input-error = -1;

define inline-only constant $gtk-interface-age = 3;

define inline-only constant $invalid-list-position = 4294967295;

define inline-only constant $gtk-icon-lookup-force-regular = 1;
define inline-only constant $gtk-icon-lookup-force-symbolic = 2;
define inline-only constant $gtk-icon-lookup-preload = 4;
define constant <GtkIconLookupFlags> = <C-int>;
define C-pointer-type <GtkIconLookupFlags*> => <GtkIconLookupFlags>;

define open C-subtype <GtkIconPaintable> (<GObject>, <GtkSymbolicPaintable>)
end C-subtype;

define C-pointer-type <GtkIconPaintable*> => <GtkIconPaintable>;

define sealed domain make (singleton(<GtkIconPaintable*>));
define sealed domain initialize (<GtkIconPaintable*>);

define inline-only C-function gtk-icon-paintable-new-for-file
  input parameter file_ :: <GFile>;
  input parameter size_ :: <C-signed-int>;
  input parameter scale_ :: <C-signed-int>;
  result res :: <GtkIconPaintable>;
  c-name: "gtk_icon_paintable_new_for_file";
end;

define inline-only C-function gtk-icon-paintable-get-file
  input parameter self :: <GtkIconPaintable>;
  result res :: <GFile>;
  c-name: "gtk_icon_paintable_get_file";
end;

define inline-only C-function gtk-icon-paintable-get-icon-name
  input parameter self :: <GtkIconPaintable>;
  result res :: <C-string>;
  c-name: "gtk_icon_paintable_get_icon_name";
end;

define inline-only C-function gtk-icon-paintable-is-symbolic
  input parameter self :: <GtkIconPaintable>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_paintable_is_symbolic";
end;

define inline-only constant $gtk-icon-size-inherit = 0;
define inline-only constant $gtk-icon-size-normal = 1;
define inline-only constant $gtk-icon-size-large = 2;
define constant <GtkIconSize> = <C-int>;
define C-pointer-type <GtkIconSize*> => <GtkIconSize>;

define open C-subtype <GtkIconTheme> (<GObject>)
end C-subtype;

define C-pointer-type <GtkIconTheme*> => <GtkIconTheme>;

define sealed domain make (singleton(<GtkIconTheme*>));
define sealed domain initialize (<GtkIconTheme*>);

define inline-only C-function gtk-icon-theme-new
  result res :: <GtkIconTheme>;
  c-name: "gtk_icon_theme_new";
end;

define inline-only C-function gtk-icon-theme-get-for-display
  input parameter display_ :: <GdkDisplay>;
  result res :: <GtkIconTheme>;
  c-name: "gtk_icon_theme_get_for_display";
end;

define inline-only C-function gtk-icon-theme-add-resource-path
  input parameter self :: <GtkIconTheme>;
  input parameter path_ :: <C-string>;
  c-name: "gtk_icon_theme_add_resource_path";
end;

define inline-only C-function gtk-icon-theme-add-search-path
  input parameter self :: <GtkIconTheme>;
  input parameter path_ :: <C-string>;
  c-name: "gtk_icon_theme_add_search_path";
end;

define inline-only C-function gtk-icon-theme-get-display
  input parameter self :: <GtkIconTheme>;
  result res :: <GdkDisplay>;
  c-name: "gtk_icon_theme_get_display";
end;

define inline-only C-function gtk-icon-theme-get-icon-names
  input parameter self :: <GtkIconTheme>;
  result res :: <C-string*>;
  c-name: "gtk_icon_theme_get_icon_names";
end;

define inline-only C-function gtk-icon-theme-get-icon-sizes
  input parameter self :: <GtkIconTheme>;
  input parameter icon_name_ :: <C-string>;
  result res :: <C-signed-int*>;
  c-name: "gtk_icon_theme_get_icon_sizes";
end;

define inline-only C-function gtk-icon-theme-get-resource-path
  input parameter self :: <GtkIconTheme>;
  result res :: <C-string*>;
  c-name: "gtk_icon_theme_get_resource_path";
end;

define inline-only C-function gtk-icon-theme-get-search-path
  input parameter self :: <GtkIconTheme>;
  result res :: <C-string*>;
  c-name: "gtk_icon_theme_get_search_path";
end;

define inline-only C-function gtk-icon-theme-get-theme-name
  input parameter self :: <GtkIconTheme>;
  result res :: <C-string>;
  c-name: "gtk_icon_theme_get_theme_name";
end;

define inline-only C-function gtk-icon-theme-has-gicon
  input parameter self :: <GtkIconTheme>;
  input parameter gicon_ :: <GIcon>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_theme_has_gicon";
end;

define inline-only C-function gtk-icon-theme-has-icon
  input parameter self :: <GtkIconTheme>;
  input parameter icon_name_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_theme_has_icon";
end;

define inline-only C-function gtk-icon-theme-lookup-by-gicon
  input parameter self :: <GtkIconTheme>;
  input parameter icon_ :: <GIcon>;
  input parameter size_ :: <C-signed-int>;
  input parameter scale_ :: <C-signed-int>;
  input parameter direction_ :: <GtkTextDirection>;
  input parameter flags_ :: <GtkIconLookupFlags>;
  result res :: <GtkIconPaintable>;
  c-name: "gtk_icon_theme_lookup_by_gicon";
end;

define inline-only C-function gtk-icon-theme-lookup-icon
  input parameter self :: <GtkIconTheme>;
  input parameter icon_name_ :: <C-string>;
  input parameter fallbacks_ :: <C-string*>;
  input parameter size_ :: <C-signed-int>;
  input parameter scale_ :: <C-signed-int>;
  input parameter direction_ :: <GtkTextDirection>;
  input parameter flags_ :: <GtkIconLookupFlags>;
  result res :: <GtkIconPaintable>;
  c-name: "gtk_icon_theme_lookup_icon";
end;

define inline-only C-function gtk-icon-theme-set-resource-path
  input parameter self :: <GtkIconTheme>;
  input parameter path_ :: <C-string*>;
  c-name: "gtk_icon_theme_set_resource_path";
end;

define inline-only C-function gtk-icon-theme-set-search-path
  input parameter self :: <GtkIconTheme>;
  input parameter path_ :: <C-string*>;
  c-name: "gtk_icon_theme_set_search_path";
end;

define inline-only C-function gtk-icon-theme-set-theme-name
  input parameter self :: <GtkIconTheme>;
  input parameter theme_name_ :: <C-string>;
  c-name: "gtk_icon_theme_set_theme_name";
end;

define inline-only constant $gtk-icon-theme-not-found = 0;
define inline-only constant $gtk-icon-theme-failed = 1;
define constant <GtkIconThemeError> = <C-int>;
define C-pointer-type <GtkIconThemeError*> => <GtkIconThemeError>;

define open C-subtype <GtkIconView> (<GtkWidget>, <GtkCellLayout>, <GtkScrollable>)
end C-subtype;

define C-pointer-type <GtkIconView*> => <GtkIconView>;

define sealed domain make (singleton(<GtkIconView*>));
define sealed domain initialize (<GtkIconView*>);

define inline-only C-function gtk-icon-view-new
  result res :: <GtkWidget>;
  c-name: "gtk_icon_view_new";
end;

define inline-only C-function gtk-icon-view-new-with-area
  input parameter area_ :: <GtkCellArea>;
  result res :: <GtkWidget>;
  c-name: "gtk_icon_view_new_with_area";
end;

define inline-only C-function gtk-icon-view-new-with-model
  input parameter model_ :: <GtkTreeModel>;
  result res :: <GtkWidget>;
  c-name: "gtk_icon_view_new_with_model";
end;

define inline-only C-function gtk-icon-view-create-drag-icon
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <GdkPaintable>;
  c-name: "gtk_icon_view_create_drag_icon";
end;

define inline-only C-function gtk-icon-view-enable-model-drag-dest
  input parameter self :: <GtkIconView>;
  input parameter formats_ :: <GdkContentFormats>;
  input parameter actions_ :: <GdkDragAction>;
  c-name: "gtk_icon_view_enable_model_drag_dest";
end;

define inline-only C-function gtk-icon-view-enable-model-drag-source
  input parameter self :: <GtkIconView>;
  input parameter start_button_mask_ :: <GdkModifierType>;
  input parameter formats_ :: <GdkContentFormats>;
  input parameter actions_ :: <GdkDragAction>;
  c-name: "gtk_icon_view_enable_model_drag_source";
end;

define inline-only C-function gtk-icon-view-get-activate-on-single-click
  input parameter self :: <GtkIconView>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_view_get_activate_on_single_click";
end;

define inline-only C-function gtk-icon-view-get-cell-rect
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter rect_ :: <GdkRectangle>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_view_get_cell_rect";
end;

define inline-only C-function gtk-icon-view-get-column-spacing
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_column_spacing";
end;

define inline-only C-function gtk-icon-view-get-columns
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_columns";
end;

define inline-only C-function gtk-icon-view-get-cursor
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  output parameter cell_ :: <GtkCellRenderer*>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_view_get_cursor";
end;

define inline-only C-function gtk-icon-view-get-dest-item-at-pos
  input parameter self :: <GtkIconView>;
  input parameter drag_x_ :: <C-signed-int>;
  input parameter drag_y_ :: <C-signed-int>;
  input parameter path_ :: <GtkTreePath>;
  output parameter pos_ :: <GtkIconViewDropPosition*>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_view_get_dest_item_at_pos";
end;

define inline-only C-function gtk-icon-view-get-drag-dest-item
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  output parameter pos_ :: <GtkIconViewDropPosition*>;
  c-name: "gtk_icon_view_get_drag_dest_item";
end;

define inline-only C-function gtk-icon-view-get-item-at-pos
  input parameter self :: <GtkIconView>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  input parameter path_ :: <GtkTreePath>;
  output parameter cell_ :: <GtkCellRenderer*>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_view_get_item_at_pos";
end;

define inline-only C-function gtk-icon-view-get-item-column
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_item_column";
end;

define inline-only C-function gtk-icon-view-get-item-orientation
  input parameter self :: <GtkIconView>;
  result res :: <GtkOrientation>;
  c-name: "gtk_icon_view_get_item_orientation";
end;

define inline-only C-function gtk-icon-view-get-item-padding
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_item_padding";
end;

define inline-only C-function gtk-icon-view-get-item-row
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_item_row";
end;

define inline-only C-function gtk-icon-view-get-item-width
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_item_width";
end;

define inline-only C-function gtk-icon-view-get-margin
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_margin";
end;

define inline-only C-function gtk-icon-view-get-markup-column
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_markup_column";
end;

define inline-only C-function gtk-icon-view-get-model
  input parameter self :: <GtkIconView>;
  result res :: <GtkTreeModel>;
  c-name: "gtk_icon_view_get_model";
end;

define inline-only C-function gtk-icon-view-get-path-at-pos
  input parameter self :: <GtkIconView>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  result res :: <GtkTreePath>;
  c-name: "gtk_icon_view_get_path_at_pos";
end;

define inline-only C-function gtk-icon-view-get-pixbuf-column
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_pixbuf_column";
end;

define inline-only C-function gtk-icon-view-get-reorderable
  input parameter self :: <GtkIconView>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_view_get_reorderable";
end;

define inline-only C-function gtk-icon-view-get-row-spacing
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_row_spacing";
end;

define inline-only C-function gtk-icon-view-get-selected-items
  input parameter self :: <GtkIconView>;
  result res :: <GList>;
  c-name: "gtk_icon_view_get_selected_items";
end;

define inline-only C-function gtk-icon-view-get-selection-mode
  input parameter self :: <GtkIconView>;
  result res :: <GtkSelectionMode>;
  c-name: "gtk_icon_view_get_selection_mode";
end;

define inline-only C-function gtk-icon-view-get-spacing
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_spacing";
end;

define inline-only C-function gtk-icon-view-get-text-column
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_text_column";
end;

define inline-only C-function gtk-icon-view-get-tooltip-column
  input parameter self :: <GtkIconView>;
  result res :: <C-signed-int>;
  c-name: "gtk_icon_view_get_tooltip_column";
end;

define inline-only C-function gtk-icon-view-get-tooltip-context
  input parameter self :: <GtkIconView>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  input parameter keyboard_tip_ :: <C-boolean>;
  output parameter model_ :: <GtkTreeModel*>;
  input parameter path_ :: <GtkTreePath>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_view_get_tooltip_context";
end;

define inline-only C-function gtk-icon-view-get-visible-range
  input parameter self :: <GtkIconView>;
  input parameter start_path_ :: <GtkTreePath>;
  input parameter end_path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_view_get_visible_range";
end;

define inline-only C-function gtk-icon-view-item-activated
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_icon_view_item_activated";
end;

define inline-only C-function gtk-icon-view-path-is-selected
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_icon_view_path_is_selected";
end;

define inline-only C-function gtk-icon-view-scroll-to-path
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter use_align_ :: <C-boolean>;
  input parameter row_align_ :: <C-float>;
  input parameter col_align_ :: <C-float>;
  c-name: "gtk_icon_view_scroll_to_path";
end;

define inline-only C-function gtk-icon-view-select-all
  input parameter self :: <GtkIconView>;
  c-name: "gtk_icon_view_select_all";
end;

define inline-only C-function gtk-icon-view-select-path
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_icon_view_select_path";
end;

define inline-only C-function gtk-icon-view-selected-foreach
  input parameter self :: <GtkIconView>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  c-name: "gtk_icon_view_selected_foreach";
end;

define inline-only C-function gtk-icon-view-set-activate-on-single-click
  input parameter self :: <GtkIconView>;
  input parameter single_ :: <C-boolean>;
  c-name: "gtk_icon_view_set_activate_on_single_click";
end;

define inline-only C-function gtk-icon-view-set-column-spacing
  input parameter self :: <GtkIconView>;
  input parameter column_spacing_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_column_spacing";
end;

define inline-only C-function gtk-icon-view-set-columns
  input parameter self :: <GtkIconView>;
  input parameter columns_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_columns";
end;

define inline-only C-function gtk-icon-view-set-cursor
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter start_editing_ :: <C-boolean>;
  c-name: "gtk_icon_view_set_cursor";
end;

define inline-only C-function gtk-icon-view-set-drag-dest-item
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter pos_ :: <GtkIconViewDropPosition>;
  c-name: "gtk_icon_view_set_drag_dest_item";
end;

define inline-only C-function gtk-icon-view-set-item-orientation
  input parameter self :: <GtkIconView>;
  input parameter orientation_ :: <GtkOrientation>;
  c-name: "gtk_icon_view_set_item_orientation";
end;

define inline-only C-function gtk-icon-view-set-item-padding
  input parameter self :: <GtkIconView>;
  input parameter item_padding_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_item_padding";
end;

define inline-only C-function gtk-icon-view-set-item-width
  input parameter self :: <GtkIconView>;
  input parameter item_width_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_item_width";
end;

define inline-only C-function gtk-icon-view-set-margin
  input parameter self :: <GtkIconView>;
  input parameter margin_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_margin";
end;

define inline-only C-function gtk-icon-view-set-markup-column
  input parameter self :: <GtkIconView>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_markup_column";
end;

define inline-only C-function gtk-icon-view-set-model
  input parameter self :: <GtkIconView>;
  input parameter model_ :: <GtkTreeModel>;
  c-name: "gtk_icon_view_set_model";
end;

define inline-only C-function gtk-icon-view-set-pixbuf-column
  input parameter self :: <GtkIconView>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_pixbuf_column";
end;

define inline-only C-function gtk-icon-view-set-reorderable
  input parameter self :: <GtkIconView>;
  input parameter reorderable_ :: <C-boolean>;
  c-name: "gtk_icon_view_set_reorderable";
end;

define inline-only C-function gtk-icon-view-set-row-spacing
  input parameter self :: <GtkIconView>;
  input parameter row_spacing_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_row_spacing";
end;

define inline-only C-function gtk-icon-view-set-selection-mode
  input parameter self :: <GtkIconView>;
  input parameter mode_ :: <GtkSelectionMode>;
  c-name: "gtk_icon_view_set_selection_mode";
end;

define inline-only C-function gtk-icon-view-set-spacing
  input parameter self :: <GtkIconView>;
  input parameter spacing_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_spacing";
end;

define inline-only C-function gtk-icon-view-set-text-column
  input parameter self :: <GtkIconView>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_text_column";
end;

define inline-only C-function gtk-icon-view-set-tooltip-cell
  input parameter self :: <GtkIconView>;
  input parameter tooltip_ :: <GtkTooltip>;
  input parameter path_ :: <GtkTreePath>;
  input parameter cell_ :: <GtkCellRenderer>;
  c-name: "gtk_icon_view_set_tooltip_cell";
end;

define inline-only C-function gtk-icon-view-set-tooltip-column
  input parameter self :: <GtkIconView>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_icon_view_set_tooltip_column";
end;

define inline-only C-function gtk-icon-view-set-tooltip-item
  input parameter self :: <GtkIconView>;
  input parameter tooltip_ :: <GtkTooltip>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_icon_view_set_tooltip_item";
end;

define inline-only C-function gtk-icon-view-unselect-all
  input parameter self :: <GtkIconView>;
  c-name: "gtk_icon_view_unselect_all";
end;

define inline-only C-function gtk-icon-view-unselect-path
  input parameter self :: <GtkIconView>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_icon_view_unselect_path";
end;

define inline-only C-function gtk-icon-view-unset-model-drag-dest
  input parameter self :: <GtkIconView>;
  c-name: "gtk_icon_view_unset_model_drag_dest";
end;

define inline-only C-function gtk-icon-view-unset-model-drag-source
  input parameter self :: <GtkIconView>;
  c-name: "gtk_icon_view_unset_model_drag_source";
end;

define inline-only constant $gtk-icon-view-no-drop = 0;
define inline-only constant $gtk-icon-view-drop-into = 1;
define inline-only constant $gtk-icon-view-drop-left = 2;
define inline-only constant $gtk-icon-view-drop-right = 3;
define inline-only constant $gtk-icon-view-drop-above = 4;
define inline-only constant $gtk-icon-view-drop-below = 5;
define constant <GtkIconViewDropPosition> = <C-int>;
define C-pointer-type <GtkIconViewDropPosition*> => <GtkIconViewDropPosition>;

define open C-subtype <GtkImage> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkImage*> => <GtkImage>;

define sealed domain make (singleton(<GtkImage*>));
define sealed domain initialize (<GtkImage*>);

define inline-only C-function gtk-image-new
  result res :: <GtkWidget>;
  c-name: "gtk_image_new";
end;

define inline-only C-function gtk-image-new-from-file
  input parameter filename_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_image_new_from_file";
end;

define inline-only C-function gtk-image-new-from-gicon
  input parameter icon_ :: <GIcon>;
  result res :: <GtkWidget>;
  c-name: "gtk_image_new_from_gicon";
end;

define inline-only C-function gtk-image-new-from-icon-name
  input parameter icon_name_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_image_new_from_icon_name";
end;

define inline-only C-function gtk-image-new-from-paintable
  input parameter paintable_ :: <GdkPaintable>;
  result res :: <GtkWidget>;
  c-name: "gtk_image_new_from_paintable";
end;

define inline-only C-function gtk-image-new-from-pixbuf
  input parameter pixbuf_ :: <GdkPixbuf>;
  result res :: <GtkWidget>;
  c-name: "gtk_image_new_from_pixbuf";
end;

define inline-only C-function gtk-image-new-from-resource
  input parameter resource_path_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_image_new_from_resource";
end;

define inline-only C-function gtk-image-clear
  input parameter self :: <GtkImage>;
  c-name: "gtk_image_clear";
end;

define inline-only C-function gtk-image-get-gicon
  input parameter self :: <GtkImage>;
  result res :: <GIcon>;
  c-name: "gtk_image_get_gicon";
end;

define inline-only C-function gtk-image-get-icon-name
  input parameter self :: <GtkImage>;
  result res :: <C-string>;
  c-name: "gtk_image_get_icon_name";
end;

define inline-only C-function gtk-image-get-icon-size
  input parameter self :: <GtkImage>;
  result res :: <GtkIconSize>;
  c-name: "gtk_image_get_icon_size";
end;

define inline-only C-function gtk-image-get-paintable
  input parameter self :: <GtkImage>;
  result res :: <GdkPaintable>;
  c-name: "gtk_image_get_paintable";
end;

define inline-only C-function gtk-image-get-pixel-size
  input parameter self :: <GtkImage>;
  result res :: <C-signed-int>;
  c-name: "gtk_image_get_pixel_size";
end;

define inline-only C-function gtk-image-get-storage-type
  input parameter self :: <GtkImage>;
  result res :: <GtkImageType>;
  c-name: "gtk_image_get_storage_type";
end;

define inline-only C-function gtk-image-set-from-file
  input parameter self :: <GtkImage>;
  input parameter filename_ :: <C-string>;
  c-name: "gtk_image_set_from_file";
end;

define inline-only C-function gtk-image-set-from-gicon
  input parameter self :: <GtkImage>;
  input parameter icon_ :: <GIcon>;
  c-name: "gtk_image_set_from_gicon";
end;

define inline-only C-function gtk-image-set-from-icon-name
  input parameter self :: <GtkImage>;
  input parameter icon_name_ :: <C-string>;
  c-name: "gtk_image_set_from_icon_name";
end;

define inline-only C-function gtk-image-set-from-paintable
  input parameter self :: <GtkImage>;
  input parameter paintable_ :: <GdkPaintable>;
  c-name: "gtk_image_set_from_paintable";
end;

define inline-only C-function gtk-image-set-from-pixbuf
  input parameter self :: <GtkImage>;
  input parameter pixbuf_ :: <GdkPixbuf>;
  c-name: "gtk_image_set_from_pixbuf";
end;

define inline-only C-function gtk-image-set-from-resource
  input parameter self :: <GtkImage>;
  input parameter resource_path_ :: <C-string>;
  c-name: "gtk_image_set_from_resource";
end;

define inline-only C-function gtk-image-set-icon-size
  input parameter self :: <GtkImage>;
  input parameter icon_size_ :: <GtkIconSize>;
  c-name: "gtk_image_set_icon_size";
end;

define inline-only C-function gtk-image-set-pixel-size
  input parameter self :: <GtkImage>;
  input parameter pixel_size_ :: <C-signed-int>;
  c-name: "gtk_image_set_pixel_size";
end;

define inline-only constant $gtk-image-empty = 0;
define inline-only constant $gtk-image-icon-name = 1;
define inline-only constant $gtk-image-gicon = 2;
define inline-only constant $gtk-image-paintable = 3;
define constant <GtkImageType> = <C-int>;
define C-pointer-type <GtkImageType*> => <GtkImageType>;

define open C-subtype <GtkInfoBar> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkInfoBar*> => <GtkInfoBar>;

define sealed domain make (singleton(<GtkInfoBar*>));
define sealed domain initialize (<GtkInfoBar*>);

define inline-only C-function gtk-info-bar-new
  result res :: <GtkWidget>;
  c-name: "gtk_info_bar_new";
end;

define inline-only C-function gtk-info-bar-add-action-widget
  input parameter self :: <GtkInfoBar>;
  input parameter child_ :: <GtkWidget>;
  input parameter response_id_ :: <C-signed-int>;
  c-name: "gtk_info_bar_add_action_widget";
end;

define inline-only C-function gtk-info-bar-add-button
  input parameter self :: <GtkInfoBar>;
  input parameter button_text_ :: <C-string>;
  input parameter response_id_ :: <C-signed-int>;
  result res :: <GtkButton>;
  c-name: "gtk_info_bar_add_button";
end;

define inline-only C-function gtk-info-bar-add-child
  input parameter self :: <GtkInfoBar>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_info_bar_add_child";
end;

define inline-only C-function gtk-info-bar-get-message-type
  input parameter self :: <GtkInfoBar>;
  result res :: <GtkMessageType>;
  c-name: "gtk_info_bar_get_message_type";
end;

define inline-only C-function gtk-info-bar-get-revealed
  input parameter self :: <GtkInfoBar>;
  result res :: <C-boolean>;
  c-name: "gtk_info_bar_get_revealed";
end;

define inline-only C-function gtk-info-bar-get-show-close-button
  input parameter self :: <GtkInfoBar>;
  result res :: <C-boolean>;
  c-name: "gtk_info_bar_get_show_close_button";
end;

define inline-only C-function gtk-info-bar-remove-action-widget
  input parameter self :: <GtkInfoBar>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_info_bar_remove_action_widget";
end;

define inline-only C-function gtk-info-bar-remove-child
  input parameter self :: <GtkInfoBar>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_info_bar_remove_child";
end;

define inline-only C-function gtk-info-bar-response
  input parameter self :: <GtkInfoBar>;
  input parameter response_id_ :: <C-signed-int>;
  c-name: "gtk_info_bar_response";
end;

define inline-only C-function gtk-info-bar-set-default-response
  input parameter self :: <GtkInfoBar>;
  input parameter response_id_ :: <C-signed-int>;
  c-name: "gtk_info_bar_set_default_response";
end;

define inline-only C-function gtk-info-bar-set-message-type
  input parameter self :: <GtkInfoBar>;
  input parameter message_type_ :: <GtkMessageType>;
  c-name: "gtk_info_bar_set_message_type";
end;

define inline-only C-function gtk-info-bar-set-response-sensitive
  input parameter self :: <GtkInfoBar>;
  input parameter response_id_ :: <C-signed-int>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_info_bar_set_response_sensitive";
end;

define inline-only C-function gtk-info-bar-set-revealed
  input parameter self :: <GtkInfoBar>;
  input parameter revealed_ :: <C-boolean>;
  c-name: "gtk_info_bar_set_revealed";
end;

define inline-only C-function gtk-info-bar-set-show-close-button
  input parameter self :: <GtkInfoBar>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_info_bar_set_show_close_button";
end;

define inline-only constant $gtk-input-hint-none = 0;
define inline-only constant $gtk-input-hint-spellcheck = 1;
define inline-only constant $gtk-input-hint-no-spellcheck = 2;
define inline-only constant $gtk-input-hint-word-completion = 4;
define inline-only constant $gtk-input-hint-lowercase = 8;
define inline-only constant $gtk-input-hint-uppercase-chars = 16;
define inline-only constant $gtk-input-hint-uppercase-words = 32;
define inline-only constant $gtk-input-hint-uppercase-sentences = 64;
define inline-only constant $gtk-input-hint-inhibit-osk = 128;
define inline-only constant $gtk-input-hint-vertical-writing = 256;
define inline-only constant $gtk-input-hint-emoji = 512;
define inline-only constant $gtk-input-hint-no-emoji = 1024;
define inline-only constant $gtk-input-hint-private = 2048;
define constant <GtkInputHints> = <C-int>;
define C-pointer-type <GtkInputHints*> => <GtkInputHints>;

define inline-only constant $gtk-input-purpose-free-form = 0;
define inline-only constant $gtk-input-purpose-alpha = 1;
define inline-only constant $gtk-input-purpose-digits = 2;
define inline-only constant $gtk-input-purpose-number = 3;
define inline-only constant $gtk-input-purpose-phone = 4;
define inline-only constant $gtk-input-purpose-url = 5;
define inline-only constant $gtk-input-purpose-email = 6;
define inline-only constant $gtk-input-purpose-name = 7;
define inline-only constant $gtk-input-purpose-password = 8;
define inline-only constant $gtk-input-purpose-pin = 9;
define inline-only constant $gtk-input-purpose-terminal = 10;
define constant <GtkInputPurpose> = <C-int>;
define C-pointer-type <GtkInputPurpose*> => <GtkInputPurpose>;

define open C-subtype <GtkInscription> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkInscription*> => <GtkInscription>;

define sealed domain make (singleton(<GtkInscription*>));
define sealed domain initialize (<GtkInscription*>);

define inline-only C-function gtk-inscription-new
  input parameter text_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_inscription_new";
end;

define inline-only C-function gtk-inscription-get-attributes
  input parameter self :: <GtkInscription>;
  result res :: <PangoAttrList>;
  c-name: "gtk_inscription_get_attributes";
end;

define inline-only C-function gtk-inscription-get-min-chars
  input parameter self :: <GtkInscription>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_inscription_get_min_chars";
end;

define inline-only C-function gtk-inscription-get-min-lines
  input parameter self :: <GtkInscription>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_inscription_get_min_lines";
end;

define inline-only C-function gtk-inscription-get-nat-chars
  input parameter self :: <GtkInscription>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_inscription_get_nat_chars";
end;

define inline-only C-function gtk-inscription-get-nat-lines
  input parameter self :: <GtkInscription>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_inscription_get_nat_lines";
end;

define inline-only C-function gtk-inscription-get-text
  input parameter self :: <GtkInscription>;
  result res :: <C-string>;
  c-name: "gtk_inscription_get_text";
end;

define inline-only C-function gtk-inscription-get-text-overflow
  input parameter self :: <GtkInscription>;
  result res :: <GtkInscriptionOverflow>;
  c-name: "gtk_inscription_get_text_overflow";
end;

define inline-only C-function gtk-inscription-get-wrap-mode
  input parameter self :: <GtkInscription>;
  result res :: <PangoWrapMode>;
  c-name: "gtk_inscription_get_wrap_mode";
end;

define inline-only C-function gtk-inscription-get-xalign
  input parameter self :: <GtkInscription>;
  result res :: <C-float>;
  c-name: "gtk_inscription_get_xalign";
end;

define inline-only C-function gtk-inscription-get-yalign
  input parameter self :: <GtkInscription>;
  result res :: <C-float>;
  c-name: "gtk_inscription_get_yalign";
end;

define inline-only C-function gtk-inscription-set-attributes
  input parameter self :: <GtkInscription>;
  input parameter attrs_ :: <PangoAttrList>;
  c-name: "gtk_inscription_set_attributes";
end;

define inline-only C-function gtk-inscription-set-markup
  input parameter self :: <GtkInscription>;
  input parameter markup_ :: <C-string>;
  c-name: "gtk_inscription_set_markup";
end;

define inline-only C-function gtk-inscription-set-min-chars
  input parameter self :: <GtkInscription>;
  input parameter min_chars_ :: <C-unsigned-int>;
  c-name: "gtk_inscription_set_min_chars";
end;

define inline-only C-function gtk-inscription-set-min-lines
  input parameter self :: <GtkInscription>;
  input parameter min_lines_ :: <C-unsigned-int>;
  c-name: "gtk_inscription_set_min_lines";
end;

define inline-only C-function gtk-inscription-set-nat-chars
  input parameter self :: <GtkInscription>;
  input parameter nat_chars_ :: <C-unsigned-int>;
  c-name: "gtk_inscription_set_nat_chars";
end;

define inline-only C-function gtk-inscription-set-nat-lines
  input parameter self :: <GtkInscription>;
  input parameter nat_lines_ :: <C-unsigned-int>;
  c-name: "gtk_inscription_set_nat_lines";
end;

define inline-only C-function gtk-inscription-set-text
  input parameter self :: <GtkInscription>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_inscription_set_text";
end;

define inline-only C-function gtk-inscription-set-text-overflow
  input parameter self :: <GtkInscription>;
  input parameter overflow_ :: <GtkInscriptionOverflow>;
  c-name: "gtk_inscription_set_text_overflow";
end;

define inline-only C-function gtk-inscription-set-wrap-mode
  input parameter self :: <GtkInscription>;
  input parameter wrap_mode_ :: <PangoWrapMode>;
  c-name: "gtk_inscription_set_wrap_mode";
end;

define inline-only C-function gtk-inscription-set-xalign
  input parameter self :: <GtkInscription>;
  input parameter xalign_ :: <C-float>;
  c-name: "gtk_inscription_set_xalign";
end;

define inline-only C-function gtk-inscription-set-yalign
  input parameter self :: <GtkInscription>;
  input parameter yalign_ :: <C-float>;
  c-name: "gtk_inscription_set_yalign";
end;

define C-struct <_GtkInscriptionClass>
  constant sealed inline-only slot gtk-inscription-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkInscriptionClass>;
end C-struct;

define sealed domain make (singleton(<GtkInscriptionClass>));
define sealed domain initialize (<GtkInscriptionClass>);

define inline-only constant $gtk-inscription-overflow-clip = 0;
define inline-only constant $gtk-inscription-overflow-ellipsize-start = 1;
define inline-only constant $gtk-inscription-overflow-ellipsize-middle = 2;
define inline-only constant $gtk-inscription-overflow-ellipsize-end = 3;
define constant <GtkInscriptionOverflow> = <C-int>;
define C-pointer-type <GtkInscriptionOverflow*> => <GtkInscriptionOverflow>;

define inline-only constant $gtk-justify-left = 0;
define inline-only constant $gtk-justify-right = 1;
define inline-only constant $gtk-justify-center = 2;
define inline-only constant $gtk-justify-fill = 3;
define constant <GtkJustification> = <C-int>;
define C-pointer-type <GtkJustification*> => <GtkJustification>;

define open C-subtype <GtkKeyvalTrigger> (<GtkShortcutTrigger>)
end C-subtype;

define C-pointer-type <GtkKeyvalTrigger*> => <GtkKeyvalTrigger>;

define sealed domain make (singleton(<GtkKeyvalTrigger*>));
define sealed domain initialize (<GtkKeyvalTrigger*>);

define inline-only C-function gtk-keyval-trigger-new
  input parameter keyval_ :: <C-unsigned-int>;
  input parameter modifiers_ :: <GdkModifierType>;
  result res :: <GtkShortcutTrigger>;
  c-name: "gtk_keyval_trigger_new";
end;

define inline-only C-function gtk-keyval-trigger-get-keyval
  input parameter self :: <GtkKeyvalTrigger>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_keyval_trigger_get_keyval";
end;

define inline-only C-function gtk-keyval-trigger-get-modifiers
  input parameter self :: <GtkKeyvalTrigger>;
  result res :: <GdkModifierType>;
  c-name: "gtk_keyval_trigger_get_modifiers";
end;

define C-struct <_GtkKeyvalTriggerClass>
  pointer-type-name: <GtkKeyvalTriggerClass>;
end C-struct;

define sealed domain make (singleton(<GtkKeyvalTriggerClass>));
define sealed domain initialize (<GtkKeyvalTriggerClass>);

define inline-only constant $level-bar-offset-full = "full";

define inline-only constant $level-bar-offset-high = "high";

define inline-only constant $level-bar-offset-low = "low";

define open C-subtype <GtkLabel> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkLabel*> => <GtkLabel>;

define sealed domain make (singleton(<GtkLabel*>));
define sealed domain initialize (<GtkLabel*>);

define inline-only C-function gtk-label-new
  input parameter str_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_label_new";
end;

define inline-only C-function gtk-label-new-with-mnemonic
  input parameter str_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_label_new_with_mnemonic";
end;

define inline-only C-function gtk-label-get-attributes
  input parameter self :: <GtkLabel>;
  result res :: <PangoAttrList>;
  c-name: "gtk_label_get_attributes";
end;

define inline-only C-function gtk-label-get-current-uri
  input parameter self :: <GtkLabel>;
  result res :: <C-string>;
  c-name: "gtk_label_get_current_uri";
end;

define inline-only C-function gtk-label-get-ellipsize
  input parameter self :: <GtkLabel>;
  result res :: <PangoEllipsizeMode>;
  c-name: "gtk_label_get_ellipsize";
end;

define inline-only C-function gtk-label-get-extra-menu
  input parameter self :: <GtkLabel>;
  result res :: <GMenuModel>;
  c-name: "gtk_label_get_extra_menu";
end;

define inline-only C-function gtk-label-get-justify
  input parameter self :: <GtkLabel>;
  result res :: <GtkJustification>;
  c-name: "gtk_label_get_justify";
end;

define inline-only C-function gtk-label-get-label
  input parameter self :: <GtkLabel>;
  result res :: <C-string>;
  c-name: "gtk_label_get_label";
end;

define inline-only C-function gtk-label-get-layout
  input parameter self :: <GtkLabel>;
  result res :: <PangoLayout>;
  c-name: "gtk_label_get_layout";
end;

define inline-only C-function gtk-label-get-layout-offsets
  input parameter self :: <GtkLabel>;
  output parameter x_ :: <C-signed-int*>;
  output parameter y_ :: <C-signed-int*>;
  c-name: "gtk_label_get_layout_offsets";
end;

define inline-only C-function gtk-label-get-lines
  input parameter self :: <GtkLabel>;
  result res :: <C-signed-int>;
  c-name: "gtk_label_get_lines";
end;

define inline-only C-function gtk-label-get-max-width-chars
  input parameter self :: <GtkLabel>;
  result res :: <C-signed-int>;
  c-name: "gtk_label_get_max_width_chars";
end;

define inline-only C-function gtk-label-get-mnemonic-keyval
  input parameter self :: <GtkLabel>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_label_get_mnemonic_keyval";
end;

define inline-only C-function gtk-label-get-mnemonic-widget
  input parameter self :: <GtkLabel>;
  result res :: <GtkWidget>;
  c-name: "gtk_label_get_mnemonic_widget";
end;

define inline-only C-function gtk-label-get-natural-wrap-mode
  input parameter self :: <GtkLabel>;
  result res :: <GtkNaturalWrapMode>;
  c-name: "gtk_label_get_natural_wrap_mode";
end;

define inline-only C-function gtk-label-get-selectable
  input parameter self :: <GtkLabel>;
  result res :: <C-boolean>;
  c-name: "gtk_label_get_selectable";
end;

define inline-only C-function gtk-label-get-selection-bounds
  input parameter self :: <GtkLabel>;
  output parameter start_ :: <C-signed-int*>;
  output parameter end_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_label_get_selection_bounds";
end;

define inline-only C-function gtk-label-get-single-line-mode
  input parameter self :: <GtkLabel>;
  result res :: <C-boolean>;
  c-name: "gtk_label_get_single_line_mode";
end;

define inline-only C-function gtk-label-get-tabs
  input parameter self :: <GtkLabel>;
  result res :: <PangoTabArray>;
  c-name: "gtk_label_get_tabs";
end;

define inline-only C-function gtk-label-get-text
  input parameter self :: <GtkLabel>;
  result res :: <C-string>;
  c-name: "gtk_label_get_text";
end;

define inline-only C-function gtk-label-get-use-markup
  input parameter self :: <GtkLabel>;
  result res :: <C-boolean>;
  c-name: "gtk_label_get_use_markup";
end;

define inline-only C-function gtk-label-get-use-underline
  input parameter self :: <GtkLabel>;
  result res :: <C-boolean>;
  c-name: "gtk_label_get_use_underline";
end;

define inline-only C-function gtk-label-get-width-chars
  input parameter self :: <GtkLabel>;
  result res :: <C-signed-int>;
  c-name: "gtk_label_get_width_chars";
end;

define inline-only C-function gtk-label-get-wrap
  input parameter self :: <GtkLabel>;
  result res :: <C-boolean>;
  c-name: "gtk_label_get_wrap";
end;

define inline-only C-function gtk-label-get-wrap-mode
  input parameter self :: <GtkLabel>;
  result res :: <PangoWrapMode>;
  c-name: "gtk_label_get_wrap_mode";
end;

define inline-only C-function gtk-label-get-xalign
  input parameter self :: <GtkLabel>;
  result res :: <C-float>;
  c-name: "gtk_label_get_xalign";
end;

define inline-only C-function gtk-label-get-yalign
  input parameter self :: <GtkLabel>;
  result res :: <C-float>;
  c-name: "gtk_label_get_yalign";
end;

define inline-only C-function gtk-label-select-region
  input parameter self :: <GtkLabel>;
  input parameter start_offset_ :: <C-signed-int>;
  input parameter end_offset_ :: <C-signed-int>;
  c-name: "gtk_label_select_region";
end;

define inline-only C-function gtk-label-set-attributes
  input parameter self :: <GtkLabel>;
  input parameter attrs_ :: <PangoAttrList>;
  c-name: "gtk_label_set_attributes";
end;

define inline-only C-function gtk-label-set-ellipsize
  input parameter self :: <GtkLabel>;
  input parameter mode_ :: <PangoEllipsizeMode>;
  c-name: "gtk_label_set_ellipsize";
end;

define inline-only C-function gtk-label-set-extra-menu
  input parameter self :: <GtkLabel>;
  input parameter model_ :: <GMenuModel>;
  c-name: "gtk_label_set_extra_menu";
end;

define inline-only C-function gtk-label-set-justify
  input parameter self :: <GtkLabel>;
  input parameter jtype_ :: <GtkJustification>;
  c-name: "gtk_label_set_justify";
end;

define inline-only C-function gtk-label-set-label
  input parameter self :: <GtkLabel>;
  input parameter str_ :: <C-string>;
  c-name: "gtk_label_set_label";
end;

define inline-only C-function gtk-label-set-lines
  input parameter self :: <GtkLabel>;
  input parameter lines_ :: <C-signed-int>;
  c-name: "gtk_label_set_lines";
end;

define inline-only C-function gtk-label-set-markup
  input parameter self :: <GtkLabel>;
  input parameter str_ :: <C-string>;
  c-name: "gtk_label_set_markup";
end;

define inline-only C-function gtk-label-set-markup-with-mnemonic
  input parameter self :: <GtkLabel>;
  input parameter str_ :: <C-string>;
  c-name: "gtk_label_set_markup_with_mnemonic";
end;

define inline-only C-function gtk-label-set-max-width-chars
  input parameter self :: <GtkLabel>;
  input parameter n_chars_ :: <C-signed-int>;
  c-name: "gtk_label_set_max_width_chars";
end;

define inline-only C-function gtk-label-set-mnemonic-widget
  input parameter self :: <GtkLabel>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_label_set_mnemonic_widget";
end;

define inline-only C-function gtk-label-set-natural-wrap-mode
  input parameter self :: <GtkLabel>;
  input parameter wrap_mode_ :: <GtkNaturalWrapMode>;
  c-name: "gtk_label_set_natural_wrap_mode";
end;

define inline-only C-function gtk-label-set-selectable
  input parameter self :: <GtkLabel>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_label_set_selectable";
end;

define inline-only C-function gtk-label-set-single-line-mode
  input parameter self :: <GtkLabel>;
  input parameter single_line_mode_ :: <C-boolean>;
  c-name: "gtk_label_set_single_line_mode";
end;

define inline-only C-function gtk-label-set-tabs
  input parameter self :: <GtkLabel>;
  input parameter tabs_ :: <PangoTabArray>;
  c-name: "gtk_label_set_tabs";
end;

define inline-only C-function gtk-label-set-text
  input parameter self :: <GtkLabel>;
  input parameter str_ :: <C-string>;
  c-name: "gtk_label_set_text";
end;

define inline-only C-function gtk-label-set-text-with-mnemonic
  input parameter self :: <GtkLabel>;
  input parameter str_ :: <C-string>;
  c-name: "gtk_label_set_text_with_mnemonic";
end;

define inline-only C-function gtk-label-set-use-markup
  input parameter self :: <GtkLabel>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_label_set_use_markup";
end;

define inline-only C-function gtk-label-set-use-underline
  input parameter self :: <GtkLabel>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_label_set_use_underline";
end;

define inline-only C-function gtk-label-set-width-chars
  input parameter self :: <GtkLabel>;
  input parameter n_chars_ :: <C-signed-int>;
  c-name: "gtk_label_set_width_chars";
end;

define inline-only C-function gtk-label-set-wrap
  input parameter self :: <GtkLabel>;
  input parameter wrap_ :: <C-boolean>;
  c-name: "gtk_label_set_wrap";
end;

define inline-only C-function gtk-label-set-wrap-mode
  input parameter self :: <GtkLabel>;
  input parameter wrap_mode_ :: <PangoWrapMode>;
  c-name: "gtk_label_set_wrap_mode";
end;

define inline-only C-function gtk-label-set-xalign
  input parameter self :: <GtkLabel>;
  input parameter xalign_ :: <C-float>;
  c-name: "gtk_label_set_xalign";
end;

define inline-only C-function gtk-label-set-yalign
  input parameter self :: <GtkLabel>;
  input parameter yalign_ :: <C-float>;
  c-name: "gtk_label_set_yalign";
end;

define open C-subtype <GtkLayoutChild> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkLayoutChild*> => <GtkLayoutChild>;

define sealed domain make (singleton(<GtkLayoutChild*>));
define sealed domain initialize (<GtkLayoutChild*>);

define inline-only C-function gtk-layout-child-get-child-widget
  input parameter self :: <GtkLayoutChild>;
  result res :: <GtkWidget>;
  c-name: "gtk_layout_child_get_child_widget";
end;

define inline-only C-function gtk-layout-child-get-layout-manager
  input parameter self :: <GtkLayoutChild>;
  result res :: <GtkLayoutManager>;
  c-name: "gtk_layout_child_get_layout_manager";
end;

define C-struct <_GtkLayoutChildClass>
  constant sealed inline-only slot gtk-layout-child-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkLayoutChildClass>;
end C-struct;

define sealed domain make (singleton(<GtkLayoutChildClass>));
define sealed domain initialize (<GtkLayoutChildClass>);

define open C-subtype <GtkLayoutManager> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkLayoutManager*> => <GtkLayoutManager>;

define sealed domain make (singleton(<GtkLayoutManager*>));
define sealed domain initialize (<GtkLayoutManager*>);

define inline-only C-function gtk-layout-manager-allocate
  input parameter self :: <GtkLayoutManager>;
  input parameter widget_ :: <GtkWidget>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter baseline_ :: <C-signed-int>;
  c-name: "gtk_layout_manager_allocate";
end;

define inline-only C-function gtk-layout-manager-get-layout-child
  input parameter self :: <GtkLayoutManager>;
  input parameter child_ :: <GtkWidget>;
  result res :: <GtkLayoutChild>;
  c-name: "gtk_layout_manager_get_layout_child";
end;

define inline-only C-function gtk-layout-manager-get-request-mode
  input parameter self :: <GtkLayoutManager>;
  result res :: <GtkSizeRequestMode>;
  c-name: "gtk_layout_manager_get_request_mode";
end;

define inline-only C-function gtk-layout-manager-get-widget
  input parameter self :: <GtkLayoutManager>;
  result res :: <GtkWidget>;
  c-name: "gtk_layout_manager_get_widget";
end;

define inline-only C-function gtk-layout-manager-layout-changed
  input parameter self :: <GtkLayoutManager>;
  c-name: "gtk_layout_manager_layout_changed";
end;

define inline-only C-function gtk-layout-manager-measure
  input parameter self :: <GtkLayoutManager>;
  input parameter widget_ :: <GtkWidget>;
  input parameter orientation_ :: <GtkOrientation>;
  input parameter for_size_ :: <C-signed-int>;
  output parameter minimum_ :: <C-signed-int*>;
  output parameter natural_ :: <C-signed-int*>;
  output parameter minimum_baseline_ :: <C-signed-int*>;
  output parameter natural_baseline_ :: <C-signed-int*>;
  c-name: "gtk_layout_manager_measure";
end;

define C-struct <_GtkLayoutManagerClass>
  constant sealed inline-only slot gtk-layout-manager-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-layout-manager-class-get-request-mode :: <C-function-pointer>;
  constant sealed inline-only slot gtk-layout-manager-class-measure :: <C-function-pointer>;
  constant sealed inline-only slot gtk-layout-manager-class-allocate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-layout-manager-class-layout-child-type :: <C-long>;
  constant sealed inline-only slot gtk-layout-manager-class-create-layout-child :: <C-function-pointer>;
  constant sealed inline-only slot gtk-layout-manager-class-root :: <C-function-pointer>;
  constant sealed inline-only slot gtk-layout-manager-class-unroot :: <C-function-pointer>;
  constant sealed inline-only slot gtk-layout-manager-class-_padding :: <C-void*>;
  pointer-type-name: <GtkLayoutManagerClass>;
end C-struct;

define sealed domain make (singleton(<GtkLayoutManagerClass>));
define sealed domain initialize (<GtkLayoutManagerClass>);

define open C-subtype <GtkLevelBar> (<GtkWidget>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkLevelBar*> => <GtkLevelBar>;

define sealed domain make (singleton(<GtkLevelBar*>));
define sealed domain initialize (<GtkLevelBar*>);

define inline-only C-function gtk-level-bar-new
  result res :: <GtkWidget>;
  c-name: "gtk_level_bar_new";
end;

define inline-only C-function gtk-level-bar-new-for-interval
  input parameter min_value_ :: <C-double>;
  input parameter max_value_ :: <C-double>;
  result res :: <GtkWidget>;
  c-name: "gtk_level_bar_new_for_interval";
end;

define inline-only C-function gtk-level-bar-add-offset-value
  input parameter self :: <GtkLevelBar>;
  input parameter name_ :: <C-string>;
  input parameter value_ :: <C-double>;
  c-name: "gtk_level_bar_add_offset_value";
end;

define inline-only C-function gtk-level-bar-get-inverted
  input parameter self :: <GtkLevelBar>;
  result res :: <C-boolean>;
  c-name: "gtk_level_bar_get_inverted";
end;

define inline-only C-function gtk-level-bar-get-max-value
  input parameter self :: <GtkLevelBar>;
  result res :: <C-double>;
  c-name: "gtk_level_bar_get_max_value";
end;

define inline-only C-function gtk-level-bar-get-min-value
  input parameter self :: <GtkLevelBar>;
  result res :: <C-double>;
  c-name: "gtk_level_bar_get_min_value";
end;

define inline-only C-function gtk-level-bar-get-mode
  input parameter self :: <GtkLevelBar>;
  result res :: <GtkLevelBarMode>;
  c-name: "gtk_level_bar_get_mode";
end;

define inline-only C-function gtk-level-bar-get-offset-value
  input parameter self :: <GtkLevelBar>;
  input parameter name_ :: <C-string>;
  output parameter value_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_level_bar_get_offset_value";
end;

define inline-only C-function gtk-level-bar-get-value
  input parameter self :: <GtkLevelBar>;
  result res :: <C-double>;
  c-name: "gtk_level_bar_get_value";
end;

define inline-only C-function gtk-level-bar-remove-offset-value
  input parameter self :: <GtkLevelBar>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_level_bar_remove_offset_value";
end;

define inline-only C-function gtk-level-bar-set-inverted
  input parameter self :: <GtkLevelBar>;
  input parameter inverted_ :: <C-boolean>;
  c-name: "gtk_level_bar_set_inverted";
end;

define inline-only C-function gtk-level-bar-set-max-value
  input parameter self :: <GtkLevelBar>;
  input parameter value_ :: <C-double>;
  c-name: "gtk_level_bar_set_max_value";
end;

define inline-only C-function gtk-level-bar-set-min-value
  input parameter self :: <GtkLevelBar>;
  input parameter value_ :: <C-double>;
  c-name: "gtk_level_bar_set_min_value";
end;

define inline-only C-function gtk-level-bar-set-mode
  input parameter self :: <GtkLevelBar>;
  input parameter mode_ :: <GtkLevelBarMode>;
  c-name: "gtk_level_bar_set_mode";
end;

define inline-only C-function gtk-level-bar-set-value
  input parameter self :: <GtkLevelBar>;
  input parameter value_ :: <C-double>;
  c-name: "gtk_level_bar_set_value";
end;

define inline-only constant $gtk-level-bar-mode-continuous = 0;
define inline-only constant $gtk-level-bar-mode-discrete = 1;
define constant <GtkLevelBarMode> = <C-int>;
define C-pointer-type <GtkLevelBarMode*> => <GtkLevelBarMode>;

define inline-only constant $gtk-license-unknown = 0;
define inline-only constant $gtk-license-custom = 1;
define inline-only constant $gtk-license-gpl-2-0 = 2;
define inline-only constant $gtk-license-gpl-3-0 = 3;
define inline-only constant $gtk-license-lgpl-2-1 = 4;
define inline-only constant $gtk-license-lgpl-3-0 = 5;
define inline-only constant $gtk-license-bsd = 6;
define inline-only constant $gtk-license-mit-x11 = 7;
define inline-only constant $gtk-license-artistic = 8;
define inline-only constant $gtk-license-gpl-2-0-only = 9;
define inline-only constant $gtk-license-gpl-3-0-only = 10;
define inline-only constant $gtk-license-lgpl-2-1-only = 11;
define inline-only constant $gtk-license-lgpl-3-0-only = 12;
define inline-only constant $gtk-license-agpl-3-0 = 13;
define inline-only constant $gtk-license-agpl-3-0-only = 14;
define inline-only constant $gtk-license-bsd-3 = 15;
define inline-only constant $gtk-license-apache-2-0 = 16;
define inline-only constant $gtk-license-mpl-2-0 = 17;
define constant <GtkLicense> = <C-int>;
define C-pointer-type <GtkLicense*> => <GtkLicense>;

define open C-subtype <GtkLinkButton> (<GtkButton>)
end C-subtype;

define C-pointer-type <GtkLinkButton*> => <GtkLinkButton>;

define sealed domain make (singleton(<GtkLinkButton*>));
define sealed domain initialize (<GtkLinkButton*>);

define inline-only C-function gtk-link-button-new
  input parameter uri_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_link_button_new";
end;

define inline-only C-function gtk-link-button-new-with-label
  input parameter uri_ :: <C-string>;
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_link_button_new_with_label";
end;

define inline-only C-function gtk-link-button-get-uri
  input parameter self :: <GtkLinkButton>;
  result res :: <C-string>;
  c-name: "gtk_link_button_get_uri";
end;

define inline-only C-function gtk-link-button-get-visited
  input parameter self :: <GtkLinkButton>;
  result res :: <C-boolean>;
  c-name: "gtk_link_button_get_visited";
end;

define inline-only C-function gtk-link-button-set-uri
  input parameter self :: <GtkLinkButton>;
  input parameter uri_ :: <C-string>;
  c-name: "gtk_link_button_set_uri";
end;

define inline-only C-function gtk-link-button-set-visited
  input parameter self :: <GtkLinkButton>;
  input parameter visited_ :: <C-boolean>;
  c-name: "gtk_link_button_set_visited";
end;

define open C-subtype <GtkListBase> (<GtkWidget>, <GtkOrientable>, <GtkScrollable>)
end C-subtype;

define C-pointer-type <GtkListBase*> => <GtkListBase>;

define sealed domain make (singleton(<GtkListBase*>));
define sealed domain initialize (<GtkListBase*>);

define C-struct <_GtkListBaseClass>
  pointer-type-name: <GtkListBaseClass>;
end C-struct;

define sealed domain make (singleton(<GtkListBaseClass>));
define sealed domain initialize (<GtkListBaseClass>);

define open C-subtype <GtkListBox> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkListBox*> => <GtkListBox>;

define sealed domain make (singleton(<GtkListBox*>));
define sealed domain initialize (<GtkListBox*>);

define inline-only C-function gtk-list-box-new
  result res :: <GtkWidget>;
  c-name: "gtk_list_box_new";
end;

define inline-only C-function gtk-list-box-append
  input parameter self :: <GtkListBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_list_box_append";
end;

define inline-only C-function gtk-list-box-bind-model
  input parameter self :: <GtkListBox>;
  input parameter model_ :: <GListModel>;
  input parameter create_widget_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_data_free_func_ :: <C-function-pointer>;
  c-name: "gtk_list_box_bind_model";
end;

define inline-only C-function gtk-list-box-drag-highlight-row
  input parameter self :: <GtkListBox>;
  input parameter row_ :: <GtkListBoxRow>;
  c-name: "gtk_list_box_drag_highlight_row";
end;

define inline-only C-function gtk-list-box-drag-unhighlight-row
  input parameter self :: <GtkListBox>;
  c-name: "gtk_list_box_drag_unhighlight_row";
end;

define inline-only C-function gtk-list-box-get-activate-on-single-click
  input parameter self :: <GtkListBox>;
  result res :: <C-boolean>;
  c-name: "gtk_list_box_get_activate_on_single_click";
end;

define inline-only C-function gtk-list-box-get-adjustment
  input parameter self :: <GtkListBox>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_list_box_get_adjustment";
end;

define inline-only C-function gtk-list-box-get-row-at-index
  input parameter self :: <GtkListBox>;
  input parameter index__ :: <C-signed-int>;
  result res :: <GtkListBoxRow>;
  c-name: "gtk_list_box_get_row_at_index";
end;

define inline-only C-function gtk-list-box-get-row-at-y
  input parameter self :: <GtkListBox>;
  input parameter y_ :: <C-signed-int>;
  result res :: <GtkListBoxRow>;
  c-name: "gtk_list_box_get_row_at_y";
end;

define inline-only C-function gtk-list-box-get-selected-row
  input parameter self :: <GtkListBox>;
  result res :: <GtkListBoxRow>;
  c-name: "gtk_list_box_get_selected_row";
end;

define inline-only C-function gtk-list-box-get-selected-rows
  input parameter self :: <GtkListBox>;
  result res :: <GList>;
  c-name: "gtk_list_box_get_selected_rows";
end;

define inline-only C-function gtk-list-box-get-selection-mode
  input parameter self :: <GtkListBox>;
  result res :: <GtkSelectionMode>;
  c-name: "gtk_list_box_get_selection_mode";
end;

define inline-only C-function gtk-list-box-get-show-separators
  input parameter self :: <GtkListBox>;
  result res :: <C-boolean>;
  c-name: "gtk_list_box_get_show_separators";
end;

define inline-only C-function gtk-list-box-insert
  input parameter self :: <GtkListBox>;
  input parameter child_ :: <GtkWidget>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_list_box_insert";
end;

define inline-only C-function gtk-list-box-invalidate-filter
  input parameter self :: <GtkListBox>;
  c-name: "gtk_list_box_invalidate_filter";
end;

define inline-only C-function gtk-list-box-invalidate-headers
  input parameter self :: <GtkListBox>;
  c-name: "gtk_list_box_invalidate_headers";
end;

define inline-only C-function gtk-list-box-invalidate-sort
  input parameter self :: <GtkListBox>;
  c-name: "gtk_list_box_invalidate_sort";
end;

define inline-only C-function gtk-list-box-prepend
  input parameter self :: <GtkListBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_list_box_prepend";
end;

define inline-only C-function gtk-list-box-remove
  input parameter self :: <GtkListBox>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_list_box_remove";
end;

define inline-only C-function gtk-list-box-select-all
  input parameter self :: <GtkListBox>;
  c-name: "gtk_list_box_select_all";
end;

define inline-only C-function gtk-list-box-select-row
  input parameter self :: <GtkListBox>;
  input parameter row_ :: <GtkListBoxRow>;
  c-name: "gtk_list_box_select_row";
end;

define inline-only C-function gtk-list-box-selected-foreach
  input parameter self :: <GtkListBox>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  c-name: "gtk_list_box_selected_foreach";
end;

define inline-only C-function gtk-list-box-set-activate-on-single-click
  input parameter self :: <GtkListBox>;
  input parameter single_ :: <C-boolean>;
  c-name: "gtk_list_box_set_activate_on_single_click";
end;

define inline-only C-function gtk-list-box-set-adjustment
  input parameter self :: <GtkListBox>;
  input parameter adjustment_ :: <GtkAdjustment>;
  c-name: "gtk_list_box_set_adjustment";
end;

define inline-only C-function gtk-list-box-set-filter-func
  input parameter self :: <GtkListBox>;
  input parameter filter_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_list_box_set_filter_func";
end;

define inline-only C-function gtk-list-box-set-header-func
  input parameter self :: <GtkListBox>;
  input parameter update_header_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_list_box_set_header_func";
end;

define inline-only C-function gtk-list-box-set-placeholder
  input parameter self :: <GtkListBox>;
  input parameter placeholder_ :: <GtkWidget>;
  c-name: "gtk_list_box_set_placeholder";
end;

define inline-only C-function gtk-list-box-set-selection-mode
  input parameter self :: <GtkListBox>;
  input parameter mode_ :: <GtkSelectionMode>;
  c-name: "gtk_list_box_set_selection_mode";
end;

define inline-only C-function gtk-list-box-set-show-separators
  input parameter self :: <GtkListBox>;
  input parameter show_separators_ :: <C-boolean>;
  c-name: "gtk_list_box_set_show_separators";
end;

define inline-only C-function gtk-list-box-set-sort-func
  input parameter self :: <GtkListBox>;
  input parameter sort_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_list_box_set_sort_func";
end;

define inline-only C-function gtk-list-box-unselect-all
  input parameter self :: <GtkListBox>;
  c-name: "gtk_list_box_unselect_all";
end;

define inline-only C-function gtk-list-box-unselect-row
  input parameter self :: <GtkListBox>;
  input parameter row_ :: <GtkListBoxRow>;
  c-name: "gtk_list_box_unselect_row";
end;

define open C-subtype <GtkListBoxRow> (<GtkActionable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkListBoxRow*> => <GtkListBoxRow>;

define sealed domain make (singleton(<GtkListBoxRow*>));
define sealed domain initialize (<GtkListBoxRow*>);

define inline-only C-function gtk-list-box-row-new
  result res :: <GtkWidget>;
  c-name: "gtk_list_box_row_new";
end;

define inline-only C-function gtk-list-box-row-changed
  input parameter self :: <GtkListBoxRow>;
  c-name: "gtk_list_box_row_changed";
end;

define inline-only C-function gtk-list-box-row-get-activatable
  input parameter self :: <GtkListBoxRow>;
  result res :: <C-boolean>;
  c-name: "gtk_list_box_row_get_activatable";
end;

define inline-only C-function gtk-list-box-row-get-child
  input parameter self :: <GtkListBoxRow>;
  result res :: <GtkWidget>;
  c-name: "gtk_list_box_row_get_child";
end;

define inline-only C-function gtk-list-box-row-get-header
  input parameter self :: <GtkListBoxRow>;
  result res :: <GtkWidget>;
  c-name: "gtk_list_box_row_get_header";
end;

define inline-only C-function gtk-list-box-row-get-index
  input parameter self :: <GtkListBoxRow>;
  result res :: <C-signed-int>;
  c-name: "gtk_list_box_row_get_index";
end;

define inline-only C-function gtk-list-box-row-get-selectable
  input parameter self :: <GtkListBoxRow>;
  result res :: <C-boolean>;
  c-name: "gtk_list_box_row_get_selectable";
end;

define inline-only C-function gtk-list-box-row-is-selected
  input parameter self :: <GtkListBoxRow>;
  result res :: <C-boolean>;
  c-name: "gtk_list_box_row_is_selected";
end;

define inline-only C-function gtk-list-box-row-set-activatable
  input parameter self :: <GtkListBoxRow>;
  input parameter activatable_ :: <C-boolean>;
  c-name: "gtk_list_box_row_set_activatable";
end;

define inline-only C-function gtk-list-box-row-set-child
  input parameter self :: <GtkListBoxRow>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_list_box_row_set_child";
end;

define inline-only C-function gtk-list-box-row-set-header
  input parameter self :: <GtkListBoxRow>;
  input parameter header_ :: <GtkWidget>;
  c-name: "gtk_list_box_row_set_header";
end;

define inline-only C-function gtk-list-box-row-set-selectable
  input parameter self :: <GtkListBoxRow>;
  input parameter selectable_ :: <C-boolean>;
  c-name: "gtk_list_box_row_set_selectable";
end;

define C-struct <_GtkListBoxRowClass>
  constant sealed inline-only slot gtk-list-box-row-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-list-box-row-class-activate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-list-box-row-class-padding :: <C-void*>;
  pointer-type-name: <GtkListBoxRowClass>;
end C-struct;

define sealed domain make (singleton(<GtkListBoxRowClass>));
define sealed domain initialize (<GtkListBoxRowClass>);

define open C-subtype <GtkListItem> (<GObject>)
end C-subtype;

define C-pointer-type <GtkListItem*> => <GtkListItem>;

define sealed domain make (singleton(<GtkListItem*>));
define sealed domain initialize (<GtkListItem*>);

define inline-only C-function gtk-list-item-get-activatable
  input parameter self :: <GtkListItem>;
  result res :: <C-boolean>;
  c-name: "gtk_list_item_get_activatable";
end;

define inline-only C-function gtk-list-item-get-child
  input parameter self :: <GtkListItem>;
  result res :: <GtkWidget>;
  c-name: "gtk_list_item_get_child";
end;

define inline-only C-function gtk-list-item-get-item
  input parameter self :: <GtkListItem>;
  result res :: <GObject>;
  c-name: "gtk_list_item_get_item";
end;

define inline-only C-function gtk-list-item-get-position
  input parameter self :: <GtkListItem>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_list_item_get_position";
end;

define inline-only C-function gtk-list-item-get-selectable
  input parameter self :: <GtkListItem>;
  result res :: <C-boolean>;
  c-name: "gtk_list_item_get_selectable";
end;

define inline-only C-function gtk-list-item-get-selected
  input parameter self :: <GtkListItem>;
  result res :: <C-boolean>;
  c-name: "gtk_list_item_get_selected";
end;

define inline-only C-function gtk-list-item-set-activatable
  input parameter self :: <GtkListItem>;
  input parameter activatable_ :: <C-boolean>;
  c-name: "gtk_list_item_set_activatable";
end;

define inline-only C-function gtk-list-item-set-child
  input parameter self :: <GtkListItem>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_list_item_set_child";
end;

define inline-only C-function gtk-list-item-set-selectable
  input parameter self :: <GtkListItem>;
  input parameter selectable_ :: <C-boolean>;
  c-name: "gtk_list_item_set_selectable";
end;

define C-struct <_GtkListItemClass>
  pointer-type-name: <GtkListItemClass>;
end C-struct;

define sealed domain make (singleton(<GtkListItemClass>));
define sealed domain initialize (<GtkListItemClass>);

define open C-subtype <GtkListItemFactory> (<GObject>)
end C-subtype;

define C-pointer-type <GtkListItemFactory*> => <GtkListItemFactory>;

define sealed domain make (singleton(<GtkListItemFactory*>));
define sealed domain initialize (<GtkListItemFactory*>);

define C-struct <_GtkListItemFactoryClass>
  pointer-type-name: <GtkListItemFactoryClass>;
end C-struct;

define sealed domain make (singleton(<GtkListItemFactoryClass>));
define sealed domain initialize (<GtkListItemFactoryClass>);

define open C-subtype <GtkListStore> (<GObject>, <GtkBuildable>, <GtkTreeDragDest>, <GtkTreeDragSource>, <GtkTreeSortable>)
  // parent
  // priv
end C-subtype;

define C-pointer-type <GtkListStore*> => <GtkListStore>;

define sealed domain make (singleton(<GtkListStore*>));
define sealed domain initialize (<GtkListStore*>);

define inline-only C-function gtk-list-store-newv
  input parameter n_columns_ :: <C-signed-int>;
  input parameter types_ :: <C-long*>;
  result res :: <GtkListStore>;
  c-name: "gtk_list_store_newv";
end;

define inline-only C-function gtk-list-store-append
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_list_store_append";
end;

define inline-only C-function gtk-list-store-clear
  input parameter self :: <GtkListStore>;
  c-name: "gtk_list_store_clear";
end;

define inline-only C-function gtk-list-store-insert
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_list_store_insert";
end;

define inline-only C-function gtk-list-store-insert-after
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter sibling_ :: <GtkTreeIter>;
  c-name: "gtk_list_store_insert_after";
end;

define inline-only C-function gtk-list-store-insert-before
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter sibling_ :: <GtkTreeIter>;
  c-name: "gtk_list_store_insert_before";
end;

define inline-only C-function gtk-list-store-insert-with-valuesv
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter position_ :: <C-signed-int>;
  input parameter columns_ :: <C-signed-int*>;
  input parameter values_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_values_ :: <C-signed-int>;
  c-name: "gtk_list_store_insert_with_valuesv";
end;

define inline-only C-function gtk-list-store-iter-is-valid
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_list_store_iter_is_valid";
end;

define inline-only C-function gtk-list-store-move-after
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter position_ :: <GtkTreeIter>;
  c-name: "gtk_list_store_move_after";
end;

define inline-only C-function gtk-list-store-move-before
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter position_ :: <GtkTreeIter>;
  c-name: "gtk_list_store_move_before";
end;

define inline-only C-function gtk-list-store-prepend
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_list_store_prepend";
end;

define inline-only C-function gtk-list-store-remove
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_list_store_remove";
end;

define inline-only C-function gtk-list-store-reorder
  input parameter self :: <GtkListStore>;
  input parameter new_order_ :: <C-signed-int*>;
  c-name: "gtk_list_store_reorder";
end;

define inline-only C-function gtk-list-store-set-column-types
  input parameter self :: <GtkListStore>;
  input parameter n_columns_ :: <C-signed-int>;
  input parameter types_ :: <C-long*>;
  c-name: "gtk_list_store_set_column_types";
end;

define inline-only C-function gtk-list-store-set-value
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter column_ :: <C-signed-int>;
  input parameter value_ :: <GValue>;
  c-name: "gtk_list_store_set_value";
end;

define inline-only C-function gtk-list-store-set-valuesv
  input parameter self :: <GtkListStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter columns_ :: <C-signed-int*>;
  input parameter values_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_values_ :: <C-signed-int>;
  c-name: "gtk_list_store_set_valuesv";
end;

define inline-only C-function gtk-list-store-swap
  input parameter self :: <GtkListStore>;
  input parameter a_ :: <GtkTreeIter>;
  input parameter b_ :: <GtkTreeIter>;
  c-name: "gtk_list_store_swap";
end;

define C-struct <_GtkListStoreClass>
  constant sealed inline-only slot gtk-list-store-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-list-store-class-padding :: <C-void*>;
  pointer-type-name: <GtkListStoreClass>;
end C-struct;

define sealed domain make (singleton(<GtkListStoreClass>));
define sealed domain initialize (<GtkListStoreClass>);

define C-struct <_GtkListStorePrivate>
  pointer-type-name: <GtkListStorePrivate>;
end C-struct;

define sealed domain make (singleton(<GtkListStorePrivate>));
define sealed domain initialize (<GtkListStorePrivate>);

define open C-subtype <GtkListView> (<GtkListBase>)
end C-subtype;

define C-pointer-type <GtkListView*> => <GtkListView>;

define sealed domain make (singleton(<GtkListView*>));
define sealed domain initialize (<GtkListView*>);

define inline-only C-function gtk-list-view-new
  input parameter model_ :: <GtkSelectionModel>;
  input parameter factory_ :: <GtkListItemFactory>;
  result res :: <GtkWidget>;
  c-name: "gtk_list_view_new";
end;

define inline-only C-function gtk-list-view-get-enable-rubberband
  input parameter self :: <GtkListView>;
  result res :: <C-boolean>;
  c-name: "gtk_list_view_get_enable_rubberband";
end;

define inline-only C-function gtk-list-view-get-factory
  input parameter self :: <GtkListView>;
  result res :: <GtkListItemFactory>;
  c-name: "gtk_list_view_get_factory";
end;

define inline-only C-function gtk-list-view-get-model
  input parameter self :: <GtkListView>;
  result res :: <GtkSelectionModel>;
  c-name: "gtk_list_view_get_model";
end;

define inline-only C-function gtk-list-view-get-show-separators
  input parameter self :: <GtkListView>;
  result res :: <C-boolean>;
  c-name: "gtk_list_view_get_show_separators";
end;

define inline-only C-function gtk-list-view-get-single-click-activate
  input parameter self :: <GtkListView>;
  result res :: <C-boolean>;
  c-name: "gtk_list_view_get_single_click_activate";
end;

define inline-only C-function gtk-list-view-set-enable-rubberband
  input parameter self :: <GtkListView>;
  input parameter enable_rubberband_ :: <C-boolean>;
  c-name: "gtk_list_view_set_enable_rubberband";
end;

define inline-only C-function gtk-list-view-set-factory
  input parameter self :: <GtkListView>;
  input parameter factory_ :: <GtkListItemFactory>;
  c-name: "gtk_list_view_set_factory";
end;

define inline-only C-function gtk-list-view-set-model
  input parameter self :: <GtkListView>;
  input parameter model_ :: <GtkSelectionModel>;
  c-name: "gtk_list_view_set_model";
end;

define inline-only C-function gtk-list-view-set-show-separators
  input parameter self :: <GtkListView>;
  input parameter show_separators_ :: <C-boolean>;
  c-name: "gtk_list_view_set_show_separators";
end;

define inline-only C-function gtk-list-view-set-single-click-activate
  input parameter self :: <GtkListView>;
  input parameter single_click_activate_ :: <C-boolean>;
  c-name: "gtk_list_view_set_single_click_activate";
end;

define C-struct <_GtkListViewClass>
  pointer-type-name: <GtkListViewClass>;
end C-struct;

define sealed domain make (singleton(<GtkListViewClass>));
define sealed domain initialize (<GtkListViewClass>);

define open C-subtype <GtkLockButton> (<GtkButton>)
end C-subtype;

define C-pointer-type <GtkLockButton*> => <GtkLockButton>;

define sealed domain make (singleton(<GtkLockButton*>));
define sealed domain initialize (<GtkLockButton*>);

define inline-only C-function gtk-lock-button-new
  input parameter permission_ :: <GPermission>;
  result res :: <GtkWidget>;
  c-name: "gtk_lock_button_new";
end;

define inline-only C-function gtk-lock-button-get-permission
  input parameter self :: <GtkLockButton>;
  result res :: <GPermission>;
  c-name: "gtk_lock_button_get_permission";
end;

define inline-only C-function gtk-lock-button-set-permission
  input parameter self :: <GtkLockButton>;
  input parameter permission_ :: <GPermission>;
  c-name: "gtk_lock_button_set_permission";
end;

define inline-only constant $gtk-major-version = 4;

define inline-only constant $max-compose-len = 7;

define inline-only constant $media-file-extension-point-name = "gtk-media-file";

define inline-only constant $gtk-micro-version = 3;

define inline-only constant $gtk-minor-version = 8;

define open C-subtype <GtkMapListModel> (<GObject>, <GListModel>)
end C-subtype;

define C-pointer-type <GtkMapListModel*> => <GtkMapListModel>;

define sealed domain make (singleton(<GtkMapListModel*>));
define sealed domain initialize (<GtkMapListModel*>);

define inline-only C-function gtk-map-list-model-new
  input parameter model_ :: <GListModel>;
  input parameter map_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_destroy_ :: <C-function-pointer>;
  result res :: <GtkMapListModel>;
  c-name: "gtk_map_list_model_new";
end;

define inline-only C-function gtk-map-list-model-get-model
  input parameter self :: <GtkMapListModel>;
  result res :: <GListModel>;
  c-name: "gtk_map_list_model_get_model";
end;

define inline-only C-function gtk-map-list-model-has-map
  input parameter self :: <GtkMapListModel>;
  result res :: <C-boolean>;
  c-name: "gtk_map_list_model_has_map";
end;

define inline-only C-function gtk-map-list-model-set-map-func
  input parameter self :: <GtkMapListModel>;
  input parameter map_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_destroy_ :: <C-function-pointer>;
  c-name: "gtk_map_list_model_set_map_func";
end;

define inline-only C-function gtk-map-list-model-set-model
  input parameter self :: <GtkMapListModel>;
  input parameter model_ :: <GListModel>;
  c-name: "gtk_map_list_model_set_model";
end;

define C-struct <_GtkMapListModelClass>
  constant sealed inline-only slot gtk-map-list-model-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkMapListModelClass>;
end C-struct;

define sealed domain make (singleton(<GtkMapListModelClass>));
define sealed domain initialize (<GtkMapListModelClass>);

define open C-subtype <GtkMediaControls> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkMediaControls*> => <GtkMediaControls>;

define sealed domain make (singleton(<GtkMediaControls*>));
define sealed domain initialize (<GtkMediaControls*>);

define inline-only C-function gtk-media-controls-new
  input parameter stream_ :: <GtkMediaStream>;
  result res :: <GtkWidget>;
  c-name: "gtk_media_controls_new";
end;

define inline-only C-function gtk-media-controls-get-media-stream
  input parameter self :: <GtkMediaControls>;
  result res :: <GtkMediaStream>;
  c-name: "gtk_media_controls_get_media_stream";
end;

define inline-only C-function gtk-media-controls-set-media-stream
  input parameter self :: <GtkMediaControls>;
  input parameter stream_ :: <GtkMediaStream>;
  c-name: "gtk_media_controls_set_media_stream";
end;

define C-struct <_GtkMediaControlsClass>
  constant sealed inline-only slot gtk-media-controls-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkMediaControlsClass>;
end C-struct;

define sealed domain make (singleton(<GtkMediaControlsClass>));
define sealed domain initialize (<GtkMediaControlsClass>);

define open C-subtype <GtkMediaFile> (<GtkMediaStream>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkMediaFile*> => <GtkMediaFile>;

define sealed domain make (singleton(<GtkMediaFile*>));
define sealed domain initialize (<GtkMediaFile*>);

define inline-only C-function gtk-media-file-new
  result res :: <GtkMediaFile>;
  c-name: "gtk_media_file_new";
end;

define inline-only C-function gtk-media-file-new-for-file
  input parameter file_ :: <GFile>;
  result res :: <GtkMediaFile>;
  c-name: "gtk_media_file_new_for_file";
end;

define inline-only C-function gtk-media-file-new-for-filename
  input parameter filename_ :: <C-string>;
  result res :: <GtkMediaFile>;
  c-name: "gtk_media_file_new_for_filename";
end;

define inline-only C-function gtk-media-file-new-for-input-stream
  input parameter stream_ :: <GInputStream>;
  result res :: <GtkMediaFile>;
  c-name: "gtk_media_file_new_for_input_stream";
end;

define inline-only C-function gtk-media-file-new-for-resource
  input parameter resource_path_ :: <C-string>;
  result res :: <GtkMediaFile>;
  c-name: "gtk_media_file_new_for_resource";
end;

define inline-only C-function gtk-media-file-clear
  input parameter self :: <GtkMediaFile>;
  c-name: "gtk_media_file_clear";
end;

define inline-only C-function gtk-media-file-get-file
  input parameter self :: <GtkMediaFile>;
  result res :: <GFile>;
  c-name: "gtk_media_file_get_file";
end;

define inline-only C-function gtk-media-file-get-input-stream
  input parameter self :: <GtkMediaFile>;
  result res :: <GInputStream>;
  c-name: "gtk_media_file_get_input_stream";
end;

define inline-only C-function gtk-media-file-set-file
  input parameter self :: <GtkMediaFile>;
  input parameter file_ :: <GFile>;
  c-name: "gtk_media_file_set_file";
end;

define inline-only C-function gtk-media-file-set-filename
  input parameter self :: <GtkMediaFile>;
  input parameter filename_ :: <C-string>;
  c-name: "gtk_media_file_set_filename";
end;

define inline-only C-function gtk-media-file-set-input-stream
  input parameter self :: <GtkMediaFile>;
  input parameter stream_ :: <GInputStream>;
  c-name: "gtk_media_file_set_input_stream";
end;

define inline-only C-function gtk-media-file-set-resource
  input parameter self :: <GtkMediaFile>;
  input parameter resource_path_ :: <C-string>;
  c-name: "gtk_media_file_set_resource";
end;

define C-struct <_GtkMediaFileClass>
  constant sealed inline-only slot gtk-media-file-class-parent-class :: <GtkMediaStreamClass>;
  constant sealed inline-only slot gtk-media-file-class-open :: <C-function-pointer>;
  constant sealed inline-only slot gtk-media-file-class-close :: <C-function-pointer>;
  constant sealed inline-only slot gtk-media-file-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-media-file-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-media-file-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-media-file-class-_gtk-reserved4 :: <C-void*>;
  pointer-type-name: <GtkMediaFileClass>;
end C-struct;

define sealed domain make (singleton(<GtkMediaFileClass>));
define sealed domain initialize (<GtkMediaFileClass>);

define open C-subtype <GtkMediaStream> (<GObject>, <GdkPaintable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkMediaStream*> => <GtkMediaStream>;

define sealed domain make (singleton(<GtkMediaStream*>));
define sealed domain initialize (<GtkMediaStream*>);

define inline-only C-function gtk-media-stream-gerror
  input parameter self :: <GtkMediaStream>;
  input parameter error_ :: <GError>;
  c-name: "gtk_media_stream_gerror";
end;

define inline-only C-function gtk-media-stream-get-duration
  input parameter self :: <GtkMediaStream>;
  result res :: <C-signed-long>;
  c-name: "gtk_media_stream_get_duration";
end;

define inline-only C-function gtk-media-stream-get-ended
  input parameter self :: <GtkMediaStream>;
  result res :: <C-boolean>;
  c-name: "gtk_media_stream_get_ended";
end;

define inline-only C-function gtk-media-stream-get-error
  input parameter self :: <GtkMediaStream>;
  result res :: <GError>;
  c-name: "gtk_media_stream_get_error";
end;

define inline-only C-function gtk-media-stream-get-loop
  input parameter self :: <GtkMediaStream>;
  result res :: <C-boolean>;
  c-name: "gtk_media_stream_get_loop";
end;

define inline-only C-function gtk-media-stream-get-muted
  input parameter self :: <GtkMediaStream>;
  result res :: <C-boolean>;
  c-name: "gtk_media_stream_get_muted";
end;

define inline-only C-function gtk-media-stream-get-playing
  input parameter self :: <GtkMediaStream>;
  result res :: <C-boolean>;
  c-name: "gtk_media_stream_get_playing";
end;

define inline-only C-function gtk-media-stream-get-timestamp
  input parameter self :: <GtkMediaStream>;
  result res :: <C-signed-long>;
  c-name: "gtk_media_stream_get_timestamp";
end;

define inline-only C-function gtk-media-stream-get-volume
  input parameter self :: <GtkMediaStream>;
  result res :: <C-double>;
  c-name: "gtk_media_stream_get_volume";
end;

define inline-only C-function gtk-media-stream-has-audio
  input parameter self :: <GtkMediaStream>;
  result res :: <C-boolean>;
  c-name: "gtk_media_stream_has_audio";
end;

define inline-only C-function gtk-media-stream-has-video
  input parameter self :: <GtkMediaStream>;
  result res :: <C-boolean>;
  c-name: "gtk_media_stream_has_video";
end;

define inline-only C-function gtk-media-stream-is-prepared
  input parameter self :: <GtkMediaStream>;
  result res :: <C-boolean>;
  c-name: "gtk_media_stream_is_prepared";
end;

define inline-only C-function gtk-media-stream-is-seekable
  input parameter self :: <GtkMediaStream>;
  result res :: <C-boolean>;
  c-name: "gtk_media_stream_is_seekable";
end;

define inline-only C-function gtk-media-stream-is-seeking
  input parameter self :: <GtkMediaStream>;
  result res :: <C-boolean>;
  c-name: "gtk_media_stream_is_seeking";
end;

define inline-only C-function gtk-media-stream-pause
  input parameter self :: <GtkMediaStream>;
  c-name: "gtk_media_stream_pause";
end;

define inline-only C-function gtk-media-stream-play
  input parameter self :: <GtkMediaStream>;
  c-name: "gtk_media_stream_play";
end;

define inline-only C-function gtk-media-stream-realize
  input parameter self :: <GtkMediaStream>;
  input parameter surface_ :: <GdkSurface>;
  c-name: "gtk_media_stream_realize";
end;

define inline-only C-function gtk-media-stream-seek
  input parameter self :: <GtkMediaStream>;
  input parameter timestamp_ :: <C-signed-long>;
  c-name: "gtk_media_stream_seek";
end;

define inline-only C-function gtk-media-stream-seek-failed
  input parameter self :: <GtkMediaStream>;
  c-name: "gtk_media_stream_seek_failed";
end;

define inline-only C-function gtk-media-stream-seek-success
  input parameter self :: <GtkMediaStream>;
  c-name: "gtk_media_stream_seek_success";
end;

define inline-only C-function gtk-media-stream-set-loop
  input parameter self :: <GtkMediaStream>;
  input parameter loop_ :: <C-boolean>;
  c-name: "gtk_media_stream_set_loop";
end;

define inline-only C-function gtk-media-stream-set-muted
  input parameter self :: <GtkMediaStream>;
  input parameter muted_ :: <C-boolean>;
  c-name: "gtk_media_stream_set_muted";
end;

define inline-only C-function gtk-media-stream-set-playing
  input parameter self :: <GtkMediaStream>;
  input parameter playing_ :: <C-boolean>;
  c-name: "gtk_media_stream_set_playing";
end;

define inline-only C-function gtk-media-stream-set-volume
  input parameter self :: <GtkMediaStream>;
  input parameter volume_ :: <C-double>;
  c-name: "gtk_media_stream_set_volume";
end;

define inline-only C-function gtk-media-stream-stream-ended
  input parameter self :: <GtkMediaStream>;
  c-name: "gtk_media_stream_stream_ended";
end;

define inline-only C-function gtk-media-stream-stream-prepared
  input parameter self :: <GtkMediaStream>;
  input parameter has_audio_ :: <C-boolean>;
  input parameter has_video_ :: <C-boolean>;
  input parameter seekable_ :: <C-boolean>;
  input parameter duration_ :: <C-signed-long>;
  c-name: "gtk_media_stream_stream_prepared";
end;

define inline-only C-function gtk-media-stream-stream-unprepared
  input parameter self :: <GtkMediaStream>;
  c-name: "gtk_media_stream_stream_unprepared";
end;

define inline-only C-function gtk-media-stream-unrealize
  input parameter self :: <GtkMediaStream>;
  input parameter surface_ :: <GdkSurface>;
  c-name: "gtk_media_stream_unrealize";
end;

define inline-only C-function gtk-media-stream-update
  input parameter self :: <GtkMediaStream>;
  input parameter timestamp_ :: <C-signed-long>;
  c-name: "gtk_media_stream_update";
end;

define C-struct <_GtkMediaStreamClass>
  constant sealed inline-only slot gtk-media-stream-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-media-stream-class-play :: <C-function-pointer>;
  constant sealed inline-only slot gtk-media-stream-class-pause :: <C-function-pointer>;
  constant sealed inline-only slot gtk-media-stream-class-seek :: <C-function-pointer>;
  constant sealed inline-only slot gtk-media-stream-class-update-audio :: <C-function-pointer>;
  constant sealed inline-only slot gtk-media-stream-class-realize :: <C-function-pointer>;
  constant sealed inline-only slot gtk-media-stream-class-unrealize :: <C-function-pointer>;
  constant sealed inline-only slot gtk-media-stream-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-media-stream-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-media-stream-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-media-stream-class-_gtk-reserved4 :: <C-void*>;
  constant sealed inline-only slot gtk-media-stream-class-_gtk-reserved5 :: <C-void*>;
  constant sealed inline-only slot gtk-media-stream-class-_gtk-reserved6 :: <C-void*>;
  constant sealed inline-only slot gtk-media-stream-class-_gtk-reserved7 :: <C-void*>;
  constant sealed inline-only slot gtk-media-stream-class-_gtk-reserved8 :: <C-void*>;
  pointer-type-name: <GtkMediaStreamClass>;
end C-struct;

define sealed domain make (singleton(<GtkMediaStreamClass>));
define sealed domain initialize (<GtkMediaStreamClass>);

define open C-subtype <GtkMenuButton> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkMenuButton*> => <GtkMenuButton>;

define sealed domain make (singleton(<GtkMenuButton*>));
define sealed domain initialize (<GtkMenuButton*>);

define inline-only C-function gtk-menu-button-new
  result res :: <GtkWidget>;
  c-name: "gtk_menu_button_new";
end;

define inline-only C-function gtk-menu-button-get-always-show-arrow
  input parameter self :: <GtkMenuButton>;
  result res :: <C-boolean>;
  c-name: "gtk_menu_button_get_always_show_arrow";
end;

define inline-only C-function gtk-menu-button-get-child
  input parameter self :: <GtkMenuButton>;
  result res :: <GtkWidget>;
  c-name: "gtk_menu_button_get_child";
end;

define inline-only C-function gtk-menu-button-get-direction
  input parameter self :: <GtkMenuButton>;
  result res :: <GtkArrowType>;
  c-name: "gtk_menu_button_get_direction";
end;

define inline-only C-function gtk-menu-button-get-has-frame
  input parameter self :: <GtkMenuButton>;
  result res :: <C-boolean>;
  c-name: "gtk_menu_button_get_has_frame";
end;

define inline-only C-function gtk-menu-button-get-icon-name
  input parameter self :: <GtkMenuButton>;
  result res :: <C-string>;
  c-name: "gtk_menu_button_get_icon_name";
end;

define inline-only C-function gtk-menu-button-get-label
  input parameter self :: <GtkMenuButton>;
  result res :: <C-string>;
  c-name: "gtk_menu_button_get_label";
end;

define inline-only C-function gtk-menu-button-get-menu-model
  input parameter self :: <GtkMenuButton>;
  result res :: <GMenuModel>;
  c-name: "gtk_menu_button_get_menu_model";
end;

define inline-only C-function gtk-menu-button-get-popover
  input parameter self :: <GtkMenuButton>;
  result res :: <GtkPopover>;
  c-name: "gtk_menu_button_get_popover";
end;

define inline-only C-function gtk-menu-button-get-primary
  input parameter self :: <GtkMenuButton>;
  result res :: <C-boolean>;
  c-name: "gtk_menu_button_get_primary";
end;

define inline-only C-function gtk-menu-button-get-use-underline
  input parameter self :: <GtkMenuButton>;
  result res :: <C-boolean>;
  c-name: "gtk_menu_button_get_use_underline";
end;

define inline-only C-function gtk-menu-button-popdown
  input parameter self :: <GtkMenuButton>;
  c-name: "gtk_menu_button_popdown";
end;

define inline-only C-function gtk-menu-button-popup
  input parameter self :: <GtkMenuButton>;
  c-name: "gtk_menu_button_popup";
end;

define inline-only C-function gtk-menu-button-set-always-show-arrow
  input parameter self :: <GtkMenuButton>;
  input parameter always_show_arrow_ :: <C-boolean>;
  c-name: "gtk_menu_button_set_always_show_arrow";
end;

define inline-only C-function gtk-menu-button-set-child
  input parameter self :: <GtkMenuButton>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_menu_button_set_child";
end;

define inline-only C-function gtk-menu-button-set-create-popup-func
  input parameter self :: <GtkMenuButton>;
  input parameter func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_notify_ :: <C-function-pointer>;
  c-name: "gtk_menu_button_set_create_popup_func";
end;

define inline-only C-function gtk-menu-button-set-direction
  input parameter self :: <GtkMenuButton>;
  input parameter direction_ :: <GtkArrowType>;
  c-name: "gtk_menu_button_set_direction";
end;

define inline-only C-function gtk-menu-button-set-has-frame
  input parameter self :: <GtkMenuButton>;
  input parameter has_frame_ :: <C-boolean>;
  c-name: "gtk_menu_button_set_has_frame";
end;

define inline-only C-function gtk-menu-button-set-icon-name
  input parameter self :: <GtkMenuButton>;
  input parameter icon_name_ :: <C-string>;
  c-name: "gtk_menu_button_set_icon_name";
end;

define inline-only C-function gtk-menu-button-set-label
  input parameter self :: <GtkMenuButton>;
  input parameter label_ :: <C-string>;
  c-name: "gtk_menu_button_set_label";
end;

define inline-only C-function gtk-menu-button-set-menu-model
  input parameter self :: <GtkMenuButton>;
  input parameter menu_model_ :: <GMenuModel>;
  c-name: "gtk_menu_button_set_menu_model";
end;

define inline-only C-function gtk-menu-button-set-popover
  input parameter self :: <GtkMenuButton>;
  input parameter popover_ :: <GtkWidget>;
  c-name: "gtk_menu_button_set_popover";
end;

define inline-only C-function gtk-menu-button-set-primary
  input parameter self :: <GtkMenuButton>;
  input parameter primary_ :: <C-boolean>;
  c-name: "gtk_menu_button_set_primary";
end;

define inline-only C-function gtk-menu-button-set-use-underline
  input parameter self :: <GtkMenuButton>;
  input parameter use_underline_ :: <C-boolean>;
  c-name: "gtk_menu_button_set_use_underline";
end;

define open C-subtype <GtkMessageDialog> (<GtkDialog>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkMessageDialog*> => <GtkMessageDialog>;

define sealed domain make (singleton(<GtkMessageDialog*>));
define sealed domain initialize (<GtkMessageDialog*>);

define inline-only C-function gtk-message-dialog-get-message-area
  input parameter self :: <GtkMessageDialog>;
  result res :: <GtkWidget>;
  c-name: "gtk_message_dialog_get_message_area";
end;

define inline-only C-function gtk-message-dialog-set-markup
  input parameter self :: <GtkMessageDialog>;
  input parameter str_ :: <C-string>;
  c-name: "gtk_message_dialog_set_markup";
end;

define C-struct <_GtkMessageDialogClass>
  pointer-type-name: <GtkMessageDialogClass>;
end C-struct;

define sealed domain make (singleton(<GtkMessageDialogClass>));
define sealed domain initialize (<GtkMessageDialogClass>);

define inline-only constant $gtk-message-info = 0;
define inline-only constant $gtk-message-warning = 1;
define inline-only constant $gtk-message-question = 2;
define inline-only constant $gtk-message-error = 3;
define inline-only constant $gtk-message-other = 4;
define constant <GtkMessageType> = <C-int>;
define C-pointer-type <GtkMessageType*> => <GtkMessageType>;

define open C-subtype <GtkMnemonicAction> (<GtkShortcutAction>)
end C-subtype;

define C-pointer-type <GtkMnemonicAction*> => <GtkMnemonicAction>;

define sealed domain make (singleton(<GtkMnemonicAction*>));
define sealed domain initialize (<GtkMnemonicAction*>);

define inline-only C-function gtk-mnemonic-action-get
  result res :: <GtkMnemonicAction>;
  c-name: "gtk_mnemonic_action_get";
end;

define C-struct <_GtkMnemonicActionClass>
  pointer-type-name: <GtkMnemonicActionClass>;
end C-struct;

define sealed domain make (singleton(<GtkMnemonicActionClass>));
define sealed domain initialize (<GtkMnemonicActionClass>);

define open C-subtype <GtkMnemonicTrigger> (<GtkShortcutTrigger>)
end C-subtype;

define C-pointer-type <GtkMnemonicTrigger*> => <GtkMnemonicTrigger>;

define sealed domain make (singleton(<GtkMnemonicTrigger*>));
define sealed domain initialize (<GtkMnemonicTrigger*>);

define inline-only C-function gtk-mnemonic-trigger-new
  input parameter keyval_ :: <C-unsigned-int>;
  result res :: <GtkMnemonicTrigger>;
  c-name: "gtk_mnemonic_trigger_new";
end;

define inline-only C-function gtk-mnemonic-trigger-get-keyval
  input parameter self :: <GtkMnemonicTrigger>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_mnemonic_trigger_get_keyval";
end;

define C-struct <_GtkMnemonicTriggerClass>
  pointer-type-name: <GtkMnemonicTriggerClass>;
end C-struct;

define sealed domain make (singleton(<GtkMnemonicTriggerClass>));
define sealed domain initialize (<GtkMnemonicTriggerClass>);

define open C-subtype <GtkMountOperation> (<GMountOperation>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GtkMountOperation*> => <GtkMountOperation>;

define sealed domain make (singleton(<GtkMountOperation*>));
define sealed domain initialize (<GtkMountOperation*>);

define inline-only C-function gtk-mount-operation-new
  input parameter parent_ :: <GtkWindow>;
  result res :: <GMountOperation>;
  c-name: "gtk_mount_operation_new";
end;

define inline-only C-function gtk-mount-operation-get-display
  input parameter self :: <GtkMountOperation>;
  result res :: <GdkDisplay>;
  c-name: "gtk_mount_operation_get_display";
end;

define inline-only C-function gtk-mount-operation-get-parent
  input parameter self :: <GtkMountOperation>;
  result res :: <GtkWindow>;
  c-name: "gtk_mount_operation_get_parent";
end;

define inline-only C-function gtk-mount-operation-is-showing
  input parameter self :: <GtkMountOperation>;
  result res :: <C-boolean>;
  c-name: "gtk_mount_operation_is_showing";
end;

define inline-only C-function gtk-mount-operation-set-display
  input parameter self :: <GtkMountOperation>;
  input parameter display_ :: <GdkDisplay>;
  c-name: "gtk_mount_operation_set_display";
end;

define inline-only C-function gtk-mount-operation-set-parent
  input parameter self :: <GtkMountOperation>;
  input parameter parent_ :: <GtkWindow>;
  c-name: "gtk_mount_operation_set_parent";
end;

define C-struct <_GtkMountOperationClass>
  constant sealed inline-only slot gtk-mount-operation-class-parent-class :: <GMountOperationClass>;
  constant sealed inline-only slot gtk-mount-operation-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-mount-operation-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-mount-operation-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-mount-operation-class-_gtk-reserved4 :: <C-void*>;
  pointer-type-name: <GtkMountOperationClass>;
end C-struct;

define sealed domain make (singleton(<GtkMountOperationClass>));
define sealed domain initialize (<GtkMountOperationClass>);

define C-struct <_GtkMountOperationPrivate>
  pointer-type-name: <GtkMountOperationPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkMountOperationPrivate>));
define sealed domain initialize (<GtkMountOperationPrivate>);

define inline-only constant $gtk-movement-logical-positions = 0;
define inline-only constant $gtk-movement-visual-positions = 1;
define inline-only constant $gtk-movement-words = 2;
define inline-only constant $gtk-movement-display-lines = 3;
define inline-only constant $gtk-movement-display-line-ends = 4;
define inline-only constant $gtk-movement-paragraphs = 5;
define inline-only constant $gtk-movement-paragraph-ends = 6;
define inline-only constant $gtk-movement-pages = 7;
define inline-only constant $gtk-movement-buffer-ends = 8;
define inline-only constant $gtk-movement-horizontal-pages = 9;
define constant <GtkMovementStep> = <C-int>;
define C-pointer-type <GtkMovementStep*> => <GtkMovementStep>;

define open C-subtype <GtkMultiFilter> (<GtkFilter>, <GListModel>, <GtkBuildable>)
end C-subtype;

define C-pointer-type <GtkMultiFilter*> => <GtkMultiFilter>;

define sealed domain make (singleton(<GtkMultiFilter*>));
define sealed domain initialize (<GtkMultiFilter*>);

define inline-only C-function gtk-multi-filter-append
  input parameter self :: <GtkMultiFilter>;
  input parameter filter_ :: <GtkFilter>;
  c-name: "gtk_multi_filter_append";
end;

define inline-only C-function gtk-multi-filter-remove
  input parameter self :: <GtkMultiFilter>;
  input parameter position_ :: <C-unsigned-int>;
  c-name: "gtk_multi_filter_remove";
end;

define C-struct <_GtkMultiFilterClass>
  pointer-type-name: <GtkMultiFilterClass>;
end C-struct;

define sealed domain make (singleton(<GtkMultiFilterClass>));
define sealed domain initialize (<GtkMultiFilterClass>);

define open C-subtype <GtkMultiSelection> (<GObject>, <GtkSelectionModel>)
end C-subtype;

define C-pointer-type <GtkMultiSelection*> => <GtkMultiSelection>;

define sealed domain make (singleton(<GtkMultiSelection*>));
define sealed domain initialize (<GtkMultiSelection*>);

define inline-only C-function gtk-multi-selection-new
  input parameter model_ :: <GListModel>;
  result res :: <GtkMultiSelection>;
  c-name: "gtk_multi_selection_new";
end;

define inline-only C-function gtk-multi-selection-get-model
  input parameter self :: <GtkMultiSelection>;
  result res :: <GListModel>;
  c-name: "gtk_multi_selection_get_model";
end;

define inline-only C-function gtk-multi-selection-set-model
  input parameter self :: <GtkMultiSelection>;
  input parameter model_ :: <GListModel>;
  c-name: "gtk_multi_selection_set_model";
end;

define C-struct <_GtkMultiSelectionClass>
  constant sealed inline-only slot gtk-multi-selection-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkMultiSelectionClass>;
end C-struct;

define sealed domain make (singleton(<GtkMultiSelectionClass>));
define sealed domain initialize (<GtkMultiSelectionClass>);

define open C-subtype <GtkMultiSorter> (<GtkSorter>, <GListModel>, <GtkBuildable>)
end C-subtype;

define C-pointer-type <GtkMultiSorter*> => <GtkMultiSorter>;

define sealed domain make (singleton(<GtkMultiSorter*>));
define sealed domain initialize (<GtkMultiSorter*>);

define inline-only C-function gtk-multi-sorter-new
  result res :: <GtkMultiSorter>;
  c-name: "gtk_multi_sorter_new";
end;

define inline-only C-function gtk-multi-sorter-append
  input parameter self :: <GtkMultiSorter>;
  input parameter sorter_ :: <GtkSorter>;
  c-name: "gtk_multi_sorter_append";
end;

define inline-only C-function gtk-multi-sorter-remove
  input parameter self :: <GtkMultiSorter>;
  input parameter position_ :: <C-unsigned-int>;
  c-name: "gtk_multi_sorter_remove";
end;

define C-struct <_GtkMultiSorterClass>
  constant sealed inline-only slot gtk-multi-sorter-class-parent-class :: <GtkSorterClass>;
  pointer-type-name: <GtkMultiSorterClass>;
end C-struct;

define sealed domain make (singleton(<GtkMultiSorterClass>));
define sealed domain initialize (<GtkMultiSorterClass>);

define open C-subtype <GtkNamedAction> (<GtkShortcutAction>)
end C-subtype;

define C-pointer-type <GtkNamedAction*> => <GtkNamedAction>;

define sealed domain make (singleton(<GtkNamedAction*>));
define sealed domain initialize (<GtkNamedAction*>);

define inline-only C-function gtk-named-action-new
  input parameter name_ :: <C-string>;
  result res :: <GtkNamedAction>;
  c-name: "gtk_named_action_new";
end;

define inline-only C-function gtk-named-action-get-action-name
  input parameter self :: <GtkNamedAction>;
  result res :: <C-string>;
  c-name: "gtk_named_action_get_action_name";
end;

define C-struct <_GtkNamedActionClass>
  pointer-type-name: <GtkNamedActionClass>;
end C-struct;

define sealed domain make (singleton(<GtkNamedActionClass>));
define sealed domain initialize (<GtkNamedActionClass>);

// Interface
define open C-subtype <GtkNative> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkNative*> => <GtkNative>;

define sealed domain make (singleton(<GtkNative*>));
define sealed domain initialize (<GtkNative*>);

define inline-only C-function gtk-native-get-for-surface
  input parameter surface_ :: <GdkSurface>;
  result res :: <GtkNative>;
  c-name: "gtk_native_get_for_surface";
end;

define inline-only C-function gtk-native-get-renderer
  input parameter self :: <GtkNative>;
  result res :: <GskRenderer>;
  c-name: "gtk_native_get_renderer";
end;

define inline-only C-function gtk-native-get-surface
  input parameter self :: <GtkNative>;
  result res :: <GdkSurface>;
  c-name: "gtk_native_get_surface";
end;

define inline-only C-function gtk-native-get-surface-transform
  input parameter self :: <GtkNative>;
  output parameter x_ :: <C-double*>;
  output parameter y_ :: <C-double*>;
  c-name: "gtk_native_get_surface_transform";
end;

define inline-only C-function gtk-native-realize
  input parameter self :: <GtkNative>;
  c-name: "gtk_native_realize";
end;

define inline-only C-function gtk-native-unrealize
  input parameter self :: <GtkNative>;
  c-name: "gtk_native_unrealize";
end;

define open C-subtype <GtkNativeDialog> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkNativeDialog*> => <GtkNativeDialog>;

define sealed domain make (singleton(<GtkNativeDialog*>));
define sealed domain initialize (<GtkNativeDialog*>);

define inline-only C-function gtk-native-dialog-destroy
  input parameter self :: <GtkNativeDialog>;
  c-name: "gtk_native_dialog_destroy";
end;

define inline-only C-function gtk-native-dialog-get-modal
  input parameter self :: <GtkNativeDialog>;
  result res :: <C-boolean>;
  c-name: "gtk_native_dialog_get_modal";
end;

define inline-only C-function gtk-native-dialog-get-title
  input parameter self :: <GtkNativeDialog>;
  result res :: <C-string>;
  c-name: "gtk_native_dialog_get_title";
end;

define inline-only C-function gtk-native-dialog-get-transient-for
  input parameter self :: <GtkNativeDialog>;
  result res :: <GtkWindow>;
  c-name: "gtk_native_dialog_get_transient_for";
end;

define inline-only C-function gtk-native-dialog-get-visible
  input parameter self :: <GtkNativeDialog>;
  result res :: <C-boolean>;
  c-name: "gtk_native_dialog_get_visible";
end;

define inline-only C-function gtk-native-dialog-hide
  input parameter self :: <GtkNativeDialog>;
  c-name: "gtk_native_dialog_hide";
end;

define inline-only C-function gtk-native-dialog-set-modal
  input parameter self :: <GtkNativeDialog>;
  input parameter modal_ :: <C-boolean>;
  c-name: "gtk_native_dialog_set_modal";
end;

define inline-only C-function gtk-native-dialog-set-title
  input parameter self :: <GtkNativeDialog>;
  input parameter title_ :: <C-string>;
  c-name: "gtk_native_dialog_set_title";
end;

define inline-only C-function gtk-native-dialog-set-transient-for
  input parameter self :: <GtkNativeDialog>;
  input parameter parent_ :: <GtkWindow>;
  c-name: "gtk_native_dialog_set_transient_for";
end;

define inline-only C-function gtk-native-dialog-show
  input parameter self :: <GtkNativeDialog>;
  c-name: "gtk_native_dialog_show";
end;

define C-struct <_GtkNativeDialogClass>
  constant sealed inline-only slot gtk-native-dialog-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-native-dialog-class-response :: <C-function-pointer>;
  constant sealed inline-only slot gtk-native-dialog-class-show :: <C-function-pointer>;
  constant sealed inline-only slot gtk-native-dialog-class-hide :: <C-function-pointer>;
  constant sealed inline-only slot gtk-native-dialog-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-native-dialog-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-native-dialog-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-native-dialog-class-_gtk-reserved4 :: <C-void*>;
  pointer-type-name: <GtkNativeDialogClass>;
end C-struct;

define sealed domain make (singleton(<GtkNativeDialogClass>));
define sealed domain initialize (<GtkNativeDialogClass>);

define C-struct <_GtkNativeInterface>
  pointer-type-name: <GtkNativeInterface>;
end C-struct;

define sealed domain make (singleton(<GtkNativeInterface>));
define sealed domain initialize (<GtkNativeInterface>);

define inline-only constant $gtk-natural-wrap-inherit = 0;
define inline-only constant $gtk-natural-wrap-none = 1;
define inline-only constant $gtk-natural-wrap-word = 2;
define constant <GtkNaturalWrapMode> = <C-int>;
define C-pointer-type <GtkNaturalWrapMode*> => <GtkNaturalWrapMode>;

define open C-subtype <GtkNeverTrigger> (<GtkShortcutTrigger>)
end C-subtype;

define C-pointer-type <GtkNeverTrigger*> => <GtkNeverTrigger>;

define sealed domain make (singleton(<GtkNeverTrigger*>));
define sealed domain initialize (<GtkNeverTrigger*>);

define inline-only C-function gtk-never-trigger-get
  result res :: <GtkNeverTrigger>;
  c-name: "gtk_never_trigger_get";
end;

define C-struct <_GtkNeverTriggerClass>
  pointer-type-name: <GtkNeverTriggerClass>;
end C-struct;

define sealed domain make (singleton(<GtkNeverTriggerClass>));
define sealed domain initialize (<GtkNeverTriggerClass>);

define open C-subtype <GtkNoSelection> (<GObject>, <GtkSelectionModel>)
end C-subtype;

define C-pointer-type <GtkNoSelection*> => <GtkNoSelection>;

define sealed domain make (singleton(<GtkNoSelection*>));
define sealed domain initialize (<GtkNoSelection*>);

define inline-only C-function gtk-no-selection-new
  input parameter model_ :: <GListModel>;
  result res :: <GtkNoSelection>;
  c-name: "gtk_no_selection_new";
end;

define inline-only C-function gtk-no-selection-get-model
  input parameter self :: <GtkNoSelection>;
  result res :: <GListModel>;
  c-name: "gtk_no_selection_get_model";
end;

define inline-only C-function gtk-no-selection-set-model
  input parameter self :: <GtkNoSelection>;
  input parameter model_ :: <GListModel>;
  c-name: "gtk_no_selection_set_model";
end;

define C-struct <_GtkNoSelectionClass>
  constant sealed inline-only slot gtk-no-selection-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkNoSelectionClass>;
end C-struct;

define sealed domain make (singleton(<GtkNoSelectionClass>));
define sealed domain initialize (<GtkNoSelectionClass>);

define open C-subtype <GtkNotebook> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkNotebook*> => <GtkNotebook>;

define sealed domain make (singleton(<GtkNotebook*>));
define sealed domain initialize (<GtkNotebook*>);

define inline-only C-function gtk-notebook-new
  result res :: <GtkWidget>;
  c-name: "gtk_notebook_new";
end;

define inline-only C-function gtk-notebook-append-page
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter tab_label_ :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_notebook_append_page";
end;

define inline-only C-function gtk-notebook-append-page-menu
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter tab_label_ :: <GtkWidget>;
  input parameter menu_label_ :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_notebook_append_page_menu";
end;

define inline-only C-function gtk-notebook-detach-tab
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_notebook_detach_tab";
end;

define inline-only C-function gtk-notebook-get-action-widget
  input parameter self :: <GtkNotebook>;
  input parameter pack_type_ :: <GtkPackType>;
  result res :: <GtkWidget>;
  c-name: "gtk_notebook_get_action_widget";
end;

define inline-only C-function gtk-notebook-get-current-page
  input parameter self :: <GtkNotebook>;
  result res :: <C-signed-int>;
  c-name: "gtk_notebook_get_current_page";
end;

define inline-only C-function gtk-notebook-get-group-name
  input parameter self :: <GtkNotebook>;
  result res :: <C-string>;
  c-name: "gtk_notebook_get_group_name";
end;

define inline-only C-function gtk-notebook-get-menu-label
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  result res :: <GtkWidget>;
  c-name: "gtk_notebook_get_menu_label";
end;

define inline-only C-function gtk-notebook-get-menu-label-text
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  result res :: <C-string>;
  c-name: "gtk_notebook_get_menu_label_text";
end;

define inline-only C-function gtk-notebook-get-n-pages
  input parameter self :: <GtkNotebook>;
  result res :: <C-signed-int>;
  c-name: "gtk_notebook_get_n_pages";
end;

define inline-only C-function gtk-notebook-get-nth-page
  input parameter self :: <GtkNotebook>;
  input parameter page_num_ :: <C-signed-int>;
  result res :: <GtkWidget>;
  c-name: "gtk_notebook_get_nth_page";
end;

define inline-only C-function gtk-notebook-get-page
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  result res :: <GtkNotebookPage>;
  c-name: "gtk_notebook_get_page";
end;

define inline-only C-function gtk-notebook-get-pages
  input parameter self :: <GtkNotebook>;
  result res :: <GListModel>;
  c-name: "gtk_notebook_get_pages";
end;

define inline-only C-function gtk-notebook-get-scrollable
  input parameter self :: <GtkNotebook>;
  result res :: <C-boolean>;
  c-name: "gtk_notebook_get_scrollable";
end;

define inline-only C-function gtk-notebook-get-show-border
  input parameter self :: <GtkNotebook>;
  result res :: <C-boolean>;
  c-name: "gtk_notebook_get_show_border";
end;

define inline-only C-function gtk-notebook-get-show-tabs
  input parameter self :: <GtkNotebook>;
  result res :: <C-boolean>;
  c-name: "gtk_notebook_get_show_tabs";
end;

define inline-only C-function gtk-notebook-get-tab-detachable
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_notebook_get_tab_detachable";
end;

define inline-only C-function gtk-notebook-get-tab-label
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  result res :: <GtkWidget>;
  c-name: "gtk_notebook_get_tab_label";
end;

define inline-only C-function gtk-notebook-get-tab-label-text
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  result res :: <C-string>;
  c-name: "gtk_notebook_get_tab_label_text";
end;

define inline-only C-function gtk-notebook-get-tab-pos
  input parameter self :: <GtkNotebook>;
  result res :: <GtkPositionType>;
  c-name: "gtk_notebook_get_tab_pos";
end;

define inline-only C-function gtk-notebook-get-tab-reorderable
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_notebook_get_tab_reorderable";
end;

define inline-only C-function gtk-notebook-insert-page
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter tab_label_ :: <GtkWidget>;
  input parameter position_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gtk_notebook_insert_page";
end;

define inline-only C-function gtk-notebook-insert-page-menu
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter tab_label_ :: <GtkWidget>;
  input parameter menu_label_ :: <GtkWidget>;
  input parameter position_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gtk_notebook_insert_page_menu";
end;

define inline-only C-function gtk-notebook-next-page
  input parameter self :: <GtkNotebook>;
  c-name: "gtk_notebook_next_page";
end;

define inline-only C-function gtk-notebook-page-num
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_notebook_page_num";
end;

define inline-only C-function gtk-notebook-popup-disable
  input parameter self :: <GtkNotebook>;
  c-name: "gtk_notebook_popup_disable";
end;

define inline-only C-function gtk-notebook-popup-enable
  input parameter self :: <GtkNotebook>;
  c-name: "gtk_notebook_popup_enable";
end;

define inline-only C-function gtk-notebook-prepend-page
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter tab_label_ :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_notebook_prepend_page";
end;

define inline-only C-function gtk-notebook-prepend-page-menu
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter tab_label_ :: <GtkWidget>;
  input parameter menu_label_ :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_notebook_prepend_page_menu";
end;

define inline-only C-function gtk-notebook-prev-page
  input parameter self :: <GtkNotebook>;
  c-name: "gtk_notebook_prev_page";
end;

define inline-only C-function gtk-notebook-remove-page
  input parameter self :: <GtkNotebook>;
  input parameter page_num_ :: <C-signed-int>;
  c-name: "gtk_notebook_remove_page";
end;

define inline-only C-function gtk-notebook-reorder-child
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_notebook_reorder_child";
end;

define inline-only C-function gtk-notebook-set-action-widget
  input parameter self :: <GtkNotebook>;
  input parameter widget_ :: <GtkWidget>;
  input parameter pack_type_ :: <GtkPackType>;
  c-name: "gtk_notebook_set_action_widget";
end;

define inline-only C-function gtk-notebook-set-current-page
  input parameter self :: <GtkNotebook>;
  input parameter page_num_ :: <C-signed-int>;
  c-name: "gtk_notebook_set_current_page";
end;

define inline-only C-function gtk-notebook-set-group-name
  input parameter self :: <GtkNotebook>;
  input parameter group_name_ :: <C-string>;
  c-name: "gtk_notebook_set_group_name";
end;

define inline-only C-function gtk-notebook-set-menu-label
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter menu_label_ :: <GtkWidget>;
  c-name: "gtk_notebook_set_menu_label";
end;

define inline-only C-function gtk-notebook-set-menu-label-text
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter menu_text_ :: <C-string>;
  c-name: "gtk_notebook_set_menu_label_text";
end;

define inline-only C-function gtk-notebook-set-scrollable
  input parameter self :: <GtkNotebook>;
  input parameter scrollable_ :: <C-boolean>;
  c-name: "gtk_notebook_set_scrollable";
end;

define inline-only C-function gtk-notebook-set-show-border
  input parameter self :: <GtkNotebook>;
  input parameter show_border_ :: <C-boolean>;
  c-name: "gtk_notebook_set_show_border";
end;

define inline-only C-function gtk-notebook-set-show-tabs
  input parameter self :: <GtkNotebook>;
  input parameter show_tabs_ :: <C-boolean>;
  c-name: "gtk_notebook_set_show_tabs";
end;

define inline-only C-function gtk-notebook-set-tab-detachable
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter detachable_ :: <C-boolean>;
  c-name: "gtk_notebook_set_tab_detachable";
end;

define inline-only C-function gtk-notebook-set-tab-label
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter tab_label_ :: <GtkWidget>;
  c-name: "gtk_notebook_set_tab_label";
end;

define inline-only C-function gtk-notebook-set-tab-label-text
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter tab_text_ :: <C-string>;
  c-name: "gtk_notebook_set_tab_label_text";
end;

define inline-only C-function gtk-notebook-set-tab-pos
  input parameter self :: <GtkNotebook>;
  input parameter pos_ :: <GtkPositionType>;
  c-name: "gtk_notebook_set_tab_pos";
end;

define inline-only C-function gtk-notebook-set-tab-reorderable
  input parameter self :: <GtkNotebook>;
  input parameter child_ :: <GtkWidget>;
  input parameter reorderable_ :: <C-boolean>;
  c-name: "gtk_notebook_set_tab_reorderable";
end;

define open C-subtype <GtkNotebookPage> (<GObject>)
end C-subtype;

define C-pointer-type <GtkNotebookPage*> => <GtkNotebookPage>;

define sealed domain make (singleton(<GtkNotebookPage*>));
define sealed domain initialize (<GtkNotebookPage*>);

define inline-only C-function gtk-notebook-page-get-child
  input parameter self :: <GtkNotebookPage>;
  result res :: <GtkWidget>;
  c-name: "gtk_notebook_page_get_child";
end;

define inline-only constant $gtk-notebook-tab-first = 0;
define inline-only constant $gtk-notebook-tab-last = 1;
define constant <GtkNotebookTab> = <C-int>;
define C-pointer-type <GtkNotebookTab*> => <GtkNotebookTab>;

define open C-subtype <GtkNothingAction> (<GtkShortcutAction>)
end C-subtype;

define C-pointer-type <GtkNothingAction*> => <GtkNothingAction>;

define sealed domain make (singleton(<GtkNothingAction*>));
define sealed domain initialize (<GtkNothingAction*>);

define inline-only C-function gtk-nothing-action-get
  result res :: <GtkNothingAction>;
  c-name: "gtk_nothing_action_get";
end;

define C-struct <_GtkNothingActionClass>
  pointer-type-name: <GtkNothingActionClass>;
end C-struct;

define sealed domain make (singleton(<GtkNothingActionClass>));
define sealed domain initialize (<GtkNothingActionClass>);

define inline-only constant $gtk-number-up-layout-left-to-right-top-to-bottom = 0;
define inline-only constant $gtk-number-up-layout-left-to-right-bottom-to-top = 1;
define inline-only constant $gtk-number-up-layout-right-to-left-top-to-bottom = 2;
define inline-only constant $gtk-number-up-layout-right-to-left-bottom-to-top = 3;
define inline-only constant $gtk-number-up-layout-top-to-bottom-left-to-right = 4;
define inline-only constant $gtk-number-up-layout-top-to-bottom-right-to-left = 5;
define inline-only constant $gtk-number-up-layout-bottom-to-top-left-to-right = 6;
define inline-only constant $gtk-number-up-layout-bottom-to-top-right-to-left = 7;
define constant <GtkNumberUpLayout> = <C-int>;
define C-pointer-type <GtkNumberUpLayout*> => <GtkNumberUpLayout>;

define open C-subtype <GtkNumericSorter> (<GtkSorter>)
end C-subtype;

define C-pointer-type <GtkNumericSorter*> => <GtkNumericSorter>;

define sealed domain make (singleton(<GtkNumericSorter*>));
define sealed domain initialize (<GtkNumericSorter*>);

define inline-only C-function gtk-numeric-sorter-new
  input parameter expression_ :: <GtkExpression>;
  result res :: <GtkNumericSorter>;
  c-name: "gtk_numeric_sorter_new";
end;

define inline-only C-function gtk-numeric-sorter-get-expression
  input parameter self :: <GtkNumericSorter>;
  result res :: <GtkExpression>;
  c-name: "gtk_numeric_sorter_get_expression";
end;

define inline-only C-function gtk-numeric-sorter-get-sort-order
  input parameter self :: <GtkNumericSorter>;
  result res :: <GtkSortType>;
  c-name: "gtk_numeric_sorter_get_sort_order";
end;

define inline-only C-function gtk-numeric-sorter-set-expression
  input parameter self :: <GtkNumericSorter>;
  input parameter expression_ :: <GtkExpression>;
  c-name: "gtk_numeric_sorter_set_expression";
end;

define inline-only C-function gtk-numeric-sorter-set-sort-order
  input parameter self :: <GtkNumericSorter>;
  input parameter sort_order_ :: <GtkSortType>;
  c-name: "gtk_numeric_sorter_set_sort_order";
end;

define C-struct <_GtkNumericSorterClass>
  constant sealed inline-only slot gtk-numeric-sorter-class-parent-class :: <GtkSorterClass>;
  pointer-type-name: <GtkNumericSorterClass>;
end C-struct;

define sealed domain make (singleton(<GtkNumericSorterClass>));
define sealed domain initialize (<GtkNumericSorterClass>);

define open C-subtype <GtkObjectExpression> (<GtkExpression>)
end C-subtype;

define C-pointer-type <GtkObjectExpression*> => <GtkObjectExpression>;

define sealed domain make (singleton(<GtkObjectExpression*>));
define sealed domain initialize (<GtkObjectExpression*>);

define inline-only C-function gtk-object-expression-new
  input parameter object_ :: <GObject>;
  result res :: <GtkObjectExpression>;
  c-name: "gtk_object_expression_new";
end;

define inline-only C-function gtk-object-expression-get-object
  input parameter self :: <GtkObjectExpression>;
  result res :: <GObject>;
  c-name: "gtk_object_expression_get_object";
end;

define inline-only constant $gtk-ordering-smaller = -1;
define inline-only constant $gtk-ordering-equal = 0;
define inline-only constant $gtk-ordering-larger = 1;
define constant <GtkOrdering> = <C-int>;
define C-pointer-type <GtkOrdering*> => <GtkOrdering>;

// Interface
define open C-subtype <GtkOrientable> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkOrientable*> => <GtkOrientable>;

define sealed domain make (singleton(<GtkOrientable*>));
define sealed domain initialize (<GtkOrientable*>);

define inline-only C-function gtk-orientable-get-orientation
  input parameter self :: <GtkOrientable>;
  result res :: <GtkOrientation>;
  c-name: "gtk_orientable_get_orientation";
end;

define inline-only C-function gtk-orientable-set-orientation
  input parameter self :: <GtkOrientable>;
  input parameter orientation_ :: <GtkOrientation>;
  c-name: "gtk_orientable_set_orientation";
end;

define C-struct <_GtkOrientableIface>
  constant sealed inline-only slot gtk-orientable-iface-base-iface :: <GTypeInterface>;
  pointer-type-name: <GtkOrientableIface>;
end C-struct;

define sealed domain make (singleton(<GtkOrientableIface>));
define sealed domain initialize (<GtkOrientableIface>);

define inline-only constant $gtk-orientation-horizontal = 0;
define inline-only constant $gtk-orientation-vertical = 1;
define constant <GtkOrientation> = <C-int>;
define C-pointer-type <GtkOrientation*> => <GtkOrientation>;

define inline-only constant $gtk-overflow-visible = 0;
define inline-only constant $gtk-overflow-hidden = 1;
define constant <GtkOverflow> = <C-int>;
define C-pointer-type <GtkOverflow*> => <GtkOverflow>;

define open C-subtype <GtkOverlay> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkOverlay*> => <GtkOverlay>;

define sealed domain make (singleton(<GtkOverlay*>));
define sealed domain initialize (<GtkOverlay*>);

define inline-only C-function gtk-overlay-new
  result res :: <GtkWidget>;
  c-name: "gtk_overlay_new";
end;

define inline-only C-function gtk-overlay-add-overlay
  input parameter self :: <GtkOverlay>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_overlay_add_overlay";
end;

define inline-only C-function gtk-overlay-get-child
  input parameter self :: <GtkOverlay>;
  result res :: <GtkWidget>;
  c-name: "gtk_overlay_get_child";
end;

define inline-only C-function gtk-overlay-get-clip-overlay
  input parameter self :: <GtkOverlay>;
  input parameter widget_ :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_overlay_get_clip_overlay";
end;

define inline-only C-function gtk-overlay-get-measure-overlay
  input parameter self :: <GtkOverlay>;
  input parameter widget_ :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_overlay_get_measure_overlay";
end;

define inline-only C-function gtk-overlay-remove-overlay
  input parameter self :: <GtkOverlay>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_overlay_remove_overlay";
end;

define inline-only C-function gtk-overlay-set-child
  input parameter self :: <GtkOverlay>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_overlay_set_child";
end;

define inline-only C-function gtk-overlay-set-clip-overlay
  input parameter self :: <GtkOverlay>;
  input parameter widget_ :: <GtkWidget>;
  input parameter clip_overlay_ :: <C-boolean>;
  c-name: "gtk_overlay_set_clip_overlay";
end;

define inline-only C-function gtk-overlay-set-measure-overlay
  input parameter self :: <GtkOverlay>;
  input parameter widget_ :: <GtkWidget>;
  input parameter measure_ :: <C-boolean>;
  c-name: "gtk_overlay_set_measure_overlay";
end;

define open C-subtype <GtkOverlayLayout> (<GtkLayoutManager>)
end C-subtype;

define C-pointer-type <GtkOverlayLayout*> => <GtkOverlayLayout>;

define sealed domain make (singleton(<GtkOverlayLayout*>));
define sealed domain initialize (<GtkOverlayLayout*>);

define inline-only C-function gtk-overlay-layout-new
  result res :: <GtkLayoutManager>;
  c-name: "gtk_overlay_layout_new";
end;

define open C-subtype <GtkOverlayLayoutChild> (<GtkLayoutChild>)
end C-subtype;

define C-pointer-type <GtkOverlayLayoutChild*> => <GtkOverlayLayoutChild>;

define sealed domain make (singleton(<GtkOverlayLayoutChild*>));
define sealed domain initialize (<GtkOverlayLayoutChild*>);

define inline-only C-function gtk-overlay-layout-child-get-clip-overlay
  input parameter self :: <GtkOverlayLayoutChild>;
  result res :: <C-boolean>;
  c-name: "gtk_overlay_layout_child_get_clip_overlay";
end;

define inline-only C-function gtk-overlay-layout-child-get-measure
  input parameter self :: <GtkOverlayLayoutChild>;
  result res :: <C-boolean>;
  c-name: "gtk_overlay_layout_child_get_measure";
end;

define inline-only C-function gtk-overlay-layout-child-set-clip-overlay
  input parameter self :: <GtkOverlayLayoutChild>;
  input parameter clip_overlay_ :: <C-boolean>;
  c-name: "gtk_overlay_layout_child_set_clip_overlay";
end;

define inline-only C-function gtk-overlay-layout-child-set-measure
  input parameter self :: <GtkOverlayLayoutChild>;
  input parameter measure_ :: <C-boolean>;
  c-name: "gtk_overlay_layout_child_set_measure";
end;

define C-struct <_GtkOverlayLayoutChildClass>
  constant sealed inline-only slot gtk-overlay-layout-child-class-parent-class :: <GtkLayoutChildClass>;
  pointer-type-name: <GtkOverlayLayoutChildClass>;
end C-struct;

define sealed domain make (singleton(<GtkOverlayLayoutChildClass>));
define sealed domain initialize (<GtkOverlayLayoutChildClass>);

define C-struct <_GtkOverlayLayoutClass>
  constant sealed inline-only slot gtk-overlay-layout-class-parent-class :: <GtkLayoutManagerClass>;
  pointer-type-name: <GtkOverlayLayoutClass>;
end C-struct;

define sealed domain make (singleton(<GtkOverlayLayoutClass>));
define sealed domain initialize (<GtkOverlayLayoutClass>);

define inline-only constant $paper-name-a3 = "iso_a3";

define inline-only constant $paper-name-a4 = "iso_a4";

define inline-only constant $paper-name-a5 = "iso_a5";

define inline-only constant $paper-name-b5 = "iso_b5";

define inline-only constant $paper-name-executive = "na_executive";

define inline-only constant $paper-name-legal = "na_legal";

define inline-only constant $paper-name-letter = "na_letter";

define inline-only constant $print-settings-collate = "collate";

define inline-only constant $print-settings-default-source = "default-source";

define inline-only constant $print-settings-dither = "dither";

define inline-only constant $print-settings-duplex = "duplex";

define inline-only constant $print-settings-finishings = "finishings";

define inline-only constant $print-settings-media-type = "media-type";

define inline-only constant $print-settings-number-up = "number-up";

define inline-only constant $print-settings-number-up-layout = "number-up-layout";

define inline-only constant $print-settings-n-copies = "n-copies";

define inline-only constant $print-settings-orientation = "orientation";

define inline-only constant $print-settings-output-basename = "output-basename";

define inline-only constant $print-settings-output-bin = "output-bin";

define inline-only constant $print-settings-output-dir = "output-dir";

define inline-only constant $print-settings-output-file-format = "output-file-format";

define inline-only constant $print-settings-output-uri = "output-uri";

define inline-only constant $print-settings-page-ranges = "page-ranges";

define inline-only constant $print-settings-page-set = "page-set";

define inline-only constant $print-settings-paper-format = "paper-format";

define inline-only constant $print-settings-paper-height = "paper-height";

define inline-only constant $print-settings-paper-width = "paper-width";

define inline-only constant $print-settings-printer = "printer";

define inline-only constant $print-settings-printer-lpi = "printer-lpi";

define inline-only constant $print-settings-print-pages = "print-pages";

define inline-only constant $print-settings-quality = "quality";

define inline-only constant $print-settings-resolution = "resolution";

define inline-only constant $print-settings-resolution-x = "resolution-x";

define inline-only constant $print-settings-resolution-y = "resolution-y";

define inline-only constant $print-settings-reverse = "reverse";

define inline-only constant $print-settings-scale = "scale";

define inline-only constant $print-settings-use-color = "use-color";

define inline-only constant $print-settings-win32-driver-extra = "win32-driver-extra";

define inline-only constant $print-settings-win32-driver-version = "win32-driver-version";

define inline-only constant $priority-resize = 110;

define inline-only constant $gtk-pack-start = 0;
define inline-only constant $gtk-pack-end = 1;
define constant <GtkPackType> = <C-int>;
define C-pointer-type <GtkPackType*> => <GtkPackType>;

define C-struct <_GtkPadActionEntry>
  sealed inline-only slot gtk-pad-action-entry-type :: <GtkPadActionType>;
  sealed inline-only slot gtk-pad-action-entry-index :: <C-signed-int>;
  sealed inline-only slot gtk-pad-action-entry-mode :: <C-signed-int>;
  sealed inline-only slot gtk-pad-action-entry-label :: <C-string>;
  sealed inline-only slot gtk-pad-action-entry-action-name :: <C-string>;
  pointer-type-name: <GtkPadActionEntry>;
end C-struct;

define sealed domain make (singleton(<GtkPadActionEntry>));
define sealed domain initialize (<GtkPadActionEntry>);

define inline-only constant $gtk-pad-action-button = 0;
define inline-only constant $gtk-pad-action-ring = 1;
define inline-only constant $gtk-pad-action-strip = 2;
define constant <GtkPadActionType> = <C-int>;
define C-pointer-type <GtkPadActionType*> => <GtkPadActionType>;

define open C-subtype <GtkPadController> (<GtkEventController>)
end C-subtype;

define C-pointer-type <GtkPadController*> => <GtkPadController>;

define sealed domain make (singleton(<GtkPadController*>));
define sealed domain initialize (<GtkPadController*>);

define inline-only C-function gtk-pad-controller-new
  input parameter group_ :: <GActionGroup>;
  input parameter pad_ :: <GdkDevice>;
  result res :: <GtkPadController>;
  c-name: "gtk_pad_controller_new";
end;

define inline-only C-function gtk-pad-controller-set-action
  input parameter self :: <GtkPadController>;
  input parameter type_ :: <GtkPadActionType>;
  input parameter index_ :: <C-signed-int>;
  input parameter mode_ :: <C-signed-int>;
  input parameter label_ :: <C-string>;
  input parameter action_name_ :: <C-string>;
  c-name: "gtk_pad_controller_set_action";
end;

define inline-only C-function gtk-pad-controller-set-action-entries
  input parameter self :: <GtkPadController>;
  input parameter entries_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_entries_ :: <C-signed-int>;
  c-name: "gtk_pad_controller_set_action_entries";
end;

define C-struct <_GtkPadControllerClass>
  pointer-type-name: <GtkPadControllerClass>;
end C-struct;

define sealed domain make (singleton(<GtkPadControllerClass>));
define sealed domain initialize (<GtkPadControllerClass>);

define inline-only constant $gtk-page-orientation-portrait = 0;
define inline-only constant $gtk-page-orientation-landscape = 1;
define inline-only constant $gtk-page-orientation-reverse-portrait = 2;
define inline-only constant $gtk-page-orientation-reverse-landscape = 3;
define constant <GtkPageOrientation> = <C-int>;
define C-pointer-type <GtkPageOrientation*> => <GtkPageOrientation>;

define C-struct <_GtkPageRange>
  sealed inline-only slot gtk-page-range-start :: <C-signed-int>;
  sealed inline-only slot gtk-page-range-end :: <C-signed-int>;
  pointer-type-name: <GtkPageRange>;
end C-struct;

define sealed domain make (singleton(<GtkPageRange>));
define sealed domain initialize (<GtkPageRange>);

define inline-only constant $gtk-page-set-all = 0;
define inline-only constant $gtk-page-set-even = 1;
define inline-only constant $gtk-page-set-odd = 2;
define constant <GtkPageSet> = <C-int>;
define C-pointer-type <GtkPageSet*> => <GtkPageSet>;

define open C-subtype <GtkPageSetup> (<GObject>)
end C-subtype;

define C-pointer-type <GtkPageSetup*> => <GtkPageSetup>;

define sealed domain make (singleton(<GtkPageSetup*>));
define sealed domain initialize (<GtkPageSetup*>);

define inline-only C-function gtk-page-setup-new
  result res :: <GtkPageSetup>;
  c-name: "gtk_page_setup_new";
end;

define inline-only C-function gtk-page-setup-new-from-file
  input parameter file_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_page_setup_new_from_file";
end;

define inline-only C-function gtk-page-setup-new-from-gvariant
  input parameter variant_ :: <GVariant>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_page_setup_new_from_gvariant";
end;

define inline-only C-function gtk-page-setup-new-from-key-file
  input parameter key_file_ :: <GKeyFile>;
  input parameter group_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_page_setup_new_from_key_file";
end;

define inline-only C-function gtk-page-setup-copy
  input parameter self :: <GtkPageSetup>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_page_setup_copy";
end;

define inline-only C-function gtk-page-setup-get-bottom-margin
  input parameter self :: <GtkPageSetup>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_page_setup_get_bottom_margin";
end;

define inline-only C-function gtk-page-setup-get-left-margin
  input parameter self :: <GtkPageSetup>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_page_setup_get_left_margin";
end;

define inline-only C-function gtk-page-setup-get-orientation
  input parameter self :: <GtkPageSetup>;
  result res :: <GtkPageOrientation>;
  c-name: "gtk_page_setup_get_orientation";
end;

define inline-only C-function gtk-page-setup-get-page-height
  input parameter self :: <GtkPageSetup>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_page_setup_get_page_height";
end;

define inline-only C-function gtk-page-setup-get-page-width
  input parameter self :: <GtkPageSetup>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_page_setup_get_page_width";
end;

define inline-only C-function gtk-page-setup-get-paper-height
  input parameter self :: <GtkPageSetup>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_page_setup_get_paper_height";
end;

define inline-only C-function gtk-page-setup-get-paper-size
  input parameter self :: <GtkPageSetup>;
  result res :: <GtkPaperSize>;
  c-name: "gtk_page_setup_get_paper_size";
end;

define inline-only C-function gtk-page-setup-get-paper-width
  input parameter self :: <GtkPageSetup>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_page_setup_get_paper_width";
end;

define inline-only C-function gtk-page-setup-get-right-margin
  input parameter self :: <GtkPageSetup>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_page_setup_get_right_margin";
end;

define inline-only C-function gtk-page-setup-get-top-margin
  input parameter self :: <GtkPageSetup>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_page_setup_get_top_margin";
end;

define inline-only C-function gtk-page-setup-load-file
  input parameter self :: <GtkPageSetup>;
  input parameter file_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_page_setup_load_file";
end;

define inline-only C-function gtk-page-setup-load-key-file
  input parameter self :: <GtkPageSetup>;
  input parameter key_file_ :: <GKeyFile>;
  input parameter group_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_page_setup_load_key_file";
end;

define inline-only C-function gtk-page-setup-set-bottom-margin
  input parameter self :: <GtkPageSetup>;
  input parameter margin_ :: <C-double>;
  input parameter unit_ :: <GtkUnit>;
  c-name: "gtk_page_setup_set_bottom_margin";
end;

define inline-only C-function gtk-page-setup-set-left-margin
  input parameter self :: <GtkPageSetup>;
  input parameter margin_ :: <C-double>;
  input parameter unit_ :: <GtkUnit>;
  c-name: "gtk_page_setup_set_left_margin";
end;

define inline-only C-function gtk-page-setup-set-orientation
  input parameter self :: <GtkPageSetup>;
  input parameter orientation_ :: <GtkPageOrientation>;
  c-name: "gtk_page_setup_set_orientation";
end;

define inline-only C-function gtk-page-setup-set-paper-size
  input parameter self :: <GtkPageSetup>;
  input parameter size_ :: <GtkPaperSize>;
  c-name: "gtk_page_setup_set_paper_size";
end;

define inline-only C-function gtk-page-setup-set-paper-size-and-default-margins
  input parameter self :: <GtkPageSetup>;
  input parameter size_ :: <GtkPaperSize>;
  c-name: "gtk_page_setup_set_paper_size_and_default_margins";
end;

define inline-only C-function gtk-page-setup-set-right-margin
  input parameter self :: <GtkPageSetup>;
  input parameter margin_ :: <C-double>;
  input parameter unit_ :: <GtkUnit>;
  c-name: "gtk_page_setup_set_right_margin";
end;

define inline-only C-function gtk-page-setup-set-top-margin
  input parameter self :: <GtkPageSetup>;
  input parameter margin_ :: <C-double>;
  input parameter unit_ :: <GtkUnit>;
  c-name: "gtk_page_setup_set_top_margin";
end;

define inline-only C-function gtk-page-setup-to-file
  input parameter self :: <GtkPageSetup>;
  input parameter file_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_page_setup_to_file";
end;

define inline-only C-function gtk-page-setup-to-gvariant
  input parameter self :: <GtkPageSetup>;
  result res :: <GVariant>;
  c-name: "gtk_page_setup_to_gvariant";
end;

define inline-only C-function gtk-page-setup-to-key-file
  input parameter self :: <GtkPageSetup>;
  input parameter key_file_ :: <GKeyFile>;
  input parameter group_name_ :: <C-string>;
  c-name: "gtk_page_setup_to_key_file";
end;

define open C-subtype <GtkPageSetupUnixDialog> (<GtkDialog>)
end C-subtype;

define C-pointer-type <GtkPageSetupUnixDialog*> => <GtkPageSetupUnixDialog>;

define sealed domain make (singleton(<GtkPageSetupUnixDialog*>));
define sealed domain initialize (<GtkPageSetupUnixDialog*>);

define inline-only C-function gtk-page-setup-unix-dialog-new
  input parameter title_ :: <C-string>;
  input parameter parent_ :: <GtkWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_page_setup_unix_dialog_new";
end;

define inline-only C-function gtk-page-setup-unix-dialog-get-page-setup
  input parameter self :: <GtkPageSetupUnixDialog>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_page_setup_unix_dialog_get_page_setup";
end;

define inline-only C-function gtk-page-setup-unix-dialog-get-print-settings
  input parameter self :: <GtkPageSetupUnixDialog>;
  result res :: <GtkPrintSettings>;
  c-name: "gtk_page_setup_unix_dialog_get_print_settings";
end;

define inline-only C-function gtk-page-setup-unix-dialog-set-page-setup
  input parameter self :: <GtkPageSetupUnixDialog>;
  input parameter page_setup_ :: <GtkPageSetup>;
  c-name: "gtk_page_setup_unix_dialog_set_page_setup";
end;

define inline-only C-function gtk-page-setup-unix-dialog-set-print-settings
  input parameter self :: <GtkPageSetupUnixDialog>;
  input parameter print_settings_ :: <GtkPrintSettings>;
  c-name: "gtk_page_setup_unix_dialog_set_print_settings";
end;

define inline-only constant $gtk-pan-direction-left = 0;
define inline-only constant $gtk-pan-direction-right = 1;
define inline-only constant $gtk-pan-direction-up = 2;
define inline-only constant $gtk-pan-direction-down = 3;
define constant <GtkPanDirection> = <C-int>;
define C-pointer-type <GtkPanDirection*> => <GtkPanDirection>;

define open C-subtype <GtkPaned> (<GtkWidget>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkPaned*> => <GtkPaned>;

define sealed domain make (singleton(<GtkPaned*>));
define sealed domain initialize (<GtkPaned*>);

define inline-only C-function gtk-paned-new
  input parameter orientation_ :: <GtkOrientation>;
  result res :: <GtkWidget>;
  c-name: "gtk_paned_new";
end;

define inline-only C-function gtk-paned-get-end-child
  input parameter self :: <GtkPaned>;
  result res :: <GtkWidget>;
  c-name: "gtk_paned_get_end_child";
end;

define inline-only C-function gtk-paned-get-position
  input parameter self :: <GtkPaned>;
  result res :: <C-signed-int>;
  c-name: "gtk_paned_get_position";
end;

define inline-only C-function gtk-paned-get-resize-end-child
  input parameter self :: <GtkPaned>;
  result res :: <C-boolean>;
  c-name: "gtk_paned_get_resize_end_child";
end;

define inline-only C-function gtk-paned-get-resize-start-child
  input parameter self :: <GtkPaned>;
  result res :: <C-boolean>;
  c-name: "gtk_paned_get_resize_start_child";
end;

define inline-only C-function gtk-paned-get-shrink-end-child
  input parameter self :: <GtkPaned>;
  result res :: <C-boolean>;
  c-name: "gtk_paned_get_shrink_end_child";
end;

define inline-only C-function gtk-paned-get-shrink-start-child
  input parameter self :: <GtkPaned>;
  result res :: <C-boolean>;
  c-name: "gtk_paned_get_shrink_start_child";
end;

define inline-only C-function gtk-paned-get-start-child
  input parameter self :: <GtkPaned>;
  result res :: <GtkWidget>;
  c-name: "gtk_paned_get_start_child";
end;

define inline-only C-function gtk-paned-get-wide-handle
  input parameter self :: <GtkPaned>;
  result res :: <C-boolean>;
  c-name: "gtk_paned_get_wide_handle";
end;

define inline-only C-function gtk-paned-set-end-child
  input parameter self :: <GtkPaned>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_paned_set_end_child";
end;

define inline-only C-function gtk-paned-set-position
  input parameter self :: <GtkPaned>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_paned_set_position";
end;

define inline-only C-function gtk-paned-set-resize-end-child
  input parameter self :: <GtkPaned>;
  input parameter resize_ :: <C-boolean>;
  c-name: "gtk_paned_set_resize_end_child";
end;

define inline-only C-function gtk-paned-set-resize-start-child
  input parameter self :: <GtkPaned>;
  input parameter resize_ :: <C-boolean>;
  c-name: "gtk_paned_set_resize_start_child";
end;

define inline-only C-function gtk-paned-set-shrink-end-child
  input parameter self :: <GtkPaned>;
  input parameter resize_ :: <C-boolean>;
  c-name: "gtk_paned_set_shrink_end_child";
end;

define inline-only C-function gtk-paned-set-shrink-start-child
  input parameter self :: <GtkPaned>;
  input parameter resize_ :: <C-boolean>;
  c-name: "gtk_paned_set_shrink_start_child";
end;

define inline-only C-function gtk-paned-set-start-child
  input parameter self :: <GtkPaned>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_paned_set_start_child";
end;

define inline-only C-function gtk-paned-set-wide-handle
  input parameter self :: <GtkPaned>;
  input parameter wide_ :: <C-boolean>;
  c-name: "gtk_paned_set_wide_handle";
end;

define C-struct <_GtkPaperSize>
  pointer-type-name: <GtkPaperSize>;
end C-struct;

define sealed domain make (singleton(<GtkPaperSize>));
define sealed domain initialize (<GtkPaperSize>);

define inline-only C-function gtk-paper-size-new
  input parameter name_ :: <C-string>;
  result res :: <GtkPaperSize>;
  c-name: "gtk_paper_size_new";
end;

define inline-only C-function gtk-paper-size-new-custom
  input parameter name_ :: <C-string>;
  input parameter display_name_ :: <C-string>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <GtkPaperSize>;
  c-name: "gtk_paper_size_new_custom";
end;

define inline-only C-function gtk-paper-size-new-from-gvariant
  input parameter variant_ :: <GVariant>;
  result res :: <GtkPaperSize>;
  c-name: "gtk_paper_size_new_from_gvariant";
end;

define inline-only C-function gtk-paper-size-new-from-ipp
  input parameter ipp_name_ :: <C-string>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  result res :: <GtkPaperSize>;
  c-name: "gtk_paper_size_new_from_ipp";
end;

define inline-only C-function gtk-paper-size-new-from-key-file
  input parameter key_file_ :: <GKeyFile>;
  input parameter group_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GtkPaperSize>;
  c-name: "gtk_paper_size_new_from_key_file";
end;

define inline-only C-function gtk-paper-size-new-from-ppd
  input parameter ppd_name_ :: <C-string>;
  input parameter ppd_display_name_ :: <C-string>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  result res :: <GtkPaperSize>;
  c-name: "gtk_paper_size_new_from_ppd";
end;

define inline-only C-function gtk-paper-size-copy
  input parameter self :: <GtkPaperSize>;
  result res :: <GtkPaperSize>;
  c-name: "gtk_paper_size_copy";
end;

define inline-only C-function gtk-paper-size-free
  input parameter self :: <GtkPaperSize>;
  c-name: "gtk_paper_size_free";
end;

define inline-only C-function gtk-paper-size-get-default-bottom-margin
  input parameter self :: <GtkPaperSize>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_paper_size_get_default_bottom_margin";
end;

define inline-only C-function gtk-paper-size-get-default-left-margin
  input parameter self :: <GtkPaperSize>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_paper_size_get_default_left_margin";
end;

define inline-only C-function gtk-paper-size-get-default-right-margin
  input parameter self :: <GtkPaperSize>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_paper_size_get_default_right_margin";
end;

define inline-only C-function gtk-paper-size-get-default-top-margin
  input parameter self :: <GtkPaperSize>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_paper_size_get_default_top_margin";
end;

define inline-only C-function gtk-paper-size-get-display-name
  input parameter self :: <GtkPaperSize>;
  result res :: <C-string>;
  c-name: "gtk_paper_size_get_display_name";
end;

define inline-only C-function gtk-paper-size-get-height
  input parameter self :: <GtkPaperSize>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_paper_size_get_height";
end;

define inline-only C-function gtk-paper-size-get-name
  input parameter self :: <GtkPaperSize>;
  result res :: <C-string>;
  c-name: "gtk_paper_size_get_name";
end;

define inline-only C-function gtk-paper-size-get-ppd-name
  input parameter self :: <GtkPaperSize>;
  result res :: <C-string>;
  c-name: "gtk_paper_size_get_ppd_name";
end;

define inline-only C-function gtk-paper-size-get-width
  input parameter self :: <GtkPaperSize>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_paper_size_get_width";
end;

define inline-only C-function gtk-paper-size-is-custom
  input parameter self :: <GtkPaperSize>;
  result res :: <C-boolean>;
  c-name: "gtk_paper_size_is_custom";
end;

define inline-only C-function gtk-paper-size-is-equal
  input parameter self :: <GtkPaperSize>;
  input parameter size2_ :: <GtkPaperSize>;
  result res :: <C-boolean>;
  c-name: "gtk_paper_size_is_equal";
end;

define inline-only C-function gtk-paper-size-is-ipp
  input parameter self :: <GtkPaperSize>;
  result res :: <C-boolean>;
  c-name: "gtk_paper_size_is_ipp";
end;

define inline-only C-function gtk-paper-size-set-size
  input parameter self :: <GtkPaperSize>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  input parameter unit_ :: <GtkUnit>;
  c-name: "gtk_paper_size_set_size";
end;

define inline-only C-function gtk-paper-size-to-gvariant
  input parameter self :: <GtkPaperSize>;
  result res :: <GVariant>;
  c-name: "gtk_paper_size_to_gvariant";
end;

define inline-only C-function gtk-paper-size-to-key-file
  input parameter self :: <GtkPaperSize>;
  input parameter key_file_ :: <GKeyFile>;
  input parameter group_name_ :: <C-string>;
  c-name: "gtk_paper_size_to_key_file";
end;

define inline-only C-function gtk-paper-size-get-default
  result res :: <C-string>;
  c-name: "gtk_paper_size_get_default";
end;

define inline-only C-function gtk-paper-size-get-paper-sizes
  input parameter include_custom_ :: <C-boolean>;
  result res :: <GList>;
  c-name: "gtk_paper_size_get_paper_sizes";
end;

define open C-subtype <GtkParamSpecExpression> (<GParamSpec>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkParamSpecExpression*> => <GtkParamSpecExpression>;

define sealed domain make (singleton(<GtkParamSpecExpression*>));
define sealed domain initialize (<GtkParamSpecExpression*>);

define open C-subtype <GtkPasswordEntry> (<GtkEditable>)
end C-subtype;

define C-pointer-type <GtkPasswordEntry*> => <GtkPasswordEntry>;

define sealed domain make (singleton(<GtkPasswordEntry*>));
define sealed domain initialize (<GtkPasswordEntry*>);

define inline-only C-function gtk-password-entry-new
  result res :: <GtkWidget>;
  c-name: "gtk_password_entry_new";
end;

define inline-only C-function gtk-password-entry-get-extra-menu
  input parameter self :: <GtkPasswordEntry>;
  result res :: <GMenuModel>;
  c-name: "gtk_password_entry_get_extra_menu";
end;

define inline-only C-function gtk-password-entry-get-show-peek-icon
  input parameter self :: <GtkPasswordEntry>;
  result res :: <C-boolean>;
  c-name: "gtk_password_entry_get_show_peek_icon";
end;

define inline-only C-function gtk-password-entry-set-extra-menu
  input parameter self :: <GtkPasswordEntry>;
  input parameter model_ :: <GMenuModel>;
  c-name: "gtk_password_entry_set_extra_menu";
end;

define inline-only C-function gtk-password-entry-set-show-peek-icon
  input parameter self :: <GtkPasswordEntry>;
  input parameter show_peek_icon_ :: <C-boolean>;
  c-name: "gtk_password_entry_set_show_peek_icon";
end;

define open C-subtype <GtkPasswordEntryBuffer> (<GtkEntryBuffer>)
end C-subtype;

define C-pointer-type <GtkPasswordEntryBuffer*> => <GtkPasswordEntryBuffer>;

define sealed domain make (singleton(<GtkPasswordEntryBuffer*>));
define sealed domain initialize (<GtkPasswordEntryBuffer*>);

define inline-only C-function gtk-password-entry-buffer-new
  result res :: <GtkEntryBuffer>;
  c-name: "gtk_password_entry_buffer_new";
end;

define C-struct <_GtkPasswordEntryBufferClass>
  constant sealed inline-only slot gtk-password-entry-buffer-class-parent-class :: <GtkEntryBufferClass>;
  pointer-type-name: <GtkPasswordEntryBufferClass>;
end C-struct;

define sealed domain make (singleton(<GtkPasswordEntryBufferClass>));
define sealed domain initialize (<GtkPasswordEntryBufferClass>);

define C-struct <_GtkPasswordEntryClass>
  pointer-type-name: <GtkPasswordEntryClass>;
end C-struct;

define sealed domain make (singleton(<GtkPasswordEntryClass>));
define sealed domain initialize (<GtkPasswordEntryClass>);

define inline-only constant $gtk-pick-default = 0;
define inline-only constant $gtk-pick-insensitive = 1;
define inline-only constant $gtk-pick-non-targetable = 2;
define constant <GtkPickFlags> = <C-int>;
define C-pointer-type <GtkPickFlags*> => <GtkPickFlags>;

define open C-subtype <GtkPicture> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkPicture*> => <GtkPicture>;

define sealed domain make (singleton(<GtkPicture*>));
define sealed domain initialize (<GtkPicture*>);

define inline-only C-function gtk-picture-new
  result res :: <GtkWidget>;
  c-name: "gtk_picture_new";
end;

define inline-only C-function gtk-picture-new-for-file
  input parameter file_ :: <GFile>;
  result res :: <GtkWidget>;
  c-name: "gtk_picture_new_for_file";
end;

define inline-only C-function gtk-picture-new-for-filename
  input parameter filename_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_picture_new_for_filename";
end;

define inline-only C-function gtk-picture-new-for-paintable
  input parameter paintable_ :: <GdkPaintable>;
  result res :: <GtkWidget>;
  c-name: "gtk_picture_new_for_paintable";
end;

define inline-only C-function gtk-picture-new-for-pixbuf
  input parameter pixbuf_ :: <GdkPixbuf>;
  result res :: <GtkWidget>;
  c-name: "gtk_picture_new_for_pixbuf";
end;

define inline-only C-function gtk-picture-new-for-resource
  input parameter resource_path_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_picture_new_for_resource";
end;

define inline-only C-function gtk-picture-get-alternative-text
  input parameter self :: <GtkPicture>;
  result res :: <C-string>;
  c-name: "gtk_picture_get_alternative_text";
end;

define inline-only C-function gtk-picture-get-can-shrink
  input parameter self :: <GtkPicture>;
  result res :: <C-boolean>;
  c-name: "gtk_picture_get_can_shrink";
end;

define inline-only C-function gtk-picture-get-content-fit
  input parameter self :: <GtkPicture>;
  result res :: <GtkContentFit>;
  c-name: "gtk_picture_get_content_fit";
end;

define inline-only C-function gtk-picture-get-file
  input parameter self :: <GtkPicture>;
  result res :: <GFile>;
  c-name: "gtk_picture_get_file";
end;

define inline-only C-function gtk-picture-get-paintable
  input parameter self :: <GtkPicture>;
  result res :: <GdkPaintable>;
  c-name: "gtk_picture_get_paintable";
end;

define inline-only C-function gtk-picture-set-alternative-text
  input parameter self :: <GtkPicture>;
  input parameter alternative_text_ :: <C-string>;
  c-name: "gtk_picture_set_alternative_text";
end;

define inline-only C-function gtk-picture-set-can-shrink
  input parameter self :: <GtkPicture>;
  input parameter can_shrink_ :: <C-boolean>;
  c-name: "gtk_picture_set_can_shrink";
end;

define inline-only C-function gtk-picture-set-content-fit
  input parameter self :: <GtkPicture>;
  input parameter content_fit_ :: <GtkContentFit>;
  c-name: "gtk_picture_set_content_fit";
end;

define inline-only C-function gtk-picture-set-file
  input parameter self :: <GtkPicture>;
  input parameter file_ :: <GFile>;
  c-name: "gtk_picture_set_file";
end;

define inline-only C-function gtk-picture-set-filename
  input parameter self :: <GtkPicture>;
  input parameter filename_ :: <C-string>;
  c-name: "gtk_picture_set_filename";
end;

define inline-only C-function gtk-picture-set-paintable
  input parameter self :: <GtkPicture>;
  input parameter paintable_ :: <GdkPaintable>;
  c-name: "gtk_picture_set_paintable";
end;

define inline-only C-function gtk-picture-set-pixbuf
  input parameter self :: <GtkPicture>;
  input parameter pixbuf_ :: <GdkPixbuf>;
  c-name: "gtk_picture_set_pixbuf";
end;

define inline-only C-function gtk-picture-set-resource
  input parameter self :: <GtkPicture>;
  input parameter resource_path_ :: <C-string>;
  c-name: "gtk_picture_set_resource";
end;

define C-struct <_GtkPictureClass>
  constant sealed inline-only slot gtk-picture-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkPictureClass>;
end C-struct;

define sealed domain make (singleton(<GtkPictureClass>));
define sealed domain initialize (<GtkPictureClass>);

define inline-only constant $gtk-policy-always = 0;
define inline-only constant $gtk-policy-automatic = 1;
define inline-only constant $gtk-policy-never = 2;
define inline-only constant $gtk-policy-external = 3;
define constant <GtkPolicyType> = <C-int>;
define C-pointer-type <GtkPolicyType*> => <GtkPolicyType>;

define open C-subtype <GtkPopover> (<GtkNative>, <GtkShortcutManager>)
  // parent
end C-subtype;

define C-pointer-type <GtkPopover*> => <GtkPopover>;

define sealed domain make (singleton(<GtkPopover*>));
define sealed domain initialize (<GtkPopover*>);

define inline-only C-function gtk-popover-new
  result res :: <GtkWidget>;
  c-name: "gtk_popover_new";
end;

define inline-only C-function gtk-popover-get-autohide
  input parameter self :: <GtkPopover>;
  result res :: <C-boolean>;
  c-name: "gtk_popover_get_autohide";
end;

define inline-only C-function gtk-popover-get-cascade-popdown
  input parameter self :: <GtkPopover>;
  result res :: <C-boolean>;
  c-name: "gtk_popover_get_cascade_popdown";
end;

define inline-only C-function gtk-popover-get-child
  input parameter self :: <GtkPopover>;
  result res :: <GtkWidget>;
  c-name: "gtk_popover_get_child";
end;

define inline-only C-function gtk-popover-get-has-arrow
  input parameter self :: <GtkPopover>;
  result res :: <C-boolean>;
  c-name: "gtk_popover_get_has_arrow";
end;

define inline-only C-function gtk-popover-get-mnemonics-visible
  input parameter self :: <GtkPopover>;
  result res :: <C-boolean>;
  c-name: "gtk_popover_get_mnemonics_visible";
end;

define inline-only C-function gtk-popover-get-offset
  input parameter self :: <GtkPopover>;
  output parameter x_offset_ :: <C-signed-int*>;
  output parameter y_offset_ :: <C-signed-int*>;
  c-name: "gtk_popover_get_offset";
end;

define inline-only C-function gtk-popover-get-pointing-to
  input parameter self :: <GtkPopover>;
  input parameter rect_ :: <GdkRectangle>;
  result res :: <C-boolean>;
  c-name: "gtk_popover_get_pointing_to";
end;

define inline-only C-function gtk-popover-get-position
  input parameter self :: <GtkPopover>;
  result res :: <GtkPositionType>;
  c-name: "gtk_popover_get_position";
end;

define inline-only C-function gtk-popover-popdown
  input parameter self :: <GtkPopover>;
  c-name: "gtk_popover_popdown";
end;

define inline-only C-function gtk-popover-popup
  input parameter self :: <GtkPopover>;
  c-name: "gtk_popover_popup";
end;

define inline-only C-function gtk-popover-present
  input parameter self :: <GtkPopover>;
  c-name: "gtk_popover_present";
end;

define inline-only C-function gtk-popover-set-autohide
  input parameter self :: <GtkPopover>;
  input parameter autohide_ :: <C-boolean>;
  c-name: "gtk_popover_set_autohide";
end;

define inline-only C-function gtk-popover-set-cascade-popdown
  input parameter self :: <GtkPopover>;
  input parameter cascade_popdown_ :: <C-boolean>;
  c-name: "gtk_popover_set_cascade_popdown";
end;

define inline-only C-function gtk-popover-set-child
  input parameter self :: <GtkPopover>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_popover_set_child";
end;

define inline-only C-function gtk-popover-set-default-widget
  input parameter self :: <GtkPopover>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_popover_set_default_widget";
end;

define inline-only C-function gtk-popover-set-has-arrow
  input parameter self :: <GtkPopover>;
  input parameter has_arrow_ :: <C-boolean>;
  c-name: "gtk_popover_set_has_arrow";
end;

define inline-only C-function gtk-popover-set-mnemonics-visible
  input parameter self :: <GtkPopover>;
  input parameter mnemonics_visible_ :: <C-boolean>;
  c-name: "gtk_popover_set_mnemonics_visible";
end;

define inline-only C-function gtk-popover-set-offset
  input parameter self :: <GtkPopover>;
  input parameter x_offset_ :: <C-signed-int>;
  input parameter y_offset_ :: <C-signed-int>;
  c-name: "gtk_popover_set_offset";
end;

define inline-only C-function gtk-popover-set-pointing-to
  input parameter self :: <GtkPopover>;
  input parameter rect_ :: <GdkRectangle>;
  c-name: "gtk_popover_set_pointing_to";
end;

define inline-only C-function gtk-popover-set-position
  input parameter self :: <GtkPopover>;
  input parameter position_ :: <GtkPositionType>;
  c-name: "gtk_popover_set_position";
end;

define C-struct <_GtkPopoverClass>
  constant sealed inline-only slot gtk-popover-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-popover-class-closed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-popover-class-activate-default :: <C-function-pointer>;
  constant sealed inline-only slot gtk-popover-class-reserved :: <C-void*>;
  pointer-type-name: <GtkPopoverClass>;
end C-struct;

define sealed domain make (singleton(<GtkPopoverClass>));
define sealed domain initialize (<GtkPopoverClass>);

define open C-subtype <GtkPopoverMenu> (<GtkPopover>)
end C-subtype;

define C-pointer-type <GtkPopoverMenu*> => <GtkPopoverMenu>;

define sealed domain make (singleton(<GtkPopoverMenu*>));
define sealed domain initialize (<GtkPopoverMenu*>);

define inline-only C-function gtk-popover-menu-new-from-model
  input parameter model_ :: <GMenuModel>;
  result res :: <GtkWidget>;
  c-name: "gtk_popover_menu_new_from_model";
end;

define inline-only C-function gtk-popover-menu-new-from-model-full
  input parameter model_ :: <GMenuModel>;
  input parameter flags_ :: <GtkPopoverMenuFlags>;
  result res :: <GtkWidget>;
  c-name: "gtk_popover_menu_new_from_model_full";
end;

define inline-only C-function gtk-popover-menu-add-child
  input parameter self :: <GtkPopoverMenu>;
  input parameter child_ :: <GtkWidget>;
  input parameter id_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_popover_menu_add_child";
end;

define inline-only C-function gtk-popover-menu-get-menu-model
  input parameter self :: <GtkPopoverMenu>;
  result res :: <GMenuModel>;
  c-name: "gtk_popover_menu_get_menu_model";
end;

define inline-only C-function gtk-popover-menu-remove-child
  input parameter self :: <GtkPopoverMenu>;
  input parameter child_ :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_popover_menu_remove_child";
end;

define inline-only C-function gtk-popover-menu-set-menu-model
  input parameter self :: <GtkPopoverMenu>;
  input parameter model_ :: <GMenuModel>;
  c-name: "gtk_popover_menu_set_menu_model";
end;

define open C-subtype <GtkPopoverMenuBar> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkPopoverMenuBar*> => <GtkPopoverMenuBar>;

define sealed domain make (singleton(<GtkPopoverMenuBar*>));
define sealed domain initialize (<GtkPopoverMenuBar*>);

define inline-only C-function gtk-popover-menu-bar-new-from-model
  input parameter model_ :: <GMenuModel>;
  result res :: <GtkWidget>;
  c-name: "gtk_popover_menu_bar_new_from_model";
end;

define inline-only C-function gtk-popover-menu-bar-add-child
  input parameter self :: <GtkPopoverMenuBar>;
  input parameter child_ :: <GtkWidget>;
  input parameter id_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_popover_menu_bar_add_child";
end;

define inline-only C-function gtk-popover-menu-bar-get-menu-model
  input parameter self :: <GtkPopoverMenuBar>;
  result res :: <GMenuModel>;
  c-name: "gtk_popover_menu_bar_get_menu_model";
end;

define inline-only C-function gtk-popover-menu-bar-remove-child
  input parameter self :: <GtkPopoverMenuBar>;
  input parameter child_ :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_popover_menu_bar_remove_child";
end;

define inline-only C-function gtk-popover-menu-bar-set-menu-model
  input parameter self :: <GtkPopoverMenuBar>;
  input parameter model_ :: <GMenuModel>;
  c-name: "gtk_popover_menu_bar_set_menu_model";
end;

define inline-only constant $gtk-popover-menu-nested = 1;
define constant <GtkPopoverMenuFlags> = <C-int>;
define C-pointer-type <GtkPopoverMenuFlags*> => <GtkPopoverMenuFlags>;

define inline-only constant $gtk-pos-left = 0;
define inline-only constant $gtk-pos-right = 1;
define inline-only constant $gtk-pos-top = 2;
define inline-only constant $gtk-pos-bottom = 3;
define constant <GtkPositionType> = <C-int>;
define C-pointer-type <GtkPositionType*> => <GtkPositionType>;

define C-struct <_GtkPrintBackend>
  pointer-type-name: <GtkPrintBackend>;
end C-struct;

define sealed domain make (singleton(<GtkPrintBackend>));
define sealed domain initialize (<GtkPrintBackend>);

define inline-only constant $gtk-print-capability-page-set = 1;
define inline-only constant $gtk-print-capability-copies = 2;
define inline-only constant $gtk-print-capability-collate = 4;
define inline-only constant $gtk-print-capability-reverse = 8;
define inline-only constant $gtk-print-capability-scale = 16;
define inline-only constant $gtk-print-capability-generate-pdf = 32;
define inline-only constant $gtk-print-capability-generate-ps = 64;
define inline-only constant $gtk-print-capability-preview = 128;
define inline-only constant $gtk-print-capability-number-up = 256;
define inline-only constant $gtk-print-capability-number-up-layout = 512;
define constant <GtkPrintCapabilities> = <C-int>;
define C-pointer-type <GtkPrintCapabilities*> => <GtkPrintCapabilities>;

define open C-subtype <GtkPrintContext> (<GObject>)
end C-subtype;

define C-pointer-type <GtkPrintContext*> => <GtkPrintContext>;

define sealed domain make (singleton(<GtkPrintContext*>));
define sealed domain initialize (<GtkPrintContext*>);

define inline-only C-function gtk-print-context-create-pango-context
  input parameter self :: <GtkPrintContext>;
  result res :: <PangoContext>;
  c-name: "gtk_print_context_create_pango_context";
end;

define inline-only C-function gtk-print-context-create-pango-layout
  input parameter self :: <GtkPrintContext>;
  result res :: <PangoLayout>;
  c-name: "gtk_print_context_create_pango_layout";
end;

define inline-only C-function gtk-print-context-get-cairo-context
  input parameter self :: <GtkPrintContext>;
  result res :: <cairoContext>;
  c-name: "gtk_print_context_get_cairo_context";
end;

define inline-only C-function gtk-print-context-get-dpi-x
  input parameter self :: <GtkPrintContext>;
  result res :: <C-double>;
  c-name: "gtk_print_context_get_dpi_x";
end;

define inline-only C-function gtk-print-context-get-dpi-y
  input parameter self :: <GtkPrintContext>;
  result res :: <C-double>;
  c-name: "gtk_print_context_get_dpi_y";
end;

define inline-only C-function gtk-print-context-get-hard-margins
  input parameter self :: <GtkPrintContext>;
  output parameter top_ :: <C-double*>;
  output parameter bottom_ :: <C-double*>;
  output parameter left_ :: <C-double*>;
  output parameter right_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_print_context_get_hard_margins";
end;

define inline-only C-function gtk-print-context-get-height
  input parameter self :: <GtkPrintContext>;
  result res :: <C-double>;
  c-name: "gtk_print_context_get_height";
end;

define inline-only C-function gtk-print-context-get-page-setup
  input parameter self :: <GtkPrintContext>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_print_context_get_page_setup";
end;

define inline-only C-function gtk-print-context-get-pango-fontmap
  input parameter self :: <GtkPrintContext>;
  result res :: <PangoFontMap>;
  c-name: "gtk_print_context_get_pango_fontmap";
end;

define inline-only C-function gtk-print-context-get-width
  input parameter self :: <GtkPrintContext>;
  result res :: <C-double>;
  c-name: "gtk_print_context_get_width";
end;

define inline-only C-function gtk-print-context-set-cairo-context
  input parameter self :: <GtkPrintContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter dpi_x_ :: <C-double>;
  input parameter dpi_y_ :: <C-double>;
  c-name: "gtk_print_context_set_cairo_context";
end;

define inline-only constant $gtk-print-duplex-simplex = 0;
define inline-only constant $gtk-print-duplex-horizontal = 1;
define inline-only constant $gtk-print-duplex-vertical = 2;
define constant <GtkPrintDuplex> = <C-int>;
define C-pointer-type <GtkPrintDuplex*> => <GtkPrintDuplex>;

define inline-only constant $gtk-print-error-general = 0;
define inline-only constant $gtk-print-error-internal-error = 1;
define inline-only constant $gtk-print-error-nomem = 2;
define inline-only constant $gtk-print-error-invalid-file = 3;
define constant <GtkPrintError> = <C-int>;
define C-pointer-type <GtkPrintError*> => <GtkPrintError>;

define open C-subtype <GtkPrintJob> (<GObject>)
end C-subtype;

define C-pointer-type <GtkPrintJob*> => <GtkPrintJob>;

define sealed domain make (singleton(<GtkPrintJob*>));
define sealed domain initialize (<GtkPrintJob*>);

define inline-only C-function gtk-print-job-new
  input parameter title_ :: <C-string>;
  input parameter printer_ :: <GtkPrinter>;
  input parameter settings_ :: <GtkPrintSettings>;
  input parameter page_setup_ :: <GtkPageSetup>;
  result res :: <GtkPrintJob>;
  c-name: "gtk_print_job_new";
end;

define inline-only C-function gtk-print-job-get-collate
  input parameter self :: <GtkPrintJob>;
  result res :: <C-boolean>;
  c-name: "gtk_print_job_get_collate";
end;

define inline-only C-function gtk-print-job-get-n-up
  input parameter self :: <GtkPrintJob>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_print_job_get_n_up";
end;

define inline-only C-function gtk-print-job-get-n-up-layout
  input parameter self :: <GtkPrintJob>;
  result res :: <GtkNumberUpLayout>;
  c-name: "gtk_print_job_get_n_up_layout";
end;

define inline-only C-function gtk-print-job-get-num-copies
  input parameter self :: <GtkPrintJob>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_job_get_num_copies";
end;

define inline-only C-function gtk-print-job-get-page-ranges
  input parameter self :: <GtkPrintJob>;
  output parameter n_ranges_ :: <C-signed-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "gtk_print_job_get_page_ranges";
end;

define inline-only C-function gtk-print-job-get-page-set
  input parameter self :: <GtkPrintJob>;
  result res :: <GtkPageSet>;
  c-name: "gtk_print_job_get_page_set";
end;

define inline-only C-function gtk-print-job-get-pages
  input parameter self :: <GtkPrintJob>;
  result res :: <GtkPrintPages>;
  c-name: "gtk_print_job_get_pages";
end;

define inline-only C-function gtk-print-job-get-printer
  input parameter self :: <GtkPrintJob>;
  result res :: <GtkPrinter>;
  c-name: "gtk_print_job_get_printer";
end;

define inline-only C-function gtk-print-job-get-reverse
  input parameter self :: <GtkPrintJob>;
  result res :: <C-boolean>;
  c-name: "gtk_print_job_get_reverse";
end;

define inline-only C-function gtk-print-job-get-rotate
  input parameter self :: <GtkPrintJob>;
  result res :: <C-boolean>;
  c-name: "gtk_print_job_get_rotate";
end;

define inline-only C-function gtk-print-job-get-scale
  input parameter self :: <GtkPrintJob>;
  result res :: <C-double>;
  c-name: "gtk_print_job_get_scale";
end;

define inline-only C-function gtk-print-job-get-settings
  input parameter self :: <GtkPrintJob>;
  result res :: <GtkPrintSettings>;
  c-name: "gtk_print_job_get_settings";
end;

define inline-only C-function gtk-print-job-get-status
  input parameter self :: <GtkPrintJob>;
  result res :: <GtkPrintStatus>;
  c-name: "gtk_print_job_get_status";
end;

define inline-only C-function gtk-print-job-get-surface
  input parameter self :: <GtkPrintJob>;
  output parameter error_ :: <GError*>;
  result res :: <cairoSurface>;
  c-name: "gtk_print_job_get_surface";
end;

define inline-only C-function gtk-print-job-get-title
  input parameter self :: <GtkPrintJob>;
  result res :: <C-string>;
  c-name: "gtk_print_job_get_title";
end;

define inline-only C-function gtk-print-job-get-track-print-status
  input parameter self :: <GtkPrintJob>;
  result res :: <C-boolean>;
  c-name: "gtk_print_job_get_track_print_status";
end;

define inline-only C-function gtk-print-job-send
  input parameter self :: <GtkPrintJob>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter dnotify_ :: <C-function-pointer>;
  c-name: "gtk_print_job_send";
end;

define inline-only C-function gtk-print-job-set-collate
  input parameter self :: <GtkPrintJob>;
  input parameter collate_ :: <C-boolean>;
  c-name: "gtk_print_job_set_collate";
end;

define inline-only C-function gtk-print-job-set-n-up
  input parameter self :: <GtkPrintJob>;
  input parameter n_up_ :: <C-unsigned-int>;
  c-name: "gtk_print_job_set_n_up";
end;

define inline-only C-function gtk-print-job-set-n-up-layout
  input parameter self :: <GtkPrintJob>;
  input parameter layout_ :: <GtkNumberUpLayout>;
  c-name: "gtk_print_job_set_n_up_layout";
end;

define inline-only C-function gtk-print-job-set-num-copies
  input parameter self :: <GtkPrintJob>;
  input parameter num_copies_ :: <C-signed-int>;
  c-name: "gtk_print_job_set_num_copies";
end;

define inline-only C-function gtk-print-job-set-page-ranges
  input parameter self :: <GtkPrintJob>;
  input parameter ranges_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_ranges_ :: <C-signed-int>;
  c-name: "gtk_print_job_set_page_ranges";
end;

define inline-only C-function gtk-print-job-set-page-set
  input parameter self :: <GtkPrintJob>;
  input parameter page_set_ :: <GtkPageSet>;
  c-name: "gtk_print_job_set_page_set";
end;

define inline-only C-function gtk-print-job-set-pages
  input parameter self :: <GtkPrintJob>;
  input parameter pages_ :: <GtkPrintPages>;
  c-name: "gtk_print_job_set_pages";
end;

define inline-only C-function gtk-print-job-set-reverse
  input parameter self :: <GtkPrintJob>;
  input parameter reverse_ :: <C-boolean>;
  c-name: "gtk_print_job_set_reverse";
end;

define inline-only C-function gtk-print-job-set-rotate
  input parameter self :: <GtkPrintJob>;
  input parameter rotate_ :: <C-boolean>;
  c-name: "gtk_print_job_set_rotate";
end;

define inline-only C-function gtk-print-job-set-scale
  input parameter self :: <GtkPrintJob>;
  input parameter scale_ :: <C-double>;
  c-name: "gtk_print_job_set_scale";
end;

define inline-only C-function gtk-print-job-set-source-fd
  input parameter self :: <GtkPrintJob>;
  input parameter fd_ :: <C-signed-int>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_print_job_set_source_fd";
end;

define inline-only C-function gtk-print-job-set-source-file
  input parameter self :: <GtkPrintJob>;
  input parameter filename_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_print_job_set_source_file";
end;

define inline-only C-function gtk-print-job-set-track-print-status
  input parameter self :: <GtkPrintJob>;
  input parameter track_status_ :: <C-boolean>;
  c-name: "gtk_print_job_set_track_print_status";
end;

define open C-subtype <GtkPrintOperation> (<GObject>, <GtkPrintOperationPreview>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GtkPrintOperation*> => <GtkPrintOperation>;

define sealed domain make (singleton(<GtkPrintOperation*>));
define sealed domain initialize (<GtkPrintOperation*>);

define inline-only C-function gtk-print-operation-new
  result res :: <GtkPrintOperation>;
  c-name: "gtk_print_operation_new";
end;

define inline-only C-function gtk-print-operation-cancel
  input parameter self :: <GtkPrintOperation>;
  c-name: "gtk_print_operation_cancel";
end;

define inline-only C-function gtk-print-operation-draw-page-finish
  input parameter self :: <GtkPrintOperation>;
  c-name: "gtk_print_operation_draw_page_finish";
end;

define inline-only C-function gtk-print-operation-get-default-page-setup
  input parameter self :: <GtkPrintOperation>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_print_operation_get_default_page_setup";
end;

define inline-only C-function gtk-print-operation-get-embed-page-setup
  input parameter self :: <GtkPrintOperation>;
  result res :: <C-boolean>;
  c-name: "gtk_print_operation_get_embed_page_setup";
end;

define inline-only C-function gtk-print-operation-get-error
  input parameter self :: <GtkPrintOperation>;
  output parameter error_ :: <GError*>;
  c-name: "gtk_print_operation_get_error";
end;

define inline-only C-function gtk-print-operation-get-has-selection
  input parameter self :: <GtkPrintOperation>;
  result res :: <C-boolean>;
  c-name: "gtk_print_operation_get_has_selection";
end;

define inline-only C-function gtk-print-operation-get-n-pages-to-print
  input parameter self :: <GtkPrintOperation>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_operation_get_n_pages_to_print";
end;

define inline-only C-function gtk-print-operation-get-print-settings
  input parameter self :: <GtkPrintOperation>;
  result res :: <GtkPrintSettings>;
  c-name: "gtk_print_operation_get_print_settings";
end;

define inline-only C-function gtk-print-operation-get-status
  input parameter self :: <GtkPrintOperation>;
  result res :: <GtkPrintStatus>;
  c-name: "gtk_print_operation_get_status";
end;

define inline-only C-function gtk-print-operation-get-status-string
  input parameter self :: <GtkPrintOperation>;
  result res :: <C-string>;
  c-name: "gtk_print_operation_get_status_string";
end;

define inline-only C-function gtk-print-operation-get-support-selection
  input parameter self :: <GtkPrintOperation>;
  result res :: <C-boolean>;
  c-name: "gtk_print_operation_get_support_selection";
end;

define inline-only C-function gtk-print-operation-is-finished
  input parameter self :: <GtkPrintOperation>;
  result res :: <C-boolean>;
  c-name: "gtk_print_operation_is_finished";
end;

define inline-only C-function gtk-print-operation-run
  input parameter self :: <GtkPrintOperation>;
  input parameter action_ :: <GtkPrintOperationAction>;
  input parameter parent_ :: <GtkWindow>;
  output parameter error_ :: <GError*>;
  result res :: <GtkPrintOperationResult>;
  c-name: "gtk_print_operation_run";
end;

define inline-only C-function gtk-print-operation-set-allow-async
  input parameter self :: <GtkPrintOperation>;
  input parameter allow_async_ :: <C-boolean>;
  c-name: "gtk_print_operation_set_allow_async";
end;

define inline-only C-function gtk-print-operation-set-current-page
  input parameter self :: <GtkPrintOperation>;
  input parameter current_page_ :: <C-signed-int>;
  c-name: "gtk_print_operation_set_current_page";
end;

define inline-only C-function gtk-print-operation-set-custom-tab-label
  input parameter self :: <GtkPrintOperation>;
  input parameter label_ :: <C-string>;
  c-name: "gtk_print_operation_set_custom_tab_label";
end;

define inline-only C-function gtk-print-operation-set-default-page-setup
  input parameter self :: <GtkPrintOperation>;
  input parameter default_page_setup_ :: <GtkPageSetup>;
  c-name: "gtk_print_operation_set_default_page_setup";
end;

define inline-only C-function gtk-print-operation-set-defer-drawing
  input parameter self :: <GtkPrintOperation>;
  c-name: "gtk_print_operation_set_defer_drawing";
end;

define inline-only C-function gtk-print-operation-set-embed-page-setup
  input parameter self :: <GtkPrintOperation>;
  input parameter embed_ :: <C-boolean>;
  c-name: "gtk_print_operation_set_embed_page_setup";
end;

define inline-only C-function gtk-print-operation-set-export-filename
  input parameter self :: <GtkPrintOperation>;
  input parameter filename_ :: <C-string>;
  c-name: "gtk_print_operation_set_export_filename";
end;

define inline-only C-function gtk-print-operation-set-has-selection
  input parameter self :: <GtkPrintOperation>;
  input parameter has_selection_ :: <C-boolean>;
  c-name: "gtk_print_operation_set_has_selection";
end;

define inline-only C-function gtk-print-operation-set-job-name
  input parameter self :: <GtkPrintOperation>;
  input parameter job_name_ :: <C-string>;
  c-name: "gtk_print_operation_set_job_name";
end;

define inline-only C-function gtk-print-operation-set-n-pages
  input parameter self :: <GtkPrintOperation>;
  input parameter n_pages_ :: <C-signed-int>;
  c-name: "gtk_print_operation_set_n_pages";
end;

define inline-only C-function gtk-print-operation-set-print-settings
  input parameter self :: <GtkPrintOperation>;
  input parameter print_settings_ :: <GtkPrintSettings>;
  c-name: "gtk_print_operation_set_print_settings";
end;

define inline-only C-function gtk-print-operation-set-show-progress
  input parameter self :: <GtkPrintOperation>;
  input parameter show_progress_ :: <C-boolean>;
  c-name: "gtk_print_operation_set_show_progress";
end;

define inline-only C-function gtk-print-operation-set-support-selection
  input parameter self :: <GtkPrintOperation>;
  input parameter support_selection_ :: <C-boolean>;
  c-name: "gtk_print_operation_set_support_selection";
end;

define inline-only C-function gtk-print-operation-set-track-print-status
  input parameter self :: <GtkPrintOperation>;
  input parameter track_status_ :: <C-boolean>;
  c-name: "gtk_print_operation_set_track_print_status";
end;

define inline-only C-function gtk-print-operation-set-unit
  input parameter self :: <GtkPrintOperation>;
  input parameter unit_ :: <GtkUnit>;
  c-name: "gtk_print_operation_set_unit";
end;

define inline-only C-function gtk-print-operation-set-use-full-page
  input parameter self :: <GtkPrintOperation>;
  input parameter full_page_ :: <C-boolean>;
  c-name: "gtk_print_operation_set_use_full_page";
end;

define inline-only constant $gtk-print-operation-action-print-dialog = 0;
define inline-only constant $gtk-print-operation-action-print = 1;
define inline-only constant $gtk-print-operation-action-preview = 2;
define inline-only constant $gtk-print-operation-action-export = 3;
define constant <GtkPrintOperationAction> = <C-int>;
define C-pointer-type <GtkPrintOperationAction*> => <GtkPrintOperationAction>;

define C-struct <_GtkPrintOperationClass>
  constant sealed inline-only slot gtk-print-operation-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-print-operation-class-done :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-begin-print :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-paginate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-request-page-setup :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-draw-page :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-end-print :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-status-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-create-custom-widget :: <C-void*>;
  constant sealed inline-only slot gtk-print-operation-class-custom-widget-apply :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-preview :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-update-custom-widget :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-class-padding :: <C-void*>;
  pointer-type-name: <GtkPrintOperationClass>;
end C-struct;

define sealed domain make (singleton(<GtkPrintOperationClass>));
define sealed domain initialize (<GtkPrintOperationClass>);

// Interface
define open C-subtype <GtkPrintOperationPreview> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkPrintOperationPreview*> => <GtkPrintOperationPreview>;

define sealed domain make (singleton(<GtkPrintOperationPreview*>));
define sealed domain initialize (<GtkPrintOperationPreview*>);

define inline-only C-function gtk-print-operation-preview-end-preview
  input parameter self :: <GtkPrintOperationPreview>;
  c-name: "gtk_print_operation_preview_end_preview";
end;

define inline-only C-function gtk-print-operation-preview-is-selected
  input parameter self :: <GtkPrintOperationPreview>;
  input parameter page_nr_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_print_operation_preview_is_selected";
end;

define inline-only C-function gtk-print-operation-preview-render-page
  input parameter self :: <GtkPrintOperationPreview>;
  input parameter page_nr_ :: <C-signed-int>;
  c-name: "gtk_print_operation_preview_render_page";
end;

define C-struct <_GtkPrintOperationPreviewIface>
  constant sealed inline-only slot gtk-print-operation-preview-iface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-ready :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-got-page-size :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-render-page :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-is-selected :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-end-preview :: <C-function-pointer>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-_gtk-reserved4 :: <C-void*>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-_gtk-reserved5 :: <C-void*>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-_gtk-reserved6 :: <C-void*>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-_gtk-reserved7 :: <C-void*>;
  constant sealed inline-only slot gtk-print-operation-preview-iface-_gtk-reserved8 :: <C-void*>;
  pointer-type-name: <GtkPrintOperationPreviewIface>;
end C-struct;

define sealed domain make (singleton(<GtkPrintOperationPreviewIface>));
define sealed domain initialize (<GtkPrintOperationPreviewIface>);

define C-struct <_GtkPrintOperationPrivate>
  pointer-type-name: <GtkPrintOperationPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkPrintOperationPrivate>));
define sealed domain initialize (<GtkPrintOperationPrivate>);

define inline-only constant $gtk-print-operation-result-error = 0;
define inline-only constant $gtk-print-operation-result-apply = 1;
define inline-only constant $gtk-print-operation-result-cancel = 2;
define inline-only constant $gtk-print-operation-result-in-progress = 3;
define constant <GtkPrintOperationResult> = <C-int>;
define C-pointer-type <GtkPrintOperationResult*> => <GtkPrintOperationResult>;

define inline-only constant $gtk-print-pages-all = 0;
define inline-only constant $gtk-print-pages-current = 1;
define inline-only constant $gtk-print-pages-ranges = 2;
define inline-only constant $gtk-print-pages-selection = 3;
define constant <GtkPrintPages> = <C-int>;
define C-pointer-type <GtkPrintPages*> => <GtkPrintPages>;

define inline-only constant $gtk-print-quality-low = 0;
define inline-only constant $gtk-print-quality-normal = 1;
define inline-only constant $gtk-print-quality-high = 2;
define inline-only constant $gtk-print-quality-draft = 3;
define constant <GtkPrintQuality> = <C-int>;
define C-pointer-type <GtkPrintQuality*> => <GtkPrintQuality>;

define open C-subtype <GtkPrintSettings> (<GObject>)
end C-subtype;

define C-pointer-type <GtkPrintSettings*> => <GtkPrintSettings>;

define sealed domain make (singleton(<GtkPrintSettings*>));
define sealed domain initialize (<GtkPrintSettings*>);

define inline-only C-function gtk-print-settings-new
  result res :: <GtkPrintSettings>;
  c-name: "gtk_print_settings_new";
end;

define inline-only C-function gtk-print-settings-new-from-file
  input parameter file_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GtkPrintSettings>;
  c-name: "gtk_print_settings_new_from_file";
end;

define inline-only C-function gtk-print-settings-new-from-gvariant
  input parameter variant_ :: <GVariant>;
  result res :: <GtkPrintSettings>;
  c-name: "gtk_print_settings_new_from_gvariant";
end;

define inline-only C-function gtk-print-settings-new-from-key-file
  input parameter key_file_ :: <GKeyFile>;
  input parameter group_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GtkPrintSettings>;
  c-name: "gtk_print_settings_new_from_key_file";
end;

define inline-only C-function gtk-print-settings-copy
  input parameter self :: <GtkPrintSettings>;
  result res :: <GtkPrintSettings>;
  c-name: "gtk_print_settings_copy";
end;

define inline-only C-function gtk-print-settings-foreach
  input parameter self :: <GtkPrintSettings>;
  input parameter func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gtk_print_settings_foreach";
end;

define inline-only C-function gtk-print-settings-get
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  result res :: <C-string>;
  c-name: "gtk_print_settings_get";
end;

define inline-only C-function gtk-print-settings-get-bool
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_print_settings_get_bool";
end;

define inline-only C-function gtk-print-settings-get-collate
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-boolean>;
  c-name: "gtk_print_settings_get_collate";
end;

define inline-only C-function gtk-print-settings-get-default-source
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-string>;
  c-name: "gtk_print_settings_get_default_source";
end;

define inline-only C-function gtk-print-settings-get-dither
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-string>;
  c-name: "gtk_print_settings_get_dither";
end;

define inline-only C-function gtk-print-settings-get-double
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  result res :: <C-double>;
  c-name: "gtk_print_settings_get_double";
end;

define inline-only C-function gtk-print-settings-get-double-with-default
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  input parameter def_ :: <C-double>;
  result res :: <C-double>;
  c-name: "gtk_print_settings_get_double_with_default";
end;

define inline-only C-function gtk-print-settings-get-duplex
  input parameter self :: <GtkPrintSettings>;
  result res :: <GtkPrintDuplex>;
  c-name: "gtk_print_settings_get_duplex";
end;

define inline-only C-function gtk-print-settings-get-finishings
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-string>;
  c-name: "gtk_print_settings_get_finishings";
end;

define inline-only C-function gtk-print-settings-get-int
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_settings_get_int";
end;

define inline-only C-function gtk-print-settings-get-int-with-default
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  input parameter def_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_settings_get_int_with_default";
end;

define inline-only C-function gtk-print-settings-get-length
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_print_settings_get_length";
end;

define inline-only C-function gtk-print-settings-get-media-type
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-string>;
  c-name: "gtk_print_settings_get_media_type";
end;

define inline-only C-function gtk-print-settings-get-n-copies
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_settings_get_n_copies";
end;

define inline-only C-function gtk-print-settings-get-number-up
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_settings_get_number_up";
end;

define inline-only C-function gtk-print-settings-get-number-up-layout
  input parameter self :: <GtkPrintSettings>;
  result res :: <GtkNumberUpLayout>;
  c-name: "gtk_print_settings_get_number_up_layout";
end;

define inline-only C-function gtk-print-settings-get-orientation
  input parameter self :: <GtkPrintSettings>;
  result res :: <GtkPageOrientation>;
  c-name: "gtk_print_settings_get_orientation";
end;

define inline-only C-function gtk-print-settings-get-output-bin
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-string>;
  c-name: "gtk_print_settings_get_output_bin";
end;

define inline-only C-function gtk-print-settings-get-page-ranges
  input parameter self :: <GtkPrintSettings>;
  output parameter num_ranges_ :: <C-signed-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "gtk_print_settings_get_page_ranges";
end;

define inline-only C-function gtk-print-settings-get-page-set
  input parameter self :: <GtkPrintSettings>;
  result res :: <GtkPageSet>;
  c-name: "gtk_print_settings_get_page_set";
end;

define inline-only C-function gtk-print-settings-get-paper-height
  input parameter self :: <GtkPrintSettings>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_print_settings_get_paper_height";
end;

define inline-only C-function gtk-print-settings-get-paper-size
  input parameter self :: <GtkPrintSettings>;
  result res :: <GtkPaperSize>;
  c-name: "gtk_print_settings_get_paper_size";
end;

define inline-only C-function gtk-print-settings-get-paper-width
  input parameter self :: <GtkPrintSettings>;
  input parameter unit_ :: <GtkUnit>;
  result res :: <C-double>;
  c-name: "gtk_print_settings_get_paper_width";
end;

define inline-only C-function gtk-print-settings-get-print-pages
  input parameter self :: <GtkPrintSettings>;
  result res :: <GtkPrintPages>;
  c-name: "gtk_print_settings_get_print_pages";
end;

define inline-only C-function gtk-print-settings-get-printer
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-string>;
  c-name: "gtk_print_settings_get_printer";
end;

define inline-only C-function gtk-print-settings-get-printer-lpi
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-double>;
  c-name: "gtk_print_settings_get_printer_lpi";
end;

define inline-only C-function gtk-print-settings-get-quality
  input parameter self :: <GtkPrintSettings>;
  result res :: <GtkPrintQuality>;
  c-name: "gtk_print_settings_get_quality";
end;

define inline-only C-function gtk-print-settings-get-resolution
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_settings_get_resolution";
end;

define inline-only C-function gtk-print-settings-get-resolution-x
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_settings_get_resolution_x";
end;

define inline-only C-function gtk-print-settings-get-resolution-y
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_settings_get_resolution_y";
end;

define inline-only C-function gtk-print-settings-get-reverse
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-boolean>;
  c-name: "gtk_print_settings_get_reverse";
end;

define inline-only C-function gtk-print-settings-get-scale
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-double>;
  c-name: "gtk_print_settings_get_scale";
end;

define inline-only C-function gtk-print-settings-get-use-color
  input parameter self :: <GtkPrintSettings>;
  result res :: <C-boolean>;
  c-name: "gtk_print_settings_get_use_color";
end;

define inline-only C-function gtk-print-settings-has-key
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_print_settings_has_key";
end;

define inline-only C-function gtk-print-settings-load-file
  input parameter self :: <GtkPrintSettings>;
  input parameter file_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_print_settings_load_file";
end;

define inline-only C-function gtk-print-settings-load-key-file
  input parameter self :: <GtkPrintSettings>;
  input parameter key_file_ :: <GKeyFile>;
  input parameter group_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_print_settings_load_key_file";
end;

define inline-only C-function gtk-print-settings-set
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  input parameter value_ :: <C-string>;
  c-name: "gtk_print_settings_set";
end;

define inline-only C-function gtk-print-settings-set-bool
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  input parameter value_ :: <C-boolean>;
  c-name: "gtk_print_settings_set_bool";
end;

define inline-only C-function gtk-print-settings-set-collate
  input parameter self :: <GtkPrintSettings>;
  input parameter collate_ :: <C-boolean>;
  c-name: "gtk_print_settings_set_collate";
end;

define inline-only C-function gtk-print-settings-set-default-source
  input parameter self :: <GtkPrintSettings>;
  input parameter default_source_ :: <C-string>;
  c-name: "gtk_print_settings_set_default_source";
end;

define inline-only C-function gtk-print-settings-set-dither
  input parameter self :: <GtkPrintSettings>;
  input parameter dither_ :: <C-string>;
  c-name: "gtk_print_settings_set_dither";
end;

define inline-only C-function gtk-print-settings-set-double
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  input parameter value_ :: <C-double>;
  c-name: "gtk_print_settings_set_double";
end;

define inline-only C-function gtk-print-settings-set-duplex
  input parameter self :: <GtkPrintSettings>;
  input parameter duplex_ :: <GtkPrintDuplex>;
  c-name: "gtk_print_settings_set_duplex";
end;

define inline-only C-function gtk-print-settings-set-finishings
  input parameter self :: <GtkPrintSettings>;
  input parameter finishings_ :: <C-string>;
  c-name: "gtk_print_settings_set_finishings";
end;

define inline-only C-function gtk-print-settings-set-int
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  input parameter value_ :: <C-signed-int>;
  c-name: "gtk_print_settings_set_int";
end;

define inline-only C-function gtk-print-settings-set-length
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  input parameter value_ :: <C-double>;
  input parameter unit_ :: <GtkUnit>;
  c-name: "gtk_print_settings_set_length";
end;

define inline-only C-function gtk-print-settings-set-media-type
  input parameter self :: <GtkPrintSettings>;
  input parameter media_type_ :: <C-string>;
  c-name: "gtk_print_settings_set_media_type";
end;

define inline-only C-function gtk-print-settings-set-n-copies
  input parameter self :: <GtkPrintSettings>;
  input parameter num_copies_ :: <C-signed-int>;
  c-name: "gtk_print_settings_set_n_copies";
end;

define inline-only C-function gtk-print-settings-set-number-up
  input parameter self :: <GtkPrintSettings>;
  input parameter number_up_ :: <C-signed-int>;
  c-name: "gtk_print_settings_set_number_up";
end;

define inline-only C-function gtk-print-settings-set-number-up-layout
  input parameter self :: <GtkPrintSettings>;
  input parameter number_up_layout_ :: <GtkNumberUpLayout>;
  c-name: "gtk_print_settings_set_number_up_layout";
end;

define inline-only C-function gtk-print-settings-set-orientation
  input parameter self :: <GtkPrintSettings>;
  input parameter orientation_ :: <GtkPageOrientation>;
  c-name: "gtk_print_settings_set_orientation";
end;

define inline-only C-function gtk-print-settings-set-output-bin
  input parameter self :: <GtkPrintSettings>;
  input parameter output_bin_ :: <C-string>;
  c-name: "gtk_print_settings_set_output_bin";
end;

define inline-only C-function gtk-print-settings-set-page-ranges
  input parameter self :: <GtkPrintSettings>;
  input parameter page_ranges_ :: <C-unsigned-char*> /* Not supported */;
  input parameter num_ranges_ :: <C-signed-int>;
  c-name: "gtk_print_settings_set_page_ranges";
end;

define inline-only C-function gtk-print-settings-set-page-set
  input parameter self :: <GtkPrintSettings>;
  input parameter page_set_ :: <GtkPageSet>;
  c-name: "gtk_print_settings_set_page_set";
end;

define inline-only C-function gtk-print-settings-set-paper-height
  input parameter self :: <GtkPrintSettings>;
  input parameter height_ :: <C-double>;
  input parameter unit_ :: <GtkUnit>;
  c-name: "gtk_print_settings_set_paper_height";
end;

define inline-only C-function gtk-print-settings-set-paper-size
  input parameter self :: <GtkPrintSettings>;
  input parameter paper_size_ :: <GtkPaperSize>;
  c-name: "gtk_print_settings_set_paper_size";
end;

define inline-only C-function gtk-print-settings-set-paper-width
  input parameter self :: <GtkPrintSettings>;
  input parameter width_ :: <C-double>;
  input parameter unit_ :: <GtkUnit>;
  c-name: "gtk_print_settings_set_paper_width";
end;

define inline-only C-function gtk-print-settings-set-print-pages
  input parameter self :: <GtkPrintSettings>;
  input parameter pages_ :: <GtkPrintPages>;
  c-name: "gtk_print_settings_set_print_pages";
end;

define inline-only C-function gtk-print-settings-set-printer
  input parameter self :: <GtkPrintSettings>;
  input parameter printer_ :: <C-string>;
  c-name: "gtk_print_settings_set_printer";
end;

define inline-only C-function gtk-print-settings-set-printer-lpi
  input parameter self :: <GtkPrintSettings>;
  input parameter lpi_ :: <C-double>;
  c-name: "gtk_print_settings_set_printer_lpi";
end;

define inline-only C-function gtk-print-settings-set-quality
  input parameter self :: <GtkPrintSettings>;
  input parameter quality_ :: <GtkPrintQuality>;
  c-name: "gtk_print_settings_set_quality";
end;

define inline-only C-function gtk-print-settings-set-resolution
  input parameter self :: <GtkPrintSettings>;
  input parameter resolution_ :: <C-signed-int>;
  c-name: "gtk_print_settings_set_resolution";
end;

define inline-only C-function gtk-print-settings-set-resolution-xy
  input parameter self :: <GtkPrintSettings>;
  input parameter resolution_x_ :: <C-signed-int>;
  input parameter resolution_y_ :: <C-signed-int>;
  c-name: "gtk_print_settings_set_resolution_xy";
end;

define inline-only C-function gtk-print-settings-set-reverse
  input parameter self :: <GtkPrintSettings>;
  input parameter reverse_ :: <C-boolean>;
  c-name: "gtk_print_settings_set_reverse";
end;

define inline-only C-function gtk-print-settings-set-scale
  input parameter self :: <GtkPrintSettings>;
  input parameter scale_ :: <C-double>;
  c-name: "gtk_print_settings_set_scale";
end;

define inline-only C-function gtk-print-settings-set-use-color
  input parameter self :: <GtkPrintSettings>;
  input parameter use_color_ :: <C-boolean>;
  c-name: "gtk_print_settings_set_use_color";
end;

define inline-only C-function gtk-print-settings-to-file
  input parameter self :: <GtkPrintSettings>;
  input parameter file_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_print_settings_to_file";
end;

define inline-only C-function gtk-print-settings-to-gvariant
  input parameter self :: <GtkPrintSettings>;
  result res :: <GVariant>;
  c-name: "gtk_print_settings_to_gvariant";
end;

define inline-only C-function gtk-print-settings-to-key-file
  input parameter self :: <GtkPrintSettings>;
  input parameter key_file_ :: <GKeyFile>;
  input parameter group_name_ :: <C-string>;
  c-name: "gtk_print_settings_to_key_file";
end;

define inline-only C-function gtk-print-settings-unset
  input parameter self :: <GtkPrintSettings>;
  input parameter key_ :: <C-string>;
  c-name: "gtk_print_settings_unset";
end;

define inline-only constant $gtk-print-status-initial = 0;
define inline-only constant $gtk-print-status-preparing = 1;
define inline-only constant $gtk-print-status-generating-data = 2;
define inline-only constant $gtk-print-status-sending-data = 3;
define inline-only constant $gtk-print-status-pending = 4;
define inline-only constant $gtk-print-status-pending-issue = 5;
define inline-only constant $gtk-print-status-printing = 6;
define inline-only constant $gtk-print-status-finished = 7;
define inline-only constant $gtk-print-status-finished-aborted = 8;
define constant <GtkPrintStatus> = <C-int>;
define C-pointer-type <GtkPrintStatus*> => <GtkPrintStatus>;

define open C-subtype <GtkPrintUnixDialog> (<GtkDialog>)
end C-subtype;

define C-pointer-type <GtkPrintUnixDialog*> => <GtkPrintUnixDialog>;

define sealed domain make (singleton(<GtkPrintUnixDialog*>));
define sealed domain initialize (<GtkPrintUnixDialog*>);

define inline-only C-function gtk-print-unix-dialog-new
  input parameter title_ :: <C-string>;
  input parameter parent_ :: <GtkWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_print_unix_dialog_new";
end;

define inline-only C-function gtk-print-unix-dialog-add-custom-tab
  input parameter self :: <GtkPrintUnixDialog>;
  input parameter child_ :: <GtkWidget>;
  input parameter tab_label_ :: <GtkWidget>;
  c-name: "gtk_print_unix_dialog_add_custom_tab";
end;

define inline-only C-function gtk-print-unix-dialog-get-current-page
  input parameter self :: <GtkPrintUnixDialog>;
  result res :: <C-signed-int>;
  c-name: "gtk_print_unix_dialog_get_current_page";
end;

define inline-only C-function gtk-print-unix-dialog-get-embed-page-setup
  input parameter self :: <GtkPrintUnixDialog>;
  result res :: <C-boolean>;
  c-name: "gtk_print_unix_dialog_get_embed_page_setup";
end;

define inline-only C-function gtk-print-unix-dialog-get-has-selection
  input parameter self :: <GtkPrintUnixDialog>;
  result res :: <C-boolean>;
  c-name: "gtk_print_unix_dialog_get_has_selection";
end;

define inline-only C-function gtk-print-unix-dialog-get-manual-capabilities
  input parameter self :: <GtkPrintUnixDialog>;
  result res :: <GtkPrintCapabilities>;
  c-name: "gtk_print_unix_dialog_get_manual_capabilities";
end;

define inline-only C-function gtk-print-unix-dialog-get-page-setup
  input parameter self :: <GtkPrintUnixDialog>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_print_unix_dialog_get_page_setup";
end;

define inline-only C-function gtk-print-unix-dialog-get-page-setup-set
  input parameter self :: <GtkPrintUnixDialog>;
  result res :: <C-boolean>;
  c-name: "gtk_print_unix_dialog_get_page_setup_set";
end;

define inline-only C-function gtk-print-unix-dialog-get-selected-printer
  input parameter self :: <GtkPrintUnixDialog>;
  result res :: <GtkPrinter>;
  c-name: "gtk_print_unix_dialog_get_selected_printer";
end;

define inline-only C-function gtk-print-unix-dialog-get-settings
  input parameter self :: <GtkPrintUnixDialog>;
  result res :: <GtkPrintSettings>;
  c-name: "gtk_print_unix_dialog_get_settings";
end;

define inline-only C-function gtk-print-unix-dialog-get-support-selection
  input parameter self :: <GtkPrintUnixDialog>;
  result res :: <C-boolean>;
  c-name: "gtk_print_unix_dialog_get_support_selection";
end;

define inline-only C-function gtk-print-unix-dialog-set-current-page
  input parameter self :: <GtkPrintUnixDialog>;
  input parameter current_page_ :: <C-signed-int>;
  c-name: "gtk_print_unix_dialog_set_current_page";
end;

define inline-only C-function gtk-print-unix-dialog-set-embed-page-setup
  input parameter self :: <GtkPrintUnixDialog>;
  input parameter embed_ :: <C-boolean>;
  c-name: "gtk_print_unix_dialog_set_embed_page_setup";
end;

define inline-only C-function gtk-print-unix-dialog-set-has-selection
  input parameter self :: <GtkPrintUnixDialog>;
  input parameter has_selection_ :: <C-boolean>;
  c-name: "gtk_print_unix_dialog_set_has_selection";
end;

define inline-only C-function gtk-print-unix-dialog-set-manual-capabilities
  input parameter self :: <GtkPrintUnixDialog>;
  input parameter capabilities_ :: <GtkPrintCapabilities>;
  c-name: "gtk_print_unix_dialog_set_manual_capabilities";
end;

define inline-only C-function gtk-print-unix-dialog-set-page-setup
  input parameter self :: <GtkPrintUnixDialog>;
  input parameter page_setup_ :: <GtkPageSetup>;
  c-name: "gtk_print_unix_dialog_set_page_setup";
end;

define inline-only C-function gtk-print-unix-dialog-set-settings
  input parameter self :: <GtkPrintUnixDialog>;
  input parameter settings_ :: <GtkPrintSettings>;
  c-name: "gtk_print_unix_dialog_set_settings";
end;

define inline-only C-function gtk-print-unix-dialog-set-support-selection
  input parameter self :: <GtkPrintUnixDialog>;
  input parameter support_selection_ :: <C-boolean>;
  c-name: "gtk_print_unix_dialog_set_support_selection";
end;

define open C-subtype <GtkPrinter> (<GObject>)
end C-subtype;

define C-pointer-type <GtkPrinter*> => <GtkPrinter>;

define sealed domain make (singleton(<GtkPrinter*>));
define sealed domain initialize (<GtkPrinter*>);

define inline-only C-function gtk-printer-new
  input parameter name_ :: <C-string>;
  input parameter backend_ :: <GtkPrintBackend>;
  input parameter virtual__ :: <C-boolean>;
  result res :: <GtkPrinter>;
  c-name: "gtk_printer_new";
end;

define inline-only C-function gtk-printer-accepts-pdf
  input parameter self :: <GtkPrinter>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_accepts_pdf";
end;

define inline-only C-function gtk-printer-accepts-ps
  input parameter self :: <GtkPrinter>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_accepts_ps";
end;

define inline-only C-function gtk-printer-compare
  input parameter self :: <GtkPrinter>;
  input parameter b_ :: <GtkPrinter>;
  result res :: <C-signed-int>;
  c-name: "gtk_printer_compare";
end;

define inline-only C-function gtk-printer-get-backend
  input parameter self :: <GtkPrinter>;
  result res :: <GtkPrintBackend>;
  c-name: "gtk_printer_get_backend";
end;

define inline-only C-function gtk-printer-get-capabilities
  input parameter self :: <GtkPrinter>;
  result res :: <GtkPrintCapabilities>;
  c-name: "gtk_printer_get_capabilities";
end;

define inline-only C-function gtk-printer-get-default-page-size
  input parameter self :: <GtkPrinter>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_printer_get_default_page_size";
end;

define inline-only C-function gtk-printer-get-description
  input parameter self :: <GtkPrinter>;
  result res :: <C-string>;
  c-name: "gtk_printer_get_description";
end;

define inline-only C-function gtk-printer-get-hard-margins
  input parameter self :: <GtkPrinter>;
  output parameter top_ :: <C-double*>;
  output parameter bottom_ :: <C-double*>;
  output parameter left_ :: <C-double*>;
  output parameter right_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_get_hard_margins";
end;

define inline-only C-function gtk-printer-get-hard-margins-for-paper-size
  input parameter self :: <GtkPrinter>;
  input parameter paper_size_ :: <GtkPaperSize>;
  output parameter top_ :: <C-double*>;
  output parameter bottom_ :: <C-double*>;
  output parameter left_ :: <C-double*>;
  output parameter right_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_get_hard_margins_for_paper_size";
end;

define inline-only C-function gtk-printer-get-icon-name
  input parameter self :: <GtkPrinter>;
  result res :: <C-string>;
  c-name: "gtk_printer_get_icon_name";
end;

define inline-only C-function gtk-printer-get-job-count
  input parameter self :: <GtkPrinter>;
  result res :: <C-signed-int>;
  c-name: "gtk_printer_get_job_count";
end;

define inline-only C-function gtk-printer-get-location
  input parameter self :: <GtkPrinter>;
  result res :: <C-string>;
  c-name: "gtk_printer_get_location";
end;

define inline-only C-function gtk-printer-get-name
  input parameter self :: <GtkPrinter>;
  result res :: <C-string>;
  c-name: "gtk_printer_get_name";
end;

define inline-only C-function gtk-printer-get-state-message
  input parameter self :: <GtkPrinter>;
  result res :: <C-string>;
  c-name: "gtk_printer_get_state_message";
end;

define inline-only C-function gtk-printer-has-details
  input parameter self :: <GtkPrinter>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_has_details";
end;

define inline-only C-function gtk-printer-is-accepting-jobs
  input parameter self :: <GtkPrinter>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_is_accepting_jobs";
end;

define inline-only C-function gtk-printer-is-active
  input parameter self :: <GtkPrinter>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_is_active";
end;

define inline-only C-function gtk-printer-is-default
  input parameter self :: <GtkPrinter>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_is_default";
end;

define inline-only C-function gtk-printer-is-paused
  input parameter self :: <GtkPrinter>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_is_paused";
end;

define inline-only C-function gtk-printer-is-virtual
  input parameter self :: <GtkPrinter>;
  result res :: <C-boolean>;
  c-name: "gtk_printer_is_virtual";
end;

define inline-only C-function gtk-printer-list-papers
  input parameter self :: <GtkPrinter>;
  result res :: <GList>;
  c-name: "gtk_printer_list_papers";
end;

define inline-only C-function gtk-printer-request-details
  input parameter self :: <GtkPrinter>;
  c-name: "gtk_printer_request_details";
end;

define open C-subtype <GtkProgressBar> (<GtkWidget>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkProgressBar*> => <GtkProgressBar>;

define sealed domain make (singleton(<GtkProgressBar*>));
define sealed domain initialize (<GtkProgressBar*>);

define inline-only C-function gtk-progress-bar-new
  result res :: <GtkWidget>;
  c-name: "gtk_progress_bar_new";
end;

define inline-only C-function gtk-progress-bar-get-ellipsize
  input parameter self :: <GtkProgressBar>;
  result res :: <PangoEllipsizeMode>;
  c-name: "gtk_progress_bar_get_ellipsize";
end;

define inline-only C-function gtk-progress-bar-get-fraction
  input parameter self :: <GtkProgressBar>;
  result res :: <C-double>;
  c-name: "gtk_progress_bar_get_fraction";
end;

define inline-only C-function gtk-progress-bar-get-inverted
  input parameter self :: <GtkProgressBar>;
  result res :: <C-boolean>;
  c-name: "gtk_progress_bar_get_inverted";
end;

define inline-only C-function gtk-progress-bar-get-pulse-step
  input parameter self :: <GtkProgressBar>;
  result res :: <C-double>;
  c-name: "gtk_progress_bar_get_pulse_step";
end;

define inline-only C-function gtk-progress-bar-get-show-text
  input parameter self :: <GtkProgressBar>;
  result res :: <C-boolean>;
  c-name: "gtk_progress_bar_get_show_text";
end;

define inline-only C-function gtk-progress-bar-get-text
  input parameter self :: <GtkProgressBar>;
  result res :: <C-string>;
  c-name: "gtk_progress_bar_get_text";
end;

define inline-only C-function gtk-progress-bar-pulse
  input parameter self :: <GtkProgressBar>;
  c-name: "gtk_progress_bar_pulse";
end;

define inline-only C-function gtk-progress-bar-set-ellipsize
  input parameter self :: <GtkProgressBar>;
  input parameter mode_ :: <PangoEllipsizeMode>;
  c-name: "gtk_progress_bar_set_ellipsize";
end;

define inline-only C-function gtk-progress-bar-set-fraction
  input parameter self :: <GtkProgressBar>;
  input parameter fraction_ :: <C-double>;
  c-name: "gtk_progress_bar_set_fraction";
end;

define inline-only C-function gtk-progress-bar-set-inverted
  input parameter self :: <GtkProgressBar>;
  input parameter inverted_ :: <C-boolean>;
  c-name: "gtk_progress_bar_set_inverted";
end;

define inline-only C-function gtk-progress-bar-set-pulse-step
  input parameter self :: <GtkProgressBar>;
  input parameter fraction_ :: <C-double>;
  c-name: "gtk_progress_bar_set_pulse_step";
end;

define inline-only C-function gtk-progress-bar-set-show-text
  input parameter self :: <GtkProgressBar>;
  input parameter show_text_ :: <C-boolean>;
  c-name: "gtk_progress_bar_set_show_text";
end;

define inline-only C-function gtk-progress-bar-set-text
  input parameter self :: <GtkProgressBar>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_progress_bar_set_text";
end;

define inline-only constant $gtk-limit-none = 0;
define inline-only constant $gtk-limit-same-native = 1;
define constant <GtkPropagationLimit> = <C-int>;
define C-pointer-type <GtkPropagationLimit*> => <GtkPropagationLimit>;

define inline-only constant $gtk-phase-none = 0;
define inline-only constant $gtk-phase-capture = 1;
define inline-only constant $gtk-phase-bubble = 2;
define inline-only constant $gtk-phase-target = 3;
define constant <GtkPropagationPhase> = <C-int>;
define C-pointer-type <GtkPropagationPhase*> => <GtkPropagationPhase>;

define open C-subtype <GtkPropertyExpression> (<GtkExpression>)
end C-subtype;

define C-pointer-type <GtkPropertyExpression*> => <GtkPropertyExpression>;

define sealed domain make (singleton(<GtkPropertyExpression*>));
define sealed domain initialize (<GtkPropertyExpression*>);

define inline-only C-function gtk-property-expression-new
  input parameter this_type_ :: <C-long>;
  input parameter expression_ :: <GtkExpression>;
  input parameter property_name_ :: <C-string>;
  result res :: <GtkPropertyExpression>;
  c-name: "gtk_property_expression_new";
end;

define inline-only C-function gtk-property-expression-new-for-pspec
  input parameter expression_ :: <GtkExpression>;
  input parameter pspec_ :: <GParamSpec>;
  result res :: <GtkPropertyExpression>;
  c-name: "gtk_property_expression_new_for_pspec";
end;

define inline-only C-function gtk-property-expression-get-expression
  input parameter self :: <GtkPropertyExpression>;
  result res :: <GtkExpression>;
  c-name: "gtk_property_expression_get_expression";
end;

define inline-only C-function gtk-property-expression-get-pspec
  input parameter self :: <GtkPropertyExpression>;
  result res :: <GParamSpec>;
  c-name: "gtk_property_expression_get_pspec";
end;

define open C-subtype <GtkRange> (<GtkWidget>, <GtkOrientable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkRange*> => <GtkRange>;

define sealed domain make (singleton(<GtkRange*>));
define sealed domain initialize (<GtkRange*>);

define inline-only C-function gtk-range-get-adjustment
  input parameter self :: <GtkRange>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_range_get_adjustment";
end;

define inline-only C-function gtk-range-get-fill-level
  input parameter self :: <GtkRange>;
  result res :: <C-double>;
  c-name: "gtk_range_get_fill_level";
end;

define inline-only C-function gtk-range-get-flippable
  input parameter self :: <GtkRange>;
  result res :: <C-boolean>;
  c-name: "gtk_range_get_flippable";
end;

define inline-only C-function gtk-range-get-inverted
  input parameter self :: <GtkRange>;
  result res :: <C-boolean>;
  c-name: "gtk_range_get_inverted";
end;

define inline-only C-function gtk-range-get-range-rect
  input parameter self :: <GtkRange>;
  input parameter range_rect_ :: <GdkRectangle>;
  c-name: "gtk_range_get_range_rect";
end;

define inline-only C-function gtk-range-get-restrict-to-fill-level
  input parameter self :: <GtkRange>;
  result res :: <C-boolean>;
  c-name: "gtk_range_get_restrict_to_fill_level";
end;

define inline-only C-function gtk-range-get-round-digits
  input parameter self :: <GtkRange>;
  result res :: <C-signed-int>;
  c-name: "gtk_range_get_round_digits";
end;

define inline-only C-function gtk-range-get-show-fill-level
  input parameter self :: <GtkRange>;
  result res :: <C-boolean>;
  c-name: "gtk_range_get_show_fill_level";
end;

define inline-only C-function gtk-range-get-slider-range
  input parameter self :: <GtkRange>;
  output parameter slider_start_ :: <C-signed-int*>;
  output parameter slider_end_ :: <C-signed-int*>;
  c-name: "gtk_range_get_slider_range";
end;

define inline-only C-function gtk-range-get-slider-size-fixed
  input parameter self :: <GtkRange>;
  result res :: <C-boolean>;
  c-name: "gtk_range_get_slider_size_fixed";
end;

define inline-only C-function gtk-range-get-value
  input parameter self :: <GtkRange>;
  result res :: <C-double>;
  c-name: "gtk_range_get_value";
end;

define inline-only C-function gtk-range-set-adjustment
  input parameter self :: <GtkRange>;
  input parameter adjustment_ :: <GtkAdjustment>;
  c-name: "gtk_range_set_adjustment";
end;

define inline-only C-function gtk-range-set-fill-level
  input parameter self :: <GtkRange>;
  input parameter fill_level_ :: <C-double>;
  c-name: "gtk_range_set_fill_level";
end;

define inline-only C-function gtk-range-set-flippable
  input parameter self :: <GtkRange>;
  input parameter flippable_ :: <C-boolean>;
  c-name: "gtk_range_set_flippable";
end;

define inline-only C-function gtk-range-set-increments
  input parameter self :: <GtkRange>;
  input parameter step_ :: <C-double>;
  input parameter page_ :: <C-double>;
  c-name: "gtk_range_set_increments";
end;

define inline-only C-function gtk-range-set-inverted
  input parameter self :: <GtkRange>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_range_set_inverted";
end;

define inline-only C-function gtk-range-set-range
  input parameter self :: <GtkRange>;
  input parameter min_ :: <C-double>;
  input parameter max_ :: <C-double>;
  c-name: "gtk_range_set_range";
end;

define inline-only C-function gtk-range-set-restrict-to-fill-level
  input parameter self :: <GtkRange>;
  input parameter restrict_to_fill_level_ :: <C-boolean>;
  c-name: "gtk_range_set_restrict_to_fill_level";
end;

define inline-only C-function gtk-range-set-round-digits
  input parameter self :: <GtkRange>;
  input parameter round_digits_ :: <C-signed-int>;
  c-name: "gtk_range_set_round_digits";
end;

define inline-only C-function gtk-range-set-show-fill-level
  input parameter self :: <GtkRange>;
  input parameter show_fill_level_ :: <C-boolean>;
  c-name: "gtk_range_set_show_fill_level";
end;

define inline-only C-function gtk-range-set-slider-size-fixed
  input parameter self :: <GtkRange>;
  input parameter size_fixed_ :: <C-boolean>;
  c-name: "gtk_range_set_slider_size_fixed";
end;

define inline-only C-function gtk-range-set-value
  input parameter self :: <GtkRange>;
  input parameter value_ :: <C-double>;
  c-name: "gtk_range_set_value";
end;

define C-struct <_GtkRangeClass>
  constant sealed inline-only slot gtk-range-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-range-class-value-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-range-class-adjust-bounds :: <C-function-pointer>;
  constant sealed inline-only slot gtk-range-class-move-slider :: <C-function-pointer>;
  constant sealed inline-only slot gtk-range-class-get-range-border :: <C-function-pointer>;
  constant sealed inline-only slot gtk-range-class-change-value :: <C-function-pointer>;
  constant sealed inline-only slot gtk-range-class-padding :: <C-void*>;
  pointer-type-name: <GtkRangeClass>;
end C-struct;

define sealed domain make (singleton(<GtkRangeClass>));
define sealed domain initialize (<GtkRangeClass>);

define C-struct <_GtkRecentData>
  sealed inline-only slot gtk-recent-data-display-name :: <C-string>;
  sealed inline-only slot gtk-recent-data-description :: <C-string>;
  sealed inline-only slot gtk-recent-data-mime-type :: <C-string>;
  sealed inline-only slot gtk-recent-data-app-name :: <C-string>;
  sealed inline-only slot gtk-recent-data-app-exec :: <C-string>;
  sealed inline-only slot gtk-recent-data-groups :: <C-string*>;
  sealed inline-only slot gtk-recent-data-is-private :: <C-boolean>;
  pointer-type-name: <GtkRecentData>;
end C-struct;

define sealed domain make (singleton(<GtkRecentData>));
define sealed domain initialize (<GtkRecentData>);

define C-struct <_GtkRecentInfo>
  pointer-type-name: <GtkRecentInfo>;
end C-struct;

define sealed domain make (singleton(<GtkRecentInfo>));
define sealed domain initialize (<GtkRecentInfo>);

define inline-only C-function gtk-recent-info-create-app-info
  input parameter self :: <GtkRecentInfo>;
  input parameter app_name_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GAppInfo>;
  c-name: "gtk_recent_info_create_app_info";
end;

define inline-only C-function gtk-recent-info-exists
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_info_exists";
end;

define inline-only C-function gtk-recent-info-get-added
  input parameter self :: <GtkRecentInfo>;
  result res :: <GDateTime>;
  c-name: "gtk_recent_info_get_added";
end;

define inline-only C-function gtk-recent-info-get-age
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-signed-int>;
  c-name: "gtk_recent_info_get_age";
end;

define inline-only C-function gtk-recent-info-get-application-info
  input parameter self :: <GtkRecentInfo>;
  input parameter app_name_ :: <C-string>;
  output parameter app_exec_ :: <C-string>;
  output parameter count_ :: <C-unsigned-int*>;
  input parameter stamp_ :: <GDateTime>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_info_get_application_info";
end;

define inline-only C-function gtk-recent-info-get-applications
  input parameter self :: <GtkRecentInfo>;
  output parameter length_ :: <C-unsigned-long*>;
  result res :: <C-string*>;
  c-name: "gtk_recent_info_get_applications";
end;

define inline-only C-function gtk-recent-info-get-description
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-string>;
  c-name: "gtk_recent_info_get_description";
end;

define inline-only C-function gtk-recent-info-get-display-name
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-string>;
  c-name: "gtk_recent_info_get_display_name";
end;

define inline-only C-function gtk-recent-info-get-gicon
  input parameter self :: <GtkRecentInfo>;
  result res :: <GIcon>;
  c-name: "gtk_recent_info_get_gicon";
end;

define inline-only C-function gtk-recent-info-get-groups
  input parameter self :: <GtkRecentInfo>;
  output parameter length_ :: <C-unsigned-long*>;
  result res :: <C-string*>;
  c-name: "gtk_recent_info_get_groups";
end;

define inline-only C-function gtk-recent-info-get-mime-type
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-string>;
  c-name: "gtk_recent_info_get_mime_type";
end;

define inline-only C-function gtk-recent-info-get-modified
  input parameter self :: <GtkRecentInfo>;
  result res :: <GDateTime>;
  c-name: "gtk_recent_info_get_modified";
end;

define inline-only C-function gtk-recent-info-get-private-hint
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_info_get_private_hint";
end;

define inline-only C-function gtk-recent-info-get-short-name
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-string>;
  c-name: "gtk_recent_info_get_short_name";
end;

define inline-only C-function gtk-recent-info-get-uri
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-string>;
  c-name: "gtk_recent_info_get_uri";
end;

define inline-only C-function gtk-recent-info-get-uri-display
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-string>;
  c-name: "gtk_recent_info_get_uri_display";
end;

define inline-only C-function gtk-recent-info-get-visited
  input parameter self :: <GtkRecentInfo>;
  result res :: <GDateTime>;
  c-name: "gtk_recent_info_get_visited";
end;

define inline-only C-function gtk-recent-info-has-application
  input parameter self :: <GtkRecentInfo>;
  input parameter app_name_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_info_has_application";
end;

define inline-only C-function gtk-recent-info-has-group
  input parameter self :: <GtkRecentInfo>;
  input parameter group_name_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_info_has_group";
end;

define inline-only C-function gtk-recent-info-is-local
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_info_is_local";
end;

define inline-only C-function gtk-recent-info-last-application
  input parameter self :: <GtkRecentInfo>;
  result res :: <C-string>;
  c-name: "gtk_recent_info_last_application";
end;

define inline-only C-function gtk-recent-info-match
  input parameter self :: <GtkRecentInfo>;
  input parameter info_b_ :: <GtkRecentInfo>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_info_match";
end;

define inline-only C-function gtk-recent-info-ref
  input parameter self :: <GtkRecentInfo>;
  result res :: <GtkRecentInfo>;
  c-name: "gtk_recent_info_ref";
end;

define inline-only C-function gtk-recent-info-unref
  input parameter self :: <GtkRecentInfo>;
  c-name: "gtk_recent_info_unref";
end;

define open C-subtype <GtkRecentManager> (<GObject>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GtkRecentManager*> => <GtkRecentManager>;

define sealed domain make (singleton(<GtkRecentManager*>));
define sealed domain initialize (<GtkRecentManager*>);

define inline-only C-function gtk-recent-manager-new
  result res :: <GtkRecentManager>;
  c-name: "gtk_recent_manager_new";
end;

define inline-only C-function gtk-recent-manager-get-default
  result res :: <GtkRecentManager>;
  c-name: "gtk_recent_manager_get_default";
end;

define inline-only C-function gtk-recent-manager-add-full
  input parameter self :: <GtkRecentManager>;
  input parameter uri_ :: <C-string>;
  input parameter recent_data_ :: <GtkRecentData>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_manager_add_full";
end;

define inline-only C-function gtk-recent-manager-add-item
  input parameter self :: <GtkRecentManager>;
  input parameter uri_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_manager_add_item";
end;

define inline-only C-function gtk-recent-manager-get-items
  input parameter self :: <GtkRecentManager>;
  result res :: <GList>;
  c-name: "gtk_recent_manager_get_items";
end;

define inline-only C-function gtk-recent-manager-has-item
  input parameter self :: <GtkRecentManager>;
  input parameter uri_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_manager_has_item";
end;

define inline-only C-function gtk-recent-manager-lookup-item
  input parameter self :: <GtkRecentManager>;
  input parameter uri_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GtkRecentInfo>;
  c-name: "gtk_recent_manager_lookup_item";
end;

define inline-only C-function gtk-recent-manager-move-item
  input parameter self :: <GtkRecentManager>;
  input parameter uri_ :: <C-string>;
  input parameter new_uri_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_manager_move_item";
end;

define inline-only C-function gtk-recent-manager-purge-items
  input parameter self :: <GtkRecentManager>;
  output parameter error_ :: <GError*>;
  result res :: <C-signed-int>;
  c-name: "gtk_recent_manager_purge_items";
end;

define inline-only C-function gtk-recent-manager-remove-item
  input parameter self :: <GtkRecentManager>;
  input parameter uri_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_recent_manager_remove_item";
end;

define C-struct <_GtkRecentManagerClass>
  constant sealed inline-only slot gtk-recent-manager-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-recent-manager-class-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-recent-manager-class-_gtk-recent1 :: <C-void*>;
  constant sealed inline-only slot gtk-recent-manager-class-_gtk-recent2 :: <C-void*>;
  constant sealed inline-only slot gtk-recent-manager-class-_gtk-recent3 :: <C-void*>;
  constant sealed inline-only slot gtk-recent-manager-class-_gtk-recent4 :: <C-void*>;
  pointer-type-name: <GtkRecentManagerClass>;
end C-struct;

define sealed domain make (singleton(<GtkRecentManagerClass>));
define sealed domain initialize (<GtkRecentManagerClass>);

define inline-only constant $gtk-recent-manager-error-not-found = 0;
define inline-only constant $gtk-recent-manager-error-invalid-uri = 1;
define inline-only constant $gtk-recent-manager-error-invalid-encoding = 2;
define inline-only constant $gtk-recent-manager-error-not-registered = 3;
define inline-only constant $gtk-recent-manager-error-read = 4;
define inline-only constant $gtk-recent-manager-error-write = 5;
define inline-only constant $gtk-recent-manager-error-unknown = 6;
define constant <GtkRecentManagerError> = <C-int>;
define C-pointer-type <GtkRecentManagerError*> => <GtkRecentManagerError>;

define C-struct <_GtkRecentManagerPrivate>
  pointer-type-name: <GtkRecentManagerPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkRecentManagerPrivate>));
define sealed domain initialize (<GtkRecentManagerPrivate>);

define C-struct <_GtkRequestedSize>
  sealed inline-only slot gtk-requested-size-data :: <C-void*>;
  sealed inline-only slot gtk-requested-size-minimum-size :: <C-signed-int>;
  sealed inline-only slot gtk-requested-size-natural-size :: <C-signed-int>;
  pointer-type-name: <GtkRequestedSize>;
end C-struct;

define sealed domain make (singleton(<GtkRequestedSize>));
define sealed domain initialize (<GtkRequestedSize>);

define C-struct <_GtkRequisition>
  sealed inline-only slot gtk-requisition-width :: <C-signed-int>;
  sealed inline-only slot gtk-requisition-height :: <C-signed-int>;
  pointer-type-name: <GtkRequisition>;
end C-struct;

define sealed domain make (singleton(<GtkRequisition>));
define sealed domain initialize (<GtkRequisition>);

define inline-only C-function gtk-requisition-new
  result res :: <GtkRequisition>;
  c-name: "gtk_requisition_new";
end;

define inline-only C-function gtk-requisition-copy
  input parameter self :: <GtkRequisition>;
  result res :: <GtkRequisition>;
  c-name: "gtk_requisition_copy";
end;

define inline-only C-function gtk-requisition-free
  input parameter self :: <GtkRequisition>;
  c-name: "gtk_requisition_free";
end;

define inline-only constant $gtk-response-none = -1;
define inline-only constant $gtk-response-reject = -2;
define inline-only constant $gtk-response-accept = -3;
define inline-only constant $gtk-response-delete-event = -4;
define inline-only constant $gtk-response-ok = -5;
define inline-only constant $gtk-response-cancel = -6;
define inline-only constant $gtk-response-close = -7;
define inline-only constant $gtk-response-yes = -8;
define inline-only constant $gtk-response-no = -9;
define inline-only constant $gtk-response-apply = -10;
define inline-only constant $gtk-response-help = -11;
define constant <GtkResponseType> = <C-int>;
define C-pointer-type <GtkResponseType*> => <GtkResponseType>;

define open C-subtype <GtkRevealer> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkRevealer*> => <GtkRevealer>;

define sealed domain make (singleton(<GtkRevealer*>));
define sealed domain initialize (<GtkRevealer*>);

define inline-only C-function gtk-revealer-new
  result res :: <GtkWidget>;
  c-name: "gtk_revealer_new";
end;

define inline-only C-function gtk-revealer-get-child
  input parameter self :: <GtkRevealer>;
  result res :: <GtkWidget>;
  c-name: "gtk_revealer_get_child";
end;

define inline-only C-function gtk-revealer-get-child-revealed
  input parameter self :: <GtkRevealer>;
  result res :: <C-boolean>;
  c-name: "gtk_revealer_get_child_revealed";
end;

define inline-only C-function gtk-revealer-get-reveal-child
  input parameter self :: <GtkRevealer>;
  result res :: <C-boolean>;
  c-name: "gtk_revealer_get_reveal_child";
end;

define inline-only C-function gtk-revealer-get-transition-duration
  input parameter self :: <GtkRevealer>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_revealer_get_transition_duration";
end;

define inline-only C-function gtk-revealer-get-transition-type
  input parameter self :: <GtkRevealer>;
  result res :: <GtkRevealerTransitionType>;
  c-name: "gtk_revealer_get_transition_type";
end;

define inline-only C-function gtk-revealer-set-child
  input parameter self :: <GtkRevealer>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_revealer_set_child";
end;

define inline-only C-function gtk-revealer-set-reveal-child
  input parameter self :: <GtkRevealer>;
  input parameter reveal_child_ :: <C-boolean>;
  c-name: "gtk_revealer_set_reveal_child";
end;

define inline-only C-function gtk-revealer-set-transition-duration
  input parameter self :: <GtkRevealer>;
  input parameter duration_ :: <C-unsigned-int>;
  c-name: "gtk_revealer_set_transition_duration";
end;

define inline-only C-function gtk-revealer-set-transition-type
  input parameter self :: <GtkRevealer>;
  input parameter transition_ :: <GtkRevealerTransitionType>;
  c-name: "gtk_revealer_set_transition_type";
end;

define inline-only constant $gtk-revealer-transition-type-none = 0;
define inline-only constant $gtk-revealer-transition-type-crossfade = 1;
define inline-only constant $gtk-revealer-transition-type-slide-right = 2;
define inline-only constant $gtk-revealer-transition-type-slide-left = 3;
define inline-only constant $gtk-revealer-transition-type-slide-up = 4;
define inline-only constant $gtk-revealer-transition-type-slide-down = 5;
define inline-only constant $gtk-revealer-transition-type-swing-right = 6;
define inline-only constant $gtk-revealer-transition-type-swing-left = 7;
define inline-only constant $gtk-revealer-transition-type-swing-up = 8;
define inline-only constant $gtk-revealer-transition-type-swing-down = 9;
define constant <GtkRevealerTransitionType> = <C-int>;
define C-pointer-type <GtkRevealerTransitionType*> => <GtkRevealerTransitionType>;

// Interface
define open C-subtype <GtkRoot> (<GtkNative>)
end C-subtype;

define C-pointer-type <GtkRoot*> => <GtkRoot>;

define sealed domain make (singleton(<GtkRoot*>));
define sealed domain initialize (<GtkRoot*>);

define inline-only C-function gtk-root-get-display
  input parameter self :: <GtkRoot>;
  result res :: <GdkDisplay>;
  c-name: "gtk_root_get_display";
end;

define inline-only C-function gtk-root-get-focus
  input parameter self :: <GtkRoot>;
  result res :: <GtkWidget>;
  c-name: "gtk_root_get_focus";
end;

define inline-only C-function gtk-root-set-focus
  input parameter self :: <GtkRoot>;
  input parameter focus_ :: <GtkWidget>;
  c-name: "gtk_root_set_focus";
end;

define C-struct <_GtkRootInterface>
  pointer-type-name: <GtkRootInterface>;
end C-struct;

define sealed domain make (singleton(<GtkRootInterface>));
define sealed domain initialize (<GtkRootInterface>);

define inline-only constant $style-provider-priority-application = 600;

define inline-only constant $style-provider-priority-fallback = 1;

define inline-only constant $style-provider-priority-settings = 400;

define inline-only constant $style-provider-priority-theme = 200;

define inline-only constant $style-provider-priority-user = 800;

define open C-subtype <GtkScale> (<GtkRange>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkScale*> => <GtkScale>;

define sealed domain make (singleton(<GtkScale*>));
define sealed domain initialize (<GtkScale*>);

define inline-only C-function gtk-scale-new
  input parameter orientation_ :: <GtkOrientation>;
  input parameter adjustment_ :: <GtkAdjustment>;
  result res :: <GtkWidget>;
  c-name: "gtk_scale_new";
end;

define inline-only C-function gtk-scale-new-with-range
  input parameter orientation_ :: <GtkOrientation>;
  input parameter min_ :: <C-double>;
  input parameter max_ :: <C-double>;
  input parameter step_ :: <C-double>;
  result res :: <GtkWidget>;
  c-name: "gtk_scale_new_with_range";
end;

define inline-only C-function gtk-scale-add-mark
  input parameter self :: <GtkScale>;
  input parameter value_ :: <C-double>;
  input parameter position_ :: <GtkPositionType>;
  input parameter markup_ :: <C-string>;
  c-name: "gtk_scale_add_mark";
end;

define inline-only C-function gtk-scale-clear-marks
  input parameter self :: <GtkScale>;
  c-name: "gtk_scale_clear_marks";
end;

define inline-only C-function gtk-scale-get-digits
  input parameter self :: <GtkScale>;
  result res :: <C-signed-int>;
  c-name: "gtk_scale_get_digits";
end;

define inline-only C-function gtk-scale-get-draw-value
  input parameter self :: <GtkScale>;
  result res :: <C-boolean>;
  c-name: "gtk_scale_get_draw_value";
end;

define inline-only C-function gtk-scale-get-has-origin
  input parameter self :: <GtkScale>;
  result res :: <C-boolean>;
  c-name: "gtk_scale_get_has_origin";
end;

define inline-only C-function gtk-scale-get-layout
  input parameter self :: <GtkScale>;
  result res :: <PangoLayout>;
  c-name: "gtk_scale_get_layout";
end;

define inline-only C-function gtk-scale-get-layout-offsets
  input parameter self :: <GtkScale>;
  output parameter x_ :: <C-signed-int*>;
  output parameter y_ :: <C-signed-int*>;
  c-name: "gtk_scale_get_layout_offsets";
end;

define inline-only C-function gtk-scale-get-value-pos
  input parameter self :: <GtkScale>;
  result res :: <GtkPositionType>;
  c-name: "gtk_scale_get_value_pos";
end;

define inline-only C-function gtk-scale-set-digits
  input parameter self :: <GtkScale>;
  input parameter digits_ :: <C-signed-int>;
  c-name: "gtk_scale_set_digits";
end;

define inline-only C-function gtk-scale-set-draw-value
  input parameter self :: <GtkScale>;
  input parameter draw_value_ :: <C-boolean>;
  c-name: "gtk_scale_set_draw_value";
end;

define inline-only C-function gtk-scale-set-format-value-func
  input parameter self :: <GtkScale>;
  input parameter func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_notify_ :: <C-function-pointer>;
  c-name: "gtk_scale_set_format_value_func";
end;

define inline-only C-function gtk-scale-set-has-origin
  input parameter self :: <GtkScale>;
  input parameter has_origin_ :: <C-boolean>;
  c-name: "gtk_scale_set_has_origin";
end;

define inline-only C-function gtk-scale-set-value-pos
  input parameter self :: <GtkScale>;
  input parameter pos_ :: <GtkPositionType>;
  c-name: "gtk_scale_set_value_pos";
end;

define open C-subtype <GtkScaleButton> (<GtkWidget>, <GtkOrientable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkScaleButton*> => <GtkScaleButton>;

define sealed domain make (singleton(<GtkScaleButton*>));
define sealed domain initialize (<GtkScaleButton*>);

define inline-only C-function gtk-scale-button-new
  input parameter min_ :: <C-double>;
  input parameter max_ :: <C-double>;
  input parameter step_ :: <C-double>;
  input parameter icons_ :: <C-string*>;
  result res :: <GtkWidget>;
  c-name: "gtk_scale_button_new";
end;

define inline-only C-function gtk-scale-button-get-adjustment
  input parameter self :: <GtkScaleButton>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_scale_button_get_adjustment";
end;

define inline-only C-function gtk-scale-button-get-minus-button
  input parameter self :: <GtkScaleButton>;
  result res :: <GtkButton>;
  c-name: "gtk_scale_button_get_minus_button";
end;

define inline-only C-function gtk-scale-button-get-plus-button
  input parameter self :: <GtkScaleButton>;
  result res :: <GtkButton>;
  c-name: "gtk_scale_button_get_plus_button";
end;

define inline-only C-function gtk-scale-button-get-popup
  input parameter self :: <GtkScaleButton>;
  result res :: <GtkWidget>;
  c-name: "gtk_scale_button_get_popup";
end;

define inline-only C-function gtk-scale-button-get-value
  input parameter self :: <GtkScaleButton>;
  result res :: <C-double>;
  c-name: "gtk_scale_button_get_value";
end;

define inline-only C-function gtk-scale-button-set-adjustment
  input parameter self :: <GtkScaleButton>;
  input parameter adjustment_ :: <GtkAdjustment>;
  c-name: "gtk_scale_button_set_adjustment";
end;

define inline-only C-function gtk-scale-button-set-icons
  input parameter self :: <GtkScaleButton>;
  input parameter icons_ :: <C-string*>;
  c-name: "gtk_scale_button_set_icons";
end;

define inline-only C-function gtk-scale-button-set-value
  input parameter self :: <GtkScaleButton>;
  input parameter value_ :: <C-double>;
  c-name: "gtk_scale_button_set_value";
end;

define C-struct <_GtkScaleButtonClass>
  constant sealed inline-only slot gtk-scale-button-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-scale-button-class-value-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-scale-button-class-padding :: <C-void*>;
  pointer-type-name: <GtkScaleButtonClass>;
end C-struct;

define sealed domain make (singleton(<GtkScaleButtonClass>));
define sealed domain initialize (<GtkScaleButtonClass>);

define C-struct <_GtkScaleClass>
  constant sealed inline-only slot gtk-scale-class-parent-class :: <GtkRangeClass>;
  constant sealed inline-only slot gtk-scale-class-get-layout-offsets :: <C-function-pointer>;
  constant sealed inline-only slot gtk-scale-class-padding :: <C-void*>;
  pointer-type-name: <GtkScaleClass>;
end C-struct;

define sealed domain make (singleton(<GtkScaleClass>));
define sealed domain initialize (<GtkScaleClass>);

define inline-only constant $gtk-scroll-steps = 0;
define inline-only constant $gtk-scroll-pages = 1;
define inline-only constant $gtk-scroll-ends = 2;
define inline-only constant $gtk-scroll-horizontal-steps = 3;
define inline-only constant $gtk-scroll-horizontal-pages = 4;
define inline-only constant $gtk-scroll-horizontal-ends = 5;
define constant <GtkScrollStep> = <C-int>;
define C-pointer-type <GtkScrollStep*> => <GtkScrollStep>;

define inline-only constant $gtk-scroll-none = 0;
define inline-only constant $gtk-scroll-jump = 1;
define inline-only constant $gtk-scroll-step-backward = 2;
define inline-only constant $gtk-scroll-step-forward = 3;
define inline-only constant $gtk-scroll-page-backward = 4;
define inline-only constant $gtk-scroll-page-forward = 5;
define inline-only constant $gtk-scroll-step-up = 6;
define inline-only constant $gtk-scroll-step-down = 7;
define inline-only constant $gtk-scroll-page-up = 8;
define inline-only constant $gtk-scroll-page-down = 9;
define inline-only constant $gtk-scroll-step-left = 10;
define inline-only constant $gtk-scroll-step-right = 11;
define inline-only constant $gtk-scroll-page-left = 12;
define inline-only constant $gtk-scroll-page-right = 13;
define inline-only constant $gtk-scroll-start = 14;
define inline-only constant $gtk-scroll-end = 15;
define constant <GtkScrollType> = <C-int>;
define C-pointer-type <GtkScrollType*> => <GtkScrollType>;

// Interface
define open C-subtype <GtkScrollable> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkScrollable*> => <GtkScrollable>;

define sealed domain make (singleton(<GtkScrollable*>));
define sealed domain initialize (<GtkScrollable*>);

define inline-only C-function gtk-scrollable-get-border
  input parameter self :: <GtkScrollable>;
  input parameter border_ :: <GtkBorder>;
  result res :: <C-boolean>;
  c-name: "gtk_scrollable_get_border";
end;

define inline-only C-function gtk-scrollable-get-hadjustment
  input parameter self :: <GtkScrollable>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_scrollable_get_hadjustment";
end;

define inline-only C-function gtk-scrollable-get-hscroll-policy
  input parameter self :: <GtkScrollable>;
  result res :: <GtkScrollablePolicy>;
  c-name: "gtk_scrollable_get_hscroll_policy";
end;

define inline-only C-function gtk-scrollable-get-vadjustment
  input parameter self :: <GtkScrollable>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_scrollable_get_vadjustment";
end;

define inline-only C-function gtk-scrollable-get-vscroll-policy
  input parameter self :: <GtkScrollable>;
  result res :: <GtkScrollablePolicy>;
  c-name: "gtk_scrollable_get_vscroll_policy";
end;

define inline-only C-function gtk-scrollable-set-hadjustment
  input parameter self :: <GtkScrollable>;
  input parameter hadjustment_ :: <GtkAdjustment>;
  c-name: "gtk_scrollable_set_hadjustment";
end;

define inline-only C-function gtk-scrollable-set-hscroll-policy
  input parameter self :: <GtkScrollable>;
  input parameter policy_ :: <GtkScrollablePolicy>;
  c-name: "gtk_scrollable_set_hscroll_policy";
end;

define inline-only C-function gtk-scrollable-set-vadjustment
  input parameter self :: <GtkScrollable>;
  input parameter vadjustment_ :: <GtkAdjustment>;
  c-name: "gtk_scrollable_set_vadjustment";
end;

define inline-only C-function gtk-scrollable-set-vscroll-policy
  input parameter self :: <GtkScrollable>;
  input parameter policy_ :: <GtkScrollablePolicy>;
  c-name: "gtk_scrollable_set_vscroll_policy";
end;

define C-struct <_GtkScrollableInterface>
  constant sealed inline-only slot gtk-scrollable-interface-base-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-scrollable-interface-get-border :: <C-function-pointer>;
  pointer-type-name: <GtkScrollableInterface>;
end C-struct;

define sealed domain make (singleton(<GtkScrollableInterface>));
define sealed domain initialize (<GtkScrollableInterface>);

define inline-only constant $gtk-scroll-minimum = 0;
define inline-only constant $gtk-scroll-natural = 1;
define constant <GtkScrollablePolicy> = <C-int>;
define C-pointer-type <GtkScrollablePolicy*> => <GtkScrollablePolicy>;

define open C-subtype <GtkScrollbar> (<GtkWidget>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkScrollbar*> => <GtkScrollbar>;

define sealed domain make (singleton(<GtkScrollbar*>));
define sealed domain initialize (<GtkScrollbar*>);

define inline-only C-function gtk-scrollbar-new
  input parameter orientation_ :: <GtkOrientation>;
  input parameter adjustment_ :: <GtkAdjustment>;
  result res :: <GtkWidget>;
  c-name: "gtk_scrollbar_new";
end;

define inline-only C-function gtk-scrollbar-get-adjustment
  input parameter self :: <GtkScrollbar>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_scrollbar_get_adjustment";
end;

define inline-only C-function gtk-scrollbar-set-adjustment
  input parameter self :: <GtkScrollbar>;
  input parameter adjustment_ :: <GtkAdjustment>;
  c-name: "gtk_scrollbar_set_adjustment";
end;

define open C-subtype <GtkScrolledWindow> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkScrolledWindow*> => <GtkScrolledWindow>;

define sealed domain make (singleton(<GtkScrolledWindow*>));
define sealed domain initialize (<GtkScrolledWindow*>);

define inline-only C-function gtk-scrolled-window-new
  result res :: <GtkWidget>;
  c-name: "gtk_scrolled_window_new";
end;

define inline-only C-function gtk-scrolled-window-get-child
  input parameter self :: <GtkScrolledWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_scrolled_window_get_child";
end;

define inline-only C-function gtk-scrolled-window-get-hadjustment
  input parameter self :: <GtkScrolledWindow>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_scrolled_window_get_hadjustment";
end;

define inline-only C-function gtk-scrolled-window-get-has-frame
  input parameter self :: <GtkScrolledWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_scrolled_window_get_has_frame";
end;

define inline-only C-function gtk-scrolled-window-get-hscrollbar
  input parameter self :: <GtkScrolledWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_scrolled_window_get_hscrollbar";
end;

define inline-only C-function gtk-scrolled-window-get-kinetic-scrolling
  input parameter self :: <GtkScrolledWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_scrolled_window_get_kinetic_scrolling";
end;

define inline-only C-function gtk-scrolled-window-get-max-content-height
  input parameter self :: <GtkScrolledWindow>;
  result res :: <C-signed-int>;
  c-name: "gtk_scrolled_window_get_max_content_height";
end;

define inline-only C-function gtk-scrolled-window-get-max-content-width
  input parameter self :: <GtkScrolledWindow>;
  result res :: <C-signed-int>;
  c-name: "gtk_scrolled_window_get_max_content_width";
end;

define inline-only C-function gtk-scrolled-window-get-min-content-height
  input parameter self :: <GtkScrolledWindow>;
  result res :: <C-signed-int>;
  c-name: "gtk_scrolled_window_get_min_content_height";
end;

define inline-only C-function gtk-scrolled-window-get-min-content-width
  input parameter self :: <GtkScrolledWindow>;
  result res :: <C-signed-int>;
  c-name: "gtk_scrolled_window_get_min_content_width";
end;

define inline-only C-function gtk-scrolled-window-get-overlay-scrolling
  input parameter self :: <GtkScrolledWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_scrolled_window_get_overlay_scrolling";
end;

define inline-only C-function gtk-scrolled-window-get-placement
  input parameter self :: <GtkScrolledWindow>;
  result res :: <GtkCornerType>;
  c-name: "gtk_scrolled_window_get_placement";
end;

define inline-only C-function gtk-scrolled-window-get-policy
  input parameter self :: <GtkScrolledWindow>;
  output parameter hscrollbar_policy_ :: <GtkPolicyType*>;
  output parameter vscrollbar_policy_ :: <GtkPolicyType*>;
  c-name: "gtk_scrolled_window_get_policy";
end;

define inline-only C-function gtk-scrolled-window-get-propagate-natural-height
  input parameter self :: <GtkScrolledWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_scrolled_window_get_propagate_natural_height";
end;

define inline-only C-function gtk-scrolled-window-get-propagate-natural-width
  input parameter self :: <GtkScrolledWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_scrolled_window_get_propagate_natural_width";
end;

define inline-only C-function gtk-scrolled-window-get-vadjustment
  input parameter self :: <GtkScrolledWindow>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_scrolled_window_get_vadjustment";
end;

define inline-only C-function gtk-scrolled-window-get-vscrollbar
  input parameter self :: <GtkScrolledWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_scrolled_window_get_vscrollbar";
end;

define inline-only C-function gtk-scrolled-window-set-child
  input parameter self :: <GtkScrolledWindow>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_scrolled_window_set_child";
end;

define inline-only C-function gtk-scrolled-window-set-hadjustment
  input parameter self :: <GtkScrolledWindow>;
  input parameter hadjustment_ :: <GtkAdjustment>;
  c-name: "gtk_scrolled_window_set_hadjustment";
end;

define inline-only C-function gtk-scrolled-window-set-has-frame
  input parameter self :: <GtkScrolledWindow>;
  input parameter has_frame_ :: <C-boolean>;
  c-name: "gtk_scrolled_window_set_has_frame";
end;

define inline-only C-function gtk-scrolled-window-set-kinetic-scrolling
  input parameter self :: <GtkScrolledWindow>;
  input parameter kinetic_scrolling_ :: <C-boolean>;
  c-name: "gtk_scrolled_window_set_kinetic_scrolling";
end;

define inline-only C-function gtk-scrolled-window-set-max-content-height
  input parameter self :: <GtkScrolledWindow>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_scrolled_window_set_max_content_height";
end;

define inline-only C-function gtk-scrolled-window-set-max-content-width
  input parameter self :: <GtkScrolledWindow>;
  input parameter width_ :: <C-signed-int>;
  c-name: "gtk_scrolled_window_set_max_content_width";
end;

define inline-only C-function gtk-scrolled-window-set-min-content-height
  input parameter self :: <GtkScrolledWindow>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_scrolled_window_set_min_content_height";
end;

define inline-only C-function gtk-scrolled-window-set-min-content-width
  input parameter self :: <GtkScrolledWindow>;
  input parameter width_ :: <C-signed-int>;
  c-name: "gtk_scrolled_window_set_min_content_width";
end;

define inline-only C-function gtk-scrolled-window-set-overlay-scrolling
  input parameter self :: <GtkScrolledWindow>;
  input parameter overlay_scrolling_ :: <C-boolean>;
  c-name: "gtk_scrolled_window_set_overlay_scrolling";
end;

define inline-only C-function gtk-scrolled-window-set-placement
  input parameter self :: <GtkScrolledWindow>;
  input parameter window_placement_ :: <GtkCornerType>;
  c-name: "gtk_scrolled_window_set_placement";
end;

define inline-only C-function gtk-scrolled-window-set-policy
  input parameter self :: <GtkScrolledWindow>;
  input parameter hscrollbar_policy_ :: <GtkPolicyType>;
  input parameter vscrollbar_policy_ :: <GtkPolicyType>;
  c-name: "gtk_scrolled_window_set_policy";
end;

define inline-only C-function gtk-scrolled-window-set-propagate-natural-height
  input parameter self :: <GtkScrolledWindow>;
  input parameter propagate_ :: <C-boolean>;
  c-name: "gtk_scrolled_window_set_propagate_natural_height";
end;

define inline-only C-function gtk-scrolled-window-set-propagate-natural-width
  input parameter self :: <GtkScrolledWindow>;
  input parameter propagate_ :: <C-boolean>;
  c-name: "gtk_scrolled_window_set_propagate_natural_width";
end;

define inline-only C-function gtk-scrolled-window-set-vadjustment
  input parameter self :: <GtkScrolledWindow>;
  input parameter vadjustment_ :: <GtkAdjustment>;
  c-name: "gtk_scrolled_window_set_vadjustment";
end;

define inline-only C-function gtk-scrolled-window-unset-placement
  input parameter self :: <GtkScrolledWindow>;
  c-name: "gtk_scrolled_window_unset_placement";
end;

define open C-subtype <GtkSearchBar> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkSearchBar*> => <GtkSearchBar>;

define sealed domain make (singleton(<GtkSearchBar*>));
define sealed domain initialize (<GtkSearchBar*>);

define inline-only C-function gtk-search-bar-new
  result res :: <GtkWidget>;
  c-name: "gtk_search_bar_new";
end;

define inline-only C-function gtk-search-bar-connect-entry
  input parameter self :: <GtkSearchBar>;
  input parameter entry_ :: <GtkEditable>;
  c-name: "gtk_search_bar_connect_entry";
end;

define inline-only C-function gtk-search-bar-get-child
  input parameter self :: <GtkSearchBar>;
  result res :: <GtkWidget>;
  c-name: "gtk_search_bar_get_child";
end;

define inline-only C-function gtk-search-bar-get-key-capture-widget
  input parameter self :: <GtkSearchBar>;
  result res :: <GtkWidget>;
  c-name: "gtk_search_bar_get_key_capture_widget";
end;

define inline-only C-function gtk-search-bar-get-search-mode
  input parameter self :: <GtkSearchBar>;
  result res :: <C-boolean>;
  c-name: "gtk_search_bar_get_search_mode";
end;

define inline-only C-function gtk-search-bar-get-show-close-button
  input parameter self :: <GtkSearchBar>;
  result res :: <C-boolean>;
  c-name: "gtk_search_bar_get_show_close_button";
end;

define inline-only C-function gtk-search-bar-set-child
  input parameter self :: <GtkSearchBar>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_search_bar_set_child";
end;

define inline-only C-function gtk-search-bar-set-key-capture-widget
  input parameter self :: <GtkSearchBar>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_search_bar_set_key_capture_widget";
end;

define inline-only C-function gtk-search-bar-set-search-mode
  input parameter self :: <GtkSearchBar>;
  input parameter search_mode_ :: <C-boolean>;
  c-name: "gtk_search_bar_set_search_mode";
end;

define inline-only C-function gtk-search-bar-set-show-close-button
  input parameter self :: <GtkSearchBar>;
  input parameter visible_ :: <C-boolean>;
  c-name: "gtk_search_bar_set_show_close_button";
end;

define open C-subtype <GtkSearchEntry> (<GtkEditable>)
end C-subtype;

define C-pointer-type <GtkSearchEntry*> => <GtkSearchEntry>;

define sealed domain make (singleton(<GtkSearchEntry*>));
define sealed domain initialize (<GtkSearchEntry*>);

define inline-only C-function gtk-search-entry-new
  result res :: <GtkWidget>;
  c-name: "gtk_search_entry_new";
end;

define inline-only C-function gtk-search-entry-get-key-capture-widget
  input parameter self :: <GtkSearchEntry>;
  result res :: <GtkWidget>;
  c-name: "gtk_search_entry_get_key_capture_widget";
end;

define inline-only C-function gtk-search-entry-get-search-delay
  input parameter self :: <GtkSearchEntry>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_search_entry_get_search_delay";
end;

define inline-only C-function gtk-search-entry-set-key-capture-widget
  input parameter self :: <GtkSearchEntry>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_search_entry_set_key_capture_widget";
end;

define inline-only C-function gtk-search-entry-set-search-delay
  input parameter self :: <GtkSearchEntry>;
  input parameter delay_ :: <C-unsigned-int>;
  c-name: "gtk_search_entry_set_search_delay";
end;

define open C-subtype <GtkSelectionFilterModel> (<GObject>, <GListModel>)
end C-subtype;

define C-pointer-type <GtkSelectionFilterModel*> => <GtkSelectionFilterModel>;

define sealed domain make (singleton(<GtkSelectionFilterModel*>));
define sealed domain initialize (<GtkSelectionFilterModel*>);

define inline-only C-function gtk-selection-filter-model-new
  input parameter model_ :: <GtkSelectionModel>;
  result res :: <GtkSelectionFilterModel>;
  c-name: "gtk_selection_filter_model_new";
end;

define inline-only C-function gtk-selection-filter-model-get-model
  input parameter self :: <GtkSelectionFilterModel>;
  result res :: <GtkSelectionModel>;
  c-name: "gtk_selection_filter_model_get_model";
end;

define inline-only C-function gtk-selection-filter-model-set-model
  input parameter self :: <GtkSelectionFilterModel>;
  input parameter model_ :: <GtkSelectionModel>;
  c-name: "gtk_selection_filter_model_set_model";
end;

define C-struct <_GtkSelectionFilterModelClass>
  constant sealed inline-only slot gtk-selection-filter-model-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkSelectionFilterModelClass>;
end C-struct;

define sealed domain make (singleton(<GtkSelectionFilterModelClass>));
define sealed domain initialize (<GtkSelectionFilterModelClass>);

define inline-only constant $gtk-selection-none = 0;
define inline-only constant $gtk-selection-single = 1;
define inline-only constant $gtk-selection-browse = 2;
define inline-only constant $gtk-selection-multiple = 3;
define constant <GtkSelectionMode> = <C-int>;
define C-pointer-type <GtkSelectionMode*> => <GtkSelectionMode>;

// Interface
define open C-subtype <GtkSelectionModel> (<GListModel>)
end C-subtype;

define C-pointer-type <GtkSelectionModel*> => <GtkSelectionModel>;

define sealed domain make (singleton(<GtkSelectionModel*>));
define sealed domain initialize (<GtkSelectionModel*>);

define inline-only C-function gtk-selection-model-get-selection
  input parameter self :: <GtkSelectionModel>;
  result res :: <GtkBitset>;
  c-name: "gtk_selection_model_get_selection";
end;

define inline-only C-function gtk-selection-model-get-selection-in-range
  input parameter self :: <GtkSelectionModel>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter n_items_ :: <C-unsigned-int>;
  result res :: <GtkBitset>;
  c-name: "gtk_selection_model_get_selection_in_range";
end;

define inline-only C-function gtk-selection-model-is-selected
  input parameter self :: <GtkSelectionModel>;
  input parameter position_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "gtk_selection_model_is_selected";
end;

define inline-only C-function gtk-selection-model-select-all
  input parameter self :: <GtkSelectionModel>;
  result res :: <C-boolean>;
  c-name: "gtk_selection_model_select_all";
end;

define inline-only C-function gtk-selection-model-select-item
  input parameter self :: <GtkSelectionModel>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter unselect_rest_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_selection_model_select_item";
end;

define inline-only C-function gtk-selection-model-select-range
  input parameter self :: <GtkSelectionModel>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter n_items_ :: <C-unsigned-int>;
  input parameter unselect_rest_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_selection_model_select_range";
end;

define inline-only C-function gtk-selection-model-selection-changed
  input parameter self :: <GtkSelectionModel>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter n_items_ :: <C-unsigned-int>;
  c-name: "gtk_selection_model_selection_changed";
end;

define inline-only C-function gtk-selection-model-set-selection
  input parameter self :: <GtkSelectionModel>;
  input parameter selected_ :: <GtkBitset>;
  input parameter mask_ :: <GtkBitset>;
  result res :: <C-boolean>;
  c-name: "gtk_selection_model_set_selection";
end;

define inline-only C-function gtk-selection-model-unselect-all
  input parameter self :: <GtkSelectionModel>;
  result res :: <C-boolean>;
  c-name: "gtk_selection_model_unselect_all";
end;

define inline-only C-function gtk-selection-model-unselect-item
  input parameter self :: <GtkSelectionModel>;
  input parameter position_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "gtk_selection_model_unselect_item";
end;

define inline-only C-function gtk-selection-model-unselect-range
  input parameter self :: <GtkSelectionModel>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter n_items_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "gtk_selection_model_unselect_range";
end;

define C-struct <_GtkSelectionModelInterface>
  constant sealed inline-only slot gtk-selection-model-interface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-selection-model-interface-is-selected :: <C-function-pointer>;
  constant sealed inline-only slot gtk-selection-model-interface-get-selection-in-range :: <C-function-pointer>;
  constant sealed inline-only slot gtk-selection-model-interface-select-item :: <C-function-pointer>;
  constant sealed inline-only slot gtk-selection-model-interface-unselect-item :: <C-function-pointer>;
  constant sealed inline-only slot gtk-selection-model-interface-select-range :: <C-function-pointer>;
  constant sealed inline-only slot gtk-selection-model-interface-unselect-range :: <C-function-pointer>;
  constant sealed inline-only slot gtk-selection-model-interface-select-all :: <C-function-pointer>;
  constant sealed inline-only slot gtk-selection-model-interface-unselect-all :: <C-function-pointer>;
  constant sealed inline-only slot gtk-selection-model-interface-set-selection :: <C-function-pointer>;
  pointer-type-name: <GtkSelectionModelInterface>;
end C-struct;

define sealed domain make (singleton(<GtkSelectionModelInterface>));
define sealed domain initialize (<GtkSelectionModelInterface>);

define inline-only constant $gtk-sensitivity-auto = 0;
define inline-only constant $gtk-sensitivity-on = 1;
define inline-only constant $gtk-sensitivity-off = 2;
define constant <GtkSensitivityType> = <C-int>;
define C-pointer-type <GtkSensitivityType*> => <GtkSensitivityType>;

define open C-subtype <GtkSeparator> (<GtkWidget>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkSeparator*> => <GtkSeparator>;

define sealed domain make (singleton(<GtkSeparator*>));
define sealed domain initialize (<GtkSeparator*>);

define inline-only C-function gtk-separator-new
  input parameter orientation_ :: <GtkOrientation>;
  result res :: <GtkWidget>;
  c-name: "gtk_separator_new";
end;

define open C-subtype <GtkSettings> (<GObject>, <GtkStyleProvider>)
end C-subtype;

define C-pointer-type <GtkSettings*> => <GtkSettings>;

define sealed domain make (singleton(<GtkSettings*>));
define sealed domain initialize (<GtkSettings*>);

define inline-only C-function gtk-settings-get-default
  result res :: <GtkSettings>;
  c-name: "gtk_settings_get_default";
end;

define inline-only C-function gtk-settings-get-for-display
  input parameter display_ :: <GdkDisplay>;
  result res :: <GtkSettings>;
  c-name: "gtk_settings_get_for_display";
end;

define inline-only C-function gtk-settings-reset-property
  input parameter self :: <GtkSettings>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_settings_reset_property";
end;

define open C-subtype <GtkShortcut> (<GObject>)
end C-subtype;

define C-pointer-type <GtkShortcut*> => <GtkShortcut>;

define sealed domain make (singleton(<GtkShortcut*>));
define sealed domain initialize (<GtkShortcut*>);

define inline-only C-function gtk-shortcut-new
  input parameter trigger_ :: <GtkShortcutTrigger>;
  input parameter action_ :: <GtkShortcutAction>;
  result res :: <GtkShortcut>;
  c-name: "gtk_shortcut_new";
end;

define inline-only C-function gtk-shortcut-get-action
  input parameter self :: <GtkShortcut>;
  result res :: <GtkShortcutAction>;
  c-name: "gtk_shortcut_get_action";
end;

define inline-only C-function gtk-shortcut-get-arguments
  input parameter self :: <GtkShortcut>;
  result res :: <GVariant>;
  c-name: "gtk_shortcut_get_arguments";
end;

define inline-only C-function gtk-shortcut-get-trigger
  input parameter self :: <GtkShortcut>;
  result res :: <GtkShortcutTrigger>;
  c-name: "gtk_shortcut_get_trigger";
end;

define inline-only C-function gtk-shortcut-set-action
  input parameter self :: <GtkShortcut>;
  input parameter action_ :: <GtkShortcutAction>;
  c-name: "gtk_shortcut_set_action";
end;

define inline-only C-function gtk-shortcut-set-arguments
  input parameter self :: <GtkShortcut>;
  input parameter args_ :: <GVariant>;
  c-name: "gtk_shortcut_set_arguments";
end;

define inline-only C-function gtk-shortcut-set-trigger
  input parameter self :: <GtkShortcut>;
  input parameter trigger_ :: <GtkShortcutTrigger>;
  c-name: "gtk_shortcut_set_trigger";
end;

define open C-subtype <GtkShortcutAction> (<GObject>)
end C-subtype;

define C-pointer-type <GtkShortcutAction*> => <GtkShortcutAction>;

define sealed domain make (singleton(<GtkShortcutAction*>));
define sealed domain initialize (<GtkShortcutAction*>);

define inline-only C-function gtk-shortcut-action-parse-string
  input parameter string_ :: <C-string>;
  result res :: <GtkShortcutAction>;
  c-name: "gtk_shortcut_action_parse_string";
end;

define inline-only C-function gtk-shortcut-action-activate
  input parameter self :: <GtkShortcutAction>;
  input parameter flags_ :: <GtkShortcutActionFlags>;
  input parameter widget_ :: <GtkWidget>;
  input parameter args_ :: <GVariant>;
  result res :: <C-boolean>;
  c-name: "gtk_shortcut_action_activate";
end;

define inline-only C-function gtk-shortcut-action-print
  input parameter self :: <GtkShortcutAction>;
  input parameter string_ :: <GString>;
  c-name: "gtk_shortcut_action_print";
end;

define inline-only C-function gtk-shortcut-action-to-string
  input parameter self :: <GtkShortcutAction>;
  result res :: <C-string>;
  c-name: "gtk_shortcut_action_to_string";
end;

define C-struct <_GtkShortcutActionClass>
  pointer-type-name: <GtkShortcutActionClass>;
end C-struct;

define sealed domain make (singleton(<GtkShortcutActionClass>));
define sealed domain initialize (<GtkShortcutActionClass>);

define inline-only constant $gtk-shortcut-action-exclusive = 1;
define constant <GtkShortcutActionFlags> = <C-int>;
define C-pointer-type <GtkShortcutActionFlags*> => <GtkShortcutActionFlags>;

define C-struct <_GtkShortcutClass>
  constant sealed inline-only slot gtk-shortcut-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkShortcutClass>;
end C-struct;

define sealed domain make (singleton(<GtkShortcutClass>));
define sealed domain initialize (<GtkShortcutClass>);

define open C-subtype <GtkShortcutController> (<GtkEventController>, <GListModel>, <GtkBuildable>)
end C-subtype;

define C-pointer-type <GtkShortcutController*> => <GtkShortcutController>;

define sealed domain make (singleton(<GtkShortcutController*>));
define sealed domain initialize (<GtkShortcutController*>);

define inline-only C-function gtk-shortcut-controller-new
  result res :: <GtkEventController>;
  c-name: "gtk_shortcut_controller_new";
end;

define inline-only C-function gtk-shortcut-controller-new-for-model
  input parameter model_ :: <GListModel>;
  result res :: <GtkEventController>;
  c-name: "gtk_shortcut_controller_new_for_model";
end;

define inline-only C-function gtk-shortcut-controller-add-shortcut
  input parameter self :: <GtkShortcutController>;
  input parameter shortcut_ :: <GtkShortcut>;
  c-name: "gtk_shortcut_controller_add_shortcut";
end;

define inline-only C-function gtk-shortcut-controller-get-mnemonics-modifiers
  input parameter self :: <GtkShortcutController>;
  result res :: <GdkModifierType>;
  c-name: "gtk_shortcut_controller_get_mnemonics_modifiers";
end;

define inline-only C-function gtk-shortcut-controller-get-scope
  input parameter self :: <GtkShortcutController>;
  result res :: <GtkShortcutScope>;
  c-name: "gtk_shortcut_controller_get_scope";
end;

define inline-only C-function gtk-shortcut-controller-remove-shortcut
  input parameter self :: <GtkShortcutController>;
  input parameter shortcut_ :: <GtkShortcut>;
  c-name: "gtk_shortcut_controller_remove_shortcut";
end;

define inline-only C-function gtk-shortcut-controller-set-mnemonics-modifiers
  input parameter self :: <GtkShortcutController>;
  input parameter modifiers_ :: <GdkModifierType>;
  c-name: "gtk_shortcut_controller_set_mnemonics_modifiers";
end;

define inline-only C-function gtk-shortcut-controller-set-scope
  input parameter self :: <GtkShortcutController>;
  input parameter scope_ :: <GtkShortcutScope>;
  c-name: "gtk_shortcut_controller_set_scope";
end;

define C-struct <_GtkShortcutControllerClass>
  pointer-type-name: <GtkShortcutControllerClass>;
end C-struct;

define sealed domain make (singleton(<GtkShortcutControllerClass>));
define sealed domain initialize (<GtkShortcutControllerClass>);

define open C-subtype <GtkShortcutLabel> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkShortcutLabel*> => <GtkShortcutLabel>;

define sealed domain make (singleton(<GtkShortcutLabel*>));
define sealed domain initialize (<GtkShortcutLabel*>);

define inline-only C-function gtk-shortcut-label-new
  input parameter accelerator_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_shortcut_label_new";
end;

define inline-only C-function gtk-shortcut-label-get-accelerator
  input parameter self :: <GtkShortcutLabel>;
  result res :: <C-string>;
  c-name: "gtk_shortcut_label_get_accelerator";
end;

define inline-only C-function gtk-shortcut-label-get-disabled-text
  input parameter self :: <GtkShortcutLabel>;
  result res :: <C-string>;
  c-name: "gtk_shortcut_label_get_disabled_text";
end;

define inline-only C-function gtk-shortcut-label-set-accelerator
  input parameter self :: <GtkShortcutLabel>;
  input parameter accelerator_ :: <C-string>;
  c-name: "gtk_shortcut_label_set_accelerator";
end;

define inline-only C-function gtk-shortcut-label-set-disabled-text
  input parameter self :: <GtkShortcutLabel>;
  input parameter disabled_text_ :: <C-string>;
  c-name: "gtk_shortcut_label_set_disabled_text";
end;

define C-struct <_GtkShortcutLabelClass>
  pointer-type-name: <GtkShortcutLabelClass>;
end C-struct;

define sealed domain make (singleton(<GtkShortcutLabelClass>));
define sealed domain initialize (<GtkShortcutLabelClass>);

// Interface
define open C-subtype <GtkShortcutManager> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkShortcutManager*> => <GtkShortcutManager>;

define sealed domain make (singleton(<GtkShortcutManager*>));
define sealed domain initialize (<GtkShortcutManager*>);

define C-struct <_GtkShortcutManagerInterface>
  constant sealed inline-only slot gtk-shortcut-manager-interface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-shortcut-manager-interface-add-controller :: <C-function-pointer>;
  constant sealed inline-only slot gtk-shortcut-manager-interface-remove-controller :: <C-function-pointer>;
  pointer-type-name: <GtkShortcutManagerInterface>;
end C-struct;

define sealed domain make (singleton(<GtkShortcutManagerInterface>));
define sealed domain initialize (<GtkShortcutManagerInterface>);

define inline-only constant $gtk-shortcut-scope-local = 0;
define inline-only constant $gtk-shortcut-scope-managed = 1;
define inline-only constant $gtk-shortcut-scope-global = 2;
define constant <GtkShortcutScope> = <C-int>;
define C-pointer-type <GtkShortcutScope*> => <GtkShortcutScope>;

define open C-subtype <GtkShortcutTrigger> (<GObject>)
end C-subtype;

define C-pointer-type <GtkShortcutTrigger*> => <GtkShortcutTrigger>;

define sealed domain make (singleton(<GtkShortcutTrigger*>));
define sealed domain initialize (<GtkShortcutTrigger*>);

define inline-only C-function gtk-shortcut-trigger-parse-string
  input parameter string_ :: <C-string>;
  result res :: <GtkShortcutTrigger>;
  c-name: "gtk_shortcut_trigger_parse_string";
end;

define inline-only C-function gtk-shortcut-trigger-compare
  input parameter self :: <GtkShortcutTrigger>;
  input parameter trigger2_ :: <GtkShortcutTrigger>;
  result res :: <C-signed-int>;
  c-name: "gtk_shortcut_trigger_compare";
end;

define inline-only C-function gtk-shortcut-trigger-equal
  input parameter self :: <GtkShortcutTrigger>;
  input parameter trigger2_ :: <GtkShortcutTrigger>;
  result res :: <C-boolean>;
  c-name: "gtk_shortcut_trigger_equal";
end;

define inline-only C-function gtk-shortcut-trigger-hash
  input parameter self :: <GtkShortcutTrigger>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_shortcut_trigger_hash";
end;

define inline-only C-function gtk-shortcut-trigger-print
  input parameter self :: <GtkShortcutTrigger>;
  input parameter string_ :: <GString>;
  c-name: "gtk_shortcut_trigger_print";
end;

define inline-only C-function gtk-shortcut-trigger-print-label
  input parameter self :: <GtkShortcutTrigger>;
  input parameter display_ :: <GdkDisplay>;
  input parameter string_ :: <GString>;
  result res :: <C-boolean>;
  c-name: "gtk_shortcut_trigger_print_label";
end;

define inline-only C-function gtk-shortcut-trigger-to-label
  input parameter self :: <GtkShortcutTrigger>;
  input parameter display_ :: <GdkDisplay>;
  result res :: <C-string>;
  c-name: "gtk_shortcut_trigger_to_label";
end;

define inline-only C-function gtk-shortcut-trigger-to-string
  input parameter self :: <GtkShortcutTrigger>;
  result res :: <C-string>;
  c-name: "gtk_shortcut_trigger_to_string";
end;

define inline-only C-function gtk-shortcut-trigger-trigger
  input parameter self :: <GtkShortcutTrigger>;
  input parameter event_ :: <GdkEvent>;
  input parameter enable_mnemonics_ :: <C-boolean>;
  result res :: <GdkKeyMatch>;
  c-name: "gtk_shortcut_trigger_trigger";
end;

define C-struct <_GtkShortcutTriggerClass>
  pointer-type-name: <GtkShortcutTriggerClass>;
end C-struct;

define sealed domain make (singleton(<GtkShortcutTriggerClass>));
define sealed domain initialize (<GtkShortcutTriggerClass>);

define inline-only constant $gtk-shortcut-accelerator = 0;
define inline-only constant $gtk-shortcut-gesture-pinch = 1;
define inline-only constant $gtk-shortcut-gesture-stretch = 2;
define inline-only constant $gtk-shortcut-gesture-rotate-clockwise = 3;
define inline-only constant $gtk-shortcut-gesture-rotate-counterclockwise = 4;
define inline-only constant $gtk-shortcut-gesture-two-finger-swipe-left = 5;
define inline-only constant $gtk-shortcut-gesture-two-finger-swipe-right = 6;
define inline-only constant $gtk-shortcut-gesture = 7;
define inline-only constant $gtk-shortcut-gesture-swipe-left = 8;
define inline-only constant $gtk-shortcut-gesture-swipe-right = 9;
define constant <GtkShortcutType> = <C-int>;
define C-pointer-type <GtkShortcutType*> => <GtkShortcutType>;

define open C-subtype <GtkShortcutsGroup> (<GtkBox>)
end C-subtype;

define C-pointer-type <GtkShortcutsGroup*> => <GtkShortcutsGroup>;

define sealed domain make (singleton(<GtkShortcutsGroup*>));
define sealed domain initialize (<GtkShortcutsGroup*>);

define C-struct <_GtkShortcutsGroupClass>
  pointer-type-name: <GtkShortcutsGroupClass>;
end C-struct;

define sealed domain make (singleton(<GtkShortcutsGroupClass>));
define sealed domain initialize (<GtkShortcutsGroupClass>);

define open C-subtype <GtkShortcutsSection> (<GtkBox>)
end C-subtype;

define C-pointer-type <GtkShortcutsSection*> => <GtkShortcutsSection>;

define sealed domain make (singleton(<GtkShortcutsSection*>));
define sealed domain initialize (<GtkShortcutsSection*>);

define C-struct <_GtkShortcutsSectionClass>
  pointer-type-name: <GtkShortcutsSectionClass>;
end C-struct;

define sealed domain make (singleton(<GtkShortcutsSectionClass>));
define sealed domain initialize (<GtkShortcutsSectionClass>);

define open C-subtype <GtkShortcutsShortcut> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkShortcutsShortcut*> => <GtkShortcutsShortcut>;

define sealed domain make (singleton(<GtkShortcutsShortcut*>));
define sealed domain initialize (<GtkShortcutsShortcut*>);

define C-struct <_GtkShortcutsShortcutClass>
  pointer-type-name: <GtkShortcutsShortcutClass>;
end C-struct;

define sealed domain make (singleton(<GtkShortcutsShortcutClass>));
define sealed domain initialize (<GtkShortcutsShortcutClass>);

define open C-subtype <GtkShortcutsWindow> (<GtkWindow>)
end C-subtype;

define C-pointer-type <GtkShortcutsWindow*> => <GtkShortcutsWindow>;

define sealed domain make (singleton(<GtkShortcutsWindow*>));
define sealed domain initialize (<GtkShortcutsWindow*>);

define open C-subtype <GtkSignalAction> (<GtkShortcutAction>)
end C-subtype;

define C-pointer-type <GtkSignalAction*> => <GtkSignalAction>;

define sealed domain make (singleton(<GtkSignalAction*>));
define sealed domain initialize (<GtkSignalAction*>);

define inline-only C-function gtk-signal-action-new
  input parameter signal_name_ :: <C-string>;
  result res :: <GtkSignalAction>;
  c-name: "gtk_signal_action_new";
end;

define inline-only C-function gtk-signal-action-get-signal-name
  input parameter self :: <GtkSignalAction>;
  result res :: <C-string>;
  c-name: "gtk_signal_action_get_signal_name";
end;

define C-struct <_GtkSignalActionClass>
  pointer-type-name: <GtkSignalActionClass>;
end C-struct;

define sealed domain make (singleton(<GtkSignalActionClass>));
define sealed domain initialize (<GtkSignalActionClass>);

define open C-subtype <GtkSignalListItemFactory> (<GtkListItemFactory>)
end C-subtype;

define C-pointer-type <GtkSignalListItemFactory*> => <GtkSignalListItemFactory>;

define sealed domain make (singleton(<GtkSignalListItemFactory*>));
define sealed domain initialize (<GtkSignalListItemFactory*>);

define inline-only C-function gtk-signal-list-item-factory-new
  result res :: <GtkListItemFactory>;
  c-name: "gtk_signal_list_item_factory_new";
end;

define C-struct <_GtkSignalListItemFactoryClass>
  pointer-type-name: <GtkSignalListItemFactoryClass>;
end C-struct;

define sealed domain make (singleton(<GtkSignalListItemFactoryClass>));
define sealed domain initialize (<GtkSignalListItemFactoryClass>);

define open C-subtype <GtkSingleSelection> (<GObject>, <GtkSelectionModel>)
end C-subtype;

define C-pointer-type <GtkSingleSelection*> => <GtkSingleSelection>;

define sealed domain make (singleton(<GtkSingleSelection*>));
define sealed domain initialize (<GtkSingleSelection*>);

define inline-only C-function gtk-single-selection-new
  input parameter model_ :: <GListModel>;
  result res :: <GtkSingleSelection>;
  c-name: "gtk_single_selection_new";
end;

define inline-only C-function gtk-single-selection-get-autoselect
  input parameter self :: <GtkSingleSelection>;
  result res :: <C-boolean>;
  c-name: "gtk_single_selection_get_autoselect";
end;

define inline-only C-function gtk-single-selection-get-can-unselect
  input parameter self :: <GtkSingleSelection>;
  result res :: <C-boolean>;
  c-name: "gtk_single_selection_get_can_unselect";
end;

define inline-only C-function gtk-single-selection-get-model
  input parameter self :: <GtkSingleSelection>;
  result res :: <GListModel>;
  c-name: "gtk_single_selection_get_model";
end;

define inline-only C-function gtk-single-selection-get-selected
  input parameter self :: <GtkSingleSelection>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_single_selection_get_selected";
end;

define inline-only C-function gtk-single-selection-get-selected-item
  input parameter self :: <GtkSingleSelection>;
  result res :: <GObject>;
  c-name: "gtk_single_selection_get_selected_item";
end;

define inline-only C-function gtk-single-selection-set-autoselect
  input parameter self :: <GtkSingleSelection>;
  input parameter autoselect_ :: <C-boolean>;
  c-name: "gtk_single_selection_set_autoselect";
end;

define inline-only C-function gtk-single-selection-set-can-unselect
  input parameter self :: <GtkSingleSelection>;
  input parameter can_unselect_ :: <C-boolean>;
  c-name: "gtk_single_selection_set_can_unselect";
end;

define inline-only C-function gtk-single-selection-set-model
  input parameter self :: <GtkSingleSelection>;
  input parameter model_ :: <GListModel>;
  c-name: "gtk_single_selection_set_model";
end;

define inline-only C-function gtk-single-selection-set-selected
  input parameter self :: <GtkSingleSelection>;
  input parameter position_ :: <C-unsigned-int>;
  c-name: "gtk_single_selection_set_selected";
end;

define C-struct <_GtkSingleSelectionClass>
  constant sealed inline-only slot gtk-single-selection-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkSingleSelectionClass>;
end C-struct;

define sealed domain make (singleton(<GtkSingleSelectionClass>));
define sealed domain initialize (<GtkSingleSelectionClass>);

define open C-subtype <GtkSizeGroup> (<GObject>, <GtkBuildable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkSizeGroup*> => <GtkSizeGroup>;

define sealed domain make (singleton(<GtkSizeGroup*>));
define sealed domain initialize (<GtkSizeGroup*>);

define inline-only C-function gtk-size-group-new
  input parameter mode_ :: <GtkSizeGroupMode>;
  result res :: <GtkSizeGroup>;
  c-name: "gtk_size_group_new";
end;

define inline-only C-function gtk-size-group-add-widget
  input parameter self :: <GtkSizeGroup>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_size_group_add_widget";
end;

define inline-only C-function gtk-size-group-get-mode
  input parameter self :: <GtkSizeGroup>;
  result res :: <GtkSizeGroupMode>;
  c-name: "gtk_size_group_get_mode";
end;

define inline-only C-function gtk-size-group-get-widgets
  input parameter self :: <GtkSizeGroup>;
  result res :: <GSList>;
  c-name: "gtk_size_group_get_widgets";
end;

define inline-only C-function gtk-size-group-remove-widget
  input parameter self :: <GtkSizeGroup>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_size_group_remove_widget";
end;

define inline-only C-function gtk-size-group-set-mode
  input parameter self :: <GtkSizeGroup>;
  input parameter mode_ :: <GtkSizeGroupMode>;
  c-name: "gtk_size_group_set_mode";
end;

define inline-only constant $gtk-size-group-none = 0;
define inline-only constant $gtk-size-group-horizontal = 1;
define inline-only constant $gtk-size-group-vertical = 2;
define inline-only constant $gtk-size-group-both = 3;
define constant <GtkSizeGroupMode> = <C-int>;
define C-pointer-type <GtkSizeGroupMode*> => <GtkSizeGroupMode>;

define inline-only constant $gtk-size-request-height-for-width = 0;
define inline-only constant $gtk-size-request-width-for-height = 1;
define inline-only constant $gtk-size-request-constant-size = 2;
define constant <GtkSizeRequestMode> = <C-int>;
define C-pointer-type <GtkSizeRequestMode*> => <GtkSizeRequestMode>;

define open C-subtype <GtkSliceListModel> (<GObject>, <GListModel>)
end C-subtype;

define C-pointer-type <GtkSliceListModel*> => <GtkSliceListModel>;

define sealed domain make (singleton(<GtkSliceListModel*>));
define sealed domain initialize (<GtkSliceListModel*>);

define inline-only C-function gtk-slice-list-model-new
  input parameter model_ :: <GListModel>;
  input parameter offset_ :: <C-unsigned-int>;
  input parameter size_ :: <C-unsigned-int>;
  result res :: <GtkSliceListModel>;
  c-name: "gtk_slice_list_model_new";
end;

define inline-only C-function gtk-slice-list-model-get-model
  input parameter self :: <GtkSliceListModel>;
  result res :: <GListModel>;
  c-name: "gtk_slice_list_model_get_model";
end;

define inline-only C-function gtk-slice-list-model-get-offset
  input parameter self :: <GtkSliceListModel>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_slice_list_model_get_offset";
end;

define inline-only C-function gtk-slice-list-model-get-size
  input parameter self :: <GtkSliceListModel>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_slice_list_model_get_size";
end;

define inline-only C-function gtk-slice-list-model-set-model
  input parameter self :: <GtkSliceListModel>;
  input parameter model_ :: <GListModel>;
  c-name: "gtk_slice_list_model_set_model";
end;

define inline-only C-function gtk-slice-list-model-set-offset
  input parameter self :: <GtkSliceListModel>;
  input parameter offset_ :: <C-unsigned-int>;
  c-name: "gtk_slice_list_model_set_offset";
end;

define inline-only C-function gtk-slice-list-model-set-size
  input parameter self :: <GtkSliceListModel>;
  input parameter size_ :: <C-unsigned-int>;
  c-name: "gtk_slice_list_model_set_size";
end;

define C-struct <_GtkSliceListModelClass>
  constant sealed inline-only slot gtk-slice-list-model-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkSliceListModelClass>;
end C-struct;

define sealed domain make (singleton(<GtkSliceListModelClass>));
define sealed domain initialize (<GtkSliceListModelClass>);

define open C-subtype <GtkSnapshot> (<GdkSnapshot>)
end C-subtype;

define C-pointer-type <GtkSnapshot*> => <GtkSnapshot>;

define sealed domain make (singleton(<GtkSnapshot*>));
define sealed domain initialize (<GtkSnapshot*>);

define inline-only C-function gtk-snapshot-new
  result res :: <GtkSnapshot>;
  c-name: "gtk_snapshot_new";
end;

define inline-only C-function gtk-snapshot-append-border
  input parameter self :: <GtkSnapshot>;
  input parameter outline_ :: <GskRoundedRect>;
  input parameter border_width_ :: <C-float*>;
  input parameter border_color_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "gtk_snapshot_append_border";
end;

define inline-only C-function gtk-snapshot-append-cairo
  input parameter self :: <GtkSnapshot>;
  input parameter bounds_ :: <GrapheneRect>;
  result res :: <cairoContext>;
  c-name: "gtk_snapshot_append_cairo";
end;

define inline-only C-function gtk-snapshot-append-color
  input parameter self :: <GtkSnapshot>;
  input parameter color_ :: <GdkRGBA>;
  input parameter bounds_ :: <GrapheneRect>;
  c-name: "gtk_snapshot_append_color";
end;

define inline-only C-function gtk-snapshot-append-conic-gradient
  input parameter self :: <GtkSnapshot>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter center_ :: <GraphenePoint>;
  input parameter rotation_ :: <C-float>;
  input parameter stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_stops_ :: <C-unsigned-long>;
  c-name: "gtk_snapshot_append_conic_gradient";
end;

define inline-only C-function gtk-snapshot-append-inset-shadow
  input parameter self :: <GtkSnapshot>;
  input parameter outline_ :: <GskRoundedRect>;
  input parameter color_ :: <GdkRGBA>;
  input parameter dx_ :: <C-float>;
  input parameter dy_ :: <C-float>;
  input parameter spread_ :: <C-float>;
  input parameter blur_radius_ :: <C-float>;
  c-name: "gtk_snapshot_append_inset_shadow";
end;

define inline-only C-function gtk-snapshot-append-layout
  input parameter self :: <GtkSnapshot>;
  input parameter layout_ :: <PangoLayout>;
  input parameter color_ :: <GdkRGBA>;
  c-name: "gtk_snapshot_append_layout";
end;

define inline-only C-function gtk-snapshot-append-linear-gradient
  input parameter self :: <GtkSnapshot>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter start_point_ :: <GraphenePoint>;
  input parameter end_point_ :: <GraphenePoint>;
  input parameter stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_stops_ :: <C-unsigned-long>;
  c-name: "gtk_snapshot_append_linear_gradient";
end;

define inline-only C-function gtk-snapshot-append-node
  input parameter self :: <GtkSnapshot>;
  input parameter node_ :: <GskRenderNode>;
  c-name: "gtk_snapshot_append_node";
end;

define inline-only C-function gtk-snapshot-append-outset-shadow
  input parameter self :: <GtkSnapshot>;
  input parameter outline_ :: <GskRoundedRect>;
  input parameter color_ :: <GdkRGBA>;
  input parameter dx_ :: <C-float>;
  input parameter dy_ :: <C-float>;
  input parameter spread_ :: <C-float>;
  input parameter blur_radius_ :: <C-float>;
  c-name: "gtk_snapshot_append_outset_shadow";
end;

define inline-only C-function gtk-snapshot-append-radial-gradient
  input parameter self :: <GtkSnapshot>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter center_ :: <GraphenePoint>;
  input parameter hradius_ :: <C-float>;
  input parameter vradius_ :: <C-float>;
  input parameter start_ :: <C-float>;
  input parameter end_ :: <C-float>;
  input parameter stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_stops_ :: <C-unsigned-long>;
  c-name: "gtk_snapshot_append_radial_gradient";
end;

define inline-only C-function gtk-snapshot-append-repeating-linear-gradient
  input parameter self :: <GtkSnapshot>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter start_point_ :: <GraphenePoint>;
  input parameter end_point_ :: <GraphenePoint>;
  input parameter stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_stops_ :: <C-unsigned-long>;
  c-name: "gtk_snapshot_append_repeating_linear_gradient";
end;

define inline-only C-function gtk-snapshot-append-repeating-radial-gradient
  input parameter self :: <GtkSnapshot>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter center_ :: <GraphenePoint>;
  input parameter hradius_ :: <C-float>;
  input parameter vradius_ :: <C-float>;
  input parameter start_ :: <C-float>;
  input parameter end_ :: <C-float>;
  input parameter stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_stops_ :: <C-unsigned-long>;
  c-name: "gtk_snapshot_append_repeating_radial_gradient";
end;

define inline-only C-function gtk-snapshot-append-texture
  input parameter self :: <GtkSnapshot>;
  input parameter texture_ :: <GdkTexture>;
  input parameter bounds_ :: <GrapheneRect>;
  c-name: "gtk_snapshot_append_texture";
end;

define inline-only C-function gtk-snapshot-gl-shader-pop-texture
  input parameter self :: <GtkSnapshot>;
  c-name: "gtk_snapshot_gl_shader_pop_texture";
end;

define inline-only C-function gtk-snapshot-perspective
  input parameter self :: <GtkSnapshot>;
  input parameter depth_ :: <C-float>;
  c-name: "gtk_snapshot_perspective";
end;

define inline-only C-function gtk-snapshot-pop
  input parameter self :: <GtkSnapshot>;
  c-name: "gtk_snapshot_pop";
end;

define inline-only C-function gtk-snapshot-push-blend
  input parameter self :: <GtkSnapshot>;
  input parameter blend_mode_ :: <GskBlendMode>;
  c-name: "gtk_snapshot_push_blend";
end;

define inline-only C-function gtk-snapshot-push-blur
  input parameter self :: <GtkSnapshot>;
  input parameter radius_ :: <C-double>;
  c-name: "gtk_snapshot_push_blur";
end;

define inline-only C-function gtk-snapshot-push-clip
  input parameter self :: <GtkSnapshot>;
  input parameter bounds_ :: <GrapheneRect>;
  c-name: "gtk_snapshot_push_clip";
end;

define inline-only C-function gtk-snapshot-push-color-matrix
  input parameter self :: <GtkSnapshot>;
  input parameter color_matrix_ :: <GrapheneMatrix>;
  input parameter color_offset_ :: <GrapheneVec4>;
  c-name: "gtk_snapshot_push_color_matrix";
end;

define inline-only C-function gtk-snapshot-push-cross-fade
  input parameter self :: <GtkSnapshot>;
  input parameter progress_ :: <C-double>;
  c-name: "gtk_snapshot_push_cross_fade";
end;

define inline-only C-function gtk-snapshot-push-gl-shader
  input parameter self :: <GtkSnapshot>;
  input parameter shader_ :: <GskGLShader>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter take_args_ :: <GBytes>;
  c-name: "gtk_snapshot_push_gl_shader";
end;

define inline-only C-function gtk-snapshot-push-opacity
  input parameter self :: <GtkSnapshot>;
  input parameter opacity_ :: <C-double>;
  c-name: "gtk_snapshot_push_opacity";
end;

define inline-only C-function gtk-snapshot-push-repeat
  input parameter self :: <GtkSnapshot>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter child_bounds_ :: <GrapheneRect>;
  c-name: "gtk_snapshot_push_repeat";
end;

define inline-only C-function gtk-snapshot-push-rounded-clip
  input parameter self :: <GtkSnapshot>;
  input parameter bounds_ :: <GskRoundedRect>;
  c-name: "gtk_snapshot_push_rounded_clip";
end;

define inline-only C-function gtk-snapshot-push-shadow
  input parameter self :: <GtkSnapshot>;
  input parameter shadow_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_shadows_ :: <C-unsigned-long>;
  c-name: "gtk_snapshot_push_shadow";
end;

define inline-only C-function gtk-snapshot-render-background
  input parameter self :: <GtkSnapshot>;
  input parameter context_ :: <GtkStyleContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_snapshot_render_background";
end;

define inline-only C-function gtk-snapshot-render-focus
  input parameter self :: <GtkSnapshot>;
  input parameter context_ :: <GtkStyleContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_snapshot_render_focus";
end;

define inline-only C-function gtk-snapshot-render-frame
  input parameter self :: <GtkSnapshot>;
  input parameter context_ :: <GtkStyleContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_snapshot_render_frame";
end;

define inline-only C-function gtk-snapshot-render-insertion-cursor
  input parameter self :: <GtkSnapshot>;
  input parameter context_ :: <GtkStyleContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter layout_ :: <PangoLayout>;
  input parameter index_ :: <C-signed-int>;
  input parameter direction_ :: <PangoDirection>;
  c-name: "gtk_snapshot_render_insertion_cursor";
end;

define inline-only C-function gtk-snapshot-render-layout
  input parameter self :: <GtkSnapshot>;
  input parameter context_ :: <GtkStyleContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter layout_ :: <PangoLayout>;
  c-name: "gtk_snapshot_render_layout";
end;

define inline-only C-function gtk-snapshot-restore
  input parameter self :: <GtkSnapshot>;
  c-name: "gtk_snapshot_restore";
end;

define inline-only C-function gtk-snapshot-rotate
  input parameter self :: <GtkSnapshot>;
  input parameter angle_ :: <C-float>;
  c-name: "gtk_snapshot_rotate";
end;

define inline-only C-function gtk-snapshot-rotate-3d
  input parameter self :: <GtkSnapshot>;
  input parameter angle_ :: <C-float>;
  input parameter axis_ :: <GrapheneVec3>;
  c-name: "gtk_snapshot_rotate_3d";
end;

define inline-only C-function gtk-snapshot-save
  input parameter self :: <GtkSnapshot>;
  c-name: "gtk_snapshot_save";
end;

define inline-only C-function gtk-snapshot-scale
  input parameter self :: <GtkSnapshot>;
  input parameter factor_x_ :: <C-float>;
  input parameter factor_y_ :: <C-float>;
  c-name: "gtk_snapshot_scale";
end;

define inline-only C-function gtk-snapshot-scale-3d
  input parameter self :: <GtkSnapshot>;
  input parameter factor_x_ :: <C-float>;
  input parameter factor_y_ :: <C-float>;
  input parameter factor_z_ :: <C-float>;
  c-name: "gtk_snapshot_scale_3d";
end;

define inline-only C-function gtk-snapshot-to-node
  input parameter self :: <GtkSnapshot>;
  result res :: <GskRenderNode>;
  c-name: "gtk_snapshot_to_node";
end;

define inline-only C-function gtk-snapshot-to-paintable
  input parameter self :: <GtkSnapshot>;
  input parameter size_ :: <GrapheneSize>;
  result res :: <GdkPaintable>;
  c-name: "gtk_snapshot_to_paintable";
end;

define inline-only C-function gtk-snapshot-transform
  input parameter self :: <GtkSnapshot>;
  input parameter transform_ :: <GskTransform>;
  c-name: "gtk_snapshot_transform";
end;

define inline-only C-function gtk-snapshot-transform-matrix
  input parameter self :: <GtkSnapshot>;
  input parameter matrix_ :: <GrapheneMatrix>;
  c-name: "gtk_snapshot_transform_matrix";
end;

define inline-only C-function gtk-snapshot-translate
  input parameter self :: <GtkSnapshot>;
  input parameter point_ :: <GraphenePoint>;
  c-name: "gtk_snapshot_translate";
end;

define inline-only C-function gtk-snapshot-translate-3d
  input parameter self :: <GtkSnapshot>;
  input parameter point_ :: <GraphenePoint3D>;
  c-name: "gtk_snapshot_translate_3d";
end;

define C-struct <_GtkSnapshotClass>
  pointer-type-name: <GtkSnapshotClass>;
end C-struct;

define sealed domain make (singleton(<GtkSnapshotClass>));
define sealed domain initialize (<GtkSnapshotClass>);

define open C-subtype <GtkSortListModel> (<GObject>, <GListModel>)
end C-subtype;

define C-pointer-type <GtkSortListModel*> => <GtkSortListModel>;

define sealed domain make (singleton(<GtkSortListModel*>));
define sealed domain initialize (<GtkSortListModel*>);

define inline-only C-function gtk-sort-list-model-new
  input parameter model_ :: <GListModel>;
  input parameter sorter_ :: <GtkSorter>;
  result res :: <GtkSortListModel>;
  c-name: "gtk_sort_list_model_new";
end;

define inline-only C-function gtk-sort-list-model-get-incremental
  input parameter self :: <GtkSortListModel>;
  result res :: <C-boolean>;
  c-name: "gtk_sort_list_model_get_incremental";
end;

define inline-only C-function gtk-sort-list-model-get-model
  input parameter self :: <GtkSortListModel>;
  result res :: <GListModel>;
  c-name: "gtk_sort_list_model_get_model";
end;

define inline-only C-function gtk-sort-list-model-get-pending
  input parameter self :: <GtkSortListModel>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_sort_list_model_get_pending";
end;

define inline-only C-function gtk-sort-list-model-get-sorter
  input parameter self :: <GtkSortListModel>;
  result res :: <GtkSorter>;
  c-name: "gtk_sort_list_model_get_sorter";
end;

define inline-only C-function gtk-sort-list-model-set-incremental
  input parameter self :: <GtkSortListModel>;
  input parameter incremental_ :: <C-boolean>;
  c-name: "gtk_sort_list_model_set_incremental";
end;

define inline-only C-function gtk-sort-list-model-set-model
  input parameter self :: <GtkSortListModel>;
  input parameter model_ :: <GListModel>;
  c-name: "gtk_sort_list_model_set_model";
end;

define inline-only C-function gtk-sort-list-model-set-sorter
  input parameter self :: <GtkSortListModel>;
  input parameter sorter_ :: <GtkSorter>;
  c-name: "gtk_sort_list_model_set_sorter";
end;

define C-struct <_GtkSortListModelClass>
  constant sealed inline-only slot gtk-sort-list-model-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkSortListModelClass>;
end C-struct;

define sealed domain make (singleton(<GtkSortListModelClass>));
define sealed domain initialize (<GtkSortListModelClass>);

define inline-only constant $gtk-sort-ascending = 0;
define inline-only constant $gtk-sort-descending = 1;
define constant <GtkSortType> = <C-int>;
define C-pointer-type <GtkSortType*> => <GtkSortType>;

define open C-subtype <GtkSorter> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkSorter*> => <GtkSorter>;

define sealed domain make (singleton(<GtkSorter*>));
define sealed domain initialize (<GtkSorter*>);

define inline-only C-function gtk-sorter-changed
  input parameter self :: <GtkSorter>;
  input parameter change_ :: <GtkSorterChange>;
  c-name: "gtk_sorter_changed";
end;

define inline-only C-function gtk-sorter-compare
  input parameter self :: <GtkSorter>;
  input parameter item1_ :: <GObject>;
  input parameter item2_ :: <GObject>;
  result res :: <GtkOrdering>;
  c-name: "gtk_sorter_compare";
end;

define inline-only C-function gtk-sorter-get-order
  input parameter self :: <GtkSorter>;
  result res :: <GtkSorterOrder>;
  c-name: "gtk_sorter_get_order";
end;

define inline-only constant $gtk-sorter-change-different = 0;
define inline-only constant $gtk-sorter-change-inverted = 1;
define inline-only constant $gtk-sorter-change-less-strict = 2;
define inline-only constant $gtk-sorter-change-more-strict = 3;
define constant <GtkSorterChange> = <C-int>;
define C-pointer-type <GtkSorterChange*> => <GtkSorterChange>;

define C-struct <_GtkSorterClass>
  constant sealed inline-only slot gtk-sorter-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-sorter-class-compare :: <C-function-pointer>;
  constant sealed inline-only slot gtk-sorter-class-get-order :: <C-function-pointer>;
  constant sealed inline-only slot gtk-sorter-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-sorter-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-sorter-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-sorter-class-_gtk-reserved4 :: <C-void*>;
  constant sealed inline-only slot gtk-sorter-class-_gtk-reserved5 :: <C-void*>;
  constant sealed inline-only slot gtk-sorter-class-_gtk-reserved6 :: <C-void*>;
  constant sealed inline-only slot gtk-sorter-class-_gtk-reserved7 :: <C-void*>;
  constant sealed inline-only slot gtk-sorter-class-_gtk-reserved8 :: <C-void*>;
  pointer-type-name: <GtkSorterClass>;
end C-struct;

define sealed domain make (singleton(<GtkSorterClass>));
define sealed domain initialize (<GtkSorterClass>);

define inline-only constant $gtk-sorter-order-partial = 0;
define inline-only constant $gtk-sorter-order-none = 1;
define inline-only constant $gtk-sorter-order-total = 2;
define constant <GtkSorterOrder> = <C-int>;
define C-pointer-type <GtkSorterOrder*> => <GtkSorterOrder>;

define open C-subtype <GtkSpinButton> (<GtkCellEditable>, <GtkEditable>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkSpinButton*> => <GtkSpinButton>;

define sealed domain make (singleton(<GtkSpinButton*>));
define sealed domain initialize (<GtkSpinButton*>);

define inline-only C-function gtk-spin-button-new
  input parameter adjustment_ :: <GtkAdjustment>;
  input parameter climb_rate_ :: <C-double>;
  input parameter digits_ :: <C-unsigned-int>;
  result res :: <GtkWidget>;
  c-name: "gtk_spin_button_new";
end;

define inline-only C-function gtk-spin-button-new-with-range
  input parameter min_ :: <C-double>;
  input parameter max_ :: <C-double>;
  input parameter step_ :: <C-double>;
  result res :: <GtkWidget>;
  c-name: "gtk_spin_button_new_with_range";
end;

define inline-only C-function gtk-spin-button-configure
  input parameter self :: <GtkSpinButton>;
  input parameter adjustment_ :: <GtkAdjustment>;
  input parameter climb_rate_ :: <C-double>;
  input parameter digits_ :: <C-unsigned-int>;
  c-name: "gtk_spin_button_configure";
end;

define inline-only C-function gtk-spin-button-get-adjustment
  input parameter self :: <GtkSpinButton>;
  result res :: <GtkAdjustment>;
  c-name: "gtk_spin_button_get_adjustment";
end;

define inline-only C-function gtk-spin-button-get-climb-rate
  input parameter self :: <GtkSpinButton>;
  result res :: <C-double>;
  c-name: "gtk_spin_button_get_climb_rate";
end;

define inline-only C-function gtk-spin-button-get-digits
  input parameter self :: <GtkSpinButton>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_spin_button_get_digits";
end;

define inline-only C-function gtk-spin-button-get-increments
  input parameter self :: <GtkSpinButton>;
  output parameter step_ :: <C-double*>;
  output parameter page_ :: <C-double*>;
  c-name: "gtk_spin_button_get_increments";
end;

define inline-only C-function gtk-spin-button-get-numeric
  input parameter self :: <GtkSpinButton>;
  result res :: <C-boolean>;
  c-name: "gtk_spin_button_get_numeric";
end;

define inline-only C-function gtk-spin-button-get-range
  input parameter self :: <GtkSpinButton>;
  output parameter min_ :: <C-double*>;
  output parameter max_ :: <C-double*>;
  c-name: "gtk_spin_button_get_range";
end;

define inline-only C-function gtk-spin-button-get-snap-to-ticks
  input parameter self :: <GtkSpinButton>;
  result res :: <C-boolean>;
  c-name: "gtk_spin_button_get_snap_to_ticks";
end;

define inline-only C-function gtk-spin-button-get-update-policy
  input parameter self :: <GtkSpinButton>;
  result res :: <GtkSpinButtonUpdatePolicy>;
  c-name: "gtk_spin_button_get_update_policy";
end;

define inline-only C-function gtk-spin-button-get-value
  input parameter self :: <GtkSpinButton>;
  result res :: <C-double>;
  c-name: "gtk_spin_button_get_value";
end;

define inline-only C-function gtk-spin-button-get-value-as-int
  input parameter self :: <GtkSpinButton>;
  result res :: <C-signed-int>;
  c-name: "gtk_spin_button_get_value_as_int";
end;

define inline-only C-function gtk-spin-button-get-wrap
  input parameter self :: <GtkSpinButton>;
  result res :: <C-boolean>;
  c-name: "gtk_spin_button_get_wrap";
end;

define inline-only C-function gtk-spin-button-set-adjustment
  input parameter self :: <GtkSpinButton>;
  input parameter adjustment_ :: <GtkAdjustment>;
  c-name: "gtk_spin_button_set_adjustment";
end;

define inline-only C-function gtk-spin-button-set-climb-rate
  input parameter self :: <GtkSpinButton>;
  input parameter climb_rate_ :: <C-double>;
  c-name: "gtk_spin_button_set_climb_rate";
end;

define inline-only C-function gtk-spin-button-set-digits
  input parameter self :: <GtkSpinButton>;
  input parameter digits_ :: <C-unsigned-int>;
  c-name: "gtk_spin_button_set_digits";
end;

define inline-only C-function gtk-spin-button-set-increments
  input parameter self :: <GtkSpinButton>;
  input parameter step_ :: <C-double>;
  input parameter page_ :: <C-double>;
  c-name: "gtk_spin_button_set_increments";
end;

define inline-only C-function gtk-spin-button-set-numeric
  input parameter self :: <GtkSpinButton>;
  input parameter numeric_ :: <C-boolean>;
  c-name: "gtk_spin_button_set_numeric";
end;

define inline-only C-function gtk-spin-button-set-range
  input parameter self :: <GtkSpinButton>;
  input parameter min_ :: <C-double>;
  input parameter max_ :: <C-double>;
  c-name: "gtk_spin_button_set_range";
end;

define inline-only C-function gtk-spin-button-set-snap-to-ticks
  input parameter self :: <GtkSpinButton>;
  input parameter snap_to_ticks_ :: <C-boolean>;
  c-name: "gtk_spin_button_set_snap_to_ticks";
end;

define inline-only C-function gtk-spin-button-set-update-policy
  input parameter self :: <GtkSpinButton>;
  input parameter policy_ :: <GtkSpinButtonUpdatePolicy>;
  c-name: "gtk_spin_button_set_update_policy";
end;

define inline-only C-function gtk-spin-button-set-value
  input parameter self :: <GtkSpinButton>;
  input parameter value_ :: <C-double>;
  c-name: "gtk_spin_button_set_value";
end;

define inline-only C-function gtk-spin-button-set-wrap
  input parameter self :: <GtkSpinButton>;
  input parameter wrap_ :: <C-boolean>;
  c-name: "gtk_spin_button_set_wrap";
end;

define inline-only C-function gtk-spin-button-spin
  input parameter self :: <GtkSpinButton>;
  input parameter direction_ :: <GtkSpinType>;
  input parameter increment_ :: <C-double>;
  c-name: "gtk_spin_button_spin";
end;

define inline-only C-function gtk-spin-button-update
  input parameter self :: <GtkSpinButton>;
  c-name: "gtk_spin_button_update";
end;

define inline-only constant $gtk-update-always = 0;
define inline-only constant $gtk-update-if-valid = 1;
define constant <GtkSpinButtonUpdatePolicy> = <C-int>;
define C-pointer-type <GtkSpinButtonUpdatePolicy*> => <GtkSpinButtonUpdatePolicy>;

define inline-only constant $gtk-spin-step-forward = 0;
define inline-only constant $gtk-spin-step-backward = 1;
define inline-only constant $gtk-spin-page-forward = 2;
define inline-only constant $gtk-spin-page-backward = 3;
define inline-only constant $gtk-spin-home = 4;
define inline-only constant $gtk-spin-end = 5;
define inline-only constant $gtk-spin-user-defined = 6;
define constant <GtkSpinType> = <C-int>;
define C-pointer-type <GtkSpinType*> => <GtkSpinType>;

define open C-subtype <GtkSpinner> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkSpinner*> => <GtkSpinner>;

define sealed domain make (singleton(<GtkSpinner*>));
define sealed domain initialize (<GtkSpinner*>);

define inline-only C-function gtk-spinner-new
  result res :: <GtkWidget>;
  c-name: "gtk_spinner_new";
end;

define inline-only C-function gtk-spinner-get-spinning
  input parameter self :: <GtkSpinner>;
  result res :: <C-boolean>;
  c-name: "gtk_spinner_get_spinning";
end;

define inline-only C-function gtk-spinner-set-spinning
  input parameter self :: <GtkSpinner>;
  input parameter spinning_ :: <C-boolean>;
  c-name: "gtk_spinner_set_spinning";
end;

define inline-only C-function gtk-spinner-start
  input parameter self :: <GtkSpinner>;
  c-name: "gtk_spinner_start";
end;

define inline-only C-function gtk-spinner-stop
  input parameter self :: <GtkSpinner>;
  c-name: "gtk_spinner_stop";
end;

define open C-subtype <GtkStack> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkStack*> => <GtkStack>;

define sealed domain make (singleton(<GtkStack*>));
define sealed domain initialize (<GtkStack*>);

define inline-only C-function gtk-stack-new
  result res :: <GtkWidget>;
  c-name: "gtk_stack_new";
end;

define inline-only C-function gtk-stack-add-child
  input parameter self :: <GtkStack>;
  input parameter child_ :: <GtkWidget>;
  result res :: <GtkStackPage>;
  c-name: "gtk_stack_add_child";
end;

define inline-only C-function gtk-stack-add-named
  input parameter self :: <GtkStack>;
  input parameter child_ :: <GtkWidget>;
  input parameter name_ :: <C-string>;
  result res :: <GtkStackPage>;
  c-name: "gtk_stack_add_named";
end;

define inline-only C-function gtk-stack-add-titled
  input parameter self :: <GtkStack>;
  input parameter child_ :: <GtkWidget>;
  input parameter name_ :: <C-string>;
  input parameter title_ :: <C-string>;
  result res :: <GtkStackPage>;
  c-name: "gtk_stack_add_titled";
end;

define inline-only C-function gtk-stack-get-child-by-name
  input parameter self :: <GtkStack>;
  input parameter name_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_stack_get_child_by_name";
end;

define inline-only C-function gtk-stack-get-hhomogeneous
  input parameter self :: <GtkStack>;
  result res :: <C-boolean>;
  c-name: "gtk_stack_get_hhomogeneous";
end;

define inline-only C-function gtk-stack-get-interpolate-size
  input parameter self :: <GtkStack>;
  result res :: <C-boolean>;
  c-name: "gtk_stack_get_interpolate_size";
end;

define inline-only C-function gtk-stack-get-page
  input parameter self :: <GtkStack>;
  input parameter child_ :: <GtkWidget>;
  result res :: <GtkStackPage>;
  c-name: "gtk_stack_get_page";
end;

define inline-only C-function gtk-stack-get-pages
  input parameter self :: <GtkStack>;
  result res :: <GtkSelectionModel>;
  c-name: "gtk_stack_get_pages";
end;

define inline-only C-function gtk-stack-get-transition-duration
  input parameter self :: <GtkStack>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_stack_get_transition_duration";
end;

define inline-only C-function gtk-stack-get-transition-running
  input parameter self :: <GtkStack>;
  result res :: <C-boolean>;
  c-name: "gtk_stack_get_transition_running";
end;

define inline-only C-function gtk-stack-get-transition-type
  input parameter self :: <GtkStack>;
  result res :: <GtkStackTransitionType>;
  c-name: "gtk_stack_get_transition_type";
end;

define inline-only C-function gtk-stack-get-vhomogeneous
  input parameter self :: <GtkStack>;
  result res :: <C-boolean>;
  c-name: "gtk_stack_get_vhomogeneous";
end;

define inline-only C-function gtk-stack-get-visible-child
  input parameter self :: <GtkStack>;
  result res :: <GtkWidget>;
  c-name: "gtk_stack_get_visible_child";
end;

define inline-only C-function gtk-stack-get-visible-child-name
  input parameter self :: <GtkStack>;
  result res :: <C-string>;
  c-name: "gtk_stack_get_visible_child_name";
end;

define inline-only C-function gtk-stack-remove
  input parameter self :: <GtkStack>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_stack_remove";
end;

define inline-only C-function gtk-stack-set-hhomogeneous
  input parameter self :: <GtkStack>;
  input parameter hhomogeneous_ :: <C-boolean>;
  c-name: "gtk_stack_set_hhomogeneous";
end;

define inline-only C-function gtk-stack-set-interpolate-size
  input parameter self :: <GtkStack>;
  input parameter interpolate_size_ :: <C-boolean>;
  c-name: "gtk_stack_set_interpolate_size";
end;

define inline-only C-function gtk-stack-set-transition-duration
  input parameter self :: <GtkStack>;
  input parameter duration_ :: <C-unsigned-int>;
  c-name: "gtk_stack_set_transition_duration";
end;

define inline-only C-function gtk-stack-set-transition-type
  input parameter self :: <GtkStack>;
  input parameter transition_ :: <GtkStackTransitionType>;
  c-name: "gtk_stack_set_transition_type";
end;

define inline-only C-function gtk-stack-set-vhomogeneous
  input parameter self :: <GtkStack>;
  input parameter vhomogeneous_ :: <C-boolean>;
  c-name: "gtk_stack_set_vhomogeneous";
end;

define inline-only C-function gtk-stack-set-visible-child
  input parameter self :: <GtkStack>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_stack_set_visible_child";
end;

define inline-only C-function gtk-stack-set-visible-child-full
  input parameter self :: <GtkStack>;
  input parameter name_ :: <C-string>;
  input parameter transition_ :: <GtkStackTransitionType>;
  c-name: "gtk_stack_set_visible_child_full";
end;

define inline-only C-function gtk-stack-set-visible-child-name
  input parameter self :: <GtkStack>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_stack_set_visible_child_name";
end;

define open C-subtype <GtkStackPage> (<GObject>, <GtkAccessible>)
end C-subtype;

define C-pointer-type <GtkStackPage*> => <GtkStackPage>;

define sealed domain make (singleton(<GtkStackPage*>));
define sealed domain initialize (<GtkStackPage*>);

define inline-only C-function gtk-stack-page-get-child
  input parameter self :: <GtkStackPage>;
  result res :: <GtkWidget>;
  c-name: "gtk_stack_page_get_child";
end;

define inline-only C-function gtk-stack-page-get-icon-name
  input parameter self :: <GtkStackPage>;
  result res :: <C-string>;
  c-name: "gtk_stack_page_get_icon_name";
end;

define inline-only C-function gtk-stack-page-get-name
  input parameter self :: <GtkStackPage>;
  result res :: <C-string>;
  c-name: "gtk_stack_page_get_name";
end;

define inline-only C-function gtk-stack-page-get-needs-attention
  input parameter self :: <GtkStackPage>;
  result res :: <C-boolean>;
  c-name: "gtk_stack_page_get_needs_attention";
end;

define inline-only C-function gtk-stack-page-get-title
  input parameter self :: <GtkStackPage>;
  result res :: <C-string>;
  c-name: "gtk_stack_page_get_title";
end;

define inline-only C-function gtk-stack-page-get-use-underline
  input parameter self :: <GtkStackPage>;
  result res :: <C-boolean>;
  c-name: "gtk_stack_page_get_use_underline";
end;

define inline-only C-function gtk-stack-page-get-visible
  input parameter self :: <GtkStackPage>;
  result res :: <C-boolean>;
  c-name: "gtk_stack_page_get_visible";
end;

define inline-only C-function gtk-stack-page-set-icon-name
  input parameter self :: <GtkStackPage>;
  input parameter setting_ :: <C-string>;
  c-name: "gtk_stack_page_set_icon_name";
end;

define inline-only C-function gtk-stack-page-set-name
  input parameter self :: <GtkStackPage>;
  input parameter setting_ :: <C-string>;
  c-name: "gtk_stack_page_set_name";
end;

define inline-only C-function gtk-stack-page-set-needs-attention
  input parameter self :: <GtkStackPage>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_stack_page_set_needs_attention";
end;

define inline-only C-function gtk-stack-page-set-title
  input parameter self :: <GtkStackPage>;
  input parameter setting_ :: <C-string>;
  c-name: "gtk_stack_page_set_title";
end;

define inline-only C-function gtk-stack-page-set-use-underline
  input parameter self :: <GtkStackPage>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_stack_page_set_use_underline";
end;

define inline-only C-function gtk-stack-page-set-visible
  input parameter self :: <GtkStackPage>;
  input parameter visible_ :: <C-boolean>;
  c-name: "gtk_stack_page_set_visible";
end;

define open C-subtype <GtkStackSidebar> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkStackSidebar*> => <GtkStackSidebar>;

define sealed domain make (singleton(<GtkStackSidebar*>));
define sealed domain initialize (<GtkStackSidebar*>);

define inline-only C-function gtk-stack-sidebar-new
  result res :: <GtkWidget>;
  c-name: "gtk_stack_sidebar_new";
end;

define inline-only C-function gtk-stack-sidebar-get-stack
  input parameter self :: <GtkStackSidebar>;
  result res :: <GtkStack>;
  c-name: "gtk_stack_sidebar_get_stack";
end;

define inline-only C-function gtk-stack-sidebar-set-stack
  input parameter self :: <GtkStackSidebar>;
  input parameter stack_ :: <GtkStack>;
  c-name: "gtk_stack_sidebar_set_stack";
end;

define open C-subtype <GtkStackSwitcher> (<GtkWidget>, <GtkOrientable>)
end C-subtype;

define C-pointer-type <GtkStackSwitcher*> => <GtkStackSwitcher>;

define sealed domain make (singleton(<GtkStackSwitcher*>));
define sealed domain initialize (<GtkStackSwitcher*>);

define inline-only C-function gtk-stack-switcher-new
  result res :: <GtkWidget>;
  c-name: "gtk_stack_switcher_new";
end;

define inline-only C-function gtk-stack-switcher-get-stack
  input parameter self :: <GtkStackSwitcher>;
  result res :: <GtkStack>;
  c-name: "gtk_stack_switcher_get_stack";
end;

define inline-only C-function gtk-stack-switcher-set-stack
  input parameter self :: <GtkStackSwitcher>;
  input parameter stack_ :: <GtkStack>;
  c-name: "gtk_stack_switcher_set_stack";
end;

define inline-only constant $gtk-stack-transition-type-none = 0;
define inline-only constant $gtk-stack-transition-type-crossfade = 1;
define inline-only constant $gtk-stack-transition-type-slide-right = 2;
define inline-only constant $gtk-stack-transition-type-slide-left = 3;
define inline-only constant $gtk-stack-transition-type-slide-up = 4;
define inline-only constant $gtk-stack-transition-type-slide-down = 5;
define inline-only constant $gtk-stack-transition-type-slide-left-right = 6;
define inline-only constant $gtk-stack-transition-type-slide-up-down = 7;
define inline-only constant $gtk-stack-transition-type-over-up = 8;
define inline-only constant $gtk-stack-transition-type-over-down = 9;
define inline-only constant $gtk-stack-transition-type-over-left = 10;
define inline-only constant $gtk-stack-transition-type-over-right = 11;
define inline-only constant $gtk-stack-transition-type-under-up = 12;
define inline-only constant $gtk-stack-transition-type-under-down = 13;
define inline-only constant $gtk-stack-transition-type-under-left = 14;
define inline-only constant $gtk-stack-transition-type-under-right = 15;
define inline-only constant $gtk-stack-transition-type-over-up-down = 16;
define inline-only constant $gtk-stack-transition-type-over-down-up = 17;
define inline-only constant $gtk-stack-transition-type-over-left-right = 18;
define inline-only constant $gtk-stack-transition-type-over-right-left = 19;
define inline-only constant $gtk-stack-transition-type-rotate-left = 20;
define inline-only constant $gtk-stack-transition-type-rotate-right = 21;
define inline-only constant $gtk-stack-transition-type-rotate-left-right = 22;
define constant <GtkStackTransitionType> = <C-int>;
define C-pointer-type <GtkStackTransitionType*> => <GtkStackTransitionType>;

define inline-only constant $gtk-state-flag-normal = 0;
define inline-only constant $gtk-state-flag-active = 1;
define inline-only constant $gtk-state-flag-prelight = 2;
define inline-only constant $gtk-state-flag-selected = 4;
define inline-only constant $gtk-state-flag-insensitive = 8;
define inline-only constant $gtk-state-flag-inconsistent = 16;
define inline-only constant $gtk-state-flag-focused = 32;
define inline-only constant $gtk-state-flag-backdrop = 64;
define inline-only constant $gtk-state-flag-dir-ltr = 128;
define inline-only constant $gtk-state-flag-dir-rtl = 256;
define inline-only constant $gtk-state-flag-link = 512;
define inline-only constant $gtk-state-flag-visited = 1024;
define inline-only constant $gtk-state-flag-checked = 2048;
define inline-only constant $gtk-state-flag-drop-active = 4096;
define inline-only constant $gtk-state-flag-focus-visible = 8192;
define inline-only constant $gtk-state-flag-focus-within = 16384;
define constant <GtkStateFlags> = <C-int>;
define C-pointer-type <GtkStateFlags*> => <GtkStateFlags>;

define open C-subtype <GtkStatusbar> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkStatusbar*> => <GtkStatusbar>;

define sealed domain make (singleton(<GtkStatusbar*>));
define sealed domain initialize (<GtkStatusbar*>);

define inline-only C-function gtk-statusbar-new
  result res :: <GtkWidget>;
  c-name: "gtk_statusbar_new";
end;

define inline-only C-function gtk-statusbar-get-context-id
  input parameter self :: <GtkStatusbar>;
  input parameter context_description_ :: <C-string>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_statusbar_get_context_id";
end;

define inline-only C-function gtk-statusbar-pop
  input parameter self :: <GtkStatusbar>;
  input parameter context_id_ :: <C-unsigned-int>;
  c-name: "gtk_statusbar_pop";
end;

define inline-only C-function gtk-statusbar-push
  input parameter self :: <GtkStatusbar>;
  input parameter context_id_ :: <C-unsigned-int>;
  input parameter text_ :: <C-string>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_statusbar_push";
end;

define inline-only C-function gtk-statusbar-remove
  input parameter self :: <GtkStatusbar>;
  input parameter context_id_ :: <C-unsigned-int>;
  input parameter message_id_ :: <C-unsigned-int>;
  c-name: "gtk_statusbar_remove";
end;

define inline-only C-function gtk-statusbar-remove-all
  input parameter self :: <GtkStatusbar>;
  input parameter context_id_ :: <C-unsigned-int>;
  c-name: "gtk_statusbar_remove_all";
end;

define open C-subtype <GtkStringFilter> (<GtkFilter>)
end C-subtype;

define C-pointer-type <GtkStringFilter*> => <GtkStringFilter>;

define sealed domain make (singleton(<GtkStringFilter*>));
define sealed domain initialize (<GtkStringFilter*>);

define inline-only C-function gtk-string-filter-new
  input parameter expression_ :: <GtkExpression>;
  result res :: <GtkStringFilter>;
  c-name: "gtk_string_filter_new";
end;

define inline-only C-function gtk-string-filter-get-expression
  input parameter self :: <GtkStringFilter>;
  result res :: <GtkExpression>;
  c-name: "gtk_string_filter_get_expression";
end;

define inline-only C-function gtk-string-filter-get-ignore-case
  input parameter self :: <GtkStringFilter>;
  result res :: <C-boolean>;
  c-name: "gtk_string_filter_get_ignore_case";
end;

define inline-only C-function gtk-string-filter-get-match-mode
  input parameter self :: <GtkStringFilter>;
  result res :: <GtkStringFilterMatchMode>;
  c-name: "gtk_string_filter_get_match_mode";
end;

define inline-only C-function gtk-string-filter-get-search
  input parameter self :: <GtkStringFilter>;
  result res :: <C-string>;
  c-name: "gtk_string_filter_get_search";
end;

define inline-only C-function gtk-string-filter-set-expression
  input parameter self :: <GtkStringFilter>;
  input parameter expression_ :: <GtkExpression>;
  c-name: "gtk_string_filter_set_expression";
end;

define inline-only C-function gtk-string-filter-set-ignore-case
  input parameter self :: <GtkStringFilter>;
  input parameter ignore_case_ :: <C-boolean>;
  c-name: "gtk_string_filter_set_ignore_case";
end;

define inline-only C-function gtk-string-filter-set-match-mode
  input parameter self :: <GtkStringFilter>;
  input parameter mode_ :: <GtkStringFilterMatchMode>;
  c-name: "gtk_string_filter_set_match_mode";
end;

define inline-only C-function gtk-string-filter-set-search
  input parameter self :: <GtkStringFilter>;
  input parameter search_ :: <C-string>;
  c-name: "gtk_string_filter_set_search";
end;

define C-struct <_GtkStringFilterClass>
  constant sealed inline-only slot gtk-string-filter-class-parent-class :: <GtkFilterClass>;
  pointer-type-name: <GtkStringFilterClass>;
end C-struct;

define sealed domain make (singleton(<GtkStringFilterClass>));
define sealed domain initialize (<GtkStringFilterClass>);

define inline-only constant $gtk-string-filter-match-mode-exact = 0;
define inline-only constant $gtk-string-filter-match-mode-substring = 1;
define inline-only constant $gtk-string-filter-match-mode-prefix = 2;
define constant <GtkStringFilterMatchMode> = <C-int>;
define C-pointer-type <GtkStringFilterMatchMode*> => <GtkStringFilterMatchMode>;

define open C-subtype <GtkStringList> (<GObject>, <GListModel>, <GtkBuildable>)
end C-subtype;

define C-pointer-type <GtkStringList*> => <GtkStringList>;

define sealed domain make (singleton(<GtkStringList*>));
define sealed domain initialize (<GtkStringList*>);

define inline-only C-function gtk-string-list-new
  input parameter strings_ :: <C-string*>;
  result res :: <GtkStringList>;
  c-name: "gtk_string_list_new";
end;

define inline-only C-function gtk-string-list-append
  input parameter self :: <GtkStringList>;
  input parameter string_ :: <C-string>;
  c-name: "gtk_string_list_append";
end;

define inline-only C-function gtk-string-list-get-string
  input parameter self :: <GtkStringList>;
  input parameter position_ :: <C-unsigned-int>;
  result res :: <C-string>;
  c-name: "gtk_string_list_get_string";
end;

define inline-only C-function gtk-string-list-remove
  input parameter self :: <GtkStringList>;
  input parameter position_ :: <C-unsigned-int>;
  c-name: "gtk_string_list_remove";
end;

define inline-only C-function gtk-string-list-splice
  input parameter self :: <GtkStringList>;
  input parameter position_ :: <C-unsigned-int>;
  input parameter n_removals_ :: <C-unsigned-int>;
  input parameter additions_ :: <C-string*>;
  c-name: "gtk_string_list_splice";
end;

define inline-only C-function gtk-string-list-take
  input parameter self :: <GtkStringList>;
  input parameter string_ :: <C-string>;
  c-name: "gtk_string_list_take";
end;

define C-struct <_GtkStringListClass>
  constant sealed inline-only slot gtk-string-list-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkStringListClass>;
end C-struct;

define sealed domain make (singleton(<GtkStringListClass>));
define sealed domain initialize (<GtkStringListClass>);

define open C-subtype <GtkStringObject> (<GObject>)
end C-subtype;

define C-pointer-type <GtkStringObject*> => <GtkStringObject>;

define sealed domain make (singleton(<GtkStringObject*>));
define sealed domain initialize (<GtkStringObject*>);

define inline-only C-function gtk-string-object-new
  input parameter string_ :: <C-string>;
  result res :: <GtkStringObject>;
  c-name: "gtk_string_object_new";
end;

define inline-only C-function gtk-string-object-get-string
  input parameter self :: <GtkStringObject>;
  result res :: <C-string>;
  c-name: "gtk_string_object_get_string";
end;

define C-struct <_GtkStringObjectClass>
  constant sealed inline-only slot gtk-string-object-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkStringObjectClass>;
end C-struct;

define sealed domain make (singleton(<GtkStringObjectClass>));
define sealed domain initialize (<GtkStringObjectClass>);

define open C-subtype <GtkStringSorter> (<GtkSorter>)
end C-subtype;

define C-pointer-type <GtkStringSorter*> => <GtkStringSorter>;

define sealed domain make (singleton(<GtkStringSorter*>));
define sealed domain initialize (<GtkStringSorter*>);

define inline-only C-function gtk-string-sorter-new
  input parameter expression_ :: <GtkExpression>;
  result res :: <GtkStringSorter>;
  c-name: "gtk_string_sorter_new";
end;

define inline-only C-function gtk-string-sorter-get-expression
  input parameter self :: <GtkStringSorter>;
  result res :: <GtkExpression>;
  c-name: "gtk_string_sorter_get_expression";
end;

define inline-only C-function gtk-string-sorter-get-ignore-case
  input parameter self :: <GtkStringSorter>;
  result res :: <C-boolean>;
  c-name: "gtk_string_sorter_get_ignore_case";
end;

define inline-only C-function gtk-string-sorter-set-expression
  input parameter self :: <GtkStringSorter>;
  input parameter expression_ :: <GtkExpression>;
  c-name: "gtk_string_sorter_set_expression";
end;

define inline-only C-function gtk-string-sorter-set-ignore-case
  input parameter self :: <GtkStringSorter>;
  input parameter ignore_case_ :: <C-boolean>;
  c-name: "gtk_string_sorter_set_ignore_case";
end;

define C-struct <_GtkStringSorterClass>
  constant sealed inline-only slot gtk-string-sorter-class-parent-class :: <GtkSorterClass>;
  pointer-type-name: <GtkStringSorterClass>;
end C-struct;

define sealed domain make (singleton(<GtkStringSorterClass>));
define sealed domain initialize (<GtkStringSorterClass>);

define open C-subtype <GtkStyleContext> (<GObject>)
  // parent_object
end C-subtype;

define C-pointer-type <GtkStyleContext*> => <GtkStyleContext>;

define sealed domain make (singleton(<GtkStyleContext*>));
define sealed domain initialize (<GtkStyleContext*>);

define inline-only C-function gtk-style-context-add-provider-for-display
  input parameter display_ :: <GdkDisplay>;
  input parameter provider_ :: <GtkStyleProvider>;
  input parameter priority_ :: <C-unsigned-int>;
  c-name: "gtk_style_context_add_provider_for_display";
end;

define inline-only C-function gtk-style-context-remove-provider-for-display
  input parameter display_ :: <GdkDisplay>;
  input parameter provider_ :: <GtkStyleProvider>;
  c-name: "gtk_style_context_remove_provider_for_display";
end;

define inline-only C-function gtk-style-context-add-class
  input parameter self :: <GtkStyleContext>;
  input parameter class_name_ :: <C-string>;
  c-name: "gtk_style_context_add_class";
end;

define inline-only C-function gtk-style-context-add-provider
  input parameter self :: <GtkStyleContext>;
  input parameter provider_ :: <GtkStyleProvider>;
  input parameter priority_ :: <C-unsigned-int>;
  c-name: "gtk_style_context_add_provider";
end;

define inline-only C-function gtk-style-context-get-border
  input parameter self :: <GtkStyleContext>;
  input parameter border_ :: <GtkBorder>;
  c-name: "gtk_style_context_get_border";
end;

define inline-only C-function gtk-style-context-get-color
  input parameter self :: <GtkStyleContext>;
  input parameter color_ :: <GdkRGBA>;
  c-name: "gtk_style_context_get_color";
end;

define inline-only C-function gtk-style-context-get-display
  input parameter self :: <GtkStyleContext>;
  result res :: <GdkDisplay>;
  c-name: "gtk_style_context_get_display";
end;

define inline-only C-function gtk-style-context-get-margin
  input parameter self :: <GtkStyleContext>;
  input parameter margin_ :: <GtkBorder>;
  c-name: "gtk_style_context_get_margin";
end;

define inline-only C-function gtk-style-context-get-padding
  input parameter self :: <GtkStyleContext>;
  input parameter padding_ :: <GtkBorder>;
  c-name: "gtk_style_context_get_padding";
end;

define inline-only C-function gtk-style-context-get-scale
  input parameter self :: <GtkStyleContext>;
  result res :: <C-signed-int>;
  c-name: "gtk_style_context_get_scale";
end;

define inline-only C-function gtk-style-context-get-state
  input parameter self :: <GtkStyleContext>;
  result res :: <GtkStateFlags>;
  c-name: "gtk_style_context_get_state";
end;

define inline-only C-function gtk-style-context-has-class
  input parameter self :: <GtkStyleContext>;
  input parameter class_name_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_style_context_has_class";
end;

define inline-only C-function gtk-style-context-lookup-color
  input parameter self :: <GtkStyleContext>;
  input parameter color_name_ :: <C-string>;
  input parameter color_ :: <GdkRGBA>;
  result res :: <C-boolean>;
  c-name: "gtk_style_context_lookup_color";
end;

define inline-only C-function gtk-style-context-remove-class
  input parameter self :: <GtkStyleContext>;
  input parameter class_name_ :: <C-string>;
  c-name: "gtk_style_context_remove_class";
end;

define inline-only C-function gtk-style-context-remove-provider
  input parameter self :: <GtkStyleContext>;
  input parameter provider_ :: <GtkStyleProvider>;
  c-name: "gtk_style_context_remove_provider";
end;

define inline-only C-function gtk-style-context-restore
  input parameter self :: <GtkStyleContext>;
  c-name: "gtk_style_context_restore";
end;

define inline-only C-function gtk-style-context-save
  input parameter self :: <GtkStyleContext>;
  c-name: "gtk_style_context_save";
end;

define inline-only C-function gtk-style-context-set-display
  input parameter self :: <GtkStyleContext>;
  input parameter display_ :: <GdkDisplay>;
  c-name: "gtk_style_context_set_display";
end;

define inline-only C-function gtk-style-context-set-scale
  input parameter self :: <GtkStyleContext>;
  input parameter scale_ :: <C-signed-int>;
  c-name: "gtk_style_context_set_scale";
end;

define inline-only C-function gtk-style-context-set-state
  input parameter self :: <GtkStyleContext>;
  input parameter flags_ :: <GtkStateFlags>;
  c-name: "gtk_style_context_set_state";
end;

define inline-only C-function gtk-style-context-to-string
  input parameter self :: <GtkStyleContext>;
  input parameter flags_ :: <GtkStyleContextPrintFlags>;
  result res :: <C-string>;
  c-name: "gtk_style_context_to_string";
end;

define C-struct <_GtkStyleContextClass>
  constant sealed inline-only slot gtk-style-context-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-style-context-class-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-style-context-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-style-context-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-style-context-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-style-context-class-_gtk-reserved4 :: <C-void*>;
  pointer-type-name: <GtkStyleContextClass>;
end C-struct;

define sealed domain make (singleton(<GtkStyleContextClass>));
define sealed domain initialize (<GtkStyleContextClass>);

define inline-only constant $gtk-style-context-print-none = 0;
define inline-only constant $gtk-style-context-print-recurse = 1;
define inline-only constant $gtk-style-context-print-show-style = 2;
define inline-only constant $gtk-style-context-print-show-change = 4;
define constant <GtkStyleContextPrintFlags> = <C-int>;
define C-pointer-type <GtkStyleContextPrintFlags*> => <GtkStyleContextPrintFlags>;

// Interface
define open C-subtype <GtkStyleProvider> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkStyleProvider*> => <GtkStyleProvider>;

define sealed domain make (singleton(<GtkStyleProvider*>));
define sealed domain initialize (<GtkStyleProvider*>);

define open C-subtype <GtkSwitch> (<GtkActionable>)
end C-subtype;

define C-pointer-type <GtkSwitch*> => <GtkSwitch>;

define sealed domain make (singleton(<GtkSwitch*>));
define sealed domain initialize (<GtkSwitch*>);

define inline-only C-function gtk-switch-new
  result res :: <GtkWidget>;
  c-name: "gtk_switch_new";
end;

define inline-only C-function gtk-switch-get-active
  input parameter self :: <GtkSwitch>;
  result res :: <C-boolean>;
  c-name: "gtk_switch_get_active";
end;

define inline-only C-function gtk-switch-get-state
  input parameter self :: <GtkSwitch>;
  result res :: <C-boolean>;
  c-name: "gtk_switch_get_state";
end;

define inline-only C-function gtk-switch-set-active
  input parameter self :: <GtkSwitch>;
  input parameter is_active_ :: <C-boolean>;
  c-name: "gtk_switch_set_active";
end;

define inline-only C-function gtk-switch-set-state
  input parameter self :: <GtkSwitch>;
  input parameter state_ :: <C-boolean>;
  c-name: "gtk_switch_set_state";
end;

define inline-only constant $gtk-symbolic-color-foreground = 0;
define inline-only constant $gtk-symbolic-color-error = 1;
define inline-only constant $gtk-symbolic-color-warning = 2;
define inline-only constant $gtk-symbolic-color-success = 3;
define constant <GtkSymbolicColor> = <C-int>;
define C-pointer-type <GtkSymbolicColor*> => <GtkSymbolicColor>;

// Interface
define open C-subtype <GtkSymbolicPaintable> (<GdkPaintable>)
end C-subtype;

define C-pointer-type <GtkSymbolicPaintable*> => <GtkSymbolicPaintable>;

define sealed domain make (singleton(<GtkSymbolicPaintable*>));
define sealed domain initialize (<GtkSymbolicPaintable*>);

define inline-only C-function gtk-symbolic-paintable-snapshot-symbolic
  input parameter self :: <GtkSymbolicPaintable>;
  input parameter snapshot_ :: <GdkSnapshot>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  input parameter colors_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_colors_ :: <C-unsigned-long>;
  c-name: "gtk_symbolic_paintable_snapshot_symbolic";
end;

define C-struct <_GtkSymbolicPaintableInterface>
  constant sealed inline-only slot gtk-symbolic-paintable-interface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-symbolic-paintable-interface-snapshot-symbolic :: <C-function-pointer>;
  pointer-type-name: <GtkSymbolicPaintableInterface>;
end C-struct;

define sealed domain make (singleton(<GtkSymbolicPaintableInterface>));
define sealed domain initialize (<GtkSymbolicPaintableInterface>);

define inline-only constant $gtk-system-setting-dpi = 0;
define inline-only constant $gtk-system-setting-font-name = 1;
define inline-only constant $gtk-system-setting-font-config = 2;
define inline-only constant $gtk-system-setting-display = 3;
define inline-only constant $gtk-system-setting-icon-theme = 4;
define constant <GtkSystemSetting> = <C-int>;
define C-pointer-type <GtkSystemSetting*> => <GtkSystemSetting>;

define inline-only constant $text-view-priority-validate = 125;

define inline-only constant $tree-sortable-default-sort-column-id = -1;

define inline-only constant $tree-sortable-unsorted-sort-column-id = -2;

define open C-subtype <GtkText> (<GtkEditable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkText*> => <GtkText>;

define sealed domain make (singleton(<GtkText*>));
define sealed domain initialize (<GtkText*>);

define inline-only C-function gtk-text-new
  result res :: <GtkWidget>;
  c-name: "gtk_text_new";
end;

define inline-only C-function gtk-text-new-with-buffer
  input parameter buffer_ :: <GtkEntryBuffer>;
  result res :: <GtkWidget>;
  c-name: "gtk_text_new_with_buffer";
end;

define inline-only C-function gtk-text-compute-cursor-extents
  input parameter self :: <GtkText>;
  input parameter position_ :: <C-unsigned-long>;
  input parameter strong_ :: <GrapheneRect>;
  input parameter weak_ :: <GrapheneRect>;
  c-name: "gtk_text_compute_cursor_extents";
end;

define inline-only C-function gtk-text-get-activates-default
  input parameter self :: <GtkText>;
  result res :: <C-boolean>;
  c-name: "gtk_text_get_activates_default";
end;

define inline-only C-function gtk-text-get-attributes
  input parameter self :: <GtkText>;
  result res :: <PangoAttrList>;
  c-name: "gtk_text_get_attributes";
end;

define inline-only C-function gtk-text-get-buffer
  input parameter self :: <GtkText>;
  result res :: <GtkEntryBuffer>;
  c-name: "gtk_text_get_buffer";
end;

define inline-only C-function gtk-text-get-enable-emoji-completion
  input parameter self :: <GtkText>;
  result res :: <C-boolean>;
  c-name: "gtk_text_get_enable_emoji_completion";
end;

define inline-only C-function gtk-text-get-extra-menu
  input parameter self :: <GtkText>;
  result res :: <GMenuModel>;
  c-name: "gtk_text_get_extra_menu";
end;

define inline-only C-function gtk-text-get-input-hints
  input parameter self :: <GtkText>;
  result res :: <GtkInputHints>;
  c-name: "gtk_text_get_input_hints";
end;

define inline-only C-function gtk-text-get-input-purpose
  input parameter self :: <GtkText>;
  result res :: <GtkInputPurpose>;
  c-name: "gtk_text_get_input_purpose";
end;

define inline-only C-function gtk-text-get-invisible-char
  input parameter self :: <GtkText>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_text_get_invisible_char";
end;

define inline-only C-function gtk-text-get-max-length
  input parameter self :: <GtkText>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_get_max_length";
end;

define inline-only C-function gtk-text-get-overwrite-mode
  input parameter self :: <GtkText>;
  result res :: <C-boolean>;
  c-name: "gtk_text_get_overwrite_mode";
end;

define inline-only C-function gtk-text-get-placeholder-text
  input parameter self :: <GtkText>;
  result res :: <C-string>;
  c-name: "gtk_text_get_placeholder_text";
end;

define inline-only C-function gtk-text-get-propagate-text-width
  input parameter self :: <GtkText>;
  result res :: <C-boolean>;
  c-name: "gtk_text_get_propagate_text_width";
end;

define inline-only C-function gtk-text-get-tabs
  input parameter self :: <GtkText>;
  result res :: <PangoTabArray>;
  c-name: "gtk_text_get_tabs";
end;

define inline-only C-function gtk-text-get-text-length
  input parameter self :: <GtkText>;
  result res :: <C-unsigned-short>;
  c-name: "gtk_text_get_text_length";
end;

define inline-only C-function gtk-text-get-truncate-multiline
  input parameter self :: <GtkText>;
  result res :: <C-boolean>;
  c-name: "gtk_text_get_truncate_multiline";
end;

define inline-only C-function gtk-text-get-visibility
  input parameter self :: <GtkText>;
  result res :: <C-boolean>;
  c-name: "gtk_text_get_visibility";
end;

define inline-only C-function gtk-text-grab-focus-without-selecting
  input parameter self :: <GtkText>;
  result res :: <C-boolean>;
  c-name: "gtk_text_grab_focus_without_selecting";
end;

define inline-only C-function gtk-text-set-activates-default
  input parameter self :: <GtkText>;
  input parameter activates_ :: <C-boolean>;
  c-name: "gtk_text_set_activates_default";
end;

define inline-only C-function gtk-text-set-attributes
  input parameter self :: <GtkText>;
  input parameter attrs_ :: <PangoAttrList>;
  c-name: "gtk_text_set_attributes";
end;

define inline-only C-function gtk-text-set-buffer
  input parameter self :: <GtkText>;
  input parameter buffer_ :: <GtkEntryBuffer>;
  c-name: "gtk_text_set_buffer";
end;

define inline-only C-function gtk-text-set-enable-emoji-completion
  input parameter self :: <GtkText>;
  input parameter enable_emoji_completion_ :: <C-boolean>;
  c-name: "gtk_text_set_enable_emoji_completion";
end;

define inline-only C-function gtk-text-set-extra-menu
  input parameter self :: <GtkText>;
  input parameter model_ :: <GMenuModel>;
  c-name: "gtk_text_set_extra_menu";
end;

define inline-only C-function gtk-text-set-input-hints
  input parameter self :: <GtkText>;
  input parameter hints_ :: <GtkInputHints>;
  c-name: "gtk_text_set_input_hints";
end;

define inline-only C-function gtk-text-set-input-purpose
  input parameter self :: <GtkText>;
  input parameter purpose_ :: <GtkInputPurpose>;
  c-name: "gtk_text_set_input_purpose";
end;

define inline-only C-function gtk-text-set-invisible-char
  input parameter self :: <GtkText>;
  input parameter ch_ :: <C-unsigned-int>;
  c-name: "gtk_text_set_invisible_char";
end;

define inline-only C-function gtk-text-set-max-length
  input parameter self :: <GtkText>;
  input parameter length_ :: <C-signed-int>;
  c-name: "gtk_text_set_max_length";
end;

define inline-only C-function gtk-text-set-overwrite-mode
  input parameter self :: <GtkText>;
  input parameter overwrite_ :: <C-boolean>;
  c-name: "gtk_text_set_overwrite_mode";
end;

define inline-only C-function gtk-text-set-placeholder-text
  input parameter self :: <GtkText>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_text_set_placeholder_text";
end;

define inline-only C-function gtk-text-set-propagate-text-width
  input parameter self :: <GtkText>;
  input parameter propagate_text_width_ :: <C-boolean>;
  c-name: "gtk_text_set_propagate_text_width";
end;

define inline-only C-function gtk-text-set-tabs
  input parameter self :: <GtkText>;
  input parameter tabs_ :: <PangoTabArray>;
  c-name: "gtk_text_set_tabs";
end;

define inline-only C-function gtk-text-set-truncate-multiline
  input parameter self :: <GtkText>;
  input parameter truncate_multiline_ :: <C-boolean>;
  c-name: "gtk_text_set_truncate_multiline";
end;

define inline-only C-function gtk-text-set-visibility
  input parameter self :: <GtkText>;
  input parameter visible_ :: <C-boolean>;
  c-name: "gtk_text_set_visibility";
end;

define inline-only C-function gtk-text-unset-invisible-char
  input parameter self :: <GtkText>;
  c-name: "gtk_text_unset_invisible_char";
end;

define open C-subtype <GtkTextBuffer> (<GObject>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GtkTextBuffer*> => <GtkTextBuffer>;

define sealed domain make (singleton(<GtkTextBuffer*>));
define sealed domain initialize (<GtkTextBuffer*>);

define inline-only C-function gtk-text-buffer-new
  input parameter table_ :: <GtkTextTagTable>;
  result res :: <GtkTextBuffer>;
  c-name: "gtk_text_buffer_new";
end;

define inline-only C-function gtk-text-buffer-add-mark
  input parameter self :: <GtkTextBuffer>;
  input parameter mark_ :: <GtkTextMark>;
  input parameter where_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_add_mark";
end;

define inline-only C-function gtk-text-buffer-add-selection-clipboard
  input parameter self :: <GtkTextBuffer>;
  input parameter clipboard_ :: <GdkClipboard>;
  c-name: "gtk_text_buffer_add_selection_clipboard";
end;

define inline-only C-function gtk-text-buffer-apply-tag
  input parameter self :: <GtkTextBuffer>;
  input parameter tag_ :: <GtkTextTag>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_apply_tag";
end;

define inline-only C-function gtk-text-buffer-apply-tag-by-name
  input parameter self :: <GtkTextBuffer>;
  input parameter name_ :: <C-string>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_apply_tag_by_name";
end;

define inline-only C-function gtk-text-buffer-backspace
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter interactive_ :: <C-boolean>;
  input parameter default_editable_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_backspace";
end;

define inline-only C-function gtk-text-buffer-begin-irreversible-action
  input parameter self :: <GtkTextBuffer>;
  c-name: "gtk_text_buffer_begin_irreversible_action";
end;

define inline-only C-function gtk-text-buffer-begin-user-action
  input parameter self :: <GtkTextBuffer>;
  c-name: "gtk_text_buffer_begin_user_action";
end;

define inline-only C-function gtk-text-buffer-copy-clipboard
  input parameter self :: <GtkTextBuffer>;
  input parameter clipboard_ :: <GdkClipboard>;
  c-name: "gtk_text_buffer_copy_clipboard";
end;

define inline-only C-function gtk-text-buffer-create-child-anchor
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  result res :: <GtkTextChildAnchor>;
  c-name: "gtk_text_buffer_create_child_anchor";
end;

define inline-only C-function gtk-text-buffer-create-mark
  input parameter self :: <GtkTextBuffer>;
  input parameter mark_name_ :: <C-string>;
  input parameter where_ :: <GtkTextIter>;
  input parameter left_gravity_ :: <C-boolean>;
  result res :: <GtkTextMark>;
  c-name: "gtk_text_buffer_create_mark";
end;

define inline-only C-function gtk-text-buffer-cut-clipboard
  input parameter self :: <GtkTextBuffer>;
  input parameter clipboard_ :: <GdkClipboard>;
  input parameter default_editable_ :: <C-boolean>;
  c-name: "gtk_text_buffer_cut_clipboard";
end;

define inline-only C-function gtk-text-buffer-delete
  input parameter self :: <GtkTextBuffer>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_delete";
end;

define inline-only C-function gtk-text-buffer-delete-interactive
  input parameter self :: <GtkTextBuffer>;
  input parameter start_iter_ :: <GtkTextIter>;
  input parameter end_iter_ :: <GtkTextIter>;
  input parameter default_editable_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_delete_interactive";
end;

define inline-only C-function gtk-text-buffer-delete-mark
  input parameter self :: <GtkTextBuffer>;
  input parameter mark_ :: <GtkTextMark>;
  c-name: "gtk_text_buffer_delete_mark";
end;

define inline-only C-function gtk-text-buffer-delete-mark-by-name
  input parameter self :: <GtkTextBuffer>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_text_buffer_delete_mark_by_name";
end;

define inline-only C-function gtk-text-buffer-delete-selection
  input parameter self :: <GtkTextBuffer>;
  input parameter interactive_ :: <C-boolean>;
  input parameter default_editable_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_delete_selection";
end;

define inline-only C-function gtk-text-buffer-end-irreversible-action
  input parameter self :: <GtkTextBuffer>;
  c-name: "gtk_text_buffer_end_irreversible_action";
end;

define inline-only C-function gtk-text-buffer-end-user-action
  input parameter self :: <GtkTextBuffer>;
  c-name: "gtk_text_buffer_end_user_action";
end;

define inline-only C-function gtk-text-buffer-get-bounds
  input parameter self :: <GtkTextBuffer>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_get_bounds";
end;

define inline-only C-function gtk-text-buffer-get-can-redo
  input parameter self :: <GtkTextBuffer>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_get_can_redo";
end;

define inline-only C-function gtk-text-buffer-get-can-undo
  input parameter self :: <GtkTextBuffer>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_get_can_undo";
end;

define inline-only C-function gtk-text-buffer-get-char-count
  input parameter self :: <GtkTextBuffer>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_buffer_get_char_count";
end;

define inline-only C-function gtk-text-buffer-get-enable-undo
  input parameter self :: <GtkTextBuffer>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_get_enable_undo";
end;

define inline-only C-function gtk-text-buffer-get-end-iter
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_get_end_iter";
end;

define inline-only C-function gtk-text-buffer-get-has-selection
  input parameter self :: <GtkTextBuffer>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_get_has_selection";
end;

define inline-only C-function gtk-text-buffer-get-insert
  input parameter self :: <GtkTextBuffer>;
  result res :: <GtkTextMark>;
  c-name: "gtk_text_buffer_get_insert";
end;

define inline-only C-function gtk-text-buffer-get-iter-at-child-anchor
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter anchor_ :: <GtkTextChildAnchor>;
  c-name: "gtk_text_buffer_get_iter_at_child_anchor";
end;

define inline-only C-function gtk-text-buffer-get-iter-at-line
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter line_number_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_get_iter_at_line";
end;

define inline-only C-function gtk-text-buffer-get-iter-at-line-index
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter line_number_ :: <C-signed-int>;
  input parameter byte_index_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_get_iter_at_line_index";
end;

define inline-only C-function gtk-text-buffer-get-iter-at-line-offset
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter line_number_ :: <C-signed-int>;
  input parameter char_offset_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_get_iter_at_line_offset";
end;

define inline-only C-function gtk-text-buffer-get-iter-at-mark
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter mark_ :: <GtkTextMark>;
  c-name: "gtk_text_buffer_get_iter_at_mark";
end;

define inline-only C-function gtk-text-buffer-get-iter-at-offset
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter char_offset_ :: <C-signed-int>;
  c-name: "gtk_text_buffer_get_iter_at_offset";
end;

define inline-only C-function gtk-text-buffer-get-line-count
  input parameter self :: <GtkTextBuffer>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_buffer_get_line_count";
end;

define inline-only C-function gtk-text-buffer-get-mark
  input parameter self :: <GtkTextBuffer>;
  input parameter name_ :: <C-string>;
  result res :: <GtkTextMark>;
  c-name: "gtk_text_buffer_get_mark";
end;

define inline-only C-function gtk-text-buffer-get-max-undo-levels
  input parameter self :: <GtkTextBuffer>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_text_buffer_get_max_undo_levels";
end;

define inline-only C-function gtk-text-buffer-get-modified
  input parameter self :: <GtkTextBuffer>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_get_modified";
end;

define inline-only C-function gtk-text-buffer-get-selection-bound
  input parameter self :: <GtkTextBuffer>;
  result res :: <GtkTextMark>;
  c-name: "gtk_text_buffer_get_selection_bound";
end;

define inline-only C-function gtk-text-buffer-get-selection-bounds
  input parameter self :: <GtkTextBuffer>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_get_selection_bounds";
end;

define inline-only C-function gtk-text-buffer-get-selection-content
  input parameter self :: <GtkTextBuffer>;
  result res :: <GdkContentProvider>;
  c-name: "gtk_text_buffer_get_selection_content";
end;

define inline-only C-function gtk-text-buffer-get-slice
  input parameter self :: <GtkTextBuffer>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  input parameter include_hidden_chars_ :: <C-boolean>;
  result res :: <C-string>;
  c-name: "gtk_text_buffer_get_slice";
end;

define inline-only C-function gtk-text-buffer-get-start-iter
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_get_start_iter";
end;

define inline-only C-function gtk-text-buffer-get-tag-table
  input parameter self :: <GtkTextBuffer>;
  result res :: <GtkTextTagTable>;
  c-name: "gtk_text_buffer_get_tag_table";
end;

define inline-only C-function gtk-text-buffer-get-text
  input parameter self :: <GtkTextBuffer>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  input parameter include_hidden_chars_ :: <C-boolean>;
  result res :: <C-string>;
  c-name: "gtk_text_buffer_get_text";
end;

define inline-only C-function gtk-text-buffer-insert
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter text_ :: <C-string>;
  input parameter len_ :: <C-signed-int>;
  c-name: "gtk_text_buffer_insert";
end;

define inline-only C-function gtk-text-buffer-insert-at-cursor
  input parameter self :: <GtkTextBuffer>;
  input parameter text_ :: <C-string>;
  input parameter len_ :: <C-signed-int>;
  c-name: "gtk_text_buffer_insert_at_cursor";
end;

define inline-only C-function gtk-text-buffer-insert-child-anchor
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter anchor_ :: <GtkTextChildAnchor>;
  c-name: "gtk_text_buffer_insert_child_anchor";
end;

define inline-only C-function gtk-text-buffer-insert-interactive
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter text_ :: <C-string>;
  input parameter len_ :: <C-signed-int>;
  input parameter default_editable_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_insert_interactive";
end;

define inline-only C-function gtk-text-buffer-insert-interactive-at-cursor
  input parameter self :: <GtkTextBuffer>;
  input parameter text_ :: <C-string>;
  input parameter len_ :: <C-signed-int>;
  input parameter default_editable_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_insert_interactive_at_cursor";
end;

define inline-only C-function gtk-text-buffer-insert-markup
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter markup_ :: <C-string>;
  input parameter len_ :: <C-signed-int>;
  c-name: "gtk_text_buffer_insert_markup";
end;

define inline-only C-function gtk-text-buffer-insert-paintable
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter paintable_ :: <GdkPaintable>;
  c-name: "gtk_text_buffer_insert_paintable";
end;

define inline-only C-function gtk-text-buffer-insert-range
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_insert_range";
end;

define inline-only C-function gtk-text-buffer-insert-range-interactive
  input parameter self :: <GtkTextBuffer>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  input parameter default_editable_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_text_buffer_insert_range_interactive";
end;

define inline-only C-function gtk-text-buffer-move-mark
  input parameter self :: <GtkTextBuffer>;
  input parameter mark_ :: <GtkTextMark>;
  input parameter where_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_move_mark";
end;

define inline-only C-function gtk-text-buffer-move-mark-by-name
  input parameter self :: <GtkTextBuffer>;
  input parameter name_ :: <C-string>;
  input parameter where_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_move_mark_by_name";
end;

define inline-only C-function gtk-text-buffer-paste-clipboard
  input parameter self :: <GtkTextBuffer>;
  input parameter clipboard_ :: <GdkClipboard>;
  input parameter override_location_ :: <GtkTextIter>;
  input parameter default_editable_ :: <C-boolean>;
  c-name: "gtk_text_buffer_paste_clipboard";
end;

define inline-only C-function gtk-text-buffer-place-cursor
  input parameter self :: <GtkTextBuffer>;
  input parameter where_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_place_cursor";
end;

define inline-only C-function gtk-text-buffer-redo
  input parameter self :: <GtkTextBuffer>;
  c-name: "gtk_text_buffer_redo";
end;

define inline-only C-function gtk-text-buffer-remove-all-tags
  input parameter self :: <GtkTextBuffer>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_remove_all_tags";
end;

define inline-only C-function gtk-text-buffer-remove-selection-clipboard
  input parameter self :: <GtkTextBuffer>;
  input parameter clipboard_ :: <GdkClipboard>;
  c-name: "gtk_text_buffer_remove_selection_clipboard";
end;

define inline-only C-function gtk-text-buffer-remove-tag
  input parameter self :: <GtkTextBuffer>;
  input parameter tag_ :: <GtkTextTag>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_remove_tag";
end;

define inline-only C-function gtk-text-buffer-remove-tag-by-name
  input parameter self :: <GtkTextBuffer>;
  input parameter name_ :: <C-string>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_remove_tag_by_name";
end;

define inline-only C-function gtk-text-buffer-select-range
  input parameter self :: <GtkTextBuffer>;
  input parameter ins_ :: <GtkTextIter>;
  input parameter bound_ :: <GtkTextIter>;
  c-name: "gtk_text_buffer_select_range";
end;

define inline-only C-function gtk-text-buffer-set-enable-undo
  input parameter self :: <GtkTextBuffer>;
  input parameter enable_undo_ :: <C-boolean>;
  c-name: "gtk_text_buffer_set_enable_undo";
end;

define inline-only C-function gtk-text-buffer-set-max-undo-levels
  input parameter self :: <GtkTextBuffer>;
  input parameter max_undo_levels_ :: <C-unsigned-int>;
  c-name: "gtk_text_buffer_set_max_undo_levels";
end;

define inline-only C-function gtk-text-buffer-set-modified
  input parameter self :: <GtkTextBuffer>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_text_buffer_set_modified";
end;

define inline-only C-function gtk-text-buffer-set-text
  input parameter self :: <GtkTextBuffer>;
  input parameter text_ :: <C-string>;
  input parameter len_ :: <C-signed-int>;
  c-name: "gtk_text_buffer_set_text";
end;

define inline-only C-function gtk-text-buffer-undo
  input parameter self :: <GtkTextBuffer>;
  c-name: "gtk_text_buffer_undo";
end;

define C-struct <_GtkTextBufferClass>
  constant sealed inline-only slot gtk-text-buffer-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-text-buffer-class-insert-text :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-insert-paintable :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-insert-child-anchor :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-delete-range :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-modified-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-mark-set :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-mark-deleted :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-apply-tag :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-remove-tag :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-begin-user-action :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-end-user-action :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-paste-done :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-undo :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-redo :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-buffer-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-text-buffer-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-text-buffer-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-text-buffer-class-_gtk-reserved4 :: <C-void*>;
  pointer-type-name: <GtkTextBufferClass>;
end C-struct;

define sealed domain make (singleton(<GtkTextBufferClass>));
define sealed domain initialize (<GtkTextBufferClass>);

define C-struct <_GtkTextBufferPrivate>
  pointer-type-name: <GtkTextBufferPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkTextBufferPrivate>));
define sealed domain initialize (<GtkTextBufferPrivate>);

define open C-subtype <GtkTextChildAnchor> (<GObject>)
  // parent_instance
  // segment
end C-subtype;

define C-pointer-type <GtkTextChildAnchor*> => <GtkTextChildAnchor>;

define sealed domain make (singleton(<GtkTextChildAnchor*>));
define sealed domain initialize (<GtkTextChildAnchor*>);

define inline-only C-function gtk-text-child-anchor-new
  result res :: <GtkTextChildAnchor>;
  c-name: "gtk_text_child_anchor_new";
end;

define inline-only C-function gtk-text-child-anchor-new-with-replacement
  input parameter character_ :: <C-string>;
  result res :: <GtkTextChildAnchor>;
  c-name: "gtk_text_child_anchor_new_with_replacement";
end;

define inline-only C-function gtk-text-child-anchor-get-deleted
  input parameter self :: <GtkTextChildAnchor>;
  result res :: <C-boolean>;
  c-name: "gtk_text_child_anchor_get_deleted";
end;

define inline-only C-function gtk-text-child-anchor-get-widgets
  input parameter self :: <GtkTextChildAnchor>;
  output parameter out_len_ :: <C-unsigned-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "gtk_text_child_anchor_get_widgets";
end;

define C-struct <_GtkTextChildAnchorClass>
  constant sealed inline-only slot gtk-text-child-anchor-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-text-child-anchor-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-text-child-anchor-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-text-child-anchor-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-text-child-anchor-class-_gtk-reserved4 :: <C-void*>;
  pointer-type-name: <GtkTextChildAnchorClass>;
end C-struct;

define sealed domain make (singleton(<GtkTextChildAnchorClass>));
define sealed domain initialize (<GtkTextChildAnchorClass>);

define inline-only constant $gtk-text-dir-none = 0;
define inline-only constant $gtk-text-dir-ltr = 1;
define inline-only constant $gtk-text-dir-rtl = 2;
define constant <GtkTextDirection> = <C-int>;
define C-pointer-type <GtkTextDirection*> => <GtkTextDirection>;

define inline-only constant $gtk-text-extend-selection-word = 0;
define inline-only constant $gtk-text-extend-selection-line = 1;
define constant <GtkTextExtendSelection> = <C-int>;
define C-pointer-type <GtkTextExtendSelection*> => <GtkTextExtendSelection>;

define C-struct <_GtkTextIter>
  constant sealed inline-only slot gtk-text-iter-dummy1 :: <C-void*>;
  constant sealed inline-only slot gtk-text-iter-dummy2 :: <C-void*>;
  constant sealed inline-only slot gtk-text-iter-dummy3 :: <C-signed-int>;
  constant sealed inline-only slot gtk-text-iter-dummy4 :: <C-signed-int>;
  constant sealed inline-only slot gtk-text-iter-dummy5 :: <C-signed-int>;
  constant sealed inline-only slot gtk-text-iter-dummy6 :: <C-signed-int>;
  constant sealed inline-only slot gtk-text-iter-dummy7 :: <C-signed-int>;
  constant sealed inline-only slot gtk-text-iter-dummy8 :: <C-signed-int>;
  constant sealed inline-only slot gtk-text-iter-dummy9 :: <C-void*>;
  constant sealed inline-only slot gtk-text-iter-dummy10 :: <C-void*>;
  constant sealed inline-only slot gtk-text-iter-dummy11 :: <C-signed-int>;
  constant sealed inline-only slot gtk-text-iter-dummy12 :: <C-signed-int>;
  constant sealed inline-only slot gtk-text-iter-dummy13 :: <C-signed-int>;
  constant sealed inline-only slot gtk-text-iter-dummy14 :: <C-void*>;
  pointer-type-name: <GtkTextIter>;
end C-struct;

define sealed domain make (singleton(<GtkTextIter>));
define sealed domain initialize (<GtkTextIter>);

define inline-only C-function gtk-text-iter-assign
  input parameter self :: <GtkTextIter>;
  input parameter other_ :: <GtkTextIter>;
  c-name: "gtk_text_iter_assign";
end;

define inline-only C-function gtk-text-iter-backward-char
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_char";
end;

define inline-only C-function gtk-text-iter-backward-chars
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_chars";
end;

define inline-only C-function gtk-text-iter-backward-cursor-position
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_cursor_position";
end;

define inline-only C-function gtk-text-iter-backward-cursor-positions
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_cursor_positions";
end;

define inline-only C-function gtk-text-iter-backward-find-char
  input parameter self :: <GtkTextIter>;
  input parameter pred_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter limit_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_find_char";
end;

define inline-only C-function gtk-text-iter-backward-line
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_line";
end;

define inline-only C-function gtk-text-iter-backward-lines
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_lines";
end;

define inline-only C-function gtk-text-iter-backward-search
  input parameter self :: <GtkTextIter>;
  input parameter str_ :: <C-string>;
  input parameter flags_ :: <GtkTextSearchFlags>;
  input parameter match_start_ :: <GtkTextIter>;
  input parameter match_end_ :: <GtkTextIter>;
  input parameter limit_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_search";
end;

define inline-only C-function gtk-text-iter-backward-sentence-start
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_sentence_start";
end;

define inline-only C-function gtk-text-iter-backward-sentence-starts
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_sentence_starts";
end;

define inline-only C-function gtk-text-iter-backward-to-tag-toggle
  input parameter self :: <GtkTextIter>;
  input parameter tag_ :: <GtkTextTag>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_to_tag_toggle";
end;

define inline-only C-function gtk-text-iter-backward-visible-cursor-position
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_visible_cursor_position";
end;

define inline-only C-function gtk-text-iter-backward-visible-cursor-positions
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_visible_cursor_positions";
end;

define inline-only C-function gtk-text-iter-backward-visible-line
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_visible_line";
end;

define inline-only C-function gtk-text-iter-backward-visible-lines
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_visible_lines";
end;

define inline-only C-function gtk-text-iter-backward-visible-word-start
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_visible_word_start";
end;

define inline-only C-function gtk-text-iter-backward-visible-word-starts
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_visible_word_starts";
end;

define inline-only C-function gtk-text-iter-backward-word-start
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_word_start";
end;

define inline-only C-function gtk-text-iter-backward-word-starts
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_backward_word_starts";
end;

define inline-only C-function gtk-text-iter-can-insert
  input parameter self :: <GtkTextIter>;
  input parameter default_editability_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_can_insert";
end;

define inline-only C-function gtk-text-iter-compare
  input parameter self :: <GtkTextIter>;
  input parameter rhs_ :: <GtkTextIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_iter_compare";
end;

define inline-only C-function gtk-text-iter-copy
  input parameter self :: <GtkTextIter>;
  result res :: <GtkTextIter>;
  c-name: "gtk_text_iter_copy";
end;

define inline-only C-function gtk-text-iter-editable
  input parameter self :: <GtkTextIter>;
  input parameter default_setting_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_editable";
end;

define inline-only C-function gtk-text-iter-ends-line
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_ends_line";
end;

define inline-only C-function gtk-text-iter-ends-sentence
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_ends_sentence";
end;

define inline-only C-function gtk-text-iter-ends-tag
  input parameter self :: <GtkTextIter>;
  input parameter tag_ :: <GtkTextTag>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_ends_tag";
end;

define inline-only C-function gtk-text-iter-ends-word
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_ends_word";
end;

define inline-only C-function gtk-text-iter-equal
  input parameter self :: <GtkTextIter>;
  input parameter rhs_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_equal";
end;

define inline-only C-function gtk-text-iter-forward-char
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_char";
end;

define inline-only C-function gtk-text-iter-forward-chars
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_chars";
end;

define inline-only C-function gtk-text-iter-forward-cursor-position
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_cursor_position";
end;

define inline-only C-function gtk-text-iter-forward-cursor-positions
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_cursor_positions";
end;

define inline-only C-function gtk-text-iter-forward-find-char
  input parameter self :: <GtkTextIter>;
  input parameter pred_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter limit_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_find_char";
end;

define inline-only C-function gtk-text-iter-forward-line
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_line";
end;

define inline-only C-function gtk-text-iter-forward-lines
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_lines";
end;

define inline-only C-function gtk-text-iter-forward-search
  input parameter self :: <GtkTextIter>;
  input parameter str_ :: <C-string>;
  input parameter flags_ :: <GtkTextSearchFlags>;
  input parameter match_start_ :: <GtkTextIter>;
  input parameter match_end_ :: <GtkTextIter>;
  input parameter limit_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_search";
end;

define inline-only C-function gtk-text-iter-forward-sentence-end
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_sentence_end";
end;

define inline-only C-function gtk-text-iter-forward-sentence-ends
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_sentence_ends";
end;

define inline-only C-function gtk-text-iter-forward-to-end
  input parameter self :: <GtkTextIter>;
  c-name: "gtk_text_iter_forward_to_end";
end;

define inline-only C-function gtk-text-iter-forward-to-line-end
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_to_line_end";
end;

define inline-only C-function gtk-text-iter-forward-to-tag-toggle
  input parameter self :: <GtkTextIter>;
  input parameter tag_ :: <GtkTextTag>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_to_tag_toggle";
end;

define inline-only C-function gtk-text-iter-forward-visible-cursor-position
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_visible_cursor_position";
end;

define inline-only C-function gtk-text-iter-forward-visible-cursor-positions
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_visible_cursor_positions";
end;

define inline-only C-function gtk-text-iter-forward-visible-line
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_visible_line";
end;

define inline-only C-function gtk-text-iter-forward-visible-lines
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_visible_lines";
end;

define inline-only C-function gtk-text-iter-forward-visible-word-end
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_visible_word_end";
end;

define inline-only C-function gtk-text-iter-forward-visible-word-ends
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_visible_word_ends";
end;

define inline-only C-function gtk-text-iter-forward-word-end
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_word_end";
end;

define inline-only C-function gtk-text-iter-forward-word-ends
  input parameter self :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_forward_word_ends";
end;

define inline-only C-function gtk-text-iter-free
  input parameter self :: <GtkTextIter>;
  c-name: "gtk_text_iter_free";
end;

define inline-only C-function gtk-text-iter-get-buffer
  input parameter self :: <GtkTextIter>;
  result res :: <GtkTextBuffer>;
  c-name: "gtk_text_iter_get_buffer";
end;

define inline-only C-function gtk-text-iter-get-bytes-in-line
  input parameter self :: <GtkTextIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_iter_get_bytes_in_line";
end;

define inline-only C-function gtk-text-iter-get-char
  input parameter self :: <GtkTextIter>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_text_iter_get_char";
end;

define inline-only C-function gtk-text-iter-get-chars-in-line
  input parameter self :: <GtkTextIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_iter_get_chars_in_line";
end;

define inline-only C-function gtk-text-iter-get-child-anchor
  input parameter self :: <GtkTextIter>;
  result res :: <GtkTextChildAnchor>;
  c-name: "gtk_text_iter_get_child_anchor";
end;

define inline-only C-function gtk-text-iter-get-language
  input parameter self :: <GtkTextIter>;
  result res :: <PangoLanguage>;
  c-name: "gtk_text_iter_get_language";
end;

define inline-only C-function gtk-text-iter-get-line
  input parameter self :: <GtkTextIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_iter_get_line";
end;

define inline-only C-function gtk-text-iter-get-line-index
  input parameter self :: <GtkTextIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_iter_get_line_index";
end;

define inline-only C-function gtk-text-iter-get-line-offset
  input parameter self :: <GtkTextIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_iter_get_line_offset";
end;

define inline-only C-function gtk-text-iter-get-marks
  input parameter self :: <GtkTextIter>;
  result res :: <GSList>;
  c-name: "gtk_text_iter_get_marks";
end;

define inline-only C-function gtk-text-iter-get-offset
  input parameter self :: <GtkTextIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_iter_get_offset";
end;

define inline-only C-function gtk-text-iter-get-paintable
  input parameter self :: <GtkTextIter>;
  result res :: <GdkPaintable>;
  c-name: "gtk_text_iter_get_paintable";
end;

define inline-only C-function gtk-text-iter-get-slice
  input parameter self :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  result res :: <C-string>;
  c-name: "gtk_text_iter_get_slice";
end;

define inline-only C-function gtk-text-iter-get-tags
  input parameter self :: <GtkTextIter>;
  result res :: <GSList>;
  c-name: "gtk_text_iter_get_tags";
end;

define inline-only C-function gtk-text-iter-get-text
  input parameter self :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  result res :: <C-string>;
  c-name: "gtk_text_iter_get_text";
end;

define inline-only C-function gtk-text-iter-get-toggled-tags
  input parameter self :: <GtkTextIter>;
  input parameter toggled_on_ :: <C-boolean>;
  result res :: <GSList>;
  c-name: "gtk_text_iter_get_toggled_tags";
end;

define inline-only C-function gtk-text-iter-get-visible-line-index
  input parameter self :: <GtkTextIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_iter_get_visible_line_index";
end;

define inline-only C-function gtk-text-iter-get-visible-line-offset
  input parameter self :: <GtkTextIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_iter_get_visible_line_offset";
end;

define inline-only C-function gtk-text-iter-get-visible-slice
  input parameter self :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  result res :: <C-string>;
  c-name: "gtk_text_iter_get_visible_slice";
end;

define inline-only C-function gtk-text-iter-get-visible-text
  input parameter self :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  result res :: <C-string>;
  c-name: "gtk_text_iter_get_visible_text";
end;

define inline-only C-function gtk-text-iter-has-tag
  input parameter self :: <GtkTextIter>;
  input parameter tag_ :: <GtkTextTag>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_has_tag";
end;

define inline-only C-function gtk-text-iter-in-range
  input parameter self :: <GtkTextIter>;
  input parameter start_ :: <GtkTextIter>;
  input parameter end_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_in_range";
end;

define inline-only C-function gtk-text-iter-inside-sentence
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_inside_sentence";
end;

define inline-only C-function gtk-text-iter-inside-word
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_inside_word";
end;

define inline-only C-function gtk-text-iter-is-cursor-position
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_is_cursor_position";
end;

define inline-only C-function gtk-text-iter-is-end
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_is_end";
end;

define inline-only C-function gtk-text-iter-is-start
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_is_start";
end;

define inline-only C-function gtk-text-iter-order
  input parameter self :: <GtkTextIter>;
  input parameter second_ :: <GtkTextIter>;
  c-name: "gtk_text_iter_order";
end;

define inline-only C-function gtk-text-iter-set-line
  input parameter self :: <GtkTextIter>;
  input parameter line_number_ :: <C-signed-int>;
  c-name: "gtk_text_iter_set_line";
end;

define inline-only C-function gtk-text-iter-set-line-index
  input parameter self :: <GtkTextIter>;
  input parameter byte_on_line_ :: <C-signed-int>;
  c-name: "gtk_text_iter_set_line_index";
end;

define inline-only C-function gtk-text-iter-set-line-offset
  input parameter self :: <GtkTextIter>;
  input parameter char_on_line_ :: <C-signed-int>;
  c-name: "gtk_text_iter_set_line_offset";
end;

define inline-only C-function gtk-text-iter-set-offset
  input parameter self :: <GtkTextIter>;
  input parameter char_offset_ :: <C-signed-int>;
  c-name: "gtk_text_iter_set_offset";
end;

define inline-only C-function gtk-text-iter-set-visible-line-index
  input parameter self :: <GtkTextIter>;
  input parameter byte_on_line_ :: <C-signed-int>;
  c-name: "gtk_text_iter_set_visible_line_index";
end;

define inline-only C-function gtk-text-iter-set-visible-line-offset
  input parameter self :: <GtkTextIter>;
  input parameter char_on_line_ :: <C-signed-int>;
  c-name: "gtk_text_iter_set_visible_line_offset";
end;

define inline-only C-function gtk-text-iter-starts-line
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_starts_line";
end;

define inline-only C-function gtk-text-iter-starts-sentence
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_starts_sentence";
end;

define inline-only C-function gtk-text-iter-starts-tag
  input parameter self :: <GtkTextIter>;
  input parameter tag_ :: <GtkTextTag>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_starts_tag";
end;

define inline-only C-function gtk-text-iter-starts-word
  input parameter self :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_starts_word";
end;

define inline-only C-function gtk-text-iter-toggles-tag
  input parameter self :: <GtkTextIter>;
  input parameter tag_ :: <GtkTextTag>;
  result res :: <C-boolean>;
  c-name: "gtk_text_iter_toggles_tag";
end;

define open C-subtype <GtkTextMark> (<GObject>)
  // parent_instance
  // segment
end C-subtype;

define C-pointer-type <GtkTextMark*> => <GtkTextMark>;

define sealed domain make (singleton(<GtkTextMark*>));
define sealed domain initialize (<GtkTextMark*>);

define inline-only C-function gtk-text-mark-new
  input parameter name_ :: <C-string>;
  input parameter left_gravity_ :: <C-boolean>;
  result res :: <GtkTextMark>;
  c-name: "gtk_text_mark_new";
end;

define inline-only C-function gtk-text-mark-get-buffer
  input parameter self :: <GtkTextMark>;
  result res :: <GtkTextBuffer>;
  c-name: "gtk_text_mark_get_buffer";
end;

define inline-only C-function gtk-text-mark-get-deleted
  input parameter self :: <GtkTextMark>;
  result res :: <C-boolean>;
  c-name: "gtk_text_mark_get_deleted";
end;

define inline-only C-function gtk-text-mark-get-left-gravity
  input parameter self :: <GtkTextMark>;
  result res :: <C-boolean>;
  c-name: "gtk_text_mark_get_left_gravity";
end;

define inline-only C-function gtk-text-mark-get-name
  input parameter self :: <GtkTextMark>;
  result res :: <C-string>;
  c-name: "gtk_text_mark_get_name";
end;

define inline-only C-function gtk-text-mark-get-visible
  input parameter self :: <GtkTextMark>;
  result res :: <C-boolean>;
  c-name: "gtk_text_mark_get_visible";
end;

define inline-only C-function gtk-text-mark-set-visible
  input parameter self :: <GtkTextMark>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_text_mark_set_visible";
end;

define C-struct <_GtkTextMarkClass>
  constant sealed inline-only slot gtk-text-mark-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-text-mark-class-padding :: <C-void*>;
  pointer-type-name: <GtkTextMarkClass>;
end C-struct;

define sealed domain make (singleton(<GtkTextMarkClass>));
define sealed domain initialize (<GtkTextMarkClass>);

define inline-only constant $gtk-text-search-visible-only = 1;
define inline-only constant $gtk-text-search-text-only = 2;
define inline-only constant $gtk-text-search-case-insensitive = 4;
define constant <GtkTextSearchFlags> = <C-int>;
define C-pointer-type <GtkTextSearchFlags*> => <GtkTextSearchFlags>;

define open C-subtype <GtkTextTag> (<GObject>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GtkTextTag*> => <GtkTextTag>;

define sealed domain make (singleton(<GtkTextTag*>));
define sealed domain initialize (<GtkTextTag*>);

define inline-only C-function gtk-text-tag-new
  input parameter name_ :: <C-string>;
  result res :: <GtkTextTag>;
  c-name: "gtk_text_tag_new";
end;

define inline-only C-function gtk-text-tag-changed
  input parameter self :: <GtkTextTag>;
  input parameter size_changed_ :: <C-boolean>;
  c-name: "gtk_text_tag_changed";
end;

define inline-only C-function gtk-text-tag-get-priority
  input parameter self :: <GtkTextTag>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_tag_get_priority";
end;

define inline-only C-function gtk-text-tag-set-priority
  input parameter self :: <GtkTextTag>;
  input parameter priority_ :: <C-signed-int>;
  c-name: "gtk_text_tag_set_priority";
end;

define C-struct <_GtkTextTagClass>
  constant sealed inline-only slot gtk-text-tag-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-text-tag-class-padding :: <C-void*>;
  pointer-type-name: <GtkTextTagClass>;
end C-struct;

define sealed domain make (singleton(<GtkTextTagClass>));
define sealed domain initialize (<GtkTextTagClass>);

define C-struct <_GtkTextTagPrivate>
  pointer-type-name: <GtkTextTagPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkTextTagPrivate>));
define sealed domain initialize (<GtkTextTagPrivate>);

define open C-subtype <GtkTextTagTable> (<GObject>, <GtkBuildable>)
end C-subtype;

define C-pointer-type <GtkTextTagTable*> => <GtkTextTagTable>;

define sealed domain make (singleton(<GtkTextTagTable*>));
define sealed domain initialize (<GtkTextTagTable*>);

define inline-only C-function gtk-text-tag-table-new
  result res :: <GtkTextTagTable>;
  c-name: "gtk_text_tag_table_new";
end;

define inline-only C-function gtk-text-tag-table-add
  input parameter self :: <GtkTextTagTable>;
  input parameter tag_ :: <GtkTextTag>;
  result res :: <C-boolean>;
  c-name: "gtk_text_tag_table_add";
end;

define inline-only C-function gtk-text-tag-table-foreach
  input parameter self :: <GtkTextTagTable>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  c-name: "gtk_text_tag_table_foreach";
end;

define inline-only C-function gtk-text-tag-table-get-size
  input parameter self :: <GtkTextTagTable>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_tag_table_get_size";
end;

define inline-only C-function gtk-text-tag-table-lookup
  input parameter self :: <GtkTextTagTable>;
  input parameter name_ :: <C-string>;
  result res :: <GtkTextTag>;
  c-name: "gtk_text_tag_table_lookup";
end;

define inline-only C-function gtk-text-tag-table-remove
  input parameter self :: <GtkTextTagTable>;
  input parameter tag_ :: <GtkTextTag>;
  c-name: "gtk_text_tag_table_remove";
end;

define open C-subtype <GtkTextView> (<GtkWidget>, <GtkScrollable>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GtkTextView*> => <GtkTextView>;

define sealed domain make (singleton(<GtkTextView*>));
define sealed domain initialize (<GtkTextView*>);

define inline-only C-function gtk-text-view-new
  result res :: <GtkWidget>;
  c-name: "gtk_text_view_new";
end;

define inline-only C-function gtk-text-view-new-with-buffer
  input parameter buffer_ :: <GtkTextBuffer>;
  result res :: <GtkWidget>;
  c-name: "gtk_text_view_new_with_buffer";
end;

define inline-only C-function gtk-text-view-add-child-at-anchor
  input parameter self :: <GtkTextView>;
  input parameter child_ :: <GtkWidget>;
  input parameter anchor_ :: <GtkTextChildAnchor>;
  c-name: "gtk_text_view_add_child_at_anchor";
end;

define inline-only C-function gtk-text-view-add-overlay
  input parameter self :: <GtkTextView>;
  input parameter child_ :: <GtkWidget>;
  input parameter xpos_ :: <C-signed-int>;
  input parameter ypos_ :: <C-signed-int>;
  c-name: "gtk_text_view_add_overlay";
end;

define inline-only C-function gtk-text-view-backward-display-line
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_backward_display_line";
end;

define inline-only C-function gtk-text-view-backward-display-line-start
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_backward_display_line_start";
end;

define inline-only C-function gtk-text-view-buffer-to-window-coords
  input parameter self :: <GtkTextView>;
  input parameter win_ :: <GtkTextWindowType>;
  input parameter buffer_x_ :: <C-signed-int>;
  input parameter buffer_y_ :: <C-signed-int>;
  output parameter window_x_ :: <C-signed-int*>;
  output parameter window_y_ :: <C-signed-int*>;
  c-name: "gtk_text_view_buffer_to_window_coords";
end;

define inline-only C-function gtk-text-view-forward-display-line
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_forward_display_line";
end;

define inline-only C-function gtk-text-view-forward-display-line-end
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_forward_display_line_end";
end;

define inline-only C-function gtk-text-view-get-accepts-tab
  input parameter self :: <GtkTextView>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_get_accepts_tab";
end;

define inline-only C-function gtk-text-view-get-bottom-margin
  input parameter self :: <GtkTextView>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_view_get_bottom_margin";
end;

define inline-only C-function gtk-text-view-get-buffer
  input parameter self :: <GtkTextView>;
  result res :: <GtkTextBuffer>;
  c-name: "gtk_text_view_get_buffer";
end;

define inline-only C-function gtk-text-view-get-cursor-locations
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter strong_ :: <GdkRectangle>;
  input parameter weak_ :: <GdkRectangle>;
  c-name: "gtk_text_view_get_cursor_locations";
end;

define inline-only C-function gtk-text-view-get-cursor-visible
  input parameter self :: <GtkTextView>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_get_cursor_visible";
end;

define inline-only C-function gtk-text-view-get-editable
  input parameter self :: <GtkTextView>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_get_editable";
end;

define inline-only C-function gtk-text-view-get-extra-menu
  input parameter self :: <GtkTextView>;
  result res :: <GMenuModel>;
  c-name: "gtk_text_view_get_extra_menu";
end;

define inline-only C-function gtk-text-view-get-gutter
  input parameter self :: <GtkTextView>;
  input parameter win_ :: <GtkTextWindowType>;
  result res :: <GtkWidget>;
  c-name: "gtk_text_view_get_gutter";
end;

define inline-only C-function gtk-text-view-get-indent
  input parameter self :: <GtkTextView>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_view_get_indent";
end;

define inline-only C-function gtk-text-view-get-input-hints
  input parameter self :: <GtkTextView>;
  result res :: <GtkInputHints>;
  c-name: "gtk_text_view_get_input_hints";
end;

define inline-only C-function gtk-text-view-get-input-purpose
  input parameter self :: <GtkTextView>;
  result res :: <GtkInputPurpose>;
  c-name: "gtk_text_view_get_input_purpose";
end;

define inline-only C-function gtk-text-view-get-iter-at-location
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_get_iter_at_location";
end;

define inline-only C-function gtk-text-view-get-iter-at-position
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  output parameter trailing_ :: <C-signed-int*>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_get_iter_at_position";
end;

define inline-only C-function gtk-text-view-get-iter-location
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter location_ :: <GdkRectangle>;
  c-name: "gtk_text_view_get_iter_location";
end;

define inline-only C-function gtk-text-view-get-justification
  input parameter self :: <GtkTextView>;
  result res :: <GtkJustification>;
  c-name: "gtk_text_view_get_justification";
end;

define inline-only C-function gtk-text-view-get-left-margin
  input parameter self :: <GtkTextView>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_view_get_left_margin";
end;

define inline-only C-function gtk-text-view-get-line-at-y
  input parameter self :: <GtkTextView>;
  input parameter target_iter_ :: <GtkTextIter>;
  input parameter y_ :: <C-signed-int>;
  output parameter line_top_ :: <C-signed-int*>;
  c-name: "gtk_text_view_get_line_at_y";
end;

define inline-only C-function gtk-text-view-get-line-yrange
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  output parameter y_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_text_view_get_line_yrange";
end;

define inline-only C-function gtk-text-view-get-ltr-context
  input parameter self :: <GtkTextView>;
  result res :: <PangoContext>;
  c-name: "gtk_text_view_get_ltr_context";
end;

define inline-only C-function gtk-text-view-get-monospace
  input parameter self :: <GtkTextView>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_get_monospace";
end;

define inline-only C-function gtk-text-view-get-overwrite
  input parameter self :: <GtkTextView>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_get_overwrite";
end;

define inline-only C-function gtk-text-view-get-pixels-above-lines
  input parameter self :: <GtkTextView>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_view_get_pixels_above_lines";
end;

define inline-only C-function gtk-text-view-get-pixels-below-lines
  input parameter self :: <GtkTextView>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_view_get_pixels_below_lines";
end;

define inline-only C-function gtk-text-view-get-pixels-inside-wrap
  input parameter self :: <GtkTextView>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_view_get_pixels_inside_wrap";
end;

define inline-only C-function gtk-text-view-get-right-margin
  input parameter self :: <GtkTextView>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_view_get_right_margin";
end;

define inline-only C-function gtk-text-view-get-rtl-context
  input parameter self :: <GtkTextView>;
  result res :: <PangoContext>;
  c-name: "gtk_text_view_get_rtl_context";
end;

define inline-only C-function gtk-text-view-get-tabs
  input parameter self :: <GtkTextView>;
  result res :: <PangoTabArray>;
  c-name: "gtk_text_view_get_tabs";
end;

define inline-only C-function gtk-text-view-get-top-margin
  input parameter self :: <GtkTextView>;
  result res :: <C-signed-int>;
  c-name: "gtk_text_view_get_top_margin";
end;

define inline-only C-function gtk-text-view-get-visible-rect
  input parameter self :: <GtkTextView>;
  input parameter visible_rect_ :: <GdkRectangle>;
  c-name: "gtk_text_view_get_visible_rect";
end;

define inline-only C-function gtk-text-view-get-wrap-mode
  input parameter self :: <GtkTextView>;
  result res :: <GtkWrapMode>;
  c-name: "gtk_text_view_get_wrap_mode";
end;

define inline-only C-function gtk-text-view-im-context-filter-keypress
  input parameter self :: <GtkTextView>;
  input parameter event_ :: <GdkEvent>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_im_context_filter_keypress";
end;

define inline-only C-function gtk-text-view-move-mark-onscreen
  input parameter self :: <GtkTextView>;
  input parameter mark_ :: <GtkTextMark>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_move_mark_onscreen";
end;

define inline-only C-function gtk-text-view-move-overlay
  input parameter self :: <GtkTextView>;
  input parameter child_ :: <GtkWidget>;
  input parameter xpos_ :: <C-signed-int>;
  input parameter ypos_ :: <C-signed-int>;
  c-name: "gtk_text_view_move_overlay";
end;

define inline-only C-function gtk-text-view-move-visually
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter count_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_move_visually";
end;

define inline-only C-function gtk-text-view-place-cursor-onscreen
  input parameter self :: <GtkTextView>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_place_cursor_onscreen";
end;

define inline-only C-function gtk-text-view-remove
  input parameter self :: <GtkTextView>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_text_view_remove";
end;

define inline-only C-function gtk-text-view-reset-cursor-blink
  input parameter self :: <GtkTextView>;
  c-name: "gtk_text_view_reset_cursor_blink";
end;

define inline-only C-function gtk-text-view-reset-im-context
  input parameter self :: <GtkTextView>;
  c-name: "gtk_text_view_reset_im_context";
end;

define inline-only C-function gtk-text-view-scroll-mark-onscreen
  input parameter self :: <GtkTextView>;
  input parameter mark_ :: <GtkTextMark>;
  c-name: "gtk_text_view_scroll_mark_onscreen";
end;

define inline-only C-function gtk-text-view-scroll-to-iter
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  input parameter within_margin_ :: <C-double>;
  input parameter use_align_ :: <C-boolean>;
  input parameter xalign_ :: <C-double>;
  input parameter yalign_ :: <C-double>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_scroll_to_iter";
end;

define inline-only C-function gtk-text-view-scroll-to-mark
  input parameter self :: <GtkTextView>;
  input parameter mark_ :: <GtkTextMark>;
  input parameter within_margin_ :: <C-double>;
  input parameter use_align_ :: <C-boolean>;
  input parameter xalign_ :: <C-double>;
  input parameter yalign_ :: <C-double>;
  c-name: "gtk_text_view_scroll_to_mark";
end;

define inline-only C-function gtk-text-view-set-accepts-tab
  input parameter self :: <GtkTextView>;
  input parameter accepts_tab_ :: <C-boolean>;
  c-name: "gtk_text_view_set_accepts_tab";
end;

define inline-only C-function gtk-text-view-set-bottom-margin
  input parameter self :: <GtkTextView>;
  input parameter bottom_margin_ :: <C-signed-int>;
  c-name: "gtk_text_view_set_bottom_margin";
end;

define inline-only C-function gtk-text-view-set-buffer
  input parameter self :: <GtkTextView>;
  input parameter buffer_ :: <GtkTextBuffer>;
  c-name: "gtk_text_view_set_buffer";
end;

define inline-only C-function gtk-text-view-set-cursor-visible
  input parameter self :: <GtkTextView>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_text_view_set_cursor_visible";
end;

define inline-only C-function gtk-text-view-set-editable
  input parameter self :: <GtkTextView>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_text_view_set_editable";
end;

define inline-only C-function gtk-text-view-set-extra-menu
  input parameter self :: <GtkTextView>;
  input parameter model_ :: <GMenuModel>;
  c-name: "gtk_text_view_set_extra_menu";
end;

define inline-only C-function gtk-text-view-set-gutter
  input parameter self :: <GtkTextView>;
  input parameter win_ :: <GtkTextWindowType>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_text_view_set_gutter";
end;

define inline-only C-function gtk-text-view-set-indent
  input parameter self :: <GtkTextView>;
  input parameter indent_ :: <C-signed-int>;
  c-name: "gtk_text_view_set_indent";
end;

define inline-only C-function gtk-text-view-set-input-hints
  input parameter self :: <GtkTextView>;
  input parameter hints_ :: <GtkInputHints>;
  c-name: "gtk_text_view_set_input_hints";
end;

define inline-only C-function gtk-text-view-set-input-purpose
  input parameter self :: <GtkTextView>;
  input parameter purpose_ :: <GtkInputPurpose>;
  c-name: "gtk_text_view_set_input_purpose";
end;

define inline-only C-function gtk-text-view-set-justification
  input parameter self :: <GtkTextView>;
  input parameter justification_ :: <GtkJustification>;
  c-name: "gtk_text_view_set_justification";
end;

define inline-only C-function gtk-text-view-set-left-margin
  input parameter self :: <GtkTextView>;
  input parameter left_margin_ :: <C-signed-int>;
  c-name: "gtk_text_view_set_left_margin";
end;

define inline-only C-function gtk-text-view-set-monospace
  input parameter self :: <GtkTextView>;
  input parameter monospace_ :: <C-boolean>;
  c-name: "gtk_text_view_set_monospace";
end;

define inline-only C-function gtk-text-view-set-overwrite
  input parameter self :: <GtkTextView>;
  input parameter overwrite_ :: <C-boolean>;
  c-name: "gtk_text_view_set_overwrite";
end;

define inline-only C-function gtk-text-view-set-pixels-above-lines
  input parameter self :: <GtkTextView>;
  input parameter pixels_above_lines_ :: <C-signed-int>;
  c-name: "gtk_text_view_set_pixels_above_lines";
end;

define inline-only C-function gtk-text-view-set-pixels-below-lines
  input parameter self :: <GtkTextView>;
  input parameter pixels_below_lines_ :: <C-signed-int>;
  c-name: "gtk_text_view_set_pixels_below_lines";
end;

define inline-only C-function gtk-text-view-set-pixels-inside-wrap
  input parameter self :: <GtkTextView>;
  input parameter pixels_inside_wrap_ :: <C-signed-int>;
  c-name: "gtk_text_view_set_pixels_inside_wrap";
end;

define inline-only C-function gtk-text-view-set-right-margin
  input parameter self :: <GtkTextView>;
  input parameter right_margin_ :: <C-signed-int>;
  c-name: "gtk_text_view_set_right_margin";
end;

define inline-only C-function gtk-text-view-set-tabs
  input parameter self :: <GtkTextView>;
  input parameter tabs_ :: <PangoTabArray>;
  c-name: "gtk_text_view_set_tabs";
end;

define inline-only C-function gtk-text-view-set-top-margin
  input parameter self :: <GtkTextView>;
  input parameter top_margin_ :: <C-signed-int>;
  c-name: "gtk_text_view_set_top_margin";
end;

define inline-only C-function gtk-text-view-set-wrap-mode
  input parameter self :: <GtkTextView>;
  input parameter wrap_mode_ :: <GtkWrapMode>;
  c-name: "gtk_text_view_set_wrap_mode";
end;

define inline-only C-function gtk-text-view-starts-display-line
  input parameter self :: <GtkTextView>;
  input parameter iter_ :: <GtkTextIter>;
  result res :: <C-boolean>;
  c-name: "gtk_text_view_starts_display_line";
end;

define inline-only C-function gtk-text-view-window-to-buffer-coords
  input parameter self :: <GtkTextView>;
  input parameter win_ :: <GtkTextWindowType>;
  input parameter window_x_ :: <C-signed-int>;
  input parameter window_y_ :: <C-signed-int>;
  output parameter buffer_x_ :: <C-signed-int*>;
  output parameter buffer_y_ :: <C-signed-int*>;
  c-name: "gtk_text_view_window_to_buffer_coords";
end;

define C-struct <_GtkTextViewClass>
  constant sealed inline-only slot gtk-text-view-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-text-view-class-move-cursor :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-set-anchor :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-insert-at-cursor :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-delete-from-cursor :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-backspace :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-cut-clipboard :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-copy-clipboard :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-paste-clipboard :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-toggle-overwrite :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-create-buffer :: <C-void*>;
  constant sealed inline-only slot gtk-text-view-class-snapshot-layer :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-extend-selection :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-insert-emoji :: <C-function-pointer>;
  constant sealed inline-only slot gtk-text-view-class-padding :: <C-void*>;
  pointer-type-name: <GtkTextViewClass>;
end C-struct;

define sealed domain make (singleton(<GtkTextViewClass>));
define sealed domain initialize (<GtkTextViewClass>);

define inline-only constant $gtk-text-view-layer-below-text = 0;
define inline-only constant $gtk-text-view-layer-above-text = 1;
define constant <GtkTextViewLayer> = <C-int>;
define C-pointer-type <GtkTextViewLayer*> => <GtkTextViewLayer>;

define C-struct <_GtkTextViewPrivate>
  pointer-type-name: <GtkTextViewPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkTextViewPrivate>));
define sealed domain initialize (<GtkTextViewPrivate>);

define inline-only constant $gtk-text-window-widget = 1;
define inline-only constant $gtk-text-window-text = 2;
define inline-only constant $gtk-text-window-left = 3;
define inline-only constant $gtk-text-window-right = 4;
define inline-only constant $gtk-text-window-top = 5;
define inline-only constant $gtk-text-window-bottom = 6;
define constant <GtkTextWindowType> = <C-int>;
define C-pointer-type <GtkTextWindowType*> => <GtkTextWindowType>;

define open C-subtype <GtkToggleButton> (<GtkButton>)
  // button
end C-subtype;

define C-pointer-type <GtkToggleButton*> => <GtkToggleButton>;

define sealed domain make (singleton(<GtkToggleButton*>));
define sealed domain initialize (<GtkToggleButton*>);

define inline-only C-function gtk-toggle-button-new
  result res :: <GtkWidget>;
  c-name: "gtk_toggle_button_new";
end;

define inline-only C-function gtk-toggle-button-new-with-label
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_toggle_button_new_with_label";
end;

define inline-only C-function gtk-toggle-button-new-with-mnemonic
  input parameter label_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_toggle_button_new_with_mnemonic";
end;

define inline-only C-function gtk-toggle-button-get-active
  input parameter self :: <GtkToggleButton>;
  result res :: <C-boolean>;
  c-name: "gtk_toggle_button_get_active";
end;

define inline-only C-function gtk-toggle-button-set-active
  input parameter self :: <GtkToggleButton>;
  input parameter is_active_ :: <C-boolean>;
  c-name: "gtk_toggle_button_set_active";
end;

define inline-only C-function gtk-toggle-button-set-group
  input parameter self :: <GtkToggleButton>;
  input parameter group_ :: <GtkToggleButton>;
  c-name: "gtk_toggle_button_set_group";
end;

define inline-only C-function gtk-toggle-button-toggled
  input parameter self :: <GtkToggleButton>;
  c-name: "gtk_toggle_button_toggled";
end;

define C-struct <_GtkToggleButtonClass>
  constant sealed inline-only slot gtk-toggle-button-class-parent-class :: <GtkButtonClass>;
  constant sealed inline-only slot gtk-toggle-button-class-toggled :: <C-function-pointer>;
  constant sealed inline-only slot gtk-toggle-button-class-padding :: <C-void*>;
  pointer-type-name: <GtkToggleButtonClass>;
end C-struct;

define sealed domain make (singleton(<GtkToggleButtonClass>));
define sealed domain initialize (<GtkToggleButtonClass>);

define open C-subtype <GtkTooltip> (<GObject>)
end C-subtype;

define C-pointer-type <GtkTooltip*> => <GtkTooltip>;

define sealed domain make (singleton(<GtkTooltip*>));
define sealed domain initialize (<GtkTooltip*>);

define inline-only C-function gtk-tooltip-set-custom
  input parameter self :: <GtkTooltip>;
  input parameter custom_widget_ :: <GtkWidget>;
  c-name: "gtk_tooltip_set_custom";
end;

define inline-only C-function gtk-tooltip-set-icon
  input parameter self :: <GtkTooltip>;
  input parameter paintable_ :: <GdkPaintable>;
  c-name: "gtk_tooltip_set_icon";
end;

define inline-only C-function gtk-tooltip-set-icon-from-gicon
  input parameter self :: <GtkTooltip>;
  input parameter gicon_ :: <GIcon>;
  c-name: "gtk_tooltip_set_icon_from_gicon";
end;

define inline-only C-function gtk-tooltip-set-icon-from-icon-name
  input parameter self :: <GtkTooltip>;
  input parameter icon_name_ :: <C-string>;
  c-name: "gtk_tooltip_set_icon_from_icon_name";
end;

define inline-only C-function gtk-tooltip-set-markup
  input parameter self :: <GtkTooltip>;
  input parameter markup_ :: <C-string>;
  c-name: "gtk_tooltip_set_markup";
end;

define inline-only C-function gtk-tooltip-set-text
  input parameter self :: <GtkTooltip>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_tooltip_set_text";
end;

define inline-only C-function gtk-tooltip-set-tip-area
  input parameter self :: <GtkTooltip>;
  input parameter rect_ :: <GdkRectangle>;
  c-name: "gtk_tooltip_set_tip_area";
end;

// Interface
define open C-subtype <GtkTreeDragDest> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkTreeDragDest*> => <GtkTreeDragDest>;

define sealed domain make (singleton(<GtkTreeDragDest*>));
define sealed domain initialize (<GtkTreeDragDest*>);

define inline-only C-function gtk-tree-drag-dest-drag-data-received
  input parameter self :: <GtkTreeDragDest>;
  input parameter dest_ :: <GtkTreePath>;
  input parameter value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_drag_dest_drag_data_received";
end;

define inline-only C-function gtk-tree-drag-dest-row-drop-possible
  input parameter self :: <GtkTreeDragDest>;
  input parameter dest_path_ :: <GtkTreePath>;
  input parameter value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_drag_dest_row_drop_possible";
end;

define C-struct <_GtkTreeDragDestIface>
  constant sealed inline-only slot gtk-tree-drag-dest-iface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-tree-drag-dest-iface-drag-data-received :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-drag-dest-iface-row-drop-possible :: <C-function-pointer>;
  pointer-type-name: <GtkTreeDragDestIface>;
end C-struct;

define sealed domain make (singleton(<GtkTreeDragDestIface>));
define sealed domain initialize (<GtkTreeDragDestIface>);

// Interface
define open C-subtype <GtkTreeDragSource> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkTreeDragSource*> => <GtkTreeDragSource>;

define sealed domain make (singleton(<GtkTreeDragSource*>));
define sealed domain initialize (<GtkTreeDragSource*>);

define inline-only C-function gtk-tree-drag-source-drag-data-delete
  input parameter self :: <GtkTreeDragSource>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_drag_source_drag_data_delete";
end;

define inline-only C-function gtk-tree-drag-source-drag-data-get
  input parameter self :: <GtkTreeDragSource>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <GdkContentProvider>;
  c-name: "gtk_tree_drag_source_drag_data_get";
end;

define inline-only C-function gtk-tree-drag-source-row-draggable
  input parameter self :: <GtkTreeDragSource>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_drag_source_row_draggable";
end;

define C-struct <_GtkTreeDragSourceIface>
  constant sealed inline-only slot gtk-tree-drag-source-iface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-tree-drag-source-iface-row-draggable :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-drag-source-iface-drag-data-get :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-drag-source-iface-drag-data-delete :: <C-function-pointer>;
  pointer-type-name: <GtkTreeDragSourceIface>;
end C-struct;

define sealed domain make (singleton(<GtkTreeDragSourceIface>));
define sealed domain initialize (<GtkTreeDragSourceIface>);

define open C-subtype <GtkTreeExpander> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkTreeExpander*> => <GtkTreeExpander>;

define sealed domain make (singleton(<GtkTreeExpander*>));
define sealed domain initialize (<GtkTreeExpander*>);

define inline-only C-function gtk-tree-expander-new
  result res :: <GtkWidget>;
  c-name: "gtk_tree_expander_new";
end;

define inline-only C-function gtk-tree-expander-get-child
  input parameter self :: <GtkTreeExpander>;
  result res :: <GtkWidget>;
  c-name: "gtk_tree_expander_get_child";
end;

define inline-only C-function gtk-tree-expander-get-indent-for-icon
  input parameter self :: <GtkTreeExpander>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_expander_get_indent_for_icon";
end;

define inline-only C-function gtk-tree-expander-get-item
  input parameter self :: <GtkTreeExpander>;
  result res :: <GObject>;
  c-name: "gtk_tree_expander_get_item";
end;

define inline-only C-function gtk-tree-expander-get-list-row
  input parameter self :: <GtkTreeExpander>;
  result res :: <GtkTreeListRow>;
  c-name: "gtk_tree_expander_get_list_row";
end;

define inline-only C-function gtk-tree-expander-set-child
  input parameter self :: <GtkTreeExpander>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_tree_expander_set_child";
end;

define inline-only C-function gtk-tree-expander-set-indent-for-icon
  input parameter self :: <GtkTreeExpander>;
  input parameter indent_for_icon_ :: <C-boolean>;
  c-name: "gtk_tree_expander_set_indent_for_icon";
end;

define inline-only C-function gtk-tree-expander-set-list-row
  input parameter self :: <GtkTreeExpander>;
  input parameter list_row_ :: <GtkTreeListRow>;
  c-name: "gtk_tree_expander_set_list_row";
end;

define C-struct <_GtkTreeExpanderClass>
  constant sealed inline-only slot gtk-tree-expander-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkTreeExpanderClass>;
end C-struct;

define sealed domain make (singleton(<GtkTreeExpanderClass>));
define sealed domain initialize (<GtkTreeExpanderClass>);

define C-struct <_GtkTreeIter>
  sealed inline-only slot gtk-tree-iter-stamp :: <C-signed-int>;
  sealed inline-only slot gtk-tree-iter-user-data :: <C-void*>;
  sealed inline-only slot gtk-tree-iter-user-data2 :: <C-void*>;
  sealed inline-only slot gtk-tree-iter-user-data3 :: <C-void*>;
  pointer-type-name: <GtkTreeIter>;
end C-struct;

define sealed domain make (singleton(<GtkTreeIter>));
define sealed domain initialize (<GtkTreeIter>);

define inline-only C-function gtk-tree-iter-copy
  input parameter self :: <GtkTreeIter>;
  result res :: <GtkTreeIter>;
  c-name: "gtk_tree_iter_copy";
end;

define inline-only C-function gtk-tree-iter-free
  input parameter self :: <GtkTreeIter>;
  c-name: "gtk_tree_iter_free";
end;

define open C-subtype <GtkTreeListModel> (<GObject>, <GListModel>)
end C-subtype;

define C-pointer-type <GtkTreeListModel*> => <GtkTreeListModel>;

define sealed domain make (singleton(<GtkTreeListModel*>));
define sealed domain initialize (<GtkTreeListModel*>);

define inline-only C-function gtk-tree-list-model-new
  input parameter root_ :: <GListModel>;
  input parameter passthrough_ :: <C-boolean>;
  input parameter autoexpand_ :: <C-boolean>;
  input parameter create_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter user_destroy_ :: <C-function-pointer>;
  result res :: <GtkTreeListModel>;
  c-name: "gtk_tree_list_model_new";
end;

define inline-only C-function gtk-tree-list-model-get-autoexpand
  input parameter self :: <GtkTreeListModel>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_list_model_get_autoexpand";
end;

define inline-only C-function gtk-tree-list-model-get-child-row
  input parameter self :: <GtkTreeListModel>;
  input parameter position_ :: <C-unsigned-int>;
  result res :: <GtkTreeListRow>;
  c-name: "gtk_tree_list_model_get_child_row";
end;

define inline-only C-function gtk-tree-list-model-get-model
  input parameter self :: <GtkTreeListModel>;
  result res :: <GListModel>;
  c-name: "gtk_tree_list_model_get_model";
end;

define inline-only C-function gtk-tree-list-model-get-passthrough
  input parameter self :: <GtkTreeListModel>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_list_model_get_passthrough";
end;

define inline-only C-function gtk-tree-list-model-get-row
  input parameter self :: <GtkTreeListModel>;
  input parameter position_ :: <C-unsigned-int>;
  result res :: <GtkTreeListRow>;
  c-name: "gtk_tree_list_model_get_row";
end;

define inline-only C-function gtk-tree-list-model-set-autoexpand
  input parameter self :: <GtkTreeListModel>;
  input parameter autoexpand_ :: <C-boolean>;
  c-name: "gtk_tree_list_model_set_autoexpand";
end;

define C-struct <_GtkTreeListModelClass>
  constant sealed inline-only slot gtk-tree-list-model-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkTreeListModelClass>;
end C-struct;

define sealed domain make (singleton(<GtkTreeListModelClass>));
define sealed domain initialize (<GtkTreeListModelClass>);

define open C-subtype <GtkTreeListRow> (<GObject>)
end C-subtype;

define C-pointer-type <GtkTreeListRow*> => <GtkTreeListRow>;

define sealed domain make (singleton(<GtkTreeListRow*>));
define sealed domain initialize (<GtkTreeListRow*>);

define inline-only C-function gtk-tree-list-row-get-child-row
  input parameter self :: <GtkTreeListRow>;
  input parameter position_ :: <C-unsigned-int>;
  result res :: <GtkTreeListRow>;
  c-name: "gtk_tree_list_row_get_child_row";
end;

define inline-only C-function gtk-tree-list-row-get-children
  input parameter self :: <GtkTreeListRow>;
  result res :: <GListModel>;
  c-name: "gtk_tree_list_row_get_children";
end;

define inline-only C-function gtk-tree-list-row-get-depth
  input parameter self :: <GtkTreeListRow>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_tree_list_row_get_depth";
end;

define inline-only C-function gtk-tree-list-row-get-expanded
  input parameter self :: <GtkTreeListRow>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_list_row_get_expanded";
end;

define inline-only C-function gtk-tree-list-row-get-item
  input parameter self :: <GtkTreeListRow>;
  result res :: <GObject>;
  c-name: "gtk_tree_list_row_get_item";
end;

define inline-only C-function gtk-tree-list-row-get-parent
  input parameter self :: <GtkTreeListRow>;
  result res :: <GtkTreeListRow>;
  c-name: "gtk_tree_list_row_get_parent";
end;

define inline-only C-function gtk-tree-list-row-get-position
  input parameter self :: <GtkTreeListRow>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_tree_list_row_get_position";
end;

define inline-only C-function gtk-tree-list-row-is-expandable
  input parameter self :: <GtkTreeListRow>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_list_row_is_expandable";
end;

define inline-only C-function gtk-tree-list-row-set-expanded
  input parameter self :: <GtkTreeListRow>;
  input parameter expanded_ :: <C-boolean>;
  c-name: "gtk_tree_list_row_set_expanded";
end;

define C-struct <_GtkTreeListRowClass>
  constant sealed inline-only slot gtk-tree-list-row-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkTreeListRowClass>;
end C-struct;

define sealed domain make (singleton(<GtkTreeListRowClass>));
define sealed domain initialize (<GtkTreeListRowClass>);

define open C-subtype <GtkTreeListRowSorter> (<GtkSorter>)
end C-subtype;

define C-pointer-type <GtkTreeListRowSorter*> => <GtkTreeListRowSorter>;

define sealed domain make (singleton(<GtkTreeListRowSorter*>));
define sealed domain initialize (<GtkTreeListRowSorter*>);

define inline-only C-function gtk-tree-list-row-sorter-new
  input parameter sorter_ :: <GtkSorter>;
  result res :: <GtkTreeListRowSorter>;
  c-name: "gtk_tree_list_row_sorter_new";
end;

define inline-only C-function gtk-tree-list-row-sorter-get-sorter
  input parameter self :: <GtkTreeListRowSorter>;
  result res :: <GtkSorter>;
  c-name: "gtk_tree_list_row_sorter_get_sorter";
end;

define inline-only C-function gtk-tree-list-row-sorter-set-sorter
  input parameter self :: <GtkTreeListRowSorter>;
  input parameter sorter_ :: <GtkSorter>;
  c-name: "gtk_tree_list_row_sorter_set_sorter";
end;

define C-struct <_GtkTreeListRowSorterClass>
  constant sealed inline-only slot gtk-tree-list-row-sorter-class-parent-class :: <GtkSorterClass>;
  pointer-type-name: <GtkTreeListRowSorterClass>;
end C-struct;

define sealed domain make (singleton(<GtkTreeListRowSorterClass>));
define sealed domain initialize (<GtkTreeListRowSorterClass>);

// Interface
define open C-subtype <GtkTreeModel> (<C-void*>)
end C-subtype;

define C-pointer-type <GtkTreeModel*> => <GtkTreeModel>;

define sealed domain make (singleton(<GtkTreeModel*>));
define sealed domain initialize (<GtkTreeModel*>);

define inline-only C-function gtk-tree-model-filter-new
  input parameter self :: <GtkTreeModel>;
  input parameter root_ :: <GtkTreePath>;
  result res :: <GtkTreeModel>;
  c-name: "gtk_tree_model_filter_new";
end;

define inline-only C-function gtk-tree-model-foreach
  input parameter self :: <GtkTreeModel>;
  input parameter func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gtk_tree_model_foreach";
end;

define inline-only C-function gtk-tree-model-get-column-type
  input parameter self :: <GtkTreeModel>;
  input parameter index__ :: <C-signed-int>;
  result res :: <C-long>;
  c-name: "gtk_tree_model_get_column_type";
end;

define inline-only C-function gtk-tree-model-get-flags
  input parameter self :: <GtkTreeModel>;
  result res :: <GtkTreeModelFlags>;
  c-name: "gtk_tree_model_get_flags";
end;

define inline-only C-function gtk-tree-model-get-iter
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_get_iter";
end;

define inline-only C-function gtk-tree-model-get-iter-first
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_get_iter_first";
end;

define inline-only C-function gtk-tree-model-get-iter-from-string
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter path_string_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_get_iter_from_string";
end;

define inline-only C-function gtk-tree-model-get-n-columns
  input parameter self :: <GtkTreeModel>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_model_get_n_columns";
end;

define inline-only C-function gtk-tree-model-get-path
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_model_get_path";
end;

define inline-only C-function gtk-tree-model-get-string-from-iter
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-string>;
  c-name: "gtk_tree_model_get_string_from_iter";
end;

define inline-only C-function gtk-tree-model-get-value
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter column_ :: <C-signed-int>;
  input parameter value_ :: <GValue>;
  c-name: "gtk_tree_model_get_value";
end;

define inline-only C-function gtk-tree-model-iter-children
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter parent_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_iter_children";
end;

define inline-only C-function gtk-tree-model-iter-has-child
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_iter_has_child";
end;

define inline-only C-function gtk-tree-model-iter-n-children
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_model_iter_n_children";
end;

define inline-only C-function gtk-tree-model-iter-next
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_iter_next";
end;

define inline-only C-function gtk-tree-model-iter-nth-child
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter parent_ :: <GtkTreeIter>;
  input parameter n_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_iter_nth_child";
end;

define inline-only C-function gtk-tree-model-iter-parent
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter child_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_iter_parent";
end;

define inline-only C-function gtk-tree-model-iter-previous
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_iter_previous";
end;

define inline-only C-function gtk-tree-model-ref-node
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_tree_model_ref_node";
end;

define inline-only C-function gtk-tree-model-row-changed
  input parameter self :: <GtkTreeModel>;
  input parameter path_ :: <GtkTreePath>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_tree_model_row_changed";
end;

define inline-only C-function gtk-tree-model-row-deleted
  input parameter self :: <GtkTreeModel>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_tree_model_row_deleted";
end;

define inline-only C-function gtk-tree-model-row-has-child-toggled
  input parameter self :: <GtkTreeModel>;
  input parameter path_ :: <GtkTreePath>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_tree_model_row_has_child_toggled";
end;

define inline-only C-function gtk-tree-model-row-inserted
  input parameter self :: <GtkTreeModel>;
  input parameter path_ :: <GtkTreePath>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_tree_model_row_inserted";
end;

define inline-only C-function gtk-tree-model-rows-reordered-with-length
  input parameter self :: <GtkTreeModel>;
  input parameter path_ :: <GtkTreePath>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter new_order_ :: <C-signed-int*>;
  input parameter length_ :: <C-signed-int>;
  c-name: "gtk_tree_model_rows_reordered_with_length";
end;

define inline-only C-function gtk-tree-model-unref-node
  input parameter self :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_tree_model_unref_node";
end;

define open C-subtype <GtkTreeModelFilter> (<GObject>, <GtkTreeDragSource>, <GtkTreeModel>)
  // parent
  // priv
end C-subtype;

define C-pointer-type <GtkTreeModelFilter*> => <GtkTreeModelFilter>;

define sealed domain make (singleton(<GtkTreeModelFilter*>));
define sealed domain initialize (<GtkTreeModelFilter*>);

define inline-only C-function gtk-tree-model-filter-clear-cache
  input parameter self :: <GtkTreeModelFilter>;
  c-name: "gtk_tree_model_filter_clear_cache";
end;

define inline-only C-function gtk-tree-model-filter-convert-child-iter-to-iter
  input parameter self :: <GtkTreeModelFilter>;
  input parameter filter_iter_ :: <GtkTreeIter>;
  input parameter child_iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_filter_convert_child_iter_to_iter";
end;

define inline-only C-function gtk-tree-model-filter-convert-child-path-to-path
  input parameter self :: <GtkTreeModelFilter>;
  input parameter child_path_ :: <GtkTreePath>;
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_model_filter_convert_child_path_to_path";
end;

define inline-only C-function gtk-tree-model-filter-convert-iter-to-child-iter
  input parameter self :: <GtkTreeModelFilter>;
  input parameter child_iter_ :: <GtkTreeIter>;
  input parameter filter_iter_ :: <GtkTreeIter>;
  c-name: "gtk_tree_model_filter_convert_iter_to_child_iter";
end;

define inline-only C-function gtk-tree-model-filter-convert-path-to-child-path
  input parameter self :: <GtkTreeModelFilter>;
  input parameter filter_path_ :: <GtkTreePath>;
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_model_filter_convert_path_to_child_path";
end;

define inline-only C-function gtk-tree-model-filter-get-model
  input parameter self :: <GtkTreeModelFilter>;
  result res :: <GtkTreeModel>;
  c-name: "gtk_tree_model_filter_get_model";
end;

define inline-only C-function gtk-tree-model-filter-refilter
  input parameter self :: <GtkTreeModelFilter>;
  c-name: "gtk_tree_model_filter_refilter";
end;

define inline-only C-function gtk-tree-model-filter-set-modify-func
  input parameter self :: <GtkTreeModelFilter>;
  input parameter n_columns_ :: <C-signed-int>;
  input parameter types_ :: <C-long*>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_tree_model_filter_set_modify_func";
end;

define inline-only C-function gtk-tree-model-filter-set-visible-column
  input parameter self :: <GtkTreeModelFilter>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_tree_model_filter_set_visible_column";
end;

define inline-only C-function gtk-tree-model-filter-set-visible-func
  input parameter self :: <GtkTreeModelFilter>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_tree_model_filter_set_visible_func";
end;

define C-struct <_GtkTreeModelFilterClass>
  constant sealed inline-only slot gtk-tree-model-filter-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-tree-model-filter-class-visible :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-filter-class-modify :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-filter-class-padding :: <C-void*>;
  pointer-type-name: <GtkTreeModelFilterClass>;
end C-struct;

define sealed domain make (singleton(<GtkTreeModelFilterClass>));
define sealed domain initialize (<GtkTreeModelFilterClass>);

define C-struct <_GtkTreeModelFilterPrivate>
  pointer-type-name: <GtkTreeModelFilterPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkTreeModelFilterPrivate>));
define sealed domain initialize (<GtkTreeModelFilterPrivate>);

define inline-only constant $gtk-tree-model-iters-persist = 1;
define inline-only constant $gtk-tree-model-list-only = 2;
define constant <GtkTreeModelFlags> = <C-int>;
define C-pointer-type <GtkTreeModelFlags*> => <GtkTreeModelFlags>;

define C-struct <_GtkTreeModelIface>
  constant sealed inline-only slot gtk-tree-model-iface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-tree-model-iface-row-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-row-inserted :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-row-has-child-toggled :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-row-deleted :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-rows-reordered :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-get-flags :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-get-n-columns :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-get-column-type :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-get-iter :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-get-path :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-get-value :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-iter-next :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-iter-previous :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-iter-children :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-iter-has-child :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-iter-n-children :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-iter-nth-child :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-iter-parent :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-ref-node :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-model-iface-unref-node :: <C-function-pointer>;
  pointer-type-name: <GtkTreeModelIface>;
end C-struct;

define sealed domain make (singleton(<GtkTreeModelIface>));
define sealed domain initialize (<GtkTreeModelIface>);

define open C-subtype <GtkTreeModelSort> (<GObject>, <GtkTreeDragSource>, <GtkTreeSortable>)
  // parent
  // priv
end C-subtype;

define C-pointer-type <GtkTreeModelSort*> => <GtkTreeModelSort>;

define sealed domain make (singleton(<GtkTreeModelSort*>));
define sealed domain initialize (<GtkTreeModelSort*>);

define inline-only C-function gtk-tree-model-sort-new-with-model
  input parameter child_model_ :: <GtkTreeModel>;
  result res :: <GtkTreeModelSort>;
  c-name: "gtk_tree_model_sort_new_with_model";
end;

define inline-only C-function gtk-tree-model-sort-clear-cache
  input parameter self :: <GtkTreeModelSort>;
  c-name: "gtk_tree_model_sort_clear_cache";
end;

define inline-only C-function gtk-tree-model-sort-convert-child-iter-to-iter
  input parameter self :: <GtkTreeModelSort>;
  input parameter sort_iter_ :: <GtkTreeIter>;
  input parameter child_iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_sort_convert_child_iter_to_iter";
end;

define inline-only C-function gtk-tree-model-sort-convert-child-path-to-path
  input parameter self :: <GtkTreeModelSort>;
  input parameter child_path_ :: <GtkTreePath>;
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_model_sort_convert_child_path_to_path";
end;

define inline-only C-function gtk-tree-model-sort-convert-iter-to-child-iter
  input parameter self :: <GtkTreeModelSort>;
  input parameter child_iter_ :: <GtkTreeIter>;
  input parameter sorted_iter_ :: <GtkTreeIter>;
  c-name: "gtk_tree_model_sort_convert_iter_to_child_iter";
end;

define inline-only C-function gtk-tree-model-sort-convert-path-to-child-path
  input parameter self :: <GtkTreeModelSort>;
  input parameter sorted_path_ :: <GtkTreePath>;
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_model_sort_convert_path_to_child_path";
end;

define inline-only C-function gtk-tree-model-sort-get-model
  input parameter self :: <GtkTreeModelSort>;
  result res :: <GtkTreeModel>;
  c-name: "gtk_tree_model_sort_get_model";
end;

define inline-only C-function gtk-tree-model-sort-iter-is-valid
  input parameter self :: <GtkTreeModelSort>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_model_sort_iter_is_valid";
end;

define inline-only C-function gtk-tree-model-sort-reset-default-sort-func
  input parameter self :: <GtkTreeModelSort>;
  c-name: "gtk_tree_model_sort_reset_default_sort_func";
end;

define C-struct <_GtkTreeModelSortClass>
  constant sealed inline-only slot gtk-tree-model-sort-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-tree-model-sort-class-padding :: <C-void*>;
  pointer-type-name: <GtkTreeModelSortClass>;
end C-struct;

define sealed domain make (singleton(<GtkTreeModelSortClass>));
define sealed domain initialize (<GtkTreeModelSortClass>);

define C-struct <_GtkTreeModelSortPrivate>
  pointer-type-name: <GtkTreeModelSortPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkTreeModelSortPrivate>));
define sealed domain initialize (<GtkTreeModelSortPrivate>);

define C-struct <_GtkTreePath>
  pointer-type-name: <GtkTreePath>;
end C-struct;

define sealed domain make (singleton(<GtkTreePath>));
define sealed domain initialize (<GtkTreePath>);

define inline-only C-function gtk-tree-path-new
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_path_new";
end;

define inline-only C-function gtk-tree-path-new-first
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_path_new_first";
end;

define inline-only C-function gtk-tree-path-new-from-indicesv
  input parameter indices_ :: <C-signed-int*>;
  input parameter length_ :: <C-unsigned-long>;
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_path_new_from_indicesv";
end;

define inline-only C-function gtk-tree-path-new-from-string
  input parameter path_ :: <C-string>;
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_path_new_from_string";
end;

define inline-only C-function gtk-tree-path-append-index
  input parameter self :: <GtkTreePath>;
  input parameter index__ :: <C-signed-int>;
  c-name: "gtk_tree_path_append_index";
end;

define inline-only C-function gtk-tree-path-compare
  input parameter self :: <GtkTreePath>;
  input parameter b_ :: <GtkTreePath>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_path_compare";
end;

define inline-only C-function gtk-tree-path-copy
  input parameter self :: <GtkTreePath>;
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_path_copy";
end;

define inline-only C-function gtk-tree-path-down
  input parameter self :: <GtkTreePath>;
  c-name: "gtk_tree_path_down";
end;

define inline-only C-function gtk-tree-path-free
  input parameter self :: <GtkTreePath>;
  c-name: "gtk_tree_path_free";
end;

define inline-only C-function gtk-tree-path-get-depth
  input parameter self :: <GtkTreePath>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_path_get_depth";
end;

define inline-only C-function gtk-tree-path-get-indices-with-depth
  input parameter self :: <GtkTreePath>;
  output parameter depth_ :: <C-signed-int*>;
  result res :: <C-signed-int*>;
  c-name: "gtk_tree_path_get_indices_with_depth";
end;

define inline-only C-function gtk-tree-path-is-ancestor
  input parameter self :: <GtkTreePath>;
  input parameter descendant_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_path_is_ancestor";
end;

define inline-only C-function gtk-tree-path-is-descendant
  input parameter self :: <GtkTreePath>;
  input parameter ancestor_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_path_is_descendant";
end;

define inline-only C-function gtk-tree-path-next
  input parameter self :: <GtkTreePath>;
  c-name: "gtk_tree_path_next";
end;

define inline-only C-function gtk-tree-path-prepend-index
  input parameter self :: <GtkTreePath>;
  input parameter index__ :: <C-signed-int>;
  c-name: "gtk_tree_path_prepend_index";
end;

define inline-only C-function gtk-tree-path-prev
  input parameter self :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_path_prev";
end;

define inline-only C-function gtk-tree-path-to-string
  input parameter self :: <GtkTreePath>;
  result res :: <C-string>;
  c-name: "gtk_tree_path_to_string";
end;

define inline-only C-function gtk-tree-path-up
  input parameter self :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_path_up";
end;

define C-struct <_GtkTreeRowReference>
  pointer-type-name: <GtkTreeRowReference>;
end C-struct;

define sealed domain make (singleton(<GtkTreeRowReference>));
define sealed domain initialize (<GtkTreeRowReference>);

define inline-only C-function gtk-tree-row-reference-new
  input parameter model_ :: <GtkTreeModel>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <GtkTreeRowReference>;
  c-name: "gtk_tree_row_reference_new";
end;

define inline-only C-function gtk-tree-row-reference-new-proxy
  input parameter proxy_ :: <GObject>;
  input parameter model_ :: <GtkTreeModel>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <GtkTreeRowReference>;
  c-name: "gtk_tree_row_reference_new_proxy";
end;

define inline-only C-function gtk-tree-row-reference-copy
  input parameter self :: <GtkTreeRowReference>;
  result res :: <GtkTreeRowReference>;
  c-name: "gtk_tree_row_reference_copy";
end;

define inline-only C-function gtk-tree-row-reference-free
  input parameter self :: <GtkTreeRowReference>;
  c-name: "gtk_tree_row_reference_free";
end;

define inline-only C-function gtk-tree-row-reference-get-model
  input parameter self :: <GtkTreeRowReference>;
  result res :: <GtkTreeModel>;
  c-name: "gtk_tree_row_reference_get_model";
end;

define inline-only C-function gtk-tree-row-reference-get-path
  input parameter self :: <GtkTreeRowReference>;
  result res :: <GtkTreePath>;
  c-name: "gtk_tree_row_reference_get_path";
end;

define inline-only C-function gtk-tree-row-reference-valid
  input parameter self :: <GtkTreeRowReference>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_row_reference_valid";
end;

define inline-only C-function gtk-tree-row-reference-deleted
  input parameter proxy_ :: <GObject>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_tree_row_reference_deleted";
end;

define inline-only C-function gtk-tree-row-reference-inserted
  input parameter proxy_ :: <GObject>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_tree_row_reference_inserted";
end;

define open C-subtype <GtkTreeSelection> (<GObject>)
end C-subtype;

define C-pointer-type <GtkTreeSelection*> => <GtkTreeSelection>;

define sealed domain make (singleton(<GtkTreeSelection*>));
define sealed domain initialize (<GtkTreeSelection*>);

define inline-only C-function gtk-tree-selection-count-selected-rows
  input parameter self :: <GtkTreeSelection>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_selection_count_selected_rows";
end;

define inline-only C-function gtk-tree-selection-get-mode
  input parameter self :: <GtkTreeSelection>;
  result res :: <GtkSelectionMode>;
  c-name: "gtk_tree_selection_get_mode";
end;

define inline-only C-function gtk-tree-selection-get-selected
  input parameter self :: <GtkTreeSelection>;
  output parameter model_ :: <GtkTreeModel*>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_selection_get_selected";
end;

define inline-only C-function gtk-tree-selection-get-selected-rows
  input parameter self :: <GtkTreeSelection>;
  output parameter model_ :: <GtkTreeModel*>;
  result res :: <GList>;
  c-name: "gtk_tree_selection_get_selected_rows";
end;

define inline-only C-function gtk-tree-selection-get-tree-view
  input parameter self :: <GtkTreeSelection>;
  result res :: <GtkTreeView>;
  c-name: "gtk_tree_selection_get_tree_view";
end;

define inline-only C-function gtk-tree-selection-iter-is-selected
  input parameter self :: <GtkTreeSelection>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_selection_iter_is_selected";
end;

define inline-only C-function gtk-tree-selection-path-is-selected
  input parameter self :: <GtkTreeSelection>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_selection_path_is_selected";
end;

define inline-only C-function gtk-tree-selection-select-all
  input parameter self :: <GtkTreeSelection>;
  c-name: "gtk_tree_selection_select_all";
end;

define inline-only C-function gtk-tree-selection-select-iter
  input parameter self :: <GtkTreeSelection>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_tree_selection_select_iter";
end;

define inline-only C-function gtk-tree-selection-select-path
  input parameter self :: <GtkTreeSelection>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_tree_selection_select_path";
end;

define inline-only C-function gtk-tree-selection-select-range
  input parameter self :: <GtkTreeSelection>;
  input parameter start_path_ :: <GtkTreePath>;
  input parameter end_path_ :: <GtkTreePath>;
  c-name: "gtk_tree_selection_select_range";
end;

define inline-only C-function gtk-tree-selection-selected-foreach
  input parameter self :: <GtkTreeSelection>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  c-name: "gtk_tree_selection_selected_foreach";
end;

define inline-only C-function gtk-tree-selection-set-mode
  input parameter self :: <GtkTreeSelection>;
  input parameter type_ :: <GtkSelectionMode>;
  c-name: "gtk_tree_selection_set_mode";
end;

define inline-only C-function gtk-tree-selection-set-select-function
  input parameter self :: <GtkTreeSelection>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_tree_selection_set_select_function";
end;

define inline-only C-function gtk-tree-selection-unselect-all
  input parameter self :: <GtkTreeSelection>;
  c-name: "gtk_tree_selection_unselect_all";
end;

define inline-only C-function gtk-tree-selection-unselect-iter
  input parameter self :: <GtkTreeSelection>;
  input parameter iter_ :: <GtkTreeIter>;
  c-name: "gtk_tree_selection_unselect_iter";
end;

define inline-only C-function gtk-tree-selection-unselect-path
  input parameter self :: <GtkTreeSelection>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_tree_selection_unselect_path";
end;

define inline-only C-function gtk-tree-selection-unselect-range
  input parameter self :: <GtkTreeSelection>;
  input parameter start_path_ :: <GtkTreePath>;
  input parameter end_path_ :: <GtkTreePath>;
  c-name: "gtk_tree_selection_unselect_range";
end;

// Interface
define open C-subtype <GtkTreeSortable> (<GtkTreeModel>)
end C-subtype;

define C-pointer-type <GtkTreeSortable*> => <GtkTreeSortable>;

define sealed domain make (singleton(<GtkTreeSortable*>));
define sealed domain initialize (<GtkTreeSortable*>);

define inline-only C-function gtk-tree-sortable-get-sort-column-id
  input parameter self :: <GtkTreeSortable>;
  output parameter sort_column_id_ :: <C-signed-int*>;
  output parameter order_ :: <GtkSortType*>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_sortable_get_sort_column_id";
end;

define inline-only C-function gtk-tree-sortable-has-default-sort-func
  input parameter self :: <GtkTreeSortable>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_sortable_has_default_sort_func";
end;

define inline-only C-function gtk-tree-sortable-set-default-sort-func
  input parameter self :: <GtkTreeSortable>;
  input parameter sort_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_tree_sortable_set_default_sort_func";
end;

define inline-only C-function gtk-tree-sortable-set-sort-column-id
  input parameter self :: <GtkTreeSortable>;
  input parameter sort_column_id_ :: <C-signed-int>;
  input parameter order_ :: <GtkSortType>;
  c-name: "gtk_tree_sortable_set_sort_column_id";
end;

define inline-only C-function gtk-tree-sortable-set-sort-func
  input parameter self :: <GtkTreeSortable>;
  input parameter sort_column_id_ :: <C-signed-int>;
  input parameter sort_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_tree_sortable_set_sort_func";
end;

define inline-only C-function gtk-tree-sortable-sort-column-changed
  input parameter self :: <GtkTreeSortable>;
  c-name: "gtk_tree_sortable_sort_column_changed";
end;

define C-struct <_GtkTreeSortableIface>
  constant sealed inline-only slot gtk-tree-sortable-iface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gtk-tree-sortable-iface-sort-column-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-sortable-iface-get-sort-column-id :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-sortable-iface-set-sort-column-id :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-sortable-iface-set-sort-func :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-sortable-iface-set-default-sort-func :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-sortable-iface-has-default-sort-func :: <C-function-pointer>;
  pointer-type-name: <GtkTreeSortableIface>;
end C-struct;

define sealed domain make (singleton(<GtkTreeSortableIface>));
define sealed domain initialize (<GtkTreeSortableIface>);

define open C-subtype <GtkTreeStore> (<GObject>, <GtkBuildable>, <GtkTreeDragDest>, <GtkTreeDragSource>, <GtkTreeSortable>)
  // parent
  // priv
end C-subtype;

define C-pointer-type <GtkTreeStore*> => <GtkTreeStore>;

define sealed domain make (singleton(<GtkTreeStore*>));
define sealed domain initialize (<GtkTreeStore*>);

define inline-only C-function gtk-tree-store-newv
  input parameter n_columns_ :: <C-signed-int>;
  input parameter types_ :: <C-long*>;
  result res :: <GtkTreeStore>;
  c-name: "gtk_tree_store_newv";
end;

define inline-only C-function gtk-tree-store-append
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter parent_ :: <GtkTreeIter>;
  c-name: "gtk_tree_store_append";
end;

define inline-only C-function gtk-tree-store-clear
  input parameter self :: <GtkTreeStore>;
  c-name: "gtk_tree_store_clear";
end;

define inline-only C-function gtk-tree-store-insert
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter parent_ :: <GtkTreeIter>;
  input parameter position_ :: <C-signed-int>;
  c-name: "gtk_tree_store_insert";
end;

define inline-only C-function gtk-tree-store-insert-after
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter parent_ :: <GtkTreeIter>;
  input parameter sibling_ :: <GtkTreeIter>;
  c-name: "gtk_tree_store_insert_after";
end;

define inline-only C-function gtk-tree-store-insert-before
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter parent_ :: <GtkTreeIter>;
  input parameter sibling_ :: <GtkTreeIter>;
  c-name: "gtk_tree_store_insert_before";
end;

define inline-only C-function gtk-tree-store-insert-with-valuesv
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter parent_ :: <GtkTreeIter>;
  input parameter position_ :: <C-signed-int>;
  input parameter columns_ :: <C-signed-int*>;
  input parameter values_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_values_ :: <C-signed-int>;
  c-name: "gtk_tree_store_insert_with_valuesv";
end;

define inline-only C-function gtk-tree-store-is-ancestor
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter descendant_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_store_is_ancestor";
end;

define inline-only C-function gtk-tree-store-iter-depth
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_store_iter_depth";
end;

define inline-only C-function gtk-tree-store-iter-is-valid
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_store_iter_is_valid";
end;

define inline-only C-function gtk-tree-store-move-after
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter position_ :: <GtkTreeIter>;
  c-name: "gtk_tree_store_move_after";
end;

define inline-only C-function gtk-tree-store-move-before
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter position_ :: <GtkTreeIter>;
  c-name: "gtk_tree_store_move_before";
end;

define inline-only C-function gtk-tree-store-prepend
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter parent_ :: <GtkTreeIter>;
  c-name: "gtk_tree_store_prepend";
end;

define inline-only C-function gtk-tree-store-remove
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_store_remove";
end;

define inline-only C-function gtk-tree-store-set-column-types
  input parameter self :: <GtkTreeStore>;
  input parameter n_columns_ :: <C-signed-int>;
  input parameter types_ :: <C-long*>;
  c-name: "gtk_tree_store_set_column_types";
end;

define inline-only C-function gtk-tree-store-set-value
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter column_ :: <C-signed-int>;
  input parameter value_ :: <GValue>;
  c-name: "gtk_tree_store_set_value";
end;

define inline-only C-function gtk-tree-store-set-valuesv
  input parameter self :: <GtkTreeStore>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter columns_ :: <C-signed-int*>;
  input parameter values_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_values_ :: <C-signed-int>;
  c-name: "gtk_tree_store_set_valuesv";
end;

define inline-only C-function gtk-tree-store-swap
  input parameter self :: <GtkTreeStore>;
  input parameter a_ :: <GtkTreeIter>;
  input parameter b_ :: <GtkTreeIter>;
  c-name: "gtk_tree_store_swap";
end;

define C-struct <_GtkTreeStoreClass>
  constant sealed inline-only slot gtk-tree-store-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-tree-store-class-padding :: <C-void*>;
  pointer-type-name: <GtkTreeStoreClass>;
end C-struct;

define sealed domain make (singleton(<GtkTreeStoreClass>));
define sealed domain initialize (<GtkTreeStoreClass>);

define C-struct <_GtkTreeStorePrivate>
  pointer-type-name: <GtkTreeStorePrivate>;
end C-struct;

define sealed domain make (singleton(<GtkTreeStorePrivate>));
define sealed domain initialize (<GtkTreeStorePrivate>);

define open C-subtype <GtkTreeView> (<GtkWidget>, <GtkScrollable>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkTreeView*> => <GtkTreeView>;

define sealed domain make (singleton(<GtkTreeView*>));
define sealed domain initialize (<GtkTreeView*>);

define inline-only C-function gtk-tree-view-new
  result res :: <GtkWidget>;
  c-name: "gtk_tree_view_new";
end;

define inline-only C-function gtk-tree-view-new-with-model
  input parameter model_ :: <GtkTreeModel>;
  result res :: <GtkWidget>;
  c-name: "gtk_tree_view_new_with_model";
end;

define inline-only C-function gtk-tree-view-append-column
  input parameter self :: <GtkTreeView>;
  input parameter column_ :: <GtkTreeViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_append_column";
end;

define inline-only C-function gtk-tree-view-collapse-all
  input parameter self :: <GtkTreeView>;
  c-name: "gtk_tree_view_collapse_all";
end;

define inline-only C-function gtk-tree-view-collapse-row
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_collapse_row";
end;

define inline-only C-function gtk-tree-view-columns-autosize
  input parameter self :: <GtkTreeView>;
  c-name: "gtk_tree_view_columns_autosize";
end;

define inline-only C-function gtk-tree-view-convert-bin-window-to-tree-coords
  input parameter self :: <GtkTreeView>;
  input parameter bx_ :: <C-signed-int>;
  input parameter by_ :: <C-signed-int>;
  output parameter tx_ :: <C-signed-int*>;
  output parameter ty_ :: <C-signed-int*>;
  c-name: "gtk_tree_view_convert_bin_window_to_tree_coords";
end;

define inline-only C-function gtk-tree-view-convert-bin-window-to-widget-coords
  input parameter self :: <GtkTreeView>;
  input parameter bx_ :: <C-signed-int>;
  input parameter by_ :: <C-signed-int>;
  output parameter wx_ :: <C-signed-int*>;
  output parameter wy_ :: <C-signed-int*>;
  c-name: "gtk_tree_view_convert_bin_window_to_widget_coords";
end;

define inline-only C-function gtk-tree-view-convert-tree-to-bin-window-coords
  input parameter self :: <GtkTreeView>;
  input parameter tx_ :: <C-signed-int>;
  input parameter ty_ :: <C-signed-int>;
  output parameter bx_ :: <C-signed-int*>;
  output parameter by_ :: <C-signed-int*>;
  c-name: "gtk_tree_view_convert_tree_to_bin_window_coords";
end;

define inline-only C-function gtk-tree-view-convert-tree-to-widget-coords
  input parameter self :: <GtkTreeView>;
  input parameter tx_ :: <C-signed-int>;
  input parameter ty_ :: <C-signed-int>;
  output parameter wx_ :: <C-signed-int*>;
  output parameter wy_ :: <C-signed-int*>;
  c-name: "gtk_tree_view_convert_tree_to_widget_coords";
end;

define inline-only C-function gtk-tree-view-convert-widget-to-bin-window-coords
  input parameter self :: <GtkTreeView>;
  input parameter wx_ :: <C-signed-int>;
  input parameter wy_ :: <C-signed-int>;
  output parameter bx_ :: <C-signed-int*>;
  output parameter by_ :: <C-signed-int*>;
  c-name: "gtk_tree_view_convert_widget_to_bin_window_coords";
end;

define inline-only C-function gtk-tree-view-convert-widget-to-tree-coords
  input parameter self :: <GtkTreeView>;
  input parameter wx_ :: <C-signed-int>;
  input parameter wy_ :: <C-signed-int>;
  output parameter tx_ :: <C-signed-int*>;
  output parameter ty_ :: <C-signed-int*>;
  c-name: "gtk_tree_view_convert_widget_to_tree_coords";
end;

define inline-only C-function gtk-tree-view-create-row-drag-icon
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <GdkPaintable>;
  c-name: "gtk_tree_view_create_row_drag_icon";
end;

define inline-only C-function gtk-tree-view-enable-model-drag-dest
  input parameter self :: <GtkTreeView>;
  input parameter formats_ :: <GdkContentFormats>;
  input parameter actions_ :: <GdkDragAction>;
  c-name: "gtk_tree_view_enable_model_drag_dest";
end;

define inline-only C-function gtk-tree-view-enable-model-drag-source
  input parameter self :: <GtkTreeView>;
  input parameter start_button_mask_ :: <GdkModifierType>;
  input parameter formats_ :: <GdkContentFormats>;
  input parameter actions_ :: <GdkDragAction>;
  c-name: "gtk_tree_view_enable_model_drag_source";
end;

define inline-only C-function gtk-tree-view-expand-all
  input parameter self :: <GtkTreeView>;
  c-name: "gtk_tree_view_expand_all";
end;

define inline-only C-function gtk-tree-view-expand-row
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter open_all_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_expand_row";
end;

define inline-only C-function gtk-tree-view-expand-to-path
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_tree_view_expand_to_path";
end;

define inline-only C-function gtk-tree-view-get-activate-on-single-click
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_activate_on_single_click";
end;

define inline-only C-function gtk-tree-view-get-background-area
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter column_ :: <GtkTreeViewColumn>;
  input parameter rect_ :: <GdkRectangle>;
  c-name: "gtk_tree_view_get_background_area";
end;

define inline-only C-function gtk-tree-view-get-cell-area
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter column_ :: <GtkTreeViewColumn>;
  input parameter rect_ :: <GdkRectangle>;
  c-name: "gtk_tree_view_get_cell_area";
end;

define inline-only C-function gtk-tree-view-get-column
  input parameter self :: <GtkTreeView>;
  input parameter n_ :: <C-signed-int>;
  result res :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_get_column";
end;

define inline-only C-function gtk-tree-view-get-columns
  input parameter self :: <GtkTreeView>;
  result res :: <GList>;
  c-name: "gtk_tree_view_get_columns";
end;

define inline-only C-function gtk-tree-view-get-cursor
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  output parameter focus_column_ :: <GtkTreeViewColumn*>;
  c-name: "gtk_tree_view_get_cursor";
end;

define inline-only C-function gtk-tree-view-get-dest-row-at-pos
  input parameter self :: <GtkTreeView>;
  input parameter drag_x_ :: <C-signed-int>;
  input parameter drag_y_ :: <C-signed-int>;
  input parameter path_ :: <GtkTreePath>;
  output parameter pos_ :: <GtkTreeViewDropPosition*>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_dest_row_at_pos";
end;

define inline-only C-function gtk-tree-view-get-drag-dest-row
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  output parameter pos_ :: <GtkTreeViewDropPosition*>;
  c-name: "gtk_tree_view_get_drag_dest_row";
end;

define inline-only C-function gtk-tree-view-get-enable-search
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_enable_search";
end;

define inline-only C-function gtk-tree-view-get-enable-tree-lines
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_enable_tree_lines";
end;

define inline-only C-function gtk-tree-view-get-expander-column
  input parameter self :: <GtkTreeView>;
  result res :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_get_expander_column";
end;

define inline-only C-function gtk-tree-view-get-fixed-height-mode
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_fixed_height_mode";
end;

define inline-only C-function gtk-tree-view-get-grid-lines
  input parameter self :: <GtkTreeView>;
  result res :: <GtkTreeViewGridLines>;
  c-name: "gtk_tree_view_get_grid_lines";
end;

define inline-only C-function gtk-tree-view-get-headers-clickable
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_headers_clickable";
end;

define inline-only C-function gtk-tree-view-get-headers-visible
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_headers_visible";
end;

define inline-only C-function gtk-tree-view-get-hover-expand
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_hover_expand";
end;

define inline-only C-function gtk-tree-view-get-hover-selection
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_hover_selection";
end;

define inline-only C-function gtk-tree-view-get-level-indentation
  input parameter self :: <GtkTreeView>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_get_level_indentation";
end;

define inline-only C-function gtk-tree-view-get-model
  input parameter self :: <GtkTreeView>;
  result res :: <GtkTreeModel>;
  c-name: "gtk_tree_view_get_model";
end;

define inline-only C-function gtk-tree-view-get-n-columns
  input parameter self :: <GtkTreeView>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_tree_view_get_n_columns";
end;

define inline-only C-function gtk-tree-view-get-path-at-pos
  input parameter self :: <GtkTreeView>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  input parameter path_ :: <GtkTreePath>;
  output parameter column_ :: <GtkTreeViewColumn*>;
  output parameter cell_x_ :: <C-signed-int*>;
  output parameter cell_y_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_path_at_pos";
end;

define inline-only C-function gtk-tree-view-get-reorderable
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_reorderable";
end;

define inline-only C-function gtk-tree-view-get-rubber-banding
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_rubber_banding";
end;

define inline-only C-function gtk-tree-view-get-search-column
  input parameter self :: <GtkTreeView>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_get_search_column";
end;

define inline-only C-function gtk-tree-view-get-search-entry
  input parameter self :: <GtkTreeView>;
  result res :: <GtkEditable>;
  c-name: "gtk_tree_view_get_search_entry";
end;

define inline-only C-function gtk-tree-view-get-selection
  input parameter self :: <GtkTreeView>;
  result res :: <GtkTreeSelection>;
  c-name: "gtk_tree_view_get_selection";
end;

define inline-only C-function gtk-tree-view-get-show-expanders
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_show_expanders";
end;

define inline-only C-function gtk-tree-view-get-tooltip-column
  input parameter self :: <GtkTreeView>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_get_tooltip_column";
end;

define inline-only C-function gtk-tree-view-get-tooltip-context
  input parameter self :: <GtkTreeView>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  input parameter keyboard_tip_ :: <C-boolean>;
  output parameter model_ :: <GtkTreeModel*>;
  input parameter path_ :: <GtkTreePath>;
  input parameter iter_ :: <GtkTreeIter>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_tooltip_context";
end;

define inline-only C-function gtk-tree-view-get-visible-range
  input parameter self :: <GtkTreeView>;
  input parameter start_path_ :: <GtkTreePath>;
  input parameter end_path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_get_visible_range";
end;

define inline-only C-function gtk-tree-view-get-visible-rect
  input parameter self :: <GtkTreeView>;
  input parameter visible_rect_ :: <GdkRectangle>;
  c-name: "gtk_tree_view_get_visible_rect";
end;

define inline-only C-function gtk-tree-view-insert-column
  input parameter self :: <GtkTreeView>;
  input parameter column_ :: <GtkTreeViewColumn>;
  input parameter position_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_insert_column";
end;

define inline-only C-function gtk-tree-view-insert-column-with-data-func
  input parameter self :: <GtkTreeView>;
  input parameter position_ :: <C-signed-int>;
  input parameter title_ :: <C-string>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter dnotify_ :: <C-function-pointer>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_insert_column_with_data_func";
end;

define inline-only C-function gtk-tree-view-is-blank-at-pos
  input parameter self :: <GtkTreeView>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  input parameter path_ :: <GtkTreePath>;
  output parameter column_ :: <GtkTreeViewColumn*>;
  output parameter cell_x_ :: <C-signed-int*>;
  output parameter cell_y_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_is_blank_at_pos";
end;

define inline-only C-function gtk-tree-view-is-rubber-banding-active
  input parameter self :: <GtkTreeView>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_is_rubber_banding_active";
end;

define inline-only C-function gtk-tree-view-map-expanded-rows
  input parameter self :: <GtkTreeView>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  c-name: "gtk_tree_view_map_expanded_rows";
end;

define inline-only C-function gtk-tree-view-move-column-after
  input parameter self :: <GtkTreeView>;
  input parameter column_ :: <GtkTreeViewColumn>;
  input parameter base_column_ :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_move_column_after";
end;

define inline-only C-function gtk-tree-view-remove-column
  input parameter self :: <GtkTreeView>;
  input parameter column_ :: <GtkTreeViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_remove_column";
end;

define inline-only C-function gtk-tree-view-row-activated
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter column_ :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_row_activated";
end;

define inline-only C-function gtk-tree-view-row-expanded
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_row_expanded";
end;

define inline-only C-function gtk-tree-view-scroll-to-cell
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter column_ :: <GtkTreeViewColumn>;
  input parameter use_align_ :: <C-boolean>;
  input parameter row_align_ :: <C-float>;
  input parameter col_align_ :: <C-float>;
  c-name: "gtk_tree_view_scroll_to_cell";
end;

define inline-only C-function gtk-tree-view-scroll-to-point
  input parameter self :: <GtkTreeView>;
  input parameter tree_x_ :: <C-signed-int>;
  input parameter tree_y_ :: <C-signed-int>;
  c-name: "gtk_tree_view_scroll_to_point";
end;

define inline-only C-function gtk-tree-view-set-activate-on-single-click
  input parameter self :: <GtkTreeView>;
  input parameter single_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_activate_on_single_click";
end;

define inline-only C-function gtk-tree-view-set-column-drag-function
  input parameter self :: <GtkTreeView>;
  input parameter func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_tree_view_set_column_drag_function";
end;

define inline-only C-function gtk-tree-view-set-cursor
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter focus_column_ :: <GtkTreeViewColumn>;
  input parameter start_editing_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_cursor";
end;

define inline-only C-function gtk-tree-view-set-cursor-on-cell
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter focus_column_ :: <GtkTreeViewColumn>;
  input parameter focus_cell_ :: <GtkCellRenderer>;
  input parameter start_editing_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_cursor_on_cell";
end;

define inline-only C-function gtk-tree-view-set-drag-dest-row
  input parameter self :: <GtkTreeView>;
  input parameter path_ :: <GtkTreePath>;
  input parameter pos_ :: <GtkTreeViewDropPosition>;
  c-name: "gtk_tree_view_set_drag_dest_row";
end;

define inline-only C-function gtk-tree-view-set-enable-search
  input parameter self :: <GtkTreeView>;
  input parameter enable_search_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_enable_search";
end;

define inline-only C-function gtk-tree-view-set-enable-tree-lines
  input parameter self :: <GtkTreeView>;
  input parameter enabled_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_enable_tree_lines";
end;

define inline-only C-function gtk-tree-view-set-expander-column
  input parameter self :: <GtkTreeView>;
  input parameter column_ :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_set_expander_column";
end;

define inline-only C-function gtk-tree-view-set-fixed-height-mode
  input parameter self :: <GtkTreeView>;
  input parameter enable_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_fixed_height_mode";
end;

define inline-only C-function gtk-tree-view-set-grid-lines
  input parameter self :: <GtkTreeView>;
  input parameter grid_lines_ :: <GtkTreeViewGridLines>;
  c-name: "gtk_tree_view_set_grid_lines";
end;

define inline-only C-function gtk-tree-view-set-headers-clickable
  input parameter self :: <GtkTreeView>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_headers_clickable";
end;

define inline-only C-function gtk-tree-view-set-headers-visible
  input parameter self :: <GtkTreeView>;
  input parameter headers_visible_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_headers_visible";
end;

define inline-only C-function gtk-tree-view-set-hover-expand
  input parameter self :: <GtkTreeView>;
  input parameter expand_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_hover_expand";
end;

define inline-only C-function gtk-tree-view-set-hover-selection
  input parameter self :: <GtkTreeView>;
  input parameter hover_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_hover_selection";
end;

define inline-only C-function gtk-tree-view-set-level-indentation
  input parameter self :: <GtkTreeView>;
  input parameter indentation_ :: <C-signed-int>;
  c-name: "gtk_tree_view_set_level_indentation";
end;

define inline-only C-function gtk-tree-view-set-model
  input parameter self :: <GtkTreeView>;
  input parameter model_ :: <GtkTreeModel>;
  c-name: "gtk_tree_view_set_model";
end;

define inline-only C-function gtk-tree-view-set-reorderable
  input parameter self :: <GtkTreeView>;
  input parameter reorderable_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_reorderable";
end;

define inline-only C-function gtk-tree-view-set-row-separator-func
  input parameter self :: <GtkTreeView>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_tree_view_set_row_separator_func";
end;

define inline-only C-function gtk-tree-view-set-rubber-banding
  input parameter self :: <GtkTreeView>;
  input parameter enable_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_rubber_banding";
end;

define inline-only C-function gtk-tree-view-set-search-column
  input parameter self :: <GtkTreeView>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_tree_view_set_search_column";
end;

define inline-only C-function gtk-tree-view-set-search-entry
  input parameter self :: <GtkTreeView>;
  input parameter entry_ :: <GtkEditable>;
  c-name: "gtk_tree_view_set_search_entry";
end;

define inline-only C-function gtk-tree-view-set-search-equal-func
  input parameter self :: <GtkTreeView>;
  input parameter search_equal_func_ :: <C-function-pointer>;
  input parameter search_user_data_ :: <C-void*>;
  input parameter search_destroy_ :: <C-function-pointer>;
  c-name: "gtk_tree_view_set_search_equal_func";
end;

define inline-only C-function gtk-tree-view-set-show-expanders
  input parameter self :: <GtkTreeView>;
  input parameter enabled_ :: <C-boolean>;
  c-name: "gtk_tree_view_set_show_expanders";
end;

define inline-only C-function gtk-tree-view-set-tooltip-cell
  input parameter self :: <GtkTreeView>;
  input parameter tooltip_ :: <GtkTooltip>;
  input parameter path_ :: <GtkTreePath>;
  input parameter column_ :: <GtkTreeViewColumn>;
  input parameter cell_ :: <GtkCellRenderer>;
  c-name: "gtk_tree_view_set_tooltip_cell";
end;

define inline-only C-function gtk-tree-view-set-tooltip-column
  input parameter self :: <GtkTreeView>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_tree_view_set_tooltip_column";
end;

define inline-only C-function gtk-tree-view-set-tooltip-row
  input parameter self :: <GtkTreeView>;
  input parameter tooltip_ :: <GtkTooltip>;
  input parameter path_ :: <GtkTreePath>;
  c-name: "gtk_tree_view_set_tooltip_row";
end;

define inline-only C-function gtk-tree-view-unset-rows-drag-dest
  input parameter self :: <GtkTreeView>;
  c-name: "gtk_tree_view_unset_rows_drag_dest";
end;

define inline-only C-function gtk-tree-view-unset-rows-drag-source
  input parameter self :: <GtkTreeView>;
  c-name: "gtk_tree_view_unset_rows_drag_source";
end;

define C-struct <_GtkTreeViewClass>
  constant sealed inline-only slot gtk-tree-view-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-tree-view-class-row-activated :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-test-expand-row :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-test-collapse-row :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-row-expanded :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-row-collapsed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-columns-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-cursor-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-move-cursor :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-select-all :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-unselect-all :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-select-cursor-row :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-toggle-cursor-row :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-expand-collapse-cursor-row :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-select-cursor-parent :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-start-interactive-search :: <C-function-pointer>;
  constant sealed inline-only slot gtk-tree-view-class-_reserved :: <C-void*>;
  pointer-type-name: <GtkTreeViewClass>;
end C-struct;

define sealed domain make (singleton(<GtkTreeViewClass>));
define sealed domain initialize (<GtkTreeViewClass>);

define open C-subtype <GtkTreeViewColumn> (<GInitiallyUnowned>, <GtkBuildable>, <GtkCellLayout>)
end C-subtype;

define C-pointer-type <GtkTreeViewColumn*> => <GtkTreeViewColumn>;

define sealed domain make (singleton(<GtkTreeViewColumn*>));
define sealed domain initialize (<GtkTreeViewColumn*>);

define inline-only C-function gtk-tree-view-column-new
  result res :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_column_new";
end;

define inline-only C-function gtk-tree-view-column-new-with-area
  input parameter area_ :: <GtkCellArea>;
  result res :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_column_new_with_area";
end;

define inline-only C-function gtk-tree-view-column-add-attribute
  input parameter self :: <GtkTreeViewColumn>;
  input parameter cell_renderer_ :: <GtkCellRenderer>;
  input parameter attribute_ :: <C-string>;
  input parameter column_ :: <C-signed-int>;
  c-name: "gtk_tree_view_column_add_attribute";
end;

define inline-only C-function gtk-tree-view-column-cell-get-position
  input parameter self :: <GtkTreeViewColumn>;
  input parameter cell_renderer_ :: <GtkCellRenderer>;
  output parameter x_offset_ :: <C-signed-int*>;
  output parameter width_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_column_cell_get_position";
end;

define inline-only C-function gtk-tree-view-column-cell-get-size
  input parameter self :: <GtkTreeViewColumn>;
  output parameter x_offset_ :: <C-signed-int*>;
  output parameter y_offset_ :: <C-signed-int*>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_tree_view_column_cell_get_size";
end;

define inline-only C-function gtk-tree-view-column-cell-is-visible
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_column_cell_is_visible";
end;

define inline-only C-function gtk-tree-view-column-cell-set-cell-data
  input parameter self :: <GtkTreeViewColumn>;
  input parameter tree_model_ :: <GtkTreeModel>;
  input parameter iter_ :: <GtkTreeIter>;
  input parameter is_expander_ :: <C-boolean>;
  input parameter is_expanded_ :: <C-boolean>;
  c-name: "gtk_tree_view_column_cell_set_cell_data";
end;

define inline-only C-function gtk-tree-view-column-clear
  input parameter self :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_column_clear";
end;

define inline-only C-function gtk-tree-view-column-clear-attributes
  input parameter self :: <GtkTreeViewColumn>;
  input parameter cell_renderer_ :: <GtkCellRenderer>;
  c-name: "gtk_tree_view_column_clear_attributes";
end;

define inline-only C-function gtk-tree-view-column-clicked
  input parameter self :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_column_clicked";
end;

define inline-only C-function gtk-tree-view-column-focus-cell
  input parameter self :: <GtkTreeViewColumn>;
  input parameter cell_ :: <GtkCellRenderer>;
  c-name: "gtk_tree_view_column_focus_cell";
end;

define inline-only C-function gtk-tree-view-column-get-alignment
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-float>;
  c-name: "gtk_tree_view_column_get_alignment";
end;

define inline-only C-function gtk-tree-view-column-get-button
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <GtkWidget>;
  c-name: "gtk_tree_view_column_get_button";
end;

define inline-only C-function gtk-tree-view-column-get-clickable
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_column_get_clickable";
end;

define inline-only C-function gtk-tree-view-column-get-expand
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_column_get_expand";
end;

define inline-only C-function gtk-tree-view-column-get-fixed-width
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_column_get_fixed_width";
end;

define inline-only C-function gtk-tree-view-column-get-max-width
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_column_get_max_width";
end;

define inline-only C-function gtk-tree-view-column-get-min-width
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_column_get_min_width";
end;

define inline-only C-function gtk-tree-view-column-get-reorderable
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_column_get_reorderable";
end;

define inline-only C-function gtk-tree-view-column-get-resizable
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_column_get_resizable";
end;

define inline-only C-function gtk-tree-view-column-get-sizing
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <GtkTreeViewColumnSizing>;
  c-name: "gtk_tree_view_column_get_sizing";
end;

define inline-only C-function gtk-tree-view-column-get-sort-column-id
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_column_get_sort_column_id";
end;

define inline-only C-function gtk-tree-view-column-get-sort-indicator
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_column_get_sort_indicator";
end;

define inline-only C-function gtk-tree-view-column-get-sort-order
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <GtkSortType>;
  c-name: "gtk_tree_view_column_get_sort_order";
end;

define inline-only C-function gtk-tree-view-column-get-spacing
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_column_get_spacing";
end;

define inline-only C-function gtk-tree-view-column-get-title
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-string>;
  c-name: "gtk_tree_view_column_get_title";
end;

define inline-only C-function gtk-tree-view-column-get-tree-view
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <GtkWidget>;
  c-name: "gtk_tree_view_column_get_tree_view";
end;

define inline-only C-function gtk-tree-view-column-get-visible
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_view_column_get_visible";
end;

define inline-only C-function gtk-tree-view-column-get-widget
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <GtkWidget>;
  c-name: "gtk_tree_view_column_get_widget";
end;

define inline-only C-function gtk-tree-view-column-get-width
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_column_get_width";
end;

define inline-only C-function gtk-tree-view-column-get-x-offset
  input parameter self :: <GtkTreeViewColumn>;
  result res :: <C-signed-int>;
  c-name: "gtk_tree_view_column_get_x_offset";
end;

define inline-only C-function gtk-tree-view-column-pack-end
  input parameter self :: <GtkTreeViewColumn>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter expand_ :: <C-boolean>;
  c-name: "gtk_tree_view_column_pack_end";
end;

define inline-only C-function gtk-tree-view-column-pack-start
  input parameter self :: <GtkTreeViewColumn>;
  input parameter cell_ :: <GtkCellRenderer>;
  input parameter expand_ :: <C-boolean>;
  c-name: "gtk_tree_view_column_pack_start";
end;

define inline-only C-function gtk-tree-view-column-queue-resize
  input parameter self :: <GtkTreeViewColumn>;
  c-name: "gtk_tree_view_column_queue_resize";
end;

define inline-only C-function gtk-tree-view-column-set-alignment
  input parameter self :: <GtkTreeViewColumn>;
  input parameter xalign_ :: <C-float>;
  c-name: "gtk_tree_view_column_set_alignment";
end;

define inline-only C-function gtk-tree-view-column-set-cell-data-func
  input parameter self :: <GtkTreeViewColumn>;
  input parameter cell_renderer_ :: <GtkCellRenderer>;
  input parameter func_ :: <C-function-pointer>;
  input parameter func_data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  c-name: "gtk_tree_view_column_set_cell_data_func";
end;

define inline-only C-function gtk-tree-view-column-set-clickable
  input parameter self :: <GtkTreeViewColumn>;
  input parameter clickable_ :: <C-boolean>;
  c-name: "gtk_tree_view_column_set_clickable";
end;

define inline-only C-function gtk-tree-view-column-set-expand
  input parameter self :: <GtkTreeViewColumn>;
  input parameter expand_ :: <C-boolean>;
  c-name: "gtk_tree_view_column_set_expand";
end;

define inline-only C-function gtk-tree-view-column-set-fixed-width
  input parameter self :: <GtkTreeViewColumn>;
  input parameter fixed_width_ :: <C-signed-int>;
  c-name: "gtk_tree_view_column_set_fixed_width";
end;

define inline-only C-function gtk-tree-view-column-set-max-width
  input parameter self :: <GtkTreeViewColumn>;
  input parameter max_width_ :: <C-signed-int>;
  c-name: "gtk_tree_view_column_set_max_width";
end;

define inline-only C-function gtk-tree-view-column-set-min-width
  input parameter self :: <GtkTreeViewColumn>;
  input parameter min_width_ :: <C-signed-int>;
  c-name: "gtk_tree_view_column_set_min_width";
end;

define inline-only C-function gtk-tree-view-column-set-reorderable
  input parameter self :: <GtkTreeViewColumn>;
  input parameter reorderable_ :: <C-boolean>;
  c-name: "gtk_tree_view_column_set_reorderable";
end;

define inline-only C-function gtk-tree-view-column-set-resizable
  input parameter self :: <GtkTreeViewColumn>;
  input parameter resizable_ :: <C-boolean>;
  c-name: "gtk_tree_view_column_set_resizable";
end;

define inline-only C-function gtk-tree-view-column-set-sizing
  input parameter self :: <GtkTreeViewColumn>;
  input parameter type_ :: <GtkTreeViewColumnSizing>;
  c-name: "gtk_tree_view_column_set_sizing";
end;

define inline-only C-function gtk-tree-view-column-set-sort-column-id
  input parameter self :: <GtkTreeViewColumn>;
  input parameter sort_column_id_ :: <C-signed-int>;
  c-name: "gtk_tree_view_column_set_sort_column_id";
end;

define inline-only C-function gtk-tree-view-column-set-sort-indicator
  input parameter self :: <GtkTreeViewColumn>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_tree_view_column_set_sort_indicator";
end;

define inline-only C-function gtk-tree-view-column-set-sort-order
  input parameter self :: <GtkTreeViewColumn>;
  input parameter order_ :: <GtkSortType>;
  c-name: "gtk_tree_view_column_set_sort_order";
end;

define inline-only C-function gtk-tree-view-column-set-spacing
  input parameter self :: <GtkTreeViewColumn>;
  input parameter spacing_ :: <C-signed-int>;
  c-name: "gtk_tree_view_column_set_spacing";
end;

define inline-only C-function gtk-tree-view-column-set-title
  input parameter self :: <GtkTreeViewColumn>;
  input parameter title_ :: <C-string>;
  c-name: "gtk_tree_view_column_set_title";
end;

define inline-only C-function gtk-tree-view-column-set-visible
  input parameter self :: <GtkTreeViewColumn>;
  input parameter visible_ :: <C-boolean>;
  c-name: "gtk_tree_view_column_set_visible";
end;

define inline-only C-function gtk-tree-view-column-set-widget
  input parameter self :: <GtkTreeViewColumn>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_tree_view_column_set_widget";
end;

define inline-only constant $gtk-tree-view-column-grow-only = 0;
define inline-only constant $gtk-tree-view-column-autosize = 1;
define inline-only constant $gtk-tree-view-column-fixed = 2;
define constant <GtkTreeViewColumnSizing> = <C-int>;
define C-pointer-type <GtkTreeViewColumnSizing*> => <GtkTreeViewColumnSizing>;

define inline-only constant $gtk-tree-view-drop-before = 0;
define inline-only constant $gtk-tree-view-drop-after = 1;
define inline-only constant $gtk-tree-view-drop-into-or-before = 2;
define inline-only constant $gtk-tree-view-drop-into-or-after = 3;
define constant <GtkTreeViewDropPosition> = <C-int>;
define C-pointer-type <GtkTreeViewDropPosition*> => <GtkTreeViewDropPosition>;

define inline-only constant $gtk-tree-view-grid-lines-none = 0;
define inline-only constant $gtk-tree-view-grid-lines-horizontal = 1;
define inline-only constant $gtk-tree-view-grid-lines-vertical = 2;
define inline-only constant $gtk-tree-view-grid-lines-both = 3;
define constant <GtkTreeViewGridLines> = <C-int>;
define C-pointer-type <GtkTreeViewGridLines*> => <GtkTreeViewGridLines>;

define inline-only constant $gtk-unit-none = 0;
define inline-only constant $gtk-unit-points = 1;
define inline-only constant $gtk-unit-inch = 2;
define inline-only constant $gtk-unit-mm = 3;
define constant <GtkUnit> = <C-int>;
define C-pointer-type <GtkUnit*> => <GtkUnit>;

define open C-subtype <GtkVideo> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkVideo*> => <GtkVideo>;

define sealed domain make (singleton(<GtkVideo*>));
define sealed domain initialize (<GtkVideo*>);

define inline-only C-function gtk-video-new
  result res :: <GtkWidget>;
  c-name: "gtk_video_new";
end;

define inline-only C-function gtk-video-new-for-file
  input parameter file_ :: <GFile>;
  result res :: <GtkWidget>;
  c-name: "gtk_video_new_for_file";
end;

define inline-only C-function gtk-video-new-for-filename
  input parameter filename_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_video_new_for_filename";
end;

define inline-only C-function gtk-video-new-for-media-stream
  input parameter stream_ :: <GtkMediaStream>;
  result res :: <GtkWidget>;
  c-name: "gtk_video_new_for_media_stream";
end;

define inline-only C-function gtk-video-new-for-resource
  input parameter resource_path_ :: <C-string>;
  result res :: <GtkWidget>;
  c-name: "gtk_video_new_for_resource";
end;

define inline-only C-function gtk-video-get-autoplay
  input parameter self :: <GtkVideo>;
  result res :: <C-boolean>;
  c-name: "gtk_video_get_autoplay";
end;

define inline-only C-function gtk-video-get-file
  input parameter self :: <GtkVideo>;
  result res :: <GFile>;
  c-name: "gtk_video_get_file";
end;

define inline-only C-function gtk-video-get-loop
  input parameter self :: <GtkVideo>;
  result res :: <C-boolean>;
  c-name: "gtk_video_get_loop";
end;

define inline-only C-function gtk-video-get-media-stream
  input parameter self :: <GtkVideo>;
  result res :: <GtkMediaStream>;
  c-name: "gtk_video_get_media_stream";
end;

define inline-only C-function gtk-video-set-autoplay
  input parameter self :: <GtkVideo>;
  input parameter autoplay_ :: <C-boolean>;
  c-name: "gtk_video_set_autoplay";
end;

define inline-only C-function gtk-video-set-file
  input parameter self :: <GtkVideo>;
  input parameter file_ :: <GFile>;
  c-name: "gtk_video_set_file";
end;

define inline-only C-function gtk-video-set-filename
  input parameter self :: <GtkVideo>;
  input parameter filename_ :: <C-string>;
  c-name: "gtk_video_set_filename";
end;

define inline-only C-function gtk-video-set-loop
  input parameter self :: <GtkVideo>;
  input parameter loop_ :: <C-boolean>;
  c-name: "gtk_video_set_loop";
end;

define inline-only C-function gtk-video-set-media-stream
  input parameter self :: <GtkVideo>;
  input parameter stream_ :: <GtkMediaStream>;
  c-name: "gtk_video_set_media_stream";
end;

define inline-only C-function gtk-video-set-resource
  input parameter self :: <GtkVideo>;
  input parameter resource_path_ :: <C-string>;
  c-name: "gtk_video_set_resource";
end;

define C-struct <_GtkVideoClass>
  constant sealed inline-only slot gtk-video-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkVideoClass>;
end C-struct;

define sealed domain make (singleton(<GtkVideoClass>));
define sealed domain initialize (<GtkVideoClass>);

define open C-subtype <GtkViewport> (<GtkWidget>, <GtkScrollable>)
end C-subtype;

define C-pointer-type <GtkViewport*> => <GtkViewport>;

define sealed domain make (singleton(<GtkViewport*>));
define sealed domain initialize (<GtkViewport*>);

define inline-only C-function gtk-viewport-new
  input parameter hadjustment_ :: <GtkAdjustment>;
  input parameter vadjustment_ :: <GtkAdjustment>;
  result res :: <GtkWidget>;
  c-name: "gtk_viewport_new";
end;

define inline-only C-function gtk-viewport-get-child
  input parameter self :: <GtkViewport>;
  result res :: <GtkWidget>;
  c-name: "gtk_viewport_get_child";
end;

define inline-only C-function gtk-viewport-get-scroll-to-focus
  input parameter self :: <GtkViewport>;
  result res :: <C-boolean>;
  c-name: "gtk_viewport_get_scroll_to_focus";
end;

define inline-only C-function gtk-viewport-set-child
  input parameter self :: <GtkViewport>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_viewport_set_child";
end;

define inline-only C-function gtk-viewport-set-scroll-to-focus
  input parameter self :: <GtkViewport>;
  input parameter scroll_to_focus_ :: <C-boolean>;
  c-name: "gtk_viewport_set_scroll_to_focus";
end;

define open C-subtype <GtkVolumeButton> (<GtkScaleButton>)
  // parent
end C-subtype;

define C-pointer-type <GtkVolumeButton*> => <GtkVolumeButton>;

define sealed domain make (singleton(<GtkVolumeButton*>));
define sealed domain initialize (<GtkVolumeButton*>);

define inline-only C-function gtk-volume-button-new
  result res :: <GtkWidget>;
  c-name: "gtk_volume_button_new";
end;

define open C-subtype <GtkWidget> (<GInitiallyUnowned>, <GtkAccessible>, <GtkBuildable>, <GtkConstraintTarget>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GtkWidget*> => <GtkWidget>;

define sealed domain make (singleton(<GtkWidget*>));
define sealed domain initialize (<GtkWidget*>);

define inline-only C-function gtk-widget-get-default-direction
  result res :: <GtkTextDirection>;
  c-name: "gtk_widget_get_default_direction";
end;

define inline-only C-function gtk-widget-set-default-direction
  input parameter dir_ :: <GtkTextDirection>;
  c-name: "gtk_widget_set_default_direction";
end;

define inline-only C-function gtk-widget-action-set-enabled
  input parameter self :: <GtkWidget>;
  input parameter action_name_ :: <C-string>;
  input parameter enabled_ :: <C-boolean>;
  c-name: "gtk_widget_action_set_enabled";
end;

define inline-only C-function gtk-widget-activate
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_activate";
end;

define inline-only C-function gtk-widget-activate-action-variant
  input parameter self :: <GtkWidget>;
  input parameter name_ :: <C-string>;
  input parameter args_ :: <GVariant>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_activate_action_variant";
end;

define inline-only C-function gtk-widget-activate-default
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_activate_default";
end;

define inline-only C-function gtk-widget-add-controller
  input parameter self :: <GtkWidget>;
  input parameter controller_ :: <GtkEventController>;
  c-name: "gtk_widget_add_controller";
end;

define inline-only C-function gtk-widget-add-css-class
  input parameter self :: <GtkWidget>;
  input parameter css_class_ :: <C-string>;
  c-name: "gtk_widget_add_css_class";
end;

define inline-only C-function gtk-widget-add-mnemonic-label
  input parameter self :: <GtkWidget>;
  input parameter label_ :: <GtkWidget>;
  c-name: "gtk_widget_add_mnemonic_label";
end;

define inline-only C-function gtk-widget-add-tick-callback
  input parameter self :: <GtkWidget>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter notify_ :: <C-function-pointer>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_widget_add_tick_callback";
end;

define inline-only C-function gtk-widget-allocate
  input parameter self :: <GtkWidget>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter baseline_ :: <C-signed-int>;
  input parameter transform_ :: <GskTransform>;
  c-name: "gtk_widget_allocate";
end;

define inline-only C-function gtk-widget-child-focus
  input parameter self :: <GtkWidget>;
  input parameter direction_ :: <GtkDirectionType>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_child_focus";
end;

define inline-only C-function gtk-widget-compute-bounds
  input parameter self :: <GtkWidget>;
  input parameter target_ :: <GtkWidget>;
  input parameter out_bounds_ :: <GrapheneRect>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_compute_bounds";
end;

define inline-only C-function gtk-widget-compute-expand
  input parameter self :: <GtkWidget>;
  input parameter orientation_ :: <GtkOrientation>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_compute_expand";
end;

define inline-only C-function gtk-widget-compute-point
  input parameter self :: <GtkWidget>;
  input parameter target_ :: <GtkWidget>;
  input parameter point_ :: <GraphenePoint>;
  input parameter out_point_ :: <GraphenePoint>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_compute_point";
end;

define inline-only C-function gtk-widget-compute-transform
  input parameter self :: <GtkWidget>;
  input parameter target_ :: <GtkWidget>;
  input parameter out_transform_ :: <GrapheneMatrix>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_compute_transform";
end;

define inline-only C-function gtk-widget-contains
  input parameter self :: <GtkWidget>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_contains";
end;

define inline-only C-function gtk-widget-create-pango-context
  input parameter self :: <GtkWidget>;
  result res :: <PangoContext>;
  c-name: "gtk_widget_create_pango_context";
end;

define inline-only C-function gtk-widget-create-pango-layout
  input parameter self :: <GtkWidget>;
  input parameter text_ :: <C-string>;
  result res :: <PangoLayout>;
  c-name: "gtk_widget_create_pango_layout";
end;

define inline-only C-function gtk-widget-dispose-template
  input parameter self :: <GtkWidget>;
  input parameter widget_type_ :: <C-long>;
  c-name: "gtk_widget_dispose_template";
end;

define inline-only C-function gtk-drag-check-threshold
  input parameter self :: <GtkWidget>;
  input parameter start_x_ :: <C-signed-int>;
  input parameter start_y_ :: <C-signed-int>;
  input parameter current_x_ :: <C-signed-int>;
  input parameter current_y_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gtk_drag_check_threshold";
end;

define inline-only C-function gtk-widget-error-bell
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_error_bell";
end;

define inline-only C-function gtk-widget-get-allocated-baseline
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_allocated_baseline";
end;

define inline-only C-function gtk-widget-get-allocated-height
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_allocated_height";
end;

define inline-only C-function gtk-widget-get-allocated-width
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_allocated_width";
end;

define inline-only C-function gtk-widget-get-allocation
  input parameter self :: <GtkWidget>;
  input parameter allocation_ :: <GdkRectangle>;
  c-name: "gtk_widget_get_allocation";
end;

define inline-only C-function gtk-widget-get-ancestor
  input parameter self :: <GtkWidget>;
  input parameter widget_type_ :: <C-long>;
  result res :: <GtkWidget>;
  c-name: "gtk_widget_get_ancestor";
end;

define inline-only C-function gtk-widget-get-can-focus
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_can_focus";
end;

define inline-only C-function gtk-widget-get-can-target
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_can_target";
end;

define inline-only C-function gtk-widget-get-child-visible
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_child_visible";
end;

define inline-only C-function gtk-widget-get-clipboard
  input parameter self :: <GtkWidget>;
  result res :: <GdkClipboard>;
  c-name: "gtk_widget_get_clipboard";
end;

define inline-only C-function gtk-widget-get-css-classes
  input parameter self :: <GtkWidget>;
  result res :: <C-string*>;
  c-name: "gtk_widget_get_css_classes";
end;

define inline-only C-function gtk-widget-get-css-name
  input parameter self :: <GtkWidget>;
  result res :: <C-string>;
  c-name: "gtk_widget_get_css_name";
end;

define inline-only C-function gtk-widget-get-cursor
  input parameter self :: <GtkWidget>;
  result res :: <GdkCursor>;
  c-name: "gtk_widget_get_cursor";
end;

define inline-only C-function gtk-widget-get-direction
  input parameter self :: <GtkWidget>;
  result res :: <GtkTextDirection>;
  c-name: "gtk_widget_get_direction";
end;

define inline-only C-function gtk-widget-get-display
  input parameter self :: <GtkWidget>;
  result res :: <GdkDisplay>;
  c-name: "gtk_widget_get_display";
end;

define inline-only C-function gtk-widget-get-first-child
  input parameter self :: <GtkWidget>;
  result res :: <GtkWidget>;
  c-name: "gtk_widget_get_first_child";
end;

define inline-only C-function gtk-widget-get-focus-child
  input parameter self :: <GtkWidget>;
  result res :: <GtkWidget>;
  c-name: "gtk_widget_get_focus_child";
end;

define inline-only C-function gtk-widget-get-focus-on-click
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_focus_on_click";
end;

define inline-only C-function gtk-widget-get-focusable
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_focusable";
end;

define inline-only C-function gtk-widget-get-font-map
  input parameter self :: <GtkWidget>;
  result res :: <PangoFontMap>;
  c-name: "gtk_widget_get_font_map";
end;

define inline-only C-function gtk-widget-get-font-options
  input parameter self :: <GtkWidget>;
  result res :: <cairoFontOptions>;
  c-name: "gtk_widget_get_font_options";
end;

define inline-only C-function gtk-widget-get-frame-clock
  input parameter self :: <GtkWidget>;
  result res :: <GdkFrameClock>;
  c-name: "gtk_widget_get_frame_clock";
end;

define inline-only C-function gtk-widget-get-halign
  input parameter self :: <GtkWidget>;
  result res :: <GtkAlign>;
  c-name: "gtk_widget_get_halign";
end;

define inline-only C-function gtk-widget-get-has-tooltip
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_has_tooltip";
end;

define inline-only C-function gtk-widget-get-height
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_height";
end;

define inline-only C-function gtk-widget-get-hexpand
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_hexpand";
end;

define inline-only C-function gtk-widget-get-hexpand-set
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_hexpand_set";
end;

define inline-only C-function gtk-widget-get-last-child
  input parameter self :: <GtkWidget>;
  result res :: <GtkWidget>;
  c-name: "gtk_widget_get_last_child";
end;

define inline-only C-function gtk-widget-get-layout-manager
  input parameter self :: <GtkWidget>;
  result res :: <GtkLayoutManager>;
  c-name: "gtk_widget_get_layout_manager";
end;

define inline-only C-function gtk-widget-get-mapped
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_mapped";
end;

define inline-only C-function gtk-widget-get-margin-bottom
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_margin_bottom";
end;

define inline-only C-function gtk-widget-get-margin-end
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_margin_end";
end;

define inline-only C-function gtk-widget-get-margin-start
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_margin_start";
end;

define inline-only C-function gtk-widget-get-margin-top
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_margin_top";
end;

define inline-only C-function gtk-widget-get-name
  input parameter self :: <GtkWidget>;
  result res :: <C-string>;
  c-name: "gtk_widget_get_name";
end;

define inline-only C-function gtk-widget-get-native
  input parameter self :: <GtkWidget>;
  result res :: <GtkNative>;
  c-name: "gtk_widget_get_native";
end;

define inline-only C-function gtk-widget-get-next-sibling
  input parameter self :: <GtkWidget>;
  result res :: <GtkWidget>;
  c-name: "gtk_widget_get_next_sibling";
end;

define inline-only C-function gtk-widget-get-opacity
  input parameter self :: <GtkWidget>;
  result res :: <C-double>;
  c-name: "gtk_widget_get_opacity";
end;

define inline-only C-function gtk-widget-get-overflow
  input parameter self :: <GtkWidget>;
  result res :: <GtkOverflow>;
  c-name: "gtk_widget_get_overflow";
end;

define inline-only C-function gtk-widget-get-pango-context
  input parameter self :: <GtkWidget>;
  result res :: <PangoContext>;
  c-name: "gtk_widget_get_pango_context";
end;

define inline-only C-function gtk-widget-get-parent
  input parameter self :: <GtkWidget>;
  result res :: <GtkWidget>;
  c-name: "gtk_widget_get_parent";
end;

define inline-only C-function gtk-widget-get-preferred-size
  input parameter self :: <GtkWidget>;
  input parameter minimum_size_ :: <GtkRequisition>;
  input parameter natural_size_ :: <GtkRequisition>;
  c-name: "gtk_widget_get_preferred_size";
end;

define inline-only C-function gtk-widget-get-prev-sibling
  input parameter self :: <GtkWidget>;
  result res :: <GtkWidget>;
  c-name: "gtk_widget_get_prev_sibling";
end;

define inline-only C-function gtk-widget-get-primary-clipboard
  input parameter self :: <GtkWidget>;
  result res :: <GdkClipboard>;
  c-name: "gtk_widget_get_primary_clipboard";
end;

define inline-only C-function gtk-widget-get-realized
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_realized";
end;

define inline-only C-function gtk-widget-get-receives-default
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_receives_default";
end;

define inline-only C-function gtk-widget-get-request-mode
  input parameter self :: <GtkWidget>;
  result res :: <GtkSizeRequestMode>;
  c-name: "gtk_widget_get_request_mode";
end;

define inline-only C-function gtk-widget-get-root
  input parameter self :: <GtkWidget>;
  result res :: <GtkRoot>;
  c-name: "gtk_widget_get_root";
end;

define inline-only C-function gtk-widget-get-scale-factor
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_scale_factor";
end;

define inline-only C-function gtk-widget-get-sensitive
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_sensitive";
end;

define inline-only C-function gtk-widget-get-settings
  input parameter self :: <GtkWidget>;
  result res :: <GtkSettings>;
  c-name: "gtk_widget_get_settings";
end;

define inline-only C-function gtk-widget-get-size
  input parameter self :: <GtkWidget>;
  input parameter orientation_ :: <GtkOrientation>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_size";
end;

define inline-only C-function gtk-widget-get-size-request
  input parameter self :: <GtkWidget>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_widget_get_size_request";
end;

define inline-only C-function gtk-widget-get-state-flags
  input parameter self :: <GtkWidget>;
  result res :: <GtkStateFlags>;
  c-name: "gtk_widget_get_state_flags";
end;

define inline-only C-function gtk-widget-get-style-context
  input parameter self :: <GtkWidget>;
  result res :: <GtkStyleContext>;
  c-name: "gtk_widget_get_style_context";
end;

define inline-only C-function gtk-widget-get-template-child
  input parameter self :: <GtkWidget>;
  input parameter widget_type_ :: <C-long>;
  input parameter name_ :: <C-string>;
  result res :: <GObject>;
  c-name: "gtk_widget_get_template_child";
end;

define inline-only C-function gtk-widget-get-tooltip-markup
  input parameter self :: <GtkWidget>;
  result res :: <C-string>;
  c-name: "gtk_widget_get_tooltip_markup";
end;

define inline-only C-function gtk-widget-get-tooltip-text
  input parameter self :: <GtkWidget>;
  result res :: <C-string>;
  c-name: "gtk_widget_get_tooltip_text";
end;

define inline-only C-function gtk-widget-get-valign
  input parameter self :: <GtkWidget>;
  result res :: <GtkAlign>;
  c-name: "gtk_widget_get_valign";
end;

define inline-only C-function gtk-widget-get-vexpand
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_vexpand";
end;

define inline-only C-function gtk-widget-get-vexpand-set
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_vexpand_set";
end;

define inline-only C-function gtk-widget-get-visible
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_get_visible";
end;

define inline-only C-function gtk-widget-get-width
  input parameter self :: <GtkWidget>;
  result res :: <C-signed-int>;
  c-name: "gtk_widget_get_width";
end;

define inline-only C-function gtk-widget-grab-focus
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_grab_focus";
end;

define inline-only C-function gtk-widget-has-css-class
  input parameter self :: <GtkWidget>;
  input parameter css_class_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_has_css_class";
end;

define inline-only C-function gtk-widget-has-default
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_has_default";
end;

define inline-only C-function gtk-widget-has-focus
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_has_focus";
end;

define inline-only C-function gtk-widget-has-visible-focus
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_has_visible_focus";
end;

define inline-only C-function gtk-widget-hide
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_hide";
end;

define inline-only C-function gtk-widget-in-destruction
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_in_destruction";
end;

define inline-only C-function gtk-widget-init-template
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_init_template";
end;

define inline-only C-function gtk-widget-insert-action-group
  input parameter self :: <GtkWidget>;
  input parameter name_ :: <C-string>;
  input parameter group_ :: <GActionGroup>;
  c-name: "gtk_widget_insert_action_group";
end;

define inline-only C-function gtk-widget-insert-after
  input parameter self :: <GtkWidget>;
  input parameter parent_ :: <GtkWidget>;
  input parameter previous_sibling_ :: <GtkWidget>;
  c-name: "gtk_widget_insert_after";
end;

define inline-only C-function gtk-widget-insert-before
  input parameter self :: <GtkWidget>;
  input parameter parent_ :: <GtkWidget>;
  input parameter next_sibling_ :: <GtkWidget>;
  c-name: "gtk_widget_insert_before";
end;

define inline-only C-function gtk-widget-is-ancestor
  input parameter self :: <GtkWidget>;
  input parameter ancestor_ :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_is_ancestor";
end;

define inline-only C-function gtk-widget-is-drawable
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_is_drawable";
end;

define inline-only C-function gtk-widget-is-focus
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_is_focus";
end;

define inline-only C-function gtk-widget-is-sensitive
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_is_sensitive";
end;

define inline-only C-function gtk-widget-is-visible
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_is_visible";
end;

define inline-only C-function gtk-widget-keynav-failed
  input parameter self :: <GtkWidget>;
  input parameter direction_ :: <GtkDirectionType>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_keynav_failed";
end;

define inline-only C-function gtk-widget-list-mnemonic-labels
  input parameter self :: <GtkWidget>;
  result res :: <GList>;
  c-name: "gtk_widget_list_mnemonic_labels";
end;

define inline-only C-function gtk-widget-map
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_map";
end;

define inline-only C-function gtk-widget-measure
  input parameter self :: <GtkWidget>;
  input parameter orientation_ :: <GtkOrientation>;
  input parameter for_size_ :: <C-signed-int>;
  output parameter minimum_ :: <C-signed-int*>;
  output parameter natural_ :: <C-signed-int*>;
  output parameter minimum_baseline_ :: <C-signed-int*>;
  output parameter natural_baseline_ :: <C-signed-int*>;
  c-name: "gtk_widget_measure";
end;

define inline-only C-function gtk-widget-mnemonic-activate
  input parameter self :: <GtkWidget>;
  input parameter group_cycling_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_mnemonic_activate";
end;

define inline-only C-function gtk-widget-observe-children
  input parameter self :: <GtkWidget>;
  result res :: <GListModel>;
  c-name: "gtk_widget_observe_children";
end;

define inline-only C-function gtk-widget-observe-controllers
  input parameter self :: <GtkWidget>;
  result res :: <GListModel>;
  c-name: "gtk_widget_observe_controllers";
end;

define inline-only C-function gtk-widget-pick
  input parameter self :: <GtkWidget>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter flags_ :: <GtkPickFlags>;
  result res :: <GtkWidget>;
  c-name: "gtk_widget_pick";
end;

define inline-only C-function gtk-widget-queue-allocate
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_queue_allocate";
end;

define inline-only C-function gtk-widget-queue-draw
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_queue_draw";
end;

define inline-only C-function gtk-widget-queue-resize
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_queue_resize";
end;

define inline-only C-function gtk-widget-realize
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_realize";
end;

define inline-only C-function gtk-widget-remove-controller
  input parameter self :: <GtkWidget>;
  input parameter controller_ :: <GtkEventController>;
  c-name: "gtk_widget_remove_controller";
end;

define inline-only C-function gtk-widget-remove-css-class
  input parameter self :: <GtkWidget>;
  input parameter css_class_ :: <C-string>;
  c-name: "gtk_widget_remove_css_class";
end;

define inline-only C-function gtk-widget-remove-mnemonic-label
  input parameter self :: <GtkWidget>;
  input parameter label_ :: <GtkWidget>;
  c-name: "gtk_widget_remove_mnemonic_label";
end;

define inline-only C-function gtk-widget-remove-tick-callback
  input parameter self :: <GtkWidget>;
  input parameter id_ :: <C-unsigned-int>;
  c-name: "gtk_widget_remove_tick_callback";
end;

define inline-only C-function gtk-widget-set-can-focus
  input parameter self :: <GtkWidget>;
  input parameter can_focus_ :: <C-boolean>;
  c-name: "gtk_widget_set_can_focus";
end;

define inline-only C-function gtk-widget-set-can-target
  input parameter self :: <GtkWidget>;
  input parameter can_target_ :: <C-boolean>;
  c-name: "gtk_widget_set_can_target";
end;

define inline-only C-function gtk-widget-set-child-visible
  input parameter self :: <GtkWidget>;
  input parameter child_visible_ :: <C-boolean>;
  c-name: "gtk_widget_set_child_visible";
end;

define inline-only C-function gtk-widget-set-css-classes
  input parameter self :: <GtkWidget>;
  input parameter classes_ :: <C-string*>;
  c-name: "gtk_widget_set_css_classes";
end;

define inline-only C-function gtk-widget-set-cursor
  input parameter self :: <GtkWidget>;
  input parameter cursor_ :: <GdkCursor>;
  c-name: "gtk_widget_set_cursor";
end;

define inline-only C-function gtk-widget-set-cursor-from-name
  input parameter self :: <GtkWidget>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_widget_set_cursor_from_name";
end;

define inline-only C-function gtk-widget-set-direction
  input parameter self :: <GtkWidget>;
  input parameter dir_ :: <GtkTextDirection>;
  c-name: "gtk_widget_set_direction";
end;

define inline-only C-function gtk-widget-set-focus-child
  input parameter self :: <GtkWidget>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_widget_set_focus_child";
end;

define inline-only C-function gtk-widget-set-focus-on-click
  input parameter self :: <GtkWidget>;
  input parameter focus_on_click_ :: <C-boolean>;
  c-name: "gtk_widget_set_focus_on_click";
end;

define inline-only C-function gtk-widget-set-focusable
  input parameter self :: <GtkWidget>;
  input parameter focusable_ :: <C-boolean>;
  c-name: "gtk_widget_set_focusable";
end;

define inline-only C-function gtk-widget-set-font-map
  input parameter self :: <GtkWidget>;
  input parameter font_map_ :: <PangoFontMap>;
  c-name: "gtk_widget_set_font_map";
end;

define inline-only C-function gtk-widget-set-font-options
  input parameter self :: <GtkWidget>;
  input parameter options_ :: <cairoFontOptions>;
  c-name: "gtk_widget_set_font_options";
end;

define inline-only C-function gtk-widget-set-halign
  input parameter self :: <GtkWidget>;
  input parameter align_ :: <GtkAlign>;
  c-name: "gtk_widget_set_halign";
end;

define inline-only C-function gtk-widget-set-has-tooltip
  input parameter self :: <GtkWidget>;
  input parameter has_tooltip_ :: <C-boolean>;
  c-name: "gtk_widget_set_has_tooltip";
end;

define inline-only C-function gtk-widget-set-hexpand
  input parameter self :: <GtkWidget>;
  input parameter expand_ :: <C-boolean>;
  c-name: "gtk_widget_set_hexpand";
end;

define inline-only C-function gtk-widget-set-hexpand-set
  input parameter self :: <GtkWidget>;
  input parameter set_ :: <C-boolean>;
  c-name: "gtk_widget_set_hexpand_set";
end;

define inline-only C-function gtk-widget-set-layout-manager
  input parameter self :: <GtkWidget>;
  input parameter layout_manager_ :: <GtkLayoutManager>;
  c-name: "gtk_widget_set_layout_manager";
end;

define inline-only C-function gtk-widget-set-margin-bottom
  input parameter self :: <GtkWidget>;
  input parameter margin_ :: <C-signed-int>;
  c-name: "gtk_widget_set_margin_bottom";
end;

define inline-only C-function gtk-widget-set-margin-end
  input parameter self :: <GtkWidget>;
  input parameter margin_ :: <C-signed-int>;
  c-name: "gtk_widget_set_margin_end";
end;

define inline-only C-function gtk-widget-set-margin-start
  input parameter self :: <GtkWidget>;
  input parameter margin_ :: <C-signed-int>;
  c-name: "gtk_widget_set_margin_start";
end;

define inline-only C-function gtk-widget-set-margin-top
  input parameter self :: <GtkWidget>;
  input parameter margin_ :: <C-signed-int>;
  c-name: "gtk_widget_set_margin_top";
end;

define inline-only C-function gtk-widget-set-name
  input parameter self :: <GtkWidget>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_widget_set_name";
end;

define inline-only C-function gtk-widget-set-opacity
  input parameter self :: <GtkWidget>;
  input parameter opacity_ :: <C-double>;
  c-name: "gtk_widget_set_opacity";
end;

define inline-only C-function gtk-widget-set-overflow
  input parameter self :: <GtkWidget>;
  input parameter overflow_ :: <GtkOverflow>;
  c-name: "gtk_widget_set_overflow";
end;

define inline-only C-function gtk-widget-set-parent
  input parameter self :: <GtkWidget>;
  input parameter parent_ :: <GtkWidget>;
  c-name: "gtk_widget_set_parent";
end;

define inline-only C-function gtk-widget-set-receives-default
  input parameter self :: <GtkWidget>;
  input parameter receives_default_ :: <C-boolean>;
  c-name: "gtk_widget_set_receives_default";
end;

define inline-only C-function gtk-widget-set-sensitive
  input parameter self :: <GtkWidget>;
  input parameter sensitive_ :: <C-boolean>;
  c-name: "gtk_widget_set_sensitive";
end;

define inline-only C-function gtk-widget-set-size-request
  input parameter self :: <GtkWidget>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_widget_set_size_request";
end;

define inline-only C-function gtk-widget-set-state-flags
  input parameter self :: <GtkWidget>;
  input parameter flags_ :: <GtkStateFlags>;
  input parameter clear_ :: <C-boolean>;
  c-name: "gtk_widget_set_state_flags";
end;

define inline-only C-function gtk-widget-set-tooltip-markup
  input parameter self :: <GtkWidget>;
  input parameter markup_ :: <C-string>;
  c-name: "gtk_widget_set_tooltip_markup";
end;

define inline-only C-function gtk-widget-set-tooltip-text
  input parameter self :: <GtkWidget>;
  input parameter text_ :: <C-string>;
  c-name: "gtk_widget_set_tooltip_text";
end;

define inline-only C-function gtk-widget-set-valign
  input parameter self :: <GtkWidget>;
  input parameter align_ :: <GtkAlign>;
  c-name: "gtk_widget_set_valign";
end;

define inline-only C-function gtk-widget-set-vexpand
  input parameter self :: <GtkWidget>;
  input parameter expand_ :: <C-boolean>;
  c-name: "gtk_widget_set_vexpand";
end;

define inline-only C-function gtk-widget-set-vexpand-set
  input parameter self :: <GtkWidget>;
  input parameter set_ :: <C-boolean>;
  c-name: "gtk_widget_set_vexpand_set";
end;

define inline-only C-function gtk-widget-set-visible
  input parameter self :: <GtkWidget>;
  input parameter visible_ :: <C-boolean>;
  c-name: "gtk_widget_set_visible";
end;

define inline-only C-function gtk-widget-should-layout
  input parameter self :: <GtkWidget>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_should_layout";
end;

define inline-only C-function gtk-widget-show
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_show";
end;

define inline-only C-function gtk-widget-size-allocate
  input parameter self :: <GtkWidget>;
  input parameter allocation_ :: <GdkRectangle>;
  input parameter baseline_ :: <C-signed-int>;
  c-name: "gtk_widget_size_allocate";
end;

define inline-only C-function gtk-widget-snapshot-child
  input parameter self :: <GtkWidget>;
  input parameter child_ :: <GtkWidget>;
  input parameter snapshot_ :: <GtkSnapshot>;
  c-name: "gtk_widget_snapshot_child";
end;

define inline-only C-function gtk-widget-translate-coordinates
  input parameter self :: <GtkWidget>;
  input parameter dest_widget_ :: <GtkWidget>;
  input parameter src_x_ :: <C-double>;
  input parameter src_y_ :: <C-double>;
  output parameter dest_x_ :: <C-double*>;
  output parameter dest_y_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_translate_coordinates";
end;

define inline-only C-function gtk-widget-trigger-tooltip-query
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_trigger_tooltip_query";
end;

define inline-only C-function gtk-widget-unmap
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_unmap";
end;

define inline-only C-function gtk-widget-unparent
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_unparent";
end;

define inline-only C-function gtk-widget-unrealize
  input parameter self :: <GtkWidget>;
  c-name: "gtk_widget_unrealize";
end;

define inline-only C-function gtk-widget-unset-state-flags
  input parameter self :: <GtkWidget>;
  input parameter flags_ :: <GtkStateFlags>;
  c-name: "gtk_widget_unset_state_flags";
end;

define C-struct <_GtkWidgetClass>
  constant sealed inline-only slot gtk-widget-class-parent-class :: <GInitiallyUnownedClass>;
  constant sealed inline-only slot gtk-widget-class-show :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-hide :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-map :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-unmap :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-realize :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-unrealize :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-root :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-unroot :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-size-allocate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-state-flags-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-direction-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-get-request-mode :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-measure :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-mnemonic-activate :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-grab-focus :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-focus :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-set-focus-child :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-move-focus :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-keynav-failed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-query-tooltip :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-compute-expand :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-css-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-system-setting-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-snapshot :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-contains :: <C-function-pointer>;
  constant sealed inline-only slot gtk-widget-class-priv :: <GtkWidgetClassPrivate>;
  constant sealed inline-only slot gtk-widget-class-padding :: <C-void*>;
  pointer-type-name: <GtkWidgetClass>;
end C-struct;

define sealed domain make (singleton(<GtkWidgetClass>));
define sealed domain initialize (<GtkWidgetClass>);

define inline-only C-function gtk-widget-class-add-shortcut
  input parameter self :: <GtkWidgetClass>;
  input parameter shortcut_ :: <GtkShortcut>;
  c-name: "gtk_widget_class_add_shortcut";
end;

define inline-only C-function gtk-widget-class-bind-template-callback-full
  input parameter self :: <GtkWidgetClass>;
  input parameter callback_name_ :: <C-string>;
  input parameter callback_symbol_ :: <C-function-pointer>;
  c-name: "gtk_widget_class_bind_template_callback_full";
end;

define inline-only C-function gtk-widget-class-bind-template-child-full
  input parameter self :: <GtkWidgetClass>;
  input parameter name_ :: <C-string>;
  input parameter internal_child_ :: <C-boolean>;
  input parameter struct_offset_ :: <C-signed-long>;
  c-name: "gtk_widget_class_bind_template_child_full";
end;

define inline-only C-function gtk-widget-class-get-accessible-role
  input parameter self :: <GtkWidgetClass>;
  result res :: <GtkAccessibleRole>;
  c-name: "gtk_widget_class_get_accessible_role";
end;

define inline-only C-function gtk-widget-class-get-activate-signal
  input parameter self :: <GtkWidgetClass>;
  result res :: <C-unsigned-int>;
  c-name: "gtk_widget_class_get_activate_signal";
end;

define inline-only C-function gtk-widget-class-get-css-name
  input parameter self :: <GtkWidgetClass>;
  result res :: <C-string>;
  c-name: "gtk_widget_class_get_css_name";
end;

define inline-only C-function gtk-widget-class-get-layout-manager-type
  input parameter self :: <GtkWidgetClass>;
  result res :: <C-long>;
  c-name: "gtk_widget_class_get_layout_manager_type";
end;

define inline-only C-function gtk-widget-class-install-action
  input parameter self :: <GtkWidgetClass>;
  input parameter action_name_ :: <C-string>;
  input parameter parameter_type_ :: <C-string>;
  input parameter activate_ :: <C-function-pointer>;
  c-name: "gtk_widget_class_install_action";
end;

define inline-only C-function gtk-widget-class-install-property-action
  input parameter self :: <GtkWidgetClass>;
  input parameter action_name_ :: <C-string>;
  input parameter property_name_ :: <C-string>;
  c-name: "gtk_widget_class_install_property_action";
end;

define inline-only C-function gtk-widget-class-query-action
  input parameter self :: <GtkWidgetClass>;
  input parameter index__ :: <C-unsigned-int>;
  output parameter owner_ :: <C-long*>;
  output parameter action_name_ :: <C-string>;
  input parameter parameter_type_ :: <GVariantType>;
  output parameter property_name_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gtk_widget_class_query_action";
end;

define inline-only C-function gtk-widget-class-set-accessible-role
  input parameter self :: <GtkWidgetClass>;
  input parameter accessible_role_ :: <GtkAccessibleRole>;
  c-name: "gtk_widget_class_set_accessible_role";
end;

define inline-only C-function gtk-widget-class-set-activate-signal
  input parameter self :: <GtkWidgetClass>;
  input parameter signal_id_ :: <C-unsigned-int>;
  c-name: "gtk_widget_class_set_activate_signal";
end;

define inline-only C-function gtk-widget-class-set-activate-signal-from-name
  input parameter self :: <GtkWidgetClass>;
  input parameter signal_name_ :: <C-string>;
  c-name: "gtk_widget_class_set_activate_signal_from_name";
end;

define inline-only C-function gtk-widget-class-set-css-name
  input parameter self :: <GtkWidgetClass>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_widget_class_set_css_name";
end;

define inline-only C-function gtk-widget-class-set-layout-manager-type
  input parameter self :: <GtkWidgetClass>;
  input parameter type_ :: <C-long>;
  c-name: "gtk_widget_class_set_layout_manager_type";
end;

define inline-only C-function gtk-widget-class-set-template
  input parameter self :: <GtkWidgetClass>;
  input parameter template_bytes_ :: <GBytes>;
  c-name: "gtk_widget_class_set_template";
end;

define inline-only C-function gtk-widget-class-set-template-from-resource
  input parameter self :: <GtkWidgetClass>;
  input parameter resource_name_ :: <C-string>;
  c-name: "gtk_widget_class_set_template_from_resource";
end;

define inline-only C-function gtk-widget-class-set-template-scope
  input parameter self :: <GtkWidgetClass>;
  input parameter scope_ :: <GtkBuilderScope>;
  c-name: "gtk_widget_class_set_template_scope";
end;

define C-struct <_GtkWidgetClassPrivate>
  pointer-type-name: <GtkWidgetClassPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkWidgetClassPrivate>));
define sealed domain initialize (<GtkWidgetClassPrivate>);

define open C-subtype <GtkWidgetPaintable> (<GObject>, <GdkPaintable>)
end C-subtype;

define C-pointer-type <GtkWidgetPaintable*> => <GtkWidgetPaintable>;

define sealed domain make (singleton(<GtkWidgetPaintable*>));
define sealed domain initialize (<GtkWidgetPaintable*>);

define inline-only C-function gtk-widget-paintable-new
  input parameter widget_ :: <GtkWidget>;
  result res :: <GtkWidgetPaintable>;
  c-name: "gtk_widget_paintable_new";
end;

define inline-only C-function gtk-widget-paintable-get-widget
  input parameter self :: <GtkWidgetPaintable>;
  result res :: <GtkWidget>;
  c-name: "gtk_widget_paintable_get_widget";
end;

define inline-only C-function gtk-widget-paintable-set-widget
  input parameter self :: <GtkWidgetPaintable>;
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_widget_paintable_set_widget";
end;

define C-struct <_GtkWidgetPaintableClass>
  constant sealed inline-only slot gtk-widget-paintable-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GtkWidgetPaintableClass>;
end C-struct;

define sealed domain make (singleton(<GtkWidgetPaintableClass>));
define sealed domain initialize (<GtkWidgetPaintableClass>);

define C-struct <_GtkWidgetPrivate>
  pointer-type-name: <GtkWidgetPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkWidgetPrivate>));
define sealed domain initialize (<GtkWidgetPrivate>);

define open C-subtype <GtkWindow> (<GtkRoot>, <GtkShortcutManager>)
  // parent_instance
end C-subtype;

define C-pointer-type <GtkWindow*> => <GtkWindow>;

define sealed domain make (singleton(<GtkWindow*>));
define sealed domain initialize (<GtkWindow*>);

define inline-only C-function gtk-window-new
  result res :: <GtkWidget>;
  c-name: "gtk_window_new";
end;

define inline-only C-function gtk-window-get-default-icon-name
  result res :: <C-string>;
  c-name: "gtk_window_get_default_icon_name";
end;

define inline-only C-function gtk-window-get-toplevels
  result res :: <GListModel>;
  c-name: "gtk_window_get_toplevels";
end;

define inline-only C-function gtk-window-list-toplevels
  result res :: <GList>;
  c-name: "gtk_window_list_toplevels";
end;

define inline-only C-function gtk-window-set-auto-startup-notification
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_window_set_auto_startup_notification";
end;

define inline-only C-function gtk-window-set-default-icon-name
  input parameter name_ :: <C-string>;
  c-name: "gtk_window_set_default_icon_name";
end;

define inline-only C-function gtk-window-set-interactive-debugging
  input parameter enable_ :: <C-boolean>;
  c-name: "gtk_window_set_interactive_debugging";
end;

define inline-only C-function gtk-window-close
  input parameter self :: <GtkWindow>;
  c-name: "gtk_window_close";
end;

define inline-only C-function gtk-window-destroy
  input parameter self :: <GtkWindow>;
  c-name: "gtk_window_destroy";
end;

define inline-only C-function gtk-window-fullscreen
  input parameter self :: <GtkWindow>;
  c-name: "gtk_window_fullscreen";
end;

define inline-only C-function gtk-window-fullscreen-on-monitor
  input parameter self :: <GtkWindow>;
  input parameter monitor_ :: <GdkMonitor>;
  c-name: "gtk_window_fullscreen_on_monitor";
end;

define inline-only C-function gtk-window-get-application
  input parameter self :: <GtkWindow>;
  result res :: <GtkApplication>;
  c-name: "gtk_window_get_application";
end;

define inline-only C-function gtk-window-get-child
  input parameter self :: <GtkWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_window_get_child";
end;

define inline-only C-function gtk-window-get-decorated
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_get_decorated";
end;

define inline-only C-function gtk-window-get-default-size
  input parameter self :: <GtkWindow>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "gtk_window_get_default_size";
end;

define inline-only C-function gtk-window-get-default-widget
  input parameter self :: <GtkWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_window_get_default_widget";
end;

define inline-only C-function gtk-window-get-deletable
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_get_deletable";
end;

define inline-only C-function gtk-window-get-destroy-with-parent
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_get_destroy_with_parent";
end;

define inline-only C-function gtk-window-get-focus
  input parameter self :: <GtkWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_window_get_focus";
end;

define inline-only C-function gtk-window-get-focus-visible
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_get_focus_visible";
end;

define inline-only C-function gtk-window-get-group
  input parameter self :: <GtkWindow>;
  result res :: <GtkWindowGroup>;
  c-name: "gtk_window_get_group";
end;

define inline-only C-function gtk-window-get-handle-menubar-accel
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_get_handle_menubar_accel";
end;

define inline-only C-function gtk-window-get-hide-on-close
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_get_hide_on_close";
end;

define inline-only C-function gtk-window-get-icon-name
  input parameter self :: <GtkWindow>;
  result res :: <C-string>;
  c-name: "gtk_window_get_icon_name";
end;

define inline-only C-function gtk-window-get-mnemonics-visible
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_get_mnemonics_visible";
end;

define inline-only C-function gtk-window-get-modal
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_get_modal";
end;

define inline-only C-function gtk-window-get-resizable
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_get_resizable";
end;

define inline-only C-function gtk-window-get-title
  input parameter self :: <GtkWindow>;
  result res :: <C-string>;
  c-name: "gtk_window_get_title";
end;

define inline-only C-function gtk-window-get-titlebar
  input parameter self :: <GtkWindow>;
  result res :: <GtkWidget>;
  c-name: "gtk_window_get_titlebar";
end;

define inline-only C-function gtk-window-get-transient-for
  input parameter self :: <GtkWindow>;
  result res :: <GtkWindow>;
  c-name: "gtk_window_get_transient_for";
end;

define inline-only C-function gtk-window-has-group
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_has_group";
end;

define inline-only C-function gtk-window-is-active
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_is_active";
end;

define inline-only C-function gtk-window-is-fullscreen
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_is_fullscreen";
end;

define inline-only C-function gtk-window-is-maximized
  input parameter self :: <GtkWindow>;
  result res :: <C-boolean>;
  c-name: "gtk_window_is_maximized";
end;

define inline-only C-function gtk-window-maximize
  input parameter self :: <GtkWindow>;
  c-name: "gtk_window_maximize";
end;

define inline-only C-function gtk-window-minimize
  input parameter self :: <GtkWindow>;
  c-name: "gtk_window_minimize";
end;

define inline-only C-function gtk-window-present
  input parameter self :: <GtkWindow>;
  c-name: "gtk_window_present";
end;

define inline-only C-function gtk-window-present-with-time
  input parameter self :: <GtkWindow>;
  input parameter timestamp_ :: <C-unsigned-int>;
  c-name: "gtk_window_present_with_time";
end;

define inline-only C-function gtk-window-set-application
  input parameter self :: <GtkWindow>;
  input parameter application_ :: <GtkApplication>;
  c-name: "gtk_window_set_application";
end;

define inline-only C-function gtk-window-set-child
  input parameter self :: <GtkWindow>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_window_set_child";
end;

define inline-only C-function gtk-window-set-decorated
  input parameter self :: <GtkWindow>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_window_set_decorated";
end;

define inline-only C-function gtk-window-set-default-size
  input parameter self :: <GtkWindow>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gtk_window_set_default_size";
end;

define inline-only C-function gtk-window-set-default-widget
  input parameter self :: <GtkWindow>;
  input parameter default_widget_ :: <GtkWidget>;
  c-name: "gtk_window_set_default_widget";
end;

define inline-only C-function gtk-window-set-deletable
  input parameter self :: <GtkWindow>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_window_set_deletable";
end;

define inline-only C-function gtk-window-set-destroy-with-parent
  input parameter self :: <GtkWindow>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_window_set_destroy_with_parent";
end;

define inline-only C-function gtk-window-set-display
  input parameter self :: <GtkWindow>;
  input parameter display_ :: <GdkDisplay>;
  c-name: "gtk_window_set_display";
end;

define inline-only C-function gtk-window-set-focus
  input parameter self :: <GtkWindow>;
  input parameter focus_ :: <GtkWidget>;
  c-name: "gtk_window_set_focus";
end;

define inline-only C-function gtk-window-set-focus-visible
  input parameter self :: <GtkWindow>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_window_set_focus_visible";
end;

define inline-only C-function gtk-window-set-handle-menubar-accel
  input parameter self :: <GtkWindow>;
  input parameter handle_menubar_accel_ :: <C-boolean>;
  c-name: "gtk_window_set_handle_menubar_accel";
end;

define inline-only C-function gtk-window-set-hide-on-close
  input parameter self :: <GtkWindow>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_window_set_hide_on_close";
end;

define inline-only C-function gtk-window-set-icon-name
  input parameter self :: <GtkWindow>;
  input parameter name_ :: <C-string>;
  c-name: "gtk_window_set_icon_name";
end;

define inline-only C-function gtk-window-set-mnemonics-visible
  input parameter self :: <GtkWindow>;
  input parameter setting_ :: <C-boolean>;
  c-name: "gtk_window_set_mnemonics_visible";
end;

define inline-only C-function gtk-window-set-modal
  input parameter self :: <GtkWindow>;
  input parameter modal_ :: <C-boolean>;
  c-name: "gtk_window_set_modal";
end;

define inline-only C-function gtk-window-set-resizable
  input parameter self :: <GtkWindow>;
  input parameter resizable_ :: <C-boolean>;
  c-name: "gtk_window_set_resizable";
end;

define inline-only C-function gtk-window-set-startup-id
  input parameter self :: <GtkWindow>;
  input parameter startup_id_ :: <C-string>;
  c-name: "gtk_window_set_startup_id";
end;

define inline-only C-function gtk-window-set-title
  input parameter self :: <GtkWindow>;
  input parameter title_ :: <C-string>;
  c-name: "gtk_window_set_title";
end;

define inline-only C-function gtk-window-set-titlebar
  input parameter self :: <GtkWindow>;
  input parameter titlebar_ :: <GtkWidget>;
  c-name: "gtk_window_set_titlebar";
end;

define inline-only C-function gtk-window-set-transient-for
  input parameter self :: <GtkWindow>;
  input parameter parent_ :: <GtkWindow>;
  c-name: "gtk_window_set_transient_for";
end;

define inline-only C-function gtk-window-unfullscreen
  input parameter self :: <GtkWindow>;
  c-name: "gtk_window_unfullscreen";
end;

define inline-only C-function gtk-window-unmaximize
  input parameter self :: <GtkWindow>;
  c-name: "gtk_window_unmaximize";
end;

define inline-only C-function gtk-window-unminimize
  input parameter self :: <GtkWindow>;
  c-name: "gtk_window_unminimize";
end;

define C-struct <_GtkWindowClass>
  constant sealed inline-only slot gtk-window-class-parent-class :: <GtkWidgetClass>;
  constant sealed inline-only slot gtk-window-class-activate-focus :: <C-function-pointer>;
  constant sealed inline-only slot gtk-window-class-activate-default :: <C-function-pointer>;
  constant sealed inline-only slot gtk-window-class-keys-changed :: <C-function-pointer>;
  constant sealed inline-only slot gtk-window-class-enable-debugging :: <C-function-pointer>;
  constant sealed inline-only slot gtk-window-class-close-request :: <C-function-pointer>;
  constant sealed inline-only slot gtk-window-class-padding :: <C-void*>;
  pointer-type-name: <GtkWindowClass>;
end C-struct;

define sealed domain make (singleton(<GtkWindowClass>));
define sealed domain initialize (<GtkWindowClass>);

define open C-subtype <GtkWindowControls> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkWindowControls*> => <GtkWindowControls>;

define sealed domain make (singleton(<GtkWindowControls*>));
define sealed domain initialize (<GtkWindowControls*>);

define inline-only C-function gtk-window-controls-new
  input parameter side_ :: <GtkPackType>;
  result res :: <GtkWidget>;
  c-name: "gtk_window_controls_new";
end;

define inline-only C-function gtk-window-controls-get-decoration-layout
  input parameter self :: <GtkWindowControls>;
  result res :: <C-string>;
  c-name: "gtk_window_controls_get_decoration_layout";
end;

define inline-only C-function gtk-window-controls-get-empty
  input parameter self :: <GtkWindowControls>;
  result res :: <C-boolean>;
  c-name: "gtk_window_controls_get_empty";
end;

define inline-only C-function gtk-window-controls-get-side
  input parameter self :: <GtkWindowControls>;
  result res :: <GtkPackType>;
  c-name: "gtk_window_controls_get_side";
end;

define inline-only C-function gtk-window-controls-set-decoration-layout
  input parameter self :: <GtkWindowControls>;
  input parameter layout_ :: <C-string>;
  c-name: "gtk_window_controls_set_decoration_layout";
end;

define inline-only C-function gtk-window-controls-set-side
  input parameter self :: <GtkWindowControls>;
  input parameter side_ :: <GtkPackType>;
  c-name: "gtk_window_controls_set_side";
end;

define C-struct <_GtkWindowControlsClass>
  constant sealed inline-only slot gtk-window-controls-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkWindowControlsClass>;
end C-struct;

define sealed domain make (singleton(<GtkWindowControlsClass>));
define sealed domain initialize (<GtkWindowControlsClass>);

define open C-subtype <GtkWindowGroup> (<GObject>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GtkWindowGroup*> => <GtkWindowGroup>;

define sealed domain make (singleton(<GtkWindowGroup*>));
define sealed domain initialize (<GtkWindowGroup*>);

define inline-only C-function gtk-window-group-new
  result res :: <GtkWindowGroup>;
  c-name: "gtk_window_group_new";
end;

define inline-only C-function gtk-window-group-add-window
  input parameter self :: <GtkWindowGroup>;
  input parameter window_ :: <GtkWindow>;
  c-name: "gtk_window_group_add_window";
end;

define inline-only C-function gtk-window-group-list-windows
  input parameter self :: <GtkWindowGroup>;
  result res :: <GList>;
  c-name: "gtk_window_group_list_windows";
end;

define inline-only C-function gtk-window-group-remove-window
  input parameter self :: <GtkWindowGroup>;
  input parameter window_ :: <GtkWindow>;
  c-name: "gtk_window_group_remove_window";
end;

define C-struct <_GtkWindowGroupClass>
  constant sealed inline-only slot gtk-window-group-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gtk-window-group-class-_gtk-reserved1 :: <C-void*>;
  constant sealed inline-only slot gtk-window-group-class-_gtk-reserved2 :: <C-void*>;
  constant sealed inline-only slot gtk-window-group-class-_gtk-reserved3 :: <C-void*>;
  constant sealed inline-only slot gtk-window-group-class-_gtk-reserved4 :: <C-void*>;
  pointer-type-name: <GtkWindowGroupClass>;
end C-struct;

define sealed domain make (singleton(<GtkWindowGroupClass>));
define sealed domain initialize (<GtkWindowGroupClass>);

define C-struct <_GtkWindowGroupPrivate>
  pointer-type-name: <GtkWindowGroupPrivate>;
end C-struct;

define sealed domain make (singleton(<GtkWindowGroupPrivate>));
define sealed domain initialize (<GtkWindowGroupPrivate>);

define open C-subtype <GtkWindowHandle> (<GtkWidget>)
end C-subtype;

define C-pointer-type <GtkWindowHandle*> => <GtkWindowHandle>;

define sealed domain make (singleton(<GtkWindowHandle*>));
define sealed domain initialize (<GtkWindowHandle*>);

define inline-only C-function gtk-window-handle-new
  result res :: <GtkWidget>;
  c-name: "gtk_window_handle_new";
end;

define inline-only C-function gtk-window-handle-get-child
  input parameter self :: <GtkWindowHandle>;
  result res :: <GtkWidget>;
  c-name: "gtk_window_handle_get_child";
end;

define inline-only C-function gtk-window-handle-set-child
  input parameter self :: <GtkWindowHandle>;
  input parameter child_ :: <GtkWidget>;
  c-name: "gtk_window_handle_set_child";
end;

define C-struct <_GtkWindowHandleClass>
  constant sealed inline-only slot gtk-window-handle-class-parent-class :: <GtkWidgetClass>;
  pointer-type-name: <GtkWindowHandleClass>;
end C-struct;

define sealed domain make (singleton(<GtkWindowHandleClass>));
define sealed domain initialize (<GtkWindowHandleClass>);

define inline-only constant $gtk-wrap-none = 0;
define inline-only constant $gtk-wrap-char = 1;
define inline-only constant $gtk-wrap-word = 2;
define inline-only constant $gtk-wrap-word-char = 3;
define constant <GtkWrapMode> = <C-int>;
define C-pointer-type <GtkWrapMode*> => <GtkWrapMode>;

define inline-only C-function gtk-accelerator-get-default-mod-mask
  result res :: <GdkModifierType>;
  c-name: "gtk_accelerator_get_default_mod_mask";
end;

define inline-only C-function gtk-accelerator-get-label
  input parameter accelerator_key_ :: <C-unsigned-int>;
  input parameter accelerator_mods_ :: <GdkModifierType>;
  result res :: <C-string>;
  c-name: "gtk_accelerator_get_label";
end;

define inline-only C-function gtk-accelerator-get-label-with-keycode
  input parameter display_ :: <GdkDisplay>;
  input parameter accelerator_key_ :: <C-unsigned-int>;
  input parameter keycode_ :: <C-unsigned-int>;
  input parameter accelerator_mods_ :: <GdkModifierType>;
  result res :: <C-string>;
  c-name: "gtk_accelerator_get_label_with_keycode";
end;

define inline-only C-function gtk-accelerator-name
  input parameter accelerator_key_ :: <C-unsigned-int>;
  input parameter accelerator_mods_ :: <GdkModifierType>;
  result res :: <C-string>;
  c-name: "gtk_accelerator_name";
end;

define inline-only C-function gtk-accelerator-name-with-keycode
  input parameter display_ :: <GdkDisplay>;
  input parameter accelerator_key_ :: <C-unsigned-int>;
  input parameter keycode_ :: <C-unsigned-int>;
  input parameter accelerator_mods_ :: <GdkModifierType>;
  result res :: <C-string>;
  c-name: "gtk_accelerator_name_with_keycode";
end;

define inline-only C-function gtk-accelerator-parse
  input parameter accelerator_ :: <C-string>;
  output parameter accelerator_key_ :: <C-unsigned-int*>;
  output parameter accelerator_mods_ :: <GdkModifierType*>;
  result res :: <C-boolean>;
  c-name: "gtk_accelerator_parse";
end;

define inline-only C-function gtk-accelerator-parse-with-keycode
  input parameter accelerator_ :: <C-string>;
  input parameter display_ :: <GdkDisplay>;
  output parameter accelerator_key_ :: <C-unsigned-int*>;
  output parameter accelerator_codes_ :: <C-unsigned-int*>;
  output parameter accelerator_mods_ :: <GdkModifierType*>;
  result res :: <C-boolean>;
  c-name: "gtk_accelerator_parse_with_keycode";
end;

define inline-only C-function gtk-accelerator-valid
  input parameter keyval_ :: <C-unsigned-int>;
  input parameter modifiers_ :: <GdkModifierType>;
  result res :: <C-boolean>;
  c-name: "gtk_accelerator_valid";
end;

define inline-only C-function gtk-accessible-property-init-value
  input parameter property_ :: <GtkAccessibleProperty>;
  input parameter value_ :: <GValue>;
  c-name: "gtk_accessible_property_init_value";
end;

define inline-only C-function gtk-accessible-relation-init-value
  input parameter relation_ :: <GtkAccessibleRelation>;
  input parameter value_ :: <GValue>;
  c-name: "gtk_accessible_relation_init_value";
end;

define inline-only C-function gtk-accessible-state-init-value
  input parameter state_ :: <GtkAccessibleState>;
  input parameter value_ :: <GValue>;
  c-name: "gtk_accessible_state_init_value";
end;

define inline-only C-function gtk-builder-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gtk_builder_error_quark";
end;

define inline-only C-function gtk-check-version
  input parameter required_major_ :: <C-unsigned-int>;
  input parameter required_minor_ :: <C-unsigned-int>;
  input parameter required_micro_ :: <C-unsigned-int>;
  result res :: <C-string>;
  c-name: "gtk_check_version";
end;

define inline-only C-function gtk-constraint-vfl-parser-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gtk_constraint_vfl_parser_error_quark";
end;

define inline-only C-function gtk-css-parser-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gtk_css_parser_error_quark";
end;

define inline-only C-function gtk-css-parser-warning-quark
  result res :: <C-unsigned-int>;
  c-name: "gtk_css_parser_warning_quark";
end;

define inline-only C-function gtk-disable-setlocale
  c-name: "gtk_disable_setlocale";
end;

define inline-only C-function gtk-distribute-natural-allocation
  input parameter extra_space_ :: <C-signed-int>;
  input parameter n_requested_sizes_ :: <C-unsigned-int>;
  input parameter sizes_ :: <C-unsigned-char*> /* Not supported */;
  result res :: <C-signed-int>;
  c-name: "gtk_distribute_natural_allocation";
end;

define inline-only C-function gtk-enumerate-printers
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter destroy_ :: <C-function-pointer>;
  input parameter wait_ :: <C-boolean>;
  c-name: "gtk_enumerate_printers";
end;

define inline-only C-function gtk-file-chooser-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gtk_file_chooser_error_quark";
end;

define inline-only C-function gtk-get-binary-age
  result res :: <C-unsigned-int>;
  c-name: "gtk_get_binary_age";
end;

define inline-only C-function gtk-get-debug-flags
  result res :: <GtkDebugFlags>;
  c-name: "gtk_get_debug_flags";
end;

define inline-only C-function gtk-get-default-language
  result res :: <PangoLanguage>;
  c-name: "gtk_get_default_language";
end;

define inline-only C-function gtk-get-interface-age
  result res :: <C-unsigned-int>;
  c-name: "gtk_get_interface_age";
end;

define inline-only C-function gtk-get-locale-direction
  result res :: <GtkTextDirection>;
  c-name: "gtk_get_locale_direction";
end;

define inline-only C-function gtk-get-major-version
  result res :: <C-unsigned-int>;
  c-name: "gtk_get_major_version";
end;

define inline-only C-function gtk-get-micro-version
  result res :: <C-unsigned-int>;
  c-name: "gtk_get_micro_version";
end;

define inline-only C-function gtk-get-minor-version
  result res :: <C-unsigned-int>;
  c-name: "gtk_get_minor_version";
end;

define inline-only C-function gtk-hsv-to-rgb
  input parameter h_ :: <C-float>;
  input parameter s_ :: <C-float>;
  input parameter v_ :: <C-float>;
  output parameter r_ :: <C-float*>;
  output parameter g_ :: <C-float*>;
  output parameter b_ :: <C-float*>;
  c-name: "gtk_hsv_to_rgb";
end;

define inline-only C-function gtk-icon-theme-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gtk_icon_theme_error_quark";
end;

define inline-only C-function gtk-init
  c-name: "gtk_init";
end;

define inline-only C-function gtk-init-check
  result res :: <C-boolean>;
  c-name: "gtk_init_check";
end;

define inline-only C-function gtk-is-initialized
  result res :: <C-boolean>;
  c-name: "gtk_is_initialized";
end;

define inline-only C-function gtk-ordering-from-cmpfunc
  input parameter cmpfunc_result_ :: <C-signed-int>;
  result res :: <GtkOrdering>;
  c-name: "gtk_ordering_from_cmpfunc";
end;

define inline-only C-function gtk-param-spec-expression
  input parameter name_ :: <C-string>;
  input parameter nick_ :: <C-string>;
  input parameter blurb_ :: <C-string>;
  input parameter flags_ :: <GParamFlags>;
  result res :: <GParamSpec>;
  c-name: "gtk_param_spec_expression";
end;

define inline-only C-function gtk-print-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gtk_print_error_quark";
end;

define inline-only C-function gtk-print-run-page-setup-dialog
  input parameter parent_ :: <GtkWindow>;
  input parameter page_setup_ :: <GtkPageSetup>;
  input parameter settings_ :: <GtkPrintSettings>;
  result res :: <GtkPageSetup>;
  c-name: "gtk_print_run_page_setup_dialog";
end;

define inline-only C-function gtk-print-run-page-setup-dialog-async
  input parameter parent_ :: <GtkWindow>;
  input parameter page_setup_ :: <GtkPageSetup>;
  input parameter settings_ :: <GtkPrintSettings>;
  input parameter done_cb_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  c-name: "gtk_print_run_page_setup_dialog_async";
end;

define inline-only C-function gtk-recent-manager-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gtk_recent_manager_error_quark";
end;

define inline-only C-function gtk-render-activity
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_render_activity";
end;

define inline-only C-function gtk-render-arrow
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter angle_ :: <C-double>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter size_ :: <C-double>;
  c-name: "gtk_render_arrow";
end;

define inline-only C-function gtk-render-background
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_render_background";
end;

define inline-only C-function gtk-render-check
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_render_check";
end;

define inline-only C-function gtk-render-expander
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_render_expander";
end;

define inline-only C-function gtk-render-focus
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_render_focus";
end;

define inline-only C-function gtk-render-frame
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_render_frame";
end;

define inline-only C-function gtk-render-handle
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_render_handle";
end;

define inline-only C-function gtk-render-icon
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter texture_ :: <GdkTexture>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  c-name: "gtk_render_icon";
end;

define inline-only C-function gtk-render-layout
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter layout_ :: <PangoLayout>;
  c-name: "gtk_render_layout";
end;

define inline-only C-function gtk-render-line
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x0_ :: <C-double>;
  input parameter y0_ :: <C-double>;
  input parameter x1_ :: <C-double>;
  input parameter y1_ :: <C-double>;
  c-name: "gtk_render_line";
end;

define inline-only C-function gtk-render-option
  input parameter context_ :: <GtkStyleContext>;
  input parameter cr_ :: <cairoContext>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gtk_render_option";
end;

define inline-only C-function gtk-rgb-to-hsv
  input parameter r_ :: <C-float>;
  input parameter g_ :: <C-float>;
  input parameter b_ :: <C-float>;
  output parameter h_ :: <C-float*>;
  output parameter s_ :: <C-float*>;
  output parameter v_ :: <C-float*>;
  c-name: "gtk_rgb_to_hsv";
end;

define inline-only C-function gtk-set-debug-flags
  input parameter flags_ :: <GtkDebugFlags>;
  c-name: "gtk_set_debug_flags";
end;

define inline-only C-function gtk-show-uri
  input parameter parent_ :: <GtkWindow>;
  input parameter uri_ :: <C-string>;
  input parameter timestamp_ :: <C-unsigned-int>;
  c-name: "gtk_show_uri";
end;

define inline-only C-function gtk-show-uri-full
  input parameter parent_ :: <GtkWindow>;
  input parameter uri_ :: <C-string>;
  input parameter timestamp_ :: <C-unsigned-int>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gtk_show_uri_full";
end;

define inline-only C-function gtk-show-uri-full-finish
  input parameter parent_ :: <GtkWindow>;
  input parameter result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gtk_show_uri_full_finish";
end;

define inline-only C-function gtk-test-accessible-assertion-message-role
  input parameter domain_ :: <C-string>;
  input parameter file_ :: <C-string>;
  input parameter line_ :: <C-signed-int>;
  input parameter func_ :: <C-string>;
  input parameter expr_ :: <C-string>;
  input parameter accessible_ :: <GtkAccessible>;
  input parameter expected_role_ :: <GtkAccessibleRole>;
  input parameter actual_role_ :: <GtkAccessibleRole>;
  c-name: "gtk_test_accessible_assertion_message_role";
end;

define inline-only C-function gtk-test-accessible-has-property
  input parameter accessible_ :: <GtkAccessible>;
  input parameter property_ :: <GtkAccessibleProperty>;
  result res :: <C-boolean>;
  c-name: "gtk_test_accessible_has_property";
end;

define inline-only C-function gtk-test-accessible-has-relation
  input parameter accessible_ :: <GtkAccessible>;
  input parameter relation_ :: <GtkAccessibleRelation>;
  result res :: <C-boolean>;
  c-name: "gtk_test_accessible_has_relation";
end;

define inline-only C-function gtk-test-accessible-has-role
  input parameter accessible_ :: <GtkAccessible>;
  input parameter role_ :: <GtkAccessibleRole>;
  result res :: <C-boolean>;
  c-name: "gtk_test_accessible_has_role";
end;

define inline-only C-function gtk-test-accessible-has-state
  input parameter accessible_ :: <GtkAccessible>;
  input parameter state_ :: <GtkAccessibleState>;
  result res :: <C-boolean>;
  c-name: "gtk_test_accessible_has_state";
end;

define inline-only C-function gtk-test-list-all-types
  output parameter n_types_ :: <C-unsigned-int*>;
  result res :: <C-long*>;
  c-name: "gtk_test_list_all_types";
end;

define inline-only C-function gtk-test-register-all-types
  c-name: "gtk_test_register_all_types";
end;

define inline-only C-function gtk-test-widget-wait-for-draw
  input parameter widget_ :: <GtkWidget>;
  c-name: "gtk_test_widget_wait_for_draw";
end;

define inline-only C-function gtk-tree-create-row-drag-content
  input parameter tree_model_ :: <GtkTreeModel>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <GdkContentProvider>;
  c-name: "gtk_tree_create_row_drag_content";
end;

define inline-only C-function gtk-tree-get-row-drag-data
  input parameter value_ :: <GValue>;
  output parameter tree_model_ :: <GtkTreeModel*>;
  input parameter path_ :: <GtkTreePath>;
  result res :: <C-boolean>;
  c-name: "gtk_tree_get_row_drag_data";
end;

define inline-only C-function gtk-value-dup-expression
  input parameter value_ :: <GValue>;
  result res :: <GtkExpression>;
  c-name: "gtk_value_dup_expression";
end;

define inline-only C-function gtk-value-get-expression
  input parameter value_ :: <GValue>;
  result res :: <GtkExpression>;
  c-name: "gtk_value_get_expression";
end;

define inline-only C-function gtk-value-set-expression
  input parameter value_ :: <GValue>;
  input parameter expression_ :: <GtkExpression>;
  c-name: "gtk_value_set_expression";
end;

define inline-only C-function gtk-value-take-expression
  input parameter value_ :: <GValue>;
  input parameter expression_ :: <GtkExpression>;
  c-name: "gtk_value_take_expression";
end;

