local settings = DLCSettings.karak_azgaraz_part_2
settings.level_settings = "levels/honduras_dlcs/karak_azgaraz/level_settings_karak_azgaraz_part_2"
settings.missions = {
	dwarf_exterior_follow_secret_path = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_exterior_follow_secret_path_mission_text"
	},
	dwarf_exterior_mid_event = {
		mission_template_name = "goal",
		text = "mission_military_open_gate"
	},
	dwarf_exterior_mid_survive = {
		mission_template_name = "goal",
		text = "mission_military_arena_survive"
	},
	dwarf_exterior_mid_jammed = {
		mission_template_name = "goal",
		text = "mission_military_open_gate"
	},
	dwarf_exterior_frozen_lake = {
		mission_template_name = "goal",
		text = "mission_fort_follow_road"
	},
	dwarf_exterior_find_vault_location = {
		mission_template_name = "goal",
		text = "mission_bell_reach_bell"
	},
	dwarf_exterior_locate_chamber_area = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_exterior_locate_chamber_area_mission_text"
	},
	dwarf_exterior_enter_chamber = {
		mission_template_name = "goal",
		text = "mission_bell_chop_down_bell"
	},
	dwarf_exterior_bomb_wagon = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_exterior_release_bomb_wagon"
	},
	dwarf_exterior_survive = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_exterior_survive_mission_text"
	},
	dwarf_exterior_chains = {
		text = "dlc1_5_dwarf_exterior_destroy_chains_mission_text",
		mission_template_name = "collect",
		collect_amount = 6
	},
	dwarf_exterior_fuse = {
		text = "mission_objective_prologue_escape",
		duration = 19.98,
		mission_template_name = "timed"
	},
	dwarf_exterior_escape_quarry = {
		mission_template_name = "goal",
		text = "mission_farmlands_escape"
	}
}
