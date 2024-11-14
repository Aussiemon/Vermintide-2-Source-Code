-- chunkname: @scripts/settings/weaves/weave_40.lua

return {
	seed = 45654,
	wind = "death",
	wind_strength = 5,
	objectives = {
		{
			base_level_id = "dlc_scorpion_river",
			conflict_settings = "default_weave",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_river_death",
			level_seed = 1896357,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 216384,
			objective_settings = {
				objective_lists = "weave_40",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 118466,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_mixed_small_slow",
				main_path_spawning = {
					{
						percentage = 25,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_ranged_skaven_medium",
					},
					{
						percentage = 25,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_chaos_small_short",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
					},
					{
						percentage = 50,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_medium",
					},
					{
						percentage = 50,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_archers_beastmen_medium",
					},
					{
						percentage = 50,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_archers_beastmen_medium",
					},
					{
						percentage = 55,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_event_boss_beastmen_minotaur",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_large_short",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_death",
			level_seed = 1268425,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 11854541,
			system_seeds = {
				pickups = 9826648,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "boss_05",
					},
				},
			},
		},
	},
}
