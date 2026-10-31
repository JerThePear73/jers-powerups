Lights1 jers_powerups_fireflower_Flower_Stem_lights = gdSPDefLights1(
	0x0, 0x3D, 0x0,
	0x0, 0x80, 0x0, 0x28, 0x28, 0x28);

Lights1 jers_powerups_fireflower_Flower_Leaf_lights = gdSPDefLights1(
	0x0, 0x3D, 0x0,
	0x0, 0x80, 0x0, 0x28, 0x28, 0x28);

Lights1 jers_powerups_fireflower_Fire_Flower_lights = gdSPDefLights1(
	0x7F, 0x7F, 0x7F,
	0xFF, 0xFF, 0xFF, 0x28, 0x28, 0x28);

Lights1 jers_powerups_fireflower_Fire_Flower_Back_lights = gdSPDefLights1(
	0x7F, 0x28, 0x0,
	0xFF, 0x59, 0x0, 0x28, 0x28, 0x28);

Gfx jers_powerups_fireflower_flower_leaves_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_fireflower_flower_leaves_rgba16[] = {
	#include "actors/jers_powerups_fireflower/flower_leaves.rgba16.inc.c"
};

Gfx jers_powerups_fireflower_flower_fire_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_fireflower_flower_fire_rgba16[] = {
	#include "actors/jers_powerups_fireflower/flower_fire.rgba16.inc.c"
};

Gfx jers_powerups_fireflower_star_eye_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_fireflower_star_eye_rgba16[] = {
	#include "actors/jers_powerups_fireflower/star_eye.rgba16.inc.c"
};

Vtx jers_powerups_fireflower_Base_mesh_layer_1_vtx_0[5] = {
	{{ {15, 0, 0}, 0, {112, 368}, {118, 210, 253, 255} }},
	{{ {-12, 0, 0}, 0, {368, 368}, {140, 206, 9, 255} }},
	{{ {2, 0, -14}, 0, {240, 496}, {17, 96, 175, 255} }},
	{{ {2, 0, 14}, 0, {624, 752}, {28, 145, 55, 255} }},
	{{ {15, 0, 0}, 0, {624, 880}, {118, 210, 253, 255} }},
};

Gfx jers_powerups_fireflower_Base_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_powerups_fireflower_Base_mesh_layer_1_vtx_0 + 0, 5, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 1, 4, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_fireflower_Leaves_mesh_layer_4_vtx_0[20] = {
	{{ {-30, 12, 57}, 0, {359, -49}, {232, 120, 221, 255} }},
	{{ {-6, 17, 57}, 0, {28, -49}, {232, 120, 221, 255} }},
	{{ {-3, 11, 35}, 0, {28, 449}, {224, 113, 208, 255} }},
	{{ {-27, 6, 35}, 0, {359, 449}, {225, 114, 210, 255} }},
	{{ {5, -2, 0}, 0, {28, 1240}, {212, 119, 255, 255} }},
	{{ {-16, -13, 0}, 0, {359, 1240}, {211, 119, 1, 255} }},
	{{ {-3, 11, -35}, 0, {28, 449}, {223, 113, 47, 255} }},
	{{ {-27, 6, -35}, 0, {359, 449}, {224, 114, 47, 255} }},
	{{ {-6, 17, -57}, 0, {28, -49}, {232, 120, 35, 255} }},
	{{ {-30, 12, -57}, 0, {359, -49}, {232, 120, 35, 255} }},
	{{ {-6, 17, 57}, 0, {28, -49}, {164, 80, 221, 255} }},
	{{ {10, 35, 57}, 0, {359, -49}, {164, 80, 221, 255} }},
	{{ {14, 29, 35}, 0, {359, 449}, {173, 84, 210, 255} }},
	{{ {-3, 11, 35}, 0, {28, 449}, {174, 84, 208, 255} }},
	{{ {25, 10, 0}, 0, {359, 1240}, {176, 98, 255, 255} }},
	{{ {5, -2, 0}, 0, {28, 1240}, {175, 98, 1, 255} }},
	{{ {14, 29, -35}, 0, {359, 449}, {174, 85, 47, 255} }},
	{{ {-3, 11, -35}, 0, {28, 449}, {175, 85, 48, 255} }},
	{{ {10, 35, -57}, 0, {359, -49}, {164, 80, 35, 255} }},
	{{ {-6, 17, -57}, 0, {28, -49}, {164, 80, 35, 255} }},
};

