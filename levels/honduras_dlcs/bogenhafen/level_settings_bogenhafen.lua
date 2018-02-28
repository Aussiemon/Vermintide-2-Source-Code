LevelSettings.dlc_bogenhafen_slum = {
	ambient_sound_event = "silent_default_world_sound",
	display_name = "dlc_bogenhafen_slum",
	level_name = "levels/honduras_dlcs/bogenhafen/slum/world",
	climate_type = "",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	use_mini_patrols = true,
	dlc_name = "bogenhafen",
	boss_spawning_method = "hand_placed",
	default_surface_material = "dirt",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/dlcs/bogenhafen/slum",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	pickup_settings = {
		{
			primary = {
				ammo = 3,
				potions = 3,
				grenades = 3,
				healing = {
					first_aid_kit = 3,
					healing_draught = 3
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 3,
				grenades = 3,
				healing = 3,
				potions = 3
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_placeholder"
	},
	map_settings = {
		area = "helmgart",
		map_location = {
			2000,
			0
		}
	}
}
LevelSettings.dlc_bogenhafen_city = {
	ambient_sound_event = "silent_default_world_sound",
	display_name = "dlc_bogenhafen_city",
	level_name = "levels/honduras_dlcs/bogenhafen/city/world",
	climate_type = "",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	use_mini_patrols = true,
	dlc_name = "bogenhafen",
	boss_spawning_method = "hand_placed",
	default_surface_material = "dirt",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/dlcs/bogenhafen/city",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
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
		"location_bogenhafen_city_templecourtyard",
		"location_bogenhafen_city_temple",
		"location_bogenhafen_city_waystone"
	},
	pickup_settings = {
		{
			primary = {
				ammo = 3,
				potions = 3,
				grenades = 3,
				healing = {
					first_aid_kit = 3,
					healing_draught = 3
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 3,
				grenades = 3,
				healing = 3,
				potions = 3
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_placeholder"
	},
	map_settings = {
		area = "helmgart",
		map_location = {
			2000,
			0
		}
	}
}

return 
