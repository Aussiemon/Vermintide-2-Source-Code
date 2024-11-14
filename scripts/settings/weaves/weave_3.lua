-- chunkname: @scripts/settings/weaves/weave_3.lua

return {
	seed = 293048,
	wind = "life",
	wind_strength = 3,
	objectives = {
		{
			base_level_id = "dlc_scorpion_rubble",
			conflict_settings = "default_weave",
			display_name = "objective_capture_points_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_rubble_life",
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
				objective_lists = "weave_3",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 439284,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 15,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 23,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_small_short",
					},
					{
						percentage = 23,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_skaven_short",
					},
					{
						percentage = 56,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_disablers_chaos_short",
					},
					{
						percentage = 61,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 74,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_vanilla_chaos_short",
					},
					{
						percentage = 74,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_chaos_short",
					},
					{
						percentage = 85,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_life",
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
						terror_event_name = "beastmen_charge_event_short",
					},
				},
			},
		},
	},
}
