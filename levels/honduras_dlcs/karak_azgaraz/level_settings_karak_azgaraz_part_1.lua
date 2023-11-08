LevelSettings.dlc_dwarf_interior = {
	act_unlock_order = 0,
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	display_name = "dwarf_interior",
	act = "act_karak_azgaraz",
	conflict_settings = "skaven",
	unlockable = true,
	dlc_name = "karak_azgaraz_part_1",
	level_image = "dlc_dwarf_interior",
	description_text = "nik_dlc_dwarf_interior_loading_screen_01",
	act_presentation_order = 1,
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "loading_screen_dwarf_1",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/karak_azgaraz/dwarf_interior/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/karak_azgaraz/dlc_dwarf_interior"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 5,
				painting_scrap = 3,
				potions = 4,
				grenades = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 3
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 4,
				grenades = 2,
				healing = 4,
				potions = 2
			}
		},
		normal = {
			primary = {
				ammo = 10,
				painting_scrap = 3,
				potions = 8,
				grenades = 8,
				healing = {
					first_aid_kit = 6,
					healing_draught = 6
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 8,
				grenades = 4,
				healing = 8,
				potions = 4
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_dwarf_internal_loading_screen_01",
		"nik_dwarf_internal_loading_screen_02",
		dr_engineer = {
			"pdr_de_dwarf_internal_loading_screen_01",
			"pdr_de_dwarf_internal_loading_screen_02"
		},
		we_thornsister = {
			"pwe_st_dwarf_internal_loading_screen_01",
			"pwe_st_dwarf_internal_loading_screen_02"
		},
		es_questingknight = {
			"pes_gk_dwarf_internal_loading_screen_01",
			"pes_gk_dwarf_internal_loading_screen_02"
		},
		wh_priest = {
			"pwh_wp_dwarf_internal_loading_screen_01",
			"pwh_wp_dwarf_internal_loading_screen_02"
		},
		bw_necromancer = {
			"pbw_nm_dwarf_internal_loading_screen_01",
			"pbw_nm_dwarf_internal_loading_screen_02"
		}
	},
	locations = {
		"dlc1_5_dwarf_interior_location_bar_street_01",
		"dlc1_5_dwarf_interior_location_bar_street_02",
		"dlc1_5_dwarf_interior_location_brewery",
		"dlc1_5_dwarf_interior_location_great_hall_back",
		"dlc1_5_dwarf_interior_location_great_hall_downstairs",
		"dlc1_5_dwarf_interior_location_great_hall_upstairs",
		"dlc1_5_dwarf_interior_location_labyrinth",
		"dlc1_5_dwarf_interior_location_large_chasm_bridge",
		"dlc1_5_dwarf_interior_location_large_chasm_join_paths",
		"dlc1_5_dwarf_interior_location_railway",
		"dlc1_5_dwarf_interior_location_separating_paths",
		"dlc1_5_dwarf_interior_location_start",
		"dlc1_5_dwarf_interior_location_storage",
		"dlc1_5_dwarf_interior_location_temple_of_valaya"
	}
}
