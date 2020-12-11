return {
	wind_strength = 5,
	wind = "beasts",
	seed = 238947,
	objectives = {
		{
			display_name = "objective_targets_name",
			level_id = "dlc_scorpion_rubble_beasts",
			objective_type = "targets",
			conflict_settings = "weave_skaven_beastmen",
			end_zone_name = "end_zone_02",
			level_seed = 4093782,
			base_level_id = "dlc_scorpion_rubble",
			objective_start_flow_event = "weave_objective_targets_start",
			show_bar = true,
			spawning_seed = 493207,
			terror_events = {
				"weave_spot_event_boss_rat_ogre_nodelay",
				"objective_event_beastmen",
				"weave_spot_event_boss_stormfiend_nodelay",
				"weave_spot_event_boss_minotaur_nodelay",
				"capture_point_1_event_small"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_target_spawner_004 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_rat_ogre_nodelay", spawner_id)
							end
						},
						weave_target_spawner_006 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
							end
						},
						weave_target_spawner_028 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_minotaur_nodelay", spawner_id)
							end
						},
						weave_target_spawner_024 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("objective_event_beastmen", spawner_id)
							end
						},
						weave_target_spawner_035 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_stormfiend_nodelay", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 95372
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 2,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 2,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_event_boss_beastmen_minotaur",
						percentage = 2,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short",
						percentage = 27,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_short",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
						percentage = 48,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_beastmen_minotaur",
						percentage = 72,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 72,
						percentage_spawn_offset = 10
					}
				}
			},
			mutator_item_config = {
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
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_beasts",
			spawning_seed = 492374,
			level_seed = 403826,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_waves_start",
			system_seeds = {
				pickups = 938472
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "beastmen_charge_event_short",
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
