﻿-- chunkname: @scripts/settings/weaves/weave_11.lua

return {
	seed = 5923569,
	wind = "life",
	wind_strength = 1,
	objectives = {
		{
			base_level_id = "dlc_scorpion_swamp",
			conflict_settings = "weave_beastmen",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_swamp_life",
			level_seed = 295720,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 209384,
			objective_settings = {
				objective_lists = "weave_11",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_02",
				main_path_spawning = {
					{
						percentage = 1,
						percentage_spawn_offset = 3,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 6,
						percentage_spawn_offset = 3,
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
					},
					{
						percentage = 6,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_ranged_skaven_medium",
					},
					{
						percentage = 6,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 16,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 24,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_chaos_medium_medium",
					},
					{
						percentage = 24,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
					},
					{
						percentage = 24,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_disablers_chaos_short",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_beastmen_medium_medium",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_buff_beastmen_medium",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_armored_beastmen_short",
					},
					{
						percentage = 52,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_vanilla_chaos_short",
					},
					{
						percentage = 52,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_chaos_large_short",
					},
					{
						percentage = 52,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_aoe_chaos_short",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_small_medium",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_disablers_skaven_medium",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_archers_beastmen_long",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_buff_beastmen_long",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_beastmen_long",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_arena_temple_life",
			level_seed = 5684648,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 549684,
			system_seeds = {
				pickups = 8721685,
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
