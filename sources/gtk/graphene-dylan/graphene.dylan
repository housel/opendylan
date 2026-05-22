module: graphene
synopsis: generated bindings for the Graphene library
copyright: See LICENSE file in this distribution.


define C-pointer-type <C-void**> => <C-void*>;
ignore(<C-void**>);

define C-pointer-type <GError*> => <GError>;
ignore(<GError*>);

define C-struct <_GrapheneBox>
  constant sealed inline-only slot graphene-box-min :: <GrapheneVec3>;
  constant sealed inline-only slot graphene-box-max :: <GrapheneVec3>;
  pointer-type-name: <GrapheneBox>;
end C-struct;

define sealed domain make (singleton(<GrapheneBox>));
define sealed domain initialize (<GrapheneBox>);

define inline-only C-function graphene-box-alloc
  result res :: <GrapheneBox>;
  c-name: "graphene_box_alloc";
end;

define inline-only C-function graphene-box-contains-box
  input parameter self :: <GrapheneBox>;
  input parameter b_ :: <GrapheneBox>;
  result res :: <C-boolean>;
  c-name: "graphene_box_contains_box";
end;

define inline-only C-function graphene-box-contains-point
  input parameter self :: <GrapheneBox>;
  input parameter point_ :: <GraphenePoint3D>;
  result res :: <C-boolean>;
  c-name: "graphene_box_contains_point";
end;

define inline-only C-function graphene-box-equal
  input parameter self :: <GrapheneBox>;
  input parameter b_ :: <GrapheneBox>;
  result res :: <C-boolean>;
  c-name: "graphene_box_equal";
end;

define inline-only C-function graphene-box-expand
  input parameter self :: <GrapheneBox>;
  input parameter point_ :: <GraphenePoint3D>;
  input parameter res_ :: <GrapheneBox>;
  c-name: "graphene_box_expand";
end;

define inline-only C-function graphene-box-expand-scalar
  input parameter self :: <GrapheneBox>;
  input parameter scalar_ :: <C-float>;
  input parameter res_ :: <GrapheneBox>;
  c-name: "graphene_box_expand_scalar";
end;

define inline-only C-function graphene-box-expand-vec3
  input parameter self :: <GrapheneBox>;
  input parameter vec_ :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneBox>;
  c-name: "graphene_box_expand_vec3";
end;

define inline-only C-function graphene-box-free
  input parameter self :: <GrapheneBox>;
  c-name: "graphene_box_free";
end;

define inline-only C-function graphene-box-get-bounding-sphere
  input parameter self :: <GrapheneBox>;
  input parameter sphere_ :: <GrapheneSphere>;
  c-name: "graphene_box_get_bounding_sphere";
end;

define inline-only C-function graphene-box-get-center
  input parameter self :: <GrapheneBox>;
  input parameter center_ :: <GraphenePoint3D>;
  c-name: "graphene_box_get_center";
end;

define inline-only C-function graphene-box-get-depth
  input parameter self :: <GrapheneBox>;
  result res :: <C-float>;
  c-name: "graphene_box_get_depth";
end;

define inline-only C-function graphene-box-get-height
  input parameter self :: <GrapheneBox>;
  result res :: <C-float>;
  c-name: "graphene_box_get_height";
end;

define inline-only C-function graphene-box-get-max
  input parameter self :: <GrapheneBox>;
  input parameter max_ :: <GraphenePoint3D>;
  c-name: "graphene_box_get_max";
end;

define inline-only C-function graphene-box-get-min
  input parameter self :: <GrapheneBox>;
  input parameter min_ :: <GraphenePoint3D>;
  c-name: "graphene_box_get_min";
end;

define inline-only C-function graphene-box-get-size
  input parameter self :: <GrapheneBox>;
  input parameter size_ :: <GrapheneVec3>;
  c-name: "graphene_box_get_size";
end;

define inline-only C-function graphene-box-get-vertices
  input parameter self :: <GrapheneBox>;
  output parameter vertices_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "graphene_box_get_vertices";
end;

define inline-only C-function graphene-box-get-width
  input parameter self :: <GrapheneBox>;
  result res :: <C-float>;
  c-name: "graphene_box_get_width";
end;

define inline-only C-function graphene-box-init
  input parameter self :: <GrapheneBox>;
  input parameter min_ :: <GraphenePoint3D>;
  input parameter max_ :: <GraphenePoint3D>;
  result res :: <GrapheneBox>;
  c-name: "graphene_box_init";
end;

define inline-only C-function graphene-box-init-from-box
  input parameter self :: <GrapheneBox>;
  input parameter src_ :: <GrapheneBox>;
  result res :: <GrapheneBox>;
  c-name: "graphene_box_init_from_box";
end;

define inline-only C-function graphene-box-init-from-points
  input parameter self :: <GrapheneBox>;
  input parameter n_points_ :: <C-unsigned-int>;
  input parameter points_ :: <C-unsigned-char*> /* Not supported */;
  result res :: <GrapheneBox>;
  c-name: "graphene_box_init_from_points";
end;

define inline-only C-function graphene-box-init-from-vec3
  input parameter self :: <GrapheneBox>;
  input parameter min_ :: <GrapheneVec3>;
  input parameter max_ :: <GrapheneVec3>;
  result res :: <GrapheneBox>;
  c-name: "graphene_box_init_from_vec3";
end;

define inline-only C-function graphene-box-init-from-vectors
  input parameter self :: <GrapheneBox>;
  input parameter n_vectors_ :: <C-unsigned-int>;
  input parameter vectors_ :: <C-unsigned-char*> /* Not supported */;
  result res :: <GrapheneBox>;
  c-name: "graphene_box_init_from_vectors";
end;

define inline-only C-function graphene-box-intersection
  input parameter self :: <GrapheneBox>;
  input parameter b_ :: <GrapheneBox>;
  input parameter res_ :: <GrapheneBox>;
  result res :: <C-boolean>;
  c-name: "graphene_box_intersection";
end;

define inline-only C-function graphene-box-union
  input parameter self :: <GrapheneBox>;
  input parameter b_ :: <GrapheneBox>;
  input parameter res_ :: <GrapheneBox>;
  c-name: "graphene_box_union";
end;

define inline-only C-function graphene-box-empty
  result res :: <GrapheneBox>;
  c-name: "graphene_box_empty";
end;

define inline-only C-function graphene-box-infinite
  result res :: <GrapheneBox>;
  c-name: "graphene_box_infinite";
end;

define inline-only C-function graphene-box-minus-one
  result res :: <GrapheneBox>;
  c-name: "graphene_box_minus_one";
end;

define inline-only C-function graphene-box-one
  result res :: <GrapheneBox>;
  c-name: "graphene_box_one";
end;

define inline-only C-function graphene-box-one-minus-one
  result res :: <GrapheneBox>;
  c-name: "graphene_box_one_minus_one";
end;

define inline-only C-function graphene-box-zero
  result res :: <GrapheneBox>;
  c-name: "graphene_box_zero";
end;

define C-struct <_GrapheneEuler>
  constant sealed inline-only slot graphene-euler-angles :: <GrapheneVec3>;
  constant sealed inline-only slot graphene-euler-order :: <GrapheneEulerOrder>;
  pointer-type-name: <GrapheneEuler>;
end C-struct;

define sealed domain make (singleton(<GrapheneEuler>));
define sealed domain initialize (<GrapheneEuler>);

define inline-only C-function graphene-euler-alloc
  result res :: <GrapheneEuler>;
  c-name: "graphene_euler_alloc";
end;

define inline-only C-function graphene-euler-equal
  input parameter self :: <GrapheneEuler>;
  input parameter b_ :: <GrapheneEuler>;
  result res :: <C-boolean>;
  c-name: "graphene_euler_equal";
end;

define inline-only C-function graphene-euler-free
  input parameter self :: <GrapheneEuler>;
  c-name: "graphene_euler_free";
end;

define inline-only C-function graphene-euler-get-alpha
  input parameter self :: <GrapheneEuler>;
  result res :: <C-float>;
  c-name: "graphene_euler_get_alpha";
end;

define inline-only C-function graphene-euler-get-beta
  input parameter self :: <GrapheneEuler>;
  result res :: <C-float>;
  c-name: "graphene_euler_get_beta";
end;

define inline-only C-function graphene-euler-get-gamma
  input parameter self :: <GrapheneEuler>;
  result res :: <C-float>;
  c-name: "graphene_euler_get_gamma";
end;

define inline-only C-function graphene-euler-get-order
  input parameter self :: <GrapheneEuler>;
  result res :: <GrapheneEulerOrder>;
  c-name: "graphene_euler_get_order";
end;

define inline-only C-function graphene-euler-get-x
  input parameter self :: <GrapheneEuler>;
  result res :: <C-float>;
  c-name: "graphene_euler_get_x";
end;

define inline-only C-function graphene-euler-get-y
  input parameter self :: <GrapheneEuler>;
  result res :: <C-float>;
  c-name: "graphene_euler_get_y";
end;

define inline-only C-function graphene-euler-get-z
  input parameter self :: <GrapheneEuler>;
  result res :: <C-float>;
  c-name: "graphene_euler_get_z";
end;

define inline-only C-function graphene-euler-init
  input parameter self :: <GrapheneEuler>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  input parameter z_ :: <C-float>;
  result res :: <GrapheneEuler>;
  c-name: "graphene_euler_init";
end;

define inline-only C-function graphene-euler-init-from-euler
  input parameter self :: <GrapheneEuler>;
  input parameter src_ :: <GrapheneEuler>;
  result res :: <GrapheneEuler>;
  c-name: "graphene_euler_init_from_euler";
end;

define inline-only C-function graphene-euler-init-from-matrix
  input parameter self :: <GrapheneEuler>;
  input parameter m_ :: <GrapheneMatrix>;
  input parameter order_ :: <GrapheneEulerOrder>;
  result res :: <GrapheneEuler>;
  c-name: "graphene_euler_init_from_matrix";
end;

define inline-only C-function graphene-euler-init-from-quaternion
  input parameter self :: <GrapheneEuler>;
  input parameter q_ :: <GrapheneQuaternion>;
  input parameter order_ :: <GrapheneEulerOrder>;
  result res :: <GrapheneEuler>;
  c-name: "graphene_euler_init_from_quaternion";
end;

define inline-only C-function graphene-euler-init-from-radians
  input parameter self :: <GrapheneEuler>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  input parameter z_ :: <C-float>;
  input parameter order_ :: <GrapheneEulerOrder>;
  result res :: <GrapheneEuler>;
  c-name: "graphene_euler_init_from_radians";
end;

define inline-only C-function graphene-euler-init-from-vec3
  input parameter self :: <GrapheneEuler>;
  input parameter v_ :: <GrapheneVec3>;
  input parameter order_ :: <GrapheneEulerOrder>;
  result res :: <GrapheneEuler>;
  c-name: "graphene_euler_init_from_vec3";
end;

define inline-only C-function graphene-euler-init-with-order
  input parameter self :: <GrapheneEuler>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  input parameter z_ :: <C-float>;
  input parameter order_ :: <GrapheneEulerOrder>;
  result res :: <GrapheneEuler>;
  c-name: "graphene_euler_init_with_order";
end;

define inline-only C-function graphene-euler-reorder
  input parameter self :: <GrapheneEuler>;
  input parameter order_ :: <GrapheneEulerOrder>;
  input parameter res_ :: <GrapheneEuler>;
  c-name: "graphene_euler_reorder";
