-- chunkname: @levels/honduras_dlcs/termite/level_settings_termite_part_3.lua

LevelSettings.dlc_termite_3 = {
	act = "act_termite",
	act_presentation_order = 3,
	act_unlock_order = 3,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone",
	description_text = "nik_termite_3_briefing_01",
	display_name = "level_name_dlc_termite_3",
	dlc_name = "termite",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	level_image = "level_image_dlc_termite_3",
	level_name = "levels/honduras_dlcs/termite/dlc_termite_3/world",
	loading_ui_package_name = "loading_screen_verminous_3",
	player_aux_bus_name = "environment_reverb_outside",
	source_aux_bus_name = "environment_reverb_outside_source",
	unlockable = true,
	use_mini_patrols = false,
	packages = {
		"resource_packages/levels/dlcs/termite/dlc_termite_3",
	},
	level_particle_effects = {},
	level_screen_effects = {},
	boss_events = {
		max_events_of_this_kind = {
			event_boss = 1,
		},
	},
	pickup_settings = {
		default = {
			primary = {
				ammo = 8,
				grenades = 6,
				painting_scrap = 3,
				potions = 4,
				healing = {
					first_aid_kit = 6,
					healing_draught = 8,
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
		"nik_gateway_loading_screen_a_01",
		"nik_gateway_loading_screen_a_02",
		dr_engineer = {
			"pdr_de_gateway_loading_screen_a_01",
			"pdr_de_gateway_loading_screen_a_02",
		},
		we_thornsister = {
			"pwe_st_gateway_loading_screen_a_01",
			"pwe_st_gateway_loading_screen_a_02",
		},
		es_questingknight = {
			"pes_gk_gateway_loading_screen_a_01",
			"pes_gk_gateway_loading_screen_a_02",
		},
		wh_priest = {
			"pwh_wp_gateway_loading_screen_a_01",
			"pwh_wp_gateway_loading_screen_a_02",
		},
		bw_necromancer = {
			"pbw_nm_gateway_loading_screen_a_01",
			"pbw_nm_gateway_loading_screen_a_02",
		},
	},
	locations = {
		"location_termite_3_start_01",
		"location_termite_3_caves_01",
		"location_termite_3_caves_02",
		"location_termite_3_caves_03",
		"location_termite_3_temple_01",
		"location_termite_3_temple_02",
		"location_termite_3_temple_03",
		"location_termite_3_temple_04",
		"location_termite_3_chasm_01",
	},
	conflict_director_set = {
		"skaven",
	},
	mission_selection_offset = {
		246,
		0,
		0,
	},
}
