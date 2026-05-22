module: gdk
synopsis: generated bindings for the Gdk library
copyright: See LICENSE file in this distribution.


define C-pointer-type <C-void**> => <C-void*>;
ignore(<C-void**>);

define C-pointer-type <GError*> => <GError>;
ignore(<GError*>);

define inline-only constant $action-all = 7;

define inline-only constant $gdk-anchor-flip-x = 1;
define inline-only constant $gdk-anchor-flip-y = 2;
define inline-only constant $gdk-anchor-slide-x = 4;
define inline-only constant $gdk-anchor-slide-y = 8;
define inline-only constant $gdk-anchor-resize-x = 16;
define inline-only constant $gdk-anchor-resize-y = 32;
define inline-only constant $gdk-anchor-flip = 3;
define inline-only constant $gdk-anchor-slide = 12;
define inline-only constant $gdk-anchor-resize = 48;
define constant <GdkAnchorHints> = <C-int>;
define C-pointer-type <GdkAnchorHints*> => <GdkAnchorHints>;

define open C-subtype <GdkAppLaunchContext> (<GAppLaunchContext>)
end C-subtype;

define C-pointer-type <GdkAppLaunchContext*> => <GdkAppLaunchContext>;

define sealed domain make (singleton(<GdkAppLaunchContext*>));
define sealed domain initialize (<GdkAppLaunchContext*>);

define inline-only C-function gdk-app-launch-context-get-display
  input parameter self :: <GdkAppLaunchContext>;
  result res :: <GdkDisplay>;
  c-name: "gdk_app_launch_context_get_display";
end;

define inline-only C-function gdk-app-launch-context-set-desktop
  input parameter self :: <GdkAppLaunchContext>;
  input parameter desktop_ :: <C-signed-int>;
  c-name: "gdk_app_launch_context_set_desktop";
end;

define inline-only C-function gdk-app-launch-context-set-icon
  input parameter self :: <GdkAppLaunchContext>;
  input parameter icon_ :: <GIcon>;
  c-name: "gdk_app_launch_context_set_icon";
end;

define inline-only C-function gdk-app-launch-context-set-icon-name
  input parameter self :: <GdkAppLaunchContext>;
  input parameter icon_name_ :: <C-string>;
  c-name: "gdk_app_launch_context_set_icon_name";
end;

define inline-only C-function gdk-app-launch-context-set-timestamp
  input parameter self :: <GdkAppLaunchContext>;
  input parameter timestamp_ :: <C-unsigned-int>;
  c-name: "gdk_app_launch_context_set_timestamp";
end;

define inline-only constant $gdk-axis-flag-x = 2;
define inline-only constant $gdk-axis-flag-y = 4;
define inline-only constant $gdk-axis-flag-delta-x = 8;
define inline-only constant $gdk-axis-flag-delta-y = 16;
define inline-only constant $gdk-axis-flag-pressure = 32;
define inline-only constant $gdk-axis-flag-xtilt = 64;
define inline-only constant $gdk-axis-flag-ytilt = 128;
define inline-only constant $gdk-axis-flag-wheel = 256;
define inline-only constant $gdk-axis-flag-distance = 512;
define inline-only constant $gdk-axis-flag-rotation = 1024;
define inline-only constant $gdk-axis-flag-slider = 2048;
define constant <GdkAxisFlags> = <C-int>;
define C-pointer-type <GdkAxisFlags*> => <GdkAxisFlags>;

define inline-only constant $gdk-axis-ignore = 0;
define inline-only constant $gdk-axis-x = 1;
define inline-only constant $gdk-axis-y = 2;
define inline-only constant $gdk-axis-delta-x = 3;
define inline-only constant $gdk-axis-delta-y = 4;
define inline-only constant $gdk-axis-pressure = 5;
define inline-only constant $gdk-axis-xtilt = 6;
define inline-only constant $gdk-axis-ytilt = 7;
define inline-only constant $gdk-axis-wheel = 8;
define inline-only constant $gdk-axis-distance = 9;
define inline-only constant $gdk-axis-rotation = 10;
define inline-only constant $gdk-axis-slider = 11;
define inline-only constant $gdk-axis-last = 12;
define constant <GdkAxisUse> = <C-int>;
define C-pointer-type <GdkAxisUse*> => <GdkAxisUse>;

define inline-only constant $button-middle = 2;

define inline-only constant $button-primary = 1;

define inline-only constant $button-secondary = 3;

define open C-subtype <GdkButtonEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkButtonEvent*> => <GdkButtonEvent>;

define sealed domain make (singleton(<GdkButtonEvent*>));
define sealed domain initialize (<GdkButtonEvent*>);

define inline-only C-function gdk-button-event-get-button
  input parameter self :: <GdkButtonEvent>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_button_event_get_button";
end;

define inline-only constant $current-time = 0;

define open C-subtype <GdkCairoContext> (<GdkDrawContext>)
end C-subtype;

define C-pointer-type <GdkCairoContext*> => <GdkCairoContext>;

define sealed domain make (singleton(<GdkCairoContext*>));
define sealed domain initialize (<GdkCairoContext*>);

define inline-only C-function gdk-cairo-context-cairo-create
  input parameter self :: <GdkCairoContext>;
  result res :: <cairoContext>;
  c-name: "gdk_cairo_context_cairo_create";
end;

define open C-subtype <GdkClipboard> (<GObject>)
end C-subtype;

define C-pointer-type <GdkClipboard*> => <GdkClipboard>;

define sealed domain make (singleton(<GdkClipboard*>));
define sealed domain initialize (<GdkClipboard*>);

define inline-only C-function gdk-clipboard-get-content
  input parameter self :: <GdkClipboard>;
  result res :: <GdkContentProvider>;
  c-name: "gdk_clipboard_get_content";
end;

define inline-only C-function gdk-clipboard-get-display
  input parameter self :: <GdkClipboard>;
  result res :: <GdkDisplay>;
  c-name: "gdk_clipboard_get_display";
end;

define inline-only C-function gdk-clipboard-get-formats
  input parameter self :: <GdkClipboard>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_clipboard_get_formats";
end;

define inline-only C-function gdk-clipboard-is-local
  input parameter self :: <GdkClipboard>;
  result res :: <C-boolean>;
  c-name: "gdk_clipboard_is_local";
end;

define inline-only C-function gdk-clipboard-read-async
  input parameter self :: <GdkClipboard>;
  input parameter mime_types_ :: <C-string*>;
  input parameter io_priority_ :: <C-signed-int>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_clipboard_read_async";
end;

define inline-only C-function gdk-clipboard-read-finish
  input parameter self :: <GdkClipboard>;
  input parameter result_ :: <GAsyncResult>;
  output parameter out_mime_type_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GInputStream>;
  c-name: "gdk_clipboard_read_finish";
end;

define inline-only C-function gdk-clipboard-read-text-async
  input parameter self :: <GdkClipboard>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_clipboard_read_text_async";
end;

define inline-only C-function gdk-clipboard-read-text-finish
  input parameter self :: <GdkClipboard>;
  input parameter result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <C-string>;
  c-name: "gdk_clipboard_read_text_finish";
end;

define inline-only C-function gdk-clipboard-read-texture-async
  input parameter self :: <GdkClipboard>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_clipboard_read_texture_async";
end;

define inline-only C-function gdk-clipboard-read-texture-finish
  input parameter self :: <GdkClipboard>;
  input parameter result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <GdkTexture>;
  c-name: "gdk_clipboard_read_texture_finish";
end;

define inline-only C-function gdk-clipboard-read-value-async
  input parameter self :: <GdkClipboard>;
  input parameter type_ :: <C-long>;
  input parameter io_priority_ :: <C-signed-int>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_clipboard_read_value_async";
end;

define inline-only C-function gdk-clipboard-read-value-finish
  input parameter self :: <GdkClipboard>;
  input parameter result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <GValue>;
  c-name: "gdk_clipboard_read_value_finish";
end;

define inline-only C-function gdk-clipboard-set-content
  input parameter self :: <GdkClipboard>;
  input parameter provider_ :: <GdkContentProvider>;
  result res :: <C-boolean>;
  c-name: "gdk_clipboard_set_content";
end;

define inline-only C-function gdk-clipboard-set-value
  input parameter self :: <GdkClipboard>;
  input parameter value_ :: <GValue>;
  c-name: "gdk_clipboard_set_value";
end;

define inline-only C-function gdk-clipboard-store-async
  input parameter self :: <GdkClipboard>;
  input parameter io_priority_ :: <C-signed-int>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_clipboard_store_async";
end;

define inline-only C-function gdk-clipboard-store-finish
  input parameter self :: <GdkClipboard>;
  input parameter result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_clipboard_store_finish";
end;

define open C-subtype <GdkContentDeserializer> (<GObject>, <GAsyncResult>)
end C-subtype;

define C-pointer-type <GdkContentDeserializer*> => <GdkContentDeserializer>;

define sealed domain make (singleton(<GdkContentDeserializer*>));
define sealed domain initialize (<GdkContentDeserializer*>);

define inline-only C-function gdk-content-deserializer-get-cancellable
  input parameter self :: <GdkContentDeserializer>;
  result res :: <GCancellable>;
  c-name: "gdk_content_deserializer_get_cancellable";
end;

define inline-only C-function gdk-content-deserializer-get-gtype
  input parameter self :: <GdkContentDeserializer>;
  result res :: <C-long>;
  c-name: "gdk_content_deserializer_get_gtype";
end;

define inline-only C-function gdk-content-deserializer-get-input-stream
  input parameter self :: <GdkContentDeserializer>;
  result res :: <GInputStream>;
  c-name: "gdk_content_deserializer_get_input_stream";
end;

define inline-only C-function gdk-content-deserializer-get-mime-type
  input parameter self :: <GdkContentDeserializer>;
  result res :: <C-string>;
  c-name: "gdk_content_deserializer_get_mime_type";
end;

define inline-only C-function gdk-content-deserializer-get-priority
  input parameter self :: <GdkContentDeserializer>;
  result res :: <C-signed-int>;
  c-name: "gdk_content_deserializer_get_priority";
end;

define inline-only C-function gdk-content-deserializer-get-task-data
  input parameter self :: <GdkContentDeserializer>;
  result res :: <C-void*>;
  c-name: "gdk_content_deserializer_get_task_data";
end;

define inline-only C-function gdk-content-deserializer-get-user-data
  input parameter self :: <GdkContentDeserializer>;
  result res :: <C-void*>;
  c-name: "gdk_content_deserializer_get_user_data";
end;

define inline-only C-function gdk-content-deserializer-get-value
  input parameter self :: <GdkContentDeserializer>;
  result res :: <GValue>;
  c-name: "gdk_content_deserializer_get_value";
end;

define inline-only C-function gdk-content-deserializer-return-error
  input parameter self :: <GdkContentDeserializer>;
  input parameter error_ :: <GError>;
  c-name: "gdk_content_deserializer_return_error";
end;

define inline-only C-function gdk-content-deserializer-return-success
  input parameter self :: <GdkContentDeserializer>;
  c-name: "gdk_content_deserializer_return_success";
end;

define inline-only C-function gdk-content-deserializer-set-task-data
  input parameter self :: <GdkContentDeserializer>;
  input parameter data_ :: <C-void*>;
  input parameter notify_ :: <C-function-pointer>;
  c-name: "gdk_content_deserializer_set_task_data";
end;

define C-struct <_GdkContentFormats>
  pointer-type-name: <GdkContentFormats>;
end C-struct;

define sealed domain make (singleton(<GdkContentFormats>));
define sealed domain initialize (<GdkContentFormats>);

define inline-only C-function gdk-content-formats-new
  input parameter mime_types_ :: <C-string*>;
  input parameter n_mime_types_ :: <C-unsigned-int>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_new";
end;

define inline-only C-function gdk-content-formats-new-for-gtype
  input parameter type_ :: <C-long>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_new_for_gtype";
end;

define inline-only C-function gdk-content-formats-contain-gtype
  input parameter self :: <GdkContentFormats>;
  input parameter type_ :: <C-long>;
  result res :: <C-boolean>;
  c-name: "gdk_content_formats_contain_gtype";
end;

define inline-only C-function gdk-content-formats-contain-mime-type
  input parameter self :: <GdkContentFormats>;
  input parameter mime_type_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gdk_content_formats_contain_mime_type";
end;

define inline-only C-function gdk-content-formats-get-gtypes
  input parameter self :: <GdkContentFormats>;
  output parameter n_gtypes_ :: <C-unsigned-long*>;
  result res :: <C-long*>;
  c-name: "gdk_content_formats_get_gtypes";
end;

define inline-only C-function gdk-content-formats-get-mime-types
  input parameter self :: <GdkContentFormats>;
  output parameter n_mime_types_ :: <C-unsigned-long*>;
  result res :: <C-string*>;
  c-name: "gdk_content_formats_get_mime_types";
end;

define inline-only C-function gdk-content-formats-match
  input parameter self :: <GdkContentFormats>;
  input parameter second_ :: <GdkContentFormats>;
  result res :: <C-boolean>;
  c-name: "gdk_content_formats_match";
end;

define inline-only C-function gdk-content-formats-match-gtype
  input parameter self :: <GdkContentFormats>;
  input parameter second_ :: <GdkContentFormats>;
  result res :: <C-long>;
  c-name: "gdk_content_formats_match_gtype";
end;

define inline-only C-function gdk-content-formats-match-mime-type
  input parameter self :: <GdkContentFormats>;
  input parameter second_ :: <GdkContentFormats>;
  result res :: <C-string>;
  c-name: "gdk_content_formats_match_mime_type";
end;

define inline-only C-function gdk-content-formats-print
  input parameter self :: <GdkContentFormats>;
  input parameter string_ :: <GString>;
  c-name: "gdk_content_formats_print";
end;

define inline-only C-function gdk-content-formats-ref
  input parameter self :: <GdkContentFormats>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_ref";
end;

define inline-only C-function gdk-content-formats-to-string
  input parameter self :: <GdkContentFormats>;
  result res :: <C-string>;
  c-name: "gdk_content_formats_to_string";
end;

define inline-only C-function gdk-content-formats-union
  input parameter self :: <GdkContentFormats>;
  input parameter second_ :: <GdkContentFormats>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_union";
end;

define inline-only C-function gdk-content-formats-union-deserialize-gtypes
  input parameter self :: <GdkContentFormats>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_union_deserialize_gtypes";
end;

define inline-only C-function gdk-content-formats-union-deserialize-mime-types
  input parameter self :: <GdkContentFormats>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_union_deserialize_mime_types";
end;

define inline-only C-function gdk-content-formats-union-serialize-gtypes
  input parameter self :: <GdkContentFormats>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_union_serialize_gtypes";
end;

define inline-only C-function gdk-content-formats-union-serialize-mime-types
  input parameter self :: <GdkContentFormats>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_union_serialize_mime_types";
end;

define inline-only C-function gdk-content-formats-unref
  input parameter self :: <GdkContentFormats>;
  c-name: "gdk_content_formats_unref";
end;

define inline-only C-function gdk-content-formats-parse
  input parameter string_ :: <C-string>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_parse";
end;

define C-struct <_GdkContentFormatsBuilder>
  pointer-type-name: <GdkContentFormatsBuilder>;
end C-struct;

define sealed domain make (singleton(<GdkContentFormatsBuilder>));
define sealed domain initialize (<GdkContentFormatsBuilder>);

define inline-only C-function gdk-content-formats-builder-new
  result res :: <GdkContentFormatsBuilder>;
  c-name: "gdk_content_formats_builder_new";
end;

define inline-only C-function gdk-content-formats-builder-add-formats
  input parameter self :: <GdkContentFormatsBuilder>;
  input parameter formats_ :: <GdkContentFormats>;
  c-name: "gdk_content_formats_builder_add_formats";
end;

define inline-only C-function gdk-content-formats-builder-add-gtype
  input parameter self :: <GdkContentFormatsBuilder>;
  input parameter type_ :: <C-long>;
  c-name: "gdk_content_formats_builder_add_gtype";
end;

define inline-only C-function gdk-content-formats-builder-add-mime-type
  input parameter self :: <GdkContentFormatsBuilder>;
  input parameter mime_type_ :: <C-string>;
  c-name: "gdk_content_formats_builder_add_mime_type";
end;

define inline-only C-function gdk-content-formats-builder-ref
  input parameter self :: <GdkContentFormatsBuilder>;
  result res :: <GdkContentFormatsBuilder>;
  c-name: "gdk_content_formats_builder_ref";
end;

define inline-only C-function gdk-content-formats-builder-to-formats
  input parameter self :: <GdkContentFormatsBuilder>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_formats_builder_to_formats";
end;

define inline-only C-function gdk-content-formats-builder-unref
  input parameter self :: <GdkContentFormatsBuilder>;
  c-name: "gdk_content_formats_builder_unref";
end;

define open C-subtype <GdkContentProvider> (<GObject>)
  // parent
end C-subtype;

define C-pointer-type <GdkContentProvider*> => <GdkContentProvider>;

define sealed domain make (singleton(<GdkContentProvider*>));
define sealed domain initialize (<GdkContentProvider*>);

define inline-only C-function gdk-content-provider-new-for-bytes
  input parameter mime_type_ :: <C-string>;
  input parameter bytes_ :: <GBytes>;
  result res :: <GdkContentProvider>;
  c-name: "gdk_content_provider_new_for_bytes";
end;

define inline-only C-function gdk-content-provider-new-for-value
  input parameter value_ :: <GValue>;
  result res :: <GdkContentProvider>;
  c-name: "gdk_content_provider_new_for_value";
end;

define inline-only C-function gdk-content-provider-new-union
  input parameter providers_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_providers_ :: <C-unsigned-long>;
  result res :: <GdkContentProvider>;
  c-name: "gdk_content_provider_new_union";
end;

define inline-only C-function gdk-content-provider-content-changed
  input parameter self :: <GdkContentProvider>;
  c-name: "gdk_content_provider_content_changed";
end;

define inline-only C-function gdk-content-provider-get-value
  input parameter self :: <GdkContentProvider>;
  input parameter value_ :: <GValue>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_content_provider_get_value";
end;

define inline-only C-function gdk-content-provider-ref-formats
  input parameter self :: <GdkContentProvider>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_provider_ref_formats";
end;

define inline-only C-function gdk-content-provider-ref-storable-formats
  input parameter self :: <GdkContentProvider>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_content_provider_ref_storable_formats";
end;

define inline-only C-function gdk-content-provider-write-mime-type-async
  input parameter self :: <GdkContentProvider>;
  input parameter mime_type_ :: <C-string>;
  input parameter stream_ :: <GOutputStream>;
  input parameter io_priority_ :: <C-signed-int>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_content_provider_write_mime_type_async";
end;

define inline-only C-function gdk-content-provider-write-mime-type-finish
  input parameter self :: <GdkContentProvider>;
  input parameter result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_content_provider_write_mime_type_finish";
end;

define C-struct <_GdkContentProviderClass>
  constant sealed inline-only slot gdk-content-provider-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gdk-content-provider-class-content-changed :: <C-function-pointer>;
  constant sealed inline-only slot gdk-content-provider-class-attach-clipboard :: <C-function-pointer>;
  constant sealed inline-only slot gdk-content-provider-class-detach-clipboard :: <C-function-pointer>;
  constant sealed inline-only slot gdk-content-provider-class-ref-formats :: <C-function-pointer>;
  constant sealed inline-only slot gdk-content-provider-class-ref-storable-formats :: <C-function-pointer>;
  constant sealed inline-only slot gdk-content-provider-class-write-mime-type-async :: <C-function-pointer>;
  constant sealed inline-only slot gdk-content-provider-class-write-mime-type-finish :: <C-function-pointer>;
  constant sealed inline-only slot gdk-content-provider-class-get-value :: <C-function-pointer>;
  constant sealed inline-only slot gdk-content-provider-class-padding :: <C-void*>;
  pointer-type-name: <GdkContentProviderClass>;
end C-struct;

define sealed domain make (singleton(<GdkContentProviderClass>));
define sealed domain initialize (<GdkContentProviderClass>);

define open C-subtype <GdkContentSerializer> (<GObject>, <GAsyncResult>)
end C-subtype;

define C-pointer-type <GdkContentSerializer*> => <GdkContentSerializer>;

define sealed domain make (singleton(<GdkContentSerializer*>));
define sealed domain initialize (<GdkContentSerializer*>);

define inline-only C-function gdk-content-serializer-get-cancellable
  input parameter self :: <GdkContentSerializer>;
  result res :: <GCancellable>;
  c-name: "gdk_content_serializer_get_cancellable";
end;

define inline-only C-function gdk-content-serializer-get-gtype
  input parameter self :: <GdkContentSerializer>;
  result res :: <C-long>;
  c-name: "gdk_content_serializer_get_gtype";
end;

define inline-only C-function gdk-content-serializer-get-mime-type
  input parameter self :: <GdkContentSerializer>;
  result res :: <C-string>;
  c-name: "gdk_content_serializer_get_mime_type";
end;

define inline-only C-function gdk-content-serializer-get-output-stream
  input parameter self :: <GdkContentSerializer>;
  result res :: <GOutputStream>;
  c-name: "gdk_content_serializer_get_output_stream";
end;

define inline-only C-function gdk-content-serializer-get-priority
  input parameter self :: <GdkContentSerializer>;
  result res :: <C-signed-int>;
  c-name: "gdk_content_serializer_get_priority";
end;

define inline-only C-function gdk-content-serializer-get-task-data
  input parameter self :: <GdkContentSerializer>;
  result res :: <C-void*>;
  c-name: "gdk_content_serializer_get_task_data";
end;

define inline-only C-function gdk-content-serializer-get-user-data
  input parameter self :: <GdkContentSerializer>;
  result res :: <C-void*>;
  c-name: "gdk_content_serializer_get_user_data";
end;

define inline-only C-function gdk-content-serializer-get-value
  input parameter self :: <GdkContentSerializer>;
  result res :: <GValue>;
  c-name: "gdk_content_serializer_get_value";
end;

define inline-only C-function gdk-content-serializer-return-error
  input parameter self :: <GdkContentSerializer>;
  input parameter error_ :: <GError>;
  c-name: "gdk_content_serializer_return_error";
end;

define inline-only C-function gdk-content-serializer-return-success
  input parameter self :: <GdkContentSerializer>;
  c-name: "gdk_content_serializer_return_success";
end;

define inline-only C-function gdk-content-serializer-set-task-data
  input parameter self :: <GdkContentSerializer>;
  input parameter data_ :: <C-void*>;
  input parameter notify_ :: <C-function-pointer>;
  c-name: "gdk_content_serializer_set_task_data";
end;

define open C-subtype <GdkCrossingEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkCrossingEvent*> => <GdkCrossingEvent>;

define sealed domain make (singleton(<GdkCrossingEvent*>));
define sealed domain initialize (<GdkCrossingEvent*>);

define inline-only C-function gdk-crossing-event-get-detail
  input parameter self :: <GdkCrossingEvent>;
  result res :: <GdkNotifyType>;
  c-name: "gdk_crossing_event_get_detail";
end;

define inline-only C-function gdk-crossing-event-get-focus
  input parameter self :: <GdkCrossingEvent>;
  result res :: <C-boolean>;
  c-name: "gdk_crossing_event_get_focus";
end;

define inline-only C-function gdk-crossing-event-get-mode
  input parameter self :: <GdkCrossingEvent>;
  result res :: <GdkCrossingMode>;
  c-name: "gdk_crossing_event_get_mode";
end;

define inline-only constant $gdk-crossing-normal = 0;
define inline-only constant $gdk-crossing-grab = 1;
define inline-only constant $gdk-crossing-ungrab = 2;
define inline-only constant $gdk-crossing-gtk-grab = 3;
define inline-only constant $gdk-crossing-gtk-ungrab = 4;
define inline-only constant $gdk-crossing-state-changed = 5;
define inline-only constant $gdk-crossing-touch-begin = 6;
define inline-only constant $gdk-crossing-touch-end = 7;
define inline-only constant $gdk-crossing-device-switch = 8;
define constant <GdkCrossingMode> = <C-int>;
define C-pointer-type <GdkCrossingMode*> => <GdkCrossingMode>;

define open C-subtype <GdkCursor> (<GObject>)
end C-subtype;

define C-pointer-type <GdkCursor*> => <GdkCursor>;

define sealed domain make (singleton(<GdkCursor*>));
define sealed domain initialize (<GdkCursor*>);

define inline-only C-function gdk-cursor-new-from-name
  input parameter name_ :: <C-string>;
  input parameter fallback_ :: <GdkCursor>;
  result res :: <GdkCursor>;
  c-name: "gdk_cursor_new_from_name";
end;

define inline-only C-function gdk-cursor-new-from-texture
  input parameter texture_ :: <GdkTexture>;
  input parameter hotspot_x_ :: <C-signed-int>;
  input parameter hotspot_y_ :: <C-signed-int>;
  input parameter fallback_ :: <GdkCursor>;
  result res :: <GdkCursor>;
  c-name: "gdk_cursor_new_from_texture";
end;

define inline-only C-function gdk-cursor-get-fallback
  input parameter self :: <GdkCursor>;
  result res :: <GdkCursor>;
  c-name: "gdk_cursor_get_fallback";
end;

define inline-only C-function gdk-cursor-get-hotspot-x
  input parameter self :: <GdkCursor>;
  result res :: <C-signed-int>;
  c-name: "gdk_cursor_get_hotspot_x";
end;

define inline-only C-function gdk-cursor-get-hotspot-y
  input parameter self :: <GdkCursor>;
  result res :: <C-signed-int>;
  c-name: "gdk_cursor_get_hotspot_y";
end;

define inline-only C-function gdk-cursor-get-name
  input parameter self :: <GdkCursor>;
  result res :: <C-string>;
  c-name: "gdk_cursor_get_name";
end;

define inline-only C-function gdk-cursor-get-texture
  input parameter self :: <GdkCursor>;
  result res :: <GdkTexture>;
  c-name: "gdk_cursor_get_texture";
end;

define open C-subtype <GdkDNDEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkDNDEvent*> => <GdkDNDEvent>;

define sealed domain make (singleton(<GdkDNDEvent*>));
define sealed domain initialize (<GdkDNDEvent*>);

define inline-only C-function gdk-dnd-event-get-drop
  input parameter self :: <GdkDNDEvent>;
  result res :: <GdkDrop>;
  c-name: "gdk_dnd_event_get_drop";
end;

define open C-subtype <GdkDeleteEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkDeleteEvent*> => <GdkDeleteEvent>;

define sealed domain make (singleton(<GdkDeleteEvent*>));
define sealed domain initialize (<GdkDeleteEvent*>);

define open C-subtype <GdkDevice> (<GObject>)
end C-subtype;

define C-pointer-type <GdkDevice*> => <GdkDevice>;

define sealed domain make (singleton(<GdkDevice*>));
define sealed domain initialize (<GdkDevice*>);

define inline-only C-function gdk-device-get-caps-lock-state
  input parameter self :: <GdkDevice>;
  result res :: <C-boolean>;
  c-name: "gdk_device_get_caps_lock_state";
end;

define inline-only C-function gdk-device-get-device-tool
  input parameter self :: <GdkDevice>;
  result res :: <GdkDeviceTool>;
  c-name: "gdk_device_get_device_tool";
end;

define inline-only C-function gdk-device-get-direction
  input parameter self :: <GdkDevice>;
  result res :: <PangoDirection>;
  c-name: "gdk_device_get_direction";
end;

define inline-only C-function gdk-device-get-display
  input parameter self :: <GdkDevice>;
  result res :: <GdkDisplay>;
  c-name: "gdk_device_get_display";
end;

define inline-only C-function gdk-device-get-has-cursor
  input parameter self :: <GdkDevice>;
  result res :: <C-boolean>;
  c-name: "gdk_device_get_has_cursor";
end;

define inline-only C-function gdk-device-get-modifier-state
  input parameter self :: <GdkDevice>;
  result res :: <GdkModifierType>;
  c-name: "gdk_device_get_modifier_state";
end;

define inline-only C-function gdk-device-get-name
  input parameter self :: <GdkDevice>;
  result res :: <C-string>;
  c-name: "gdk_device_get_name";
end;

define inline-only C-function gdk-device-get-num-lock-state
  input parameter self :: <GdkDevice>;
  result res :: <C-boolean>;
  c-name: "gdk_device_get_num_lock_state";
end;

define inline-only C-function gdk-device-get-num-touches
  input parameter self :: <GdkDevice>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_device_get_num_touches";
end;

define inline-only C-function gdk-device-get-product-id
  input parameter self :: <GdkDevice>;
  result res :: <C-string>;
  c-name: "gdk_device_get_product_id";
end;

define inline-only C-function gdk-device-get-scroll-lock-state
  input parameter self :: <GdkDevice>;
  result res :: <C-boolean>;
  c-name: "gdk_device_get_scroll_lock_state";
end;

define inline-only C-function gdk-device-get-seat
  input parameter self :: <GdkDevice>;
  result res :: <GdkSeat>;
  c-name: "gdk_device_get_seat";
end;

define inline-only C-function gdk-device-get-source
  input parameter self :: <GdkDevice>;
  result res :: <GdkInputSource>;
  c-name: "gdk_device_get_source";
end;