end;

define inline-only C-function graphene-euler-to-matrix
  input parameter self :: <GrapheneEuler>;
  input parameter res_ :: <GrapheneMatrix>;
  c-name: "graphene_euler_to_matrix";
end;

define inline-only C-function graphene-euler-to-quaternion
  input parameter self :: <GrapheneEuler>;
  input parameter res_ :: <GrapheneQuaternion>;
  c-name: "graphene_euler_to_quaternion";
end;

define inline-only C-function graphene-euler-to-vec3
  input parameter self :: <GrapheneEuler>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_euler_to_vec3";
end;

define inline-only constant $graphene-euler-order-default = -1;
define inline-only constant $graphene-euler-order-xyz = 0;
define inline-only constant $graphene-euler-order-yzx = 1;
define inline-only constant $graphene-euler-order-zxy = 2;
define inline-only constant $graphene-euler-order-xzy = 3;
define inline-only constant $graphene-euler-order-yxz = 4;
define inline-only constant $graphene-euler-order-zyx = 5;
define inline-only constant $graphene-euler-order-sxyz = 6;
define inline-only constant $graphene-euler-order-sxyx = 7;
define inline-only constant $graphene-euler-order-sxzy = 8;
define inline-only constant $graphene-euler-order-sxzx = 9;
define inline-only constant $graphene-euler-order-syzx = 10;
define inline-only constant $graphene-euler-order-syzy = 11;
define inline-only constant $graphene-euler-order-syxz = 12;
define inline-only constant $graphene-euler-order-syxy = 13;
define inline-only constant $graphene-euler-order-szxy = 14;
define inline-only constant $graphene-euler-order-szxz = 15;
define inline-only constant $graphene-euler-order-szyx = 16;
define inline-only constant $graphene-euler-order-szyz = 17;
define inline-only constant $graphene-euler-order-rzyx = 18;
define inline-only constant $graphene-euler-order-rxyx = 19;
define inline-only constant $graphene-euler-order-ryzx = 20;
define inline-only constant $graphene-euler-order-rxzx = 21;
define inline-only constant $graphene-euler-order-rxzy = 22;
define inline-only constant $graphene-euler-order-ryzy = 23;
define inline-only constant $graphene-euler-order-rzxy = 24;
define inline-only constant $graphene-euler-order-ryxy = 25;
define inline-only constant $graphene-euler-order-ryxz = 26;
define inline-only constant $graphene-euler-order-rzxz = 27;
define inline-only constant $graphene-euler-order-rxyz = 28;
define inline-only constant $graphene-euler-order-rzyz = 29;
define constant <GrapheneEulerOrder> = <C-int>;
define C-pointer-type <GrapheneEulerOrder*> => <GrapheneEulerOrder>;

define C-struct <_GrapheneFrustum>
  constant sealed inline-only slot graphene-frustum-planes :: <C-unsigned-char*> /* Not supported */;
  pointer-type-name: <GrapheneFrustum>;
end C-struct;

define sealed domain make (singleton(<GrapheneFrustum>));
define sealed domain initialize (<GrapheneFrustum>);

define inline-only C-function graphene-frustum-alloc
  result res :: <GrapheneFrustum>;
  c-name: "graphene_frustum_alloc";
end;

define inline-only C-function graphene-frustum-contains-point
  input parameter self :: <GrapheneFrustum>;
  input parameter point_ :: <GraphenePoint3D>;
  result res :: <C-boolean>;
  c-name: "graphene_frustum_contains_point";
end;

define inline-only C-function graphene-frustum-equal
  input parameter self :: <GrapheneFrustum>;
  input parameter b_ :: <GrapheneFrustum>;
  result res :: <C-boolean>;
  c-name: "graphene_frustum_equal";
end;

define inline-only C-function graphene-frustum-free
  input parameter self :: <GrapheneFrustum>;
  c-name: "graphene_frustum_free";
end;

define inline-only C-function graphene-frustum-get-planes
  input parameter self :: <GrapheneFrustum>;
  output parameter planes_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "graphene_frustum_get_planes";
end;

define inline-only C-function graphene-frustum-init
  input parameter self :: <GrapheneFrustum>;
  input parameter p0_ :: <GraphenePlane>;
  input parameter p1_ :: <GraphenePlane>;
  input parameter p2_ :: <GraphenePlane>;
  input parameter p3_ :: <GraphenePlane>;
  input parameter p4_ :: <GraphenePlane>;
  input parameter p5_ :: <GraphenePlane>;
  result res :: <GrapheneFrustum>;
  c-name: "graphene_frustum_init";
end;

define inline-only C-function graphene-frustum-init-from-frustum
  input parameter self :: <GrapheneFrustum>;
  input parameter src_ :: <GrapheneFrustum>;
  result res :: <GrapheneFrustum>;
  c-name: "graphene_frustum_init_from_frustum";
end;

define inline-only C-function graphene-frustum-init-from-matrix
  input parameter self :: <GrapheneFrustum>;
  input parameter matrix_ :: <GrapheneMatrix>;
  result res :: <GrapheneFrustum>;
  c-name: "graphene_frustum_init_from_matrix";
end;

define inline-only C-function graphene-frustum-intersects-box
  input parameter self :: <GrapheneFrustum>;
  input parameter box_ :: <GrapheneBox>;
  result res :: <C-boolean>;
  c-name: "graphene_frustum_intersects_box";
end;

define inline-only C-function graphene-frustum-intersects-sphere
  input parameter self :: <GrapheneFrustum>;
  input parameter sphere_ :: <GrapheneSphere>;
  result res :: <C-boolean>;
  c-name: "graphene_frustum_intersects_sphere";
end;

define C-struct <_GrapheneMatrix>
  constant sealed inline-only slot graphene-matrix-value :: <GrapheneSimd4X4F>;
  pointer-type-name: <GrapheneMatrix>;
end C-struct;

define sealed domain make (singleton(<GrapheneMatrix>));
define sealed domain initialize (<GrapheneMatrix>);

define inline-only C-function graphene-matrix-alloc
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_alloc";
end;

define inline-only C-function graphene-matrix-decompose
  input parameter self :: <GrapheneMatrix>;
  input parameter translate_ :: <GrapheneVec3>;
  input parameter scale_ :: <GrapheneVec3>;
  input parameter rotate_ :: <GrapheneQuaternion>;
  input parameter shear_ :: <GrapheneVec3>;
  input parameter perspective_ :: <GrapheneVec4>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_decompose";
end;

define inline-only C-function graphene-matrix-determinant
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-float>;
  c-name: "graphene_matrix_determinant";
end;

define inline-only C-function graphene-matrix-equal
  input parameter self :: <GrapheneMatrix>;
  input parameter b_ :: <GrapheneMatrix>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_equal";
end;

define inline-only C-function graphene-matrix-equal-fast
  input parameter self :: <GrapheneMatrix>;
  input parameter b_ :: <GrapheneMatrix>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_equal_fast";
end;

define inline-only C-function graphene-matrix-free
  input parameter self :: <GrapheneMatrix>;
  c-name: "graphene_matrix_free";
end;

define inline-only C-function graphene-matrix-get-row
  input parameter self :: <GrapheneMatrix>;
  input parameter index__ :: <C-unsigned-int>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_matrix_get_row";
end;

define inline-only C-function graphene-matrix-get-value
  input parameter self :: <GrapheneMatrix>;
  input parameter row_ :: <C-unsigned-int>;
  input parameter col_ :: <C-unsigned-int>;
  result res :: <C-float>;
  c-name: "graphene_matrix_get_value";
end;

define inline-only C-function graphene-matrix-get-x-scale
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-float>;
  c-name: "graphene_matrix_get_x_scale";
end;

define inline-only C-function graphene-matrix-get-x-translation
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-float>;
  c-name: "graphene_matrix_get_x_translation";
end;

define inline-only C-function graphene-matrix-get-y-scale
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-float>;
  c-name: "graphene_matrix_get_y_scale";
end;

define inline-only C-function graphene-matrix-get-y-translation
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-float>;
  c-name: "graphene_matrix_get_y_translation";
end;

define inline-only C-function graphene-matrix-get-z-scale
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-float>;
  c-name: "graphene_matrix_get_z_scale";
end;

define inline-only C-function graphene-matrix-get-z-translation
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-float>;
  c-name: "graphene_matrix_get_z_translation";
end;

define inline-only C-function graphene-matrix-init-from-2d
  input parameter self :: <GrapheneMatrix>;
  input parameter xx_ :: <C-double>;
  input parameter yx_ :: <C-double>;
  input parameter xy_ :: <C-double>;
  input parameter yy_ :: <C-double>;
  input parameter x_0_ :: <C-double>;
  input parameter y_0_ :: <C-double>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_from_2d";
end;

define inline-only C-function graphene-matrix-init-from-float
  input parameter self :: <GrapheneMatrix>;
  input parameter v_ :: <C-float*>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_from_float";
end;

define inline-only C-function graphene-matrix-init-from-matrix
  input parameter self :: <GrapheneMatrix>;
  input parameter src_ :: <GrapheneMatrix>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_from_matrix";
end;

define inline-only C-function graphene-matrix-init-from-vec4
  input parameter self :: <GrapheneMatrix>;
  input parameter v0_ :: <GrapheneVec4>;
  input parameter v1_ :: <GrapheneVec4>;
  input parameter v2_ :: <GrapheneVec4>;
  input parameter v3_ :: <GrapheneVec4>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_from_vec4";
end;

define inline-only C-function graphene-matrix-init-frustum
  input parameter self :: <GrapheneMatrix>;
  input parameter left_ :: <C-float>;
  input parameter right_ :: <C-float>;
  input parameter bottom_ :: <C-float>;
  input parameter top_ :: <C-float>;
  input parameter z_near_ :: <C-float>;
  input parameter z_far_ :: <C-float>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_frustum";
end;

define inline-only C-function graphene-matrix-init-identity
  input parameter self :: <GrapheneMatrix>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_identity";
end;

define inline-only C-function graphene-matrix-init-look-at
  input parameter self :: <GrapheneMatrix>;
  input parameter eye_ :: <GrapheneVec3>;
  input parameter center_ :: <GrapheneVec3>;
  input parameter up_ :: <GrapheneVec3>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_look_at";
end;

define inline-only C-function graphene-matrix-init-ortho
  input parameter self :: <GrapheneMatrix>;
  input parameter left_ :: <C-float>;
  input parameter right_ :: <C-float>;
  input parameter top_ :: <C-float>;
  input parameter bottom_ :: <C-float>;
  input parameter z_near_ :: <C-float>;
  input parameter z_far_ :: <C-float>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_ortho";
end;

define inline-only C-function graphene-matrix-init-perspective
  input parameter self :: <GrapheneMatrix>;
  input parameter fovy_ :: <C-float>;
  input parameter aspect_ :: <C-float>;
  input parameter z_near_ :: <C-float>;
  input parameter z_far_ :: <C-float>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_perspective";
end;

define inline-only C-function graphene-matrix-init-rotate
  input parameter self :: <GrapheneMatrix>;
  input parameter angle_ :: <C-float>;
  input parameter axis_ :: <GrapheneVec3>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_rotate";
end;

define inline-only C-function graphene-matrix-init-scale
  input parameter self :: <GrapheneMatrix>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  input parameter z_ :: <C-float>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_scale";
end;

