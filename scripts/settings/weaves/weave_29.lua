-- chunkname: @scripts/settings/weaves/weave_29.lua

return {
	seed = 238947,
	wind = "fire",
	wind_strength = 4,
	objectives = {
		{
			base_level_id = "dlc_scorpion_alleys",
			conflict_settings = "default_weave",
			display_name = "objective_destroy_doom_wheels_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_alleys_fire",
			level_seed = 4093782,
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			objective_type = "doom_wheels",
			show_bar = true,
			spawning_seed = 493207,
			terror_events = {
				"weave_spot_event_boss_stormfiend",
				"weave_spot_event_boss_rat_ogre",
				"capture_point_1_event_small",
				"capture_point_specials_raid",
			},
			objective_settings = {
				objective_lists = "weave_29",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 95372,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						percentage = 5,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_disablers_chaos_medium",
					},
					{
						percentage = 5,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_theme_berzerkers_chaos_short",
					},
					{
						percentage = 5,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_theme_shields_chaos_medium",
					},
					{
						percentage = 10,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 16,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_chaos_short",
					},
					{
						percentage = 16,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_buff_beastmen_short",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 12,
						terror_event_name = "main_path_standard_chaos_small_long",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 12,
						terror_event_name = "main_path_standard_chaos_medium_short",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 12,
						terror_event_name = "main_path_standard_chaos_large_short",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 55,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_berzerkers_chaos_medium",
					},
					{
						percentage = 55,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_chaos_short",
					},
					{
						percentage = 61,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_skaven_long",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_skaven_small_long",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_disablers_skaven_short",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_fire",
			level_seed = 403826,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 492374,
			system_seeds = {
				pickups = 938472,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "chaos_bosses",
					},
				},
			},
		},
	},
}
