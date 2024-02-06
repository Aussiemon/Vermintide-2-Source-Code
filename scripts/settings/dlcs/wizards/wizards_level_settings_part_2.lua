-- chunkname: @scripts/settings/dlcs/wizards/wizards_level_settings_part_2.lua

local settings = DLCSettings.wizards_part_2

settings.level_settings = "levels/honduras_dlcs/wizards/level_settings_wizards_part_2"
settings.missions = {
	wizards_tower_top_tower = {
		mission_template_name = "goal",
		text = "mission_wizards_tower_top_tower",
	},
	wizards_tower_wards = {
		collect_amount = 4,
		mission_template_name = "collect",
		text = "mission_wizards_tower_wards",
	},
	wizards_tower_dininghall = {
		collect_amount = 6,
		mission_template_name = "collect",
		text = "mission_wizards_tower_dininghall",
	},
	wizards_tower_old_brewery = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "mission_wizards_tower_old_brewery",
	},
	wizards_tower_cauldron = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "mission_wizards_tower_cauldron",
	},
	wizards_tower_sofia_spell = {
		mission_template_name = "goal",
		text = "mission_bastion_survive",
	},
	wizards_tower_olesya_tower = {
		mission_template_name = "goal",
		text = "mission_wizards_tower_olesyas_tower",
	},
}
