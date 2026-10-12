Lights1 jers_powerups_iceflower_Flower_Stem_lights = gdSPDefLights1(
	0x0, 0x3D, 0x0,
	0x0, 0x80, 0x0, 0x28, 0x28, 0x28);

Lights1 jers_powerups_iceflower_Flower_Leaf_lights = gdSPDefLights1(
	0x0, 0x3D, 0x0,
	0x0, 0x80, 0x0, 0x28, 0x28, 0x28);

Lights1 jers_powerups_iceflower_Ice_Flower_lights = gdSPDefLights1(
	0x7F, 0x7F, 0x7F,
	0xFF, 0xFF, 0xFF, 0x28, 0x28, 0x28);

Gfx jers_powerups_iceflower_flower_leaves_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_iceflower_flower_leaves_rgba16[] = {
	#include "actors/jers_powerups_iceflower/flower_leaves.rgba16.inc.c"
};

Gfx jers_powerups_iceflower_flower_ice_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_iceflower_flower_ice_rgba16[] = {
	#include "actors/jers_powerups_iceflower/flower_ice.rgba16.inc.c"
};

Gfx jers_powerups_iceflower_star_eye_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_iceflower_star_eye_rgba16[] = {
	#include "actors/jers_powerups_iceflower/star_eye.rgba16.inc.c"
};

Vtx jers_powerups_iceflower_Ice_Flower_mesh_layer_1_vtx_0[19] = {
	{{ {0, 0, -15}, 0, {112, 368}, {253, 210, 138, 255} }},
	{{ {0, 0, 12}, 0, {368, 368}, {9, 206, 116, 255} }},
	{{ {-14, 0, -2}, 0, {240, 496}, {175, 96, 239, 255} }},
	{{ {14, 0, -2}, 0, {624, 752}, {55, 145, 228, 255} }},
	{{ {0, 0, -15}, 0, {624, 880}, {253, 210, 138, 255} }},
	{{ {0, 21, -8}, 0, {624, 880}, {255, 37, 135, 255} }},
	{{ {-14, 0, -2}, 0, {624, 752}, {175, 96, 239, 255} }},
	{{ {-6, 21, -2}, 0, {624, 752}, {152, 19, 186, 255} }},
	{{ {0, 55, -2}, 0, {624, 880}, {29, 157, 74, 255} }},
	{{ {6, 21, -2}, 0, {624, 752}, {103, 24, 70, 255} }},
	{{ {0, 55, -2}, 0, {624, 752}, {29, 157, 74, 255} }},
	{{ {0, 0, 12}, 0, {624, 368}, {9, 206, 116, 255} }},
	{{ {14, 0, -2}, 0, {624, 496}, {55, 145, 228, 255} }},
	{{ {6, 21, -2}, 0, {624, 496}, {103, 24, 70, 255} }},
	{{ {0, 21, 4}, 0, {624, 368}, {255, 37, 121, 255} }},
	{{ {0, 55, -2}, 0, {624, 368}, {29, 157, 74, 255} }},
	{{ {-6, 21, -2}, 0, {624, 496}, {152, 19, 186, 255} }},
	{{ {0, 55, -2}, 0, {624, 496}, {29, 157, 74, 255} }},
	{{ {-14, 0, -2}, 0, {624, 496}, {175, 96, 239, 255} }},
};

