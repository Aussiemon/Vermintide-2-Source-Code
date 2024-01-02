require("scripts/settings/dlcs/morris/deus_theme_settings")

DEUS_LEVEL_PICKUP_SETTINGS = DEUS_LEVEL_PICKUP_SETTINGS or {}
DEUS_LEVEL_PICKUP_SETTINGS.default_signature_pickup_settings = {
	default = {
		primary = {
			deus_weapon_chest = 6,
			deus_02 = 1,
			deus_soft_currency = 20,
			potions = 0,
			ammo = 7,
			grenades = 6,
			deus_potions = 8,
			deus_cursed_chest = 1,
			healing = {
				first_aid_kit = 3,
				healing_draught = 3
			},
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 2
			}
		},
		secondary = {
			ammo = 4,
			deus_potions = 10,
			potions = 0,
			grenades = 6,
			healing = 2
		}
	},
	normal = {
		primary = {
			deus_weapon_chest = 6,
			deus_02 = 1,
			deus_soft_currency = 20,
			potions = 0,
			ammo = 10,
			grenades = 9,
			deus_potions = 10,
			deus_cursed_chest = 1,
			healing = {
				first_aid_kit = 4,
				healing_draught = 4
			},
			level_events = {
				explosive_barrel = 4,
				lamp_oil = 4
			}
		},
		secondary = {
			ammo = 6,
			deus_potions = 8,
			potions = 0,
			grenades = 9,
			healing = 3
		}
	}
}
DEUS_LEVEL_PICKUP_SETTINGS.default_travel_pickup_settings = {
	default = {
		primary = {
			deus_weapon_chest = 5,
			deus_02 = 1,
			deus_soft_currency = 15,
			potions = 0,
			ammo = 5,
			grenades = 5,
			deus_potions = 6,
			deus_cursed_chest = 1,
			healing = {
				first_aid_kit = 2,
				healing_draught = 2
			},
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 2
			}
		},
		secondary = {
			ammo = 3,
			deus_potions = 4,
			potions = 0,
			grenades = 4,
			healing = 2
		}
	},
	normal = {
		primary = {
			deus_weapon_chest = 5,
			deus_02 = 1,
			deus_soft_currency = 15,
			potions = 0,
			ammo = 8,
			grenades = 8,
			deus_potions = 8,
			deus_cursed_chest = 1,
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
			ammo = 5,
			deus_potions = 8,
			potions = 0,
			grenades = 6,
			healing = 3
		}
	}
}
DEUS_LEVEL_PICKUP_SETTINGS.default_arena_pickup_settings = {
	default = {
		primary = {
			ammo = 2,
			deus_potions = 1,
			potions = 0,
			grenades = 2,
			healing = {
				first_aid_kit = 1,
				healing_draught = 1
			},
			level_events = {
				explosive_barrel = 2,
				lamp_oil = 2
			}
		},
		secondary = {
			ammo = 2,
			deus_potions = 1,
			potions = 0,
			grenades = 2,
			healing = 1
		}
	},
	normal = {
		primary = {
			ammo = 4,
			deus_potions = 2,
			potions = 0,
			grenades = 4,
			healing = {
				first_aid_kit = 2,
				healing_draught = 2
			},
			level_events = {
				explosive_barrel = 4,
				lamp_oil = 4
			}
		},
		secondary = {
			ammo = 4,
			deus_potions = 2,
			potions = 0,
			grenades = 4,
			healing = 4
		}
	}
}
DEUS_CHEST_TYPES = DEUS_CHEST_TYPES or table.enum("swap_ranged", "swap_melee", "upgrade", "power_up")
DEUS_WEAPON_CHEST_DISTRIBUTION = DEUS_WEAPON_CHEST_DISTRIBUTION or {}
DEUS_WEAPON_CHEST_DISTRIBUTION.default_signature = {
	[DEUS_CHEST_TYPES.swap_ranged] = 1.5,
	[DEUS_CHEST_TYPES.swap_melee] = 1.5,
	[DEUS_CHEST_TYPES.upgrade] = 1,
	[DEUS_CHEST_TYPES.power_up] = 2
}
DEUS_WEAPON_CHEST_DISTRIBUTION.default_travel = {
	[DEUS_CHEST_TYPES.swap_ranged] = 1.5,
	[DEUS_CHEST_TYPES.swap_melee] = 1.5,
	[DEUS_CHEST_TYPES.upgrade] = 1,
	[DEUS_CHEST_TYPES.power_up] = 1
}
DEUS_WEAPON_CHEST_DISTRIBUTION.default_arena = {
	[DEUS_CHEST_TYPES.swap_ranged] = 1,
	[DEUS_CHEST_TYPES.swap_melee] = 1,
	[DEUS_CHEST_TYPES.upgrade] = 1,
	[DEUS_CHEST_TYPES.power_up] = 0
}
DEUS_LEVEL_SETTINGS = DEUS_LEVEL_SETTINGS or {}
DEUS_LEVEL_SETTINGS.pat_mountain = {
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	knocked_down_setting = "knocked_down",
	display_name = "pat_mountain_title",
	ignore_zone_conflict_settings = false,
	boss_spawning_method = "bypassed",
	check_no_spawn_volumes_for_special_spawning = true,
	override_file_ending = "dlc_morris_pat_mountain",
	loading_ui_package_name = "morris/deus_loading_screen_mountain",
	base_level_name = "pat_mountain",
	texture_id = "twitch_icon_mountain",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/pat_mountain",
		"resource_packages/levels/dlcs/morris/pat_mountain/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_pat_mountain_start",
		"location_pat_mountain_cave",
		"location_pat_mountain_ritual",
		"location_pat_mountain_bones",
		"location_pat_mountain_bridge",
		"location_pat_mountain_altar",
		"location_pat_mountain_arena"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_travel_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_travel,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.sig_volcano = {
	ignore_zone_conflict_settings = false,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_sig_volcano",
	check_no_spawn_volumes_for_special_spawning = true,
	display_name = "sig_volcano_title",
	base_level_name = "sig_volcano",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_volcano",
	texture_id = "twitch_icon_volcano",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/sig_volcano",
		"resource_packages/levels/dlcs/morris/sig_volcano/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_sig_volcano_start",
		"location_sig_volcano_arena",
		"location_sig_volcano_bridge",
		"location_sig_volcano_glacierroad",
		"location_sig_volcano_iceroad",
		"location_sig_volcano_pits_lower",
		"location_sig_volcano_pits_upper",
		"location_sig_volcano_pits_upper_2",
		"location_sig_volcano_road",
		"location_sig_volcano_ruins",
		"location_sig_volcano_settlement",
		"location_sig_volcano_stream",
		"location_sig_volcano_stronghold",
		"location_sig_volcano_watchtower",
		"location_sig_volcano_end"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_travel_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_signature,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.WASTES,
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.TZEENTCH
	}
}
DEUS_LEVEL_SETTINGS.pat_tower = {
	ignore_zone_conflict_settings = false,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_pat_tower",
	check_no_spawn_volumes_for_special_spawning = true,
	display_name = "pat_tower_title",
	base_level_name = "pat_tower",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_tower",
	texture_id = "twitch_icon_tower",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/pat_tower",
		"resource_packages/levels/dlcs/morris/pat_tower/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_pat_tower_start",
		"location_pat_tower_area1",
		"location_pat_tower_area2",
		"location_pat_tower_lord",
		"location_pat_tower_upper",
		"location_pat_tower_library",
		"location_pat_tower_end",
		"location_pat_tower_end_2",
		"location_pat_tower_end_3"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_travel_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_travel,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.sig_citadel = {
	ignore_zone_conflict_settings = false,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_sig_citadel",
	check_no_spawn_volumes_for_special_spawning = true,
	display_name = "sig_citadel_title",
	base_level_name = "sig_citadel",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_citadel",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/sig_citadel",
		"resource_packages/levels/dlcs/morris/sig_citadel/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_sig_citadel_start",
		"location_sig_citadel_island",
		"location_sig_citadel_towers",
		"location_sig_citadel_platforms",
		"location_sig_citadel_walkway",
		"location_sig_citadel_ascension",
		"location_sig_citadel_end"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_signature_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_signature,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH
	}
}
DEUS_LEVEL_SETTINGS.pat_bay = {
	ignore_zone_conflict_settings = false,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_pat_bay",
	check_no_spawn_volumes_for_special_spawning = true,
	display_name = "pat_bay_title",
	base_level_name = "pat_bay",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_bay",
	texture_id = "twitch_icon_bay",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/pat_bay",
		"resource_packages/levels/dlcs/morris/pat_bay/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_pat_bay_start",
		"location_pat_bay_ships",
		"location_pat_bay_masts",
		"location_pat_bay_camp",
		"location_pat_bay_glacier",
		"location_pat_bay_icecave",
		"location_pat_bay_arena",
		"location_bay_village"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_signature_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_travel,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.sig_crag = {
	ambient_sound_event = "silent_default_world_sound",
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_sig_crag",
	check_no_spawn_volumes_for_special_spawning = true,
	ignore_zone_conflict_settings = false,
	display_name = "sig_crag_title",
	base_level_name = "sig_crag",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_crag",
	texture_id = "twitch_icon_crag",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/sig_crag",
		"resource_packages/levels/dlcs/morris/sig_crag/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_sig_crag_start",
		"location_sig_crag_crater1",
		"location_sig_crag_crater2",
		"location_sig_crag_area3",
		"location_sig_crag_area4",
		"location_sig_crag_heart",
		"location_sig_crag_end"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_signature_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_signature,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.sig_snare_a = {
	check_no_spawn_volumes_for_special_spawning = true,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_sig_snare",
	ignore_zone_conflict_settings = false,
	display_name = "sig_snare_title",
	base_level_name = "sig_snare",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_snare",
	texture_id = "twitch_icon_snare",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/levels/honduras/farmlands_common",
		"resource_packages/levels/honduras/fort_common",
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/sig_snare_a",
		"resource_packages/levels/dlcs/morris/sig_snare/path_common",
		"resource_packages/levels/dlcs/morris/sig_snare_a/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_sig_snare_start",
		"location_sig_snare_military",
		"location_sig_snare_farmlands",
		"location_sig_snare_stronghold"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_signature_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_signature,
	paths = {
		1
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.sig_snare_b = table.clone(DEUS_LEVEL_SETTINGS.sig_snare_a)
DEUS_LEVEL_SETTINGS.sig_snare_b.locations = {
	"location_sig_snare_start",
	"location_sig_snare_ussingen",
	"location_sig_snare_mines",
	"location_sig_snare_groundzero"
}
DEUS_LEVEL_SETTINGS.sig_snare_b.packages = {
	"resource_packages/levels/honduras/ground_zero_common",
	"resource_packages/levels/honduras/ussingen_common",
	"resource_packages/dlcs/morris_ingame",
	"units/props/inn/deus/deus_chest_01",
	"resource_packages/levels/dlcs/morris/sig_snare_b",
	"resource_packages/levels/dlcs/morris/sig_snare/path_common",
	"resource_packages/levels/dlcs/morris/sig_snare_b/path_common"
}
DEUS_LEVEL_SETTINGS.sig_snare_c = table.clone(DEUS_LEVEL_SETTINGS.sig_snare_a)
DEUS_LEVEL_SETTINGS.sig_snare_c.locations = {
	"location_sig_snare_start",
	"location_sig_snare_skittergate",
	"location_sig_snare_warcamp",
	"location_sig_snare_groundzero"
}
DEUS_LEVEL_SETTINGS.sig_snare_c.packages = {
	"resource_packages/levels/honduras/skittergate_common",
	"resource_packages/levels/honduras/ground_zero_common",
	"resource_packages/levels/honduras/warcamp_common",
	"resource_packages/dlcs/morris_ingame",
	"units/props/inn/deus/deus_chest_01",
	"resource_packages/levels/dlcs/morris/sig_snare_c",
	"resource_packages/levels/dlcs/morris/sig_snare/path_common",
	"resource_packages/levels/dlcs/morris/sig_snare_c/path_common"
}
DEUS_LEVEL_SETTINGS.sig_snare_d = table.clone(DEUS_LEVEL_SETTINGS.sig_snare_a)
DEUS_LEVEL_SETTINGS.sig_snare_d.locations = {
	"location_sig_snare_start",
	"location_sig_snare_stronghold",
	"location_sig_snare_keep",
	"location_sig_snare_catacombs"
}
DEUS_LEVEL_SETTINGS.sig_snare_d.packages = {
	"resource_packages/levels/honduras/military_common",
	"resource_packages/levels/honduras/catacombs_common",
	"resource_packages/levels/honduras/skaven_stronghold_common",
	"resource_packages/dlcs/morris_ingame",
	"units/props/inn/deus/deus_chest_01",
	"resource_packages/levels/dlcs/morris/sig_snare_d",
	"resource_packages/levels/dlcs/morris/sig_snare/path_common",
	"resource_packages/levels/dlcs/morris/sig_snare_d/path_common"
}
DEUS_LEVEL_SETTINGS.sig_snare_e = table.clone(DEUS_LEVEL_SETTINGS.sig_snare_a)
DEUS_LEVEL_SETTINGS.sig_snare_e.locations = {
	"location_sig_snare_start",
	"location_sig_snare_elves",
	"location_sig_snare_bell",
	"location_sig_snare_mines"
}
DEUS_LEVEL_SETTINGS.sig_snare_e.packages = {
	"resource_packages/levels/honduras/bell_common",
	"resource_packages/levels/honduras/elven_ruins_common",
	"resource_packages/levels/honduras/mines_common",
	"resource_packages/dlcs/morris_ingame",
	"units/props/inn/deus/deus_chest_01",
	"resource_packages/levels/dlcs/morris/sig_snare_e",
	"resource_packages/levels/dlcs/morris/sig_snare/path_common",
	"resource_packages/levels/dlcs/morris/sig_snare_e/path_common"
}
DEUS_LEVEL_SETTINGS.sig_mordrek = {
	check_no_spawn_volumes_for_special_spawning = true,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_sig_mordrek",
	ignore_zone_conflict_settings = false,
	display_name = "sig_mordrek_title",
	base_level_name = "sig_mordrek",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_mordrek",
	texture_id = "twitch_icon_mordrek",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/sig_mordrek",
		"resource_packages/levels/dlcs/morris/sig_mordrek/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_sig_mordrek_start",
		"location_sig_mordrek_outer_camp",
		"location_sig_mordrek_warpfire_pits",
		"location_sig_mordrek_trenches",
		"location_sig_mordrek_frontlines",
		"location_sig_mordrek_hole",
		"location_sig_mordrek_courtyard",
		"location_sig_mordrek_end"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_signature_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_signature,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.sig_gorge = {
	ignore_zone_conflict_settings = false,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_sig_gorge",
	check_no_spawn_volumes_for_special_spawning = true,
	display_name = "sig_gorge_title",
	base_level_name = "sig_gorge",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_gorge",
	texture_id = "twitch_icon_gorge",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/sig_gorge",
		"resource_packages/levels/dlcs/morris/sig_gorge/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_sig_gorge_start",
		"location_sig_gorge_ravine",
		"location_sig_gorge_forest",
		"location_sig_gorge_river_01",
		"location_sig_gorge_river_02",
		"location_sig_gorge_wickerman",
		"location_sig_gorge_swamp",
		"location_sig_gorge_mine",
		"location_sig_gorge_skull"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_signature_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_signature,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.pat_mines = {
	ignore_zone_conflict_settings = false,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_pat_mines",
	check_no_spawn_volumes_for_special_spawning = true,
	display_name = "pat_mines_title",
	base_level_name = "pat_mines",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_mines",
	texture_id = "twitch_icon_mines",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/pat_mines",
		"resource_packages/levels/dlcs/morris/pat_mines/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_pat_mines_start",
		"location_pat_mines_poison",
		"location_pat_mines_skylights",
		"location_pat_mines_village",
		"location_pat_mines_gate"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_travel_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_travel,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.pat_forest = {
	ignore_zone_conflict_settings = false,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_pat_forest",
	check_no_spawn_volumes_for_special_spawning = true,
	display_name = "pat_forest_title",
	base_level_name = "pat_forest",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_forest",
	texture_id = "twitch_icon_forest",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/pat_forest",
		"resource_packages/levels/dlcs/morris/pat_forest/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_pat_forest_start",
		"location_pat_forest_mine",
		"location_pat_forest_pass",
		"location_pat_forest_creek",
		"location_pat_forest_end"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_travel_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_travel,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.pat_town = {
	ignore_zone_conflict_settings = false,
	environment_state = "exterior",
	music_won_state = "explore",
	player_aux_bus_name = "environment_reverb_outside",
	ambient_sound_event = "silent_default_world_sound",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_pat_town",
	check_no_spawn_volumes_for_special_spawning = true,
	display_name = "pat_town_title",
	base_level_name = "pat_town",
	boss_spawning_method = "bypassed",
	loading_ui_package_name = "morris/deus_loading_screen_town",
	texture_id = "twitch_icon_town",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/pat_town",
		"resource_packages/levels/dlcs/morris/pat_town/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_pat_town_start",
		"location_pat_town_camp",
		"location_pat_town_arena",
		"location_pat_town_harbor",
		"location_pat_town_glacier"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_travel_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_travel,
	paths = {
		1,
		2,
		3,
		4,
		5
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH,
		DEUS_THEME_TYPES.BELAKOR,
		DEUS_THEME_TYPES.WASTES
	}
}
DEUS_LEVEL_SETTINGS.arena_ruin = {
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_arena_ruin",
	display_name = "arena_ruin_title",
	ignore_zone_conflict_settings = false,
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "morris/deus_loading_screen_arena_ruin",
	base_level_name = "arena_ruin",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/arena_ruin",
		"resource_packages/levels/dlcs/morris/arena_ruin/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_arena_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_arena,
	paths = {
		1
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH
	}
}
DEUS_LEVEL_SETTINGS.arena_cave = {
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_arena_cave",
	display_name = "arena_cave_title",
	ignore_zone_conflict_settings = false,
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "morris/deus_loading_screen_arena_cave",
	base_level_name = "arena_cave",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/arena_cave",
		"resource_packages/levels/dlcs/morris/arena_cave/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_arena_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_arena,
	paths = {
		1
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH
	}
}
DEUS_LEVEL_SETTINGS.arena_ice = {
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_arena_ice",
	display_name = "arena_ice_title",
	ignore_zone_conflict_settings = false,
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "morris/deus_loading_screen_arena_ice",
	base_level_name = "arena_ice",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/arena_ice",
		"resource_packages/levels/dlcs/morris/arena_ice/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_arena_ice"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_arena_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_arena,
	paths = {
		1
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH
	}
}
DEUS_LEVEL_SETTINGS.arena_citadel = {
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_arena_citadel",
	display_name = "arena_citadel_title",
	ignore_zone_conflict_settings = false,
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "morris/deus_loading_screen_arena_citadel",
	base_level_name = "arena_citadel",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/arena_citadel",
		"resource_packages/levels/dlcs/morris/arena_citadel/path_common"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_arena_citadel"
	},
	pickup_settings = DEUS_LEVEL_PICKUP_SETTINGS.default_arena_pickup_settings,
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_arena,
	paths = {
		1
	},
	themes = {
		DEUS_THEME_TYPES.KHORNE,
		DEUS_THEME_TYPES.NURGLE,
		DEUS_THEME_TYPES.SLAANESH,
		DEUS_THEME_TYPES.TZEENTCH
	}
}
DEUS_LEVEL_SETTINGS.arena_belakor = {
	ambient_sound_event = "silent_default_world_sound",
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	override_file_ending = "dlc_morris_arena_belakor",
	base_level_name = "arena_belakor",
	overridden_level_key = "arena_belakor",
	ignore_zone_conflict_settings = false,
	overridden_level_name = "levels/honduras_dlcs/morris/arena_belakor/world",
	display_name = "arena_belakor_title",
	do_not_add_default_packages = true,
	boss_spawning_method = "hand_placed",
	loading_ui_package_name = "morris/deus_loading_screen_arena_belakor",
	ignore_sections_in_pickup_spawning = true,
	texture_id = "twitch_icon_temple",
	source_aux_bus_name = "environment_reverb_outside_source",
	packages = {
		"resource_packages/dlcs/morris_ingame",
		"units/props/inn/deus/deus_chest_01",
		"resource_packages/levels/dlcs/morris/arena_belakor"
	},
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {
		"location_arena_belakor"
	},
	pickup_settings = {
		default = {
			primary = {
				potions = 0,
				grenades = 2,
				deus_potions = 1,
				deus_02 = 2,
				deus_soft_currency = 20,
				ammo = 2,
				healing = {
					first_aid_kit = 1,
					healing_draught = 1
				},
				level_events = {
					explosive_barrel = 2,
					lamp_oil = 2
				}
			},
			secondary = {
				ammo = 2,
				deus_potions = 1,
				potions = 0,
				grenades = 2,
				healing = 1
			}
		},
		normal = {
			primary = {
				deus_02 = 2,
				grenades = 4,
				deus_potions = 2,
				potions = 0,
				deus_soft_currency = 20,
				ammo = 4,
				healing = {
					first_aid_kit = 2,
					healing_draught = 2
				},
				level_events = {
					explosive_barrel = 4,
					lamp_oil = 4
				}
			},
			secondary = {
				ammo = 4,
				deus_potions = 2,
				potions = 0,
				grenades = 4,
				healing = 4
			}
		}
	},
	deus_weapon_chest_distribution = DEUS_WEAPON_CHEST_DISTRIBUTION.default_arena,
	mutators = {
		"arena_belakor_script"
	},
	paths = {
		1
	},
	themes = {
		DEUS_THEME_TYPES.BELAKOR
	}
}
DEUS_SHRINE_LEVEL_SETTINGS = DEUS_SHRINE_LEVEL_SETTINGS or {}
DEUS_SHRINE_LEVEL_SETTINGS.shop_fortune = {
	display_name = "deus_shop",
	texture_id = "twitch_icon_shrine",
	base_level_name = "shop_fortune",
	themes = {},
	paths = {}
}
DEUS_SHRINE_LEVEL_SETTINGS.shop_harmony = {
	display_name = "deus_shop",
	texture_id = "twitch_icon_shrine",
	base_level_name = "shop_harmony",
	themes = {},
	paths = {}
}
DEUS_SHRINE_LEVEL_SETTINGS.shop_strife = {
	display_name = "deus_shop",
	texture_id = "twitch_icon_shrine",
	base_level_name = "shop_strife",
	themes = {},
	paths = {}
}
