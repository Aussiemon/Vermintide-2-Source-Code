local journey_ruin_graphs = require("scripts/settings/dlcs/morris/deus_map_baked_base_graphs_journey_ruin")
local journey_cave_graphs = require("scripts/settings/dlcs/morris/deus_map_baked_base_graphs_journey_cave")
local journey_ice_graphs = require("scripts/settings/dlcs/morris/deus_map_baked_base_graphs_journey_ice")
local journey_citadel_graphs = require("scripts/settings/dlcs/morris/deus_map_baked_base_graphs_journey_citadel")

return {
	default = journey_ruin_graphs,
	journey_ruin = journey_ruin_graphs,
	journey_cave = journey_cave_graphs,
	journey_ice = journey_ice_graphs,
	journey_citadel = journey_citadel_graphs
}
