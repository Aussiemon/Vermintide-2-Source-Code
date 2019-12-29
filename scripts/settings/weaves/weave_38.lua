return {
	wind_strength = 3,
	wind = "metal",
	seed = 45654,
	objectives = {
		{
			display_name = "objective_capture_points_name",
			level_id = "dlc_scorpion_pit_metal",
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
						kill_enemies = {
							score_multiplier = {
								hardest = 0.16,
								cataclysm_3 = 0.12,
								cataclysm_2 = 0.12
							}
						},
						capture_point_001 = {
							score = 10,
							timer = 25,
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
							score = 10,
							timer = 25,
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
							score = 10,
							timer = 25,
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
							score = 10,
							timer = 25,
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
							score = 10,
							timer = 25,
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
				terror_event_trickle = "trickle_event_armour",
				main_path_spawning = {
					{
						terror_event_name = "main_path_theme_armored_skaven_short",
						percentage = 15,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
						percentage = 15,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short",
						percentage = 15,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 15,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_medium",
						percentage = 40,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_medium",
						percentage = 40,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_medium",
						percentage = 40,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 55,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_mixed_medium_medium",
						percentage = 70,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 70,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_medium",
						percentage = 70,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_metal",
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 11854541,
			level_seed = 1268425,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 9826648
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "skaven_swarm_event",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