define inline-only C-function gdk-device-get-surface-at-position
  input parameter self :: <GdkDevice>;
  output parameter win_x_ :: <C-double*>;
  output parameter win_y_ :: <C-double*>;
  result res :: <GdkSurface>;
  c-name: "gdk_device_get_surface_at_position";
end;

define inline-only C-function gdk-device-get-timestamp
  input parameter self :: <GdkDevice>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_device_get_timestamp";
end;

define inline-only C-function gdk-device-get-vendor-id
  input parameter self :: <GdkDevice>;
  result res :: <C-string>;
  c-name: "gdk_device_get_vendor_id";
end;

define inline-only C-function gdk-device-has-bidi-layouts
  input parameter self :: <GdkDevice>;
  result res :: <C-boolean>;
  c-name: "gdk_device_has_bidi_layouts";
end;

// Interface
define open C-subtype <GdkDevicePad> (<GdkDevice>)
end C-subtype;

define C-pointer-type <GdkDevicePad*> => <GdkDevicePad>;

define sealed domain make (singleton(<GdkDevicePad*>));
define sealed domain initialize (<GdkDevicePad*>);

define inline-only C-function gdk-device-pad-get-feature-group
  input parameter self :: <GdkDevicePad>;
  input parameter feature_ :: <GdkDevicePadFeature>;
  input parameter feature_idx_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gdk_device_pad_get_feature_group";
end;

define inline-only C-function gdk-device-pad-get-group-n-modes
  input parameter self :: <GdkDevicePad>;
  input parameter group_idx_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gdk_device_pad_get_group_n_modes";
end;

define inline-only C-function gdk-device-pad-get-n-features
  input parameter self :: <GdkDevicePad>;
  input parameter feature_ :: <GdkDevicePadFeature>;
  result res :: <C-signed-int>;
  c-name: "gdk_device_pad_get_n_features";
end;

define inline-only C-function gdk-device-pad-get-n-groups
  input parameter self :: <GdkDevicePad>;
  result res :: <C-signed-int>;
  c-name: "gdk_device_pad_get_n_groups";
end;

define inline-only constant $gdk-device-pad-feature-button = 0;
define inline-only constant $gdk-device-pad-feature-ring = 1;
define inline-only constant $gdk-device-pad-feature-strip = 2;
define constant <GdkDevicePadFeature> = <C-int>;
define C-pointer-type <GdkDevicePadFeature*> => <GdkDevicePadFeature>;

define C-struct <_GdkDevicePadInterface>
  pointer-type-name: <GdkDevicePadInterface>;
end C-struct;

define sealed domain make (singleton(<GdkDevicePadInterface>));
define sealed domain initialize (<GdkDevicePadInterface>);

define open C-subtype <GdkDeviceTool> (<GObject>)
end C-subtype;

define C-pointer-type <GdkDeviceTool*> => <GdkDeviceTool>;

define sealed domain make (singleton(<GdkDeviceTool*>));
define sealed domain initialize (<GdkDeviceTool*>);

define inline-only C-function gdk-device-tool-get-axes
  input parameter self :: <GdkDeviceTool>;
  result res :: <GdkAxisFlags>;
  c-name: "gdk_device_tool_get_axes";
end;

define inline-only C-function gdk-device-tool-get-hardware-id
  input parameter self :: <GdkDeviceTool>;
  result res :: <C-unsigned-long>;
  c-name: "gdk_device_tool_get_hardware_id";
end;

define inline-only C-function gdk-device-tool-get-serial
  input parameter self :: <GdkDeviceTool>;
  result res :: <C-unsigned-long>;
  c-name: "gdk_device_tool_get_serial";
end;

define inline-only C-function gdk-device-tool-get-tool-type
  input parameter self :: <GdkDeviceTool>;
  result res :: <GdkDeviceToolType>;
  c-name: "gdk_device_tool_get_tool_type";
end;

define inline-only constant $gdk-device-tool-type-unknown = 0;
define inline-only constant $gdk-device-tool-type-pen = 1;
define inline-only constant $gdk-device-tool-type-eraser = 2;
define inline-only constant $gdk-device-tool-type-brush = 3;
define inline-only constant $gdk-device-tool-type-pencil = 4;
define inline-only constant $gdk-device-tool-type-airbrush = 5;
define inline-only constant $gdk-device-tool-type-mouse = 6;
define inline-only constant $gdk-device-tool-type-lens = 7;
define constant <GdkDeviceToolType> = <C-int>;
define C-pointer-type <GdkDeviceToolType*> => <GdkDeviceToolType>;

define open C-subtype <GdkDisplay> (<GObject>)
end C-subtype;

define C-pointer-type <GdkDisplay*> => <GdkDisplay>;

define sealed domain make (singleton(<GdkDisplay*>));
define sealed domain initialize (<GdkDisplay*>);

define inline-only C-function gdk-display-get-default
  result res :: <GdkDisplay>;
  c-name: "gdk_display_get_default";
end;

define inline-only C-function gdk-display-open
  input parameter display_name_ :: <C-string>;
  result res :: <GdkDisplay>;
  c-name: "gdk_display_open";
end;

define inline-only C-function gdk-display-beep
  input parameter self :: <GdkDisplay>;
  c-name: "gdk_display_beep";
end;

define inline-only C-function gdk-display-close
  input parameter self :: <GdkDisplay>;
  c-name: "gdk_display_close";
end;

define inline-only C-function gdk-display-create-gl-context
  input parameter self :: <GdkDisplay>;
  output parameter error_ :: <GError*>;
  result res :: <GdkGLContext>;
  c-name: "gdk_display_create_gl_context";
end;

define inline-only C-function gdk-display-device-is-grabbed
  input parameter self :: <GdkDisplay>;
  input parameter device_ :: <GdkDevice>;
  result res :: <C-boolean>;
  c-name: "gdk_display_device_is_grabbed";
end;

define inline-only C-function gdk-display-flush
  input parameter self :: <GdkDisplay>;
  c-name: "gdk_display_flush";
end;

define inline-only C-function gdk-display-get-app-launch-context
  input parameter self :: <GdkDisplay>;
  result res :: <GdkAppLaunchContext>;
  c-name: "gdk_display_get_app_launch_context";
end;

define inline-only C-function gdk-display-get-clipboard
  input parameter self :: <GdkDisplay>;
  result res :: <GdkClipboard>;
  c-name: "gdk_display_get_clipboard";
end;

define inline-only C-function gdk-display-get-default-seat
  input parameter self :: <GdkDisplay>;
  result res :: <GdkSeat>;
  c-name: "gdk_display_get_default_seat";
end;

define inline-only C-function gdk-display-get-monitor-at-surface
  input parameter self :: <GdkDisplay>;
  input parameter surface_ :: <GdkSurface>;
  result res :: <GdkMonitor>;
  c-name: "gdk_display_get_monitor_at_surface";
end;

define inline-only C-function gdk-display-get-monitors
  input parameter self :: <GdkDisplay>;
  result res :: <GListModel>;
  c-name: "gdk_display_get_monitors";
end;

define inline-only C-function gdk-display-get-name
  input parameter self :: <GdkDisplay>;
  result res :: <C-string>;
  c-name: "gdk_display_get_name";
end;

define inline-only C-function gdk-display-get-primary-clipboard
  input parameter self :: <GdkDisplay>;
  result res :: <GdkClipboard>;
  c-name: "gdk_display_get_primary_clipboard";
end;

define inline-only C-function gdk-display-get-setting
  input parameter self :: <GdkDisplay>;
  input parameter name_ :: <C-string>;
  input parameter value_ :: <GValue>;
  result res :: <C-boolean>;
  c-name: "gdk_display_get_setting";
end;

define inline-only C-function gdk-display-get-startup-notification-id
  input parameter self :: <GdkDisplay>;
  result res :: <C-string>;
  c-name: "gdk_display_get_startup_notification_id";
end;

define inline-only C-function gdk-display-is-closed
  input parameter self :: <GdkDisplay>;
  result res :: <C-boolean>;
  c-name: "gdk_display_is_closed";
end;

define inline-only C-function gdk-display-is-composited
  input parameter self :: <GdkDisplay>;
  result res :: <C-boolean>;
  c-name: "gdk_display_is_composited";
end;

define inline-only C-function gdk-display-is-rgba
  input parameter self :: <GdkDisplay>;
  result res :: <C-boolean>;
  c-name: "gdk_display_is_rgba";
end;

define inline-only C-function gdk-display-list-seats
  input parameter self :: <GdkDisplay>;
  result res :: <GList>;
  c-name: "gdk_display_list_seats";
end;

define inline-only C-function gdk-display-map-keycode
  input parameter self :: <GdkDisplay>;
  input parameter keycode_ :: <C-unsigned-int>;
  output parameter keys_ :: <C-unsigned-char*> /* Not supported */;
  output parameter keyvals_ :: <C-unsigned-int*>;
  output parameter n_entries_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "gdk_display_map_keycode";
end;

define inline-only C-function gdk-display-map-keyval
  input parameter self :: <GdkDisplay>;
  input parameter keyval_ :: <C-unsigned-int>;
  output parameter keys_ :: <C-unsigned-char*> /* Not supported */;
  output parameter n_keys_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "gdk_display_map_keyval";
end;

define inline-only C-function gdk-display-notify-startup-complete
  input parameter self :: <GdkDisplay>;
  input parameter startup_id_ :: <C-string>;
  c-name: "gdk_display_notify_startup_complete";
end;

define inline-only C-function gdk-display-prepare-gl
  input parameter self :: <GdkDisplay>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_display_prepare_gl";
end;

define inline-only C-function gdk-display-put-event
  input parameter self :: <GdkDisplay>;
  input parameter event_ :: <GdkEvent>;
  c-name: "gdk_display_put_event";
end;

define inline-only C-function gdk-display-supports-input-shapes
  input parameter self :: <GdkDisplay>;
  result res :: <C-boolean>;
  c-name: "gdk_display_supports_input_shapes";
end;

define inline-only C-function gdk-display-sync
  input parameter self :: <GdkDisplay>;
  c-name: "gdk_display_sync";
end;

define inline-only C-function gdk-display-translate-key
  input parameter self :: <GdkDisplay>;
  input parameter keycode_ :: <C-unsigned-int>;
  input parameter state_ :: <GdkModifierType>;
  input parameter group_ :: <C-signed-int>;
  output parameter keyval_ :: <C-unsigned-int*>;
  output parameter effective_group_ :: <C-signed-int*>;
  output parameter level_ :: <C-signed-int*>;
  output parameter consumed_ :: <GdkModifierType*>;
  result res :: <C-boolean>;
  c-name: "gdk_display_translate_key";
end;

define open C-subtype <GdkDisplayManager> (<GObject>)
end C-subtype;

define C-pointer-type <GdkDisplayManager*> => <GdkDisplayManager>;

define sealed domain make (singleton(<GdkDisplayManager*>));
define sealed domain initialize (<GdkDisplayManager*>);

define inline-only C-function gdk-display-manager-get
  result res :: <GdkDisplayManager>;
  c-name: "gdk_display_manager_get";
end;

define inline-only C-function gdk-display-manager-get-default-display
  input parameter self :: <GdkDisplayManager>;
  result res :: <GdkDisplay>;
  c-name: "gdk_display_manager_get_default_display";
end;

define inline-only C-function gdk-display-manager-list-displays
  input parameter self :: <GdkDisplayManager>;
  result res :: <GSList>;
  c-name: "gdk_display_manager_list_displays";
end;

define inline-only C-function gdk-display-manager-open-display
  input parameter self :: <GdkDisplayManager>;
  input parameter name_ :: <C-string>;
  result res :: <GdkDisplay>;
  c-name: "gdk_display_manager_open_display";
end;

define inline-only C-function gdk-display-manager-set-default-display
  input parameter self :: <GdkDisplayManager>;
  input parameter display_ :: <GdkDisplay>;
  c-name: "gdk_display_manager_set_default_display";
end;

define open C-subtype <GdkDrag> (<GObject>)
end C-subtype;

define C-pointer-type <GdkDrag*> => <GdkDrag>;

define sealed domain make (singleton(<GdkDrag*>));
define sealed domain initialize (<GdkDrag*>);

define inline-only C-function gdk-drag-begin
  input parameter surface_ :: <GdkSurface>;
  input parameter device_ :: <GdkDevice>;
  input parameter content_ :: <GdkContentProvider>;
  input parameter actions_ :: <GdkDragAction>;
  input parameter dx_ :: <C-double>;
  input parameter dy_ :: <C-double>;
  result res :: <GdkDrag>;
  c-name: "gdk_drag_begin";
end;

define inline-only C-function gdk-drag-drop-done
  input parameter self :: <GdkDrag>;
  input parameter success_ :: <C-boolean>;
  c-name: "gdk_drag_drop_done";
end;

define inline-only C-function gdk-drag-get-actions
  input parameter self :: <GdkDrag>;
  result res :: <GdkDragAction>;
  c-name: "gdk_drag_get_actions";
end;

define inline-only C-function gdk-drag-get-content
  input parameter self :: <GdkDrag>;
  result res :: <GdkContentProvider>;
  c-name: "gdk_drag_get_content";
end;

define inline-only C-function gdk-drag-get-device
  input parameter self :: <GdkDrag>;
  result res :: <GdkDevice>;
  c-name: "gdk_drag_get_device";
end;

define inline-only C-function gdk-drag-get-display
  input parameter self :: <GdkDrag>;
  result res :: <GdkDisplay>;
  c-name: "gdk_drag_get_display";
end;

define inline-only C-function gdk-drag-get-drag-surface
  input parameter self :: <GdkDrag>;
  result res :: <GdkSurface>;
  c-name: "gdk_drag_get_drag_surface";
end;

define inline-only C-function gdk-drag-get-formats
  input parameter self :: <GdkDrag>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_drag_get_formats";
end;

define inline-only C-function gdk-drag-get-selected-action
  input parameter self :: <GdkDrag>;
  result res :: <GdkDragAction>;
  c-name: "gdk_drag_get_selected_action";
end;

define inline-only C-function gdk-drag-get-surface
  input parameter self :: <GdkDrag>;
  result res :: <GdkSurface>;
  c-name: "gdk_drag_get_surface";
end;

define inline-only C-function gdk-drag-set-hotspot
  input parameter self :: <GdkDrag>;
  input parameter hot_x_ :: <C-signed-int>;
  input parameter hot_y_ :: <C-signed-int>;
  c-name: "gdk_drag_set_hotspot";
end;

define inline-only constant $gdk-action-copy = 1;
define inline-only constant $gdk-action-move = 2;
define inline-only constant $gdk-action-link = 4;
define inline-only constant $gdk-action-ask = 8;
define constant <GdkDragAction> = <C-int>;
define C-pointer-type <GdkDragAction*> => <GdkDragAction>;

define inline-only constant $gdk-drag-cancel-no-target = 0;
define inline-only constant $gdk-drag-cancel-user-cancelled = 1;
define inline-only constant $gdk-drag-cancel-error = 2;
define constant <GdkDragCancelReason> = <C-int>;
define C-pointer-type <GdkDragCancelReason*> => <GdkDragCancelReason>;

// Interface
define open C-subtype <GdkDragSurface> (<GdkSurface>)
end C-subtype;

define C-pointer-type <GdkDragSurface*> => <GdkDragSurface>;

define sealed domain make (singleton(<GdkDragSurface*>));
define sealed domain initialize (<GdkDragSurface*>);

define inline-only C-function gdk-drag-surface-present
  input parameter self :: <GdkDragSurface>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gdk_drag_surface_present";
end;

define C-struct <_GdkDragSurfaceInterface>
  pointer-type-name: <GdkDragSurfaceInterface>;
end C-struct;

define sealed domain make (singleton(<GdkDragSurfaceInterface>));
define sealed domain initialize (<GdkDragSurfaceInterface>);

define open C-subtype <GdkDrawContext> (<GObject>)
end C-subtype;

define C-pointer-type <GdkDrawContext*> => <GdkDrawContext>;

define sealed domain make (singleton(<GdkDrawContext*>));
define sealed domain initialize (<GdkDrawContext*>);

define inline-only C-function gdk-draw-context-begin-frame
  input parameter self :: <GdkDrawContext>;
  input parameter region_ :: <cairoRegion>;
  c-name: "gdk_draw_context_begin_frame";
end;

define inline-only C-function gdk-draw-context-end-frame
  input parameter self :: <GdkDrawContext>;
  c-name: "gdk_draw_context_end_frame";
end;

define inline-only C-function gdk-draw-context-get-display
  input parameter self :: <GdkDrawContext>;
  result res :: <GdkDisplay>;
  c-name: "gdk_draw_context_get_display";
end;

define inline-only C-function gdk-draw-context-get-frame-region
  input parameter self :: <GdkDrawContext>;
  result res :: <cairoRegion>;
  c-name: "gdk_draw_context_get_frame_region";
end;

define inline-only C-function gdk-draw-context-get-surface
  input parameter self :: <GdkDrawContext>;
  result res :: <GdkSurface>;
  c-name: "gdk_draw_context_get_surface";
end;

define inline-only C-function gdk-draw-context-is-in-frame
  input parameter self :: <GdkDrawContext>;
  result res :: <C-boolean>;
  c-name: "gdk_draw_context_is_in_frame";
end;

define open C-subtype <GdkDrop> (<GObject>)
end C-subtype;

define C-pointer-type <GdkDrop*> => <GdkDrop>;

define sealed domain make (singleton(<GdkDrop*>));
define sealed domain initialize (<GdkDrop*>);

define inline-only C-function gdk-drop-finish
  input parameter self :: <GdkDrop>;
  input parameter action_ :: <GdkDragAction>;
  c-name: "gdk_drop_finish";
end;

define inline-only C-function gdk-drop-get-actions
  input parameter self :: <GdkDrop>;
  result res :: <GdkDragAction>;
  c-name: "gdk_drop_get_actions";
end;

define inline-only C-function gdk-drop-get-device
  input parameter self :: <GdkDrop>;
  result res :: <GdkDevice>;
  c-name: "gdk_drop_get_device";
end;

define inline-only C-function gdk-drop-get-display
  input parameter self :: <GdkDrop>;
  result res :: <GdkDisplay>;
  c-name: "gdk_drop_get_display";
end;

define inline-only C-function gdk-drop-get-drag
  input parameter self :: <GdkDrop>;
  result res :: <GdkDrag>;
  c-name: "gdk_drop_get_drag";
end;

define inline-only C-function gdk-drop-get-formats
  input parameter self :: <GdkDrop>;
  result res :: <GdkContentFormats>;
  c-name: "gdk_drop_get_formats";
end;

define inline-only C-function gdk-drop-get-surface
  input parameter self :: <GdkDrop>;
  result res :: <GdkSurface>;
  c-name: "gdk_drop_get_surface";
end;

define inline-only C-function gdk-drop-read-async
  input parameter self :: <GdkDrop>;
  input parameter mime_types_ :: <C-string*>;
  input parameter io_priority_ :: <C-signed-int>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_drop_read_async";
end;

define inline-only C-function gdk-drop-read-finish
  input parameter self :: <GdkDrop>;
  input parameter result_ :: <GAsyncResult>;
  output parameter out_mime_type_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GInputStream>;
  c-name: "gdk_drop_read_finish";
end;

define inline-only C-function gdk-drop-read-value-async
  input parameter self :: <GdkDrop>;
  input parameter type_ :: <C-long>;
  input parameter io_priority_ :: <C-signed-int>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_drop_read_value_async";
end;

define inline-only C-function gdk-drop-read-value-finish
  input parameter self :: <GdkDrop>;
  input parameter result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <GValue>;
  c-name: "gdk_drop_read_value_finish";
end;

define inline-only C-function gdk-drop-status
  input parameter self :: <GdkDrop>;
  input parameter actions_ :: <GdkDragAction>;
  input parameter preferred_ :: <GdkDragAction>;
  c-name: "gdk_drop_status";
end;

define inline-only constant $event-propagate = 0;

define inline-only constant $event-stop = 1;

define open C-subtype <GdkEvent> (<C-void*>)
end C-subtype;

define C-pointer-type <GdkEvent*> => <GdkEvent>;

define sealed domain make (singleton(<GdkEvent*>));
define sealed domain initialize (<GdkEvent*>);

define inline-only C-function gdk-events-get-angle
  input parameter self :: <GdkEvent>;
  input parameter event2_ :: <GdkEvent>;
  output parameter angle_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gdk_events_get_angle";
end;

define inline-only C-function gdk-events-get-center
  input parameter self :: <GdkEvent>;
  input parameter event2_ :: <GdkEvent>;
  output parameter x_ :: <C-double*>;
  output parameter y_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gdk_events_get_center";
end;

define inline-only C-function gdk-events-get-distance
  input parameter self :: <GdkEvent>;
  input parameter event2_ :: <GdkEvent>;
  output parameter distance_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gdk_events_get_distance";
end;

define inline-only C-function gdk-event-get-axes
  input parameter self :: <GdkEvent>;
  output parameter axes_ :: <C-double*>;
  output parameter n_axes_ :: <C-unsigned-int*>;
  result res :: <C-boolean>;
  c-name: "gdk_event_get_axes";
end;

define inline-only C-function gdk-event-get-axis
  input parameter self :: <GdkEvent>;
  input parameter axis_use_ :: <GdkAxisUse>;
  output parameter value_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gdk_event_get_axis";
end;

define inline-only C-function gdk-event-get-device
  input parameter self :: <GdkEvent>;
  result res :: <GdkDevice>;
  c-name: "gdk_event_get_device";
end;

define inline-only C-function gdk-event-get-device-tool
  input parameter self :: <GdkEvent>;
  result res :: <GdkDeviceTool>;
  c-name: "gdk_event_get_device_tool";
end;

define inline-only C-function gdk-event-get-display
  input parameter self :: <GdkEvent>;
  result res :: <GdkDisplay>;
  c-name: "gdk_event_get_display";
end;

define inline-only C-function gdk-event-get-event-sequence
  input parameter self :: <GdkEvent>;
  result res :: <GdkEventSequence>;
  c-name: "gdk_event_get_event_sequence";
end;

define inline-only C-function gdk-event-get-event-type
  input parameter self :: <GdkEvent>;
  result res :: <GdkEventType>;
  c-name: "gdk_event_get_event_type";
end;

define inline-only C-function gdk-event-get-history
  input parameter self :: <GdkEvent>;
  output parameter out_n_coords_ :: <C-unsigned-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "gdk_event_get_history";
end;

define inline-only C-function gdk-event-get-modifier-state
  input parameter self :: <GdkEvent>;
  result res :: <GdkModifierType>;
  c-name: "gdk_event_get_modifier_state";
end;

define inline-only C-function gdk-event-get-pointer-emulated
  input parameter self :: <GdkEvent>;
  result res :: <C-boolean>;
  c-name: "gdk_event_get_pointer_emulated";
end;

define inline-only C-function gdk-event-get-position
  input parameter self :: <GdkEvent>;
  output parameter x_ :: <C-double*>;
  output parameter y_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gdk_event_get_position";
end;

define inline-only C-function gdk-event-get-seat
  input parameter self :: <GdkEvent>;
  result res :: <GdkSeat>;
  c-name: "gdk_event_get_seat";
end;

define inline-only C-function gdk-event-get-surface
  input parameter self :: <GdkEvent>;
  result res :: <GdkSurface>;
  c-name: "gdk_event_get_surface";
end;

define inline-only C-function gdk-event-get-time
  input parameter self :: <GdkEvent>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_event_get_time";
end;

define inline-only C-function gdk-event-ref
  input parameter self :: <GdkEvent>;
  result res :: <GdkEvent>;
  c-name: "gdk_event_ref";
end;

define inline-only C-function gdk-event-triggers-context-menu
  input parameter self :: <GdkEvent>;
  result res :: <C-boolean>;
  c-name: "gdk_event_triggers_context_menu";
end;

define inline-only C-function gdk-event-unref
  input parameter self :: <GdkEvent>;
  c-name: "gdk_event_unref";
end;

define C-struct <_GdkEventSequence>
  pointer-type-name: <GdkEventSequence>;
end C-struct;

define sealed domain make (singleton(<GdkEventSequence>));
define sealed domain initialize (<GdkEventSequence>);

define inline-only constant $gdk-delete = 0;
define inline-only constant $gdk-motion-notify = 1;
define inline-only constant $gdk-button-press = 2;
define inline-only constant $gdk-button-release = 3;
define inline-only constant $gdk-key-press = 4;
define inline-only constant $gdk-key-release = 5;
define inline-only constant $gdk-enter-notify = 6;
define inline-only constant $gdk-leave-notify = 7;
define inline-only constant $gdk-focus-change = 8;
define inline-only constant $gdk-proximity-in = 9;
define inline-only constant $gdk-proximity-out = 10;
define inline-only constant $gdk-drag-enter = 11;
define inline-only constant $gdk-drag-leave = 12;
define inline-only constant $gdk-drag-motion = 13;
define inline-only constant $gdk-drop-start = 14;
define inline-only constant $gdk-scroll = 15;
define inline-only constant $gdk-grab-broken = 16;
define inline-only constant $gdk-touch-begin = 17;
define inline-only constant $gdk-touch-update = 18;
define inline-only constant $gdk-touch-end = 19;
define inline-only constant $gdk-touch-cancel = 20;
define inline-only constant $gdk-touchpad-swipe = 21;
define inline-only constant $gdk-touchpad-pinch = 22;
define inline-only constant $gdk-pad-button-press = 23;
define inline-only constant $gdk-pad-button-release = 24;
define inline-only constant $gdk-pad-ring = 25;
define inline-only constant $gdk-pad-strip = 26;
define inline-only constant $gdk-pad-group-mode = 27;
define inline-only constant $gdk-touchpad-hold = 28;
define inline-only constant $gdk-event-last = 29;
define constant <GdkEventType> = <C-int>;
define C-pointer-type <GdkEventType*> => <GdkEventType>;

define C-struct <_GdkFileList>
  pointer-type-name: <GdkFileList>;
end C-struct;

define sealed domain make (singleton(<GdkFileList>));
define sealed domain initialize (<GdkFileList>);

define inline-only C-function gdk-file-list-new-from-array
  input parameter files_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_files_ :: <C-unsigned-long>;
  result res :: <GdkFileList>;
  c-name: "gdk_file_list_new_from_array";
end;

define inline-only C-function gdk-file-list-new-from-list
  input parameter files_ :: <GSList>;
  result res :: <GdkFileList>;
  c-name: "gdk_file_list_new_from_list";
end;

define inline-only C-function gdk-file-list-get-files
  input parameter self :: <GdkFileList>;
  result res :: <GSList>;
  c-name: "gdk_file_list_get_files";
end;

define open C-subtype <GdkFocusEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkFocusEvent*> => <GdkFocusEvent>;

define sealed domain make (singleton(<GdkFocusEvent*>));
define sealed domain initialize (<GdkFocusEvent*>);

define inline-only C-function gdk-focus-event-get-in
  input parameter self :: <GdkFocusEvent>;
  result res :: <C-boolean>;
  c-name: "gdk_focus_event_get_in";
end;

define open C-subtype <GdkFrameClock> (<GObject>)
end C-subtype;

define C-pointer-type <GdkFrameClock*> => <GdkFrameClock>;

define sealed domain make (singleton(<GdkFrameClock*>));
define sealed domain initialize (<GdkFrameClock*>);

define inline-only C-function gdk-frame-clock-begin-updating
  input parameter self :: <GdkFrameClock>;
  c-name: "gdk_frame_clock_begin_updating";
end;

define inline-only C-function gdk-frame-clock-end-updating
  input parameter self :: <GdkFrameClock>;
  c-name: "gdk_frame_clock_end_updating";
end;

define inline-only C-function gdk-frame-clock-get-current-timings
  input parameter self :: <GdkFrameClock>;
  result res :: <GdkFrameTimings>;
  c-name: "gdk_frame_clock_get_current_timings";
end;

define inline-only C-function gdk-frame-clock-get-fps
  input parameter self :: <GdkFrameClock>;
  result res :: <C-double>;
  c-name: "gdk_frame_clock_get_fps";
end;

define inline-only C-function gdk-frame-clock-get-frame-counter
  input parameter self :: <GdkFrameClock>;
  result res :: <C-signed-long>;
  c-name: "gdk_frame_clock_get_frame_counter";
end;

define inline-only C-function gdk-frame-clock-get-frame-time
  input parameter self :: <GdkFrameClock>;
  result res :: <C-signed-long>;
  c-name: "gdk_frame_clock_get_frame_time";
end;

define inline-only C-function gdk-frame-clock-get-history-start
  input parameter self :: <GdkFrameClock>;
  result res :: <C-signed-long>;
  c-name: "gdk_frame_clock_get_history_start";
end;

define inline-only C-function gdk-frame-clock-get-refresh-info
  input parameter self :: <GdkFrameClock>;
  input parameter base_time_ :: <C-signed-long>;
  output parameter refresh_interval_return_ :: <C-signed-long*>;
  output parameter presentation_time_return_ :: <C-signed-long*>;
  c-name: "gdk_frame_clock_get_refresh_info";
end;

define inline-only C-function gdk-frame-clock-get-timings
  input parameter self :: <GdkFrameClock>;
  input parameter frame_counter_ :: <C-signed-long>;
  result res :: <GdkFrameTimings>;
  c-name: "gdk_frame_clock_get_timings";
end;

