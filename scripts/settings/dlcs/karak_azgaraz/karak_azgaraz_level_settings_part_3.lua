-- chunkname: @scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_level_settings_part_3.lua

local settings = DLCSettings.karak_azgaraz_part_3

settings.level_settings = "levels/honduras_dlcs/karak_azgaraz/level_settings_karak_azgaraz_part_3"
settings.missions = {
	dwarf_beacons_find_trading_post = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_beacons_find_trading_post_mission_text",
	},
	dwarf_beacons_lower_bridge = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_beacons_lower_bridge_mission_text",
	},
	dwarf_beacons_switch_pull_again = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_beacons_switch_pull_again_mission_text",
	},
	dwarf_beacons_bridge_done = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_beacons_bridge_done_mission_text",
	},
	dwarf_beacons_start_gas = {
		collect_amount = 4,
		mission_template_name = "collect",
		text = "dlc1_5_dwarf_beacons_start_gas_mission_text",
	},
	dwarf_beacons_repair_pipe = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_beacons_repair_pipe_mission_text",
	},
	dwarf_beacons_start_burner = {
		mission_template_name = "goal",
		text = "dlc_1_5_dwarf_beacons_start_burner_mission_text",
	},
	dwarf_beacons_approach_beacon = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_beacons_approach_beacon_mission_text",
	},
	dwarf_beacons_activate_beacon = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_beacons_activate_beacon_mission_text",
	},
	dwarf_beacons_ignite_beacon = {
		mission_template_name = "goal",
		text = "interact_ignite",
	},
	dwarf_beacons_leave = {
		mission_template_name = "goal",
		text = "dlc1_5_dwarf_beacons_leave_mission_text",
	},
}
