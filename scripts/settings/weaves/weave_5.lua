﻿-- chunkname: @scripts/settings/weaves/weave_5.lua

return {
	seed = 293048,
	wind = "fire",
	wind_strength = 5,
	objectives = {
		{
			base_level_id = "dlc_scorpion_mine",
			conflict_settings = "default_weave",
			display_name = "objective_capture_points_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_mine_fire",
			level_seed = 8435394,
			objective_start_flow_event = "weave_objective_capture_points_start",
			objective_type = "capture_points",
			show_bar = true,
			spawning_seed = 312093,
			terror_events = {
				"capture_point_3_event",
				"capture_point_1_event_large",
				"capture_point_1_event_small",
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						capture_point_003 = {
							is_scored = true,
							sort_index = 3,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_3_event", spawner_id)
							end,
						},
						capture_point_001 = {
							is_scored = true,
							sort_index = 1,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_small", spawner_id)
							end,
						},
						capture_point_002 = {
							is_scored = true,
							sort_index = 2,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_large", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_large", spawner_id)
							end,
						},
					},
				},
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 439284,
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
						percentage = 15,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 39,
						percentage_spawn_offset = 6,
						terror_event_name = "main_path_specials_disablers_chaos_short",
					},
					{
						percentage = 39,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 56,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_ranged_skaven_short",
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
					{
						percentage = 85,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_fire",
			level_seed = 389090,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 23094,
			system_seeds = {
				pickups = 29843,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "swarms_2_bosses_event",
					},
				},
			},
		},
	},
}
