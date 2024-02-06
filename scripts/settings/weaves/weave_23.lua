-- chunkname: @scripts/settings/weaves/weave_23.lua

return {
	seed = 123974,
	wind = "shadow",
	wind_strength = 3,
	objectives = {
		{
			base_level_id = "dlc_scorpion_canyon",
			conflict_settings = "default_weave",
			display_name = "objective_sockets_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_canyon_shadow",
			level_seed = 874583,
			objective_start_flow_event = "weave_objective_sockets_start",
			objective_type = "sockets",
			show_bar = true,
			spawning_seed = 25629,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_002 = {
							is_scored = true,
						},
						weave_limited_item_track_spawner_002 = {
							template_name = "gargoyle_head_spawner",
						},
					},
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_004 = {
							is_scored = true,
						},
						weave_limited_item_track_spawner_009 = {
							template_name = "gargoyle_head_spawner",
						},
					},
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_007 = {
							is_scored = true,
						},
						weave_limited_item_track_spawner_008 = {
							template_name = "gargoyle_head_spawner",
						},
					},
				},
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 23085,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 6,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 6,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_skaven_medium",
					},
					{
						percentage = 6,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
					},
					{
						percentage = 6,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
					},
					{
						percentage = 24,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_mixed_medium_medium",
					},
					{
						percentage = 24,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_ranged_skaven_medium",
					},
					{
						percentage = 24,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_berzerkers_chaos_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_chaos_large_long",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_chaos_long",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_chaos_long",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 64,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_small_short",
					},
					{
						percentage = 64,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_skaven_short",
					},
					{
						percentage = 64,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_skaven_short",
					},
					{
						percentage = 72,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_skaven_large_medium",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_disablers_mixed_medium",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
					},
				},
			},
		},
		{
			allow_mutator_item_respawning = true,
			conflict_settings = "weave_disabled",
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_shadow",
			level_seed = 9084502,
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 459078,
			system_seeds = {
				pickups = 879025,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "beastmen_charge_event",
					},
				},
			},
		},
	},
}