define inline-only C-function gdk-frame-clock-request-phase
  input parameter self :: <GdkFrameClock>;
  input parameter phase_ :: <GdkFrameClockPhase>;
  c-name: "gdk_frame_clock_request_phase";
end;

define C-struct <_GdkFrameClockClass>
  pointer-type-name: <GdkFrameClockClass>;
end C-struct;

define sealed domain make (singleton(<GdkFrameClockClass>));
define sealed domain initialize (<GdkFrameClockClass>);

define inline-only constant $gdk-frame-clock-phase-none = 0;
define inline-only constant $gdk-frame-clock-phase-flush-events = 1;
define inline-only constant $gdk-frame-clock-phase-before-paint = 2;
define inline-only constant $gdk-frame-clock-phase-update = 4;
define inline-only constant $gdk-frame-clock-phase-layout = 8;
define inline-only constant $gdk-frame-clock-phase-paint = 16;
define inline-only constant $gdk-frame-clock-phase-resume-events = 32;
define inline-only constant $gdk-frame-clock-phase-after-paint = 64;
define constant <GdkFrameClockPhase> = <C-int>;
define C-pointer-type <GdkFrameClockPhase*> => <GdkFrameClockPhase>;

define C-struct <_GdkFrameClockPrivate>
  pointer-type-name: <GdkFrameClockPrivate>;
end C-struct;

define sealed domain make (singleton(<GdkFrameClockPrivate>));
define sealed domain initialize (<GdkFrameClockPrivate>);

define C-struct <_GdkFrameTimings>
  pointer-type-name: <GdkFrameTimings>;
end C-struct;

define sealed domain make (singleton(<GdkFrameTimings>));
define sealed domain initialize (<GdkFrameTimings>);

define inline-only C-function gdk-frame-timings-get-complete
  input parameter self :: <GdkFrameTimings>;
  result res :: <C-boolean>;
  c-name: "gdk_frame_timings_get_complete";
end;

define inline-only C-function gdk-frame-timings-get-frame-counter
  input parameter self :: <GdkFrameTimings>;
  result res :: <C-signed-long>;
  c-name: "gdk_frame_timings_get_frame_counter";
end;

define inline-only C-function gdk-frame-timings-get-frame-time
  input parameter self :: <GdkFrameTimings>;
  result res :: <C-signed-long>;
  c-name: "gdk_frame_timings_get_frame_time";
end;

define inline-only C-function gdk-frame-timings-get-predicted-presentation-time
  input parameter self :: <GdkFrameTimings>;
  result res :: <C-signed-long>;
  c-name: "gdk_frame_timings_get_predicted_presentation_time";
end;

define inline-only C-function gdk-frame-timings-get-presentation-time
  input parameter self :: <GdkFrameTimings>;
  result res :: <C-signed-long>;
  c-name: "gdk_frame_timings_get_presentation_time";
end;

define inline-only C-function gdk-frame-timings-get-refresh-interval
  input parameter self :: <GdkFrameTimings>;
  result res :: <C-signed-long>;
  c-name: "gdk_frame_timings_get_refresh_interval";
end;

define inline-only C-function gdk-frame-timings-ref
  input parameter self :: <GdkFrameTimings>;
  result res :: <GdkFrameTimings>;
  c-name: "gdk_frame_timings_ref";
end;

define inline-only C-function gdk-frame-timings-unref
  input parameter self :: <GdkFrameTimings>;
  c-name: "gdk_frame_timings_unref";
end;

define inline-only constant $gdk-fullscreen-on-current-monitor = 0;
define inline-only constant $gdk-fullscreen-on-all-monitors = 1;
define constant <GdkFullscreenMode> = <C-int>;
define C-pointer-type <GdkFullscreenMode*> => <GdkFullscreenMode>;

define inline-only constant $gdk-gl-api-gl = 1;
define inline-only constant $gdk-gl-api-gles = 2;
define constant <GdkGLAPI> = <C-int>;
define C-pointer-type <GdkGLAPI*> => <GdkGLAPI>;

define open C-subtype <GdkGLContext> (<GdkDrawContext>)
end C-subtype;

define C-pointer-type <GdkGLContext*> => <GdkGLContext>;

define sealed domain make (singleton(<GdkGLContext*>));
define sealed domain initialize (<GdkGLContext*>);

define inline-only C-function gdk-gl-context-clear-current
  c-name: "gdk_gl_context_clear_current";
end;

define inline-only C-function gdk-gl-context-get-current
  result res :: <GdkGLContext>;
  c-name: "gdk_gl_context_get_current";
end;

define inline-only C-function gdk-gl-context-get-allowed-apis
  input parameter self :: <GdkGLContext>;
  result res :: <GdkGLAPI>;
  c-name: "gdk_gl_context_get_allowed_apis";
end;

define inline-only C-function gdk-gl-context-get-api
  input parameter self :: <GdkGLContext>;
  result res :: <GdkGLAPI>;
  c-name: "gdk_gl_context_get_api";
end;

define inline-only C-function gdk-gl-context-get-debug-enabled
  input parameter self :: <GdkGLContext>;
  result res :: <C-boolean>;
  c-name: "gdk_gl_context_get_debug_enabled";
end;

define inline-only C-function gdk-gl-context-get-display
  input parameter self :: <GdkGLContext>;
  result res :: <GdkDisplay>;
  c-name: "gdk_gl_context_get_display";
end;

define inline-only C-function gdk-gl-context-get-forward-compatible
  input parameter self :: <GdkGLContext>;
  result res :: <C-boolean>;
  c-name: "gdk_gl_context_get_forward_compatible";
end;

define inline-only C-function gdk-gl-context-get-required-version
  input parameter self :: <GdkGLContext>;
  output parameter major_ :: <C-signed-int*>;
  output parameter minor_ :: <C-signed-int*>;
  c-name: "gdk_gl_context_get_required_version";
end;

define inline-only C-function gdk-gl-context-get-surface
  input parameter self :: <GdkGLContext>;
  result res :: <GdkSurface>;
  c-name: "gdk_gl_context_get_surface";
end;

define inline-only C-function gdk-gl-context-get-use-es
  input parameter self :: <GdkGLContext>;
  result res :: <C-boolean>;
  c-name: "gdk_gl_context_get_use_es";
end;

define inline-only C-function gdk-gl-context-get-version
  input parameter self :: <GdkGLContext>;
  output parameter major_ :: <C-signed-int*>;
  output parameter minor_ :: <C-signed-int*>;
  c-name: "gdk_gl_context_get_version";
end;

define inline-only C-function gdk-gl-context-is-legacy
  input parameter self :: <GdkGLContext>;
  result res :: <C-boolean>;
  c-name: "gdk_gl_context_is_legacy";
end;

define inline-only C-function gdk-gl-context-is-shared
  input parameter self :: <GdkGLContext>;
  input parameter other_ :: <GdkGLContext>;
  result res :: <C-boolean>;
  c-name: "gdk_gl_context_is_shared";
end;

define inline-only C-function gdk-gl-context-make-current
  input parameter self :: <GdkGLContext>;
  c-name: "gdk_gl_context_make_current";
end;

define inline-only C-function gdk-gl-context-realize
  input parameter self :: <GdkGLContext>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_gl_context_realize";
end;

define inline-only C-function gdk-gl-context-set-allowed-apis
  input parameter self :: <GdkGLContext>;
  input parameter apis_ :: <GdkGLAPI>;
  c-name: "gdk_gl_context_set_allowed_apis";
end;

define inline-only C-function gdk-gl-context-set-debug-enabled
  input parameter self :: <GdkGLContext>;
  input parameter enabled_ :: <C-boolean>;
  c-name: "gdk_gl_context_set_debug_enabled";
end;

define inline-only C-function gdk-gl-context-set-forward-compatible
  input parameter self :: <GdkGLContext>;
  input parameter compatible_ :: <C-boolean>;
  c-name: "gdk_gl_context_set_forward_compatible";
end;

define inline-only C-function gdk-gl-context-set-required-version
  input parameter self :: <GdkGLContext>;
  input parameter major_ :: <C-signed-int>;
  input parameter minor_ :: <C-signed-int>;
  c-name: "gdk_gl_context_set_required_version";
end;

define inline-only C-function gdk-gl-context-set-use-es
  input parameter self :: <GdkGLContext>;
  input parameter use_es_ :: <C-signed-int>;
  c-name: "gdk_gl_context_set_use_es";
end;

define inline-only constant $gdk-gl-error-not-available = 0;
define inline-only constant $gdk-gl-error-unsupported-format = 1;
define inline-only constant $gdk-gl-error-unsupported-profile = 2;
define inline-only constant $gdk-gl-error-compilation-failed = 3;
define inline-only constant $gdk-gl-error-link-failed = 4;
define constant <GdkGLError> = <C-int>;
define C-pointer-type <GdkGLError*> => <GdkGLError>;

define open C-subtype <GdkGLTexture> (<GdkTexture>)
end C-subtype;

define C-pointer-type <GdkGLTexture*> => <GdkGLTexture>;

define sealed domain make (singleton(<GdkGLTexture*>));
define sealed domain initialize (<GdkGLTexture*>);

define inline-only C-function gdk-gl-texture-new
  input parameter context_ :: <GdkGLContext>;
  input parameter id_ :: <C-unsigned-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter destroy_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  result res :: <GdkGLTexture>;
  c-name: "gdk_gl_texture_new";
end;

define inline-only C-function gdk-gl-texture-release
  input parameter self :: <GdkGLTexture>;
  c-name: "gdk_gl_texture_release";
end;

define C-struct <_GdkGLTextureClass>
  pointer-type-name: <GdkGLTextureClass>;
end C-struct;

define sealed domain make (singleton(<GdkGLTextureClass>));
define sealed domain initialize (<GdkGLTextureClass>);

define open C-subtype <GdkGrabBrokenEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkGrabBrokenEvent*> => <GdkGrabBrokenEvent>;

define sealed domain make (singleton(<GdkGrabBrokenEvent*>));
define sealed domain initialize (<GdkGrabBrokenEvent*>);

define inline-only C-function gdk-grab-broken-event-get-grab-surface
  input parameter self :: <GdkGrabBrokenEvent>;
  result res :: <GdkSurface>;
  c-name: "gdk_grab_broken_event_get_grab_surface";
end;

define inline-only C-function gdk-grab-broken-event-get-implicit
  input parameter self :: <GdkGrabBrokenEvent>;
  result res :: <C-boolean>;
  c-name: "gdk_grab_broken_event_get_implicit";
end;

define inline-only constant $gdk-gravity-north-west = 1;
define inline-only constant $gdk-gravity-north = 2;
define inline-only constant $gdk-gravity-north-east = 3;
define inline-only constant $gdk-gravity-west = 4;
define inline-only constant $gdk-gravity-center = 5;
define inline-only constant $gdk-gravity-east = 6;
define inline-only constant $gdk-gravity-south-west = 7;
define inline-only constant $gdk-gravity-south = 8;
define inline-only constant $gdk-gravity-south-east = 9;
define inline-only constant $gdk-gravity-static = 10;
define constant <GdkGravity> = <C-int>;
define C-pointer-type <GdkGravity*> => <GdkGravity>;

define inline-only constant $gdk-source-mouse = 0;
define inline-only constant $gdk-source-pen = 1;
define inline-only constant $gdk-source-keyboard = 2;
define inline-only constant $gdk-source-touchscreen = 3;
define inline-only constant $gdk-source-touchpad = 4;
define inline-only constant $gdk-source-trackpoint = 5;
define inline-only constant $gdk-source-tablet-pad = 6;
define constant <GdkInputSource> = <C-int>;
define C-pointer-type <GdkInputSource*> => <GdkInputSource>;

define inline-only constant $key-0 = 48;

define inline-only constant $key-1 = 49;

define inline-only constant $key-2 = 50;

define inline-only constant $key-3 = 51;

define inline-only constant $key-3270-alt-cursor = 64784;

define inline-only constant $key-3270-attn = 64782;

define inline-only constant $key-3270-back-tab = 64773;

define inline-only constant $key-3270-change-screen = 64793;

define inline-only constant $key-3270-copy = 64789;

define inline-only constant $key-3270-cursor-blink = 64783;

define inline-only constant $key-3270-cursor-select = 64796;

define inline-only constant $key-3270-delete-word = 64794;

define inline-only constant $key-3270-duplicate = 64769;

define inline-only constant $key-3270-enter = 64798;

define inline-only constant $key-3270-erase-eof = 64774;

define inline-only constant $key-3270-erase-input = 64775;

define inline-only constant $key-3270-ex-select = 64795;

define inline-only constant $key-3270-field-mark = 64770;

define inline-only constant $key-3270-ident = 64787;

define inline-only constant $key-3270-jump = 64786;

define inline-only constant $key-3270-key-click = 64785;

define inline-only constant $key-3270-left2 = 64772;

define inline-only constant $key-3270-pa1 = 64778;

define inline-only constant $key-3270-pa2 = 64779;

define inline-only constant $key-3270-pa3 = 64780;

define inline-only constant $key-3270-play = 64790;

define inline-only constant $key-3270-print-screen = 64797;

define inline-only constant $key-3270-quit = 64777;

define inline-only constant $key-3270-record = 64792;

define inline-only constant $key-3270-reset = 64776;

define inline-only constant $key-3270-right2 = 64771;

define inline-only constant $key-3270-rule = 64788;

define inline-only constant $key-3270-setup = 64791;

define inline-only constant $key-3270-test = 64781;

define inline-only constant $key-4 = 52;

define inline-only constant $key-5 = 53;

define inline-only constant $key-6 = 54;

define inline-only constant $key-7 = 55;

define inline-only constant $key-8 = 56;

define inline-only constant $key-9 = 57;

define inline-only constant $key-a = 65;

define inline-only constant $key-ae = 198;

define inline-only constant $key-aacute = 193;

define inline-only constant $key-abelowdot = 16785056;

define inline-only constant $key-abreve = 451;

define inline-only constant $key-abreveacute = 16785070;

define inline-only constant $key-abrevebelowdot = 16785078;

define inline-only constant $key-abrevegrave = 16785072;

define inline-only constant $key-abrevehook = 16785074;

define inline-only constant $key-abrevetilde = 16785076;

define inline-only constant $key-access-x-enable = 65136;

define inline-only constant $key-access-x-feedback-enable = 65137;

define inline-only constant $key-acircumflex = 194;

define inline-only constant $key-acircumflexacute = 16785060;

define inline-only constant $key-acircumflexbelowdot = 16785068;

define inline-only constant $key-acircumflexgrave = 16785062;

define inline-only constant $key-acircumflexhook = 16785064;

define inline-only constant $key-acircumflextilde = 16785066;

define inline-only constant $key-add-favorite = 269025081;

define inline-only constant $key-adiaeresis = 196;

define inline-only constant $key-agrave = 192;

define inline-only constant $key-ahook = 16785058;

define inline-only constant $key-alt-l = 65513;

define inline-only constant $key-alt-r = 65514;

define inline-only constant $key-amacron = 960;

define inline-only constant $key-aogonek = 417;

define inline-only constant $key-application-left = 269025104;

define inline-only constant $key-application-right = 269025105;

define inline-only constant $key-arabic-0 = 16778848;

define inline-only constant $key-arabic-1 = 16778849;

define inline-only constant $key-arabic-2 = 16778850;

define inline-only constant $key-arabic-3 = 16778851;

define inline-only constant $key-arabic-4 = 16778852;

define inline-only constant $key-arabic-5 = 16778853;

define inline-only constant $key-arabic-6 = 16778854;

define inline-only constant $key-arabic-7 = 16778855;

define inline-only constant $key-arabic-8 = 16778856;

define inline-only constant $key-arabic-9 = 16778857;

define inline-only constant $key-arabic-ain = 1497;

define inline-only constant $key-arabic-alef = 1479;

define inline-only constant $key-arabic-alefmaksura = 1513;

define inline-only constant $key-arabic-beh = 1480;

define inline-only constant $key-arabic-comma = 1452;

define inline-only constant $key-arabic-dad = 1494;

define inline-only constant $key-arabic-dal = 1487;

define inline-only constant $key-arabic-damma = 1519;

define inline-only constant $key-arabic-dammatan = 1516;

define inline-only constant $key-arabic-ddal = 16778888;

define inline-only constant $key-arabic-farsi-yeh = 16778956;

define inline-only constant $key-arabic-fatha = 1518;

define inline-only constant $key-arabic-fathatan = 1515;

define inline-only constant $key-arabic-feh = 1505;

define inline-only constant $key-arabic-fullstop = 16778964;

define inline-only constant $key-arabic-gaf = 16778927;

define inline-only constant $key-arabic-ghain = 1498;

define inline-only constant $key-arabic-ha = 1511;

define inline-only constant $key-arabic-hah = 1485;

define inline-only constant $key-arabic-hamza = 1473;

define inline-only constant $key-arabic-hamza-above = 16778836;

define inline-only constant $key-arabic-hamza-below = 16778837;

define inline-only constant $key-arabic-hamzaonalef = 1475;

define inline-only constant $key-arabic-hamzaonwaw = 1476;

define inline-only constant $key-arabic-hamzaonyeh = 1478;

define inline-only constant $key-arabic-hamzaunderalef = 1477;

define inline-only constant $key-arabic-heh = 1511;

define inline-only constant $key-arabic-heh-doachashmee = 16778942;

define inline-only constant $key-arabic-heh-goal = 16778945;

define inline-only constant $key-arabic-jeem = 1484;

define inline-only constant $key-arabic-jeh = 16778904;

define inline-only constant $key-arabic-kaf = 1507;

define inline-only constant $key-arabic-kasra = 1520;

define inline-only constant $key-arabic-kasratan = 1517;

define inline-only constant $key-arabic-keheh = 16778921;

define inline-only constant $key-arabic-khah = 1486;

define inline-only constant $key-arabic-lam = 1508;

define inline-only constant $key-arabic-madda-above = 16778835;

define inline-only constant $key-arabic-maddaonalef = 1474;

define inline-only constant $key-arabic-meem = 1509;

define inline-only constant $key-arabic-noon = 1510;

define inline-only constant $key-arabic-noon-ghunna = 16778938;

define inline-only constant $key-arabic-peh = 16778878;

define inline-only constant $key-arabic-percent = 16778858;

define inline-only constant $key-arabic-qaf = 1506;

define inline-only constant $key-arabic-question-mark = 1471;

define inline-only constant $key-arabic-ra = 1489;

define inline-only constant $key-arabic-rreh = 16778897;

define inline-only constant $key-arabic-sad = 1493;

define inline-only constant $key-arabic-seen = 1491;

define inline-only constant $key-arabic-semicolon = 1467;

define inline-only constant $key-arabic-shadda = 1521;

define inline-only constant $key-arabic-sheen = 1492;

define inline-only constant $key-arabic-sukun = 1522;

define inline-only constant $key-arabic-superscript-alef = 16778864;

define inline-only constant $key-arabic-switch = 65406;

define inline-only constant $key-arabic-tah = 1495;

define inline-only constant $key-arabic-tatweel = 1504;

define inline-only constant $key-arabic-tcheh = 16778886;

define inline-only constant $key-arabic-teh = 1482;

define inline-only constant $key-arabic-tehmarbuta = 1481;

define inline-only constant $key-arabic-thal = 1488;

define inline-only constant $key-arabic-theh = 1483;

define inline-only constant $key-arabic-tteh = 16778873;

define inline-only constant $key-arabic-veh = 16778916;

define inline-only constant $key-arabic-waw = 1512;

define inline-only constant $key-arabic-yeh = 1514;

define inline-only constant $key-arabic-yeh-baree = 16778962;

define inline-only constant $key-arabic-zah = 1496;

define inline-only constant $key-arabic-zain = 1490;

define inline-only constant $key-aring = 197;

define inline-only constant $key-armenian-at = 16778552;

define inline-only constant $key-armenian-ayb = 16778545;

define inline-only constant $key-armenian-ben = 16778546;

define inline-only constant $key-armenian-cha = 16778569;

define inline-only constant $key-armenian-da = 16778548;

define inline-only constant $key-armenian-dza = 16778561;

define inline-only constant $key-armenian-e = 16778551;

define inline-only constant $key-armenian-fe = 16778582;

define inline-only constant $key-armenian-ghat = 16778562;

define inline-only constant $key-armenian-gim = 16778547;

define inline-only constant $key-armenian-hi = 16778565;

define inline-only constant $key-armenian-ho = 16778560;

define inline-only constant $key-armenian-ini = 16778555;

define inline-only constant $key-armenian-je = 16778571;

define inline-only constant $key-armenian-ke = 16778580;

define inline-only constant $key-armenian-ken = 16778559;

define inline-only constant $key-armenian-khe = 16778557;

define inline-only constant $key-armenian-lyun = 16778556;

define inline-only constant $key-armenian-men = 16778564;

define inline-only constant $key-armenian-nu = 16778566;

define inline-only constant $key-armenian-o = 16778581;

define inline-only constant $key-armenian-pe = 16778570;

define inline-only constant $key-armenian-pyur = 16778579;

define inline-only constant $key-armenian-ra = 16778572;

define inline-only constant $key-armenian-re = 16778576;

define inline-only constant $key-armenian-se = 16778573;

define inline-only constant $key-armenian-sha = 16778567;

define inline-only constant $key-armenian-tche = 16778563;

define inline-only constant $key-armenian-to = 16778553;

define inline-only constant $key-armenian-tsa = 16778558;

define inline-only constant $key-armenian-tso = 16778577;

define inline-only constant $key-armenian-tyun = 16778575;

define inline-only constant $key-armenian-vev = 16778574;

define inline-only constant $key-armenian-vo = 16778568;

define inline-only constant $key-armenian-vyun = 16778578;

define inline-only constant $key-armenian-yech = 16778549;

define inline-only constant $key-armenian-za = 16778550;

define inline-only constant $key-armenian-zhe = 16778554;

define inline-only constant $key-armenian-accent = 16778587;

define inline-only constant $key-armenian-amanak = 16778588;

define inline-only constant $key-armenian-apostrophe = 16778586;

define inline-only constant $key-armenian-but = 16778589;

define inline-only constant $key-armenian-exclam = 16778588;

define inline-only constant $key-armenian-full-stop = 16778633;

define inline-only constant $key-armenian-hyphen = 16778634;

define inline-only constant $key-armenian-ligature-ew = 16778631;

define inline-only constant $key-armenian-paruyk = 16778590;

define inline-only constant $key-armenian-question = 16778590;

define inline-only constant $key-armenian-separation-mark = 16778589;

define inline-only constant $key-armenian-shesht = 16778587;

define inline-only constant $key-armenian-verjaket = 16778633;

define inline-only constant $key-armenian-yentamna = 16778634;

define inline-only constant $key-atilde = 195;

define inline-only constant $key-audible-bell-enable = 65146;

define inline-only constant $key-audio-cycle-track = 269025179;

define inline-only constant $key-audio-forward = 269025175;

define inline-only constant $key-audio-lower-volume = 269025041;

define inline-only constant $key-audio-media = 269025074;

define inline-only constant $key-audio-mic-mute = 269025202;

define inline-only constant $key-audio-mute = 269025042;

define inline-only constant $key-audio-next = 269025047;

define inline-only constant $key-audio-pause = 269025073;

define inline-only constant $key-audio-play = 269025044;

define inline-only constant $key-audio-preset = 269025206;

define inline-only constant $key-audio-prev = 269025046;

define inline-only constant $key-audio-raise-volume = 269025043;

define inline-only constant $key-audio-random-play = 269025177;

define inline-only constant $key-audio-record = 269025052;

define inline-only constant $key-audio-repeat = 269025176;

define inline-only constant $key-audio-rewind = 269025086;

define inline-only constant $key-audio-stop = 269025045;

define inline-only constant $key-away = 269025165;

define inline-only constant $key-b = 66;

define inline-only constant $key-babovedot = 16784898;

define inline-only constant $key-back = 269025062;

define inline-only constant $key-back-forward = 269025087;

define inline-only constant $key-back-space = 65288;

define inline-only constant $key-battery = 269025171;

define inline-only constant $key-begin = 65368;

define inline-only constant $key-blue = 269025190;

define inline-only constant $key-bluetooth = 269025172;

define inline-only constant $key-book = 269025106;

define inline-only constant $key-bounce-keys-enable = 65140;

define inline-only constant $key-break = 65387;

define inline-only constant $key-brightness-adjust = 269025083;

define inline-only constant $key-byelorussian-shortu = 1726;

define inline-only constant $key-c = 67;

define inline-only constant $key-cd = 269025107;

define inline-only constant $key-ch = 65186;

define inline-only constant $key-c-h = 65189;

define inline-only constant $key-cabovedot = 709;

define inline-only constant $key-cacute = 454;

define inline-only constant $key-calculator = 269025053;

define inline-only constant $key-calendar = 269025056;

define inline-only constant $key-cancel = 65385;

define inline-only constant $key-caps-lock = 65509;

define inline-only constant $key-ccaron = 456;

define inline-only constant $key-ccedilla = 199;

define inline-only constant $key-ccircumflex = 710;

define inline-only constant $key-clear = 65291;

define inline-only constant $key-clear-grab = 269024801;

define inline-only constant $key-close = 269025110;

define inline-only constant $key-codeinput = 65335;

define inline-only constant $key-colon-sign = 16785569;

define inline-only constant $key-community = 269025085;

define inline-only constant $key-contrast-adjust = 269025058;

define inline-only constant $key-control-l = 65507;

define inline-only constant $key-control-r = 65508;

define inline-only constant $key-copy = 269025111;

define inline-only constant $key-cruzeiro-sign = 16785570;

define inline-only constant $key-cut = 269025112;

define inline-only constant $key-cycle-angle = 269025180;

define inline-only constant $key-cyrillic-a = 1761;

define inline-only constant $key-cyrillic-be = 1762;

define inline-only constant $key-cyrillic-che = 1790;

define inline-only constant $key-cyrillic-che-descender = 16778422;

define inline-only constant $key-cyrillic-che-vertstroke = 16778424;

define inline-only constant $key-cyrillic-de = 1764;

define inline-only constant $key-cyrillic-dzhe = 1727;

define inline-only constant $key-cyrillic-e = 1788;

define inline-only constant $key-cyrillic-ef = 1766;

define inline-only constant $key-cyrillic-el = 1772;

define inline-only constant $key-cyrillic-em = 1773;

define inline-only constant $key-cyrillic-en = 1774;

define inline-only constant $key-cyrillic-en-descender = 16778402;

define inline-only constant $key-cyrillic-er = 1778;

define inline-only constant $key-cyrillic-es = 1779;

define inline-only constant $key-cyrillic-ghe = 1767;

define inline-only constant $key-cyrillic-ghe-bar = 16778386;

define inline-only constant $key-cyrillic-ha = 1768;

define inline-only constant $key-cyrillic-hardsign = 1791;

define inline-only constant $key-cyrillic-ha-descender = 16778418;

define inline-only constant $key-cyrillic-i = 1769;

define inline-only constant $key-cyrillic-ie = 1765;

define inline-only constant $key-cyrillic-io = 1715;

define inline-only constant $key-cyrillic-i-macron = 16778466;

define inline-only constant $key-cyrillic-je = 1720;

define inline-only constant $key-cyrillic-ka = 1771;

define inline-only constant $key-cyrillic-ka-descender = 16778394;

define inline-only constant $key-cyrillic-ka-vertstroke = 16778396;

define inline-only constant $key-cyrillic-lje = 1721;

define inline-only constant $key-cyrillic-nje = 1722;

define inline-only constant $key-cyrillic-o = 1775;

define inline-only constant $key-cyrillic-o-bar = 16778472;

define inline-only constant $key-cyrillic-pe = 1776;

define inline-only constant $key-cyrillic-schwa = 16778456;

define inline-only constant $key-cyrillic-sha = 1787;

define inline-only constant $key-cyrillic-shcha = 1789;

define inline-only constant $key-cyrillic-shha = 16778426;

define inline-only constant $key-cyrillic-shorti = 1770;

define inline-only constant $key-cyrillic-softsign = 1784;

define inline-only constant $key-cyrillic-te = 1780;

define inline-only constant $key-cyrillic-tse = 1763;

define inline-only constant $key-cyrillic-u = 1781;

define inline-only constant $key-cyrillic-u-macron = 16778478;

define inline-only constant $key-cyrillic-u-straight = 16778414;

define inline-only constant $key-cyrillic-u-straight-bar = 16778416;

define inline-only constant $key-cyrillic-ve = 1783;

define inline-only constant $key-cyrillic-ya = 1777;

define inline-only constant $key-cyrillic-yeru = 1785;

define inline-only constant $key-cyrillic-yu = 1760;

define inline-only constant $key-cyrillic-ze = 1786;

define inline-only constant $key-cyrillic-zhe = 1782;

define inline-only constant $key-cyrillic-zhe-descender = 16778390;

define inline-only constant $key-d = 68;

define inline-only constant $key-dos = 269025114;

define inline-only constant $key-dabovedot = 16784906;

define inline-only constant $key-dcaron = 463;

define inline-only constant $key-delete = 65535;

define inline-only constant $key-display = 269025113;

define inline-only constant $key-documents = 269025115;

define inline-only constant $key-dong-sign = 16785579;

define inline-only constant $key-down = 65364;

define inline-only constant $key-dstroke = 464;

define inline-only constant $key-e = 69;

define inline-only constant $key-eng = 957;

define inline-only constant $key-eth = 208;

