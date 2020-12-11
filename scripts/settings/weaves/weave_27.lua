return {
	wind_strength = 2,
	wind = "life",
	seed = 23094,
	objectives = {
		{
			display_name = "objective_sockets_name",
			level_id = "dlc_scorpion_river_life",
			objective_type = "sockets",
			conflict_settings = "default_weave",
			end_zone_name = "end_zone_03",
			level_seed = 45982256,
			base_level_id = "dlc_scorpion_river",
			objective_start_flow_event = "weave_objective_sockets_start",
			show_bar = true,
			spawning_seed = 452354,
			terror_events = {
				"capture_point_1_event_small",
				"weave_spot_event_skaven_specials_small",
				"weave_spot_event_skaven_specials_medium",
				"weave_spot_event_boss_minotaur_nodelay",
				"objective_event_beastmen",
				"objective_specials_raid"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_007 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
							end
						},
						weave_limited_item_track_spawner_001 = {
							template_name = "gargoyle_head_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_skaven_specials_small", spawner_id)
							end
						}
					},
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_003 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_minotaur_nodelay", spawner_id)
							end
						},
						weave_limited_item_track_spawner_006 = {
							template_name = "gargoyle_head_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_skaven_specials_medium", spawner_id)
							end
						}
					},
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_004 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("objective_specials_raid", spawner_id)
							end
						},
						weave_limited_item_track_spawner_004 = {
							template_name = "gargoyle_head_spawner",
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
				pickups = 239840
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 2,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_medium",
						percentage = 22,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
						percentage = 22,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 22,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 28,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_medium",
						percentage = 57,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_medium",
						percentage = 57,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 57,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 67,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_medium",
						percentage = 74,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_medium",
						percentage = 74,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 74,
						percentage_spawn_offset = 20
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_life",
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
						terror_event_name = "eshin_swarm",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
