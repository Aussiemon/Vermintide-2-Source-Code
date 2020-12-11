return {
	wind_strength = 3,
	wind = "life",
	seed = 293048,
	objectives = {
		{
			display_name = "objective_capture_points_name",
			level_id = "dlc_scorpion_rubble_life",
			objective_type = "capture_points",
			conflict_settings = "default_weave",
			end_zone_name = "end_zone_03",
			level_seed = 8435394,
			base_level_id = "dlc_scorpion_rubble",
			objective_start_flow_event = "weave_objective_capture_points_start",
			show_bar = true,
			spawning_seed = 312093,
			terror_events = {
				"capture_point_3_event",
				"capture_point_1_event_large",
				"capture_point_1_event_small"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						capture_point_004 = {
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
						capture_point_002 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_small", spawner_id)
							end
						},
						capture_point_005 = {
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
				pickups = 439284
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 23,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short",
						percentage = 23,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_short",
						percentage = 56,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 61,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_short",
						percentage = 74,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_short",
						percentage = 74,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 85,
						percentage_spawn_offset = 5
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_life",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 23094,
			level_seed = 389090,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 29843
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "beastmen_charge_event_short",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