define inline-only constant $key-ezh = 16777655;

define inline-only constant $key-eabovedot = 972;

define inline-only constant $key-eacute = 201;

define inline-only constant $key-ebelowdot = 16785080;

define inline-only constant $key-ecaron = 460;

define inline-only constant $key-ecircumflex = 202;

define inline-only constant $key-ecircumflexacute = 16785086;

define inline-only constant $key-ecircumflexbelowdot = 16785094;

define inline-only constant $key-ecircumflexgrave = 16785088;

define inline-only constant $key-ecircumflexhook = 16785090;

define inline-only constant $key-ecircumflextilde = 16785092;

define inline-only constant $key-ecu-sign = 16785568;

define inline-only constant $key-ediaeresis = 203;

define inline-only constant $key-egrave = 200;

define inline-only constant $key-ehook = 16785082;

define inline-only constant $key-eisu-shift = 65327;

define inline-only constant $key-eisu-toggle = 65328;

define inline-only constant $key-eject = 269025068;

define inline-only constant $key-emacron = 938;

define inline-only constant $key-end = 65367;

define inline-only constant $key-eogonek = 458;

define inline-only constant $key-escape = 65307;

define inline-only constant $key-etilde = 16785084;

define inline-only constant $key-euro-sign = 8364;

define inline-only constant $key-excel = 269025116;

define inline-only constant $key-execute = 65378;

define inline-only constant $key-explorer = 269025117;

define inline-only constant $key-f = 70;

define inline-only constant $key-f1 = 65470;

define inline-only constant $key-f10 = 65479;

define inline-only constant $key-f11 = 65480;

define inline-only constant $key-f12 = 65481;

define inline-only constant $key-f13 = 65482;

define inline-only constant $key-f14 = 65483;

define inline-only constant $key-f15 = 65484;

define inline-only constant $key-f16 = 65485;

define inline-only constant $key-f17 = 65486;

define inline-only constant $key-f18 = 65487;

define inline-only constant $key-f19 = 65488;

define inline-only constant $key-f2 = 65471;

define inline-only constant $key-f20 = 65489;

define inline-only constant $key-f21 = 65490;

define inline-only constant $key-f22 = 65491;

define inline-only constant $key-f23 = 65492;

define inline-only constant $key-f24 = 65493;

define inline-only constant $key-f25 = 65494;

define inline-only constant $key-f26 = 65495;

define inline-only constant $key-f27 = 65496;

define inline-only constant $key-f28 = 65497;

define inline-only constant $key-f29 = 65498;

define inline-only constant $key-f3 = 65472;

define inline-only constant $key-f30 = 65499;

define inline-only constant $key-f31 = 65500;

define inline-only constant $key-f32 = 65501;

define inline-only constant $key-f33 = 65502;

define inline-only constant $key-f34 = 65503;

define inline-only constant $key-f35 = 65504;

define inline-only constant $key-f4 = 65473;

define inline-only constant $key-f5 = 65474;

define inline-only constant $key-f6 = 65475;

define inline-only constant $key-f7 = 65476;

define inline-only constant $key-f8 = 65477;

define inline-only constant $key-f9 = 65478;

define inline-only constant $key-f-franc-sign = 16785571;

define inline-only constant $key-fabovedot = 16784926;

define inline-only constant $key-farsi-0 = 16778992;

define inline-only constant $key-farsi-1 = 16778993;

define inline-only constant $key-farsi-2 = 16778994;

define inline-only constant $key-farsi-3 = 16778995;

define inline-only constant $key-farsi-4 = 16778996;

define inline-only constant $key-farsi-5 = 16778997;

define inline-only constant $key-farsi-6 = 16778998;

define inline-only constant $key-farsi-7 = 16778999;

define inline-only constant $key-farsi-8 = 16779000;

define inline-only constant $key-farsi-9 = 16779001;

define inline-only constant $key-farsi-yeh = 16778956;

define inline-only constant $key-favorites = 269025072;

define inline-only constant $key-finance = 269025084;

define inline-only constant $key-find = 65384;

define inline-only constant $key-first-virtual-screen = 65232;

define inline-only constant $key-forward = 269025063;

define inline-only constant $key-frame-back = 269025181;

define inline-only constant $key-frame-forward = 269025182;

define inline-only constant $key-g = 71;

define inline-only constant $key-gabovedot = 725;

define inline-only constant $key-game = 269025118;

define inline-only constant $key-gbreve = 683;

define inline-only constant $key-gcaron = 16777702;

define inline-only constant $key-gcedilla = 939;

define inline-only constant $key-gcircumflex = 728;

define inline-only constant $key-georgian-an = 16781520;

define inline-only constant $key-georgian-ban = 16781521;

define inline-only constant $key-georgian-can = 16781546;

define inline-only constant $key-georgian-char = 16781549;

define inline-only constant $key-georgian-chin = 16781545;

define inline-only constant $key-georgian-cil = 16781548;

define inline-only constant $key-georgian-don = 16781523;

define inline-only constant $key-georgian-en = 16781524;

define inline-only constant $key-georgian-fi = 16781558;

define inline-only constant $key-georgian-gan = 16781522;

define inline-only constant $key-georgian-ghan = 16781542;

define inline-only constant $key-georgian-hae = 16781552;

define inline-only constant $key-georgian-har = 16781556;

define inline-only constant $key-georgian-he = 16781553;

define inline-only constant $key-georgian-hie = 16781554;

define inline-only constant $key-georgian-hoe = 16781557;

define inline-only constant $key-georgian-in = 16781528;

define inline-only constant $key-georgian-jhan = 16781551;

define inline-only constant $key-georgian-jil = 16781547;

define inline-only constant $key-georgian-kan = 16781529;

define inline-only constant $key-georgian-khar = 16781541;

define inline-only constant $key-georgian-las = 16781530;

define inline-only constant $key-georgian-man = 16781531;

define inline-only constant $key-georgian-nar = 16781532;

define inline-only constant $key-georgian-on = 16781533;

define inline-only constant $key-georgian-par = 16781534;

define inline-only constant $key-georgian-phar = 16781540;

define inline-only constant $key-georgian-qar = 16781543;

define inline-only constant $key-georgian-rae = 16781536;

define inline-only constant $key-georgian-san = 16781537;

define inline-only constant $key-georgian-shin = 16781544;

define inline-only constant $key-georgian-tan = 16781527;

define inline-only constant $key-georgian-tar = 16781538;

define inline-only constant $key-georgian-un = 16781539;

define inline-only constant $key-georgian-vin = 16781525;

define inline-only constant $key-georgian-we = 16781555;

define inline-only constant $key-georgian-xan = 16781550;

define inline-only constant $key-georgian-zen = 16781526;

define inline-only constant $key-georgian-zhar = 16781535;

define inline-only constant $key-go = 269025119;

define inline-only constant $key-greek-alpha = 1985;

define inline-only constant $key-greek-alph-aaccent = 1953;

define inline-only constant $key-greek-beta = 1986;

define inline-only constant $key-greek-chi = 2007;

define inline-only constant $key-greek-delta = 1988;

define inline-only constant $key-greek-epsilon = 1989;

define inline-only constant $key-greek-epsilo-naccent = 1954;

define inline-only constant $key-greek-eta = 1991;

define inline-only constant $key-greek-et-aaccent = 1955;

define inline-only constant $key-greek-gamma = 1987;

define inline-only constant $key-greek-iota = 1993;

define inline-only constant $key-greek-iot-aaccent = 1956;

define inline-only constant $key-greek-iot-adiaeresis = 1957;

define inline-only constant $key-greek-iot-adieresis = 1957;

define inline-only constant $key-greek-kappa = 1994;

define inline-only constant $key-greek-lambda = 1995;

define inline-only constant $key-greek-lamda = 1995;

define inline-only constant $key-greek-mu = 1996;

define inline-only constant $key-greek-nu = 1997;

define inline-only constant $key-greek-omega = 2009;

define inline-only constant $key-greek-omeg-aaccent = 1963;

define inline-only constant $key-greek-omicron = 1999;

define inline-only constant $key-greek-omicro-naccent = 1959;

define inline-only constant $key-greek-phi = 2006;

define inline-only constant $key-greek-pi = 2000;

define inline-only constant $key-greek-psi = 2008;

define inline-only constant $key-greek-rho = 2001;

define inline-only constant $key-greek-sigma = 2002;

define inline-only constant $key-greek-tau = 2004;

define inline-only constant $key-greek-theta = 1992;

define inline-only constant $key-greek-upsilon = 2005;

define inline-only constant $key-greek-upsilo-naccent = 1960;

define inline-only constant $key-greek-upsilo-ndieresis = 1961;

define inline-only constant $key-greek-xi = 1998;

define inline-only constant $key-greek-zeta = 1990;

define inline-only constant $key-greek-accentdieresis = 1966;

define inline-only constant $key-greek-alphaaccent = 1969;

define inline-only constant $key-greek-epsilonaccent = 1970;

define inline-only constant $key-greek-etaaccent = 1971;

define inline-only constant $key-greek-finalsmallsigma = 2035;

define inline-only constant $key-greek-horizbar = 1967;

define inline-only constant $key-greek-iotaaccent = 1972;

define inline-only constant $key-greek-iotaaccentdieresis = 1974;

define inline-only constant $key-greek-iotadieresis = 1973;

define inline-only constant $key-greek-omegaaccent = 1979;

define inline-only constant $key-greek-omicronaccent = 1975;

define inline-only constant $key-greek-switch = 65406;

define inline-only constant $key-greek-upsilonaccent = 1976;

define inline-only constant $key-greek-upsilonaccentdieresis = 1978;

define inline-only constant $key-greek-upsilondieresis = 1977;

define inline-only constant $key-green = 269025188;

define inline-only constant $key-h = 72;

define inline-only constant $key-hangul = 65329;

define inline-only constant $key-hangul-a = 3775;

define inline-only constant $key-hangul-ae = 3776;

define inline-only constant $key-hangul-arae-a = 3830;

define inline-only constant $key-hangul-arae-ae = 3831;

define inline-only constant $key-hangul-banja = 65337;

define inline-only constant $key-hangul-cieuc = 3770;

define inline-only constant $key-hangul-codeinput = 65335;

define inline-only constant $key-hangul-dikeud = 3751;

define inline-only constant $key-hangul-e = 3780;

define inline-only constant $key-hangul-eo = 3779;

define inline-only constant $key-hangul-eu = 3793;

define inline-only constant $key-hangul-end = 65331;

define inline-only constant $key-hangul-hanja = 65332;

define inline-only constant $key-hangul-hieuh = 3774;

define inline-only constant $key-hangul-i = 3795;

define inline-only constant $key-hangul-ieung = 3767;

define inline-only constant $key-hangul-j-cieuc = 3818;

define inline-only constant $key-hangul-j-dikeud = 3802;

define inline-only constant $key-hangul-j-hieuh = 3822;

define inline-only constant $key-hangul-j-ieung = 3816;

define inline-only constant $key-hangul-j-jieuj = 3817;

define inline-only constant $key-hangul-j-khieuq = 3819;

define inline-only constant $key-hangul-j-kiyeog = 3796;

define inline-only constant $key-hangul-j-kiyeog-sios = 3798;

define inline-only constant $key-hangul-j-kkogji-dalrin-ieung = 3833;

define inline-only constant $key-hangul-j-mieum = 3811;

define inline-only constant $key-hangul-j-nieun = 3799;

define inline-only constant $key-hangul-j-nieun-hieuh = 3801;

define inline-only constant $key-hangul-j-nieun-jieuj = 3800;

define inline-only constant $key-hangul-j-pan-sios = 3832;

define inline-only constant $key-hangul-j-phieuf = 3821;

define inline-only constant $key-hangul-j-pieub = 3812;

define inline-only constant $key-hangul-j-pieub-sios = 3813;

define inline-only constant $key-hangul-j-rieul = 3803;

define inline-only constant $key-hangul-j-rieul-hieuh = 3810;

define inline-only constant $key-hangul-j-rieul-kiyeog = 3804;

define inline-only constant $key-hangul-j-rieul-mieum = 3805;

define inline-only constant $key-hangul-j-rieul-phieuf = 3809;

define inline-only constant $key-hangul-j-rieul-pieub = 3806;

define inline-only constant $key-hangul-j-rieul-sios = 3807;

define inline-only constant $key-hangul-j-rieul-tieut = 3808;

define inline-only constant $key-hangul-j-sios = 3814;

define inline-only constant $key-hangul-j-ssang-kiyeog = 3797;

define inline-only constant $key-hangul-j-ssang-sios = 3815;

define inline-only constant $key-hangul-j-tieut = 3820;

define inline-only constant $key-hangul-j-yeorin-hieuh = 3834;

define inline-only constant $key-hangul-jamo = 65333;

define inline-only constant $key-hangul-jeonja = 65336;

define inline-only constant $key-hangul-jieuj = 3768;

define inline-only constant $key-hangul-khieuq = 3771;

define inline-only constant $key-hangul-kiyeog = 3745;

define inline-only constant $key-hangul-kiyeog-sios = 3747;

define inline-only constant $key-hangul-kkogji-dalrin-ieung = 3827;

define inline-only constant $key-hangul-mieum = 3761;

define inline-only constant $key-hangul-multiple-candidate = 65341;

define inline-only constant $key-hangul-nieun = 3748;

define inline-only constant $key-hangul-nieun-hieuh = 3750;

define inline-only constant $key-hangul-nieun-jieuj = 3749;

define inline-only constant $key-hangul-o = 3783;

define inline-only constant $key-hangul-oe = 3786;

define inline-only constant $key-hangul-pan-sios = 3826;

define inline-only constant $key-hangul-phieuf = 3773;

define inline-only constant $key-hangul-pieub = 3762;

define inline-only constant $key-hangul-pieub-sios = 3764;

define inline-only constant $key-hangul-post-hanja = 65339;

define inline-only constant $key-hangul-pre-hanja = 65338;

define inline-only constant $key-hangul-previous-candidate = 65342;

define inline-only constant $key-hangul-rieul = 3753;

define inline-only constant $key-hangul-rieul-hieuh = 3760;

define inline-only constant $key-hangul-rieul-kiyeog = 3754;

define inline-only constant $key-hangul-rieul-mieum = 3755;

define inline-only constant $key-hangul-rieul-phieuf = 3759;

define inline-only constant $key-hangul-rieul-pieub = 3756;

define inline-only constant $key-hangul-rieul-sios = 3757;

define inline-only constant $key-hangul-rieul-tieut = 3758;

define inline-only constant $key-hangul-rieul-yeorin-hieuh = 3823;

define inline-only constant $key-hangul-romaja = 65334;

define inline-only constant $key-hangul-single-candidate = 65340;

define inline-only constant $key-hangul-sios = 3765;

define inline-only constant $key-hangul-special = 65343;

define inline-only constant $key-hangul-ssang-dikeud = 3752;

define inline-only constant $key-hangul-ssang-jieuj = 3769;

define inline-only constant $key-hangul-ssang-kiyeog = 3746;

define inline-only constant $key-hangul-ssang-pieub = 3763;

define inline-only constant $key-hangul-ssang-sios = 3766;

define inline-only constant $key-hangul-start = 65330;

define inline-only constant $key-hangul-sunkyeongeum-mieum = 3824;

define inline-only constant $key-hangul-sunkyeongeum-phieuf = 3828;

define inline-only constant $key-hangul-sunkyeongeum-pieub = 3825;

define inline-only constant $key-hangul-tieut = 3772;

define inline-only constant $key-hangul-u = 3788;

define inline-only constant $key-hangul-wa = 3784;

define inline-only constant $key-hangul-wae = 3785;

define inline-only constant $key-hangul-we = 3790;

define inline-only constant $key-hangul-weo = 3789;

define inline-only constant $key-hangul-wi = 3791;

define inline-only constant $key-hangul-ya = 3777;

define inline-only constant $key-hangul-yae = 3778;

define inline-only constant $key-hangul-ye = 3782;

define inline-only constant $key-hangul-yeo = 3781;

define inline-only constant $key-hangul-yi = 3794;

define inline-only constant $key-hangul-yo = 3787;

define inline-only constant $key-hangul-yu = 3792;

define inline-only constant $key-hangul-yeorin-hieuh = 3829;

define inline-only constant $key-hangul-switch = 65406;

define inline-only constant $key-hankaku = 65321;

define inline-only constant $key-hcircumflex = 678;

define inline-only constant $key-hebrew-switch = 65406;

define inline-only constant $key-help = 65386;

define inline-only constant $key-henkan = 65315;

define inline-only constant $key-henkan-mode = 65315;

define inline-only constant $key-hibernate = 269025192;

define inline-only constant $key-hiragana = 65317;

define inline-only constant $key-hiragana-katakana = 65319;

define inline-only constant $key-history = 269025079;

define inline-only constant $key-home = 65360;

define inline-only constant $key-home-page = 269025048;

define inline-only constant $key-hot-links = 269025082;

define inline-only constant $key-hstroke = 673;

define inline-only constant $key-hyper-l = 65517;

define inline-only constant $key-hyper-r = 65518;

define inline-only constant $key-i = 73;

define inline-only constant $key-iso-center-object = 65075;

define inline-only constant $key-iso-continuous-underline = 65072;

define inline-only constant $key-iso-discontinuous-underline = 65073;

define inline-only constant $key-iso-emphasize = 65074;

define inline-only constant $key-iso-enter = 65076;

define inline-only constant $key-iso-fast-cursor-down = 65071;

define inline-only constant $key-iso-fast-cursor-left = 65068;

define inline-only constant $key-iso-fast-cursor-right = 65069;

define inline-only constant $key-iso-fast-cursor-up = 65070;

define inline-only constant $key-iso-first-group = 65036;

define inline-only constant $key-iso-first-group-lock = 65037;

define inline-only constant $key-iso-group-latch = 65030;

define inline-only constant $key-iso-group-lock = 65031;

define inline-only constant $key-iso-group-shift = 65406;

define inline-only constant $key-iso-last-group = 65038;

define inline-only constant $key-iso-last-group-lock = 65039;

define inline-only constant $key-iso-left-tab = 65056;

define inline-only constant $key-iso-level2-latch = 65026;

define inline-only constant $key-iso-level3-latch = 65028;

define inline-only constant $key-iso-level3-lock = 65029;

define inline-only constant $key-iso-level3-shift = 65027;

define inline-only constant $key-iso-level5-latch = 65042;

define inline-only constant $key-iso-level5-lock = 65043;

define inline-only constant $key-iso-level5-shift = 65041;

define inline-only constant $key-iso-lock = 65025;

define inline-only constant $key-iso-move-line-down = 65058;

define inline-only constant $key-iso-move-line-up = 65057;

define inline-only constant $key-iso-next-group = 65032;

define inline-only constant $key-iso-next-group-lock = 65033;

define inline-only constant $key-iso-partial-line-down = 65060;

define inline-only constant $key-iso-partial-line-up = 65059;

define inline-only constant $key-iso-partial-space-left = 65061;

define inline-only constant $key-iso-partial-space-right = 65062;

define inline-only constant $key-iso-prev-group = 65034;

define inline-only constant $key-iso-prev-group-lock = 65035;

define inline-only constant $key-iso-release-both-margins = 65067;

define inline-only constant $key-iso-release-margin-left = 65065;

define inline-only constant $key-iso-release-margin-right = 65066;

define inline-only constant $key-iso-set-margin-left = 65063;

define inline-only constant $key-iso-set-margin-right = 65064;

define inline-only constant $key-iabovedot = 681;

define inline-only constant $key-iacute = 205;

define inline-only constant $key-ibelowdot = 16785098;

define inline-only constant $key-ibreve = 16777516;

define inline-only constant $key-icircumflex = 206;

define inline-only constant $key-idiaeresis = 207;

define inline-only constant $key-igrave = 204;

define inline-only constant $key-ihook = 16785096;

define inline-only constant $key-imacron = 975;

define inline-only constant $key-insert = 65379;

define inline-only constant $key-iogonek = 967;

define inline-only constant $key-itilde = 933;

define inline-only constant $key-j = 74;

define inline-only constant $key-jcircumflex = 684;

define inline-only constant $key-k = 75;

define inline-only constant $key-kp-0 = 65456;

define inline-only constant $key-kp-1 = 65457;

define inline-only constant $key-kp-2 = 65458;

define inline-only constant $key-kp-3 = 65459;

define inline-only constant $key-kp-4 = 65460;

define inline-only constant $key-kp-5 = 65461;

define inline-only constant $key-kp-6 = 65462;

define inline-only constant $key-kp-7 = 65463;

define inline-only constant $key-kp-8 = 65464;

define inline-only constant $key-kp-9 = 65465;

define inline-only constant $key-kp-add = 65451;

define inline-only constant $key-kp-begin = 65437;

define inline-only constant $key-kp-decimal = 65454;

define inline-only constant $key-kp-delete = 65439;

define inline-only constant $key-kp-divide = 65455;

define inline-only constant $key-kp-down = 65433;

define inline-only constant $key-kp-end = 65436;

define inline-only constant $key-kp-enter = 65421;

define inline-only constant $key-kp-equal = 65469;

define inline-only constant $key-kp-f1 = 65425;

define inline-only constant $key-kp-f2 = 65426;

define inline-only constant $key-kp-f3 = 65427;

define inline-only constant $key-kp-f4 = 65428;

define inline-only constant $key-kp-home = 65429;

define inline-only constant $key-kp-insert = 65438;

define inline-only constant $key-kp-left = 65430;

define inline-only constant $key-kp-multiply = 65450;

define inline-only constant $key-kp-next = 65435;

define inline-only constant $key-kp-page-down = 65435;

define inline-only constant $key-kp-page-up = 65434;

define inline-only constant $key-kp-prior = 65434;

define inline-only constant $key-kp-right = 65432;

define inline-only constant $key-kp-separator = 65452;

define inline-only constant $key-kp-space = 65408;

define inline-only constant $key-kp-subtract = 65453;

define inline-only constant $key-kp-tab = 65417;

define inline-only constant $key-kp-up = 65431;

define inline-only constant $key-kana-lock = 65325;

define inline-only constant $key-kana-shift = 65326;

define inline-only constant $key-kanji = 65313;

define inline-only constant $key-kanji-bangou = 65335;

define inline-only constant $key-katakana = 65318;

define inline-only constant $key-kbd-brightness-down = 269025030;

define inline-only constant $key-kbd-brightness-up = 269025029;

define inline-only constant $key-kbd-light-on-off = 269025028;

define inline-only constant $key-kcedilla = 979;

define inline-only constant $key-keyboard = 269025203;

define inline-only constant $key-korean-won = 3839;

define inline-only constant $key-l = 76;

define inline-only constant $key-l1 = 65480;

define inline-only constant $key-l10 = 65489;

define inline-only constant $key-l2 = 65481;

define inline-only constant $key-l3 = 65482;

define inline-only constant $key-l4 = 65483;

define inline-only constant $key-l5 = 65484;

define inline-only constant $key-l6 = 65485;

define inline-only constant $key-l7 = 65486;

define inline-only constant $key-l8 = 65487;

define inline-only constant $key-l9 = 65488;

define inline-only constant $key-lacute = 453;

define inline-only constant $key-last-virtual-screen = 65236;

define inline-only constant $key-launch0 = 269025088;

define inline-only constant $key-launch1 = 269025089;

define inline-only constant $key-launch2 = 269025090;

define inline-only constant $key-launch3 = 269025091;

define inline-only constant $key-launch4 = 269025092;

define inline-only constant $key-launch5 = 269025093;

define inline-only constant $key-launch6 = 269025094;

define inline-only constant $key-launch7 = 269025095;

define inline-only constant $key-launch8 = 269025096;

define inline-only constant $key-launch9 = 269025097;

define inline-only constant $key-launch-a = 269025098;

define inline-only constant $key-launch-b = 269025099;

define inline-only constant $key-launch-c = 269025100;

define inline-only constant $key-launch-d = 269025101;

define inline-only constant $key-launch-e = 269025102;

define inline-only constant $key-launch-f = 269025103;

define inline-only constant $key-lbelowdot = 16784950;

define inline-only constant $key-lcaron = 421;

define inline-only constant $key-lcedilla = 934;

define inline-only constant $key-left = 65361;

define inline-only constant $key-light-bulb = 269025077;

define inline-only constant $key-linefeed = 65290;

define inline-only constant $key-lira-sign = 16785572;

define inline-only constant $key-log-grab-info = 269024805;

define inline-only constant $key-log-off = 269025121;

define inline-only constant $key-log-window-tree = 269024804;

define inline-only constant $key-lstroke = 419;

define inline-only constant $key-m = 77;

define inline-only constant $key-mabovedot = 16784960;

define inline-only constant $key-macedonia-dse = 1717;

define inline-only constant $key-macedonia-gje = 1714;

define inline-only constant $key-macedonia-kje = 1724;

define inline-only constant $key-mae-koho = 65342;

define inline-only constant $key-mail = 269025049;

define inline-only constant $key-mail-forward = 269025168;

define inline-only constant $key-market = 269025122;

define inline-only constant $key-massyo = 65324;

define inline-only constant $key-meeting = 269025123;

define inline-only constant $key-memo = 269025054;

define inline-only constant $key-menu = 65383;

define inline-only constant $key-menu-kb = 269025125;

define inline-only constant $key-menu-pb = 269025126;

define inline-only constant $key-messenger = 269025166;

define inline-only constant $key-meta-l = 65511;

define inline-only constant $key-meta-r = 65512;

define inline-only constant $key-mill-sign = 16785573;

define inline-only constant $key-mode-lock = 269025025;

define inline-only constant $key-mode-switch = 65406;

define inline-only constant $key-mon-brightness-down = 269025027;

define inline-only constant $key-mon-brightness-up = 269025026;

define inline-only constant $key-mouse-keys-accel-enable = 65143;

define inline-only constant $key-mouse-keys-enable = 65142;

define inline-only constant $key-muhenkan = 65314;

define inline-only constant $key-multi-key = 65312;

define inline-only constant $key-multiple-candidate = 65341;

define inline-only constant $key-music = 269025170;

define inline-only constant $key-my-computer = 269025075;

define inline-only constant $key-my-sites = 269025127;

define inline-only constant $key-n = 78;

define inline-only constant $key-nacute = 465;

define inline-only constant $key-naira-sign = 16785574;

define inline-only constant $key-ncaron = 466;

define inline-only constant $key-ncedilla = 977;

define inline-only constant $key-new = 269025128;

define inline-only constant $key-new-sheqel-sign = 16785578;

define inline-only constant $key-news = 269025129;

define inline-only constant $key-next = 65366;

define inline-only constant $key-next-v-mode = 269024802;

define inline-only constant $key-next-virtual-screen = 65234;

define inline-only constant $key-ntilde = 209;

define inline-only constant $key-num-lock = 65407;

define inline-only constant $key-o = 79;

define inline-only constant $key-oe = 5052;

define inline-only constant $key-oacute = 211;

define inline-only constant $key-obarred = 16777631;

define inline-only constant $key-obelowdot = 16785100;

define inline-only constant $key-ocaron = 16777681;

define inline-only constant $key-ocircumflex = 212;

define inline-only constant $key-ocircumflexacute = 16785104;

define inline-only constant $key-ocircumflexbelowdot = 16785112;

define inline-only constant $key-ocircumflexgrave = 16785106;

define inline-only constant $key-ocircumflexhook = 16785108;

define inline-only constant $key-ocircumflextilde = 16785110;

define inline-only constant $key-odiaeresis = 214;

define inline-only constant $key-odoubleacute = 469;

define inline-only constant $key-office-home = 269025130;

define inline-only constant $key-ograve = 210;

define inline-only constant $key-ohook = 16785102;

define inline-only constant $key-ohorn = 16777632;

define inline-only constant $key-ohornacute = 16785114;

define inline-only constant $key-ohornbelowdot = 16785122;

define inline-only constant $key-ohorngrave = 16785116;

define inline-only constant $key-ohornhook = 16785118;

define inline-only constant $key-ohorntilde = 16785120;

define inline-only constant $key-omacron = 978;

define inline-only constant $key-ooblique = 216;

define inline-only constant $key-open = 269025131;

define inline-only constant $key-open-url = 269025080;

define inline-only constant $key-option = 269025132;

define inline-only constant $key-oslash = 216;

define inline-only constant $key-otilde = 213;

define inline-only constant $key-overlay1-enable = 65144;

define inline-only constant $key-overlay2-enable = 65145;

define inline-only constant $key-p = 80;

define inline-only constant $key-pabovedot = 16784982;

define inline-only constant $key-page-down = 65366;

define inline-only constant $key-page-up = 65365;

define inline-only constant $key-paste = 269025133;

define inline-only constant $key-pause = 65299;

define inline-only constant $key-peseta-sign = 16785575;

define inline-only constant $key-phone = 269025134;

define inline-only constant $key-pictures = 269025169;

define inline-only constant $key-pointer-accelerate = 65274;

define inline-only constant $key-pointer-button1 = 65257;

define inline-only constant $key-pointer-button2 = 65258;

define inline-only constant $key-pointer-button3 = 65259;

define inline-only constant $key-pointer-button4 = 65260;

define inline-only constant $key-pointer-button5 = 65261;

define inline-only constant $key-pointer-button-dflt = 65256;

define inline-only constant $key-pointer-dbl-click1 = 65263;

