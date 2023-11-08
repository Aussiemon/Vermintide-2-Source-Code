LevelSettings.dlc_castle = {
	act_unlock_order = 2,
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	display_name = "level_name_dlc_castle",
	act = "act_penny",
	loading_ui_package_name = "loading_screen_26",
	unlockable = true,
	level_image = "level_image_castle",
	use_mini_patrols = false,
	act_presentation_order = 3,
	description_text = "nik_castle_briefing_02",
	boss_spawning_method = "hand_placed",
	dlc_name = "penny",
	default_surface_material = "stone",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/penny/dlc_castle/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/penny/dlc_castle"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 8,
				painting_scrap = 3,
				potions = 5,
				grenades = 5,
				healing = {
					first_aid_kit = 5,
					healing_draught = 5
				},
				level_events = {
					explosive_barrel = 5,
					lamp_oil = 5
				}
			},
			secondary = {
				ammo = 5,
				grenades = 5,
				healing = 8,
				potions = 6
			}
		},
		normal = {
			primary = {
				ammo = 10,
				painting_scrap = 3,
				potions = 6,
				grenades = 10,
				healing = {
					first_aid_kit = 8,
					healing_draught = 8
				},
				level_events = {
					explosive_barrel = 6,
					lamp_oil = 6
				}
			},
			secondary = {
				ammo = 5,
				grenades = 5,
				healing = 10,
				potions = 8
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_castle_briefing_02",
		dr_engineer = {
			"pdr_de_castle_briefing_01",
			"pdr_de_castle_briefing_02"
		},
		we_thornsister = {
			"pwe_st_castle_briefing_01",
			"pwe_st_castle_briefing_02"
		},
		es_questingknight = {
			"pes_gk_castle_briefing_01",
			"pes_gk_castle_briefing_02"
		},
		wh_priest = {
			"pwh_wp_castle_briefing_01",
			"pwh_wp_castle_briefing_02"
		},
		bw_necromancer = {
			"pbw_nm_castle_briefing_01",
			"pbw_nm_castle_briefing_02"
		}
	},
	locations = {
		"dlc1_4_location_castle_ballroom",
		"dlc1_4_location_castle_before_sanctum",
		"dlc1_4_location_castle_floor_1",
		"dlc1_4_location_castle_floor_2",
		"dlc1_4_location_castle_catacombs",
		"dlc1_4_location_castle_entering_castle",
		"dlc1_4_location_castle_escape_catacombs",
		"dlc1_4_location_castle_inner_sanctum",
		"dlc1_4_location_castle_outside_end",
		"dlc1_4_location_castle_outside_start",
		"dlc1_4_location_castle_outside_bridge",
		"penny_location_castle_courtyard",
		"penny_location_castle_entrance_hall",
		"penny_location_castle_lower_catacombs",
		"penny_location_castle_ancient_tunnels",
		"penny_location_castle_royal_tombs",
		"penny_location_castle_catacombs_ritual",
		"penny_location_castle_catacombs_fountains",
		"penny_location_castle_grand_catacombs",
		"penny_location_castle_interior",
		"penny_location_castle_ballroom",
		"penny_location_castle_wine_cellar",
		"penny_location_castle_western_cells",
		"penny_location_castle_eastern_cells",
		"penny_location_castle_halls",
		"penny_location_castle_inner_courtyard",
		"penny_location_castle_courtyard_balcony",
		"penny_location_castle_stairwell",
		"penny_location_castle_study",
		"penny_location_castle_canyon_balcony",
		"penny_location_castle_throne_room_hallway",
		"penny_location_castle_throne_room",
		"penny_location_castle_escape_catacombs",
		"penny_location_castle_sarcophagus"
	},
	mission_selection_offset = {
		254,
		0,
		0
	}
}
