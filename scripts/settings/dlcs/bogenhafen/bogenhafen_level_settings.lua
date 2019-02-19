local settings = DLCSettings.bogenhafen
settings.level_settings = "levels/honduras_dlcs/bogenhafen/level_settings_bogenhafen"
settings.level_unlock_settings = "levels/honduras_dlcs/bogenhafen/level_unlock_settings_bogenhafen"
settings.terror_event_blueprints_filename = "levels/honduras_dlcs/bogenhafen/terror_events_bogenhafen"
settings.weighted_random_terror_events = {
	dlc_bogenhafen_slum_event_spice_random = {
		"dlc_bogenhafen_slum_event_spice_left",
		1,
		"dlc_bogenhafen_slum_event_spice_right",
		1
	}
}
settings.missions = {
	bogenhafen_city_findsewer = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_findsewer"
	},
	bogenhafen_city_reachexit = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_reachexit"
	},
	bogenhafen_city_basement = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_basement"
	},
	bogenhafen_city_altroute = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_altroute"
	},
	bogenhafen_city_opensewergates = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_opensewergates"
	},
	bogenhafen_city_reachend = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_reacheend"
	},
	bogenhafen_city_pushforward = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_pushforward"
	},
	bogenhafen_city_pushforward2 = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_pushforward2"
	},
	bogenhafen_city_pushforward3 = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_pushforward3"
	},
	bogenhafen_city_reachmarket = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_reachmarket"
	},
	bogenhafen_city_moveupstairs = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_moveupstairs"
	},
	bogenhafen_city_reachtemplegate = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_reachtemplegate"
	},
	bogenhafen_city_escape_sewers = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_escape_sewers"
	},
	bogenhafen_city_find_priest = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_find_priest"
	},
	bogenhafen_city_getback_gate = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_getback_gate"
	},
	bogenhafen_city_unlock_gate = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_unlock_gate"
	},
	bogenhafen_city_entertemple = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_entertemple"
	},
	bogenhafen_city_findsecret = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_findsecret"
	},
	bogenhafen_city_button = {
		text = "mission_bogenhafen_city_button",
		mission_template_name = "collect",
		collect_amount = 5
	},
	bogenhafen_city_claimartifact = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_claimartifact"
	},
	bogenhafen_city_escape_temple = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_city_escape_temple"
	},
	bogenhafen_slum_enter_slum = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_slum_enter_slum"
	},
	bogenhafen_slum_move_through_slum = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_slum_move_through_slum"
	},
	bogenhafen_get_past_wall = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_get_past_wall"
	},
	bogenhafen_slum_find_hideout = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_slum_find_hideout"
	},
	bogenhafen_slum_enter_hideout = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_slum_enter_hideout"
	},
	bogenhafen_slum_burn_food = {
		text = "mission_bogenhafen_slum_burn_food",
		mission_template_name = "collect",
		collect_amount = 3
	},
	bogenhafen_slum_survive_hideout = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_slum_survive_hideout"
	},
	bogenhafen_slum_escape_hideout = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_slum_escape_hideout"
	},
	bogenhafen_slum_to_the_docks = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_slum_to_the_docks"
	},
	bogenhafen_start_gauntlet = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_start_gauntlet"
	},
	bogenhafen_slum_run = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_slum_run"
	},
	bogenhafen_slum_escape_portal = {
		mission_template_name = "goal",
		text = "mission_bogenhafen_slum_escape_portal"
	}
}

return
