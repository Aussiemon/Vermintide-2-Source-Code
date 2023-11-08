LevelSettings.crater = {
	act_unlock_order = 0,
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	display_name = "level_name_crater",
	act = "act_scorpion",
	conflict_settings = "beastmen",
	unlockable = true,
	dlc_name = "scorpion",
	main_game_level = false,
	act_presentation_order = 1,
	description_text = "nik_crater_loading_screen_02",
	boss_spawning_method = "hand_placed",
	level_image = "level_icon_crater",
	loading_ui_package_name = "loading_screen_23",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/scorpion/crater/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/scorpion/crater"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 8,
				painting_scrap = 3,
				potions = 8,
				grenades = 8,
				healing = {
					first_aid_kit = 5,
					healing_draught = 8
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 4,
				grenades = 2,
				healing = 3,
				potions = 4
			}
		},
		normal = {
			primary = {
				ammo = 8,
				painting_scrap = 3,
				potions = 8,
				grenades = 6,
				healing = {
					first_aid_kit = 5,
					healing_draught = 8
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 4,
				grenades = 2,
				healing = 3,
				potions = 4
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_crater_loading_screen_01",
		"nik_crater_loading_screen_02",
		dr_engineer = {
			"pdr_de_crater_loading_screen_01",
			"pdr_de_crater_loading_screen_02"
		},
		we_thornsister = {
			"pwe_st_crater_loading_screen_01",
			"pwe_st_crater_loading_screen_02"
		},
		es_questingknight = {
			"pes_gk_crater_loading_screen_01",
			"pes_gk_crater_loading_screen_02"
		},
		wh_priest = {
			"pwh_wp_crater_loading_screen_01",
			"pwh_wp_crater_loading_screen_02"
		},
		bw_necromancer = {
			"pbw_nm_crater_loading_screen_01",
			"pbw_nm_crater_loading_screen_02"
		}
	},
	locations = {
		"location_crater_start",
		"location_crater_camp",
		"location_crater_stream",
		"location_crater_pass",
		"location_crater_mine",
		"location_crater_chasm",
		"location_crater_fault",
		"location_crater_tunnel",
		"location_crater_village",
		"location_crater_burning_forest",
		"location_crater_tunnel_2",
		"location_crater_impact_site",
		"location_crater_ritual_site",
		"location_crater_mine_hidden",
		"location_crater_stash"
	},
	mission_selection_offset = {
		0,
		40,
		0
	},
	allowed_locked_director_functions = {
		beastmen = true
	}
}
