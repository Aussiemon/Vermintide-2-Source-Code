return {
	wind_strength = 1,
	wind = "shadow",
	seed = 548672,
	objectives = {
		{
			display_name = "objective_destroy_doom_wheels_name",
			level_id = "dlc_scorpion_rubble_shadow",
			objective_type = "doom_wheels",
			conflict_settings = "weave_chaos",
			end_zone_name = "end_zone_03",
			level_seed = 734621,
			base_level_id = "dlc_scorpion_rubble",
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			show_bar = true,
			spawning_seed = 8973420,
			terror_events = {
				"weave_spot_event_boss_stormfiend",
				"weave_spot_event_boss_chaos_spawn",
				"capture_point_1_event_medium",
				"objective_specials_raid"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								cataclysm = 0.21,
								cataclysm_3 = 0.19,
								hard = 0.27
							}
						},
						weave_prop_skaven_doom_wheel_01_spawner_001 = {
							score = 20,
							timer = 10,
							on_socket_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_stormfiend", spawner_id)
							end,
							on_destroy_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("weave_spot_event_boss_stormfiend", spawner_id)
							end
						},
						weave_prop_skaven_doom_wheel_01_spawner_002 = {
							score = 20,
							timer = 10,
							on_socket_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_chaos_spawn", spawner_id)
							end,
							on_destroy_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("weave_spot_event_boss_chaos_spawn", spawner_id)
							end
						},
						weave_limited_item_track_spawner_001 = {
							score = 0,
							template_name = "explosive_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_medium", spawner_id)
							end,
							on_destroy_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_medium", spawner_id)
							end
						},
						weave_limited_item_track_spawner_007 = {
							score = 0,
							template_name = "explosive_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("objective_specials_raid", spawner_id)
							end,
							on_destroy_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("objective_specials_raid", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 350972
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_chaos_small_short",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_short",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_short",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_medium",
						percentage = 45,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_medium",
						percentage = 45,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_short_cata",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_medium",
						percentage = 85,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_medium",
						percentage = 85,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_medium",
						percentage = 85,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_shadow",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 903475,
			level_seed = 54987,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 2308954
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "boss_04",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
