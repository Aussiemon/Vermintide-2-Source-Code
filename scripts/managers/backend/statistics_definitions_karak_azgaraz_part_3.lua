-- chunkname: @scripts/managers/backend/statistics_definitions_karak_azgaraz_part_3.lua

local player = StatisticsDefinitions.player
local database_names = {
	"dwarf_pressure_pad",
	"dwarf_big_jump",
	"dwarf_crows",
	"dwarf_speedrun",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
