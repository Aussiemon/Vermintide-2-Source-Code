-- chunkname: @scripts/settings/weaves/weave_19.lua

return {
	seed = 548672,
	wind = "life",
	wind_strength = 4,
	objectives = {
		{
			base_level_id = "dlc_scorpion_wall",
			conflict_settings = "weave_beastmen_light",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_wall_life",
			level_seed = 734621,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 8973420,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
					},
				},
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 350972,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_chaos_small_short",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_berzerkers_chaos_short",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_chaos_short",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_chaos_medium_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_armored_chaos_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_medium",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_mixed_short_cata",
					},
					{
						percentage = 85,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 85,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_shields_skaven_medium",
					},
					{
						percentage = 85,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_mixed_medium",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_life",
			level_seed = 54987,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 903475,
			system_seeds = {
				pickups = 2308954,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "boss_04",
					},
				},
			},
		},
	},
}
