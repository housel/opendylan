module: pango
synopsis: generated bindings for the Pango library
copyright: See LICENSE file in this distribution.


define C-pointer-type <C-void**> => <C-void*>;
ignore(<C-void**>);

define C-pointer-type <GError*> => <GError>;
ignore(<GError*>);

define inline-only constant $analysis-flag-centered-baseline = 1;

define inline-only constant $analysis-flag-is-ellipsis = 2;

define inline-only constant $analysis-flag-need-hyphen = 4;

define inline-only constant $attr-index-from-text-beginning = 0;

define inline-only constant $attr-index-to-text-end = 4294967295;

define inline-only constant $pango-align-left = 0;
define inline-only constant $pango-align-center = 1;
define inline-only constant $pango-align-right = 2;
define constant <PangoAlignment> = <C-int>;
define C-pointer-type <PangoAlignment*> => <PangoAlignment>;

define C-struct <_PangoAnalysis>
  sealed inline-only slot pango-analysis-shape-engine :: <C-void*>;
  sealed inline-only slot pango-analysis-lang-engine :: <C-void*>;
  sealed inline-only slot pango-analysis-font :: <PangoFont>;
  sealed inline-only slot pango-analysis-level :: <C-unsigned-char>;
  sealed inline-only slot pango-analysis-gravity :: <C-unsigned-char>;
  sealed inline-only slot pango-analysis-flags :: <C-unsigned-char>;
  sealed inline-only slot pango-analysis-script :: <C-unsigned-char>;
  sealed inline-only slot pango-analysis-language :: <PangoLanguage>;
  sealed inline-only slot pango-analysis-extra-attrs :: <GSList>;
  pointer-type-name: <PangoAnalysis>;
end C-struct;

define sealed domain make (singleton(<PangoAnalysis>));
define sealed domain initialize (<PangoAnalysis>);

define C-struct <_PangoAttrClass>
  sealed inline-only slot pango-attr-class-type :: <PangoAttrType>;
  constant sealed inline-only slot pango-attr-class-copy :: <C-function-pointer>;
  constant sealed inline-only slot pango-attr-class-destroy :: <C-function-pointer>;
  constant sealed inline-only slot pango-attr-class-equal :: <C-function-pointer>;
  pointer-type-name: <PangoAttrClass>;
end C-struct;

define sealed domain make (singleton(<PangoAttrClass>));
define sealed domain initialize (<PangoAttrClass>);

define C-struct <_PangoAttrColor>
  sealed inline-only slot pango-attr-color-attr :: <PangoAttribute>;
  sealed inline-only slot pango-attr-color-color :: <PangoColor>;
  pointer-type-name: <PangoAttrColor>;
end C-struct;

define sealed domain make (singleton(<PangoAttrColor>));
define sealed domain initialize (<PangoAttrColor>);

define C-struct <_PangoAttrFloat>
  sealed inline-only slot pango-attr-float-attr :: <PangoAttribute>;
  sealed inline-only slot pango-attr-float-value :: <C-double>;
  pointer-type-name: <PangoAttrFloat>;
end C-struct;

define sealed domain make (singleton(<PangoAttrFloat>));
define sealed domain initialize (<PangoAttrFloat>);

define C-struct <_PangoAttrFontDesc>
  sealed inline-only slot pango-attr-font-desc-attr :: <PangoAttribute>;
  sealed inline-only slot pango-attr-font-desc-desc :: <PangoFontDescription>;
  pointer-type-name: <PangoAttrFontDesc>;
end C-struct;

define sealed domain make (singleton(<PangoAttrFontDesc>));
define sealed domain initialize (<PangoAttrFontDesc>);

define inline-only C-function pango-attr-font-desc-new
  input parameter desc_ :: <PangoFontDescription>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_font_desc_new";
end;

define C-struct <_PangoAttrFontFeatures>
  sealed inline-only slot pango-attr-font-features-attr :: <PangoAttribute>;
  sealed inline-only slot pango-attr-font-features-features :: <C-string>;
  pointer-type-name: <PangoAttrFontFeatures>;
end C-struct;

define sealed domain make (singleton(<PangoAttrFontFeatures>));
define sealed domain initialize (<PangoAttrFontFeatures>);

define inline-only C-function pango-attr-font-features-new
  input parameter features_ :: <C-string>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_font_features_new";
end;

define C-struct <_PangoAttrInt>
  sealed inline-only slot pango-attr-int-attr :: <PangoAttribute>;
  sealed inline-only slot pango-attr-int-value :: <C-signed-int>;
  pointer-type-name: <PangoAttrInt>;
end C-struct;

define sealed domain make (singleton(<PangoAttrInt>));
define sealed domain initialize (<PangoAttrInt>);

define C-struct <_PangoAttrIterator>
  pointer-type-name: <PangoAttrIterator>;
end C-struct;

define sealed domain make (singleton(<PangoAttrIterator>));
define sealed domain initialize (<PangoAttrIterator>);

define inline-only C-function pango-attr-iterator-copy
  input parameter self :: <PangoAttrIterator>;
  result res :: <PangoAttrIterator>;
  c-name: "pango_attr_iterator_copy";
end;

define inline-only C-function pango-attr-iterator-destroy
  input parameter self :: <PangoAttrIterator>;
  c-name: "pango_attr_iterator_destroy";
end;

define inline-only C-function pango-attr-iterator-get
  input parameter self :: <PangoAttrIterator>;
  input parameter type_ :: <PangoAttrType>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_iterator_get";
end;

define inline-only C-function pango-attr-iterator-get-attrs
  input parameter self :: <PangoAttrIterator>;
  result res :: <GSList>;
  c-name: "pango_attr_iterator_get_attrs";
end;

define inline-only C-function pango-attr-iterator-get-font
  input parameter self :: <PangoAttrIterator>;
  input parameter desc_ :: <PangoFontDescription>;
  input parameter language_ :: <PangoLanguage>;
  output parameter extra_attrs_ :: <GSList>;
  c-name: "pango_attr_iterator_get_font";
end;

define inline-only C-function pango-attr-iterator-next
  input parameter self :: <PangoAttrIterator>;
  result res :: <C-boolean>;
  c-name: "pango_attr_iterator_next";
end;

define inline-only C-function pango-attr-iterator-range
  input parameter self :: <PangoAttrIterator>;
  output parameter start_ :: <C-signed-int*>;
  output parameter end_ :: <C-signed-int*>;
  c-name: "pango_attr_iterator_range";
end;

define C-struct <_PangoAttrLanguage>
  sealed inline-only slot pango-attr-language-attr :: <PangoAttribute>;
  sealed inline-only slot pango-attr-language-value :: <PangoLanguage>;
  pointer-type-name: <PangoAttrLanguage>;
end C-struct;

define sealed domain make (singleton(<PangoAttrLanguage>));
define sealed domain initialize (<PangoAttrLanguage>);

define inline-only C-function pango-attr-language-new
  input parameter language_ :: <PangoLanguage>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_language_new";
end;

define C-struct <_PangoAttrList>
  pointer-type-name: <PangoAttrList>;
end C-struct;

define sealed domain make (singleton(<PangoAttrList>));
define sealed domain initialize (<PangoAttrList>);

define inline-only C-function pango-attr-list-new
  result res :: <PangoAttrList>;
  c-name: "pango_attr_list_new";
end;

define inline-only C-function pango-attr-list-change
  input parameter self :: <PangoAttrList>;
  input parameter attr_ :: <PangoAttribute>;
  c-name: "pango_attr_list_change";
end;

define inline-only C-function pango-attr-list-copy
  input parameter self :: <PangoAttrList>;
  result res :: <PangoAttrList>;
  c-name: "pango_attr_list_copy";
end;

define inline-only C-function pango-attr-list-equal
  input parameter self :: <PangoAttrList>;
  input parameter other_list_ :: <PangoAttrList>;
  result res :: <C-boolean>;
  c-name: "pango_attr_list_equal";
end;

define inline-only C-function pango-attr-list-filter
  input parameter self :: <PangoAttrList>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  result res :: <PangoAttrList>;
  c-name: "pango_attr_list_filter";
end;

define inline-only C-function pango-attr-list-get-attributes
  input parameter self :: <PangoAttrList>;
  result res :: <GSList>;
  c-name: "pango_attr_list_get_attributes";
end;

define inline-only C-function pango-attr-list-get-iterator
  input parameter self :: <PangoAttrList>;
  result res :: <PangoAttrIterator>;
  c-name: "pango_attr_list_get_iterator";
end;

define inline-only C-function pango-attr-list-insert
  input parameter self :: <PangoAttrList>;
  input parameter attr_ :: <PangoAttribute>;
  c-name: "pango_attr_list_insert";
end;

define inline-only C-function pango-attr-list-insert-before
  input parameter self :: <PangoAttrList>;
  input parameter attr_ :: <PangoAttribute>;
  c-name: "pango_attr_list_insert_before";
end;

define inline-only C-function pango-attr-list-ref
  input parameter self :: <PangoAttrList>;
  result res :: <PangoAttrList>;
  c-name: "pango_attr_list_ref";
end;

define inline-only C-function pango-attr-list-splice
  input parameter self :: <PangoAttrList>;
  input parameter other_ :: <PangoAttrList>;
  input parameter pos_ :: <C-signed-int>;
  input parameter len_ :: <C-signed-int>;
  c-name: "pango_attr_list_splice";
end;

define inline-only C-function pango-attr-list-to-string
  input parameter self :: <PangoAttrList>;
  result res :: <C-string>;
  c-name: "pango_attr_list_to_string";
end;

define inline-only C-function pango-attr-list-unref
  input parameter self :: <PangoAttrList>;
  c-name: "pango_attr_list_unref";
end;

define inline-only C-function pango-attr-list-update
  input parameter self :: <PangoAttrList>;
  input parameter pos_ :: <C-signed-int>;
  input parameter remove_ :: <C-signed-int>;
  input parameter add_ :: <C-signed-int>;
  c-name: "pango_attr_list_update";
end;

define inline-only C-function pango-attr-list-from-string
  input parameter text_ :: <C-string>;
  result res :: <PangoAttrList>;
  c-name: "pango_attr_list_from_string";
end;

define C-struct <_PangoAttrShape>
  sealed inline-only slot pango-attr-shape-attr :: <PangoAttribute>;
  sealed inline-only slot pango-attr-shape-ink-rect :: <PangoRectangle>;
  sealed inline-only slot pango-attr-shape-logical-rect :: <PangoRectangle>;
  sealed inline-only slot pango-attr-shape-data :: <C-void*>;
  sealed inline-only slot pango-attr-shape-copy-func :: <C-function-pointer>;
  sealed inline-only slot pango-attr-shape-destroy-func :: <C-function-pointer>;
  pointer-type-name: <PangoAttrShape>;
end C-struct;

define sealed domain make (singleton(<PangoAttrShape>));
define sealed domain initialize (<PangoAttrShape>);

define inline-only C-function pango-attr-shape-new
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_shape_new";
end;

define inline-only C-function pango-attr-shape-new-with-data
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  input parameter data_ :: <C-void*>;
  input parameter copy_func_ :: <C-function-pointer>;
  input parameter destroy_func_ :: <C-function-pointer>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_shape_new_with_data";
end;

define C-struct <_PangoAttrSize>
  sealed inline-only slot pango-attr-size-attr :: <PangoAttribute>;
  sealed inline-only slot pango-attr-size-size :: <C-signed-int>;
  sealed inline-only slot pango-attr-size-absolute :: <C-unsigned-int>;
  pointer-type-name: <PangoAttrSize>;
end C-struct;

define sealed domain make (singleton(<PangoAttrSize>));
define sealed domain initialize (<PangoAttrSize>);

define inline-only C-function pango-attr-size-new
  input parameter size_ :: <C-signed-int>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_size_new";
end;

define inline-only C-function pango-attr-size-new-absolute
  input parameter size_ :: <C-signed-int>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_size_new_absolute";
end;

define C-struct <_PangoAttrString>
  sealed inline-only slot pango-attr-string-attr :: <PangoAttribute>;
  sealed inline-only slot pango-attr-string-value :: <C-string>;
  pointer-type-name: <PangoAttrString>;
end C-struct;

define sealed domain make (singleton(<PangoAttrString>));
define sealed domain initialize (<PangoAttrString>);

define inline-only constant $pango-attr-invalid = 0;
define inline-only constant $pango-attr-language = 1;
define inline-only constant $pango-attr-family = 2;
define inline-only constant $pango-attr-style = 3;
define inline-only constant $pango-attr-weight = 4;
define inline-only constant $pango-attr-variant = 5;
define inline-only constant $pango-attr-stretch = 6;
define inline-only constant $pango-attr-size = 7;
define inline-only constant $pango-attr-font-desc = 8;
define inline-only constant $pango-attr-foreground = 9;
define inline-only constant $pango-attr-background = 10;
define inline-only constant $pango-attr-underline = 11;
define inline-only constant $pango-attr-strikethrough = 12;
define inline-only constant $pango-attr-rise = 13;
define inline-only constant $pango-attr-shape = 14;
define inline-only constant $pango-attr-scale = 15;
define inline-only constant $pango-attr-fallback = 16;
define inline-only constant $pango-attr-letter-spacing = 17;
define inline-only constant $pango-attr-underline-color = 18;
define inline-only constant $pango-attr-strikethrough-color = 19;
define inline-only constant $pango-attr-absolute-size = 20;
define inline-only constant $pango-attr-gravity = 21;
define inline-only constant $pango-attr-gravity-hint = 22;
define inline-only constant $pango-attr-font-features = 23;
define inline-only constant $pango-attr-foreground-alpha = 24;
define inline-only constant $pango-attr-background-alpha = 25;
define inline-only constant $pango-attr-allow-breaks = 26;
define inline-only constant $pango-attr-show = 27;
define inline-only constant $pango-attr-insert-hyphens = 28;
define inline-only constant $pango-attr-overline = 29;
define inline-only constant $pango-attr-overline-color = 30;
define inline-only constant $pango-attr-line-height = 31;
define inline-only constant $pango-attr-absolute-line-height = 32;
define inline-only constant $pango-attr-text-transform = 33;
define inline-only constant $pango-attr-word = 34;
define inline-only constant $pango-attr-sentence = 35;
define inline-only constant $pango-attr-baseline-shift = 36;
define inline-only constant $pango-attr-font-scale = 37;
define constant <PangoAttrType> = <C-int>;
define C-pointer-type <PangoAttrType*> => <PangoAttrType>;

define C-struct <_PangoAttribute>
  sealed inline-only slot pango-attribute-klass :: <PangoAttrClass>;
  sealed inline-only slot pango-attribute-start-index :: <C-unsigned-int>;
  sealed inline-only slot pango-attribute-end-index :: <C-unsigned-int>;
  pointer-type-name: <PangoAttribute>;
end C-struct;

define sealed domain make (singleton(<PangoAttribute>));
define sealed domain initialize (<PangoAttribute>);

define inline-only C-function pango-attribute-as-color
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttrColor>;
  c-name: "pango_attribute_as_color";
end;

define inline-only C-function pango-attribute-as-float
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttrFloat>;
  c-name: "pango_attribute_as_float";
end;

define inline-only C-function pango-attribute-as-font-desc
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttrFontDesc>;
  c-name: "pango_attribute_as_font_desc";
end;

define inline-only C-function pango-attribute-as-font-features
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttrFontFeatures>;
  c-name: "pango_attribute_as_font_features";
end;

define inline-only C-function pango-attribute-as-int
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttrInt>;
  c-name: "pango_attribute_as_int";
end;

define inline-only C-function pango-attribute-as-language
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttrLanguage>;
  c-name: "pango_attribute_as_language";
end;

define inline-only C-function pango-attribute-as-shape
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttrShape>;
  c-name: "pango_attribute_as_shape";
end;

define inline-only C-function pango-attribute-as-size
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttrSize>;
  c-name: "pango_attribute_as_size";
end;

define inline-only C-function pango-attribute-as-string
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttrString>;
  c-name: "pango_attribute_as_string";
end;

