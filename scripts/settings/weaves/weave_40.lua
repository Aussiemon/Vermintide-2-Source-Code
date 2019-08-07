return {
	wind_strength = 5,
	wind = "fire",
	seed = 45654,
	terror_events = {},
	objectives = {
		{
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_river_fire",
			objective_type = "kill",
			conflict_settings = "default_weave",
			level_seed = 1896357,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_river",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 216384,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								hardest = 0.4,
								cataclysm_3 = 0.34,
								cataclysm_2 = 0.36
							}
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 118466
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_03",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 3,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_medium",
						percentage = 3,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 3,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_stormfiend",
						percentage = 10,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 15,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_medium",
						percentage = 15,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 30,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 30,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_long",
						percentage = 40,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_long",
						percentage = 40,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_long",
						percentage = 40,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
						percentage = 53,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_long",
						percentage = 70,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_skaven_small_long",
						percentage = 70,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_event_boss_chaos_spawn",
						percentage = 80,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_fire",
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
						terror_event_name = "fire_bosses",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
