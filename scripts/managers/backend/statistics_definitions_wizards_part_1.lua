-- chunkname: @scripts/managers/backend/statistics_definitions_wizards_part_1.lua

local player = StatisticsDefinitions.player
local database_names = {
	"trail_cog_strike",
	"trail_shatterer",
	"trail_sleigher",
	"trail_beacons_are_lit",
	"trail_bonfire_watch_tower",
	"trail_bonfire_river_path",
	"trail_bonfire_lookout_point",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
