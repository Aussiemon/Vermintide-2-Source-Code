return {
	wind_strength = 1,
	wind = "fire",
	seed = 4572,
	objectives = {
		{
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_woods_fire",
			objective_type = "kill",
			conflict_settings = "default_weave",
			level_seed = 6969,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_woods",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 666,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 2085
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 14,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_short",
						percentage = 14,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_short",
						percentage = 14,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_large_long",
						percentage = 25,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_long",
						percentage = 25,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_large_long",
						percentage = 70,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_long",
						percentage = 70,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_long",
						percentage = 70,
						percentage_spawn_offset = 15
					}
				}
			}
		},
		{
			allow_mutator_item_respawning = true,
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_fire",
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
						terror_event_name = "skaven_swarm_heavens_intro",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
