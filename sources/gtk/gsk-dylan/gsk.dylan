module: gsk
synopsis: generated bindings for the Gsk library
copyright: See LICENSE file in this distribution.


define C-pointer-type <C-void**> => <C-void*>;
ignore(<C-void**>);

define C-pointer-type <GError*> => <GError>;
ignore(<GError*>);

define inline-only constant $gsk-blend-mode-default = 0;
define inline-only constant $gsk-blend-mode-multiply = 1;
define inline-only constant $gsk-blend-mode-screen = 2;
define inline-only constant $gsk-blend-mode-overlay = 3;
define inline-only constant $gsk-blend-mode-darken = 4;
define inline-only constant $gsk-blend-mode-lighten = 5;
define inline-only constant $gsk-blend-mode-color-dodge = 6;
define inline-only constant $gsk-blend-mode-color-burn = 7;
define inline-only constant $gsk-blend-mode-hard-light = 8;
define inline-only constant $gsk-blend-mode-soft-light = 9;
define inline-only constant $gsk-blend-mode-difference = 10;
define inline-only constant $gsk-blend-mode-exclusion = 11;
define inline-only constant $gsk-blend-mode-color = 12;
define inline-only constant $gsk-blend-mode-hue = 13;
define inline-only constant $gsk-blend-mode-saturation = 14;
define inline-only constant $gsk-blend-mode-luminosity = 15;
define constant <GskBlendMode> = <C-int>;
define C-pointer-type <GskBlendMode*> => <GskBlendMode>;

define open C-subtype <GskBlendNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskBlendNode*> => <GskBlendNode>;

define sealed domain make (singleton(<GskBlendNode*>));
define sealed domain initialize (<GskBlendNode*>);

define inline-only C-function gsk-blend-node-new
  input parameter bottom_ :: <GskRenderNode>;
  input parameter top_ :: <GskRenderNode>;
  input parameter blend_mode_ :: <GskBlendMode>;
  result res :: <GskBlendNode>;
  c-name: "gsk_blend_node_new";
end;

define inline-only C-function gsk-blend-node-get-blend-mode
  input parameter self :: <GskBlendNode>;
  result res :: <GskBlendMode>;
  c-name: "gsk_blend_node_get_blend_mode";
end;

define inline-only C-function gsk-blend-node-get-bottom-child
  input parameter self :: <GskBlendNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_blend_node_get_bottom_child";
end;

define inline-only C-function gsk-blend-node-get-top-child
  input parameter self :: <GskBlendNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_blend_node_get_top_child";
end;

define open C-subtype <GskBlurNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskBlurNode*> => <GskBlurNode>;

define sealed domain make (singleton(<GskBlurNode*>));
define sealed domain initialize (<GskBlurNode*>);

define inline-only C-function gsk-blur-node-new
  input parameter child_ :: <GskRenderNode>;
  input parameter radius_ :: <C-float>;
  result res :: <GskBlurNode>;
  c-name: "gsk_blur_node_new";
end;

define inline-only C-function gsk-blur-node-get-child
  input parameter self :: <GskBlurNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_blur_node_get_child";
end;

define inline-only C-function gsk-blur-node-get-radius
  input parameter self :: <GskBlurNode>;
  result res :: <C-float>;
  c-name: "gsk_blur_node_get_radius";
end;

define open C-subtype <GskBorderNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskBorderNode*> => <GskBorderNode>;

define sealed domain make (singleton(<GskBorderNode*>));
define sealed domain initialize (<GskBorderNode*>);

define inline-only C-function gsk-border-node-new
  input parameter outline_ :: <GskRoundedRect>;
  input parameter border_width_ :: <C-float*>;
  input parameter border_color_ :: <C-unsigned-char*> /* Not supported */;
  result res :: <GskBorderNode>;
  c-name: "gsk_border_node_new";
end;

define inline-only C-function gsk-border-node-get-colors
  input parameter self :: <GskBorderNode>;
  result res :: <GdkRGBA>;
  c-name: "gsk_border_node_get_colors";
end;

define inline-only C-function gsk-border-node-get-outline
  input parameter self :: <GskBorderNode>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_border_node_get_outline";
end;

define inline-only C-function gsk-border-node-get-widths
  input parameter self :: <GskBorderNode>;
  result res :: <C-float*>;
  c-name: "gsk_border_node_get_widths";
end;

define open C-subtype <GskBroadwayRenderer> (<GskRenderer>)
end C-subtype;

define C-pointer-type <GskBroadwayRenderer*> => <GskBroadwayRenderer>;

define sealed domain make (singleton(<GskBroadwayRenderer*>));
define sealed domain initialize (<GskBroadwayRenderer*>);

define inline-only C-function gsk-broadway-renderer-new
  result res :: <GskRenderer>;
  c-name: "gsk_broadway_renderer_new";
end;

define C-struct <_GskBroadwayRendererClass>
  pointer-type-name: <GskBroadwayRendererClass>;
end C-struct;

define sealed domain make (singleton(<GskBroadwayRendererClass>));
define sealed domain initialize (<GskBroadwayRendererClass>);

define open C-subtype <GskCairoNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskCairoNode*> => <GskCairoNode>;

define sealed domain make (singleton(<GskCairoNode*>));
define sealed domain initialize (<GskCairoNode*>);

define inline-only C-function gsk-cairo-node-new
  input parameter bounds_ :: <GrapheneRect>;
  result res :: <GskCairoNode>;
  c-name: "gsk_cairo_node_new";
end;

define inline-only C-function gsk-cairo-node-get-draw-context
  input parameter self :: <GskCairoNode>;
  result res :: <cairoContext>;
  c-name: "gsk_cairo_node_get_draw_context";
end;

define inline-only C-function gsk-cairo-node-get-surface
  input parameter self :: <GskCairoNode>;
  result res :: <cairoSurface>;
  c-name: "gsk_cairo_node_get_surface";
end;

define open C-subtype <GskCairoRenderer> (<GskRenderer>)
end C-subtype;

define C-pointer-type <GskCairoRenderer*> => <GskCairoRenderer>;

define sealed domain make (singleton(<GskCairoRenderer*>));
define sealed domain initialize (<GskCairoRenderer*>);

define inline-only C-function gsk-cairo-renderer-new
  result res :: <GskRenderer>;
  c-name: "gsk_cairo_renderer_new";
end;

define C-struct <_GskCairoRendererClass>
  pointer-type-name: <GskCairoRendererClass>;
end C-struct;

define sealed domain make (singleton(<GskCairoRendererClass>));
define sealed domain initialize (<GskCairoRendererClass>);

define open C-subtype <GskClipNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskClipNode*> => <GskClipNode>;

define sealed domain make (singleton(<GskClipNode*>));
define sealed domain initialize (<GskClipNode*>);

define inline-only C-function gsk-clip-node-new
  input parameter child_ :: <GskRenderNode>;
  input parameter clip_ :: <GrapheneRect>;
  result res :: <GskClipNode>;
  c-name: "gsk_clip_node_new";
end;

define inline-only C-function gsk-clip-node-get-child
  input parameter self :: <GskClipNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_clip_node_get_child";
end;

define inline-only C-function gsk-clip-node-get-clip
  input parameter self :: <GskClipNode>;
  result res :: <GrapheneRect>;
  c-name: "gsk_clip_node_get_clip";
end;

define open C-subtype <GskColorMatrixNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskColorMatrixNode*> => <GskColorMatrixNode>;

define sealed domain make (singleton(<GskColorMatrixNode*>));
define sealed domain initialize (<GskColorMatrixNode*>);

