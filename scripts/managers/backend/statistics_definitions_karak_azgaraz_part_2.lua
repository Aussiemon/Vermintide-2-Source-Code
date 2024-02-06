-- chunkname: @scripts/managers/backend/statistics_definitions_karak_azgaraz_part_2.lua

local player = StatisticsDefinitions.player
local database_names = {
	"dwarf_towers",
	"dwarf_chain_speed",
	"dwarf_jump_puzzle",
	"dwarf_push",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
