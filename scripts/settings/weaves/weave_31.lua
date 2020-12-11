return {
	wind_strength = 1,
	wind = "shadow",
	seed = 666183,
	objectives = {
		{
			display_name = "objective_sockets_name",
			level_id = "dlc_scorpion_field_shadow",
			objective_type = "sockets",
			conflict_settings = "default_weave",
			level_seed = 153971,
			end_zone_name = "end_zone_02",
			show_bar = true,
			base_level_id = "dlc_scorpion_field",
			objective_start_flow_event = "weave_objective_sockets_start",
			spawning_seed = 6482,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_007 = {
							is_scored = true
						},
						weave_limited_item_track_spawner_007 = {
							template_name = "gargoyle_head_spawner"
						}
					},
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_004 = {
							is_scored = true
						},
						weave_limited_item_track_spawner_002 = {
							template_name = "gargoyle_head_spawner"
						}
					},
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_002 = {
							is_scored = true
						},
						weave_limited_item_track_spawner_005 = {
							template_name = "gargoyle_head_spawner"
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 267813
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_long",
						percentage = 2,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 2,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 4,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_long",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_long",
						percentage = 30,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 33,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 47,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 47,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_large_long",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short",
						percentage = 60,
						percentage_spawn_offset = 14
					},
					{
						terror_event_name = "main_path_event_boss_stormfiend",
						percentage = 60,
						percentage_spawn_offset = 14
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 75,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_long",
						percentage = 90,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_long",
						percentage = 90,
						percentage_spawn_offset = 5
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_shadow",
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 165415,
			level_seed = 683268,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 48921
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "boss_05",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
