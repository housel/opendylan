module: gdkpixbuf
synopsis: generated bindings for the GdkPixbuf library
copyright: See LICENSE file in this distribution.


define C-pointer-type <C-void**> => <C-void*>;
ignore(<C-void**>);

define C-pointer-type <GError*> => <GError>;
ignore(<GError*>);

define inline-only constant $gdk-colorspace-rgb = 0;
define constant <GdkColorspace> = <C-int>;
define C-pointer-type <GdkColorspace*> => <GdkColorspace>;

define inline-only constant $gdk-interp-nearest = 0;
define inline-only constant $gdk-interp-tiles = 1;
define inline-only constant $gdk-interp-bilinear = 2;
define inline-only constant $gdk-interp-hyper = 3;
define constant <GdkInterpType> = <C-int>;
define C-pointer-type <GdkInterpType*> => <GdkInterpType>;

define inline-only constant $pixbuf-major = 2;

define inline-only constant $pixbuf-micro = 10;

define inline-only constant $pixbuf-minor = 42;

define inline-only constant $pixbuf-version = "2.42.10";

define open C-subtype <GdkPixbuf> (<GObject>, <GLoadableIcon>)
end C-subtype;

define C-pointer-type <GdkPixbuf*> => <GdkPixbuf>;

define sealed domain make (singleton(<GdkPixbuf*>));
define sealed domain initialize (<GdkPixbuf*>);

define inline-only C-function gdk-pixbuf-new
  input parameter colorspace_ :: <GdkColorspace>;
  input parameter has_alpha_ :: <C-boolean>;
  input parameter bits_per_sample_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new";
end;

define inline-only C-function gdk-pixbuf-new-from-bytes
  input parameter data_ :: <GBytes>;
  input parameter colorspace_ :: <GdkColorspace>;
  input parameter has_alpha_ :: <C-boolean>;
  input parameter bits_per_sample_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter rowstride_ :: <C-signed-int>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_bytes";
end;

define inline-only C-function gdk-pixbuf-new-from-data
  input parameter data_ :: <C-unsigned-char*>;
  input parameter colorspace_ :: <GdkColorspace>;
  input parameter has_alpha_ :: <C-boolean>;
  input parameter bits_per_sample_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter rowstride_ :: <C-signed-int>;
  input parameter destroy_fn_ :: <C-function-pointer>;
  input parameter destroy_fn_data_ :: <C-void*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_data";
end;

define inline-only C-function gdk-pixbuf-new-from-file
  input parameter filename_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_file";
end;

define inline-only C-function gdk-pixbuf-new-from-file-at-scale
  input parameter filename_ :: <C-string>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter preserve_aspect_ratio_ :: <C-boolean>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_file_at_scale";
end;

define inline-only C-function gdk-pixbuf-new-from-file-at-size
  input parameter filename_ :: <C-string>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_file_at_size";
end;

define inline-only C-function gdk-pixbuf-new-from-resource
  input parameter resource_path_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_resource";
end;

define inline-only C-function gdk-pixbuf-new-from-resource-at-scale
  input parameter resource_path_ :: <C-string>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter preserve_aspect_ratio_ :: <C-boolean>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_resource_at_scale";
end;

define inline-only C-function gdk-pixbuf-new-from-stream
  input parameter stream_ :: <GInputStream>;
  input parameter cancellable_ :: <GCancellable>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_stream";
end;

define inline-only C-function gdk-pixbuf-new-from-stream-at-scale
  input parameter stream_ :: <GInputStream>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter preserve_aspect_ratio_ :: <C-boolean>;
  input parameter cancellable_ :: <GCancellable>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_stream_at_scale";
end;

define inline-only C-function gdk-pixbuf-new-from-stream-finish
  input parameter async_result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_stream_finish";
end;

define inline-only C-function gdk-pixbuf-new-from-xpm-data
  input parameter data_ :: <C-string*>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_from_xpm_data";
end;

define inline-only C-function gdk-pixbuf-calculate-rowstride
  input parameter colorspace_ :: <GdkColorspace>;
  input parameter has_alpha_ :: <C-boolean>;
  input parameter bits_per_sample_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gdk_pixbuf_calculate_rowstride";
end;

