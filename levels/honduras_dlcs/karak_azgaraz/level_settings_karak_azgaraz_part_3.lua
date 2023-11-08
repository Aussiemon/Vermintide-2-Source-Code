LevelSettings.dlc_dwarf_beacons = {
	act_unlock_order = 2,
	ambient_sound_event = "silent_default_world_sound",
	climate_type = "snow",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	display_name = "dwarf_beacons",
	act = "act_karak_azgaraz",
	level_image = "dlc_dwarf_beacons",
	unlockable = true,
	knocked_down_setting = "knocked_down",
	dlc_name = "karak_azgaraz_part_3",
	use_mini_patrols = false,
	description_text = "nik_dlc_dwarf_beacons_loading_screen_01",
	boss_spawning_method = "hand_placed",
	no_terror_events = false,
	act_presentation_order = 3,
	loading_ui_package_name = "loading_screen_dwarf_3",
	level_name = "levels/honduras_dlcs/karak_azgaraz/dwarf_beacons/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/karak_azgaraz/dlc_dwarf_beacons"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"dlc_1_5_location_beacons_icecave",
		"dlc_1_5_location_beacons_firstforest",
		"dlc_1_5_location_beacons_town",
		"dlc_1_5_location_beacons_stair",
		"dlc_1_5_location_beacons_beacon",
		"dlc_1_5_location_beacons_iceriver",
		"dlc_1_5_location_beacons_pumphouse",
		"dlc_1_5_location_beacons_left_ridge",
		"dlc_1_5_location_beacons_right_ridge",
		"dlc_1_5_location_beacons_copper_tarn"
	},
	pickup_settings = {
		default = {
			primary = {
				ammo = 5,
				painting_scrap = 3,
				potions = 5,
				grenades = 5,
				healing = {
					first_aid_kit = 4,
					healing_draught = 6
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 4,
				grenades = 3,
				healing = 3,
				potions = 3
			}
		},
		normal = {
			primary = {
				ammo = 4,
				painting_scrap = 3,
				potions = 4,
				grenades = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 5
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 3,
				grenades = 2,
				healing = 2,
				potions = 2
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_dwarf_beacons_loading_screen_01",
		"nik_dwarf_beacons_loading_screen_02",
		"nde_dwarf_beacons_loading_screen_01",
		"nde_dwarf_beacons_loading_screen_02",
		dr_engineer = {
			"pdr_de_dwarf_beacons_loading_screen_01",
			"pdr_de_dwarf_beacons_loading_screen_02"
		},
		we_thornsister = {
			"pwe_st_dwarf_beacons_loading_screen_01",
			"pwe_st_dwarf_beacons_loading_screen_02"
		},
		es_questingknight = {
			"pes_gk_dwarf_beacons_loading_screen_01",
			"pes_gk_dwarf_beacons_loading_screen_02"
		},
		wh_priest = {
			"pwh_wp_dwarf_beacons_loading_screen_01",
			"pwh_wp_dwarf_beacons_loading_screen_02"
		},
		bw_necromancer = {
			"pbw_nm_dwarf_beacons_loading_screen_01",
			"pbw_nm_dwarf_beacons_loading_screen_02"
		}
	}
}
