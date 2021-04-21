local settings = DLCSettings.morris
settings.level_settings = "levels/honduras_dlcs/morris/level_settings_morris"
settings.weighted_random_terror_events = {}
settings.missions = {
	deus_cursed_chest_defend = {
		text = "deus_cursed_chest_defend",
		disable_rewards = true,
		mission_template_name = "simple"
	},
	egg_of_tzeentch = {
		behind_peak_distance = 30,
		distance = 70,
		mission_template_name = "timed",
		alert_medium_timer = 45,
		text = "egg_of_tzeentch_destroy",
		duration = 90,
		disable_rewards = true,
		alert_high_timer = 15
	},
	mutator_escape = {
		text = "mutator_escape_message",
		disable_rewards = true,
		mission_template_name = "simple"
	},
	town_survive_arena = {
		mission_template_name = "goal",
		text = "morris_town_survive_arena"
	},
	town_exit = {
		mission_template_name = "goal",
		text = "morris_town_exit"
	},
	mountain_survive_ritual = {
		mission_template_name = "goal",
		text = "morris_mountain_survive_ritual"
	},
	mountain_exit = {
		mission_template_name = "goal",
		text = "morris_mountain_exit"
	},
	mines_blow_up_gate = {
		text = "morris_mines_blow_up_gate",
		mission_template_name = "collect",
		collect_amount = 3
	},
	mines_exit = {
		mission_template_name = "goal",
		text = "morris_mines_exit"
	},
	crag_complete_ritual = {
		mission_template_name = "goal",
		text = "morris_crag_complete_ritual"
	},
	crag_exit = {
		mission_template_name = "goal",
		text = "morris_crag_exit"
	},
	mordrek_start_winch = {
		mission_template_name = "goal",
		text = "morris_mordrek_start_winch"
	},
	mordrek_survive = {
		mission_template_name = "goal",
		text = "morris_mordrek_survive"
	},
	mordrek_exit = {
		mission_template_name = "goal",
		text = "morris_mordrek_exit"
	},
	bay_activate_bell = {
		mission_template_name = "goal",
		text = "morris_bay_activate_bell"
	},
	bay_survive_until_boat = {
		mission_template_name = "goal",
		text = "morris_bay_fight_horde"
	},
	bay_escape_via_boat = {
		mission_template_name = "goal",
		text = "morris_bay_hold_out_until_boat_arrives"
	},
	bay_survive_arena = {
		mission_template_name = "goal",
		text = "morris_bay_survive_arena"
	},
	bay_escape_arena = {
		mission_template_name = "goal",
		text = "morris_bay_escape_arena"
	},
	bay_survive_enemies = {
		mission_template_name = "goal",
		text = "morris_bay_survive_enemies"
	},
	bay_exit_bay = {
		mission_template_name = "goal",
		text = "morris_bay_exit_bay"
	},
	gorge_blow_gate = {
		text = "morris_gorge_blow_gate",
		mission_template_name = "collect",
		collect_amount = 3
	},
	gorge_survive = {
		mission_template_name = "goal",
		text = "morris_gorge_survive"
	},
	gorge_exit_area = {
		mission_template_name = "goal",
		text = "gorge_exit_area"
	},
	snare_survive = {
		mission_template_name = "goal",
		text = "morris_snare_survive_the_throne_room"
	},
	snare_survive_town = {
		mission_template_name = "goal",
		text = "morris_snare_survive_the_town"
	},
	snare_survive_arena = {
		mission_template_name = "goal",
		text = "morris_snare_survive_the_arena"
	},
	snare_survive_farm = {
		mission_template_name = "goal",
		text = "morris_snare_survive_the_farm"
	},
	snare_survive_alley = {
		mission_template_name = "goal",
		text = "morris_snare_survive_the_alley"
	},
	snare_enter = {
		mission_template_name = "goal",
		text = "gorge_snare_enter_the_mines"
	},
	snare_exit = {
		mission_template_name = "goal",
		text = "gorge_snare_exit_the_gate"
	},
	snare_escape = {
		mission_template_name = "goal",
		text = "gorge_snare_escape_into_portal"
	},
	snare_findgate = {
		mission_template_name = "goal",
		text = "morris_snare_finddgate"
	},
	volcano_winch = {
		mission_template_name = "goal",
		text = "morris_volcano_pull_the_winch"
	},
	volcano_survive = {
		mission_template_name = "goal",
		text = "morris_volcano_survive"
	},
	volcano_escape = {
		mission_template_name = "goal",
		text = "morris_volcano_escape_into_portal"
	},
	citadel_arena_ascend_01 = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_ascend_01"
	},
	citadel_arena_survive_01 = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_survive_01"
	},
	citadel_arena_ascend_02 = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_ascend_02"
	},
	citadel_arena_survive_02 = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_survive_02"
	},
	citadel_arena_ascend_03 = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_ascend_03"
	},
	citadel_arena_survive_03 = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_survive_03"
	},
	citadel_arena_ascend_04 = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_ascend_04"
	},
	citadel_arena_open_gate = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_open_gate"
	},
	citadel_arena_survive_04 = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_survive_04"
	},
	citadel_arena_exit = {
		mission_template_name = "goal",
		text = "morris_citadel_arena_exit"
	},
	bay_exit_boat = {
		mission_template_name = "goal",
		text = "morris_bay_exit_boat"
	},
	forest_escape = {
		mission_template_name = "goal",
		text = "morris_forest_escape_horde"
	},
	arena_ice_survive_01 = {
		mission_template_name = "goal",
		text = "morris_arena_ice_survive_01"
	},
	arena_ice_descend = {
		mission_template_name = "goal",
		text = "morris_arena_ice_descend"
	},
	arena_ice_survive_02 = {
		mission_template_name = "goal",
		text = "morris_arena_ice_survive_02"
	},
	arena_ice_end = {
		mission_template_name = "goal",
		text = "morris_arena_ice_end"
	},
	arena_cave_survive = {
		mission_template_name = "goal",
		text = "morris_arena_cave_survive"
	},
	arena_cave_end = {
		mission_template_name = "goal",
		text = "morris_arena_cave_end"
	},
	arena_ruin_survive = {
		mission_template_name = "goal",
		text = "morris_arena_ruin_survive"
	},
	arena_ruin_end = {
		mission_template_name = "goal",
		text = "morris_arena_ruin_end"
	}
}

return
