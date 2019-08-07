return {
	wind_strength = 3,
	wind = "death",
	seed = 123974,
	terror_events = {},
	objectives = {
		{
			display_name = "objective_sockets_name",
			level_id = "dlc_scorpion_canyon_death",
			objective_type = "sockets",
			conflict_settings = "default_weave",
			level_seed = 874583,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_canyon",
			objective_start_flow_event = "weave_objective_sockets_start",
			spawning_seed = 25629,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								harder = 0.22,
								cataclysm_3 = 0.12100000000000001,
								cataclysm_2 = 0.1364
							}
						},
						weave_explosive_barrel_socket_002 = {
							score = 20
						},
						weave_limited_item_track_spawner_002 = {
							score = 0,
							template_name = "gargoyle_head_spawner"
						}
					},
					{
						kill_enemies = {
							score_multiplier = {
								harder = 0.22,
								cataclysm_3 = 0.12100000000000001,
								cataclysm_2 = 0.1364
							}
						},
						weave_explosive_barrel_socket_004 = {
							score = 20
						},
						weave_limited_item_track_spawner_009 = {
							score = 0,
							template_name = "gargoyle_head_spawner"
						}
					},
					{
						kill_enemies = {
							score_multiplier = {
								harder = 0.22,
								cataclysm_3 = 0.12100000000000001,
								cataclysm_2 = 0.1364
							}
						},
						weave_explosive_barrel_socket_007 = {
							score = 20
						},
						weave_limited_item_track_spawner_008 = {
							score = 0,
							template_name = "gargoyle_head_spawner"
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 23085
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 2,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 2,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 2,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 27,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_short",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 48,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 72,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_medium",
						percentage = 72,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_death",
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 459078,
			level_seed = 9084502,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 879025
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "beastmen_charge_event_short",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
