module: cairo
synopsis: generated bindings for the cairo library
copyright: See LICENSE file in this distribution.


define C-pointer-type <C-void**> => <C-void*>;
ignore(<C-void**>);

define C-struct <_cairoContext>
  pointer-type-name: <cairoContext>;
end C-struct;

define sealed domain make (singleton(<cairoContext>));
define sealed domain initialize (<cairoContext>);

define C-struct <_cairoDevice>
  pointer-type-name: <cairoDevice>;
end C-struct;

define sealed domain make (singleton(<cairoDevice>));
define sealed domain initialize (<cairoDevice>);

define C-struct <_cairoSurface>
  pointer-type-name: <cairoSurface>;
end C-struct;

define sealed domain make (singleton(<cairoSurface>));
define sealed domain initialize (<cairoSurface>);

define C-struct <_cairoMatrix>
  pointer-type-name: <cairoMatrix>;
end C-struct;

define sealed domain make (singleton(<cairoMatrix>));
define sealed domain initialize (<cairoMatrix>);

define C-struct <_cairoPattern>
  pointer-type-name: <cairoPattern>;
end C-struct;

define sealed domain make (singleton(<cairoPattern>));
define sealed domain initialize (<cairoPattern>);

define C-struct <_cairoRegion>
  pointer-type-name: <cairoRegion>;
end C-struct;

define sealed domain make (singleton(<cairoRegion>));
define sealed domain initialize (<cairoRegion>);

define inline-only constant $cairo-status-success = 0;
define inline-only constant $cairo-status-no-memory = 1;
define inline-only constant $cairo-status-invalid-restore = 2;
define inline-only constant $cairo-status-invalid-pop-group = 3;
define inline-only constant $cairo-status-no-current-point = 4;
define inline-only constant $cairo-status-invalid-matrix = 5;
define inline-only constant $cairo-status-invalid-status = 6;
define inline-only constant $cairo-status-null-pointer = 7;
define inline-only constant $cairo-status-invalid-string = 8;
define inline-only constant $cairo-status-invalid-path-data = 9;
define inline-only constant $cairo-status-read-error = 10;
define inline-only constant $cairo-status-write-error = 11;
define inline-only constant $cairo-status-surface-finished = 12;
define inline-only constant $cairo-status-surface-type-mismatch = 13;
define inline-only constant $cairo-status-pattern-type-mismatch = 14;
define inline-only constant $cairo-status-invalid-content = 15;
define inline-only constant $cairo-status-invalid-format = 16;
define inline-only constant $cairo-status-invalid-visual = 17;
define inline-only constant $cairo-status-file-not-found = 18;
define inline-only constant $cairo-status-invalid-dash = 19;
define inline-only constant $cairo-status-invalid-dsc-comment = 20;
define inline-only constant $cairo-status-invalid-index = 21;
define inline-only constant $cairo-status-clip-not-representable = 22;
define inline-only constant $cairo-status-temp-file-error = 23;
define inline-only constant $cairo-status-invalid-stride = 24;
define inline-only constant $cairo-status-font-type-mismatch = 25;
define inline-only constant $cairo-status-user-font-immutable = 26;
define inline-only constant $cairo-status-user-font-error = 27;
define inline-only constant $cairo-status-negative-count = 28;
define inline-only constant $cairo-status-invalid-clusters = 29;
define inline-only constant $cairo-status-invalid-slant = 30;
define inline-only constant $cairo-status-invalid-weight = 31;
define inline-only constant $cairo-status-invalid-size = 32;
define inline-only constant $cairo-status-user-font-not-implemented = 33;
define inline-only constant $cairo-status-device-type-mismatch = 34;
define inline-only constant $cairo-status-device-error = 35;
define inline-only constant $cairo-status-invalid-mesh-construction = 36;
define inline-only constant $cairo-status-device-finished = 37;
define inline-only constant $cairo-status-jbig2-global-missing = 38;
define constant <cairoStatus> = <C-int>;
define C-pointer-type <cairoStatus*> => <cairoStatus>;

define inline-only constant $cairo-content-color = 4096;
define inline-only constant $cairo-content-alpha = 8192;
define inline-only constant $cairo-content-color-alpha = 12288;
define constant <cairoContent> = <C-int>;
define C-pointer-type <cairoContent*> => <cairoContent>;

