﻿-- chunkname: @scripts/settings/weaves/weave_24.lua

return {
	seed = 457892,
	wind = "death",
	wind_strength = 4,
	objectives = {
		{
			base_level_id = "dlc_scorpion_wall",
			conflict_settings = "default_weave",
			display_name = "objective_destroy_doom_wheels_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_wall_death",
			level_seed = 874583,
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			objective_type = "doom_wheels",
			show_bar = true,
			spawning_seed = 9816,
			terror_events = {
				"weave_spot_event_boss_chaos_spawn",
				"capture_point_3_event",
			},
			objective_settings = {
				objective_lists = "weave_24",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 65475,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_small",
				main_path_spawning = {
					{
						percentage = 8,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_chaos_small_short",
					},
					{
						percentage = 8,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_mixed_short",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 33,
						percentage_spawn_offset = 6,
						terror_event_name = "main_path_specials_disablers_chaos_short",
					},
					{
						percentage = 56,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 79,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_chaos_large_short",
					},
					{
						percentage = 79,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_chaos_short",
					},
				},
			},
		},
		{
			allow_mutator_item_respawning = true,
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_death",
			level_seed = 9084502,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 459078,
			system_seeds = {
				pickups = 879025,
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