define inline-only constant $key-pointer-dbl-click2 = 65264;

define inline-only constant $key-pointer-dbl-click3 = 65265;

define inline-only constant $key-pointer-dbl-click4 = 65266;

define inline-only constant $key-pointer-dbl-click5 = 65267;

define inline-only constant $key-pointer-dbl-click-dflt = 65262;

define inline-only constant $key-pointer-dflt-btn-next = 65275;

define inline-only constant $key-pointer-dflt-btn-prev = 65276;

define inline-only constant $key-pointer-down = 65251;

define inline-only constant $key-pointer-down-left = 65254;

define inline-only constant $key-pointer-down-right = 65255;

define inline-only constant $key-pointer-drag1 = 65269;

define inline-only constant $key-pointer-drag2 = 65270;

define inline-only constant $key-pointer-drag3 = 65271;

define inline-only constant $key-pointer-drag4 = 65272;

define inline-only constant $key-pointer-drag5 = 65277;

define inline-only constant $key-pointer-drag-dflt = 65268;

define inline-only constant $key-pointer-enable-keys = 65273;

define inline-only constant $key-pointer-left = 65248;

define inline-only constant $key-pointer-right = 65249;

define inline-only constant $key-pointer-up = 65250;

define inline-only constant $key-pointer-up-left = 65252;

define inline-only constant $key-pointer-up-right = 65253;

define inline-only constant $key-power-down = 269025057;

define inline-only constant $key-power-off = 269025066;

define inline-only constant $key-prev-v-mode = 269024803;

define inline-only constant $key-prev-virtual-screen = 65233;

define inline-only constant $key-previous-candidate = 65342;

define inline-only constant $key-print = 65377;

define inline-only constant $key-prior = 65365;

define inline-only constant $key-q = 81;

define inline-only constant $key-r = 82;

define inline-only constant $key-r1 = 65490;

define inline-only constant $key-r10 = 65499;

define inline-only constant $key-r11 = 65500;

define inline-only constant $key-r12 = 65501;

define inline-only constant $key-r13 = 65502;

define inline-only constant $key-r14 = 65503;

define inline-only constant $key-r15 = 65504;

define inline-only constant $key-r2 = 65491;

define inline-only constant $key-r3 = 65492;

define inline-only constant $key-r4 = 65493;

define inline-only constant $key-r5 = 65494;

define inline-only constant $key-r6 = 65495;

define inline-only constant $key-r7 = 65496;

define inline-only constant $key-r8 = 65497;

define inline-only constant $key-r9 = 65498;

define inline-only constant $key-rf-kill = 269025205;

define inline-only constant $key-racute = 448;

define inline-only constant $key-rcaron = 472;

define inline-only constant $key-rcedilla = 931;

define inline-only constant $key-red = 269025187;

define inline-only constant $key-redo = 65382;

define inline-only constant $key-refresh = 269025065;

define inline-only constant $key-reload = 269025139;

define inline-only constant $key-repeat-keys-enable = 65138;

define inline-only constant $key-reply = 269025138;

define inline-only constant $key-return = 65293;

define inline-only constant $key-right = 65363;

define inline-only constant $key-rocker-down = 269025060;

define inline-only constant $key-rocker-enter = 269025061;

define inline-only constant $key-rocker-up = 269025059;

define inline-only constant $key-romaji = 65316;

define inline-only constant $key-rotate-windows = 269025140;

define inline-only constant $key-rotation-kb = 269025142;

define inline-only constant $key-rotation-pb = 269025141;

define inline-only constant $key-rupee-sign = 16785576;

define inline-only constant $key-s = 83;

define inline-only constant $key-schwa = 16777615;

define inline-only constant $key-sabovedot = 16784992;

define inline-only constant $key-sacute = 422;

define inline-only constant $key-save = 269025143;

define inline-only constant $key-scaron = 425;

define inline-only constant $key-scedilla = 426;

define inline-only constant $key-scircumflex = 734;

define inline-only constant $key-screen-saver = 269025069;

define inline-only constant $key-scroll-click = 269025146;

define inline-only constant $key-scroll-down = 269025145;

define inline-only constant $key-scroll-up = 269025144;

define inline-only constant $key-scroll-lock = 65300;

define inline-only constant $key-search = 269025051;

define inline-only constant $key-select = 65376;

define inline-only constant $key-select-button = 269025184;

define inline-only constant $key-send = 269025147;

define inline-only constant $key-serbian-dje = 1713;

define inline-only constant $key-serbian-dze = 1727;

define inline-only constant $key-serbian-je = 1720;

define inline-only constant $key-serbian-lje = 1721;

define inline-only constant $key-serbian-nje = 1722;

define inline-only constant $key-serbian-tshe = 1723;

define inline-only constant $key-shift-l = 65505;

define inline-only constant $key-shift-lock = 65510;

define inline-only constant $key-shift-r = 65506;

define inline-only constant $key-shop = 269025078;

define inline-only constant $key-single-candidate = 65340;

define inline-only constant $key-sinh-a = 16780677;

define inline-only constant $key-sinh-aa = 16780678;

define inline-only constant $key-sinh-aa2 = 16780751;

define inline-only constant $key-sinh-ae = 16780679;

define inline-only constant $key-sinh-ae2 = 16780752;

define inline-only constant $key-sinh-aee = 16780680;

define inline-only constant $key-sinh-aee2 = 16780753;

define inline-only constant $key-sinh-ai = 16780691;

define inline-only constant $key-sinh-ai2 = 16780763;

define inline-only constant $key-sinh-al = 16780746;

define inline-only constant $key-sinh-au = 16780694;

define inline-only constant $key-sinh-au2 = 16780766;

define inline-only constant $key-sinh-ba = 16780726;

define inline-only constant $key-sinh-bha = 16780727;

define inline-only constant $key-sinh-ca = 16780704;

define inline-only constant $key-sinh-cha = 16780705;

define inline-only constant $key-sinh-dda = 16780713;

define inline-only constant $key-sinh-ddha = 16780714;

define inline-only constant $key-sinh-dha = 16780719;

define inline-only constant $key-sinh-dhha = 16780720;

define inline-only constant $key-sinh-e = 16780689;

define inline-only constant $key-sinh-e2 = 16780761;

define inline-only constant $key-sinh-ee = 16780690;

define inline-only constant $key-sinh-ee2 = 16780762;

define inline-only constant $key-sinh-fa = 16780742;

define inline-only constant $key-sinh-ga = 16780700;

define inline-only constant $key-sinh-gha = 16780701;

define inline-only constant $key-sinh-h2 = 16780675;

define inline-only constant $key-sinh-ha = 16780740;

define inline-only constant $key-sinh-i = 16780681;

define inline-only constant $key-sinh-i2 = 16780754;

define inline-only constant $key-sinh-ii = 16780682;

define inline-only constant $key-sinh-ii2 = 16780755;

define inline-only constant $key-sinh-ja = 16780706;

define inline-only constant $key-sinh-jha = 16780707;

define inline-only constant $key-sinh-jnya = 16780709;

define inline-only constant $key-sinh-ka = 16780698;

define inline-only constant $key-sinh-kha = 16780699;

define inline-only constant $key-sinh-kunddaliya = 16780788;

define inline-only constant $key-sinh-la = 16780733;

define inline-only constant $key-sinh-lla = 16780741;

define inline-only constant $key-sinh-lu = 16780687;

define inline-only constant $key-sinh-lu2 = 16780767;

define inline-only constant $key-sinh-luu = 16780688;

define inline-only constant $key-sinh-luu2 = 16780787;

define inline-only constant $key-sinh-ma = 16780728;

define inline-only constant $key-sinh-mba = 16780729;

define inline-only constant $key-sinh-na = 16780721;

define inline-only constant $key-sinh-ndda = 16780716;

define inline-only constant $key-sinh-ndha = 16780723;

define inline-only constant $key-sinh-ng = 16780674;

define inline-only constant $key-sinh-ng2 = 16780702;

define inline-only constant $key-sinh-nga = 16780703;

define inline-only constant $key-sinh-nja = 16780710;

define inline-only constant $key-sinh-nna = 16780715;

define inline-only constant $key-sinh-nya = 16780708;

define inline-only constant $key-sinh-o = 16780692;

define inline-only constant $key-sinh-o2 = 16780764;

define inline-only constant $key-sinh-oo = 16780693;

define inline-only constant $key-sinh-oo2 = 16780765;

define inline-only constant $key-sinh-pa = 16780724;

define inline-only constant $key-sinh-pha = 16780725;

define inline-only constant $key-sinh-ra = 16780731;

define inline-only constant $key-sinh-ri = 16780685;

define inline-only constant $key-sinh-rii = 16780686;

define inline-only constant $key-sinh-ru2 = 16780760;

define inline-only constant $key-sinh-ruu2 = 16780786;

define inline-only constant $key-sinh-sa = 16780739;

define inline-only constant $key-sinh-sha = 16780737;

define inline-only constant $key-sinh-ssha = 16780738;

define inline-only constant $key-sinh-tha = 16780717;

define inline-only constant $key-sinh-thha = 16780718;

define inline-only constant $key-sinh-tta = 16780711;

define inline-only constant $key-sinh-ttha = 16780712;

define inline-only constant $key-sinh-u = 16780683;

define inline-only constant $key-sinh-u2 = 16780756;

define inline-only constant $key-sinh-uu = 16780684;

define inline-only constant $key-sinh-uu2 = 16780758;

define inline-only constant $key-sinh-va = 16780736;

define inline-only constant $key-sinh-ya = 16780730;

define inline-only constant $key-sleep = 269025071;

define inline-only constant $key-slow-keys-enable = 65139;

define inline-only constant $key-spell = 269025148;

define inline-only constant $key-split-screen = 269025149;

define inline-only constant $key-standby = 269025040;

define inline-only constant $key-start = 269025050;

define inline-only constant $key-sticky-keys-enable = 65141;

define inline-only constant $key-stop = 269025064;

define inline-only constant $key-subtitle = 269025178;

define inline-only constant $key-super-l = 65515;

define inline-only constant $key-super-r = 65516;

define inline-only constant $key-support = 269025150;

define inline-only constant $key-suspend = 269025191;

define inline-only constant $key-switch-vt-1 = 269024769;

define inline-only constant $key-switch-vt-10 = 269024778;

define inline-only constant $key-switch-vt-11 = 269024779;

define inline-only constant $key-switch-vt-12 = 269024780;

define inline-only constant $key-switch-vt-2 = 269024770;

define inline-only constant $key-switch-vt-3 = 269024771;

define inline-only constant $key-switch-vt-4 = 269024772;

define inline-only constant $key-switch-vt-5 = 269024773;

define inline-only constant $key-switch-vt-6 = 269024774;

define inline-only constant $key-switch-vt-7 = 269024775;

define inline-only constant $key-switch-vt-8 = 269024776;

define inline-only constant $key-switch-vt-9 = 269024777;

define inline-only constant $key-sys-req = 65301;

define inline-only constant $key-t = 84;

define inline-only constant $key-thorn = 222;

define inline-only constant $key-tab = 65289;

define inline-only constant $key-tabovedot = 16785002;

define inline-only constant $key-task-pane = 269025151;

define inline-only constant $key-tcaron = 427;

define inline-only constant $key-tcedilla = 478;

define inline-only constant $key-terminal = 269025152;

define inline-only constant $key-terminate-server = 65237;

define inline-only constant $key-thai-baht = 3551;

define inline-only constant $key-thai-bobaimai = 3514;

define inline-only constant $key-thai-chochan = 3496;

define inline-only constant $key-thai-chochang = 3498;

define inline-only constant $key-thai-choching = 3497;

define inline-only constant $key-thai-chochoe = 3500;

define inline-only constant $key-thai-dochada = 3502;

define inline-only constant $key-thai-dodek = 3508;

define inline-only constant $key-thai-fofa = 3517;

define inline-only constant $key-thai-fofan = 3519;

define inline-only constant $key-thai-hohip = 3531;

define inline-only constant $key-thai-honokhuk = 3534;

define inline-only constant $key-thai-khokhai = 3490;

define inline-only constant $key-thai-khokhon = 3493;

define inline-only constant $key-thai-khokhuat = 3491;

define inline-only constant $key-thai-khokhwai = 3492;

define inline-only constant $key-thai-khorakhang = 3494;

define inline-only constant $key-thai-kokai = 3489;

define inline-only constant $key-thai-lakkhangyao = 3557;

define inline-only constant $key-thai-lekchet = 3575;

define inline-only constant $key-thai-lekha = 3573;

define inline-only constant $key-thai-lekhok = 3574;

define inline-only constant $key-thai-lekkao = 3577;

define inline-only constant $key-thai-leknung = 3569;

define inline-only constant $key-thai-lekpaet = 3576;

define inline-only constant $key-thai-leksam = 3571;

define inline-only constant $key-thai-leksi = 3572;

define inline-only constant $key-thai-leksong = 3570;

define inline-only constant $key-thai-leksun = 3568;

define inline-only constant $key-thai-lochula = 3532;

define inline-only constant $key-thai-loling = 3525;

define inline-only constant $key-thai-lu = 3526;

define inline-only constant $key-thai-maichattawa = 3563;

define inline-only constant $key-thai-maiek = 3560;

define inline-only constant $key-thai-maihanakat = 3537;

define inline-only constant $key-thai-maihanakat-maitho = 3550;

define inline-only constant $key-thai-maitaikhu = 3559;

define inline-only constant $key-thai-maitho = 3561;

define inline-only constant $key-thai-maitri = 3562;

define inline-only constant $key-thai-maiyamok = 3558;

define inline-only constant $key-thai-moma = 3521;

define inline-only constant $key-thai-ngongu = 3495;

define inline-only constant $key-thai-nikhahit = 3565;

define inline-only constant $key-thai-nonen = 3507;

define inline-only constant $key-thai-nonu = 3513;

define inline-only constant $key-thai-oang = 3533;

define inline-only constant $key-thai-paiyannoi = 3535;

define inline-only constant $key-thai-phinthu = 3546;

define inline-only constant $key-thai-phophan = 3518;

define inline-only constant $key-thai-phophung = 3516;

define inline-only constant $key-thai-phosamphao = 3520;

define inline-only constant $key-thai-popla = 3515;

define inline-only constant $key-thai-rorua = 3523;

define inline-only constant $key-thai-ru = 3524;

define inline-only constant $key-thai-saraa = 3536;

define inline-only constant $key-thai-saraaa = 3538;

define inline-only constant $key-thai-saraae = 3553;

define inline-only constant $key-thai-saraaimaimalai = 3556;

define inline-only constant $key-thai-saraaimaimuan = 3555;

define inline-only constant $key-thai-saraam = 3539;

define inline-only constant $key-thai-sarae = 3552;

define inline-only constant $key-thai-sarai = 3540;

define inline-only constant $key-thai-saraii = 3541;

define inline-only constant $key-thai-sarao = 3554;

define inline-only constant $key-thai-sarau = 3544;

define inline-only constant $key-thai-saraue = 3542;

define inline-only constant $key-thai-sarauee = 3543;

define inline-only constant $key-thai-sarauu = 3545;

define inline-only constant $key-thai-sorusi = 3529;

define inline-only constant $key-thai-sosala = 3528;

define inline-only constant $key-thai-soso = 3499;

define inline-only constant $key-thai-sosua = 3530;

define inline-only constant $key-thai-thanthakhat = 3564;

define inline-only constant $key-thai-thonangmontho = 3505;

define inline-only constant $key-thai-thophuthao = 3506;

define inline-only constant $key-thai-thothahan = 3511;

define inline-only constant $key-thai-thothan = 3504;

define inline-only constant $key-thai-thothong = 3512;

define inline-only constant $key-thai-thothung = 3510;

define inline-only constant $key-thai-topatak = 3503;

define inline-only constant $key-thai-totao = 3509;

define inline-only constant $key-thai-wowaen = 3527;

define inline-only constant $key-thai-yoyak = 3522;

define inline-only constant $key-thai-yoying = 3501;

define inline-only constant $key-time = 269025183;

define inline-only constant $key-to-do-list = 269025055;

define inline-only constant $key-tools = 269025153;

define inline-only constant $key-top-menu = 269025186;

define inline-only constant $key-touchpad-off = 269025201;

define inline-only constant $key-touchpad-on = 269025200;

define inline-only constant $key-touchpad-toggle = 269025193;

define inline-only constant $key-touroku = 65323;

define inline-only constant $key-travel = 269025154;

define inline-only constant $key-tslash = 940;

define inline-only constant $key-u = 85;

define inline-only constant $key-uwb = 269025174;

define inline-only constant $key-uacute = 218;

define inline-only constant $key-ubelowdot = 16785124;

define inline-only constant $key-ubreve = 733;

define inline-only constant $key-ucircumflex = 219;

define inline-only constant $key-udiaeresis = 220;

define inline-only constant $key-udoubleacute = 475;

define inline-only constant $key-ugrave = 217;

define inline-only constant $key-uhook = 16785126;

define inline-only constant $key-uhorn = 16777647;

define inline-only constant $key-uhornacute = 16785128;

define inline-only constant $key-uhornbelowdot = 16785136;

define inline-only constant $key-uhorngrave = 16785130;

define inline-only constant $key-uhornhook = 16785132;

define inline-only constant $key-uhorntilde = 16785134;

define inline-only constant $key-ukrainian-ghe-with-upturn = 1725;

define inline-only constant $key-ukrainian-i = 1718;

define inline-only constant $key-ukrainian-ie = 1716;

define inline-only constant $key-ukrainian-yi = 1719;

define inline-only constant $key-ukranian-i = 1718;

define inline-only constant $key-ukranian-je = 1716;

define inline-only constant $key-ukranian-yi = 1719;

define inline-only constant $key-umacron = 990;

define inline-only constant $key-undo = 65381;

define inline-only constant $key-ungrab = 269024800;

define inline-only constant $key-uogonek = 985;

define inline-only constant $key-up = 65362;

define inline-only constant $key-uring = 473;

define inline-only constant $key-user1kb = 269025157;

define inline-only constant $key-user2kb = 269025158;

define inline-only constant $key-user-pb = 269025156;

define inline-only constant $key-utilde = 989;

define inline-only constant $key-v = 86;

define inline-only constant $key-vendor-home = 269025076;

define inline-only constant $key-video = 269025159;

define inline-only constant $key-view = 269025185;

define inline-only constant $key-void-symbol = 16777215;

define inline-only constant $key-w = 87;

define inline-only constant $key-wlan = 269025173;

define inline-only constant $key-wwan = 269025204;

define inline-only constant $key-www = 269025070;

define inline-only constant $key-wacute = 16785026;

define inline-only constant $key-wake-up = 269025067;

define inline-only constant $key-wcircumflex = 16777588;

define inline-only constant $key-wdiaeresis = 16785028;

define inline-only constant $key-web-cam = 269025167;

define inline-only constant $key-wgrave = 16785024;

define inline-only constant $key-wheel-button = 269025160;

define inline-only constant $key-window-clear = 269025109;

define inline-only constant $key-won-sign = 16785577;

define inline-only constant $key-word = 269025161;

define inline-only constant $key-x = 88;

define inline-only constant $key-xabovedot = 16785034;

define inline-only constant $key-xfer = 269025162;

define inline-only constant $key-y = 89;

define inline-only constant $key-yacute = 221;

define inline-only constant $key-ybelowdot = 16785140;

define inline-only constant $key-ycircumflex = 16777590;

define inline-only constant $key-ydiaeresis = 5054;

define inline-only constant $key-yellow = 269025189;

define inline-only constant $key-ygrave = 16785138;

define inline-only constant $key-yhook = 16785142;

define inline-only constant $key-ytilde = 16785144;

define inline-only constant $key-z = 90;

define inline-only constant $key-zabovedot = 431;

define inline-only constant $key-zacute = 428;

define inline-only constant $key-zcaron = 430;

define inline-only constant $key-zen-koho = 65341;

define inline-only constant $key-zenkaku = 65320;

define inline-only constant $key-zenkaku-hankaku = 65322;

define inline-only constant $key-zoom-in = 269025163;

define inline-only constant $key-zoom-out = 269025164;

define inline-only constant $key-zstroke = 16777653;

define inline-only constant $key-abovedot = 511;

define inline-only constant $key-acute = 180;

define inline-only constant $key-ampersand = 38;

define inline-only constant $key-apostrophe = 39;

define inline-only constant $key-approxeq = 16785992;

define inline-only constant $key-approximate = 2248;

define inline-only constant $key-asciicircum = 94;

define inline-only constant $key-asciitilde = 126;

define inline-only constant $key-asterisk = 42;

define inline-only constant $key-at = 64;

define inline-only constant $key-backslash = 92;

define inline-only constant $key-ballotcross = 2804;

define inline-only constant $key-bar = 124;

define inline-only constant $key-because = 16785973;

define inline-only constant $key-blank = 2527;

define inline-only constant $key-botintegral = 2213;

define inline-only constant $key-botleftparens = 2220;

define inline-only constant $key-botleftsqbracket = 2216;

define inline-only constant $key-botleftsummation = 2226;

define inline-only constant $key-botrightparens = 2222;

define inline-only constant $key-botrightsqbracket = 2218;

define inline-only constant $key-botrightsummation = 2230;

define inline-only constant $key-bott = 2550;

define inline-only constant $key-botvertsummationconnector = 2228;

define inline-only constant $key-braceleft = 123;

define inline-only constant $key-braceright = 125;

define inline-only constant $key-bracketleft = 91;

define inline-only constant $key-bracketright = 93;

define inline-only constant $key-braille-blank = 16787456;

define inline-only constant $key-braille-dot-1 = 65521;

define inline-only constant $key-braille-dot-10 = 65530;

define inline-only constant $key-braille-dot-2 = 65522;

define inline-only constant $key-braille-dot-3 = 65523;

define inline-only constant $key-braille-dot-4 = 65524;

define inline-only constant $key-braille-dot-5 = 65525;

define inline-only constant $key-braille-dot-6 = 65526;

define inline-only constant $key-braille-dot-7 = 65527;

define inline-only constant $key-braille-dot-8 = 65528;

define inline-only constant $key-braille-dot-9 = 65529;

define inline-only constant $key-braille-dots-1 = 16787457;

define inline-only constant $key-braille-dots-12 = 16787459;

define inline-only constant $key-braille-dots-123 = 16787463;

define inline-only constant $key-braille-dots-1234 = 16787471;

define inline-only constant $key-braille-dots-12345 = 16787487;

define inline-only constant $key-braille-dots-123456 = 16787519;

define inline-only constant $key-braille-dots-1234567 = 16787583;

define inline-only constant $key-braille-dots-12345678 = 16787711;

define inline-only constant $key-braille-dots-1234568 = 16787647;

define inline-only constant $key-braille-dots-123457 = 16787551;

define inline-only constant $key-braille-dots-1234578 = 16787679;

define inline-only constant $key-braille-dots-123458 = 16787615;

define inline-only constant $key-braille-dots-12346 = 16787503;

define inline-only constant $key-braille-dots-123467 = 16787567;

define inline-only constant $key-braille-dots-1234678 = 16787695;

define inline-only constant $key-braille-dots-123468 = 16787631;

define inline-only constant $key-braille-dots-12347 = 16787535;

define inline-only constant $key-braille-dots-123478 = 16787663;

define inline-only constant $key-braille-dots-12348 = 16787599;

define inline-only constant $key-braille-dots-1235 = 16787479;

define inline-only constant $key-braille-dots-12356 = 16787511;

define inline-only constant $key-braille-dots-123567 = 16787575;

define inline-only constant $key-braille-dots-1235678 = 16787703;

define inline-only constant $key-braille-dots-123568 = 16787639;

define inline-only constant $key-braille-dots-12357 = 16787543;

define inline-only constant $key-braille-dots-123578 = 16787671;

define inline-only constant $key-braille-dots-12358 = 16787607;

define inline-only constant $key-braille-dots-1236 = 16787495;

define inline-only constant $key-braille-dots-12367 = 16787559;

define inline-only constant $key-braille-dots-123678 = 16787687;

define inline-only constant $key-braille-dots-12368 = 16787623;

define inline-only constant $key-braille-dots-1237 = 16787527;

define inline-only constant $key-braille-dots-12378 = 16787655;

define inline-only constant $key-braille-dots-1238 = 16787591;

define inline-only constant $key-braille-dots-124 = 16787467;

define inline-only constant $key-braille-dots-1245 = 16787483;

define inline-only constant $key-braille-dots-12456 = 16787515;

define inline-only constant $key-braille-dots-124567 = 16787579;

define inline-only constant $key-braille-dots-1245678 = 16787707;

define inline-only constant $key-braille-dots-124568 = 16787643;

define inline-only constant $key-braille-dots-12457 = 16787547;

define inline-only constant $key-braille-dots-124578 = 16787675;

define inline-only constant $key-braille-dots-12458 = 16787611;

define inline-only constant $key-braille-dots-1246 = 16787499;

define inline-only constant $key-braille-dots-12467 = 16787563;

define inline-only constant $key-braille-dots-124678 = 16787691;

define inline-only constant $key-braille-dots-12468 = 16787627;

define inline-only constant $key-braille-dots-1247 = 16787531;

define inline-only constant $key-braille-dots-12478 = 16787659;

define inline-only constant $key-braille-dots-1248 = 16787595;

define inline-only constant $key-braille-dots-125 = 16787475;

define inline-only constant $key-braille-dots-1256 = 16787507;

define inline-only constant $key-braille-dots-12567 = 16787571;

define inline-only constant $key-braille-dots-125678 = 16787699;

define inline-only constant $key-braille-dots-12568 = 16787635;

define inline-only constant $key-braille-dots-1257 = 16787539;

define inline-only constant $key-braille-dots-12578 = 16787667;

define inline-only constant $key-braille-dots-1258 = 16787603;

define inline-only constant $key-braille-dots-126 = 16787491;

define inline-only constant $key-braille-dots-1267 = 16787555;

define inline-only constant $key-braille-dots-12678 = 16787683;

define inline-only constant $key-braille-dots-1268 = 16787619;

define inline-only constant $key-braille-dots-127 = 16787523;

define inline-only constant $key-braille-dots-1278 = 16787651;

define inline-only constant $key-braille-dots-128 = 16787587;

define inline-only constant $key-braille-dots-13 = 16787461;

define inline-only constant $key-braille-dots-134 = 16787469;

define inline-only constant $key-braille-dots-1345 = 16787485;

define inline-only constant $key-braille-dots-13456 = 16787517;

define inline-only constant $key-braille-dots-134567 = 16787581;

define inline-only constant $key-braille-dots-1345678 = 16787709;

define inline-only constant $key-braille-dots-134568 = 16787645;

define inline-only constant $key-braille-dots-13457 = 16787549;

define inline-only constant $key-braille-dots-134578 = 16787677;

define inline-only constant $key-braille-dots-13458 = 16787613;

define inline-only constant $key-braille-dots-1346 = 16787501;

define inline-only constant $key-braille-dots-13467 = 16787565;

define inline-only constant $key-braille-dots-134678 = 16787693;

define inline-only constant $key-braille-dots-13468 = 16787629;

define inline-only constant $key-braille-dots-1347 = 16787533;

define inline-only constant $key-braille-dots-13478 = 16787661;

define inline-only constant $key-braille-dots-1348 = 16787597;

define inline-only constant $key-braille-dots-135 = 16787477;

define inline-only constant $key-braille-dots-1356 = 16787509;

define inline-only constant $key-braille-dots-13567 = 16787573;

define inline-only constant $key-braille-dots-135678 = 16787701;

define inline-only constant $key-braille-dots-13568 = 16787637;

define inline-only constant $key-braille-dots-1357 = 16787541;

define inline-only constant $key-braille-dots-13578 = 16787669;

define inline-only constant $key-braille-dots-1358 = 16787605;

define inline-only constant $key-braille-dots-136 = 16787493;

define inline-only constant $key-braille-dots-1367 = 16787557;

define inline-only constant $key-braille-dots-13678 = 16787685;

define inline-only constant $key-braille-dots-1368 = 16787621;

define inline-only constant $key-braille-dots-137 = 16787525;

define inline-only constant $key-braille-dots-1378 = 16787653;

define inline-only constant $key-braille-dots-138 = 16787589;

define inline-only constant $key-braille-dots-14 = 16787465;

define inline-only constant $key-braille-dots-145 = 16787481;

define inline-only constant $key-braille-dots-1456 = 16787513;

define inline-only constant $key-braille-dots-14567 = 16787577;

define inline-only constant $key-braille-dots-145678 = 16787705;

define inline-only constant $key-braille-dots-14568 = 16787641;

define inline-only constant $key-braille-dots-1457 = 16787545;

define inline-only constant $key-braille-dots-14578 = 16787673;

define inline-only constant $key-braille-dots-1458 = 16787609;

define inline-only constant $key-braille-dots-146 = 16787497;

define inline-only constant $key-braille-dots-1467 = 16787561;

define inline-only constant $key-braille-dots-14678 = 16787689;

define inline-only constant $key-braille-dots-1468 = 16787625;

define inline-only constant $key-braille-dots-147 = 16787529;

define inline-only constant $key-braille-dots-1478 = 16787657;

define inline-only constant $key-braille-dots-148 = 16787593;

define inline-only constant $key-braille-dots-15 = 16787473;

define inline-only constant $key-braille-dots-156 = 16787505;

