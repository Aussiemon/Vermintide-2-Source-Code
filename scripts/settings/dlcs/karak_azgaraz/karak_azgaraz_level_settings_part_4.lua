-- chunkname: @scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_level_settings_part_4.lua

local settings = DLCSettings.karak_azgaraz_part_4

settings.level_settings = "levels/honduras_dlcs/karak_azgaraz/level_settings_karak_azgaraz_part_4"
settings.missions = {
	dlc_whaling_gather_team = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_gather_team",
	},
	dlc_whaling_investigate_hut = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_investigate_hut",
	},
	dlc_whaling_find_shelter = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_find_shelter",
	},
	dlc_whaling_village_center = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_village_center",
	},
	dlc_whaling_elevator_find = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_find_elevator",
	},
	dlc_whaling_elevator = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "dlc1_5_dwarf_whaling_fix_elevator",
	},
	dlc_whaling_elevator_ride = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_ride_elevator",
	},
	dlc1_5_dwarf_locate_lighthouse = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_locate_lighthouse",
	},
	dlc_whaling_lighhouse = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_destroy_lighthouse",
	},
	dlc_whaling_light_investigate = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_investigate_lighthous",
	},
	dlc_whaling_oilcart_find = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_find_oilcart",
	},
	dlc_whaling_oilcart = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_oilcart",
	},
	dlc_whaling_oilcart_fill = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_fill_oilcart",
	},
	dlc_whaling_explosive_ignite = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_ignite",
	},
	dlc_whaling_lastpush = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_one_last_push",
	},
	dlc_whaling_escape = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_whaling_escape_island",
	},
}
