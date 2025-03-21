﻿-- chunkname: @scripts/settings/weaves/weave_8.lua

return {
	seed = 23094,
	wind = "death",
	wind_strength = 3,
	objectives = {
		{
			base_level_id = "dlc_scorpion_swamp",
			conflict_settings = "weave_skaven",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_swamp_death",
			level_seed = 45982256,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 452354,
			objective_settings = {
				objective_lists = "weave_8",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 239840,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 7,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_skaven_small_short",
					},
					{
						percentage = 7,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_skaven_medium_short",
					},
					{
						percentage = 7,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 27,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_shields_skaven_short",
					},
					{
						percentage = 27,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_aoe_skaven_short",
					},
					{
						percentage = 27,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_skaven_large_short",
					},
					{
						percentage = 34,
						percentage_spawn_offset = 16,
						terror_event_name = "main_path_standard_skaven_medium_short",
					},
					{
						percentage = 34,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_armored_skaven_short",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_mixed_short_cata",
					},
					{
						percentage = 50,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_skaven_large_short",
					},
					{
						percentage = 50,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_beastmen_medium_short",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_archers_beastmen_short",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_buff_beastmen_short",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_archers_beastmen_short",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_beastmen_large_short",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_beastmen_small_short",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_skaven_short",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_armored_beastmen_short",
					},
					{
						percentage = 85,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
					},
					{
						percentage = 90,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_disablers_mixed_short",
					},
					{
						percentage = 90,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
					},
					{
						percentage = 90,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_standard_chaos_large_short",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_temple_death",
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
						terror_event_name = "chaos_swarm_event",
					},
				},
			},
		},
	},
}