define inline-only C-function gsk-color-matrix-node-new
  input parameter child_ :: <GskRenderNode>;
  input parameter color_matrix_ :: <GrapheneMatrix>;
  input parameter color_offset_ :: <GrapheneVec4>;
  result res :: <GskColorMatrixNode>;
  c-name: "gsk_color_matrix_node_new";
end;

define inline-only C-function gsk-color-matrix-node-get-child
  input parameter self :: <GskColorMatrixNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_color_matrix_node_get_child";
end;

define inline-only C-function gsk-color-matrix-node-get-color-matrix
  input parameter self :: <GskColorMatrixNode>;
  result res :: <GrapheneMatrix>;
  c-name: "gsk_color_matrix_node_get_color_matrix";
end;

define inline-only C-function gsk-color-matrix-node-get-color-offset
  input parameter self :: <GskColorMatrixNode>;
  result res :: <GrapheneVec4>;
  c-name: "gsk_color_matrix_node_get_color_offset";
end;

define open C-subtype <GskColorNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskColorNode*> => <GskColorNode>;

define sealed domain make (singleton(<GskColorNode*>));
define sealed domain initialize (<GskColorNode*>);

define inline-only C-function gsk-color-node-new
  input parameter rgba_ :: <GdkRGBA>;
  input parameter bounds_ :: <GrapheneRect>;
  result res :: <GskColorNode>;
  c-name: "gsk_color_node_new";
end;

define inline-only C-function gsk-color-node-get-color
  input parameter self :: <GskColorNode>;
  result res :: <GdkRGBA>;
  c-name: "gsk_color_node_get_color";
end;

define C-struct <_GskColorStop>
  sealed inline-only slot gsk-color-stop-offset :: <C-float>;
  sealed inline-only slot gsk-color-stop-color :: <GdkRGBA>;
  pointer-type-name: <GskColorStop>;
end C-struct;

define sealed domain make (singleton(<GskColorStop>));
define sealed domain initialize (<GskColorStop>);

define open C-subtype <GskConicGradientNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskConicGradientNode*> => <GskConicGradientNode>;

define sealed domain make (singleton(<GskConicGradientNode*>));
define sealed domain initialize (<GskConicGradientNode*>);

define inline-only C-function gsk-conic-gradient-node-new
  input parameter bounds_ :: <GrapheneRect>;
  input parameter center_ :: <GraphenePoint>;
  input parameter rotation_ :: <C-float>;
  input parameter color_stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_color_stops_ :: <C-unsigned-long>;
  result res :: <GskConicGradientNode>;
  c-name: "gsk_conic_gradient_node_new";
end;

define inline-only C-function gsk-conic-gradient-node-get-angle
  input parameter self :: <GskConicGradientNode>;
  result res :: <C-float>;
  c-name: "gsk_conic_gradient_node_get_angle";
end;

define inline-only C-function gsk-conic-gradient-node-get-center
  input parameter self :: <GskConicGradientNode>;
  result res :: <GraphenePoint>;
  c-name: "gsk_conic_gradient_node_get_center";
end;

define inline-only C-function gsk-conic-gradient-node-get-color-stops
  input parameter self :: <GskConicGradientNode>;
  output parameter n_stops_ :: <C-unsigned-long*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "gsk_conic_gradient_node_get_color_stops";
end;

define inline-only C-function gsk-conic-gradient-node-get-n-color-stops
  input parameter self :: <GskConicGradientNode>;
  result res :: <C-unsigned-long>;
  c-name: "gsk_conic_gradient_node_get_n_color_stops";
end;

define inline-only C-function gsk-conic-gradient-node-get-rotation
  input parameter self :: <GskConicGradientNode>;
  result res :: <C-float>;
  c-name: "gsk_conic_gradient_node_get_rotation";
end;

define open C-subtype <GskContainerNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskContainerNode*> => <GskContainerNode>;

define sealed domain make (singleton(<GskContainerNode*>));
define sealed domain initialize (<GskContainerNode*>);

define inline-only C-function gsk-container-node-new
  input parameter children_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_children_ :: <C-unsigned-int>;
  result res :: <GskContainerNode>;
  c-name: "gsk_container_node_new";
end;

define inline-only C-function gsk-container-node-get-child
  input parameter self :: <GskContainerNode>;
  input parameter idx_ :: <C-unsigned-int>;
  result res :: <GskRenderNode>;
  c-name: "gsk_container_node_get_child";
end;

define inline-only C-function gsk-container-node-get-n-children
  input parameter self :: <GskContainerNode>;
  result res :: <C-unsigned-int>;
  c-name: "gsk_container_node_get_n_children";
end;

define inline-only constant $gsk-corner-top-left = 0;
define inline-only constant $gsk-corner-top-right = 1;
define inline-only constant $gsk-corner-bottom-right = 2;
define inline-only constant $gsk-corner-bottom-left = 3;
define constant <GskCorner> = <C-int>;
define C-pointer-type <GskCorner*> => <GskCorner>;

define open C-subtype <GskCrossFadeNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskCrossFadeNode*> => <GskCrossFadeNode>;

define sealed domain make (singleton(<GskCrossFadeNode*>));
define sealed domain initialize (<GskCrossFadeNode*>);

define inline-only C-function gsk-cross-fade-node-new
  input parameter start_ :: <GskRenderNode>;
  input parameter end_ :: <GskRenderNode>;
  input parameter progress_ :: <C-float>;
  result res :: <GskCrossFadeNode>;
  c-name: "gsk_cross_fade_node_new";
end;

define inline-only C-function gsk-cross-fade-node-get-end-child
  input parameter self :: <GskCrossFadeNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_cross_fade_node_get_end_child";
end;

define inline-only C-function gsk-cross-fade-node-get-progress
  input parameter self :: <GskCrossFadeNode>;
  result res :: <C-float>;
  c-name: "gsk_cross_fade_node_get_progress";
end;

define inline-only C-function gsk-cross-fade-node-get-start-child
  input parameter self :: <GskCrossFadeNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_cross_fade_node_get_start_child";
end;

define open C-subtype <GskDebugNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskDebugNode*> => <GskDebugNode>;

define sealed domain make (singleton(<GskDebugNode*>));
define sealed domain initialize (<GskDebugNode*>);

define inline-only C-function gsk-debug-node-new
  input parameter child_ :: <GskRenderNode>;
  input parameter message_ :: <C-string>;
  result res :: <GskDebugNode>;
  c-name: "gsk_debug_node_new";
end;

define inline-only C-function gsk-debug-node-get-child
  input parameter self :: <GskDebugNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_debug_node_get_child";
end;

define inline-only C-function gsk-debug-node-get-message
  input parameter self :: <GskDebugNode>;
  result res :: <C-string>;
  c-name: "gsk_debug_node_get_message";
end;

define open C-subtype <GskGLRenderer> (<GskRenderer>)
end C-subtype;

define C-pointer-type <GskGLRenderer*> => <GskGLRenderer>;

define sealed domain make (singleton(<GskGLRenderer*>));
define sealed domain initialize (<GskGLRenderer*>);

define inline-only C-function gsk-gl-renderer-new
  result res :: <GskRenderer>;
  c-name: "gsk_gl_renderer_new";
end;

define C-struct <_GskGLRendererClass>
  pointer-type-name: <GskGLRendererClass>;
end C-struct;

define sealed domain make (singleton(<GskGLRendererClass>));
define sealed domain initialize (<GskGLRendererClass>);

define open C-subtype <GskGLShader> (<GObject>)
end C-subtype;