define inline-only C-function graphene-matrix-init-skew
  input parameter self :: <GrapheneMatrix>;
  input parameter x_skew_ :: <C-float>;
  input parameter y_skew_ :: <C-float>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_skew";
end;

define inline-only C-function graphene-matrix-init-translate
  input parameter self :: <GrapheneMatrix>;
  input parameter p_ :: <GraphenePoint3D>;
  result res :: <GrapheneMatrix>;
  c-name: "graphene_matrix_init_translate";
end;

define inline-only C-function graphene-matrix-interpolate
  input parameter self :: <GrapheneMatrix>;
  input parameter b_ :: <GrapheneMatrix>;
  input parameter factor_ :: <C-double>;
  input parameter res_ :: <GrapheneMatrix>;
  c-name: "graphene_matrix_interpolate";
end;

define inline-only C-function graphene-matrix-inverse
  input parameter self :: <GrapheneMatrix>;
  input parameter res_ :: <GrapheneMatrix>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_inverse";
end;

define inline-only C-function graphene-matrix-is-2d
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_is_2d";
end;

define inline-only C-function graphene-matrix-is-backface-visible
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_is_backface_visible";
end;

define inline-only C-function graphene-matrix-is-identity
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_is_identity";
end;

define inline-only C-function graphene-matrix-is-singular
  input parameter self :: <GrapheneMatrix>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_is_singular";
end;

define inline-only C-function graphene-matrix-multiply
  input parameter self :: <GrapheneMatrix>;
  input parameter b_ :: <GrapheneMatrix>;
  input parameter res_ :: <GrapheneMatrix>;
  c-name: "graphene_matrix_multiply";
end;

define inline-only C-function graphene-matrix-near
  input parameter self :: <GrapheneMatrix>;
  input parameter b_ :: <GrapheneMatrix>;
  input parameter epsilon_ :: <C-float>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_near";
end;

define inline-only C-function graphene-matrix-normalize
  input parameter self :: <GrapheneMatrix>;
  input parameter res_ :: <GrapheneMatrix>;
  c-name: "graphene_matrix_normalize";
end;

define inline-only C-function graphene-matrix-perspective
  input parameter self :: <GrapheneMatrix>;
  input parameter depth_ :: <C-float>;
  input parameter res_ :: <GrapheneMatrix>;
  c-name: "graphene_matrix_perspective";
end;

define inline-only C-function graphene-matrix-print
  input parameter self :: <GrapheneMatrix>;
  c-name: "graphene_matrix_print";
end;

define inline-only C-function graphene-matrix-project-point
  input parameter self :: <GrapheneMatrix>;
  input parameter p_ :: <GraphenePoint>;
  input parameter res_ :: <GraphenePoint>;
  c-name: "graphene_matrix_project_point";
end;

define inline-only C-function graphene-matrix-project-rect
  input parameter self :: <GrapheneMatrix>;
  input parameter r_ :: <GrapheneRect>;
  input parameter res_ :: <GrapheneQuad>;
  c-name: "graphene_matrix_project_rect";
end;

define inline-only C-function graphene-matrix-project-rect-bounds
  input parameter self :: <GrapheneMatrix>;
  input parameter r_ :: <GrapheneRect>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_matrix_project_rect_bounds";
end;

define inline-only C-function graphene-matrix-rotate
  input parameter self :: <GrapheneMatrix>;
  input parameter angle_ :: <C-float>;
  input parameter axis_ :: <GrapheneVec3>;
  c-name: "graphene_matrix_rotate";
end;

define inline-only C-function graphene-matrix-rotate-euler
  input parameter self :: <GrapheneMatrix>;
  input parameter e_ :: <GrapheneEuler>;
  c-name: "graphene_matrix_rotate_euler";
end;

define inline-only C-function graphene-matrix-rotate-quaternion
  input parameter self :: <GrapheneMatrix>;
  input parameter q_ :: <GrapheneQuaternion>;
  c-name: "graphene_matrix_rotate_quaternion";
end;

define inline-only C-function graphene-matrix-rotate-x
  input parameter self :: <GrapheneMatrix>;
  input parameter angle_ :: <C-float>;
  c-name: "graphene_matrix_rotate_x";
end;

define inline-only C-function graphene-matrix-rotate-y
  input parameter self :: <GrapheneMatrix>;
  input parameter angle_ :: <C-float>;
  c-name: "graphene_matrix_rotate_y";
end;

define inline-only C-function graphene-matrix-rotate-z
  input parameter self :: <GrapheneMatrix>;
  input parameter angle_ :: <C-float>;
  c-name: "graphene_matrix_rotate_z";
end;

define inline-only C-function graphene-matrix-scale
  input parameter self :: <GrapheneMatrix>;
  input parameter factor_x_ :: <C-float>;
  input parameter factor_y_ :: <C-float>;
  input parameter factor_z_ :: <C-float>;
  c-name: "graphene_matrix_scale";
end;

define inline-only C-function graphene-matrix-skew-xy
  input parameter self :: <GrapheneMatrix>;
  input parameter factor_ :: <C-float>;
  c-name: "graphene_matrix_skew_xy";
end;

define inline-only C-function graphene-matrix-skew-xz
  input parameter self :: <GrapheneMatrix>;
  input parameter factor_ :: <C-float>;
  c-name: "graphene_matrix_skew_xz";
end;

define inline-only C-function graphene-matrix-skew-yz
  input parameter self :: <GrapheneMatrix>;
  input parameter factor_ :: <C-float>;
  c-name: "graphene_matrix_skew_yz";
end;

define inline-only C-function graphene-matrix-to-2d
  input parameter self :: <GrapheneMatrix>;
  output parameter xx_ :: <C-double*>;
  output parameter yx_ :: <C-double*>;
  output parameter xy_ :: <C-double*>;
  output parameter yy_ :: <C-double*>;
  output parameter x_0_ :: <C-double*>;
  output parameter y_0_ :: <C-double*>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_to_2d";
end;

define inline-only C-function graphene-matrix-to-float
  input parameter self :: <GrapheneMatrix>;
  output parameter v_ :: <C-float*>;
  c-name: "graphene_matrix_to_float";
end;

define inline-only C-function graphene-matrix-transform-bounds
  input parameter self :: <GrapheneMatrix>;
  input parameter r_ :: <GrapheneRect>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_matrix_transform_bounds";
end;

define inline-only C-function graphene-matrix-transform-box
  input parameter self :: <GrapheneMatrix>;
  input parameter b_ :: <GrapheneBox>;
  input parameter res_ :: <GrapheneBox>;
  c-name: "graphene_matrix_transform_box";
end;

define inline-only C-function graphene-matrix-transform-point
  input parameter self :: <GrapheneMatrix>;
  input parameter p_ :: <GraphenePoint>;
  input parameter res_ :: <GraphenePoint>;
  c-name: "graphene_matrix_transform_point";
end;

define inline-only C-function graphene-matrix-transform-point3d
  input parameter self :: <GrapheneMatrix>;
  input parameter p_ :: <GraphenePoint3D>;
  input parameter res_ :: <GraphenePoint3D>;
  c-name: "graphene_matrix_transform_point3d";
end;

define inline-only C-function graphene-matrix-transform-ray
  input parameter self :: <GrapheneMatrix>;
  input parameter r_ :: <GrapheneRay>;
  input parameter res_ :: <GrapheneRay>;
  c-name: "graphene_matrix_transform_ray";
end;

define inline-only C-function graphene-matrix-transform-rect
  input parameter self :: <GrapheneMatrix>;
  input parameter r_ :: <GrapheneRect>;
  input parameter res_ :: <GrapheneQuad>;
  c-name: "graphene_matrix_transform_rect";
end;

define inline-only C-function graphene-matrix-transform-sphere
  input parameter self :: <GrapheneMatrix>;
  input parameter s_ :: <GrapheneSphere>;
  input parameter res_ :: <GrapheneSphere>;
  c-name: "graphene_matrix_transform_sphere";
end;

define inline-only C-function graphene-matrix-transform-vec3
  input parameter self :: <GrapheneMatrix>;
  input parameter v_ :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_matrix_transform_vec3";
end;

define inline-only C-function graphene-matrix-transform-vec4
  input parameter self :: <GrapheneMatrix>;
  input parameter v_ :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_matrix_transform_vec4";
end;

define inline-only C-function graphene-matrix-translate
  input parameter self :: <GrapheneMatrix>;
  input parameter pos_ :: <GraphenePoint3D>;
  c-name: "graphene_matrix_translate";
end;

define inline-only C-function graphene-matrix-transpose
  input parameter self :: <GrapheneMatrix>;
  input parameter res_ :: <GrapheneMatrix>;
  c-name: "graphene_matrix_transpose";
end;

define inline-only C-function graphene-matrix-unproject-point3d
  input parameter self :: <GrapheneMatrix>;
  input parameter modelview_ :: <GrapheneMatrix>;
  input parameter point_ :: <GraphenePoint3D>;
  input parameter res_ :: <GraphenePoint3D>;
  c-name: "graphene_matrix_unproject_point3d";
end;

define inline-only C-function graphene-matrix-untransform-bounds
  input parameter self :: <GrapheneMatrix>;
  input parameter r_ :: <GrapheneRect>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_matrix_untransform_bounds";
end;

define inline-only C-function graphene-matrix-untransform-point
  input parameter self :: <GrapheneMatrix>;
  input parameter p_ :: <GraphenePoint>;
  input parameter bounds_ :: <GrapheneRect>;
  input parameter res_ :: <GraphenePoint>;
  result res :: <C-boolean>;
  c-name: "graphene_matrix_untransform_point";
end;

define C-struct <_GraphenePlane>
  constant sealed inline-only slot graphene-plane-normal :: <GrapheneVec3>;
  constant sealed inline-only slot graphene-plane-constant :: <C-float>;
  pointer-type-name: <GraphenePlane>;
end C-struct;

define sealed domain make (singleton(<GraphenePlane>));
define sealed domain initialize (<GraphenePlane>);

define inline-only C-function graphene-plane-alloc
  result res :: <GraphenePlane>;
  c-name: "graphene_plane_alloc";
end;

define inline-only C-function graphene-plane-distance
  input parameter self :: <GraphenePlane>;
  input parameter point_ :: <GraphenePoint3D>;
  result res :: <C-float>;
  c-name: "graphene_plane_distance";
end;

define inline-only C-function graphene-plane-equal
  input parameter self :: <GraphenePlane>;
  input parameter b_ :: <GraphenePlane>;
  result res :: <C-boolean>;
  c-name: "graphene_plane_equal";
end;

define inline-only C-function graphene-plane-free
  input parameter self :: <GraphenePlane>;
  c-name: "graphene_plane_free";
end;

define inline-only C-function graphene-plane-get-constant
  input parameter self :: <GraphenePlane>;
  result res :: <C-float>;
  c-name: "graphene_plane_get_constant";
end;

define inline-only C-function graphene-plane-get-normal
  input parameter self :: <GraphenePlane>;
  input parameter normal_ :: <GrapheneVec3>;
  c-name: "graphene_plane_get_normal";
end;

define inline-only C-function graphene-plane-init
  input parameter self :: <GraphenePlane>;
  input parameter normal_ :: <GrapheneVec3>;
  input parameter constant_ :: <C-float>;
  result res :: <GraphenePlane>;
  c-name: "graphene_plane_init";
end;

