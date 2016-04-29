// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 476.2KB

Shader "Bumped Specular Map" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _Shininess ("Shininess", Range(0.01,1)) = 0.078125
 _MainTex ("Base (RGB) Alpha (A)", 2D) = "white" {}
 _BumpMap ("Normalmap", 2D) = "bump" {}
 _GlossMap ("Gloss (A)", 2D) = "black" {}
 _SpecColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
 _Scale ("Scale", Vector) = (1,1,1,1)
 _SquashAmount ("Squash", Float) = 1
}
SubShader { 
 LOD 200
 Tags { "RenderType"="TreeBark" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="TreeBark" }
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Vector 24 [_Scale]
Vector 25 [_SquashPlaneNormal]
Float 26 [_SquashAmount]
Vector 27 [_Wind]
Vector 28 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[31] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..28],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MUL R2.xyz, vertex.position, c[24];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[13].y;
MUL R0, R0.xxyy, c[29];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, c[27];
MUL R0.x, vertex.color.y, c[30].y;
MOV R1.w, c[0].x;
MOV R0.w, c[0].x;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.xz, R0.x, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[30].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[27].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[27], R0;
DP3 R0.x, R1, c[25];
ADD R0.x, R0, c[25].w;
MUL R0.xyz, R0.x, c[25];
ADD R1.xyz, -R0, R1;
MAD R1.xyz, R0, c[26].x, R1;
DP3 R0.y, vertex.attrib[14], vertex.attrib[14];
RSQ R0.y, R0.y;
DP3 R0.x, vertex.normal, vertex.normal;
RSQ R0.x, R0.x;
MUL R2.xyz, R0.x, vertex.normal;
MUL R3.xyz, R0.y, vertex.attrib[14];
MUL R0.xyz, R2.zxyw, R3.yzxw;
MAD R4.xyz, R2.yzxw, R3.zxyw, -R0;
MOV R0.xyz, c[14];
DP4 R5.z, R0, c[11];
DP4 R5.x, R0, c[9];
DP4 R5.y, R0, c[10];
MAD R0.xyz, R5, c[23].w, -R1;
MUL R4.xyz, R4, vertex.attrib[14].w;
MOV R0.w, c[0].x;
DP3 result.texcoord[3].z, R2, R0;
DP3 result.texcoord[3].y, R4, R0;
DP3 result.texcoord[3].x, R3, R0;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MUL R1.xyz, R2, c[23].w;
DP3 R2.w, R1, c[6];
MOV R0.y, R2.w;
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MUL R1, R0.xyzz, R0.yzzx;
DP4 R5.z, R0, c[18];
DP4 R5.y, R0, c[17];
DP4 R5.x, R0, c[16];
MUL R2.w, R2, R2;
DP4 R0.w, R1, c[21];
DP4 R0.z, R1, c[20];
DP4 R0.y, R1, c[19];
ADD R1.xyz, R5, R0.yzww;
MAD R0.x, R0, R0, -R2.w;
MUL R5.xyz, R0.x, c[22];
MOV R0, c[15];
ADD result.texcoord[2].xyz, R1, R5;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 result.texcoord[1].y, R1, R4;
DP3 result.texcoord[1].z, R2, R1;
DP3 result.texcoord[1].x, R1, R3;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[28], c[28].zwzw;
MOV result.color.w, vertex.color;
END
# 82 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_Scale]
Vector 24 [_SquashPlaneNormal]
Float 25 [_SquashAmount]
Vector 26 [_Wind]
Vector 27 [_MainTex_ST]
"vs_2_0
def c28, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c29, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c30, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c28.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mul r2.xyz, v0, c23
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c12.y
mul r0, r0.xxyy, c29
frc r0, r0
mad r0, r0, c28.y, c28.z
frc r0, r0
mad r0, r0, c28.y, c28.w
abs r0, r0
mad r1, -r0, c30.x, c30.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r1.xyz, r3.y, c26
mul r0.x, v5.y, c30.w
mov r1.w, c28.x
mov r0.w, c28.x
mul r1.xyz, v4.y, r1
mul r0.xz, r0.x, v2
mul r0.y, v4, c30.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c26.w, r2
mad r1.xyz, v4.x, c26, r0
dp3 r0.x, r1, c24
add r0.x, r0, c24.w
mul r0.xyz, r0.x, c24
add r1.xyz, -r0, r1
mad r1.xyz, r0, c25.x, r1
dp3 r0.y, v1, v1
rsq r0.y, r0.y
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r2.xyz, r0.x, v2
mul r3.xyz, r0.y, v1
mul r0.xyz, r2.zxyw, r3.yzxw
mad r4.xyz, r2.yzxw, r3.zxyw, -r0
mov r0.xyz, c13
dp4 r5.z, r0, c10
dp4 r5.x, r0, c8
dp4 r5.y, r0, c9
mad r0.xyz, r5, c22.w, -r1
mul r4.xyz, r4, v1.w
mov r0.w, c28.x
dp3 oT3.z, r2, r0
dp3 oT3.y, r4, r0
dp3 oT3.x, r3, r0
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mul r1.xyz, r2, c22.w
dp3 r2.w, r1, c5
mov r0.y, r2.w
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mul r1, r0.xyzz, r0.yzzx
dp4 r5.z, r0, c17
dp4 r5.y, r0, c16
dp4 r5.x, r0, c15
mul r2.w, r2, r2
dp4 r0.w, r1, c20
dp4 r0.z, r1, c19
dp4 r0.y, r1, c18
add r1.xyz, r5, r0.yzww
mad r0.x, r0, r0, -r2.w
mul r5.xyz, r0.x, c21
add oT2.xyz, r1, r5
mov r0, c10
dp4 r5.z, c14, r0
mov r1, c8
mov r0, c9
dp4 r5.x, c14, r1
dp4 r5.y, c14, r0
dp3 oT1.y, r5, r4
dp3 oT1.z, r2, r5
dp3 oT1.x, r5, r3
mov oD0.xyz, c28.x
mad oT0.xy, v3, c27, c27.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedgomkcjponoeepjeplmgjadajlmlhakieabaaaaaaomamaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcdealaaaaeaaaabaamnacaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacaiaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
acaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaaba
pcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaa
pgapbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaahhcaabaaaaeaaaaaajgaebaaa
acaaaaaacgajbaaaadaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaaadaaaaaa
cgajbaaaacaaaaaaegacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaa
egacbaaaaeaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaa
aeaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaadaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaafaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
abaaaaaaegaibaaaafaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaficaabaaaabaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaafaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaabaaaaaabbaaaaaiccaabaaaafaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaabaaaaaabbaaaaaiecaabaaaafaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaagaaaaaajgacbaaaabaaaaaaegakbaaa
abaaaaaabbaaaaaibcaabaaaahaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
agaaaaaabbaaaaaiccaabaaaahaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
agaaaaaabbaaaaaiecaabaaaahaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
agaaaaaaaaaaaaahhcaabaaaafaaaaaaegacbaaaafaaaaaaegacbaaaahaaaaaa
diaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaak
icaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaa
aaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaa
aaaaaaaaegacbaaaafaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaafaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaaeaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedkejacephmjpfpogaibkljjcjecgkjbbeabaaaaaagabdaaaaaeaaaaaa
daaaaaaakaagaaaanmbbaaaakebcaaaaebgpgodjgiagaaaagiagaaaaaaacpopp
lmafaaaakmaaaaaaalaaceaaaaaakiaaaaaakiaaaaaaceaaabaakiaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaabaaaeaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaaacaacgaaahaaagaa
aaaaaaaaadaaaaaaaeaaanaaaaaaaaaaadaaamaaadaabbaaaaaaaaaaadaabaaa
afaabeaaaaaaaaaaaeaaafaaabaabjaaaaaaaaaaaeaaakaaacaabkaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafbmaaapkamnmmpmdpamaceldpaaaamadomlkbefdo
fbaaaaafbnaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaafboaaapka
aaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafbpaaapkaaaaaaaaaaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaabaaaaacaaaaapiaafaaoekaafaaaaadabaaahiaaaaaffiabfaaoeka
aeaaaaaeabaaahiabeaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabgaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiabhaaoekaaaaappiaaaaaoeiaceaaaaac
abaaahiaabaaoejaaiaaaaadacaaaboaabaaoeiaaaaaoeiaceaaaaacacaaahia
acaaoejaafaaaaadadaaahiaabaamjiaacaanciaaeaaaaaeadaaahiaacaamjia
abaanciaadaaoeibafaaaaadadaaahiaadaaoeiaabaappjaaiaaaaadacaaacoa
adaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeiaaaaaoeiaabaaaaacaaaaabia
bbaappkaabaaaaacaaaaaciabcaappkaabaaaaacaaaaaeiabdaappkaaiaaaaad
aaaaabiaaaaaoeiabnaaaakaacaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaad
aaaaaeiaaaaaffiaafaaffjaafaaaaadaeaaahiaaaaaoejabjaaoekaaiaaaaad
aaaaabiaaeaaoeiaaaaakkiaacaaaaadaaaaapiaaaaafaiaadaaffkaafaaaaad
aaaaapiaaaaaoeiabmaaoekabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapia
aaaaoeiabnaaffkabnaakkkabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapia
aaaaoeiabnaaffkabnaappkacdaaaaacaaaaapiaaaaaoeiaafaaaaadafaaapia
aaaaoeiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaboaaaakbboaaffkaafaaaaad
aaaaapiaaaaaoeiaafaaoeiaacaaaaadaaaaadiaaaaaoniaaaaaoiiaafaaaaad
afaaahiaaaaaffiaabaaoekaafaaaaadafaaahiaafaaoeiaaeaaffjaafaaaaad
agaaaciaaaaaffiaaeaaffjaafaaaaadaaaaaciaafaaffjaboaakkkaafaaaaad
agaaafiaaaaaffiaacaaoejaabaaaaacaaaaaeiaboaappkaaeaaaaaeaaaaahia
aaaamiiaagaaoeiaafaaoeiaaeaaaaaeaaaaahiaaaaaoeiaabaappkaaeaaoeia
aeaaaaaeaaaaahiaaeaaaajaabaaoekaaaaaoeiaaiaaaaadaaaaaiiabkaaoeka
aaaaoeiaacaaaaadaaaaaiiaaaaappiabkaappkaaeaaaaaeaeaaahiaaaaappia
bkaaoekbaaaaoeiabcaaaaaeafaaahiablaaaakaaaaaoeiaaeaaoeiaabaaaaac
aaaaahiaaeaaoekaafaaaaadaeaaahiaaaaaffiabfaaoekaaeaaaaaeaaaaalia
beaakekaaaaaaaiaaeaakeiaaeaaaaaeaaaaahiabgaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabhaaoekaaeaaaaaeaaaaahiaaaaaoeiabiaappka
afaaoeibaiaaaaadaeaaaboaabaaoeiaaaaaoeiaaiaaaaadaeaaacoaadaaoeia
aaaaoeiaaiaaaaadaeaaaeoaacaaoeiaaaaaoeiaafaaaaadaaaaahiaacaaoeia
biaappkaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeaaaaaliabbaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiabnaaaakaajaaaaadabaaabiaagaaoekaaaaaoeiaajaaaaadabaaacia
ahaaoekaaaaaoeiaajaaaaadabaaaeiaaiaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaajaaoekaacaaoeiaajaaaaadadaaacia
akaaoekaacaaoeiaajaaaaadadaaaeiaalaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaamaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaafaaffiaaoaaoekaaeaaaaaeaaaaapiaanaaoekaafaaaaia
aaaaoeiaaeaaaaaeaaaaapiaapaaoekaafaakkiaaaaaoeiaacaaaaadaaaaapia
aaaaoeiabaaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjabpaaeakabpaabfkappppaaaa
fdeieefcdealaaaaeaaaabaamnacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaa
fpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
lcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacaiaaaaaadgaaaaag
bcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
dkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaa
aoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaa
afaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaa
afaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaa
diaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldp
aaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialp
aaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaa
egaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaa
aaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaa
diaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaah
ccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
adaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
abeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaal
hcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegbcbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegbcbaaaacaaaaaa
diaaaaahhcaabaaaaeaaaaaajgaebaaaacaaaaaacgajbaaaadaaaaaadcaaaaak
hcaabaaaaeaaaaaajgaebaaaadaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
aeaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaaaeaaaaaapgbpbaaaabaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaabaaaaaah
bccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaadaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaafaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaafaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
afaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
afaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
afaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
agaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaahaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaagaaaaaabbaaaaaiccaabaaaahaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaagaaaaaabbaaaaaiecaabaaaahaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaagaaaaaaaaaaaaahhcaabaaaafaaaaaa
egacbaaaafaaaaaaegacbaaaahaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaa
aaaaaaaabaaaaaahbccabaaaafaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaafaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
cccabaaaafaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_ProjectionParams]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [unity_Scale]
Vector 25 [_Scale]
Vector 26 [_SquashPlaneNormal]
Float 27 [_SquashAmount]
Vector 28 [_Wind]
Vector 29 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[32] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..29],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MOV R4.w, c[0].x;
MUL R2.xyz, vertex.position, c[25];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[13].y;
MUL R0, R0.xxyy, c[30];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, c[28];
MUL R0.x, vertex.color.y, c[31].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.xz, R0.x, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[31].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[28].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[28], R0;
DP3 R0.x, R1, c[26];
ADD R0.x, R0, c[26].w;
MUL R0.xyz, R0.x, c[26];
ADD R1.xyz, -R0, R1;
MAD R4.xyz, R0, c[27].x, R1;
DP4 R0.w, R4, c[4];
DP4 R0.z, R4, c[3];
DP4 R0.x, R4, c[1];
DP4 R0.y, R4, c[2];
MUL R1.xyz, R0.xyww, c[31].z;
MOV result.position, R0;
MUL R1.y, R1, c[15].x;
MOV result.texcoord[4].zw, R0;
DP3 R0.y, vertex.attrib[14], vertex.attrib[14];
RSQ R0.y, R0.y;
DP3 R0.x, vertex.normal, vertex.normal;
RSQ R0.x, R0.x;
MUL R2.xyz, R0.x, vertex.normal;
MUL R3.xyz, R0.y, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MUL R1.xyz, R2.zxyw, R3.yzxw;
MOV R0.w, c[0].x;
MOV R0.xyz, c[14];
DP4 R5.z, R0, c[11];
DP4 R5.x, R0, c[9];
DP4 R5.y, R0, c[10];
MAD R0.xyz, R5, c[24].w, -R4;
MAD R1.xyz, R2.yzxw, R3.zxyw, -R1;
MUL R4.xyz, R1, vertex.attrib[14].w;
MUL R1.xyz, R2, c[24].w;
MOV R0.w, c[0].x;
DP3 result.texcoord[3].z, R2, R0;
DP3 result.texcoord[3].y, R4, R0;
DP3 result.texcoord[3].x, R3, R0;
DP3 R2.w, R1, c[6];
MOV R0.y, R2.w;
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MUL R1, R0.xyzz, R0.yzzx;
DP4 R5.z, R0, c[19];
DP4 R5.y, R0, c[18];
DP4 R5.x, R0, c[17];
MUL R2.w, R2, R2;
DP4 R0.w, R1, c[22];
DP4 R0.z, R1, c[21];
DP4 R0.y, R1, c[20];
ADD R1.xyz, R5, R0.yzww;
MAD R0.x, R0, R0, -R2.w;
MUL R5.xyz, R0.x, c[23];
MOV R0, c[16];
ADD result.texcoord[2].xyz, R1, R5;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 result.texcoord[1].y, R1, R4;
DP3 result.texcoord[1].z, R2, R1;
DP3 result.texcoord[1].x, R1, R3;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[29], c[29].zwzw;
MOV result.color.w, vertex.color;
END
# 87 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_ScreenParams]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [unity_Scale]
Vector 25 [_Scale]
Vector 26 [_SquashPlaneNormal]
Float 27 [_SquashAmount]
Vector 28 [_Wind]
Vector 29 [_MainTex_ST]
"vs_2_0
def c30, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c31, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c32, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c33, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c30.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r4.w, c30.x
mul r2.xyz, v0, c25
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c12.y
mul r0, r0.xxyy, c31
frc r0, r0
mad r0, r0, c30.y, c30.z
frc r0, r0
mad r0, r0, c30.y, c30.w
abs r0, r0
mad r1, -r0, c32.x, c32.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r1.xyz, r3.y, c28
mul r0.x, v5.y, c32.w
mul r1.xyz, v4.y, r1
mul r0.xz, r0.x, v2
mul r0.y, v4, c32.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c28.w, r2
mad r1.xyz, v4.x, c28, r0
dp3 r0.x, r1, c26
add r0.x, r0, c26.w
mul r0.xyz, r0.x, c26
add r1.xyz, -r0, r1
mad r4.xyz, r0, c27.x, r1
dp4 r0.w, r4, c3
dp4 r0.z, r4, c2
dp4 r0.x, r4, c0
dp4 r0.y, r4, c1
mul r1.xyz, r0.xyww, c33.x
mov oPos, r0
mul r1.y, r1, c14.x
mov oT4.zw, r0
dp3 r0.y, v1, v1
rsq r0.y, r0.y
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r2.xyz, r0.x, v2
mul r3.xyz, r0.y, v1
mad oT4.xy, r1.z, c15.zwzw, r1
mul r1.xyz, r2.zxyw, r3.yzxw
mov r0.w, c30.x
mov r0.xyz, c13
dp4 r5.z, r0, c10
dp4 r5.x, r0, c8
dp4 r5.y, r0, c9
mad r0.xyz, r5, c24.w, -r4
mad r1.xyz, r2.yzxw, r3.zxyw, -r1
mul r4.xyz, r1, v1.w
mul r1.xyz, r2, c24.w
mov r0.w, c30.x
dp3 oT3.z, r2, r0
dp3 oT3.y, r4, r0
dp3 oT3.x, r3, r0
dp3 r2.w, r1, c5
mov r0.y, r2.w
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mul r1, r0.xyzz, r0.yzzx
dp4 r5.z, r0, c19
dp4 r5.y, r0, c18
dp4 r5.x, r0, c17
mul r2.w, r2, r2
dp4 r0.w, r1, c22
dp4 r0.z, r1, c21
dp4 r0.y, r1, c20
add r1.xyz, r5, r0.yzww
mad r0.x, r0, r0, -r2.w
mul r5.xyz, r0.x, c23
add oT2.xyz, r1, r5
mov r0, c10
dp4 r5.z, c16, r0
mov r1, c8
mov r0, c9
dp4 r5.x, c16, r1
dp4 r5.y, c16, r0
dp3 oT1.y, r5, r4
dp3 oT1.z, r2, r5
dp3 oT1.x, r5, r3
mov oD0.xyz, c30.x
mad oT0.xy, v3, c29, c29.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedabiglejocgccenkbojjifgojdaanfnfhabaaaaaalianaaaaadaaaaaa
cmaaaaaapeaaaaaamiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheommaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaamfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefcoialaaaaeaaaabaapkacaaaafjaaaaaeegiocaaa
aaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaa
aeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacajaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaa
abaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaa
dcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaa
agbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaahaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaa
dkbabaaaafaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
abaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegbcbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaaaaaaaaa
egbcbaaaacaaaaaadiaaaaahhcaabaaaafaaaaaajgaebaaaadaaaaaacgajbaaa
aeaaaaaadcaaaaakhcaabaaaafaaaaaajgaebaaaaeaaaaaacgajbaaaadaaaaaa
egacbaiaebaaaaaaafaaaaaadiaaaaahhcaabaaaafaaaaaaegacbaaaafaaaaaa
pgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaafaaaaaaegacbaaa
acaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
baaaaaaheccabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaagaaaaaafgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaacaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaa
agaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
acaaaaaaegadbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaagaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaagaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaagaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaahaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaai
bcaabaaaaiaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaahaaaaaabbaaaaai
ccaabaaaaiaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaahaaaaaabbaaaaai
ecaabaaaaiaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaahaaaaaaaaaaaaah
hcaabaaaagaaaaaaegacbaaaagaaaaaaegacbaaaaiaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakicaabaaaaaaaaaaa
akaabaaaacaaaaaaakaabaaaacaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaa
agaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
aaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
egacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegacbaaaaeaaaaaaegacbaaa
aaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaafaaaaaaegacbaaaaaaaaaaa
diaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaak
fcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadgaaaaafmccabaaaagaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaa
agaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedbcabdbokkidbgjdpehjdigfbigedfenlabaaaaaahibeaaaaaeaaaaaa
daaaaaaaomagaaaanmbcaaaakebdaaaaebgpgodjleagaaaaleagaaaaaaacpopp
aiagaaaakmaaaaaaalaaceaaaaaakiaaaaaakiaaaaaaceaaabaakiaaaaaaahaa
abaaabaaaaaaaaaaaaaaalaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaaacaacgaaahaaahaa
aaaaaaaaadaaaaaaaeaaaoaaaaaaaaaaadaaamaaadaabcaaaaaaaaaaadaabaaa
afaabfaaaaaaaaaaaeaaafaaabaabkaaaaaaaaaaaeaaakaaacaablaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafbnaaapkamnmmpmdpamaceldpaaaamadomlkbefdo
fbaaaaafboaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaafbpaaapka
aaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafcaaaapkaaaaaaaaaaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahiaaaaaffiabgaaoeka
aeaaaaaeabaaahiabfaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabhaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiabiaaoekaaaaappiaaaaaoeiaceaaaaac
abaaahiaabaaoejaaiaaaaadacaaaboaabaaoeiaaaaaoeiaceaaaaacacaaahia
acaaoejaafaaaaadadaaahiaabaamjiaacaanciaaeaaaaaeadaaahiaacaamjia
abaanciaadaaoeibafaaaaadadaaahiaadaaoeiaabaappjaaiaaaaadacaaacoa
adaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeiaaaaaoeiaabaaaaacaaaaabia
bcaappkaabaaaaacaaaaaciabdaappkaabaaaaacaaaaaeiabeaappkaaiaaaaad
aaaaabiaaaaaoeiaboaaaakaacaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaad
aaaaaeiaaaaaffiaafaaffjaafaaaaadaeaaahiaaaaaoejabkaaoekaaiaaaaad
aaaaabiaaeaaoeiaaaaakkiaacaaaaadaaaaapiaaaaafaiaadaaffkaafaaaaad
aaaaapiaaaaaoeiabnaaoekabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapia
aaaaoeiaboaaffkaboaakkkabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapia
aaaaoeiaboaaffkaboaappkacdaaaaacaaaaapiaaaaaoeiaafaaaaadafaaapia
aaaaoeiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabpaaaakbbpaaffkaafaaaaad
aaaaapiaaaaaoeiaafaaoeiaacaaaaadaaaaadiaaaaaoniaaaaaoiiaafaaaaad
afaaahiaaaaaffiaabaaoekaafaaaaadafaaahiaafaaoeiaaeaaffjaafaaaaad
agaaaciaaaaaffiaaeaaffjaafaaaaadaaaaaciaafaaffjabpaakkkaafaaaaad
agaaafiaaaaaffiaacaaoejaabaaaaacaaaaaeiabpaappkaaeaaaaaeaaaaahia
aaaamiiaagaaoeiaafaaoeiaaeaaaaaeaaaaahiaaaaaoeiaabaappkaaeaaoeia
aeaaaaaeaaaaahiaaeaaaajaabaaoekaaaaaoeiaaiaaaaadaaaaaiiablaaoeka
aaaaoeiaacaaaaadaaaaaiiaaaaappiablaappkaaeaaaaaeaeaaahiaaaaappia
blaaoekbaaaaoeiabcaaaaaeafaaahiabmaaaakaaaaaoeiaaeaaoeiaabaaaaac
aaaaahiaaeaaoekaafaaaaadaeaaahiaaaaaffiabgaaoekaaeaaaaaeaaaaalia
bfaakekaaaaaaaiaaeaakeiaaeaaaaaeaaaaahiabhaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabiaaoekaaeaaaaaeaaaaahiaaaaaoeiabjaappka
afaaoeibaiaaaaadaeaaaboaabaaoeiaaaaaoeiaaiaaaaadaeaaacoaadaaoeia
aaaaoeiaaiaaaaadaeaaaeoaacaaoeiaaaaaoeiaafaaaaadaaaaahiaacaaoeia
bjaappkaafaaaaadabaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaaliabcaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiaboaaaakaajaaaaadabaaabiaahaaoekaaaaaoeiaajaaaaadabaaacia
aiaaoekaaaaaoeiaajaaaaadabaaaeiaajaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaakaaoekaacaaoeiaajaaaaadadaaacia
alaaoekaacaaoeiaajaaaaadadaaaeiaamaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaanaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaafaaffiaapaaoekaaeaaaaaeaaaaapiaaoaaoekaafaaaaia
aaaaoeiaaeaaaaaeaaaaapiabaaaoekaafaakkiaaaaaoeiaacaaaaadaaaaapia
aaaaoeiabbaaoekaafaaaaadabaaabiaaaaaffiaafaaaakaafaaaaadabaaaiia
abaaaaiaboaakkkbafaaaaadabaaafiaaaaapeiaboaakkkbacaaaaadafaaadoa
abaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacafaaamoaaaaaoeiaaeaaaaaeabaaapoaafaappja
caaaeakacaaabfkappppaaaafdeieefcoialaaaaeaaaabaapkacaaaafjaaaaae
egiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaae
egiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
gfaaaaadpccabaaaagaaaaaagiaaaaacajaaaaaadgaaaaagbcaabaaaaaaaaaaa
dkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaak
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaa
aaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaa
aaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaa
aaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaa
aaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaa
adaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaa
bkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaa
aaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdo
dcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaa
ahaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaa
egiccaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaa
abaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaa
acaaaaaadkbabaaaafaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaabaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegbcbaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaa
aaaaaaaaegbcbaaaacaaaaaadiaaaaahhcaabaaaafaaaaaajgaebaaaadaaaaaa
cgajbaaaaeaaaaaadcaaaaakhcaabaaaafaaaaaajgaebaaaaeaaaaaacgajbaaa
adaaaaaaegacbaiaebaaaaaaafaaaaaadiaaaaahhcaabaaaafaaaaaaegacbaaa
afaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaafaaaaaa
egacbaaaacaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaagaaaaaafgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaacaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaa
egaibaaaagaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaacaaaaaaegadbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaagaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
acaaaaaabbaaaaaiccaabaaaagaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
acaaaaaabbaaaaaiecaabaaaagaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
acaaaaaadiaaaaahpcaabaaaahaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaa
bbaaaaaibcaabaaaaiaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaahaaaaaa
bbaaaaaiccaabaaaaiaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaahaaaaaa
bbaaaaaiecaabaaaaiaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaahaaaaaa
aaaaaaahhcaabaaaagaaaaaaegacbaaaagaaaaaaegacbaaaaiaaaaaadiaaaaah
icaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakicaabaaa
aaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaadkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaa
egacbaaaagaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
acaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegacbaaaaeaaaaaa
egacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaafaaaaaaegacbaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaagaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaagaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
Vector 32 [_Scale]
Vector 33 [_SquashPlaneNormal]
Float 34 [_SquashAmount]
Vector 35 [_Wind]
Vector 36 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[39] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..36],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.w, vertex.color.x, R0.x;
MUL R0.xyz, vertex.position, c[32];
ADD R1.x, vertex.color.y, R0.w;
MOV R1.y, R0.w;
DP3 R1.x, R0, R1.x;
ADD R1.xy, R1, c[13].y;
MUL R1, R1.xxyy, c[37];
FRC R1, R1;
MAD R1, R1, c[0].y, c[0].z;
FRC R1, R1;
MAD R1, R1, c[0].y, -c[0].x;
ABS R2, R1;
MAD R1, -R2, c[0].y, c[0].w;
MUL R2, R2, R2;
MUL R1, R2, R1;
ADD R2.xy, R1.xzzw, R1.ywzw;
MUL R1.xyz, R2.y, c[35];
MUL R3.xyz, vertex.texcoord[1].y, R1;
MUL R0.w, vertex.color.y, c[38].y;
MOV R1.w, c[0].x;
MUL R1.xz, R0.w, vertex.normal;
MUL R1.y, vertex.texcoord[1], c[38].x;
MAD R1.xyz, R2.xyxw, R1, R3;
MAD R0.xyz, R1, c[35].w, R0;
MAD R0.xyz, vertex.texcoord[1].x, c[35], R0;
DP3 R0.w, R0, c[33];
ADD R0.w, R0, c[33];
MUL R1.xyz, R0.w, c[33];
ADD R0.xyz, -R1, R0;
MAD R1.xyz, R1, c[34].x, R0;
DP4 R0.y, R1, c[6];
DP4 R0.x, R1, c[5];
ADD R3, -R0.y, c[17];
ADD R2, -R0.x, c[16];
MUL R0, R3, R3;
MAD R4, R2, R2, R0;
DP3 R5.x, vertex.normal, vertex.normal;
RSQ R0.x, R5.x;
MUL R6.xyz, R0.x, vertex.normal;
MUL R7.xyz, R6, c[31].w;
DP3 R6.w, R7, c[6];
DP4 R0.y, R1, c[7];
ADD R0, -R0.y, c[18];
MAD R4, R0, R0, R4;
DP3 R7.w, R7, c[5];
MUL R3, R6.w, R3;
MAD R2, R7.w, R2, R3;
DP3 R3.x, R7, c[7];
MAD R0, R3.x, R0, R2;
MUL R5, R4, c[19];
MOV R7.x, R6.w;
MOV R7.y, R3.x;
MOV R7.z, c[0].x;
RSQ R2.x, R4.x;
RSQ R2.y, R4.y;
RSQ R2.z, R4.z;
RSQ R2.w, R4.w;
MUL R0, R0, R2;
ADD R2, R5, c[0].x;
RCP R2.x, R2.x;
RCP R2.y, R2.y;
RCP R2.w, R2.w;
RCP R2.z, R2.z;
MAX R0, R0, c[38].z;
MUL R0, R0, R2;
MUL R2.xyz, R0.y, c[21];
MAD R2.xyz, R0.x, c[20], R2;
MAD R0.xyz, R0.z, c[22], R2;
MAD R2.xyz, R0.w, c[23], R0;
MUL R0, R7.wxyy, R7.xyyw;
MUL R2.w, R6, R6;
DP4 R4.z, R0, c[29];
DP4 R4.y, R0, c[28];
DP4 R4.x, R0, c[27];
MAD R2.w, R7, R7, -R2;
MOV R0.w, c[0].x;
DP4 R3.z, R7.wxyz, c[26];
DP4 R3.y, R7.wxyz, c[25];
DP4 R3.x, R7.wxyz, c[24];
ADD R3.xyz, R3, R4;
MUL R0.xyz, R2.w, c[30];
ADD R0.xyz, R3, R0;
ADD result.texcoord[2].xyz, R0, R2;
DP3 R0.x, vertex.attrib[14], vertex.attrib[14];
RSQ R0.x, R0.x;
MUL R2.xyz, R0.x, vertex.attrib[14];
MUL R0.xyz, R6.zxyw, R2.yzxw;
MAD R3.xyz, R6.yzxw, R2.zxyw, -R0;
MOV R0.xyz, c[14];
MUL R3.xyz, R3, vertex.attrib[14].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 R4.z, R0, c[11];
DP4 R4.x, R0, c[9];
DP4 R4.y, R0, c[10];
MAD R0.xyz, R4, c[31].w, -R1;
DP3 result.texcoord[3].z, R6, R0;
DP3 result.texcoord[3].y, R3, R0;
MOV R1, c[15];
DP3 result.texcoord[3].x, R2, R0;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
DP3 result.texcoord[1].y, R0, R3;
DP3 result.texcoord[1].z, R6, R0;
DP3 result.texcoord[1].x, R0, R2;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[36], c[36].zwzw;
MOV result.color.w, vertex.color;
END
# 113 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
Vector 31 [_Scale]
Vector 32 [_SquashPlaneNormal]
Float 33 [_SquashAmount]
Vector 34 [_Wind]
Vector 35 [_MainTex_ST]
"vs_2_0
def c36, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c37, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c38, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c39, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c36.x, r0
add r0.x, v5, r0
add r0.w, v5.y, r0.x
mov r1.y, r0.x
mul r0.xyz, v0, c31
dp3 r1.x, r0, r0.w
add r1.xy, r1, c12.y
mul r1, r1.xxyy, c37
frc r1, r1
mad r1, r1, c36.y, c36.z
frc r1, r1
mad r1, r1, c36.y, c36.w
abs r2, r1
mad r1, -r2, c38.x, c38.y
mul r2, r2, r2
mul r1, r2, r1
add r2.xy, r1.xzzw, r1.ywzw
mul r1.xyz, r2.y, c34
mul r3.xyz, v4.y, r1
mul r0.w, v5.y, c38
mov r1.w, c36.x
mul r1.xz, r0.w, v2
mul r1.y, v4, c38.z
mad r1.xyz, r2.xyxw, r1, r3
mad r0.xyz, r1, c34.w, r0
mad r0.xyz, v4.x, c34, r0
dp3 r0.w, r0, c32
add r0.w, r0, c32
mul r1.xyz, r0.w, c32
add r0.xyz, -r1, r0
mad r1.xyz, r1, c33.x, r0
dp4 r0.y, r1, c5
dp4 r0.x, r1, c4
add r3, -r0.y, c16
add r2, -r0.x, c15
mul r0, r3, r3
mad r4, r2, r2, r0
dp3 r5.x, v2, v2
rsq r0.x, r5.x
mul r6.xyz, r0.x, v2
mul r7.xyz, r6, c30.w
dp3 r6.w, r7, c5
dp4 r0.y, r1, c6
add r0, -r0.y, c17
mad r4, r0, r0, r4
dp3 r7.w, r7, c4
mul r3, r6.w, r3
mad r2, r7.w, r2, r3
dp3 r3.x, r7, c6
mad r0, r3.x, r0, r2
mul r5, r4, c18
mov r7.x, r6.w
mov r7.y, r3.x
mov r7.z, c36.x
rsq r2.x, r4.x
rsq r2.y, r4.y
rsq r2.z, r4.z
rsq r2.w, r4.w
mul r0, r0, r2
add r2, r5, c36.x
rcp r2.x, r2.x
rcp r2.y, r2.y
rcp r2.w, r2.w
rcp r2.z, r2.z
max r0, r0, c39.x
mul r0, r0, r2
mul r2.xyz, r0.y, c20
mad r2.xyz, r0.x, c19, r2
mad r0.xyz, r0.z, c21, r2
mad r2.xyz, r0.w, c22, r0
mul r0, r7.wxyy, r7.xyyw
mul r2.w, r6, r6
dp4 r4.z, r0, c28
dp4 r4.y, r0, c27
dp4 r4.x, r0, c26
mad r2.w, r7, r7, -r2
mul r0.xyz, r2.w, c29
mov r2.w, c36.x
dp4 r3.z, r7.wxyz, c25
dp4 r3.y, r7.wxyz, c24
dp4 r3.x, r7.wxyz, c23
add r3.xyz, r3, r4
add r0.xyz, r3, r0
add oT2.xyz, r0, r2
dp3 r0.x, v1, v1
rsq r0.x, r0.x
mul r0.xyz, r0.x, v1
mul r2.xyz, r6.zxyw, r0.yzxw
mad r3.xyz, r6.yzxw, r0.zxyw, -r2
mov r2.xyz, c13
dp4 r4.z, r2, c10
dp4 r4.x, r2, c8
dp4 r4.y, r2, c9
mad r2.xyz, r4, c30.w, -r1
mul r3.xyz, r3, v1.w
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mov r1, c10
dp4 r4.z, c14, r1
mov r1, c9
dp4 r4.y, c14, r1
dp3 oT3.z, r6, r2
dp3 oT3.y, r3, r2
dp3 oT3.x, r0, r2
mov r2, c8
dp4 r4.x, c14, r2
dp3 oT1.y, r4, r3
dp3 oT1.z, r6, r4
dp3 oT1.x, r4, r0
mov oD0.xyz, c36.x
mad oT0.xy, v3, c35, c35.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedjplhelkcdjmphninecmmcmbbkogefmeaabaaaaaadebaaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefchmaoaaaaeaaaabaajpadaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacalaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
acaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaaba
pcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaa
pgapbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaahhcaabaaaaeaaaaaajgaebaaa
acaaaaaacgajbaaaadaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaaadaaaaaa
cgajbaaaacaaaaaaegacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaa
egacbaaaaeaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaa
aeaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaadaaaaaaapaaaaaaaaaaaaajpcaabaaaafaaaaaa
fgafbaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaa
agaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaaaaaaaajpcaabaaaahaaaaaa
agaabaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaa
abaaaaaakgakbaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaaj
pcaabaaaagaaaaaaegaobaaaahaaaaaaegaobaaaahaaaaaaegaobaaaagaaaaaa
dcaaaaajpcaabaaaagaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
agaaaaaadcaaaaanpcaabaaaaiaaaaaaegaobaaaagaaaaaaegiocaaaacaaaaaa
afaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpeeaaaaafpcaabaaa
agaaaaaaegaobaaaagaaaaaaaoaaaaakpcaabaaaaiaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaaiaaaaaadiaaaaaihcaabaaaajaaaaaa
egacbaaaadaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaakaaaaaa
fgafbaaaajaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaajaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaajaaaaaaegaibaaaakaaaaaadcaaaaak
hcaabaaaajaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaajaaaaaaegadbaaa
ajaaaaaadiaaaaahpcaabaaaafaaaaaaegaobaaaafaaaaaafgafbaaaajaaaaaa
dcaaaaajpcaabaaaafaaaaaaegaobaaaahaaaaaaagaabaaaajaaaaaaegaobaaa
afaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaabaaaaaakgakbaaaajaaaaaa
egaobaaaafaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaagaaaaaaegaobaaa
abaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaiaaaaaa
egaobaaaabaaaaaadiaaaaaihcaabaaaafaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaahaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaaacaaaaaaagaaaaaa
agaabaaaabaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
dgaaaaaficaabaaaajaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaafaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaajaaaaaabbaaaaaiccaabaaaafaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaajaaaaaabbaaaaaiecaabaaaafaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaajaaaaaadiaaaaahpcaabaaaagaaaaaa
jgacbaaaajaaaaaaegakbaaaajaaaaaabbaaaaaibcaabaaaahaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaagaaaaaabbaaaaaiccaabaaaahaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaagaaaaaabbaaaaaiecaabaaaahaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaagaaaaaaaaaaaaahhcaabaaaafaaaaaaegacbaaa
afaaaaaaegacbaaaahaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaajaaaaaa
bkaabaaaajaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaajaaaaaaakaabaaa
ajaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaa
acaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaaaaaaaaahhccabaaa
aeaaaaaaegacbaaaabaaaaaaegacbaaaafaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaah
bccabaaaafaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
afaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaa
egacbaaaaeaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedfihlfjknpghjffifdeeaojcfnfdhknkkabaaaaaajmbiaaaaaeaaaaaa
daaaaaaajeaiaaaabibhaaaaoabhaaaaebgpgodjfmaiaaaafmaiaaaaaaacpopp
laahaaaakmaaaaaaalaaceaaaaaakiaaaaaakiaaaaaaceaaabaakiaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaabaaaeaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaaacaaacaaaiaaagaa
aaaaaaaaacaacgaaahaaaoaaaaaaaaaaadaaaaaaaeaabfaaaaaaaaaaadaaamaa
ajaabjaaaaaaaaaaaeaaafaaabaaccaaaaaaaaaaaeaaakaaacaacdaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafcfaaapkamnmmpmdpamaceldpaaaamadomlkbefdo
fbaaaaafcgaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaafchaaapka
aaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafciaaapkaaaaaaaaaaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaabaaaaacaaaaapiaafaaoekaafaaaaadabaaahiaaaaaffiaboaaoeka
aeaaaaaeabaaahiabnaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabpaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiacaaaoekaaaaappiaaaaaoeiaceaaaaac
abaaahiaabaaoejaaiaaaaadacaaaboaabaaoeiaaaaaoeiaceaaaaacacaaahia
acaaoejaafaaaaadadaaahiaabaamjiaacaanciaaeaaaaaeadaaahiaacaamjia
abaanciaadaaoeibafaaaaadadaaahiaadaaoeiaabaappjaaiaaaaadacaaacoa
adaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeiaaaaaoeiaabaaaaacaaaaahia
aeaaoekaafaaaaadaeaaahiaaaaaffiaboaaoekaaeaaaaaeaaaaaliabnaakeka
aaaaaaiaaeaakeiaaeaaaaaeaaaaahiabpaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiacaaaoekaabaaaaacaeaaabiabjaappkaabaaaaacaeaaacia
bkaappkaabaaaaacaeaaaeiablaappkaaiaaaaadaaaaaiiaaeaaoeiacgaaaaka
acaaaaadaeaaaciaaaaappiaafaaaajaacaaaaadaaaaaiiaaeaaffiaafaaffja
afaaaaadafaaahiaaaaaoejaccaaoekaaiaaaaadaeaaabiaafaaoeiaaaaappia
acaaaaadaeaaapiaaeaafaiaadaaffkaafaaaaadaeaaapiaaeaaoeiacfaaoeka
bdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiacgaaffkacgaakkka
bdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiacgaaffkacgaappka
cdaaaaacaeaaapiaaeaaoeiaafaaaaadagaaapiaaeaaoeiaaeaaoeiaaeaaaaae
aeaaapiaaeaaoeiachaaaakbchaaffkaafaaaaadaeaaapiaaeaaoeiaagaaoeia
acaaaaadaeaaadiaaeaaoniaaeaaoiiaafaaaaadagaaahiaaeaaffiaabaaoeka
afaaaaadagaaahiaagaaoeiaaeaaffjaafaaaaadahaaaciaaeaaffiaaeaaffja
afaaaaadaaaaaiiaafaaffjachaakkkaafaaaaadahaaafiaaaaappiaacaaoeja
abaaaaacaeaaaeiachaappkaaeaaaaaeaeaaahiaaeaamiiaahaaoeiaagaaoeia
aeaaaaaeaeaaahiaaeaaoeiaabaappkaafaaoeiaaeaaaaaeaeaaahiaaeaaaaja
abaaoekaaeaaoeiaaiaaaaadaaaaaiiacdaaoekaaeaaoeiaacaaaaadaaaaaiia
aaaappiacdaappkaaeaaaaaeafaaahiaaaaappiacdaaoekbaeaaoeiabcaaaaae
agaaahiaceaaaakaaeaaoeiaafaaoeiaaeaaaaaeaaaaahiaaaaaoeiacbaappka
agaaoeibaiaaaaadaeaaaboaabaaoeiaaaaaoeiaaiaaaaadaeaaacoaadaaoeia
aaaaoeiaaiaaaaadaeaaaeoaacaaoeiaaaaaoeiaafaaaaadaaaaahiaacaaoeia
cbaappkaafaaaaadabaaahiaaaaaffiabkaaoekaaeaaaaaeaaaaaliabjaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiablaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiacgaaaakaajaaaaadabaaabiaaoaaoekaaaaaoeiaajaaaaadabaaacia
apaaoekaaaaaoeiaajaaaaadabaaaeiabaaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiabbaaoekaacaaoeiaajaaaaadadaaacia
bcaaoekaacaaoeiaajaaaaadadaaaeiabdaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiia
aaaaaaiaaaaaaaiaaaaappibaeaaaaaeabaaahiabeaaoekaaaaappiaabaaoeia
afaaaaadacaaahiaagaaffiabkaaoekaaeaaaaaeacaaahiabjaaoekaagaaaaia
acaaoeiaaeaaaaaeacaaahiablaaoekaagaakkiaacaaoeiaacaaaaadacaaahia
acaaoeiabmaaoekaacaaaaadadaaapiaacaaaaibagaaoekaacaaaaadaeaaapia
acaaffibahaaoekaacaaaaadacaaapiaacaakkibaiaaoekaafaaaaadafaaapia
aaaaffiaaeaaoeiaafaaaaadaeaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapia
adaaoeiaadaaoeiaaeaaoeiaaeaaaaaeadaaapiaadaaoeiaaaaaaaiaafaaoeia
aeaaaaaeaaaaapiaacaaoeiaaaaakkiaadaaoeiaaeaaaaaeacaaapiaacaaoeia
acaaoeiaaeaaoeiaahaaaaacadaaabiaacaaaaiaahaaaaacadaaaciaacaaffia
ahaaaaacadaaaeiaacaakkiaahaaaaacadaaaiiaacaappiaabaaaaacaeaaabia
cgaaaakaaeaaaaaeacaaapiaacaaoeiaajaaoekaaeaaaaiaafaaaaadaaaaapia
aaaaoeiaadaaoeiaalaaaaadaaaaapiaaaaaoeiaciaaaakaagaaaaacadaaabia
acaaaaiaagaaaaacadaaaciaacaaffiaagaaaaacadaaaeiaacaakkiaagaaaaac
adaaaiiaacaappiaafaaaaadaaaaapiaaaaaoeiaadaaoeiaafaaaaadacaaahia
aaaaffiaalaaoekaaeaaaaaeacaaahiaakaaoekaaaaaaaiaacaaoeiaaeaaaaae
aaaaahiaamaaoekaaaaakkiaacaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaappia
aaaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaagaaffia
bgaaoekaaeaaaaaeaaaaapiabfaaoekaagaaaaiaaaaaoeiaaeaaaaaeaaaaapia
bhaaoekaagaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabiaaoekaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaaeaaaaae
abaaapoaafaappjaciaaeakaciaabfkappppaaaafdeieefchmaoaaaaeaaaabaa
jpadaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacalaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaa
abaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaa
dcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaa
agbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
dgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egbcbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaa
acaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
adaaaaaapgapbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaahhcaabaaaaeaaaaaa
jgaebaaaacaaaaaacgajbaaaadaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaa
adaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaa
aeaaaaaaegacbaaaaeaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaaeaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaaapaaaaaaaaaaaaajpcaabaaa
afaaaaaafgafbaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaah
pcaabaaaagaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaaaaaaaajpcaabaaa
ahaaaaaaagaabaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaaj
pcaabaaaabaaaaaakgakbaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaaeaaaaaa
dcaaaaajpcaabaaaagaaaaaaegaobaaaahaaaaaaegaobaaaahaaaaaaegaobaaa
agaaaaaadcaaaaajpcaabaaaagaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaagaaaaaadcaaaaanpcaabaaaaiaaaaaaegaobaaaagaaaaaaegiocaaa
acaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpeeaaaaaf
pcaabaaaagaaaaaaegaobaaaagaaaaaaaoaaaaakpcaabaaaaiaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaaiaaaaaadiaaaaaihcaabaaa
ajaaaaaaegacbaaaadaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
akaaaaaafgafbaaaajaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
ajaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaajaaaaaaegaibaaaakaaaaaa
dcaaaaakhcaabaaaajaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaajaaaaaa
egadbaaaajaaaaaadiaaaaahpcaabaaaafaaaaaaegaobaaaafaaaaaafgafbaaa
ajaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaahaaaaaaagaabaaaajaaaaaa
egaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaabaaaaaakgakbaaa
ajaaaaaaegaobaaaafaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaagaaaaaa
egaobaaaabaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
aiaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaafaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaafaaaaaaegiccaaaacaaaaaa
agaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaaafaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaadgaaaaaficaabaaaajaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
afaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaajaaaaaabbaaaaaiccaabaaa
afaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaajaaaaaabbaaaaaiecaabaaa
afaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaajaaaaaadiaaaaahpcaabaaa
agaaaaaajgacbaaaajaaaaaaegakbaaaajaaaaaabbaaaaaibcaabaaaahaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaagaaaaaabbaaaaaiccaabaaaahaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaagaaaaaabbaaaaaiecaabaaaahaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaagaaaaaaaaaaaaahhcaabaaaafaaaaaa
egacbaaaafaaaaaaegacbaaaahaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaa
ajaaaaaabkaabaaaajaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaajaaaaaa
akaabaaaajaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaafaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaaaaaaaaah
hccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaafaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaa
baaaaaahbccabaaaafaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaafaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaa
afaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_ProjectionParams]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [unity_Scale]
Vector 33 [_Scale]
Vector 34 [_SquashPlaneNormal]
Float 35 [_SquashAmount]
Vector 36 [_Wind]
Vector 37 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[40] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..37],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.w, vertex.color.x, R0.x;
MUL R0.xyz, vertex.position, c[33];
ADD R1.x, vertex.color.y, R0.w;
MOV R1.y, R0.w;
DP3 R1.x, R0, R1.x;
ADD R1.xy, R1, c[13].y;
MUL R1, R1.xxyy, c[38];
FRC R1, R1;
MAD R1, R1, c[0].y, c[0].z;
FRC R1, R1;
MAD R1, R1, c[0].y, -c[0].x;
ABS R2, R1;
MAD R1, -R2, c[0].y, c[0].w;
MUL R2, R2, R2;
MUL R1, R2, R1;
ADD R2.xy, R1.xzzw, R1.ywzw;
MUL R1.xyz, R2.y, c[36];
MUL R3.xyz, vertex.texcoord[1].y, R1;
MUL R0.w, vertex.color.y, c[39].y;
MOV R1.w, c[0].x;
MUL R1.xz, R0.w, vertex.normal;
MUL R1.y, vertex.texcoord[1], c[39].x;
MAD R1.xyz, R2.xyxw, R1, R3;
MAD R0.xyz, R1, c[36].w, R0;
MAD R0.xyz, vertex.texcoord[1].x, c[36], R0;
DP3 R0.w, R0, c[34];
ADD R0.w, R0, c[34];
MUL R1.xyz, R0.w, c[34];
ADD R0.xyz, -R1, R0;
MAD R1.xyz, R1, c[35].x, R0;
DP4 R0.y, R1, c[6];
DP4 R0.x, R1, c[5];
ADD R3, -R0.y, c[18];
ADD R2, -R0.x, c[17];
MUL R0, R3, R3;
MAD R4, R2, R2, R0;
DP3 R5.x, vertex.normal, vertex.normal;
RSQ R0.x, R5.x;
MUL R6.xyz, R0.x, vertex.normal;
MUL R7.xyz, R6, c[32].w;
DP3 R6.w, R7, c[6];
DP4 R0.y, R1, c[7];
ADD R0, -R0.y, c[19];
MAD R4, R0, R0, R4;
DP3 R7.w, R7, c[5];
MUL R3, R6.w, R3;
MAD R2, R7.w, R2, R3;
DP3 R3.w, R7, c[7];
MAD R0, R3.w, R0, R2;
MUL R5, R4, c[20];
MOV R7.x, R6.w;
MOV R7.y, R3.w;
MOV R7.z, c[0].x;
RSQ R2.x, R4.x;
RSQ R2.y, R4.y;
RSQ R2.z, R4.z;
RSQ R2.w, R4.w;
MUL R0, R0, R2;
ADD R2, R5, c[0].x;
DP4 R5.z, R7.wxyz, c[27];
DP4 R5.y, R7.wxyz, c[26];
DP4 R5.x, R7.wxyz, c[25];
RCP R2.x, R2.x;
RCP R2.y, R2.y;
RCP R2.w, R2.w;
RCP R2.z, R2.z;
MAX R0, R0, c[39].z;
MUL R0, R0, R2;
MUL R2.xyz, R0.y, c[22];
MAD R2.xyz, R0.x, c[21], R2;
MAD R0.xyz, R0.z, c[23], R2;
MAD R3.xyz, R0.w, c[24], R0;
MUL R0, R7.wxyy, R7.xyyw;
MUL R2.z, R6.w, R6.w;
DP4 R2.w, R1, c[4];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
MUL R4.xyz, R2.xyww, c[39].w;
DP4 R7.z, R0, c[30];
DP4 R7.y, R0, c[29];
DP4 R7.x, R0, c[28];
MAD R2.z, R7.w, R7.w, -R2;
MUL R0.xyz, R2.z, c[31];
DP4 R2.z, R1, c[3];
ADD R5.xyz, R5, R7;
ADD R0.xyz, R5, R0;
ADD result.texcoord[2].xyz, R0, R3;
MOV R0.x, R4;
MUL R0.y, R4, c[15].x;
ADD result.texcoord[4].xy, R0, R4.z;
DP3 R0.z, vertex.attrib[14], vertex.attrib[14];
RSQ R0.x, R0.z;
MUL R0.xyz, R0.x, vertex.attrib[14];
MUL R3.xyz, R6.zxyw, R0.yzxw;
MAD R3.xyz, R6.yzxw, R0.zxyw, -R3;
MOV result.position, R2;
MOV result.texcoord[4].zw, R2;
MOV R2.w, c[0].x;
MOV R2.xyz, c[14];
DP4 R4.z, R2, c[11];
DP4 R4.x, R2, c[9];
DP4 R4.y, R2, c[10];
MAD R1.xyz, R4, c[32].w, -R1;
MUL R3.xyz, R3, vertex.attrib[14].w;
DP3 result.texcoord[3].z, R6, R1;
DP3 result.texcoord[3].y, R3, R1;
MOV R2, c[16];
DP3 result.texcoord[3].x, R0, R1;
DP4 R1.z, R2, c[11];
DP4 R1.x, R2, c[9];
DP4 R1.y, R2, c[10];
DP3 result.texcoord[1].y, R1, R3;
DP3 result.texcoord[1].z, R6, R1;
DP3 result.texcoord[1].x, R1, R0;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[37], c[37].zwzw;
MOV result.color.w, vertex.color;
END
# 119 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_ScreenParams]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [unity_Scale]
Vector 33 [_Scale]
Vector 34 [_SquashPlaneNormal]
Float 35 [_SquashAmount]
Vector 36 [_Wind]
Vector 37 [_MainTex_ST]
"vs_2_0
def c38, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c39, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c40, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c41, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c38.x, r0
add r0.x, v5, r0
add r0.w, v5.y, r0.x
mov r1.y, r0.x
mul r0.xyz, v0, c33
dp3 r1.x, r0, r0.w
add r1.xy, r1, c12.y
mul r1, r1.xxyy, c39
frc r1, r1
mad r1, r1, c38.y, c38.z
frc r1, r1
mad r1, r1, c38.y, c38.w
abs r2, r1
mad r1, -r2, c40.x, c40.y
mul r2, r2, r2
mul r1, r2, r1
add r2.xy, r1.xzzw, r1.ywzw
mul r1.xyz, r2.y, c36
mul r3.xyz, v4.y, r1
mul r0.w, v5.y, c40
mov r1.w, c38.x
mul r1.xz, r0.w, v2
mul r1.y, v4, c40.z
mad r1.xyz, r2.xyxw, r1, r3
mad r0.xyz, r1, c36.w, r0
mad r0.xyz, v4.x, c36, r0
dp3 r0.w, r0, c34
add r0.w, r0, c34
mul r1.xyz, r0.w, c34
add r0.xyz, -r1, r0
mad r1.xyz, r1, c35.x, r0
dp4 r0.y, r1, c5
dp4 r0.x, r1, c4
add r3, -r0.y, c18
add r2, -r0.x, c17
mul r0, r3, r3
mad r4, r2, r2, r0
dp3 r5.x, v2, v2
rsq r0.x, r5.x
mul r6.xyz, r0.x, v2
mul r7.xyz, r6, c32.w
dp3 r6.w, r7, c5
dp4 r0.y, r1, c6
add r0, -r0.y, c19
mad r4, r0, r0, r4
dp3 r7.w, r7, c4
mul r3, r6.w, r3
mad r2, r7.w, r2, r3
dp3 r3.w, r7, c6
mad r0, r3.w, r0, r2
mul r5, r4, c20
mov r7.x, r6.w
mov r7.y, r3.w
mov r7.z, c38.x
rsq r2.x, r4.x
rsq r2.y, r4.y
rsq r2.z, r4.z
rsq r2.w, r4.w
mul r0, r0, r2
add r2, r5, c38.x
dp4 r5.z, r7.wxyz, c27
dp4 r5.y, r7.wxyz, c26
dp4 r5.x, r7.wxyz, c25
rcp r2.x, r2.x
rcp r2.y, r2.y
rcp r2.w, r2.w
rcp r2.z, r2.z
max r0, r0, c41.x
mul r0, r0, r2
mul r2.xyz, r0.y, c22
mad r2.xyz, r0.x, c21, r2
mad r0.xyz, r0.z, c23, r2
mad r3.xyz, r0.w, c24, r0
mul r0, r7.wxyy, r7.xyyw
mul r2.z, r6.w, r6.w
dp4 r2.w, r1, c3
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mul r4.xyz, r2.xyww, c41.y
dp4 r7.z, r0, c30
dp4 r7.y, r0, c29
dp4 r7.x, r0, c28
mad r2.z, r7.w, r7.w, -r2
mul r0.xyz, r2.z, c31
dp4 r2.z, r1, c2
add r5.xyz, r5, r7
add r0.xyz, r5, r0
add oT2.xyz, r0, r3
mov r0.x, r4
mul r0.y, r4, c14.x
mad oT4.xy, r4.z, c15.zwzw, r0
dp3 r0.z, v1, v1
rsq r0.x, r0.z
mul r0.xyz, r0.x, v1
mul r3.xyz, r6.zxyw, r0.yzxw
mad r3.xyz, r6.yzxw, r0.zxyw, -r3
mov oPos, r2
mov oT4.zw, r2
mov r2.w, c38.x
mov r2.xyz, c13
dp4 r4.z, r2, c10
dp4 r4.x, r2, c8
dp4 r4.y, r2, c9
mad r2.xyz, r4, c32.w, -r1
mul r3.xyz, r3, v1.w
mov r1, c10
dp4 r4.z, c16, r1
mov r1, c9
dp4 r4.y, c16, r1
dp3 oT3.z, r6, r2
dp3 oT3.y, r3, r2
dp3 oT3.x, r0, r2
mov r2, c8
dp4 r4.x, c16, r2
dp3 oT1.y, r4, r3
dp3 oT1.z, r6, r4
dp3 oT1.x, r4, r0
mov oD0.xyz, c38.x
mad oT0.xy, v3, c37, c37.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedkpoojibppgjdaoiaiblhhhbgeplfgffnabaaaaaaaabbaaaaadaaaaaa
cmaaaaaapeaaaaaamiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheommaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaamfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefcdaapaaaaeaaaabaammadaaaafjaaaaaeegiocaaa
aaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaa
aeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacamaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaa
abaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaa
dcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaa
agbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaahaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaa
dkbabaaaafaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
abaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegbcbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaaaaaaaaa
egbcbaaaacaaaaaadiaaaaahhcaabaaaafaaaaaajgaebaaaadaaaaaacgajbaaa
aeaaaaaadcaaaaakhcaabaaaafaaaaaajgaebaaaaeaaaaaacgajbaaaadaaaaaa
egacbaiaebaaaaaaafaaaaaadiaaaaahhcaabaaaafaaaaaaegacbaaaafaaaaaa
pgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaafaaaaaaegacbaaa
acaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
baaaaaaheccabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
egiccaaaadaaaaaaapaaaaaaaaaaaaajpcaabaaaagaaaaaafgafbaiaebaaaaaa
acaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaahaaaaaaegaobaaa
agaaaaaaegaobaaaagaaaaaaaaaaaaajpcaabaaaaiaaaaaaagaabaiaebaaaaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaia
ebaaaaaaacaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaahaaaaaa
egaobaaaaiaaaaaaegaobaaaaiaaaaaaegaobaaaahaaaaaadcaaaaajpcaabaaa
ahaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaahaaaaaadcaaaaan
pcaabaaaajaaaaaaegaobaaaahaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpeeaaaaafpcaabaaaahaaaaaaegaobaaa
ahaaaaaaaoaaaaakpcaabaaaajaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpegaobaaaajaaaaaadiaaaaaihcaabaaaakaaaaaaegacbaaaaeaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaalaaaaaafgafbaaaakaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaakaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaakaaaaaaegaibaaaalaaaaaadcaaaaakhcaabaaaakaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaakaaaaaaegadbaaaakaaaaaadiaaaaah
pcaabaaaagaaaaaaegaobaaaagaaaaaafgafbaaaakaaaaaadcaaaaajpcaabaaa
agaaaaaaegaobaaaaiaaaaaaagaabaaaakaaaaaaegaobaaaagaaaaaadcaaaaaj
pcaabaaaacaaaaaaegaobaaaacaaaaaakgakbaaaakaaaaaaegaobaaaagaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaahaaaaaaegaobaaaacaaaaaadeaaaaak
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaajaaaaaaegaobaaaacaaaaaa
diaaaaaihcaabaaaagaaaaaafgafbaaaacaaaaaaegiccaaaacaaaaaaahaaaaaa
dcaaaaakhcaabaaaagaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaacaaaaaa
egacbaaaagaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaiaaaaaa
kgakbaaaacaaaaaaegacbaaaagaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaajaaaaaapgapbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaa
akaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaagaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaakaaaaaabbaaaaaiccaabaaaagaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaakaaaaaabbaaaaaiecaabaaaagaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaakaaaaaadiaaaaahpcaabaaaahaaaaaajgacbaaaakaaaaaa
egakbaaaakaaaaaabbaaaaaibcaabaaaaiaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaahaaaaaabbaaaaaiccaabaaaaiaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaahaaaaaabbaaaaaiecaabaaaaiaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaahaaaaaaaaaaaaahhcaabaaaagaaaaaaegacbaaaagaaaaaaegacbaaa
aiaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaakaaaaaabkaabaaaakaaaaaa
dcaaaaakicaabaaaaaaaaaaaakaabaaaakaaaaaaakaabaaaakaaaaaadkaabaia
ebaaaaaaaaaaaaaadcaaaaakhcaabaaaagaaaaaaegiccaaaacaaaaaacmaaaaaa
pgapbaaaaaaaaaaaegacbaaaagaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaa
acaaaaaaegacbaaaagaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaacaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaafaaaaaa
egacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegacbaaa
aeaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaafaaaaaa
egacbaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaagaaaaaakgaobaaaabaaaaaa
aaaaaaahdccabaaaagaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedifcnfajldhpkpjnhcebmlmcfecnajcgoabaaaaaalebjaaaaaeaaaaaa
daaaaaaaoaaiaaaabibiaaaaoabiaaaaebgpgodjkiaiaaaakiaiaaaaaaacpopp
pmahaaaakmaaaaaaalaaceaaaaaakiaaaaaakiaaaaaaceaaabaakiaaaaaaahaa
abaaabaaaaaaaaaaaaaaalaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaaacaaacaaaiaaahaa
aaaaaaaaacaacgaaahaaapaaaaaaaaaaadaaaaaaaeaabgaaaaaaaaaaadaaamaa
ajaabkaaaaaaaaaaaeaaafaaabaacdaaaaaaaaaaaeaaakaaacaaceaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafcgaaapkamnmmpmdpamaceldpaaaamadomlkbefdo
fbaaaaafchaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaafciaaapka
aaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafcjaaapkaaaaaaaaaaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahiaaaaaffiabpaaoeka
aeaaaaaeabaaahiaboaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiacaaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiacbaaoekaaaaappiaaaaaoeiaceaaaaac
abaaahiaabaaoejaaiaaaaadacaaaboaabaaoeiaaaaaoeiaceaaaaacacaaahia
acaaoejaafaaaaadadaaahiaabaamjiaacaanciaaeaaaaaeadaaahiaacaamjia
abaanciaadaaoeibafaaaaadadaaahiaadaaoeiaabaappjaaiaaaaadacaaacoa
adaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeiaaaaaoeiaabaaaaacaaaaahia
aeaaoekaafaaaaadaeaaahiaaaaaffiabpaaoekaaeaaaaaeaaaaaliaboaakeka
aaaaaaiaaeaakeiaaeaaaaaeaaaaahiacaaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiacbaaoekaabaaaaacaeaaabiabkaappkaabaaaaacaeaaacia
blaappkaabaaaaacaeaaaeiabmaappkaaiaaaaadaaaaaiiaaeaaoeiachaaaaka
acaaaaadaeaaaciaaaaappiaafaaaajaacaaaaadaaaaaiiaaeaaffiaafaaffja
afaaaaadafaaahiaaaaaoejacdaaoekaaiaaaaadaeaaabiaafaaoeiaaaaappia
acaaaaadaeaaapiaaeaafaiaadaaffkaafaaaaadaeaaapiaaeaaoeiacgaaoeka
bdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiachaaffkachaakkka
bdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiachaaffkachaappka
cdaaaaacaeaaapiaaeaaoeiaafaaaaadagaaapiaaeaaoeiaaeaaoeiaaeaaaaae
aeaaapiaaeaaoeiaciaaaakbciaaffkaafaaaaadaeaaapiaaeaaoeiaagaaoeia
acaaaaadaeaaadiaaeaaoniaaeaaoiiaafaaaaadagaaahiaaeaaffiaabaaoeka
afaaaaadagaaahiaagaaoeiaaeaaffjaafaaaaadahaaaciaaeaaffiaaeaaffja
afaaaaadaaaaaiiaafaaffjaciaakkkaafaaaaadahaaafiaaaaappiaacaaoeja
abaaaaacaeaaaeiaciaappkaaeaaaaaeaeaaahiaaeaamiiaahaaoeiaagaaoeia
aeaaaaaeaeaaahiaaeaaoeiaabaappkaafaaoeiaaeaaaaaeaeaaahiaaeaaaaja
abaaoekaaeaaoeiaaiaaaaadaaaaaiiaceaaoekaaeaaoeiaacaaaaadaaaaaiia
aaaappiaceaappkaaeaaaaaeafaaahiaaaaappiaceaaoekbaeaaoeiabcaaaaae
agaaahiacfaaaakaaeaaoeiaafaaoeiaaeaaaaaeaaaaahiaaaaaoeiaccaappka
agaaoeibaiaaaaadaeaaaboaabaaoeiaaaaaoeiaaiaaaaadaeaaacoaadaaoeia
aaaaoeiaaiaaaaadaeaaaeoaacaaoeiaaaaaoeiaafaaaaadaaaaahiaacaaoeia
ccaappkaafaaaaadabaaahiaaaaaffiablaaoekaaeaaaaaeaaaaaliabkaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabmaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiachaaaakaajaaaaadabaaabiaapaaoekaaaaaoeiaajaaaaadabaaacia
baaaoekaaaaaoeiaajaaaaadabaaaeiabbaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiabcaaoekaacaaoeiaajaaaaadadaaacia
bdaaoekaacaaoeiaajaaaaadadaaaeiabeaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiia
aaaaaaiaaaaaaaiaaaaappibaeaaaaaeabaaahiabfaaoekaaaaappiaabaaoeia
afaaaaadacaaahiaagaaffiablaaoekaaeaaaaaeacaaahiabkaaoekaagaaaaia
acaaoeiaaeaaaaaeacaaahiabmaaoekaagaakkiaacaaoeiaacaaaaadacaaahia
acaaoeiabnaaoekaacaaaaadadaaapiaacaaaaibahaaoekaacaaaaadaeaaapia
acaaffibaiaaoekaacaaaaadacaaapiaacaakkibajaaoekaafaaaaadafaaapia
aaaaffiaaeaaoeiaafaaaaadaeaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapia
adaaoeiaadaaoeiaaeaaoeiaaeaaaaaeadaaapiaadaaoeiaaaaaaaiaafaaoeia
aeaaaaaeaaaaapiaacaaoeiaaaaakkiaadaaoeiaaeaaaaaeacaaapiaacaaoeia
acaaoeiaaeaaoeiaahaaaaacadaaabiaacaaaaiaahaaaaacadaaaciaacaaffia
ahaaaaacadaaaeiaacaakkiaahaaaaacadaaaiiaacaappiaabaaaaacaeaaabia
chaaaakaaeaaaaaeacaaapiaacaaoeiaakaaoekaaeaaaaiaafaaaaadaaaaapia
aaaaoeiaadaaoeiaalaaaaadaaaaapiaaaaaoeiacjaaaakaagaaaaacadaaabia
acaaaaiaagaaaaacadaaaciaacaaffiaagaaaaacadaaaeiaacaakkiaagaaaaac
adaaaiiaacaappiaafaaaaadaaaaapiaaaaaoeiaadaaoeiaafaaaaadacaaahia
aaaaffiaamaaoekaaeaaaaaeacaaahiaalaaoekaaaaaaaiaacaaoeiaaeaaaaae
aaaaahiaanaaoekaaaaakkiaacaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappia
aaaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaagaaffia
bhaaoekaaeaaaaaeaaaaapiabgaaoekaagaaaaiaaaaaoeiaaeaaaaaeaaaaapia
biaaoekaagaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabjaaoekaafaaaaad
abaaabiaaaaaffiaafaaaakaafaaaaadabaaaiiaabaaaaiachaakkkbafaaaaad
abaaafiaaaaapeiachaakkkbacaaaaadafaaadoaabaakkiaabaaomiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
afaaamoaaaaaoeiaaeaaaaaeabaaapoaafaappjacjaaeakacjaabfkappppaaaa
fdeieefcdaapaaaaeaaaabaammadaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaa
fpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
lcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
giaaaaacamaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaa
aaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
aaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
abaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaa
fgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaa
egaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaa
aaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaa
ngafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaa
bkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaa
mnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaa
dgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaa
igaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaahaaaaaa
egacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaa
aeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaa
egiocaaaadaaaaaaadaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaa
diaaaaajhcaabaaaacaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
adaaaaaapgapbaaaaaaaaaaaegbcbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaaaaaaaaaegbcbaaaacaaaaaa
diaaaaahhcaabaaaafaaaaaajgaebaaaadaaaaaacgajbaaaaeaaaaaadcaaaaak
hcaabaaaafaaaaaajgaebaaaaeaaaaaacgajbaaaadaaaaaaegacbaiaebaaaaaa
afaaaaaadiaaaaahhcaabaaaafaaaaaaegacbaaaafaaaaaapgbpbaaaabaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaabaaaaaah
bccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaa
adaaaaaaegacbaaaaeaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegacbaaa
acaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaa
apaaaaaaaaaaaaajpcaabaaaagaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaa
acaaaaaaadaaaaaadiaaaaahpcaabaaaahaaaaaaegaobaaaagaaaaaaegaobaaa
agaaaaaaaaaaaaajpcaabaaaaiaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaa
acaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaa
egiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaahaaaaaaegaobaaaaiaaaaaa
egaobaaaaiaaaaaaegaobaaaahaaaaaadcaaaaajpcaabaaaahaaaaaaegaobaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaahaaaaaadcaaaaanpcaabaaaajaaaaaa
egaobaaaahaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpeeaaaaafpcaabaaaahaaaaaaegaobaaaahaaaaaaaoaaaaak
pcaabaaaajaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaa
ajaaaaaadiaaaaaihcaabaaaakaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaalaaaaaafgafbaaaakaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaakaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
akaaaaaaegaibaaaalaaaaaadcaaaaakhcaabaaaakaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaakaaaaaaegadbaaaakaaaaaadiaaaaahpcaabaaaagaaaaaa
egaobaaaagaaaaaafgafbaaaakaaaaaadcaaaaajpcaabaaaagaaaaaaegaobaaa
aiaaaaaaagaabaaaakaaaaaaegaobaaaagaaaaaadcaaaaajpcaabaaaacaaaaaa
egaobaaaacaaaaaakgakbaaaakaaaaaaegaobaaaagaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaahaaaaaaegaobaaaacaaaaaadeaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaajaaaaaaegaobaaaacaaaaaadiaaaaaihcaabaaa
agaaaaaafgafbaaaacaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaa
agaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaacaaaaaaegacbaaaagaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaacaaaaaa
egacbaaaagaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaajaaaaaa
pgapbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaakaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaagaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
akaaaaaabbaaaaaiccaabaaaagaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
akaaaaaabbaaaaaiecaabaaaagaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
akaaaaaadiaaaaahpcaabaaaahaaaaaajgacbaaaakaaaaaaegakbaaaakaaaaaa
bbaaaaaibcaabaaaaiaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaahaaaaaa
bbaaaaaiccaabaaaaiaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaahaaaaaa
bbaaaaaiecaabaaaaiaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaahaaaaaa
aaaaaaahhcaabaaaagaaaaaaegacbaaaagaaaaaaegacbaaaaiaaaaaadiaaaaah
icaabaaaaaaaaaaabkaabaaaakaaaaaabkaabaaaakaaaaaadcaaaaakicaabaaa
aaaaaaaaakaabaaaakaaaaaaakaabaaaakaaaaaadkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhcaabaaaagaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaa
egacbaaaagaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaa
agaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
aaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
egacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegacbaaaaeaaaaaaegacbaaa
aaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaafaaaaaaegacbaaaaaaaaaaa
diaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaak
fcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadgaaaaafmccabaaaagaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaa
agaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
mfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 2, 1, 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2.yw, fragment.texcoord[0], texture[2], 2D;
TEX R1.w, fragment.texcoord[0], texture[1], 2D;
MAD R2.xy, R2.wyzw, c[4].x, -c[4].y;
MUL R2.zw, R2.xyxy, R2.xyxy;
ADD_SAT R2.z, R2, R2.w;
DP3 R3.x, fragment.texcoord[3], fragment.texcoord[3];
ADD R2.z, -R2, c[4].y;
RSQ R2.z, R2.z;
MUL R0.xyz, R0, c[2];
RCP R2.z, R2.z;
RSQ R3.x, R3.x;
MOV R1.xyz, fragment.texcoord[1];
MAD R1.xyz, R3.x, fragment.texcoord[3], R1;
DP3 R2.w, R1, R1;
RSQ R2.w, R2.w;
MUL R1.xyz, R2.w, R1;
DP3 R1.x, R2, R1;
MOV R2.w, c[4];
DP3 R2.x, R2, fragment.texcoord[1];
MUL R1.y, R2.w, c[3].x;
MAX R1.x, R1, c[4].z;
POW R1.x, R1.x, R1.y;
MUL R2.w, R1.x, R1;
MOV R1, c[1];
MUL R1.w, R1, c[0];
MUL R0.xyz, R0, fragment.color.primary.w;
MAX R3.x, R2, c[4].z;
MUL R2.xyz, R0, c[0];
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[0];
MAD R1.xyz, R1, R2.w, R2;
MUL R1.xyz, R1, c[4].x;
MAD result.color.xyz, R0, fragment.texcoord[2], R1;
MAD result.color.w, R2, R1, R0;
END
# 35 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c5, 128.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r1, t0, s2
texld r2, t0, s0
texld r0, t0, s1
dp3_pp r1.x, t3, t3
mul_pp r2.xyz, r2, c2
mov r0.y, r1
mov r0.x, r1.w
mad_pp r3.xy, r0, c4.x, c4.y
mul_pp r0.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c4.z
rsq_pp r0.x, r0.x
rcp_pp r3.z, r0.x
mov_pp r0.x, c3
rsq_pp r1.x, r1.x
mov_pp r4.xyz, t1
mad_pp r4.xyz, r1.x, t3, r4
dp3_pp r1.x, r4, r4
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r4
dp3_pp r1.x, r3, r1
mul_pp r0.x, c5, r0
max_pp r1.x, r1, c4.w
pow r4.w, r1.x, r0.x
dp3_pp r1.x, r3, t1
mov r0.x, r4.w
mul r0.x, r0, r0.w
mul_pp r2.xyz, r2, v0.w
mov_pp r3.xyz, c0
mov_pp r0.w, c0
max_pp r1.x, r1, c4.w
mul_pp r4.xyz, r2, c0
mul_pp r1.xyz, r4, r1.x
mul_pp r3.xyz, c1, r3
mad r3.xyz, r3, r0.x, r1
mul_pp r1.x, c1.w, r0.w
mad r0.w, r0.x, r1.x, r2
mul r3.xyz, r3, c4.x
mad_pp r0.xyz, r2, t2, r3
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 2
SetTexture 2 [_BumpMap] 2D 1
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 64 [_Color]
Float 100 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcdkedlckkgaclbnepinollibfpcaekjcabaaaaaajmafaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
hiaeaaaaeaaaaaaaboabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaa
afaaaaaaagaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
abaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
abaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaa
adaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaaagaaaaaaabeaaaaaaaaaaaed
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaa
aaaaaaaaabaaaaaaegiocaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaacaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaajiccabaaaaaaaaaaa
dkaabaaaabaaaaaaakaabaaaaaaaaaaadkaabaaaacaaaaaadiaaaaahncaabaaa
aaaaaaaaagajbaaaacaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaacaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadcaaaaajhccabaaaaaaaaaaa
igadbaaaaaaaaaaaegbcbaaaaeaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 2
SetTexture 2 [_BumpMap] 2D 1
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 64 [_Color]
Float 100 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedecfmigalbighlfkgijlepojffdaogbpnabaaaaaalaaiaaaaaeaaaaaa
daaaaaaaeaadaaaamaahaaaahmaiaaaaebgpgodjaiadaaaaaiadaaaaaaacpppp
leacaaaafeaaaaaaadaadaaaaaaafeaaaaaafeaaadaaceaaaaaafeaaaaaaaaaa
acababaaabacacaaaaaaabaaacaaaaaaaaaaaaaaaaaaaeaaabaaacaaaaaaaaaa
aaaaagaaabaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaaaaeaaaaaialp
aaaaaaaaaaaaiadpfbaaaaafafaaapkaaaaaaaedaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
ecaaaaadaaaacpiaaaaaoelaabaioekaecaaaaadabaacpiaaaaaoelaacaioeka
ecaaaaadacaacpiaaaaaoelaaaaioekaaiaaaaadaaaacbiaaeaaoelaaeaaoela
ahaaaaacaaaacbiaaaaaaaiaabaaaaacabaaahiaaeaaoelaaeaaaaaeabaachia
abaaoeiaaaaaaaiaacaaoelaceaaaaacadaachiaabaaoeiaaeaaaaaeabaacbia
aaaappiaaeaaaakaaeaaffkaaeaaaaaeabaacciaaaaaffiaaeaaaakaaeaaffka
fkaaaaaeadaadiiaabaaoeiaabaaoeiaaeaakkkaacaaaaadadaaciiaadaappib
aeaappkaahaaaaacadaaciiaadaappiaagaaaaacabaaceiaadaappiaaiaaaaad
aaaacbiaabaaoeiaadaaoeiaaiaaaaadaaaacciaabaaoeiaacaaoelaalaaaaad
abaacbiaaaaaffiaaeaakkkaalaaaaadabaaaciaaaaaaaiaaeaakkkaabaaaaac
aaaaaciaadaaffkaafaaaaadaaaaabiaaaaaffiaafaaaakacaaaaaadadaaabia
abaaffiaaaaaaaiaafaaaaadaaaaabiaabaappiaadaaaaiaabaaaaacadaaapia
aaaaoekaafaaaaadaaaaaoiaadaabliaabaablkaafaaaaadaaaaaoiaaaaaaaia
aaaaoeiaafaaaaadabaacoiaacaabliaacaablkaafaaaaadabaacoiaabaaoeia
abaapplaafaaaaadacaachiaabaabliaaaaaoekaaeaaaaaeaaaaaoiaacaablia
abaaaaiaaaaaoeiaacaaaaadaaaacoiaaaaaoeiaaaaaoeiaaeaaaaaeabaachia
abaabliaadaaoelaaaaabliaafaaaaadaaaaaciaadaappiaabaappkaaeaaaaae
abaaciiaaaaaffiaaaaaaaiaacaappiaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefchiaeaaaaeaaaaaaaboabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
eeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
egbcbaaaafaaaaaaagaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaabaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaa
ddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaa
egbcbaaaadaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaaagaaaaaaabeaaaaa
aaaaaaeddiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaa
bjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajpcaabaaaabaaaaaa
egiocaaaaaaaaaaaabaaaaaaegiocaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaajiccabaaa
aaaaaaaadkaabaaaabaaaaaaakaabaaaaaaaaaaadkaabaaaacaaaaaadiaaaaah
ncaabaaaaaaaaaaaagajbaaaacaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaaigadbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaacaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadcaaaaajhccabaaa
aaaaaaaaigadbaaaaaaaaaaaegbcbaaaaeaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 2, 1, 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R3.yw, fragment.texcoord[0], texture[2], 2D;
TXP R0.x, fragment.texcoord[4], texture[3], 2D;
TEX R0.w, fragment.texcoord[0], texture[1], 2D;
MAD R3.xy, R3.wyzw, c[4].x, -c[4].y;
DP3 R0.y, fragment.texcoord[3], fragment.texcoord[3];
MUL R1.xyz, R1, c[2];
MUL R3.zw, R3.xyxy, R3.xyxy;
RSQ R0.y, R0.y;
MOV R2.xyz, fragment.texcoord[1];
MAD R2.xyz, R0.y, fragment.texcoord[3], R2;
ADD_SAT R0.y, R3.z, R3.w;
DP3 R0.z, R2, R2;
RSQ R0.z, R0.z;
ADD R0.y, -R0, c[4];
RSQ R0.y, R0.y;
RCP R3.z, R0.y;
MUL R2.xyz, R0.z, R2;
DP3 R0.z, R3, R2;
MOV R0.y, c[4].w;
MUL R2.x, R0.y, c[3];
MAX R0.y, R0.z, c[4].z;
POW R0.y, R0.y, R2.x;
MOV R2, c[1];
MUL R0.y, R0, R0.w;
DP3 R0.z, R3, fragment.texcoord[1];
MUL R1.xyz, R1, fragment.color.primary.w;
MAX R0.z, R0, c[4];
MUL R3.xyz, R1, c[0];
MUL R3.xyz, R3, R0.z;
MUL R2.xyz, R2, c[0];
MAD R2.xyz, R2, R0.y, R3;
MUL R0.z, R0.x, c[4].x;
MUL R0.w, R2, c[0];
MUL R2.xyz, R2, R0.z;
MUL R0.y, R0, R0.w;
MAD result.color.xyz, R1, fragment.texcoord[2], R2;
MAD result.color.w, R0.x, R0.y, R1;
END
# 38 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c4, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c5, 128.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
texld r0, t0, s2
texld r1, t0, s1
texldp r5, t4, s3
texld r2, t0, s0
mov r0.x, r0.w
mad_pp r3.xy, r0, c4.x, c4.y
mul_pp r0.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
dp3_pp r1.x, t3, t3
add_pp r0.x, -r0, c4.z
rsq_pp r0.x, r0.x
rcp_pp r3.z, r0.x
mov_pp r0.x, c3
rsq_pp r1.x, r1.x
mov_pp r4.xyz, t1
mad_pp r4.xyz, r1.x, t3, r4
dp3_pp r1.x, r4, r4
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r4
dp3_pp r1.x, r3, r1
max_pp r1.x, r1, c4.w
mul_pp r0.x, c5, r0
pow r4.w, r1.x, r0.x
mov r0.x, r4.w
mul_pp r4.xyz, r2, c2
dp3_pp r2.x, r3, t1
mul_pp r3.xyz, r4, v0.w
mul r1.x, r0, r1.w
mov_pp r0.w, c0
mul_pp r0.x, c1.w, r0.w
mul r0.x, r1, r0
max_pp r2.x, r2, c4.w
mul_pp r4.xyz, r3, c0
mul_pp r6.xyz, r4, r2.x
mov_pp r4.xyz, c0
mul_pp r4.xyz, c1, r4
mad r0.w, r5.x, r0.x, r2
mul_pp r2.x, r5, c4
mad r1.xyz, r4, r1.x, r6
mul r1.xyz, r1, r2.x
mad_pp r0.xyz, r3, t2, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_GlossMap] 2D 3
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedjpjeedjaapbgginccdmcaihdifhlfhifabaaaaaadiagaaaaadaaaaaa
cmaaaaaaaaabaaaadeabaaaaejfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpmaeaaaaeaaaaaaa
dpabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaa
afaaaaaaagaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
abaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaa
adaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaed
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaa
aaaaaaaaabaaaaaaegiocaaaaaaaaaaaacaaaaaadiaaaaahpcaabaaaabaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaincaabaaaaaaaaaaa
agajbaaaacaaaaaaagijcaaaaaaaaaaaaiaaaaaadiaaaaahncaabaaaaaaaaaaa
agaobaaaaaaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaigadbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahncaabaaaaaaaaaaaagaobaaa
aaaaaaaaagbjbaaaaeaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaacaaaaaa
fgafbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaa
agaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
adaaaaaaakaabaaaadaaaaaadcaaaaajiccabaaaaaaaaaaadkaabaaaabaaaaaa
akaabaaaadaaaaaadkaabaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_GlossMap] 2D 3
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedooecmbhhpmmebegnnkiooemappljhpfiabaaaaaaleajaaaaaeaaaaaa
daaaaaaakiadaaaakmaiaaaaiaajaaaaebgpgodjhaadaaaahaadaaaaaaacpppp
biadaaaafiaaaaaaadaadeaaaaaafiaaaaaafiaaaeaaceaaaaaafiaaadaaaaaa
aaababaaacacacaaabadadaaaaaaabaaacaaaaaaaaaaaaaaaaaaaiaaabaaacaa
aaaaaaaaaaaaakaaabaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaaaaea
aaaaialpaaaaaaaaaaaaiadpfbaaaaafafaaapkaaaaaaaedaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachla
bpaaaaacaaaaaaiaafaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkaagaaaaac
aaaaaiiaafaapplaafaaaaadaaaaadiaaaaappiaafaaoelaecaaaaadabaacpia
aaaaoelaacaioekaecaaaaadacaacpiaaaaaoelaadaioekaecaaaaadadaacpia
aaaaoelaabaioekaecaaaaadaaaacpiaaaaaoeiaaaaioekaaiaaaaadaaaaccia
aeaaoelaaeaaoelaahaaaaacaaaacciaaaaaffiaabaaaaacacaaahiaaeaaoela
aeaaaaaeacaachiaacaaoeiaaaaaffiaacaaoelaceaaaaacaeaachiaacaaoeia
aeaaaaaeacaacbiaabaappiaaeaaaakaaeaaffkaaeaaaaaeacaacciaabaaffia
aeaaaakaaeaaffkafkaaaaaeaeaadiiaacaaoeiaacaaoeiaaeaakkkaacaaaaad
aeaaciiaaeaappibaeaappkaahaaaaacaeaaciiaaeaappiaagaaaaacacaaceia
aeaappiaaiaaaaadaaaacciaacaaoeiaaeaaoeiaaiaaaaadaaaaceiaacaaoeia
acaaoelaalaaaaadabaacbiaaaaakkiaaeaakkkaalaaaaadabaaaciaaaaaffia
aeaakkkaabaaaaacaaaaaciaadaaffkaafaaaaadaaaaaciaaaaaffiaafaaaaka
caaaaaadacaaabiaabaaffiaaaaaffiaafaaaaadaaaaaciaacaappiaacaaaaia
abaaaaacacaaapiaaaaaoekaafaaaaadabaaaoiaacaabliaabaablkaafaaaaad
abaaaoiaaaaaffiaabaaoeiaafaaaaadacaachiaadaaoeiaacaaoekaafaaaaad
acaachiaacaaoeiaabaapplaafaaaaadadaachiaacaaoeiaaaaaoekaafaaaaad
acaachiaacaaoeiaadaaoelaaeaaaaaeabaaahiaadaaoeiaabaaaaiaabaablia
acaaaaadabaaaiiaaaaaaaiaaaaaaaiaaeaaaaaeabaachiaabaaoeiaabaappia
acaaoeiaafaaaaadaaaaaeiaacaappiaabaappkaafaaaaadaaaaaciaaaaaffia
aaaakkiaaeaaaaaeabaaciiaaaaaffiaaaaaaaiaadaappiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefcpmaeaaaaeaaaaaaadpabaaaafjaaaaaeegiocaaa
aaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaafaaaaaaagaabaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaa
abaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaadaaaaaadeaaaaakdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaa
bkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaeddiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaadaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaa
abaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaaegiocaaa
aaaaaaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaaincaabaaaaaaaaaaaagajbaaaacaaaaaaagijcaaa
aaaaaaaaaiaaaaaadiaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaapgbpbaaa
acaaaaaadiaaaaaihcaabaaaacaaaaaaigadbaaaaaaaaaaaegiccaaaaaaaaaaa
abaaaaaadiaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaaagbjbaaaaeaaaaaa
dcaaaaajhcaabaaaabaaaaaaegacbaaaacaaaaaafgafbaaaaaaaaaaaegacbaaa
abaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaaagaaaaaapgbpbaaaagaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaa
dcaaaaajiccabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaadaaaaaadkaabaaa
acaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaadoaaaaabejfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "RenderType"="TreeBark" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_Time]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_Scale]
Vector 21 [_Scale]
Vector 22 [_SquashPlaneNormal]
Float 23 [_SquashAmount]
Vector 24 [_Wind]
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[28] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..25],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MOV R2.w, c[0].x;
MUL R2.xyz, vertex.position, c[21];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[17].y;
MUL R0, R0.xxyy, c[26];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, c[24];
MUL R0.x, vertex.color.y, c[27].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.xz, R0.x, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[27].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[24].w, R2;
MAD R0.xyz, vertex.texcoord[1].x, c[24], R0;
DP3 R0.w, R0, c[22];
ADD R0.w, R0, c[22];
MUL R1.xyz, R0.w, c[22];
ADD R0.xyz, -R1, R0;
MAD R2.xyz, R1, c[23].x, R0;
DP4 R0.w, R2, c[8];
DP4 R0.z, R2, c[7];
DP4 R0.x, R2, c[5];
DP4 R0.y, R2, c[6];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
DP3 R0.y, vertex.attrib[14], vertex.attrib[14];
RSQ R0.y, R0.y;
DP3 R0.x, vertex.normal, vertex.normal;
RSQ R0.x, R0.x;
MUL R4.xyz, R0.y, vertex.attrib[14];
MUL R1.xyz, R0.x, vertex.normal;
MUL R3.xyz, R1.zxyw, R4.yzxw;
MAD R5.xyz, R1.yzxw, R4.zxyw, -R3;
MOV R0, c[19];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[20].w, -R2;
MUL R5.xyz, R5, vertex.attrib[14].w;
MOV R0.xyz, c[18];
MOV R0.w, c[0].x;
DP4 R6.z, R0, c[11];
DP4 R6.x, R0, c[9];
DP4 R6.y, R0, c[10];
MAD R0.xyz, R6, c[20].w, -R2;
DP4 result.position.w, R2, c[4];
DP4 result.position.z, R2, c[3];
DP4 result.position.y, R2, c[2];
DP4 result.position.x, R2, c[1];
DP3 result.texcoord[1].z, R1, R3;
DP3 result.texcoord[1].y, R3, R5;
DP3 result.texcoord[1].x, R3, R4;
DP3 result.texcoord[2].z, R1, R0;
DP3 result.texcoord[2].y, R5, R0;
DP3 result.texcoord[2].x, R4, R0;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MOV result.color.w, vertex.color;
END
# 72 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_Time]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_Scale]
Vector 21 [_SquashPlaneNormal]
Float 22 [_SquashAmount]
Vector 23 [_Wind]
Vector 24 [_MainTex_ST]
"vs_2_0
def c25, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c26, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c27, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c25.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r2.w, c25.x
mul r2.xyz, v0, c20
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c16.y
mul r0, r0.xxyy, c26
frc r0, r0
mad r0, r0, c25.y, c25.z
frc r0, r0
mad r0, r0, c25.y, c25.w
abs r0, r0
mad r1, -r0, c27.x, c27.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r1.xyz, r3.y, c23
mul r0.x, v5.y, c27.w
mul r1.xyz, v4.y, r1
mul r0.xz, r0.x, v2
mul r0.y, v4, c27.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c23.w, r2
mad r0.xyz, v4.x, c23, r0
dp3 r0.w, r0, c21
add r0.w, r0, c21
mul r1.xyz, r0.w, c21
add r0.xyz, -r1, r0
mad r2.xyz, r1, c22.x, r0
dp4 r0.w, r2, c7
dp4 r0.z, r2, c6
dp4 r0.x, r2, c4
dp4 r0.y, r2, c5
dp4 oT3.z, r0, c14
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
dp3 r0.y, v1, v1
rsq r0.y, r0.y
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r4.xyz, r0.y, v1
mul r3.xyz, r0.x, v2
mul r1.xyz, r3.zxyw, r4.yzxw
mad r5.xyz, r3.yzxw, r4.zxyw, -r1
mov r0, c10
dp4 r6.z, c18, r0
mov r0, c9
dp4 r6.y, c18, r0
mov r1, c8
dp4 r6.x, c18, r1
mad r1.xyz, r6, c19.w, -r2
mul r5.xyz, r5, v1.w
mov r0.xyz, c17
mov r0.w, c25.x
dp4 r6.z, r0, c10
dp4 r6.x, r0, c8
dp4 r6.y, r0, c9
mad r0.xyz, r6, c19.w, -r2
dp4 oPos.w, r2, c3
dp4 oPos.z, r2, c2
dp4 oPos.y, r2, c1
dp4 oPos.x, r2, c0
dp3 oT1.z, r3, r1
dp3 oT1.y, r1, r5
dp3 oT1.x, r1, r4
dp3 oT2.z, r3, r0
dp3 oT2.y, r5, r0
dp3 oT2.x, r4, r0
mov oD0.xyz, c25.x
mad oT0.xy, v3, c24, c24.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedhichegnhjidphemnhjikmejdamkhlmdlabaaaaaadiamaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefciaakaaaaeaaaabaakaacaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
acaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaaba
pcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaaaaaaaaaegbcbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaa
egbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaaaaaaaaaegbcbaaaacaaaaaabaaaaaaheccabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaa
jgaebaaaacaaaaaacgajbaaaadaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaa
adaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaa
aeaaaaaaegacbaaaaeaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaaeaaaaaaegacbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaa
aeaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaa
egacbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
aeaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedfldincpejnbnohchheihagnndcbeodglabaaaaaadabcaaaaaeaaaaaa
daaaaaaaceagaaaakmbaaaaahebbaaaaebgpgodjomafaaaaomafaaaaaaacpopp
fiafaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaadaa
afaaabaaaaaaaaaaaaaaalaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaa
abaaaeaaabaaaiaaaaaaaaaaacaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaa
aaaaaaaaadaaamaaajaaaoaaaaaaaaaaaeaaafaaabaabhaaaaaaaaaaaeaaakaa
acaabiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbkaaapkamnmmpmdpamaceldp
aaaamadomlkbefdofbaaaaafblaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialp
fbaaaaafbmaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafbnaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaagaaoekaagaaookaabaaaaacaaaaapiaajaaoekaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeabaaahiabcaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaappia
aaaaoeiaabaaaaacabaaabiaaoaappkaabaaaaacabaaaciaapaappkaabaaaaac
abaaaeiabaaappkaaiaaaaadaaaaaiiaabaaoeiablaaaakaacaaaaadabaaacia
aaaappiaafaaaajaacaaaaadaaaaaiiaabaaffiaafaaffjaafaaaaadacaaahia
aaaaoejabhaaoekaaiaaaaadabaaabiaacaaoeiaaaaappiaacaaaaadabaaapia
abaafaiaahaaffkaafaaaaadabaaapiaabaaoeiabkaaoekabdaaaaacabaaapia
abaaoeiaaeaaaaaeabaaapiaabaaoeiablaaffkablaakkkabdaaaaacabaaapia
abaaoeiaaeaaaaaeabaaapiaabaaoeiablaaffkablaappkacdaaaaacabaaapia
abaaoeiaafaaaaadadaaapiaabaaoeiaabaaoeiaaeaaaaaeabaaapiaabaaoeia
bmaaaakbbmaaffkaafaaaaadabaaapiaabaaoeiaadaaoeiaacaaaaadabaaadia
abaaoniaabaaoiiaafaaaaadadaaahiaabaaffiaafaaoekaafaaaaadadaaahia
adaaoeiaaeaaffjaafaaaaadaeaaaciaabaaffiaaeaaffjaafaaaaadaaaaaiia
afaaffjabmaakkkaafaaaaadaeaaafiaaaaappiaacaaoejaabaaaaacabaaaeia
bmaappkaaeaaaaaeabaaahiaabaamiiaaeaaoeiaadaaoeiaaeaaaaaeabaaahia
abaaoeiaafaappkaacaaoeiaaeaaaaaeabaaahiaaeaaaajaafaaoekaabaaoeia
aiaaaaadaaaaaiiabiaaoekaabaaoeiaacaaaaadaaaaaiiaaaaappiabiaappka
aeaaaaaeacaaahiaaaaappiabiaaoekbabaaoeiabcaaaaaeadaaahiabjaaaaka
abaaoeiaacaaoeiaaeaaaaaeaaaaahiaaaaaoeiabgaappkaadaaoeibceaaaaac
abaaahiaabaaoejaaiaaaaadacaaaboaabaaoeiaaaaaoeiaceaaaaacacaaahia
acaaoejaafaaaaadaeaaahiaabaamjiaacaanciaaeaaaaaeaeaaahiaacaamjia
abaanciaaeaaoeibafaaaaadaeaaahiaaeaaoeiaabaappjaaiaaaaadacaaacoa
aeaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeiaaaaaoeiaabaaaaacaaaaahia
aiaaoekaafaaaaadafaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaaliabcaakeka
aaaaaaiaafaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappkaadaaoeib
aiaaaaadadaaaboaabaaoeiaaaaaoeiaaiaaaaadadaaacoaaeaaoeiaaaaaoeia
aiaaaaadadaaaeoaacaaoeiaaaaaoeiaafaaaaadaaaaapiaadaaffiaapaaoeka
aeaaaaaeaaaaapiaaoaaoekaadaaaaiaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
adaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabbaaoekaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaadaaffiaalaaoekaaeaaaaaeaaaaapiaakaaoeka
adaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaadaakkiaaaaaoeiaacaaaaad
aaaaapiaaaaaoeiaanaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjabnaaeakabnaabfka
ppppaaaafdeieefciaakaaaaeaaaabaakaacaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacafaaaaaa
dgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaa
aeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaa
aaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdp
amaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaa
aaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaia
mbaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaa
igaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaa
aeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaa
diaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaah
fcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaa
aaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaa
afaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaa
abaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
aaaaaaaaegbcbaaaacaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaajgaebaaaacaaaaaacgajbaaa
adaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaaadaaaaaacgajbaaaacaaaaaa
egacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaaaeaaaaaa
pgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaa
abaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
aaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_Scale]
Vector 17 [_Scale]
Vector 18 [_SquashPlaneNormal]
Float 19 [_SquashAmount]
Vector 20 [_Wind]
Vector 21 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[24] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..21],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MUL R2.xyz, vertex.position, c[17];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[13].y;
MUL R0, R0.xxyy, c[22];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, c[20];
MUL R0.x, vertex.color.y, c[23].y;
MOV R1.w, c[0].x;
MOV R0.w, c[0].x;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.xz, R0.x, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[23].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[20].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[20], R0;
DP3 R0.x, R1, c[18];
ADD R0.x, R0, c[18].w;
MUL R0.xyz, R0.x, c[18];
ADD R1.xyz, -R0, R1;
MAD R1.xyz, R0, c[19].x, R1;
DP3 R0.y, vertex.attrib[14], vertex.attrib[14];
RSQ R0.y, R0.y;
DP3 R0.x, vertex.normal, vertex.normal;
RSQ R0.x, R0.x;
MUL R3.xyz, R0.y, vertex.attrib[14];
MUL R2.xyz, R0.x, vertex.normal;
MUL R0.xyz, R2.zxyw, R3.yzxw;
MAD R4.xyz, R2.yzxw, R3.zxyw, -R0;
MOV R0.xyz, c[14];
MUL R4.xyz, R4, vertex.attrib[14].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 R5.z, R0, c[11];
DP4 R5.x, R0, c[9];
DP4 R5.y, R0, c[10];
MAD R0.xyz, R5, c[16].w, -R1;
DP3 result.texcoord[2].z, R2, R0;
DP3 result.texcoord[2].y, R4, R0;
MOV R1, c[15];
DP3 result.texcoord[2].x, R3, R0;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
DP3 result.texcoord[1].y, R0, R4;
DP3 result.texcoord[1].z, R2, R0;
DP3 result.texcoord[1].x, R0, R3;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MOV result.color.w, vertex.color;
END
# 64 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_Scale]
Vector 17 [_SquashPlaneNormal]
Float 18 [_SquashAmount]
Vector 19 [_Wind]
Vector 20 [_MainTex_ST]
"vs_2_0
def c21, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c22, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c23, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c21.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r4.w, c21.x
mul r2.xyz, v0, c16
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c12.y
mul r0, r0.xxyy, c22
frc r0, r0
mad r0, r0, c21.y, c21.z
frc r0, r0
mad r0, r0, c21.y, c21.w
abs r0, r0
mad r1, -r0, c23.x, c23.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r1.xyz, r3.y, c19
mul r0.x, v5.y, c23.w
mov r1.w, c21.x
mul r1.xyz, v4.y, r1
mul r0.xz, r0.x, v2
mul r0.y, v4, c23.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c19.w, r2
mad r1.xyz, v4.x, c19, r0
dp3 r0.x, r1, c17
add r0.x, r0, c17.w
mul r0.xyz, r0.x, c17
add r1.xyz, -r0, r1
mad r4.xyz, r0, c18.x, r1
mov r1.xyz, c13
dp3 r0.y, v1, v1
rsq r0.y, r0.y
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r3.xyz, r0.y, v1
mul r2.xyz, r0.x, v2
mul r0.xyz, r2.zxyw, r3.yzxw
dp4 r5.z, r1, c10
dp4 r5.x, r1, c8
dp4 r5.y, r1, c9
mad r1.xyz, r5, c15.w, -r4
mad r0.xyz, r2.yzxw, r3.zxyw, -r0
dp4 oPos.w, r4, c3
dp4 oPos.z, r4, c2
dp4 oPos.y, r4, c1
dp4 oPos.x, r4, c0
mul r4.xyz, r0, v1.w
mov r0, c10
dp4 r5.z, c14, r0
mov r0, c9
dp4 r5.y, c14, r0
dp3 oT2.z, r2, r1
dp3 oT2.y, r4, r1
dp3 oT2.x, r3, r1
mov r1, c8
dp4 r5.x, c14, r1
dp3 oT1.y, r5, r4
dp3 oT1.z, r2, r5
dp3 oT1.x, r5, r3
mov oD0.xyz, c21.x
mad oT0.xy, v3, c20, c20.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedcmnhbhegclcnjjnkpalkkohegiigjocmabaaaaaamaakaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefccaajaaaa
eaaaabaaeiacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
giaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaa
aaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
aaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
abaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaa
fgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaa
egaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaa
aaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaa
ngafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaa
bkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaa
mnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaa
dgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaa
igaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaa
egacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaa
aeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaa
egiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaaihccabaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaa
acaaaaaadkbabaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaa
egbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaacaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaa
abaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaa
dcaaaaakhcaabaaaadaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaia
ebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaa
aeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaa
diaaaaajhcaabaaaaeaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaeaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaia
ebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedmjcgkjbpfoiadokmoplgigckogkelgkdabaaaaaabmbaaaaaaeaaaaaa
daaaaaaaiiafaaaalaaoaaaahiapaaaaebgpgodjfaafaaaafaafaaaaaaacpopp
laaeaaaakaaaaaaaakaaceaaaaaajmaaaaaajmaaaaaaceaaabaajmaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaaeaaabaaaeaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaaadaaaaaaaeaaagaa
aaaaaaaaadaaamaaadaaakaaaaaaaaaaadaabaaaafaaanaaaaaaaaaaaeaaafaa
abaabcaaaaaaaaaaaeaaakaaacaabdaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaaf
bfaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafbgaaapkaaaaaiadp
aaaaaaeaaaaaaalpaaaaialpfbaaaaafbhaaapkaaaaaaaeaaaaaeaeamnmmmmdn
jkjjjjdofbaaaaafbiaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafia
afaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaabaaaaacaaaaapia
afaaoekaafaaaaadabaaahiaaaaaffiaaoaaoekaaeaaaaaeabaaahiaanaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiabaaaoekaaaaappiaaaaaoeiaceaaaaacabaaahiaabaaoejaaiaaaaad
acaaaboaabaaoeiaaaaaoeiaceaaaaacacaaahiaacaaoejaafaaaaadadaaahia
abaamjiaacaanciaaeaaaaaeadaaahiaacaamjiaabaanciaadaaoeibafaaaaad
adaaahiaadaaoeiaabaappjaaiaaaaadacaaacoaadaaoeiaaaaaoeiaaiaaaaad
acaaaeoaacaaoeiaaaaaoeiaabaaaaacaaaaabiaakaappkaabaaaaacaaaaacia
alaappkaabaaaaacaaaaaeiaamaappkaaiaaaaadaaaaabiaaaaaoeiabgaaaaka
acaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffiaafaaffja
afaaaaadaeaaahiaaaaaoejabcaaoekaaiaaaaadaaaaabiaaeaaoeiaaaaakkia
acaaaaadaaaaapiaaaaafaiaadaaffkaafaaaaadaaaaapiaaaaaoeiabfaaoeka
bdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabgaaffkabgaakkka
bdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabgaaffkabgaappka
cdaaaaacaaaaapiaaaaaoeiaafaaaaadafaaapiaaaaaoeiaaaaaoeiaaeaaaaae
aaaaapiaaaaaoeiabhaaaakbbhaaffkaafaaaaadaaaaapiaaaaaoeiaafaaoeia
acaaaaadaaaaadiaaaaaoniaaaaaoiiaafaaaaadafaaahiaaaaaffiaabaaoeka
afaaaaadafaaahiaafaaoeiaaeaaffjaafaaaaadagaaaciaaaaaffiaaeaaffja
afaaaaadaaaaaciaafaaffjabhaakkkaafaaaaadagaaafiaaaaaffiaacaaoeja
abaaaaacaaaaaeiabhaappkaaeaaaaaeaaaaahiaaaaamiiaagaaoeiaafaaoeia
aeaaaaaeaaaaahiaaaaaoeiaabaappkaaeaaoeiaaeaaaaaeaaaaahiaaeaaaaja
abaaoekaaaaaoeiaaiaaaaadaaaaaiiabdaaoekaaaaaoeiaacaaaaadaaaaaiia
aaaappiabdaappkaaeaaaaaeaeaaahiaaaaappiabdaaoekbaaaaoeiabcaaaaae
afaaahiabeaaaakaaaaaoeiaaeaaoeiaabaaaaacaaaaahiaaeaaoekaafaaaaad
aeaaahiaaaaaffiaaoaaoekaaeaaaaaeaaaaaliaanaakekaaaaaaaiaaeaakeia
aeaaaaaeaaaaahiaapaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeia
baaaoekaaeaaaaaeaaaaahiaaaaaoeiabbaappkaafaaoeibaiaaaaadadaaaboa
abaaoeiaaaaaoeiaaiaaaaadadaaacoaadaaoeiaaaaaoeiaaiaaaaadadaaaeoa
acaaoeiaaaaaoeiaafaaaaadaaaaapiaafaaffiaahaaoekaaeaaaaaeaaaaapia
agaaoekaafaaaaiaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaafaakkiaaaaaoeia
acaaaaadaaaaapiaaaaaoeiaajaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjabiaaeaka
biaabfkappppaaaafdeieefccaajaaaaeaaaabaaeiacaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaa
aeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaa
aaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaa
baaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaa
afaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
pcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamado
mlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialp
aaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaia
ibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaea
aaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
acaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaah
ccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaa
aaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaa
fgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaa
jkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
aaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaa
aeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaai
pccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaa
aaaaaaaaahaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egbcbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegbcbaaaabaaaaaadiaaaaahhcaabaaaadaaaaaa
cgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaa
abaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaaeaaaaaa
fgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aeaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaa
aeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaa
adaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaa
egacbaaaabaaaaaaegacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaeaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaa
aeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_Time]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_Scale]
Vector 21 [_Scale]
Vector 22 [_SquashPlaneNormal]
Float 23 [_SquashAmount]
Vector 24 [_Wind]
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[28] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..25],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MOV R2.w, c[0].x;
MUL R2.xyz, vertex.position, c[21];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[17].y;
MUL R0, R0.xxyy, c[26];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, c[24];
MUL R0.x, vertex.color.y, c[27].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.xz, R0.x, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[27].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[24].w, R2;
MAD R0.xyz, vertex.texcoord[1].x, c[24], R0;
DP3 R0.w, R0, c[22];
ADD R0.w, R0, c[22];
MUL R1.xyz, R0.w, c[22];
ADD R0.xyz, -R1, R0;
MAD R2.xyz, R1, c[23].x, R0;
DP4 R0.w, R2, c[8];
DP4 R0.z, R2, c[7];
DP4 R0.x, R2, c[5];
DP4 R0.y, R2, c[6];
DP4 result.texcoord[3].w, R0, c[16];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
DP3 R0.y, vertex.attrib[14], vertex.attrib[14];
RSQ R0.y, R0.y;
DP3 R0.x, vertex.normal, vertex.normal;
RSQ R0.x, R0.x;
MUL R4.xyz, R0.y, vertex.attrib[14];
MUL R1.xyz, R0.x, vertex.normal;
MUL R3.xyz, R1.zxyw, R4.yzxw;
MAD R5.xyz, R1.yzxw, R4.zxyw, -R3;
MOV R0, c[19];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[20].w, -R2;
MUL R5.xyz, R5, vertex.attrib[14].w;
MOV R0.xyz, c[18];
MOV R0.w, c[0].x;
DP4 R6.z, R0, c[11];
DP4 R6.x, R0, c[9];
DP4 R6.y, R0, c[10];
MAD R0.xyz, R6, c[20].w, -R2;
DP4 result.position.w, R2, c[4];
DP4 result.position.z, R2, c[3];
DP4 result.position.y, R2, c[2];
DP4 result.position.x, R2, c[1];
DP3 result.texcoord[1].z, R1, R3;
DP3 result.texcoord[1].y, R3, R5;
DP3 result.texcoord[1].x, R3, R4;
DP3 result.texcoord[2].z, R1, R0;
DP3 result.texcoord[2].y, R5, R0;
DP3 result.texcoord[2].x, R4, R0;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MOV result.color.w, vertex.color;
END
# 73 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_Time]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_Scale]
Vector 21 [_SquashPlaneNormal]
Float 22 [_SquashAmount]
Vector 23 [_Wind]
Vector 24 [_MainTex_ST]
"vs_2_0
def c25, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c26, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c27, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c25.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r2.w, c25.x
mul r2.xyz, v0, c20
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c16.y
mul r0, r0.xxyy, c26
frc r0, r0
mad r0, r0, c25.y, c25.z
frc r0, r0
mad r0, r0, c25.y, c25.w
abs r0, r0
mad r1, -r0, c27.x, c27.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r1.xyz, r3.y, c23
mul r0.x, v5.y, c27.w
mul r1.xyz, v4.y, r1
mul r0.xz, r0.x, v2
mul r0.y, v4, c27.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c23.w, r2
mad r0.xyz, v4.x, c23, r0
dp3 r0.w, r0, c21
add r0.w, r0, c21
mul r1.xyz, r0.w, c21
add r0.xyz, -r1, r0
mad r2.xyz, r1, c22.x, r0
dp4 r0.w, r2, c7
dp4 r0.z, r2, c6
dp4 r0.x, r2, c4
dp4 r0.y, r2, c5
dp4 oT3.w, r0, c15
dp4 oT3.z, r0, c14
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
dp3 r0.y, v1, v1
rsq r0.y, r0.y
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r4.xyz, r0.y, v1
mul r3.xyz, r0.x, v2
mul r1.xyz, r3.zxyw, r4.yzxw
mad r5.xyz, r3.yzxw, r4.zxyw, -r1
mov r0, c10
dp4 r6.z, c18, r0
mov r0, c9
dp4 r6.y, c18, r0
mov r1, c8
dp4 r6.x, c18, r1
mad r1.xyz, r6, c19.w, -r2
mul r5.xyz, r5, v1.w
mov r0.xyz, c17
mov r0.w, c25.x
dp4 r6.z, r0, c10
dp4 r6.x, r0, c8
dp4 r6.y, r0, c9
mad r0.xyz, r6, c19.w, -r2
dp4 oPos.w, r2, c3
dp4 oPos.z, r2, c2
dp4 oPos.y, r2, c1
dp4 oPos.x, r2, c0
dp3 oT1.z, r3, r1
dp3 oT1.y, r1, r5
dp3 oT1.x, r1, r4
dp3 oT2.z, r3, r0
dp3 oT2.y, r5, r0
dp3 oT2.x, r4, r0
mov oD0.xyz, c25.x
mad oT0.xy, v3, c24, c24.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedipgelfimlcdmigoemfkoonopfbiealobabaaaaaadiamaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefciaakaaaaeaaaabaakaacaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
acaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaaba
pcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaaaaaaaaaegbcbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaa
egbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaaaaaaaaaegbcbaaaacaaaaaabaaaaaaheccabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaa
jgaebaaaacaaaaaacgajbaaaadaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaa
adaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaa
aeaaaaaaegacbaaaaeaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaaeaaaaaaegacbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaa
aeaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaa
egacbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
aeaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedeghakkgpbkicbemlcnmkfkigbbogcgfmabaaaaaadabcaaaaaeaaaaaa
daaaaaaaceagaaaakmbaaaaahebbaaaaebgpgodjomafaaaaomafaaaaaaacpopp
fiafaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaadaa
afaaabaaaaaaaaaaaaaaalaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaa
abaaaeaaabaaaiaaaaaaaaaaacaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaa
aaaaaaaaadaaamaaajaaaoaaaaaaaaaaaeaaafaaabaabhaaaaaaaaaaaeaaakaa
acaabiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbkaaapkamnmmpmdpamaceldp
aaaamadomlkbefdofbaaaaafblaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialp
fbaaaaafbmaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafbnaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaagaaoekaagaaookaabaaaaacaaaaapiaajaaoekaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeabaaahiabcaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaappia
aaaaoeiaabaaaaacabaaabiaaoaappkaabaaaaacabaaaciaapaappkaabaaaaac
abaaaeiabaaappkaaiaaaaadaaaaaiiaabaaoeiablaaaakaacaaaaadabaaacia
aaaappiaafaaaajaacaaaaadaaaaaiiaabaaffiaafaaffjaafaaaaadacaaahia
aaaaoejabhaaoekaaiaaaaadabaaabiaacaaoeiaaaaappiaacaaaaadabaaapia
abaafaiaahaaffkaafaaaaadabaaapiaabaaoeiabkaaoekabdaaaaacabaaapia
abaaoeiaaeaaaaaeabaaapiaabaaoeiablaaffkablaakkkabdaaaaacabaaapia
abaaoeiaaeaaaaaeabaaapiaabaaoeiablaaffkablaappkacdaaaaacabaaapia
abaaoeiaafaaaaadadaaapiaabaaoeiaabaaoeiaaeaaaaaeabaaapiaabaaoeia
bmaaaakbbmaaffkaafaaaaadabaaapiaabaaoeiaadaaoeiaacaaaaadabaaadia
abaaoniaabaaoiiaafaaaaadadaaahiaabaaffiaafaaoekaafaaaaadadaaahia
adaaoeiaaeaaffjaafaaaaadaeaaaciaabaaffiaaeaaffjaafaaaaadaaaaaiia
afaaffjabmaakkkaafaaaaadaeaaafiaaaaappiaacaaoejaabaaaaacabaaaeia
bmaappkaaeaaaaaeabaaahiaabaamiiaaeaaoeiaadaaoeiaaeaaaaaeabaaahia
abaaoeiaafaappkaacaaoeiaaeaaaaaeabaaahiaaeaaaajaafaaoekaabaaoeia
aiaaaaadaaaaaiiabiaaoekaabaaoeiaacaaaaadaaaaaiiaaaaappiabiaappka
aeaaaaaeacaaahiaaaaappiabiaaoekbabaaoeiabcaaaaaeadaaahiabjaaaaka
abaaoeiaacaaoeiaaeaaaaaeaaaaahiaaaaaoeiabgaappkaadaaoeibceaaaaac
abaaahiaabaaoejaaiaaaaadacaaaboaabaaoeiaaaaaoeiaceaaaaacacaaahia
acaaoejaafaaaaadaeaaahiaabaamjiaacaanciaaeaaaaaeaeaaahiaacaamjia
abaanciaaeaaoeibafaaaaadaeaaahiaaeaaoeiaabaappjaaiaaaaadacaaacoa
aeaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeiaaaaaoeiaabaaaaacaaaaahia
aiaaoekaafaaaaadafaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaaliabcaakeka
aaaaaaiaafaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappkaadaaoeib
aiaaaaadadaaaboaabaaoeiaaaaaoeiaaiaaaaadadaaacoaaeaaoeiaaaaaoeia
aiaaaaadadaaaeoaacaaoeiaaaaaoeiaafaaaaadaaaaapiaadaaffiaapaaoeka
aeaaaaaeaaaaapiaaoaaoekaadaaaaiaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
adaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabbaaoekaafaaaaadabaaapia
aaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaapoaaeaaoekaaaaappia
abaaoeiaafaaaaadaaaaapiaadaaffiaalaaoekaaeaaaaaeaaaaapiaakaaoeka
adaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaadaakkiaaaaaoeiaacaaaaad
aaaaapiaaaaaoeiaanaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjabnaaeakabnaabfka
ppppaaaafdeieefciaakaaaaeaaaabaakaacaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaa
dgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaa
aeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaa
aaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdp
amaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaa
aaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaia
mbaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaa
igaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaa
aeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaa
diaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaah
fcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaa
aaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaa
afaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaa
abaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
aaaaaaaaegbcbaaaacaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaajgaebaaaacaaaaaacgajbaaa
adaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaaadaaaaaacgajbaaaacaaaaaa
egacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaaaeaaaaaa
pgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaa
abaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
aaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_Time]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_Scale]
Vector 21 [_Scale]
Vector 22 [_SquashPlaneNormal]
Float 23 [_SquashAmount]
Vector 24 [_Wind]
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[28] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..25],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MOV R2.w, c[0].x;
MUL R2.xyz, vertex.position, c[21];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[17].y;
MUL R0, R0.xxyy, c[26];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, c[24];
MUL R0.x, vertex.color.y, c[27].y;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.xz, R0.x, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[27].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[24].w, R2;
MAD R0.xyz, vertex.texcoord[1].x, c[24], R0;
DP3 R0.w, R0, c[22];
ADD R0.w, R0, c[22];
MUL R1.xyz, R0.w, c[22];
ADD R0.xyz, -R1, R0;
MAD R2.xyz, R1, c[23].x, R0;
DP4 R0.w, R2, c[8];
DP4 R0.z, R2, c[7];
DP4 R0.x, R2, c[5];
DP4 R0.y, R2, c[6];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
DP3 R0.y, vertex.attrib[14], vertex.attrib[14];
RSQ R0.y, R0.y;
DP3 R0.x, vertex.normal, vertex.normal;
RSQ R0.x, R0.x;
MUL R4.xyz, R0.y, vertex.attrib[14];
MUL R1.xyz, R0.x, vertex.normal;
MUL R3.xyz, R1.zxyw, R4.yzxw;
MAD R5.xyz, R1.yzxw, R4.zxyw, -R3;
MOV R0, c[19];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[20].w, -R2;
MUL R5.xyz, R5, vertex.attrib[14].w;
MOV R0.xyz, c[18];
MOV R0.w, c[0].x;
DP4 R6.z, R0, c[11];
DP4 R6.x, R0, c[9];
DP4 R6.y, R0, c[10];
MAD R0.xyz, R6, c[20].w, -R2;
DP4 result.position.w, R2, c[4];
DP4 result.position.z, R2, c[3];
DP4 result.position.y, R2, c[2];
DP4 result.position.x, R2, c[1];
DP3 result.texcoord[1].z, R1, R3;
DP3 result.texcoord[1].y, R3, R5;
DP3 result.texcoord[1].x, R3, R4;
DP3 result.texcoord[2].z, R1, R0;
DP3 result.texcoord[2].y, R5, R0;
DP3 result.texcoord[2].x, R4, R0;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MOV result.color.w, vertex.color;
END
# 72 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_Time]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_Scale]
Vector 21 [_SquashPlaneNormal]
Float 22 [_SquashAmount]
Vector 23 [_Wind]
Vector 24 [_MainTex_ST]
"vs_2_0
def c25, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c26, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c27, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c25.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r2.w, c25.x
mul r2.xyz, v0, c20
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c16.y
mul r0, r0.xxyy, c26
frc r0, r0
mad r0, r0, c25.y, c25.z
frc r0, r0
mad r0, r0, c25.y, c25.w
abs r0, r0
mad r1, -r0, c27.x, c27.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r1.xyz, r3.y, c23
mul r0.x, v5.y, c27.w
mul r1.xyz, v4.y, r1
mul r0.xz, r0.x, v2
mul r0.y, v4, c27.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c23.w, r2
mad r0.xyz, v4.x, c23, r0
dp3 r0.w, r0, c21
add r0.w, r0, c21
mul r1.xyz, r0.w, c21
add r0.xyz, -r1, r0
mad r2.xyz, r1, c22.x, r0
dp4 r0.w, r2, c7
dp4 r0.z, r2, c6
dp4 r0.x, r2, c4
dp4 r0.y, r2, c5
dp4 oT3.z, r0, c14
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
dp3 r0.y, v1, v1
rsq r0.y, r0.y
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r4.xyz, r0.y, v1
mul r3.xyz, r0.x, v2
mul r1.xyz, r3.zxyw, r4.yzxw
mad r5.xyz, r3.yzxw, r4.zxyw, -r1
mov r0, c10
dp4 r6.z, c18, r0
mov r0, c9
dp4 r6.y, c18, r0
mov r1, c8
dp4 r6.x, c18, r1
mad r1.xyz, r6, c19.w, -r2
mul r5.xyz, r5, v1.w
mov r0.xyz, c17
mov r0.w, c25.x
dp4 r6.z, r0, c10
dp4 r6.x, r0, c8
dp4 r6.y, r0, c9
mad r0.xyz, r6, c19.w, -r2
dp4 oPos.w, r2, c3
dp4 oPos.z, r2, c2
dp4 oPos.y, r2, c1
dp4 oPos.x, r2, c0
dp3 oT1.z, r3, r1
dp3 oT1.y, r1, r5
dp3 oT1.x, r1, r4
dp3 oT2.z, r3, r0
dp3 oT2.y, r5, r0
dp3 oT2.x, r4, r0
mov oD0.xyz, c25.x
mad oT0.xy, v3, c24, c24.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedhichegnhjidphemnhjikmejdamkhlmdlabaaaaaadiamaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefciaakaaaaeaaaabaakaacaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
acaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaaba
pcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaaaaaaaaaegbcbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaa
egbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaaaaaaaaaegbcbaaaacaaaaaabaaaaaaheccabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaa
jgaebaaaacaaaaaacgajbaaaadaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaa
adaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaa
aeaaaaaaegacbaaaaeaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaaeaaaaaaegacbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaa
aeaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaa
egacbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
aeaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedfldincpejnbnohchheihagnndcbeodglabaaaaaadabcaaaaaeaaaaaa
daaaaaaaceagaaaakmbaaaaahebbaaaaebgpgodjomafaaaaomafaaaaaaacpopp
fiafaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaadaa
afaaabaaaaaaaaaaaaaaalaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaa
abaaaeaaabaaaiaaaaaaaaaaacaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaa
aaaaaaaaadaaamaaajaaaoaaaaaaaaaaaeaaafaaabaabhaaaaaaaaaaaeaaakaa
acaabiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbkaaapkamnmmpmdpamaceldp
aaaamadomlkbefdofbaaaaafblaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialp
fbaaaaafbmaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafbnaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaagaaoekaagaaookaabaaaaacaaaaapiaajaaoekaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeabaaahiabcaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaappia
aaaaoeiaabaaaaacabaaabiaaoaappkaabaaaaacabaaaciaapaappkaabaaaaac
abaaaeiabaaappkaaiaaaaadaaaaaiiaabaaoeiablaaaakaacaaaaadabaaacia
aaaappiaafaaaajaacaaaaadaaaaaiiaabaaffiaafaaffjaafaaaaadacaaahia
aaaaoejabhaaoekaaiaaaaadabaaabiaacaaoeiaaaaappiaacaaaaadabaaapia
abaafaiaahaaffkaafaaaaadabaaapiaabaaoeiabkaaoekabdaaaaacabaaapia
abaaoeiaaeaaaaaeabaaapiaabaaoeiablaaffkablaakkkabdaaaaacabaaapia
abaaoeiaaeaaaaaeabaaapiaabaaoeiablaaffkablaappkacdaaaaacabaaapia
abaaoeiaafaaaaadadaaapiaabaaoeiaabaaoeiaaeaaaaaeabaaapiaabaaoeia
bmaaaakbbmaaffkaafaaaaadabaaapiaabaaoeiaadaaoeiaacaaaaadabaaadia
abaaoniaabaaoiiaafaaaaadadaaahiaabaaffiaafaaoekaafaaaaadadaaahia
adaaoeiaaeaaffjaafaaaaadaeaaaciaabaaffiaaeaaffjaafaaaaadaaaaaiia
afaaffjabmaakkkaafaaaaadaeaaafiaaaaappiaacaaoejaabaaaaacabaaaeia
bmaappkaaeaaaaaeabaaahiaabaamiiaaeaaoeiaadaaoeiaaeaaaaaeabaaahia
abaaoeiaafaappkaacaaoeiaaeaaaaaeabaaahiaaeaaaajaafaaoekaabaaoeia
aiaaaaadaaaaaiiabiaaoekaabaaoeiaacaaaaadaaaaaiiaaaaappiabiaappka
aeaaaaaeacaaahiaaaaappiabiaaoekbabaaoeiabcaaaaaeadaaahiabjaaaaka
abaaoeiaacaaoeiaaeaaaaaeaaaaahiaaaaaoeiabgaappkaadaaoeibceaaaaac
abaaahiaabaaoejaaiaaaaadacaaaboaabaaoeiaaaaaoeiaceaaaaacacaaahia
acaaoejaafaaaaadaeaaahiaabaamjiaacaanciaaeaaaaaeaeaaahiaacaamjia
abaanciaaeaaoeibafaaaaadaeaaahiaaeaaoeiaabaappjaaiaaaaadacaaacoa
aeaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeiaaaaaoeiaabaaaaacaaaaahia
aiaaoekaafaaaaadafaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaaliabcaakeka
aaaaaaiaafaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappkaadaaoeib
aiaaaaadadaaaboaabaaoeiaaaaaoeiaaiaaaaadadaaacoaaeaaoeiaaaaaoeia
aiaaaaadadaaaeoaacaaoeiaaaaaoeiaafaaaaadaaaaapiaadaaffiaapaaoeka
aeaaaaaeaaaaapiaaoaaoekaadaaaaiaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
adaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiabbaaoekaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaadaaffiaalaaoekaaeaaaaaeaaaaapiaakaaoeka
adaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaadaakkiaaaaaoeiaacaaaaad
aaaaapiaaaaaoeiaanaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoaafaappjabnaaeakabnaabfka
ppppaaaafdeieefciaakaaaaeaaaabaakaacaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacafaaaaaa
dgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaa
aeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaa
aaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdp
amaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaa
aaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaia
mbaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaa
igaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaa
aeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaa
diaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaah
fcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaa
aaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaa
afaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaa
abaaaaaabaaaaaahbccabaaaadaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
aaaaaaaaegbcbaaaacaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaajgaebaaaacaaaaaacgajbaaa
adaaaaaadcaaaaakhcaabaaaaeaaaaaajgaebaaaadaaaaaacgajbaaaacaaaaaa
egacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaaaeaaaaaa
pgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaa
abaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
aaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_Time]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_Scale]
Vector 21 [_Scale]
Vector 22 [_SquashPlaneNormal]
Float 23 [_SquashAmount]
Vector 24 [_Wind]
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[28] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..25],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MUL R2.xyz, vertex.position, c[21];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[17].y;
MUL R0, R0.xxyy, c[26];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, c[24];
MUL R0.x, vertex.color.y, c[27].y;
MOV R1.w, c[0].x;
MUL R1.xyz, vertex.texcoord[1].y, R1;
MUL R0.xz, R0.x, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[27].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[24].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[24], R0;
DP3 R0.x, R1, c[22];
ADD R0.x, R0, c[22].w;
MUL R0.xyz, R0.x, c[22];
ADD R1.xyz, -R0, R1;
MAD R1.xyz, R0, c[23].x, R1;
DP4 R0.w, R1, c[8];
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
DP3 R0.y, vertex.attrib[14], vertex.attrib[14];
RSQ R0.y, R0.y;
DP3 R0.x, vertex.normal, vertex.normal;
RSQ R0.x, R0.x;
MUL R3.xyz, R0.y, vertex.attrib[14];
MUL R2.xyz, R0.x, vertex.normal;
MUL R0.xyz, R2.zxyw, R3.yzxw;
MAD R4.xyz, R2.yzxw, R3.zxyw, -R0;
MOV R0.xyz, c[18];
MOV R0.w, c[0].x;
MUL R4.xyz, R4, vertex.attrib[14].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 R5.z, R0, c[11];
DP4 R5.x, R0, c[9];
DP4 R5.y, R0, c[10];
MAD R0.xyz, R5, c[20].w, -R1;
DP3 result.texcoord[2].z, R2, R0;
DP3 result.texcoord[2].y, R4, R0;
MOV R1, c[19];
DP3 result.texcoord[2].x, R3, R0;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
DP3 result.texcoord[1].y, R0, R4;
DP3 result.texcoord[1].z, R2, R0;
DP3 result.texcoord[1].x, R0, R3;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MOV result.color.w, vertex.color;
END
# 70 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_Time]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_Scale]
Vector 21 [_SquashPlaneNormal]
Float 22 [_SquashAmount]
Vector 23 [_Wind]
Vector 24 [_MainTex_ST]
"vs_2_0
def c25, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c26, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c27, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c25.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r4.w, c25.x
mul r2.xyz, v0, c20
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c16.y
mul r0, r0.xxyy, c26
frc r0, r0
mad r0, r0, c25.y, c25.z
frc r0, r0
mad r0, r0, c25.y, c25.w
abs r0, r0
mad r1, -r0, c27.x, c27.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r1.xyz, r3.y, c23
mul r0.x, v5.y, c27.w
mov r1.w, c25.x
mul r1.xyz, v4.y, r1
mul r0.xz, r0.x, v2
mul r0.y, v4, c27.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c23.w, r2
mad r1.xyz, v4.x, c23, r0
dp3 r0.x, r1, c21
add r0.x, r0, c21.w
mul r0.xyz, r0.x, c21
add r1.xyz, -r0, r1
mad r4.xyz, r0, c22.x, r1
mov r1.xyz, c17
dp4 r0.w, r4, c7
dp4 r0.z, r4, c6
dp4 r0.x, r4, c4
dp4 r0.y, r4, c5
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
dp3 r0.y, v1, v1
rsq r0.y, r0.y
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r3.xyz, r0.y, v1
mul r2.xyz, r0.x, v2
mul r0.xyz, r2.zxyw, r3.yzxw
dp4 r5.z, r1, c10
dp4 r5.x, r1, c8
dp4 r5.y, r1, c9
mad r1.xyz, r5, c19.w, -r4
mad r0.xyz, r2.yzxw, r3.zxyw, -r0
dp4 oPos.w, r4, c3
dp4 oPos.z, r4, c2
dp4 oPos.y, r4, c1
dp4 oPos.x, r4, c0
mul r4.xyz, r0, v1.w
mov r0, c10
dp4 r5.z, c18, r0
mov r0, c9
dp4 r5.y, c18, r0
dp3 oT2.z, r2, r1
dp3 oT2.y, r4, r1
dp3 oT2.x, r3, r1
mov r1, c8
dp4 r5.x, c18, r1
dp3 oT1.y, r5, r4
dp3 oT1.z, r2, r5
dp3 oT1.x, r5, r3
mov oD0.xyz, c25.x
mad oT0.xy, v3, c24, c24.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedmbgmdpmelffpakenklgcnbdbpnaljfppabaaaaaaamamaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcfeakaaaaeaaaabaajfacaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
acaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaaba
pcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaapaaaaaa
diaaaaaidcaabaaaacaaaaaafgafbaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaabaaaaaa
egaabaaaacaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaa
kgakbaaaabaaaaaaegaabaaaabaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaa
aaaaaaaaagaaaaaapgapbaaaabaaaaaaagaebaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaa
alaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaa
acaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaaaaaaaaaegbcbaaaabaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaa
abaaaaaajgaebaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaabaaaaaa
cgajbaaaacaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaa
egacbaaaadaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaeaaaaaapgipcaaa
adaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Wind]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecednpjnfanjgdlecdkdngiafoiojkbkbcjfabaaaaaapabbaaaaaeaaaaaa
daaaaaaabaagaaaagmbaaaaadebbaaaaebgpgodjniafaaaaniafaaaaaaacpopp
eeafaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaadaa
afaaabaaaaaaaaaaaaaaalaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaa
abaaaeaaabaaaiaaaaaaaaaaacaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaa
aaaaaaaaadaaamaaajaaaoaaaaaaaaaaaeaaafaaabaabhaaaaaaaaaaaeaaakaa
acaabiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbkaaapkamnmmpmdpamaceldp
aaaamadomlkbefdofbaaaaafblaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialp
fbaaaaafbmaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdofbaaaaafbnaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaagaaoekaagaaookaabaaaaacaaaaapiaajaaoekaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeabaaahiabcaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaappia
aaaaoeiaceaaaaacabaaahiaabaaoejaaiaaaaadacaaaboaabaaoeiaaaaaoeia
ceaaaaacacaaahiaacaaoejaafaaaaadadaaahiaabaamjiaacaanciaaeaaaaae
adaaahiaacaamjiaabaanciaadaaoeibafaaaaadadaaahiaadaaoeiaabaappja
aiaaaaadacaaacoaadaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeiaaaaaoeia
abaaaaacaaaaahiaaiaaoekaafaaaaadaeaaahiaaaaaffiabdaaoekaaeaaaaae
aaaaaliabcaakekaaaaaaaiaaeaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkia
aaaapeiaacaaaaadaaaaahiaaaaaoeiabfaaoekaabaaaaacaeaaabiaaoaappka
abaaaaacaeaaaciaapaappkaabaaaaacaeaaaeiabaaappkaaiaaaaadaaaaaiia
aeaaoeiablaaaakaacaaaaadaeaaaciaaaaappiaafaaaajaacaaaaadaaaaaiia
aeaaffiaafaaffjaafaaaaadafaaahiaaaaaoejabhaaoekaaiaaaaadaeaaabia
afaaoeiaaaaappiaacaaaaadaeaaapiaaeaafaiaahaaffkaafaaaaadaeaaapia
aeaaoeiabkaaoekabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeia
blaaffkablaakkkabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeia
blaaffkablaappkacdaaaaacaeaaapiaaeaaoeiaafaaaaadagaaapiaaeaaoeia
aeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabmaaaakbbmaaffkaafaaaaadaeaaapia
aeaaoeiaagaaoeiaacaaaaadaeaaadiaaeaaoniaaeaaoiiaafaaaaadagaaahia
aeaaffiaafaaoekaafaaaaadagaaahiaagaaoeiaaeaaffjaafaaaaadahaaacia
aeaaffiaaeaaffjaafaaaaadaaaaaiiaafaaffjabmaakkkaafaaaaadahaaafia
aaaappiaacaaoejaabaaaaacaeaaaeiabmaappkaaeaaaaaeaeaaahiaaeaamiia
ahaaoeiaagaaoeiaaeaaaaaeaeaaahiaaeaaoeiaafaappkaafaaoeiaaeaaaaae
aeaaahiaaeaaaajaafaaoekaaeaaoeiaaiaaaaadaaaaaiiabiaaoekaaeaaoeia
acaaaaadaaaaaiiaaaaappiabiaappkaaeaaaaaeafaaahiaaaaappiabiaaoekb
aeaaoeiabcaaaaaeagaaahiabjaaaakaaeaaoeiaafaaoeiaaeaaaaaeaaaaahia
aaaaoeiabgaappkaagaaoeibaiaaaaadadaaaboaabaaoeiaaaaaoeiaaiaaaaad
adaaacoaadaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoeiaaaaaoeiaafaaaaad
aaaaapiaagaaffiaapaaoekaaeaaaaaeaaaaapiaaoaaoekaagaaaaiaaaaaoeia
aeaaaaaeaaaaapiabaaaoekaagaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeia
bbaaoekaafaaaaadabaaadiaaaaaffiaacaaobkaaeaaaaaeaaaaadiaabaaobka
aaaaaaiaabaaoeiaaeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeiaaeaaaaae
aaaaamoaaeaabekaaaaappiaaaaaeeiaafaaaaadaaaaapiaagaaffiaalaaoeka
aeaaaaaeaaaaapiaakaaoekaagaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoeka
agaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiaanaaoekaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaaeaaaaaeabaaapoa
afaappjabnaaeakabnaabfkappppaaaafdeieefcfeakaaaaeaaaabaajfacaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
acaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaaba
pcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaapaaaaaa
diaaaaaidcaabaaaacaaaaaafgafbaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaabaaaaaa
egaabaaaacaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaa
kgakbaaaabaaaaaaegaabaaaabaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaa
aaaaaaaaagaaaaaapgapbaaaabaaaaaaagaebaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaa
alaaaaaadgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaadgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaa
acaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaaaaaaaaaegbcbaaaabaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaa
abaaaaaajgaebaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaabaaaaaa
cgajbaaaacaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaa
egacbaaaadaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbccabaaaadaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaabaaaaaaheccabaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaadiaaaaajhcaabaaaaeaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaeaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaal
hcaabaaaaeaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaeaaaaaaaaaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaeaaaaaapgipcaaa
adaaaaaabeaaaaaaegacbaiaebaaaaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 0, 2, 1, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2.yw, fragment.texcoord[0], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[0], texture[1], 2D;
MAD R2.xy, R2.wyzw, c[4].y, -c[4].z;
MUL R2.zw, R2.xyxy, R2.xyxy;
ADD_SAT R2.w, R2.z, R2;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
DP3 R1.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.x, R1.x;
DP3 R3.x, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R0, c[2];
MUL R0.xyz, R0, fragment.color.primary.w;
MUL R1.xyz, R1.x, fragment.texcoord[1];
RSQ R3.x, R3.x;
MAD R3.xyz, R3.x, fragment.texcoord[2], R1;
DP3 R2.z, R3, R3;
ADD R3.w, -R2, c[4].z;
RSQ R2.w, R2.z;
MUL R3.xyz, R2.w, R3;
RSQ R2.z, R3.w;
RCP R2.z, R2.z;
DP3 R3.x, R2, R3;
DP3 R1.x, R2, R1;
MAX R2.x, R1, c[4];
MOV R2.w, c[4];
MOV R1.xyz, c[1];
MUL R0.xyz, R0, c[0];
MUL R2.w, R2, c[3].x;
MAX R3.x, R3, c[4];
POW R2.w, R3.x, R2.w;
MUL R1.w, R2, R1;
MUL R0.xyz, R0, R2.x;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R1.w, R0;
MOV result.color.w, c[4].x;
TEX R0.w, R0.w, texture[3], 2D;
MUL R0.w, R0, c[4].y;
MUL result.color.xyz, R0, R0.w;
END
# 38 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c4, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c5, 128.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r1, t0, s2
texld r2, t0, s0
dp3_pp r1.x, t1, t1
rsq_pp r3.x, r1.x
dp3 r0.x, t3, t3
mov r0.xy, r0.x
dp3_pp r1.x, t2, t2
mul_pp r3.xyz, r3.x, t1
rsq_pp r1.x, r1.x
mad_pp r5.xyz, r1.x, t2, r3
dp3_pp r1.x, r5, r5
rsq_pp r1.x, r1.x
texld r6, r0, s3
texld r0, t0, s1
mov r0.y, r1
mov r0.x, r1.w
mad_pp r4.xy, r0, c4.x, c4.y
mul_pp r0.xy, r4, r4
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c4.z
rsq_pp r0.x, r0.x
rcp_pp r4.z, r0.x
mul_pp r1.xyz, r1.x, r5
dp3_pp r1.x, r4, r1
mov_pp r0.x, c3
mul_pp r0.x, c5, r0
max_pp r1.x, r1, c4.w
pow r5.x, r1.x, r0.x
mul_pp r1.xyz, r2, c2
dp3_pp r2.x, r4, r3
mul_pp r3.xyz, r1, v0.w
max_pp r1.x, r2, c4.w
mul_pp r2.xyz, r3, c0
mul_pp r3.xyz, r2, r1.x
mov r0.x, r5.x
mul r0.x, r0, r0.w
mov_pp r2.xyz, c0
mul_pp r2.xyz, c1, r2
mul_pp r1.x, r6, c4
mad r0.xyz, r2, r0.x, r3
mul r0.xyz, r0, r1.x
mov_pp r0.w, c4
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_GlossMap] 2D 3
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfggocicohkaidnlfeepdcmkglcclbafgabaaaaaacmagaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
aiafaaaaeaaaaaaaecabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegbcbaaaaeaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialp
aaaaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaegaabaaaacaaaaaaegaabaaa
acaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadp
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
elaaaaafecaabaaaacaaaaaaakaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaajgahbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaa
abeaaaaaaaaaaaeddiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaa
aaaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaah
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaapgapbaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_GlossMap] 2D 3
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfnelkoemghlgninomlegdndpghdjinciabaaaaaagaajaaaaaeaaaaaa
daaaaaaagaadaaaahaaiaaaacmajaaaaebgpgodjciadaaaaciadaaaaaaacpppp
naacaaaafiaaaaaaadaadeaaaaaafiaaaaaafiaaaeaaceaaaaaafiaaadaaaaaa
aaababaaacacacaaabadadaaaaaaabaaacaaaaaaaaaaaaaaaaaaaiaaabaaacaa
aaaaaaaaaaaaakaaabaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaaaaea
aaaaialpaaaaaaaaaaaaiadpfbaaaaafafaaapkaaaaaaaedaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaahla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaaja
acaiapkabpaaaaacaaaaaajaadaiapkaaiaaaaadaaaaaiiaaeaaoelaaeaaoela
abaaaaacaaaaadiaaaaappiaecaaaaadabaacpiaaaaaoelaacaioekaecaaaaad
acaacpiaaaaaoelaadaioekaecaaaaadadaacpiaaaaaoelaabaioekaecaaaaad
aaaacpiaaaaaoeiaaaaioekaaiaaaaadadaaciiaadaaoelaadaaoelaahaaaaac
adaaciiaadaappiaceaaaaacacaachiaacaaoelaaeaaaaaeaeaachiaadaaoela
adaappiaacaaoeiaceaaaaacafaachiaaeaaoeiaaeaaaaaeaeaacbiaabaappia
aeaaaakaaeaaffkaaeaaaaaeaeaacciaabaaffiaaeaaaakaaeaaffkafkaaaaae
adaadiiaaeaaoeiaaeaaoeiaaeaakkkaacaaaaadadaaciiaadaappibaeaappka
ahaaaaacadaaciiaadaappiaagaaaaacaeaaceiaadaappiaaiaaaaadadaaciia
aeaaoeiaafaaoeiaaiaaaaadaaaacciaaeaaoeiaacaaoeiaalaaaaadabaacbia
aaaaffiaaeaakkkaalaaaaadaaaaaciaadaappiaaeaakkkaabaaaaacadaaaiia
adaaffkaafaaaaadadaaaiiaadaappiaafaaaakacaaaaaadabaaaciaaaaaffia
adaappiaafaaaaadadaaaiiaacaappiaabaaffiaabaaaaacacaaahiaaaaaoeka
afaaaaadaaaaaoiaacaabliaabaablkaafaaaaadaaaaaoiaadaappiaaaaaoeia
afaaaaadabaacoiaadaabliaacaablkaafaaaaadabaacoiaabaaoeiaabaappla
afaaaaadabaacoiaabaaoeiaaaaablkaaeaaaaaeaaaaaoiaabaaoeiaabaaaaia
aaaaoeiaacaaaaadaaaaabiaaaaaaaiaaaaaaaiaafaaaaadaaaachiaaaaaaaia
aaaabliaabaaaaacaaaaaiiaaeaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcaiafaaaaeaaaaaaaecabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegbcbaaaaeaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaegaabaaaacaaaaaa
egaabaaaacaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaacaaaaaaakaabaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaacaaaaaajgahbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaaaeddiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaa
diaaaaahncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 0, 2, 1, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.yw, fragment.texcoord[0], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.w, fragment.texcoord[0], texture[1], 2D;
MAD R1.xy, R1.wyzw, c[4].y, -c[4].z;
MUL R1.zw, R1.xyxy, R1.xyxy;
ADD_SAT R1.z, R1, R1.w;
DP3 R2.w, fragment.texcoord[2], fragment.texcoord[2];
ADD R1.z, -R1, c[4];
RSQ R1.z, R1.z;
MUL R0.xyz, R0, c[2];
MUL R0.xyz, R0, fragment.color.primary.w;
RCP R1.z, R1.z;
MOV R2.xyz, fragment.texcoord[1];
RSQ R2.w, R2.w;
MAD R2.xyz, R2.w, fragment.texcoord[2], R2;
DP3 R1.w, R2, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R2;
DP3 R2.x, R1, R2;
DP3 R1.x, R1, fragment.texcoord[1];
MOV R1.w, c[4];
MUL R2.y, R1.w, c[3].x;
MAX R1.w, R2.x, c[4].x;
POW R1.w, R1.w, R2.y;
MAX R1.x, R1, c[4];
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.x;
MOV R2.xyz, c[1];
MUL R0.w, R1, R0;
MUL R1.xyz, R2, c[0];
MAD R0.xyz, R1, R0.w, R0;
MUL result.color.xyz, R0, c[4].y;
MOV result.color.w, c[4].x;
END
# 33 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c5, 128.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
texld r1, t0, s2
texld r2, t0, s0
texld r0, t0, s1
dp3_pp r1.x, t2, t2
mul_pp r2.xyz, r2, c2
mov r0.y, r1
mov r0.x, r1.w
mad_pp r3.xy, r0, c4.x, c4.y
mul_pp r0.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c4.z
rsq_pp r0.x, r0.x
rcp_pp r3.z, r0.x
mov_pp r0.x, c3
rsq_pp r1.x, r1.x
mov_pp r4.xyz, t1
mad_pp r4.xyz, r1.x, t2, r4
dp3_pp r1.x, r4, r4
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r4
dp3_pp r1.x, r3, r1
mul_pp r0.x, c5, r0
max_pp r1.x, r1, c4.w
pow r4.x, r1.x, r0.x
dp3_pp r1.x, r3, t1
mul_pp r2.xyz, r2, v0.w
mul_pp r3.xyz, r2, c0
mov r0.x, r4.x
mul r0.x, r0, r0.w
max_pp r1.x, r1, c4.w
mov_pp r2.xyz, c0
mul_pp r1.xyz, r3, r1.x
mul_pp r2.xyz, c1, r2
mad r0.xyz, r2, r0.x, r1
mul r0.xyz, r0, c4.x
mov_pp r0.w, c4
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 2
SetTexture 2 [_BumpMap] 2D 1
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 64 [_Color]
Float 100 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlgoabcjjjppkfjgpbflebmngpnadjeebabaaaaaaeeafaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcdiaeaaaaeaaaaaaaaoabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaa
agaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaa
dcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaa
dkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaadaaaaaa
deaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
ecaabaaaaaaaaaaabkiacaaaaaaaaaaaagaaaaaaabeaaaaaaaaaaaeddiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadkaabaaaabaaaaaadiaaaaajhcaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahncaabaaaaaaaaaaaagaabaaa
aaaaaaaaagajbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaa
fgafbaaaaaaaaaaaigadbaaaaaaaaaaaaaaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 2
SetTexture 2 [_BumpMap] 2D 1
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 64 [_Color]
Float 100 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkffcbfdfciiepenilkefbnggeneliejeabaaaaaacaaiaaaaaeaaaaaa
daaaaaaaaiadaaaaeiahaaaaomahaaaaebgpgodjnaacaaaanaacaaaaaaacpppp
hmacaaaafeaaaaaaadaadaaaaaaafeaaaaaafeaaadaaceaaaaaafeaaaaaaaaaa
acababaaabacacaaaaaaabaaacaaaaaaaaaaaaaaaaaaaeaaabaaacaaaaaaaaaa
aaaaagaaabaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaaaaeaaaaaialp
aaaaaaaaaaaaiadpfbaaaaafafaaapkaaaaaaaedaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaacpiaaaaaoela
abaioekaecaaaaadabaacpiaaaaaoelaacaioekaecaaaaadacaacpiaaaaaoela
aaaioekaaiaaaaadacaaciiaadaaoelaadaaoelaahaaaaacacaaciiaacaappia
abaaaaacabaaahiaadaaoelaaeaaaaaeabaachiaabaaoeiaacaappiaacaaoela
ceaaaaacadaachiaabaaoeiaaeaaaaaeabaacbiaaaaappiaaeaaaakaaeaaffka
aeaaaaaeabaacciaaaaaffiaaeaaaakaaeaaffkafkaaaaaeacaadiiaabaaoeia
abaaoeiaaeaakkkaacaaaaadacaaciiaacaappibaeaappkaahaaaaacacaaciia
acaappiaagaaaaacabaaceiaacaappiaaiaaaaadacaaciiaabaaoeiaadaaoeia
aiaaaaadaaaacbiaabaaoeiaacaaoelaalaaaaadabaacbiaaaaaaaiaaeaakkka
alaaaaadaaaaabiaacaappiaaeaakkkaabaaaaacacaaaiiaadaaffkaafaaaaad
acaaaiiaacaappiaafaaaakacaaaaaadabaaaciaaaaaaaiaacaappiaafaaaaad
acaaaiiaabaappiaabaaffiaabaaaaacaaaaahiaaaaaoekaafaaaaadaaaaahia
aaaaoeiaabaaoekaafaaaaadaaaaahiaacaappiaaaaaoeiaafaaaaadabaacoia
acaabliaacaablkaafaaaaadabaacoiaabaaoeiaabaapplaafaaaaadabaacoia
abaaoeiaaaaablkaaeaaaaaeaaaaahiaabaabliaabaaaaiaaaaaoeiaacaaaaad
aaaachiaaaaaoeiaaaaaoeiaabaaaaacaaaaaiiaaeaakkkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcdiaeaaaaeaaaaaaaaoabaaaafjaaaaaeegiocaaa
aaaaaaaaahaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaa
aeaaaaaaagaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
abaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
abaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaa
adaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaaagaaaaaaabeaaaaaaaaaaaed
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajhcaabaaaabaaaaaaegiccaaa
aaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahncaabaaaaaaaaaaa
agaabaaaaaaaaaaaagajbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
abaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaaaaaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
SetTexture 4 [_LightTextureB0] 2D 4
"!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 2, 1, 128 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R3.yw, fragment.texcoord[0], texture[2], 2D;
TEX R2.w, fragment.texcoord[0], texture[1], 2D;
MAD R3.xy, R3.wyzw, c[4].y, -c[4].z;
RCP R0.x, fragment.texcoord[3].w;
MAD R1.xy, fragment.texcoord[3], R0.x, c[5].x;
DP3 R1.z, fragment.texcoord[3], fragment.texcoord[3];
MUL R3.zw, R3.xyxy, R3.xyxy;
ADD_SAT R3.z, R3, R3.w;
DP3 R2.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R3.z, -R3, c[4];
RSQ R3.z, R3.z;
RCP R3.z, R3.z;
RSQ R2.x, R2.x;
MOV result.color.w, c[4].x;
TEX R0.w, R1, texture[3], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, R1.z, texture[4], 2D;
DP3 R1.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[1];
MAD R2.xyz, R2.x, fragment.texcoord[2], R1;
DP3 R1.x, R3, R1;
DP3 R3.w, R2, R2;
RSQ R3.w, R3.w;
MUL R2.xyz, R3.w, R2;
DP3 R2.x, R3, R2;
MOV R3.w, c[4];
MUL R0.xyz, R0, c[2];
MUL R0.xyz, R0, fragment.color.primary.w;
MUL R2.y, R3.w, c[3].x;
MAX R2.x, R2, c[4];
POW R2.x, R2.x, R2.y;
SLT R2.y, c[4].x, fragment.texcoord[3].z;
MUL R0.w, R2.y, R0;
MUL R0.w, R0, R1;
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[4];
MUL R1.xyz, R0, R1.x;
MOV R0.xyz, c[1];
MUL R2.x, R2, R2.w;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, c[4].y;
MAD R0.xyz, R0, R2.x, R1;
MUL result.color.xyz, R0, R0.w;
END
# 44 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
SetTexture 4 [_LightTextureB0] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c4, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c5, 128.00000000, 0.50000000, 0, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r3, t0, s2
texld r2, t0, s0
rcp r1.x, t3.w
dp3 r0.x, t3, t3
mov r0.xy, r0.x
mad r1.xy, t3, r1.x, c5.y
texld r6, r0, s4
texld r0, t0, s1
texld r1, r1, s3
dp3_pp r1.x, t1, t1
rsq_pp r3.x, r1.x
mov r0.y, r3
mov r0.x, r3.w
mad_pp r4.xy, r0, c4.x, c4.y
mul_pp r0.xy, r4, r4
add_pp_sat r0.x, r0, r0.y
dp3_pp r1.x, t2, t2
add_pp r0.x, -r0, c4.z
rsq_pp r0.x, r0.x
rcp_pp r4.z, r0.x
mov_pp r0.x, c3
mul_pp r3.xyz, r3.x, t1
rsq_pp r1.x, r1.x
mad_pp r5.xyz, r1.x, t2, r3
dp3_pp r1.x, r5, r5
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r5
dp3_pp r1.x, r4, r1
mul_pp r0.x, c5, r0
max_pp r1.x, r1, c4.w
pow r5.x, r1.x, r0.x
mul_pp r1.xyz, r2, c2
dp3_pp r2.x, r4, r3
mul_pp r3.xyz, r1, v0.w
max_pp r1.x, r2, c4.w
mul_pp r2.xyz, r3, c0
mov r0.x, r5.x
mul r0.x, r0, r0.w
mov_pp r3.xyz, c0
mul_pp r2.xyz, r2, r1.x
cmp r1.x, -t3.z, c4.w, c4.z
mul_pp r3.xyz, c1, r3
mul_pp r1.x, r1, r1.w
mul_pp r1.x, r1, r6
mul_pp r1.x, r1, c4
mad r0.xyz, r3, r0.x, r2
mul r0.xyz, r0, r1.x
mov_pp r0.w, c4
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_GlossMap] 2D 4
SetTexture 2 [_BumpMap] 2D 3
SetTexture 3 [_LightTexture0] 2D 0
SetTexture 4 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhibldmhngkojkakpachlaocgpmaokadeabaaaaaaaeahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
oaafaaaaeaaaaaaahiabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egbcbaaaaeaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaadaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaaegaabaaaacaaaaaaegaabaaaacaaaaaa
ddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaacaaaaaaakaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
jgahbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaaaeddiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaa
bjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
egiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahncaabaaa
aaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaaabaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaa
dbaaaaahicaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaa
abaaaaaaeghobaaaaeaaaaaaaagabaaaabaaaaaaapaaaaahicaabaaaaaaaaaaa
pgapbaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_GlossMap] 2D 4
SetTexture 2 [_BumpMap] 2D 3
SetTexture 3 [_LightTexture0] 2D 0
SetTexture 4 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedbnmhbcjheemcclkjlcgkdgnpfhcalfgnabaaaaaajmakaaaaaeaaaaaa
daaaaaaameadaaaakmajaaaagiakaaaaebgpgodjimadaaaaimadaaaaaaacpppp
daadaaaafmaaaaaaadaadiaaaaaafmaaaaaafmaaafaaceaaaaaafmaaadaaaaaa
aeababaaaaacacaaacadadaaabaeaeaaaaaaabaaacaaaaaaaaaaaaaaaaaaaiaa
abaaacaaaaaaaaaaaaaaakaaabaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafafaaapkaaaaaaadpaaaaaaed
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacpla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaia
aeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaajaaeaiapka
agaaaaacaaaaaiiaaeaapplaaeaaaaaeaaaaadiaaeaaoelaaaaappiaafaaaaka
aiaaaaadabaaaiiaaeaaoelaaeaaoelaabaaaaacabaaadiaabaappiaecaaaaad
acaacpiaaaaaoelaadaioekaecaaaaadadaacpiaaaaaoelaaeaioekaecaaaaad
aeaacpiaaaaaoelaacaioekaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaabaaoeiaabaioekaaiaaaaadaeaaciiaadaaoelaadaaoelaahaaaaac
aeaaciiaaeaappiaceaaaaacaaaachiaacaaoelaaeaaaaaeadaachiaadaaoela
aeaappiaaaaaoeiaceaaaaacafaachiaadaaoeiaaeaaaaaeadaacbiaacaappia
aeaaaakaaeaaffkaaeaaaaaeadaacciaacaaffiaaeaaaakaaeaaffkafkaaaaae
aeaadiiaadaaoeiaadaaoeiaaeaakkkaacaaaaadaeaaciiaaeaappibaeaappka
ahaaaaacaeaaciiaaeaappiaagaaaaacadaaceiaaeaappiaaiaaaaadaeaaciia
adaaoeiaafaaoeiaaiaaaaadaaaacbiaadaaoeiaaaaaoeiaalaaaaadabaaccia
aaaaaaiaaeaakkkaalaaaaadaaaaabiaaeaappiaaeaakkkaabaaaaacaeaaaiia
afaaffkaafaaaaadaeaaaiiaaeaappiaadaaffkacaaaaaadabaaaeiaaaaaaaia
aeaappiaafaaaaadaeaaaiiaadaappiaabaakkiaabaaaaacaaaaahiaaaaaoeka
afaaaaadaaaaahiaaaaaoeiaabaaoekaafaaaaadaaaaahiaaeaappiaaaaaoeia
afaaaaadacaachiaaeaaoeiaacaaoekaafaaaaadacaachiaacaaoeiaabaappla
afaaaaadacaachiaacaaoeiaaaaaoekaaeaaaaaeaaaaahiaacaaoeiaabaaffia
aaaaoeiaafaaaaadaaaaciiaaaaappiaabaaaaiafiaaaaaeaaaaciiaaeaakklb
aeaakkkaaaaappiaacaaaaadaaaaaiiaaaaappiaaaaappiaafaaaaadaaaachia
aaaappiaaaaaoeiaabaaaaacaaaaciiaaeaakkkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcoaafaaaaeaaaaaaahiabaaaafjaaaaaeegiocaaaaaaaaaaa
alaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegbcbaaaaeaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaegaabaaaacaaaaaa
egaabaaaacaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaacaaaaaaakaabaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaacaaaaaajgahbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaaaeddiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaa
diaaaaahncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaak
dcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaadaaaaaa
aagabaaaaaaaaaaadbaaaaahicaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaa
afaaaaaaabaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaaagaabaaaabaaaaaaeghobaaaaeaaaaaaaagabaaaabaaaaaaapaaaaah
icaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
SetTexture 4 [_LightTexture0] CUBE 4
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 0, 2, 1, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R3.yw, fragment.texcoord[0], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[3], texture[4], CUBE;
TEX R2.w, fragment.texcoord[0], texture[1], 2D;
MAD R3.xy, R3.wyzw, c[4].y, -c[4].z;
MUL R3.zw, R3.xyxy, R3.xyxy;
ADD_SAT R3.z, R3, R3.w;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
DP3 R1.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.x, R1.x;
DP3 R2.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R3.z, -R3, c[4];
RSQ R3.z, R3.z;
MUL R0.xyz, R0, c[2];
MUL R0.xyz, R0, fragment.color.primary.w;
MUL R1.xyz, R1.x, fragment.texcoord[1];
RSQ R2.x, R2.x;
MAD R2.xyz, R2.x, fragment.texcoord[2], R1;
DP3 R3.w, R2, R2;
RSQ R3.w, R3.w;
MUL R2.xyz, R3.w, R2;
RCP R3.z, R3.z;
DP3 R1.x, R3, R1;
DP3 R2.x, R3, R2;
MOV R3.w, c[4];
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[4];
MUL R1.xyz, R0, R1.x;
MOV R0.xyz, c[1];
MUL R2.y, R3.w, c[3].x;
MAX R2.x, R2, c[4];
POW R2.x, R2.x, R2.y;
MUL R2.x, R2, R2.w;
MUL R0.xyz, R0, c[0];
MAD R0.xyz, R0, R2.x, R1;
MOV result.color.w, c[4].x;
TEX R0.w, R0.w, texture[3], 2D;
MUL R0.w, R0, R1;
MUL R0.w, R0, c[4].y;
MUL result.color.xyz, R0, R0.w;
END
# 40 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
SetTexture 4 [_LightTexture0] CUBE 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
def c4, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c5, 128.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r1, t3, s4
texld r3, t0, s2
texld r2, t0, s0
dp3 r0.x, t3, t3
mov r0.xy, r0.x
dp3_pp r1.x, t1, t1
rsq_pp r3.x, r1.x
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
texld r6, r0, s3
texld r0, t0, s1
mov r0.y, r3
mul_pp r3.xyz, r3.x, t1
mad_pp r5.xyz, r1.x, t2, r3
mov r0.x, r3.w
mad_pp r4.xy, r0, c4.x, c4.y
mul_pp r0.xy, r4, r4
add_pp_sat r0.x, r0, r0.y
dp3_pp r1.x, r5, r5
add_pp r0.x, -r0, c4.z
rsq_pp r0.x, r0.x
rcp_pp r4.z, r0.x
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r5
dp3_pp r1.x, r4, r1
mov_pp r0.x, c3
mul_pp r0.x, c5, r0
max_pp r1.x, r1, c4.w
pow r5.x, r1.x, r0.x
mul_pp r1.xyz, r2, c2
dp3_pp r2.x, r4, r3
mul_pp r3.xyz, r1, v0.w
max_pp r1.x, r2, c4.w
mul_pp r2.xyz, r3, c0
mov r0.x, r5.x
mul r0.x, r0, r0.w
mov_pp r3.xyz, c0
mul_pp r2.xyz, r2, r1.x
mul_pp r3.xyz, c1, r3
mul r1.x, r6, r1.w
mul_pp r1.x, r1, c4
mad r0.xyz, r3, r0.x, r2
mul r0.xyz, r0, r1.x
mov_pp r0.w, c4
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_GlossMap] 2D 4
SetTexture 2 [_BumpMap] 2D 3
SetTexture 3 [_LightTextureB0] 2D 1
SetTexture 4 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpijkominnallehfmhlikgeoblbdhaabmabaaaaaagmagaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
eiafaaaaeaaaaaaafcabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafidaaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egbcbaaaaeaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaadaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaaegaabaaaacaaaaaaegaabaaaacaaaaaa
ddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaacaaaaaaakaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
jgahbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaaaeddiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaa
bjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
egiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahncaabaaa
aaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
pgapbaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbcbaaaafaaaaaaeghobaaaaeaaaaaaaagabaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaagaabaaaabaaaaaapgapbaaaacaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_GlossMap] 2D 4
SetTexture 2 [_BumpMap] 2D 3
SetTexture 3 [_LightTextureB0] 2D 1
SetTexture 4 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjmkhginlknopbhdbikppmimdmgdgbnfpabaaaaaameajaaaaaeaaaaaa
daaaaaaaieadaaaaneaiaaaajaajaaaaebgpgodjemadaaaaemadaaaaaaacpppp
paacaaaafmaaaaaaadaadiaaaaaafmaaaaaafmaaafaaceaaaaaafmaaaeaaaaaa
adababaaaaacacaaacadadaaabaeaeaaaaaaabaaacaaaaaaaaaaaaaaaaaaaiaa
abaaacaaaaaaaaaaaaaaakaaabaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafafaaapkaaaaaaaedaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacpla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaia
aeaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaajaaeaiapka
ecaaaaadaaaacpiaaaaaoelaadaioekaecaaaaadabaacpiaaaaaoelaaeaioeka
ecaaaaadacaacpiaaaaaoelaacaioekaecaaaaadadaaapiaaeaaoelaaaaioeka
aiaaaaadacaaciiaadaaoelaadaaoelaahaaaaacacaaciiaacaappiaceaaaaac
abaachiaacaaoelaaeaaaaaeadaachiaadaaoelaacaappiaabaaoeiaceaaaaac
aeaachiaadaaoeiaaeaaaaaeadaacbiaaaaappiaaeaaaakaaeaaffkaaeaaaaae
adaacciaaaaaffiaaeaaaakaaeaaffkafkaaaaaeacaadiiaadaaoeiaadaaoeia
aeaakkkaacaaaaadacaaciiaacaappibaeaappkaahaaaaacacaaciiaacaappia
agaaaaacadaaceiaacaappiaaiaaaaadacaaciiaadaaoeiaaeaaoeiaaiaaaaad
aaaacbiaadaaoeiaabaaoeiaalaaaaadabaacbiaaaaaaaiaaeaakkkaalaaaaad
aaaaabiaacaappiaaeaakkkaabaaaaacacaaaiiaadaaffkaafaaaaadacaaaiia
acaappiaafaaaakacaaaaaadabaaaciaaaaaaaiaacaappiaafaaaaadacaaaiia
abaappiaabaaffiaabaaaaacaaaaahiaaaaaoekaafaaaaadaaaaahiaaaaaoeia
abaaoekaafaaaaadaaaaahiaacaappiaaaaaoeiaafaaaaadabaacoiaacaablia
acaablkaafaaaaadabaacoiaabaaoeiaabaapplaafaaaaadabaacoiaabaaoeia
aaaablkaaeaaaaaeaaaaahiaabaabliaabaaaaiaaaaaoeiaaiaaaaadabaaadia
aeaaoelaaeaaoelaecaaaaadabaaapiaabaaoeiaabaioekaafaaaaadaaaaciia
adaappiaabaaaaiaacaaaaadaaaaaiiaaaaappiaaaaappiaafaaaaadaaaachia
aaaappiaaaaaoeiaabaaaaacaaaaaiiaaeaakkkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefceiafaaaaeaaaaaaafcabaaaafjaaaaaeegiocaaaaaaaaaaa
alaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fidaaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegbcbaaaaeaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaegaabaaaacaaaaaa
egaabaaaacaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaacaaaaaaakaabaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaacaaaaaajgahbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaaaeddiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaa
diaaaaahncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaaaeaaaaaaaagabaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaagaabaaaabaaaaaapgapbaaaacaaaaaa
diaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 0, 2, 1, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R3.yw, fragment.texcoord[0], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.w, fragment.texcoord[3], texture[3], 2D;
TEX R1.w, fragment.texcoord[0], texture[1], 2D;
MAD R1.xy, R3.wyzw, c[4].y, -c[4].z;
DP3 R1.z, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R0, c[2];
MUL R0.xyz, R0, fragment.color.primary.w;
MUL R3.xy, R1, R1;
RSQ R1.z, R1.z;
MOV R2.xyz, fragment.texcoord[1];
MAD R2.xyz, R1.z, fragment.texcoord[2], R2;
DP3 R2.w, R2, R2;
RSQ R2.w, R2.w;
MUL R2.xyz, R2.w, R2;
ADD_SAT R1.z, R3.x, R3.y;
ADD R1.z, -R1, c[4];
RSQ R1.z, R1.z;
RCP R1.z, R1.z;
DP3 R2.x, R1, R2;
DP3 R1.x, R1, fragment.texcoord[1];
MOV R2.w, c[4];
MUL R2.y, R2.w, c[3].x;
MAX R2.x, R2, c[4];
POW R2.x, R2.x, R2.y;
MUL R1.w, R2.x, R1;
MAX R1.x, R1, c[4];
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.x;
MOV R2.xyz, c[1];
MUL R1.xyz, R2, c[0];
MUL R0.w, R0, c[4].y;
MAD R0.xyz, R1, R1.w, R0;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[4].x;
END
# 35 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c4, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c5, 128.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
dcl t2.xyz
dcl t3.xy
texld r1, t3, s3
texld r3, t0, s2
texld r2, t0, s0
texld r0, t0, s1
dp3_pp r1.x, t2, t2
mul_pp r2.xyz, r2, c2
mul_pp r2.xyz, r2, v0.w
mov r0.y, r3
mov r0.x, r3.w
mad_pp r3.xy, r0, c4.x, c4.y
mul_pp r0.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c4.z
rsq_pp r0.x, r0.x
rcp_pp r3.z, r0.x
mov_pp r0.x, c3
rsq_pp r1.x, r1.x
mov_pp r4.xyz, t1
mad_pp r4.xyz, r1.x, t2, r4
dp3_pp r1.x, r4, r4
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r4
dp3_pp r1.x, r3, r1
mul_pp r0.x, c5, r0
max_pp r1.x, r1, c4.w
pow r4.x, r1.x, r0.x
dp3_pp r1.x, r3, t1
max_pp r1.x, r1, c4.w
mul_pp r2.xyz, r2, c0
mul_pp r3.xyz, r2, r1.x
mov r0.x, r4.x
mul r0.x, r0, r0.w
mov_pp r2.xyz, c0
mul_pp r2.xyz, c1, r2
mul_pp r1.x, r1.w, c4
mad r0.xyz, r2, r0.x, r3
mul r0.xyz, r0, r1.x
mov_pp r0.w, c4
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_GlossMap] 2D 3
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedocpldmfdjkfmhpofmlpamblbagpkdpjfabaaaaaameafaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
kaaeaaaaeaaaaaaaciabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaa
agaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
dcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaa
dkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaadaaaaaa
deaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
ecaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaaeddiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadkaabaaaabaaaaaadiaaaaajhcaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahncaabaaaaaaaaaaaagaabaaa
aaaaaaaaagajbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaa
fgafbaaaaaaaaaaaigadbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_GlossMap] 2D 3
SetTexture 2 [_BumpMap] 2D 2
SetTexture 3 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Vector 128 [_Color]
Float 164 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedeepdmmgkhaejeoahccehohlpppliafcmabaaaaaanmaiaaaaaeaaaaaa
daaaaaaaeeadaaaaomahaaaakiaiaaaaebgpgodjamadaaaaamadaaaaaaacpppp
leacaaaafiaaaaaaadaadeaaaaaafiaaaaaafiaaaeaaceaaaaaafiaaadaaaaaa
aaababaaacacacaaabadadaaaaaaabaaacaaaaaaaaaaaaaaaaaaaiaaabaaacaa
aaaaaaaaaaaaakaaabaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaaaaea
aaaaialpaaaaaaaaaaaaiadpfbaaaaafafaaapkaaaaaaaedaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaja
adaiapkaabaaaaacaaaaadiaaaaabllaecaaaaadabaacpiaaaaaoelaacaioeka
ecaaaaadacaacpiaaaaaoelaadaioekaecaaaaadadaacpiaaaaaoelaabaioeka
ecaaaaadaaaacpiaaaaaoeiaaaaioekaaiaaaaadadaaciiaadaaoelaadaaoela
ahaaaaacadaaciiaadaappiaabaaaaacaaaaahiaadaaoelaaeaaaaaeaaaachia
aaaaoeiaadaappiaacaaoelaceaaaaacacaachiaaaaaoeiaaeaaaaaeaaaacbia
abaappiaaeaaaakaaeaaffkaaeaaaaaeaaaacciaabaaffiaaeaaaakaaeaaffka
fkaaaaaeadaadiiaaaaaoeiaaaaaoeiaaeaakkkaacaaaaadadaaciiaadaappib
aeaappkaahaaaaacadaaciiaadaappiaagaaaaacaaaaceiaadaappiaaiaaaaad
adaaciiaaaaaoeiaacaaoeiaaiaaaaadaaaacbiaaaaaoeiaacaaoelaalaaaaad
abaacbiaaaaaaaiaaeaakkkaalaaaaadaaaaabiaadaappiaaeaakkkaabaaaaac
adaaaiiaadaaffkaafaaaaadadaaaiiaadaappiaafaaaakacaaaaaadabaaacia
aaaaaaiaadaappiaafaaaaadadaaaiiaacaappiaabaaffiaabaaaaacaaaaahia
aaaaoekaafaaaaadaaaaahiaaaaaoeiaabaaoekaafaaaaadaaaaahiaadaappia
aaaaoeiaafaaaaadabaacoiaadaabliaacaablkaafaaaaadabaacoiaabaaoeia
abaapplaafaaaaadabaacoiaabaaoeiaaaaablkaaeaaaaaeaaaaahiaabaablia
abaaaaiaaaaaoeiaacaaaaadaaaaaiiaaaaappiaaaaappiaafaaaaadaaaachia
aaaappiaaaaaoeiaabaaaaacaaaaaiiaaeaakkkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefckaaeaaaaeaaaaaaaciabaaaafjaaaaaeegiocaaaaaaaaaaa
alaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
eeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
egbcbaaaaeaaaaaaagaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaa
ddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaa
egbcbaaaadaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaaaeddiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaa
bjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
egiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahncaabaaa
aaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "RenderType"="TreeBark" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [unity_Scale]
Vector 11 [_Scale]
Vector 12 [_SquashPlaneNormal]
Float 13 [_SquashAmount]
Vector 14 [_Wind]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..15],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MUL R2.xyz, vertex.position, c[11];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[9].y;
MUL R0, R0.xxyy, c[16];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R0.xyz, R3.y, c[14];
MUL R1.xyz, vertex.texcoord[1].y, R0;
MUL R0.w, vertex.color.y, c[17].y;
MOV R1.w, c[0].x;
MUL R0.xz, R0.w, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[17].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[14].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[14], R0;
DP3 R0.x, R1, c[12];
ADD R0.x, R0, c[12].w;
MUL R0.xyz, R0.x, c[12];
ADD R1.xyz, -R0, R1;
MAD R1.xyz, R0, c[13].x, R1;
DP3 R0.y, vertex.attrib[14], vertex.attrib[14];
RSQ R0.y, R0.y;
DP3 R0.x, vertex.normal, vertex.normal;
MUL R2.xyz, R0.y, vertex.attrib[14];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, vertex.normal;
MUL R3.xyz, R0.zxyw, R2.yzxw;
MAD R3.xyz, R0.yzxw, R2.zxyw, -R3;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MUL R3.xyz, R3, vertex.attrib[14].w;
DP3 R1.y, R3, c[5];
DP3 R1.x, R2, c[5];
DP3 R1.z, R0, c[5];
MUL result.texcoord[1].xyz, R1, c[10].w;
DP3 R1.y, R3, c[6];
DP3 R1.x, R2, c[6];
DP3 R1.z, R0, c[6];
MUL result.texcoord[2].xyz, R1, c[10].w;
DP3 R1.y, R3, c[7];
DP3 R1.x, R2, c[7];
DP3 R1.z, R0, c[7];
MUL result.texcoord[3].xyz, R1, c[10].w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
END
# 58 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [unity_Scale]
Vector 10 [_Scale]
Vector 11 [_SquashPlaneNormal]
Float 12 [_SquashAmount]
Vector 13 [_Wind]
Vector 14 [_MainTex_ST]
"vs_2_0
def c15, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c16, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c17, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c15.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mul r2.xyz, v0, c10
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c8.y
mul r0, r0.xxyy, c16
frc r0, r0
mad r0, r0, c15.y, c15.z
frc r0, r0
mad r0, r0, c15.y, c15.w
abs r0, r0
mad r1, -r0, c17.x, c17.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r0.xyz, r3.y, c13
mul r1.xyz, v4.y, r0
mul r0.w, v5.y, c17
mov r1.w, c15.x
mul r0.xz, r0.w, v2
mul r0.y, v4, c17.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c13.w, r2
mad r1.xyz, v4.x, c13, r0
dp3 r0.x, r1, c11
add r0.x, r0, c11.w
mul r0.xyz, r0.x, c11
add r1.xyz, -r0, r1
mad r1.xyz, r0, c12.x, r1
dp3 r0.y, v1, v1
rsq r0.y, r0.y
dp3 r0.x, v2, v2
mul r2.xyz, r0.y, v1
rsq r0.x, r0.x
mul r0.xyz, r0.x, v2
mul r3.xyz, r0.zxyw, r2.yzxw
mad r3.xyz, r0.yzxw, r2.zxyw, -r3
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mul r3.xyz, r3, v1.w
dp3 r1.y, r3, c4
dp3 r1.x, r2, c4
dp3 r1.z, r0, c4
mul oT1.xyz, r1, c9.w
dp3 r1.y, r3, c5
dp3 r1.x, r2, c5
dp3 r1.z, r0, c5
mul oT2.xyz, r1, c9.w
dp3 r1.y, r3, c6
dp3 r1.x, r2, c6
dp3 r1.z, r0, c6
mul oT3.xyz, r1, c9.w
mad oT0.xy, v3, c14, c14.zwzw
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefieceddopnnihljjliocifhhgamklnagphcedpabaaaaaajeakaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcpiaiaaaaeaaaabaa
doacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaa
amaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaaddcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaa
dkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaacaaaaaaaoaaaaaabaaaaaak
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaa
aaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaadaaaaaaafaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaa
aaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaa
aaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaa
aaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaa
adaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaa
bkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaa
aaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdo
dcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaa
adaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaa
egiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egiccaaaadaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkiacaaaadaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagiacaaaadaaaaaaalaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaa
eeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegbcbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
abaaaaaaegbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaadcaaaaakhcaabaaa
acaaaaaajgaebaaaaaaaaaaacgajbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaag
bcaabaaaadaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaa
akiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
baaaaaahbcaabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaihccabaaa
acaaaaaaegacbaaaaeaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaa
adaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaacaaaaaaaoaaaaaa
baaaaaahccaabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaah
bcaabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaa
aeaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaihccabaaaadaaaaaa
egacbaaaaeaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaaadaaaaaa
ckiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaackiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefieceddjllfenkmjlefahlocfbomkhagglpepmabaaaaaaliapaaaaaeaaaaaa
daaaaaaafaafaaaafaaoaaaabiapaaaaebgpgodjbiafaaaabiafaaaaaaacpopp
jaaeaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
acaaaaaaaeaaaeaaaaaaaaaaacaaamaaadaaaiaaaaaaaaaaacaabeaaabaaalaa
aaaaaaaaadaaafaaabaaamaaaaaaaaaaadaaakaaacaaanaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafapaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
baaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaafbbaaapkaaaaaaaea
aaaaeaeamnmmmmdnjkjjjjdobpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoeja
acaaoekaacaaookaceaaaaacaaaaahiaacaaoejaceaaaaacabaaahiaabaaoeja
afaaaaadacaaahiaaaaanciaabaamjiaaeaaaaaeacaaahiaaaaamjiaabaancia
acaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaaiaaaaka
abaaaaacadaaaciaajaaaakaabaaaaacadaaaeiaakaaaakaaiaaaaadaeaaacia
acaaoeiaadaaoeiaaiaaaaadaeaaabiaabaaoeiaadaaoeiaaiaaaaadaeaaaeia
aaaaoeiaadaaoeiaafaaaaadabaaahoaaeaaoeiaalaappkaabaaaaacadaaabia
aiaaffkaabaaaaacadaaaciaajaaffkaabaaaaacadaaaeiaakaaffkaaiaaaaad
aeaaaciaacaaoeiaadaaoeiaaiaaaaadaeaaabiaabaaoeiaadaaoeiaaiaaaaad
aeaaaeiaaaaaoeiaadaaoeiaafaaaaadacaaahoaaeaaoeiaalaappkaabaaaaac
adaaabiaaiaakkkaabaaaaacadaaaciaajaakkkaabaaaaacadaaaeiaakaakkka
aiaaaaadacaaaciaacaaoeiaadaaoeiaaiaaaaadacaaabiaabaaoeiaadaaoeia
aiaaaaadacaaaeiaaaaaoeiaadaaoeiaafaaaaadadaaahoaacaaoeiaalaappka
abaaaaacaaaaabiaaiaappkaabaaaaacaaaaaciaajaappkaabaaaaacaaaaaeia
akaappkaaiaaaaadaaaaabiaaaaaoeiabaaaaakaacaaaaadaaaaaciaaaaaaaia
afaaaajaacaaaaadaaaaaeiaaaaaffiaafaaffjaafaaaaadabaaahiaaaaaoeja
amaaoekaaiaaaaadaaaaabiaabaaoeiaaaaakkiaacaaaaadaaaaapiaaaaafaia
adaaffkaafaaaaadaaaaapiaaaaaoeiaapaaoekabdaaaaacaaaaapiaaaaaoeia
aeaaaaaeaaaaapiaaaaaoeiabaaaffkabaaakkkabdaaaaacaaaaapiaaaaaoeia
aeaaaaaeaaaaapiaaaaaoeiabaaaffkabaaappkacdaaaaacaaaaapiaaaaaoeia
afaaaaadacaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabbaaaakb
bbaaffkaafaaaaadaaaaapiaaaaaoeiaacaaoeiaacaaaaadaaaaadiaaaaaonia
aaaaoiiaafaaaaadacaaahiaaaaaffiaabaaoekaafaaaaadacaaahiaacaaoeia
aeaaffjaafaaaaadadaaaciaaaaaffiaaeaaffjaafaaaaadaaaaaciaafaaffja
bbaakkkaafaaaaadadaaafiaaaaaffiaacaaoejaabaaaaacaaaaaeiabbaappka
aeaaaaaeaaaaahiaaaaamiiaadaaoeiaacaaoeiaaeaaaaaeaaaaahiaaaaaoeia
abaappkaabaaoeiaaeaaaaaeaaaaahiaaeaaaajaabaaoekaaaaaoeiaaiaaaaad
aaaaaiiaanaaoekaaaaaoeiaacaaaaadaaaaaiiaaaaappiaanaappkaaeaaaaae
abaaahiaaaaappiaanaaoekbaaaaoeiabcaaaaaeacaaahiaaoaaaakaaaaaoeia
abaaoeiaafaaaaadaaaaapiaacaaffiaafaaoekaaeaaaaaeaaaaapiaaeaaoeka
acaaaaiaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaacaakkiaaaaaoeiaacaaaaad
aaaaapiaaaaaoeiaahaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiappppaaaafdeieefcpiaiaaaaeaaaabaadoacaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaamaaaaaa
fpaaaaadhcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
dcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacafaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaacaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaa
abaaaaaaegbcbaaaaaaaaaaaegiccaaaadaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaa
dcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaa
agbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaa
adaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkiacaaaadaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegiccaaaadaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaadaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegbcbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaabaaaaaa
egbcbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaabaaaaaadiaaaaahhcaabaaa
acaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaadcaaaaakhcaabaaaacaaaaaa
jgaebaaaaaaaaaaacgajbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaa
adaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaaaoaaaaaa
baaaaaahccaabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaah
bcaabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaa
aeaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaihccabaaaacaaaaaa
egacbaaaaeaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
aeaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaeaaaaaa
egacbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaihccabaaaadaaaaaaegacbaaa
aeaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaaadaaaaaackiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaackiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaadaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaacaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaadaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_Shininess]
SetTexture 0 [_BumpMap] 2D 0
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 2, 1, 0.5 } };
TEMP R0;
TEMP R1;
TEX R0.yw, fragment.texcoord[0], texture[0], 2D;
MAD R0.xy, R0.wyzw, c[1].x, -c[1].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[1].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.z, fragment.texcoord[3], R0;
DP3 R1.x, R0, fragment.texcoord[1];
DP3 R1.y, R0, fragment.texcoord[2];
MAD result.color.xyz, R1, c[1].z, c[1].z;
MOV result.color.w, c[0].x;
END
# 12 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_Shininess]
SetTexture 0 [_BumpMap] 2D 0
"ps_2_0
dcl_2d s0
def c1, 2.00000000, -1.00000000, 1.00000000, 0.50000000
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r0, t0, s0
mov r0.x, r0.w
mad_pp r1.xy, r0, c1.x, c1.y
mul_pp r0.xy, r1, r1
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c1.z
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3 r0.z, t3, r1
dp3 r0.x, r1, t1
dp3 r0.y, r1, t2
mad_pp r0.xyz, r0, c1.w, c1.w
mov_pp r0.w, c0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_BumpMap] 2D 0
ConstBuffer "$Globals" 128
Float 100 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedklnhmhljebkcbkaihndhbldddigicianabaaaaaapiacaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcpaabaaaaeaaaaaaahmaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaa
aaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaaphccabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaag
iccabaaaaaaaaaaabkiacaaaaaaaaaaaagaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_BumpMap] 2D 0
ConstBuffer "$Globals" 128
Float 100 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjbjokjahkdlehfomoiofpkipncanhahlabaaaaaahmaeaaaaaeaaaaaa
daaaaaaalaabaaaakiadaaaaeiaeaaaaebgpgodjhiabaaaahiabaaaaaaacpppp
eeabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaagaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeaaaaaialp
aaaaaaaaaaaaiadpfbaaaaafacaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaia
acaaahlabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajaaaaiapkaecaaaaad
aaaacpiaaaaaoelaaaaioekaaeaaaaaeabaacbiaaaaappiaabaaaakaabaaffka
aeaaaaaeabaacciaaaaaffiaabaaaakaabaaffkafkaaaaaeabaadiiaabaaoeia
abaaoeiaabaakkkaacaaaaadabaaciiaabaappibabaappkaahaaaaacabaaciia
abaappiaagaaaaacabaaceiaabaappiaaiaaaaadaaaacbiaabaaoelaabaaoeia
aiaaaaadaaaacciaacaaoelaabaaoeiaaiaaaaadaaaaceiaadaaoelaabaaoeia
aeaaaaaeaaaachiaaaaaoeiaacaaaakaacaaaakaabaaaaacaaaaciiaaaaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcpaabaaaaeaaaaaaahmaaaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaapdcaabaaaaaaaaaaa
hgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaa
aaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaa
abaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaaphccabaaaaaaaaaaaegacbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaadgaaaaagiccabaaaaaaaaaaabkiacaaaaaaaaaaa
agaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "RenderType"="TreeBark" }
  ZWrite Off
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_ProjectionParams]
Vector 11 [unity_SHAr]
Vector 12 [unity_SHAg]
Vector 13 [unity_SHAb]
Vector 14 [unity_SHBr]
Vector 15 [unity_SHBg]
Vector 16 [unity_SHBb]
Vector 17 [unity_SHC]
Vector 18 [unity_Scale]
Vector 19 [_Scale]
Vector 20 [_SquashPlaneNormal]
Float 21 [_SquashAmount]
Vector 22 [_Wind]
Vector 23 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..23],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MUL R2.xyz, vertex.position, c[19];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[9].y;
MUL R0, R0.xxyy, c[24];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R0.xyz, R3.y, c[22];
MUL R1.xyz, vertex.texcoord[1].y, R0;
MUL R0.w, vertex.color.y, c[25].y;
MOV R1.w, c[0].x;
MUL R0.xz, R0.w, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[25].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[22].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[22], R0;
DP3 R0.x, R1, c[20];
ADD R0.x, R0, c[20].w;
MUL R0.xyz, R0.x, c[20];
ADD R1.xyz, -R0, R1;
MAD R1.xyz, R0, c[21].x, R1;
DP4 R0.w, R1, c[4];
DP4 R0.x, R1, c[1];
DP4 R0.y, R1, c[2];
MUL R2.xyz, R0.xyww, c[25].z;
MUL R2.y, R2, c[10].x;
ADD result.texcoord[1].xy, R2, R2.z;
DP3 R0.z, vertex.normal, vertex.normal;
RSQ R2.x, R0.z;
DP4 R0.z, R1, c[3];
MUL R1.xyz, R2.x, vertex.normal;
MUL R1.xyz, R1, c[18].w;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[0].x;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[13];
DP4 R2.y, R0, c[12];
DP4 R2.x, R0, c[11];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[16];
DP4 R0.y, R1, c[15];
DP4 R0.x, R1, c[14];
MUL R1.xyz, R0.w, c[17];
ADD R0.xyz, R2, R0;
ADD result.texcoord[2].xyz, R0, R1;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MOV result.color.w, vertex.color;
END
# 65 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_SHAr]
Vector 12 [unity_SHAg]
Vector 13 [unity_SHAb]
Vector 14 [unity_SHBr]
Vector 15 [unity_SHBg]
Vector 16 [unity_SHBb]
Vector 17 [unity_SHC]
Vector 18 [unity_Scale]
Vector 19 [_Scale]
Vector 20 [_SquashPlaneNormal]
Float 21 [_SquashAmount]
Vector 22 [_Wind]
Vector 23 [_MainTex_ST]
"vs_2_0
def c24, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c25, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c26, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c27, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c24.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mul r2.xyz, v0, c19
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c8.y
mul r0, r0.xxyy, c25
frc r0, r0
mad r0, r0, c24.y, c24.z
frc r0, r0
mad r0, r0, c24.y, c24.w
abs r0, r0
mad r1, -r0, c26.x, c26.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r0.xyz, r3.y, c22
mul r1.xyz, v4.y, r0
mul r0.w, v5.y, c26
mov r1.w, c24.x
mul r0.xz, r0.w, v2
mul r0.y, v4, c26.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c22.w, r2
mad r1.xyz, v4.x, c22, r0
dp3 r0.x, r1, c20
add r0.x, r0, c20.w
mul r0.xyz, r0.x, c20
add r1.xyz, -r0, r1
mad r1.xyz, r0, c21.x, r1
dp4 r0.w, r1, c3
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mul r2.xyz, r0.xyww, c27.x
mul r2.y, r2, c9.x
mad oT1.xy, r2.z, c10.zwzw, r2
dp3 r0.z, v2, v2
rsq r2.x, r0.z
dp4 r0.z, r1, c2
mul r1.xyz, r2.x, v2
mul r1.xyz, r1, c18.w
mov oPos, r0
mov oT1.zw, r0
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c24.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c13
dp4 r2.y, r0, c12
dp4 r2.x, r0, c11
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c16
dp4 r0.y, r1, c15
dp4 r0.x, r1, c14
mul r1.xyz, r0.w, c17
add r0.xyz, r2, r0
add oT2.xyz, r0, r1
mov oD0.xyz, c24.x
mad oT0.xy, v3, c23, c23.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedajfmfooefoaehbaemnooijcalkojmbaaabaaaaaaieakaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcoeaiaaaa
eaaaabaadjacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadgaaaaag
bcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
dkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaa
aoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaa
afaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaa
afaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaa
diaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldp
aaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialp
aaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaa
egaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaa
aaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaa
diaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaah
ccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
adaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
abeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaal
hcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
dgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaa
egbcbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedjfkhmghhfocibknmdhpomlnnfkkkdlcgabaaaaaammapaaaaaeaaaaaa
daaaaaaaheafaaaagaaoaaaaciapaaaaebgpgodjdmafaaaadmafaaaaaaacpopp
jmaeaaaakaaaaaaaakaaceaaaaaajmaaaaaajmaaaaaaceaaabaajmaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaafaaabaaaeaaaaaaaaaaacaacgaaahaaafaaaaaaaaaaadaaaaaaaeaaamaa
aaaaaaaaadaaamaaadaabaaaaaaaaaaaadaabeaaabaabdaaaaaaaaaaaeaaafaa
abaabeaaaaaaaaaaaeaaakaaacaabfaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaaf
bhaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafbiaaapkaaaaaiadp
aaaaaaeaaaaaaalpaaaaialpfbaaaaafbjaaapkaaaaaaaeaaaaaeaeamnmmmmdn
jkjjjjdofbaaaaafbkaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaacaaoekaacaaookaabaaaaacaaaaabiabaaappkaabaaaaacaaaaacia
bbaappkaabaaaaacaaaaaeiabcaappkaaiaaaaadaaaaabiaaaaaoeiabiaaaaka
acaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffiaafaaffja
afaaaaadabaaahiaaaaaoejabeaaoekaaiaaaaadaaaaabiaabaaoeiaaaaakkia
acaaaaadaaaaapiaaaaafaiaadaaffkaafaaaaadaaaaapiaaaaaoeiabhaaoeka
bdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabiaaffkabiaakkka
bdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabiaaffkabiaappka
cdaaaaacaaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaaaaaoeiaaeaaaaae
aaaaapiaaaaaoeiabjaaaakbbjaaffkaafaaaaadaaaaapiaaaaaoeiaacaaoeia
acaaaaadaaaaadiaaaaaoniaaaaaoiiaafaaaaadacaaahiaaaaaffiaabaaoeka
afaaaaadacaaahiaacaaoeiaaeaaffjaafaaaaadadaaaciaaaaaffiaaeaaffja
afaaaaadaaaaaciaafaaffjabjaakkkaafaaaaadadaaafiaaaaaffiaacaaoeja
abaaaaacaaaaaeiabjaappkaaeaaaaaeaaaaahiaaaaamiiaadaaoeiaacaaoeia
aeaaaaaeaaaaahiaaaaaoeiaabaappkaabaaoeiaaeaaaaaeaaaaahiaaeaaaaja
abaaoekaaaaaoeiaaiaaaaadaaaaaiiabfaaoekaaaaaoeiaacaaaaadaaaaaiia
aaaappiabfaappkaaeaaaaaeabaaahiaaaaappiabfaaoekbaaaaoeiabcaaaaae
acaaahiabgaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaapiaacaaffiaanaaoeka
aeaaaaaeaaaaapiaamaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiaaoaaoeka
acaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiaapaaoekaafaaaaadabaaabia
aaaaffiaaeaaaakaafaaaaadabaaaiiaabaaaaiabiaakkkbafaaaaadabaaafia
aaaapeiabiaakkkbacaaaaadacaaadoaabaakkiaabaaomiaceaaaaacabaaahia
acaaoejaafaaaaadabaaahiaabaaoeiabdaappkaafaaaaadacaaahiaabaaffia
bbaaoekaaeaaaaaeabaaaliabaaakekaabaaaaiaacaakeiaaeaaaaaeabaaahia
bcaaoekaabaakkiaabaapeiaabaaaaacabaaaiiabiaaaakaajaaaaadacaaabia
afaaoekaabaaoeiaajaaaaadacaaaciaagaaoekaabaaoeiaajaaaaadacaaaeia
ahaaoekaabaaoeiaafaaaaadadaaapiaabaacjiaabaakeiaajaaaaadaeaaabia
aiaaoekaadaaoeiaajaaaaadaeaaaciaajaaoekaadaaoeiaajaaaaadaeaaaeia
akaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadabaaacia
abaaffiaabaaffiaaeaaaaaeabaaabiaabaaaaiaabaaaaiaabaaffibaeaaaaae
adaaahoaalaaoekaabaaaaiaacaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiaaeaaaaae
abaaapoaafaappjabkaaeakabkaabfkappppaaaafdeieefcoeaiaaaaeaaaabaa
djacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadgaaaaagbcaabaaa
aaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaa
baaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaa
afaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
pcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamado
mlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialp
aaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaia
ibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaea
aaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
acaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaah
ccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaa
aaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaa
fgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaa
jkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
aaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaa
aeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
adaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaa
acaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_ProjectionParams]
Vector 11 [unity_SHAr]
Vector 12 [unity_SHAg]
Vector 13 [unity_SHAb]
Vector 14 [unity_SHBr]
Vector 15 [unity_SHBg]
Vector 16 [unity_SHBb]
Vector 17 [unity_SHC]
Vector 18 [unity_Scale]
Vector 19 [_Scale]
Vector 20 [_SquashPlaneNormal]
Float 21 [_SquashAmount]
Vector 22 [_Wind]
Vector 23 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..23],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
MUL R2.xyz, vertex.position, c[19];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[9].y;
MUL R0, R0.xxyy, c[24];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R0.xyz, R3.y, c[22];
MUL R1.xyz, vertex.texcoord[1].y, R0;
MUL R0.w, vertex.color.y, c[25].y;
MOV R1.w, c[0].x;
MUL R0.xz, R0.w, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[25].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[22].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[22], R0;
DP3 R0.x, R1, c[20];
ADD R0.x, R0, c[20].w;
MUL R0.xyz, R0.x, c[20];
ADD R1.xyz, -R0, R1;
MAD R1.xyz, R0, c[21].x, R1;
DP4 R0.w, R1, c[4];
DP4 R0.x, R1, c[1];
DP4 R0.y, R1, c[2];
MUL R2.xyz, R0.xyww, c[25].z;
MUL R2.y, R2, c[10].x;
ADD result.texcoord[1].xy, R2, R2.z;
DP3 R0.z, vertex.normal, vertex.normal;
RSQ R2.x, R0.z;
DP4 R0.z, R1, c[3];
MUL R1.xyz, R2.x, vertex.normal;
MUL R1.xyz, R1, c[18].w;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[0].x;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[13];
DP4 R2.y, R0, c[12];
DP4 R2.x, R0, c[11];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[16];
DP4 R0.y, R1, c[15];
DP4 R0.x, R1, c[14];
MUL R1.xyz, R0.w, c[17];
ADD R0.xyz, R2, R0;
ADD result.texcoord[2].xyz, R0, R1;
MOV result.color.xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MOV result.color.w, vertex.color;
END
# 65 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_SHAr]
Vector 12 [unity_SHAg]
Vector 13 [unity_SHAb]
Vector 14 [unity_SHBr]
Vector 15 [unity_SHBg]
Vector 16 [unity_SHBb]
Vector 17 [unity_SHC]
Vector 18 [unity_Scale]
Vector 19 [_Scale]
Vector 20 [_SquashPlaneNormal]
Float 21 [_SquashAmount]
Vector 22 [_Wind]
Vector 23 [_MainTex_ST]
"vs_2_0
def c24, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c25, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c26, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c27, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c24.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mul r2.xyz, v0, c19
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c8.y
mul r0, r0.xxyy, c25
frc r0, r0
mad r0, r0, c24.y, c24.z
frc r0, r0
mad r0, r0, c24.y, c24.w
abs r0, r0
mad r1, -r0, c26.x, c26.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r0.xyz, r3.y, c22
mul r1.xyz, v4.y, r0
mul r0.w, v5.y, c26
mov r1.w, c24.x
mul r0.xz, r0.w, v2
mul r0.y, v4, c26.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c22.w, r2
mad r1.xyz, v4.x, c22, r0
dp3 r0.x, r1, c20
add r0.x, r0, c20.w
mul r0.xyz, r0.x, c20
add r1.xyz, -r0, r1
mad r1.xyz, r0, c21.x, r1
dp4 r0.w, r1, c3
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mul r2.xyz, r0.xyww, c27.x
mul r2.y, r2, c9.x
mad oT1.xy, r2.z, c10.zwzw, r2
dp3 r0.z, v2, v2
rsq r2.x, r0.z
dp4 r0.z, r1, c2
mul r1.xyz, r2.x, v2
mul r1.xyz, r1, c18.w
mov oPos, r0
mov oT1.zw, r0
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c24.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c13
dp4 r2.y, r0, c12
dp4 r2.x, r0, c11
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c16
dp4 r0.y, r1, c15
dp4 r0.x, r1, c14
mul r1.xyz, r0.w, c17
add r0.xyz, r2, r0
add oT2.xyz, r0, r1
mov oD0.xyz, c24.x
mad oT0.xy, v3, c23, c23.zwzw
mov oD0.w, v5
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedajfmfooefoaehbaemnooijcalkojmbaaabaaaaaaieakaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcoeaiaaaa
eaaaabaadjacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadgaaaaag
bcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
dkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaa
aoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaa
afaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaa
afaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaa
diaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldp
aaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialp
aaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaa
egaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaa
aaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaa
diaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaah
ccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
adaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
abeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaal
hcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
dgaaaaaihccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dgaaaaaficcabaaaacaaaaaadkbabaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaa
egbcbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 48 [_Wind]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedjfkhmghhfocibknmdhpomlnnfkkkdlcgabaaaaaammapaaaaaeaaaaaa
daaaaaaaheafaaaagaaoaaaaciapaaaaebgpgodjdmafaaaadmafaaaaaaacpopp
jmaeaaaakaaaaaaaakaaceaaaaaajmaaaaaajmaaaaaaceaaabaajmaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaa
abaaafaaabaaaeaaaaaaaaaaacaacgaaahaaafaaaaaaaaaaadaaaaaaaeaaamaa
aaaaaaaaadaaamaaadaabaaaaaaaaaaaadaabeaaabaabdaaaaaaaaaaaeaaafaa
abaabeaaaaaaaaaaaeaaakaaacaabfaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaaf
bhaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafbiaaapkaaaaaiadp
aaaaaaeaaaaaaalpaaaaialpfbaaaaafbjaaapkaaaaaaaeaaaaaeaeamnmmmmdn
jkjjjjdofbaaaaafbkaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaacaaoekaacaaookaabaaaaacaaaaabiabaaappkaabaaaaacaaaaacia
bbaappkaabaaaaacaaaaaeiabcaappkaaiaaaaadaaaaabiaaaaaoeiabiaaaaka
acaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffiaafaaffja
afaaaaadabaaahiaaaaaoejabeaaoekaaiaaaaadaaaaabiaabaaoeiaaaaakkia
acaaaaadaaaaapiaaaaafaiaadaaffkaafaaaaadaaaaapiaaaaaoeiabhaaoeka
bdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabiaaffkabiaakkka
bdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabiaaffkabiaappka
cdaaaaacaaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaaaaaoeiaaeaaaaae
aaaaapiaaaaaoeiabjaaaakbbjaaffkaafaaaaadaaaaapiaaaaaoeiaacaaoeia
acaaaaadaaaaadiaaaaaoniaaaaaoiiaafaaaaadacaaahiaaaaaffiaabaaoeka
afaaaaadacaaahiaacaaoeiaaeaaffjaafaaaaadadaaaciaaaaaffiaaeaaffja
afaaaaadaaaaaciaafaaffjabjaakkkaafaaaaadadaaafiaaaaaffiaacaaoeja
abaaaaacaaaaaeiabjaappkaaeaaaaaeaaaaahiaaaaamiiaadaaoeiaacaaoeia
aeaaaaaeaaaaahiaaaaaoeiaabaappkaabaaoeiaaeaaaaaeaaaaahiaaeaaaaja
abaaoekaaaaaoeiaaiaaaaadaaaaaiiabfaaoekaaaaaoeiaacaaaaadaaaaaiia
aaaappiabfaappkaaeaaaaaeabaaahiaaaaappiabfaaoekbaaaaoeiabcaaaaae
acaaahiabgaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaapiaacaaffiaanaaoeka
aeaaaaaeaaaaapiaamaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiaaoaaoeka
acaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeiaapaaoekaafaaaaadabaaabia
aaaaffiaaeaaaakaafaaaaadabaaaiiaabaaaaiabiaakkkbafaaaaadabaaafia
aaaapeiabiaakkkbacaaaaadacaaadoaabaakkiaabaaomiaceaaaaacabaaahia
acaaoejaafaaaaadabaaahiaabaaoeiabdaappkaafaaaaadacaaahiaabaaffia
bbaaoekaaeaaaaaeabaaaliabaaakekaabaaaaiaacaakeiaaeaaaaaeabaaahia
bcaaoekaabaakkiaabaapeiaabaaaaacabaaaiiabiaaaakaajaaaaadacaaabia
afaaoekaabaaoeiaajaaaaadacaaaciaagaaoekaabaaoeiaajaaaaadacaaaeia
ahaaoekaabaaoeiaafaaaaadadaaapiaabaacjiaabaakeiaajaaaaadaeaaabia
aiaaoekaadaaoeiaajaaaaadaeaaaciaajaaoekaadaaoeiaajaaaaadaeaaaeia
akaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadabaaacia
abaaffiaabaaffiaaeaaaaaeabaaabiaabaaaaiaabaaaaiaabaaffibaeaaaaae
adaaahoaalaaoekaabaaaaiaacaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiaaeaaaaae
abaaapoaafaappjabkaaeakabkaabfkappppaaaafdeieefcoeaiaaaaeaaaabaa
djacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadlcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadgaaaaagbcaabaaa
aaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaa
baaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaa
afaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
pcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamado
mlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialp
aaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaia
ibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaea
aaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
acaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaah
ccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaa
aaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaa
fgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaa
jkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
aaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaa
aeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaai
hccabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadgaaaaaf
iccabaaaacaaaaaadkbabaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
adaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaa
acaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 3 [_LightBuffer] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0..1] };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R1, fragment.texcoord[1], texture[3], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2.w, fragment.texcoord[0], texture[1], 2D;
MUL R0.xyz, R0, c[1];
LG2 R1.w, R1.w;
MUL R1.w, -R1, R2;
LG2 R1.x, R1.x;
LG2 R1.z, R1.z;
LG2 R1.y, R1.y;
ADD R1.xyz, -R1, fragment.texcoord[2];
MUL R2.xyz, R1, c[0];
MUL R2.xyz, R1.w, R2;
MUL R0.xyz, R0, fragment.color.primary.w;
MAD result.color.xyz, R0, R1, R2;
MAD result.color.w, R1, c[0], R0;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 3 [_LightBuffer] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s3
dcl t0.xy
dcl v0.xyzw
dcl t1
dcl t2.xyz
texldp r0, t1, s3
texld r1, t0, s0
texld r2, t0, s1
mul_pp r1.xyz, r1, c1
log_pp r0.x, r0.x
log_pp r0.z, r0.z
log_pp r0.y, r0.y
add_pp r2.xyz, -r0, t2
mul_pp r3.xyz, r2, c0
log_pp r0.x, r0.w
mul_pp r0.x, -r0, r2.w
mul_pp r3.xyz, r0.x, r3
mul_pp r1.xyz, r1, v0.w
mad_pp r1.xyz, r1, r2, r3
mad_pp r1.w, r0.x, c0, r1
mov_pp oC0, r1
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
ConstBuffer "$Globals" 144
Vector 32 [_SpecColor]
Vector 64 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefieceddgelmegdombimcibgljengokcdbcilnkabaaaaaagaadaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcfeacaaaaeaaaaaaajfaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
cpaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaaaaaaaaiocaabaaaaaaaaaaa
agajbaiaebaaaaaaabaaaaaaagbjbaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaa
jgahbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaacaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakiccabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaacaaaaaadkaabaaaacaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaacaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
ConstBuffer "$Globals" 144
Vector 32 [_SpecColor]
Vector 64 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedlhnphcjmgjfmijmdkemdmnnjefibleacabaaaaaacaafaaaaaeaaaaaa
daaaaaaaomabaaaaeiaeaaaaomaeaaaaebgpgodjleabaaaaleabaaaaaaacpppp
gmabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaaaaaaaaa
abababaaacacacaaaaaaacaaabaaaaaaaaaaaaaaaaaaaeaaabaaabaaaaaaaaaa
aaacppppbpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
acaapplaafaaaaadaaaaadiaaaaappiaacaaoelaecaaaaadaaaacpiaaaaaoeia
acaioekaecaaaaadabaacpiaaaaaoelaabaioekaecaaaaadacaacpiaaaaaoela
aaaioekaapaaaaacabaacbiaaaaaaaiaapaaaaacabaacciaaaaaffiaapaaaaac
abaaceiaaaaakkiaapaaaaacaaaacbiaaaaappiaacaaaaadaaaacoiaabaablib
adaabllaafaaaaadabaachiaaaaabliaaaaaoekaafaaaaadabaaciiaabaappia
aaaaaaibafaaaaadabaachiaabaappiaabaaoeiaafaaaaadacaachiaacaaoeia
abaaoekaaeaaaaaeadaaciiaabaappiaaaaappkaacaappiaafaaaaadacaachia
acaaoeiaabaapplaaeaaaaaeadaachiaacaaoeiaaaaabliaabaaoeiaabaaaaac
aaaicpiaadaaoeiappppaaaafdeieefcfeacaaaaeaaaaaaajfaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadlcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaa
adaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaacpaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadiaaaaai
bcaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaaaaaaaai
ocaabaaaaaaaaaaaagajbaiaebaaaaaaabaaaaaaagbjbaaaaeaaaaaadiaaaaai
hcaabaaaabaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
iccabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaaacaaaaaadkaabaaa
acaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaacaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaajgahbaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 3 [_LightBuffer] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0..1] };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TXP R1, fragment.texcoord[1], texture[3], 2D;
TEX R2.w, fragment.texcoord[0], texture[1], 2D;
ADD R1.xyz, R1, fragment.texcoord[2];
MUL R1.w, R1, R2;
MUL R0.xyz, R0, c[1];
MUL R2.xyz, R1, c[0];
MUL R2.xyz, R1.w, R2;
MUL R0.xyz, R0, fragment.color.primary.w;
MAD result.color.xyz, R0, R1, R2;
MAD result.color.w, R1, c[0], R0;
END
# 11 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 3 [_LightBuffer] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s3
dcl t0.xy
dcl v0.xyzw
dcl t1
dcl t2.xyz
texld r2, t0, s1
texld r1, t0, s0
texldp r0, t1, s3
mul_pp r3.x, r0.w, r2.w
add_pp r0.xyz, r0, t2
mul_pp r2.xyz, r0, c0
mul_pp r1.xyz, r1, c1
mul_pp r2.xyz, r3.x, r2
mul_pp r1.xyz, r1, v0.w
mad_pp r0.xyz, r1, r0, r2
mad_pp r0.w, r3.x, c0, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
ConstBuffer "$Globals" 144
Vector 32 [_SpecColor]
Vector 64 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedjbghgconkchcegbckhmjmhdfhehbmoflabaaaaaaeeadaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcdiacaaaaeaaaaaaaioaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadicbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
diaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaabaaaaaaaaaaaaah
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaaeaaaaaadiaaaaaihcaabaaa
abaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakiccabaaa
aaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaaacaaaaaadkaabaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaacaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaacaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_GlossMap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
ConstBuffer "$Globals" 144
Vector 32 [_SpecColor]
Vector 64 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedonpelldhddeihchippnhjjaanmdjnjakabaaaaaaneaeaaaaaeaaaaaa
daaaaaaalmabaaaapmadaaaakaaeaaaaebgpgodjieabaaaaieabaaaaaaacpppp
dmabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaaaaaaaaa
abababaaacacacaaaaaaacaaabaaaaaaaaaaaaaaaaaaaeaaabaaabaaaaaaaaaa
aaacppppbpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
acaapplaafaaaaadaaaaadiaaaaappiaacaaoelaecaaaaadabaacpiaaaaaoela
abaioekaecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaadacaacpiaaaaaoela
aaaioekaafaaaaadaaaaciiaabaappiaaaaappiaacaaaaadaaaachiaaaaaoeia
adaaoelaafaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaadabaachiaaaaappia
abaaoeiaafaaaaadacaachiaacaaoeiaabaaoekaaeaaaaaeadaaciiaaaaappia
aaaappkaacaappiaafaaaaadacaachiaacaaoeiaabaapplaaeaaaaaeadaachia
acaaoeiaaaaaoeiaabaaoeiaabaaaaacaaaicpiaadaaoeiappppaaaafdeieefc
diacaaaaeaaaaaaaioaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahbcaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaabaaaaaaaaaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaaagbjbaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaa
aaaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaa
acaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakiccabaaaaaaaaaaaakaabaaa
aaaaaaaadkiacaaaaaaaaaaaacaaaaaadkaabaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaacaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheo
jmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapalaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="TreeBark" }
  Cull Off
  Fog { Mode Off }
  Offset 1, 1
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [unity_LightShadowBias]
Vector 11 [_Scale]
Vector 12 [_SquashPlaneNormal]
Float 13 [_SquashAmount]
Vector 14 [_Wind]
"!!ARBvp1.0
PARAM c[17] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..14],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
ADD R0.z, vertex.color.y, R0.x;
MUL R2.xyz, vertex.position, c[11];
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[9].y;
MUL R0, R0.xxyy, c[15];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R0.xyz, R3.y, c[14];
MUL R1.xyz, vertex.texcoord[1].y, R0;
MUL R0.w, vertex.color.y, c[16].y;
MUL R0.xz, R0.w, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[16].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[14].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[14], R0;
DP3 R0.x, R1, c[12];
ADD R0.x, R0, c[12].w;
MUL R0.xyz, R0.x, c[12];
ADD R1.xyz, -R0, R1;
MAD R0.xyz, R0, c[13].x, R1;
MOV R0.w, c[0].x;
DP4 R1.y, R0, c[4];
DP4 R1.x, R0, c[3];
ADD R1.x, R1, c[10];
MAX R1.z, R1.x, -R1.y;
ADD R1.z, R1, -R1.x;
MAD result.position.z, R1, c[10].y, R1.x;
MOV result.position.w, R1.y;
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
END
# 41 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [unity_LightShadowBias]
Vector 10 [_Scale]
Vector 11 [_SquashPlaneNormal]
Float 12 [_SquashAmount]
Vector 13 [_Wind]
"vs_2_0
def c14, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c15, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c16, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c17, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c14.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mul r2.xyz, v0, c10
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c8.y
mul r0, r0.xxyy, c15
frc r0, r0
mad r0, r0, c14.y, c14.z
frc r0, r0
mad r0, r0, c14.y, c14.w
abs r0, r0
mad r1, -r0, c16.x, c16.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r0.xyz, r3.y, c13
mul r1.xyz, v4.y, r0
mul r0.w, v5.y, c16
mov r1.w, c14.x
mul r0.xz, r0.w, v2
mul r0.y, v4, c16.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c13.w, r2
mad r1.xyz, v4.x, c13, r0
dp3 r0.x, r1, c11
add r0.x, r0, c11.w
mul r0.xyz, r0.x, c11
add r1.xyz, -r0, r1
mad r1.xyz, r0, c12.x, r1
dp4 r0.x, r1, c2
add r0.x, r0, c9
max r0.y, r0.x, c17.x
add r0.y, r0, -r0.x
mad r0.z, r0.y, c9.y, r0.x
dp4 r0.w, r1, c3
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mov oPos, r0
mov oT0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [_Wind]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedeombomdchfdbafpijhnghepeiedihcgaabaaaaaadaahaaaaadaaaaaa
cmaaaaaapeaaaaaaciabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahafaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafdeieefcaaagaaaaeaaaabaaiaabaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaaagaaaaaafjaaaaaeegiocaaaadaaaaaaapaaaaaafjaaaaaeegiocaaa
aeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadfcbabaaaacaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaaddcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagiaaaaacaeaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaa
abaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaa
dcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaa
agbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaaaaaaaaaiecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaakiacaaaacaaaaaaafaaaaaadgaaaaaflccabaaaaaaaaaaa
egambaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaaaaaaaaaaaaibcaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaakeccabaaaaaaaaaaabkiacaaaacaaaaaaafaaaaaaakaabaaa
aaaaaaaackaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [_Wind]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedlfhjaommdjngkgakjjaamgmboegdadfcabaaaaaaaaalaaaaaeaaaaaa
daaaaaaapmadaaaaaeakaaaammakaaaaebgpgodjmeadaaaameadaaaaaaacpopp
eiadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaafaaabaaadaaaaaaaaaa
adaaaaaaaeaaaeaaaaaaaaaaadaaamaaadaaaiaaaaaaaaaaaeaaafaaabaaalaa
aaaaaaaaaeaaakaaacaaamaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafaoaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafapaaapkaaaaaiadpaaaaaaea
aaaaaalpaaaaialpfbaaaaafbaaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdo
fbaaaaafbbaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaac
afaaafiaafaaapjaabaaaaacaaaaabiaaiaappkaabaaaaacaaaaaciaajaappka
abaaaaacaaaaaeiaakaappkaaiaaaaadaaaaabiaaaaaoeiaapaaaakaacaaaaad
aaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffiaafaaffjaafaaaaad
abaaahiaaaaaoejaalaaoekaaiaaaaadaaaaabiaabaaoeiaaaaakkiaacaaaaad
aaaaapiaaaaafaiaacaaffkaafaaaaadaaaaapiaaaaaoeiaaoaaoekabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaapaaffkaapaakkkabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaapaaffkaapaappkacdaaaaac
aaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapia
aaaaoeiabaaaaakbbaaaffkaafaaaaadaaaaapiaaaaaoeiaacaaoeiaacaaaaad
aaaaadiaaaaaoniaaaaaoiiaafaaaaadacaaahiaaaaaffiaabaaoekaafaaaaad
acaaahiaacaaoeiaaeaaffjaafaaaaadadaaaciaaaaaffiaaeaaffjaafaaaaad
aaaaaciaafaaffjabaaakkkaafaaaaadadaaafiaaaaaffiaacaaoejaabaaaaac
aaaaaeiabaaappkaaeaaaaaeaaaaahiaaaaamiiaadaaoeiaacaaoeiaaeaaaaae
aaaaahiaaaaaoeiaabaappkaabaaoeiaaeaaaaaeaaaaahiaaeaaaajaabaaoeka
aaaaoeiaaiaaaaadaaaaaiiaamaaoekaaaaaoeiaacaaaaadaaaaaiiaaaaappia
amaappkaaeaaaaaeabaaahiaaaaappiaamaaoekbaaaaoeiabcaaaaaeacaaahia
anaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaapiaacaaffiaafaaoekaaeaaaaae
aaaaapiaaeaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaacaakkia
aaaaoeiaacaaaaadaaaaapiaaaaaoeiaahaaoekaacaaaaadaaaaaeiaaaaakkia
adaaaakaalaaaaadabaaabiaaaaakkiabbaaaakaacaaaaadabaaabiaaaaakkib
abaaaaiaaeaaaaaeaaaaaemaadaaffkaabaaaaiaaaaakkiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaaimaaaaappiappppaaaafdeieefc
aaagaaaaeaaaabaaiaabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaagaaaaaafjaaaaae
egiocaaaadaaaaaaapaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaad
hcbabaaaaaaaaaaafpaaaaadfcbabaaaacaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaaddcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagiaaaaac
aeaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaa
dkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaa
akaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaa
aaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaa
egiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
kgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaa
abaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaia
ibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaa
egaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaa
aaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
fgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaa
aeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdn
diaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaaf
ecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaa
aaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaa
aaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaa
aaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaa
akaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaa
aeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaaaaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaaaaaaaaaiecaabaaaaaaaaaaackaabaaaaaaaaaaaakiacaaa
acaaaaaaafaaaaaadgaaaaaflccabaaaaaaaaaaaegambaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakeccabaaa
aaaaaaaabkiacaaaacaaaaaaafaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahafaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_LightPositionRange]
Vector 11 [_Scale]
Vector 12 [_SquashPlaneNormal]
Float 13 [_SquashAmount]
Vector 14 [_Wind]
"!!ARBvp1.0
PARAM c[17] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..14],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[8];
ADD R0.x, vertex.color, R0;
ADD R0.z, vertex.color.y, R0.x;
MUL R2.xyz, vertex.position, c[11];
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[9].y;
MUL R0, R0.xxyy, c[15];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R0.xyz, R3.y, c[14];
MUL R1.xyz, vertex.texcoord[1].y, R0;
MUL R0.w, vertex.color.y, c[16].y;
MOV R1.w, c[0].x;
MUL R0.xz, R0.w, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[16].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[14].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[14], R0;
DP3 R0.x, R1, c[12];
ADD R0.x, R0, c[12].w;
MUL R0.xyz, R0.x, c[12];
ADD R1.xyz, -R0, R1;
MAD R1.xyz, R0, c[13].x, R1;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
ADD result.texcoord[0].xyz, R0, -c[10];
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
END
# 40 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_LightPositionRange]
Vector 10 [_Scale]
Vector 11 [_SquashPlaneNormal]
Float 12 [_SquashAmount]
Vector 13 [_Wind]
"vs_2_0
def c14, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c15, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c16, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c7
dp3 r0.x, c14.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mul r2.xyz, v0, c10
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c8.y
mul r0, r0.xxyy, c15
frc r0, r0
mad r0, r0, c14.y, c14.z
frc r0, r0
mad r0, r0, c14.y, c14.w
abs r0, r0
mad r1, -r0, c16.x, c16.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r0.xyz, r3.y, c13
mul r1.xyz, v4.y, r0
mul r0.w, v5.y, c16
mov r1.w, c14.x
mul r0.xz, r0.w, v2
mul r0.y, v4, c16.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c13.w, r2
mad r1.xyz, v4.x, c13, r0
dp3 r0.x, r1, c11
add r0.x, r0, c11.w
mul r0.xyz, r0.x, c11
add r1.xyz, -r0, r1
mad r1.xyz, r0, c12.x, r1
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
add oT0.xyz, r0, -c9
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [_Wind]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedkhbkipafophochafhoajghgdcpblnlaiabaaaaaahmahaaaaadaaaaaa
cmaaaaaapeaaaaaaemabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahafaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheofaaaaaaaacaaaaaa
aiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcciagaaaaeaaaabaaikabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafjaaaaae
egiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadfcbabaaa
acaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaaddcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagiaaaaacaeaaaaaa
dgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaa
aeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaa
aaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdp
amaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaa
aaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaia
mbaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaa
igaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaadaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaa
aeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaa
diaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaah
fcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaa
aaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaaaaaaaaajhccabaaaabaaaaaa
egacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [_Wind]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedliklimakdlibphnipjgdmncohjdboglgabaaaaaaeialaaaaaeaaaaaa
daaaaaaapiadaaaaciakaaaapaakaaaaebgpgodjmaadaaaamaadaaaaaaacpopp
eeadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaabaaabaaadaaaaaaaaaa
adaaaaaaaeaaaeaaaaaaaaaaadaaamaaaeaaaiaaaaaaaaaaaeaaafaaabaaamaa
aaaaaaaaaeaaakaaacaaanaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafapaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafbaaaapkaaaaaiadpaaaaaaea
aaaaaalpaaaaialpfbaaaaafbbaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdo
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaabaaaaacaaaaabiaaiaappkaabaaaaac
aaaaaciaajaappkaabaaaaacaaaaaeiaakaappkaaiaaaaadaaaaabiaaaaaoeia
baaaaakaacaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffia
afaaffjaafaaaaadabaaahiaaaaaoejaamaaoekaaiaaaaadaaaaabiaabaaoeia
aaaakkiaacaaaaadaaaaapiaaaaafaiaacaaffkaafaaaaadaaaaapiaaaaaoeia
apaaoekabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabaaaffka
baaakkkabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabaaaffka
baaappkacdaaaaacaaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaaaaaoeia
aeaaaaaeaaaaapiaaaaaoeiabbaaaakbbbaaffkaafaaaaadaaaaapiaaaaaoeia
acaaoeiaacaaaaadaaaaadiaaaaaoniaaaaaoiiaafaaaaadacaaahiaaaaaffia
abaaoekaafaaaaadacaaahiaacaaoeiaaeaaffjaafaaaaadadaaaciaaaaaffia
aeaaffjaafaaaaadaaaaaciaafaaffjabbaakkkaafaaaaadadaaafiaaaaaffia
acaaoejaabaaaaacaaaaaeiabbaappkaaeaaaaaeaaaaahiaaaaamiiaadaaoeia
acaaoeiaaeaaaaaeaaaaahiaaaaaoeiaabaappkaabaaoeiaaeaaaaaeaaaaahia
aeaaaajaabaaoekaaaaaoeiaaiaaaaadaaaaaiiaanaaoekaaaaaoeiaacaaaaad
aaaaaiiaaaaappiaanaappkaaeaaaaaeabaaahiaaaaappiaanaaoekbaaaaoeia
bcaaaaaeacaaahiaaoaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaahiaacaaffia
ajaaoekaaeaaaaaeaaaaahiaaiaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaahia
akaaoekaacaakkiaaaaaoeiaacaaaaadaaaaahiaaaaaoeiaalaaoekaacaaaaad
aaaaahoaaaaaoeiaadaaoekbafaaaaadaaaaapiaacaaffiaafaaoekaaeaaaaae
aaaaapiaaeaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaacaakkia
aaaaoeiaacaaaaadaaaaapiaaaaaoeiaahaaoekaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcciagaaaa
eaaaabaaikabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaacaaaaaafjaaaaaeegiocaaa
adaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaa
aaaaaaaafpaaaaadfcbabaaaacaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
dcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaa
abaaaaaagiaaaaacaeaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaagafbaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
acaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaaba
pcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaa
aaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaabkaabaaa
aaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaaafaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaaagbcbaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajhcaabaaa
aaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaaaaaaaaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaadaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaa
aaaaaaajhccabaaaabaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahafaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheofaaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
"!!ARBfp1.0
PARAM c[1] = { { 0 } };
MOV result.color, c[0].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
"ps_2_0
dcl t0.xyzw
rcp r0.x, t0.w
mul r0.x, t0.z, r0
mov_pp r0, r0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"ps_4_0
eefiecedcbejcgfjfchfioiockkbgpdagbgpkifoabaaaaaaneaaaaaaadaaaaaa
cmaaaaaagaaaaaaajeaaaaaaejfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
"ps_4_0_level_9_1
eefiecedddomjckbhjkfhaokccgpbcigcfdhmblaabaaaaaadmabaaaaaeaaaaaa
daaaaaaajeaaaaaaneaaaaaaaiabaaaaebgpgodjfmaaaaaafmaaaaaaaaacpppp
diaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaacaaaacpia
aaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaaepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
"!!ARBfp1.0
PARAM c[3] = { program.local[0],
		{ 1, 255, 65025, 16581375 },
		{ 0.99900001, 0.0039215689 } };