define inline-only C-function pango-attribute-copy
  input parameter self :: <PangoAttribute>;
  result res :: <PangoAttribute>;
  c-name: "pango_attribute_copy";
end;

define inline-only C-function pango-attribute-destroy
  input parameter self :: <PangoAttribute>;
  c-name: "pango_attribute_destroy";
end;

define inline-only C-function pango-attribute-equal
  input parameter self :: <PangoAttribute>;
  input parameter attr2_ :: <PangoAttribute>;
  result res :: <C-boolean>;
  c-name: "pango_attribute_equal";
end;

define inline-only C-function pango-attribute-init
  input parameter self :: <PangoAttribute>;
  input parameter klass_ :: <PangoAttrClass>;
  c-name: "pango_attribute_init";
end;

define inline-only constant $pango-baseline-shift-none = 0;
define inline-only constant $pango-baseline-shift-superscript = 1;
define inline-only constant $pango-baseline-shift-subscript = 2;
define constant <PangoBaselineShift> = <C-int>;
define C-pointer-type <PangoBaselineShift*> => <PangoBaselineShift>;

define inline-only constant $pango-bidi-type-l = 0;
define inline-only constant $pango-bidi-type-lre = 1;
define inline-only constant $pango-bidi-type-lro = 2;
define inline-only constant $pango-bidi-type-r = 3;
define inline-only constant $pango-bidi-type-al = 4;
define inline-only constant $pango-bidi-type-rle = 5;
define inline-only constant $pango-bidi-type-rlo = 6;
define inline-only constant $pango-bidi-type-pdf = 7;
define inline-only constant $pango-bidi-type-en = 8;
define inline-only constant $pango-bidi-type-es = 9;
define inline-only constant $pango-bidi-type-et = 10;
define inline-only constant $pango-bidi-type-an = 11;
define inline-only constant $pango-bidi-type-cs = 12;
define inline-only constant $pango-bidi-type-nsm = 13;
define inline-only constant $pango-bidi-type-bn = 14;
define inline-only constant $pango-bidi-type-b = 15;
define inline-only constant $pango-bidi-type-s = 16;
define inline-only constant $pango-bidi-type-ws = 17;
define inline-only constant $pango-bidi-type-on = 18;
define inline-only constant $pango-bidi-type-lri = 19;
define inline-only constant $pango-bidi-type-rli = 20;
define inline-only constant $pango-bidi-type-fsi = 21;
define inline-only constant $pango-bidi-type-pdi = 22;
define constant <PangoBidiType> = <C-int>;
define C-pointer-type <PangoBidiType*> => <PangoBidiType>;

define C-struct <_PangoColor>
  sealed inline-only slot pango-color-red :: <C-unsigned-short>;
  sealed inline-only slot pango-color-green :: <C-unsigned-short>;
  sealed inline-only slot pango-color-blue :: <C-unsigned-short>;
  pointer-type-name: <PangoColor>;
end C-struct;

define sealed domain make (singleton(<PangoColor>));
define sealed domain initialize (<PangoColor>);

define inline-only C-function pango-color-copy
  input parameter self :: <PangoColor>;
  result res :: <PangoColor>;
  c-name: "pango_color_copy";
end;

define inline-only C-function pango-color-free
  input parameter self :: <PangoColor>;
  c-name: "pango_color_free";
end;

define inline-only C-function pango-color-parse
  input parameter self :: <PangoColor>;
  input parameter spec_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "pango_color_parse";
end;

define inline-only C-function pango-color-parse-with-alpha
  input parameter self :: <PangoColor>;
  output parameter alpha_ :: <C-unsigned-short*>;
  input parameter spec_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "pango_color_parse_with_alpha";
end;

define inline-only C-function pango-color-to-string
  input parameter self :: <PangoColor>;
  result res :: <C-string>;
  c-name: "pango_color_to_string";
end;

define open C-subtype <PangoContext> (<GObject>)
end C-subtype;

define C-pointer-type <PangoContext*> => <PangoContext>;

define sealed domain make (singleton(<PangoContext*>));
define sealed domain initialize (<PangoContext*>);

define inline-only C-function pango-context-new
  result res :: <PangoContext>;
  c-name: "pango_context_new";
end;

define inline-only C-function pango-context-changed
  input parameter self :: <PangoContext>;
  c-name: "pango_context_changed";
end;

define inline-only C-function pango-context-get-base-dir
  input parameter self :: <PangoContext>;
  result res :: <PangoDirection>;
  c-name: "pango_context_get_base_dir";
end;

define inline-only C-function pango-context-get-base-gravity
  input parameter self :: <PangoContext>;
  result res :: <PangoGravity>;
  c-name: "pango_context_get_base_gravity";
end;

define inline-only C-function pango-context-get-font-description
  input parameter self :: <PangoContext>;
  result res :: <PangoFontDescription>;
  c-name: "pango_context_get_font_description";
end;

define inline-only C-function pango-context-get-font-map
  input parameter self :: <PangoContext>;
  result res :: <PangoFontMap>;
  c-name: "pango_context_get_font_map";
end;

define inline-only C-function pango-context-get-gravity
  input parameter self :: <PangoContext>;
  result res :: <PangoGravity>;
  c-name: "pango_context_get_gravity";
end;

define inline-only C-function pango-context-get-gravity-hint
  input parameter self :: <PangoContext>;
  result res :: <PangoGravityHint>;
  c-name: "pango_context_get_gravity_hint";
end;

define inline-only C-function pango-context-get-language
  input parameter self :: <PangoContext>;
  result res :: <PangoLanguage>;
  c-name: "pango_context_get_language";
end;

define inline-only C-function pango-context-get-matrix
  input parameter self :: <PangoContext>;
  result res :: <PangoMatrix>;
  c-name: "pango_context_get_matrix";
end;

define inline-only C-function pango-context-get-metrics
  input parameter self :: <PangoContext>;
  input parameter desc_ :: <PangoFontDescription>;
  input parameter language_ :: <PangoLanguage>;
  result res :: <PangoFontMetrics>;
  c-name: "pango_context_get_metrics";
end;

define inline-only C-function pango-context-get-round-glyph-positions
  input parameter self :: <PangoContext>;
  result res :: <C-boolean>;
  c-name: "pango_context_get_round_glyph_positions";
end;

define inline-only C-function pango-context-get-serial
  input parameter self :: <PangoContext>;
  result res :: <C-unsigned-int>;
  c-name: "pango_context_get_serial";
end;

define inline-only C-function pango-context-list-families
  input parameter self :: <PangoContext>;
  output parameter families_ :: <C-unsigned-char*> /* Not supported */;
  output parameter n_families_ :: <C-signed-int*>;
  c-name: "pango_context_list_families";
end;

define inline-only C-function pango-context-load-font
  input parameter self :: <PangoContext>;
  input parameter desc_ :: <PangoFontDescription>;
  result res :: <PangoFont>;
  c-name: "pango_context_load_font";
end;

define inline-only C-function pango-context-load-fontset
  input parameter self :: <PangoContext>;
  input parameter desc_ :: <PangoFontDescription>;
  input parameter language_ :: <PangoLanguage>;
  result res :: <PangoFontset>;
  c-name: "pango_context_load_fontset";
end;

define inline-only C-function pango-context-set-base-dir
  input parameter self :: <PangoContext>;
  input parameter direction_ :: <PangoDirection>;
  c-name: "pango_context_set_base_dir";
end;

define inline-only C-function pango-context-set-base-gravity
  input parameter self :: <PangoContext>;
  input parameter gravity_ :: <PangoGravity>;
  c-name: "pango_context_set_base_gravity";
end;

define inline-only C-function pango-context-set-font-description
  input parameter self :: <PangoContext>;
  input parameter desc_ :: <PangoFontDescription>;
  c-name: "pango_context_set_font_description";
end;

define inline-only C-function pango-context-set-font-map
  input parameter self :: <PangoContext>;
  input parameter font_map_ :: <PangoFontMap>;
  c-name: "pango_context_set_font_map";
end;

define inline-only C-function pango-context-set-gravity-hint
  input parameter self :: <PangoContext>;
  input parameter hint_ :: <PangoGravityHint>;
  c-name: "pango_context_set_gravity_hint";
end;

define inline-only C-function pango-context-set-language
  input parameter self :: <PangoContext>;
  input parameter language_ :: <PangoLanguage>;
  c-name: "pango_context_set_language";
end;

define inline-only C-function pango-context-set-matrix
  input parameter self :: <PangoContext>;
  input parameter matrix_ :: <PangoMatrix>;
  c-name: "pango_context_set_matrix";
end;

define inline-only C-function pango-context-set-round-glyph-positions
  input parameter self :: <PangoContext>;
  input parameter round_positions_ :: <C-boolean>;
  c-name: "pango_context_set_round_glyph_positions";
end;

define C-struct <_PangoContextClass>
  pointer-type-name: <PangoContextClass>;
end C-struct;

define sealed domain make (singleton(<PangoContextClass>));
define sealed domain initialize (<PangoContextClass>);

define open C-subtype <PangoCoverage> (<GObject>)
end C-subtype;

define C-pointer-type <PangoCoverage*> => <PangoCoverage>;

define sealed domain make (singleton(<PangoCoverage*>));
define sealed domain initialize (<PangoCoverage*>);

define inline-only C-function pango-coverage-new
  result res :: <PangoCoverage>;
  c-name: "pango_coverage_new";
end;

define inline-only C-function pango-coverage-copy
  input parameter self :: <PangoCoverage>;
  result res :: <PangoCoverage>;
  c-name: "pango_coverage_copy";
end;

define inline-only C-function pango-coverage-get
  input parameter self :: <PangoCoverage>;
  input parameter index__ :: <C-signed-int>;
  result res :: <PangoCoverageLevel>;
  c-name: "pango_coverage_get";
end;

define inline-only C-function pango-coverage-set
  input parameter self :: <PangoCoverage>;
  input parameter index__ :: <C-signed-int>;
  input parameter level_ :: <PangoCoverageLevel>;
  c-name: "pango_coverage_set";
end;

define inline-only constant $pango-coverage-none = 0;
define inline-only constant $pango-coverage-fallback = 1;
define inline-only constant $pango-coverage-approximate = 2;
define inline-only constant $pango-coverage-exact = 3;
define constant <PangoCoverageLevel> = <C-int>;
define C-pointer-type <PangoCoverageLevel*> => <PangoCoverageLevel>;

define inline-only constant $pango-direction-ltr = 0;
define inline-only constant $pango-direction-rtl = 1;
define inline-only constant $pango-direction-ttb-ltr = 2;
define inline-only constant $pango-direction-ttb-rtl = 3;
define inline-only constant $pango-direction-weak-ltr = 4;
define inline-only constant $pango-direction-weak-rtl = 5;
define inline-only constant $pango-direction-neutral = 6;
define constant <PangoDirection> = <C-int>;
define C-pointer-type <PangoDirection*> => <PangoDirection>;

define inline-only constant $pango-ellipsize-none = 0;
define inline-only constant $pango-ellipsize-start = 1;
define inline-only constant $pango-ellipsize-middle = 2;
define inline-only constant $pango-ellipsize-end = 3;
define constant <PangoEllipsizeMode> = <C-int>;
define C-pointer-type <PangoEllipsizeMode*> => <PangoEllipsizeMode>;

define open C-subtype <PangoFont> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <PangoFont*> => <PangoFont>;

define sealed domain make (singleton(<PangoFont*>));
define sealed domain initialize (<PangoFont*>);

define inline-only C-function pango-font-descriptions-free
  input parameter descs_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_descs_ :: <C-signed-int>;
  c-name: "pango_font_descriptions_free";
end;

define inline-only C-function pango-font-deserialize
  input parameter context_ :: <PangoContext>;
  input parameter bytes_ :: <GBytes>;
  output parameter error_ :: <GError*>;
  result res :: <PangoFont>;
  c-name: "pango_font_deserialize";
end;

define inline-only C-function pango-font-describe
  input parameter self :: <PangoFont>;
  result res :: <PangoFontDescription>;
  c-name: "pango_font_describe";
end;

define inline-only C-function pango-font-describe-with-absolute-size
  input parameter self :: <PangoFont>;
  result res :: <PangoFontDescription>;
  c-name: "pango_font_describe_with_absolute_size";
end;

define inline-only C-function pango-font-get-coverage
  input parameter self :: <PangoFont>;
  input parameter language_ :: <PangoLanguage>;
  result res :: <PangoCoverage>;
  c-name: "pango_font_get_coverage";
end;

define inline-only C-function pango-font-get-face
  input parameter self :: <PangoFont>;
  result res :: <PangoFontFace>;
  c-name: "pango_font_get_face";
end;

define inline-only C-function pango-font-get-features
  input parameter self :: <PangoFont>;
  output parameter features_ :: <C-unsigned-char*> /* Not supported */;
  output parameter len_ :: <C-unsigned-int*>;
  input output parameter num_features_ :: <C-unsigned-int*>;
  c-name: "pango_font_get_features";
end;

define inline-only C-function pango-font-get-font-map
  input parameter self :: <PangoFont>;
  result res :: <PangoFontMap>;
  c-name: "pango_font_get_font_map";
end;

define inline-only C-function pango-font-get-glyph-extents
  input parameter self :: <PangoFont>;
  input parameter glyph_ :: <C-unsigned-int>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_font_get_glyph_extents";
end;

define inline-only C-function pango-font-get-languages
  input parameter self :: <PangoFont>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "pango_font_get_languages";
end;

define inline-only C-function pango-font-get-metrics
  input parameter self :: <PangoFont>;
  input parameter language_ :: <PangoLanguage>;
  result res :: <PangoFontMetrics>;
  c-name: "pango_font_get_metrics";
end;

define inline-only C-function pango-font-has-char
  input parameter self :: <PangoFont>;
  input parameter wc_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "pango_font_has_char";
end;

define inline-only C-function pango-font-serialize
  input parameter self :: <PangoFont>;
  result res :: <GBytes>;
  c-name: "pango_font_serialize";
end;

define C-struct <_PangoFontClass>
  constant sealed inline-only slot pango-font-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot pango-font-class-describe :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-class-get-coverage :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-class-get-glyph-extents :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-class-get-metrics :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-class-get-font-map :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-class-describe-absolute :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-class-get-features :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-class-create-hb-font :: <C-function-pointer>;
  pointer-type-name: <PangoFontClass>;
end C-struct;

define sealed domain make (singleton(<PangoFontClass>));
define sealed domain initialize (<PangoFontClass>);

define C-struct <_PangoFontDescription>
  pointer-type-name: <PangoFontDescription>;
end C-struct;

define sealed domain make (singleton(<PangoFontDescription>));
define sealed domain initialize (<PangoFontDescription>);

define inline-only C-function pango-font-description-new
  result res :: <PangoFontDescription>;
  c-name: "pango_font_description_new";
end;

define inline-only C-function pango-font-description-better-match
  input parameter self :: <PangoFontDescription>;
  input parameter old_match_ :: <PangoFontDescription>;
  input parameter new_match_ :: <PangoFontDescription>;
  result res :: <C-boolean>;
  c-name: "pango_font_description_better_match";
end;

define inline-only C-function pango-font-description-copy
  input parameter self :: <PangoFontDescription>;
  result res :: <PangoFontDescription>;
  c-name: "pango_font_description_copy";
end;

define inline-only C-function pango-font-description-copy-static
  input parameter self :: <PangoFontDescription>;
  result res :: <PangoFontDescription>;
  c-name: "pango_font_description_copy_static";
end;

define inline-only C-function pango-font-description-equal
  input parameter self :: <PangoFontDescription>;
  input parameter desc2_ :: <PangoFontDescription>;
  result res :: <C-boolean>;
  c-name: "pango_font_description_equal";
end;

define inline-only C-function pango-font-description-free
  input parameter self :: <PangoFontDescription>;
  c-name: "pango_font_description_free";
end;

define inline-only C-function pango-font-description-get-family
  input parameter self :: <PangoFontDescription>;
  result res :: <C-string>;
  c-name: "pango_font_description_get_family";
end;