define inline-only C-function graphene-plane-init-from-plane
  input parameter self :: <GraphenePlane>;
  input parameter src_ :: <GraphenePlane>;
  result res :: <GraphenePlane>;
  c-name: "graphene_plane_init_from_plane";
end;

define inline-only C-function graphene-plane-init-from-point
  input parameter self :: <GraphenePlane>;
  input parameter normal_ :: <GrapheneVec3>;
  input parameter point_ :: <GraphenePoint3D>;
  result res :: <GraphenePlane>;
  c-name: "graphene_plane_init_from_point";
end;

define inline-only C-function graphene-plane-init-from-points
  input parameter self :: <GraphenePlane>;
  input parameter a_ :: <GraphenePoint3D>;
  input parameter b_ :: <GraphenePoint3D>;
  input parameter c_ :: <GraphenePoint3D>;
  result res :: <GraphenePlane>;
  c-name: "graphene_plane_init_from_points";
end;

define inline-only C-function graphene-plane-init-from-vec4
  input parameter self :: <GraphenePlane>;
  input parameter src_ :: <GrapheneVec4>;
  result res :: <GraphenePlane>;
  c-name: "graphene_plane_init_from_vec4";
end;

define inline-only C-function graphene-plane-negate
  input parameter self :: <GraphenePlane>;
  input parameter res_ :: <GraphenePlane>;
  c-name: "graphene_plane_negate";
end;

define inline-only C-function graphene-plane-normalize
  input parameter self :: <GraphenePlane>;
  input parameter res_ :: <GraphenePlane>;
  c-name: "graphene_plane_normalize";
end;

define inline-only C-function graphene-plane-transform
  input parameter self :: <GraphenePlane>;
  input parameter matrix_ :: <GrapheneMatrix>;
  input parameter normal_matrix_ :: <GrapheneMatrix>;
  input parameter res_ :: <GraphenePlane>;
  c-name: "graphene_plane_transform";
end;

define C-struct <_GraphenePoint>
  sealed inline-only slot graphene-point-x :: <C-float>;
  sealed inline-only slot graphene-point-y :: <C-float>;
  pointer-type-name: <GraphenePoint>;
end C-struct;

define sealed domain make (singleton(<GraphenePoint>));
define sealed domain initialize (<GraphenePoint>);

define inline-only C-function graphene-point-alloc
  result res :: <GraphenePoint>;
  c-name: "graphene_point_alloc";
end;

define inline-only C-function graphene-point-distance
  input parameter self :: <GraphenePoint>;
  input parameter b_ :: <GraphenePoint>;
  output parameter d_x_ :: <C-float*>;
  output parameter d_y_ :: <C-float*>;
  result res :: <C-float>;
  c-name: "graphene_point_distance";
end;

define inline-only C-function graphene-point-equal
  input parameter self :: <GraphenePoint>;
  input parameter b_ :: <GraphenePoint>;
  result res :: <C-boolean>;
  c-name: "graphene_point_equal";
end;

define inline-only C-function graphene-point-free
  input parameter self :: <GraphenePoint>;
  c-name: "graphene_point_free";
end;

define inline-only C-function graphene-point-init
  input parameter self :: <GraphenePoint>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  result res :: <GraphenePoint>;
  c-name: "graphene_point_init";
end;

define inline-only C-function graphene-point-init-from-point
  input parameter self :: <GraphenePoint>;
  input parameter src_ :: <GraphenePoint>;
  result res :: <GraphenePoint>;
  c-name: "graphene_point_init_from_point";
end;

define inline-only C-function graphene-point-init-from-vec2
  input parameter self :: <GraphenePoint>;
  input parameter src_ :: <GrapheneVec2>;
  result res :: <GraphenePoint>;
  c-name: "graphene_point_init_from_vec2";
end;

define inline-only C-function graphene-point-interpolate
  input parameter self :: <GraphenePoint>;
  input parameter b_ :: <GraphenePoint>;
  input parameter factor_ :: <C-double>;
  input parameter res_ :: <GraphenePoint>;
  c-name: "graphene_point_interpolate";
end;

define inline-only C-function graphene-point-near
  input parameter self :: <GraphenePoint>;
  input parameter b_ :: <GraphenePoint>;
  input parameter epsilon_ :: <C-float>;
  result res :: <C-boolean>;
  c-name: "graphene_point_near";
end;

define inline-only C-function graphene-point-to-vec2
  input parameter self :: <GraphenePoint>;
  input parameter v_ :: <GrapheneVec2>;
  c-name: "graphene_point_to_vec2";
end;

define inline-only C-function graphene-point-zero
  result res :: <GraphenePoint>;
  c-name: "graphene_point_zero";
end;

define C-struct <_GraphenePoint3D>
  sealed inline-only slot graphene-point3d-x :: <C-float>;
  sealed inline-only slot graphene-point3d-y :: <C-float>;
  sealed inline-only slot graphene-point3d-z :: <C-float>;
  pointer-type-name: <GraphenePoint3D>;
end C-struct;

define sealed domain make (singleton(<GraphenePoint3D>));
define sealed domain initialize (<GraphenePoint3D>);

define inline-only C-function graphene-point3d-alloc
  result res :: <GraphenePoint3D>;
  c-name: "graphene_point3d_alloc";
end;

define inline-only C-function graphene-point3d-cross
  input parameter self :: <GraphenePoint3D>;
  input parameter b_ :: <GraphenePoint3D>;
  input parameter res_ :: <GraphenePoint3D>;
  c-name: "graphene_point3d_cross";
end;

define inline-only C-function graphene-point3d-distance
  input parameter self :: <GraphenePoint3D>;
  input parameter b_ :: <GraphenePoint3D>;
  input parameter delta_ :: <GrapheneVec3>;
  result res :: <C-float>;
  c-name: "graphene_point3d_distance";
end;

define inline-only C-function graphene-point3d-dot
  input parameter self :: <GraphenePoint3D>;
  input parameter b_ :: <GraphenePoint3D>;
  result res :: <C-float>;
  c-name: "graphene_point3d_dot";
end;

define inline-only C-function graphene-point3d-equal
  input parameter self :: <GraphenePoint3D>;
  input parameter b_ :: <GraphenePoint3D>;
  result res :: <C-boolean>;
  c-name: "graphene_point3d_equal";
end;

define inline-only C-function graphene-point3d-free
  input parameter self :: <GraphenePoint3D>;
  c-name: "graphene_point3d_free";
end;

define inline-only C-function graphene-point3d-init
  input parameter self :: <GraphenePoint3D>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  input parameter z_ :: <C-float>;
  result res :: <GraphenePoint3D>;
  c-name: "graphene_point3d_init";
end;

define inline-only C-function graphene-point3d-init-from-point
  input parameter self :: <GraphenePoint3D>;
  input parameter src_ :: <GraphenePoint3D>;
  result res :: <GraphenePoint3D>;
  c-name: "graphene_point3d_init_from_point";
end;

define inline-only C-function graphene-point3d-init-from-vec3
  input parameter self :: <GraphenePoint3D>;
  input parameter v_ :: <GrapheneVec3>;
  result res :: <GraphenePoint3D>;
  c-name: "graphene_point3d_init_from_vec3";
end;

define inline-only C-function graphene-point3d-interpolate
  input parameter self :: <GraphenePoint3D>;
  input parameter b_ :: <GraphenePoint3D>;
  input parameter factor_ :: <C-double>;
  input parameter res_ :: <GraphenePoint3D>;
  c-name: "graphene_point3d_interpolate";
end;

define inline-only C-function graphene-point3d-length
  input parameter self :: <GraphenePoint3D>;
  result res :: <C-float>;
  c-name: "graphene_point3d_length";
end;

define inline-only C-function graphene-point3d-near
  input parameter self :: <GraphenePoint3D>;
  input parameter b_ :: <GraphenePoint3D>;
  input parameter epsilon_ :: <C-float>;
  result res :: <C-boolean>;
  c-name: "graphene_point3d_near";
end;

define inline-only C-function graphene-point3d-normalize
  input parameter self :: <GraphenePoint3D>;
  input parameter res_ :: <GraphenePoint3D>;
  c-name: "graphene_point3d_normalize";
end;

define inline-only C-function graphene-point3d-normalize-viewport
  input parameter self :: <GraphenePoint3D>;
  input parameter viewport_ :: <GrapheneRect>;
  input parameter z_near_ :: <C-float>;
  input parameter z_far_ :: <C-float>;
  input parameter res_ :: <GraphenePoint3D>;
  c-name: "graphene_point3d_normalize_viewport";
end;

define inline-only C-function graphene-point3d-scale
  input parameter self :: <GraphenePoint3D>;
  input parameter factor_ :: <C-float>;
  input parameter res_ :: <GraphenePoint3D>;
  c-name: "graphene_point3d_scale";
end;

define inline-only C-function graphene-point3d-to-vec3
  input parameter self :: <GraphenePoint3D>;
  input parameter v_ :: <GrapheneVec3>;
  c-name: "graphene_point3d_to_vec3";
end;

define inline-only C-function graphene-point3d-zero
  result res :: <GraphenePoint3D>;
  c-name: "graphene_point3d_zero";
end;

define C-struct <_GrapheneQuad>
  constant sealed inline-only slot graphene-quad-points :: <C-unsigned-char*> /* Not supported */;
  pointer-type-name: <GrapheneQuad>;
end C-struct;

define sealed domain make (singleton(<GrapheneQuad>));
define sealed domain initialize (<GrapheneQuad>);

define inline-only C-function graphene-quad-alloc
  result res :: <GrapheneQuad>;
  c-name: "graphene_quad_alloc";
end;

define inline-only C-function graphene-quad-bounds
  input parameter self :: <GrapheneQuad>;
  input parameter r_ :: <GrapheneRect>;
  c-name: "graphene_quad_bounds";
end;

define inline-only C-function graphene-quad-contains
  input parameter self :: <GrapheneQuad>;
  input parameter p_ :: <GraphenePoint>;
  result res :: <C-boolean>;
  c-name: "graphene_quad_contains";
end;

define inline-only C-function graphene-quad-free
  input parameter self :: <GrapheneQuad>;
  c-name: "graphene_quad_free";
end;

define inline-only C-function graphene-quad-get-point
  input parameter self :: <GrapheneQuad>;
  input parameter index__ :: <C-unsigned-int>;
  result res :: <GraphenePoint>;
  c-name: "graphene_quad_get_point";
end;

define inline-only C-function graphene-quad-init
  input parameter self :: <GrapheneQuad>;
  input parameter p1_ :: <GraphenePoint>;
  input parameter p2_ :: <GraphenePoint>;
  input parameter p3_ :: <GraphenePoint>;
  input parameter p4_ :: <GraphenePoint>;
  result res :: <GrapheneQuad>;
  c-name: "graphene_quad_init";
end;

define inline-only C-function graphene-quad-init-from-points
  input parameter self :: <GrapheneQuad>;
  input parameter points_ :: <C-unsigned-char*> /* Not supported */;
  result res :: <GrapheneQuad>;
  c-name: "graphene_quad_init_from_points";
end;

define inline-only C-function graphene-quad-init-from-rect
  input parameter self :: <GrapheneQuad>;
  input parameter r_ :: <GrapheneRect>;
  result res :: <GrapheneQuad>;
  c-name: "graphene_quad_init_from_rect";
end;

