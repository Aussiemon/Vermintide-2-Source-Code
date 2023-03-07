local player = StatisticsDefinitions.player
local database_names = {
	"penny_portals_grapes",
	"penny_portals_coop",
	"penny_portals_templerun",
	"penny_portals_careful",
	"penny_bastion_journal",
	"penny_bastion_overstay",
	"penny_bastion_sprinter",
	"penny_bastion_yorick",
	"penny_bastion_torch"
}

for i = 1, #database_names do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end
