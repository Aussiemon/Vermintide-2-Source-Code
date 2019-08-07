return {
	wind_strength = 4,
	wind = "shadow",
	seed = 571238,
	terror_events = {
		"capture_point_3_event_no_chaos",
		"capture_point_specials_raid",
		"capture_point_1_event_large_skaven",
		"capture_point_1_event_medium_no_chaos",
		"capture_point_1_event_small_no_chaos"
	},
	objectives = {
		{
			display_name = "objective_capture_points_name",
			level_id = "dlc_scorpion_swamp_shadow",
			objective_type = "capture_points",
			conflict_settings = "weave_skaven",
			level_seed = 789654,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_swamp",
			objective_start_flow_event = "weave_objective_capture_points_start",
			spawning_seed = 2156845,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								hardest = 0.15,
								cataclysm_3 = 0.108,
								cataclysm_2 = 0.11699999999999999,
								normal = 0.3
							}
						},
						capture_point_001 = {
							score = 10,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_3_event_no_chaos", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_3_event_no_chaos", spawner_id)
							end
						},
						capture_point_002 = {
							score = 10,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_specials_raid", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_specials_raid", spawner_id)
							end
						},
						capture_point_003 = {
							score = 10,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_large_skaven", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_large_skaven", spawner_id)
							end
						},
						capture_point_004 = {
							score = 10,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_medium_no_chaos", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_medium_no_chaos", spawner_id)
							end
						},
						capture_point_008 = {
							score = 10,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_small_no_chaos", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_small_no_chaos", spawner_id)
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
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_disablers_pure_skaven_short",
						percentage = 10,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_disablers_pure_skaven_short",
						percentage = 20,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_pure_skaven_medium",
						percentage = 40,
						percentage_spawn_offset = -15
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 45,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_pure_skaven_medium",
						percentage = 50,
						percentage_spawn_offset = -20
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 60,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_pure_skaven_long",
						percentage = 70,
						percentage_spawn_offset = -20
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 83,
						percentage_spawn_offset = 15
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_shadow",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 165415,
			level_seed = 2065462,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 7891215
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