define C-struct <_GrapheneQuaternion>
  constant sealed inline-only slot graphene-quaternion-x :: <C-float>;
  constant sealed inline-only slot graphene-quaternion-y :: <C-float>;
  constant sealed inline-only slot graphene-quaternion-z :: <C-float>;
  constant sealed inline-only slot graphene-quaternion-w :: <C-float>;
  pointer-type-name: <GrapheneQuaternion>;
end C-struct;

define sealed domain make (singleton(<GrapheneQuaternion>));
define sealed domain initialize (<GrapheneQuaternion>);

define inline-only C-function graphene-quaternion-alloc
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_alloc";
end;

define inline-only C-function graphene-quaternion-add
  input parameter self :: <GrapheneQuaternion>;
  input parameter b_ :: <GrapheneQuaternion>;
  input parameter res_ :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_add";
end;

define inline-only C-function graphene-quaternion-dot
  input parameter self :: <GrapheneQuaternion>;
  input parameter b_ :: <GrapheneQuaternion>;
  result res :: <C-float>;
  c-name: "graphene_quaternion_dot";
end;

define inline-only C-function graphene-quaternion-equal
  input parameter self :: <GrapheneQuaternion>;
  input parameter b_ :: <GrapheneQuaternion>;
  result res :: <C-boolean>;
  c-name: "graphene_quaternion_equal";
end;

define inline-only C-function graphene-quaternion-free
  input parameter self :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_free";
end;

define inline-only C-function graphene-quaternion-init
  input parameter self :: <GrapheneQuaternion>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  input parameter z_ :: <C-float>;
  input parameter w_ :: <C-float>;
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_init";
end;

define inline-only C-function graphene-quaternion-init-from-angle-vec3
  input parameter self :: <GrapheneQuaternion>;
  input parameter angle_ :: <C-float>;
  input parameter axis_ :: <GrapheneVec3>;
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_init_from_angle_vec3";
end;

define inline-only C-function graphene-quaternion-init-from-angles
  input parameter self :: <GrapheneQuaternion>;
  input parameter deg_x_ :: <C-float>;
  input parameter deg_y_ :: <C-float>;
  input parameter deg_z_ :: <C-float>;
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_init_from_angles";
end;

define inline-only C-function graphene-quaternion-init-from-euler
  input parameter self :: <GrapheneQuaternion>;
  input parameter e_ :: <GrapheneEuler>;
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_init_from_euler";
end;

define inline-only C-function graphene-quaternion-init-from-matrix
  input parameter self :: <GrapheneQuaternion>;
  input parameter m_ :: <GrapheneMatrix>;
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_init_from_matrix";
end;

define inline-only C-function graphene-quaternion-init-from-quaternion
  input parameter self :: <GrapheneQuaternion>;
  input parameter src_ :: <GrapheneQuaternion>;
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_init_from_quaternion";
end;

define inline-only C-function graphene-quaternion-init-from-radians
  input parameter self :: <GrapheneQuaternion>;
  input parameter rad_x_ :: <C-float>;
  input parameter rad_y_ :: <C-float>;
  input parameter rad_z_ :: <C-float>;
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_init_from_radians";
end;

define inline-only C-function graphene-quaternion-init-from-vec4
  input parameter self :: <GrapheneQuaternion>;
  input parameter src_ :: <GrapheneVec4>;
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_init_from_vec4";
end;

define inline-only C-function graphene-quaternion-init-identity
  input parameter self :: <GrapheneQuaternion>;
  result res :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_init_identity";
end;

define inline-only C-function graphene-quaternion-invert
  input parameter self :: <GrapheneQuaternion>;
  input parameter res_ :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_invert";
end;

define inline-only C-function graphene-quaternion-multiply
  input parameter self :: <GrapheneQuaternion>;
  input parameter b_ :: <GrapheneQuaternion>;
  input parameter res_ :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_multiply";
end;

define inline-only C-function graphene-quaternion-normalize
  input parameter self :: <GrapheneQuaternion>;
  input parameter res_ :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_normalize";
end;

define inline-only C-function graphene-quaternion-scale
  input parameter self :: <GrapheneQuaternion>;
  input parameter factor_ :: <C-float>;
  input parameter res_ :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_scale";
end;

define inline-only C-function graphene-quaternion-slerp
  input parameter self :: <GrapheneQuaternion>;
  input parameter b_ :: <GrapheneQuaternion>;
  input parameter factor_ :: <C-float>;
  input parameter res_ :: <GrapheneQuaternion>;
  c-name: "graphene_quaternion_slerp";
end;

define inline-only C-function graphene-quaternion-to-angle-vec3
  input parameter self :: <GrapheneQuaternion>;
  output parameter angle_ :: <C-float*>;
  input parameter axis_ :: <GrapheneVec3>;
  c-name: "graphene_quaternion_to_angle_vec3";
end;

define inline-only C-function graphene-quaternion-to-angles
  input parameter self :: <GrapheneQuaternion>;
  output parameter deg_x_ :: <C-float*>;
  output parameter deg_y_ :: <C-float*>;
  output parameter deg_z_ :: <C-float*>;
  c-name: "graphene_quaternion_to_angles";
end;

define inline-only C-function graphene-quaternion-to-matrix
  input parameter self :: <GrapheneQuaternion>;
  input parameter m_ :: <GrapheneMatrix>;
  c-name: "graphene_quaternion_to_matrix";
end;

define inline-only C-function graphene-quaternion-to-radians
  input parameter self :: <GrapheneQuaternion>;
  output parameter rad_x_ :: <C-float*>;
  output parameter rad_y_ :: <C-float*>;
  output parameter rad_z_ :: <C-float*>;
  c-name: "graphene_quaternion_to_radians";
end;

define inline-only C-function graphene-quaternion-to-vec4
  input parameter self :: <GrapheneQuaternion>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_quaternion_to_vec4";
end;

define C-struct <_GrapheneRay>
  constant sealed inline-only slot graphene-ray-origin :: <GrapheneVec3>;
  constant sealed inline-only slot graphene-ray-direction :: <GrapheneVec3>;
  pointer-type-name: <GrapheneRay>;
end C-struct;

define sealed domain make (singleton(<GrapheneRay>));
define sealed domain initialize (<GrapheneRay>);

define inline-only C-function graphene-ray-alloc
  result res :: <GrapheneRay>;
  c-name: "graphene_ray_alloc";
end;

define inline-only C-function graphene-ray-equal
  input parameter self :: <GrapheneRay>;
  input parameter b_ :: <GrapheneRay>;
  result res :: <C-boolean>;
  c-name: "graphene_ray_equal";
end;

define inline-only C-function graphene-ray-free
  input parameter self :: <GrapheneRay>;
  c-name: "graphene_ray_free";
end;

define inline-only C-function graphene-ray-get-closest-point-to-point
  input parameter self :: <GrapheneRay>;
  input parameter p_ :: <GraphenePoint3D>;
  input parameter res_ :: <GraphenePoint3D>;
  c-name: "graphene_ray_get_closest_point_to_point";
end;

define inline-only C-function graphene-ray-get-direction
  input parameter self :: <GrapheneRay>;
  input parameter direction_ :: <GrapheneVec3>;
  c-name: "graphene_ray_get_direction";
end;

define inline-only C-function graphene-ray-get-distance-to-plane
  input parameter self :: <GrapheneRay>;
  input parameter p_ :: <GraphenePlane>;
  result res :: <C-float>;
  c-name: "graphene_ray_get_distance_to_plane";
end;

define inline-only C-function graphene-ray-get-distance-to-point
  input parameter self :: <GrapheneRay>;
  input parameter p_ :: <GraphenePoint3D>;
  result res :: <C-float>;
  c-name: "graphene_ray_get_distance_to_point";
end;

define inline-only C-function graphene-ray-get-origin
  input parameter self :: <GrapheneRay>;
  input parameter origin_ :: <GraphenePoint3D>;
  c-name: "graphene_ray_get_origin";
end;

define inline-only C-function graphene-ray-get-position-at
  input parameter self :: <GrapheneRay>;
  input parameter t_ :: <C-float>;
  input parameter position_ :: <GraphenePoint3D>;
  c-name: "graphene_ray_get_position_at";
end;

define inline-only C-function graphene-ray-init
  input parameter self :: <GrapheneRay>;
  input parameter origin_ :: <GraphenePoint3D>;
  input parameter direction_ :: <GrapheneVec3>;
  result res :: <GrapheneRay>;
  c-name: "graphene_ray_init";
end;

define inline-only C-function graphene-ray-init-from-ray
  input parameter self :: <GrapheneRay>;
  input parameter src_ :: <GrapheneRay>;
  result res :: <GrapheneRay>;
  c-name: "graphene_ray_init_from_ray";
end;

define inline-only C-function graphene-ray-init-from-vec3
  input parameter self :: <GrapheneRay>;
  input parameter origin_ :: <GrapheneVec3>;
  input parameter direction_ :: <GrapheneVec3>;
  result res :: <GrapheneRay>;
  c-name: "graphene_ray_init_from_vec3";
end;

define inline-only C-function graphene-ray-intersect-box
  input parameter self :: <GrapheneRay>;
  input parameter b_ :: <GrapheneBox>;
  output parameter t_out_ :: <C-float*>;
  result res :: <GrapheneRayIntersectionKind>;
  c-name: "graphene_ray_intersect_box";
end;

define inline-only C-function graphene-ray-intersect-sphere
  input parameter self :: <GrapheneRay>;
  input parameter s_ :: <GrapheneSphere>;
  output parameter t_out_ :: <C-float*>;
  result res :: <GrapheneRayIntersectionKind>;
  c-name: "graphene_ray_intersect_sphere";
end;

define inline-only C-function graphene-ray-intersect-triangle
  input parameter self :: <GrapheneRay>;
  input parameter t_ :: <GrapheneTriangle>;
  output parameter t_out_ :: <C-float*>;
  result res :: <GrapheneRayIntersectionKind>;
  c-name: "graphene_ray_intersect_triangle";
end;

define inline-only C-function graphene-ray-intersects-box
  input parameter self :: <GrapheneRay>;
  input parameter b_ :: <GrapheneBox>;
  result res :: <C-boolean>;
  c-name: "graphene_ray_intersects_box";
end;

define inline-only C-function graphene-ray-intersects-sphere
  input parameter self :: <GrapheneRay>;
  input parameter s_ :: <GrapheneSphere>;
  result res :: <C-boolean>;
  c-name: "graphene_ray_intersects_sphere";
end;

define inline-only C-function graphene-ray-intersects-triangle
  input parameter self :: <GrapheneRay>;
  input parameter t_ :: <GrapheneTriangle>;
  result res :: <C-boolean>;
  c-name: "graphene_ray_intersects_triangle";
end;

define inline-only constant $graphene-ray-intersection-kind-none = 0;
define inline-only constant $graphene-ray-intersection-kind-enter = 1;
define inline-only constant $graphene-ray-intersection-kind-leave = 2;
define constant <GrapheneRayIntersectionKind> = <C-int>;
define C-pointer-type <GrapheneRayIntersectionKind*> => <GrapheneRayIntersectionKind>;

define C-struct <_GrapheneRect>
  sealed inline-only slot graphene-rect-origin :: <GraphenePoint>;
  sealed inline-only slot graphene-rect-size :: <GrapheneSize>;
  pointer-type-name: <GrapheneRect>;
end C-struct;

define sealed domain make (singleton(<GrapheneRect>));
define sealed domain initialize (<GrapheneRect>);