TEMP R0;
DP3 R0.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R0.x, R0.x;
RCP R0.x, R0.x;
MUL R0.x, R0, c[0].w;
MIN R0.x, R0, c[2];
MUL R0, R0.x, c[1];
FRC R0, R0;
MAD result.color, -R0.yzww, c[2].y, R0;
END
# 8 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
"ps_2_0
def c1, 0.99900001, 0.00392157, 0, 0
def c2, 1.00000000, 255.00000000, 65025.00000000, 16581375.00000000
dcl t0.xyz
dp3 r0.x, t0, t0
rsq r0.x, r0.x
rcp r0.x, r0.x
mul r0.x, r0, c0.w
min r0.x, r0, c1
mul r0, r0.x, c2
frc r1, r0
mov r0.z, -r1.w
mov r0.xyw, -r1.yzxw
mad r0, r0, c1.y, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
BindCB  "UnityLighting" 0
"ps_4_0
eefiecedckbinngfcaabjchaofnjildpenmjogbcabaaaaaaniabaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbiabaaaa
eaaaaaaaegaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaagcbaaaadhcbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaelaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
aaaaaaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
hhlohpdpdiaaaaakpcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaahpedaaabhoehppachnelbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaanpccabaaaaaaaaaaajgapbaiaebaaaaaaaaaaaaaaaceaaaaaibiaiadl
ibiaiadlibiaiadlibiaiadlegaobaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
BindCB  "UnityLighting" 0
"ps_4_0_level_9_1
eefiecedkcipmapbihhbabemebdmoeffkccjndjkabaaaaaacmadaaaaaeaaaaaa
daaaaaaaiaabaaaakaacaaaapiacaaaaebgpgodjeiabaaaaeiabaaaaaaacpppp
biabaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaabaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaibiaiadlaaaaaaaaaaaaaaaa
aaaaaaaafbaaaaafacaaapkahhlohplpaaljdolpaaaahklpaaaaaaiafbaaaaaf
adaaapkaaaaaiadpaaaahpedaaabhoehppachnelbpaaaaacaaaaaaiaaaaaahla
aiaaaaadaaaaaiiaaaaaoelaaaaaoelaahaaaaacaaaaabiaaaaappiaagaaaaac
aaaaabiaaaaaaaiaafaaaaadaaaaaciaaaaaaaiaaaaappkaabaaaaacabaaaiia
acaaaakaaeaaaaaeaaaaabiaaaaaaaiaaaaappkaabaappiaafaaaaadabaaapia
aaaaffiaadaaoekabdaaaaacabaaapiaabaaoeiafiaaaaaeaaaaapiaaaaaaaia
acaaoekbabaaoeiaaeaaaaaeabaacliaaaaamjiaabaaaakbaaaaoeiaaeaaaaae
abaaceiaaaaappiaabaaaakbaaaakkiaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefcbiabaaaaeaaaaaaaegaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaa
gcbaaaadhcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaelaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaadkiacaaaaaaaaaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaahhlohpdpdiaaaaakpcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaahpedaaabhoehppachnelbkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaanpccabaaaaaaaaaaajgapbaiaebaaaaaaaaaaaaaa
aceaaaaaibiaiadlibiaiadlibiaiadlibiaiadlegaobaaaaaaaaaaadoaaaaab
ejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "SHADOWCOLLECTOR"
  Tags { "LIGHTMODE"="SHADOWCOLLECTOR" "RenderType"="TreeBark" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_Time]
