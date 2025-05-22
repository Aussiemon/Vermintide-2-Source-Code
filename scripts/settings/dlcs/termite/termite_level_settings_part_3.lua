-- chunkname: @scripts/settings/dlcs/termite/termite_level_settings_part_3.lua

local settings = DLCSettings.termite_part_3

settings.level_settings = "levels/honduras_dlcs/termite/level_settings_termite_part_3"
settings.missions = {
	termite_lvl3_follow_bomb = {
		mission_template_name = "goal",
		text = "termite_lvl3_follow_bomb",
	},
	termite_lvl3_find_bomb = {
		mission_template_name = "goal",
		text = "termite_lvl3_find_bomb",
	},
	termite_lvl3_enter_temple = {
		mission_template_name = "goal",
		text = "termite_lvl3_enter_temple",
	},
	termite_lvl3_magic_blocker = {
		mission_template_name = "goal",
		text = "termite_lvl3_magic_blocker",
	},
	termite_lvl3_broken_spotlights_max = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "termite_lvl3_first_spotlights_max",
	},
	termite_lvl3_first_spotlights_max = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "termite_lvl3_first_spotlights_max",
	},
	termite_lvl3_second_spotlight_avoid = {
		mission_template_name = "goal",
		text = "termite_lvl3_second_spotlight_avoid",
	},
	termite_lvl3_second_spotlights_max = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "termite_lvl3_first_spotlights_max",
	},
	termite_lvl3_third_spotlights_max = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "termite_lvl3_first_spotlights_max",
	},
	termite_lvl3_stormfiends = {
		mission_template_name = "goal",
		text = "termite_lvl3_boss_fight",
	},
	termite_lvl3_stormfiend = {
		mission_template_name = "goal",
		text = "termite_lvl3_stormfiend",
	},
	termite_lvl3_tune_portal = {
		mission_template_name = "goal",
		text = "termite_lvl3_tune_portal",
	},
	termite_lvl3_icons = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "termite_lvl3_tune_portal",
	},
	termite_lvl3_escape_1 = {
		mission_template_name = "goal",
		text = "termite_lvl3_escape_1",
	},
	termite_lvl3_escape_2 = {
		mission_template_name = "goal",
		text = "termite_lvl3_escape_2",
	},
	termite_lvl3_escape_3 = {
		collect_amount = 7,
		mission_template_name = "collect",
		text = "termite_lvl3_escape_3",
	},
	termite_lvl3_destroy_generator = {
		mission_template_name = "goal",
		text = "termite_lvl3_disable_spotlight",
	},
}
