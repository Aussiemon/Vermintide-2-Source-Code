local player = StatisticsDefinitions.player
local database_names = {
	"tower_skulls",
	"tower_wall_illusions",
	"tower_invisible_bridge",
	"tower_enable_guardian_of_lustria",
	"tower_note_puzzle",
	"tower_created_all_potions",
	"tower_time_challenge"
}

for i = 1, #database_names do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end
