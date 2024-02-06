-- chunkname: @scripts/managers/backend/statistics_definitions_steak.lua

local player = StatisticsDefinitions.player

player.scorpion_crater_pendant = {
	database_name = "scorpion_crater_pendant",
	source = "player_data",
	value = 0,
}

for i = 1, 3 do
	local dark_tongue_definition = "scorpion_crater_dark_tongue_" .. i

	player[dark_tongue_definition] = {
		source = "player_data",
		value = 0,
		database_name = dark_tongue_definition,
	}
end

player.scorpion_crater_detour = {
	database_name = "scorpion_crater_detour",
	source = "player_data",
	value = 0,
}
player.scorpion_crater_ambush = {
	database_name = "scorpion_crater_ambush",
	source = "player_data",
	value = 0,
}
