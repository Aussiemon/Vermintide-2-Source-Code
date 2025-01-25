-- chunkname: @scripts/managers/backend/statistics_definitions_termite_part_2.lua

local player = StatisticsDefinitions.player
local database_names = {
	"termite2_mushroom_challenge",
	"termite2_water_challenge",
	"termite2_timer_challenge",
	"termite2_all_challenges",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
