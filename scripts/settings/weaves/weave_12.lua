-- chunkname: @scripts/settings/weaves/weave_12.lua

return {
	seed = 5923569,
	wind = "metal",
	wind_strength = 2,
	objectives = {
		{
			base_level_id = "dlc_scorpion_rubble",
			conflict_settings = "weave_skaven_beastmen",
			display_name = "objective_sockets_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_rubble_metal",
			level_seed = 295720,
			objective_start_flow_event = "weave_objective_sockets_start",
			objective_type = "sockets",
			show_bar = true,
			spawning_seed = 3654632,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_004 = {
							is_scored = true,
						},
						weave_limited_item_track_spawner_008 = {
							template_name = "gargoyle_head_spawner",
						},
					},
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_008 = {
							is_scored = true,
						},
						weave_limited_item_track_spawner_004 = {
							template_name = "gargoyle_head_spawner",
						},
					},
				},
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_armour",
				main_path_spawning = {
					{
						percentage = 5,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_chaos_small_short",
					},
					{
						percentage = 5,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_berzerkers_chaos_short",
					},
					{
						percentage = 5,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_beastmen_medium",
					},
					{
						percentage = 15,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_archers_beastmen_medium",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_chaos_medium",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_medium",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_archers_beastmen_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_armored_chaos_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_aoe_mixed_medium",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_metal",
			level_seed = 5684648,
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 549684,
			system_seeds = {
				pickups = 8721685,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "chaos_swarm_event",
					},
				},
			},
		},
	},
}
