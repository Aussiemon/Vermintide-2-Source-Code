return {
	wind_strength = 1,
	wind = "shadow",
	seed = 45654,
	objectives = {
		{
			display_name = "objective_targets_name",
			level_id = "dlc_scorpion_woods_shadow",
			objective_type = "targets",
			conflict_settings = "default_weave",
			level_seed = 1896357,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_woods",
			objective_start_flow_event = "weave_objective_targets_start",
			spawning_seed = 216384,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_target_spawner_001 = {
							is_scored = true
						},
						weave_target_spawner_002 = {
							is_scored = true
						},
						weave_target_spawner_004 = {
							is_scored = true
						},
						weave_target_spawner_005 = {
							is_scored = true
						},
						weave_target_spawner_006 = {
							is_scored = true
						},
						weave_target_spawner_007 = {
							is_scored = true
						},
						weave_target_spawner_008 = {
							is_scored = true
						},
						weave_target_spawner_009 = {
							is_scored = true
						},
						weave_target_spawner_011 = {
							is_scored = true
						},
						weave_target_spawner_010 = {
							is_scored = true
						},
						weave_target_spawner_014 = {
							is_scored = true
						},
						weave_target_spawner_016 = {
							is_scored = true
						},
						weave_target_spawner_018 = {
							is_scored = true
						},
						weave_target_spawner_019 = {
							is_scored = true
						},
						weave_target_spawner_023 = {
							is_scored = true
						},
						weave_target_spawner_024 = {
							is_scored = true
						},
						weave_target_spawner_027 = {
							is_scored = true
						},
						weave_target_spawner_026 = {
							is_scored = true
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 118466
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_chaos_small_short",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_short",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_short",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_medium",
						percentage = 45,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_medium",
						percentage = 45,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_short_cata",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_medium",
						percentage = 85,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_medium",
						percentage = 85,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_medium",
						percentage = 85,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_shadow",
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 11854541,
			level_seed = 1268425,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 9826648
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "boss_04",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
