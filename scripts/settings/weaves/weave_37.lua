-- chunkname: @scripts/settings/weaves/weave_37.lua

return {
	seed = 45654,
	wind = "fire",
	wind_strength = 2,
	objectives = {
		{
			base_level_id = "dlc_scorpion_mine",
			conflict_settings = "default_weave",
			display_name = "objective_destroy_doom_wheels_name",
			end_zone_name = "end_zone_01",
			level_id = "dlc_scorpion_mine_fire",
			level_seed = 1896357,
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			objective_type = "doom_wheels",
			show_bar = true,
			spawning_seed = 216384,
			terror_events = {
				"weave_spot_event_boss_stormfiend",
				"weave_spot_event_boss_rat_ogre",
				"capture_point_1_event_medium",
				"capture_point_2_event",
			},
			objective_settings = {
				objective_lists = "weave_37",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 118466,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 17,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_large_long",
					},
					{
						percentage = 17,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_skaven_long",
					},
					{
						percentage = 17,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_skaven_short",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 43,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
					},
					{
						percentage = 43,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_skaven_small_short",
					},
					{
						percentage = 43,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_ranged_skaven_long",
					},
					{
						percentage = 72,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_chaos_large_long",
					},
					{
						percentage = 72,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_armored_chaos_long",
					},
					{
						percentage = 72,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_disablers_chaos_long",
					},
					{
						percentage = 85,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_fire",
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
						terror_event_name = "chaos_swarm_event",
					},
				},
			},
		},
	},
}
