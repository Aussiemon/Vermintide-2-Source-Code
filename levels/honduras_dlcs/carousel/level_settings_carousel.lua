-- chunkname: @levels/honduras_dlcs/carousel/level_settings_carousel.lua

local settings = DLCSettings.carousel

settings.missions = {
	bell_pvp_barrels = {
		collect_amount = 3,
		mission_template_name = "collect",
		text = "bell_pvp_barrels",
	},
	military_pvp_barrels = {
		collect_amount = 2,
		mission_template_name = "collect",
		text = "military_pvp_barrels",
	},
	versus_mission_survive_courtyard_01 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_05",
	},
	versus_mission_survive_courtyard_02 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_05",
	},
	versus_mission_survive_courtyard_03 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_05",
	},
	versus_mission_survive_courtyard_04 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_05",
	},
	versus_mission_survive_temple_01 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_20",
	},
	versus_mission_survive_temple_02 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_20",
	},
	versus_mission_survive_temple_02_B = {
		mission_template_name = "goal",
		text = "level_objective_description_military_20",
	},
	versus_mission_survive_temple_03 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_20",
	},
	versus_mission_survive_temple_04 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_20",
	},
	versus_mission_survive_temple_05 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_20",
	},
	versus_mission_survive_temple_06 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_20",
	},
	versus_mission_survive_temple_07 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_20",
	},
	versus_mission_survive_temple_08 = {
		mission_template_name = "goal",
		text = "level_objective_description_military_20",
	},
	versus_mission_objective_barricade_sockets = {
		mission_template_name = "goal",
		text = "level_objective_description_military_02",
	},
}
LevelSettings.carousel_hub = {
	ambient_sound_event = "silent_default_world_sound",
	conflict_settings = "inn_level",
	default_surface_material = "dirt",
	display_name = "level_name_carousel_hub",
	dlc_name = "carousel",
	environment_state = "exterior",
	game_mode = "inn_vs",
	has_multiple_loading_images = true,
	hub_level = true,
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_inn_level",
	level_name = "levels/honduras_dlcs/carousel/carousel_hub/world",
	load_no_enemies = false,
	loading_ui_package_name = "loading_screen_carousel",
	mechanism = "versus",
	no_bots_allowed = true,
	no_nav_mesh = false,
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	skip_generate_spawns = true,
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/carousel/carousel_hub",
		"resource_packages/levels/inn_dependencies",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	breed_categories = {
		{
			dynamic_loading = false,
			id = "keep_rats",
			breeds = {
				"critter_rat",
			},
		},
	},
	locations = {},
	loot_objectives = {},
	pickup_settings = {
		{
			primary = {
				ammo = 2,
				grenades = 5,
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
		},
	},
	supported_game_modes = {
		versus = true,
	},
}
LevelSettings.bell_pvp = {
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone_wet",
	description_text = "nik_loading_screen_bell_01",
	display_name = "level_name_bell",
	dlc_name = "carousel",
	environment_state = "exterior",
	game_mode = "versus",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_07",
	level_name = "levels/honduras_dlcs/carousel/bell_pvp/world",
	loading_ui_package_name = "loading_screen_1",
	main_game_level = false,
	mechanism = "versus",
	override_map_start_section = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/bell_common",
		"resource_packages/levels/honduras/bell",
		"resource_packages/levels/dlcs/carousel/bell_pvp_meta",
		"resource_packages/levels/dlcs/carousel/versus_dependencies",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	loading_screen_wwise_events = {
		"nik_loading_screen_bell_01",
		"nik_loading_screen_bell_02",
	},
	locations = {
		"location_bell_pvp_winery",
		"location_bell_pvp_boulevard",
		"location_bell_pvp_south",
		"location_bell_pvp_slums",
		"location_bell_pvp_market_alley",
		"location_bell_pvp_market",
		"location_bell_pvp_hill_street",
		"location_bell_pvp_hill_street_junction",
		"location_bell_pvp_hill_park",
		"location_bell_pvp_serpentine",
		"location_bell_pvp_mountain",
		"location_bell_pvp_northside",
		"location_bell_pvp_platz",
	},
	supported_game_modes = {
		versus = true,
	},
	round_end_camera_events = {
		[1] = "round_cam_bell_vs_round_1",
		[2] = "round_cam_bell_vs_round_2",
	},
}
LevelSettings.military_pvp = {
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone",
	description_text = "nik_loading_screen_helmgart_military_01",
	display_name = "level_name_military",
	dlc_name = "carousel",
	environment_state = "exterior",
	game_mode = "versus",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_01",
	level_name = "levels/honduras_dlcs/carousel/military_pvp/world",
	loading_ui_package_name = "loading_screen_13",
	main_game_level = false,
	mechanism = "versus",
	override_map_start_section = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/military_common",
		"resource_packages/levels/honduras/military",
		"resource_packages/levels/dlcs/carousel/military_pvp_meta",
		"resource_packages/levels/dlcs/carousel/versus_dependencies",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	loading_screen_wwise_events = {
		"nik_loading_screen_helmgart_military_01",
		"nik_loading_screen_helmgart_military_02",
	},
	locations = {
		"location_military_pvp_streets_01",
		"location_military_pvp_streets_02",
		"location_military_pvp_streets_03",
		"location_military_pvp_streets_04",
		"location_military_pvp_fort",
		"location_military_pvp_tower",
		"location_military_pvp_interior",
		"location_military_pvp_wall_01",
		"location_military_pvp_wall_event",
		"location_military_pvp_wall_02",
		"location_military_pvp_wall_03",
		"location_military_pvp_road_to_temple",
		"location_military_pvp_temple",
	},
	supported_game_modes = {
		versus = true,
	},
}
