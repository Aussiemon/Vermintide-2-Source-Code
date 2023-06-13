local player = StatisticsDefinitions.player
local database_names = {
	"dwarf_valaya_emote",
	"dwarf_rune",
	"dwarf_barrel_carry",
	"dwarf_bells",
	"dwarf_pressure"
}

for i = 1, #database_names do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end