define inline-only C-function gdk-pixbuf-get-file-info
  input parameter filename_ :: <C-string>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  result res :: <GdkPixbufFormat>;
  c-name: "gdk_pixbuf_get_file_info";
end;

define inline-only C-function gdk-pixbuf-get-file-info-async
  input parameter filename_ :: <C-string>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_pixbuf_get_file_info_async";
end;

define inline-only C-function gdk-pixbuf-get-file-info-finish
  input parameter async_result_ :: <GAsyncResult>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbufFormat>;
  c-name: "gdk_pixbuf_get_file_info_finish";
end;

define inline-only C-function gdk-pixbuf-get-formats
  result res :: <GSList>;
  c-name: "gdk_pixbuf_get_formats";
end;

define inline-only C-function gdk-pixbuf-init-modules
  input parameter path_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_init_modules";
end;

define inline-only C-function gdk-pixbuf-new-from-stream-async
  input parameter stream_ :: <GInputStream>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_pixbuf_new_from_stream_async";
end;

define inline-only C-function gdk-pixbuf-new-from-stream-at-scale-async
  input parameter stream_ :: <GInputStream>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter preserve_aspect_ratio_ :: <C-boolean>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_pixbuf_new_from_stream_at_scale_async";
end;

define inline-only C-function gdk-pixbuf-save-to-stream-finish
  input parameter async_result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_save_to_stream_finish";
end;

define inline-only C-function gdk-pixbuf-add-alpha
  input parameter self :: <GdkPixbuf>;
  input parameter substitute_color_ :: <C-boolean>;
  input parameter r_ :: <C-unsigned-char>;
  input parameter g_ :: <C-unsigned-char>;
  input parameter b_ :: <C-unsigned-char>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_add_alpha";
end;

define inline-only C-function gdk-pixbuf-apply-embedded-orientation
  input parameter self :: <GdkPixbuf>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_apply_embedded_orientation";
end;

define inline-only C-function gdk-pixbuf-composite
  input parameter self :: <GdkPixbuf>;
  input parameter dest_ :: <GdkPixbuf>;
  input parameter dest_x_ :: <C-signed-int>;
  input parameter dest_y_ :: <C-signed-int>;
  input parameter dest_width_ :: <C-signed-int>;
  input parameter dest_height_ :: <C-signed-int>;
  input parameter offset_x_ :: <C-double>;
  input parameter offset_y_ :: <C-double>;
  input parameter scale_x_ :: <C-double>;
  input parameter scale_y_ :: <C-double>;
  input parameter interp_type_ :: <GdkInterpType>;
  input parameter overall_alpha_ :: <C-signed-int>;
  c-name: "gdk_pixbuf_composite";
end;

define inline-only C-function gdk-pixbuf-composite-color
  input parameter self :: <GdkPixbuf>;
  input parameter dest_ :: <GdkPixbuf>;
  input parameter dest_x_ :: <C-signed-int>;
  input parameter dest_y_ :: <C-signed-int>;
  input parameter dest_width_ :: <C-signed-int>;
  input parameter dest_height_ :: <C-signed-int>;
  input parameter offset_x_ :: <C-double>;
  input parameter offset_y_ :: <C-double>;
  input parameter scale_x_ :: <C-double>;
  input parameter scale_y_ :: <C-double>;
  input parameter interp_type_ :: <GdkInterpType>;
  input parameter overall_alpha_ :: <C-signed-int>;
  input parameter check_x_ :: <C-signed-int>;
  input parameter check_y_ :: <C-signed-int>;
  input parameter check_size_ :: <C-signed-int>;
  input parameter color1_ :: <C-unsigned-int>;
  input parameter color2_ :: <C-unsigned-int>;
  c-name: "gdk_pixbuf_composite_color";
end;

define inline-only C-function gdk-pixbuf-composite-color-simple
  input parameter self :: <GdkPixbuf>;
  input parameter dest_width_ :: <C-signed-int>;
  input parameter dest_height_ :: <C-signed-int>;
  input parameter interp_type_ :: <GdkInterpType>;
  input parameter overall_alpha_ :: <C-signed-int>;
  input parameter check_size_ :: <C-signed-int>;
  input parameter color1_ :: <C-unsigned-int>;
  input parameter color2_ :: <C-unsigned-int>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_composite_color_simple";
end;

define inline-only C-function gdk-pixbuf-copy
  input parameter self :: <GdkPixbuf>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_copy";
