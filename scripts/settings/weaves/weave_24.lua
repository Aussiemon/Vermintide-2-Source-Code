return {
	wind_strength = 4,
	wind = "death",
	seed = 457892,
	terror_events = {
		"weave_spot_event_boss_chaos_spawn",
		"capture_point_3_event"
	},
	objectives = {
		{
			display_name = "objective_destroy_doom_wheels_name",
			level_id = "dlc_scorpion_wall_death",
			objective_type = "doom_wheels",
			conflict_settings = "default_weave",
			level_seed = 874583,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_wall",
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			spawning_seed = 9816,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								harder = 0.27,
								cataclysm_3 = 0.14040000000000002,
								cataclysm_2 = 0.1458
							}
						},
						weave_prop_skaven_doom_wheel_01_spawner_002 = {
							score = 40,
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
						weave_limited_item_track_spawner_009 = {
							score = 0,
							template_name = "magic_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
							end,
							on_destroy_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_3_event", spawner_id)
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
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_disablers_chaos_medium",
						percentage = 5,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_short",
						percentage = 5,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_theme_shields_chaos_medium",
						percentage = 5,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 10,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_short",
						percentage = 16,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 16,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_chaos_small_long",
						percentage = 35,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_short",
						percentage = 35,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_standard_chaos_large_short",
						percentage = 35,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_medium",
						percentage = 55,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_short",
						percentage = 55,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
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
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_death",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 459078,
			level_seed = 9084502,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 879025
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "chaos_bosses",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