define inline-only C-function pango-font-description-get-gravity
  input parameter self :: <PangoFontDescription>;
  result res :: <PangoGravity>;
  c-name: "pango_font_description_get_gravity";
end;

define inline-only C-function pango-font-description-get-set-fields
  input parameter self :: <PangoFontDescription>;
  result res :: <PangoFontMask>;
  c-name: "pango_font_description_get_set_fields";
end;

define inline-only C-function pango-font-description-get-size
  input parameter self :: <PangoFontDescription>;
  result res :: <C-signed-int>;
  c-name: "pango_font_description_get_size";
end;

define inline-only C-function pango-font-description-get-size-is-absolute
  input parameter self :: <PangoFontDescription>;
  result res :: <C-boolean>;
  c-name: "pango_font_description_get_size_is_absolute";
end;

define inline-only C-function pango-font-description-get-stretch
  input parameter self :: <PangoFontDescription>;
  result res :: <PangoStretch>;
  c-name: "pango_font_description_get_stretch";
end;

define inline-only C-function pango-font-description-get-style
  input parameter self :: <PangoFontDescription>;
  result res :: <PangoStyle>;
  c-name: "pango_font_description_get_style";
end;

define inline-only C-function pango-font-description-get-variant
  input parameter self :: <PangoFontDescription>;
  result res :: <PangoVariant>;
  c-name: "pango_font_description_get_variant";
end;

define inline-only C-function pango-font-description-get-variations
  input parameter self :: <PangoFontDescription>;
  result res :: <C-string>;
  c-name: "pango_font_description_get_variations";
end;

define inline-only C-function pango-font-description-get-weight
  input parameter self :: <PangoFontDescription>;
  result res :: <PangoWeight>;
  c-name: "pango_font_description_get_weight";
end;

define inline-only C-function pango-font-description-hash
  input parameter self :: <PangoFontDescription>;
  result res :: <C-unsigned-int>;
  c-name: "pango_font_description_hash";
end;

define inline-only C-function pango-font-description-merge
  input parameter self :: <PangoFontDescription>;
  input parameter desc_to_merge_ :: <PangoFontDescription>;
  input parameter replace_existing_ :: <C-boolean>;
  c-name: "pango_font_description_merge";
end;

define inline-only C-function pango-font-description-merge-static
  input parameter self :: <PangoFontDescription>;
  input parameter desc_to_merge_ :: <PangoFontDescription>;
  input parameter replace_existing_ :: <C-boolean>;
  c-name: "pango_font_description_merge_static";
end;

define inline-only C-function pango-font-description-set-absolute-size
  input parameter self :: <PangoFontDescription>;
  input parameter size_ :: <C-double>;
  c-name: "pango_font_description_set_absolute_size";
end;

define inline-only C-function pango-font-description-set-family
  input parameter self :: <PangoFontDescription>;
  input parameter family_ :: <C-string>;
  c-name: "pango_font_description_set_family";
end;

define inline-only C-function pango-font-description-set-family-static
  input parameter self :: <PangoFontDescription>;
  input parameter family_ :: <C-string>;
  c-name: "pango_font_description_set_family_static";
end;

define inline-only C-function pango-font-description-set-gravity
  input parameter self :: <PangoFontDescription>;
  input parameter gravity_ :: <PangoGravity>;
  c-name: "pango_font_description_set_gravity";
end;

define inline-only C-function pango-font-description-set-size
  input parameter self :: <PangoFontDescription>;
  input parameter size_ :: <C-signed-int>;
  c-name: "pango_font_description_set_size";
end;

define inline-only C-function pango-font-description-set-stretch
  input parameter self :: <PangoFontDescription>;
  input parameter stretch_ :: <PangoStretch>;
  c-name: "pango_font_description_set_stretch";
end;

define inline-only C-function pango-font-description-set-style
  input parameter self :: <PangoFontDescription>;
  input parameter style_ :: <PangoStyle>;
  c-name: "pango_font_description_set_style";
end;

define inline-only C-function pango-font-description-set-variant
  input parameter self :: <PangoFontDescription>;
  input parameter variant_ :: <PangoVariant>;
  c-name: "pango_font_description_set_variant";
end;

define inline-only C-function pango-font-description-set-variations
  input parameter self :: <PangoFontDescription>;
  input parameter variations_ :: <C-string>;
  c-name: "pango_font_description_set_variations";
end;

define inline-only C-function pango-font-description-set-variations-static
  input parameter self :: <PangoFontDescription>;
  input parameter variations_ :: <C-string>;
  c-name: "pango_font_description_set_variations_static";
end;

define inline-only C-function pango-font-description-set-weight
  input parameter self :: <PangoFontDescription>;
  input parameter weight_ :: <PangoWeight>;
  c-name: "pango_font_description_set_weight";
end;

define inline-only C-function pango-font-description-to-filename
  input parameter self :: <PangoFontDescription>;
  result res :: <C-string>;
  c-name: "pango_font_description_to_filename";
end;

define inline-only C-function pango-font-description-to-string
  input parameter self :: <PangoFontDescription>;
  result res :: <C-string>;
  c-name: "pango_font_description_to_string";
end;

define inline-only C-function pango-font-description-unset-fields
  input parameter self :: <PangoFontDescription>;
  input parameter to_unset_ :: <PangoFontMask>;
  c-name: "pango_font_description_unset_fields";
end;

define inline-only C-function pango-font-description-from-string
  input parameter str_ :: <C-string>;
  result res :: <PangoFontDescription>;
  c-name: "pango_font_description_from_string";
end;

define open C-subtype <PangoFontFace> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <PangoFontFace*> => <PangoFontFace>;

define sealed domain make (singleton(<PangoFontFace*>));
define sealed domain initialize (<PangoFontFace*>);

define inline-only C-function pango-font-face-describe
  input parameter self :: <PangoFontFace>;
  result res :: <PangoFontDescription>;
  c-name: "pango_font_face_describe";
end;

define inline-only C-function pango-font-face-get-face-name
  input parameter self :: <PangoFontFace>;
  result res :: <C-string>;
  c-name: "pango_font_face_get_face_name";
end;

define inline-only C-function pango-font-face-get-family
  input parameter self :: <PangoFontFace>;
  result res :: <PangoFontFamily>;
  c-name: "pango_font_face_get_family";
end;

define inline-only C-function pango-font-face-is-synthesized
  input parameter self :: <PangoFontFace>;
  result res :: <C-boolean>;
  c-name: "pango_font_face_is_synthesized";
end;

define inline-only C-function pango-font-face-list-sizes
  input parameter self :: <PangoFontFace>;
  output parameter sizes_ :: <C-signed-int*>;
  output parameter n_sizes_ :: <C-signed-int*>;
  c-name: "pango_font_face_list_sizes";
end;

define C-struct <_PangoFontFaceClass>
  constant sealed inline-only slot pango-font-face-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot pango-font-face-class-get-face-name :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-face-class-describe :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-face-class-list-sizes :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-face-class-is-synthesized :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-face-class-get-family :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-face-class-_pango-reserved3 :: <C-void*>;
  constant sealed inline-only slot pango-font-face-class-_pango-reserved4 :: <C-void*>;
  pointer-type-name: <PangoFontFaceClass>;
end C-struct;

define sealed domain make (singleton(<PangoFontFaceClass>));
define sealed domain initialize (<PangoFontFaceClass>);

define open C-subtype <PangoFontFamily> (<GObject>, <GListModel>)
  // parent_instance
end C-subtype;

define C-pointer-type <PangoFontFamily*> => <PangoFontFamily>;

define sealed domain make (singleton(<PangoFontFamily*>));
define sealed domain initialize (<PangoFontFamily*>);

define inline-only C-function pango-font-family-get-face
  input parameter self :: <PangoFontFamily>;
  input parameter name_ :: <C-string>;
  result res :: <PangoFontFace>;
  c-name: "pango_font_family_get_face";
end;

define inline-only C-function pango-font-family-get-name
  input parameter self :: <PangoFontFamily>;
  result res :: <C-string>;
  c-name: "pango_font_family_get_name";
end;

define inline-only C-function pango-font-family-is-monospace
  input parameter self :: <PangoFontFamily>;
  result res :: <C-boolean>;
  c-name: "pango_font_family_is_monospace";
end;

define inline-only C-function pango-font-family-is-variable
  input parameter self :: <PangoFontFamily>;
  result res :: <C-boolean>;
  c-name: "pango_font_family_is_variable";
end;

define inline-only C-function pango-font-family-list-faces
  input parameter self :: <PangoFontFamily>;
  output parameter faces_ :: <C-unsigned-char*> /* Not supported */;
  output parameter n_faces_ :: <C-signed-int*>;
  c-name: "pango_font_family_list_faces";
end;

define C-struct <_PangoFontFamilyClass>
  constant sealed inline-only slot pango-font-family-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot pango-font-family-class-list-faces :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-family-class-get-name :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-family-class-is-monospace :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-family-class-is-variable :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-family-class-get-face :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-family-class-_pango-reserved2 :: <C-void*>;
  pointer-type-name: <PangoFontFamilyClass>;
end C-struct;

define sealed domain make (singleton(<PangoFontFamilyClass>));
define sealed domain initialize (<PangoFontFamilyClass>);

define open C-subtype <PangoFontMap> (<GObject>, <GListModel>)
  // parent_instance
end C-subtype;

define C-pointer-type <PangoFontMap*> => <PangoFontMap>;

define sealed domain make (singleton(<PangoFontMap*>));
define sealed domain initialize (<PangoFontMap*>);

define inline-only C-function pango-font-map-changed
  input parameter self :: <PangoFontMap>;
  c-name: "pango_font_map_changed";
end;

define inline-only C-function pango-font-map-create-context
  input parameter self :: <PangoFontMap>;
  result res :: <PangoContext>;
  c-name: "pango_font_map_create_context";
end;

define inline-only C-function pango-font-map-get-family
  input parameter self :: <PangoFontMap>;
  input parameter name_ :: <C-string>;
  result res :: <PangoFontFamily>;
  c-name: "pango_font_map_get_family";
end;

define inline-only C-function pango-font-map-get-serial
  input parameter self :: <PangoFontMap>;
  result res :: <C-unsigned-int>;
  c-name: "pango_font_map_get_serial";
end;

define inline-only C-function pango-font-map-list-families
  input parameter self :: <PangoFontMap>;
  output parameter families_ :: <C-unsigned-char*> /* Not supported */;
  output parameter n_families_ :: <C-signed-int*>;
  c-name: "pango_font_map_list_families";
end;

define inline-only C-function pango-font-map-load-font
  input parameter self :: <PangoFontMap>;
  input parameter context_ :: <PangoContext>;
  input parameter desc_ :: <PangoFontDescription>;
  result res :: <PangoFont>;
  c-name: "pango_font_map_load_font";
end;

define inline-only C-function pango-font-map-load-fontset
  input parameter self :: <PangoFontMap>;
  input parameter context_ :: <PangoContext>;
  input parameter desc_ :: <PangoFontDescription>;
  input parameter language_ :: <PangoLanguage>;
  result res :: <PangoFontset>;
  c-name: "pango_font_map_load_fontset";
end;

define C-struct <_PangoFontMapClass>
  constant sealed inline-only slot pango-font-map-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot pango-font-map-class-load-font :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-map-class-list-families :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-map-class-load-fontset :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-map-class-shape-engine-type :: <C-string>;
  constant sealed inline-only slot pango-font-map-class-get-serial :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-map-class-changed :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-map-class-get-family :: <C-function-pointer>;
  constant sealed inline-only slot pango-font-map-class-get-face :: <C-void*>;
  pointer-type-name: <PangoFontMapClass>;
end C-struct;

define sealed domain make (singleton(<PangoFontMapClass>));
define sealed domain initialize (<PangoFontMapClass>);

define inline-only constant $pango-font-mask-family = 1;
define inline-only constant $pango-font-mask-style = 2;
define inline-only constant $pango-font-mask-variant = 4;
define inline-only constant $pango-font-mask-weight = 8;
define inline-only constant $pango-font-mask-stretch = 16;
define inline-only constant $pango-font-mask-size = 32;
define inline-only constant $pango-font-mask-gravity = 64;
define inline-only constant $pango-font-mask-variations = 128;
define constant <PangoFontMask> = <C-int>;
define C-pointer-type <PangoFontMask*> => <PangoFontMask>;

define C-struct <_PangoFontMetrics>
  constant sealed inline-only slot pango-font-metrics-ref-count :: <C-unsigned-int>;
  constant sealed inline-only slot pango-font-metrics-ascent :: <C-signed-int>;
  constant sealed inline-only slot pango-font-metrics-descent :: <C-signed-int>;
  constant sealed inline-only slot pango-font-metrics-height :: <C-signed-int>;
  constant sealed inline-only slot pango-font-metrics-approximate-char-width :: <C-signed-int>;
  constant sealed inline-only slot pango-font-metrics-approximate-digit-width :: <C-signed-int>;
  constant sealed inline-only slot pango-font-metrics-underline-position :: <C-signed-int>;
  constant sealed inline-only slot pango-font-metrics-underline-thickness :: <C-signed-int>;
  constant sealed inline-only slot pango-font-metrics-strikethrough-position :: <C-signed-int>;
  constant sealed inline-only slot pango-font-metrics-strikethrough-thickness :: <C-signed-int>;
  pointer-type-name: <PangoFontMetrics>;
end C-struct;

define sealed domain make (singleton(<PangoFontMetrics>));
define sealed domain initialize (<PangoFontMetrics>);

define inline-only C-function pango-font-metrics-get-approximate-char-width
  input parameter self :: <PangoFontMetrics>;
  result res :: <C-signed-int>;
  c-name: "pango_font_metrics_get_approximate_char_width";
end;

define inline-only C-function pango-font-metrics-get-approximate-digit-width
  input parameter self :: <PangoFontMetrics>;
  result res :: <C-signed-int>;
  c-name: "pango_font_metrics_get_approximate_digit_width";
end;

define inline-only C-function pango-font-metrics-get-ascent
  input parameter self :: <PangoFontMetrics>;
  result res :: <C-signed-int>;
  c-name: "pango_font_metrics_get_ascent";
end;

define inline-only C-function pango-font-metrics-get-descent
  input parameter self :: <PangoFontMetrics>;
  result res :: <C-signed-int>;
  c-name: "pango_font_metrics_get_descent";
end;

define inline-only C-function pango-font-metrics-get-height
  input parameter self :: <PangoFontMetrics>;
  result res :: <C-signed-int>;
  c-name: "pango_font_metrics_get_height";
end;

define inline-only C-function pango-font-metrics-get-strikethrough-position
  input parameter self :: <PangoFontMetrics>;
  result res :: <C-signed-int>;
  c-name: "pango_font_metrics_get_strikethrough_position";
end;

define inline-only C-function pango-font-metrics-get-strikethrough-thickness
  input parameter self :: <PangoFontMetrics>;
  result res :: <C-signed-int>;
  c-name: "pango_font_metrics_get_strikethrough_thickness";
end;

define inline-only C-function pango-font-metrics-get-underline-position
  input parameter self :: <PangoFontMetrics>;
  result res :: <C-signed-int>;
  c-name: "pango_font_metrics_get_underline_position";
end;

define inline-only C-function pango-font-metrics-get-underline-thickness
  input parameter self :: <PangoFontMetrics>;
  result res :: <C-signed-int>;
  c-name: "pango_font_metrics_get_underline_thickness";
end;

define inline-only C-function pango-font-metrics-ref
  input parameter self :: <PangoFontMetrics>;
  result res :: <PangoFontMetrics>;
  c-name: "pango_font_metrics_ref";
end;

define inline-only C-function pango-font-metrics-unref
  input parameter self :: <PangoFontMetrics>;
  c-name: "pango_font_metrics_unref";
end;

define inline-only constant $pango-font-scale-none = 0;
define inline-only constant $pango-font-scale-superscript = 1;
define inline-only constant $pango-font-scale-subscript = 2;
define inline-only constant $pango-font-scale-small-caps = 3;
define constant <PangoFontScale> = <C-int>;
define C-pointer-type <PangoFontScale*> => <PangoFontScale>;