define inline-only constant $cairo-operator-clear = 0;
define inline-only constant $cairo-operator-source = 1;
define inline-only constant $cairo-operator-over = 2;
define inline-only constant $cairo-operator-in = 3;
define inline-only constant $cairo-operator-out = 4;
define inline-only constant $cairo-operator-atop = 5;
define inline-only constant $cairo-operator-dest = 6;
define inline-only constant $cairo-operator-dest-over = 7;
define inline-only constant $cairo-operator-dest-in = 8;
define inline-only constant $cairo-operator-dest-out = 9;
define inline-only constant $cairo-operator-dest-atop = 10;
define inline-only constant $cairo-operator-xor = 11;
define inline-only constant $cairo-operator-add = 12;
define inline-only constant $cairo-operator-saturate = 13;
define inline-only constant $cairo-operator-multiply = 14;
define inline-only constant $cairo-operator-screen = 15;
define inline-only constant $cairo-operator-overlay = 16;
define inline-only constant $cairo-operator-darken = 17;
define inline-only constant $cairo-operator-lighten = 18;
define inline-only constant $cairo-operator-color-dodge = 19;
define inline-only constant $cairo-operator-color-burn = 20;
define inline-only constant $cairo-operator-hard-light = 21;
define inline-only constant $cairo-operator-soft-light = 22;
define inline-only constant $cairo-operator-difference = 23;
define inline-only constant $cairo-operator-exclusion = 24;
define inline-only constant $cairo-operator-hsl-hue = 25;
define inline-only constant $cairo-operator-hsl-saturation = 26;
define inline-only constant $cairo-operator-hsl-color = 27;
define inline-only constant $cairo-operator-hsl-luminosity = 28;
define constant <cairoOperator> = <C-int>;
define C-pointer-type <cairoOperator*> => <cairoOperator>;

define inline-only constant $cairo-antialias-default = 0;
define inline-only constant $cairo-antialias-none = 1;
define inline-only constant $cairo-antialias-gray = 2;
define inline-only constant $cairo-antialias-subpixel = 3;
define inline-only constant $cairo-antialias-fast = 4;
define inline-only constant $cairo-antialias-good = 5;
define inline-only constant $cairo-antialias-best = 6;
define constant <cairoAntialias> = <C-int>;
define C-pointer-type <cairoAntialias*> => <cairoAntialias>;

define inline-only constant $cairo-fill-rule-winding = 0;
define inline-only constant $cairo-fill-rule-even-odd = 1;
define constant <cairoFillRule> = <C-int>;
define C-pointer-type <cairoFillRule*> => <cairoFillRule>;

define inline-only constant $cairo-line-cap-butt = 0;
define inline-only constant $cairo-line-cap-round = 1;
define inline-only constant $cairo-line-cap-square = 2;
define constant <cairoLineCap> = <C-int>;
define C-pointer-type <cairoLineCap*> => <cairoLineCap>;

define inline-only constant $cairo-line-join-miter = 0;
define inline-only constant $cairo-line-join-round = 1;
define inline-only constant $cairo-line-join-bevel = 2;
define constant <cairoLineJoin> = <C-int>;
define C-pointer-type <cairoLineJoin*> => <cairoLineJoin>;

define inline-only constant $cairo-text-cluster-flag-backward = 1;
define constant <cairoTextClusterFlags> = <C-int>;
define C-pointer-type <cairoTextClusterFlags*> => <cairoTextClusterFlags>;

define inline-only constant $cairo-font-slant-normal = 0;
define inline-only constant $cairo-font-slant-italic = 1;
define inline-only constant $cairo-font-slant-oblique = 2;
define constant <cairoFontSlant> = <C-int>;
define C-pointer-type <cairoFontSlant*> => <cairoFontSlant>;

define inline-only constant $cairo-font-weight-normal = 0;
define inline-only constant $cairo-font-weight-bold = 1;
define constant <cairoFontWeight> = <C-int>;
define C-pointer-type <cairoFontWeight*> => <cairoFontWeight>;

