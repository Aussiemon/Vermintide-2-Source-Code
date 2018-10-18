DLCSettings = {
	full_game = {
		package_name = "resource_packages/dlcs/full_game",
		breeds = {
			"scripts/settings/breeds/breed_chaos_exalted_sorcerer",
			"scripts/settings/breeds/breed_skaven_grey_seer",
			"scripts/settings/breeds/breed_skaven_stormfiend_boss",
			"scripts/settings/breeds/breed_skaven_storm_vermin_warlord",
			"scripts/settings/breeds/breed_chaos_zombie",
			"scripts/settings/breeds/breed_chaos_tentacle"
		},
		behaviour_trees_precompiled = {
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_exalted_champion_norsca",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_exalted_sorcerer",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_grey_seer",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_stormfiend_boss",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_storm_vermin_warlord",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_tentacle",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_tentacle_sorcerer",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_zombie"
		},
		behaviour_tree_nodes = {},
		behaviour_trees = {
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_exalted_sorcerer_behavior",
			"scripts/entity_system/systems/behaviour/trees/skaven/skaven_grey_seer_behavior",
			"scripts/entity_system/systems/behaviour/trees/skaven/skaven_stormfiend_boss_behavior",
			"scripts/entity_system/systems/behaviour/trees/skaven/skaven_storm_vermin_warlord_behavior",
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_tentacle_behavior",
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_tentacle_sorcerer_behavior",
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_zombie_behavior"
		},
		terror_event_blueprints = {},
		weighted_random_terror_events = {},
		horde_settings_compositions = {}
	},
	social_wheel = {
		package_name = "resource_packages/dlcs/social_wheel",
		breeds = {},
		behaviour_trees_precompiled = {},
		behaviour_tree_nodes = {},
		behaviour_trees = {},
		terror_event_blueprints = {},
		weighted_random_terror_events = {},
		network_lookups = {
			social_wheel_events = "SocialWheelSettingsLookup"
		},
		ingame_uis = {
			social_wheel_ui = {
				hud_update = true,
				class_name = "SocialWheelUI",
				filename = "scripts/ui/social_wheel_ui"
			}
		},
		script_data = {
			enable_social_wheel = true
		}
	},
	bogenhafen = {
		level_settings = "levels/honduras_dlcs/bogenhafen/level_settings_bogenhafen",
		package_name = "resource_packages/dlcs/bogenhafen",
		terror_event_blueprints_filename = "levels/honduras_dlcs/bogenhafen/terror_events_bogenhafen",
		level_unlock_settings = "levels/honduras_dlcs/bogenhafen/level_unlock_settings_bogenhafen",
		breeds = {},
		behaviour_trees_precompiled = {},
		behaviour_tree_nodes = {},
		behaviour_trees = {},
		unlock_settings = {
			bogenhafen = {
				class = "UnlockDlc",
				id = "828790"
			}
		},
		unlock_settings_xb1 = {
			bogenhafen = {
				class = "UnlockDlc",
				id = "3E0F5C11-261E-4165-A610-176131574B84"
			}
		},
		unlock_settings_ps4 = {
			bogenhafen = {
				class = "AlwaysUnlocked"
			}
		},
		weighted_random_terror_events = {
			dlc_bogenhafen_slum_event_spice_random = {
				"dlc_bogenhafen_slum_event_spice_left",
				1,
				"dlc_bogenhafen_slum_event_spice_right",
				1
			}
		},
		missions = {
			bogenhafen_city_findsewer = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_findsewer"
			},
			bogenhafen_city_reachexit = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_reachexit"
			},
			bogenhafen_city_basement = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_basement"
			},
			bogenhafen_city_altroute = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_altroute"
			},
			bogenhafen_city_opensewergates = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_opensewergates"
			},
			bogenhafen_city_reachend = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_reacheend"
			},
			bogenhafen_city_pushforward = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_pushforward"
			},
			bogenhafen_city_pushforward2 = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_pushforward2"
			},
			bogenhafen_city_pushforward3 = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_pushforward3"
			},
			bogenhafen_city_reachmarket = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_reachmarket"
			},
			bogenhafen_city_moveupstairs = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_moveupstairs"
			},
			bogenhafen_city_reachtemplegate = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_reachtemplegate"
			},
			bogenhafen_city_escape_sewers = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_escape_sewers"
			},
			bogenhafen_city_find_priest = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_find_priest"
			},
			bogenhafen_city_getback_gate = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_getback_gate"
			},
			bogenhafen_city_unlock_gate = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_unlock_gate"
			},
			bogenhafen_city_entertemple = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_entertemple"
			},
			bogenhafen_city_findsecret = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_findsecret"
			},
			bogenhafen_city_button = {
				text = "mission_bogenhafen_city_button",
				mission_template_name = "collect",
				collect_amount = 5
			},
			bogenhafen_city_claimartifact = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_claimartifact"
			},
			bogenhafen_city_escape_temple = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_city_escape_temple"
			},
			bogenhafen_slum_enter_slum = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_slum_enter_slum"
			},
			bogenhafen_slum_move_through_slum = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_slum_move_through_slum"
			},
			bogenhafen_get_past_wall = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_get_past_wall"
			},
			bogenhafen_slum_find_hideout = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_slum_find_hideout"
			},
			bogenhafen_slum_enter_hideout = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_slum_enter_hideout"
			},
			bogenhafen_slum_burn_food = {
				text = "mission_bogenhafen_slum_burn_food",
				mission_template_name = "collect",
				collect_amount = 3
			},
			bogenhafen_slum_survive_hideout = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_slum_survive_hideout"
			},
			bogenhafen_slum_escape_hideout = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_slum_escape_hideout"
			},
			bogenhafen_slum_to_the_docks = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_slum_to_the_docks"
			},
			bogenhafen_start_gauntlet = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_start_gauntlet"
			},
			bogenhafen_slum_run = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_slum_run"
			},
			bogenhafen_slum_escape_portal = {
				mission_template_name = "goal",
				text = "mission_bogenhafen_slum_escape_portal"
			}
		},
		dialogue_lookup = {
			"dialogues/generated/lookup_witch_hunter_bogenhafen_city",
			"dialogues/generated/lookup_bright_wizard_bogenhafen_city",
			"dialogues/generated/lookup_dwarf_ranger_bogenhafen_city",
			"dialogues/generated/lookup_empire_soldier_bogenhafen_city",
			"dialogues/generated/lookup_wood_elf_bogenhafen_city",
			"dialogues/generated/lookup_witch_hunter_bogenhafen_slum",
			"dialogues/generated/lookup_bright_wizard_bogenhafen_slum",
			"dialogues/generated/lookup_dwarf_ranger_bogenhafen_slum",
			"dialogues/generated/lookup_empire_soldier_bogenhafen_slum",
			"dialogues/generated/lookup_wood_elf_bogenhafen_slum",
			"dialogues/generated/lookup_hero_conversations_dlc_bogenhafen_city",
			"dialogues/generated/lookup_hero_conversations_dlc_bogenhafen_slum"
		},
		dialogue_settings = {
			dlc_bogenhafen_slum = {
				"dialogues/generated/witch_hunter_bogenhafen_slum",
				"dialogues/generated/bright_wizard_bogenhafen_slum",
				"dialogues/generated/dwarf_ranger_bogenhafen_slum",
				"dialogues/generated/empire_soldier_bogenhafen_slum",
				"dialogues/generated/wood_elf_bogenhafen_slum",
				"dialogues/generated/hero_conversations_dlc_bogenhafen_slum"
			},
			dlc_bogenhafen_city = {
				"dialogues/generated/witch_hunter_bogenhafen_city",
				"dialogues/generated/bright_wizard_bogenhafen_city",
				"dialogues/generated/dwarf_ranger_bogenhafen_city",
				"dialogues/generated/empire_soldier_bogenhafen_city",
				"dialogues/generated/wood_elf_bogenhafen_city",
				"dialogues/generated/hero_conversations_dlc_bogenhafen_city"
			}
		},
		horde_settings_compositions = {}
	}
}

return
