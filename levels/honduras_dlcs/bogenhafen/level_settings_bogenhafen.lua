LevelSettings.dlc_bogenhafen_slum = {
	act_unlock_order = 0,
	climate_type = "",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	display_name = "level_name_bogenhafen_slum",
	act = "act_bogenhafen",
	level_image = "level_icon_bgh_pit",
	unlockable = true,
	use_mini_patrols = true,
	dlc_name = "bogenhafen",
	description_text = "nik_loading_screen_dlc_pit_01",
	act_presentation_order = 1,
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "loading_screen_16",
	default_surface_material = "dirt",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/bogenhafen/slum/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/bogenhafen/slum"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_bogenhafen_slum_backstreets",
		"location_bogenhafen_slum_bridge_road",
		"location_bogenhafen_slum_broken_bridge",
		"location_bogenhafen_slum_broken_wall_interior",
		"location_bogenhafen_slum_dock_area",
		"location_bogenhafen_slum_east_slum",
		"location_bogenhafen_slum_east_wall",
		"location_bogenhafen_slum_event_area",
		"location_bogenhafen_slum_fish_market",
		"location_bogenhafen_slum_hill",
		"location_bogenhafen_slum_north_slum",
		"location_bogenhafen_slum_river",
		"location_bogenhafen_slum_river_gauntlet",
		"location_bogenhafen_slum_south_slum",
		"location_bogenhafen_slum_underpass",
		"location_bogenhafen_slum_west_tower"
	},
	pickup_settings = {
		{
			primary = {
				ammo = 6,
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
				ammo = 5,
				grenades = 5,
				healing = 5,
				potions = 5
			}
		},
		normal = {
			primary = {
				ammo = 6,
				painting_scrap = 3,
				potions = 6,
				grenades = 6,
				healing = {
					first_aid_kit = 6,
					healing_draught = 8
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 8,
				grenades = 10,
				healing = 12,
				potions = 10
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_dlc_pit_01",
		"nik_loading_screen_dlc_pit_02",
		dr_engineer = {
			"pdr_de_loading_screen_dlc_pit_01",
			"pdr_de_loading_screen_dlc_pit_02"
		},
		we_thornsister = {
			"pwe_st_loading_screen_dlc_pit_01",
			"pwe_st_loading_screen_dlc_pit_02"
		},
		es_questingknight = {
			"pes_gk_loading_screen_dlc_pit_01",
			"pes_gk_loading_screen_dlc_pit_02"
		},
		wh_priest = {
			"pwh_wp_loading_screen_dlc_pit_01",
			"pwh_wp_loading_screen_dlc_pit_02"
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_dlc_pit_01",
			"pbw_nm_loading_screen_dlc_pit_02"
		}
	}
}
LevelSettings.dlc_bogenhafen_city = {
	act_unlock_order = 1,
	climate_type = "",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	display_name = "level_name_bogenhafen_city",
	act = "act_bogenhafen",
	level_image = "level_icon_bgh_city",
	loading_ui_package_name = "loading_screen_17",
	use_mini_patrols = true,
	description_text = "nik_loading_screen_dlc_bogenhafen_01",
	dlc_name = "bogenhafen",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 2,
	ambient_sound_event = "ambience_bogenhafen_city_night",
	default_surface_material = "stone",
	unlockable = true,
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/bogenhafen/city/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/bogenhafen/city"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	camera_backlight = COLD_CAMERA_BACKLIGHT,
	locations = {
		"location_bogenhafen_city_cove",
		"location_bogenhafen_city_sewers",
		"location_bogenhafen_city_basement",
		"location_bogenhafen_city_sewersstairs",
		"location_bogenhafen_city_mainstreet",
		"location_bogenhafen_city_bridge",
		"location_bogenhafen_city_marketsquare",
		"location_bogenhafen_city_templestreet",
		"location_bogenhafen_city_scaffold",
		"location_bogenhafen_city_backstreets",
		"location_bogenhafen_city_shipping_company",
		"location_bogenhafen_city_street01",
		"location_bogenhafen_city_street02",
		"location_bogenhafen_city_street03",
		"location_bogenhafen_city_street04",
		"location_bogenhafen_city_street05",
		"location_bogenhafen_city_street06",
		"location_bogenhafen_city_square01",
		"location_bogenhafen_city_square02",
		"location_bogenhafen_city_templecourtyard",
		"location_bogenhafen_city_temple",
		"location_bogenhafen_city_waystone"
	},
	darkness_settings = {
		disable_screen_fx = true,
		player_light_intensity = 0.15,
		volumes = {
			"sewerlight"
		}
	},
	pickup_settings = {
		{
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
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 4,
				grenades = 5,
				healing = 6,
				potions = 5
			}
		},
		normal = {
			primary = {
				ammo = 4,
				painting_scrap = 3,
				potions = 8,
				grenades = 8,
				healing = {
					first_aid_kit = 6,
					healing_draught = 10
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 8,
				grenades = 10,
				healing = 12,
				potions = 10
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_dlc_bogenhafen_01",
		"nik_loading_screen_dlc_bogenhafen_02",
		dr_engineer = {
			"pdr_de_loading_screen_dlc_bogenhafen_01",
			"pdr_de_loading_screen_dlc_bogenhafen_02"
		},
		we_thornsister = {
			"pwe_st_loading_screen_dlc_bogenhafen_01",
			"pwe_st_loading_screen_dlc_bogenhafen_02"
		},
		es_questingknight = {
			"pes_gk_loading_screen_dlc_bogenhafen_01",
			"pes_gk_loading_screen_dlc_bogenhafen_02"
		},
		wh_priest = {
			"pwh_wp_loading_screen_dlc_bogenhafen_01",
			"pwh_wp_loading_screen_dlc_bogenhafen_02"
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_dlc_bogenhafen_01",
			"pbw_nm_loading_screen_dlc_bogenhafen_02"
		}
	}
}
