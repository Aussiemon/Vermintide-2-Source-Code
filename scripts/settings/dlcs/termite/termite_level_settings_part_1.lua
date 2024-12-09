-- chunkname: @scripts/settings/dlcs/termite/termite_level_settings_part_1.lua

local settings = DLCSettings.termite_part_1

settings.level_settings = "levels/honduras_dlcs/termite/level_settings_termite_part_1"
settings.level_unlock_settings = "levels/honduras_dlcs/termite/level_unlock_settings_termite_part_1"
settings.missions = {
	termite_lvl1_follow_stream = {
		mission_template_name = "goal",
		text = "termite_lvl1_follow_stream",
	},
	termite_lvl1_reach_temple = {
		mission_template_name = "goal",
		text = "termite_lvl1_reach_temple",
	},
	termite_lvl1_find_entrance = {
		mission_template_name = "goal",
		text = "termite_lvl1_find_entrance",
	},
	termite_lvl1_find_waystone = {
		mission_template_name = "goal",
		text = "termite_lvl1_find_waystone",
	},
	termite_lvl1_repair_waystone = {
		mission_template_name = "goal",
		text = "termite_lvl1_repair_waystone",
	},
	termite_lvl1_find_waystone_pieces = {
		collect_amount = 4,
		mission_template_name = "collect",
		text = "termite_lvl1_find_waystone_pieces",
	},
	termite_lvl1_escape = {
		mission_template_name = "goal",
		text = "termite_lvl1_escape",
	},
}
