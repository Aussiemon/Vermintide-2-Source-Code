require("scripts/settings/game_mode_settings")

WARM_CAMERA_BACKLIGHT = {
	intensity = 0,
	falloff_exponent = 1,
	end_falloff = 20,
	start_falloff = 2,
	color = Vector3Box(1, 0.8, 0.6)
}
COLD_CAMERA_BACKLIGHT = {
	intensity = 0.015,
	falloff_exponent = 1,
	end_falloff = 5,
	start_falloff = 0,
	color = Vector3Box(0.9, 0.7, 0.6)
}
LevelSettings = LevelSettings or {}

require("scripts/settings/dlc_settings")

for _, dlc in pairs(DLCSettings) do
	local level_settings = dlc.level_settings

	if level_settings then
		dofile(level_settings)
	end
end

local default_start_level = (Development.parameter("gdc") and "magnus") or "inn_level"
LevelSettings.default_start_level = default_start_level
LevelSettings.editor_level = {
	conflict_settings = "level_editor",
	no_terror_events = true,
	package_name = "resource_packages/levels/debug/whitebox",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	ambient_sound_event = "silent_default_world_sound",
	level_name = "__level_editor_test",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	display_name = "level_editor",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {}
}
LevelSettings.inn_level = {
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/inn",
	display_name = "level_name_keep",
	environment_state = "interior",
	knocked_down_setting = "knocked_down",
	use_keep_decorations = true,
	level_image = "level_icon_inn_level",
	has_multiple_loading_images = true,
	no_bots_allowed = true,
	hub_level = true,
	ambient_sound_event = "silent_default_world_sound",
	load_no_enemies = true,
	no_terror_events = true,
	loading_ui_package_name = "loading_screen_15",
	conflict_settings = "disabled",
	level_name = "levels/inn/world",
	no_nav_mesh = false,
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_keep_armoury",
		"location_keep_bardins_room",
		"location_keep_waystone",
		"location_keep_courtyard",
		"location_keep_forge",
		"location_keep_kerillians_room",
		"location_keep_krubers_room",
		"location_keep_saltzpyres_room",
		"location_keep_siennas_room",
		"location_keep_trophy_room",
		"location_keep_lohners_room",
		"location_keep_study",
		"location_keep_mysterious_tower"
	},
	loot_objectives = {},
	pickup_settings = {
		{
			primary = {
				grenades = 5,
				ammo = 2,
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			}
		}
	}
}
LevelSettings.inn_level_celebrate = {
	no_bots_allowed = true,
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/inn_celebrate",
	display_name = "level_name_keep",
	environment_state = "interior",
	knocked_down_setting = "knocked_down",
	use_keep_decorations = true,
	level_image = "level_icon_inn_level",
	has_multiple_loading_images = true,
	hub_level = true,
	ambient_sound_event = "silent_default_world_sound",
	load_no_enemies = true,
	no_terror_events = true,
	loading_ui_package_name = "loading_screen_15",
	conflict_settings = "disabled",
	level_name = "levels/inn/event_decoration/celebrate/world",
	no_nav_mesh = false,
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {}
}
LevelSettings.inn_level_halloween = {
	no_bots_allowed = true,
	player_aux_bus_name = "environment_reverb_outside",
	package_name = "resource_packages/levels/inn_halloween",
	display_name = "level_name_keep",
	environment_state = "interior",
	knocked_down_setting = "knocked_down",
	use_keep_decorations = true,
	level_image = "level_icon_inn_level",
	has_multiple_loading_images = true,
	hub_level = true,
	ambient_sound_event = "silent_default_world_sound",
	load_no_enemies = true,
	no_terror_events = true,
	loading_ui_package_name = "loading_screen_15",
	conflict_settings = "disabled",
	level_name = "levels/inn/event_decoration/halloween/world",
	no_nav_mesh = false,
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {}
}
LevelSettings.farmlands = {
	act_unlock_order = 0,
	display_name = "level_name_farmlands",
	package_name = "resource_packages/levels/honduras/farmlands",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_3",
	loading_ui_package_name = "loading_screen_7",
	unlockable = true,
	description_text = "nik_loading_screen_farmland_01",
	main_game_level = true,
	act_presentation_order = 1,
	level_image = "level_icon_09",
	use_mini_patrols = false,
	boss_spawning_method = "hand_placed",
	default_surface_material = "dirt",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/farmlands/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 4,
				painting_scrap = 3,
				potions = 4,
				grenades = 4,
				healing = {
					first_aid_kit = 4,
					healing_draught = 3
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 3,
				grenades = 4,
				healing = 3,
				potions = 6
			}
		},
		normal = {
			primary = {
				ammo = 8,
				painting_scrap = 3,
				potions = 8,
				grenades = 8,
				healing = {
					first_aid_kit = 8,
					healing_draught = 6
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 6,
				grenades = 8,
				healing = 6,
				potions = 12
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_farmland_01",
		"nik_loading_screen_farmland_02"
	},
	locations = {
		"location_farmlands_farmlands",
		"location_farmlands_wet_field",
		"location_farmlands_oak_hill",
		"location_farmlands_farmstead_01",
		"location_farmlands_farmstead_02",
		"location_farmlands_farmstead_03"
	}
}
LevelSettings.catacombs = {
	act_unlock_order = 1,
	display_name = "level_name_catacombs",
	package_name = "resource_packages/levels/honduras/catacombs",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_1",
	loading_ui_package_name = "loading_screen_4",
	unlockable = true,
	level_image = "level_icon_03",
	main_game_level = true,
	act_presentation_order = 2,
	description_text = "nik_loading_screen_catacombs_02",
	boss_spawning_method = "hand_placed",
	use_mini_patrols = false,
	default_surface_material = "stone",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/catacombs/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 7,
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
				ammo = 2,
				grenades = 2,
				healing = 2,
				potions = 2
			}
		},
		normal = {
			primary = {
				ammo = 14,
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
				ammo = 6,
				grenades = 8,
				healing = 6,
				potions = 12
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_catacombs_01",
		"nik_loading_screen_catacombs_02"
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
		"location_catacombs_ritual_room"
	}
}
LevelSettings.elven_ruins = {
	act_unlock_order = 0,
	display_name = "level_name_elven_ruins",
	package_name = "resource_packages/levels/honduras/elven_ruins",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_2",
	unlockable = true,
	loading_ui_package_name = "loading_screen_6",
	main_game_level = true,
	description_text = "nik_loading_screen_elven_ruins_02",
	level_image = "level_icon_05",
	act_presentation_order = 1,
	boss_spawning_method = "hand_placed",
	default_surface_material = "forest_grass",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/elven_ruins/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 3,
				painting_scrap = 3,
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
				ammo = 4,
				grenades = 5,
				healing = 6,
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
	}
}
LevelSettings.mines = {
	act_unlock_order = 2,
	display_name = "level_name_mines",
	level_name = "levels/honduras/mines/world",
	environment_state = "exterior",
	description_text = "nik_loading_screen_mines_01",
	act = "act_1",
	level_image = "level_icon_02",
	loading_ui_package_name = "loading_screen_2",
	main_game_level = true,
	ambient_sound_event = "silent_default_world_sound",
	unlockable = true,
	boss_spawning_method = "hand_placed",
	act_presentation_order = 3,
	player_aux_bus_name = "environment_reverb_outside",
	default_surface_material = "stone",
	use_mini_patrols = false,
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/honduras/mines",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	camera_backlight = COLD_CAMERA_BACKLIGHT,
	boss_events = {
		max_events_of_this_kind = {
			event_boss = 1
		}
	},
	darkness_settings = {
		disable_screen_fx = true,
		player_light_intensity = 0.15,
		volumes = {
			"environment_darkness_01"
		}
	},
	pickup_settings = {
		default = {
			primary = {
				ammo = 5,
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
				ammo = 2,
				grenades = 3,
				healing = 2,
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
					healing_draught = 10
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 4,
				grenades = 6,
				healing = 4,
				potions = 4
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_mines_01",
		"nik_loading_screen_mines_02"
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
	}
}
LevelSettings.ground_zero = {
	act_unlock_order = 3,
	display_name = "level_name_ground_zero",
	package_name = "resource_packages/levels/honduras/ground_zero",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	boss_level = true,
	act = "act_1",
	loading_ui_package_name = "loading_screen_10",
	unlockable = true,
	level_image = "level_icon_04",
	main_game_level = true,
	description_text = "nik_loading_screen_ground_zero_01",
	boss_spawning_method = "hand_placed",
	act_presentation_order = 4,
	default_surface_material = "dirt",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/ground_zero/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 4,
				painting_scrap = 3,
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
				ammo = 4,
				grenades = 5,
				healing = 5,
				potions = 5
			}
		},
		normal = {
			primary = {
				ammo = 8,
				painting_scrap = 3,
				potions = 6,
				grenades = 6,
				healing = {
					first_aid_kit = 4,
					healing_draught = 6
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 8,
				grenades = 10,
				healing = 10,
				potions = 10
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_ground_zero_01",
		"nik_loading_screen_ground_zero_02"
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
	}
}
LevelSettings.fort = {
	act_unlock_order = 2,
	display_name = "level_name_forest_fort",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_2",
	loading_ui_package_name = "loading_screen_8",
	unlockable = true,
	level_name = "levels/honduras/fort/world",
	main_game_level = true,
	level_image = "level_icon_06",
	description_text = "nik_loading_screen_fort_01",
	act_presentation_order = 3,
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone_wet",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/honduras/fort",
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
		default = {
			primary = {
				ammo = 5,
				painting_scrap = 3,
				potions = 5,
				grenades = 6,
				healing = {
					first_aid_kit = 6,
					healing_draught = 6
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 2
				}
			},
			secondary = {
				ammo = 5,
				grenades = 4,
				healing = 5,
				potions = 4
			}
		},
		normal = {
			primary = {
				ammo = 10,
				painting_scrap = 3,
				potions = 10,
				grenades = 12,
				healing = {
					first_aid_kit = 12,
					healing_draught = 12
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 10,
				potions = 8
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_fort_01",
		"nik_loading_screen_fort_02"
	}
}
LevelSettings.ussingen = {
	act_unlock_order = 1,
	display_name = "level_name_ussingen",
	ambient_sound_event = "silent_default_world_sound",
	climate_type = "",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_3",
	level_image = "level_icon_10",
	unlockable = true,
	use_mini_patrols = true,
	main_game_level = true,
	loading_ui_package_name = "loading_screen_11",
	description_text = "nik_loading_screen_ussingen_02",
	act_presentation_order = 2,
	boss_spawning_method = "hand_placed",
	level_name = "levels/honduras/ussingen/world",
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
		default = {
			primary = {
				ammo = 4,
				painting_scrap = 3,
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
				ammo = 3,
				grenades = 5,
				healing = 5,
				potions = 5
			}
		},
		normal = {
			primary = {
				ammo = 8,
				painting_scrap = 3,
				potions = 6,
				grenades = 6,
				healing = {
					first_aid_kit = 4,
					healing_draught = 6
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 6,
				grenades = 10,
				healing = 10,
				potions = 10
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_ussingen_01",
		"nik_loading_screen_ussingen_02"
	}
}
LevelSettings.ussingen_demo = {
	act_unlock_order = 1,
	climate_type = "",
	knocked_down_setting = "knocked_down",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	package_name = "resource_packages/levels/debug/ussingen_demo",
	act = "act_3",
	ambient_sound_event = "silent_default_world_sound",
	unlockable = true,
	loading_ui_package_name = "loading_screen_how_to_play",
	use_mini_patrols = true,
	display_name = "level_name_ussingen",
	level_image = "level_icon_10",
	boss_spawning_method = "hand_placed",
	no_terror_events = true,
	default_surface_material = "dirt",
	game_mode = "demo",
	conflict_settings = "demo",
	level_name = "levels/debug/ussingen_demo/world",
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
	}
}
LevelSettings.skaven_stronghold = {
	act_unlock_order = 3,
	display_name = "level_name_skaven_stronghold",
	package_name = "resource_packages/levels/honduras/skaven_stronghold",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	boss_level = true,
	act = "act_2",
	loading_ui_package_name = "loading_screen_3",
	unlockable = true,
	level_image = "level_icon_08",
	main_game_level = true,
	act_presentation_order = 4,
	description_text = "nik_loading_screen_skaven_stronghold_01",
	boss_spawning_method = "hand_placed",
	conflict_settings = "skaven",
	default_surface_material = "stone",
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
		default = {
			primary = {
				ammo = 4,
				painting_scrap = 3,
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
				ammo = 4,
				grenades = 4,
				healing = 4,
				potions = 4
			}
		},
		normal = {
			primary = {
				ammo = 8,
				painting_scrap = 3,
				potions = 8,
				grenades = 8,
				healing = {
					first_aid_kit = 10,
					healing_draught = 10
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 8,
				grenades = 8,
				healing = 8,
				potions = 8
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_skaven_stronghold_01",
		"nik_loading_screen_skaven_stronghold_02"
	}
}
LevelSettings.military = {
	act_unlock_order = 0,
	display_name = "level_name_military",
	package_name = "resource_packages/levels/honduras/military",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_1",
	loading_ui_package_name = "loading_screen_13",
	unlockable = true,
	level_image = "level_icon_01",
	main_game_level = true,
	act_presentation_order = 1,
	description_text = "nik_loading_screen_helmgart_military_01",
	boss_spawning_method = "hand_placed",
	use_mini_patrols = false,
	default_surface_material = "stone",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/military/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
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
				ammo = 3,
				grenades = 2,
				healing = 2,
				potions = 2
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
				ammo = 6,
				grenades = 8,
				healing = 6,
				potions = 12
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_helmgart_military_01",
		"nik_loading_screen_helmgart_military_02"
	},
	locations = {
		"location_military_streets_01",
		"location_military_streets_02",
		"location_military_streets_03",
		"location_military_streets_04",
		"location_military_fort",
		"location_military_tower",
		"location_military_interior",
		"location_military_wall_01",
		"location_military_wall_event",
		"location_military_wall_02",
		"location_military_wall_03",
		"location_military_road_to_temple",
		"location_military_temple"
	}
}
LevelSettings.prologue = {
	display_name = "level_name_prologue",
	default_surface_material = "stone_wet",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "prologue",
	unlockable = true,
	conflict_settings = "tutorial",
	main_game_level = true,
	level_name = "levels/honduras/prologue/world",
	level_image = "level_icon_00",
	boss_spawning_method = "hand_placed",
	use_mini_patrols = false,
	game_mode = "tutorial",
	loading_ui_package_name = "loading_screen_9",
	knocked_down_setting = "knocked_down",
	package_name = "resource_packages/levels/honduras/prologue",
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
	rare_events = {
		disabled = true
	},
	locations = {},
	loot_objectives = {}
}
LevelSettings.skittergate = {
	act_unlock_order = 0,
	display_name = "level_name_skittergate",
	package_name = "resource_packages/levels/honduras/skittergate",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	boss_level = true,
	act = "act_4",
	loading_ui_package_name = "loading_screen_14",
	unlockable = true,
	description_text = "nik_loading_screen_skittergate_01",
	main_game_level = true,
	act_presentation_order = 1,
	level_image = "level_icon_13",
	use_mini_patrols = false,
	default_surface_material = "dirt",
	boss_spawning_method = "hand_placed",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/skittergate/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 8,
				painting_scrap = 3,
				potions = 7,
				grenades = 7,
				healing = {
					first_aid_kit = 8,
					healing_draught = 8
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 5,
				grenades = 4,
				healing = 5,
				potions = 4
			}
		},
		normal = {
			primary = {
				ammo = 16,
				painting_scrap = 3,
				potions = 14,
				grenades = 14,
				healing = {
					first_aid_kit = 16,
					healing_draught = 16
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 10,
				potions = 8
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_skittergate_01",
		"nik_loading_screen_skittergate_02"
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
	required_acts = {
		"act_1",
		"act_2",
		"act_3"
	}
}
LevelSettings.bell = {
	act_unlock_order = 1,
	display_name = "level_name_bell",
	package_name = "resource_packages/levels/honduras/bell",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_2",
	loading_ui_package_name = "loading_screen_1",
	unlockable = true,
	description_text = "nik_loading_screen_bell_01",
	main_game_level = true,
	act_presentation_order = 2,
	level_image = "level_icon_07",
	use_mini_patrols = false,
	boss_spawning_method = "hand_placed",
	default_surface_material = "stone_wet",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/bell/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 6,
				painting_scrap = 3,
				potions = 6,
				grenades = 6,
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
				ammo = 6,
				grenades = 5,
				healing = 5,
				potions = 5
			}
		},
		normal = {
			primary = {
				ammo = 12,
				painting_scrap = 3,
				potions = 12,
				grenades = 12,
				healing = {
					first_aid_kit = 10,
					healing_draught = 10
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 12,
				grenades = 10,
				healing = 10,
				potions = 10
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_bell_01",
		"nik_loading_screen_bell_02"
	},
	locations = {
		"location_bell_winery",
		"location_bell_boulevard",
		"location_bell_south",
		"location_bell_slums",
		"location_bell_market_alley",
		"location_bell_market",
		"location_bell_hill_street",
		"location_bell_hill_street_junction",
		"location_bell_hill_park",
		"location_bell_serpentine",
		"location_bell_mountain",
		"location_bell_northside",
		"location_bell_platz"
	}
}
LevelSettings.nurgle = {
	act_unlock_order = 2,
	display_name = "level_name_nurgle",
	package_name = "resource_packages/levels/honduras/nurgle",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	act = "act_3",
	loading_ui_package_name = "loading_screen_5",
	boss_spawning_method = "hand_placed",
	main_game_level = true,
	unlockable = true,
	level_image = "level_icon_11",
	act_presentation_order = 3,
	use_mini_patrols = false,
	description_text = "nik_loading_screen_nurgle_01",
	default_surface_material = "mud",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/nurgle/world",
	source_aux_bus_name = "environment_reverb_outside_source",
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
		"nik_loading_screen_nurgle_01_short",
		"nik_loading_screen_nurgle_02_short"
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
	}
}
LevelSettings.warcamp = {
	act_unlock_order = 3,
	display_name = "level_name_warcamp",
	package_name = "resource_packages/levels/honduras/warcamp",
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	boss_level = true,
	act = "act_3",
	boss_spawning_method = "hand_placed",
	unlockable = true,
	level_image = "level_icon_12",
	main_game_level = true,
	act_presentation_order = 4,
	description_text = "nik_loading_screen_chaos_war_camp_01",
	default_surface_material = "mud",
	use_mini_patrols = false,
	loading_ui_package_name = "loading_screen_12",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras/warcamp/world",
	source_aux_bus_name = "environment_reverb_outside_source",
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
					healing_draught = 5
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 2
				}
			},
			secondary = {
				ammo = 4,
				grenades = 3,
				healing = 3,
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
					healing_draught = 10
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 8,
				grenades = 6,
				healing = 6,
				potions = 4
			}
		}
	},
	loading_screen_wwise_events = {
		"nik_loading_screen_chaos_war_camp_01",
		"nik_loading_screen_chaos_war_camp_02"
	},
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
	}
}

for level_key, level_data in pairs(LevelSettings) do
	if level_data.display_name then
		level_data.level_id = level_key
		level_data.game_mode = level_data.game_mode or "adventure"
		level_data.act_unlock_order = level_data.act_unlock_order or 0

		if level_data.game_mode == "adventure" then
			level_data.loot_objectives = level_data.loot_objectives or {
				loot_die = 0,
				tome = 3,
				grimoire = 2,
				painting_scrap = 0
			}
		end
	end
end

LevelSettingsMeta = LevelSettingsMeta or {}

LevelSettingsMeta.__index = function (table, key)
	Application.error(string.format("LevelSettings has no level %q\n", tostring(key)))
	Application.error("Maybe you were looking for one of these:")

	for level_key, _ in pairs(LevelSettings) do
		Application.error(level_key)
	end

	error("")
end

setmetatable(LevelSettings, LevelSettingsMeta)
dofile("scripts/settings/level_unlock_settings")

return
