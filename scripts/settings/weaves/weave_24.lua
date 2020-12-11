return {
	wind_strength = 4,
	wind = "death",
	seed = 457892,
	objectives = {
		{
			display_name = "objective_destroy_doom_wheels_name",
			level_id = "dlc_scorpion_wall_death",
			objective_type = "doom_wheels",
			conflict_settings = "default_weave",
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
				terror_event_trickle = "trickle_event_chaos_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_chaos_small_short",
						percentage = 8,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_short",
						percentage = 8,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 20,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_short",
						percentage = 33,
						percentage_spawn_offset = 6
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 56,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 70,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_standard_chaos_large_short",
						percentage = 79,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_short",
						percentage = 79,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			allow_mutator_item_respawning = true,
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_death",
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
						terror_event_name = "chaos_swarm_event",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