define inline-only C-function graphene-rect-contains-point
  input parameter self :: <GrapheneRect>;
  input parameter p_ :: <GraphenePoint>;
  result res :: <C-boolean>;
  c-name: "graphene_rect_contains_point";
end;

define inline-only C-function graphene-rect-contains-rect
  input parameter self :: <GrapheneRect>;
  input parameter b_ :: <GrapheneRect>;
  result res :: <C-boolean>;
  c-name: "graphene_rect_contains_rect";
end;

define inline-only C-function graphene-rect-equal
  input parameter self :: <GrapheneRect>;
  input parameter b_ :: <GrapheneRect>;
  result res :: <C-boolean>;
  c-name: "graphene_rect_equal";
end;

define inline-only C-function graphene-rect-expand
  input parameter self :: <GrapheneRect>;
  input parameter p_ :: <GraphenePoint>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_rect_expand";
end;

define inline-only C-function graphene-rect-free
  input parameter self :: <GrapheneRect>;
  c-name: "graphene_rect_free";
end;

define inline-only C-function graphene-rect-get-area
  input parameter self :: <GrapheneRect>;
  result res :: <C-float>;
  c-name: "graphene_rect_get_area";
end;

define inline-only C-function graphene-rect-get-bottom-left
  input parameter self :: <GrapheneRect>;
  input parameter p_ :: <GraphenePoint>;
  c-name: "graphene_rect_get_bottom_left";
end;

define inline-only C-function graphene-rect-get-bottom-right
  input parameter self :: <GrapheneRect>;
  input parameter p_ :: <GraphenePoint>;
  c-name: "graphene_rect_get_bottom_right";
end;

define inline-only C-function graphene-rect-get-center
  input parameter self :: <GrapheneRect>;
  input parameter p_ :: <GraphenePoint>;
  c-name: "graphene_rect_get_center";
end;

define inline-only C-function graphene-rect-get-height
  input parameter self :: <GrapheneRect>;
  result res :: <C-float>;
  c-name: "graphene_rect_get_height";
end;

define inline-only C-function graphene-rect-get-top-left
  input parameter self :: <GrapheneRect>;
  input parameter p_ :: <GraphenePoint>;
  c-name: "graphene_rect_get_top_left";
end;

define inline-only C-function graphene-rect-get-top-right
  input parameter self :: <GrapheneRect>;
  input parameter p_ :: <GraphenePoint>;
  c-name: "graphene_rect_get_top_right";
end;

define inline-only C-function graphene-rect-get-vertices
  input parameter self :: <GrapheneRect>;
  output parameter vertices_ :: <C-unsigned-char*> /* Not supported */;
  c-name: "graphene_rect_get_vertices";
end;

define inline-only C-function graphene-rect-get-width
  input parameter self :: <GrapheneRect>;
  result res :: <C-float>;
  c-name: "graphene_rect_get_width";
end;

define inline-only C-function graphene-rect-get-x
  input parameter self :: <GrapheneRect>;
  result res :: <C-float>;
  c-name: "graphene_rect_get_x";
end;

define inline-only C-function graphene-rect-get-y
  input parameter self :: <GrapheneRect>;
  result res :: <C-float>;
  c-name: "graphene_rect_get_y";
end;

define inline-only C-function graphene-rect-init
  input parameter self :: <GrapheneRect>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  input parameter width_ :: <C-float>;
  input parameter height_ :: <C-float>;
  result res :: <GrapheneRect>;
  c-name: "graphene_rect_init";
end;

define inline-only C-function graphene-rect-init-from-rect
  input parameter self :: <GrapheneRect>;
  input parameter src_ :: <GrapheneRect>;
  result res :: <GrapheneRect>;
  c-name: "graphene_rect_init_from_rect";
end;

define inline-only C-function graphene-rect-inset
  input parameter self :: <GrapheneRect>;
  input parameter d_x_ :: <C-float>;
  input parameter d_y_ :: <C-float>;
  result res :: <GrapheneRect>;
  c-name: "graphene_rect_inset";
end;

define inline-only C-function graphene-rect-inset-r
  input parameter self :: <GrapheneRect>;
  input parameter d_x_ :: <C-float>;
  input parameter d_y_ :: <C-float>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_rect_inset_r";
end;

define inline-only C-function graphene-rect-interpolate
  input parameter self :: <GrapheneRect>;
  input parameter b_ :: <GrapheneRect>;
  input parameter factor_ :: <C-double>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_rect_interpolate";
end;

define inline-only C-function graphene-rect-intersection
  input parameter self :: <GrapheneRect>;
  input parameter b_ :: <GrapheneRect>;
  input parameter res_ :: <GrapheneRect>;
  result res :: <C-boolean>;
  c-name: "graphene_rect_intersection";
end;

define inline-only C-function graphene-rect-normalize
  input parameter self :: <GrapheneRect>;
  result res :: <GrapheneRect>;
  c-name: "graphene_rect_normalize";
end;

define inline-only C-function graphene-rect-normalize-r
  input parameter self :: <GrapheneRect>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_rect_normalize_r";
end;

define inline-only C-function graphene-rect-offset
  input parameter self :: <GrapheneRect>;
  input parameter d_x_ :: <C-float>;
  input parameter d_y_ :: <C-float>;
  result res :: <GrapheneRect>;
  c-name: "graphene_rect_offset";
end;

define inline-only C-function graphene-rect-offset-r
  input parameter self :: <GrapheneRect>;
  input parameter d_x_ :: <C-float>;
  input parameter d_y_ :: <C-float>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_rect_offset_r";
end;

define inline-only C-function graphene-rect-round-extents
  input parameter self :: <GrapheneRect>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_rect_round_extents";
end;

define inline-only C-function graphene-rect-scale
  input parameter self :: <GrapheneRect>;
  input parameter s_h_ :: <C-float>;
  input parameter s_v_ :: <C-float>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_rect_scale";
end;

define inline-only C-function graphene-rect-union
  input parameter self :: <GrapheneRect>;
  input parameter b_ :: <GrapheneRect>;
  input parameter res_ :: <GrapheneRect>;
  c-name: "graphene_rect_union";
end;

define inline-only C-function graphene-rect-alloc
  result res :: <GrapheneRect>;
  c-name: "graphene_rect_alloc";
end;

define inline-only C-function graphene-rect-zero
  result res :: <GrapheneRect>;
  c-name: "graphene_rect_zero";
end;

define C-struct <_GrapheneSimd4F>
  constant sealed inline-only slot graphene-simd4f-x :: <C-float>;
  constant sealed inline-only slot graphene-simd4f-y :: <C-float>;
  constant sealed inline-only slot graphene-simd4f-z :: <C-float>;
  constant sealed inline-only slot graphene-simd4f-w :: <C-float>;
  pointer-type-name: <GrapheneSimd4F>;
end C-struct;

define sealed domain make (singleton(<GrapheneSimd4F>));
define sealed domain initialize (<GrapheneSimd4F>);

define C-struct <_GrapheneSimd4X4F>
  constant sealed inline-only slot graphene-simd4x4f-x :: <GrapheneSimd4F>;
  constant sealed inline-only slot graphene-simd4x4f-y :: <GrapheneSimd4F>;
  constant sealed inline-only slot graphene-simd4x4f-z :: <GrapheneSimd4F>;
  constant sealed inline-only slot graphene-simd4x4f-w :: <GrapheneSimd4F>;
  pointer-type-name: <GrapheneSimd4X4F>;
end C-struct;

define sealed domain make (singleton(<GrapheneSimd4X4F>));
define sealed domain initialize (<GrapheneSimd4X4F>);

define C-struct <_GrapheneSize>
  sealed inline-only slot graphene-size-width :: <C-float>;
  sealed inline-only slot graphene-size-height :: <C-float>;
  pointer-type-name: <GrapheneSize>;
end C-struct;

define sealed domain make (singleton(<GrapheneSize>));
define sealed domain initialize (<GrapheneSize>);

define inline-only C-function graphene-size-alloc
  result res :: <GrapheneSize>;
  c-name: "graphene_size_alloc";
end;

define inline-only C-function graphene-size-equal
  input parameter self :: <GrapheneSize>;
  input parameter b_ :: <GrapheneSize>;
  result res :: <C-boolean>;
  c-name: "graphene_size_equal";
end;

define inline-only C-function graphene-size-free
  input parameter self :: <GrapheneSize>;
  c-name: "graphene_size_free";
end;

define inline-only C-function graphene-size-init
  input parameter self :: <GrapheneSize>;
  input parameter width_ :: <C-float>;
  input parameter height_ :: <C-float>;
  result res :: <GrapheneSize>;
  c-name: "graphene_size_init";
end;

define inline-only C-function graphene-size-init-from-size
  input parameter self :: <GrapheneSize>;
  input parameter src_ :: <GrapheneSize>;
  result res :: <GrapheneSize>;
  c-name: "graphene_size_init_from_size";
end;

define inline-only C-function graphene-size-interpolate
  input parameter self :: <GrapheneSize>;
  input parameter b_ :: <GrapheneSize>;
  input parameter factor_ :: <C-double>;
  input parameter res_ :: <GrapheneSize>;
  c-name: "graphene_size_interpolate";
end;

define inline-only C-function graphene-size-scale
  input parameter self :: <GrapheneSize>;
  input parameter factor_ :: <C-float>;
  input parameter res_ :: <GrapheneSize>;
  c-name: "graphene_size_scale";
end;

define inline-only C-function graphene-size-zero
  result res :: <GrapheneSize>;
  c-name: "graphene_size_zero";
end;

define C-struct <_GrapheneSphere>
  constant sealed inline-only slot graphene-sphere-center :: <GrapheneVec3>;
  constant sealed inline-only slot graphene-sphere-radius :: <C-float>;
  pointer-type-name: <GrapheneSphere>;
end C-struct;

define sealed domain make (singleton(<GrapheneSphere>));
define sealed domain initialize (<GrapheneSphere>);

define inline-only C-function graphene-sphere-alloc
  result res :: <GrapheneSphere>;
  c-name: "graphene_sphere_alloc";
end;

define inline-only C-function graphene-sphere-contains-point
  input parameter self :: <GrapheneSphere>;
  input parameter point_ :: <GraphenePoint3D>;
  result res :: <C-boolean>;
  c-name: "graphene_sphere_contains_point";
end;

define inline-only C-function graphene-sphere-distance
  input parameter self :: <GrapheneSphere>;
  input parameter point_ :: <GraphenePoint3D>;
  result res :: <C-float>;
  c-name: "graphene_sphere_distance";
end;

define inline-only C-function graphene-sphere-equal
  input parameter self :: <GrapheneSphere>;
  input parameter b_ :: <GrapheneSphere>;
  result res :: <C-boolean>;
  c-name: "graphene_sphere_equal";
end;

define inline-only C-function graphene-sphere-free
  input parameter self :: <GrapheneSphere>;
  c-name: "graphene_sphere_free";
end;

define inline-only C-function graphene-sphere-get-bounding-box
  input parameter self :: <GrapheneSphere>;
  input parameter box_ :: <GrapheneBox>;
  c-name: "graphene_sphere_get_bounding_box";
end;

define inline-only C-function graphene-sphere-get-center
  input parameter self :: <GrapheneSphere>;
  input parameter center_ :: <GraphenePoint3D>;
  c-name: "graphene_sphere_get_center";
end;

define inline-only C-function graphene-sphere-get-radius
  input parameter self :: <GrapheneSphere>;
  result res :: <C-float>;
  c-name: "graphene_sphere_get_radius";