define open C-subtype <PangoFontset> (<GObject>)
  // parent_instance
end C-subtype;

define C-pointer-type <PangoFontset*> => <PangoFontset>;

define sealed domain make (singleton(<PangoFontset*>));
define sealed domain initialize (<PangoFontset*>);

define inline-only C-function pango-fontset-foreach
  input parameter self :: <PangoFontset>;
  input parameter func_ :: <C-function-pointer>;
  input parameter data_ :: <C-void*>;
  c-name: "pango_fontset_foreach";
end;

define inline-only C-function pango-fontset-get-font
  input parameter self :: <PangoFontset>;
  input parameter wc_ :: <C-unsigned-int>;
  result res :: <PangoFont>;
  c-name: "pango_fontset_get_font";
end;

define inline-only C-function pango-fontset-get-metrics
  input parameter self :: <PangoFontset>;
  result res :: <PangoFontMetrics>;
  c-name: "pango_fontset_get_metrics";
end;

define C-struct <_PangoFontsetClass>
  constant sealed inline-only slot pango-fontset-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot pango-fontset-class-get-font :: <C-function-pointer>;
  constant sealed inline-only slot pango-fontset-class-get-metrics :: <C-function-pointer>;
  constant sealed inline-only slot pango-fontset-class-get-language :: <C-function-pointer>;
  constant sealed inline-only slot pango-fontset-class-foreach :: <C-function-pointer>;
  constant sealed inline-only slot pango-fontset-class-_pango-reserved1 :: <C-void*>;
  constant sealed inline-only slot pango-fontset-class-_pango-reserved2 :: <C-void*>;
  constant sealed inline-only slot pango-fontset-class-_pango-reserved3 :: <C-void*>;
  constant sealed inline-only slot pango-fontset-class-_pango-reserved4 :: <C-void*>;
  pointer-type-name: <PangoFontsetClass>;
end C-struct;

define sealed domain make (singleton(<PangoFontsetClass>));
define sealed domain initialize (<PangoFontsetClass>);

define open C-subtype <PangoFontsetSimple> (<PangoFontset>)
end C-subtype;

define C-pointer-type <PangoFontsetSimple*> => <PangoFontsetSimple>;

define sealed domain make (singleton(<PangoFontsetSimple*>));
define sealed domain initialize (<PangoFontsetSimple*>);

define inline-only C-function pango-fontset-simple-new
  input parameter language_ :: <PangoLanguage>;
  result res :: <PangoFontsetSimple>;
  c-name: "pango_fontset_simple_new";
end;

define inline-only C-function pango-fontset-simple-append
  input parameter self :: <PangoFontsetSimple>;
  input parameter font_ :: <PangoFont>;
  c-name: "pango_fontset_simple_append";
end;

define inline-only C-function pango-fontset-simple-size
  input parameter self :: <PangoFontsetSimple>;
  result res :: <C-signed-int>;
  c-name: "pango_fontset_simple_size";
end;

define C-struct <_PangoFontsetSimpleClass>
  pointer-type-name: <PangoFontsetSimpleClass>;
end C-struct;

define sealed domain make (singleton(<PangoFontsetSimpleClass>));
define sealed domain initialize (<PangoFontsetSimpleClass>);

define inline-only constant $glyph-empty = 268435455;

define inline-only constant $glyph-invalid-input = 4294967295;

define inline-only constant $glyph-unknown-flag = 268435456;

define C-struct <_PangoGlyphGeometry>
  sealed inline-only slot pango-glyph-geometry-width :: <C-signed-int>;
  sealed inline-only slot pango-glyph-geometry-x-offset :: <C-signed-int>;
  sealed inline-only slot pango-glyph-geometry-y-offset :: <C-signed-int>;
  pointer-type-name: <PangoGlyphGeometry>;
end C-struct;

define sealed domain make (singleton(<PangoGlyphGeometry>));
define sealed domain initialize (<PangoGlyphGeometry>);

define C-struct <_PangoGlyphInfo>
  sealed inline-only slot pango-glyph-info-glyph :: <C-unsigned-int>;
  sealed inline-only slot pango-glyph-info-geometry :: <PangoGlyphGeometry>;
  sealed inline-only slot pango-glyph-info-attr :: <PangoGlyphVisAttr>;
  pointer-type-name: <PangoGlyphInfo>;
end C-struct;

define sealed domain make (singleton(<PangoGlyphInfo>));
define sealed domain initialize (<PangoGlyphInfo>);

define C-struct <_PangoGlyphItem>
  sealed inline-only slot pango-glyph-item-item :: <PangoItem>;
  sealed inline-only slot pango-glyph-item-glyphs :: <PangoGlyphString>;
  sealed inline-only slot pango-glyph-item-y-offset :: <C-signed-int>;
  sealed inline-only slot pango-glyph-item-start-x-offset :: <C-signed-int>;
  sealed inline-only slot pango-glyph-item-end-x-offset :: <C-signed-int>;
  pointer-type-name: <PangoGlyphItem>;
end C-struct;

define sealed domain make (singleton(<PangoGlyphItem>));
define sealed domain initialize (<PangoGlyphItem>);

define inline-only C-function pango-glyph-item-apply-attrs
  input parameter self :: <PangoGlyphItem>;
  input parameter text_ :: <C-string>;
  input parameter list_ :: <PangoAttrList>;
  result res :: <GSList>;
  c-name: "pango_glyph_item_apply_attrs";
end;

define inline-only C-function pango-glyph-item-copy
  input parameter self :: <PangoGlyphItem>;
  result res :: <PangoGlyphItem>;
  c-name: "pango_glyph_item_copy";
end;

define inline-only C-function pango-glyph-item-free
  input parameter self :: <PangoGlyphItem>;
  c-name: "pango_glyph_item_free";
end;

define inline-only C-function pango-glyph-item-get-logical-widths
  input parameter self :: <PangoGlyphItem>;
  input parameter text_ :: <C-string>;
  input parameter logical_widths_ :: <C-signed-int*>;
  c-name: "pango_glyph_item_get_logical_widths";
end;

define inline-only C-function pango-glyph-item-letter-space
  input parameter self :: <PangoGlyphItem>;
  input parameter text_ :: <C-string>;
  input parameter log_attrs_ :: <C-unsigned-char*> /* Not supported */;
  input parameter letter_spacing_ :: <C-signed-int>;
  c-name: "pango_glyph_item_letter_space";
end;

define inline-only C-function pango-glyph-item-split
  input parameter self :: <PangoGlyphItem>;
  input parameter text_ :: <C-string>;
  input parameter split_index_ :: <C-signed-int>;
  result res :: <PangoGlyphItem>;
  c-name: "pango_glyph_item_split";
end;

define C-struct <_PangoGlyphItemIter>
  sealed inline-only slot pango-glyph-item-iter-glyph-item :: <PangoGlyphItem>;
  sealed inline-only slot pango-glyph-item-iter-text :: <C-string>;
  sealed inline-only slot pango-glyph-item-iter-start-glyph :: <C-signed-int>;
  sealed inline-only slot pango-glyph-item-iter-start-index :: <C-signed-int>;
  sealed inline-only slot pango-glyph-item-iter-start-char :: <C-signed-int>;
  sealed inline-only slot pango-glyph-item-iter-end-glyph :: <C-signed-int>;
  sealed inline-only slot pango-glyph-item-iter-end-index :: <C-signed-int>;
  sealed inline-only slot pango-glyph-item-iter-end-char :: <C-signed-int>;
  pointer-type-name: <PangoGlyphItemIter>;
end C-struct;

define sealed domain make (singleton(<PangoGlyphItemIter>));
define sealed domain initialize (<PangoGlyphItemIter>);

define inline-only C-function pango-glyph-item-iter-copy
  input parameter self :: <PangoGlyphItemIter>;
  result res :: <PangoGlyphItemIter>;
  c-name: "pango_glyph_item_iter_copy";
end;

define inline-only C-function pango-glyph-item-iter-free
  input parameter self :: <PangoGlyphItemIter>;
  c-name: "pango_glyph_item_iter_free";
end;

define inline-only C-function pango-glyph-item-iter-init-end
  input parameter self :: <PangoGlyphItemIter>;
  input parameter glyph_item_ :: <PangoGlyphItem>;
  input parameter text_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "pango_glyph_item_iter_init_end";
end;

define inline-only C-function pango-glyph-item-iter-init-start
  input parameter self :: <PangoGlyphItemIter>;
  input parameter glyph_item_ :: <PangoGlyphItem>;
  input parameter text_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "pango_glyph_item_iter_init_start";
end;

define inline-only C-function pango-glyph-item-iter-next-cluster
  input parameter self :: <PangoGlyphItemIter>;
  result res :: <C-boolean>;
  c-name: "pango_glyph_item_iter_next_cluster";
end;

define inline-only C-function pango-glyph-item-iter-prev-cluster
  input parameter self :: <PangoGlyphItemIter>;
  result res :: <C-boolean>;
  c-name: "pango_glyph_item_iter_prev_cluster";
end;

define C-struct <_PangoGlyphString>
  sealed inline-only slot pango-glyph-string-num-glyphs :: <C-signed-int>;
  sealed inline-only slot pango-glyph-string-glyphs :: <C-unsigned-char*> /* Not supported */;
  sealed inline-only slot pango-glyph-string-log-clusters :: <C-signed-int*>;
  constant sealed inline-only slot pango-glyph-string-space :: <C-signed-int>;
  pointer-type-name: <PangoGlyphString>;
end C-struct;

define sealed domain make (singleton(<PangoGlyphString>));
define sealed domain initialize (<PangoGlyphString>);

define inline-only C-function pango-glyph-string-new
  result res :: <PangoGlyphString>;
  c-name: "pango_glyph_string_new";
end;

define inline-only C-function pango-glyph-string-copy
  input parameter self :: <PangoGlyphString>;
  result res :: <PangoGlyphString>;
  c-name: "pango_glyph_string_copy";
end;

define inline-only C-function pango-glyph-string-extents
  input parameter self :: <PangoGlyphString>;
  input parameter font_ :: <PangoFont>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_glyph_string_extents";
end;

define inline-only C-function pango-glyph-string-extents-range
  input parameter self :: <PangoGlyphString>;
  input parameter start_ :: <C-signed-int>;
  input parameter end_ :: <C-signed-int>;
  input parameter font_ :: <PangoFont>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_glyph_string_extents_range";
end;

define inline-only C-function pango-glyph-string-free
  input parameter self :: <PangoGlyphString>;
  c-name: "pango_glyph_string_free";
end;

define inline-only C-function pango-glyph-string-get-logical-widths
  input parameter self :: <PangoGlyphString>;
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter embedding_level_ :: <C-signed-int>;
  input parameter logical_widths_ :: <C-signed-int*>;
  c-name: "pango_glyph_string_get_logical_widths";
end;

define inline-only C-function pango-glyph-string-get-width
  input parameter self :: <PangoGlyphString>;
  result res :: <C-signed-int>;
  c-name: "pango_glyph_string_get_width";
end;

define inline-only C-function pango-glyph-string-index-to-x
  input parameter self :: <PangoGlyphString>;
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter analysis_ :: <PangoAnalysis>;
  input parameter index__ :: <C-signed-int>;
  input parameter trailing_ :: <C-boolean>;
  output parameter x_pos_ :: <C-signed-int*>;
  c-name: "pango_glyph_string_index_to_x";
end;

define inline-only C-function pango-glyph-string-index-to-x-full
  input parameter self :: <PangoGlyphString>;
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter analysis_ :: <PangoAnalysis>;
  input parameter attrs_ :: <PangoLogAttr>;
  input parameter index__ :: <C-signed-int>;
  input parameter trailing_ :: <C-boolean>;
  output parameter x_pos_ :: <C-signed-int*>;
  c-name: "pango_glyph_string_index_to_x_full";
end;

define inline-only C-function pango-glyph-string-set-size
  input parameter self :: <PangoGlyphString>;
  input parameter new_len_ :: <C-signed-int>;
  c-name: "pango_glyph_string_set_size";
end;

define inline-only C-function pango-glyph-string-x-to-index
  input parameter self :: <PangoGlyphString>;
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter analysis_ :: <PangoAnalysis>;
  input parameter x_pos_ :: <C-signed-int>;
  output parameter index__ :: <C-signed-int*>;
  output parameter trailing_ :: <C-signed-int*>;
  c-name: "pango_glyph_string_x_to_index";
end;

define C-struct <_PangoGlyphVisAttr>
  sealed inline-only slot pango-glyph-vis-attr-is-cluster-start :: <C-unsigned-int>;
  sealed inline-only slot pango-glyph-vis-attr-is-color :: <C-unsigned-int>;
  pointer-type-name: <PangoGlyphVisAttr>;
end C-struct;

define sealed domain make (singleton(<PangoGlyphVisAttr>));
define sealed domain initialize (<PangoGlyphVisAttr>);

define inline-only constant $pango-gravity-south = 0;
define inline-only constant $pango-gravity-east = 1;
define inline-only constant $pango-gravity-north = 2;
define inline-only constant $pango-gravity-west = 3;
define inline-only constant $pango-gravity-auto = 4;
define constant <PangoGravity> = <C-int>;
define C-pointer-type <PangoGravity*> => <PangoGravity>;

define inline-only constant $pango-gravity-hint-natural = 0;
define inline-only constant $pango-gravity-hint-strong = 1;
define inline-only constant $pango-gravity-hint-line = 2;
define constant <PangoGravityHint> = <C-int>;
define C-pointer-type <PangoGravityHint*> => <PangoGravityHint>;

define C-struct <_PangoItem>
  sealed inline-only slot pango-item-offset :: <C-signed-int>;
  sealed inline-only slot pango-item-length :: <C-signed-int>;
  sealed inline-only slot pango-item-num-chars :: <C-signed-int>;
  sealed inline-only slot pango-item-analysis :: <PangoAnalysis>;
  pointer-type-name: <PangoItem>;
end C-struct;

define sealed domain make (singleton(<PangoItem>));
define sealed domain initialize (<PangoItem>);

define inline-only C-function pango-item-new
  result res :: <PangoItem>;
  c-name: "pango_item_new";
end;

define inline-only C-function pango-item-apply-attrs
  input parameter self :: <PangoItem>;
  input parameter iter_ :: <PangoAttrIterator>;
  c-name: "pango_item_apply_attrs";
end;

define inline-only C-function pango-item-copy
  input parameter self :: <PangoItem>;
  result res :: <PangoItem>;
  c-name: "pango_item_copy";
end;

define inline-only C-function pango-item-free
  input parameter self :: <PangoItem>;
  c-name: "pango_item_free";
end;

define inline-only C-function pango-item-split
  input parameter self :: <PangoItem>;
  input parameter split_index_ :: <C-signed-int>;
  input parameter split_offset_ :: <C-signed-int>;
  result res :: <PangoItem>;
  c-name: "pango_item_split";
end;

define C-struct <_PangoLanguage>
  pointer-type-name: <PangoLanguage>;
end C-struct;

define sealed domain make (singleton(<PangoLanguage>));
define sealed domain initialize (<PangoLanguage>);

define inline-only C-function pango-language-get-sample-string
  input parameter self :: <PangoLanguage>;
  result res :: <C-string>;
  c-name: "pango_language_get_sample_string";
end;

define inline-only C-function pango-language-get-scripts
  input parameter self :: <PangoLanguage>;
  output parameter num_scripts_ :: <C-signed-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "pango_language_get_scripts";
end;

define inline-only C-function pango-language-includes-script
  input parameter self :: <PangoLanguage>;
  input parameter script_ :: <PangoScript>;
  result res :: <C-boolean>;
  c-name: "pango_language_includes_script";
end;

define inline-only C-function pango-language-matches
  input parameter self :: <PangoLanguage>;
  input parameter range_list_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "pango_language_matches";
end;

define inline-only C-function pango-language-to-string
  input parameter self :: <PangoLanguage>;
  result res :: <C-string>;
  c-name: "pango_language_to_string";
end;