end;

define inline-only C-function gdk-pixbuf-copy-area
  input parameter self :: <GdkPixbuf>;
  input parameter src_x_ :: <C-signed-int>;
  input parameter src_y_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter dest_pixbuf_ :: <GdkPixbuf>;
  input parameter dest_x_ :: <C-signed-int>;
  input parameter dest_y_ :: <C-signed-int>;
  c-name: "gdk_pixbuf_copy_area";
end;

define inline-only C-function gdk-pixbuf-copy-options
  input parameter self :: <GdkPixbuf>;
  input parameter dest_pixbuf_ :: <GdkPixbuf>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_copy_options";
end;

define inline-only C-function gdk-pixbuf-fill
  input parameter self :: <GdkPixbuf>;
  input parameter pixel_ :: <C-unsigned-int>;
  c-name: "gdk_pixbuf_fill";
end;

define inline-only C-function gdk-pixbuf-flip
  input parameter self :: <GdkPixbuf>;
  input parameter horizontal_ :: <C-boolean>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_flip";
end;

define inline-only C-function gdk-pixbuf-get-bits-per-sample
  input parameter self :: <GdkPixbuf>;
  result res :: <C-signed-int>;
  c-name: "gdk_pixbuf_get_bits_per_sample";
end;

define inline-only C-function gdk-pixbuf-get-byte-length
  input parameter self :: <GdkPixbuf>;
  result res :: <C-unsigned-long>;
  c-name: "gdk_pixbuf_get_byte_length";
end;

define inline-only C-function gdk-pixbuf-get-colorspace
  input parameter self :: <GdkPixbuf>;
  result res :: <GdkColorspace>;
  c-name: "gdk_pixbuf_get_colorspace";
end;

define inline-only C-function gdk-pixbuf-get-has-alpha
  input parameter self :: <GdkPixbuf>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_get_has_alpha";
end;

define inline-only C-function gdk-pixbuf-get-height
  input parameter self :: <GdkPixbuf>;
  result res :: <C-signed-int>;
  c-name: "gdk_pixbuf_get_height";
end;

define inline-only C-function gdk-pixbuf-get-n-channels
  input parameter self :: <GdkPixbuf>;
  result res :: <C-signed-int>;
  c-name: "gdk_pixbuf_get_n_channels";
end;

define inline-only C-function gdk-pixbuf-get-option
  input parameter self :: <GdkPixbuf>;
  input parameter key_ :: <C-string>;
  result res :: <C-string>;
  c-name: "gdk_pixbuf_get_option";
end;

define inline-only C-function gdk-pixbuf-get-options
  input parameter self :: <GdkPixbuf>;
  result res :: <GHashTable>;
  c-name: "gdk_pixbuf_get_options";
end;

define inline-only C-function gdk-pixbuf-get-pixels-with-length
  input parameter self :: <GdkPixbuf>;
  output parameter length_ :: <C-unsigned-int*>;
  result res :: <C-unsigned-char*>;
  c-name: "gdk_pixbuf_get_pixels_with_length";
end;

define inline-only C-function gdk-pixbuf-get-rowstride
  input parameter self :: <GdkPixbuf>;
  result res :: <C-signed-int>;
  c-name: "gdk_pixbuf_get_rowstride";
end;

define inline-only C-function gdk-pixbuf-get-width
  input parameter self :: <GdkPixbuf>;
  result res :: <C-signed-int>;
  c-name: "gdk_pixbuf_get_width";
end;

define inline-only C-function gdk-pixbuf-new-subpixbuf
  input parameter self :: <GdkPixbuf>;
  input parameter src_x_ :: <C-signed-int>;
  input parameter src_y_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_new_subpixbuf";
end;

define inline-only C-function gdk-pixbuf-read-pixel-bytes
  input parameter self :: <GdkPixbuf>;
  result res :: <GBytes>;
  c-name: "gdk_pixbuf_read_pixel_bytes";
end;

define inline-only C-function gdk-pixbuf-read-pixels
  input parameter self :: <GdkPixbuf>;
  result res :: <C-unsigned-char*>;
  c-name: "gdk_pixbuf_read_pixels";
end;

define inline-only C-function gdk-pixbuf-remove-option
  input parameter self :: <GdkPixbuf>;
  input parameter key_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_remove_option";
