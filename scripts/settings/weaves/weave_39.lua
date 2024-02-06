-- chunkname: @scripts/settings/weaves/weave_39.lua

return {
	seed = 45654,
	wind = "shadow",
	wind_strength = 4,
	objectives = {
		{
			base_level_id = "dlc_scorpion_alleys",
			conflict_settings = "default_weave",
			display_name = "objective_sockets_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_alleys_shadow",
			level_seed = 1896357,
			objective_start_flow_event = "weave_objective_sockets_start",
			objective_type = "sockets",
			show_bar = true,
			spawning_seed = 216384,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_006 = {
							is_scored = true,
						},
						weave_limited_item_track_spawner_003 = {
							template_name = "gargoyle_head_spawner",
						},
					},
				},
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 118466,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						percentage = 15,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_beastmen_large_long",
					},
					{
						percentage = 15,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_archers_beastmen_long",
					},
					{
						percentage = 15,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_buff_beastmen_long",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
					},
					{
						percentage = 25,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_skaven_medium_short",
					},
					{
						percentage = 25,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_armored_skaven_medium",
					},
					{
						percentage = 25,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_ranged_skaven_medium",
					},
					{
						percentage = 42,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_chaos_medium_long",
					},
					{
						percentage = 42,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_berzerkers_chaos_long",
					},
					{
						percentage = 42,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_chaos_long",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 30,
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_archers_beastmen_long",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_disablers_skaven_long",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_skaven_large_medium",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_temple_shadow",
			level_seed = 1268425,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 11854541,
			system_seeds = {
				pickups = 9826648,
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
