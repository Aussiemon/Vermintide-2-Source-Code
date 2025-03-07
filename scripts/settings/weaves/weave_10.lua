﻿-- chunkname: @scripts/settings/weaves/weave_10.lua

return {
	seed = 23094,
	wind = "heavens",
	wind_strength = 5,
	objectives = {
		{
			base_level_id = "dlc_scorpion_alleys",
			conflict_settings = "default_weave_light",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_alleys_heavens",
			level_seed = 45982256,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 452354,
			objective_settings = {
				objective_lists = "weave_10",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 239840,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_05",
				main_path_spawning = {
					{
						percentage = 10,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_armored_skaven_medium",
					},
					{
						percentage = 10,
						percentage_spawn_offset = 60,
						terror_event_name = "main_path_event_boss_chaos_spawn",
					},
					{
						percentage = 10,
						percentage_spawn_offset = -5,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
					},
					{
						percentage = 25,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_chaos_large_long",
					},
					{
						percentage = 25,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_armored_chaos_long",
					},
					{
						percentage = 25,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_aoe_chaos_long",
					},
					{
						percentage = 40,
						percentage_spawn_offset = -10,
						terror_event_name = "main_path_specials_ranged_skaven_medium",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_shields_chaos_medium",
					},
					{
						percentage = 40,
						percentage_spawn_offset = -10,
						terror_event_name = "main_path_standard_chaos_small_medium",
					},
					{
						percentage = 50,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_mixed_short_cata",
					},
					{
						percentage = 53,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_chaos_large_long",
					},
					{
						percentage = 53,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_berzerkers_chaos_long",
					},
					{
						percentage = 53,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_disablers_chaos_long",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_armored_chaos_long",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_aoe_skaven_long",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_chaos_medium_long",
					},
					{
						percentage = 75,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_heavens",
			level_seed = 795483,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 450982,
			system_seeds = {
				pickups = 908340,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "fire_bosses",
					},
				},
			},
		},
	},
}