define C-pointer-type <GskGLShader*> => <GskGLShader>;

define sealed domain make (singleton(<GskGLShader*>));
define sealed domain initialize (<GskGLShader*>);

define inline-only C-function gsk-gl-shader-new-from-bytes
  input parameter sourcecode_ :: <GBytes>;
  result res :: <GskGLShader>;
  c-name: "gsk_gl_shader_new_from_bytes";
end;

define inline-only C-function gsk-gl-shader-new-from-resource
  input parameter resource_path_ :: <C-string>;
  result res :: <GskGLShader>;
  c-name: "gsk_gl_shader_new_from_resource";
end;

define inline-only C-function gsk-gl-shader-compile
  input parameter self :: <GskGLShader>;
  input parameter renderer_ :: <GskRenderer>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gsk_gl_shader_compile";
end;

define inline-only C-function gsk-gl-shader-find-uniform-by-name
  input parameter self :: <GskGLShader>;
  input parameter name_ :: <C-string>;
  result res :: <C-signed-int>;
  c-name: "gsk_gl_shader_find_uniform_by_name";
end;

define inline-only C-function gsk-gl-shader-get-arg-bool
  input parameter self :: <GskGLShader>;
  input parameter args_ :: <GBytes>;
  input parameter idx_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "gsk_gl_shader_get_arg_bool";
end;

define inline-only C-function gsk-gl-shader-get-arg-float
  input parameter self :: <GskGLShader>;
  input parameter args_ :: <GBytes>;
  input parameter idx_ :: <C-signed-int>;
  result res :: <C-float>;
  c-name: "gsk_gl_shader_get_arg_float";
end;

define inline-only C-function gsk-gl-shader-get-arg-int
  input parameter self :: <GskGLShader>;
  input parameter args_ :: <GBytes>;
  input parameter idx_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gsk_gl_shader_get_arg_int";
end;

define inline-only C-function gsk-gl-shader-get-arg-uint
  input parameter self :: <GskGLShader>;
  input parameter args_ :: <GBytes>;
  input parameter idx_ :: <C-signed-int>;
  result res :: <C-unsigned-int>;
  c-name: "gsk_gl_shader_get_arg_uint";
end;

define inline-only C-function gsk-gl-shader-get-arg-vec2
  input parameter self :: <GskGLShader>;
  input parameter args_ :: <GBytes>;
  input parameter idx_ :: <C-signed-int>;
  input parameter out_value_ :: <GrapheneVec2>;
  c-name: "gsk_gl_shader_get_arg_vec2";
end;

define inline-only C-function gsk-gl-shader-get-arg-vec3
  input parameter self :: <GskGLShader>;
  input parameter args_ :: <GBytes>;
  input parameter idx_ :: <C-signed-int>;
  input parameter out_value_ :: <GrapheneVec3>;
  c-name: "gsk_gl_shader_get_arg_vec3";
end;

define inline-only C-function gsk-gl-shader-get-arg-vec4
  input parameter self :: <GskGLShader>;
  input parameter args_ :: <GBytes>;
  input parameter idx_ :: <C-signed-int>;
  input parameter out_value_ :: <GrapheneVec4>;
  c-name: "gsk_gl_shader_get_arg_vec4";
end;

define inline-only C-function gsk-gl-shader-get-args-size
  input parameter self :: <GskGLShader>;
  result res :: <C-unsigned-long>;
  c-name: "gsk_gl_shader_get_args_size";
end;

define inline-only C-function gsk-gl-shader-get-n-textures
  input parameter self :: <GskGLShader>;
  result res :: <C-signed-int>;
  c-name: "gsk_gl_shader_get_n_textures";
end;

define inline-only C-function gsk-gl-shader-get-n-uniforms
  input parameter self :: <GskGLShader>;
  result res :: <C-signed-int>;
  c-name: "gsk_gl_shader_get_n_uniforms";
end;

define inline-only C-function gsk-gl-shader-get-resource
  input parameter self :: <GskGLShader>;
  result res :: <C-string>;
  c-name: "gsk_gl_shader_get_resource";
end;

define inline-only C-function gsk-gl-shader-get-source
  input parameter self :: <GskGLShader>;
  result res :: <GBytes>;
  c-name: "gsk_gl_shader_get_source";
end;

define inline-only C-function gsk-gl-shader-get-uniform-name
  input parameter self :: <GskGLShader>;
  input parameter idx_ :: <C-signed-int>;
  result res :: <C-string>;
  c-name: "gsk_gl_shader_get_uniform_name";
end;

define inline-only C-function gsk-gl-shader-get-uniform-offset
  input parameter self :: <GskGLShader>;
  input parameter idx_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "gsk_gl_shader_get_uniform_offset";
end;

define inline-only C-function gsk-gl-shader-get-uniform-type
  input parameter self :: <GskGLShader>;
  input parameter idx_ :: <C-signed-int>;
  result res :: <GskGLUniformType>;
  c-name: "gsk_gl_shader_get_uniform_type";
end;

define C-struct <_GskGLShaderClass>
  constant sealed inline-only slot gsk-gl-shader-class-parent-class :: <GObjectClass>;
  pointer-type-name: <GskGLShaderClass>;
end C-struct;

define sealed domain make (singleton(<GskGLShaderClass>));
define sealed domain initialize (<GskGLShaderClass>);

define open C-subtype <GskGLShaderNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskGLShaderNode*> => <GskGLShaderNode>;

define sealed domain make (singleton(<GskGLShaderNode*>));
define sealed domain initialize (<GskGLShaderNode*>);

define inline-only C-function gsk-gl-shader-node-new
  input parameter shader_ :: <GskGLShader>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter args_ :: <GBytes>;
  input parameter children_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_children_ :: <C-unsigned-int>;
  result res :: <GskGLShaderNode>;
  c-name: "gsk_gl_shader_node_new";
end;

define inline-only C-function gsk-gl-shader-node-get-args
  input parameter self :: <GskGLShaderNode>;
  result res :: <GBytes>;
  c-name: "gsk_gl_shader_node_get_args";
end;

define inline-only C-function gsk-gl-shader-node-get-child
  input parameter self :: <GskGLShaderNode>;
  input parameter idx_ :: <C-unsigned-int>;
  result res :: <GskRenderNode>;
  c-name: "gsk_gl_shader_node_get_child";
end;

define inline-only C-function gsk-gl-shader-node-get-n-children
  input parameter self :: <GskGLShaderNode>;
  result res :: <C-unsigned-int>;
  c-name: "gsk_gl_shader_node_get_n_children";
end;

define inline-only C-function gsk-gl-shader-node-get-shader
  input parameter self :: <GskGLShaderNode>;
  result res :: <GskGLShader>;
  c-name: "gsk_gl_shader_node_get_shader";
end;

define inline-only constant $gsk-gl-uniform-type-none = 0;
define inline-only constant $gsk-gl-uniform-type-float = 1;
define inline-only constant $gsk-gl-uniform-type-int = 2;
define inline-only constant $gsk-gl-uniform-type-uint = 3;
define inline-only constant $gsk-gl-uniform-type-bool = 4;
define inline-only constant $gsk-gl-uniform-type-vec2 = 5;
define inline-only constant $gsk-gl-uniform-type-vec3 = 6;
define inline-only constant $gsk-gl-uniform-type-vec4 = 7;
define constant <GskGLUniformType> = <C-int>;
define C-pointer-type <GskGLUniformType*> => <GskGLUniformType>;

define open C-subtype <GskInsetShadowNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskInsetShadowNode*> => <GskInsetShadowNode>;

