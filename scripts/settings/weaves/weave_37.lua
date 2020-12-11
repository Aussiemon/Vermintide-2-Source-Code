return {
	wind_strength = 2,
	wind = "fire",
	seed = 45654,
	objectives = {
		{
			display_name = "objective_destroy_doom_wheels_name",
			level_id = "dlc_scorpion_mine_fire",
			objective_type = "doom_wheels",
			conflict_settings = "default_weave",
			end_zone_name = "end_zone_01",
			level_seed = 1896357,
			base_level_id = "dlc_scorpion_mine",
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			show_bar = true,
			spawning_seed = 216384,
			terror_events = {
				"weave_spot_event_boss_stormfiend",
				"weave_spot_event_boss_rat_ogre",
				"capture_point_1_event_medium",
				"capture_point_2_event"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_prop_skaven_doom_wheel_01_spawner_001 = {
							timer = 10,
							is_scored = true,
							on_socket_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_stormfiend", spawner_id)
							end
						},
						weave_prop_skaven_doom_wheel_01_spawner_002 = {
							timer = 10,
							is_scored = true,
							on_socket_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_rat_ogre", spawner_id)
							end
						},
						weave_limited_item_track_spawner_004 = {
							template_name = "explosive_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_medium", spawner_id)
							end
						},
						weave_limited_item_track_spawner_002 = {
							template_name = "explosive_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
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
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_large_long",
						percentage = 17,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_long",
						percentage = 17,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short",
						percentage = 17,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
						percentage = 43,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 43,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_long",
						percentage = 43,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_standard_chaos_large_long",
						percentage = 72,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_long",
						percentage = 72,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_long",
						percentage = 72,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 85,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_fire",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 11854541,
			level_seed = 1268425,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 9826648
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "chaos_swarm_event",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
