-- chunkname: @scripts/settings/level_settings.lua

require("scripts/settings/game_mode_settings")

WARM_CAMERA_BACKLIGHT = {
	end_falloff = 20,
	falloff_exponent = 1,
	intensity = 0,
	start_falloff = 2,
	color = Vector3Box(1, 0.8, 0.6),
}
COLD_CAMERA_BACKLIGHT = {
	end_falloff = 5,
	falloff_exponent = 1,
	intensity = 0.015,
	start_falloff = 0,
	color = Vector3Box(0.9, 0.7, 0.6),
}
LevelSettings = LevelSettings or {}

require("scripts/settings/dlc_settings")
DLCUtils.dofile("level_settings")

LevelSettingsDefaultStartLevel = Development.parameter("gdc") and "magnus" or "inn_level"
DummyAnyLevel = {
	display_name = "map_screen_quickplay_button",
	level_id = "any",
	level_image = "level_image_any",
	small_level_image = "any_small_image",
}
LevelSettings.editor_level = {
	ambient_sound_event = "silent_default_world_sound",
	conflict_settings = "level_editor",
	display_name = "level_editor",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_image_any",
	level_name = "__level_editor_test",
	loading_ui_package_name = "loading_screen_1",
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/debug/whitebox",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
}
LevelSettings.inn_level = {
	ambient_sound_event = "silent_default_world_sound",
	conflict_settings = "inn_level",
	display_name = "level_name_keep",
	environment_state = "interior",
	game_mode = "inn",
	has_multiple_loading_images = true,
	hub_level = true,
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_inn_level",
	level_name = "levels/inn/world",
	load_no_enemies = false,
	loading_ui_package_name = "loading_screen_15",
	mechanism = "adventure",
	no_bots_allowed = true,
	no_nav_mesh = false,
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	skip_generate_spawns = true,
	source_aux_bus_name = "environment_reverb_outside_source",
	use_keep_decorations = true,
	packages = {
		"resource_packages/levels/inn_dependencies",
		"resource_packages/levels/inn",
		"resource_packages/levels/tomes/inn_tome",
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
	locations = {
		"location_keep_armoury",
		"location_keep_bardins_room",
		"location_keep_waystone",
		"location_keep_courtyard",
		"location_keep_forge",
		"location_keep_kerillians_room",
		"location_keep_krubers_room",
		"location_keep_saltzpyres_room",
		"location_keep_siennas_room",
		"location_keep_trophy_room",
		"location_keep_lohners_room",
		"location_keep_study",
		"location_keep_mysterious_tower",
	},
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
}
LevelSettings.inn_level_celebrate = {
	ambient_sound_event = "silent_default_world_sound",
	conflict_settings = "inn_level",
	display_name = "level_name_keep",
	environment_state = "interior",
	game_mode = "inn",
	has_multiple_loading_images = true,
	hub_level = true,
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_inn_level",
	level_name = "levels/inn/event_decoration/celebrate/world",
	load_no_enemies = false,
	loading_ui_package_name = "loading_screen_15",
	mechanism = "adventure",
	no_bots_allowed = true,
	no_nav_mesh = false,
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	skip_generate_spawns = true,
	small_level_image = "inn_level_small_image",
	source_aux_bus_name = "environment_reverb_outside_source",
	use_keep_decorations = true,
	packages = {
		"resource_packages/levels/inn_dependencies",
		"resource_packages/levels/inn",
		"resource_packages/levels/inn_celebrate",
		"resource_packages/levels/tomes/inn_celebrate_tome",
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
}
LevelSettings.inn_level_halloween = {
	ambient_sound_event = "silent_default_world_sound",
	conflict_settings = "inn_level",
	display_name = "level_name_keep",
	environment_state = "interior",
	game_mode = "inn",
	has_multiple_loading_images = true,
	hub_level = true,
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_inn_level",
	level_name = "levels/inn/event_decoration/halloween/world",
	load_no_enemies = false,
	loading_ui_package_name = "loading_screen_15",
	mechanism = "adventure",
	no_bots_allowed = true,
	no_nav_mesh = false,
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	skip_generate_spawns = true,
	small_level_image = "inn_level_small_image",
	source_aux_bus_name = "environment_reverb_outside_source",
	use_keep_decorations = true,
	packages = {
		"resource_packages/levels/inn_dependencies",
		"resource_packages/levels/inn",
		"resource_packages/levels/inn_halloween",
		"resource_packages/levels/tomes/inn_halloween_tome",
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
}
LevelSettings.inn_level_skulls = {
	ambient_sound_event = "silent_default_world_sound",
	conflict_settings = "inn_level",
	debug_environment_level_flow_event = "keep_event_skulls",
	display_name = "level_name_keep",
	environment_state = "interior",
	game_mode = "inn",
	has_multiple_loading_images = true,
	hub_level = true,
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_inn_level",
	level_name = "levels/inn/event_decoration/skulls/world",
	load_no_enemies = false,
	loading_ui_package_name = "loading_screen_15",
	mechanism = "adventure",
	no_bots_allowed = true,
	no_nav_mesh = false,
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	skip_generate_spawns = true,
	small_level_image = "inn_level_small_image",
	source_aux_bus_name = "environment_reverb_outside_source",
	use_keep_decorations = true,
	packages = {
		"resource_packages/levels/inn_dependencies",
		"resource_packages/levels/inn",
		"resource_packages/levels/inn_skulls",
		"resource_packages/levels/tomes/inn_skulls_tome",
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
}
LevelSettings.inn_level_sonnstill = {
	ambient_sound_event = "silent_default_world_sound",
	conflict_settings = "inn_level",
	debug_environment_level_flow_event = "keep_event_sonnstill",
	display_name = "level_name_keep",
	environment_state = "interior",
	game_mode = "inn",
	has_multiple_loading_images = true,
	hub_level = true,
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_inn_level",
	level_name = "levels/inn/event_decoration/sonnstill/world",
	load_no_enemies = false,
	loading_ui_package_name = "loading_screen_15",
	mechanism = "adventure",
	no_bots_allowed = true,
	no_nav_mesh = false,
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	skip_generate_spawns = true,
	small_level_image = "inn_level_small_image",
	source_aux_bus_name = "environment_reverb_outside_source",
	use_keep_decorations = true,
	packages = {
		"resource_packages/levels/inn_dependencies",
		"resource_packages/levels/inn",
		"resource_packages/levels/inn_sonnstill",
		"resource_packages/levels/tomes/inn_sonnstill_tome",
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
}
LevelSettings.farmlands = {
	act = "act_3",
	act_presentation_order = 1,
	act_unlock_order = 0,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "dirt",
	description_text = "nik_loading_screen_farmland_01",
	display_name = "level_name_farmlands",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_09",
	level_name = "levels/honduras/farmlands/world",
	loading_ui_package_name = "loading_screen_7",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/farmlands_common",
		"resource_packages/levels/honduras/farmlands",
		"resource_packages/levels/honduras/farmlands_meta",
	},
	environment_variations = {
		"wv_dawn_rain_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 4,
				grenades = 4,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 4,
					healing_draught = 3,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 3,
				grenades = 4,
				healing = 3,
				potions = 6,
			},
		},
		normal = {
			primary = {
				ammo = 8,
				grenades = 8,
				painting_scrap = 3,
				potions = 8,
				healing = {
					first_aid_kit = 8,
					healing_draught = 6,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 6,
				grenades = 8,
				healing = 6,
				potions = 12,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_farmland_01",
		"nik_loading_screen_farmland_02",
		dr_engineer = {
			"pdr_de_loading_screen_farmland_01",
			"pdr_de_loading_screen_farmland_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_farmland_01",
			"pwe_st_loading_screen_farmland_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_farmland_01",
			"pes_gk_loading_screen_farmland_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_farmland_01",
			"pwh_wp_loading_screen_farmland_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_farmland_01",
			"pbw_nm_loading_screen_farmland_02",
		},
	},
	locations = {
		"location_farmlands_farmlands",
		"location_farmlands_wet_field",
		"location_farmlands_oak_hill",
		"location_farmlands_farmstead_01",
		"location_farmlands_farmstead_02",
		"location_farmlands_farmstead_03",
	},
}
LevelSettings.catacombs = {
	act = "act_1",
	act_presentation_order = 2,
	act_unlock_order = 1,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone",
	description_text = "nik_loading_screen_catacombs_02",
	display_name = "level_name_catacombs",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_03",
	level_name = "levels/honduras/catacombs/world",
	loading_ui_package_name = "loading_screen_4",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/catacombs_common",
		"resource_packages/levels/honduras/catacombs",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 7,
				grenades = 4,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 5,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 2,
				grenades = 2,
				healing = 2,
				potions = 2,
			},
		},
		normal = {
			primary = {
				ammo = 14,
				grenades = 8,
				painting_scrap = 3,
				potions = 8,
				healing = {
					first_aid_kit = 6,
					healing_draught = 10,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 6,
				grenades = 8,
				healing = 6,
				potions = 12,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_catacombs_01",
		"nik_loading_screen_catacombs_02",
		dr_engineer = {
			"pdr_de_loading_screen_catacombs_01",
			"pdr_de_loading_screen_catacombs_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_catacombs_01",
			"pwe_st_loading_screen_catacombs_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_catacombs_01",
			"pes_gk_loading_screen_catacombs_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_catacombs_01",
			"pwh_wp_loading_screen_catacombs_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_catacombs_01",
			"pbw_nm_loading_screen_catacombs_02",
		},
	},
	locations = {
		"location_catacombs_temple",
		"location_catacombs_hospice",
		"location_catacombs_library",
		"location_catacombs_sanitarium",
		"location_catacombs_helmgart_sewers",
		"location_catacombs_large_sewer_tunnel",
		"location_catacombs_puzzle_elevator",
		"location_catacombs_puzzle_room",
		"location_catacombs_nurgle_sewers_01",
		"location_catacombs_nurgle_sewers_02",
		"location_catacombs_nurgle_plaza",
		"location_catacombs_catacombs_start",
		"location_catacombs_large_staircase",
		"location_catacombs_large_cave_catacombs",
		"location_catacombs_cave_road_to_ritual",
		"location_catacombs_ritual_room",
	},
}
LevelSettings.elven_ruins = {
	act = "act_2",
	act_presentation_order = 1,
	act_unlock_order = 0,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "forest_grass",
	description_text = "nik_loading_screen_elven_ruins_02",
	display_name = "level_name_elven_ruins",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_05",
	level_name = "levels/honduras/elven_ruins/world",
	loading_ui_package_name = "loading_screen_6",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	packages = {
		"resource_packages/levels/honduras/elven_ruins_common",
		"resource_packages/levels/honduras/elven_ruins",
	},
	environment_variations = {
		"wv_dawn_rain_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 3,
				grenades = 3,
				painting_scrap = 3,
				potions = 3,
				healing = {
					first_aid_kit = 3,
					healing_draught = 4,
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 4,
				grenades = 5,
				healing = 6,
				potions = 5,
			},
		},
		normal = {
			primary = {
				ammo = 6,
				grenades = 6,
				painting_scrap = 3,
				potions = 6,
				healing = {
					first_aid_kit = 6,
					healing_draught = 8,
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 8,
				grenades = 10,
				healing = 12,
				potions = 10,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_elven_ruins_01",
		"nik_loading_screen_elven_ruins_02",
		dr_engineer = {
			"pdr_de_loading_screen_elven_ruins_01",
			"pdr_de_loading_screen_elven_ruins_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_elven_ruins_01",
			"pwe_st_loading_screen_elven_ruins_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_elven_ruins_01",
			"pes_gk_loading_screen_elven_ruins_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_elven_ruins_01",
			"pwh_wp_loading_screen_elven_ruins_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_elven_ruins_01",
			"pbw_nm_loading_screen_elven_ruins_02",
		},
	},
	locations = {
		"location_elven_forest",
		"location_elven_maze",
		"location_elven_riverbed",
		"location_elven_ruins",
		"location_elven_start",
		"location_elven_puzzle",
		"location_elven_cave",
	},
}
LevelSettings.mines = {
	act = "act_1",
	act_presentation_order = 3,
	act_unlock_order = 2,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone",
	description_text = "nik_loading_screen_mines_01",
	display_name = "level_name_mines",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_02",
	level_name = "levels/honduras/mines/world",
	loading_ui_package_name = "loading_screen_2",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/mines_common",
		"resource_packages/levels/honduras/mines",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	camera_backlight = COLD_CAMERA_BACKLIGHT,
	boss_events = {
		max_events_of_this_kind = {
			event_boss = 1,
		},
	},
	darkness_settings = {
		disable_screen_fx = true,
		player_light_intensity = 0.15,
		volumes = {
			"environment_darkness_01",
		},
	},
	pickup_settings = {
		default = {
			primary = {
				ammo = 5,
				grenades = 4,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 5,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 2,
				grenades = 3,
				healing = 2,
				potions = 2,
			},
		},
		normal = {
			primary = {
				ammo = 10,
				grenades = 8,
				painting_scrap = 3,
				potions = 8,
				healing = {
					first_aid_kit = 6,
					healing_draught = 10,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 4,
				grenades = 6,
				healing = 4,
				potions = 4,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_mines_01",
		"nik_loading_screen_mines_02",
		dr_engineer = {
			"pdr_de_loading_screen_mines_01",
			"pdr_de_loading_screen_mines_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_mines_01",
			"pwe_st_loading_screen_mines_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_mines_01",
			"pes_gk_loading_screen_mines_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_mines_01",
			"pwh_wp_loading_screen_mines_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_mines_01",
			"pbw_nm_loading_screen_mines_02",
		},
	},
	locations = {
		"location_mines_mine",
		"location_mines_tilted_room",
		"location_mines_loading_dock",
		"location_mines_double_tracks",
		"location_mines_middle_troll_cave",
		"location_mines_middle_mine_cave",
		"location_mines_tunnel_crossing",
		"location_mines_dark_payload",
		"location_mines_dark_payload_loop",
		"location_mines_dark_payload_bridge",
		"location_mines_troll_pantry",
		"location_mines_large_troll_cave",
		"location_mines_end_event_cave",
	},
}
LevelSettings.ground_zero = {
	act = "act_1",
	act_presentation_order = 4,
	act_unlock_order = 3,
	ambient_sound_event = "silent_default_world_sound",
	boss_level = true,
	boss_spawning_method = "hand_placed",
	default_surface_material = "dirt",
	description_text = "nik_loading_screen_ground_zero_01",
	display_name = "level_name_ground_zero",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_04",
	level_name = "levels/honduras/ground_zero/world",
	loading_ui_package_name = "loading_screen_10",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	packages = {
		"resource_packages/levels/honduras/ground_zero_common",
		"resource_packages/levels/honduras/ground_zero",
	},
	environment_variations = {
		"wv_dusk_snow_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 4,
				grenades = 3,
				painting_scrap = 3,
				potions = 3,
				healing = {
					first_aid_kit = 2,
					healing_draught = 3,
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 4,
				grenades = 5,
				healing = 5,
				potions = 5,
			},
		},
		normal = {
			primary = {
				ammo = 8,
				grenades = 6,
				painting_scrap = 3,
				potions = 6,
				healing = {
					first_aid_kit = 4,
					healing_draught = 6,
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 8,
				grenades = 10,
				healing = 10,
				potions = 10,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_ground_zero_01",
		"nik_loading_screen_ground_zero_02",
		dr_engineer = {
			"pdr_de_loading_screen_ground_zero_01",
			"pdr_de_loading_screen_ground_zero_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_ground_zero_01",
			"pwe_st_loading_screen_ground_zero_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_ground_zero_01",
			"pes_gk_loading_screen_ground_zero_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_ground_zero_01",
			"pwh_wp_loading_screen_ground_zero_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_ground_zero_01",
			"pbw_nm_loading_screen_ground_zero_02",
		},
	},
	locations = {
		"location_ground_zero_upper_terrace",
		"location_ground_zero_lower_terrace",
		"location_ground_zero_canals",
		"location_ground_zero_hole",
		"location_ground_zero_center",
		"location_ground_zero_center_2",
		"location_ground_zero_boss",
		"location_ground_zero_end",
	},
}
LevelSettings.fort = {
	act = "act_2",
	act_presentation_order = 3,
	act_unlock_order = 2,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone_wet",
	description_text = "nik_loading_screen_fort_01",
	display_name = "level_name_forest_fort",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_06",
	level_name = "levels/honduras/fort/world",
	loading_ui_package_name = "loading_screen_8",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	packages = {
		"resource_packages/levels/honduras/fort_common",
		"resource_packages/levels/honduras/fort",
		"resource_packages/levels/honduras/fort_meta",
	},
	environment_variations = {
		"wv_dawn_snow_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_fort_river_road",
		"location_fort_south_bridge",
		"location_fort_river_bank",
		"location_fort_river_crossing",
		"location_fort_rocky_path",
		"location_fort_muddy_path",
		"location_fort_hidden_entrance",
		"location_fort_inner_yard",
		"location_fort_north_yard",
		"location_fort_north_bridge",
	},
	pickup_settings = {
		default = {
			primary = {
				ammo = 5,
				grenades = 6,
				painting_scrap = 3,
				potions = 5,
				healing = {
					first_aid_kit = 6,
					healing_draught = 6,
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 2,
				},
			},
			secondary = {
				ammo = 5,
				grenades = 4,
				healing = 5,
				potions = 4,
			},
		},
		normal = {
			primary = {
				ammo = 10,
				grenades = 12,
				painting_scrap = 3,
				potions = 10,
				healing = {
					first_aid_kit = 12,
					healing_draught = 12,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 10,
				potions = 8,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_fort_01",
		"nik_loading_screen_fort_02",
		dr_engineer = {
			"pdr_de_loading_screen_fort_01",
			"pdr_de_loading_screen_fort_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_fort_01",
			"pwe_st_loading_screen_fort_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_fort_01",
			"pes_gk_loading_screen_fort_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_fort_01",
			"pwh_wp_loading_screen_fort_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_fort_01",
			"pbw_nm_loading_screen_fort_02",
		},
	},
}
LevelSettings.ussingen = {
	act = "act_3",
	act_presentation_order = 2,
	act_unlock_order = 1,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	climate_type = "",
	default_surface_material = "dirt",
	description_text = "nik_loading_screen_ussingen_02",
	display_name = "level_name_ussingen",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_10",
	level_name = "levels/honduras/ussingen/world",
	loading_ui_package_name = "loading_screen_11",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = true,
	packages = {
		"resource_packages/levels/honduras/ussingen_common",
		"resource_packages/levels/honduras/ussingen",
	},
	environment_variations = {
		"wv_midnight_fog_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_ussingen_outside_town",
		"location_ussingen_town",
		"location_ussingen_cellar_01",
		"location_ussingen_burnt_down_block",
		"location_ussingen_big_house",
		"location_ussingen_burning_corpses",
		"location_ussingen_cellar_02",
		"location_ussingen_before_mansion",
		"location_ussingen_mansion",
		"location_ussingen_after_mansion",
		"location_ussingen_leaving_town",
	},
	pickup_settings = {
		default = {
			primary = {
				ammo = 4,
				grenades = 3,
				painting_scrap = 3,
				potions = 3,
				healing = {
					first_aid_kit = 2,
					healing_draught = 3,
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 3,
				grenades = 5,
				healing = 5,
				potions = 5,
			},
		},
		normal = {
			primary = {
				ammo = 8,
				grenades = 6,
				painting_scrap = 3,
				potions = 6,
				healing = {
					first_aid_kit = 4,
					healing_draught = 6,
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 6,
				grenades = 10,
				healing = 10,
				potions = 10,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_ussingen_01",
		"nik_loading_screen_ussingen_02",
		dr_engineer = {
			"pdr_de_loading_screen_ussingen_01",
			"pdr_de_loading_screen_ussingen_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_ussingen_01",
			"pwe_st_loading_screen_ussingen_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_ussingen_01",
			"pes_gk_loading_screen_ussingen_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_ussingen_01",
			"pwh_wp_loading_screen_ussingen_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_ussingen_01",
			"pbw_nm_loading_screen_ussingen_02",
		},
	},
}
LevelSettings.ussingen_demo = {
	act = "act_3",
	act_unlock_order = 1,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	climate_type = "",
	conflict_settings = "demo",
	default_surface_material = "dirt",
	display_name = "level_name_ussingen",
	environment_state = "exterior",
	game_mode = "demo",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_10",
	level_name = "levels/debug/ussingen_demo/world",
	loading_ui_package_name = "loading_screen_how_to_play",
	mechanism = "adventure",
	no_terror_events = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = true,
	packages = {
		"resource_packages/levels/debug/ussingen_demo",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	pickup_settings = {
		{
			ammo = 12,
			grenades = 7,
			healing = 12,
			potions = 8,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3,
			},
		},
		{
			ammo = 12,
			grenades = 7,
			healing = 13,
			potions = 8,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3,
			},
		},
		{
			ammo = 12,
			grenades = 7,
			healing = 8,
			potions = 8,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3,
			},
		},
		{
			ammo = 12,
			grenades = 7,
			healing = 8,
			potions = 8,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3,
			},
		},
		{
			ammo = 12,
			grenades = 7,
			healing = 8,
			potions = 8,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3,
			},
		},
	},
}
LevelSettings.skaven_stronghold = {
	act = "act_2",
	act_presentation_order = 4,
	act_unlock_order = 3,
	ambient_sound_event = "silent_default_world_sound",
	boss_level = true,
	boss_spawning_method = "hand_placed",
	conflict_settings = "skaven",
	default_surface_material = "stone",
	description_text = "nik_loading_screen_skaven_stronghold_01",
	display_name = "level_name_skaven_stronghold",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_08",
	level_name = "levels/honduras/skaven_stronghold/world",
	loading_ui_package_name = "loading_screen_3",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	packages = {
		"resource_packages/levels/honduras/skaven_stronghold_common",
		"resource_packages/levels/honduras/skaven_stronghold",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_stronghold_mountains",
		"location_stronghold_dwarf_entrance_hall",
		"location_stronghold_dwarf_interiors",
		"location_stronghold_dwarf_rail_tracks",
		"location_stronghold_dwarf_water_wheels",
		"location_stronghold_dwarf_foundry",
		"location_stronghold_skaven_city",
		"location_stronghold_skaven_transport_area",
		"location_stronghold_dwarf_aqueducts",
		"location_stronghold_warlord_nest",
	},
	pickup_settings = {
		default = {
			primary = {
				ammo = 4,
				grenades = 4,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 5,
					healing_draught = 5,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 4,
				grenades = 4,
				healing = 4,
				potions = 4,
			},
		},
		normal = {
			primary = {
				ammo = 8,
				grenades = 8,
				painting_scrap = 3,
				potions = 8,
				healing = {
					first_aid_kit = 10,
					healing_draught = 10,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 8,
				grenades = 8,
				healing = 8,
				potions = 8,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_skaven_stronghold_01",
		"nik_loading_screen_skaven_stronghold_02",
		dr_engineer = {
			"pdr_de_loading_screen_skaven_stronghold_01",
			"pdr_de_loading_screen_skaven_stronghold_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_skaven_stronghold_01",
			"pwe_st_loading_screen_skaven_stronghold_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_skaven_stronghold_01",
			"pes_gk_loading_screen_skaven_stronghold_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_skaven_stronghold_01",
			"pwh_wp_loading_screen_skaven_stronghold_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_skaven_stronghold_01",
			"pbw_nm_loading_screen_skaven_stronghold_02",
		},
	},
}
LevelSettings.military = {
	act = "act_1",
	act_presentation_order = 1,
	act_unlock_order = 0,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone",
	description_text = "nik_loading_screen_helmgart_military_01",
	display_name = "level_name_military",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_01",
	level_name = "levels/honduras/military/world",
	loading_ui_package_name = "loading_screen_13",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/military_common",
		"resource_packages/levels/honduras/military",
		"resource_packages/levels/honduras/military_meta",
	},
	environment_variations = {
		"wv_midnight_storm_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 4,
				grenades = 4,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 5,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 3,
				grenades = 2,
				healing = 2,
				potions = 2,
			},
		},
		normal = {
			primary = {
				ammo = 4,
				grenades = 8,
				painting_scrap = 3,
				potions = 8,
				healing = {
					first_aid_kit = 6,
					healing_draught = 10,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 6,
				grenades = 8,
				healing = 6,
				potions = 12,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_helmgart_military_01",
		"nik_loading_screen_helmgart_military_02",
		dr_engineer = {
			"pdr_de_loading_screen_helmgart_military_01",
			"pdr_de_loading_screen_helmgart_military_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_helmgart_military_01",
			"pwe_st_loading_screen_helmgart_military_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_helmgart_military_01",
			"pes_gk_loading_screen_helmgart_military_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_helmgart_military_01",
			"pwh_wp_loading_screen_helmgart_military_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_helmgart_military_01",
			"pbw_nm_loading_screen_helmgart_military_02",
		},
	},
	locations = {
		"location_military_streets_01",
		"location_military_streets_02",
		"location_military_streets_03",
		"location_military_streets_04",
		"location_military_fort",
		"location_military_tower",
		"location_military_interior",
		"location_military_wall_01",
		"location_military_wall_event",
		"location_military_wall_02",
		"location_military_wall_03",
		"location_military_road_to_temple",
		"location_military_temple",
	},
}
LevelSettings.prologue = {
	act = "prologue",
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	conflict_settings = "tutorial",
	default_surface_material = "stone_wet",
	display_name = "level_name_prologue",
	environment_state = "exterior",
	game_mode = "tutorial",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_00",
	level_name = "levels/honduras/prologue/world",
	loading_ui_package_name = "loading_screen_9",
	main_game_level = true,
	mechanism = "adventure",
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	tutorial_level = true,
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/prologue",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			ammo = 4,
			grenades = 4,
			healing = 8,
			potions = 4,
		},
	},
	rare_events = {
		disabled = true,
	},
	locations = {},
	loot_objectives = {},
}
LevelSettings.skittergate = {
	act = "act_4",
	act_presentation_order = 1,
	act_unlock_order = 0,
	ambient_sound_event = "silent_default_world_sound",
	boss_level = true,
	boss_spawning_method = "hand_placed",
	default_surface_material = "dirt",
	description_text = "nik_loading_screen_skittergate_01",
	display_name = "level_name_skittergate",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_13",
	level_name = "levels/honduras/skittergate/world",
	loading_ui_package_name = "loading_screen_14",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/skittergate_common",
		"resource_packages/levels/honduras/skittergate",
	},
	environment_variations = {
		"wv_midnight_snow_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 8,
				grenades = 7,
				painting_scrap = 3,
				potions = 7,
				healing = {
					first_aid_kit = 8,
					healing_draught = 8,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 5,
				grenades = 4,
				healing = 5,
				potions = 4,
			},
		},
		normal = {
			primary = {
				ammo = 16,
				grenades = 14,
				painting_scrap = 3,
				potions = 14,
				healing = {
					first_aid_kit = 16,
					healing_draught = 16,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 10,
				potions = 8,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_skittergate_01",
		"nik_loading_screen_skittergate_02",
		dr_engineer = {
			"pdr_de_loading_screen_skittergate_01",
			"pdr_de_loading_screen_skittergate_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_skittergate_01",
			"pwe_st_loading_screen_skittergate_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_skittergate_01",
			"pes_gk_loading_screen_skittergate_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_skittergate_01",
			"pwh_wp_loading_screen_skittergate_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_skittergate_01",
			"pbw_nm_loading_screen_skittergate_02",
		},
	},
	locations = {
		"location_skittergate_helmgart",
		"location_skittergate_helmgart_sinkhole",
		"location_skittergate_helmgart_skittergate",
		"location_skittergate_norsca_skittergate",
		"location_skittergate_norsca_crater",
		"location_skittergate_norsca_sea",
		"location_skittergate_rotblood_docks",
		"location_skittergate_rotblood_camp",
	},
	required_acts = {
		"act_1",
		"act_2",
		"act_3",
	},
}
LevelSettings.bell = {
	act = "act_2",
	act_presentation_order = 2,
	act_unlock_order = 1,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone_wet",
	description_text = "nik_loading_screen_bell_01",
	display_name = "level_name_bell",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_07",
	level_name = "levels/honduras/bell/world",
	loading_ui_package_name = "loading_screen_1",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/bell_common",
		"resource_packages/levels/honduras/bell",
		"resource_packages/levels/honduras/bell_meta",
	},
	environment_variations = {
		"wv_dusk_snow_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 6,
				grenades = 6,
				painting_scrap = 3,
				potions = 6,
				healing = {
					first_aid_kit = 5,
					healing_draught = 5,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 6,
				grenades = 5,
				healing = 5,
				potions = 5,
			},
		},
		normal = {
			primary = {
				ammo = 12,
				grenades = 12,
				painting_scrap = 3,
				potions = 12,
				healing = {
					first_aid_kit = 10,
					healing_draught = 10,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 12,
				grenades = 10,
				healing = 10,
				potions = 10,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_bell_01",
		"nik_loading_screen_bell_02",
		dr_engineer = {
			"pdr_de_loading_screen_bell_01",
			"pdr_de_loading_screen_bell_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_bell_01",
			"pwe_st_loading_screen_bell_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_bell_01",
			"pes_gk_loading_screen_bell_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_bell_01",
			"pwh_wp_loading_screen_bell_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_bell_01",
			"pbw_nm_loading_screen_bell_02",
		},
	},
	locations = {
		"location_bell_winery",
		"location_bell_boulevard",
		"location_bell_south",
		"location_bell_slums",
		"location_bell_market_alley",
		"location_bell_market",
		"location_bell_hill_street",
		"location_bell_hill_street_junction",
		"location_bell_hill_park",
		"location_bell_serpentine",
		"location_bell_mountain",
		"location_bell_northside",
		"location_bell_platz",
	},
}
LevelSettings.nurgle = {
	act = "act_3",
	act_presentation_order = 3,
	act_unlock_order = 2,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "mud",
	description_text = "nik_loading_screen_nurgle_01",
	display_name = "level_name_nurgle",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_11",
	level_name = "levels/honduras/nurgle/world",
	loading_ui_package_name = "loading_screen_5",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/nurgle",
	},
	environment_variations = {
		"wv_midnight_storm_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 5,
				grenades = 4,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 3,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 4,
				grenades = 2,
				healing = 4,
				potions = 2,
			},
		},
		normal = {
			primary = {
				ammo = 10,
				grenades = 8,
				painting_scrap = 3,
				potions = 8,
				healing = {
					first_aid_kit = 6,
					healing_draught = 6,
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4,
				},
			},
			secondary = {
				ammo = 8,
				grenades = 4,
				healing = 8,
				potions = 4,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_nurgle_01_short",
		"nik_loading_screen_nurgle_02_short",
		dr_engineer = {
			"pdr_de_loading_screen_nurgle_01",
			"pdr_de_loading_screen_nurgle_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_nurgle_01",
			"pwe_st_loading_screen_nurgle_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_nurgle_01",
			"pes_gk_loading_screen_nurgle_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_nurgle_01",
			"pwh_wp_loading_screen_nurgle_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_nurgle_01",
			"pbw_nm_loading_screen_nurgle_02",
		},
	},
	locations = {
		"location_nurgle_start_area",
		"location_nurgle_bandit_hideout_01",
		"location_nurgle_twin_bridge_canyon",
		"location_nurgle_big_cave",
		"location_nurgle_bandit_hideout_02",
		"location_nurgle_loading_dock",
		"location_nurgle_river",
		"location_nurgle_skaven_cave",
		"location_nurgle_nurgle_canyon_01",
		"location_nurgle_nurgle_canyon_02",
		"location_nurgle_small_plaza",
		"location_nurgle_vines_corridor",
		"location_nurgle_ruins",
		"location_nurgle_swamp",
		"location_nurgle_end_event",
	},
	darkness_settings = {
		player_light_intensity = 0.1,
		volumes = {
			"environment_darkness",
		},
	},
}
LevelSettings.warcamp = {
	act = "act_3",
	act_presentation_order = 4,
	act_unlock_order = 3,
	ambient_sound_event = "silent_default_world_sound",
	boss_level = true,
	boss_spawning_method = "hand_placed",
	default_surface_material = "mud",
	description_text = "nik_loading_screen_chaos_war_camp_01",
	display_name = "level_name_warcamp",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_icon_12",
	level_name = "levels/honduras/warcamp/world",
	loading_ui_package_name = "loading_screen_12",
	main_game_level = true,
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/honduras/warcamp_common",
		"resource_packages/levels/honduras/warcamp",
	},
	environment_variations = {
		"wv_midnight_fog_01",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 5,
				grenades = 4,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 5,
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 2,
				},
			},
			secondary = {
				ammo = 4,
				grenades = 3,
				healing = 3,
				potions = 2,
			},
		},
		normal = {
			primary = {
				ammo = 10,
				grenades = 8,
				painting_scrap = 3,
				potions = 8,
				healing = {
					first_aid_kit = 6,
					healing_draught = 10,
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 3,
				},
			},
			secondary = {
				ammo = 8,
				grenades = 6,
				healing = 6,
				potions = 4,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_chaos_war_camp_01",
		"nik_loading_screen_chaos_war_camp_02",
		dr_engineer = {
			"pdr_de_loading_screen_chaos_war_camp_01",
			"pdr_de_loading_screen_chaos_war_camp_02",
		},
		we_thornsister = {
			"pwe_st_loading_screen_chaos_war_camp_01",
			"pwe_st_loading_screen_chaos_war_camp_02",
		},
		es_questingknight = {
			"pes_gk_loading_screen_chaos_war_camp_01",
			"pes_gk_loading_screen_chaos_war_camp_02",
		},
		wh_priest = {
			"pwh_wp_loading_screen_chaos_war_camp_01",
			"pwh_wp_loading_screen_chaos_war_camp_02",
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_chaos_war_camp_01",
			"pbw_nm_loading_screen_chaos_war_camp_02",
		},
	},
	locations = {
		"location_warcamp_intro",
		"location_warcamp_ravine",
		"location_warcamp_hermit",
		"location_warcamp_village",
		"location_warcamp_jagged_rocks",
		"location_warcamp_hanging_tree",
		"location_warcamp_supply_area",
		"location_warcamp_lower",
		"location_warcamp_middle",
		"location_warcamp_upper",
		"location_warcamp_arena",
	},
}

for level_key, level_data in pairs(LevelSettings) do
	if level_data.display_name then
		level_data.level_id = level_key
		level_data.mechanism = level_data.mechanism or "adventure"
		level_data.act_unlock_order = level_data.act_unlock_order or 0

		if level_data.mechanism == "adventure" then
			level_data.loot_objectives = level_data.loot_objectives or {
				grimoire = 2,
				loot_die = 0,
				painting_scrap = 0,
				tome = 3,
			}
		end
	end
end

local level_settings = LevelSettings

for _, dlc in pairs(DLCSettings) do
	local extra_level_packages = dlc.extra_level_packages

	if extra_level_packages then
		for level_key, extra_packages in pairs(extra_level_packages) do
			local settings = level_settings[level_key]

			if settings then
				local packages = settings.packages

				table.append(packages, extra_packages)
			end
		end
	end
end

dofile("scripts/settings/level_unlock_settings")