define sealed domain make (singleton(<GskInsetShadowNode*>));
define sealed domain initialize (<GskInsetShadowNode*>);

define inline-only C-function gsk-inset-shadow-node-new
  input parameter outline_ :: <GskRoundedRect>;
  input parameter color_ :: <GdkRGBA>;
  input parameter dx_ :: <C-float>;
  input parameter dy_ :: <C-float>;
  input parameter spread_ :: <C-float>;
  input parameter blur_radius_ :: <C-float>;
  result res :: <GskInsetShadowNode>;
  c-name: "gsk_inset_shadow_node_new";
end;

define inline-only C-function gsk-inset-shadow-node-get-blur-radius
  input parameter self :: <GskInsetShadowNode>;
  result res :: <C-float>;
  c-name: "gsk_inset_shadow_node_get_blur_radius";
end;

define inline-only C-function gsk-inset-shadow-node-get-color
  input parameter self :: <GskInsetShadowNode>;
  result res :: <GdkRGBA>;
  c-name: "gsk_inset_shadow_node_get_color";
end;

define inline-only C-function gsk-inset-shadow-node-get-dx
  input parameter self :: <GskInsetShadowNode>;
  result res :: <C-float>;
  c-name: "gsk_inset_shadow_node_get_dx";
end;

define inline-only C-function gsk-inset-shadow-node-get-dy
  input parameter self :: <GskInsetShadowNode>;
  result res :: <C-float>;
  c-name: "gsk_inset_shadow_node_get_dy";
end;

define inline-only C-function gsk-inset-shadow-node-get-outline
  input parameter self :: <GskInsetShadowNode>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_inset_shadow_node_get_outline";
end;

define inline-only C-function gsk-inset-shadow-node-get-spread
  input parameter self :: <GskInsetShadowNode>;
  result res :: <C-float>;
  c-name: "gsk_inset_shadow_node_get_spread";
end;

define open C-subtype <GskLinearGradientNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskLinearGradientNode*> => <GskLinearGradientNode>;

define sealed domain make (singleton(<GskLinearGradientNode*>));
define sealed domain initialize (<GskLinearGradientNode*>);

define inline-only C-function gsk-linear-gradient-node-new
  input parameter bounds_ :: <GrapheneRect>;
  input parameter start_ :: <GraphenePoint>;
  input parameter end_ :: <GraphenePoint>;
  input parameter color_stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_color_stops_ :: <C-unsigned-long>;
  result res :: <GskLinearGradientNode>;
  c-name: "gsk_linear_gradient_node_new";
end;

define inline-only C-function gsk-linear-gradient-node-get-color-stops
  input parameter self :: <GskLinearGradientNode>;
  output parameter n_stops_ :: <C-unsigned-long*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "gsk_linear_gradient_node_get_color_stops";
end;

define inline-only C-function gsk-linear-gradient-node-get-end
  input parameter self :: <GskLinearGradientNode>;
  result res :: <GraphenePoint>;
  c-name: "gsk_linear_gradient_node_get_end";
end;

define inline-only C-function gsk-linear-gradient-node-get-n-color-stops
  input parameter self :: <GskLinearGradientNode>;
  result res :: <C-unsigned-long>;
  c-name: "gsk_linear_gradient_node_get_n_color_stops";
end;

define inline-only C-function gsk-linear-gradient-node-get-start
  input parameter self :: <GskLinearGradientNode>;
  result res :: <GraphenePoint>;
  c-name: "gsk_linear_gradient_node_get_start";
end;

define open C-subtype <GskNglRenderer> (<GskRenderer>)
end C-subtype;

define C-pointer-type <GskNglRenderer*> => <GskNglRenderer>;

define sealed domain make (singleton(<GskNglRenderer*>));
define sealed domain initialize (<GskNglRenderer*>);

define open C-subtype <GskOpacityNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskOpacityNode*> => <GskOpacityNode>;

define sealed domain make (singleton(<GskOpacityNode*>));
define sealed domain initialize (<GskOpacityNode*>);

define inline-only C-function gsk-opacity-node-new
  input parameter child_ :: <GskRenderNode>;
  input parameter opacity_ :: <C-float>;
  result res :: <GskOpacityNode>;
  c-name: "gsk_opacity_node_new";
end;

define inline-only C-function gsk-opacity-node-get-child
  input parameter self :: <GskOpacityNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_opacity_node_get_child";
end;

define inline-only C-function gsk-opacity-node-get-opacity
  input parameter self :: <GskOpacityNode>;
  result res :: <C-float>;
  c-name: "gsk_opacity_node_get_opacity";
end;

define open C-subtype <GskOutsetShadowNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskOutsetShadowNode*> => <GskOutsetShadowNode>;

define sealed domain make (singleton(<GskOutsetShadowNode*>));
define sealed domain initialize (<GskOutsetShadowNode*>);

define inline-only C-function gsk-outset-shadow-node-new
  input parameter outline_ :: <GskRoundedRect>;
  input parameter color_ :: <GdkRGBA>;
  input parameter dx_ :: <C-float>;
  input parameter dy_ :: <C-float>;
  input parameter spread_ :: <C-float>;
  input parameter blur_radius_ :: <C-float>;
  result res :: <GskOutsetShadowNode>;
  c-name: "gsk_outset_shadow_node_new";
end;

define inline-only C-function gsk-outset-shadow-node-get-blur-radius
  input parameter self :: <GskOutsetShadowNode>;
  result res :: <C-float>;
  c-name: "gsk_outset_shadow_node_get_blur_radius";
end;

define inline-only C-function gsk-outset-shadow-node-get-color
  input parameter self :: <GskOutsetShadowNode>;
  result res :: <GdkRGBA>;
  c-name: "gsk_outset_shadow_node_get_color";
end;

define inline-only C-function gsk-outset-shadow-node-get-dx
  input parameter self :: <GskOutsetShadowNode>;
  result res :: <C-float>;
  c-name: "gsk_outset_shadow_node_get_dx";
end;

define inline-only C-function gsk-outset-shadow-node-get-dy
  input parameter self :: <GskOutsetShadowNode>;
  result res :: <C-float>;
  c-name: "gsk_outset_shadow_node_get_dy";
end;

define inline-only C-function gsk-outset-shadow-node-get-outline
  input parameter self :: <GskOutsetShadowNode>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_outset_shadow_node_get_outline";
end;

define inline-only C-function gsk-outset-shadow-node-get-spread
  input parameter self :: <GskOutsetShadowNode>;
  result res :: <C-float>;
  c-name: "gsk_outset_shadow_node_get_spread";
end;

define C-struct <_GskParseLocation>
  sealed inline-only slot gsk-parse-location-bytes :: <C-unsigned-long>;
  sealed inline-only slot gsk-parse-location-chars :: <C-unsigned-long>;
  sealed inline-only slot gsk-parse-location-lines :: <C-unsigned-long>;
  sealed inline-only slot gsk-parse-location-line-bytes :: <C-unsigned-long>;
  sealed inline-only slot gsk-parse-location-line-chars :: <C-unsigned-long>;
  pointer-type-name: <GskParseLocation>;
end C-struct;

define sealed domain make (singleton(<GskParseLocation>));
define sealed domain initialize (<GskParseLocation>);

define open C-subtype <GskRadialGradientNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskRadialGradientNode*> => <GskRadialGradientNode>;

define sealed domain make (singleton(<GskRadialGradientNode*>));
define sealed domain initialize (<GskRadialGradientNode*>);

