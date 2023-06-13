local player = StatisticsDefinitions.player
local database_names = {
	"dwarf_towers",
	"dwarf_chain_speed",
	"dwarf_jump_puzzle",
	"dwarf_push"
}

for i = 1, #database_names do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end