define inline-only constant $key-braille-dots-1567 = 16787569;

define inline-only constant $key-braille-dots-15678 = 16787697;

define inline-only constant $key-braille-dots-1568 = 16787633;

define inline-only constant $key-braille-dots-157 = 16787537;

define inline-only constant $key-braille-dots-1578 = 16787665;

define inline-only constant $key-braille-dots-158 = 16787601;

define inline-only constant $key-braille-dots-16 = 16787489;

define inline-only constant $key-braille-dots-167 = 16787553;

define inline-only constant $key-braille-dots-1678 = 16787681;

define inline-only constant $key-braille-dots-168 = 16787617;

define inline-only constant $key-braille-dots-17 = 16787521;

define inline-only constant $key-braille-dots-178 = 16787649;

define inline-only constant $key-braille-dots-18 = 16787585;

define inline-only constant $key-braille-dots-2 = 16787458;

define inline-only constant $key-braille-dots-23 = 16787462;

define inline-only constant $key-braille-dots-234 = 16787470;

define inline-only constant $key-braille-dots-2345 = 16787486;

define inline-only constant $key-braille-dots-23456 = 16787518;

define inline-only constant $key-braille-dots-234567 = 16787582;

define inline-only constant $key-braille-dots-2345678 = 16787710;

define inline-only constant $key-braille-dots-234568 = 16787646;

define inline-only constant $key-braille-dots-23457 = 16787550;

define inline-only constant $key-braille-dots-234578 = 16787678;

define inline-only constant $key-braille-dots-23458 = 16787614;

define inline-only constant $key-braille-dots-2346 = 16787502;

define inline-only constant $key-braille-dots-23467 = 16787566;

define inline-only constant $key-braille-dots-234678 = 16787694;

define inline-only constant $key-braille-dots-23468 = 16787630;

define inline-only constant $key-braille-dots-2347 = 16787534;

define inline-only constant $key-braille-dots-23478 = 16787662;

define inline-only constant $key-braille-dots-2348 = 16787598;

define inline-only constant $key-braille-dots-235 = 16787478;

define inline-only constant $key-braille-dots-2356 = 16787510;

define inline-only constant $key-braille-dots-23567 = 16787574;

define inline-only constant $key-braille-dots-235678 = 16787702;

define inline-only constant $key-braille-dots-23568 = 16787638;

define inline-only constant $key-braille-dots-2357 = 16787542;

define inline-only constant $key-braille-dots-23578 = 16787670;

define inline-only constant $key-braille-dots-2358 = 16787606;

define inline-only constant $key-braille-dots-236 = 16787494;

define inline-only constant $key-braille-dots-2367 = 16787558;

define inline-only constant $key-braille-dots-23678 = 16787686;

define inline-only constant $key-braille-dots-2368 = 16787622;

define inline-only constant $key-braille-dots-237 = 16787526;

define inline-only constant $key-braille-dots-2378 = 16787654;

define inline-only constant $key-braille-dots-238 = 16787590;

define inline-only constant $key-braille-dots-24 = 16787466;

define inline-only constant $key-braille-dots-245 = 16787482;

define inline-only constant $key-braille-dots-2456 = 16787514;

define inline-only constant $key-braille-dots-24567 = 16787578;

define inline-only constant $key-braille-dots-245678 = 16787706;

define inline-only constant $key-braille-dots-24568 = 16787642;

define inline-only constant $key-braille-dots-2457 = 16787546;

define inline-only constant $key-braille-dots-24578 = 16787674;

define inline-only constant $key-braille-dots-2458 = 16787610;

define inline-only constant $key-braille-dots-246 = 16787498;

define inline-only constant $key-braille-dots-2467 = 16787562;

define inline-only constant $key-braille-dots-24678 = 16787690;

define inline-only constant $key-braille-dots-2468 = 16787626;

define inline-only constant $key-braille-dots-247 = 16787530;

define inline-only constant $key-braille-dots-2478 = 16787658;

define inline-only constant $key-braille-dots-248 = 16787594;

define inline-only constant $key-braille-dots-25 = 16787474;

define inline-only constant $key-braille-dots-256 = 16787506;

define inline-only constant $key-braille-dots-2567 = 16787570;

define inline-only constant $key-braille-dots-25678 = 16787698;

define inline-only constant $key-braille-dots-2568 = 16787634;

define inline-only constant $key-braille-dots-257 = 16787538;

define inline-only constant $key-braille-dots-2578 = 16787666;

define inline-only constant $key-braille-dots-258 = 16787602;

define inline-only constant $key-braille-dots-26 = 16787490;

define inline-only constant $key-braille-dots-267 = 16787554;

define inline-only constant $key-braille-dots-2678 = 16787682;

define inline-only constant $key-braille-dots-268 = 16787618;

define inline-only constant $key-braille-dots-27 = 16787522;

define inline-only constant $key-braille-dots-278 = 16787650;

define inline-only constant $key-braille-dots-28 = 16787586;

define inline-only constant $key-braille-dots-3 = 16787460;

define inline-only constant $key-braille-dots-34 = 16787468;

define inline-only constant $key-braille-dots-345 = 16787484;

define inline-only constant $key-braille-dots-3456 = 16787516;

define inline-only constant $key-braille-dots-34567 = 16787580;

define inline-only constant $key-braille-dots-345678 = 16787708;

define inline-only constant $key-braille-dots-34568 = 16787644;

define inline-only constant $key-braille-dots-3457 = 16787548;

define inline-only constant $key-braille-dots-34578 = 16787676;

define inline-only constant $key-braille-dots-3458 = 16787612;

define inline-only constant $key-braille-dots-346 = 16787500;

define inline-only constant $key-braille-dots-3467 = 16787564;

define inline-only constant $key-braille-dots-34678 = 16787692;

define inline-only constant $key-braille-dots-3468 = 16787628;

define inline-only constant $key-braille-dots-347 = 16787532;

define inline-only constant $key-braille-dots-3478 = 16787660;

define inline-only constant $key-braille-dots-348 = 16787596;

define inline-only constant $key-braille-dots-35 = 16787476;

define inline-only constant $key-braille-dots-356 = 16787508;

define inline-only constant $key-braille-dots-3567 = 16787572;

define inline-only constant $key-braille-dots-35678 = 16787700;

define inline-only constant $key-braille-dots-3568 = 16787636;

define inline-only constant $key-braille-dots-357 = 16787540;

define inline-only constant $key-braille-dots-3578 = 16787668;

define inline-only constant $key-braille-dots-358 = 16787604;

define inline-only constant $key-braille-dots-36 = 16787492;

define inline-only constant $key-braille-dots-367 = 16787556;

define inline-only constant $key-braille-dots-3678 = 16787684;

define inline-only constant $key-braille-dots-368 = 16787620;

define inline-only constant $key-braille-dots-37 = 16787524;

define inline-only constant $key-braille-dots-378 = 16787652;

define inline-only constant $key-braille-dots-38 = 16787588;

define inline-only constant $key-braille-dots-4 = 16787464;

define inline-only constant $key-braille-dots-45 = 16787480;

define inline-only constant $key-braille-dots-456 = 16787512;

define inline-only constant $key-braille-dots-4567 = 16787576;

define inline-only constant $key-braille-dots-45678 = 16787704;

define inline-only constant $key-braille-dots-4568 = 16787640;

define inline-only constant $key-braille-dots-457 = 16787544;

define inline-only constant $key-braille-dots-4578 = 16787672;

define inline-only constant $key-braille-dots-458 = 16787608;

define inline-only constant $key-braille-dots-46 = 16787496;

define inline-only constant $key-braille-dots-467 = 16787560;

define inline-only constant $key-braille-dots-4678 = 16787688;

define inline-only constant $key-braille-dots-468 = 16787624;

define inline-only constant $key-braille-dots-47 = 16787528;

define inline-only constant $key-braille-dots-478 = 16787656;

define inline-only constant $key-braille-dots-48 = 16787592;

define inline-only constant $key-braille-dots-5 = 16787472;

define inline-only constant $key-braille-dots-56 = 16787504;

define inline-only constant $key-braille-dots-567 = 16787568;

define inline-only constant $key-braille-dots-5678 = 16787696;

define inline-only constant $key-braille-dots-568 = 16787632;

define inline-only constant $key-braille-dots-57 = 16787536;

define inline-only constant $key-braille-dots-578 = 16787664;

define inline-only constant $key-braille-dots-58 = 16787600;

define inline-only constant $key-braille-dots-6 = 16787488;

define inline-only constant $key-braille-dots-67 = 16787552;

define inline-only constant $key-braille-dots-678 = 16787680;

define inline-only constant $key-braille-dots-68 = 16787616;

define inline-only constant $key-braille-dots-7 = 16787520;

define inline-only constant $key-braille-dots-78 = 16787648;

define inline-only constant $key-braille-dots-8 = 16787584;

define inline-only constant $key-breve = 418;

define inline-only constant $key-brokenbar = 166;

define inline-only constant $key-careof = 2744;

define inline-only constant $key-caret = 2812;

define inline-only constant $key-caron = 439;

define inline-only constant $key-cedilla = 184;

define inline-only constant $key-cent = 162;

define inline-only constant $key-checkerboard = 2529;

define inline-only constant $key-checkmark = 2803;

define inline-only constant $key-circle = 3023;

define inline-only constant $key-club = 2796;

define inline-only constant $key-colon = 58;

define inline-only constant $key-comma = 44;

define inline-only constant $key-containsas = 16785931;

define inline-only constant $key-copyright = 169;

define inline-only constant $key-cr = 2532;

define inline-only constant $key-crossinglines = 2542;

define inline-only constant $key-cuberoot = 16785947;

define inline-only constant $key-currency = 164;

define inline-only constant $key-cursor = 2815;

define inline-only constant $key-dagger = 2801;

define inline-only constant $key-dead-a = 65153;

define inline-only constant $key-dead-e = 65155;

define inline-only constant $key-dead-i = 65157;

define inline-only constant $key-dead-o = 65159;

define inline-only constant $key-dead-u = 65161;

define inline-only constant $key-dead-abovecomma = 65124;

define inline-only constant $key-dead-abovedot = 65110;

define inline-only constant $key-dead-abovereversedcomma = 65125;

define inline-only constant $key-dead-abovering = 65112;

define inline-only constant $key-dead-aboveverticalline = 65169;

define inline-only constant $key-dead-acute = 65105;

define inline-only constant $key-dead-belowbreve = 65131;

define inline-only constant $key-dead-belowcircumflex = 65129;

define inline-only constant $key-dead-belowcomma = 65134;

define inline-only constant $key-dead-belowdiaeresis = 65132;

define inline-only constant $key-dead-belowdot = 65120;

define inline-only constant $key-dead-belowmacron = 65128;

define inline-only constant $key-dead-belowring = 65127;

define inline-only constant $key-dead-belowtilde = 65130;

define inline-only constant $key-dead-belowverticalline = 65170;

define inline-only constant $key-dead-breve = 65109;

define inline-only constant $key-dead-capital-schwa = 65163;

define inline-only constant $key-dead-caron = 65114;

define inline-only constant $key-dead-cedilla = 65115;

define inline-only constant $key-dead-circumflex = 65106;

define inline-only constant $key-dead-currency = 65135;

define inline-only constant $key-dead-dasia = 65125;

define inline-only constant $key-dead-diaeresis = 65111;

define inline-only constant $key-dead-doubleacute = 65113;

define inline-only constant $key-dead-doublegrave = 65126;

define inline-only constant $key-dead-grave = 65104;

define inline-only constant $key-dead-greek = 65164;

define inline-only constant $key-dead-hook = 65121;

define inline-only constant $key-dead-horn = 65122;

define inline-only constant $key-dead-invertedbreve = 65133;

define inline-only constant $key-dead-iota = 65117;

define inline-only constant $key-dead-longsolidusoverlay = 65171;

define inline-only constant $key-dead-lowline = 65168;

define inline-only constant $key-dead-macron = 65108;

define inline-only constant $key-dead-ogonek = 65116;

define inline-only constant $key-dead-perispomeni = 65107;

define inline-only constant $key-dead-psili = 65124;

define inline-only constant $key-dead-semivoiced-sound = 65119;

define inline-only constant $key-dead-small-schwa = 65162;

define inline-only constant $key-dead-stroke = 65123;

define inline-only constant $key-dead-tilde = 65107;

define inline-only constant $key-dead-voiced-sound = 65118;

define inline-only constant $key-decimalpoint = 2749;

define inline-only constant $key-degree = 176;

define inline-only constant $key-diaeresis = 168;

define inline-only constant $key-diamond = 2797;

define inline-only constant $key-digitspace = 2725;

define inline-only constant $key-dintegral = 16785964;

define inline-only constant $key-division = 247;

define inline-only constant $key-dollar = 36;

define inline-only constant $key-doubbaselinedot = 2735;

define inline-only constant $key-doubleacute = 445;

define inline-only constant $key-doubledagger = 2802;

define inline-only constant $key-doublelowquotemark = 2814;

define inline-only constant $key-downarrow = 2302;

define inline-only constant $key-downcaret = 2984;

define inline-only constant $key-downshoe = 3030;

define inline-only constant $key-downstile = 3012;

define inline-only constant $key-downtack = 3010;

define inline-only constant $key-eightsubscript = 16785544;

define inline-only constant $key-eightsuperior = 16785528;

define inline-only constant $key-elementof = 16785928;

define inline-only constant $key-ellipsis = 2734;

define inline-only constant $key-em3space = 2723;

define inline-only constant $key-em4space = 2724;

define inline-only constant $key-emdash = 2729;

define inline-only constant $key-emfilledcircle = 2782;

define inline-only constant $key-emfilledrect = 2783;

define inline-only constant $key-emopencircle = 2766;

define inline-only constant $key-emopenrectangle = 2767;

define inline-only constant $key-emptyset = 16785925;

define inline-only constant $key-emspace = 2721;

define inline-only constant $key-endash = 2730;

define inline-only constant $key-enfilledcircbullet = 2790;

define inline-only constant $key-enfilledsqbullet = 2791;

define inline-only constant $key-enopencircbullet = 2784;

define inline-only constant $key-enopensquarebullet = 2785;

define inline-only constant $key-enspace = 2722;

define inline-only constant $key-equal = 61;

define inline-only constant $key-exclam = 33;

define inline-only constant $key-exclamdown = 161;

define inline-only constant $key-femalesymbol = 2808;

define inline-only constant $key-ff = 2531;

define inline-only constant $key-figdash = 2747;

define inline-only constant $key-filledlefttribullet = 2780;

define inline-only constant $key-filledrectbullet = 2779;

define inline-only constant $key-filledrighttribullet = 2781;

define inline-only constant $key-filledtribulletdown = 2793;

define inline-only constant $key-filledtribulletup = 2792;

define inline-only constant $key-fiveeighths = 2757;

define inline-only constant $key-fivesixths = 2743;

define inline-only constant $key-fivesubscript = 16785541;

define inline-only constant $key-fivesuperior = 16785525;

define inline-only constant $key-fourfifths = 2741;

define inline-only constant $key-foursubscript = 16785540;

define inline-only constant $key-foursuperior = 16785524;

define inline-only constant $key-fourthroot = 16785948;

define inline-only constant $key-function = 2294;

define inline-only constant $key-grave = 96;

define inline-only constant $key-greater = 62;

define inline-only constant $key-greaterthanequal = 2238;

define inline-only constant $key-guillemotleft = 171;

define inline-only constant $key-guillemotright = 187;

define inline-only constant $key-hairspace = 2728;

define inline-only constant $key-heart = 2798;

define inline-only constant $key-hebrew-aleph = 3296;

define inline-only constant $key-hebrew-ayin = 3314;

define inline-only constant $key-hebrew-bet = 3297;

define inline-only constant $key-hebrew-beth = 3297;

define inline-only constant $key-hebrew-chet = 3303;

define inline-only constant $key-hebrew-dalet = 3299;

define inline-only constant $key-hebrew-daleth = 3299;

define inline-only constant $key-hebrew-doublelowline = 3295;

define inline-only constant $key-hebrew-finalkaph = 3306;

define inline-only constant $key-hebrew-finalmem = 3309;

define inline-only constant $key-hebrew-finalnun = 3311;

define inline-only constant $key-hebrew-finalpe = 3315;

define inline-only constant $key-hebrew-finalzade = 3317;

define inline-only constant $key-hebrew-finalzadi = 3317;

define inline-only constant $key-hebrew-gimel = 3298;

define inline-only constant $key-hebrew-gimmel = 3298;

define inline-only constant $key-hebrew-he = 3300;

define inline-only constant $key-hebrew-het = 3303;

define inline-only constant $key-hebrew-kaph = 3307;

define inline-only constant $key-hebrew-kuf = 3319;

define inline-only constant $key-hebrew-lamed = 3308;

define inline-only constant $key-hebrew-mem = 3310;

define inline-only constant $key-hebrew-nun = 3312;

define inline-only constant $key-hebrew-pe = 3316;

define inline-only constant $key-hebrew-qoph = 3319;

define inline-only constant $key-hebrew-resh = 3320;

define inline-only constant $key-hebrew-samech = 3313;

define inline-only constant $key-hebrew-samekh = 3313;

define inline-only constant $key-hebrew-shin = 3321;

define inline-only constant $key-hebrew-taf = 3322;

define inline-only constant $key-hebrew-taw = 3322;

define inline-only constant $key-hebrew-tet = 3304;

define inline-only constant $key-hebrew-teth = 3304;

define inline-only constant $key-hebrew-waw = 3301;

define inline-only constant $key-hebrew-yod = 3305;

define inline-only constant $key-hebrew-zade = 3318;

define inline-only constant $key-hebrew-zadi = 3318;

define inline-only constant $key-hebrew-zain = 3302;

define inline-only constant $key-hebrew-zayin = 3302;

define inline-only constant $key-hexagram = 2778;

define inline-only constant $key-horizconnector = 2211;

define inline-only constant $key-horizlinescan1 = 2543;

define inline-only constant $key-horizlinescan3 = 2544;

define inline-only constant $key-horizlinescan5 = 2545;

define inline-only constant $key-horizlinescan7 = 2546;

define inline-only constant $key-horizlinescan9 = 2547;

define inline-only constant $key-ht = 2530;

define inline-only constant $key-hyphen = 173;

define inline-only constant $key-i-touch = 269025120;

define inline-only constant $key-identical = 2255;

define inline-only constant $key-idotless = 697;

define inline-only constant $key-ifonlyif = 2253;

define inline-only constant $key-implies = 2254;

define inline-only constant $key-includedin = 2266;

define inline-only constant $key-includes = 2267;

define inline-only constant $key-infinity = 2242;

define inline-only constant $key-integral = 2239;

define inline-only constant $key-intersection = 2268;

define inline-only constant $key-jot = 3018;

define inline-only constant $key-kana-a = 1201;

define inline-only constant $key-kana-chi = 1217;

define inline-only constant $key-kana-e = 1204;

define inline-only constant $key-kana-fu = 1228;

define inline-only constant $key-kana-ha = 1226;

define inline-only constant $key-kana-he = 1229;

define inline-only constant $key-kana-hi = 1227;

define inline-only constant $key-kana-ho = 1230;

define inline-only constant $key-kana-hu = 1228;

define inline-only constant $key-kana-i = 1202;

define inline-only constant $key-kana-ka = 1206;

define inline-only constant $key-kana-ke = 1209;

define inline-only constant $key-kana-ki = 1207;

define inline-only constant $key-kana-ko = 1210;

define inline-only constant $key-kana-ku = 1208;

define inline-only constant $key-kana-ma = 1231;

define inline-only constant $key-kana-me = 1234;

define inline-only constant $key-kana-mi = 1232;

define inline-only constant $key-kana-mo = 1235;

define inline-only constant $key-kana-mu = 1233;

define inline-only constant $key-kana-n = 1245;

define inline-only constant $key-kana-na = 1221;

define inline-only constant $key-kana-ne = 1224;

define inline-only constant $key-kana-ni = 1222;

define inline-only constant $key-kana-no = 1225;

define inline-only constant $key-kana-nu = 1223;

define inline-only constant $key-kana-o = 1205;

define inline-only constant $key-kana-ra = 1239;

define inline-only constant $key-kana-re = 1242;

define inline-only constant $key-kana-ri = 1240;

define inline-only constant $key-kana-ro = 1243;

define inline-only constant $key-kana-ru = 1241;

define inline-only constant $key-kana-sa = 1211;

define inline-only constant $key-kana-se = 1214;

define inline-only constant $key-kana-shi = 1212;

define inline-only constant $key-kana-so = 1215;

define inline-only constant $key-kana-su = 1213;

define inline-only constant $key-kana-ta = 1216;

define inline-only constant $key-kana-te = 1219;

define inline-only constant $key-kana-ti = 1217;

define inline-only constant $key-kana-to = 1220;

define inline-only constant $key-kana-tsu = 1218;

define inline-only constant $key-kana-tu = 1218;

define inline-only constant $key-kana-u = 1203;

define inline-only constant $key-kana-wa = 1244;

define inline-only constant $key-kana-wo = 1190;

define inline-only constant $key-kana-ya = 1236;

define inline-only constant $key-kana-yo = 1238;

define inline-only constant $key-kana-yu = 1237;

define inline-only constant $key-kana-closingbracket = 1187;

define inline-only constant $key-kana-comma = 1188;

define inline-only constant $key-kana-conjunctive = 1189;

define inline-only constant $key-kana-fullstop = 1185;

define inline-only constant $key-kana-middledot = 1189;

define inline-only constant $key-kana-openingbracket = 1186;

define inline-only constant $key-kana-switch = 65406;

define inline-only constant $key-kappa = 930;

define inline-only constant $key-kra = 930;

define inline-only constant $key-latincross = 2777;

define inline-only constant $key-leftanglebracket = 2748;

define inline-only constant $key-leftarrow = 2299;

define inline-only constant $key-leftcaret = 2979;

define inline-only constant $key-leftdoublequotemark = 2770;

define inline-only constant $key-leftmiddlecurlybrace = 2223;

define inline-only constant $key-leftopentriangle = 2764;

define inline-only constant $key-leftpointer = 2794;

define inline-only constant $key-leftradical = 2209;

define inline-only constant $key-leftshoe = 3034;

define inline-only constant $key-leftsinglequotemark = 2768;

define inline-only constant $key-leftt = 2548;

define inline-only constant $key-lefttack = 3036;

define inline-only constant $key-less = 60;

define inline-only constant $key-lessthanequal = 2236;

define inline-only constant $key-lf = 2533;

define inline-only constant $key-logicaland = 2270;

define inline-only constant $key-logicalor = 2271;

define inline-only constant $key-lowleftcorner = 2541;

define inline-only constant $key-lowrightcorner = 2538;

define inline-only constant $key-macron = 175;

define inline-only constant $key-malesymbol = 2807;

define inline-only constant $key-maltesecross = 2800;

define inline-only constant $key-marker = 2751;

define inline-only constant $key-masculine = 186;

define inline-only constant $key-minus = 45;

define inline-only constant $key-minutes = 2774;

define inline-only constant $key-mu = 181;

define inline-only constant $key-multiply = 215;

define inline-only constant $key-musicalflat = 2806;

define inline-only constant $key-musicalsharp = 2805;

define inline-only constant $key-nabla = 2245;

define inline-only constant $key-ninesubscript = 16785545;

define inline-only constant $key-ninesuperior = 16785529;

define inline-only constant $key-nl = 2536;

define inline-only constant $key-nobreakspace = 160;

define inline-only constant $key-notapproxeq = 16785991;

define inline-only constant $key-notelementof = 16785929;

define inline-only constant $key-notequal = 2237;

define inline-only constant $key-notidentical = 16786018;

define inline-only constant $key-notsign = 172;

define inline-only constant $key-numbersign = 35;

define inline-only constant $key-numerosign = 1712;

define inline-only constant $key-ogonek = 434;

define inline-only constant $key-oneeighth = 2755;

define inline-only constant $key-onefifth = 2738;

define inline-only constant $key-onehalf = 189;

define inline-only constant $key-onequarter = 188;

define inline-only constant $key-onesixth = 2742;

define inline-only constant $key-onesubscript = 16785537;

define inline-only constant $key-onesuperior = 185;

define inline-only constant $key-onethird = 2736;

define inline-only constant $key-openrectbullet = 2786;

define inline-only constant $key-openstar = 2789;

define inline-only constant $key-opentribulletdown = 2788;

define inline-only constant $key-opentribulletup = 2787;

define inline-only constant $key-ordfeminine = 170;

define inline-only constant $key-overbar = 3008;

define inline-only constant $key-overline = 1150;

define inline-only constant $key-paragraph = 182;

define inline-only constant $key-parenleft = 40;

define inline-only constant $key-parenright = 41;

define inline-only constant $key-partdifferential = 16785922;

define inline-only constant $key-partialderivative = 2287;

define inline-only constant $key-percent = 37;

define inline-only constant $key-period = 46;

define inline-only constant $key-periodcentered = 183;

define inline-only constant $key-permille = 2773;

define inline-only constant $key-phonographcopyright = 2811;

define inline-only constant $key-plus = 43;

define inline-only constant $key-plusminus = 177;

define inline-only constant $key-prescription = 2772;

define inline-only constant $key-prolongedsound = 1200;

define inline-only constant $key-punctspace = 2726;

define inline-only constant $key-quad = 3020;

define inline-only constant $key-question = 63;

define inline-only constant $key-questiondown = 191;

define inline-only constant $key-quotedbl = 34;

define inline-only constant $key-quoteleft = 96;

define inline-only constant $key-quoteright = 39;

define inline-only constant $key-radical = 2262;

define inline-only constant $key-registered = 174;

define inline-only constant $key-rightanglebracket = 2750;

define inline-only constant $key-rightarrow = 2301;

define inline-only constant $key-rightcaret = 2982;

define inline-only constant $key-rightdoublequotemark = 2771;

define inline-only constant $key-rightmiddlecurlybrace = 2224;

define inline-only constant $key-rightmiddlesummation = 2231;

define inline-only constant $key-rightopentriangle = 2765;

define inline-only constant $key-rightpointer = 2795;

define inline-only constant $key-rightshoe = 3032;

define inline-only constant $key-rightsinglequotemark = 2769;

define inline-only constant $key-rightt = 2549;

define inline-only constant $key-righttack = 3068;

define inline-only constant $key-script-switch = 65406;

define inline-only constant $key-seconds = 2775;

define inline-only constant $key-section = 167;

define inline-only constant $key-semicolon = 59;

define inline-only constant $key-semivoicedsound = 1247;

define inline-only constant $key-seveneighths = 2758;

define inline-only constant $key-sevensubscript = 16785543;

define inline-only constant $key-sevensuperior = 16785527;

define inline-only constant $key-signaturemark = 2762;

define inline-only constant $key-signifblank = 2732;

define inline-only constant $key-similarequal = 2249;

define inline-only constant $key-singlelowquotemark = 2813;

define inline-only constant $key-sixsubscript = 16785542;

define inline-only constant $key-sixsuperior = 16785526;

define inline-only constant $key-slash = 47;

define inline-only constant $key-soliddiamond = 2528;

define inline-only constant $key-space = 32;

define inline-only constant $key-squareroot = 16785946;

define inline-only constant $key-ssharp = 223;

define inline-only constant $key-sterling = 163;

define inline-only constant $key-stricteq = 16786019;

define inline-only constant $key-telephone = 2809;

define inline-only constant $key-telephonerecorder = 2810;

define inline-only constant $key-therefore = 2240;

define inline-only constant $key-thinspace = 2727;

define inline-only constant $key-threeeighths = 2756;

define inline-only constant $key-threefifths = 2740;

define inline-only constant $key-threequarters = 190;

define inline-only constant $key-threesubscript = 16785539;

define inline-only constant $key-threesuperior = 179;

define inline-only constant $key-tintegral = 16785965;

define inline-only constant $key-topintegral = 2212;

define inline-only constant $key-topleftparens = 2219;

define inline-only constant $key-topleftradical = 2210;

define inline-only constant $key-topleftsqbracket = 2215;

define inline-only constant $key-topleftsummation = 2225;

define inline-only constant $key-toprightparens = 2221;

define inline-only constant $key-toprightsqbracket = 2217;

define inline-only constant $key-toprightsummation = 2229;

define inline-only constant $key-topt = 2551;

define inline-only constant $key-topvertsummationconnector = 2227;

define inline-only constant $key-trademark = 2761;

define inline-only constant $key-trademarkincircle = 2763;

define inline-only constant $key-twofifths = 2739;

define inline-only constant $key-twosubscript = 16785538;

define inline-only constant $key-twosuperior = 178;

define inline-only constant $key-twothirds = 2737;

define inline-only constant $key-underbar = 3014;

define inline-only constant $key-underscore = 95;

define inline-only constant $key-union = 2269;

define inline-only constant $key-uparrow = 2300;

define inline-only constant $key-upcaret = 2985;

define inline-only constant $key-upleftcorner = 2540;

define inline-only constant $key-uprightcorner = 2539;

define inline-only constant $key-upshoe = 3011;

define inline-only constant $key-upstile = 3027;

define inline-only constant $key-uptack = 3022;

define inline-only constant $key-variation = 2241;

define inline-only constant $key-vertbar = 2552;

define inline-only constant $key-vertconnector = 2214;

define inline-only constant $key-voicedsound = 1246;