end;

define inline-only C-function gdk-pixbuf-rotate-simple
  input parameter self :: <GdkPixbuf>;
  input parameter angle_ :: <GdkPixbufRotation>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_rotate_simple";
end;

define inline-only C-function gdk-pixbuf-saturate-and-pixelate
  input parameter self :: <GdkPixbuf>;
  input parameter dest_ :: <GdkPixbuf>;
  input parameter saturation_ :: <C-float>;
  input parameter pixelate_ :: <C-boolean>;
  c-name: "gdk_pixbuf_saturate_and_pixelate";
end;

define inline-only C-function gdk-pixbuf-save-to-bufferv
  input parameter self :: <GdkPixbuf>;
  output parameter buffer_ :: <C-unsigned-char*>;
  output parameter buffer_size_ :: <C-unsigned-long*>;
  input parameter type_ :: <C-string>;
  input parameter option_keys_ :: <C-string*>;
  input parameter option_values_ :: <C-string*>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_save_to_bufferv";
end;

define inline-only C-function gdk-pixbuf-save-to-callbackv
  input parameter self :: <GdkPixbuf>;
  input parameter save_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  input parameter type_ :: <C-string>;
  input parameter option_keys_ :: <C-string*>;
  input parameter option_values_ :: <C-string*>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_save_to_callbackv";
end;

define inline-only C-function gdk-pixbuf-save-to-streamv
  input parameter self :: <GdkPixbuf>;
  input parameter stream_ :: <GOutputStream>;
  input parameter type_ :: <C-string>;
  input parameter option_keys_ :: <C-string*>;
  input parameter option_values_ :: <C-string*>;
  input parameter cancellable_ :: <GCancellable>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_save_to_streamv";
end;

define inline-only C-function gdk-pixbuf-save-to-streamv-async
  input parameter self :: <GdkPixbuf>;
  input parameter stream_ :: <GOutputStream>;
  input parameter type_ :: <C-string>;
  input parameter option_keys_ :: <C-string*>;
  input parameter option_values_ :: <C-string*>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_pixbuf_save_to_streamv_async";
end;

define inline-only C-function gdk-pixbuf-savev
  input parameter self :: <GdkPixbuf>;
  input parameter filename_ :: <C-string>;
  input parameter type_ :: <C-string>;
  input parameter option_keys_ :: <C-string*>;
  input parameter option_values_ :: <C-string*>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_savev";
end;

define inline-only C-function gdk-pixbuf-scale
  input parameter self :: <GdkPixbuf>;
  input parameter dest_ :: <GdkPixbuf>;
  input parameter dest_x_ :: <C-signed-int>;
  input parameter dest_y_ :: <C-signed-int>;
  input parameter dest_width_ :: <C-signed-int>;
  input parameter dest_height_ :: <C-signed-int>;
  input parameter offset_x_ :: <C-double>;
  input parameter offset_y_ :: <C-double>;
  input parameter scale_x_ :: <C-double>;
  input parameter scale_y_ :: <C-double>;
  input parameter interp_type_ :: <GdkInterpType>;
  c-name: "gdk_pixbuf_scale";
end;

define inline-only C-function gdk-pixbuf-scale-simple
  input parameter self :: <GdkPixbuf>;
  input parameter dest_width_ :: <C-signed-int>;
  input parameter dest_height_ :: <C-signed-int>;
  input parameter interp_type_ :: <GdkInterpType>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_scale_simple";
end;

define inline-only C-function gdk-pixbuf-set-option
  input parameter self :: <GdkPixbuf>;
  input parameter key_ :: <C-string>;
  input parameter value_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_set_option";
end;

define open C-subtype <GdkPixbufAnimation> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GdkPixbufAnimation*> => <GdkPixbufAnimation>;

define sealed domain make (singleton(<GdkPixbufAnimation*>));
define sealed domain initialize (<GdkPixbufAnimation*>);

define inline-only C-function gdk-pixbuf-animation-new-from-file
  input parameter filename_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbufAnimation>;
  c-name: "gdk_pixbuf_animation_new_from_file";
end;

define inline-only C-function gdk-pixbuf-animation-new-from-resource
  input parameter resource_path_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbufAnimation>;
  c-name: "gdk_pixbuf_animation_new_from_resource";
end;