define inline-only constant $cairo-subpixel-order-default = 0;
define inline-only constant $cairo-subpixel-order-rgb = 1;
define inline-only constant $cairo-subpixel-order-bgr = 2;
define inline-only constant $cairo-subpixel-order-vrgb = 3;
define inline-only constant $cairo-subpixel-order-vbgr = 4;
define constant <cairoSubpixelOrder> = <C-int>;
define C-pointer-type <cairoSubpixelOrder*> => <cairoSubpixelOrder>;

define inline-only constant $cairo-hint-style-default = 0;
define inline-only constant $cairo-hint-style-none = 1;
define inline-only constant $cairo-hint-style-slight = 2;
define inline-only constant $cairo-hint-style-medium = 3;
define inline-only constant $cairo-hint-style-full = 4;
define constant <cairoHintStyle> = <C-int>;
define C-pointer-type <cairoHintStyle*> => <cairoHintStyle>;

define inline-only constant $cairo-hint-metrics-default = 0;
define inline-only constant $cairo-hint-metrics-off = 1;
define inline-only constant $cairo-hint-metrics-on = 2;
define constant <cairoHintMetrics> = <C-int>;
define C-pointer-type <cairoHintMetrics*> => <cairoHintMetrics>;

define C-struct <_cairoFontOptions>
  pointer-type-name: <cairoFontOptions>;
end C-struct;

define sealed domain make (singleton(<cairoFontOptions>));
define sealed domain initialize (<cairoFontOptions>);

define inline-only constant $cairo-font-type-toy = 0;
define inline-only constant $cairo-font-type-ft = 1;
define inline-only constant $cairo-font-type-win32 = 2;
define inline-only constant $cairo-font-type-quartz = 3;
define inline-only constant $cairo-font-type-user = 4;
define constant <cairoFontType> = <C-int>;
define C-pointer-type <cairoFontType*> => <cairoFontType>;

define inline-only constant $cairo-path-move-to = 0;
define inline-only constant $cairo-path-line-to = 1;
define inline-only constant $cairo-path-curve-to = 2;
define inline-only constant $cairo-path-close-path = 3;
define constant <cairoPathDataType> = <C-int>;
define C-pointer-type <cairoPathDataType*> => <cairoPathDataType>;

define inline-only constant $cairo-device-type-drm = 0;
define inline-only constant $cairo-device-type-gl = 1;
define inline-only constant $cairo-device-type-script = 2;
define inline-only constant $cairo-device-type-xcb = 3;
define inline-only constant $cairo-device-type-xlib = 4;
define inline-only constant $cairo-device-type-xml = 5;
define inline-only constant $cairo-device-type-cogl = 6;
define inline-only constant $cairo-device-type-win32 = 7;
define inline-only constant $cairo-device-type-invalid = -1;
define constant <cairoDeviceType> = <C-int>;
define C-pointer-type <cairoDeviceType*> => <cairoDeviceType>;

define inline-only constant $cairo-surface-type-image = 0;
define inline-only constant $cairo-surface-type-pdf = 1;
define inline-only constant $cairo-surface-type-ps = 2;
define inline-only constant $cairo-surface-type-xlib = 3;
define inline-only constant $cairo-surface-type-xcb = 4;
define inline-only constant $cairo-surface-type-glitz = 5;
define inline-only constant $cairo-surface-type-quartz = 6;
define inline-only constant $cairo-surface-type-win32 = 7;
define inline-only constant $cairo-surface-type-beos = 8;
define inline-only constant $cairo-surface-type-directfb = 9;
define inline-only constant $cairo-surface-type-svg = 10;
define inline-only constant $cairo-surface-type-os2 = 11;
define inline-only constant $cairo-surface-type-win32-printing = 12;
define inline-only constant $cairo-surface-type-quartz-image = 13;
define inline-only constant $cairo-surface-type-script = 14;
define inline-only constant $cairo-surface-type-qt = 15;
define inline-only constant $cairo-surface-type-recording = 16;
define inline-only constant $cairo-surface-type-vg = 17;
define inline-only constant $cairo-surface-type-gl = 18;
define inline-only constant $cairo-surface-type-drm = 19;
define inline-only constant $cairo-surface-type-tee = 20;
define inline-only constant $cairo-surface-type-xml = 21;
define inline-only constant $cairo-surface-type-skia = 22;
define inline-only constant $cairo-surface-type-subsurface = 23;
define inline-only constant $cairo-surface-type-cogl = 24;
define constant <cairoSurfaceType> = <C-int>;
define C-pointer-type <cairoSurfaceType*> => <cairoSurfaceType>;

