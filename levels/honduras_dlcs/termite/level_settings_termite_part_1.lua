-- chunkname: @levels/honduras_dlcs/termite/level_settings_termite_part_1.lua

LevelSettings.dlc_termite_1 = {
	act = "act_termite",
	act_presentation_order = 1,
	act_unlock_order = 1,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone",
	description_text = "nik_termite_1_briefing_01",
	display_name = "level_name_dlc_termite_1",
	dlc_name = "termite",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_image_dlc_termite_1",
	level_name = "levels/honduras_dlcs/termite/dlc_termite_1/world",
	loading_ui_package_name = "loading_screen_verminous_1",
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/dlcs/termite/dlc_termite_1",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 8,
				grenades = 6,
				painting_scrap = 3,
				potions = 4,
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
				grenades = 8,
				healing = 8,
				potions = 8,
			},
		},
		normal = {
			primary = {
				ammo = 10,
				grenades = 8,
				painting_scrap = 3,
				potions = 6,
				healing = {
					first_aid_kit = 6,
					healing_draught = 6,
				},
				level_events = {
					explosive_barrel = 5,
					lamp_oil = 5,
				},
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 10,
				potions = 10,
			},
		},
	},
	loading_screen_wwise_events = {
		"nik_temple_loading_screen_a_01",
		"nik_temple_loading_screen_a_02",
		dr_engineer = {
			"pdr_de_temple_loading_screen_a_01",
			"pdr_de_temple_loading_screen_a_02",
		},
		we_thornsister = {
			"pwe_st_temple_loading_screen_a_01",
			"pwe_st_temple_loading_screen_a_02",
		},
		es_questingknight = {
			"pes_gk_temple_loading_screen_a_01",
			"pes_gk_temple_loading_screen_a_02",
		},
		wh_priest = {
			"pwh_wp_temple_loading_screen_a_01",
			"pwh_wp_temple_loading_screen_a_02",
		},
		bw_necromancer = {
			"pbw_nm_temple_loading_screen_a_01",
			"pbw_nm_temple_loading_screen_a_02",
		},
	},
	locations = {
		"location_termite_1_forest_01",
		"location_termite_1_lake_01",
		"location_termite_1_lake_shore",
		"location_termite_1_lakebed",
		"location_termite_1_temple_island",
		"location_termite_1_temple_01",
		"location_termite_1_temple_atrium",
		"location_termite_1_temple_yard_left",
		"location_termite_1_temple_yard_right",
		"location_termite_1_temple_center_hall",
		"location_termite_1_temple_pool",
	},
	mission_selection_offset = {
		-246,
		0,
		0,
	},
}