define inline-only C-function gdk-pixbuf-animation-new-from-stream
  input parameter stream_ :: <GInputStream>;
  input parameter cancellable_ :: <GCancellable>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbufAnimation>;
  c-name: "gdk_pixbuf_animation_new_from_stream";
end;

define inline-only C-function gdk-pixbuf-animation-new-from-stream-finish
  input parameter async_result_ :: <GAsyncResult>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbufAnimation>;
  c-name: "gdk_pixbuf_animation_new_from_stream_finish";
end;

define inline-only C-function gdk-pixbuf-animation-new-from-stream-async
  input parameter stream_ :: <GInputStream>;
  input parameter cancellable_ :: <GCancellable>;
  input parameter callback_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  c-name: "gdk_pixbuf_animation_new_from_stream_async";
end;

define inline-only C-function gdk-pixbuf-animation-get-height
  input parameter self :: <GdkPixbufAnimation>;
  result res :: <C-signed-int>;
  c-name: "gdk_pixbuf_animation_get_height";
end;

define inline-only C-function gdk-pixbuf-animation-get-iter
  input parameter self :: <GdkPixbufAnimation>;
  input parameter start_time_ :: <GTimeVal>;
  result res :: <GdkPixbufAnimationIter>;
  c-name: "gdk_pixbuf_animation_get_iter";
end;

define inline-only C-function gdk-pixbuf-animation-get-static-image
  input parameter self :: <GdkPixbufAnimation>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_animation_get_static_image";
end;

define inline-only C-function gdk-pixbuf-animation-get-width
  input parameter self :: <GdkPixbufAnimation>;
  result res :: <C-signed-int>;
  c-name: "gdk_pixbuf_animation_get_width";
end;

define inline-only C-function gdk-pixbuf-animation-is-static-image
  input parameter self :: <GdkPixbufAnimation>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_animation_is_static_image";
end;

define C-struct <_GdkPixbufAnimationClass>
  constant sealed inline-only slot gdk-pixbuf-animation-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gdk-pixbuf-animation-class-is-static-image :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-animation-class-get-static-image :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-animation-class-get-size :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-animation-class-get-iter :: <C-function-pointer>;
  pointer-type-name: <GdkPixbufAnimationClass>;
end C-struct;

define sealed domain make (singleton(<GdkPixbufAnimationClass>));
define sealed domain initialize (<GdkPixbufAnimationClass>);

define open C-subtype <GdkPixbufAnimationIter> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <GdkPixbufAnimationIter*> => <GdkPixbufAnimationIter>;

define sealed domain make (singleton(<GdkPixbufAnimationIter*>));
define sealed domain initialize (<GdkPixbufAnimationIter*>);

define inline-only C-function gdk-pixbuf-animation-iter-advance
  input parameter self :: <GdkPixbufAnimationIter>;
  input parameter current_time_ :: <GTimeVal>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_animation_iter_advance";
end;

define inline-only C-function gdk-pixbuf-animation-iter-get-delay-time
  input parameter self :: <GdkPixbufAnimationIter>;
  result res :: <C-signed-int>;
  c-name: "gdk_pixbuf_animation_iter_get_delay_time";
end;

define inline-only C-function gdk-pixbuf-animation-iter-get-pixbuf
  input parameter self :: <GdkPixbufAnimationIter>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_animation_iter_get_pixbuf";
end;

define inline-only C-function gdk-pixbuf-animation-iter-on-currently-loading-frame
  input parameter self :: <GdkPixbufAnimationIter>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_animation_iter_on_currently_loading_frame";
end;

define C-struct <_GdkPixbufAnimationIterClass>
  constant sealed inline-only slot gdk-pixbuf-animation-iter-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gdk-pixbuf-animation-iter-class-get-delay-time :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-animation-iter-class-get-pixbuf :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-animation-iter-class-on-currently-loading-frame :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-animation-iter-class-advance :: <C-function-pointer>;
  pointer-type-name: <GdkPixbufAnimationIterClass>;
end C-struct;

define sealed domain make (singleton(<GdkPixbufAnimationIterClass>));
define sealed domain initialize (<GdkPixbufAnimationIterClass>);

