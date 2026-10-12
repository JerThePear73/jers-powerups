#include "src/game/envfx_snow.h"

const GeoLayout jers_powerups_iceball_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_SHADOW(1, 255, 100),
		GEO_OPEN_NODE(),
			GEO_SCALE(LAYER_OPAQUE, 65536),
			GEO_OPEN_NODE(),
				GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, jers_powerups_iceball_Iceball_mesh_layer_1),
				GEO_OPEN_NODE(),
					GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_powerups_iceball_Iceball_mesh_layer_7),
				GEO_CLOSE_NODE(),
			GEO_CLOSE_NODE(),
		GEO_CLOSE_NODE(),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
