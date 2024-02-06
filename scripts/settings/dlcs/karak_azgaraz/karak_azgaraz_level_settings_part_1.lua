-- chunkname: @scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_level_settings_part_1.lua

local settings = DLCSettings.karak_azgaraz_part_1

settings.level_settings = "levels/honduras_dlcs/karak_azgaraz/level_settings_karak_azgaraz_part_1"
settings.level_unlock_settings = "levels/honduras_dlcs/karak_azgaraz/level_unlock_settings_karak_azgaraz"
settings.missions = {
	dwarf_interior_find_war_party = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_find_war_party_text",
	},
	dwarf_interior_enter_hold = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_enter_hold_mission_text",
	},
	dwarf_interior_look_survivors = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_look_survivors_text",
	},
	dwarf_interior_answer_call = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_answer_call_text",
	},
	dwarf_interior_stabilize_pressure = {
		collect_amount = 4,
		mission_template_name = "collect",
		text = "dlc1_5_dwarf_interior_stabilize_pressure_mission_text",
	},
	dwarf_interior_talk_to_hedda_brewery = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_talk_to_hedda_text",
	},
	dwarf_interior_search_khazid = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_enter_hold_mission_text",
	},
	dwarf_interior_find_skaven_source = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_find_skaven_source_mission_text",
	},
	dwarf_interior_talk_to_hedda = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_talk_to_hedda_text",
	},
	dwarf_interior_destroy_tunnels = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "dlc1_5_dwarf_interior_destroy_tunnels_mission_text",
	},
	dwarf_interior_wait_explosive = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_wait_explosive_mission_text",
	},
	dwarf_interior_escape = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_interior_reach_the_surface_text",
	},
	dwarf_interior_end_zone = {
		mission_template_name = "goal",
		text = "mission_farmlands_escape",
	},
}