define inline-only constant $gdk-pixbuf-error-corrupt-image = 0;
define inline-only constant $gdk-pixbuf-error-insufficient-memory = 1;
define inline-only constant $gdk-pixbuf-error-bad-option = 2;
define inline-only constant $gdk-pixbuf-error-unknown-type = 3;
define inline-only constant $gdk-pixbuf-error-unsupported-operation = 4;
define inline-only constant $gdk-pixbuf-error-failed = 5;
define inline-only constant $gdk-pixbuf-error-incomplete-animation = 6;
define constant <GdkPixbufError> = <C-int>;
define C-pointer-type <GdkPixbufError*> => <GdkPixbufError>;

define C-struct <_GdkPixbufFormat>
  sealed inline-only slot gdk-pixbuf-format-name :: <C-string>;
  sealed inline-only slot gdk-pixbuf-format-signature :: <GdkPixbufModulePattern>;
  sealed inline-only slot gdk-pixbuf-format-domain :: <C-string>;
  sealed inline-only slot gdk-pixbuf-format-description :: <C-string>;
  sealed inline-only slot gdk-pixbuf-format-mime-types :: <C-string*>;
  sealed inline-only slot gdk-pixbuf-format-extensions :: <C-string*>;
  sealed inline-only slot gdk-pixbuf-format-flags :: <C-unsigned-int>;
  sealed inline-only slot gdk-pixbuf-format-disabled :: <C-boolean>;
  sealed inline-only slot gdk-pixbuf-format-license :: <C-string>;
  pointer-type-name: <GdkPixbufFormat>;
end C-struct;

define sealed domain make (singleton(<GdkPixbufFormat>));
define sealed domain initialize (<GdkPixbufFormat>);

define inline-only C-function gdk-pixbuf-format-copy
  input parameter self :: <GdkPixbufFormat>;
  result res :: <GdkPixbufFormat>;
  c-name: "gdk_pixbuf_format_copy";
end;

define inline-only C-function gdk-pixbuf-format-free
  input parameter self :: <GdkPixbufFormat>;
  c-name: "gdk_pixbuf_format_free";
end;

define inline-only C-function gdk-pixbuf-format-get-description
  input parameter self :: <GdkPixbufFormat>;
  result res :: <C-string>;
  c-name: "gdk_pixbuf_format_get_description";
end;

define inline-only C-function gdk-pixbuf-format-get-extensions
  input parameter self :: <GdkPixbufFormat>;
  result res :: <C-string*>;
  c-name: "gdk_pixbuf_format_get_extensions";
end;

define inline-only C-function gdk-pixbuf-format-get-license
  input parameter self :: <GdkPixbufFormat>;
  result res :: <C-string>;
  c-name: "gdk_pixbuf_format_get_license";
end;

define inline-only C-function gdk-pixbuf-format-get-mime-types
  input parameter self :: <GdkPixbufFormat>;
  result res :: <C-string*>;
  c-name: "gdk_pixbuf_format_get_mime_types";
end;

define inline-only C-function gdk-pixbuf-format-get-name
  input parameter self :: <GdkPixbufFormat>;
  result res :: <C-string>;
  c-name: "gdk_pixbuf_format_get_name";
end;

define inline-only C-function gdk-pixbuf-format-is-disabled
  input parameter self :: <GdkPixbufFormat>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_format_is_disabled";
end;

define inline-only C-function gdk-pixbuf-format-is-save-option-supported
  input parameter self :: <GdkPixbufFormat>;
  input parameter option_key_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_format_is_save_option_supported";
end;

define inline-only C-function gdk-pixbuf-format-is-scalable
  input parameter self :: <GdkPixbufFormat>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_format_is_scalable";
end;

define inline-only C-function gdk-pixbuf-format-is-writable
  input parameter self :: <GdkPixbufFormat>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_format_is_writable";
end;

define inline-only C-function gdk-pixbuf-format-set-disabled
  input parameter self :: <GdkPixbufFormat>;
  input parameter disabled_ :: <C-boolean>;
  c-name: "gdk_pixbuf_format_set_disabled";
end;

define inline-only constant $gdk-pixbuf-format-writable = 1;
define inline-only constant $gdk-pixbuf-format-scalable = 2;
define inline-only constant $gdk-pixbuf-format-threadsafe = 4;
define constant <GdkPixbufFormatFlags> = <C-int>;
define C-pointer-type <GdkPixbufFormatFlags*> => <GdkPixbufFormatFlags>;