define inline-only C-function gsk-radial-gradient-node-new
  input parameter bounds_ :: <GrapheneRect>;
  input parameter center_ :: <GraphenePoint>;
  input parameter hradius_ :: <C-float>;
  input parameter vradius_ :: <C-float>;
  input parameter start_ :: <C-float>;
  input parameter end_ :: <C-float>;
  input parameter color_stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_color_stops_ :: <C-unsigned-long>;
  result res :: <GskRadialGradientNode>;
  c-name: "gsk_radial_gradient_node_new";
end;

define inline-only C-function gsk-radial-gradient-node-get-center
  input parameter self :: <GskRadialGradientNode>;
  result res :: <GraphenePoint>;
  c-name: "gsk_radial_gradient_node_get_center";
end;

define inline-only C-function gsk-radial-gradient-node-get-color-stops
  input parameter self :: <GskRadialGradientNode>;
  output parameter n_stops_ :: <C-unsigned-long*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "gsk_radial_gradient_node_get_color_stops";
end;

define inline-only C-function gsk-radial-gradient-node-get-end
  input parameter self :: <GskRadialGradientNode>;
  result res :: <C-float>;
  c-name: "gsk_radial_gradient_node_get_end";
end;

define inline-only C-function gsk-radial-gradient-node-get-hradius
  input parameter self :: <GskRadialGradientNode>;
  result res :: <C-float>;
  c-name: "gsk_radial_gradient_node_get_hradius";
end;

define inline-only C-function gsk-radial-gradient-node-get-n-color-stops
  input parameter self :: <GskRadialGradientNode>;
  result res :: <C-unsigned-long>;
  c-name: "gsk_radial_gradient_node_get_n_color_stops";
end;

define inline-only C-function gsk-radial-gradient-node-get-start
  input parameter self :: <GskRadialGradientNode>;
  result res :: <C-float>;
  c-name: "gsk_radial_gradient_node_get_start";
end;

define inline-only C-function gsk-radial-gradient-node-get-vradius
  input parameter self :: <GskRadialGradientNode>;
  result res :: <C-float>;
  c-name: "gsk_radial_gradient_node_get_vradius";
end;

define open C-subtype <GskRenderNode> (<C-void*>)
end C-subtype;

define C-pointer-type <GskRenderNode*> => <GskRenderNode>;

define sealed domain make (singleton(<GskRenderNode*>));
define sealed domain initialize (<GskRenderNode*>);

define inline-only C-function gsk-render-node-deserialize
  input parameter bytes_ :: <GBytes>;
  input parameter error_func_ :: <C-function-pointer>;
  input parameter user_data_ :: <C-void*>;
  result res :: <GskRenderNode>;
  c-name: "gsk_render_node_deserialize";
end;

define inline-only C-function gsk-render-node-draw
  input parameter self :: <GskRenderNode>;
  input parameter cr_ :: <cairoContext>;
  c-name: "gsk_render_node_draw";
end;

define inline-only C-function gsk-render-node-get-bounds
  input parameter self :: <GskRenderNode>;
  input parameter bounds_ :: <GrapheneRect>;
  c-name: "gsk_render_node_get_bounds";
end;

define inline-only C-function gsk-render-node-get-node-type
  input parameter self :: <GskRenderNode>;
  result res :: <GskRenderNodeType>;
  c-name: "gsk_render_node_get_node_type";
end;

define inline-only C-function gsk-render-node-ref
  input parameter self :: <GskRenderNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_render_node_ref";
end;

define inline-only C-function gsk-render-node-serialize
  input parameter self :: <GskRenderNode>;
  result res :: <GBytes>;
  c-name: "gsk_render_node_serialize";
end;

define inline-only C-function gsk-render-node-unref
  input parameter self :: <GskRenderNode>;
  c-name: "gsk_render_node_unref";
end;

define inline-only C-function gsk-render-node-write-to-file
  input parameter self :: <GskRenderNode>;
  input parameter filename_ :: <C-string>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gsk_render_node_write_to_file";
end;

define inline-only constant $gsk-not-a-render-node = 0;
define inline-only constant $gsk-container-node = 1;
define inline-only constant $gsk-cairo-node = 2;
define inline-only constant $gsk-color-node = 3;
define inline-only constant $gsk-linear-gradient-node = 4;
define inline-only constant $gsk-repeating-linear-gradient-node = 5;
define inline-only constant $gsk-radial-gradient-node = 6;
define inline-only constant $gsk-repeating-radial-gradient-node = 7;
define inline-only constant $gsk-conic-gradient-node = 8;
define inline-only constant $gsk-border-node = 9;
define inline-only constant $gsk-texture-node = 10;
define inline-only constant $gsk-inset-shadow-node = 11;
define inline-only constant $gsk-outset-shadow-node = 12;
define inline-only constant $gsk-transform-node = 13;
define inline-only constant $gsk-opacity-node = 14;
define inline-only constant $gsk-color-matrix-node = 15;
define inline-only constant $gsk-repeat-node = 16;
define inline-only constant $gsk-clip-node = 17;
define inline-only constant $gsk-rounded-clip-node = 18;
define inline-only constant $gsk-shadow-node = 19;
define inline-only constant $gsk-blend-node = 20;
define inline-only constant $gsk-cross-fade-node = 21;
define inline-only constant $gsk-text-node = 22;
define inline-only constant $gsk-blur-node = 23;
define inline-only constant $gsk-debug-node = 24;
define inline-only constant $gsk-gl-shader-node = 25;
define constant <GskRenderNodeType> = <C-int>;
define C-pointer-type <GskRenderNodeType*> => <GskRenderNodeType>;

define open C-subtype <GskRenderer> (<GObject>)
end C-subtype;

define C-pointer-type <GskRenderer*> => <GskRenderer>;

define sealed domain make (singleton(<GskRenderer*>));
define sealed domain initialize (<GskRenderer*>);

define inline-only C-function gsk-renderer-new-for-surface
  input parameter surface_ :: <GdkSurface>;
  result res :: <GskRenderer>;
  c-name: "gsk_renderer_new_for_surface";
end;

define inline-only C-function gsk-renderer-get-surface
  input parameter self :: <GskRenderer>;
  result res :: <GdkSurface>;
  c-name: "gsk_renderer_get_surface";
end;

define inline-only C-function gsk-renderer-is-realized
  input parameter self :: <GskRenderer>;
  result res :: <C-boolean>;
  c-name: "gsk_renderer_is_realized";
end;

define inline-only C-function gsk-renderer-realize
  input parameter self :: <GskRenderer>;
  input parameter surface_ :: <GdkSurface>;
  output parameter error_ :: <GError*>;
  result res :: <C-boolean>;
  c-name: "gsk_renderer_realize";
end;

define inline-only C-function gsk-renderer-render
  input parameter self :: <GskRenderer>;
  input parameter root_ :: <GskRenderNode>;
  input parameter region_ :: <cairoRegion>;
  c-name: "gsk_renderer_render";
end;

define inline-only C-function gsk-renderer-render-texture
  input parameter self :: <GskRenderer>;
  input parameter root_ :: <GskRenderNode>;
  input parameter viewport_ :: <GrapheneRect>;
  result res :: <GdkTexture>;
  c-name: "gsk_renderer_render_texture";
end;

define inline-only C-function gsk-renderer-unrealize
  input parameter self :: <GskRenderer>;
  c-name: "gsk_renderer_unrealize";
end;

define C-struct <_GskRendererClass>
  pointer-type-name: <GskRendererClass>;
end C-struct;

define sealed domain make (singleton(<GskRendererClass>));
define sealed domain initialize (<GskRendererClass>);

