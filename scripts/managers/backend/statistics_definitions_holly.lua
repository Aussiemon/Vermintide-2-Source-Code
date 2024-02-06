-- chunkname: @scripts/managers/backend/statistics_definitions_holly.lua

local player = StatisticsDefinitions.player

player.holly_magnus_barrel_relay_race = {
	database_name = "holly_magnus_barrel_relay_race",
	source = "player_data",
	value = 0,
}
player.holly_magnus_barrel_relay_race_hardest = {
	database_name = "holly_magnus_barrel_relay_race_hardest",
	source = "player_data",
	value = 0,
}
player.holly_magnus_secret_room = {
	database_name = "holly_magnus_secret_room",
	source = "player_data",
	value = 0,
}
player.holly_magnus_gutter_runner_treasure = {
	database_name = "holly_magnus_gutter_runner_treasure",
	source = "player_data",
	value = 0,
}
player.holly_magnus_gutter_runner_treasure_hardest = {
	database_name = "holly_magnus_gutter_runner_treasure_hardest",
	source = "player_data",
	value = 0,
}
player.holly_magnus_rune = {
	database_name = "holly_magnus_rune",
	source = "player_data",
	value = 0,
}
player.holly_forest_ambush_synchronized_explosives = {
	database_name = "holly_forest_ambush_synchronized_explosives",
	source = "player_data",
	value = 0,
}
player.holly_forest_ambush_synchronized_explosives_hardest = {
	database_name = "holly_forest_ambush_synchronized_explosives_hardest",
	source = "player_data",
	value = 0,
}
player.holly_forest_ambush_bretonnian_dance = {
	database_name = "holly_forest_ambush_bretonnian_dance",
	source = "player_data",
	value = 0,
}
player.holly_forest_ambush_dragonbane_gem = {
	database_name = "holly_forest_ambush_dragonbane_gem",
	source = "player_data",
	value = 0,
}
player.holly_forest_ambush_rune = {
	database_name = "holly_forest_ambush_rune",
	source = "player_data",
	value = 0,
}
player.holly_cemetery_sleep = {
	database_name = "holly_cemetery_sleep",
	source = "player_data",
	value = 0,
}
player.holly_cemetery_rune = {
	database_name = "holly_cemetery_rune",
	source = "player_data",
	value = 0,
}
player.holly_cemetery_bones = {
	database_name = "holly_cemetery_bones",
	source = "player_data",
	value = 0,
}
player.holly_cemetery_synchronized_chains = {
	database_name = "holly_cemetery_synchronized_chains",
	source = "player_data",
	value = 0,
}
player.holly_cemetery_synchronized_chains_hardest = {
	database_name = "holly_cemetery_synchronized_chains_hardest",
	source = "player_data",
	value = 0,
}
player.holly_find_all_runes = {
	database_name = "holly_find_all_runes",
	source = "player_data",
	value = 0,
}
player.holly_difficulty_selection_plaza = {
	database_name = "holly_difficulty_selection_plaza",
	source = "player_data",
	value = 1,
}
player.holly_kills_we_1h_axe = {
	database_name = "holly_kills_we_1h_axe",
	source = "player_data",
	value = 0,
}
player.holly_kills_bw_1h_crowbill = {
	database_name = "holly_kills_bw_1h_crowbill",
	source = "player_data",
	value = 0,
}
player.holly_kills_wh_dual_wield_axe_falchion = {
	database_name = "holly_kills_wh_dual_wield_axe_falchion",
	source = "player_data",
	value = 0,
}
player.holly_kills_dr_dual_wield_hammers = {
	database_name = "holly_kills_dr_dual_wield_hammers",
	source = "player_data",
	value = 0,
}
player.holly_kills_es_dual_wield_hammer_sword = {
	database_name = "holly_kills_es_dual_wield_hammer_sword",
	source = "player_data",
	value = 0,
}

local holly_lord_levels = {
	"warcamp",
	"skaven_stronghold",
	"ground_zero",
	"skittergate",
}
local weapon_names = {
	"we_1h_axe",
	"bw_1h_crowbill",
	"wh_dual_wield_axe_falchion",
	"dr_dual_wield_hammers",
	"es_dual_wield_hammer_sword",
}

for i = 1, #holly_lord_levels do
	local level_name = holly_lord_levels[i]

	for j = 1, #weapon_names do
		local weapon_name = weapon_names[j]
		local stat_name = "holly_completed_level_" .. level_name .. "_with_" .. weapon_name

		player[stat_name] = {
			source = "player_data",
			value = 0,
			database_name = stat_name,
		}
	end
end
