return {
	wind_strength = 1,
	wind = "beasts",
	seed = 4572,
	objectives = {
		{
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_woods_beasts",
			objective_type = "kill",
			conflict_settings = "weave_beastmen",
			level_seed = 6969,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_woods",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 666,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								harder = 0.59,
								cataclysm_3 = 0.3068,
								cataclysm_2 = 0.3245
							}
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 2085
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_beastmen_small_long",
						percentage = 7,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_short",
						percentage = 7,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_medium",
						percentage = 40,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_medium",
						percentage = 40,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
						percentage = 55,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_standard_beastmen_large_medium",
						percentage = 70,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_long",
						percentage = 70,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 80,
						percentage_spawn_offset = 0
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner_025 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_031 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_006 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_004 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_020 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_016 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_028 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_012 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				}
			}
		},
		{
			allow_mutator_item_respawning = true,
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_beasts",
			spawning_seed = 459078,
			level_seed = 9084502,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			system_seeds = {
				pickups = 879025
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "swarms_2_beastmen_bosses_event",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner_005 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_004 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_003 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				},
				mutator_item_spawner_006 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object"
						}
					}
				}
			}
		}
	}
}
