return {
	wind_strength = 5,
	wind = "life",
	seed = 571238,
	objectives = {
		{
			display_name = "objective_destroy_doom_wheels_name",
			level_id = "dlc_scorpion_canyon_life",
			objective_type = "doom_wheels",
			conflict_settings = "weave_beastmen_light",
			end_zone_name = "end_zone_03",
			level_seed = 789654,
			base_level_id = "dlc_scorpion_canyon",
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			show_bar = true,
			spawning_seed = 2156845,
			terror_events = {
				"weave_spot_event_skaven_gutter_runner",
				"objective_event_beastmen"
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

								Managers.weave:start_terror_event("weave_spot_event_skaven_gutter_runner", spawner_id)
							end
						},
						weave_limited_item_track_spawner_003 = {
							template_name = "explosive_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("objective_event_beastmen", spawner_id)
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
				main_path_spawning = {
					{
						terror_event_name = "main_path_theme_archers_beastmen_short",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_long",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_long",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_short",
						percentage = 23,
						percentage_spawn_offset = 32
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_medium",
						percentage = 23,
						percentage_spawn_offset = 32
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_long",
						percentage = 23,
						percentage_spawn_offset = 32
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_short",
						percentage = 30,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 34,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_short",
						percentage = 40,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_medium",
						percentage = 40,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_short",
						percentage = 40,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short",
						percentage = 50,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 50,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 57,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_short",
						percentage = 60,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_medium",
						percentage = 60,
						percentage_spawn_offset = 30
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_long",
						percentage = 60,
						percentage_spawn_offset = 35
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 70,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 75,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 85,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 85,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short",
						percentage = 85,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_temple_life",
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
						terror_event_name = "boss_04",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