define open C-subtype <GskRepeatNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskRepeatNode*> => <GskRepeatNode>;

define sealed domain make (singleton(<GskRepeatNode*>));
define sealed domain initialize (<GskRepeatNode*>);

define inline-only C-function gsk-repeat-node-new
  input parameter bounds_ :: <GrapheneRect>;
  input parameter child_ :: <GskRenderNode>;
  input parameter child_bounds_ :: <GrapheneRect>;
  result res :: <GskRepeatNode>;
  c-name: "gsk_repeat_node_new";
end;

define inline-only C-function gsk-repeat-node-get-child
  input parameter self :: <GskRepeatNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_repeat_node_get_child";
end;

define inline-only C-function gsk-repeat-node-get-child-bounds
  input parameter self :: <GskRepeatNode>;
  result res :: <GrapheneRect>;
  c-name: "gsk_repeat_node_get_child_bounds";
end;

define open C-subtype <GskRepeatingLinearGradientNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskRepeatingLinearGradientNode*> => <GskRepeatingLinearGradientNode>;

define sealed domain make (singleton(<GskRepeatingLinearGradientNode*>));
define sealed domain initialize (<GskRepeatingLinearGradientNode*>);

define inline-only C-function gsk-repeating-linear-gradient-node-new
  input parameter bounds_ :: <GrapheneRect>;
  input parameter start_ :: <GraphenePoint>;
  input parameter end_ :: <GraphenePoint>;
  input parameter color_stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_color_stops_ :: <C-unsigned-long>;
  result res :: <GskRepeatingLinearGradientNode>;
  c-name: "gsk_repeating_linear_gradient_node_new";
end;

define open C-subtype <GskRepeatingRadialGradientNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskRepeatingRadialGradientNode*> => <GskRepeatingRadialGradientNode>;

define sealed domain make (singleton(<GskRepeatingRadialGradientNode*>));
define sealed domain initialize (<GskRepeatingRadialGradientNode*>);

define inline-only C-function gsk-repeating-radial-gradient-node-new
  input parameter bounds_ :: <GrapheneRect>;
  input parameter center_ :: <GraphenePoint>;
  input parameter hradius_ :: <C-float>;
  input parameter vradius_ :: <C-float>;
  input parameter start_ :: <C-float>;
  input parameter end_ :: <C-float>;
  input parameter color_stops_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_color_stops_ :: <C-unsigned-long>;
  result res :: <GskRepeatingRadialGradientNode>;
  c-name: "gsk_repeating_radial_gradient_node_new";
end;

define open C-subtype <GskRoundedClipNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskRoundedClipNode*> => <GskRoundedClipNode>;

define sealed domain make (singleton(<GskRoundedClipNode*>));
define sealed domain initialize (<GskRoundedClipNode*>);

define inline-only C-function gsk-rounded-clip-node-new
  input parameter child_ :: <GskRenderNode>;
  input parameter clip_ :: <GskRoundedRect>;
  result res :: <GskRoundedClipNode>;
  c-name: "gsk_rounded_clip_node_new";
end;

define inline-only C-function gsk-rounded-clip-node-get-child
  input parameter self :: <GskRoundedClipNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_rounded_clip_node_get_child";
end;

define inline-only C-function gsk-rounded-clip-node-get-clip
  input parameter self :: <GskRoundedClipNode>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_rounded_clip_node_get_clip";
end;

define C-struct <_GskRoundedRect>
  sealed inline-only slot gsk-rounded-rect-bounds :: <GrapheneRect>;
  sealed inline-only slot gsk-rounded-rect-corner :: <C-unsigned-char*> /* Not supported */;
  pointer-type-name: <GskRoundedRect>;
end C-struct;

define sealed domain make (singleton(<GskRoundedRect>));
define sealed domain initialize (<GskRoundedRect>);

define inline-only C-function gsk-rounded-rect-contains-point
  input parameter self :: <GskRoundedRect>;
  input parameter point_ :: <GraphenePoint>;
  result res :: <C-boolean>;
  c-name: "gsk_rounded_rect_contains_point";
end;

define inline-only C-function gsk-rounded-rect-contains-rect
  input parameter self :: <GskRoundedRect>;
  input parameter rect_ :: <GrapheneRect>;
  result res :: <C-boolean>;
  c-name: "gsk_rounded_rect_contains_rect";
end;

define inline-only C-function gsk-rounded-rect-init
  input parameter self :: <GskRoundedRect>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter top_left_ :: <GrapheneSize>;
  input parameter top_right_ :: <GrapheneSize>;
  input parameter bottom_right_ :: <GrapheneSize>;
  input parameter bottom_left_ :: <GrapheneSize>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_rounded_rect_init";
end;

define inline-only C-function gsk-rounded-rect-init-copy
  input parameter self :: <GskRoundedRect>;
  input parameter src_ :: <GskRoundedRect>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_rounded_rect_init_copy";
end;

define inline-only C-function gsk-rounded-rect-init-from-rect
  input parameter self :: <GskRoundedRect>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter radius_ :: <C-float>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_rounded_rect_init_from_rect";
end;

define inline-only C-function gsk-rounded-rect-intersects-rect
  input parameter self :: <GskRoundedRect>;
  input parameter rect_ :: <GrapheneRect>;
  result res :: <C-boolean>;
  c-name: "gsk_rounded_rect_intersects_rect";
end;

define inline-only C-function gsk-rounded-rect-is-rectilinear
  input parameter self :: <GskRoundedRect>;
  result res :: <C-boolean>;
  c-name: "gsk_rounded_rect_is_rectilinear";
end;

define inline-only C-function gsk-rounded-rect-normalize
  input parameter self :: <GskRoundedRect>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_rounded_rect_normalize";
end;

define inline-only C-function gsk-rounded-rect-offset
  input parameter self :: <GskRoundedRect>;
  input parameter dx_ :: <C-float>;
  input parameter dy_ :: <C-float>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_rounded_rect_offset";
end;

define inline-only C-function gsk-rounded-rect-shrink
  input parameter self :: <GskRoundedRect>;
  input parameter top_ :: <C-float>;
  input parameter right_ :: <C-float>;
  input parameter bottom_ :: <C-float>;
  input parameter left_ :: <C-float>;
  result res :: <GskRoundedRect>;
  c-name: "gsk_rounded_rect_shrink";
end;

define inline-only constant $gsk-scaling-filter-linear = 0;
define inline-only constant $gsk-scaling-filter-nearest = 1;
define inline-only constant $gsk-scaling-filter-trilinear = 2;
define constant <GskScalingFilter> = <C-int>;
define C-pointer-type <GskScalingFilter*> => <GskScalingFilter>;

define inline-only constant $gsk-serialization-unsupported-format = 0;
define inline-only constant $gsk-serialization-unsupported-version = 1;
define inline-only constant $gsk-serialization-invalid-data = 2;
define constant <GskSerializationError> = <C-int>;
define C-pointer-type <GskSerializationError*> => <GskSerializationError>;

define C-struct <_GskShaderArgsBuilder>
  pointer-type-name: <GskShaderArgsBuilder>;
end C-struct;

define sealed domain make (singleton(<GskShaderArgsBuilder>));
define sealed domain initialize (<GskShaderArgsBuilder>);

define inline-only C-function gsk-shader-args-builder-new
  input parameter shader_ :: <GskGLShader>;
  input parameter initial_values_ :: <GBytes>;
  result res :: <GskShaderArgsBuilder>;
  c-name: "gsk_shader_args_builder_new";
end;