define inline-only constant $key-vt = 2537;

define inline-only constant $key-yen = 165;

define inline-only constant $key-zerosubscript = 16785536;

define inline-only constant $key-zerosuperior = 16785520;

define open C-subtype <GdkKeyEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkKeyEvent*> => <GdkKeyEvent>;

define sealed domain make (singleton(<GdkKeyEvent*>));
define sealed domain initialize (<GdkKeyEvent*>);

define inline-only C-function gdk-key-event-get-consumed-modifiers
  input parameter self :: <GdkKeyEvent>;
  result res :: <GdkModifierType>;
  c-name: "gdk_key_event_get_consumed_modifiers";
end;

define inline-only C-function gdk-key-event-get-keycode
  input parameter self :: <GdkKeyEvent>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_key_event_get_keycode";
end;

define inline-only C-function gdk-key-event-get-keyval
  input parameter self :: <GdkKeyEvent>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_key_event_get_keyval";
end;

define inline-only C-function gdk-key-event-get-layout
  input parameter self :: <GdkKeyEvent>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_key_event_get_layout";
end;

define inline-only C-function gdk-key-event-get-level
  input parameter self :: <GdkKeyEvent>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_key_event_get_level";
end;

define inline-only C-function gdk-key-event-get-match
  input parameter self :: <GdkKeyEvent>;
  output parameter keyval_ :: <C-unsigned-int*>;
  output parameter modifiers_ :: <GdkModifierType*>;
  result res :: <C-boolean>;
  c-name: "gdk_key_event_get_match";
end;

define inline-only C-function gdk-key-event-is-modifier
  input parameter self :: <GdkKeyEvent>;
  result res :: <C-boolean>;
  c-name: "gdk_key_event_is_modifier";
end;

define inline-only C-function gdk-key-event-matches
  input parameter self :: <GdkKeyEvent>;
  input parameter keyval_ :: <C-unsigned-int>;
  input parameter modifiers_ :: <GdkModifierType>;
  result res :: <GdkKeyMatch>;
  c-name: "gdk_key_event_matches";
end;

define inline-only constant $gdk-key-match-none = 0;
define inline-only constant $gdk-key-match-partial = 1;
define inline-only constant $gdk-key-match-exact = 2;
define constant <GdkKeyMatch> = <C-int>;
define C-pointer-type <GdkKeyMatch*> => <GdkKeyMatch>;

define C-struct <_GdkKeymapKey>
  sealed inline-only slot gdk-keymap-key-keycode :: <C-unsigned-int>;
  sealed inline-only slot gdk-keymap-key-group :: <C-signed-int>;
  sealed inline-only slot gdk-keymap-key-level :: <C-signed-int>;
  pointer-type-name: <GdkKeymapKey>;
end C-struct;

define sealed domain make (singleton(<GdkKeymapKey>));
define sealed domain initialize (<GdkKeymapKey>);

define inline-only constant $modifier-mask = 469769999;

define inline-only constant $gdk-memory-b8g8r8a8-premultiplied = 0;
define inline-only constant $gdk-memory-a8r8g8b8-premultiplied = 1;
define inline-only constant $gdk-memory-r8g8b8a8-premultiplied = 2;
define inline-only constant $gdk-memory-b8g8r8a8 = 3;
define inline-only constant $gdk-memory-a8r8g8b8 = 4;
define inline-only constant $gdk-memory-r8g8b8a8 = 5;
define inline-only constant $gdk-memory-a8b8g8r8 = 6;
define inline-only constant $gdk-memory-r8g8b8 = 7;
define inline-only constant $gdk-memory-b8g8r8 = 8;
define inline-only constant $gdk-memory-r16g16b16 = 9;
define inline-only constant $gdk-memory-r16g16b16a16-premultiplied = 10;
define inline-only constant $gdk-memory-r16g16b16a16 = 11;
define inline-only constant $gdk-memory-r16g16b16-float = 12;
define inline-only constant $gdk-memory-r16g16b16a16-float-premultiplied = 13;
define inline-only constant $gdk-memory-r16g16b16a16-float = 14;
define inline-only constant $gdk-memory-r32g32b32-float = 15;
define inline-only constant $gdk-memory-r32g32b32a32-float-premultiplied = 16;
define inline-only constant $gdk-memory-r32g32b32a32-float = 17;
define inline-only constant $gdk-memory-n-formats = 18;
define constant <GdkMemoryFormat> = <C-int>;
define C-pointer-type <GdkMemoryFormat*> => <GdkMemoryFormat>;

define open C-subtype <GdkMemoryTexture> (<GdkTexture>)
end C-subtype;

define C-pointer-type <GdkMemoryTexture*> => <GdkMemoryTexture>;

define sealed domain make (singleton(<GdkMemoryTexture*>));
define sealed domain initialize (<GdkMemoryTexture*>);

define inline-only C-function gdk-memory-texture-new
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter format_ :: <GdkMemoryFormat>;
  input parameter bytes_ :: <GBytes>;
  input parameter stride_ :: <C-unsigned-long>;
  result res :: <GdkMemoryTexture>;
  c-name: "gdk_memory_texture_new";
end;

define C-struct <_GdkMemoryTextureClass>
  pointer-type-name: <GdkMemoryTextureClass>;
end C-struct;

define sealed domain make (singleton(<GdkMemoryTextureClass>));
define sealed domain initialize (<GdkMemoryTextureClass>);

define inline-only constant $gdk-shift-mask = 1;
define inline-only constant $gdk-lock-mask = 2;
define inline-only constant $gdk-control-mask = 4;
define inline-only constant $gdk-alt-mask = 8;
define inline-only constant $gdk-button1-mask = 256;
define inline-only constant $gdk-button2-mask = 512;
define inline-only constant $gdk-button3-mask = 1024;
define inline-only constant $gdk-button4-mask = 2048;
define inline-only constant $gdk-button5-mask = 4096;
define inline-only constant $gdk-super-mask = 67108864;
define inline-only constant $gdk-hyper-mask = 134217728;
define inline-only constant $gdk-meta-mask = 268435456;
define constant <GdkModifierType> = <C-int>;
define C-pointer-type <GdkModifierType*> => <GdkModifierType>;

define open C-subtype <GdkMonitor> (<GObject>)
end C-subtype;

define C-pointer-type <GdkMonitor*> => <GdkMonitor>;

define sealed domain make (singleton(<GdkMonitor*>));
define sealed domain initialize (<GdkMonitor*>);

define inline-only C-function gdk-monitor-get-connector
  input parameter self :: <GdkMonitor>;
  result res :: <C-string>;
  c-name: "gdk_monitor_get_connector";
end;

define inline-only C-function gdk-monitor-get-display
  input parameter self :: <GdkMonitor>;
  result res :: <GdkDisplay>;
  c-name: "gdk_monitor_get_display";
end;

define inline-only C-function gdk-monitor-get-geometry
  input parameter self :: <GdkMonitor>;
  input parameter geometry_ :: <GdkRectangle>;
  c-name: "gdk_monitor_get_geometry";
end;

define inline-only C-function gdk-monitor-get-height-mm
  input parameter self :: <GdkMonitor>;
  result res :: <C-signed-int>;
  c-name: "gdk_monitor_get_height_mm";
end;

define inline-only C-function gdk-monitor-get-manufacturer
  input parameter self :: <GdkMonitor>;
  result res :: <C-string>;
  c-name: "gdk_monitor_get_manufacturer";
end;

define inline-only C-function gdk-monitor-get-model
  input parameter self :: <GdkMonitor>;
  result res :: <C-string>;
  c-name: "gdk_monitor_get_model";
end;

define inline-only C-function gdk-monitor-get-refresh-rate
  input parameter self :: <GdkMonitor>;
  result res :: <C-signed-int>;
  c-name: "gdk_monitor_get_refresh_rate";
end;

define inline-only C-function gdk-monitor-get-scale-factor
  input parameter self :: <GdkMonitor>;
  result res :: <C-signed-int>;
  c-name: "gdk_monitor_get_scale_factor";
end;

define inline-only C-function gdk-monitor-get-subpixel-layout
  input parameter self :: <GdkMonitor>;
  result res :: <GdkSubpixelLayout>;
  c-name: "gdk_monitor_get_subpixel_layout";
end;

define inline-only C-function gdk-monitor-get-width-mm
  input parameter self :: <GdkMonitor>;
  result res :: <C-signed-int>;
  c-name: "gdk_monitor_get_width_mm";
end;

define inline-only C-function gdk-monitor-is-valid
  input parameter self :: <GdkMonitor>;
  result res :: <C-boolean>;
  c-name: "gdk_monitor_is_valid";
end;

define C-struct <_GdkMonitorClass>
  pointer-type-name: <GdkMonitorClass>;
end C-struct;

define sealed domain make (singleton(<GdkMonitorClass>));
define sealed domain initialize (<GdkMonitorClass>);

define open C-subtype <GdkMotionEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkMotionEvent*> => <GdkMotionEvent>;

define sealed domain make (singleton(<GdkMotionEvent*>));
define sealed domain initialize (<GdkMotionEvent*>);

define inline-only constant $gdk-notify-ancestor = 0;
define inline-only constant $gdk-notify-virtual = 1;
define inline-only constant $gdk-notify-inferior = 2;
define inline-only constant $gdk-notify-nonlinear = 3;
define inline-only constant $gdk-notify-nonlinear-virtual = 4;
define inline-only constant $gdk-notify-unknown = 5;
define constant <GdkNotifyType> = <C-int>;
define C-pointer-type <GdkNotifyType*> => <GdkNotifyType>;

define inline-only constant $priority-redraw = 120;

define open C-subtype <GdkPadEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkPadEvent*> => <GdkPadEvent>;

define sealed domain make (singleton(<GdkPadEvent*>));
define sealed domain initialize (<GdkPadEvent*>);

define inline-only C-function gdk-pad-event-get-axis-value
  input parameter self :: <GdkPadEvent>;
  output parameter index_ :: <C-unsigned-int*>;
  output parameter value_ :: <C-double*>;
  c-name: "gdk_pad_event_get_axis_value";
end;

define inline-only C-function gdk-pad-event-get-button
  input parameter self :: <GdkPadEvent>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_pad_event_get_button";
end;

define inline-only C-function gdk-pad-event-get-group-mode
  input parameter self :: <GdkPadEvent>;
  output parameter group_ :: <C-unsigned-int*>;
  output parameter mode_ :: <C-unsigned-int*>;
  c-name: "gdk_pad_event_get_group_mode";
end;

// Interface
define open C-subtype <GdkPaintable> (<C-void*>)
end C-subtype;

define C-pointer-type <GdkPaintable*> => <GdkPaintable>;

define sealed domain make (singleton(<GdkPaintable*>));
define sealed domain initialize (<GdkPaintable*>);

define inline-only C-function gdk-paintable-new-empty
  input parameter intrinsic_width_ :: <C-signed-int>;
  input parameter intrinsic_height_ :: <C-signed-int>;
  result res :: <GdkPaintable>;
  c-name: "gdk_paintable_new_empty";
end;

define inline-only C-function gdk-paintable-compute-concrete-size
  input parameter self :: <GdkPaintable>;
  input parameter specified_width_ :: <C-double>;
  input parameter specified_height_ :: <C-double>;
  input parameter default_width_ :: <C-double>;
  input parameter default_height_ :: <C-double>;
  output parameter concrete_width_ :: <C-double*>;
  output parameter concrete_height_ :: <C-double*>;
  c-name: "gdk_paintable_compute_concrete_size";
end;

define inline-only C-function gdk-paintable-get-current-image
  input parameter self :: <GdkPaintable>;
  result res :: <GdkPaintable>;
  c-name: "gdk_paintable_get_current_image";
end;

define inline-only C-function gdk-paintable-get-flags
  input parameter self :: <GdkPaintable>;
  result res :: <GdkPaintableFlags>;
  c-name: "gdk_paintable_get_flags";
end;

define inline-only C-function gdk-paintable-get-intrinsic-aspect-ratio
  input parameter self :: <GdkPaintable>;
  result res :: <C-double>;
  c-name: "gdk_paintable_get_intrinsic_aspect_ratio";
end;

define inline-only C-function gdk-paintable-get-intrinsic-height
  input parameter self :: <GdkPaintable>;
  result res :: <C-signed-int>;
  c-name: "gdk_paintable_get_intrinsic_height";
end;

define inline-only C-function gdk-paintable-get-intrinsic-width
  input parameter self :: <GdkPaintable>;
  result res :: <C-signed-int>;
  c-name: "gdk_paintable_get_intrinsic_width";
end;

define inline-only C-function gdk-paintable-invalidate-contents
  input parameter self :: <GdkPaintable>;
  c-name: "gdk_paintable_invalidate_contents";
end;

define inline-only C-function gdk-paintable-invalidate-size
  input parameter self :: <GdkPaintable>;
  c-name: "gdk_paintable_invalidate_size";
end;

define inline-only C-function gdk-paintable-snapshot
  input parameter self :: <GdkPaintable>;
  input parameter snapshot_ :: <GdkSnapshot>;
  input parameter width_ :: <C-double>;
  input parameter height_ :: <C-double>;
  c-name: "gdk_paintable_snapshot";
end;

define inline-only constant $gdk-paintable-static-size = 1;
define inline-only constant $gdk-paintable-static-contents = 2;
define constant <GdkPaintableFlags> = <C-int>;
define C-pointer-type <GdkPaintableFlags*> => <GdkPaintableFlags>;

define C-struct <_GdkPaintableInterface>
  constant sealed inline-only slot gdk-paintable-interface-g-iface :: <GTypeInterface>;
  constant sealed inline-only slot gdk-paintable-interface-snapshot :: <C-function-pointer>;
  constant sealed inline-only slot gdk-paintable-interface-get-current-image :: <C-function-pointer>;
  constant sealed inline-only slot gdk-paintable-interface-get-flags :: <C-function-pointer>;
  constant sealed inline-only slot gdk-paintable-interface-get-intrinsic-width :: <C-function-pointer>;
  constant sealed inline-only slot gdk-paintable-interface-get-intrinsic-height :: <C-function-pointer>;
  constant sealed inline-only slot gdk-paintable-interface-get-intrinsic-aspect-ratio :: <C-function-pointer>;
  pointer-type-name: <GdkPaintableInterface>;
end C-struct;

define sealed domain make (singleton(<GdkPaintableInterface>));
define sealed domain initialize (<GdkPaintableInterface>);

// Interface
define open C-subtype <GdkPopup> (<GdkSurface>)
end C-subtype;

define C-pointer-type <GdkPopup*> => <GdkPopup>;

define sealed domain make (singleton(<GdkPopup*>));
define sealed domain initialize (<GdkPopup*>);

define inline-only C-function gdk-popup-get-autohide
  input parameter self :: <GdkPopup>;
  result res :: <C-boolean>;
  c-name: "gdk_popup_get_autohide";
end;

define inline-only C-function gdk-popup-get-parent
  input parameter self :: <GdkPopup>;
  result res :: <GdkSurface>;
  c-name: "gdk_popup_get_parent";
end;

define inline-only C-function gdk-popup-get-position-x
  input parameter self :: <GdkPopup>;
  result res :: <C-signed-int>;
  c-name: "gdk_popup_get_position_x";
end;

define inline-only C-function gdk-popup-get-position-y
  input parameter self :: <GdkPopup>;
  result res :: <C-signed-int>;
  c-name: "gdk_popup_get_position_y";
end;

define inline-only C-function gdk-popup-get-rect-anchor
  input parameter self :: <GdkPopup>;
  result res :: <GdkGravity>;
  c-name: "gdk_popup_get_rect_anchor";
end;

define inline-only C-function gdk-popup-get-surface-anchor
  input parameter self :: <GdkPopup>;
  result res :: <GdkGravity>;
  c-name: "gdk_popup_get_surface_anchor";
end;

define inline-only C-function gdk-popup-present
  input parameter self :: <GdkPopup>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter layout_ :: <GdkPopupLayout>;
  result res :: <C-boolean>;
  c-name: "gdk_popup_present";
end;

define C-struct <_GdkPopupInterface>
  pointer-type-name: <GdkPopupInterface>;
end C-struct;

define sealed domain make (singleton(<GdkPopupInterface>));
define sealed domain initialize (<GdkPopupInterface>);

define C-struct <_GdkPopupLayout>
  pointer-type-name: <GdkPopupLayout>;
end C-struct;

define sealed domain make (singleton(<GdkPopupLayout>));
define sealed domain initialize (<GdkPopupLayout>);

define inline-only C-function gdk-popup-layout-new
  input parameter anchor_rect_ :: <GdkRectangle>;
  input parameter rect_anchor_ :: <GdkGravity>;
  input parameter surface_anchor_ :: <GdkGravity>;
  result res :: <GdkPopupLayout>;
  c-name: "gdk_popup_layout_new";
end;

define inline-only C-function gdk-popup-layout-copy
  input parameter self :: <GdkPopupLayout>;
  result res :: <GdkPopupLayout>;
  c-name: "gdk_popup_layout_copy";
end;

define inline-only C-function gdk-popup-layout-equal
  input parameter self :: <GdkPopupLayout>;
  input parameter other_ :: <GdkPopupLayout>;
  result res :: <C-boolean>;
  c-name: "gdk_popup_layout_equal";
end;

define inline-only C-function gdk-popup-layout-get-anchor-hints
  input parameter self :: <GdkPopupLayout>;
  result res :: <GdkAnchorHints>;
  c-name: "gdk_popup_layout_get_anchor_hints";
end;

define inline-only C-function gdk-popup-layout-get-anchor-rect
  input parameter self :: <GdkPopupLayout>;
  result res :: <GdkRectangle>;
  c-name: "gdk_popup_layout_get_anchor_rect";
end;

define inline-only C-function gdk-popup-layout-get-offset
  input parameter self :: <GdkPopupLayout>;
  output parameter dx_ :: <C-signed-int*>;
  output parameter dy_ :: <C-signed-int*>;
  c-name: "gdk_popup_layout_get_offset";
end;

define inline-only C-function gdk-popup-layout-get-rect-anchor
  input parameter self :: <GdkPopupLayout>;
  result res :: <GdkGravity>;
  c-name: "gdk_popup_layout_get_rect_anchor";
end;

define inline-only C-function gdk-popup-layout-get-shadow-width
  input parameter self :: <GdkPopupLayout>;
  output parameter left_ :: <C-signed-int*>;
  output parameter right_ :: <C-signed-int*>;
  output parameter top_ :: <C-signed-int*>;
  output parameter bottom_ :: <C-signed-int*>;
  c-name: "gdk_popup_layout_get_shadow_width";
end;

define inline-only C-function gdk-popup-layout-get-surface-anchor
  input parameter self :: <GdkPopupLayout>;
  result res :: <GdkGravity>;
  c-name: "gdk_popup_layout_get_surface_anchor";
end;

define inline-only C-function gdk-popup-layout-ref
  input parameter self :: <GdkPopupLayout>;
  result res :: <GdkPopupLayout>;
  c-name: "gdk_popup_layout_ref";
end;

define inline-only C-function gdk-popup-layout-set-anchor-hints
  input parameter self :: <GdkPopupLayout>;
  input parameter anchor_hints_ :: <GdkAnchorHints>;
  c-name: "gdk_popup_layout_set_anchor_hints";
end;

define inline-only C-function gdk-popup-layout-set-anchor-rect
  input parameter self :: <GdkPopupLayout>;
  input parameter anchor_rect_ :: <GdkRectangle>;
  c-name: "gdk_popup_layout_set_anchor_rect";
end;

define inline-only C-function gdk-popup-layout-set-offset
  input parameter self :: <GdkPopupLayout>;
  input parameter dx_ :: <C-signed-int>;
  input parameter dy_ :: <C-signed-int>;
  c-name: "gdk_popup_layout_set_offset";
end;

define inline-only C-function gdk-popup-layout-set-rect-anchor
  input parameter self :: <GdkPopupLayout>;
  input parameter anchor_ :: <GdkGravity>;
  c-name: "gdk_popup_layout_set_rect_anchor";
end;

define inline-only C-function gdk-popup-layout-set-shadow-width
  input parameter self :: <GdkPopupLayout>;
  input parameter left_ :: <C-signed-int>;
  input parameter right_ :: <C-signed-int>;
  input parameter top_ :: <C-signed-int>;
  input parameter bottom_ :: <C-signed-int>;
  c-name: "gdk_popup_layout_set_shadow_width";
end;

define inline-only C-function gdk-popup-layout-set-surface-anchor
  input parameter self :: <GdkPopupLayout>;
  input parameter anchor_ :: <GdkGravity>;
  c-name: "gdk_popup_layout_set_surface_anchor";
end;

define inline-only C-function gdk-popup-layout-unref
  input parameter self :: <GdkPopupLayout>;
  c-name: "gdk_popup_layout_unref";
end;

define open C-subtype <GdkProximityEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkProximityEvent*> => <GdkProximityEvent>;

define sealed domain make (singleton(<GdkProximityEvent*>));
define sealed domain initialize (<GdkProximityEvent*>);

define C-struct <_GdkRGBA>
  sealed inline-only slot gdk-rgba-red :: <C-float>;
  sealed inline-only slot gdk-rgba-green :: <C-float>;
  sealed inline-only slot gdk-rgba-blue :: <C-float>;
  sealed inline-only slot gdk-rgba-alpha :: <C-float>;
  pointer-type-name: <GdkRGBA>;
end C-struct;

define sealed domain make (singleton(<GdkRGBA>));
define sealed domain initialize (<GdkRGBA>);

define inline-only C-function gdk-rgba-copy
  input parameter self :: <GdkRGBA>;
  result res :: <GdkRGBA>;
  c-name: "gdk_rgba_copy";
end;

define inline-only C-function gdk-rgba-equal
  input parameter self :: <GdkRGBA>;
  input parameter p2_ :: <GdkRGBA>;
  result res :: <C-boolean>;
  c-name: "gdk_rgba_equal";
end;

define inline-only C-function gdk-rgba-free
  input parameter self :: <GdkRGBA>;
  c-name: "gdk_rgba_free";
end;

define inline-only C-function gdk-rgba-hash
  input parameter self :: <GdkRGBA>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_rgba_hash";
end;

define inline-only C-function gdk-rgba-is-clear
  input parameter self :: <GdkRGBA>;
  result res :: <C-boolean>;
  c-name: "gdk_rgba_is_clear";
end;

define inline-only C-function gdk-rgba-is-opaque
  input parameter self :: <GdkRGBA>;
  result res :: <C-boolean>;
  c-name: "gdk_rgba_is_opaque";
end;

define inline-only C-function gdk-rgba-parse
  input parameter self :: <GdkRGBA>;
  input parameter spec_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gdk_rgba_parse";
end;

define inline-only C-function gdk-rgba-to-string
  input parameter self :: <GdkRGBA>;
  result res :: <C-string>;
  c-name: "gdk_rgba_to_string";
end;

define C-struct <_GdkRectangle>
  sealed inline-only slot gdk-rectangle-x :: <C-signed-int>;
  sealed inline-only slot gdk-rectangle-y :: <C-signed-int>;
  sealed inline-only slot gdk-rectangle-width :: <C-signed-int>;
  sealed inline-only slot gdk-rectangle-height :: <C-signed-int>;
  pointer-type-name: <GdkRectangle>;
end C-struct;

define sealed domain make (singleton(<GdkRectangle>));
define sealed domain initialize (<GdkRectangle>);

define inline-only C-function gdk-rectangle-contains-point
  input parameter self :: <GdkRectangle>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gdk_rectangle_contains_point";
end;

define inline-only C-function gdk-rectangle-equal
  input parameter self :: <GdkRectangle>;
  input parameter rect2_ :: <GdkRectangle>;
  result res :: <C-boolean>;
  c-name: "gdk_rectangle_equal";
end;

define inline-only C-function gdk-rectangle-intersect
  input parameter self :: <GdkRectangle>;
  input parameter src2_ :: <GdkRectangle>;
  input parameter dest_ :: <GdkRectangle>;
  result res :: <C-boolean>;
  c-name: "gdk_rectangle_intersect";
end;

define inline-only C-function gdk-rectangle-union
  input parameter self :: <GdkRectangle>;
  input parameter src2_ :: <GdkRectangle>;
  input parameter dest_ :: <GdkRectangle>;
  c-name: "gdk_rectangle_union";
end;

define inline-only constant $gdk-scroll-up = 0;
define inline-only constant $gdk-scroll-down = 1;
define inline-only constant $gdk-scroll-left = 2;
define inline-only constant $gdk-scroll-right = 3;
define inline-only constant $gdk-scroll-smooth = 4;
define constant <GdkScrollDirection> = <C-int>;
define C-pointer-type <GdkScrollDirection*> => <GdkScrollDirection>;

define open C-subtype <GdkScrollEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkScrollEvent*> => <GdkScrollEvent>;

define sealed domain make (singleton(<GdkScrollEvent*>));
define sealed domain initialize (<GdkScrollEvent*>);

define inline-only C-function gdk-scroll-event-get-deltas
  input parameter self :: <GdkScrollEvent>;
  output parameter delta_x_ :: <C-double*>;
  output parameter delta_y_ :: <C-double*>;
  c-name: "gdk_scroll_event_get_deltas";
end;

define inline-only C-function gdk-scroll-event-get-direction
  input parameter self :: <GdkScrollEvent>;
  result res :: <GdkScrollDirection>;
  c-name: "gdk_scroll_event_get_direction";
end;

define inline-only C-function gdk-scroll-event-get-unit
  input parameter self :: <GdkScrollEvent>;
  result res :: <GdkScrollUnit>;
  c-name: "gdk_scroll_event_get_unit";
end;

define inline-only C-function gdk-scroll-event-is-stop
  input parameter self :: <GdkScrollEvent>;
  result res :: <C-boolean>;
  c-name: "gdk_scroll_event_is_stop";
end;

define inline-only constant $gdk-scroll-unit-wheel = 0;
define inline-only constant $gdk-scroll-unit-surface = 1;
define constant <GdkScrollUnit> = <C-int>;
define C-pointer-type <GdkScrollUnit*> => <GdkScrollUnit>;

define open C-subtype <GdkSeat> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GdkSeat*> => <GdkSeat>;

define sealed domain make (singleton(<GdkSeat*>));
define sealed domain initialize (<GdkSeat*>);

define inline-only C-function gdk-seat-get-capabilities
  input parameter self :: <GdkSeat>;
  result res :: <GdkSeatCapabilities>;
  c-name: "gdk_seat_get_capabilities";
end;

define inline-only C-function gdk-seat-get-devices
  input parameter self :: <GdkSeat>;
  input parameter capabilities_ :: <GdkSeatCapabilities>;
  result res :: <GList>;
  c-name: "gdk_seat_get_devices";
end;

define inline-only C-function gdk-seat-get-display
  input parameter self :: <GdkSeat>;
  result res :: <GdkDisplay>;
  c-name: "gdk_seat_get_display";
end;

define inline-only C-function gdk-seat-get-keyboard
  input parameter self :: <GdkSeat>;
  result res :: <GdkDevice>;
  c-name: "gdk_seat_get_keyboard";
end;

define inline-only C-function gdk-seat-get-pointer
  input parameter self :: <GdkSeat>;
  result res :: <GdkDevice>;
  c-name: "gdk_seat_get_pointer";
end;

define inline-only C-function gdk-seat-get-tools
  input parameter self :: <GdkSeat>;
  result res :: <GList>;
  c-name: "gdk_seat_get_tools";
end;

define inline-only constant $gdk-seat-capability-none = 0;
define inline-only constant $gdk-seat-capability-pointer = 1;
define inline-only constant $gdk-seat-capability-touch = 2;
define inline-only constant $gdk-seat-capability-tablet-stylus = 4;
define inline-only constant $gdk-seat-capability-keyboard = 8;
define inline-only constant $gdk-seat-capability-tablet-pad = 16;
define inline-only constant $gdk-seat-capability-all-pointing = 7;
define inline-only constant $gdk-seat-capability-all = 15;
define constant <GdkSeatCapabilities> = <C-int>;
define C-pointer-type <GdkSeatCapabilities*> => <GdkSeatCapabilities>;

define open C-subtype <GdkSnapshot> (<GObject>)
end C-subtype;

define C-pointer-type <GdkSnapshot*> => <GdkSnapshot>;

define sealed domain make (singleton(<GdkSnapshot*>));
define sealed domain initialize (<GdkSnapshot*>);

define C-struct <_GdkSnapshotClass>
  pointer-type-name: <GdkSnapshotClass>;
end C-struct;

define sealed domain make (singleton(<GdkSnapshotClass>));
define sealed domain initialize (<GdkSnapshotClass>);

define inline-only constant $gdk-subpixel-layout-unknown = 0;
define inline-only constant $gdk-subpixel-layout-none = 1;
define inline-only constant $gdk-subpixel-layout-horizontal-rgb = 2;
define inline-only constant $gdk-subpixel-layout-horizontal-bgr = 3;
define inline-only constant $gdk-subpixel-layout-vertical-rgb = 4;
define inline-only constant $gdk-subpixel-layout-vertical-bgr = 5;
define constant <GdkSubpixelLayout> = <C-int>;
define C-pointer-type <GdkSubpixelLayout*> => <GdkSubpixelLayout>;

define open C-subtype <GdkSurface> (<GObject>)
end C-subtype;

