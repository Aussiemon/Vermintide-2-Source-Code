return {
	wind_strength = 5,
	wind = "beasts",
	seed = 5923569,
	objectives = {
		{
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_woods_beasts",
			objective_type = "kill",
			conflict_settings = "weave_skaven_beastmen",
			level_seed = 295720,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_woods",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 209384,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						terror_event_name = "beastmen_main_path_event_horde_small",
						percentage = 8,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "skaven_main_path_event_01",
						percentage = 8,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "skaven_main_path_event_horde_small",
						percentage = 8,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
						percentage = 15,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "beastmen_skaven_main_path_event_horde_small",
						percentage = 30,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "skaven_main_path_event_horde_elite_spice",
						percentage = 30,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "beastmen_main_path_event_horde_small",
						percentage = 30,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "skaven_main_path_event_horde_small",
						percentage = 30,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 37,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "beastmen_skaven_main_path_event_horde_small",
						percentage = 60,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "skaven_main_path_event_horde_small",
						percentage = 60,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "beastmen_main_path_event_horde_elite_spice",
						percentage = 60,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 63,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "beastmen_skaven_main_path_event_horde_small",
						percentage = 80,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "skaven_main_path_event_horde_elite_spice",
						percentage = 80,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "beastmen_main_path_event_horde_medium",
						percentage = 80,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "skaven_main_path_event_horde_small",
						percentage = 80,
						percentage_spawn_offset = 12
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner_001 = {
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
				mutator_item_spawner_002 = {
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
				mutator_item_spawner_009 = {
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
				mutator_item_spawner_014 = {
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
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_temple_beasts",
			spawning_seed = 549684,
			level_seed = 5684648,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			system_seeds = {
				pickups = 8721685
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "boss_06",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner = {
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
				mutator_item_spawner_002 = {
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
				}
			}
		}
	}
}