define inline-only C-function gsk-shader-args-builder-ref
  input parameter self :: <GskShaderArgsBuilder>;
  result res :: <GskShaderArgsBuilder>;
  c-name: "gsk_shader_args_builder_ref";
end;

define inline-only C-function gsk-shader-args-builder-set-bool
  input parameter self :: <GskShaderArgsBuilder>;
  input parameter idx_ :: <C-signed-int>;
  input parameter value_ :: <C-boolean>;
  c-name: "gsk_shader_args_builder_set_bool";
end;

define inline-only C-function gsk-shader-args-builder-set-float
  input parameter self :: <GskShaderArgsBuilder>;
  input parameter idx_ :: <C-signed-int>;
  input parameter value_ :: <C-float>;
  c-name: "gsk_shader_args_builder_set_float";
end;

define inline-only C-function gsk-shader-args-builder-set-int
  input parameter self :: <GskShaderArgsBuilder>;
  input parameter idx_ :: <C-signed-int>;
  input parameter value_ :: <C-signed-int>;
  c-name: "gsk_shader_args_builder_set_int";
end;

define inline-only C-function gsk-shader-args-builder-set-uint
  input parameter self :: <GskShaderArgsBuilder>;
  input parameter idx_ :: <C-signed-int>;
  input parameter value_ :: <C-unsigned-int>;
  c-name: "gsk_shader_args_builder_set_uint";
end;

define inline-only C-function gsk-shader-args-builder-set-vec2
  input parameter self :: <GskShaderArgsBuilder>;
  input parameter idx_ :: <C-signed-int>;
  input parameter value_ :: <GrapheneVec2>;
  c-name: "gsk_shader_args_builder_set_vec2";
end;

define inline-only C-function gsk-shader-args-builder-set-vec3
  input parameter self :: <GskShaderArgsBuilder>;
  input parameter idx_ :: <C-signed-int>;
  input parameter value_ :: <GrapheneVec3>;
  c-name: "gsk_shader_args_builder_set_vec3";
end;

define inline-only C-function gsk-shader-args-builder-set-vec4
  input parameter self :: <GskShaderArgsBuilder>;
  input parameter idx_ :: <C-signed-int>;
  input parameter value_ :: <GrapheneVec4>;
  c-name: "gsk_shader_args_builder_set_vec4";
end;

define inline-only C-function gsk-shader-args-builder-to-args
  input parameter self :: <GskShaderArgsBuilder>;
  result res :: <GBytes>;
  c-name: "gsk_shader_args_builder_to_args";
end;

define inline-only C-function gsk-shader-args-builder-unref
  input parameter self :: <GskShaderArgsBuilder>;
  c-name: "gsk_shader_args_builder_unref";
end;

define C-struct <_GskShadow>
  sealed inline-only slot gsk-shadow-color :: <GdkRGBA>;
  sealed inline-only slot gsk-shadow-dx :: <C-float>;
  sealed inline-only slot gsk-shadow-dy :: <C-float>;
  sealed inline-only slot gsk-shadow-radius :: <C-float>;
  pointer-type-name: <GskShadow>;
end C-struct;

define sealed domain make (singleton(<GskShadow>));
define sealed domain initialize (<GskShadow>);

define open C-subtype <GskShadowNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskShadowNode*> => <GskShadowNode>;

define sealed domain make (singleton(<GskShadowNode*>));
define sealed domain initialize (<GskShadowNode*>);

define inline-only C-function gsk-shadow-node-new
  input parameter child_ :: <GskRenderNode>;
  input parameter shadows_ :: <C-unsigned-char*> /* Not supported */;
  input parameter n_shadows_ :: <C-unsigned-long>;
  result res :: <GskShadowNode>;
  c-name: "gsk_shadow_node_new";
end;

define inline-only C-function gsk-shadow-node-get-child
  input parameter self :: <GskShadowNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_shadow_node_get_child";
end;

define inline-only C-function gsk-shadow-node-get-n-shadows
  input parameter self :: <GskShadowNode>;
  result res :: <C-unsigned-long>;
  c-name: "gsk_shadow_node_get_n_shadows";
end;

define inline-only C-function gsk-shadow-node-get-shadow
  input parameter self :: <GskShadowNode>;
  input parameter i_ :: <C-unsigned-long>;
  result res :: <GskShadow>;
  c-name: "gsk_shadow_node_get_shadow";
end;

define open C-subtype <GskTextNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskTextNode*> => <GskTextNode>;

define sealed domain make (singleton(<GskTextNode*>));
define sealed domain initialize (<GskTextNode*>);

define inline-only C-function gsk-text-node-new
  input parameter font_ :: <PangoFont>;
  input parameter glyphs_ :: <PangoGlyphString>;
  input parameter color_ :: <GdkRGBA>;
  input parameter offset_ :: <GraphenePoint>;
  result res :: <GskTextNode>;
  c-name: "gsk_text_node_new";
end;

define inline-only C-function gsk-text-node-get-color
  input parameter self :: <GskTextNode>;
  result res :: <GdkRGBA>;
  c-name: "gsk_text_node_get_color";
end;

define inline-only C-function gsk-text-node-get-font
  input parameter self :: <GskTextNode>;
  result res :: <PangoFont>;
  c-name: "gsk_text_node_get_font";
end;

define inline-only C-function gsk-text-node-get-glyphs
  input parameter self :: <GskTextNode>;
  output parameter n_glyphs_ :: <C-unsigned-int*>;
  result res :: <C-unsigned-char*> /* Not supported */;
  c-name: "gsk_text_node_get_glyphs";
end;

define inline-only C-function gsk-text-node-get-num-glyphs
  input parameter self :: <GskTextNode>;
  result res :: <C-unsigned-int>;
  c-name: "gsk_text_node_get_num_glyphs";
end;

define inline-only C-function gsk-text-node-get-offset
  input parameter self :: <GskTextNode>;
  result res :: <GraphenePoint>;
  c-name: "gsk_text_node_get_offset";
end;

define inline-only C-function gsk-text-node-has-color-glyphs
  input parameter self :: <GskTextNode>;
  result res :: <C-boolean>;
  c-name: "gsk_text_node_has_color_glyphs";
end;

define open C-subtype <GskTextureNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskTextureNode*> => <GskTextureNode>;

define sealed domain make (singleton(<GskTextureNode*>));
define sealed domain initialize (<GskTextureNode*>);

define inline-only C-function gsk-texture-node-new
  input parameter texture_ :: <GdkTexture>;
  input parameter bounds_ :: <GrapheneRect>;
  result res :: <GskTextureNode>;
  c-name: "gsk_texture_node_new";
end;

define inline-only C-function gsk-texture-node-get-texture
  input parameter self :: <GskTextureNode>;
  result res :: <GdkTexture>;
  c-name: "gsk_texture_node_get_texture";
end;

define C-struct <_GskTransform>
  pointer-type-name: <GskTransform>;
end C-struct;

define sealed domain make (singleton(<GskTransform>));
define sealed domain initialize (<GskTransform>);

define inline-only C-function gsk-transform-new
  result res :: <GskTransform>;
  c-name: "gsk_transform_new";
end;

define inline-only C-function gsk-transform-equal
  input parameter self :: <GskTransform>;
  input parameter second_ :: <GskTransform>;
  result res :: <C-boolean>;
  c-name: "gsk_transform_equal";
end;

define inline-only C-function gsk-transform-get-category
  input parameter self :: <GskTransform>;
  result res :: <GskTransformCategory>;
  c-name: "gsk_transform_get_category";
end;

