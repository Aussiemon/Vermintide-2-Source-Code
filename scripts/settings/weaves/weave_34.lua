-- chunkname: @scripts/settings/weaves/weave_34.lua

return {
	seed = 571238,
	wind = "heavens",
	wind_strength = 4,
	objectives = {
		{
			base_level_id = "dlc_scorpion_swamp",
			conflict_settings = "weave_skaven",
			display_name = "objective_capture_points_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_swamp_heavens",
			level_seed = 789654,
			objective_start_flow_event = "weave_objective_capture_points_start",
			objective_type = "capture_points",
			show_bar = true,
			spawning_seed = 2156845,
			terror_events = {
				"capture_point_3_event_no_chaos",
				"capture_point_specials_raid",
				"capture_point_1_event_large_skaven",
				"capture_point_1_event_medium_no_chaos",
				"capture_point_1_event_small_no_chaos",
			},
			objective_settings = {
				objective_lists = "weave_34",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 156873,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 10,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_disablers_pure_skaven_short",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_disablers_pure_skaven_short",
					},
					{
						percentage = 40,
						percentage_spawn_offset = -15,
						terror_event_name = "main_path_specials_disablers_pure_skaven_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
					},
					{
						percentage = 50,
						percentage_spawn_offset = -20,
						terror_event_name = "main_path_specials_disablers_pure_skaven_medium",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 70,
						percentage_spawn_offset = -20,
						terror_event_name = "main_path_specials_disablers_pure_skaven_long",
					},
					{
						percentage = 83,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_heavens",
			level_seed = 2065462,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 165415,
			system_seeds = {
				pickups = 7891215,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "skaven_swarm_event",
					},
				},
			},
		},
	},
}
