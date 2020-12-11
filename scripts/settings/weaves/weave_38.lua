return {
	wind_strength = 3,
	wind = "beasts",
	seed = 45654,
	objectives = {
		{
			display_name = "objective_capture_points_name",
			level_id = "dlc_scorpion_pit_beasts",
			objective_type = "capture_points",
			conflict_settings = "default_weave",
			end_zone_name = "end_zone_03",
			level_seed = 1896357,
			base_level_id = "dlc_scorpion_pit",
			objective_start_flow_event = "weave_objective_capture_points_start",
			show_bar = true,
			spawning_seed = 216384,
			terror_events = {
				"capture_point_1_chaos",
				"capture_point_1_event_large_skaven",
				"capture_point_1_event_large",
				"capture_point_2_event",
				"capture_point_6_boss_event_skaven"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						capture_point_001 = {
							timer = 25,
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_chaos", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_chaos", spawner_id)
							end
						},
						capture_point_002 = {
							timer = 25,
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_2_event", spawner_id)
							end
						},
						capture_point_003_skaven = {
							timer = 25,
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_large_skaven", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_large_skaven", spawner_id)
							end
						},
						capture_point_006_skaven = {
							timer = 25,
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_6_boss_event_skaven", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_6_boss_event_skaven", spawner_id)
							end
						},
						capture_point_007 = {
							timer = 25,
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_large", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_large", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 118466
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
				mutator_item_spawner_017 = {
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
				mutator_item_spawner_026 = {
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
				mutator_item_spawner_023 = {
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
				mutator_item_spawner_032 = {
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
				mutator_item_spawner_030 = {
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
				mutator_item_spawner_008 = {
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
				mutator_item_spawner_022 = {
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
				mutator_item_spawner_010 = {
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
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_beasts",
			spawning_seed = 11854541,
			level_seed = 1268425,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_waves_start",
			system_seeds = {
				pickups = 9826648
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