define C-pointer-type <GdkSurface*> => <GdkSurface>;

define sealed domain make (singleton(<GdkSurface*>));
define sealed domain initialize (<GdkSurface*>);

define inline-only C-function gdk-surface-new-popup
  input parameter parent_ :: <GdkSurface>;
  input parameter autohide_ :: <C-boolean>;
  result res :: <GdkSurface>;
  c-name: "gdk_surface_new_popup";
end;

define inline-only C-function gdk-surface-new-toplevel
  input parameter display_ :: <GdkDisplay>;
  result res :: <GdkSurface>;
  c-name: "gdk_surface_new_toplevel";
end;

define inline-only C-function gdk-surface-beep
  input parameter self :: <GdkSurface>;
  c-name: "gdk_surface_beep";
end;

define inline-only C-function gdk-surface-create-cairo-context
  input parameter self :: <GdkSurface>;
  result res :: <GdkCairoContext>;
  c-name: "gdk_surface_create_cairo_context";
end;

define inline-only C-function gdk-surface-create-gl-context
  input parameter self :: <GdkSurface>;
  output parameter error_ :: <GError*>;
  result res :: <GdkGLContext>;
  c-name: "gdk_surface_create_gl_context";
end;

define inline-only C-function gdk-surface-create-similar-surface
  input parameter self :: <GdkSurface>;
  input parameter content_ :: <cairoContent>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  result res :: <cairoSurface>;
  c-name: "gdk_surface_create_similar_surface";
end;

define inline-only C-function gdk-surface-create-vulkan-context
  input parameter self :: <GdkSurface>;
  output parameter error_ :: <GError*>;
  result res :: <GdkVulkanContext>;
  c-name: "gdk_surface_create_vulkan_context";
end;

define inline-only C-function gdk-surface-destroy
  input parameter self :: <GdkSurface>;
  c-name: "gdk_surface_destroy";
end;

define inline-only C-function gdk-surface-get-cursor
  input parameter self :: <GdkSurface>;
  result res :: <GdkCursor>;
  c-name: "gdk_surface_get_cursor";
end;

define inline-only C-function gdk-surface-get-device-cursor
  input parameter self :: <GdkSurface>;
  input parameter device_ :: <GdkDevice>;
  result res :: <GdkCursor>;
  c-name: "gdk_surface_get_device_cursor";
end;

define inline-only C-function gdk-surface-get-device-position
  input parameter self :: <GdkSurface>;
  input parameter device_ :: <GdkDevice>;
  output parameter x_ :: <C-double*>;
  output parameter y_ :: <C-double*>;
  output parameter mask_ :: <GdkModifierType*>;
  result res :: <C-boolean>;
  c-name: "gdk_surface_get_device_position";
end;

define inline-only C-function gdk-surface-get-display
  input parameter self :: <GdkSurface>;
  result res :: <GdkDisplay>;
  c-name: "gdk_surface_get_display";
end;

define inline-only C-function gdk-surface-get-frame-clock
  input parameter self :: <GdkSurface>;
  result res :: <GdkFrameClock>;
  c-name: "gdk_surface_get_frame_clock";
end;

define inline-only C-function gdk-surface-get-height
  input parameter self :: <GdkSurface>;
  result res :: <C-signed-int>;
  c-name: "gdk_surface_get_height";
end;

define inline-only C-function gdk-surface-get-mapped
  input parameter self :: <GdkSurface>;
  result res :: <C-boolean>;
  c-name: "gdk_surface_get_mapped";
end;

define inline-only C-function gdk-surface-get-scale-factor
  input parameter self :: <GdkSurface>;
  result res :: <C-signed-int>;
  c-name: "gdk_surface_get_scale_factor";
end;

define inline-only C-function gdk-surface-get-width
  input parameter self :: <GdkSurface>;
  result res :: <C-signed-int>;
  c-name: "gdk_surface_get_width";
end;

define inline-only C-function gdk-surface-hide
  input parameter self :: <GdkSurface>;
  c-name: "gdk_surface_hide";
end;

define inline-only C-function gdk-surface-is-destroyed
  input parameter self :: <GdkSurface>;
  result res :: <C-boolean>;
  c-name: "gdk_surface_is_destroyed";
end;

define inline-only C-function gdk-surface-queue-render
  input parameter self :: <GdkSurface>;
  c-name: "gdk_surface_queue_render";
end;

define inline-only C-function gdk-surface-request-layout
  input parameter self :: <GdkSurface>;
  c-name: "gdk_surface_request_layout";
end;

define inline-only C-function gdk-surface-set-cursor
  input parameter self :: <GdkSurface>;
  input parameter cursor_ :: <GdkCursor>;
  c-name: "gdk_surface_set_cursor";
end;

define inline-only C-function gdk-surface-set-device-cursor
  input parameter self :: <GdkSurface>;
  input parameter device_ :: <GdkDevice>;
  input parameter cursor_ :: <GdkCursor>;
  c-name: "gdk_surface_set_device_cursor";
end;

define inline-only C-function gdk-surface-set-input-region
  input parameter self :: <GdkSurface>;
  input parameter region_ :: <cairoRegion>;
  c-name: "gdk_surface_set_input_region";
end;

define inline-only C-function gdk-surface-set-opaque-region
  input parameter self :: <GdkSurface>;
  input parameter region_ :: <cairoRegion>;
  c-name: "gdk_surface_set_opaque_region";
end;

define inline-only C-function gdk-surface-translate-coordinates
  input parameter self :: <GdkSurface>;
  input parameter to_ :: <GdkSurface>;
  input output parameter x_ :: <C-double*>;
  input output parameter y_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "gdk_surface_translate_coordinates";
end;

define C-struct <_GdkSurfaceClass>
  pointer-type-name: <GdkSurfaceClass>;
end C-struct;

define sealed domain make (singleton(<GdkSurfaceClass>));
define sealed domain initialize (<GdkSurfaceClass>);

define inline-only constant $gdk-surface-edge-north-west = 0;
define inline-only constant $gdk-surface-edge-north = 1;
define inline-only constant $gdk-surface-edge-north-east = 2;
define inline-only constant $gdk-surface-edge-west = 3;
define inline-only constant $gdk-surface-edge-east = 4;
define inline-only constant $gdk-surface-edge-south-west = 5;
define inline-only constant $gdk-surface-edge-south = 6;
define inline-only constant $gdk-surface-edge-south-east = 7;
define constant <GdkSurfaceEdge> = <C-int>;
define C-pointer-type <GdkSurfaceEdge*> => <GdkSurfaceEdge>;

define open C-subtype <GdkTexture> (<GObject>, <GdkPaintable>, <GLoadableIcon>)
end C-subtype;

define C-pointer-type <GdkTexture*> => <GdkTexture>;

define sealed domain make (singleton(<GdkTexture*>));
define sealed domain initialize (<GdkTexture*>);

define inline-only C-function gdk-texture-new-for-pixbuf
  input parameter pixbuf_ :: <GdkPixbuf>;
  result res :: <GdkTexture>;
  c-name: "gdk_texture_new_for_pixbuf";
end;

define inline-only C-function gdk-texture-new-from-bytes
  input parameter bytes_ :: <GBytes>;
  output parameter error_ :: <GError*>;
  result res :: <GdkTexture>;
  c-name: "gdk_texture_new_from_bytes";
end;

define inline-only C-function gdk-texture-new-from-file
  input parameter file_ :: <GFile>;
  output parameter error_ :: <GError*>;
  result res :: <GdkTexture>;
  c-name: "gdk_texture_new_from_file";
end;

define inline-only C-function gdk-texture-new-from-filename
  input parameter path_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GdkTexture>;
  c-name: "gdk_texture_new_from_filename";
end;

define inline-only C-function gdk-texture-new-from-resource
  input parameter resource_path_ :: <C-string>;
  result res :: <GdkTexture>;
  c-name: "gdk_texture_new_from_resource";
end;

define inline-only C-function gdk-texture-download
  input parameter self :: <GdkTexture>;
  input parameter data_ :: <C-unsigned-char*>;
  input parameter stride_ :: <C-unsigned-long>;
  c-name: "gdk_texture_download";
end;

define inline-only C-function gdk-texture-get-height
  input parameter self :: <GdkTexture>;
  result res :: <C-signed-int>;
  c-name: "gdk_texture_get_height";
end;

define inline-only C-function gdk-texture-get-width
  input parameter self :: <GdkTexture>;
  result res :: <C-signed-int>;
  c-name: "gdk_texture_get_width";
end;

define inline-only C-function gdk-texture-save-to-png
  input parameter self :: <GdkTexture>;
  input parameter filename_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gdk_texture_save_to_png";
end;

define inline-only C-function gdk-texture-save-to-png-bytes
  input parameter self :: <GdkTexture>;
  result res :: <GBytes>;
  c-name: "gdk_texture_save_to_png_bytes";
end;

define inline-only C-function gdk-texture-save-to-tiff
  input parameter self :: <GdkTexture>;
  input parameter filename_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gdk_texture_save_to_tiff";
end;

define inline-only C-function gdk-texture-save-to-tiff-bytes
  input parameter self :: <GdkTexture>;
  result res :: <GBytes>;
  c-name: "gdk_texture_save_to_tiff_bytes";
end;

define C-struct <_GdkTextureClass>
  pointer-type-name: <GdkTextureClass>;
end C-struct;

define sealed domain make (singleton(<GdkTextureClass>));
define sealed domain initialize (<GdkTextureClass>);

define inline-only constant $gdk-texture-error-too-large = 0;
define inline-only constant $gdk-texture-error-corrupt-image = 1;
define inline-only constant $gdk-texture-error-unsupported-content = 2;
define inline-only constant $gdk-texture-error-unsupported-format = 3;
define constant <GdkTextureError> = <C-int>;
define C-pointer-type <GdkTextureError*> => <GdkTextureError>;

define C-struct <_GdkTimeCoord>
  sealed inline-only slot gdk-time-coord-time :: <C-unsigned-int>;
  sealed inline-only slot gdk-time-coord-flags :: <GdkAxisFlags>;
  sealed inline-only slot gdk-time-coord-axes :: <C-double*>;
  pointer-type-name: <GdkTimeCoord>;
end C-struct;

define sealed domain make (singleton(<GdkTimeCoord>));
define sealed domain initialize (<GdkTimeCoord>);

define inline-only constant $gdk-titlebar-gesture-double-click = 1;
define inline-only constant $gdk-titlebar-gesture-right-click = 2;
define inline-only constant $gdk-titlebar-gesture-middle-click = 3;
define constant <GdkTitlebarGesture> = <C-int>;
define C-pointer-type <GdkTitlebarGesture*> => <GdkTitlebarGesture>;

// Interface
define open C-subtype <GdkToplevel> (<GdkSurface>)
end C-subtype;

define C-pointer-type <GdkToplevel*> => <GdkToplevel>;

define sealed domain make (singleton(<GdkToplevel*>));
define sealed domain initialize (<GdkToplevel*>);

define inline-only C-function gdk-toplevel-begin-move
  input parameter self :: <GdkToplevel>;
  input parameter device_ :: <GdkDevice>;
  input parameter button_ :: <C-signed-int>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter timestamp_ :: <C-unsigned-int>;
  c-name: "gdk_toplevel_begin_move";
end;

define inline-only C-function gdk-toplevel-begin-resize
  input parameter self :: <GdkToplevel>;
  input parameter edge_ :: <GdkSurfaceEdge>;
  input parameter device_ :: <GdkDevice>;
  input parameter button_ :: <C-signed-int>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  input parameter timestamp_ :: <C-unsigned-int>;
  c-name: "gdk_toplevel_begin_resize";
end;

define inline-only C-function gdk-toplevel-focus
  input parameter self :: <GdkToplevel>;
  input parameter timestamp_ :: <C-unsigned-int>;
  c-name: "gdk_toplevel_focus";
end;

define inline-only C-function gdk-toplevel-get-state
  input parameter self :: <GdkToplevel>;
  result res :: <GdkToplevelState>;
  c-name: "gdk_toplevel_get_state";
end;

define inline-only C-function gdk-toplevel-inhibit-system-shortcuts
  input parameter self :: <GdkToplevel>;
  input parameter event_ :: <GdkEvent>;
  c-name: "gdk_toplevel_inhibit_system_shortcuts";
end;

define inline-only C-function gdk-toplevel-lower
  input parameter self :: <GdkToplevel>;
  result res :: <C-boolean>;
  c-name: "gdk_toplevel_lower";
end;

define inline-only C-function gdk-toplevel-minimize
  input parameter self :: <GdkToplevel>;
  result res :: <C-boolean>;
  c-name: "gdk_toplevel_minimize";
end;

define inline-only C-function gdk-toplevel-present
  input parameter self :: <GdkToplevel>;
  input parameter layout_ :: <GdkToplevelLayout>;
  c-name: "gdk_toplevel_present";
end;

define inline-only C-function gdk-toplevel-restore-system-shortcuts
  input parameter self :: <GdkToplevel>;
  c-name: "gdk_toplevel_restore_system_shortcuts";
end;

define inline-only C-function gdk-toplevel-set-decorated
  input parameter self :: <GdkToplevel>;
  input parameter decorated_ :: <C-boolean>;
  c-name: "gdk_toplevel_set_decorated";
end;

define inline-only C-function gdk-toplevel-set-deletable
  input parameter self :: <GdkToplevel>;
  input parameter deletable_ :: <C-boolean>;
  c-name: "gdk_toplevel_set_deletable";
end;

define inline-only C-function gdk-toplevel-set-icon-list
  input parameter self :: <GdkToplevel>;
  input parameter surfaces_ :: <GList>;
  c-name: "gdk_toplevel_set_icon_list";
end;

define inline-only C-function gdk-toplevel-set-modal
  input parameter self :: <GdkToplevel>;
  input parameter modal_ :: <C-boolean>;
  c-name: "gdk_toplevel_set_modal";
end;

define inline-only C-function gdk-toplevel-set-startup-id
  input parameter self :: <GdkToplevel>;
  input parameter startup_id_ :: <C-string>;
  c-name: "gdk_toplevel_set_startup_id";
end;

define inline-only C-function gdk-toplevel-set-title
  input parameter self :: <GdkToplevel>;
  input parameter title_ :: <C-string>;
  c-name: "gdk_toplevel_set_title";
end;

define inline-only C-function gdk-toplevel-set-transient-for
  input parameter self :: <GdkToplevel>;
  input parameter parent_ :: <GdkSurface>;
  c-name: "gdk_toplevel_set_transient_for";
end;

define inline-only C-function gdk-toplevel-show-window-menu
  input parameter self :: <GdkToplevel>;
  input parameter event_ :: <GdkEvent>;
  result res :: <C-boolean>;
  c-name: "gdk_toplevel_show_window_menu";
end;

define inline-only C-function gdk-toplevel-supports-edge-constraints
  input parameter self :: <GdkToplevel>;
  result res :: <C-boolean>;
  c-name: "gdk_toplevel_supports_edge_constraints";
end;

define inline-only C-function gdk-toplevel-titlebar-gesture
  input parameter self :: <GdkToplevel>;
  input parameter gesture_ :: <GdkTitlebarGesture>;
  result res :: <C-boolean>;
  c-name: "gdk_toplevel_titlebar_gesture";
end;

define C-struct <_GdkToplevelInterface>
  pointer-type-name: <GdkToplevelInterface>;
end C-struct;

define sealed domain make (singleton(<GdkToplevelInterface>));
define sealed domain initialize (<GdkToplevelInterface>);

define C-struct <_GdkToplevelLayout>
  pointer-type-name: <GdkToplevelLayout>;
end C-struct;

define sealed domain make (singleton(<GdkToplevelLayout>));
define sealed domain initialize (<GdkToplevelLayout>);

define inline-only C-function gdk-toplevel-layout-new
  result res :: <GdkToplevelLayout>;
  c-name: "gdk_toplevel_layout_new";
end;

define inline-only C-function gdk-toplevel-layout-copy
  input parameter self :: <GdkToplevelLayout>;
  result res :: <GdkToplevelLayout>;
  c-name: "gdk_toplevel_layout_copy";
end;

define inline-only C-function gdk-toplevel-layout-equal
  input parameter self :: <GdkToplevelLayout>;
  input parameter other_ :: <GdkToplevelLayout>;
  result res :: <C-boolean>;
  c-name: "gdk_toplevel_layout_equal";
end;

define inline-only C-function gdk-toplevel-layout-get-fullscreen
  input parameter self :: <GdkToplevelLayout>;
  output parameter fullscreen_ :: <C-int*>;
  result res :: <C-boolean>;
  c-name: "gdk_toplevel_layout_get_fullscreen";
end;

define inline-only C-function gdk-toplevel-layout-get-fullscreen-monitor
  input parameter self :: <GdkToplevelLayout>;
  result res :: <GdkMonitor>;
  c-name: "gdk_toplevel_layout_get_fullscreen_monitor";
end;

define inline-only C-function gdk-toplevel-layout-get-maximized
  input parameter self :: <GdkToplevelLayout>;
  output parameter maximized_ :: <C-int*>;
  result res :: <C-boolean>;
  c-name: "gdk_toplevel_layout_get_maximized";
end;

define inline-only C-function gdk-toplevel-layout-get-resizable
  input parameter self :: <GdkToplevelLayout>;
  result res :: <C-boolean>;
  c-name: "gdk_toplevel_layout_get_resizable";
end;

define inline-only C-function gdk-toplevel-layout-ref
  input parameter self :: <GdkToplevelLayout>;
  result res :: <GdkToplevelLayout>;
  c-name: "gdk_toplevel_layout_ref";
end;

define inline-only C-function gdk-toplevel-layout-set-fullscreen
  input parameter self :: <GdkToplevelLayout>;
  input parameter fullscreen_ :: <C-boolean>;
  input parameter monitor_ :: <GdkMonitor>;
  c-name: "gdk_toplevel_layout_set_fullscreen";
end;

define inline-only C-function gdk-toplevel-layout-set-maximized
  input parameter self :: <GdkToplevelLayout>;
  input parameter maximized_ :: <C-boolean>;
  c-name: "gdk_toplevel_layout_set_maximized";
end;

define inline-only C-function gdk-toplevel-layout-set-resizable
  input parameter self :: <GdkToplevelLayout>;
  input parameter resizable_ :: <C-boolean>;
  c-name: "gdk_toplevel_layout_set_resizable";
end;

define inline-only C-function gdk-toplevel-layout-unref
  input parameter self :: <GdkToplevelLayout>;
  c-name: "gdk_toplevel_layout_unref";
end;

define C-struct <_GdkToplevelSize>
  pointer-type-name: <GdkToplevelSize>;
end C-struct;

define sealed domain make (singleton(<GdkToplevelSize>));
define sealed domain initialize (<GdkToplevelSize>);

define inline-only C-function gdk-toplevel-size-get-bounds
  input parameter self :: <GdkToplevelSize>;
  output parameter bounds_width_ :: <C-signed-int*>;
  output parameter bounds_height_ :: <C-signed-int*>;
  c-name: "gdk_toplevel_size_get_bounds";
end;

define inline-only C-function gdk-toplevel-size-set-min-size
  input parameter self :: <GdkToplevelSize>;
  input parameter min_width_ :: <C-signed-int>;
  input parameter min_height_ :: <C-signed-int>;
  c-name: "gdk_toplevel_size_set_min_size";
end;

define inline-only C-function gdk-toplevel-size-set-shadow-width
  input parameter self :: <GdkToplevelSize>;
  input parameter left_ :: <C-signed-int>;
  input parameter right_ :: <C-signed-int>;
  input parameter top_ :: <C-signed-int>;
  input parameter bottom_ :: <C-signed-int>;
  c-name: "gdk_toplevel_size_set_shadow_width";
end;

define inline-only C-function gdk-toplevel-size-set-size
  input parameter self :: <GdkToplevelSize>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gdk_toplevel_size_set_size";
end;

define inline-only constant $gdk-toplevel-state-minimized = 1;
define inline-only constant $gdk-toplevel-state-maximized = 2;
define inline-only constant $gdk-toplevel-state-sticky = 4;
define inline-only constant $gdk-toplevel-state-fullscreen = 8;
define inline-only constant $gdk-toplevel-state-above = 16;
define inline-only constant $gdk-toplevel-state-below = 32;
define inline-only constant $gdk-toplevel-state-focused = 64;
define inline-only constant $gdk-toplevel-state-tiled = 128;
define inline-only constant $gdk-toplevel-state-top-tiled = 256;
define inline-only constant $gdk-toplevel-state-top-resizable = 512;
define inline-only constant $gdk-toplevel-state-right-tiled = 1024;
define inline-only constant $gdk-toplevel-state-right-resizable = 2048;
define inline-only constant $gdk-toplevel-state-bottom-tiled = 4096;
define inline-only constant $gdk-toplevel-state-bottom-resizable = 8192;
define inline-only constant $gdk-toplevel-state-left-tiled = 16384;
define inline-only constant $gdk-toplevel-state-left-resizable = 32768;
define constant <GdkToplevelState> = <C-int>;
define C-pointer-type <GdkToplevelState*> => <GdkToplevelState>;

define open C-subtype <GdkTouchEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkTouchEvent*> => <GdkTouchEvent>;

define sealed domain make (singleton(<GdkTouchEvent*>));
define sealed domain initialize (<GdkTouchEvent*>);

define inline-only C-function gdk-touch-event-get-emulating-pointer
  input parameter self :: <GdkTouchEvent>;
  result res :: <C-boolean>;
  c-name: "gdk_touch_event_get_emulating_pointer";
end;

define open C-subtype <GdkTouchpadEvent> (<GdkEvent>)
end C-subtype;

define C-pointer-type <GdkTouchpadEvent*> => <GdkTouchpadEvent>;

define sealed domain make (singleton(<GdkTouchpadEvent*>));
define sealed domain initialize (<GdkTouchpadEvent*>);

define inline-only C-function gdk-touchpad-event-get-deltas
  input parameter self :: <GdkTouchpadEvent>;
  output parameter dx_ :: <C-double*>;
  output parameter dy_ :: <C-double*>;
  c-name: "gdk_touchpad_event_get_deltas";
end;

define inline-only C-function gdk-touchpad-event-get-gesture-phase
  input parameter self :: <GdkTouchpadEvent>;
  result res :: <GdkTouchpadGesturePhase>;
  c-name: "gdk_touchpad_event_get_gesture_phase";
end;

define inline-only C-function gdk-touchpad-event-get-n-fingers
  input parameter self :: <GdkTouchpadEvent>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_touchpad_event_get_n_fingers";
end;

define inline-only C-function gdk-touchpad-event-get-pinch-angle-delta
  input parameter self :: <GdkTouchpadEvent>;
  result res :: <C-double>;
  c-name: "gdk_touchpad_event_get_pinch_angle_delta";
end;

define inline-only C-function gdk-touchpad-event-get-pinch-scale
  input parameter self :: <GdkTouchpadEvent>;
  result res :: <C-double>;
  c-name: "gdk_touchpad_event_get_pinch_scale";
end;

define inline-only constant $gdk-touchpad-gesture-phase-begin = 0;
define inline-only constant $gdk-touchpad-gesture-phase-update = 1;
define inline-only constant $gdk-touchpad-gesture-phase-end = 2;
define inline-only constant $gdk-touchpad-gesture-phase-cancel = 3;
define constant <GdkTouchpadGesturePhase> = <C-int>;
define C-pointer-type <GdkTouchpadGesturePhase*> => <GdkTouchpadGesturePhase>;

define open C-subtype <GdkVulkanContext> (<GdkDrawContext>, <GInitable>)
end C-subtype;

define C-pointer-type <GdkVulkanContext*> => <GdkVulkanContext>;

define sealed domain make (singleton(<GdkVulkanContext*>));
define sealed domain initialize (<GdkVulkanContext*>);

define inline-only constant $gdk-vulkan-error-unsupported = 0;
define inline-only constant $gdk-vulkan-error-not-available = 1;
define constant <GdkVulkanError> = <C-int>;
define C-pointer-type <GdkVulkanError*> => <GdkVulkanError>;

define inline-only C-function gdk-cairo-rectangle
  input parameter cr_ :: <cairoContext>;
  input parameter rectangle_ :: <GdkRectangle>;
  c-name: "gdk_cairo_rectangle";
end;

define inline-only C-function gdk-cairo-region
  input parameter cr_ :: <cairoContext>;
  input parameter region_ :: <cairoRegion>;
  c-name: "gdk_cairo_region";
end;

define inline-only C-function gdk-cairo-region-create-from-surface
  input parameter surface_ :: <cairoSurface>;
  result res :: <cairoRegion>;
  c-name: "gdk_cairo_region_create_from_surface";
end;

define inline-only C-function gdk-cairo-set-source-pixbuf
  input parameter cr_ :: <cairoContext>;
  input parameter pixbuf_ :: <GdkPixbuf>;
  input parameter pixbuf_x_ :: <C-double>;
  input parameter pixbuf_y_ :: <C-double>;
  c-name: "gdk_cairo_set_source_pixbuf";
end;

define inline-only C-function gdk-cairo-set-source-rgba
  input parameter cr_ :: <cairoContext>;
  input parameter rgba_ :: <GdkRGBA>;
  c-name: "gdk_cairo_set_source_rgba";
end;

define inline-only C-function gdk-content-deserialize-async
  input parameter stream_ :: <GInputStream>;
  input parameter mime_type_ :: <C-string>;
  input parameter type_ :: <C-long>;
  input parameter io_priority_ :: <C-signed-int>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_content_deserialize_async";
end;

define inline-only C-function gdk-content-deserialize-finish
  input parameter result_ :: <GAsyncResult>;
  input parameter value_ :: <GValue>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_content_deserialize_finish";
end;

define inline-only C-function gdk-content-register-deserializer
  input parameter mime_type_ :: <C-string>;
  input parameter type_ :: <C-long>;
  input parameter deserialize_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter notify_ :: <C-function-pointer>;
  c-name: "gdk_content_register_deserializer";
end;

define inline-only C-function gdk-content-register-serializer
  input parameter type_ :: <C-long>;
  input parameter mime_type_ :: <C-string>;
  input parameter serialize_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  input parameter notify_ :: <C-function-pointer>;
  c-name: "gdk_content_register_serializer";
end;

define inline-only C-function gdk-content-serialize-async
  input parameter stream_ :: <GOutputStream>;
  input parameter mime_type_ :: <C-string>;
  input parameter value_ :: <GValue>;
  input parameter io_priority_ :: <C-signed-int>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_content_serialize_async";
end;

define inline-only C-function gdk-content-serialize-finish
  input parameter result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_content_serialize_finish";
end;

define inline-only C-function gdk-drag-action-is-unique
  input parameter action_ :: <GdkDragAction>;
  result res :: <C-boolean>;
  c-name: "gdk_drag_action_is_unique";
end;

define inline-only C-function gdk-gl-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gdk_gl_error_quark";
end;

define inline-only C-function gdk-intern-mime-type
  input parameter string_ :: <C-string>;
  result res :: <C-string>;
  c-name: "gdk_intern_mime_type";
end;

define inline-only C-function gdk-keyval-convert-case
  input parameter symbol_ :: <C-unsigned-int>;
  output parameter lower_ :: <C-unsigned-int*>;
  output parameter upper_ :: <C-unsigned-int*>;
  c-name: "gdk_keyval_convert_case";
end;

define inline-only C-function gdk-keyval-from-name
  input parameter keyval_name_ :: <C-string>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_keyval_from_name";
end;

define inline-only C-function gdk-keyval-is-lower
  input parameter keyval_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "gdk_keyval_is_lower";
end;

define inline-only C-function gdk-keyval-is-upper
  input parameter keyval_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "gdk_keyval_is_upper";
end;

define inline-only C-function gdk-keyval-name
  input parameter keyval_ :: <C-unsigned-int>;
  result res :: <C-string>;
  c-name: "gdk_keyval_name";
end;

define inline-only C-function gdk-keyval-to-lower
  input parameter keyval_ :: <C-unsigned-int>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_keyval_to_lower";
end;

define inline-only C-function gdk-keyval-to-unicode
  input parameter keyval_ :: <C-unsigned-int>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_keyval_to_unicode";
end;

define inline-only C-function gdk-keyval-to-upper
  input parameter keyval_ :: <C-unsigned-int>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_keyval_to_upper";
end;

define inline-only C-function gdk-pixbuf-get-from-surface
  input parameter surface_ :: <cairoSurface>;
  input parameter src_x_ :: <C-signed-int>;
  input parameter src_y_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_get_from_surface";
end;

define inline-only C-function gdk-pixbuf-get-from-texture
  input parameter texture_ :: <GdkTexture>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_get_from_texture";
end;

define inline-only C-function gdk-set-allowed-backends
  input parameter backends_ :: <C-string>;
  c-name: "gdk_set_allowed_backends";
end;

define inline-only C-function gdk-texture-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gdk_texture_error_quark";
end;

define inline-only C-function gdk-toplevel-size-get-type
  result res :: <C-long>;
  c-name: "gdk_toplevel_size_get_type";
end;

define inline-only C-function gdk-unicode-to-keyval
  input parameter wc_ :: <C-unsigned-int>;
  result res :: <C-unsigned-int>;
  c-name: "gdk_unicode_to_keyval";
end;

define inline-only C-function gdk-vulkan-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gdk_vulkan_error_quark";
end;