define inline-only C-function gsk-transform-invert
  input parameter self :: <GskTransform>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_invert";
end;

define inline-only C-function gsk-transform-matrix
  input parameter self :: <GskTransform>;
  input parameter matrix_ :: <GrapheneMatrix>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_matrix";
end;

define inline-only C-function gsk-transform-perspective
  input parameter self :: <GskTransform>;
  input parameter depth_ :: <C-float>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_perspective";
end;

define inline-only C-function gsk-transform-print
  input parameter self :: <GskTransform>;
  input parameter string_ :: <GString>;
  c-name: "gsk_transform_print";
end;

define inline-only C-function gsk-transform-ref
  input parameter self :: <GskTransform>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_ref";
end;

define inline-only C-function gsk-transform-rotate
  input parameter self :: <GskTransform>;
  input parameter angle_ :: <C-float>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_rotate";
end;

define inline-only C-function gsk-transform-rotate-3d
  input parameter self :: <GskTransform>;
  input parameter angle_ :: <C-float>;
  input parameter axis_ :: <GrapheneVec3>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_rotate_3d";
end;

define inline-only C-function gsk-transform-scale
  input parameter self :: <GskTransform>;
  input parameter factor_x_ :: <C-float>;
  input parameter factor_y_ :: <C-float>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_scale";
end;

define inline-only C-function gsk-transform-scale-3d
  input parameter self :: <GskTransform>;
  input parameter factor_x_ :: <C-float>;
  input parameter factor_y_ :: <C-float>;
  input parameter factor_z_ :: <C-float>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_scale_3d";
end;

define inline-only C-function gsk-transform-skew
  input parameter self :: <GskTransform>;
  input parameter skew_x_ :: <C-float>;
  input parameter skew_y_ :: <C-float>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_skew";
end;

define inline-only C-function gsk-transform-to-2d
  input parameter self :: <GskTransform>;
  output parameter out_xx_ :: <C-float*>;
  output parameter out_yx_ :: <C-float*>;
  output parameter out_xy_ :: <C-float*>;
  output parameter out_yy_ :: <C-float*>;
  output parameter out_dx_ :: <C-float*>;
  output parameter out_dy_ :: <C-float*>;
  c-name: "gsk_transform_to_2d";
end;

define inline-only C-function gsk-transform-to-2d-components
  input parameter self :: <GskTransform>;
  output parameter out_skew_x_ :: <C-float*>;
  output parameter out_skew_y_ :: <C-float*>;
  output parameter out_scale_x_ :: <C-float*>;
  output parameter out_scale_y_ :: <C-float*>;
  output parameter out_angle_ :: <C-float*>;
  output parameter out_dx_ :: <C-float*>;
  output parameter out_dy_ :: <C-float*>;
  c-name: "gsk_transform_to_2d_components";
end;

define inline-only C-function gsk-transform-to-affine
  input parameter self :: <GskTransform>;
  output parameter out_scale_x_ :: <C-float*>;
  output parameter out_scale_y_ :: <C-float*>;
  output parameter out_dx_ :: <C-float*>;
  output parameter out_dy_ :: <C-float*>;
  c-name: "gsk_transform_to_affine";
end;

define inline-only C-function gsk-transform-to-matrix
  input parameter self :: <GskTransform>;
  input parameter out_matrix_ :: <GrapheneMatrix>;
  c-name: "gsk_transform_to_matrix";
end;

define inline-only C-function gsk-transform-to-string
  input parameter self :: <GskTransform>;
  result res :: <C-string>;
  c-name: "gsk_transform_to_string";
end;

define inline-only C-function gsk-transform-to-translate
  input parameter self :: <GskTransform>;
  output parameter out_dx_ :: <C-float*>;
  output parameter out_dy_ :: <C-float*>;
  c-name: "gsk_transform_to_translate";
end;

define inline-only C-function gsk-transform-transform
  input parameter self :: <GskTransform>;
  input parameter other_ :: <GskTransform>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_transform";
end;

define inline-only C-function gsk-transform-transform-bounds
  input parameter self :: <GskTransform>;
  input parameter rect_ :: <GrapheneRect>;
  input parameter out_rect_ :: <GrapheneRect>;
  c-name: "gsk_transform_transform_bounds";
end;

define inline-only C-function gsk-transform-transform-point
  input parameter self :: <GskTransform>;
  input parameter point_ :: <GraphenePoint>;
  input parameter out_point_ :: <GraphenePoint>;
  c-name: "gsk_transform_transform_point";
end;

define inline-only C-function gsk-transform-translate
  input parameter self :: <GskTransform>;
  input parameter point_ :: <GraphenePoint>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_translate";
end;

define inline-only C-function gsk-transform-translate-3d
  input parameter self :: <GskTransform>;
  input parameter point_ :: <GraphenePoint3D>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_translate_3d";
end;

define inline-only C-function gsk-transform-unref
  input parameter self :: <GskTransform>;
  c-name: "gsk_transform_unref";
end;

define inline-only C-function gsk-transform-parse
  input parameter string_ :: <C-string>;
  input parameter out_transform_ :: <GskTransform>;
  result res :: <C-boolean>;
  c-name: "gsk_transform_parse";
end;

define inline-only constant $gsk-transform-category-unknown = 0;
define inline-only constant $gsk-transform-category-any = 1;
define inline-only constant $gsk-transform-category-3d = 2;
define inline-only constant $gsk-transform-category-2d = 3;
define inline-only constant $gsk-transform-category-2d-affine = 4;
define inline-only constant $gsk-transform-category-2d-translate = 5;
define inline-only constant $gsk-transform-category-identity = 6;
define constant <GskTransformCategory> = <C-int>;
define C-pointer-type <GskTransformCategory*> => <GskTransformCategory>;

define open C-subtype <GskTransformNode> (<GskRenderNode>)
end C-subtype;

define C-pointer-type <GskTransformNode*> => <GskTransformNode>;

define sealed domain make (singleton(<GskTransformNode*>));
define sealed domain initialize (<GskTransformNode*>);

define inline-only C-function gsk-transform-node-new
  input parameter child_ :: <GskRenderNode>;
  input parameter transform_ :: <GskTransform>;
  result res :: <GskTransformNode>;
  c-name: "gsk_transform_node_new";
end;

define inline-only C-function gsk-transform-node-get-child
  input parameter self :: <GskTransformNode>;
  result res :: <GskRenderNode>;
  c-name: "gsk_transform_node_get_child";
end;

define inline-only C-function gsk-transform-node-get-transform
  input parameter self :: <GskTransformNode>;
  result res :: <GskTransform>;
  c-name: "gsk_transform_node_get_transform";
end;

define inline-only C-function gsk-serialization-error-quark
  result res :: <C-unsigned-int>;
  c-name: "gsk_serialization_error_quark";
end;

define inline-only C-function gsk-value-dup-render-node
  input parameter value_ :: <GValue>;
  result res :: <GskRenderNode>;
  c-name: "gsk_value_dup_render_node";
end;

define inline-only C-function gsk-value-get-render-node
  input parameter value_ :: <GValue>;
  result res :: <GskRenderNode>;
  c-name: "gsk_value_get_render_node";
end;

define inline-only C-function gsk-value-set-render-node
  input parameter value_ :: <GValue>;
  input parameter node_ :: <GskRenderNode>;
  c-name: "gsk_value_set_render_node";
end;

define inline-only C-function gsk-value-take-render-node
  input parameter value_ :: <GValue>;
  input parameter node_ :: <GskRenderNode>;
  c-name: "gsk_value_take_render_node";
end;

