return {
	wind_strength = 3,
	wind = "shadow",
	seed = 571238,
	terror_events = {
		"weave_spot_event_special_mixed"
	},
	objectives = {
		{
			display_name = "objective_targets_name",
			level_id = "dlc_scorpion_pit_shadow",
			objective_type = "targets",
			conflict_settings = "weave_chaos",
			level_seed = 789654,
			end_zone_name = "end_zone_02",
			show_bar = true,
			base_level_id = "dlc_scorpion_pit",
			objective_start_flow_event = "weave_objective_targets_start",
			spawning_seed = 2156845,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								hardest = 0.15,
								cataclysm_3 = 0.1035,
								cataclysm_2 = 0.108,
								normal = 0.27
							}
						},
						weave_target_spawner_001 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						},
						weave_target_spawner_005 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						},
						weave_target_spawner_009 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						},
						weave_target_spawner_013 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						},
						weave_target_spawner_011 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						},
						weave_target_spawner_012 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						},
						weave_target_spawner_022 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						},
						weave_target_spawner_028 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						},
						weave_target_spawner_016 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						},
						weave_target_spawner_015 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 156873
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 2,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 10,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_short",
						percentage = 10,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_chaos_small_short",
						percentage = 30,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
						percentage = 30,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 35,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
						percentage = 50,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_medium",
						percentage = 50,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 80,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_medium",
						percentage = 70,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_medium",
						percentage = 70,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_chaos_large_long",
						percentage = 90,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_shields_chaos_long",
						percentage = 90,
						percentage_spawn_offset = 0
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_shadow",
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 165415,
			level_seed = 2065462,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 7891215
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "eshin_swarm",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
