-- chunkname: @levels/honduras_dlcs/termite/level_settings_termite_part_2.lua

LevelSettings.dlc_termite_2 = {
	act = "act_termite",
	act_presentation_order = 2,
	act_unlock_order = 2,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone",
	description_text = "nik_termite_2_briefing_01",
	display_name = "level_name_dlc_termite_2",
	dlc_name = "termite",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_image_dlc_termite_2",
	level_name = "levels/honduras_dlcs/termite/dlc_termite_2/world",
	loading_ui_package_name = "loading_screen_verminous_2",
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/dlcs/termite/dlc_termite_2",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 10,
				grenades = 8,
				painting_scrap = 3,
				potions = 6,
				healing = {
					first_aid_kit = 8,
					healing_draught = 10,
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
		normal = {
			primary = {
				ammo = 10,
				grenades = 8,
				painting_scrap = 3,
				potions = 6,
				healing = {
					first_aid_kit = 8,
					healing_draught = 10,
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
		"nik_power_loading_screen_a_01",
		"nik_power_loading_screen_a_02",
		dr_engineer = {
			"pdr_de_power_loading_screen_a_01",
			"pdr_de_power_loading_screen_a_02",
		},
		we_thornsister = {
			"pwe_st_power_loading_screen_a_01",
			"pwe_st_power_loading_screen_a_02",
		},
		es_questingknight = {
			"pes_gk_power_loading_screen_a_01",
			"pes_gk_power_loading_screen_a_02",
		},
		wh_priest = {
			"pwh_wp_power_loading_screen_a_01",
			"pwh_wp_power_loading_screen_a_02",
		},
		bw_necromancer = {
			"pbw_nm_power_loading_screen_a_01",
			"pbw_nm_power_loading_screen_a_02",
		},
	},
	locations = {
		"location_termite2_temple",
		"location_termite2_elevator",
		"location_termite2_town",
		"location_termite2_dwellings",
		"location_termite2_houses",
		"location_termite2_mining",
		"location_termite2_assembly",
		"location_termite2_scaffolds",
		"location_termite2_upper_town",
		"location_termite2_ravine",
	},
	conflict_director_set = {
		"skaven",
	},
	mission_selection_offset = {
		0,
		0,
		0,
	},
	render_settings_overrides = {
		particles_receive_shadows = true,
	},
}
