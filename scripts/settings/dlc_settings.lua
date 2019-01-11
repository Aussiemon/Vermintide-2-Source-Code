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
		behaviour_trees = {
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_exalted_sorcerer_behavior",
			"scripts/entity_system/systems/behaviour/trees/skaven/skaven_grey_seer_behavior",
			"scripts/entity_system/systems/behaviour/trees/skaven/skaven_stormfiend_boss_behavior",
			"scripts/entity_system/systems/behaviour/trees/skaven/skaven_storm_vermin_warlord_behavior",
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_tentacle_behavior",
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_tentacle_sorcerer_behavior",
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_zombie_behavior"
		}
	},
	social_wheel = {
		package_name = "resource_packages/dlcs/social_wheel",
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
	collectors_edition_ps4 = {
		unlock_settings_ps4 = {
			CUSA13595_00 = {
				pre_order = {
					id = "bbb731461b5d4b8cb5a1aff62d1e48f6",
					product_label = "PREMIUMCONTENTUS",
					class = "UnlockDlc",
					backend_reward_id = "vt2_collectors_edition"
				}
			},
			CUSA13645_00 = {
				pre_order = {
					id = "7859e71d9fa84d0ab8dd22b4d13ec7c9",
					product_label = "PREMIUMCONTENTEU",
					class = "UnlockDlc",
					backend_reward_id = "vt2_collectors_edition"
				}
			}
		}
	},
	pre_order_bonus_ps4 = {
		unlock_settings_ps4 = {
			CUSA13595_00 = {
				pre_order_bonus = {
					id = "607e4befcc3440c3b5130c49ac25421e",
					product_label = "V2PREORDERCONTUS",
					class = "UnlockDlc",
					backend_reward_id = "vt2_pre_order_bonus"
				}
			},
			CUSA13645_00 = {
				pre_order_bonus = {
					id = "a64af399dde6410e84247e2898e9be2c",
					product_label = "V2PREORDERCONTEU",
					class = "UnlockDlc",
					backend_reward_id = "vt2_pre_order_bonus"
				}
			}
		}
	},
	bogenhafen = {
		level_settings = "levels/honduras_dlcs/bogenhafen/level_settings_bogenhafen",
		package_name = "resource_packages/dlcs/bogenhafen",
		terror_event_blueprints_filename = "levels/honduras_dlcs/bogenhafen/terror_events_bogenhafen",
		level_unlock_settings = "levels/honduras_dlcs/bogenhafen/level_unlock_settings_bogenhafen",
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
			CUSA13595_00 = {
				bogenhafen = {
					id = "2b2fc2291fbf4eafb7289a0586ae3994",
					product_label = "V2MAPPACKUS00001",
					class = "UnlockDlc"
				}
			},
			CUSA13645_00 = {
				bogenhafen = {
					id = "78b2c8d131d84d7a9796bb28186ea6b6",
					product_label = "V2MAPPACKEU00001",
					class = "UnlockDlc"
				}
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
		}
	},
	holly = {
		level_settings = "levels/honduras_dlcs/holly/level_settings_holly",
		package_name = "resource_packages/dlcs/holly",
		terror_event_blueprints_filename = "levels/honduras_dlcs/holly/terror_events_holly",
		level_unlock_settings = "levels/honduras_dlcs/holly/level_unlock_settings_holly",
		unlock_settings = {
			holly = {
				class = "UnlockDlc",
				id = "975400"
			}
		},
		unlock_settings_xb1 = {
			holly = {
				class = "UnlockDlc",
				id = "2370E217-689D-4EFB-B31E-6F5D47237922"
			}
		},
		unlock_settings_ps4 = {
			CUSA13595_00 = {
				holly = {
					id = "55e08f1c10be40a1bab40c582b408994",
					product_label = "V2MAPPACKUS00002",
					class = "UnlockDlc"
				}
			},
			CUSA13645_00 = {
				holly = {
					id = "eb035db81456460788318a1be338253f",
					product_label = "V2MAPPACKEU00002",
					class = "UnlockDlc"
				}
			}
		},
		weighted_random_terror_events = {
			magnus_door = {
				"magnus_door_a",
				1,
				"magnus_door_b",
				1
			},
			cemetery_plague_brew_event_1 = {
				"cemetery_plague_brew_event_1_a",
				1,
				"cemetery_plague_brew_event_1_b",
				1
			},
			cemetery_plague_brew_event_2 = {
				"cemetery_plague_brew_event_2_a",
				1,
				"cemetery_plague_brew_event_2_b",
				1
			},
			cemetery_plague_brew_event_3 = {
				"cemetery_plague_brew_event_3_a",
				1,
				"cemetery_plague_brew_event_3_b",
				1
			},
			cemetery_plague_brew_event_4 = {
				"cemetery_plague_brew_event_4_a",
				1,
				"cemetery_plague_brew_event_4_b",
				1
			},
			forest_end = {
				"forest_end_event_a",
				5,
				"forest_end_event_b",
				5,
				"forest_end_event_c",
				3
			},
			forest_skaven_camp = {
				"forest_skaven_camp_a",
				1,
				"forest_skaven_camp_b",
				1,
				"forest_skaven_camp_c",
				1
			}
		},
		dialogue_lookup = {
			"dialogues/generated/lookup_witch_hunter_magnus_tower",
			"dialogues/generated/lookup_bright_wizard_magnus_tower",
			"dialogues/generated/lookup_dwarf_ranger_magnus_tower",
			"dialogues/generated/lookup_empire_soldier_magnus_tower",
			"dialogues/generated/lookup_wood_elf_magnus_tower",
			"dialogues/generated/lookup_witch_hunter_cemetery",
			"dialogues/generated/lookup_bright_wizard_cemetery",
			"dialogues/generated/lookup_dwarf_ranger_cemetery",
			"dialogues/generated/lookup_empire_soldier_cemetery",
			"dialogues/generated/lookup_wood_elf_cemetery",
			"dialogues/generated/lookup_witch_hunter_forest_ambush",
			"dialogues/generated/lookup_bright_wizard_forest_ambush",
			"dialogues/generated/lookup_dwarf_ranger_forest_ambush",
			"dialogues/generated/lookup_empire_soldier_forest_ambush",
			"dialogues/generated/lookup_wood_elf_forest_ambush"
		},
		dialogue_settings = {
			magnus = {
				"dialogues/generated/witch_hunter_magnus_tower",
				"dialogues/generated/bright_wizard_magnus_tower",
				"dialogues/generated/dwarf_ranger_magnus_tower",
				"dialogues/generated/empire_soldier_magnus_tower",
				"dialogues/generated/wood_elf_magnus_tower"
			},
			cemetery = {
				"dialogues/generated/witch_hunter_cemetery",
				"dialogues/generated/bright_wizard_cemetery",
				"dialogues/generated/dwarf_ranger_cemetery",
				"dialogues/generated/empire_soldier_cemetery",
				"dialogues/generated/wood_elf_cemetery"
			},
			forest = {
				"dialogues/generated/witch_hunter_forest_ambush",
				"dialogues/generated/bright_wizard_forest_ambush",
				"dialogues/generated/dwarf_ranger_forest_ambush",
				"dialogues/generated/empire_soldier_forest_ambush",
				"dialogues/generated/wood_elf_forest_ambush"
			}
		},
		missions = {
			plaza_investigate = {
				mission_template_name = "goal",
				text = "mission_plaza_investigate"
			},
			plaza_survive = {
				mission_template_name = "goal",
				text = "mission_plaza_survive"
			},
			plaza_pickup = {
				mission_template_name = "goal",
				text = "mission_plaza_pickup"
			},
			plaza_waystone = {
				mission_template_name = "goal",
				text = "mission_plaza_waystone"
			},
			mission_magnus_survive_hordes = {
				mission_template_name = "goal",
				text = "mission_magnus_survive_hordes"
			},
			mission_holly_escape_into_illusion_portal = {
				mission_template_name = "goal",
				text = "mission_holly_escape_into_illusion_portal"
			}
		},
		achievement_template_file_names = {
			"scripts/managers/achievements/achievement_templates_holly"
		},
		achievement_outline = {
			levels = {
				entries = {
					"holly_complete_recruit",
					"holly_complete_veteran",
					"holly_complete_champion",
					"holly_complete_legend",
					"holly_complete_plaza_recruit",
					"holly_complete_plaza_veteran",
					"holly_complete_plaza_champion",
					"holly_complete_plaza_legend"
				},
				categories = {
					{
						name = "achv_menu_levels_holly_category_title",
						entries = {
							"holly_find_all_runes",
							"holly_magnus_barrel_relay_race",
							"holly_magnus_barrel_relay_race_hardest",
							"holly_magnus_secret_room",
							"holly_magnus_gutter_runner_treasure",
							"holly_magnus_gutter_runner_treasure_hardest",
							"holly_forest_ambush_synchronized_explosives",
							"holly_forest_ambush_synchronized_explosives_hardest",
							"holly_forest_ambush_bretonnian_dance",
							"holly_forest_ambush_dragonbane_gem",
							"holly_cemetery_sleep",
							"holly_cemetery_synchronized_chains",
							"holly_cemetery_synchronized_chains_hardest",
							"holly_cemetery_bones"
						}
					}
				}
			}
		}
	},
	paperweight = {
		package_name = "resource_packages/dlcs/paperweight",
		weapon_skins_file_names = {
			"scripts/settings/equipment/weapon_skins_paperweight"
		},
		item_master_list_file_names = {
			"scripts/settings/equipment/item_master_list_paperweight"
		},
		weapon_template_file_names = {
			"scripts/settings/equipment/1h_axes_wood_elf",
			"scripts/settings/equipment/1h_crowbills",
			"scripts/settings/equipment/dual_wield_axe_falchion",
			"scripts/settings/equipment/dual_wield_hammer_sword",
			"scripts/settings/equipment/dual_wield_hammers"
		},
		inventory_package_list = {
			"units/weapons/player/wpn_we_axe_01_t1/wpn_we_axe_01_t1",
			"units/weapons/player/wpn_we_axe_01_t1/wpn_we_axe_01_t1_3p",
			"units/weapons/player/wpn_we_axe_01_t2/wpn_we_axe_01_t2",
			"units/weapons/player/wpn_we_axe_01_t2/wpn_we_axe_01_t2_3p",
			"units/weapons/player/wpn_we_axe_02_t1/wpn_we_axe_02_t1",
			"units/weapons/player/wpn_we_axe_02_t1/wpn_we_axe_02_t1_3p",
			"units/weapons/player/wpn_we_axe_02_t2/wpn_we_axe_02_t2",
			"units/weapons/player/wpn_we_axe_02_t2/wpn_we_axe_02_t2_3p",
			"units/weapons/player/wpn_we_axe_01_t2/wpn_we_axe_01_t2_runed_01",
			"units/weapons/player/wpn_we_axe_01_t2/wpn_we_axe_01_t2_runed_01_3p",
			"units/weapons/player/wpn_we_axe_03_t1/wpn_we_axe_03_t1",
			"units/weapons/player/wpn_we_axe_03_t1/wpn_we_axe_03_t1_3p",
			"units/weapons/player/wpn_we_axe_03_t1/wpn_we_axe_03_t1_runed_01",
			"units/weapons/player/wpn_we_axe_03_t1/wpn_we_axe_03_t1_runed_01_3p",
			"units/weapons/player/wpn_we_axe_03_t2/wpn_we_axe_03_t2",
			"units/weapons/player/wpn_we_axe_03_t2/wpn_we_axe_03_t2_3p",
			"units/weapons/player/wpn_brw_crowbill_01/wpn_brw_crowbill_01",
			"units/weapons/player/wpn_brw_crowbill_01/wpn_brw_crowbill_01_3p",
			"units/weapons/player/wpn_brw_crowbill_02/wpn_brw_crowbill_02",
			"units/weapons/player/wpn_brw_crowbill_02/wpn_brw_crowbill_02_3p",
			"units/weapons/player/wpn_brw_crowbill_02/wpn_brw_crowbill_02_runed_01",
			"units/weapons/player/wpn_brw_crowbill_02/wpn_brw_crowbill_02_runed_01_3p",
			"units/weapons/player/wpn_emp_sword_06_t1/wpn_emp_sword_06_t1",
			"units/weapons/player/wpn_emp_sword_06_t1/wpn_emp_sword_06_t1_3p",
			"units/weapons/player/wpn_emp_sword_06_t1/wpn_emp_sword_06_t1_runed_01",
			"units/weapons/player/wpn_emp_sword_06_t1/wpn_emp_sword_06_t1_runed_01_3p",
			"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2",
			"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_3p",
			"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_runed_01",
			"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_runed_01_3p"
		},
		default_items = {
			we_1h_axe = {
				inventory_icon = "icon_we_1h_axe_01",
				description = "description_default_holly_weapons",
				display_name = "display_name_default_we_1h_axe"
			},
			bw_1h_crowbill = {
				inventory_icon = "icon_bw_1h_crowbill_01",
				description = "description_default_holly_weapons",
				display_name = "display_name_default_bw_1h_crowbill"
			},
			wh_dual_wield_axe_falchion = {
				inventory_icon = "icon_wh_dual_wield_axe_falchion_01",
				description = "description_default_holly_weapons",
				display_name = "display_name_default_wh_dual_wield_axe_falchion"
			},
			dr_dual_wield_hammers = {
				inventory_icon = "icon_dr_dual_wield_hammers_01",
				description = "description_default_holly_weapons",
				display_name = "display_name_default_dr_dual_wield_hammers"
			},
			es_dual_wield_hammer_sword = {
				inventory_icon = "icon_es_dual_wield_hammer_sword_01",
				description = "description_default_holly_weapons",
				display_name = "display_name_default_es_dual_wield_hammer_sword"
			}
		},
		achievement_template_file_names = {
			"scripts/managers/achievements/achievement_templates_paperweight"
		},
		achievement_outline = {
			heroes = {
				categories = {
					{
						name = "inventory_name_empire_soldier",
						entries = {
							"holly_kruber_complete_all_levels",
							"holly_kruber_weapon_skin_2",
							"holly_kruber_weapon_skin_3"
						}
					},
					{
						name = "inventory_name_dwarf_ranger",
						entries = {
							"holly_bardin_complete_all_levels",
							"holly_bardin_weapon_skin_2",
							"holly_bardin_weapon_skin_3"
						}
					},
					{
						name = "inventory_name_wood_elf",
						entries = {
							"holly_kerillian_complete_all_levels",
							"holly_kerillian_weapon_skin_2",
							"holly_kerillian_weapon_skin_3"
						}
					},
					{
						name = "inventory_name_witch_hunter",
						entries = {
							"holly_saltzpyre_complete_all_levels",
							"holly_saltzpyre_weapon_skin_2",
							"holly_saltzpyre_weapon_skin_3"
						}
					},
					{
						name = "inventory_name_bright_wizard",
						entries = {
							"holly_sienna_complete_all_levels",
							"holly_sienna_weapon_skin_2",
							"holly_sienna_weapon_skin_3"
						}
					}
				}
			}
		}
	}
}

return
