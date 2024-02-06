-- chunkname: @scripts/managers/backend/statistics_definitions_karak_azgaraz_part_1.lua

local player = StatisticsDefinitions.player
local database_names = {
	"dwarf_valaya_emote",
	"dwarf_rune",
	"dwarf_barrel_carry",
	"dwarf_bells",
	"dwarf_pressure",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
