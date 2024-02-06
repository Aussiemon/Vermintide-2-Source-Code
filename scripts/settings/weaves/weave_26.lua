-- chunkname: @scripts/settings/weaves/weave_26.lua

return {
	seed = 238947,
	wind = "heavens",
	wind_strength = 1,
	objectives = {
		{
			base_level_id = "dlc_scorpion_mine",
			conflict_settings = "default_weave",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_mine_heavens",
			level_seed = 4093782,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 493207,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
					},
				},
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 95372,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_small",
				main_path_spawning = {
					{
						percentage = 7,
						percentage_spawn_offset = 25,
						terror_event_name = "main_path_standard_chaos_medium_long",
					},
					{
						percentage = 7,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_shields_chaos_medium",
					},
					{
						percentage = 7,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_disablers_pure_chaos_long",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_chaos_short_cata",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_chaos_short_cata",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 13,
						terror_event_name = "main_path_theme_berzerkers_chaos_medium",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 13,
						terror_event_name = "main_path_specials_aoe_pure_chaos_medium",
					},
					{
						percentage = 55,
						percentage_spawn_offset = 13,
						terror_event_name = "main_path_specials_chaos_short_cata",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_chaos_large_medium",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 25,
						terror_event_name = "main_path_specials_aoe_pure_chaos_long",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_chaos_short_cata",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_heavens",
			level_seed = 403826,
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 492374,
			system_seeds = {
				pickups = 938472,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "swarms_2_chaos_bosses_event",
					},
				},
			},
		},
	},
}
