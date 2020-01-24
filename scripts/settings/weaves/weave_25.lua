return {
	wind_strength = 5,
	wind = "beasts",
	seed = 1417,
	objectives = {
		{
			display_name = "objective_capture_points_name",
			level_id = "dlc_scorpion_pit_beasts",
			objective_type = "capture_points",
			conflict_settings = "weave_skaven_beastmen",
			end_zone_name = "end_zone_02",
			level_seed = 874583,
			base_level_id = "dlc_scorpion_pit",
			objective_start_flow_event = "weave_objective_capture_points_start",
			show_bar = true,
			spawning_seed = 2569,
			terror_events = {
				"capture_point_1_event_medium",
				"capture_point_3_event",
				"capture_point_2_event"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						capture_point_007 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_medium", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_medium", spawner_id)
							end
						},
						capture_point_008 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_3_event", spawner_id)
							end
						},
						capture_point_005 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_2_event", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 23085
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
				mutator_item_spawner_013 = {
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
				mutator_item_spawner_007 = {
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
				mutator_item_spawner_018 = {
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
			level_id = "dlc_scorpion_arena_void_beasts",
			spawning_seed = 459078,
			level_seed = 9084,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			system_seeds = {
				pickups = 79025
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
