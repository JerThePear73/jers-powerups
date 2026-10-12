Gfx jers_powerups_snowflake_snowflake6_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_snowflake_snowflake6_rgba16[] = {
	#include "actors/jers_powerups_snowflake/snowflake6.rgba16.inc.c"
};

Gfx jers_powerups_snowflake_snowflake5_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_snowflake_snowflake5_rgba16[] = {
	#include "actors/jers_powerups_snowflake/snowflake5.rgba16.inc.c"
};

Gfx jers_powerups_snowflake_snowflake4_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_snowflake_snowflake4_rgba16[] = {
	#include "actors/jers_powerups_snowflake/snowflake4.rgba16.inc.c"
};

Gfx jers_powerups_snowflake_snowflake3_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_snowflake_snowflake3_rgba16[] = {
	#include "actors/jers_powerups_snowflake/snowflake3.rgba16.inc.c"
};

Gfx jers_powerups_snowflake_snowflake2_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_snowflake_snowflake2_rgba16[] = {
	#include "actors/jers_powerups_snowflake/snowflake2.rgba16.inc.c"
};

Gfx jers_powerups_snowflake_snowflake1_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_powerups_snowflake_snowflake1_rgba16[] = {
	#include "actors/jers_powerups_snowflake/snowflake1.rgba16.inc.c"
};

Vtx jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_vtx_0[4] = {
	{{ {-16, 0, 0}, 0, {-16, 976}, {255, 255, 255, 255} }},
	{{ {16, 0, 0}, 0, {976, 976}, {255, 255, 255, 255} }},
	{{ {16, 32, 0}, 0, {976, -16}, {255, 255, 255, 255} }},
	{{ {-16, 32, 0}, 0, {-16, -16}, {255, 255, 255, 255} }},
};

Gfx jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_tri_0[] = {
	gsSPVertex(jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_vtx_0 + 0, 4, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jers_powerups_snowflake_snow1[] = {
	gsSPGeometryMode(G_SHADE | G_LIGHTING, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 255, 255, 255, 255),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_snowflake_snowflake6_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_snowflake_snow1[] = {
	gsSPGeometryMode(0, G_SHADE | G_LIGHTING),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_snowflake_snow2[] = {
	gsSPGeometryMode(G_SHADE | G_LIGHTING, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 255, 255, 255, 255),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_snowflake_snowflake5_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_snowflake_snow2[] = {
	gsSPGeometryMode(0, G_SHADE | G_LIGHTING),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_snowflake_snow3[] = {
	gsSPGeometryMode(G_SHADE | G_LIGHTING, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 255, 255, 255, 255),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_snowflake_snowflake4_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_snowflake_snow3[] = {
	gsSPGeometryMode(0, G_SHADE | G_LIGHTING),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_snowflake_snow4[] = {
	gsSPGeometryMode(G_SHADE | G_LIGHTING, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 255, 255, 255, 255),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_snowflake_snowflake3_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_snowflake_snow4[] = {
	gsSPGeometryMode(0, G_SHADE | G_LIGHTING),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_snowflake_snow5[] = {
	gsSPGeometryMode(G_SHADE | G_LIGHTING, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 255, 255, 255, 255),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_snowflake_snowflake2_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_snowflake_snow5[] = {
	gsSPGeometryMode(0, G_SHADE | G_LIGHTING),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_powerups_snowflake_snow6[] = {
	gsSPGeometryMode(G_SHADE | G_LIGHTING, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 255, 255, 255, 255),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_powerups_snowflake_snowflake1_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_powerups_snowflake_snow6[] = {
	gsSPGeometryMode(0, G_SHADE | G_LIGHTING),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_snowflake_Snowflake_DL_mesh_layer_4[] = {
	gsSPDisplayList(mat_jers_powerups_snowflake_snow1),
	gsSPDisplayList(jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_powerups_snowflake_snow1),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow2_0[] = {
	gsSPDisplayList(mat_jers_powerups_snowflake_snow2),
	gsSPDisplayList(jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_powerups_snowflake_snow2),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow3_1[] = {
	gsSPDisplayList(mat_jers_powerups_snowflake_snow3),
	gsSPDisplayList(jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_powerups_snowflake_snow3),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow4_2[] = {
	gsSPDisplayList(mat_jers_powerups_snowflake_snow4),
	gsSPDisplayList(jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_powerups_snowflake_snow4),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow5_3[] = {
	gsSPDisplayList(mat_jers_powerups_snowflake_snow5),
	gsSPDisplayList(jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_powerups_snowflake_snow5),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow6_4[] = {
	gsSPDisplayList(mat_jers_powerups_snowflake_snow6),
	gsSPDisplayList(jers_powerups_snowflake_Snowflake_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_powerups_snowflake_snow6),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

