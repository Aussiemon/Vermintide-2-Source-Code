local player = StatisticsDefinitions.player
local database_names = {
	"penny_portals_portal",
	"penny_portals_heads",
	"penny_portals_vintage",
	"penny_portals_hideout",
	"penny_portals_cleanser"
}

for i = 1, #database_names do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end
