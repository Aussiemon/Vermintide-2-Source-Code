return {
	wind_strength = 4,
	wind = "fire",
	seed = 45654,
	terror_events = {},
	objectives = {
		{
			display_name = "objective_sockets_name",
			level_id = "dlc_scorpion_alleys_fire",
			objective_type = "sockets",
			conflict_settings = "default_weave",
			level_seed = 1896357,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_alleys",
			objective_start_flow_event = "weave_objective_sockets_start",
			spawning_seed = 216384,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								hardest = 0.18,
								cataclysm_3 = 0.14,
								cataclysm_2 = 0.15
							}
						},
						weave_explosive_barrel_socket_006 = {
							score = 40
						},
						weave_limited_item_track_spawner_003 = {
							score = 0,
							template_name = "gargoyle_head_spawner"
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 118466
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 2,
						percentage_spawn_offset = 14
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_medium",
						percentage = 2,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_standard_beastmen_large_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_long",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_long",
						percentage = 30,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 39,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_short",
						percentage = 47,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_short",
						percentage = 47,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
						percentage = 47,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_medium",
						percentage = 60,
						percentage_spawn_offset = 14
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_long",
						percentage = 60,
						percentage_spawn_offset = 14
					},
					{
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
						percentage = 75,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_long",
						percentage = 90,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_long",
						percentage = 90,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_standard_beastmen_large_long",
						percentage = 95,
						percentage_spawn_offset = -15
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_temple_fire",
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
						terror_event_name = "swarms_2_bosses_event",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
