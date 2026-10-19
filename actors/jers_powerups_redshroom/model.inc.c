Lights1 jers_powerups_redshroom_Mushroom_Face_Pale_lights = gdSPDefLights1(
	0x7F, 0x79, 0x73,
	0xFF, 0xF3, 0xE7, 0x28, 0x28, 0x28);

Lights1 jers_powerups_redshroom_Mushroom_Red_lights = gdSPDefLights1(
	0x7F, 0x7F, 0x7F,
	0xFF, 0xFF, 0xFF, 0x28, 0x28, 0x28);

Gfx jers_powerups_redshroom_mushroom_red_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_redshroom_mushroom_red_rgba16[] = {
	#include "actors/jers_powerups_redshroom/mushroom_red.rgba16.inc.c"
};

Gfx jers_powerups_redshroom_star_eye_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_redshroom_star_eye_rgba16[] = {
	#include "actors/jers_powerups_redshroom/star_eye.rgba16.inc.c"
};

Vtx jers_powerups_redshroom_Red_Shroom_mesh_layer_1_vtx_0[21] = {
	{{ {0, 35, -30}, 0, {155, 752}, {0, 24, 131, 255} }},
	{{ {26, 35, -15}, 0, {-16, 752}, {108, 24, 194, 255} }},
	{{ {31, 9, -18}, 0, {-16, 752}, {106, 222, 195, 255} }},
	{{ {0, 9, -35}, 0, {155, 752}, {0, 222, 134, 255} }},
	{{ {22, 0, -13}, 0, {-16, 752}, {51, 144, 226, 255} }},
	{{ {0, 0, -26}, 0, {155, 752}, {0, 144, 197, 255} }},
	{{ {-22, 0, -13}, 0, {325, 752}, {205, 144, 226, 255} }},
	{{ {0, 0, 26}, 0, {667, 752}, {0, 144, 59, 255} }},
	{{ {22, 0, 13}, 0, {837, 752}, {51, 144, 30, 255} }},
	{{ {31, 9, 18}, 0, {837, 752}, {106, 222, 61, 255} }},
	{{ {31, 9, -18}, 0, {1008, 752}, {106, 222, 195, 255} }},
	{{ {22, 0, -13}, 0, {1008, 752}, {51, 144, 226, 255} }},
	{{ {26, 35, -15}, 0, {1008, 752}, {108, 24, 194, 255} }},
	{{ {26, 35, 15}, 0, {837, 752}, {108, 24, 62, 255} }},
	{{ {0, 35, 30}, 0, {667, 752}, {0, 24, 125, 255} }},
	{{ {0, 9, 35}, 0, {667, 752}, {0, 222, 122, 255} }},
	{{ {-31, 9, 18}, 0, {496, 752}, {150, 222, 61, 255} }},
	{{ {-26, 35, 15}, 0, {496, 752}, {148, 24, 62, 255} }},
	{{ {-26, 35, -15}, 0, {325, 752}, {148, 24, 194, 255} }},
	{{ {-31, 9, -18}, 0, {325, 752}, {150, 222, 195, 255} }},
	{{ {-22, 0, 13}, 0, {496, 752}, {205, 144, 30, 255} }},
};