define inline-only C-function pango-language-from-string
  input parameter language_ :: <C-string>;
  result res :: <PangoLanguage>;
  c-name: "pango_language_from_string";
end;

define inline-only C-function pango-language-get-default
  result res :: <PangoLanguage>;
  c-name: "pango_language_get_default";
end;

define inline-only C-function pango-language-get-preferred
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "pango_language_get_preferred";
end;

define open C-subtype <PangoLayout> (<GObject>)
end C-subtype;

define C-pointer-type <PangoLayout*> => <PangoLayout>;

define sealed domain make (singleton(<PangoLayout*>));
define sealed domain initialize (<PangoLayout*>);

define inline-only C-function pango-layout-new
  input parameter context_ :: <PangoContext>;
  result res :: <PangoLayout>;
  c-name: "pango_layout_new";
end;

define inline-only C-function pango-layout-deserialize
  input parameter context_ :: <PangoContext>;
  input parameter bytes_ :: <GBytes>;
  input parameter flags_ :: <PangoLayoutDeserializeFlags>;
  output parameter error_ :: <GError*>;
  result res :: <PangoLayout>;
  c-name: "pango_layout_deserialize";
end;

define inline-only C-function pango-layout-context-changed
  input parameter self :: <PangoLayout>;
  c-name: "pango_layout_context_changed";
end;

define inline-only C-function pango-layout-copy
  input parameter self :: <PangoLayout>;
  result res :: <PangoLayout>;
  c-name: "pango_layout_copy";
end;

define inline-only C-function pango-layout-get-alignment
  input parameter self :: <PangoLayout>;
  result res :: <PangoAlignment>;
  c-name: "pango_layout_get_alignment";
end;

define inline-only C-function pango-layout-get-attributes
  input parameter self :: <PangoLayout>;
  result res :: <PangoAttrList>;
  c-name: "pango_layout_get_attributes";
end;

define inline-only C-function pango-layout-get-auto-dir
  input parameter self :: <PangoLayout>;
  result res :: <C-boolean>;
  c-name: "pango_layout_get_auto_dir";
end;

define inline-only C-function pango-layout-get-baseline
  input parameter self :: <PangoLayout>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_get_baseline";
end;

define inline-only C-function pango-layout-get-caret-pos
  input parameter self :: <PangoLayout>;
  input parameter index__ :: <C-signed-int>;
  input parameter strong_pos_ :: <PangoRectangle>;
  input parameter weak_pos_ :: <PangoRectangle>;
  c-name: "pango_layout_get_caret_pos";
end;

define inline-only C-function pango-layout-get-character-count
  input parameter self :: <PangoLayout>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_get_character_count";
end;

define inline-only C-function pango-layout-get-context
  input parameter self :: <PangoLayout>;
  result res :: <PangoContext>;
  c-name: "pango_layout_get_context";
end;

define inline-only C-function pango-layout-get-cursor-pos
  input parameter self :: <PangoLayout>;
  input parameter index__ :: <C-signed-int>;
  input parameter strong_pos_ :: <PangoRectangle>;
  input parameter weak_pos_ :: <PangoRectangle>;
  c-name: "pango_layout_get_cursor_pos";
end;

define inline-only C-function pango-layout-get-direction
  input parameter self :: <PangoLayout>;
  input parameter index_ :: <C-signed-int>;
  result res :: <PangoDirection>;
  c-name: "pango_layout_get_direction";
end;

define inline-only C-function pango-layout-get-ellipsize
  input parameter self :: <PangoLayout>;
  result res :: <PangoEllipsizeMode>;
  c-name: "pango_layout_get_ellipsize";
end;

define inline-only C-function pango-layout-get-extents
  input parameter self :: <PangoLayout>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_layout_get_extents";
end;

define inline-only C-function pango-layout-get-font-description
  input parameter self :: <PangoLayout>;
  result res :: <PangoFontDescription>;
  c-name: "pango_layout_get_font_description";
end;

define inline-only C-function pango-layout-get-height
  input parameter self :: <PangoLayout>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_get_height";
end;

define inline-only C-function pango-layout-get-indent
  input parameter self :: <PangoLayout>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_get_indent";
end;

define inline-only C-function pango-layout-get-iter
  input parameter self :: <PangoLayout>;
  result res :: <PangoLayoutIter>;
  c-name: "pango_layout_get_iter";
end;

define inline-only C-function pango-layout-get-justify
  input parameter self :: <PangoLayout>;
  result res :: <C-boolean>;
  c-name: "pango_layout_get_justify";
end;

define inline-only C-function pango-layout-get-justify-last-line
  input parameter self :: <PangoLayout>;
  result res :: <C-boolean>;
  c-name: "pango_layout_get_justify_last_line";
end;

define inline-only C-function pango-layout-get-line
  input parameter self :: <PangoLayout>;
  input parameter line_ :: <C-signed-int>;
  result res :: <PangoLayoutLine>;
  c-name: "pango_layout_get_line";
end;

define inline-only C-function pango-layout-get-line-count
  input parameter self :: <PangoLayout>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_get_line_count";
end;

define inline-only C-function pango-layout-get-line-readonly
  input parameter self :: <PangoLayout>;
  input parameter line_ :: <C-signed-int>;
  result res :: <PangoLayoutLine>;
  c-name: "pango_layout_get_line_readonly";
end;

define inline-only C-function pango-layout-get-line-spacing
  input parameter self :: <PangoLayout>;
  result res :: <C-float>;
  c-name: "pango_layout_get_line_spacing";
end;

define inline-only C-function pango-layout-get-lines
  input parameter self :: <PangoLayout>;
  result res :: <GSList>;
  c-name: "pango_layout_get_lines";
end;

define inline-only C-function pango-layout-get-lines-readonly
  input parameter self :: <PangoLayout>;
  result res :: <GSList>;
  c-name: "pango_layout_get_lines_readonly";
end;

define inline-only C-function pango-layout-get-log-attrs
  input parameter self :: <PangoLayout>;
  output parameter attrs_ :: <C-unsigned-char*> /* Not supported */;
  output parameter n_attrs_ :: <C-signed-int*>;
  c-name: "pango_layout_get_log_attrs";
end;

define inline-only C-function pango-layout-get-log-attrs-readonly
  input parameter self :: <PangoLayout>;
  output parameter n_attrs_ :: <C-signed-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "pango_layout_get_log_attrs_readonly";
end;

define inline-only C-function pango-layout-get-pixel-extents
  input parameter self :: <PangoLayout>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_layout_get_pixel_extents";
end;

define inline-only C-function pango-layout-get-pixel-size
  input parameter self :: <PangoLayout>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "pango_layout_get_pixel_size";
end;

define inline-only C-function pango-layout-get-serial
  input parameter self :: <PangoLayout>;
  result res :: <C-unsigned-int>;
  c-name: "pango_layout_get_serial";
end;

define inline-only C-function pango-layout-get-single-paragraph-mode
  input parameter self :: <PangoLayout>;
  result res :: <C-boolean>;
  c-name: "pango_layout_get_single_paragraph_mode";
end;

define inline-only C-function pango-layout-get-size
  input parameter self :: <PangoLayout>;
  output parameter width_ :: <C-signed-int*>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "pango_layout_get_size";
end;

define inline-only C-function pango-layout-get-spacing
  input parameter self :: <PangoLayout>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_get_spacing";
end;

define inline-only C-function pango-layout-get-tabs
  input parameter self :: <PangoLayout>;
  result res :: <PangoTabArray>;
  c-name: "pango_layout_get_tabs";
end;

define inline-only C-function pango-layout-get-text
  input parameter self :: <PangoLayout>;
  result res :: <C-string>;
  c-name: "pango_layout_get_text";
end;

define inline-only C-function pango-layout-get-unknown-glyphs-count
  input parameter self :: <PangoLayout>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_get_unknown_glyphs_count";
end;

define inline-only C-function pango-layout-get-width
  input parameter self :: <PangoLayout>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_get_width";
end;

define inline-only C-function pango-layout-get-wrap
  input parameter self :: <PangoLayout>;
  result res :: <PangoWrapMode>;
  c-name: "pango_layout_get_wrap";
end;

define inline-only C-function pango-layout-index-to-line-x
  input parameter self :: <PangoLayout>;
  input parameter index__ :: <C-signed-int>;
  input parameter trailing_ :: <C-boolean>;
  output parameter line_ :: <C-signed-int*>;
  output parameter x_pos_ :: <C-signed-int*>;
  c-name: "pango_layout_index_to_line_x";
end;

define inline-only C-function pango-layout-index-to-pos
  input parameter self :: <PangoLayout>;
  input parameter index__ :: <C-signed-int>;
  input parameter pos_ :: <PangoRectangle>;
  c-name: "pango_layout_index_to_pos";
end;

define inline-only C-function pango-layout-is-ellipsized
  input parameter self :: <PangoLayout>;
  result res :: <C-boolean>;
  c-name: "pango_layout_is_ellipsized";
end;

define inline-only C-function pango-layout-is-wrapped
  input parameter self :: <PangoLayout>;
  result res :: <C-boolean>;
  c-name: "pango_layout_is_wrapped";
end;

define inline-only C-function pango-layout-move-cursor-visually
  input parameter self :: <PangoLayout>;
  input parameter strong_ :: <C-boolean>;
  input parameter old_index_ :: <C-signed-int>;
  input parameter old_trailing_ :: <C-signed-int>;
  input parameter direction_ :: <C-signed-int>;
  output parameter new_index_ :: <C-signed-int*>;
  output parameter new_trailing_ :: <C-signed-int*>;
  c-name: "pango_layout_move_cursor_visually";
end;

define inline-only C-function pango-layout-serialize
  input parameter self :: <PangoLayout>;
  input parameter flags_ :: <PangoLayoutSerializeFlags>;
  result res :: <GBytes>;
  c-name: "pango_layout_serialize";
end;

define inline-only C-function pango-layout-set-alignment
  input parameter self :: <PangoLayout>;
  input parameter alignment_ :: <PangoAlignment>;
  c-name: "pango_layout_set_alignment";
end;

define inline-only C-function pango-layout-set-attributes
  input parameter self :: <PangoLayout>;
  input parameter attrs_ :: <PangoAttrList>;
  c-name: "pango_layout_set_attributes";
end;

define inline-only C-function pango-layout-set-auto-dir
  input parameter self :: <PangoLayout>;
  input parameter auto_dir_ :: <C-boolean>;
  c-name: "pango_layout_set_auto_dir";
end;

define inline-only C-function pango-layout-set-ellipsize
  input parameter self :: <PangoLayout>;
  input parameter ellipsize_ :: <PangoEllipsizeMode>;
  c-name: "pango_layout_set_ellipsize";
end;

define inline-only C-function pango-layout-set-font-description
  input parameter self :: <PangoLayout>;
  input parameter desc_ :: <PangoFontDescription>;
  c-name: "pango_layout_set_font_description";
end;

define inline-only C-function pango-layout-set-height
  input parameter self :: <PangoLayout>;
  input parameter height_ :: <C-signed-int>;
  c-name: "pango_layout_set_height";
end;

define inline-only C-function pango-layout-set-indent
  input parameter self :: <PangoLayout>;
  input parameter indent_ :: <C-signed-int>;
  c-name: "pango_layout_set_indent";
end;

define inline-only C-function pango-layout-set-justify
  input parameter self :: <PangoLayout>;
  input parameter justify_ :: <C-boolean>;
  c-name: "pango_layout_set_justify";
end;

define inline-only C-function pango-layout-set-justify-last-line
  input parameter self :: <PangoLayout>;
  input parameter justify_ :: <C-boolean>;
  c-name: "pango_layout_set_justify_last_line";
end;

define inline-only C-function pango-layout-set-line-spacing
  input parameter self :: <PangoLayout>;
  input parameter factor_ :: <C-float>;
  c-name: "pango_layout_set_line_spacing";
end;

define inline-only C-function pango-layout-set-markup
  input parameter self :: <PangoLayout>;
  input parameter markup_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  c-name: "pango_layout_set_markup";
end;

define inline-only C-function pango-layout-set-markup-with-accel
  input parameter self :: <PangoLayout>;
  input parameter markup_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter accel_marker_ :: <C-unsigned-int>;
  output parameter accel_char_ :: <C-unsigned-int*>;
  c-name: "pango_layout_set_markup_with_accel";
end;

define inline-only C-function pango-layout-set-single-paragraph-mode
  input parameter self :: <PangoLayout>;
  input parameter setting_ :: <C-boolean>;
  c-name: "pango_layout_set_single_paragraph_mode";
end;

define inline-only C-function pango-layout-set-spacing
  input parameter self :: <PangoLayout>;
  input parameter spacing_ :: <C-signed-int>;
  c-name: "pango_layout_set_spacing";
end;

define inline-only C-function pango-layout-set-tabs
  input parameter self :: <PangoLayout>;
  input parameter tabs_ :: <PangoTabArray>;
  c-name: "pango_layout_set_tabs";
end;

define inline-only C-function pango-layout-set-text
  input parameter self :: <PangoLayout>;
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  c-name: "pango_layout_set_text";
end;

define inline-only C-function pango-layout-set-width
  input parameter self :: <PangoLayout>;
  input parameter width_ :: <C-signed-int>;
  c-name: "pango_layout_set_width";
end;

define inline-only C-function pango-layout-set-wrap
  input parameter self :: <PangoLayout>;
  input parameter wrap_ :: <PangoWrapMode>;
  c-name: "pango_layout_set_wrap";
end;

define inline-only C-function pango-layout-write-to-file
  input parameter self :: <PangoLayout>;
  input parameter flags_ :: <PangoLayoutSerializeFlags>;
  input parameter filename_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "pango_layout_write_to_file";
end;

define inline-only C-function pango-layout-xy-to-index
  input parameter self :: <PangoLayout>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  output parameter index__ :: <C-signed-int*>;
  output parameter trailing_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "pango_layout_xy_to_index";
end;

define C-struct <_PangoLayoutClass>
  pointer-type-name: <PangoLayoutClass>;
end C-struct;

define sealed domain make (singleton(<PangoLayoutClass>));
define sealed domain initialize (<PangoLayoutClass>);

define inline-only constant $pango-layout-deserialize-invalid = 0;
define inline-only constant $pango-layout-deserialize-invalid-value = 1;
define inline-only constant $pango-layout-deserialize-missing-value = 2;
define constant <PangoLayoutDeserializeError> = <C-int>;
define C-pointer-type <PangoLayoutDeserializeError*> => <PangoLayoutDeserializeError>;

define inline-only constant $pango-layout-deserialize-default = 0;
define inline-only constant $pango-layout-deserialize-context = 1;
define constant <PangoLayoutDeserializeFlags> = <C-int>;
define C-pointer-type <PangoLayoutDeserializeFlags*> => <PangoLayoutDeserializeFlags>;

define C-struct <_PangoLayoutIter>
  pointer-type-name: <PangoLayoutIter>;
end C-struct;

define sealed domain make (singleton(<PangoLayoutIter>));
define sealed domain initialize (<PangoLayoutIter>);

define inline-only C-function pango-layout-iter-at-last-line
  input parameter self :: <PangoLayoutIter>;
  result res :: <C-boolean>;
  c-name: "pango_layout_iter_at_last_line";
end;

define inline-only C-function pango-layout-iter-copy
  input parameter self :: <PangoLayoutIter>;
  result res :: <PangoLayoutIter>;
  c-name: "pango_layout_iter_copy";
end;

define inline-only C-function pango-layout-iter-free
  input parameter self :: <PangoLayoutIter>;
  c-name: "pango_layout_iter_free";
end;

define inline-only C-function pango-layout-iter-get-baseline
  input parameter self :: <PangoLayoutIter>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_iter_get_baseline";
end;

define inline-only C-function pango-layout-iter-get-char-extents
  input parameter self :: <PangoLayoutIter>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_layout_iter_get_char_extents";
end;

define inline-only C-function pango-layout-iter-get-cluster-extents
  input parameter self :: <PangoLayoutIter>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_layout_iter_get_cluster_extents";
end;