define inline-only constant $cairo-format-invalid = -1;
define inline-only constant $cairo-format-argb32 = 0;
define inline-only constant $cairo-format-rgb24 = 1;
define inline-only constant $cairo-format-a8 = 2;
define inline-only constant $cairo-format-a1 = 3;
define inline-only constant $cairo-format-rgb16-565 = 4;
define inline-only constant $cairo-format-rgb30 = 5;
define constant <cairoFormat> = <C-int>;
define C-pointer-type <cairoFormat*> => <cairoFormat>;

define inline-only constant $cairo-pattern-type-solid = 0;
define inline-only constant $cairo-pattern-type-surface = 1;
define inline-only constant $cairo-pattern-type-linear = 2;
define inline-only constant $cairo-pattern-type-radial = 3;
define inline-only constant $cairo-pattern-type-mesh = 4;
define inline-only constant $cairo-pattern-type-raster-source = 5;
define constant <cairoPatternType> = <C-int>;
define C-pointer-type <cairoPatternType*> => <cairoPatternType>;

define inline-only constant $cairo-extend-none = 0;
define inline-only constant $cairo-extend-repeat = 1;
define inline-only constant $cairo-extend-reflect = 2;
define inline-only constant $cairo-extend-pad = 3;
define constant <cairoExtend> = <C-int>;
define C-pointer-type <cairoExtend*> => <cairoExtend>;

define inline-only constant $cairo-filter-fast = 0;
define inline-only constant $cairo-filter-good = 1;
define inline-only constant $cairo-filter-best = 2;
define inline-only constant $cairo-filter-nearest = 3;
define inline-only constant $cairo-filter-bilinear = 4;
define inline-only constant $cairo-filter-gaussian = 5;
define constant <cairoFilter> = <C-int>;
define C-pointer-type <cairoFilter*> => <cairoFilter>;

define inline-only constant $cairo-region-overlap-in = 0;
define inline-only constant $cairo-region-overlap-out = 1;
define inline-only constant $cairo-region-overlap-part = 2;
define constant <cairoRegionOverlap> = <C-int>;
define C-pointer-type <cairoRegionOverlap*> => <cairoRegionOverlap>;

define C-struct <_cairoFontFace>
  pointer-type-name: <cairoFontFace>;
end C-struct;

define sealed domain make (singleton(<cairoFontFace>));
define sealed domain initialize (<cairoFontFace>);

define C-struct <_cairoScaledFont>
  pointer-type-name: <cairoScaledFont>;
end C-struct;

define sealed domain make (singleton(<cairoScaledFont>));
define sealed domain initialize (<cairoScaledFont>);

define C-struct <_cairoPath>
  pointer-type-name: <cairoPath>;
end C-struct;

define sealed domain make (singleton(<cairoPath>));
define sealed domain initialize (<cairoPath>);

define C-struct <_cairoRectangle>
  sealed inline-only slot cairo-rectangle-x :: <C-double>;
  sealed inline-only slot cairo-rectangle-y :: <C-double>;
  sealed inline-only slot cairo-rectangle-width :: <C-double>;
  sealed inline-only slot cairo-rectangle-height :: <C-double>;
  pointer-type-name: <cairoRectangle>;
end C-struct;

define sealed domain make (singleton(<cairoRectangle>));
define sealed domain initialize (<cairoRectangle>);

define C-struct <_cairoRectangleInt>
  sealed inline-only slot cairo-rectangle-int-x :: <C-signed-int>;
  sealed inline-only slot cairo-rectangle-int-y :: <C-signed-int>;
  sealed inline-only slot cairo-rectangle-int-width :: <C-signed-int>;
  sealed inline-only slot cairo-rectangle-int-height :: <C-signed-int>;
  pointer-type-name: <cairoRectangleInt>;
end C-struct;

define sealed domain make (singleton(<cairoRectangleInt>));
define sealed domain initialize (<cairoRectangleInt>);

define inline-only C-function cairo-image-surface-create
  c-name: "cairo_image_surface_create";
end;

