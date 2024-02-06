-- chunkname: @scripts/settings/dlcs/holly/holly_level_settings.lua

local settings = DLCSettings.holly

settings.level_settings = "levels/honduras_dlcs/holly/level_settings_holly"
settings.level_unlock_settings = "levels/honduras_dlcs/holly/level_unlock_settings_holly"
settings.terror_event_blueprints_filename = "levels/honduras_dlcs/holly/terror_events_holly"
settings.weighted_random_terror_events = {
	magnus_door = {
		"magnus_door_a",
		1,
		"magnus_door_b",
		1,
	},
	cemetery_plague_brew_event_1 = {
		"cemetery_plague_brew_event_1_a",
		1,
		"cemetery_plague_brew_event_1_b",
		1,
	},
	cemetery_plague_brew_event_2 = {
		"cemetery_plague_brew_event_2_a",
		1,
		"cemetery_plague_brew_event_2_b",
		1,
	},
	cemetery_plague_brew_event_3 = {
		"cemetery_plague_brew_event_3_a",
		1,
		"cemetery_plague_brew_event_3_b",
		1,
	},
	cemetery_plague_brew_event_4 = {
		"cemetery_plague_brew_event_4_a",
		1,
		"cemetery_plague_brew_event_4_b",
		1,
	},
	forest_end = {
		"forest_end_event_a",
		5,
		"forest_end_event_b",
		5,
		"forest_end_event_c",
		3,
	},
	forest_skaven_camp = {
		"forest_skaven_camp_a",
		1,
		"forest_skaven_camp_b",
		1,
		"forest_skaven_camp_c",
		1,
	},
}
settings.missions = {
	plaza_investigate = {
		mission_template_name = "goal",
		text = "mission_plaza_investigate",
	},
	plaza_survive = {
		mission_template_name = "goal",
		text = "mission_plaza_survive",
	},
	plaza_pickup = {
		mission_template_name = "goal",
		text = "mission_plaza_pickup",
	},
	plaza_waystone = {
		mission_template_name = "goal",
		text = "mission_plaza_waystone",
	},
	mission_magnus_survive_hordes = {
		mission_template_name = "goal",
		text = "mission_magnus_survive_hordes",
	},
	mission_holly_escape_into_illusion_portal = {
		mission_template_name = "goal",
		text = "mission_holly_escape_into_illusion_portal",
	},
}