Gfx jers_powerups_fireflower_Leaves_mesh_layer_4_tri_0[] = {
	gsSPVertex(jers_powerups_fireflower_Leaves_mesh_layer_4_vtx_0 + 0, 20, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(3, 2, 4, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 5, 4, 0, 6, 7, 5, 0),
	gsSP2Triangles(8, 7, 6, 0, 8, 9, 7, 0),
	gsSP2Triangles(10, 11, 12, 0, 10, 12, 13, 0),
	gsSP2Triangles(13, 12, 14, 0, 13, 14, 15, 0),
	gsSP2Triangles(16, 15, 14, 0, 16, 17, 15, 0),
	gsSP2Triangles(18, 17, 16, 0, 18, 19, 17, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_fireflower_Stem_skinned_mesh_layer_1_vtx_0[6] = {
	{{ {2, 0, 14}, 0, {624, 752}, {28, 145, 55, 255} }},
	{{ {15, 0, 0}, 0, {624, 880}, {118, 210, 253, 255} }},
	{{ {2, 0, -14}, 0, {624, 752}, {17, 96, 175, 255} }},
	{{ {-12, 0, 0}, 0, {624, 368}, {140, 206, 9, 255} }},
	{{ {2, 0, 14}, 0, {624, 496}, {28, 145, 55, 255} }},
	{{ {2, 0, -14}, 0, {624, 496}, {17, 96, 175, 255} }},
};

Gfx jers_powerups_fireflower_Stem_skinned_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_powerups_fireflower_Stem_skinned_mesh_layer_1_vtx_0 + 0, 6, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_fireflower_Stem_mesh_layer_1_vtx_0[6] = {
	{{ {2, 10, 6}, 0, {624, 496}, {186, 25, 103, 255} }},
	{{ {-4, 10, 0}, 0, {624, 368}, {135, 39, 255, 255} }},
	{{ {2, 10, -6}, 0, {624, 496}, {70, 20, 152, 255} }},
	{{ {8, 10, 0}, 0, {624, 880}, {121, 39, 255, 255} }},
	{{ {2, 10, -6}, 0, {624, 752}, {70, 20, 152, 255} }},
	{{ {2, 10, 6}, 0, {624, 752}, {186, 25, 103, 255} }},
};

Gfx jers_powerups_fireflower_Stem_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_powerups_fireflower_Stem_mesh_layer_1_vtx_0 + 0, 6, 6),
	gsSP2Triangles(3, 4, 6, 0, 3, 6, 7, 0),
	gsSP2Triangles(3, 7, 8, 0, 3, 8, 5, 0),
	gsSP2Triangles(0, 1, 9, 0, 2, 9, 1, 0),
	gsSP2Triangles(2, 10, 9, 0, 0, 9, 11, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_fireflower_Stem_mesh_layer_1_vtx_1[10] = {
	{{ {2, 10, 6}, 0, {624, 752}, {186, 25, 103, 255} }},
	{{ {8, 10, 0}, 0, {624, 880}, {121, 39, 255, 255} }},
	{{ {2, 40, 0}, 0, {624, 752}, {180, 159, 30, 255} }},
	{{ {2, 10, -6}, 0, {624, 752}, {70, 20, 152, 255} }},
	{{ {2, 40, 0}, 0, {624, 880}, {180, 159, 30, 255} }},
	{{ {-4, 10, 0}, 0, {624, 368}, {135, 39, 255, 255} }},
	{{ {2, 10, 6}, 0, {624, 496}, {186, 25, 103, 255} }},
	{{ {2, 40, 0}, 0, {624, 368}, {180, 159, 30, 255} }},
	{{ {2, 40, 0}, 0, {624, 496}, {180, 159, 30, 255} }},
	{{ {2, 10, -6}, 0, {624, 496}, {70, 20, 152, 255} }},
};

Gfx jers_powerups_fireflower_Stem_mesh_layer_1_tri_1[] = {
	gsSPVertex(jers_powerups_fireflower_Stem_mesh_layer_1_vtx_1 + 0, 10, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 1, 0),
	gsSP2Triangles(5, 6, 7, 0, 5, 8, 9, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_fireflower_Head_mesh_layer_4_vtx_0[4] = {
	{{ {-34, -13, -45}, 0, {-1040, 2032}, {143, 58, 0, 255} }},
	{{ {-34, -13, 45}, 0, {1008, 2032}, {143, 58, 0, 255} }},
	{{ {-3, 47, 45}, 0, {1008, -16}, {143, 58, 0, 255} }},
	{{ {-3, 47, -45}, 0, {-1040, -16}, {143, 58, 0, 255} }},
};

Gfx jers_powerups_fireflower_Head_mesh_layer_4_tri_0[] = {
	gsSPVertex(jers_powerups_fireflower_Head_mesh_layer_4_vtx_0 + 0, 4, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_fireflower_Head_mesh_layer_4_vtx_1[4] = {
	{{ {-33, -13, -45}, 0, {-1040, 2032}, {113, 198, 0, 255} }},
	{{ {-2, 47, -45}, 0, {-1040, -16}, {113, 198, 0, 255} }},
	{{ {-2, 47, 45}, 0, {1008, -16}, {113, 198, 0, 255} }},
	{{ {-33, -13, 45}, 0, {1008, 2032}, {113, 198, 0, 255} }},
};

Gfx jers_powerups_fireflower_Head_mesh_layer_4_tri_1[] = {
	gsSPVertex(jers_powerups_fireflower_Head_mesh_layer_4_vtx_1 + 0, 4, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_fireflower_Head_mesh_layer_5_vtx_0[8] = {
	{{ {-28, 8, -17}, 0, {-42, 1008}, {143, 58, 0, 255} }},
	{{ {-28, 8, 0}, 0, {1034, 1008}, {143, 58, 0, 255} }},
	{{ {-16, 31, 0}, 0, {1034, -16}, {143, 58, 0, 255} }},
	{{ {-16, 31, -17}, 0, {-42, -16}, {143, 58, 0, 255} }},
	{{ {-28, 8, 0}, 0, {-42, 1008}, {143, 58, 0, 255} }},
	{{ {-28, 8, 17}, 0, {1034, 1008}, {143, 58, 0, 255} }},
	{{ {-16, 31, 17}, 0, {1034, -16}, {143, 58, 0, 255} }},
	{{ {-16, 31, 0}, 0, {-42, -16}, {143, 58, 0, 255} }},
};

Gfx jers_powerups_fireflower_Head_mesh_layer_5_tri_0[] = {
	gsSPVertex(jers_powerups_fireflower_Head_mesh_layer_5_vtx_0 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 6, 7, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jers_powerups_fireflower_Flower_Stem[] = {
	gsSPSetLights1(jers_powerups_fireflower_Flower_Stem_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_fireflower_Flower_Leaf[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsSPSetLights1(jers_powerups_fireflower_Flower_Leaf_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_fireflower_flower_leaves_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 511, 512),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, 0),
	gsDPSetTileSize(0, 0, 0, 60, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_fireflower_Flower_Leaf[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_fireflower_Fire_Flower[] = {
	gsSPSetLights1(jers_powerups_fireflower_Fire_Flower_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_fireflower_flower_fire_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 2047, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_MIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 252),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_fireflower_Fire_Flower_Back[] = {
	gsSPSetLights1(jers_powerups_fireflower_Fire_Flower_Back_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(1, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0, 1, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_fireflower_flower_fire_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 2047, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_MIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 252),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_fireflower_Eyes[] = {
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_fireflower_star_eye_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_fireflower_Base_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_powerups_fireflower_Flower_Stem),
	gsSPDisplayList(jers_powerups_fireflower_Base_mesh_layer_1_tri_0),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_fireflower_Leaves_mesh_layer_4[] = {
	gsSPDisplayList(mat_jers_powerups_fireflower_Flower_Leaf),
	gsSPDisplayList(jers_powerups_fireflower_Leaves_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_powerups_fireflower_Flower_Leaf),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_fireflower_Stem_skinned_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_powerups_fireflower_Flower_Stem),
	gsSPDisplayList(jers_powerups_fireflower_Stem_skinned_mesh_layer_1_tri_0),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_fireflower_Stem_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_powerups_fireflower_Flower_Stem),
	gsSPDisplayList(jers_powerups_fireflower_Stem_mesh_layer_1_tri_0),
	gsSPDisplayList(jers_powerups_fireflower_Stem_mesh_layer_1_tri_1),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_fireflower_Head_mesh_layer_4[] = {
	gsSPDisplayList(mat_jers_powerups_fireflower_Fire_Flower),
	gsSPDisplayList(jers_powerups_fireflower_Head_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_jers_powerups_fireflower_Fire_Flower_Back),
	gsSPDisplayList(jers_powerups_fireflower_Head_mesh_layer_4_tri_1),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_fireflower_Head_mesh_layer_5[] = {
	gsSPDisplayList(mat_jers_powerups_fireflower_Eyes),
	gsSPDisplayList(jers_powerups_fireflower_Head_mesh_layer_5_tri_0),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

