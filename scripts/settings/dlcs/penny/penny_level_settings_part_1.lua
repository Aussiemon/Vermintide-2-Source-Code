local settings = DLCSettings.penny_part_1
settings.level_settings = "levels/honduras_dlcs/penny/level_settings_penny_part_1"
settings.level_unlock_settings = "levels/honduras_dlcs/penny/level_unlock_settings_penny_part_1"
settings.weighted_random_terror_events = {
	dlc_portals_end_event = {
		"dlc_portals_end_event_a",
		1,
		"dlc_portals_end_event_b",
		1
	},
	dlc_portals_temple_event = {
		"dlc_portals_temple_event_a",
		1,
		"dlc_portals_temple_event_b",
		1
	}
}
settings.missions = {
	portals_enter_village = {
		mission_template_name = "goal",
		text = "mission_portals_enter_village"
	},
	portals_find_survivors = {
		mission_template_name = "goal",
		text = "mission_portals_find_survivors"
	},
	portals_reach_temple = {
		mission_template_name = "goal",
		text = "mission_go_up_to_the_temple"
	},
	portals_enter_temple = {
		mission_template_name = "goal",
		text = "mission_enter_temple"
	},
	portals_find_map = {
		mission_template_name = "goal",
		text = "mission_portals_find_map"
	},
	portals_exit_temple = {
		mission_template_name = "goal",
		text = "mission_portals_exit_temple"
	},
	portals_get_out = {
		mission_template_name = "goal",
		text = "mission_portals_leave_village"
	},
	portals_follow_trail = {
		mission_template_name = "goal",
		text = "mission_portals_follow_trail"
	},
	portals_find_secret_entrance = {
		mission_template_name = "goal",
		text = "mission_portals_find_secret_entrance"
	},
	portals_go_through_crypt = {
		mission_template_name = "goal",
		text = "mission_portals_go_through_crypt"
	},
	portals_survive = {
		text = "mission_restore_the_gargoyle_heads",
		mission_template_name = "collect",
		collect_amount = 4
	},
	portals_find_way_out = {
		mission_template_name = "goal",
		text = "mission_portals_find_a_way_up"
	},
	portals_get_to_waystone = {
		mission_template_name = "goal",
		text = "mission_portals_get_to_waystone"
	},
	portals_fix_waystone = {
		mission_template_name = "goal",
		text = "mission_portals_fix_waystone"
	},
	portals_exit_through_waystone = {
		mission_template_name = "goal",
		text = "mission_portals_exit_through_waystone"
	}
}

return
