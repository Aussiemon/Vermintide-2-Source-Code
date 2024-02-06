-- chunkname: @scripts/settings/dlcs/penny/penny_level_settings_part_2.lua

local settings = DLCSettings.penny_part_2

settings.level_settings = "levels/honduras_dlcs/penny/level_settings_penny_part_2"
settings.missions = {
	bastion_enter_bastion = {
		mission_template_name = "goal",
		text = "mission_bastion_enter_bastion",
	},
	bastion_find_cellblock = {
		mission_template_name = "goal",
		text = "mission_bastion_find_cellblock",
	},
	bastion_locate_villagers = {
		mission_template_name = "goal",
		text = "mission_bastion_locate_villagers",
	},
	bastion_survive = {
		mission_template_name = "goal",
		text = "mission_bastion_survive",
	},
	bastion_escape_generic = {
		mission_template_name = "goal",
		text = "mission_bastion_escape_generic",
	},
	bastion_reach_surface = {
		mission_template_name = "goal",
		text = "mission_bastion_reach_surface",
	},
	bastion_rescue_villagers = {
		collect_amount = 9,
		mission_template_name = "collect",
		text = "mission_bastion_rescue_villagers",
	},
	bastion_find_remaining_survivors = {
		mission_template_name = "goal",
		text = "mission_bastion_find_remaining_survivors",
	},
	bastion_escape = {
		mission_template_name = "goal",
		text = "mission_bastion_escape",
	},
	bastion_exit = {
		mission_template_name = "goal",
		text = "mission_bastion_exit",
	},
}