define inline-only C-function pango-layout-iter-get-index
  input parameter self :: <PangoLayoutIter>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_iter_get_index";
end;

define inline-only C-function pango-layout-iter-get-layout
  input parameter self :: <PangoLayoutIter>;
  result res :: <PangoLayout>;
  c-name: "pango_layout_iter_get_layout";
end;

define inline-only C-function pango-layout-iter-get-layout-extents
  input parameter self :: <PangoLayoutIter>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_layout_iter_get_layout_extents";
end;

define inline-only C-function pango-layout-iter-get-line
  input parameter self :: <PangoLayoutIter>;
  result res :: <PangoLayoutLine>;
  c-name: "pango_layout_iter_get_line";
end;

define inline-only C-function pango-layout-iter-get-line-extents
  input parameter self :: <PangoLayoutIter>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_layout_iter_get_line_extents";
end;

define inline-only C-function pango-layout-iter-get-line-readonly
  input parameter self :: <PangoLayoutIter>;
  result res :: <PangoLayoutLine>;
  c-name: "pango_layout_iter_get_line_readonly";
end;

define inline-only C-function pango-layout-iter-get-line-yrange
  input parameter self :: <PangoLayoutIter>;
  output parameter y0__ :: <C-signed-int*>;
  output parameter y1__ :: <C-signed-int*>;
  c-name: "pango_layout_iter_get_line_yrange";
end;

define inline-only C-function pango-layout-iter-get-run
  input parameter self :: <PangoLayoutIter>;
  result res :: <PangoGlyphItem>;
  c-name: "pango_layout_iter_get_run";
end;

define inline-only C-function pango-layout-iter-get-run-baseline
  input parameter self :: <PangoLayoutIter>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_iter_get_run_baseline";
end;

define inline-only C-function pango-layout-iter-get-run-extents
  input parameter self :: <PangoLayoutIter>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_layout_iter_get_run_extents";
end;

define inline-only C-function pango-layout-iter-get-run-readonly
  input parameter self :: <PangoLayoutIter>;
  result res :: <PangoGlyphItem>;
  c-name: "pango_layout_iter_get_run_readonly";
end;

define inline-only C-function pango-layout-iter-next-char
  input parameter self :: <PangoLayoutIter>;
  result res :: <C-boolean>;
  c-name: "pango_layout_iter_next_char";
end;

define inline-only C-function pango-layout-iter-next-cluster
  input parameter self :: <PangoLayoutIter>;
  result res :: <C-boolean>;
  c-name: "pango_layout_iter_next_cluster";
end;

define inline-only C-function pango-layout-iter-next-line
  input parameter self :: <PangoLayoutIter>;
  result res :: <C-boolean>;
  c-name: "pango_layout_iter_next_line";
end;

define inline-only C-function pango-layout-iter-next-run
  input parameter self :: <PangoLayoutIter>;
  result res :: <C-boolean>;
  c-name: "pango_layout_iter_next_run";
end;

define C-struct <_PangoLayoutLine>
  sealed inline-only slot pango-layout-line-layout :: <PangoLayout>;
  sealed inline-only slot pango-layout-line-start-index :: <C-signed-int>;
  sealed inline-only slot pango-layout-line-length :: <C-signed-int>;
  sealed inline-only slot pango-layout-line-runs :: <GSList>;
  sealed inline-only slot pango-layout-line-is-paragraph-start :: <C-unsigned-int>;
  sealed inline-only slot pango-layout-line-resolved-dir :: <C-unsigned-int>;
  pointer-type-name: <PangoLayoutLine>;
end C-struct;

define sealed domain make (singleton(<PangoLayoutLine>));
define sealed domain initialize (<PangoLayoutLine>);

define inline-only C-function pango-layout-line-get-extents
  input parameter self :: <PangoLayoutLine>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_layout_line_get_extents";
end;

define inline-only C-function pango-layout-line-get-height
  input parameter self :: <PangoLayoutLine>;
  output parameter height_ :: <C-signed-int*>;
  c-name: "pango_layout_line_get_height";
end;

define inline-only C-function pango-layout-line-get-length
  input parameter self :: <PangoLayoutLine>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_line_get_length";
end;

define inline-only C-function pango-layout-line-get-pixel-extents
  input parameter self :: <PangoLayoutLine>;
  input parameter ink_rect_ :: <PangoRectangle>;
  input parameter logical_rect_ :: <PangoRectangle>;
  c-name: "pango_layout_line_get_pixel_extents";
end;

define inline-only C-function pango-layout-line-get-resolved-direction
  input parameter self :: <PangoLayoutLine>;
  result res :: <PangoDirection>;
  c-name: "pango_layout_line_get_resolved_direction";
end;

define inline-only C-function pango-layout-line-get-start-index
  input parameter self :: <PangoLayoutLine>;
  result res :: <C-signed-int>;
  c-name: "pango_layout_line_get_start_index";
end;

define inline-only C-function pango-layout-line-get-x-ranges
  input parameter self :: <PangoLayoutLine>;
  input parameter start_index_ :: <C-signed-int>;
  input parameter end_index_ :: <C-signed-int>;
  output parameter ranges_ :: <C-signed-int*>;
  output parameter n_ranges_ :: <C-signed-int*>;
  c-name: "pango_layout_line_get_x_ranges";
end;

define inline-only C-function pango-layout-line-index-to-x
  input parameter self :: <PangoLayoutLine>;
  input parameter index__ :: <C-signed-int>;
  input parameter trailing_ :: <C-boolean>;
  output parameter x_pos_ :: <C-signed-int*>;
  c-name: "pango_layout_line_index_to_x";
end;

define inline-only C-function pango-layout-line-ref
  input parameter self :: <PangoLayoutLine>;
  result res :: <PangoLayoutLine>;
  c-name: "pango_layout_line_ref";
end;

define inline-only C-function pango-layout-line-unref
  input parameter self :: <PangoLayoutLine>;
  c-name: "pango_layout_line_unref";
end;

define inline-only C-function pango-layout-line-x-to-index
  input parameter self :: <PangoLayoutLine>;
  input parameter x_pos_ :: <C-signed-int>;
  output parameter index__ :: <C-signed-int*>;
  output parameter trailing_ :: <C-signed-int*>;
  result res :: <C-boolean>;
  c-name: "pango_layout_line_x_to_index";
end;

define inline-only constant $pango-layout-serialize-default = 0;
define inline-only constant $pango-layout-serialize-context = 1;
define inline-only constant $pango-layout-serialize-output = 2;
define constant <PangoLayoutSerializeFlags> = <C-int>;
define C-pointer-type <PangoLayoutSerializeFlags*> => <PangoLayoutSerializeFlags>;

define C-struct <_PangoLogAttr>
  sealed inline-only slot pango-log-attr-is-line-break :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-mandatory-break :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-char-break :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-white :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-cursor-position :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-word-start :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-word-end :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-sentence-boundary :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-sentence-start :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-sentence-end :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-backspace-deletes-character :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-expandable-space :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-is-word-boundary :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-break-inserts-hyphen :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-break-removes-preceding :: <C-unsigned-int>;
  sealed inline-only slot pango-log-attr-reserved :: <C-unsigned-int>;
  pointer-type-name: <PangoLogAttr>;
end C-struct;

define sealed domain make (singleton(<PangoLogAttr>));
define sealed domain initialize (<PangoLogAttr>);

define C-struct <_PangoMatrix>
  sealed inline-only slot pango-matrix-xx :: <C-double>;
  sealed inline-only slot pango-matrix-xy :: <C-double>;
  sealed inline-only slot pango-matrix-yx :: <C-double>;
  sealed inline-only slot pango-matrix-yy :: <C-double>;
  sealed inline-only slot pango-matrix-x0 :: <C-double>;
  sealed inline-only slot pango-matrix-y0 :: <C-double>;
  pointer-type-name: <PangoMatrix>;
end C-struct;

define sealed domain make (singleton(<PangoMatrix>));
define sealed domain initialize (<PangoMatrix>);

define inline-only C-function pango-matrix-concat
  input parameter self :: <PangoMatrix>;
  input parameter new_matrix_ :: <PangoMatrix>;
  c-name: "pango_matrix_concat";
end;

define inline-only C-function pango-matrix-copy
  input parameter self :: <PangoMatrix>;
  result res :: <PangoMatrix>;
  c-name: "pango_matrix_copy";
end;

define inline-only C-function pango-matrix-free
  input parameter self :: <PangoMatrix>;
  c-name: "pango_matrix_free";
end;

define inline-only C-function pango-matrix-get-font-scale-factor
  input parameter self :: <PangoMatrix>;
  result res :: <C-double>;
  c-name: "pango_matrix_get_font_scale_factor";
end;

define inline-only C-function pango-matrix-get-font-scale-factors
  input parameter self :: <PangoMatrix>;
  output parameter xscale_ :: <C-double*>;
  output parameter yscale_ :: <C-double*>;
  c-name: "pango_matrix_get_font_scale_factors";
end;

define inline-only C-function pango-matrix-get-slant-ratio
  input parameter self :: <PangoMatrix>;
  result res :: <C-double>;
  c-name: "pango_matrix_get_slant_ratio";
end;

define inline-only C-function pango-matrix-rotate
  input parameter self :: <PangoMatrix>;
  input parameter degrees_ :: <C-double>;
  c-name: "pango_matrix_rotate";
end;

define inline-only C-function pango-matrix-scale
  input parameter self :: <PangoMatrix>;
  input parameter scale_x_ :: <C-double>;
  input parameter scale_y_ :: <C-double>;
  c-name: "pango_matrix_scale";
end;

define inline-only C-function pango-matrix-transform-distance
  input parameter self :: <PangoMatrix>;
  input output parameter dx_ :: <C-double*>;
  input output parameter dy_ :: <C-double*>;
  c-name: "pango_matrix_transform_distance";
end;

define inline-only C-function pango-matrix-transform-pixel-rectangle
  input parameter self :: <PangoMatrix>;
  input parameter rect_ :: <PangoRectangle>;
  c-name: "pango_matrix_transform_pixel_rectangle";
end;

define inline-only C-function pango-matrix-transform-point
  input parameter self :: <PangoMatrix>;
  input output parameter x_ :: <C-double*>;
  input output parameter y_ :: <C-double*>;
  c-name: "pango_matrix_transform_point";
end;

define inline-only C-function pango-matrix-transform-rectangle
  input parameter self :: <PangoMatrix>;
  input parameter rect_ :: <PangoRectangle>;
  c-name: "pango_matrix_transform_rectangle";
end;

define inline-only C-function pango-matrix-translate
  input parameter self :: <PangoMatrix>;
  input parameter tx_ :: <C-double>;
  input parameter ty_ :: <C-double>;
  c-name: "pango_matrix_translate";
end;

define inline-only constant $pango-overline-none = 0;
define inline-only constant $pango-overline-single = 1;
define constant <PangoOverline> = <C-int>;
define C-pointer-type <PangoOverline*> => <PangoOverline>;

define C-struct <_PangoRectangle>
  sealed inline-only slot pango-rectangle-x :: <C-signed-int>;
  sealed inline-only slot pango-rectangle-y :: <C-signed-int>;
  sealed inline-only slot pango-rectangle-width :: <C-signed-int>;
  sealed inline-only slot pango-rectangle-height :: <C-signed-int>;
  pointer-type-name: <PangoRectangle>;
end C-struct;

define sealed domain make (singleton(<PangoRectangle>));
define sealed domain initialize (<PangoRectangle>);

define inline-only constant $pango-render-part-foreground = 0;
define inline-only constant $pango-render-part-background = 1;
define inline-only constant $pango-render-part-underline = 2;
define inline-only constant $pango-render-part-strikethrough = 3;
define inline-only constant $pango-render-part-overline = 4;
define constant <PangoRenderPart> = <C-int>;
define C-pointer-type <PangoRenderPart*> => <PangoRenderPart>;

define open C-subtype <PangoRenderer> (<GObject>)
  // parent_instance
  // underline
  // strikethrough
  // active_count
  // matrix
  // priv
end C-subtype;

define C-pointer-type <PangoRenderer*> => <PangoRenderer>;

define sealed domain make (singleton(<PangoRenderer*>));
define sealed domain initialize (<PangoRenderer*>);

define inline-only C-function pango-renderer-activate
  input parameter self :: <PangoRenderer>;
  c-name: "pango_renderer_activate";
end;

define inline-only C-function pango-renderer-deactivate
  input parameter self :: <PangoRenderer>;
  c-name: "pango_renderer_deactivate";
end;

define inline-only C-function pango-renderer-draw-error-underline
  input parameter self :: <PangoRenderer>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "pango_renderer_draw_error_underline";
end;

define inline-only C-function pango-renderer-draw-glyph
  input parameter self :: <PangoRenderer>;
  input parameter font_ :: <PangoFont>;
  input parameter glyph_ :: <C-unsigned-int>;
  input parameter x_ :: <C-double>;
  input parameter y_ :: <C-double>;
  c-name: "pango_renderer_draw_glyph";
end;

define inline-only C-function pango-renderer-draw-glyph-item
  input parameter self :: <PangoRenderer>;
  input parameter text_ :: <C-string>;
  input parameter glyph_item_ :: <PangoGlyphItem>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  c-name: "pango_renderer_draw_glyph_item";
end;

define inline-only C-function pango-renderer-draw-glyphs
  input parameter self :: <PangoRenderer>;
  input parameter font_ :: <PangoFont>;
  input parameter glyphs_ :: <PangoGlyphString>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  c-name: "pango_renderer_draw_glyphs";
end;

define inline-only C-function pango-renderer-draw-layout
  input parameter self :: <PangoRenderer>;
  input parameter layout_ :: <PangoLayout>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  c-name: "pango_renderer_draw_layout";
end;

define inline-only C-function pango-renderer-draw-layout-line
  input parameter self :: <PangoRenderer>;
  input parameter line_ :: <PangoLayoutLine>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  c-name: "pango_renderer_draw_layout_line";
end;

define inline-only C-function pango-renderer-draw-rectangle
  input parameter self :: <PangoRenderer>;
  input parameter part_ :: <PangoRenderPart>;
  input parameter x_ :: <C-signed-int>;
  input parameter y_ :: <C-signed-int>;
  input parameter width_ :: <C-signed-int>;
  input parameter height_ :: <C-signed-int>;
  c-name: "pango_renderer_draw_rectangle";
end;

define inline-only C-function pango-renderer-draw-trapezoid
  input parameter self :: <PangoRenderer>;
  input parameter part_ :: <PangoRenderPart>;
  input parameter y1__ :: <C-double>;
  input parameter x11_ :: <C-double>;
  input parameter x21_ :: <C-double>;
  input parameter y2_ :: <C-double>;
  input parameter x12_ :: <C-double>;
  input parameter x22_ :: <C-double>;
  c-name: "pango_renderer_draw_trapezoid";
end;

define inline-only C-function pango-renderer-get-alpha
  input parameter self :: <PangoRenderer>;
  input parameter part_ :: <PangoRenderPart>;
  result res :: <C-unsigned-short>;
  c-name: "pango_renderer_get_alpha";
end;

define inline-only C-function pango-renderer-get-color
  input parameter self :: <PangoRenderer>;
  input parameter part_ :: <PangoRenderPart>;
  result res :: <PangoColor>;
  c-name: "pango_renderer_get_color";
end;

define inline-only C-function pango-renderer-get-layout
  input parameter self :: <PangoRenderer>;
  result res :: <PangoLayout>;
  c-name: "pango_renderer_get_layout";
end;

define inline-only C-function pango-renderer-get-layout-line
  input parameter self :: <PangoRenderer>;
  result res :: <PangoLayoutLine>;
  c-name: "pango_renderer_get_layout_line";
end;

define inline-only C-function pango-renderer-get-matrix
  input parameter self :: <PangoRenderer>;
  result res :: <PangoMatrix>;
  c-name: "pango_renderer_get_matrix";
end;

define inline-only C-function pango-renderer-part-changed
  input parameter self :: <PangoRenderer>;
  input parameter part_ :: <PangoRenderPart>;
  c-name: "pango_renderer_part_changed";
