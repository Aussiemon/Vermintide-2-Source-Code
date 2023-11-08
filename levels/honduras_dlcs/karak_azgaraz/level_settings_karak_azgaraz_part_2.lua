LevelSettings.dlc_dwarf_exterior = {
	act_unlock_order = 1,
	ambient_sound_event = "silent_default_world_sound",
	climate_type = "snow",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_karak_azgaraz",
	description_text = "nik_dlc_dwarf_exterior_loading_screen_01",
	unlockable = true,
	display_name = "dwarf_exterior",
	dlc_name = "karak_azgaraz_part_2",
	use_mini_patrols = false,
	level_image = "dlc_dwarf_exterior",
	no_terror_events = false,
	boss_spawning_method = "hand_placed",
	act_presentation_order = 2,
	loading_ui_package_name = "loading_screen_dwarf_2",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/karak_azgaraz/dwarf_exterior/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/karak_azgaraz/dlc_dwarf_exterior"
	},
	level_particle_effects = {},
	level_screen_effects = {},
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
		"nik_dwarf_external_loading_screen_01",
		"nik_dwarf_external_loading_screen_02",
		"nde_dwarf_external_loading_screen_01",
		"nde_dwarf_external_loading_screen_02",
		dr_engineer = {
			"pdr_de_dwarf_external_loading_screen_01",
			"pdr_de_dwarf_external_loading_screen_02"
		},
		we_thornsister = {
			"pwe_st_dwarf_external_loading_screen_01",
			"pwe_st_dwarf_external_loading_screen_02"
		},
		es_questingknight = {
			"pes_gk_dwarf_external_loading_screen_01",
			"pes_gk_dwarf_external_loading_screen_02"
		},
		wh_priest = {
			"pwh_wp_dwarf_external_loading_screen_01",
			"pwh_wp_dwarf_external_loading_screen_02"
		},
		bw_necromancer = {
			"pbw_nm_dwarf_external_loading_screen_01",
			"pbw_nm_dwarf_external_loading_screen_02"
		}
	},
	locations = {
		"dlc1_5_dwarf_exterior_location_forest_outskirts",
		"dlc1_5_dwarf_exterior_location_secret_path",
		"dlc1_5_dwarf_exterior_location_main_road",
		"dlc1_5_dwarf_exterior_location_dwarf_guard_post",
		"dlc1_5_dwarf_exterior_location_wilderness",
		"dlc1_5_dwarf_exterior_location_frozen_lake",
		"dlc1_5_dwarf_exterior_location_frozen_stream",
		"dlc1_5_dwarf_exterior_location_mining_path",
		"dlc1_5_dwarf_exterior_location_railyard",
		"dlc1_5_dwarf_exterior_location_hidden_cave",
		"dlc1_5_dwarf_exterior_location_chamber_area"
	}
}
