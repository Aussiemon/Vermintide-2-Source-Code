-- chunkname: @scripts/settings/weaves/weave_7.lua

return {
	seed = 23094,
	wind = "shadow",
	wind_strength = 2,
	objectives = {
		{
			base_level_id = "dlc_scorpion_river",
			conflict_settings = "weave_chaos_light",
			display_name = "objective_destroy_doom_wheels_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_river_shadow",
			level_seed = 45982256,
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			objective_type = "doom_wheels",
			show_bar = true,
			spawning_seed = 452354,
			terror_events = {
				"weave_spot_event_boss_chaos_spawn_nodelay",
				"weave_spot_event_boss_minotaur",
				"weave_spot_event_special_mixed",
				"weave_spot_event_skaven_gutter_runner",
			},
			objective_settings = {
				objective_lists = "weave_7",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 239840,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_06_slow",
				main_path_spawning = {
					{
						percentage = 8,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_disablers_chaos_short",
					},
					{
						percentage = 8,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_aoe_chaos_short",
					},
					{
						percentage = 8,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_vanilla_chaos_short",
					},
					{
						percentage = 17,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_aoe_chaos_short",
					},
					{
						percentage = 17,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_vanilla_chaos_short",
					},
					{
						percentage = 17,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_chaos_medium_short",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_skaven_medium_short",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_skaven_small_medium",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
					},
					{
						percentage = 58,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_disablers_skaven_long",
					},
					{
						percentage = 58,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_berzerkers_skaven_long",
					},
					{
						percentage = 58,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_archers_beastmen_long",
					},
					{
						percentage = 71,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_archers_beastmen_long",
					},
					{
						percentage = 71,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_armored_beastmen_long",
					},
					{
						percentage = 71,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_buff_beastmen_long",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_shadow",
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
						terror_event_name = "boss_05",
					},
				},
			},
		},
	},
}
