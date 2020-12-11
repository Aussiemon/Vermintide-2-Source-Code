return {
	wind_strength = 2,
	wind = "shadow",
	seed = 23094,
	objectives = {
		{
			display_name = "objective_destroy_doom_wheels_name",
			level_id = "dlc_scorpion_river_shadow",
			objective_type = "doom_wheels",
			conflict_settings = "weave_chaos_light",
			end_zone_name = "end_zone_03",
			level_seed = 45982256,
			base_level_id = "dlc_scorpion_river",
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			show_bar = true,
			spawning_seed = 452354,
			terror_events = {
				"weave_spot_event_boss_chaos_spawn_nodelay",
				"weave_spot_event_boss_minotaur",
				"weave_spot_event_special_mixed",
				"weave_spot_event_skaven_gutter_runner"
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

								Managers.weave:start_terror_event("weave_spot_event_skaven_gutter_runner", spawner_id)
							end
						},
						weave_limited_item_track_spawner_002 = {
							template_name = "explosive_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end
						}
					},
					{
						kill_enemies = {},
						weave_prop_skaven_doom_wheel_01_spawner_001 = {
							timer = 10,
							is_scored = true,
							on_socket_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_minotaur", spawner_id)
							end
						},
						weave_limited_item_track_spawner_003 = {
							template_name = "explosive_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_chaos_spawn_nodelay", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 239840
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_06_slow",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_disablers_chaos_short",
						percentage = 8,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_short",
						percentage = 8,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_short",
						percentage = 8,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_short",
						percentage = 17,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_short",
						percentage = 17,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_short",
						percentage = 17,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_short",
						percentage = 35,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 35,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 35,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 40,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_long",
						percentage = 58,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_long",
						percentage = 58,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_long",
						percentage = 58,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_long",
						percentage = 71,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_long",
						percentage = 71,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_long",
						percentage = 71,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 80,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_shadow",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 450982,
			level_seed = 795483,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 908340
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "boss_05",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
