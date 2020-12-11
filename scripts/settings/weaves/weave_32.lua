return {
	wind_strength = 2,
	wind = "death",
	seed = 571238,
	objectives = {
		{
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_mine_death",
			objective_type = "kill",
			conflict_settings = "default_weave",
			level_seed = 789654,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_mine",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 2156845,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 156873
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_chaos_small_short",
						percentage = 2,
						percentage_spawn_offset = 3
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_short",
						percentage = 5,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_shields_chaos_medium",
						percentage = 18,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
						percentage = 18,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 18,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 22,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_short",
						percentage = 34,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_short",
						percentage = 34,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_long",
						percentage = 34,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 39,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short",
						percentage = 50,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_long",
						percentage = 50,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
						percentage = 50,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_chaos_small_long",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_short",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 65,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_chaos_large_long",
						percentage = 85,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_medium_long",
						percentage = 85,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short",
						percentage = 85,
						percentage_spawn_offset = 13
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_castle_death",
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 165415,
			level_seed = 2065462,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 7891215
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
