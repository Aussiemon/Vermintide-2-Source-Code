-- chunkname: @scripts/settings/weaves/weave_21.lua

return {
	seed = 4572,
	wind = "fire",
	wind_strength = 1,
	objectives = {
		{
			base_level_id = "dlc_scorpion_woods",
			conflict_settings = "default_weave",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_woods_fire",
			level_seed = 6969,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 666,
			objective_settings = {
				objective_lists = "weave_21",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 2085,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 14,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_small_short",
					},
					{
						percentage = 14,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_skaven_short",
					},
					{
						percentage = 14,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_chaos_short",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
					},
					{
						percentage = 25,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_skaven_large_long",
					},
					{
						percentage = 25,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_disablers_mixed_long",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_chaos_medium_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_medium",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_skaven_large_long",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_armored_beastmen_long",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_disablers_mixed_long",
					},
				},
			},
		},
		{
			allow_mutator_item_respawning = true,
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_fire",
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
						terror_event_name = "skaven_swarm_heavens_intro",
					},
				},
			},
		},
	},
}
