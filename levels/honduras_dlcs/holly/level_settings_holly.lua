LevelSettings.magnus = {
	act_unlock_order = 0,
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	display_name = "level_name_magnus",
	act = "act_holly",
	loading_ui_package_name = "loading_screen_19",
	unlockable = true,
	level_image = "level_icon_ubersreik_magnus",
	waystone_type = 2,
	use_mini_patrols = false,
	act_presentation_order = 1,
	boss_spawning_method = "hand_placed",
	description_text = "nfl_magnus_tower_loading_screen_02",
	default_surface_material = "stone",
	dlc_name = "holly",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/holly/magnus/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/holly/magnus",
		"resource_packages/levels/dlcs/holly/magnus_meta"
	},
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
				grenades = 3,
				healing = 2,
				potions = 5
			}
		},
		normal = {
			primary = {
				ammo = 10,
				painting_scrap = 3,
				potions = 12,
				grenades = 10,
				healing = {
					first_aid_kit = 8,
					healing_draught = 10
				},
				level_events = {
					explosive_barrel = 6,
					lamp_oil = 6
				}
			},
			secondary = {
				ammo = 5,
				grenades = 5,
				healing = 6,
				potions = 8
			}
		}
	},
	loading_screen_wwise_events = {
		"nfl_magnus_tower_loading_screen_01",
		"nfl_magnus_tower_loading_screen_02",
		dr_engineer = {
			"pdr_de_loading_screen_magnus_tower_01",
			"pdr_de_loading_screen_magnus_tower_02"
		},
		we_thornsister = {
			"pwe_st_loading_screen_magnus_tower_01",
			"pwe_st_loading_screen_magnus_tower_02"
		},
		es_questingknight = {
			"pes_gk_loading_screen_magnus_tower_01",
			"pes_gk_loading_screen_magnus_tower_02"
		},
		wh_priest = {
			"pwh_wp_loading_screen_magnus_tower_01",
			"pwh_wp_loading_screen_magnus_tower_02"
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_magnus_tower_01",
			"pbw_nm_loading_screen_magnus_tower_02"
		}
	},
	locations = {
		"location_magnus_gate_plaza",
		"location_magnus_guardhouse",
		"location_magnus_street",
		"location_magnus_the_slums",
		"location_magnus_waterfront",
		"location_magnus_tavern",
		"location_magnus_rooftops",
		"location_magnus_the_tower",
		"location_magnus_the_plaza",
		"location_magnus_horn_room",
		"location_magnus_the_garrison"
	},
	mission_selection_offset = {
		0,
		153,
		0
	}
}
LevelSettings.cemetery = {
	act_unlock_order = 1,
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	display_name = "level_name_cemetery",
	act = "act_holly",
	loading_ui_package_name = "loading_screen_20",
	unlockable = true,
	level_image = "level_icon_ubersreik_cemetary",
	waystone_type = 2,
	use_mini_patrols = false,
	act_presentation_order = 2,
	boss_spawning_method = "hand_placed",
	description_text = "nfl_cemetery_loading_screen_02",
	default_surface_material = "stone_wet",
	dlc_name = "holly",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/holly/cemetery/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/holly/cemetery"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	pickup_settings = {
		default = {
			primary = {
				ammo = 5,
				painting_scrap = 3,
				potions = 8,
				grenades = 7,
				healing = {
					first_aid_kit = 5,
					healing_draught = 7
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
				ammo = 8,
				painting_scrap = 3,
				potions = 12,
				grenades = 10,
				healing = {
					first_aid_kit = 6,
					healing_draught = 10
				},
				level_events = {
					explosive_barrel = 6,
					lamp_oil = 6
				}
			},
			secondary = {
				ammo = 4,
				grenades = 6,
				healing = 5,
				potions = 6
			}
		}
	},
	loading_screen_wwise_events = {
		"nfl_cemetery_loading_screen_01",
		"nfl_cemetery_loading_screen_02",
		dr_engineer = {
			"pdr_de_loading_screen_cemetary_01",
			"pdr_de_loading_screen_cemetary_02"
		},
		we_thornsister = {
			"pwe_st_loading_screen_cemetary_01",
			"pwe_st_loading_screen_cemetary_02"
		},
		es_questingknight = {
			"pes_gk_loading_screen_cemetary_01",
			"pes_gk_loading_screen_cemetary_02"
		},
		wh_priest = {
			"pwh_wp_loading_screen_cemetary_01",
			"pwh_wp_loading_screen_cemetary_02"
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_cemetary_01",
			"pbw_nm_loading_screen_cemetary_02"
		}
	},
	locations = {
		"location_cemetery_1",
		"location_cemetery_2",
		"location_cemetery_3",
		"location_cemetery_4",
		"location_cemetery_5",
		"location_cemetery_6",
		"location_cemetery_7",
		"location_cemetery_8",
		"location_cemetery_9",
		"location_cemetery_10",
		"location_cemetery_11",
		"location_cemetery_12",
		"location_cemetery_13"
	},
	mission_selection_offset = {
		-186,
		-167,
		0
	}
}
LevelSettings.forest_ambush = {
	act_unlock_order = 2,
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	player_aux_bus_name = "environment_reverb_outside",
	display_name = "level_name_forest_ambush",
	act = "act_holly",
	loading_ui_package_name = "loading_screen_18",
	unlockable = true,
	level_image = "level_icon_ubersreik_forest",
	waystone_type = 2,
	use_mini_patrols = false,
	act_presentation_order = 3,
	boss_spawning_method = "hand_placed",
	description_text = "nfl_forest_ambush_loading_screen_02",
	default_surface_material = "stone",
	dlc_name = "holly",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/holly/forest_ambush/world",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/holly/forest_ambush",
		"resource_packages/levels/dlcs/holly/forest_ambush_meta"
	},
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
					explosive_barrel = 5,
					lamp_oil = 5
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
				ammo = 8,
				painting_scrap = 3,
				potions = 10,
				grenades = 8,
				healing = {
					first_aid_kit = 6,
					healing_draught = 8
				},
				level_events = {
					explosive_barrel = 5,
					lamp_oil = 5
				}
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 12,
				potions = 12
			}
		}
	},
	loading_screen_wwise_events = {
		"nfl_forest_ambush_loading_screen_01",
		"nfl_forest_ambush_loading_screen_02",
		dr_engineer = {
			"pdr_de_loading_screen_forest_ambush_01",
			"pdr_de_loading_screen_forest_ambush_02"
		},
		we_thornsister = {
			"pwe_st_loading_screen_forest_ambush_01",
			"pwe_st_loading_screen_forest_ambush_02"
		},
		es_questingknight = {
			"pes_gk_loading_screen_forest_ambush_01",
			"pes_gk_loading_screen_forest_ambush_02"
		},
		wh_priest = {
			"pwh_wp_loading_screen_forest_ambush_01",
			"pwh_wp_loading_screen_forest_ambush_02"
		},
		bw_necromancer = {
			"pbw_nm_loading_screen_forest_ambush_01",
			"pbw_nm_loading_screen_forest_ambush_02"
		}
	},
	locations = {
		"location_forest_reikwald",
		"location_forest_skaven_camp",
		"location_forest_mother_black",
		"location_forest_after_bridge",
		"location_forest_cave",
		"location_forest_road",
		"location_forest_ruins_entrance",
		"location_forest_ruins_inneryard",
		"location_forest_swamp"
	},
	mission_selection_offset = {
		184,
		-167,
		0
	}
}
LevelSettings.plaza = {
	act_unlock_order = 0,
	display_name = "level_name_plaza",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	ambient_sound_event = "silent_default_world_sound",
	act = "act_holly_final",
	unlockable = true,
	loading_ui_package_name = "loading_screen_21",
	use_mini_patrols = false,
	description_text = "nfl_loading_screen_plaza_02",
	dlc_name = "holly",
	boss_spawning_method = "hand_placed",
	level_image = "level_icon_ubersreik_plaza",
	not_quickplayable = true,
	default_surface_material = "stone",
	act_presentation_order = 1,
	conflict_settings = "challenge_level",
	knocked_down_setting = "knocked_down",
	level_name = "levels/honduras_dlcs/holly/plaza/world",
	disable_twitch_game_mode = true,
	disable_percentage_completed = true,
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/dlcs/holly/plaza"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	loot_objectives = {
		loot_die = 0
	},
	pickup_settings = {
		default = {
			primary = {
				ammo = 4,
				potions = 4,
				grenades = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 5
				},
				level_events = {
					explosive_barrel = 5,
					lamp_oil = 5
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
				ammo = 8,
				potions = 10,
				grenades = 8,
				healing = {
					first_aid_kit = 6,
					healing_draught = 8
				},
				level_events = {
					explosive_barrel = 5,
					lamp_oil = 5
				}
			},
			secondary = {
				ammo = 10,
				grenades = 8,
				healing = 12,
				potions = 12
			}
		}
	},
	loading_screen_wwise_events = {
		"nfl_loading_screen_plaza_01",
		"nfl_loading_screen_plaza_02"
	},
	locations = {
		"dlc1_2_location_survival_magnus_plaza",
		"dlc1_2_location_survival_magnus_tower",
		"dlc1_2_location_survival_magnus_wall",
		"dlc1_2_location_survival_magnus_market",
		"dlc1_2_location_survival_magnus_gate"
	},
	required_acts = {
		"act_holly"
	}
}
