return {
	wind_strength = 4,
	wind = "shadow",
	seed = 548672,
	objectives = {
		{
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_river_shadow",
			objective_type = "kill",
			conflict_settings = "weave_beastmen_light",
			level_seed = 734621,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_river",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 8973420,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								cataclysm = 0.35,
								cataclysm_3 = 0.3,
								hard = 0.5
							}
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 350972
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_beastmen_large_long",
						percentage = 15,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_long",
						percentage = 15,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_long",
						percentage = 15,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_short",
						percentage = 25,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_medium",
						percentage = 25,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 25,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_long",
						percentage = 42,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_long",
						percentage = 42,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_long",
						percentage = 42,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
						percentage = 65,
						percentage_spawn_offset = 30
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_long",
						percentage = 65,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_long",
						percentage = 65,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 70,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_large_medium",
						percentage = 80,
						percentage_spawn_offset = 0
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
						terror_event_name = "eshin_swarm",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