Vector 30 [_Scale]
Vector 31 [_SquashPlaneNormal]
Float 32 [_SquashAmount]
Vector 33 [_Wind]
"!!ARBvp1.0
PARAM c[36] = { { 1, 2, -0.5, 3 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..33],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[28];
ADD R0.x, vertex.color, R0;
MOV R2.w, c[0].x;
MUL R2.xyz, vertex.position, c[30];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[29].y;
MUL R0, R0.xxyy, c[34];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R0.xyz, R3.y, c[33];
MUL R1.xyz, vertex.texcoord[1].y, R0;
MUL R0.w, vertex.color.y, c[35].y;
MUL R0.xz, R0.w, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[35].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[33].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[33], R0;
DP3 R0.x, R1, c[31];
ADD R0.x, R0, c[31].w;
MUL R0.xyz, R0.x, c[31];
ADD R1.xyz, -R0, R1;
MAD R2.xyz, R0, c[32].x, R1;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
END
# 56 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_Time]
Vector 29 [_Scale]
Vector 30 [_SquashPlaneNormal]
Float 31 [_SquashAmount]
Vector 32 [_Wind]
"vs_2_0
def c33, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c34, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c35, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c27
dp3 r0.x, c33.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r2.w, c33.x
mul r2.xyz, v0, c29
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c28.y
mul r0, r0.xxyy, c34
frc r0, r0
mad r0, r0, c33.y, c33.z
frc r0, r0
mad r0, r0, c33.y, c33.w
abs r0, r0
mad r1, -r0, c35.x, c35.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r0.xyz, r3.y, c32
mul r1.xyz, v4.y, r0
mul r0.w, v5.y, c35
mul r0.xz, r0.w, v2
mul r0.y, v4, c35.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c32.w, r2
mad r1.xyz, v4.x, c32, r0
dp3 r0.x, r1, c30
add r0.x, r0, c30.w
mul r0.xyz, r0.x, c30
add r1.xyz, -r0, r1
mad r2.xyz, r0, c31.x, r1
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_Time]
Vector 30 [_Scale]
Vector 31 [_SquashPlaneNormal]
Float 32 [_SquashAmount]
Vector 33 [_Wind]
"!!ARBvp1.0
PARAM c[36] = { { 1, 2, -0.5, 3 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..33],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[28];
ADD R0.x, vertex.color, R0;
MOV R2.w, c[0].x;
MUL R2.xyz, vertex.position, c[30];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[29].y;
MUL R0, R0.xxyy, c[34];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R0.xyz, R3.y, c[33];
MUL R1.xyz, vertex.texcoord[1].y, R0;
MUL R0.w, vertex.color.y, c[35].y;
MUL R0.xz, R0.w, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[35].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[33].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[33], R0;
DP3 R0.x, R1, c[31];
ADD R0.x, R0, c[31].w;
MUL R0.xyz, R0.x, c[31];
ADD R1.xyz, -R0, R1;
MAD R2.xyz, R0, c[32].x, R1;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
END
# 56 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_Time]
Vector 29 [_Scale]
Vector 30 [_SquashPlaneNormal]
Float 31 [_SquashAmount]
Vector 32 [_Wind]
"vs_2_0
def c33, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c34, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c35, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c27
dp3 r0.x, c33.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r2.w, c33.x
mul r2.xyz, v0, c29
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c28.y
mul r0, r0.xxyy, c34
frc r0, r0
mad r0, r0, c33.y, c33.z
frc r0, r0
mad r0, r0, c33.y, c33.w
abs r0, r0
mad r1, -r0, c35.x, c35.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r0.xyz, r3.y, c32
mul r1.xyz, v4.y, r0
mul r0.w, v5.y, c35
mul r0.xz, r0.w, v2
mul r0.y, v4, c35.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c32.w, r2
mad r1.xyz, v4.x, c32, r0
dp3 r0.x, r1, c30
add r0.x, r0, c30.w
mul r0.xyz, r0.x, c30
add r1.xyz, -r0, r1
mad r2.xyz, r0, c31.x, r1
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [_Wind]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedegokfljmmknppnmegbdjpoibgmiipfieabaaaaaaaealaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahafaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcfaajaaaaeaaaabaafeacaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabiaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafjaaaaae
egiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadfcbabaaa
acaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaaddcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacaeaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaa
abaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaa
dcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaa
agbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
apaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaa
ajaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaiaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
akaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaabaaaaaa
egiccaaaacaaaaaaalaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaa
apaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaabdaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaabfaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
beaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaabgaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaacaaaaaabhaaaaaapgapbaaaabaaaaaaegacbaaa
acaaaaaadgaaaaafhccabaaaafaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaackaabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadgaaaaagiccabaaaafaaaaaaakaabaiaebaaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [_Wind]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecednipkokfnjknmdobppgjffllkdpimhbpgabaaaaaafabaaaaaaeaaaaaa
daaaaaaahiafaaaanaaoaaaajiapaaaaebgpgodjeaafaaaaeaafaaaaaaacpopp
meaeaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaiaabaaaadaaaaaaaaaa
adaaaaaaaiaabdaaaaaaaaaaadaaamaaaeaablaaaaaaaaaaaeaaafaaabaabpaa
aaaaaaaaaeaaakaaacaacaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafccaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafcdaaapkaaaaaiadpaaaaaaea
aaaaaalpaaaaialpfbaaaaafceaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdo
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaabaaaaacaaaaabiablaappkaabaaaaac
aaaaaciabmaappkaabaaaaacaaaaaeiabnaappkaaiaaaaadaaaaabiaaaaaoeia
cdaaaakaacaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffia
afaaffjaafaaaaadabaaahiaaaaaoejabpaaoekaaiaaaaadaaaaabiaabaaoeia
aaaakkiaacaaaaadaaaaapiaaaaafaiaacaaffkaafaaaaadaaaaapiaaaaaoeia
ccaaoekabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiacdaaffka
cdaakkkabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiacdaaffka
cdaappkacdaaaaacaaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaaaaaoeia
aeaaaaaeaaaaapiaaaaaoeiaceaaaakbceaaffkaafaaaaadaaaaapiaaaaaoeia
acaaoeiaacaaaaadaaaaadiaaaaaoniaaaaaoiiaafaaaaadacaaahiaaaaaffia
abaaoekaafaaaaadacaaahiaacaaoeiaaeaaffjaafaaaaadadaaaciaaaaaffia
aeaaffjaafaaaaadaaaaaciaafaaffjaceaakkkaafaaaaadadaaafiaaaaaffia
acaaoejaabaaaaacaaaaaeiaceaappkaaeaaaaaeaaaaahiaaaaamiiaadaaoeia
acaaoeiaaeaaaaaeaaaaahiaaaaaoeiaabaappkaabaaoeiaaeaaaaaeaaaaahia
aeaaaajaabaaoekaaaaaoeiaaiaaaaadaaaaaiiacaaaoekaaaaaoeiaacaaaaad
aaaaaiiaaaaappiacaaappkaaeaaaaaeabaaahiaaaaappiacaaaoekbaaaaoeia
bcaaaaaeacaaahiacbaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaabiaacaaffia
biaakkkaaeaaaaaeaaaaabiabhaakkkaacaaaaiaaaaaaaiaaeaaaaaeaaaaabia
bjaakkkaacaakkiaaaaaaaiaacaaaaadaaaaabiaaaaaaaiabkaakkkaabaaaaac
aeaaaioaaaaaaaibafaaaaadaaaaapiaacaaffiabmaaoekaaeaaaaaeaaaaapia
blaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabnaaoekaacaakkiaaaaaoeia
acaaaaadaaaaapiaaaaaoeiaboaaoekaafaaaaadabaaahiaaaaaffiaaeaaoeka
aeaaaaaeabaaahiaadaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaafaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahoaagaaoekaaaaappiaabaaoeiaafaaaaad
abaaahiaaaaaffiaaiaaoekaaeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaahiaajaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahoaakaaoeka
aaaappiaabaaoeiaafaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaaeabaaahia
alaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaanaaoekaaaaakkiaabaaoeia
aeaaaaaeacaaahoaaoaaoekaaaaappiaabaaoeiaafaaaaadabaaahiaaaaaffia
baaaoekaaeaaaaaeabaaahiaapaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahia
bbaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoabcaaoekaaaaappiaabaaoeia
abaaaaacaeaaahoaaaaaoeiaafaaaaadaaaaapiaacaaffiabeaaoekaaeaaaaae
aaaaapiabdaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabfaaoekaacaakkia
aaaaoeiaacaaaaadaaaaapiaaaaaoeiabgaaoekaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcfaajaaaa
eaaaabaafeacaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaafjaaaaaeegiocaaa
adaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaa
aaaaaaaafpaaaaadfcbabaaaacaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
dcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacaeaaaaaadgaaaaag
bcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
dkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaa
aoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaa
afaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaa
afaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaa
diaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldp
aaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialp
aaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaa
egaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaa
aaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaa
diaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaah
ccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
adaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
abeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaal
hcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaajaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaaiaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaakaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhccabaaaabaaaaaaegiccaaaacaaaaaaalaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaacaaaaaaapaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaabdaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabfaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaabeaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabgaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaabhaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaafaaaaaaegacbaaa
abaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaadaaaaaa
afaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
agaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadgaaaaagiccabaaaafaaaaaa
akaabaiaebaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahafaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_Time]
Vector 30 [_Scale]
Vector 31 [_SquashPlaneNormal]
Float 32 [_SquashAmount]
Vector 33 [_Wind]
"!!ARBvp1.0
PARAM c[36] = { { 1, 2, -0.5, 3 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..33],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[28];
ADD R0.x, vertex.color, R0;
MOV R2.w, c[0].x;
MUL R2.xyz, vertex.position, c[30];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[29].y;
MUL R0, R0.xxyy, c[34];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R0.xyz, R3.y, c[33];
MUL R1.xyz, vertex.texcoord[1].y, R0;
MUL R0.w, vertex.color.y, c[35].y;
MUL R0.xz, R0.w, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[35].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[33].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[33], R0;
DP3 R0.x, R1, c[31];
ADD R0.x, R0, c[31].w;
MUL R0.xyz, R0.x, c[31];
ADD R1.xyz, -R0, R1;
MAD R2.xyz, R0, c[32].x, R1;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
END
# 56 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_Time]
Vector 29 [_Scale]
Vector 30 [_SquashPlaneNormal]
Float 31 [_SquashAmount]
Vector 32 [_Wind]
"vs_2_0
def c33, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c34, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c35, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c27
dp3 r0.x, c33.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r2.w, c33.x
mul r2.xyz, v0, c29
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c28.y
mul r0, r0.xxyy, c34
frc r0, r0
mad r0, r0, c33.y, c33.z
frc r0, r0
mad r0, r0, c33.y, c33.w
abs r0, r0
mad r1, -r0, c35.x, c35.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r0.xyz, r3.y, c32
mul r1.xyz, v4.y, r0
mul r0.w, v5.y, c35
mul r0.xz, r0.w, v2
mul r0.y, v4, c35.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c32.w, r2
mad r1.xyz, v4.x, c32, r0
dp3 r0.x, r1, c30
add r0.x, r0, c30.w
mul r0.xyz, r0.x, c30
add r1.xyz, -r0, r1
mad r2.xyz, r0, c31.x, r1
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_Time]
Vector 30 [_Scale]
Vector 31 [_SquashPlaneNormal]
Float 32 [_SquashAmount]
Vector 33 [_Wind]
"!!ARBvp1.0
PARAM c[36] = { { 1, 2, -0.5, 3 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..33],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.x, c[0];
DP3 R0.x, R0.x, c[28];
ADD R0.x, vertex.color, R0;
MOV R2.w, c[0].x;
MUL R2.xyz, vertex.position, c[30];
ADD R0.z, vertex.color.y, R0.x;
MOV R0.y, R0.x;
DP3 R0.x, R2, R0.z;
ADD R0.xy, R0, c[29].y;
MUL R0, R0.xxyy, c[34];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R3.xy, R0.xzzw, R0.ywzw;
MUL R0.xyz, R3.y, c[33];
MUL R1.xyz, vertex.texcoord[1].y, R0;
MUL R0.w, vertex.color.y, c[35].y;
MUL R0.xz, R0.w, vertex.normal;
MUL R0.y, vertex.texcoord[1], c[35].x;
MAD R0.xyz, R3.xyxw, R0, R1;
MAD R0.xyz, R0, c[33].w, R2;
MAD R1.xyz, vertex.texcoord[1].x, c[33], R0;
DP3 R0.x, R1, c[31];
ADD R0.x, R0, c[31].w;
MUL R0.xyz, R0.x, c[31];
ADD R1.xyz, -R0, R1;
MAD R2.xyz, R0, c[32].x, R1;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
END
# 56 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_Time]
Vector 29 [_Scale]
Vector 30 [_SquashPlaneNormal]
Float 31 [_SquashAmount]
Vector 32 [_Wind]
"vs_2_0
def c33, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c34, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c35, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, c27
dp3 r0.x, c33.x, r0
add r0.x, v5, r0
mov r0.y, r0.x
mov r2.w, c33.x
mul r2.xyz, v0, c29
add r0.x, v5.y, r0
dp3 r0.x, r2, r0.x
add r0.xy, r0, c28.y
mul r0, r0.xxyy, c34
frc r0, r0
mad r0, r0, c33.y, c33.z
frc r0, r0
mad r0, r0, c33.y, c33.w
abs r0, r0
mad r1, -r0, c35.x, c35.y
mul r0, r0, r0
mul r0, r0, r1
add r3.xy, r0.xzzw, r0.ywzw
mul r0.xyz, r3.y, c32
mul r1.xyz, v4.y, r0
mul r0.w, v5.y, c35
mul r0.xz, r0.w, v2
mul r0.y, v4, c35.z
mad r0.xyz, r3.xyxw, r0, r1
mad r0.xyz, r0, c32.w, r2
mad r1.xyz, v4.x, c32, r0
dp3 r0.x, r1, c30
add r0.x, r0, c30.w
mul r0.xyz, r0.x, c30
add r1.xyz, -r0, r1
mad r2.xyz, r0, c31.x, r1
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [_Wind]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedegokfljmmknppnmegbdjpoibgmiipfieabaaaaaaaealaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahafaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcfaajaaaaeaaaabaafeacaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabiaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafjaaaaae
egiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadfcbabaaa
acaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaaddcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacaeaaaaaadgaaaaagbcaabaaaaaaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaafaaaaaaaaaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaaafaaaaaadiaaaaaihcaabaaa
abaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaa
agafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaadiaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaa
dcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaadiaaaaahccaabaaaadaaaaaa
bkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaadaaaaaafgafbaaaaaaaaaaa
agbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaaj
hcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagbabaaaaeaaaaaaegiccaaa
aaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaa
aeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaa
egaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaa
apaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaa
ajaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaiaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
akaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaabaaaaaa
egiccaaaacaaaaaaalaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaa
apaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaabdaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaabfaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
beaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaabgaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaacaaaaaabhaaaaaapgapbaaaabaaaaaaegacbaaa
acaaaaaadgaaaaafhccabaaaafaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaackaabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadgaaaaagiccabaaaafaaaaaaakaabaiaebaaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [_Wind]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecednipkokfnjknmdobppgjffllkdpimhbpgabaaaaaafabaaaaaaeaaaaaa
daaaaaaahiafaaaanaaoaaaajiapaaaaebgpgodjeaafaaaaeaafaaaaaaacpopp
meaeaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaiaabaaaadaaaaaaaaaa
adaaaaaaaiaabdaaaaaaaaaaadaaamaaaeaablaaaaaaaaaaaeaaafaaabaabpaa
aaaaaaaaaeaaakaaacaacaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafccaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafcdaaapkaaaaaiadpaaaaaaea
aaaaaalpaaaaialpfbaaaaafceaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdo
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaabaaaaacaaaaabiablaappkaabaaaaac
aaaaaciabmaappkaabaaaaacaaaaaeiabnaappkaaiaaaaadaaaaabiaaaaaoeia
cdaaaakaacaaaaadaaaaaciaaaaaaaiaafaaaajaacaaaaadaaaaaeiaaaaaffia
afaaffjaafaaaaadabaaahiaaaaaoejabpaaoekaaiaaaaadaaaaabiaabaaoeia
aaaakkiaacaaaaadaaaaapiaaaaafaiaacaaffkaafaaaaadaaaaapiaaaaaoeia
ccaaoekabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiacdaaffka
cdaakkkabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiacdaaffka
cdaappkacdaaaaacaaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaaaaaoeia
aeaaaaaeaaaaapiaaaaaoeiaceaaaakbceaaffkaafaaaaadaaaaapiaaaaaoeia
acaaoeiaacaaaaadaaaaadiaaaaaoniaaaaaoiiaafaaaaadacaaahiaaaaaffia
abaaoekaafaaaaadacaaahiaacaaoeiaaeaaffjaafaaaaadadaaaciaaaaaffia
aeaaffjaafaaaaadaaaaaciaafaaffjaceaakkkaafaaaaadadaaafiaaaaaffia
acaaoejaabaaaaacaaaaaeiaceaappkaaeaaaaaeaaaaahiaaaaamiiaadaaoeia
acaaoeiaaeaaaaaeaaaaahiaaaaaoeiaabaappkaabaaoeiaaeaaaaaeaaaaahia
aeaaaajaabaaoekaaaaaoeiaaiaaaaadaaaaaiiacaaaoekaaaaaoeiaacaaaaad
aaaaaiiaaaaappiacaaappkaaeaaaaaeabaaahiaaaaappiacaaaoekbaaaaoeia
bcaaaaaeacaaahiacbaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaabiaacaaffia
biaakkkaaeaaaaaeaaaaabiabhaakkkaacaaaaiaaaaaaaiaaeaaaaaeaaaaabia
bjaakkkaacaakkiaaaaaaaiaacaaaaadaaaaabiaaaaaaaiabkaakkkaabaaaaac
aeaaaioaaaaaaaibafaaaaadaaaaapiaacaaffiabmaaoekaaeaaaaaeaaaaapia
blaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabnaaoekaacaakkiaaaaaoeia
acaaaaadaaaaapiaaaaaoeiaboaaoekaafaaaaadabaaahiaaaaaffiaaeaaoeka
aeaaaaaeabaaahiaadaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaafaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahoaagaaoekaaaaappiaabaaoeiaafaaaaad
abaaahiaaaaaffiaaiaaoekaaeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaahiaajaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahoaakaaoeka
aaaappiaabaaoeiaafaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaaeabaaahia
alaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaanaaoekaaaaakkiaabaaoeia
aeaaaaaeacaaahoaaoaaoekaaaaappiaabaaoeiaafaaaaadabaaahiaaaaaffia
baaaoekaaeaaaaaeabaaahiaapaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahia
bbaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoabcaaoekaaaaappiaabaaoeia
abaaaaacaeaaahoaaaaaoeiaafaaaaadaaaaapiaacaaffiabeaaoekaaeaaaaae
aaaaapiabdaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabfaaoekaacaakkia
aaaaoeiaacaaaaadaaaaapiaaaaaoeiabgaaoekaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcfaajaaaa
eaaaabaafeacaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaafjaaaaaeegiocaaa
adaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaaamaaaaaafpaaaaadhcbabaaa
aaaaaaaafpaaaaadfcbabaaaacaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
dcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacaeaaaaaadgaaaaag
bcaabaaaaaaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
dkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaadkiacaaaadaaaaaa
aoaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akbabaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaabkbabaaa
afaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaa
afaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaipcaabaaaaaaaaaaaagafbaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaa
diaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldp
aaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialp
aaaaialpaaaaialpdiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaaaaaaaaa
egaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaa
aaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgbfbaaaaeaaaaaa
diaaaaahccaabaaaadaaaaaabkaabaaaaaaaaaaabkbabaaaaeaaaaaadiaaaaah
ccaabaaaaaaaaaaabkbabaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
adaaaaaafgafbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
abeaaaaajkjjjjdodcaaaaajhcaabaaaaaaaaaaaigaabaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agbabaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaadcaaaaal
hcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaaalaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipccabaaaaaaaaaaaegaobaaaabaaaaaaegiocaaaadaaaaaaadaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaa
abaaaaaaegiocaaaadaaaaaaapaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaajaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaaiaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaakaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhccabaaaabaaaaaaegiccaaaacaaaaaaalaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaacaaaaaaapaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaabdaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabfaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaabeaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabgaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaabhaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaafaaaaaaegacbaaa
abaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaadaaaaaa
afaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
agaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadgaaaaagiccabaaaafaaaaaa
akaabaiaebaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahafaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapadaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
SLT R1, fragment.texcoord[4].w, c[2];
SGE R0, fragment.texcoord[4].w, c[1];
MUL R0, R0, R1;
MUL R1.xyz, R0.y, fragment.texcoord[1];
MAD R1.xyz, R0.x, fragment.texcoord[0], R1;
MAD R0.xyz, R0.z, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.w, R0;
MAD_SAT R1.y, fragment.texcoord[4].w, c[3].z, c[3].w;
MOV result.color.y, c[4].x;
TEX R0.x, R0, texture[1], 2D;
ADD R0.z, R0.x, -R0;
MOV R0.x, c[4];
CMP R1.x, R0.z, c[3], R0;
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[4].x;
MUL R0.xy, R0.y, c[4];
FRC R0.zw, R0.xyxy;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[4].z, R0.z;
ADD_SAT result.color.x, R1, R1.y;
MOV result.color.zw, R0.xyxy;
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s1
def c4, 1.00000000, 0.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyzw
add r1, t4.w, -c2
add r0, t4.w, -c1
cmp r1, r1, c4.y, c4.x
cmp r0, r0, c4.x, c4.y
mul r0, r0, r1
mul r1.xyz, r0.y, t1
mad r1.xyz, r0.x, t0, r1
mad r0.xyz, r0.z, t2, r1
mad r1.xyz, t3, r0.w, r0
mov r2.x, c3
mov r2.y, c4.z
texld r0, r1, s1
add r0.x, r0, -r1.z
cmp r0.x, r0, c4, r2
mul r1.x, -t4.w, c0.w
add r1.x, r1, c4
mov r2.x, c4
mul r2.xy, r1.x, r2
mad_sat r1.x, t4.w, c3.z, c3.w
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c4.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c4.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[5] = { program.local[0..3],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
SLT R1, fragment.texcoord[4].w, c[2];
SGE R0, fragment.texcoord[4].w, c[1];
MUL R0, R0, R1;
MUL R1.xyz, R0.y, fragment.texcoord[1];
MAD R1.xyz, R0.x, fragment.texcoord[0], R1;
MAD R0.xyz, R0.z, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.w, R0;
MAD_SAT R1.y, fragment.texcoord[4].w, c[3].z, c[3].w;
MOV result.color.y, c[4].x;
TEX R0.x, R0, texture[1], SHADOW2D;
MOV R0.y, c[4].x;
ADD R0.w, R0.y, -c[3].x;
MAD R1.x, R0, R0.w, c[3];
MUL R0.z, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0.z, c[4].x;
MUL R0.xy, R0.y, c[4];
FRC R0.zw, R0.xyxy;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[4].z, R0.z;
ADD_SAT result.color.x, R1, R1.y;
MOV result.color.zw, R0.xyxy;
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s1
def c4, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyzw
add r1, t4.w, -c2
add r0, t4.w, -c1
cmp r1, r1, c4.x, c4.y
cmp r0, r0, c4.y, c4.x
mul r0, r0, r1
mul r1.xyz, r0.y, t1
mad r1.xyz, r0.x, t0, r1
mad r0.xyz, r0.z, t2, r1
mad r0.xyz, t3, r0.w, r0
mul r1.x, -t4.w, c0.w
add r1.x, r1, c4.y
texld r2, r0, s1
mov r0.x, c3
add r0.x, c4.y, -r0
mad r0.x, r2, r0, c3
mul r2.xy, r1.x, c4.yzxw
mad_sat r1.x, t4.w, c3.z, c3.w
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c4.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c4
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_NATIVE" }
SetTexture 0 [_ShadowMapTexture] 2D 0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 96 [_LightSplitsNear]
Vector 112 [_LightSplitsFar]
Vector 384 [_LightShadowData]
BindCB  "UnityPerCamera" 0
BindCB  "UnityShadows" 1
"ps_4_0
eefiecedfoicichoepiaaopfmpilgmkjgoeglgdgabaaaaaageaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceeadaaaa
eaaaaaaanbaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaabjaaaaaafkaiaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadicbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabnaaaaaipcaabaaaaaaaaaaa
pgbpbaaaafaaaaaaegiocaaaabaaaaaaagaaaaaaabaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdbaaaaai
pcaabaaaabaaaaaapgbpbaaaafaaaaaaegiocaaaabaaaaaaahaaaaaaabaaaaak
pcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaaj
hcaabaaaabaaaaaaegbcbaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegbcbaaaadaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaehaaaaalbcaabaaaaaaaaaaaegaabaaaaaaaaaaaaghabaaa
aaaaaaaaaagabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
akiacaiaebaaaaaaabaaaaaabiaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaabiaaaaaa
dccaaaalccaabaaaaaaaaaaadkbabaaaafaaaaaackiacaaaabaaaaaabiaaaaaa
dkiacaaaabaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaiaebaaaaaaafaaaaaa
dkiacaaaaaaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaakdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaaaaaaaaaabkaaaaaf
dcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_NATIVE" }
SetTexture 0 [_ShadowMapTexture] 2D 0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 96 [_LightSplitsNear]
Vector 112 [_LightSplitsFar]
Vector 384 [_LightShadowData]
BindCB  "UnityPerCamera" 0
BindCB  "UnityShadows" 1
"ps_4_0_level_9_1
eefiecedphcelgomhcehbhmgdplfpphjcngdocfgabaaaaaaiiagaaaaafaaaaaa
deaaaaaaeaacaaaaimafaaaajmafaaaafeagaaaaebgpgodjaeacaaaaaeacaaaa
aaacppppliabaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaa
aaaaaaaaaaaaafaaabaaaaaaaaaaaaaaabaaagaaacaaabaaaaaaaaaaabaabiaa
abaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaaaaaaaaaaiadpaaaahped
ibiaiadlbpaaaaacaaaaaaiaaaaaahlabpaaaaacaaaaaaiaabaaahlabpaaaaac
aaaaaaiaacaaahlabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaaiaaeaaapla
bpaaaaacaaaaaajaaaaiapkaacaaaaadaaaaapiaaeaapplaacaaoekbfiaaaaae
aaaaapiaaaaaoeiaaeaaaakaaeaaffkaacaaaaadabaaapiaaeaapplaabaaoekb
fiaaaaaeaaaaapiaabaaoeiaaaaaoeiaaeaaaakaafaaaaadabaaahiaaaaaffia
abaaoelaaeaaaaaeabaaahiaaaaaoelaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
acaaoelaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaadaaoelaaaaappiaaaaaoeia
ecaaaaadaaaacpiaaaaaoeiaaaaioekaabaaaaacaaaaaciaaeaaffkabcaaaaae
abaacbiaaaaaaaiaaaaaffiaadaaaakaaeaaaaaeaaaabbiaaeaapplaadaakkka
adaappkaacaaaaadabaadbiaaaaaaaiaabaaaaiaaeaaaaaeaaaaabiaaeaappla
aaaappkbaaaaffiaafaaaaadaaaaadiaaaaaaaiaaeaamjkabdaaaaacaaaaadia
aaaaoeiaaeaaaaaeabaaceiaaaaaffiaaeaappkbaaaaaaiaabaaaaacabaaciia
aaaaffiaabaaaaacabaaaciaaeaaffkaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefceeadaaaaeaaaaaaanbaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabjaaaaaafkaiaaadaagabaaaaaaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
icbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabnaaaaai
pcaabaaaaaaaaaaapgbpbaaaafaaaaaaegiocaaaabaaaaaaagaaaaaaabaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdbaaaaaipcaabaaaabaaaaaapgbpbaaaafaaaaaaegiocaaaabaaaaaa
ahaaaaaaabaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegbcbaaa
acaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaadaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaehaaaaalbcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaghabaaaaaaaaaaaaagabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaj
ccaabaaaaaaaaaaaakiacaiaebaaaaaaabaaaaaabiaaaaaaabeaaaaaaaaaiadp
dcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaabiaaaaaadccaaaalccaabaaaaaaaaaaadkbabaaaafaaaaaackiacaaa
abaaaaaabiaaaaaadkiacaaaabaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaia
ebaaaaaaafaaaaaadkiacaaaaaaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaak
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaa
aaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaabfdegejdaaiaaaaaaiaaaaaaaaaaaaaaaejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
ADD R0.xyz, fragment.texcoord[4], -c[1];
ADD R2.xyz, fragment.texcoord[4], -c[4];
DP3 R0.x, R0, R0;
ADD R1.xyz, fragment.texcoord[4], -c[2];
DP3 R0.y, R1, R1;
ADD R1.xyz, fragment.texcoord[4], -c[3];
DP3 R0.w, R2, R2;
DP3 R0.z, R1, R1;
SLT R2, R0, c[5];
ADD_SAT R0.xyz, R2.yzww, -R2;
MUL R1.xyz, R0.x, fragment.texcoord[1];
MAD R1.xyz, R2.x, fragment.texcoord[0], R1;
MAD R1.xyz, R0.y, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.z, R1;
ADD R1.xyz, -fragment.texcoord[4], c[7];
MOV result.color.y, c[8].x;
TEX R0.x, R0, texture[1], 2D;
ADD R0.y, R0.x, -R0.z;
DP3 R0.z, R1, R1;
RSQ R0.z, R0.z;
MOV R0.x, c[8];
CMP R0.x, R0.y, c[6], R0;
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[8].x;
RCP R1.x, R0.z;
MUL R0.zw, R0.y, c[8].xyxy;
MAD_SAT R0.y, R1.x, c[6].z, c[6].w;
FRC R0.zw, R0;
ADD_SAT result.color.x, R0, R0.y;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[8].z, R0.z;
MOV result.color.zw, R0.xyxy;
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s1
def c8, 1.00000000, 255.00000000, 0.00392157, 0.00000000
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
add r0.xyz, t4, -c1
add r2.xyz, t4, -c4
dp3 r0.x, r0, r0
add r1.xyz, t4, -c2
dp3 r0.y, r1, r1
add r1.xyz, t4, -c3
dp3 r0.z, r1, r1
dp3 r0.w, r2, r2
add r0, r0, -c5
cmp r0, r0, c8.w, c8.x
mov r1.x, r0.y
mov r1.z, r0.w
mov r1.y, r0.z
add_sat r1.xyz, r1, -r0
mul r2.xyz, r1.x, t1
mad r0.xyz, r0.x, t0, r2
mad r0.xyz, r1.y, t2, r0
mad r1.xyz, t3, r1.z, r0
add r2.xyz, -t4, c7
texld r0, r1, s1
mov r1.x, c6
add r0.x, r0, -r1.z
cmp r0.x, r0, c8, r1
dp3 r1.x, r2, r2
mul r2.x, -t4.w, c0.w
rsq r1.x, r1.x
add r2.x, r2, c8
rcp r1.x, r1.x
mad_sat r1.x, r1, c6.z, c6.w
mul r2.xy, r2.x, c8
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c8.z, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c8.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[9] = { program.local[0..7],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
ADD R0.xyz, fragment.texcoord[4], -c[1];
ADD R2.xyz, fragment.texcoord[4], -c[4];
DP3 R0.x, R0, R0;
ADD R1.xyz, fragment.texcoord[4], -c[2];
DP3 R0.y, R1, R1;
ADD R1.xyz, fragment.texcoord[4], -c[3];
DP3 R0.w, R2, R2;
DP3 R0.z, R1, R1;
SLT R2, R0, c[5];
ADD_SAT R0.xyz, R2.yzww, -R2;
MUL R1.xyz, R0.x, fragment.texcoord[1];
MAD R1.xyz, R2.x, fragment.texcoord[0], R1;
MAD R1.xyz, R0.y, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.z, R1;
ADD R1.xyz, -fragment.texcoord[4], c[7];
MOV result.color.y, c[8].x;
TEX R0.x, R0, texture[1], SHADOW2D;
DP3 R0.z, R1, R1;
RSQ R0.z, R0.z;
MOV R0.y, c[8].x;
ADD R0.y, R0, -c[6].x;
MAD R0.x, R0, R0.y, c[6];
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[8].x;
RCP R1.x, R0.z;
MUL R0.zw, R0.y, c[8].xyxy;
MAD_SAT R0.y, R1.x, c[6].z, c[6].w;
FRC R0.zw, R0;
ADD_SAT result.color.x, R0, R0.y;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[8].z, R0.z;
MOV result.color.zw, R0.xyxy;
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s1
def c8, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
add r0.xyz, t4, -c1
add r2.xyz, t4, -c4
dp3 r0.x, r0, r0
add r1.xyz, t4, -c2
dp3 r0.y, r1, r1
add r1.xyz, t4, -c3
dp3 r0.z, r1, r1
dp3 r0.w, r2, r2
add r0, r0, -c5
cmp r0, r0, c8.x, c8.y
mov r1.x, r0.y
mov r1.z, r0.w
mov r1.y, r0.z
add_sat r1.xyz, r1, -r0
mul r2.xyz, r1.x, t1
mad r0.xyz, r0.x, t0, r2
mad r0.xyz, r1.y, t2, r0
mad r0.xyz, t3, r1.z, r0
add r1.xyz, -t4, c7
dp3 r1.x, r1, r1
rsq r1.x, r1.x
rcp r1.x, r1.x
mad_sat r1.x, r1, c6.z, c6.w
texld r2, r0, s1
mov r0.x, c6
add r0.x, c8.y, -r0
mad r0.x, r2, r0, c6
mul r2.x, -t4.w, c0.w
add r2.x, r2, c8.y
mul r2.xy, r2.x, c8.yzxw
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c8.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c8
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
SetTexture 0 [_ShadowMapTexture] 2D 0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 0 [unity_ShadowSplitSpheres0]
Vector 16 [unity_ShadowSplitSpheres1]
Vector 32 [unity_ShadowSplitSpheres2]
Vector 48 [unity_ShadowSplitSpheres3]
Vector 64 [unity_ShadowSplitSqRadii]
Vector 384 [_LightShadowData]
Vector 400 [unity_ShadowFadeCenterAndType]
BindCB  "UnityPerCamera" 0
BindCB  "UnityShadows" 1
"ps_4_0
eefiecedehfdffddekigboeafomdgidfgeolncnbabaaaaaaneafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcleaeaaaa
eaaaaaaacnabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaabkaaaaaafkaiaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaafaaaaaaegiccaiaebaaaaaaabaaaaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaaaafaaaaaaegiccaiaebaaaaaaabaaaaaaabaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaaaafaaaaaaegiccaiaebaaaaaaabaaaaaaacaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaaaafaaaaaaegiccaiaebaaaaaaabaaaaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadbaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaabaaaaaaaeaaaaaadhaaaaaphcaabaaaabaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaaaaaaceaaaaa
aaaaaaiaaaaaaaiaaaaaaaiaaaaaaaaaabaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaaaaaaahocaabaaa
aaaaaaaaagajbaaaabaaaaaafgaobaaaaaaaaaaadeaaaaakocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaajhcaabaaa
abaaaaaaegbcbaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegbcbaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaehaaaaalbcaabaaaaaaaaaaaegaabaaaaaaaaaaaaghabaaaaaaaaaaa
aagabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaaakiacaia
ebaaaaaaabaaaaaabiaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaabiaaaaaaaaaaaaaj
ocaabaaaaaaaaaaaagbjbaaaafaaaaaaagijcaiaebaaaaaaabaaaaaabjaaaaaa
baaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaelaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaalccaabaaaaaaaaaaabkaabaaa
aaaaaaaackiacaaaabaaaaaabiaaaaaadkiacaaaabaaaaaabiaaaaaaaacaaaah
bccabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaa
aaaaaaaadkbabaiaebaaaaaaafaaaaaadkiacaaaaaaaaaaaafaaaaaaabeaaaaa
aaaaiadpdiaaaaakdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaahpedaaaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
dcaaaaakeccabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaibiaiadl
akaabaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadgaaaaaf
cccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
SetTexture 0 [_ShadowMapTexture] 2D 0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 0 [unity_ShadowSplitSpheres0]
Vector 16 [unity_ShadowSplitSpheres1]
Vector 32 [unity_ShadowSplitSpheres2]
Vector 48 [unity_ShadowSplitSpheres3]
Vector 64 [unity_ShadowSplitSqRadii]
Vector 384 [_LightShadowData]
Vector 400 [unity_ShadowFadeCenterAndType]
BindCB  "UnityPerCamera" 0
BindCB  "UnityShadows" 1
"ps_4_0_level_9_1
eefiecedbckpeppobchebmfojmjlodjhcjbkfdcbabaaaaaaoiaiaaaaafaaaaaa
deaaaaaadaadaaaaomahaaaapmahaaaaleaiaaaaebgpgodjpeacaaaapeacaaaa
aaacppppkiacaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaa
aaaaaaaaaaaaafaaabaaaaaaaaaaaaaaabaaaaaaafaaabaaaaaaaaaaabaabiaa
acaaagaaaaaaaaaaaaacppppfbaaaaafaiaaapkaaaaaaaaaaaaaiadpaaaaaaia
aaaaialpfbaaaaafajaaapkaaaaaiadpaaaahpedibiaiadlaaaaaaaabpaaaaac
aaaaaaiaaaaaahlabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaaahla
bpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaaja
aaaiapkaacaaaaadaaaaahiaaeaaoelaabaaoekbaiaaaaadaaaaabiaaaaaoeia
aaaaoeiaacaaaaadabaaahiaaeaaoelaacaaoekbaiaaaaadaaaaaciaabaaoeia
abaaoeiaacaaaaadabaaahiaaeaaoelaadaaoekbaiaaaaadaaaaaeiaabaaoeia
abaaoeiaacaaaaadabaaahiaaeaaoelaaeaaoekbaiaaaaadaaaaaiiaabaaoeia
abaaoeiaacaaaaadaaaaapiaaaaaoeiaafaaoekbfiaaaaaeabaaahiaaaaaoeia
aiaakkkaaiaappkafiaaaaaeaaaaapiaaaaaoeiaaiaaaakaaiaaffkaacaaaaad
acaaadiaabaaoeiaaaaamjiaacaaaaadacaaaeiaabaakkiaaaaappiaalaaaaad
aaaaaoiaacaabliaaiaaaakaafaaaaadabaaahiaaaaappiaabaaoelaaeaaaaae
abaaahiaaaaaoelaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaacaaoelaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaadaaoelaaaaaffiaabaaoeiaecaaaaadaaaacpia
aaaaoeiaaaaioekaabaaaaacaaaaaciaaiaaffkabcaaaaaeabaacbiaaaaaaaia
aaaaffiaagaaaakaacaaaaadacaaahiaaeaaoelaahaaoekbaiaaaaadaaaaabia
acaaoeiaacaaoeiaahaaaaacaaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaia
aeaaaaaeaaaabbiaaaaaaaiaagaakkkaagaappkaacaaaaadabaadbiaaaaaaaia
abaaaaiaaeaaaaaeaaaaabiaaeaapplaaaaappkbaaaaffiaafaaaaadaaaaadia
aaaaaaiaajaaoekabdaaaaacaaaaadiaaaaaoeiaaeaaaaaeabaaceiaaaaaffia
ajaakkkbaaaaaaiaabaaaaacabaaciiaaaaaffiaabaaaaacabaaaciaaiaaffka
abaaaaacaaaicpiaabaaoeiappppaaaafdeieefcleaeaaaaeaaaaaaacnabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabkaaaaaa
fkaiaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
hcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaafaaaaaa
egiccaiaebaaaaaaabaaaaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaa
egiccaiaebaaaaaaabaaaaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaa
egiccaiaebaaaaaaabaaaaaaacaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaa
egiccaiaebaaaaaaabaaaaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaadbaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egiocaaaabaaaaaaaeaaaaaadhaaaaaphcaabaaaabaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaialpaaaaaaaaaceaaaaaaaaaaaiaaaaaaaia
aaaaaaiaaaaaaaaaabaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaaaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaafgaobaaaaaaaaaaadeaaaaakocaabaaaaaaaaaaafgaobaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaa
egbcbaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaa
aaaaaaaaegbcbaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaehaaaaal
bcaabaaaaaaaaaaaegaabaaaaaaaaaaaaghabaaaaaaaaaaaaagabaaaaaaaaaaa
ckaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaaakiacaiaebaaaaaaabaaaaaa
biaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaabiaaaaaaaaaaaaajocaabaaaaaaaaaaa
agbjbaaaafaaaaaaagijcaiaebaaaaaaabaaaaaabjaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaelaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadccaaaalccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaa
abaaaaaabiaaaaaadkiacaaaabaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaia
ebaaaaaaafaaaaaadkiacaaaaaaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaak
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaa
aaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaabfdegejdaaiaaaaaaiaaaaaaaaaaaaaaaejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
}
Dependency "OptimizedShader" = "Hidden/Nature/Tree Creator Bark Optimized"
Fallback "Diffuse"
}