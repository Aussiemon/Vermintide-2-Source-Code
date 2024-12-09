-- chunkname: @scripts/managers/backend/statistics_definitions_termite_part_1.lua

local player = StatisticsDefinitions.player
local database_names = {
	"termite1_skaven_markings_challenge",
	"termite1_bell_challenge",
	"termite1_towers_challenge",
	"termite1_waystone_timer_challenge_easy",
	"termite1_waystone_timer_challenge_hard",
	"termite1_all_challenges",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
