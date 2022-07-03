GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�      �      &�y���ڞu;>��.p   res://Main.tscn       �      ��:���p#����{\   res://assets/default.theme  �             T�oi;N]/�fN�E0��   res://default_env.tres  �      @      `@������l�؅�   res://icon.png  �v      �      G1?��z�c��vN��   res://icon.png.import   �$      �      ��fe��6�B��^ U�$   res://materials/glitch_material.tres�'      Y      �`�S�^-
K�f��S@   res://project.binary��      �      �"��?)[fKZX|P�$   res://scripts/canvas_item.gd.remap  pu      .       V�9S^t(�T��    res://scripts/canvas_item.gdc   �(            (�g��k�U�h����
�    res://scripts/freelook.gd.remap �u      +       �a8e���D[�b��   res://scripts/freelook.gdc  �)      �      ,0���������԰�$   res://scripts/script_loader.gd.remap�u      0       ��D�[��@�o�h"9�    res://scripts/script_loader.gdc �0            ��9�YA�
��F,��$   res://scripts/spatial_item.gd.remap  v      /        E_ݷA"��!;'�Q?3    res://scripts/spatial_item.gdc   3      �       m)�����7��{�a2$   res://scripts/toggle_panel.gd.remap 0v      /       U��Ω/Q�����ȹ_    res://scripts/toggle_panel.gdc  �3      �      ~6uN��N�$wʦ�(   res://scripts/viewport_resizer.gd.remap `v      3       f���@�)��0�my$   res://scripts/viewport_resizer.gdc  �5      �      q����J�����A0��$   res://shaders/modified_voxel.shader `7      Q      ��5�""@��jp;�,ZC    res://shaders/refs/diff.shader  �H      �      �(_uU���f��
(   res://shaders/refs/glitch_effect.shader �P      �      �+�
�p�"�B!�+!$   res://shaders/refs/society.shader   @U            �wj[�a&q�D��Ե    res://shaders/refs/voxel.shader `c      	      ����c�mS��k�A�            [gd_scene load_steps=16 format=2]

[ext_resource path="res://shaders/refs/glitch_effect.shader" type="Shader" id=1]
[ext_resource path="res://shaders/refs/voxel.shader" type="Shader" id=2]
[ext_resource path="res://scripts/freelook.gd" type="Script" id=3]
[ext_resource path="res://shaders/refs/diff.shader" type="Shader" id=4]
[ext_resource path="res://shaders/refs/society.shader" type="Shader" id=5]
[ext_resource path="res://shaders/modified_voxel.shader" type="Shader" id=6]
[ext_resource path="res://scripts/toggle_panel.gd" type="Script" id=7]
[ext_resource path="res://scripts/viewport_resizer.gd" type="Script" id=8]
[ext_resource path="res://assets/default.theme" type="Theme" id=9]

[sub_resource type="ShaderMaterial" id=2]
shader = ExtResource( 1 )
shader_param/shake_power = 0.03
shader_param/shake_rate = 0.2
shader_param/shake_speed = 5.0
shader_param/shake_block_size = 30.5
shader_param/shake_color_rate = 0.01

[sub_resource type="PlaneMesh" id=1]

[sub_resource type="ShaderMaterial" id=8]
shader = ExtResource( 4 )
shader_param/resolution = Vector2( 1, 1 )
shader_param/time = null
shader_param/mouse = null

[sub_resource type="ShaderMaterial" id=5]
shader = ExtResource( 5 )
shader_param/resolution = Vector2( 1, 1 )
shader_param/time = null
shader_param/mouse = null

[sub_resource type="ShaderMaterial" id=6]
shader = ExtResource( 2 )
shader_param/resolution = Vector2( 1, 1 )
shader_param/mouse = null

[sub_resource type="ShaderMaterial" id=7]
shader = ExtResource( 6 )
shader_param/resolution = Vector2( 1, 1 )
shader_param/mouse = null

[node name="Spatial" type="Spatial"]

[node name="CanvasLayer" type="CanvasLayer" parent="."]

[node name="ViewportContainer" type="ViewportContainer" parent="CanvasLayer"]
material = SubResource( 2 )
margin_right = 1024.0
margin_bottom = 600.0
script = ExtResource( 8 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Viewport" type="Viewport" parent="CanvasLayer/ViewportContainer"]
size = Vector2( 1024, 600 )
handle_input_locally = false
render_target_update_mode = 3

[node name="Camera" type="Camera" parent="CanvasLayer/ViewportContainer/Viewport"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 2 )
current = true
script = ExtResource( 3 )

[node name="MeshInstance" type="MeshInstance" parent="CanvasLayer/ViewportContainer/Viewport"]
mesh = SubResource( 1 )
skeleton = NodePath("../../../..")
material/0 = null

[node name="Panel" type="Panel" parent="CanvasLayer"]
self_modulate = Color( 1, 1, 1, 0.160784 )
anchor_right = 1.0
anchor_bottom = 1.0
margin_left = 64.0
margin_top = 32.0
margin_right = -64.0
margin_bottom = -40.0
theme = ExtResource( 9 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ScrollContainer" type="ScrollContainer" parent="CanvasLayer/Panel"]
anchor_left = 0.071
anchor_top = 0.061
anchor_right = 0.929
anchor_bottom = 0.939
margin_left = 0.383999
margin_top = -0.208004
margin_right = -0.384033
margin_bottom = 0.207977
__meta__ = {
"_edit_use_anchors_": false
}

[node name="GridContainer" type="GridContainer" parent="CanvasLayer/Panel/ScrollContainer"]
margin_right = 192.0
margin_bottom = 192.0
columns = 3

[node name="ColorRect" type="ColorRect" parent="CanvasLayer/Panel/ScrollContainer/GridContainer"]
visible = false
material = SubResource( 8 )
margin_right = 192.0
margin_bottom = 192.0
rect_min_size = Vector2( 192, 192 )
rect_pivot_offset = Vector2( -32, 72 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ColorRect2" type="ColorRect" parent="CanvasLayer/Panel/ScrollContainer/GridContainer"]
visible = false
material = SubResource( 5 )
margin_right = 192.0
margin_bottom = 192.0
rect_min_size = Vector2( 192, 192 )
rect_pivot_offset = Vector2( 96, 96 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ColorRect3" type="ColorRect" parent="CanvasLayer/Panel/ScrollContainer/GridContainer"]
visible = false
material = SubResource( 6 )
margin_right = 192.0
margin_bottom = 192.0
rect_min_size = Vector2( 192, 192 )
rect_pivot_offset = Vector2( -32, 72 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="item" type="ColorRect" parent="CanvasLayer/Panel/ScrollContainer/GridContainer"]
material = SubResource( 7 )
margin_right = 192.0
margin_bottom = 192.0
rect_min_size = Vector2( 192, 192 )
rect_pivot_offset = Vector2( -32, 72 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Button" type="Button" parent="CanvasLayer"]
margin_left = 16.0
margin_top = 16.0
margin_right = 120.0
margin_bottom = 48.0
focus_mode = 0
theme = ExtResource( 9 )
shortcut_in_tooltip = false
enabled_focus_mode = 0
text = "Show Canvas"
script = ExtResource( 7 )
__meta__ = {
"_edit_use_anchors_": false
}

[connection signal="pressed" from="CanvasLayer/Button" to="CanvasLayer/Button" method="on_button_pressed"]
        RSCC      c  �  (�/�`c� e�H��$h:ᅼ� �3����4�$K	āS[M���7l҈$�2�ez�Ԡ�   4 1.�9& �T�@��jc
` f s �*�j9�5'_�e�V�[nʛ�����r[g�4��?�[���^��ny{,i]�O�J��-�)7��Թ�ʙ�v��ڌ[�o�U/��0�/�[�}�/��?�?��9�/����_�Mc_�������eջ��v��\�+9-�]��nW���7����;���v���F9�&�F�]WI���\��G��S�fNEf�$�f�Z�F�IY�O��ԸΊ�N �s�d:��Ǆ�;�Ӌ��O���hޣ�<'�����"Wa��S�eY�eY�e�d=ܘ��[^��e�P�`z,�i5o�-�sإu���EsV�m��e+uA����������,T
�����������p(��L��?@jR4�s��7`�u0j�������!��)ya�N AJLl`$���#U�d)��7I1L�4�	$IN ��$�
b��w��j�Q�P�4�﨡M"I
J���#ڶ@�,�!�EB�H$��P)l*iԐ�05��F>��u��|�B}�:j���$<b7�w�Z5_8��̣��ay��7Gx;3}b�/���D��K��4���.��#����̒�vy�b�-P�p�0'��ƠzA�.C{��@�h�c'�*a���)��)gd�Z��#�$r+�laY�%y )h�c�\y!(�ll
}�,�K��������է|�Ö%������_� 7Y��K�yO�Ѳۮh�В~ H�ۆ���zc���(m��e�Ր5���cv0'����'��|���<�k�E�O�U4�x!�|B|a �
{)�����cʎү�"��P�}��LV�x!�.��G�W�)Kx�N$�����
��_�6�]��Z����I�4/�x�Tmo�������Jz�E�KM&\���������;V��*�~��<RSCC[gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]
sky_top_color = Color( 1, 1, 1, 1 )
sky_horizon_color = Color( 0.976471, 0.976471, 0.976471, 1 )

[resource]
background_mode = 3
background_sky = SubResource( 1 )
background_color = Color( 0.615686, 0.827451, 0.658824, 1 )
GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              [gd_resource type="ShaderMaterial" load_steps=2 format=2]

[ext_resource path="res://shaders/refs/glitch_effect.shader" type="Shader" id=1]

[resource]
shader = ExtResource( 1 )
shader_param/shake_power = 0.03
shader_param/shake_rate = 0.2
shader_param/shake_speed = 5.0
shader_param/shake_block_size = 30.5
shader_param/shake_color_rate = 0.01
       GDSC             $      ������ڶ   ���¶���   �����϶�   �������Ŷ���   ����׶��                                                    	      
                      "      3YY8;�  �  PQYYYY0�  PQV�  -YYYY0�  P�  QV�  -Y`               GDSC      
   1   "     �����׶�   ����������������϶��   ���������Ҷ�   �������Ҷ���   �����϶�   ���������������Ŷ���   ����׶��   �����������Ķ���   ����¶��   ����������������Ҷ��   ��������   ���������Ҷ�   ��������Ӷ��   ζ��   ϶��   ���������������������Ҷ�   ���Ӷ���   �������������������   ������������������   �������������Ӷ�   �����¶�   ����¶��   ��۶   ���������¶�   �����������ض���   ��������������������ض��   �������ض���   ���������������Ŷ���   �������Ӷ���   �����������¶���   ��������������ض  �������?             ui_right      ui_left       ui_down       ui_up                freelook_toggle        Z                                                    #   	   %   
   &      '      .      6      K      _      a      i      q      �      �      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,     -     .     /     0      1   3YY8;�  V�  Y8;�  V�  Y8;�  V�  �  YYY0�  PQV�  -YYY0�  P�  QV�  ;�  V�  �  P�  �  P�  T�	  P�  QQ�  P�  T�	  P�  QQR�  �  P�  T�	  P�  QQ�  P�  T�	  P�  QQ�  Q�  &�  �  T�
  V�  �  �  T�  PQ�  �  P�  P�  T�  R�  R�  T�  Q�  QY�  &�  T�  P�  QV�  �  �  �  ;�  �  &�  V�  �  �  T�  �  (V�  �  �  T�  �  �  T�  P�  QYYY0�  P�  QV�  &�  V�  �  P�  QYYY0�  P�  V�  QV�  ;�  V�  �  <�  �  &�  �  V�  ;�  V�  �  �  �  T�  �  T�  T�  �  �  �  �  Y�  ;�  V�  �  T�  �  �  �  T�  T�  �  Y�  ;�  V�  �  �  �  T�  �5  P�  R�	  R�	  Q�  �  �  Y`              GDSC   	         H      ���ӄ�   �������������¶�   ������������Ӷ��   �����϶�   ������¶   �������Ŷ���   ����׶��   ���������������Ӷ���   ����������¶      commit_change         on_commit_change                                                    	       
   "      #      $      +      -      .      /      5      6      :      <      =      >      D      F      3YY8;�  �  PQYYB�  YYY0�  PQV�  �  PRR�  Q�  -YYY0�  P�  QV�  -YYY0�  PQV�  �  �  PQ�  -YYY0�  PQV�  -Y`  GDSC             "      ���ӄ�   ���¶���   �����϶�   �������Ŷ���   ����׶��                                                    	      
                3YY8;�  �  PQYYY0�  PQV�  -YYY0�  P�  QV�  -Y` GDSC            9      �����ض�   ����ڶ��   ����ڶ��   �����϶�   ���������¶�   �������Ӷ���   ����������������Ҷ��   ������Ӷ      Panel             no panel found                           	      
                  !   	   &   
   '      (      .      7      3YY;�  V�  YYY0�  PQV�  �  �  PQT�  PQ�  &�  �  V�  �E  P�  QYYY0�  PQV�  �  T�  �  T�  Y`      GDSC   	         :      ����������������Ķ��   �������¶���   �������¶���   �����϶�   �������Ӷ���   �����������¶���   ������¶   ��������������Ҷ   ���Ӷ���      Viewport      size_changed      on_size_changed                          	                  #      %   	   &   
   ,      6      7      8      3YY;�  V�  YY0�  PQV�  �  �  PQ�  �  PQT�  P�  RR�  Q�  -YY0�  PQV�  �  T�  �  PQT�  YYY`        shader_type canvas_item;

uniform vec2 resolution;
uniform vec2 mouse;
uniform sampler2D backbuffer;

const float PI = 3.141592653589793;

struct Camera {
	vec3 pos;
    vec3 dir;
    vec3 top;
    vec3 side;
    float depth;
};

struct Ray {
    vec3 origin;
	vec3 dir;
};

float random(vec2 p) {
	return fract(sin(dot(p, vec2(1.0, 1.1))));
}

mat2 rotate(float d) {
    float s = sin(d);
    float c = cos(d);
	return mat2(vec2(c, s), vec2(-s, c));
}

Camera createCamera(vec3 pos, vec3 dir, float depth) {
	Camera cam;
    cam.pos = pos;
    cam.dir = normalize(dir - pos);
	vec3 up = vec3(0.0, 1.0, 0.0);
    cam.side = normalize(cross(cam.dir, up));
    cam.top = normalize(cross(cam.side, cam.dir));
    cam.depth = depth;
    return cam;
}

Ray createRay(Camera cam, vec2 uv) {
	Ray ray;
    ray.origin = cam.pos;
    ray.dir = cam.side * uv.x + cam.top * uv.y + cam.dir * cam.depth;
    return ray;
}

struct obj{
	float d;
    vec3 c_shadow;
    vec3 c_light;
};

vec2 round(vec2 p) {
	return floor(p + 0.5);
}

vec2 repetition(vec2 p, float c) {
	return p - c * round(p / c);
}

obj subtractObj(obj a, obj b) {
	if (a.d > b.d) return a;
    else return b;
}

obj addObj(obj a, obj b) {
	if (a.d < b.d) return a;
    else return b;
}

float sdSphere(vec3 p, float r) {
	return length(p) - r;
}

float sdBox(vec3 p, vec3 c) {
	vec3 q = abs(p) - c;
    return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);
}

obj dist(vec3 p) {
    float time = TIME;
    
    vec3 shadow = vec3(0.4, 0.1, 0.3);
    vec3 lighting = vec3(0.8, 0.6, 0.9);
    
    vec3 p1 = p;
    p1.x += cos(time * 0.6) * 12.0;
    p1.z += sin(time + 500.0) * 18.0;
    float size = 10.0 + 5.0 * sin(mod(time * 50.0, 180.0) * 3.14 / 180.0);
    obj d1 = obj(-sdSphere(p1, size), shadow, lighting);
    
    for (int i = 0; i < 6; i++) {
        float o = -1.0;
        if (mod(float(i), 2.0) == 0.0) {
        	o = 1.0;
        }
    	p1.x += cos(time + float(i) * 50.0) * 10.0 + float(i) * 15.0 * o;
        p1.y += sin(time + float(i) * 1200.0) * float(i) * 9.0 * o;
        p1.z += sin(time + float(i) * 3900.0) * 14.0 + float(i) * 12.0 * o;
        size = 5.0 * sin(mod(time * 10.0 + float(i) * 800.0, 180.0) * PI / 180.0);
        d1 = subtractObj(d1, obj(-sdSphere(p1, size), shadow, lighting));
    }
    
    vec3 p0 = p;
    obj d0 = obj(sdSphere(p0 + vec3(0.0, 2.0, 0.0), 15.0), vec3(0.25, 0.0, 0.8), vec3(0.85, 0.65, 0.8));

    return subtractObj(d1, d0);
}

vec3 getRayPos(Ray ray, float rayLen) {
	return ray.origin + ray.dir * rayLen;
}

vec3 getNormal(vec3 p) {
    vec2 eps = vec2(0.001, 0.0);
	return normalize(vec3(
    	dist(p + eps.xyy).d - dist(p - eps.xyy).d,
    	dist(p + eps.yxy).d - dist(p - eps.yxy).d,
    	dist(p + eps.yyx).d - dist(p - eps.yyx).d
    ));
}

vec3 vexelTrace(Ray ray, Camera cam) {
    vec3 voxel = floor(ray.origin);
    vec3 rayStep = sign(ray.dir);
    vec3 tDelta = length(ray.dir) / abs(ray.dir);
    vec3 tMax = (sign(ray.dir) * (voxel - ray.origin) + (sign(ray.dir) * 0.5) + 0.5) * tDelta;
    vec3 hitVoxel = voxel;
    vec3 hitNormal;
    bool hit = false;
    bvec3 mask;
    obj o;
    
    for (int i = 0; i < 128; i++) {
    	o = dist(voxel);
        if (o.d <= 0.0 && !hit) {
            hit = true;
            hitVoxel = voxel;
        	break;
        }
        
        mask = lessThanEqual(tMax.xyz, min(tMax.yzx, tMax.zxy));
        tMax += vec3(mask) * tDelta;
        voxel += vec3(vec3(mask)) * rayStep;
    }
    
    if (hit) {
        vec3 color;
        if (mask.x) {
            color = vec3(0.05);
        }
        if (mask.y) {
            color = vec3(0.0);
        }
        if (mask.z) {
            color = vec3(0.05);
        }
        return mix(o.c_light, o.c_shadow, color);
    } else {
    	return vec3(0.6, 0.8, 0.75);
    }
}

// void main(void) {
void fragment() {
    // vec2 uv = (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
    vec2 uv = (UV * 2.0 - resolution.xy) / min(resolution.x, resolution.y);

    vec3 target = vec3(0.0, 0.0, 0.0);
    // float t = time * 0.3;
    float t = TIME * 0.3;
    float cameraRadius = 20.0;
    vec3 camPos = vec3(cos(t) * cameraRadius, cameraRadius * 0.8, sin(t) * cameraRadius);
    Camera cam = createCamera(camPos, target - camPos, 1.0);
    Ray ray = createRay(cam, uv);
    
    vec3 color = vexelTrace(ray, cam);

    // gl_FragColor = vec4(color, 1.0);
    COLOR = vec4(color, 1.0);
}               shader_type canvas_item;

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;
uniform sampler2D backbuffer;

vec3 permute(vec3 x) { return mod(((x*34.0)+1.0)*x, 289.0); }

float snoise(vec2 v){
  const vec4 C = vec4(0.211324865405187, 0.366025403784439,
           -0.577350269189626, 0.024390243902439);
  vec2 i  = floor(v + dot(v, C.yy) );
  vec2 x0 = v -   i + dot(i, C.xx);
  vec2 i1;
  i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
  vec4 x12 = x0.xyxy + C.xxzz;
  x12.xy -= i1;
  i = mod(i, 289.0);
  vec3 p = permute( permute( i.y + vec3(0.0, i1.y, 1.0 ))
  + i.x + vec3(0.0, i1.x, 1.0 ));
  vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy),
    dot(x12.zw,x12.zw)), 0.0);
  m = m*m ;
  m = m*m ;
  vec3 x = 2.0 * fract(p * C.www) - 1.0;
  vec3 h = abs(x) - 0.5;
  vec3 ox = floor(x + 0.5);
  vec3 a0 = x - ox;
  m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );
  vec3 g;
  g.x  = a0.x  * x0.x  + h.x  * x0.y;
  g.yz = a0.yz * x12.xz + h.yz * x12.yw;
  return 130.0 * dot(m, g);
}

mat2 rotate(float degree) {
    return mat2(vec2(
    	cos(degree),
        -sin(degree)),
        vec2(sin(degree),
        cos(degree))
    );
}

void fragment() {
    // vec2 uv = (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
    vec2 uv = (UV * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
    // vec2 uv = UV;

    float speed = 0.5;
    // float t = time * speed;
    float t = TIME * speed;
    uv *= rotate(t * 0.3);
    
    float frequency = 5.0;
    uv *= frequency;
    float noiseIntensity = 0.09;
    float d = length(uv) - t + snoise(uv) * noiseIntensity;
    float f = fract(d);

    
    float n = f * step(0.6, snoise(uv * 1000.0 + t));
    n = pow(n, 3.0);
    
    vec3 bgColor = vec3(0.88, 0.98, 0.95);
    vec3 color1 = vec3(0.2, 0.2, 0.5);
    vec3 color2 = vec3(0.1, 0.1, 0.5);
    vec3 color = mix(bgColor, color1, f);
    color = mix(color, color2, n);
    // gl_FragColor = vec4(color, 1.0);
    COLOR = vec4(color, 1.0);
}              /*
	Glitch Effect Shader by Yui Kinomoto @arlez80

	MIT License
*/

shader_type canvas_item;

// 振動の強さ
uniform float shake_power = 0.03;
// 振動率
uniform float shake_rate : hint_range( 0.0, 1.0 ) = 0.2;
// 振動速度
uniform float shake_speed = 5.0;
// 振動ブロックサイズ
uniform float shake_block_size = 30.5;
// 色の分離率
uniform float shake_color_rate : hint_range( 0.0, 1.0 ) = 0.01;

float random( float seed )
{
	return fract( 543.2543 * sin( dot( vec2( seed, seed ), vec2( 3525.46, -54.3415 ) ) ) );
}

void fragment( )
{
	float enable_shift = float(
		random( trunc( TIME * shake_speed ) )
	<	shake_rate
	);

	vec2 fixed_uv = UV;
	fixed_uv.x += (
		random(
			( trunc( UV.y * shake_block_size ) / shake_block_size )
		+	TIME
		) - 0.5
	) * shake_power * enable_shift;

	vec4 pixel_color = textureLod( TEXTURE, fixed_uv, 0.0 );
	pixel_color.r = mix(
		pixel_color.r
	,	textureLod( TEXTURE, fixed_uv + vec2( shake_color_rate, 0.0 ), 0.0 ).r
	,	enable_shift
	);
	pixel_color.b = mix(
		pixel_color.b
	,	textureLod( TEXTURE, fixed_uv + vec2( -shake_color_rate, 0.0 ), 0.0 ).b
	,	enable_shift
	);
	COLOR = pixel_color;
}
             // precision highp float;
shader_type canvas_item;

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;
uniform sampler2D backbuffer;

const vec3 backgroundColor = vec3(0.15, 0.0, 0.6);
const vec3 ballColor = vec3(0.8, 0.3, 0.4);

// #define PI 3.141592653589793
const float PI = 3.141592653589793; 

struct obj{
	float d;
    vec3 shadow;
    vec3 light;
};

float sphere(vec3 p, float r) {
	return length(p) - r;
}

float box(vec3 p, vec3 c) {
	vec3 q = abs(p) - c;
    return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);
}

/**
 * Meta ball
 */
float smin(float a, float b, float k) {
	float h = max(k - abs(a - b), 0.0);
    return min(a, b) - h * h * 0.25 / k;
}

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

obj addObj(obj a, obj b) {
	if (a.d < b.d) {
    	return a;
    } else {
    	return b;
    }
}

obj dist(vec3 p) {
    float d = 1.0;
    
    float shadow_d = 1.0;
    float r = 2.0;
    // float t = time * 0.1;
    float t = TIME * 0.1;
    for (int i = 0; i < 12; i++) {
        float r1 = rand(vec2(float(i) / 16.0 * 360.0)) + 0.1;
        float r2 = rand(vec2(float(i) / 16.0 * 540.0)) * 2.0 - 1.0;
        float _t = 360.0 * fract(t * float(i) * 0.13) * PI / 180.0;
        vec3 m = vec3(
            cos(_t) * r,
            // sin(t + float(i) * 0.2) * r,
            sin(_t) * r,
            0.0
        );
        float size = 0.15;
    	d = smin(d, sphere(p + m, size), 0.9);
        shadow_d = smin(shadow_d, sphere(p + m + vec3(0.2, 0.4, 0.6), size), 0.9);
    }
    
    float noise = rand(p.xz);
    obj o1 = obj(d, mix(vec3(0.2, 0.3, 0.5), vec3(0.5, 0.25, 0.8), noise), ballColor);
    vec3 ns = backgroundColor * 0.85;
    obj o2 = obj(shadow_d, ns, ns);
    
    // Floor
    float theFloor = box(p + vec3(0.0, 0.0, 0.0), vec3(3.0, 0.25, 0.5));
    d = smin(o1.d, theFloor, 0.5);
    obj o12 = addObj(obj(d, o1.shadow, o1.light), o1);

    return addObj(o12, o2);
}

vec3 getNorm(vec3 p) {
    vec2 e = vec2(0.001, 0.0);
    return normalize(vec3(
    	dist(p + e.xyy).d - dist(p - e.xyy).d,
    	dist(p + e.yxy).d - dist(p - e.yxy).d,
    	dist(p + e.yyx).d - dist(p - e.yyx).d
    ));
}

void fragment() {
    // vec2 uv = (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
    vec2 uv = (UV * 2.0 - resolution.xy) / min(resolution.x, resolution.y);

    // float t = time;
    float t = TIME;
    float r = 3.0;
    vec3 target = vec3(0.0, 0.0, 0.0);
    vec3 cameraPos = vec3(cos(t) * r, 0.0, sin(t) * r);
    cameraPos = vec3(0.0, 0.0, r);
    vec3 cameraDir = normalize(target - vec3(0.0, 0.0, 1.0) - cameraPos);
    // vec3 cameraDir = vec3(0.0, 0.0, -1.0);
    vec3 cameraSide = normalize(cross(cameraDir, vec3(0.0, 1.0, 0.0)));
    vec3 cameraUp = normalize(cross(cameraSide, cameraDir));
    
    vec3 rayDir = normalize(uv.x * cameraSide + uv.y * cameraUp + cameraDir);
    
    vec3 rayPos = cameraPos;
    bool isHit = false;
    obj o;
    
    for (int i = 0; i < 64; i++) {
        o = dist(rayPos);
        
        if (abs(o.d) < 0.001) {
            isHit = true;
            break;
        }
        
        rayPos += o.d * rayDir;
    }
    
    vec3 color = backgroundColor;
    if (isHit) {
        vec3 n = getNorm(rayPos);
        vec3 light = vec3(0.0, 1.0, 1.0);
        float diff = max(dot(light, n), 0.0);
        float f = rand(uv * 1.0);
        // color = mix(mix(vec3(0.1, 0.6, 0.9), o.light, f), o.light, diff);
        color = mix(o.shadow, o.light, diff);
    }

    // gl_FragColor = vec4(color, 1.0);
    COLOR = vec4(color, 1.0);
}             // precision highp float;
shader_type canvas_item;

uniform vec2 resolution;
//uniform float time;
uniform vec2 mouse;
uniform sampler2D backbuffer;

// #define PI 3.141592653589793
const float PI = 3.141592653589793;

struct Camera {
	vec3 pos;
    vec3 dir;
    vec3 top;
    vec3 side;
    float depth;
};

struct Ray {
    vec3 origin;
	vec3 dir;
};

float random(vec2 p) {
	return fract(sin(dot(p, vec2(1.0, 1.1))));
}

mat2 rotate(float d) {
    float s = sin(d);
    float c = cos(d);
	return mat2(vec2(c, s), vec2(-s, c));
}

Camera createCamera(vec3 pos, vec3 dir, float depth) {
	Camera cam;
    cam.pos = pos;
    cam.dir = normalize(dir - pos);
	vec3 up = vec3(0.0, 1.0, 0.0);
    cam.side = normalize(cross(cam.dir, up));
    cam.top = normalize(cross(cam.side, cam.dir));
    cam.depth = depth;
    return cam;
}

Ray createRay(Camera cam, vec2 uv) {
	Ray ray;
    ray.origin = cam.pos;
    ray.dir = cam.side * uv.x + cam.top * uv.y + cam.dir * cam.depth;
    return ray;
}

struct obj{
	float d;
    vec3 c_shadow;
    vec3 c_light;
};

vec2 round(vec2 p) {
	return floor(p + 0.5);
}

vec2 repetition(vec2 p, float c) {
	return p - c * round(p / c);
}

obj subtractObj(obj a, obj b) {
	if (a.d > b.d) return a;
    else return b;
}

obj addObj(obj a, obj b) {
	if (a.d < b.d) return a;
    else return b;
}

float sdSphere(vec3 p, float r) {
	return length(p) - r;
}

float sdBox(vec3 p, vec3 c) {
	vec3 q = abs(p) - c;
    return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);
}

obj dist(vec3 p) {
    float time = TIME;
    
    vec3 shadow = vec3(0.8, 0.1, 0.3);
    vec3 lighting = vec3(0.0, 0.2, 0.9);
    
    vec3 p1 = p;
    p1.x += cos(time * 0.6) * 12.0;
    p1.z += sin(time + 500.0) * 18.0;
    float size = 10.0 + 5.0 * sin(mod(time * 50.0, 180.0) * 3.14 / 180.0);
    obj d1 = obj(-sdSphere(p1, size), shadow, lighting);
    
    for (int i = 0; i < 6; i++) {
        float o = -1.0;
        if (mod(float(i), 2.0) == 0.0) {
        	o = 1.0;
        }
    	p1.x += cos(time + float(i) * 50.0) * 10.0 + float(i) * 15.0 * o;
        p1.y += sin(time + float(i) * 1200.0) * float(i) * 9.0 * o;
        p1.z += sin(time + float(i) * 3900.0) * 14.0 + float(i) * 12.0 * o;
        size = 15.0 * sin(mod(time * 10.0 + float(i) * 800.0, 180.0) * PI / 180.0);
        d1 = subtractObj(d1, obj(-sdSphere(p1, size), shadow, lighting));
    }
    
    vec3 p0 = p;
    obj d0 = obj(sdBox(p0 + vec3(0.0, 2.0, 0.0), vec3(14.0, 12.0, 14.0)), vec3(0.25, 0.0, 0.8), vec3(0.1, 0.6, 0.9));

    return subtractObj(d1, d0);
}

vec3 getRayPos(Ray ray, float rayLen) {
	return ray.origin + ray.dir * rayLen;
}

vec3 getNormal(vec3 p) {
    vec2 eps = vec2(0.001, 0.0);
	return normalize(vec3(
    	dist(p + eps.xyy).d - dist(p - eps.xyy).d,
    	dist(p + eps.yxy).d - dist(p - eps.yxy).d,
    	dist(p + eps.yyx).d - dist(p - eps.yyx).d
    ));
}

vec3 vexelTrace(Ray ray, Camera cam) {
    vec3 voxel = floor(ray.origin);
    vec3 rayStep = sign(ray.dir);
    // vec3 tDelta = 1.0 / abs(ray.dir);
    vec3 tDelta = length(ray.dir) / abs(ray.dir);
    // vec3 tMax = (voxel - ray.origin) / ray.dir;
    vec3 tMax = (sign(ray.dir) * (voxel - ray.origin) + (sign(ray.dir) * 0.5) + 0.5) * tDelta;
    vec3 hitVoxel = voxel;
    vec3 hitNormal;
    bool hit = false;
    bvec3 mask;
    obj o;
    
    for (int i = 0; i < 128; i++) {
    	o = dist(voxel);
        if (o.d <= 0.0 && !hit) {
            hit = true;
            hitVoxel = voxel;
        	break;
        }
        
        mask = lessThanEqual(tMax.xyz, min(tMax.yzx, tMax.zxy));
        tMax += vec3(mask) * tDelta;
        voxel += vec3(vec3(mask)) * rayStep;
    }
    
    if (hit) {
        vec3 color;
        if (mask.x) {
            color = vec3(0.5);
        }
        if (mask.y) {
            color = vec3(0.0);
        }
        if (mask.z) {
            color = vec3(1.0);
        }
        return mix(o.c_light, o.c_shadow, color);
    } else {
    	return vec3(0.9, 0.3, 0.75);
    }
}

// void main(void) {
void fragment() {
    // vec2 uv = (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
    vec2 uv = (UV * 2.0 - resolution.xy) / min(resolution.x, resolution.y);

    vec3 target = vec3(0.0, 0.0, 0.0);
    // float t = time * 0.3;
    float t = TIME * 0.3;
    float cameraRadius = 25.0;
    vec3 camPos = vec3(cos(t) * cameraRadius, cameraRadius * 0.8, sin(t) * cameraRadius);
    Camera cam = createCamera(camPos, target - camPos, 1.0);
    Ray ray = createRay(cam, uv);
    
    vec3 color = vexelTrace(ray, cam);

    // gl_FragColor = vec4(color, 1.0);
    COLOR = vec4(color, 1.0);
}       [remap]

path="res://scripts/canvas_item.gdc"
  [remap]

path="res://scripts/freelook.gdc"
     [remap]

path="res://scripts/script_loader.gdc"
[remap]

path="res://scripts/spatial_item.gdc"
 [remap]

path="res://scripts/toggle_panel.gdc"
 [remap]

path="res://scripts/viewport_resizer.gdc"
             �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name         shader-showcase    application/run/main_scene         res://Main.tscn    application/config/icon         res://icon.png     global/terminal             input/ui_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      physical_scancode             unicode           echo          script         input/ui_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      physical_scancode             unicode           echo          script         input/ui_up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      physical_scancode             unicode           echo          script         input/ui_down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      physical_scancode             unicode           echo          script         input/freelook_toggle�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode             unicode           echo          script      )   physics/common/enable_pause_aware_picking         $   rendering/quality/driver/driver_name         GLES2   )   rendering/environment/default_environment          res://default_env.tres             