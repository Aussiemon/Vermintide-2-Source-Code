return {
	wind_strength = 4,
	wind = "death",
	seed = 5923569,
	objectives = {
		{
			display_name = "objective_capture_points_name",
			level_id = "dlc_scorpion_woods_death",
			objective_type = "capture_points",
			conflict_settings = "default_weave_light",
			end_zone_name = "end_zone_03",
			level_seed = 295720,
			base_level_id = "dlc_scorpion_woods",
			objective_start_flow_event = "weave_objective_capture_points_start",
			show_bar = true,
			spawning_seed = 3654632,
			terror_events = {
				"capture_point_1_chaos",
				"capture_point_6_boss_event_skaven",
				"capture_point_event_beastmen"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								cataclysm = 0.13,
								cataclysm_3 = 0.12,
								normal = 0.3
							}
						},
						capture_point_001 = {
							score = 15,
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
							score = 15,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_6_boss_event_skaven", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_6_boss_event_skaven", spawner_id)
							end
						},
						capture_point_003 = {
							score = 15,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_event_beastmen", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_event_beastmen", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 25,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_medium",
						percentage = 30,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
						percentage = 30,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_medium",
						percentage = 30,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_standard_skaven_large_short",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short",
						percentage = 65,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 65,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
						percentage = 65,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 75,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 80,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_short",
						percentage = 80,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_short",
						percentage = 80,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_short",
						percentage = 95,
						percentage_spawn_offset = 0
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_death",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 549684,
			level_seed = 5684648,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 8721685
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "swarms_2_bosses_event",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