Gfx jers_powerups_redshroom_Red_Shroom_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_powerups_redshroom_Red_Shroom_mesh_layer_1_vtx_0 + 0, 21, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(3, 2, 4, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 5, 4, 0, 6, 4, 7, 0),
	gsSP2Triangles(4, 8, 7, 0, 9, 7, 8, 0),
	gsSP2Triangles(10, 9, 8, 0, 10, 8, 11, 0),
	gsSP2Triangles(12, 9, 10, 0, 12, 13, 9, 0),
	gsSP2Triangles(14, 9, 13, 0, 14, 15, 9, 0),
	gsSP2Triangles(14, 16, 15, 0, 14, 17, 16, 0),
	gsSP2Triangles(18, 16, 17, 0, 18, 19, 16, 0),
	gsSP2Triangles(0, 19, 18, 0, 0, 3, 19, 0),
	gsSP2Triangles(19, 3, 5, 0, 19, 5, 6, 0),
	gsSP2Triangles(16, 19, 6, 0, 16, 6, 20, 0),
	gsSP2Triangles(7, 20, 6, 0, 15, 20, 7, 0),
	gsSP2Triangles(9, 15, 7, 0, 15, 16, 20, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_redshroom_Red_Shroom_mesh_layer_1_vtx_1[44] = {
	{{ {41, 67, 24}, 0, {498, 1123}, {101, 49, 58, 255} }},
	{{ {0, 83, 35}, 0, {-233, 296}, {0, 99, 79, 255} }},
	{{ {0, 67, 48}, 0, {-568, 724}, {0, 49, 117, 255} }},
	{{ {30, 83, 18}, 0, {498, 615}, {69, 99, 40, 255} }},
	{{ {41, 67, -24}, 0, {1540, 725}, {101, 49, 198, 255} }},
	{{ {30, 83, -18}, 0, {1227, 317}, {69, 99, 216, 255} }},
	{{ {0, 93, 0}, 0, {498, -217}, {0, 127, 0, 255} }},
	{{ {46, 41, 27}, 0, {-211, 786}, {104, 215, 60, 255} }},
	{{ {41, 67, 24}, 0, {-140, -10}, {101, 49, 58, 255} }},
	{{ {0, 67, 48}, 0, {496, -10}, {0, 49, 117, 255} }},
	{{ {0, 41, 53}, 0, {496, 786}, {0, 215, 120, 255} }},
	{{ {-41, 67, 24}, 0, {1132, -10}, {155, 49, 58, 255} }},
	{{ {-46, 41, 27}, 0, {1203, 786}, {152, 215, 60, 255} }},
	{{ {0, 3, 0}, 0, {496, 1789}, {0, 129, 0, 255} }},
	{{ {-41, 67, 24}, 0, {-46, 1535}, {155, 49, 58, 255} }},
	{{ {-30, 83, -18}, 0, {-1469, -60}, {187, 99, 216, 255} }},
	{{ {-41, 67, -24}, 0, {-2114, 766}, {155, 49, 198, 255} }},
	{{ {-30, 83, 18}, 0, {-72, 555}, {187, 99, 40, 255} }},
	{{ {0, 67, 48}, 0, {1950, 767}, {0, 49, 117, 255} }},
	{{ {0, 83, 35}, 0, {1348, -19}, {0, 99, 79, 255} }},
	{{ {0, 93, 0}, 0, {-47, -1050}, {0, 127, 0, 255} }},
	{{ {-46, 41, 27}, 0, {-117, 822}, {152, 215, 60, 255} }},
	{{ {-41, 67, 24}, 0, {-55, -80}, {155, 49, 58, 255} }},
	{{ {-41, 67, -24}, 0, {1047, -80}, {155, 49, 198, 255} }},
	{{ {-46, 41, -27}, 0, {1109, 822}, {152, 215, 196, 255} }},
	{{ {0, 3, 0}, 0, {496, 1959}, {0, 129, 0, 255} }},
	{{ {-46, 41, -27}, 0, {1203, 786}, {152, 215, 196, 255} }},
	{{ {-41, 67, -24}, 0, {1132, -10}, {155, 49, 198, 255} }},
	{{ {0, 67, -48}, 0, {496, -10}, {0, 49, 139, 255} }},
	{{ {0, 41, -53}, 0, {496, 786}, {0, 215, 136, 255} }},
	{{ {41, 67, -24}, 0, {-140, -10}, {101, 49, 198, 255} }},
	{{ {46, 41, -27}, 0, {-211, 786}, {104, 215, 196, 255} }},
	{{ {0, 67, -48}, 0, {407, 1457}, {0, 49, 139, 255} }},
	{{ {30, 83, -18}, 0, {-623, 301}, {69, 99, 216, 255} }},
	{{ {41, 67, -24}, 0, {-1091, 900}, {101, 49, 198, 255} }},
	{{ {0, 83, -35}, 0, {389, 747}, {0, 99, 177, 255} }},
	{{ {-41, 67, -24}, 0, {1853, 901}, {155, 49, 198, 255} }},
	{{ {-30, 83, -18}, 0, {1417, 332}, {187, 99, 216, 255} }},
	{{ {0, 93, 0}, 0, {407, -415}, {0, 127, 0, 255} }},
	{{ {0, 3, 0}, 0, {496, 1959}, {0, 129, 0, 255} }},
	{{ {46, 41, -27}, 0, {1109, 822}, {104, 215, 196, 255} }},
	{{ {46, 41, 27}, 0, {-117, 822}, {104, 215, 60, 255} }},
	{{ {41, 67, 24}, 0, {-55, -80}, {101, 49, 58, 255} }},
	{{ {41, 67, -24}, 0, {1047, -80}, {101, 49, 198, 255} }},
};

Gfx jers_powerups_redshroom_Red_Shroom_mesh_layer_1_tri_1[] = {
	gsSPVertex(jers_powerups_redshroom_Red_Shroom_mesh_layer_1_vtx_1 + 0, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
	gsSP2Triangles(4, 3, 0, 0, 4, 5, 3, 0),
	gsSP2Triangles(5, 6, 3, 0, 3, 6, 1, 0),
	gsSP2Triangles(7, 8, 9, 0, 7, 9, 10, 0),
	gsSP2Triangles(10, 9, 11, 0, 10, 11, 12, 0),
	gsSP2Triangles(13, 10, 12, 0, 13, 7, 10, 0),
	gsSP2Triangles(14, 15, 16, 0, 14, 17, 15, 0),
	gsSP2Triangles(18, 17, 14, 0, 18, 19, 17, 0),
	gsSP2Triangles(19, 20, 17, 0, 17, 20, 15, 0),
	gsSP2Triangles(21, 22, 23, 0, 21, 23, 24, 0),
	gsSP2Triangles(25, 21, 24, 0, 26, 27, 28, 0),
	gsSP2Triangles(26, 28, 29, 0, 29, 28, 30, 0),
	gsSP2Triangles(29, 30, 31, 0, 13, 29, 31, 0),
	gsSP1Triangle(13, 26, 29, 0),
	gsSPVertex(jers_powerups_redshroom_Red_Shroom_mesh_layer_1_vtx_1 + 32, 12, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
	gsSP2Triangles(4, 3, 0, 0, 4, 5, 3, 0),
	gsSP2Triangles(5, 6, 3, 0, 3, 6, 1, 0),
	gsSP2Triangles(7, 8, 9, 0, 8, 10, 9, 0),
	gsSP1Triangle(8, 11, 10, 0),
	gsSPEndDisplayList(),
};

Vtx jers_powerups_redshroom_Red_Shroom_mesh_layer_5_vtx_0[8] = {
	{{ {16, 26, 27}, 0, {898, 57}, {45, 13, 118, 255} }},
	{{ {0, 26, 33}, 0, {-118, 57}, {0, 14, 126, 255} }},
	{{ {0, 10, 35}, 0, {-118, 935}, {0, 14, 126, 255} }},
	{{ {16, 10, 29}, 0, {898, 935}, {45, 13, 118, 255} }},
	{{ {0, 26, 33}, 0, {1110, 57}, {0, 14, 126, 255} }},
	{{ {-16, 26, 27}, 0, {94, 57}, {211, 13, 118, 255} }},
	{{ {-16, 10, 29}, 0, {94, 935}, {211, 13, 118, 255} }},
	{{ {0, 10, 35}, 0, {1110, 935}, {0, 14, 126, 255} }},
};

Gfx jers_powerups_redshroom_Red_Shroom_mesh_layer_5_tri_0[] = {
	gsSPVertex(jers_powerups_redshroom_Red_Shroom_mesh_layer_5_vtx_0 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 6, 7, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jers_powerups_redshroom_Mushroom_Face_Pale[] = {
	gsSPSetLights1(jers_powerups_redshroom_Mushroom_Face_Pale_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_redshroom_Mushroom_Red[] = {
	gsSPSetLights1(jers_powerups_redshroom_Mushroom_Red_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_redshroom_mushroom_red_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_redshroom_Eyes[] = {
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_redshroom_star_eye_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_redshroom_Red_Shroom_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_powerups_redshroom_Mushroom_Face_Pale),
	gsSPDisplayList(jers_powerups_redshroom_Red_Shroom_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_jers_powerups_redshroom_Mushroom_Red),
	gsSPDisplayList(jers_powerups_redshroom_Red_Shroom_mesh_layer_1_tri_1),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_redshroom_Red_Shroom_mesh_layer_5[] = {
	gsSPDisplayList(mat_jers_powerups_redshroom_Eyes),
	gsSPDisplayList(jers_powerups_redshroom_Red_Shroom_mesh_layer_5_tri_0),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

