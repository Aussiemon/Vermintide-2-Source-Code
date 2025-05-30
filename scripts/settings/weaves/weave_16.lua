﻿-- chunkname: @scripts/settings/weaves/weave_16.lua

return {
	seed = 548672,
	wind = "death",
	wind_strength = 1,
	objectives = {
		{
			base_level_id = "dlc_scorpion_rubble",
			conflict_settings = "weave_chaos",
			display_name = "objective_destroy_doom_wheels_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_rubble_death",
			level_seed = 734621,
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			objective_type = "doom_wheels",
			show_bar = true,
			spawning_seed = 8973420,
			terror_events = {
				"weave_spot_event_boss_stormfiend",
				"weave_spot_event_boss_chaos_spawn",
				"capture_point_1_event_medium",
				"objective_specials_raid",
			},
			objective_settings = {
				objective_lists = "weave_16",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 350972,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_small",
				main_path_spawning = {
					{
						percentage = 7,
						percentage_spawn_offset = 25,
						terror_event_name = "main_path_specials_buff_beastmen_short",
					},
					{
						percentage = 7,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_beastmen_medium_long",
					},
					{
						percentage = 7,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_armored_beastmen_long",
					},
					{
						percentage = 10,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_aoe_chaos_medium",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_berzerkers_chaos_medium",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_archers_beastmen_short",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 50,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_chaos_medium_medium",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_shields_chaos_medium",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_disablers_mixed_short",
					},
					{
						percentage = 74,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_armored_skaven_medium",
					},
					{
						percentage = 74,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 74,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_death",
			level_seed = 54987,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 903475,
			system_seeds = {
				pickups = 2308954,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "warriors_and_ratling_gunners",
					},
				},
			},
		},
	},
}
