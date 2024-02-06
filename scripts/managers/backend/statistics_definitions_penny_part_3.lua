-- chunkname: @scripts/managers/backend/statistics_definitions_penny_part_3.lua

local player = StatisticsDefinitions.player
local database_names = {
	"penny_castle_chalice",
	"penny_castle_skull",
	"penny_castle_flask",
	"penny_castle_eruptions",
	"penny_castle_no_kill",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