end;

define inline-only C-function pango-renderer-set-alpha
  input parameter self :: <PangoRenderer>;
  input parameter part_ :: <PangoRenderPart>;
  input parameter alpha_ :: <C-unsigned-short>;
  c-name: "pango_renderer_set_alpha";
end;

define inline-only C-function pango-renderer-set-color
  input parameter self :: <PangoRenderer>;
  input parameter part_ :: <PangoRenderPart>;
  input parameter color_ :: <PangoColor>;
  c-name: "pango_renderer_set_color";
end;

define inline-only C-function pango-renderer-set-matrix
  input parameter self :: <PangoRenderer>;
  input parameter matrix_ :: <PangoMatrix>;
  c-name: "pango_renderer_set_matrix";
end;

define C-struct <_PangoRendererClass>
  constant sealed inline-only slot pango-renderer-class-parent-class :: <GObjectClass>;
  constant sealed inline-only slot pango-renderer-class-draw-glyphs :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-draw-rectangle :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-draw-error-underline :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-draw-shape :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-draw-trapezoid :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-draw-glyph :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-part-changed :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-begin :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-end :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-prepare-run :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-draw-glyph-item :: <C-function-pointer>;
  constant sealed inline-only slot pango-renderer-class-_pango-reserved2 :: <C-void*>;
  constant sealed inline-only slot pango-renderer-class-_pango-reserved3 :: <C-void*>;
  constant sealed inline-only slot pango-renderer-class-_pango-reserved4 :: <C-void*>;
  pointer-type-name: <PangoRendererClass>;
end C-struct;

define sealed domain make (singleton(<PangoRendererClass>));
define sealed domain initialize (<PangoRendererClass>);

define C-struct <_PangoRendererPrivate>
  pointer-type-name: <PangoRendererPrivate>;
end C-struct;

define sealed domain make (singleton(<PangoRendererPrivate>));
define sealed domain initialize (<PangoRendererPrivate>);

define inline-only constant $scale = 1024;

define inline-only constant $pango-script-invalid-code = -1;
define inline-only constant $pango-script-common = 0;
define inline-only constant $pango-script-inherited = 1;
define inline-only constant $pango-script-arabic = 2;
define inline-only constant $pango-script-armenian = 3;
define inline-only constant $pango-script-bengali = 4;
define inline-only constant $pango-script-bopomofo = 5;
define inline-only constant $pango-script-cherokee = 6;
define inline-only constant $pango-script-coptic = 7;
define inline-only constant $pango-script-cyrillic = 8;
define inline-only constant $pango-script-deseret = 9;
define inline-only constant $pango-script-devanagari = 10;
define inline-only constant $pango-script-ethiopic = 11;
define inline-only constant $pango-script-georgian = 12;
define inline-only constant $pango-script-gothic = 13;
define inline-only constant $pango-script-greek = 14;
define inline-only constant $pango-script-gujarati = 15;
define inline-only constant $pango-script-gurmukhi = 16;
define inline-only constant $pango-script-han = 17;
define inline-only constant $pango-script-hangul = 18;
define inline-only constant $pango-script-hebrew = 19;
define inline-only constant $pango-script-hiragana = 20;
define inline-only constant $pango-script-kannada = 21;
define inline-only constant $pango-script-katakana = 22;
define inline-only constant $pango-script-khmer = 23;
define inline-only constant $pango-script-lao = 24;
define inline-only constant $pango-script-latin = 25;
define inline-only constant $pango-script-malayalam = 26;
define inline-only constant $pango-script-mongolian = 27;
define inline-only constant $pango-script-myanmar = 28;
define inline-only constant $pango-script-ogham = 29;
define inline-only constant $pango-script-old-italic = 30;
define inline-only constant $pango-script-oriya = 31;
define inline-only constant $pango-script-runic = 32;
define inline-only constant $pango-script-sinhala = 33;
define inline-only constant $pango-script-syriac = 34;
define inline-only constant $pango-script-tamil = 35;
define inline-only constant $pango-script-telugu = 36;
define inline-only constant $pango-script-thaana = 37;
define inline-only constant $pango-script-thai = 38;
define inline-only constant $pango-script-tibetan = 39;
define inline-only constant $pango-script-canadian-aboriginal = 40;
define inline-only constant $pango-script-yi = 41;
define inline-only constant $pango-script-tagalog = 42;
define inline-only constant $pango-script-hanunoo = 43;
define inline-only constant $pango-script-buhid = 44;
define inline-only constant $pango-script-tagbanwa = 45;
define inline-only constant $pango-script-braille = 46;
define inline-only constant $pango-script-cypriot = 47;
define inline-only constant $pango-script-limbu = 48;
define inline-only constant $pango-script-osmanya = 49;
define inline-only constant $pango-script-shavian = 50;
define inline-only constant $pango-script-linear-b = 51;
define inline-only constant $pango-script-tai-le = 52;
define inline-only constant $pango-script-ugaritic = 53;
define inline-only constant $pango-script-new-tai-lue = 54;
define inline-only constant $pango-script-buginese = 55;
define inline-only constant $pango-script-glagolitic = 56;
define inline-only constant $pango-script-tifinagh = 57;
define inline-only constant $pango-script-syloti-nagri = 58;
define inline-only constant $pango-script-old-persian = 59;
define inline-only constant $pango-script-kharoshthi = 60;
define inline-only constant $pango-script-unknown = 61;
define inline-only constant $pango-script-balinese = 62;
define inline-only constant $pango-script-cuneiform = 63;
define inline-only constant $pango-script-phoenician = 64;
define inline-only constant $pango-script-phags-pa = 65;
define inline-only constant $pango-script-nko = 66;
define inline-only constant $pango-script-kayah-li = 67;
define inline-only constant $pango-script-lepcha = 68;
define inline-only constant $pango-script-rejang = 69;
define inline-only constant $pango-script-sundanese = 70;
define inline-only constant $pango-script-saurashtra = 71;
define inline-only constant $pango-script-cham = 72;
define inline-only constant $pango-script-ol-chiki = 73;
define inline-only constant $pango-script-vai = 74;
define inline-only constant $pango-script-carian = 75;
define inline-only constant $pango-script-lycian = 76;
define inline-only constant $pango-script-lydian = 77;
define inline-only constant $pango-script-batak = 78;
define inline-only constant $pango-script-brahmi = 79;
define inline-only constant $pango-script-mandaic = 80;
define inline-only constant $pango-script-chakma = 81;
define inline-only constant $pango-script-meroitic-cursive = 82;
define inline-only constant $pango-script-meroitic-hieroglyphs = 83;
define inline-only constant $pango-script-miao = 84;
define inline-only constant $pango-script-sharada = 85;
define inline-only constant $pango-script-sora-sompeng = 86;
define inline-only constant $pango-script-takri = 87;
define inline-only constant $pango-script-bassa-vah = 88;
define inline-only constant $pango-script-caucasian-albanian = 89;
define inline-only constant $pango-script-duployan = 90;
define inline-only constant $pango-script-elbasan = 91;
define inline-only constant $pango-script-grantha = 92;
define inline-only constant $pango-script-khojki = 93;
define inline-only constant $pango-script-khudawadi = 94;
define inline-only constant $pango-script-linear-a = 95;
define inline-only constant $pango-script-mahajani = 96;
define inline-only constant $pango-script-manichaean = 97;
define inline-only constant $pango-script-mende-kikakui = 98;
define inline-only constant $pango-script-modi = 99;
define inline-only constant $pango-script-mro = 100;
define inline-only constant $pango-script-nabataean = 101;
define inline-only constant $pango-script-old-north-arabian = 102;
define inline-only constant $pango-script-old-permic = 103;
define inline-only constant $pango-script-pahawh-hmong = 104;
define inline-only constant $pango-script-palmyrene = 105;
define inline-only constant $pango-script-pau-cin-hau = 106;
define inline-only constant $pango-script-psalter-pahlavi = 107;
define inline-only constant $pango-script-siddham = 108;
define inline-only constant $pango-script-tirhuta = 109;
define inline-only constant $pango-script-warang-citi = 110;
define inline-only constant $pango-script-ahom = 111;
define inline-only constant $pango-script-anatolian-hieroglyphs = 112;
define inline-only constant $pango-script-hatran = 113;
define inline-only constant $pango-script-multani = 114;
define inline-only constant $pango-script-old-hungarian = 115;
define inline-only constant $pango-script-signwriting = 116;
define constant <PangoScript> = <C-int>;
define C-pointer-type <PangoScript*> => <PangoScript>;

define C-struct <_PangoScriptIter>
  pointer-type-name: <PangoScriptIter>;
end C-struct;

define sealed domain make (singleton(<PangoScriptIter>));
define sealed domain initialize (<PangoScriptIter>);

define inline-only C-function pango-script-iter-new
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  result res :: <PangoScriptIter>;
  c-name: "pango_script_iter_new";
end;

define inline-only C-function pango-script-iter-free
  input parameter self :: <PangoScriptIter>;
  c-name: "pango_script_iter_free";
end;

define inline-only C-function pango-script-iter-get-range
  input parameter self :: <PangoScriptIter>;
  output parameter start_ :: <C-string>;
  output parameter end_ :: <C-string>;
  output parameter script_ :: <PangoScript*>;
  c-name: "pango_script_iter_get_range";
end;

define inline-only C-function pango-script-iter-next
  input parameter self :: <PangoScriptIter>;
  result res :: <C-boolean>;
  c-name: "pango_script_iter_next";
end;

define inline-only constant $pango-shape-none = 0;
define inline-only constant $pango-shape-round-positions = 1;
define constant <PangoShapeFlags> = <C-int>;
define C-pointer-type <PangoShapeFlags*> => <PangoShapeFlags>;

define inline-only constant $pango-show-none = 0;
define inline-only constant $pango-show-spaces = 1;
define inline-only constant $pango-show-line-breaks = 2;
define inline-only constant $pango-show-ignorables = 4;
define constant <PangoShowFlags> = <C-int>;
define C-pointer-type <PangoShowFlags*> => <PangoShowFlags>;

define inline-only constant $pango-stretch-ultra-condensed = 0;
define inline-only constant $pango-stretch-extra-condensed = 1;
define inline-only constant $pango-stretch-condensed = 2;
define inline-only constant $pango-stretch-semi-condensed = 3;
define inline-only constant $pango-stretch-normal = 4;
define inline-only constant $pango-stretch-semi-expanded = 5;
define inline-only constant $pango-stretch-expanded = 6;
define inline-only constant $pango-stretch-extra-expanded = 7;
define inline-only constant $pango-stretch-ultra-expanded = 8;
define constant <PangoStretch> = <C-int>;
define C-pointer-type <PangoStretch*> => <PangoStretch>;

define inline-only constant $pango-style-normal = 0;
define inline-only constant $pango-style-oblique = 1;
define inline-only constant $pango-style-italic = 2;
define constant <PangoStyle> = <C-int>;
define C-pointer-type <PangoStyle*> => <PangoStyle>;

define inline-only constant $pango-tab-left = 0;
define inline-only constant $pango-tab-right = 1;
define inline-only constant $pango-tab-center = 2;
define inline-only constant $pango-tab-decimal = 3;
define constant <PangoTabAlign> = <C-int>;
define C-pointer-type <PangoTabAlign*> => <PangoTabAlign>;

define C-struct <_PangoTabArray>
  pointer-type-name: <PangoTabArray>;
end C-struct;

define sealed domain make (singleton(<PangoTabArray>));
define sealed domain initialize (<PangoTabArray>);

define inline-only C-function pango-tab-array-new
  input parameter initial_size_ :: <C-signed-int>;
  input parameter positions_in_pixels_ :: <C-boolean>;
  result res :: <PangoTabArray>;
  c-name: "pango_tab_array_new";
end;

define inline-only C-function pango-tab-array-copy
  input parameter self :: <PangoTabArray>;
  result res :: <PangoTabArray>;
  c-name: "pango_tab_array_copy";
end;

define inline-only C-function pango-tab-array-free
  input parameter self :: <PangoTabArray>;
  c-name: "pango_tab_array_free";
end;

define inline-only C-function pango-tab-array-get-decimal-point
  input parameter self :: <PangoTabArray>;
  input parameter tab_index_ :: <C-signed-int>;
  result res :: <C-unsigned-int>;
  c-name: "pango_tab_array_get_decimal_point";
end;

define inline-only C-function pango-tab-array-get-positions-in-pixels
  input parameter self :: <PangoTabArray>;
  result res :: <C-boolean>;
  c-name: "pango_tab_array_get_positions_in_pixels";
end;

define inline-only C-function pango-tab-array-get-size
  input parameter self :: <PangoTabArray>;
  result res :: <C-signed-int>;
  c-name: "pango_tab_array_get_size";
end;

define inline-only C-function pango-tab-array-get-tab
  input parameter self :: <PangoTabArray>;
  input parameter tab_index_ :: <C-signed-int>;
  output parameter alignment_ :: <PangoTabAlign*>;
  output parameter location_ :: <C-signed-int*>;
  c-name: "pango_tab_array_get_tab";
end;

define inline-only C-function pango-tab-array-get-tabs
  input parameter self :: <PangoTabArray>;
  output parameter alignments_ :: <PangoTabAlign*>;
  output parameter locations_ :: <C-signed-int*>;
  c-name: "pango_tab_array_get_tabs";
end;

define inline-only C-function pango-tab-array-resize
  input parameter self :: <PangoTabArray>;
  input parameter new_size_ :: <C-signed-int>;
  c-name: "pango_tab_array_resize";
end;

define inline-only C-function pango-tab-array-set-decimal-point
  input parameter self :: <PangoTabArray>;
  input parameter tab_index_ :: <C-signed-int>;
  input parameter decimal_point_ :: <C-unsigned-int>;
  c-name: "pango_tab_array_set_decimal_point";
end;

define inline-only C-function pango-tab-array-set-positions-in-pixels
  input parameter self :: <PangoTabArray>;
  input parameter positions_in_pixels_ :: <C-boolean>;
  c-name: "pango_tab_array_set_positions_in_pixels";
end;

define inline-only C-function pango-tab-array-set-tab
  input parameter self :: <PangoTabArray>;
  input parameter tab_index_ :: <C-signed-int>;
  input parameter alignment_ :: <PangoTabAlign>;
  input parameter location_ :: <C-signed-int>;
  c-name: "pango_tab_array_set_tab";
end;

define inline-only C-function pango-tab-array-sort
  input parameter self :: <PangoTabArray>;
  c-name: "pango_tab_array_sort";
end;

define inline-only C-function pango-tab-array-to-string
  input parameter self :: <PangoTabArray>;
  result res :: <C-string>;
  c-name: "pango_tab_array_to_string";
end;

define inline-only C-function pango-tab-array-from-string
  input parameter text_ :: <C-string>;
  result res :: <PangoTabArray>;
  c-name: "pango_tab_array_from_string";
end;

define inline-only constant $pango-text-transform-none = 0;
define inline-only constant $pango-text-transform-lowercase = 1;
define inline-only constant $pango-text-transform-uppercase = 2;
define inline-only constant $pango-text-transform-capitalize = 3;
define constant <PangoTextTransform> = <C-int>;
define C-pointer-type <PangoTextTransform*> => <PangoTextTransform>;

define inline-only constant $pango-underline-none = 0;
define inline-only constant $pango-underline-single = 1;
define inline-only constant $pango-underline-double = 2;
define inline-only constant $pango-underline-low = 3;
define inline-only constant $pango-underline-error = 4;
define inline-only constant $pango-underline-single-line = 5;
define inline-only constant $pango-underline-double-line = 6;
define inline-only constant $pango-underline-error-line = 7;
define constant <PangoUnderline> = <C-int>;
define C-pointer-type <PangoUnderline*> => <PangoUnderline>;

define inline-only constant $version-major = 1;

define inline-only constant $version-micro = 12;

define inline-only constant $version-minor = 50;

define inline-only constant $version-string = "1.50.12";