Gfx jers_powerups_iceflower_Ice_Flower_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_powerups_iceflower_Ice_Flower_mesh_layer_1_vtx_0 + 0, 19, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 1, 4, 0),
	gsSP2Triangles(3, 4, 5, 0, 6, 5, 4, 0),
	gsSP2Triangles(6, 7, 5, 0, 7, 8, 5, 0),
	gsSP2Triangles(3, 5, 9, 0, 9, 5, 10, 0),
	gsSP2Triangles(11, 12, 13, 0, 11, 13, 14, 0),
	gsSP2Triangles(14, 13, 15, 0, 11, 14, 16, 0),
	gsSP2Triangles(14, 17, 16, 0, 11, 16, 18, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_iceflower_Ice_Flower_mesh_layer_4_vtx_0[15] = {
	{{ {57, 30, 0}, 0, {6, -32}, {219, 121, 0, 255} }},
	{{ {57, 30, -23}, 0, {171, -32}, {219, 121, 0, 255} }},
	{{ {35, 23, -23}, 0, {171, 216}, {203, 115, 0, 255} }},
	{{ {35, 23, 0}, 0, {6, 216}, {203, 115, 0, 255} }},
	{{ {0, 1, -23}, 0, {171, 612}, {255, 127, 255, 255} }},
	{{ {0, 1, 0}, 0, {6, 612}, {1, 127, 0, 255} }},
	{{ {-35, 23, -23}, 0, {171, 216}, {54, 115, 255, 255} }},
	{{ {-35, 23, 0}, 0, {6, 216}, {54, 115, 0, 255} }},
	{{ {-57, 30, -23}, 0, {171, -32}, {37, 121, 0, 255} }},
	{{ {-57, 30, 0}, 0, {6, -32}, {37, 121, 0, 255} }},
	{{ {-35, 23, 23}, 0, {171, 216}, {54, 115, 1, 255} }},
	{{ {-57, 30, 23}, 0, {171, -32}, {37, 121, 0, 255} }},
	{{ {0, 1, 23}, 0, {171, 612}, {1, 127, 1, 255} }},
	{{ {35, 23, 23}, 0, {171, 216}, {203, 115, 0, 255} }},
	{{ {57, 30, 23}, 0, {171, -32}, {219, 121, 0, 255} }},
};

Gfx jers_powerups_iceflower_Ice_Flower_mesh_layer_4_tri_0[] = {
	gsSPVertex(jers_powerups_iceflower_Ice_Flower_mesh_layer_4_vtx_0 + 0, 15, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(3, 2, 4, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 5, 4, 0, 6, 7, 5, 0),
	gsSP2Triangles(8, 7, 6, 0, 8, 9, 7, 0),
	gsSP2Triangles(9, 10, 7, 0, 9, 11, 10, 0),
	gsSP2Triangles(7, 10, 12, 0, 7, 12, 5, 0),
	gsSP2Triangles(13, 5, 12, 0, 13, 3, 5, 0),
	gsSP2Triangles(14, 3, 13, 0, 14, 0, 3, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_iceflower_Ice_Flower_mesh_layer_4_vtx_1[4] = {
	{{ {-45, 27, 14}, 0, {-1040, 2032}, {0, 58, 113, 255} }},
	{{ {45, 27, 14}, 0, {1008, 2032}, {0, 58, 113, 255} }},
	{{ {45, 87, -17}, 0, {1008, -16}, {0, 58, 113, 255} }},
	{{ {-45, 87, -17}, 0, {-1040, -16}, {0, 58, 113, 255} }},
};

Gfx jers_powerups_iceflower_Ice_Flower_mesh_layer_4_tri_1[] = {
	gsSPVertex(jers_powerups_iceflower_Ice_Flower_mesh_layer_4_vtx_1 + 0, 4, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_iceflower_Ice_Flower_mesh_layer_5_vtx_0[8] = {
	{{ {-17, 49, 8}, 0, {-42, 1008}, {0, 58, 113, 255} }},
	{{ {0, 49, 8}, 0, {1034, 1008}, {0, 58, 113, 255} }},
	{{ {0, 71, -4}, 0, {1034, -16}, {0, 58, 113, 255} }},
	{{ {-17, 71, -4}, 0, {-42, -16}, {0, 58, 113, 255} }},
	{{ {0, 49, 8}, 0, {-42, 1008}, {0, 58, 113, 255} }},
	{{ {17, 49, 8}, 0, {1034, 1008}, {0, 58, 113, 255} }},
	{{ {17, 71, -4}, 0, {1034, -16}, {0, 58, 113, 255} }},
	{{ {0, 71, -4}, 0, {-42, -16}, {0, 58, 113, 255} }},
};

Gfx jers_powerups_iceflower_Ice_Flower_mesh_layer_5_tri_0[] = {
	gsSPVertex(jers_powerups_iceflower_Ice_Flower_mesh_layer_5_vtx_0 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 6, 7, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jers_powerups_iceflower_Flower_Stem[] = {
	gsSPSetLights1(jers_powerups_iceflower_Flower_Stem_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_iceflower_Flower_Leaf[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsSPSetLights1(jers_powerups_iceflower_Flower_Leaf_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_iceflower_flower_leaves_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 127, 1024),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 2, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, 0, G_TX_CLAMP | G_TX_NOMIRROR, 3, 0),
	gsDPSetTileSize(0, 0, 0, 28, 60),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_iceflower_Flower_Leaf[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_iceflower_Ice_Flower[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsSPSetLights1(jers_powerups_iceflower_Ice_Flower_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_iceflower_flower_ice_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 2047, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_MIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_iceflower_Ice_Flower[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_iceflower_Eyes[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_iceflower_star_eye_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_iceflower_Eyes[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_iceflower_Ice_Flower_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_powerups_iceflower_Flower_Stem),
	gsSPDisplayList(jers_powerups_iceflower_Ice_Flower_mesh_layer_1_tri_0),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_iceflower_Ice_Flower_mesh_layer_4[] = {
	gsSPDisplayList(mat_jers_powerups_iceflower_Flower_Leaf),
	gsSPDisplayList(jers_powerups_iceflower_Ice_Flower_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_powerups_iceflower_Flower_Leaf),
	gsSPDisplayList(mat_jers_powerups_iceflower_Ice_Flower),
	gsSPDisplayList(jers_powerups_iceflower_Ice_Flower_mesh_layer_4_tri_1),
	gsSPDisplayList(mat_revert_jers_powerups_iceflower_Ice_Flower),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_iceflower_Ice_Flower_mesh_layer_5[] = {
	gsSPDisplayList(mat_jers_powerups_iceflower_Eyes),
	gsSPDisplayList(jers_powerups_iceflower_Ice_Flower_mesh_layer_5_tri_0),
	gsSPDisplayList(mat_revert_jers_powerups_iceflower_Eyes),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

