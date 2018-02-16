WARM_CAMERA_BACKLIGHT = {
	intensity = 0,
	falloff_exponent = 1,
	end_falloff = 20,
	start_falloff = 2,
	color = Vector3Box(1, 0.8, 0.6)
}
COLD_CAMERA_BACKLIGHT = {
	intensity = 0.05,
	falloff_exponent = 1,
	end_falloff = 4,
	start_falloff = 0,
	color = Vector3Box(0.9, 0.7, 0.6)
}
LevelSettings = LevelSettings or {}
LevelSettings.combat = {
	display_name = "level_combat",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/honduras/debug/combat",
	use_mini_patrols = true,
	unlockable = false,
	level_image = "level_image_any",
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "loading_screen_1",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/debug/combat/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			ammo = 4,
			grenades = 4,
			healing = 8,
			potions = 4
		}
	},
	locations = {},
	darkness_settings = {
		player_light_intensity = 0.1,
		volumes = {
			"environment_darkness"
		}
	},
	map_settings = {
		area = "helmgart",
		map_location = {
			1700,
			0
		}
	}
}
LevelSettings.sound = {
	display_name = "Sound_Debug_Level",
	package_name = "resource_packages/levels/honduras/debug/sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/debug/sound/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {
		"fx/screenspace_raindrops"
	},
	locations = {},
	map_settings = {
		sorting = 1,
		icon = "level_location_dlc_icon_01",
		area = "world"
	}
}
LevelSettings.whitebox = {
	display_name = "Whitebox_Debug_Level",
	package_name = "resource_packages/levels/honduras/debug/whitebox",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/debug/whitebox/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	map_settings = {
		sorting = 1,
		icon = "level_location_dlc_icon_01",
		area = "world"
	}
}
LevelSettings.farmlands = {
	act_unlock_order = 0,
	display_name = "level_name_farmlands",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/honduras/farmlands",
	act = "act_3",
	boss_spawning_method = "hand_placed",
	unlockable = true,
	default_surface_material = "dirt",
	level_image = "level_icon_09",
	use_mini_patrols = false,
	act_presentation_order = 1,
	loading_ui_package_name = "loading_screen_7",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/farmlands/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			primary = {
				ammo = 8,
				potions = 4,
				grenades = 4,
				healing = {
					first_aid_kit = 5,
					healing_draught = 5
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 16,
				grenades = 10,
				healing = 12,
				potions = 8
			}
		}
	},
	locations = {
		"location_farmlands_farmlands",
		"location_farmlands_wet_field",
		"location_farmlands_oak_hill",
		"location_farmlands_farmstead_01",
		"location_farmlands_farmstead_02",
		"location_farmlands_farmstead_03"
	},
	map_settings = {
		icon = "map_icon_farmlands",
		area = "helmgart",
		map_location = {
			1450,
			260
		}
	}
}
LevelSettings.catacombs = {
	act_unlock_order = 1,
	display_name = "level_name_catacombs",
	default_surface_material = "stone",
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	act = "act_1",
	use_mini_patrols = false,
	unlockable = true,
	package_name = "resource_packages/levels/honduras/catacombs",
	level_image = "level_icon_03",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 2,
	loading_ui_package_name = "loading_screen_4",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/catacombs/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			primary = {
				ammo = 8,
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
			}
		},
		secondary = {
			ammo = 2,
			grenades = 2,
			healing = 2,
			potions = 2
		}
	},
	locations = {
		"location_catacombs_temple",
		"location_catacombs_hospice",
		"location_catacombs_library",
		"location_catacombs_sanitarium",
		"location_catacombs_helmgart_sewers",
		"location_catacombs_large_sewer_tunnel",
		"location_catacombs_puzzle_elevator",
		"location_catacombs_puzzle_room",
		"location_catacombs_nurgle_sewers_01",
		"location_catacombs_nurgle_sewers_02",
		"location_catacombs_nurgle_plaza",
		"location_catacombs_catacombs_start",
		"location_catacombs_large_staircase",
		"location_catacombs_large_cave_catacombs",
		"location_catacombs_cave_road_to_ritual",
		"location_catacombs_ritual_room",
		"location_catacombs_portal"
	},
	map_settings = {
		icon = "map_icon_shalya",
		area = "helmgart",
		map_location = {
			515,
			530
		}
	}
}
LevelSettings.elven_ruins = {
	act_unlock_order = 0,
	display_name = "level_name_elven_ruins",
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	act = "act_2",
	loading_ui_package_name = "loading_screen_6",
	unlockable = true,
	act_presentation_order = 1,
	level_name = "levels/honduras/elven_ruins/world",
	level_image = "level_icon_05",
	boss_spawning_method = "hand_placed",
	default_surface_material = "forest_grass",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/honduras/elven_ruins",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	pickup_settings = {
		{
			primary = {
				ammo = 6,
				potions = 3,
				grenades = 3,
				healing = {
					first_aid_kit = 3,
					healing_draught = 4
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 6,
				grenades = 4,
				healing = 6,
				potions = 5
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_elven_ruins_01",
		"nik_loading_screen_elven_ruins_02"
	},
	locations = {
		"location_elven_forest",
		"location_elven_maze",
		"location_elven_riverbed",
		"location_elven_ruins",
		"location_elven_start",
		"location_elven_puzzle",
		"location_elven_cave"
	},
	map_settings = {
		icon = "map_icon_elven_ruins",
		area = "helmgart",
		map_location = {
			762,
			787
		},
		wwise_events = {
			"nik_map_brief_elven_ruins_01",
			"nik_map_brief_elven_ruins_02"
		}
	}
}
LevelSettings.mines = {
	act_unlock_order = 2,
	display_name = "level_name_mines",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/honduras/mines",
	act = "act_1",
	use_mini_patrols = false,
	unlockable = true,
	level_image = "level_icon_02",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 3,
	loading_ui_package_name = "loading_screen_2",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/mines/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	camera_backlight = COLD_CAMERA_BACKLIGHT,
	darkness_settings = {
		disable_screen_fx = true,
		player_light_intensity = 0.15,
		volumes = {
			"environment_darkness_01",
			default_surface_material = "stone"
		}
	},
	pickup_settings = {
		{
			primary = {
				ammo = 8,
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
			}
		},
		secondary = {
			ammo = 2,
			grenades = 2,
			healing = 2,
			potions = 2
		}
	},
	locations = {
		"location_mines_mine",
		"location_mines_tilted_room",
		"location_mines_loading_dock",
		"location_mines_double_tracks",
		"location_mines_middle_troll_cave",
		"location_mines_middle_mine_cave",
		"location_mines_tunnel_crossing",
		"location_mines_dark_payload",
		"location_mines_dark_payload_loop",
		"location_mines_dark_payload_bridge",
		"location_mines_troll_pantry",
		"location_mines_large_troll_cave",
		"location_mines_end_event_cave"
	},
	map_settings = {
		icon = "map_icon_mines",
		area = "helmgart",
		map_location = {
			187,
			371
		}
	}
}
LevelSettings.ground_zero = {
	act_unlock_order = 3,
	display_name = "level_name_ground_zero",
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	boss_level = true,
	act = "act_1",
	package_name = "resource_packages/levels/honduras/ground_zero",
	unlockable = true,
	default_surface_material = "stone",
	level_image = "level_icon_04",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 4,
	loading_ui_package_name = "loading_screen_10",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/ground_zero/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	pickup_settings = {
		{
			primary = {
				ammo = 6,
				potions = 3,
				grenades = 3,
				healing = {
					first_aid_kit = 2,
					healing_draught = 3
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 8,
				grenades = 5,
				healing = 6,
				potions = 5
			}
		}
	},
	locations = {
		"location_ground_zero_upper_terrace",
		"location_ground_zero_lower_terrace",
		"location_ground_zero_canals",
		"location_ground_zero_hole",
		"location_ground_zero_center",
		"location_ground_zero_center_2",
		"location_ground_zero_boss",
		"location_ground_zero_end"
	},
	map_settings = {
		icon = "map_icon_ground_zero",
		area = "helmgart",
		map_location = {
			265,
			586
		}
	}
}
LevelSettings.fort = {
	act_unlock_order = 2,
	display_name = "level_name_forest_fort",
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	act = "act_2",
	package_name = "resource_packages/levels/honduras/fort",
	unlockable = true,
	loading_ui_package_name = "loading_screen_8",
	level_image = "level_icon_06",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 3,
	default_surface_material = "dirt",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/fort/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_fort_river_road",
		"location_fort_south_bridge",
		"location_fort_river_bank",
		"location_fort_river_crossing",
		"location_fort_rocky_path",
		"location_fort_muddy_path",
		"location_fort_hidden_entrance",
		"location_fort_inner_yard",
		"location_fort_north_yard",
		"location_fort_north_bridge"
	},
	pickup_settings = {
		{
			primary = {
				ammo = 14,
				potions = 5,
				grenades = 6,
				healing = {
					first_aid_kit = 6,
					healing_draught = 6
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 2
				}
			},
			secondary = {
				ammo = 12,
				grenades = 4,
				healing = 6,
				potions = 4
			}
		}
	},
	map_settings = {
		icon = "map_icon_fort",
		area = "helmgart",
		map_location = {
			1000,
			570
		}
	}
}
LevelSettings.ussingen = {
	act_unlock_order = 1,
	display_name = "level_name_ussingen",
	level_name = "levels/honduras/ussingen/world",
	climate_type = "",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	act = "act_3",
	loading_ui_package_name = "loading_screen_11",
	unlockable = true,
	level_image = "level_icon_10",
	use_mini_patrols = true,
	act_presentation_order = 2,
	ambient_sound_event = "silent_default_world_sound",
	boss_spawning_method = "hand_placed",
	default_surface_material = "dirt",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/honduras/ussingen",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_ussingen_outside_town",
		"location_ussingen_town",
		"location_ussingen_cellar_01",
		"location_ussingen_burnt_down_block",
		"location_ussingen_big_house",
		"location_ussingen_burning_corpses",
		"location_ussingen_cellar_02",
		"location_ussingen_before_mansion",
		"location_ussingen_mansion",
		"location_ussingen_after_mansion",
		"location_ussingen_leaving_town"
	},
	pickup_settings = {
		{
			primary = {
				ammo = 6,
				potions = 3,
				grenades = 3,
				healing = {
					first_aid_kit = 2,
					healing_draught = 3
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 8,
				grenades = 5,
				healing = 6,
				potions = 5
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_ussingen_01",
		"nik_loading_screen_ussingen_02"
	},
	map_settings = {
		icon = "map_icon_ussingen",
		area = "helmgart",
		map_location = {
			1275,
			358
		},
		wwise_events = {
			"nik_map_brief_ussingen_01",
			"nik_map_brief_ussingen_02"
		}
	}
}
LevelSettings.ussingen_demo = {
	act_unlock_order = 1,
	climate_type = "",
	knocked_down_setting = "knocked_down",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	package_name = "resource_packages/levels/honduras/debug/ussingen_demo",
	act = "act_3",
	ambient_sound_event = "silent_default_world_sound",
	unlockable = true,
	loading_ui_package_name = "loading_screen_how_to_play",
	use_mini_patrols = true,
	display_name = "level_name_ussingen",
	level_image = "level_icon_10",
	boss_spawning_method = "hand_placed",
	default_surface_material = "dirt",
	game_mode = "demo",
	conflict_settings = "demo",
	level_name = "levels/honduras/debug/ussingen_demo/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	pickup_settings = {
		{
			ammo = 12,
			potions = 8,
			grenades = 7,
			healing = 12,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3
			}
		},
		{
			ammo = 12,
			potions = 8,
			grenades = 7,
			healing = 13,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3
			}
		},
		{
			ammo = 12,
			potions = 8,
			grenades = 7,
			healing = 8,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3
			}
		},
		{
			ammo = 12,
			potions = 8,
			grenades = 7,
			healing = 8,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3
			}
		},
		{
			ammo = 12,
			potions = 8,
			grenades = 7,
			healing = 8,
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 3
			}
		}
	},
	map_settings = {
		icon = "map_icon_ussingen",
		area = "helmgart",
		map_location = {
			1320,
			313
		}
	}
}
LevelSettings.skaven_stronghold = {
	act_unlock_order = 3,
	display_name = "level_name_skaven_stronghold",
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	boss_level = true,
	act = "act_2",
	package_name = "resource_packages/levels/honduras/skaven_stronghold",
	unlockable = true,
	default_surface_material = "stone",
	level_image = "level_icon_08",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 4,
	loading_ui_package_name = "loading_screen_3",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/skaven_stronghold/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_stronghold_mountains",
		"location_stronghold_dwarf_entrance_hall",
		"location_stronghold_dwarf_interiors",
		"location_stronghold_dwarf_rail_tracks",
		"location_stronghold_dwarf_water_wheels",
		"location_stronghold_dwarf_foundry",
		"location_stronghold_skaven_city",
		"location_stronghold_skaven_transport_area",
		"location_stronghold_dwarf_aqueducts",
		"location_stronghold_warlord_nest"
	},
	pickup_settings = {
		{
			primary = {
				ammo = 8,
				potions = 4,
				grenades = 4,
				healing = {
					first_aid_kit = 5,
					healing_draught = 5
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 8,
				grenades = 4,
				healing = 4,
				potions = 4
			}
		}
	},
	map_settings = {
		icon = "map_icon_skaven_stronghold",
		area = "helmgart",
		map_location = {
			956,
			240
		}
	}
}
LevelSettings.military = {
	act_unlock_order = 0,
	display_name = "level_name_military",
	level_name = "levels/honduras/military/world",
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	act = "act_1",
	use_mini_patrols = false,
	unlockable = true,
	loading_ui_package_name = "loading_screen_13",
	act_presentation_order = 1,
	level_image = "level_icon_01",
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/honduras/military",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			primary = {
				ammo = 8,
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
			}
		},
		secondary = {
			ammo = 2,
			grenades = 2,
			healing = 2,
			potions = 2
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_helmgart_military_01",
		"nik_loading_screen_helmgart_military_02"
	},
	locations = {
		"location_military_streets",
		"location_military_fort",
		"location_military_tower",
		"location_military_interior",
		"location_military_wall_01",
		"location_military_wall_event",
		"location_military_wall_02",
		"location_military_wall_03",
		"location_military_road_to_temple",
		"location_military_temple"
	},
	map_settings = {
		icon = "map_icon_military",
		area = "helmgart",
		map_location = {
			510,
			230
		},
		wwise_events = {
			"nik_map_brief_helmgart_military_01",
			"nik_map_brief_helmgart_military_02"
		}
	}
}
LevelSettings.prologue = {
	display_name = "level_name_prologue",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/honduras/prologue",
	act = "prologue",
	conflict_settings = "tutorial",
	unlockable = true,
	use_mini_patrols = false,
	game_mode = "tutorial",
	level_image = "level_icon_01",
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "loading_screen_9",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/prologue/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			ammo = 4,
			grenades = 4,
			healing = 8,
			potions = 4
		}
	},
	locations = {}
}
LevelSettings.skittergate = {
	act_unlock_order = 0,
	display_name = "level_name_skittergate",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	boss_level = true,
	act = "act_4",
	use_mini_patrols = false,
	unlockable = true,
	package_name = "resource_packages/levels/honduras/skittergate",
	level_image = "level_icon_01",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 1,
	loading_ui_package_name = "loading_screen_14",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/skittergate/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			primary = {
				ammo = 16,
				potions = 5,
				grenades = 5,
				healing = {
					first_aid_kit = 5,
					healing_draught = 5
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 4,
				grenades = 2,
				healing = 2,
				potions = 2
			}
		}
	},
	locations = {
		"location_skittergate_helmgart",
		"location_skittergate_helmgart_sinkhole",
		"location_skittergate_helmgart_skittergate",
		"location_skittergate_norsca_skittergate",
		"location_skittergate_norsca_crater",
		"location_skittergate_norsca_sea",
		"location_skittergate_rotblood_docks",
		"location_skittergate_rotblood_camp"
	},
	map_settings = {
		icon = "map_icon_skittergate",
		area = "helmgart",
		map_location = {
			0,
			0
		}
	},
	required_acts = {
		"act_1",
		"act_2",
		"act_3"
	}
}
LevelSettings.bell = {
	act_unlock_order = 1,
	display_name = "level_name_bell",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/honduras/bell",
	act = "act_2",
	use_mini_patrols = false,
	unlockable = true,
	level_image = "level_icon_07",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 2,
	loading_ui_package_name = "loading_screen_1",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/bell/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			primary = {
				ammo = 16,
				potions = 6,
				grenades = 6,
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
				ammo = 8,
				grenades = 5,
				healing = 6,
				potions = 5
			}
		}
	},
	locations = {
		"location_bell_winery",
		"location_bell_boulevard",
		"location_bell_south",
		"location_bell_slums",
		"location_bell_market_alley",
		"location_bell_market",
		"location_bell_hill_street",
		"location_bell_hill_park",
		"location_bell_serpentine",
		"location_bell_mountain",
		"location_bell_northside",
		"location_bell_platz"
	},
	map_settings = {
		icon = "map_icon_bell",
		area = "helmgart",
		map_location = {
			720,
			400
		}
	}
}
LevelSettings.nurgle = {
	act_unlock_order = 2,
	display_name = "level_name_nurgle",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/honduras/nurgle",
	act = "act_3",
	use_mini_patrols = false,
	unlockable = true,
	level_image = "level_icon_11",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 3,
	loading_ui_package_name = "loading_screen_5",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/nurgle/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			primary = {
				ammo = 8,
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
			}
		},
		secondary = {
			ammo = 4,
			grenades = 2,
			healing = 3,
			potions = 2
		}
	},
	locations = {
		"location_nurgle_start_area",
		"location_nurgle_bandit_hideout_01",
		"location_nurgle_twin_bridge_canyon",
		"location_nurgle_big_cave",
		"location_nurgle_bandit_hideout_02",
		"location_nurgle_loading_dock",
		"location_nurgle_river",
		"location_nurgle_skaven_cave",
		"location_nurgle_nurgle_canyon_01",
		"location_nurgle_nurgle_canyon_02",
		"location_nurgle_small_plaza",
		"location_nurgle_vines_corridor",
		"location_nurgle_ruins",
		"location_nurgle_swamp",
		"location_nurgle_end_event"
	},
	darkness_settings = {
		player_light_intensity = 0.1,
		volumes = {
			"environment_darkness"
		}
	},
	map_settings = {
		icon = "map_icon_nurgle",
		area = "helmgart",
		map_location = {
			1440,
			520
		}
	}
}
LevelSettings.warcamp = {
	act_unlock_order = 3,
	display_name = "level_name_warcamp",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	boss_level = true,
	act = "act_3",
	boss_spawning_method = "hand_placed",
	unlockable = true,
	default_surface_material = "dirt",
	package_name = "resource_packages/levels/honduras/warcamp",
	level_image = "level_icon_12",
	use_mini_patrols = false,
	act_presentation_order = 4,
	loading_ui_package_name = "loading_screen_12",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/warcamp/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		{
			primary = {
				ammo = 8,
				potions = 4,
				grenades = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 5
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 6,
				grenades = 3,
				healing = 3,
				potions = 2
			}
		}
	},
	locations = {},
	locations = {
		"location_warcamp_intro",
		"location_warcamp_ravine",
		"location_warcamp_hermit",
		"location_warcamp_village",
		"location_warcamp_jagged_rocks",
		"location_warcamp_hanging_tree",
		"location_warcamp_supply_area",
		"location_warcamp_lower",
		"location_warcamp_middle",
		"location_warcamp_upper",
		"location_warcamp_arena"
	},
	map_settings = {
		icon = "map_icon_warcamp",
		area = "helmgart",
		map_location = {
			1252,
			652
		}
	}
}

return 
