#include "src/game/envfx_snow.h"

const GeoLayout jers_powerups_bubble_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_SCALE(LAYER_OPAQUE, 65536),
		GEO_OPEN_NODE(),
			GEO_SHADOW(1, 51, 225),
			GEO_OPEN_NODE(),
				GEO_ANIMATED_PART(LAYER_TRANSPARENT_INTER, 0, 0, 0, jers_powerups_bubble_Bubble_DL_mesh_layer_7),
			GEO_CLOSE_NODE(),
		GEO_CLOSE_NODE(),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
