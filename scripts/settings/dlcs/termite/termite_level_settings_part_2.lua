-- chunkname: @scripts/settings/dlcs/termite/termite_level_settings_part_2.lua

local settings = DLCSettings.termite_part_2

settings.level_settings = "levels/honduras_dlcs/termite/level_settings_termite_part_2"
settings.missions = {
	termite_lvl2_start = {
		mission_template_name = "goal",
		text = "termite_lvl2_start",
	},
	termite_lvl2_valves = {
		collect_amount = 4,
		mission_template_name = "collect",
		text = "termite_lvl2_valves",
	},
	termite_lvl2_bomb = {
		mission_template_name = "goal",
		text = "termite_lvl2_bomb",
	},
	termite_lvl2_follow_bomb = {
		mission_template_name = "goal",
		text = "termite_lvl2_follow_bomb",
	},
	termite_lvl2_escape = {
		mission_template_name = "goal",
		text = "termite_lvl2_escape",
	},
	termite_lvl2_boss = {
		mission_template_name = "goal",
		text = "termite_lvl2_boss",
	},
	termite_lvl2_exit = {
		mission_template_name = "goal",
		text = "termite_lvl2_exit",
	},
}