define open C-subtype <GdkPixbufLoader> (<GObject>)
  // parent_instance
  // priv
end C-subtype;

define C-pointer-type <GdkPixbufLoader*> => <GdkPixbufLoader>;

define sealed domain make (singleton(<GdkPixbufLoader*>));
define sealed domain initialize (<GdkPixbufLoader*>);

define inline-only C-function gdk-pixbuf-loader-new
  result res :: <GdkPixbufLoader>;
  c-name: "gdk_pixbuf_loader_new";
end;

define inline-only C-function gdk-pixbuf-loader-new-with-mime-type
  input parameter mime_type_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbufLoader>;
  c-name: "gdk_pixbuf_loader_new_with_mime_type";
end;

define inline-only C-function gdk-pixbuf-loader-new-with-type
  input parameter image_type_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <GdkPixbufLoader>;
  c-name: "gdk_pixbuf_loader_new_with_type";
end;

define inline-only C-function gdk-pixbuf-loader-close
  input parameter self :: <GdkPixbufLoader>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_loader_close";
end;

define inline-only C-function gdk-pixbuf-loader-get-animation
  input parameter self :: <GdkPixbufLoader>;
  result res :: <GdkPixbufAnimation>;
  c-name: "gdk_pixbuf_loader_get_animation";
end;

define inline-only C-function gdk-pixbuf-loader-get-format
  input parameter self :: <GdkPixbufLoader>;
  result res :: <GdkPixbufFormat>;
  c-name: "gdk_pixbuf_loader_get_format";
end;

define inline-only C-function gdk-pixbuf-loader-get-pixbuf
  input parameter self :: <GdkPixbufLoader>;
  result res :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_loader_get_pixbuf";
end;

define inline-only C-function gdk-pixbuf-loader-set-size
  input parameter self :: <GdkPixbufLoader>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "gdk_pixbuf_loader_set_size";
end;

define inline-only C-function gdk-pixbuf-loader-write
  input parameter self :: <GdkPixbufLoader>;
  input parameter buf_ :: <C-unsigned-char*>;
  input parameter count_ :: <C-unsigned-long>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_loader_write";
end;

define inline-only C-function gdk-pixbuf-loader-write-bytes
  input parameter self :: <GdkPixbufLoader>;
  input parameter buffer_ :: <GBytes>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_loader_write_bytes";
end;

define C-struct <_GdkPixbufLoaderClass>
  constant sealed inline-only slot gdk-pixbuf-loader-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot gdk-pixbuf-loader-class-size-prepared :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-loader-class-area-prepared :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-loader-class-area-updated :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-loader-class-closed :: <C-function-pointer>;
  pointer-type-name: <GdkPixbufLoaderClass>;
end C-struct;

define sealed domain make (singleton(<GdkPixbufLoaderClass>));
define sealed domain initialize (<GdkPixbufLoaderClass>);

define C-struct <_GdkPixbufModule>
  sealed inline-only slot gdk-pixbuf-module-module-name :: <C-string>;
  sealed inline-only slot gdk-pixbuf-module-module-path :: <C-string>;
  sealed inline-only slot gdk-pixbuf-module-module :: <GModule>;
  sealed inline-only slot gdk-pixbuf-module-info :: <GdkPixbufFormat>;
  sealed inline-only slot gdk-pixbuf-module-load :: <C-function-pointer>;
  sealed inline-only slot gdk-pixbuf-module-load-xpm-data :: <C-function-pointer>;
  sealed inline-only slot gdk-pixbuf-module-begin-load :: <C-void*>;
  sealed inline-only slot gdk-pixbuf-module-stop-load :: <C-function-pointer>;
  sealed inline-only slot gdk-pixbuf-module-load-increment :: <C-function-pointer>;
  sealed inline-only slot gdk-pixbuf-module-load-animation :: <C-function-pointer>;
  sealed inline-only slot gdk-pixbuf-module-save :: <C-function-pointer>;
  sealed inline-only slot gdk-pixbuf-module-save-to-callback :: <C-void*>;
  sealed inline-only slot gdk-pixbuf-module-is-save-option-supported :: <C-function-pointer>;
  constant sealed inline-only slot gdk-pixbuf-module-_reserved1 :: <C-void*>;
  constant sealed inline-only slot gdk-pixbuf-module-_reserved2 :: <C-void*>;
  constant sealed inline-only slot gdk-pixbuf-module-_reserved3 :: <C-void*>;
  constant sealed inline-only slot gdk-pixbuf-module-_reserved4 :: <C-void*>;
  pointer-type-name: <GdkPixbufModule>;
