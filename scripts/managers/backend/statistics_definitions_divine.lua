-- chunkname: @scripts/managers/backend/statistics_definitions_divine.lua

local player = StatisticsDefinitions.player
local database_names = {
	"divine_nautical_miles_challenge",
	"divine_anchor_challenge",
	"divine_sink_ships_challenge",
	"divine_cannon_challenge",
	"divine_chaos_warrior_challenge",
	"divine_all_challenges",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
