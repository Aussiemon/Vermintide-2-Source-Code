return {
	wind_strength = 4,
	wind = "beasts",
	seed = 457892,
	objectives = {
		{
			display_name = "objective_destroy_doom_wheels_name",
			level_id = "dlc_scorpion_wall_beasts",
			objective_type = "doom_wheels",
			conflict_settings = "weave_skaven_beastmen",
			end_zone_name = "end_zone_03",
			level_seed = 874583,
			base_level_id = "dlc_scorpion_wall",
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			show_bar = true,
			spawning_seed = 9816,
			terror_events = {
				"weave_spot_event_boss_chaos_spawn",
				"capture_point_3_event"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_prop_skaven_doom_wheel_01_spawner_002 = {
							timer = 10,
							is_scored = true,
							on_socket_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_chaos_spawn", spawner_id)
							end
						},
						weave_limited_item_track_spawner_009 = {
							template_name = "magic_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 65475
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 5,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
						percentage = 5,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_medium",
						percentage = 5,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
						percentage = 10,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 16,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 16,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_long",
						percentage = 35,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_short",
						percentage = 35,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_standard_skaven_large_short",
						percentage = 35,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
						percentage = 55,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_short",
						percentage = 55,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_medium",
						percentage = 61,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 70,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_long",
						percentage = 70,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_long",
						percentage = 80,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short",
						percentage = 80,
						percentage_spawn_offset = 15
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
				mutator_item_spawner_019 = {
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
						terror_event_name = "beastmen_bosses_bestigors",
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