end;

define inline-only C-function graphene-sphere-init
  input parameter self :: <GrapheneSphere>;
  input parameter center_ :: <GraphenePoint3D>;
  input parameter radius_ :: <C-float>;
  result res :: <GrapheneSphere>;
  c-name: "graphene_sphere_init";
end;

define inline-only C-function graphene-sphere-init-from-points
  input parameter self :: <GrapheneSphere>;
  input parameter n_points_ :: <C-unsigned-int>;
  input parameter points_ :: <C-unsigned-char*> /* Not supported */;
  input parameter center_ :: <GraphenePoint3D>;
  result res :: <GrapheneSphere>;
  c-name: "graphene_sphere_init_from_points";
end;

define inline-only C-function graphene-sphere-init-from-vectors
  input parameter self :: <GrapheneSphere>;
  input parameter n_vectors_ :: <C-unsigned-int>;
  input parameter vectors_ :: <C-unsigned-char*> /* Not supported */;
  input parameter center_ :: <GraphenePoint3D>;
  result res :: <GrapheneSphere>;
  c-name: "graphene_sphere_init_from_vectors";
end;

define inline-only C-function graphene-sphere-is-empty
  input parameter self :: <GrapheneSphere>;
  result res :: <C-boolean>;
  c-name: "graphene_sphere_is_empty";
end;

define inline-only C-function graphene-sphere-translate
  input parameter self :: <GrapheneSphere>;
  input parameter point_ :: <GraphenePoint3D>;
  input parameter res_ :: <GrapheneSphere>;
  c-name: "graphene_sphere_translate";
end;

define C-struct <_GrapheneTriangle>
  constant sealed inline-only slot graphene-triangle-a :: <GrapheneVec3>;
  constant sealed inline-only slot graphene-triangle-b :: <GrapheneVec3>;
  constant sealed inline-only slot graphene-triangle-c :: <GrapheneVec3>;
  pointer-type-name: <GrapheneTriangle>;
end C-struct;

define sealed domain make (singleton(<GrapheneTriangle>));
define sealed domain initialize (<GrapheneTriangle>);

define inline-only C-function graphene-triangle-alloc
  result res :: <GrapheneTriangle>;
  c-name: "graphene_triangle_alloc";
end;

define inline-only C-function graphene-triangle-contains-point
  input parameter self :: <GrapheneTriangle>;
  input parameter p_ :: <GraphenePoint3D>;
  result res :: <C-boolean>;
  c-name: "graphene_triangle_contains_point";
end;

define inline-only C-function graphene-triangle-equal
  input parameter self :: <GrapheneTriangle>;
  input parameter b_ :: <GrapheneTriangle>;
  result res :: <C-boolean>;
  c-name: "graphene_triangle_equal";
end;

define inline-only C-function graphene-triangle-free
  input parameter self :: <GrapheneTriangle>;
  c-name: "graphene_triangle_free";
end;

define inline-only C-function graphene-triangle-get-area
  input parameter self :: <GrapheneTriangle>;
  result res :: <C-float>;
  c-name: "graphene_triangle_get_area";
end;

define inline-only C-function graphene-triangle-get-barycoords
  input parameter self :: <GrapheneTriangle>;
  input parameter p_ :: <GraphenePoint3D>;
  input parameter res_ :: <GrapheneVec2>;
  result res :: <C-boolean>;
  c-name: "graphene_triangle_get_barycoords";
end;

define inline-only C-function graphene-triangle-get-bounding-box
  input parameter self :: <GrapheneTriangle>;
  input parameter res_ :: <GrapheneBox>;
  c-name: "graphene_triangle_get_bounding_box";
end;

define inline-only C-function graphene-triangle-get-midpoint
  input parameter self :: <GrapheneTriangle>;
  input parameter res_ :: <GraphenePoint3D>;
  c-name: "graphene_triangle_get_midpoint";
end;

define inline-only C-function graphene-triangle-get-normal
  input parameter self :: <GrapheneTriangle>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_triangle_get_normal";
end;

define inline-only C-function graphene-triangle-get-plane
  input parameter self :: <GrapheneTriangle>;
  input parameter res_ :: <GraphenePlane>;
  c-name: "graphene_triangle_get_plane";
end;

define inline-only C-function graphene-triangle-get-points
  input parameter self :: <GrapheneTriangle>;
  input parameter a_ :: <GraphenePoint3D>;
  input parameter b_ :: <GraphenePoint3D>;
  input parameter c_ :: <GraphenePoint3D>;
  c-name: "graphene_triangle_get_points";
end;

define inline-only C-function graphene-triangle-get-uv
  input parameter self :: <GrapheneTriangle>;
  input parameter p_ :: <GraphenePoint3D>;
  input parameter uv_a_ :: <GrapheneVec2>;
  input parameter uv_b_ :: <GrapheneVec2>;
  input parameter uv_c_ :: <GrapheneVec2>;
  input parameter res_ :: <GrapheneVec2>;
  result res :: <C-boolean>;
  c-name: "graphene_triangle_get_uv";
end;

define inline-only C-function graphene-triangle-get-vertices
  input parameter self :: <GrapheneTriangle>;
  input parameter a_ :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  input parameter c_ :: <GrapheneVec3>;
  c-name: "graphene_triangle_get_vertices";
end;

define inline-only C-function graphene-triangle-init-from-float
  input parameter self :: <GrapheneTriangle>;
  input parameter a_ :: <C-float*>;
  input parameter b_ :: <C-float*>;
  input parameter c_ :: <C-float*>;
  result res :: <GrapheneTriangle>;
  c-name: "graphene_triangle_init_from_float";
end;

define inline-only C-function graphene-triangle-init-from-point3d
  input parameter self :: <GrapheneTriangle>;
  input parameter a_ :: <GraphenePoint3D>;
  input parameter b_ :: <GraphenePoint3D>;
  input parameter c_ :: <GraphenePoint3D>;
  result res :: <GrapheneTriangle>;
  c-name: "graphene_triangle_init_from_point3d";
end;

define inline-only C-function graphene-triangle-init-from-vec3
  input parameter self :: <GrapheneTriangle>;
  input parameter a_ :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  input parameter c_ :: <GrapheneVec3>;
  result res :: <GrapheneTriangle>;
  c-name: "graphene_triangle_init_from_vec3";
end;

define inline-only constant $vec2-len = 2;

define inline-only constant $vec3-len = 3;

define inline-only constant $vec4-len = 4;

define C-struct <_GrapheneVec2>
  constant sealed inline-only slot graphene-vec2-value :: <GrapheneSimd4F>;
  pointer-type-name: <GrapheneVec2>;
end C-struct;

define sealed domain make (singleton(<GrapheneVec2>));
define sealed domain initialize (<GrapheneVec2>);

define inline-only C-function graphene-vec2-alloc
  result res :: <GrapheneVec2>;
  c-name: "graphene_vec2_alloc";
end;

define inline-only C-function graphene-vec2-add
  input parameter self :: <GrapheneVec2>;
  input parameter b_ :: <GrapheneVec2>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_add";
end;

define inline-only C-function graphene-vec2-divide
  input parameter self :: <GrapheneVec2>;
  input parameter b_ :: <GrapheneVec2>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_divide";
end;

define inline-only C-function graphene-vec2-dot
  input parameter self :: <GrapheneVec2>;
  input parameter b_ :: <GrapheneVec2>;
  result res :: <C-float>;
  c-name: "graphene_vec2_dot";
end;

define inline-only C-function graphene-vec2-equal
  input parameter self :: <GrapheneVec2>;
  input parameter v2_ :: <GrapheneVec2>;
  result res :: <C-boolean>;
  c-name: "graphene_vec2_equal";
end;

define inline-only C-function graphene-vec2-free
  input parameter self :: <GrapheneVec2>;
  c-name: "graphene_vec2_free";
end;

define inline-only C-function graphene-vec2-get-x
  input parameter self :: <GrapheneVec2>;
  result res :: <C-float>;
  c-name: "graphene_vec2_get_x";
end;

define inline-only C-function graphene-vec2-get-y
  input parameter self :: <GrapheneVec2>;
  result res :: <C-float>;
  c-name: "graphene_vec2_get_y";
end;

define inline-only C-function graphene-vec2-init
  input parameter self :: <GrapheneVec2>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  result res :: <GrapheneVec2>;
  c-name: "graphene_vec2_init";
end;

define inline-only C-function graphene-vec2-init-from-float
  input parameter self :: <GrapheneVec2>;
  input parameter src_ :: <C-float*>;
  result res :: <GrapheneVec2>;
  c-name: "graphene_vec2_init_from_float";
end;

define inline-only C-function graphene-vec2-init-from-vec2
  input parameter self :: <GrapheneVec2>;
  input parameter src_ :: <GrapheneVec2>;
  result res :: <GrapheneVec2>;
  c-name: "graphene_vec2_init_from_vec2";
end;

define inline-only C-function graphene-vec2-interpolate
  input parameter self :: <GrapheneVec2>;
  input parameter v2_ :: <GrapheneVec2>;
  input parameter factor_ :: <C-double>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_interpolate";
end;

define inline-only C-function graphene-vec2-length
  input parameter self :: <GrapheneVec2>;
  result res :: <C-float>;
  c-name: "graphene_vec2_length";
end;

define inline-only C-function graphene-vec2-max
  input parameter self :: <GrapheneVec2>;
  input parameter b_ :: <GrapheneVec2>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_max";
end;

define inline-only C-function graphene-vec2-min
  input parameter self :: <GrapheneVec2>;
  input parameter b_ :: <GrapheneVec2>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_min";
end;

define inline-only C-function graphene-vec2-multiply
  input parameter self :: <GrapheneVec2>;
  input parameter b_ :: <GrapheneVec2>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_multiply";
end;

define inline-only C-function graphene-vec2-near
  input parameter self :: <GrapheneVec2>;
  input parameter v2_ :: <GrapheneVec2>;
  input parameter epsilon_ :: <C-float>;
  result res :: <C-boolean>;
  c-name: "graphene_vec2_near";
end;

define inline-only C-function graphene-vec2-negate
  input parameter self :: <GrapheneVec2>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_negate";
end;

define inline-only C-function graphene-vec2-normalize
  input parameter self :: <GrapheneVec2>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_normalize";
end;

define inline-only C-function graphene-vec2-scale
  input parameter self :: <GrapheneVec2>;
  input parameter factor_ :: <C-float>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_scale";
end;

define inline-only C-function graphene-vec2-subtract
  input parameter self :: <GrapheneVec2>;
  input parameter b_ :: <GrapheneVec2>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec2_subtract";
end;

define inline-only C-function graphene-vec2-to-float
  input parameter self :: <GrapheneVec2>;
  output parameter dest_ :: <C-float*>;
  c-name: "graphene_vec2_to_float";
end;

define inline-only C-function graphene-vec2-one
  result res :: <GrapheneVec2>;
  c-name: "graphene_vec2_one";
end;

define inline-only C-function graphene-vec2-x-axis
  result res :: <GrapheneVec2>;
  c-name: "graphene_vec2_x_axis";
end;

define inline-only C-function graphene-vec2-y-axis
  result res :: <GrapheneVec2>;
  c-name: "graphene_vec2_y_axis";
end;

define inline-only C-function graphene-vec2-zero
  result res :: <GrapheneVec2>;
  c-name: "graphene_vec2_zero";
end;

