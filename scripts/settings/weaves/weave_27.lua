-- chunkname: @scripts/settings/weaves/weave_27.lua

return {
	seed = 23094,
	wind = "life",
	wind_strength = 2,
	objectives = {
		{
			base_level_id = "dlc_scorpion_river",
			conflict_settings = "default_weave",
			display_name = "objective_sockets_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_river_life",
			level_seed = 45982256,
			objective_start_flow_event = "weave_objective_sockets_start",
			objective_type = "sockets",
			show_bar = true,
			spawning_seed = 452354,
			terror_events = {
				"capture_point_1_event_small",
				"weave_spot_event_skaven_specials_small",
				"weave_spot_event_skaven_specials_medium",
				"weave_spot_event_boss_minotaur_nodelay",
				"objective_event_beastmen",
				"objective_specials_raid",
			},
			objective_settings = {
				objective_lists = "weave_27",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 239840,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 2,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
					},
					{
						percentage = 22,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_aoe_chaos_medium",
					},
					{
						percentage = 22,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
					},
					{
						percentage = 22,
						percentage_spawn_offset = 25,
						terror_event_name = "main_path_theme_archers_beastmen_medium",
					},
					{
						percentage = 28,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_shields_skaven_medium",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_skaven_small_short",
					},
					{
						percentage = 67,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
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
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_life",
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
						terror_event_name = "eshin_swarm",
					},
				},
			},
		},
	},
}
