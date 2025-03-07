﻿-- chunkname: @scripts/settings/weaves/weave_18.lua

return {
	seed = 548672,
	wind = "heavens",
	wind_strength = 3,
	objectives = {
		{
			base_level_id = "dlc_scorpion_pit",
			conflict_settings = "weave_skaven_beastmen",
			display_name = "objective_sockets_name",
			end_zone_name = "end_zone_01",
			level_id = "dlc_scorpion_pit_heavens",
			level_seed = 734621,
			objective_start_flow_event = "weave_objective_sockets_start",
			objective_type = "sockets",
			show_bar = true,
			spawning_seed = 8973420,
			terror_events = {
				"objective_specials_raid",
				"objective_event_beastmen",
				"weave_spot_event_chaos_warriors",
				"weave_spot_event_skaven_specials_small",
				"capture_point_1_event_small",
			},
			objective_settings = {
				objective_lists = "weave_18",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 350972,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						percentage = 2,
						percentage_spawn_offset = 7,
						terror_event_name = "main_path_standard_skaven_small_medium",
					},
					{
						percentage = 2,
						percentage_spawn_offset = 13,
						terror_event_name = "main_path_specials_ranged_skaven_medium",
					},
					{
						percentage = 2,
						percentage_spawn_offset = 13,
						terror_event_name = "main_path_event_boss_chaos_troll",
					},
					{
						percentage = 15,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_archers_beastmen_medium",
					},
					{
						percentage = 15,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
					},
					{
						percentage = 27,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_event_boss_chaos_troll",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_skaven_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_beastmen_small_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_shields_skaven_short",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_buff_beastmen_short",
					},
					{
						percentage = 48,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 72,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_event_boss_chaos_troll",
					},
					{
						percentage = 72,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_chaos_medium",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_heavens",
			level_seed = 54987,
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 903475,
			system_seeds = {
				pickups = 2308954,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "beastmen_charge_event_short",
					},
				},
			},
		},
	},
}