end C-struct;

define sealed domain make (singleton(<GdkPixbufModule>));
define sealed domain initialize (<GdkPixbufModule>);

define C-struct <_GdkPixbufModulePattern>
  sealed inline-only slot gdk-pixbuf-module-pattern-prefix :: <C-string>;
  sealed inline-only slot gdk-pixbuf-module-pattern-mask :: <C-string>;
  sealed inline-only slot gdk-pixbuf-module-pattern-relevance :: <C-signed-int>;
  pointer-type-name: <GdkPixbufModulePattern>;
end C-struct;

define sealed domain make (singleton(<GdkPixbufModulePattern>));
define sealed domain initialize (<GdkPixbufModulePattern>);

define open C-subtype <GdkPixbufNonAnim> (<GdkPixbufAnimation>)
end C-subtype;

define C-pointer-type <GdkPixbufNonAnim*> => <GdkPixbufNonAnim>;

define sealed domain make (singleton(<GdkPixbufNonAnim*>));
define sealed domain initialize (<GdkPixbufNonAnim*>);

define inline-only C-function gdk-pixbuf-non-anim-new
  input parameter pixbuf_ :: <GdkPixbuf>;
  result res :: <GdkPixbufAnimation>;
  c-name: "gdk_pixbuf_non_anim_new";
end;

define inline-only constant $gdk-pixbuf-rotate-none = 0;
define inline-only constant $gdk-pixbuf-rotate-counterclockwise = 90;
define inline-only constant $gdk-pixbuf-rotate-upsidedown = 180;
define inline-only constant $gdk-pixbuf-rotate-clockwise = 270;
define constant <GdkPixbufRotation> = <C-int>;
define C-pointer-type <GdkPixbufRotation*> => <GdkPixbufRotation>;

define open C-subtype <GdkPixbufSimpleAnim> (<GdkPixbufAnimation>)
end C-subtype;

define C-pointer-type <GdkPixbufSimpleAnim*> => <GdkPixbufSimpleAnim>;

define sealed domain make (singleton(<GdkPixbufSimpleAnim*>));
define sealed domain initialize (<GdkPixbufSimpleAnim*>);

define inline-only C-function gdk-pixbuf-simple-anim-new
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  input parameter rate_ :: <C-float>;
  result res :: <GdkPixbufSimpleAnim>;
  c-name: "gdk_pixbuf_simple_anim_new";
end;

define inline-only C-function gdk-pixbuf-simple-anim-add-frame
  input parameter self :: <GdkPixbufSimpleAnim>;
  input parameter pixbuf_ :: <GdkPixbuf>;
  c-name: "gdk_pixbuf_simple_anim_add_frame";
end;

define inline-only C-function gdk-pixbuf-simple-anim-get-loop
  input parameter self :: <GdkPixbufSimpleAnim>;
  result res :: <C-boolean>;
  c-name: "gdk_pixbuf_simple_anim_get_loop";
end;

define inline-only C-function gdk-pixbuf-simple-anim-set-loop
  input parameter self :: <GdkPixbufSimpleAnim>;
  input parameter loop_ :: <C-boolean>;
  c-name: "gdk_pixbuf_simple_anim_set_loop";
end;

define C-struct <_GdkPixbufSimpleAnimClass>
  pointer-type-name: <GdkPixbufSimpleAnimClass>;
end C-struct;

define sealed domain make (singleton(<GdkPixbufSimpleAnimClass>));
define sealed domain initialize (<GdkPixbufSimpleAnimClass>);

define open C-subtype <GdkPixbufSimpleAnimIter> (<GdkPixbufAnimationIter>)
end C-subtype;

define C-pointer-type <GdkPixbufSimpleAnimIter*> => <GdkPixbufSimpleAnimIter>;

define sealed domain make (singleton(<GdkPixbufSimpleAnimIter*>));
define sealed domain initialize (<GdkPixbufSimpleAnimIter*>);

define inline-only C-function gdk-pixbuf-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gdk_pixbuf_error_quark";
end;