define C-struct <_GrapheneVec3>
  constant sealed inline-only slot graphene-vec3-value :: <GrapheneSimd4F>;
  pointer-type-name: <GrapheneVec3>;
end C-struct;

define sealed domain make (singleton(<GrapheneVec3>));
define sealed domain initialize (<GrapheneVec3>);

define inline-only C-function graphene-vec3-alloc
  result res :: <GrapheneVec3>;
  c-name: "graphene_vec3_alloc";
end;

define inline-only C-function graphene-vec3-add
  input parameter self :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_add";
end;

define inline-only C-function graphene-vec3-cross
  input parameter self :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_cross";
end;

define inline-only C-function graphene-vec3-divide
  input parameter self :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_divide";
end;

define inline-only C-function graphene-vec3-dot
  input parameter self :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  result res :: <C-float>;
  c-name: "graphene_vec3_dot";
end;

define inline-only C-function graphene-vec3-equal
  input parameter self :: <GrapheneVec3>;
  input parameter v2_ :: <GrapheneVec3>;
  result res :: <C-boolean>;
  c-name: "graphene_vec3_equal";
end;

define inline-only C-function graphene-vec3-free
  input parameter self :: <GrapheneVec3>;
  c-name: "graphene_vec3_free";
end;

define inline-only C-function graphene-vec3-get-x
  input parameter self :: <GrapheneVec3>;
  result res :: <C-float>;
  c-name: "graphene_vec3_get_x";
end;

define inline-only C-function graphene-vec3-get-xy
  input parameter self :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec3_get_xy";
end;

define inline-only C-function graphene-vec3-get-xy0
  input parameter self :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_get_xy0";
end;

define inline-only C-function graphene-vec3-get-xyz0
  input parameter self :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec3_get_xyz0";
end;

define inline-only C-function graphene-vec3-get-xyz1
  input parameter self :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec3_get_xyz1";
end;

define inline-only C-function graphene-vec3-get-xyzw
  input parameter self :: <GrapheneVec3>;
  input parameter w_ :: <C-float>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec3_get_xyzw";
end;

define inline-only C-function graphene-vec3-get-y
  input parameter self :: <GrapheneVec3>;
  result res :: <C-float>;
  c-name: "graphene_vec3_get_y";
end;

define inline-only C-function graphene-vec3-get-z
  input parameter self :: <GrapheneVec3>;
  result res :: <C-float>;
  c-name: "graphene_vec3_get_z";
end;

define inline-only C-function graphene-vec3-init
  input parameter self :: <GrapheneVec3>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  input parameter z_ :: <C-float>;
  result res :: <GrapheneVec3>;
  c-name: "graphene_vec3_init";
end;

define inline-only C-function graphene-vec3-init-from-float
  input parameter self :: <GrapheneVec3>;
  input parameter src_ :: <C-float*>;
  result res :: <GrapheneVec3>;
  c-name: "graphene_vec3_init_from_float";
end;

define inline-only C-function graphene-vec3-init-from-vec3
  input parameter self :: <GrapheneVec3>;
  input parameter src_ :: <GrapheneVec3>;
  result res :: <GrapheneVec3>;
  c-name: "graphene_vec3_init_from_vec3";
end;

define inline-only C-function graphene-vec3-interpolate
  input parameter self :: <GrapheneVec3>;
  input parameter v2_ :: <GrapheneVec3>;
  input parameter factor_ :: <C-double>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_interpolate";
end;

define inline-only C-function graphene-vec3-length
  input parameter self :: <GrapheneVec3>;
  result res :: <C-float>;
  c-name: "graphene_vec3_length";
end;

define inline-only C-function graphene-vec3-max
  input parameter self :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_max";
end;

define inline-only C-function graphene-vec3-min
  input parameter self :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_min";
end;

define inline-only C-function graphene-vec3-multiply
  input parameter self :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_multiply";
end;

define inline-only C-function graphene-vec3-near
  input parameter self :: <GrapheneVec3>;
  input parameter v2_ :: <GrapheneVec3>;
  input parameter epsilon_ :: <C-float>;
  result res :: <C-boolean>;
  c-name: "graphene_vec3_near";
end;

define inline-only C-function graphene-vec3-negate
  input parameter self :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_negate";
end;

define inline-only C-function graphene-vec3-normalize
  input parameter self :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_normalize";
end;

define inline-only C-function graphene-vec3-scale
  input parameter self :: <GrapheneVec3>;
  input parameter factor_ :: <C-float>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_scale";
end;

define inline-only C-function graphene-vec3-subtract
  input parameter self :: <GrapheneVec3>;
  input parameter b_ :: <GrapheneVec3>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec3_subtract";
end;

define inline-only C-function graphene-vec3-to-float
  input parameter self :: <GrapheneVec3>;
  output parameter dest_ :: <C-float*>;
  c-name: "graphene_vec3_to_float";
end;

define inline-only C-function graphene-vec3-one
  result res :: <GrapheneVec3>;
  c-name: "graphene_vec3_one";
end;

define inline-only C-function graphene-vec3-x-axis
  result res :: <GrapheneVec3>;
  c-name: "graphene_vec3_x_axis";
end;

define inline-only C-function graphene-vec3-y-axis
  result res :: <GrapheneVec3>;
  c-name: "graphene_vec3_y_axis";
end;

define inline-only C-function graphene-vec3-z-axis
  result res :: <GrapheneVec3>;
  c-name: "graphene_vec3_z_axis";
end;

define inline-only C-function graphene-vec3-zero
  result res :: <GrapheneVec3>;
  c-name: "graphene_vec3_zero";
end;

define C-struct <_GrapheneVec4>
  constant sealed inline-only slot graphene-vec4-value :: <GrapheneSimd4F>;
  pointer-type-name: <GrapheneVec4>;
end C-struct;

define sealed domain make (singleton(<GrapheneVec4>));
define sealed domain initialize (<GrapheneVec4>);

define inline-only C-function graphene-vec4-alloc
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_alloc";
end;

define inline-only C-function graphene-vec4-add
  input parameter self :: <GrapheneVec4>;
  input parameter b_ :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_add";
end;

define inline-only C-function graphene-vec4-divide
  input parameter self :: <GrapheneVec4>;
  input parameter b_ :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_divide";
end;

define inline-only C-function graphene-vec4-dot
  input parameter self :: <GrapheneVec4>;
  input parameter b_ :: <GrapheneVec4>;
  result res :: <C-float>;
  c-name: "graphene_vec4_dot";
end;

define inline-only C-function graphene-vec4-equal
  input parameter self :: <GrapheneVec4>;
  input parameter v2_ :: <GrapheneVec4>;
  result res :: <C-boolean>;
  c-name: "graphene_vec4_equal";
end;

define inline-only C-function graphene-vec4-free
  input parameter self :: <GrapheneVec4>;
  c-name: "graphene_vec4_free";
end;

define inline-only C-function graphene-vec4-get-w
  input parameter self :: <GrapheneVec4>;
  result res :: <C-float>;
  c-name: "graphene_vec4_get_w";
end;

define inline-only C-function graphene-vec4-get-x
  input parameter self :: <GrapheneVec4>;
  result res :: <C-float>;
  c-name: "graphene_vec4_get_x";
end;

define inline-only C-function graphene-vec4-get-xy
  input parameter self :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec2>;
  c-name: "graphene_vec4_get_xy";
end;

define inline-only C-function graphene-vec4-get-xyz
  input parameter self :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec3>;
  c-name: "graphene_vec4_get_xyz";
end;

define inline-only C-function graphene-vec4-get-y
  input parameter self :: <GrapheneVec4>;
  result res :: <C-float>;
  c-name: "graphene_vec4_get_y";
end;

define inline-only C-function graphene-vec4-get-z
  input parameter self :: <GrapheneVec4>;
  result res :: <C-float>;
  c-name: "graphene_vec4_get_z";
end;

define inline-only C-function graphene-vec4-init
  input parameter self :: <GrapheneVec4>;
  input parameter x_ :: <C-float>;
  input parameter y_ :: <C-float>;
  input parameter z_ :: <C-float>;
  input parameter w_ :: <C-float>;
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_init";
end;

define inline-only C-function graphene-vec4-init-from-float
  input parameter self :: <GrapheneVec4>;
  input parameter src_ :: <C-float*>;
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_init_from_float";
end;

define inline-only C-function graphene-vec4-init-from-vec2
  input parameter self :: <GrapheneVec4>;
  input parameter src_ :: <GrapheneVec2>;
  input parameter z_ :: <C-float>;
  input parameter w_ :: <C-float>;
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_init_from_vec2";
end;

define inline-only C-function graphene-vec4-init-from-vec3
  input parameter self :: <GrapheneVec4>;
  input parameter src_ :: <GrapheneVec3>;
  input parameter w_ :: <C-float>;
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_init_from_vec3";
end;

define inline-only C-function graphene-vec4-init-from-vec4
  input parameter self :: <GrapheneVec4>;
  input parameter src_ :: <GrapheneVec4>;
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_init_from_vec4";
end;

define inline-only C-function graphene-vec4-interpolate
  input parameter self :: <GrapheneVec4>;
  input parameter v2_ :: <GrapheneVec4>;
  input parameter factor_ :: <C-double>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_interpolate";
end;

define inline-only C-function graphene-vec4-length
  input parameter self :: <GrapheneVec4>;
  result res :: <C-float>;
  c-name: "graphene_vec4_length";
end;

define inline-only C-function graphene-vec4-max
  input parameter self :: <GrapheneVec4>;
  input parameter b_ :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_max";
end;

define inline-only C-function graphene-vec4-min
  input parameter self :: <GrapheneVec4>;
  input parameter b_ :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_min";
end;

define inline-only C-function graphene-vec4-multiply
  input parameter self :: <GrapheneVec4>;
  input parameter b_ :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_multiply";
end;

define inline-only C-function graphene-vec4-near
  input parameter self :: <GrapheneVec4>;
  input parameter v2_ :: <GrapheneVec4>;
  input parameter epsilon_ :: <C-float>;
  result res :: <C-boolean>;
  c-name: "graphene_vec4_near";
end;

define inline-only C-function graphene-vec4-negate
  input parameter self :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_negate";
end;

define inline-only C-function graphene-vec4-normalize
  input parameter self :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_normalize";
end;

define inline-only C-function graphene-vec4-scale
  input parameter self :: <GrapheneVec4>;
  input parameter factor_ :: <C-float>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_scale";
end;

define inline-only C-function graphene-vec4-subtract
  input parameter self :: <GrapheneVec4>;
  input parameter b_ :: <GrapheneVec4>;
  input parameter res_ :: <GrapheneVec4>;
  c-name: "graphene_vec4_subtract";
end;

define inline-only C-function graphene-vec4-to-float
  input parameter self :: <GrapheneVec4>;
  output parameter dest_ :: <C-float*>;
  c-name: "graphene_vec4_to_float";
end;

define inline-only C-function graphene-vec4-one
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_one";
end;

define inline-only C-function graphene-vec4-w-axis
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_w_axis";
end;

define inline-only C-function graphene-vec4-x-axis
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_x_axis";
end;

define inline-only C-function graphene-vec4-y-axis
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_y_axis";
end;

define inline-only C-function graphene-vec4-z-axis
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_z_axis";
end;

define inline-only C-function graphene-vec4-zero
  result res :: <GrapheneVec4>;
  c-name: "graphene_vec4_zero";
end;

