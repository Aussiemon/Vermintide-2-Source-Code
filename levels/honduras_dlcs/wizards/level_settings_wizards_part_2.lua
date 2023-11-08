LevelSettings.dlc_wizards_tower = {
	act_unlock_order = 1,
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	display_name = "level_name_dlc_wizards_tower",
	act = "act_wizards",
	level_image = "area_icon_wizards",
	unlockable = true,
	use_mini_patrols = false,
	dlc_name = "wizards_part_2",
	description_text = "nik_wizard_tower_loading_screen_01",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 2,
	ambient_sound_event = "silent_default_world_sound",
	loading_ui_package_name = "loading_screen_31",
	conflict_settings = "chaos",
	level_name = "levels/honduras_dlcs/wizards/dlc_wizards_tower/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/wizards/dlc_wizards_tower"
	},
	hero_specific_packages = {
		bright_wizard = {
			"resource_packages/levels/dlcs/wizards/dlc_wizards_tower_sub_bw"
		},
		dwarf_ranger = {
			"resource_packages/levels/dlcs/wizards/dlc_wizards_tower_sub_dr"
		},
		empire_soldier = {
			"resource_packages/levels/dlcs/wizards/dlc_wizards_tower_sub_es"
		},
		witch_hunter = {
			"resource_packages/levels/dlcs/wizards/dlc_wizards_tower_sub_wh"
		},
		wood_elf = {
			"resource_packages/levels/dlcs/wizards/dlc_wizards_tower_sub_we"
		}
	},
	hero_specific_sublevels = {
		bright_wizard = {
			"levels/honduras_dlcs/wizards/dlc_wizards_tower/sublevels/dlc_wizards_tower_sub_bw"
		},
		dwarf_ranger = {
			"levels/honduras_dlcs/wizards/dlc_wizards_tower/sublevels/dlc_wizards_tower_sub_dr"
		},
		empire_soldier = {
			"levels/honduras_dlcs/wizards/dlc_wizards_tower/sublevels/dlc_wizards_tower_sub_es"
		},
		witch_hunter = {
			"levels/honduras_dlcs/wizards/dlc_wizards_tower/sublevels/dlc_wizards_tower_sub_wh"
		},
		wood_elf = {
			"levels/honduras_dlcs/wizards/dlc_wizards_tower/sublevels/dlc_wizards_tower_sub_we"
		}
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
		"nik_wizard_tower_loading_screen_01",
		"nik_wizard_tower_loading_screen_02",
		dr_engineer = {
			"pdr_de_wizard_tower_loading_screen_01",
			"pdr_de_wizard_tower_loading_screen_02"
		},
		we_thornsister = {
			"pwe_st_wizard_tower_loading_screen_01",
			"pwe_st_wizard_tower_loading_screen_02"
		},
		es_questingknight = {
			"pes_gk_wizard_tower_loading_screen_01",
			"pes_gk_wizard_tower_loading_screen_02"
		},
		wh_priest = {
			"pwh_wp_wizard_tower_loading_screen_01",
			"pwh_wp_wizard_tower_loading_screen_02"
		},
		bw_necromancer = {
			"pbw_nm_wizard_tower_loading_screen_01",
			"pbw_nm_wizard_tower_loading_screen_02"
		}
	},
	locations = {
		"location_wiztower_apothecary",
		"location_wiztower_dining_hall",
		"location_wiztower_end_room_olesya",
		"location_wiztower_end_tower",
		"location_wiztower_fiery_stairs",
		"location_wiztower_hall_of_mirrors",
		"location_wiztower_jungle",
		"location_wiztower_laboratory",
		"location_wiztower_laboratory_2",
		"location_wiztower_leapoffaith",
		"location_wiztower_main_library",
		"location_wiztower_observatory",
		"location_wiztower_old_brewery",
		"location_wiztower_small_library",
		"location_wiztower_snowbridge",
		"location_wiztower_start_tower"
	}
}
