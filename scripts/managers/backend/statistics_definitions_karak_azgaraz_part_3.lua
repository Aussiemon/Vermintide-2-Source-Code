local player = StatisticsDefinitions.player
local database_names = {
	"dwarf_pressure_pad",
	"dwarf_big_jump",
	"dwarf_crows",
	"dwarf_speedrun"
}

for i = 1, #database_names do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end