define inline-only constant $pango-variant-normal = 0;
define inline-only constant $pango-variant-small-caps = 1;
define inline-only constant $pango-variant-all-small-caps = 2;
define inline-only constant $pango-variant-petite-caps = 3;
define inline-only constant $pango-variant-all-petite-caps = 4;
define inline-only constant $pango-variant-unicase = 5;
define inline-only constant $pango-variant-title-caps = 6;
define constant <PangoVariant> = <C-int>;
define C-pointer-type <PangoVariant*> => <PangoVariant>;

define inline-only constant $pango-weight-thin = 100;
define inline-only constant $pango-weight-ultralight = 200;
define inline-only constant $pango-weight-light = 300;
define inline-only constant $pango-weight-semilight = 350;
define inline-only constant $pango-weight-book = 380;
define inline-only constant $pango-weight-normal = 400;
define inline-only constant $pango-weight-medium = 500;
define inline-only constant $pango-weight-semibold = 600;
define inline-only constant $pango-weight-bold = 700;
define inline-only constant $pango-weight-ultrabold = 800;
define inline-only constant $pango-weight-heavy = 900;
define inline-only constant $pango-weight-ultraheavy = 1000;
define constant <PangoWeight> = <C-int>;
define C-pointer-type <PangoWeight*> => <PangoWeight>;

define inline-only constant $pango-wrap-word = 0;
define inline-only constant $pango-wrap-char = 1;
define inline-only constant $pango-wrap-word-char = 2;
define constant <PangoWrapMode> = <C-int>;
define C-pointer-type <PangoWrapMode*> => <PangoWrapMode>;

define inline-only C-function pango-attr-allow-breaks-new
  input parameter allow_breaks_ :: <C-boolean>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_allow_breaks_new";
end;

define inline-only C-function pango-attr-background-alpha-new
  input parameter alpha_ :: <C-unsigned-short>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_background_alpha_new";
end;

define inline-only C-function pango-attr-background-new
  input parameter red_ :: <C-unsigned-short>;
  input parameter green_ :: <C-unsigned-short>;
  input parameter blue_ :: <C-unsigned-short>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_background_new";
end;

define inline-only C-function pango-attr-baseline-shift-new
  input parameter shift_ :: <C-signed-int>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_baseline_shift_new";
end;

define inline-only C-function pango-attr-break
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter attr_list_ :: <PangoAttrList>;
  input parameter offset_ :: <C-signed-int>;
  input parameter attrs_ :: <C-unsigned-char*> /* Not supported */;
  input parameter attrs_len_ :: <C-signed-int>;
  c-name: "pango_attr_break";
end;

define inline-only C-function pango-attr-fallback-new
  input parameter enable_fallback_ :: <C-boolean>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_fallback_new";
end;

define inline-only C-function pango-attr-family-new
  input parameter family_ :: <C-string>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_family_new";
end;

define inline-only C-function pango-attr-font-scale-new
  input parameter scale_ :: <PangoFontScale>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_font_scale_new";
end;

define inline-only C-function pango-attr-foreground-alpha-new
  input parameter alpha_ :: <C-unsigned-short>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_foreground_alpha_new";
end;

define inline-only C-function pango-attr-foreground-new
  input parameter red_ :: <C-unsigned-short>;
  input parameter green_ :: <C-unsigned-short>;
  input parameter blue_ :: <C-unsigned-short>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_foreground_new";
end;

define inline-only C-function pango-attr-gravity-hint-new
  input parameter hint_ :: <PangoGravityHint>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_gravity_hint_new";
end;

define inline-only C-function pango-attr-gravity-new
  input parameter gravity_ :: <PangoGravity>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_gravity_new";
end;

define inline-only C-function pango-attr-insert-hyphens-new
  input parameter insert_hyphens_ :: <C-boolean>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_insert_hyphens_new";
end;

define inline-only C-function pango-attr-letter-spacing-new
  input parameter letter_spacing_ :: <C-signed-int>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_letter_spacing_new";
end;

define inline-only C-function pango-attr-line-height-new
  input parameter factor_ :: <C-double>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_line_height_new";
end;

define inline-only C-function pango-attr-line-height-new-absolute
  input parameter height_ :: <C-signed-int>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_line_height_new_absolute";
end;

define inline-only C-function pango-attr-overline-color-new
  input parameter red_ :: <C-unsigned-short>;
  input parameter green_ :: <C-unsigned-short>;
  input parameter blue_ :: <C-unsigned-short>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_overline_color_new";
end;

define inline-only C-function pango-attr-overline-new
  input parameter overline_ :: <PangoOverline>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_overline_new";
end;

define inline-only C-function pango-attr-rise-new
  input parameter rise_ :: <C-signed-int>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_rise_new";
end;

define inline-only C-function pango-attr-scale-new
  input parameter scale_factor_ :: <C-double>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_scale_new";
end;

define inline-only C-function pango-attr-sentence-new
  result res :: <PangoAttribute>;
  c-name: "pango_attr_sentence_new";
end;

define inline-only C-function pango-attr-show-new
  input parameter flags_ :: <PangoShowFlags>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_show_new";
end;

define inline-only C-function pango-attr-stretch-new
  input parameter stretch_ :: <PangoStretch>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_stretch_new";
end;

define inline-only C-function pango-attr-strikethrough-color-new
  input parameter red_ :: <C-unsigned-short>;
  input parameter green_ :: <C-unsigned-short>;
  input parameter blue_ :: <C-unsigned-short>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_strikethrough_color_new";
end;

define inline-only C-function pango-attr-strikethrough-new
  input parameter strikethrough_ :: <C-boolean>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_strikethrough_new";
end;

define inline-only C-function pango-attr-style-new
  input parameter style_ :: <PangoStyle>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_style_new";
end;

define inline-only C-function pango-attr-text-transform-new
  input parameter transform_ :: <PangoTextTransform>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_text_transform_new";
end;

define inline-only C-function pango-attr-type-get-name
  input parameter type_ :: <PangoAttrType>;
  result res :: <C-string>;
  c-name: "pango_attr_type_get_name";
end;

define inline-only C-function pango-attr-type-register
  input parameter name_ :: <C-string>;
  result res :: <PangoAttrType>;
  c-name: "pango_attr_type_register";
end;

define inline-only C-function pango-attr-underline-color-new
  input parameter red_ :: <C-unsigned-short>;
  input parameter green_ :: <C-unsigned-short>;
  input parameter blue_ :: <C-unsigned-short>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_underline_color_new";
end;

define inline-only C-function pango-attr-underline-new
  input parameter underline_ :: <PangoUnderline>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_underline_new";
end;

define inline-only C-function pango-attr-variant-new
  input parameter variant_ :: <PangoVariant>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_variant_new";
end;

define inline-only C-function pango-attr-weight-new
  input parameter weight_ :: <PangoWeight>;
  result res :: <PangoAttribute>;
  c-name: "pango_attr_weight_new";
end;

define inline-only C-function pango-attr-word-new
  result res :: <PangoAttribute>;
  c-name: "pango_attr_word_new";
end;

define inline-only C-function pango-bidi-type-for-unichar
  input parameter ch_ :: <C-unsigned-int>;
  result res :: <PangoBidiType>;
  c-name: "pango_bidi_type_for_unichar";
end;

define inline-only C-function pango-default-break
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter analysis_ :: <PangoAnalysis>;
  input parameter attrs_ :: <PangoLogAttr>;
  input parameter attrs_len_ :: <C-signed-int>;
  c-name: "pango_default_break";
end;

define inline-only C-function pango-extents-to-pixels
  input parameter inclusive_ :: <PangoRectangle>;
  input parameter nearest_ :: <PangoRectangle>;
  c-name: "pango_extents_to_pixels";
end;

define inline-only C-function pango-find-base-dir
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  result res :: <PangoDirection>;
  c-name: "pango_find_base_dir";
end;

define inline-only C-function pango-find-paragraph-boundary
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  output parameter paragraph_delimiter_index_ :: <C-signed-int*>;
  output parameter next_paragraph_start_ :: <C-signed-int*>;
  c-name: "pango_find_paragraph_boundary";
end;

define inline-only C-function pango-get-log-attrs
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter level_ :: <C-signed-int>;
  input parameter language_ :: <PangoLanguage>;
  input parameter attrs_ :: <C-unsigned-char*> /* Not supported */;
  input parameter attrs_len_ :: <C-signed-int>;
  c-name: "pango_get_log_attrs";
end;

define inline-only C-function pango-gravity-get-for-matrix
  input parameter matrix_ :: <PangoMatrix>;
  result res :: <PangoGravity>;
  c-name: "pango_gravity_get_for_matrix";
end;

define inline-only C-function pango-gravity-get-for-script
  input parameter script_ :: <PangoScript>;
  input parameter base_gravity_ :: <PangoGravity>;
  input parameter hint_ :: <PangoGravityHint>;
  result res :: <PangoGravity>;
  c-name: "pango_gravity_get_for_script";
end;

define inline-only C-function pango-gravity-get-for-script-and-width
  input parameter script_ :: <PangoScript>;
  input parameter wide_ :: <C-boolean>;
  input parameter base_gravity_ :: <PangoGravity>;
  input parameter hint_ :: <PangoGravityHint>;
  result res :: <PangoGravity>;
  c-name: "pango_gravity_get_for_script_and_width";
end;

define inline-only C-function pango-gravity-to-rotation
  input parameter gravity_ :: <PangoGravity>;
  result res :: <C-double>;
  c-name: "pango_gravity_to_rotation";
end;

define inline-only C-function pango-is-zero-width
  input parameter ch_ :: <C-unsigned-int>;
  result res :: <C-boolean>;
  c-name: "pango_is_zero_width";
end;

define inline-only C-function pango-itemize
  input parameter context_ :: <PangoContext>;
  input parameter text_ :: <C-string>;
  input parameter start_index_ :: <C-signed-int>;
  input parameter length_ :: <C-signed-int>;
  input parameter attrs_ :: <PangoAttrList>;
  input parameter cached_iter_ :: <PangoAttrIterator>;
  result res :: <GList>;
  c-name: "pango_itemize";
end;

define inline-only C-function pango-itemize-with-base-dir
  input parameter context_ :: <PangoContext>;
  input parameter base_dir_ :: <PangoDirection>;
  input parameter text_ :: <C-string>;
  input parameter start_index_ :: <C-signed-int>;
  input parameter length_ :: <C-signed-int>;
  input parameter attrs_ :: <PangoAttrList>;
  input parameter cached_iter_ :: <PangoAttrIterator>;
  result res :: <GList>;
  c-name: "pango_itemize_with_base_dir";
end;

define inline-only C-function pango-layout-deserialize-error-quark
  result res :: <C-unsigned-int>;
  c-name: "pango_layout_deserialize_error_quark";
end;

define inline-only C-function pango-log2vis-get-embedding-levels
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter pbase_dir_ :: <PangoDirection>;
  result res :: <C-unsigned-char*>;
  c-name: "pango_log2vis_get_embedding_levels";
end;

define inline-only C-function pango-markup-parser-finish
  input parameter context_ :: <GMarkupParseContext>;
  input parameter attr_list_ :: <PangoAttrList>;
  output parameter text_ :: <C-string>;
  output parameter accel_char_ :: <C-unsigned-int*>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "pango_markup_parser_finish";
end;

define inline-only C-function pango-markup-parser-new
  input parameter accel_marker_ :: <C-unsigned-int>;
  result res :: <GMarkupParseContext>;
  c-name: "pango_markup_parser_new";
end;

define inline-only C-function pango-parse-markup
  input parameter markup_text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter accel_marker_ :: <C-unsigned-int>;
  input parameter attr_list_ :: <PangoAttrList>;
  output parameter text_ :: <C-string>;
  output parameter accel_char_ :: <C-unsigned-int*>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "pango_parse_markup";
end;

define inline-only C-function pango-parse-stretch
  input parameter str_ :: <C-string>;
  output parameter stretch_ :: <PangoStretch*>;
  input parameter warn_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "pango_parse_stretch";
end;

define inline-only C-function pango-parse-style
  input parameter str_ :: <C-string>;
  output parameter style_ :: <PangoStyle*>;
  input parameter warn_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "pango_parse_style";
end;

define inline-only C-function pango-parse-variant
  input parameter str_ :: <C-string>;
  output parameter variant_ :: <PangoVariant*>;
  input parameter warn_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "pango_parse_variant";
end;

define inline-only C-function pango-parse-weight
  input parameter str_ :: <C-string>;
  output parameter weight_ :: <PangoWeight*>;
  input parameter warn_ :: <C-boolean>;
  result res :: <C-boolean>;
  c-name: "pango_parse_weight";
end;

define inline-only C-function pango-quantize-line-geometry
  input output parameter thickness_ :: <C-signed-int*>;
  input output parameter position_ :: <C-signed-int*>;
  c-name: "pango_quantize_line_geometry";
end;

define inline-only C-function pango-reorder-items
  input parameter items_ :: <GList>;
  result res :: <GList>;
  c-name: "pango_reorder_items";
end;

define inline-only C-function pango-script-get-sample-language
  input parameter script_ :: <PangoScript>;
  result res :: <PangoLanguage>;
  c-name: "pango_script_get_sample_language";
end;

define inline-only C-function pango-shape
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter analysis_ :: <PangoAnalysis>;
  input parameter glyphs_ :: <PangoGlyphString>;
  c-name: "pango_shape";
end;

define inline-only C-function pango-shape-full
  input parameter item_text_ :: <C-string>;
  input parameter item_length_ :: <C-signed-int>;
  input parameter paragraph_text_ :: <C-string>;
  input parameter paragraph_length_ :: <C-signed-int>;
  input parameter analysis_ :: <PangoAnalysis>;
  input parameter glyphs_ :: <PangoGlyphString>;
  c-name: "pango_shape_full";
end;

define inline-only C-function pango-shape-item
  input parameter item_ :: <PangoItem>;
  input parameter paragraph_text_ :: <C-string>;
  input parameter paragraph_length_ :: <C-signed-int>;
  input parameter log_attrs_ :: <PangoLogAttr>;
  input parameter glyphs_ :: <PangoGlyphString>;
  input parameter flags_ :: <PangoShapeFlags>;
  c-name: "pango_shape_item";
end;

define inline-only C-function pango-shape-with-flags
  input parameter item_text_ :: <C-string>;
  input parameter item_length_ :: <C-signed-int>;
  input parameter paragraph_text_ :: <C-string>;
  input parameter paragraph_length_ :: <C-signed-int>;
  input parameter analysis_ :: <PangoAnalysis>;
  input parameter glyphs_ :: <PangoGlyphString>;
  input parameter flags_ :: <PangoShapeFlags>;
  c-name: "pango_shape_with_flags";
end;

define inline-only C-function pango-tailor-break
  input parameter text_ :: <C-string>;
  input parameter length_ :: <C-signed-int>;
  input parameter analysis_ :: <PangoAnalysis>;
  input parameter offset_ :: <C-signed-int>;
  input parameter attrs_ :: <C-unsigned-char*> /* Not supported */;
  input parameter attrs_len_ :: <C-signed-int>;
  c-name: "pango_tailor_break";
end;

define inline-only C-function pango-unichar-direction
  input parameter ch_ :: <C-unsigned-int>;
  result res :: <PangoDirection>;
  c-name: "pango_unichar_direction";
end;

define inline-only C-function pango-units-from-double
  input parameter d_ :: <C-double>;
  result res :: <C-signed-int>;
  c-name: "pango_units_from_double";
end;

define inline-only C-function pango-units-to-double
  input parameter i_ :: <C-signed-int>;
  result res :: <C-double>;
  c-name: "pango_units_to_double";
end;

define inline-only C-function pango-version
  result res :: <C-signed-int>;
  c-name: "pango_version";
end;

define inline-only C-function pango-version-check
  input parameter required_major_ :: <C-signed-int>;
  input parameter required_minor_ :: <C-signed-int>;
  input parameter required_micro_ :: <C-signed-int>;
  result res :: <C-string>;
  c-name: "pango_version_check";
end;

define inline-only C-function pango-version-string
  result res :: <C-string>;
  c-name: "pango_version_string";
end;

