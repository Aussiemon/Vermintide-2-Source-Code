return {
	wind_strength = 1,
	wind = "fire",
	seed = 45654,
	terror_events = {},
	objectives = {
		{
			display_name = "objective_targets_name",
			level_id = "dlc_scorpion_woods_fire",
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
						kill_enemies = {
							score_multiplier = 0.1
						},
						weave_target_spawner_001 = {
							score = 7
						},
						weave_target_spawner_002 = {
							score = 7
						},
						weave_target_spawner_004 = {
							score = 7
						},
						weave_target_spawner_005 = {
							score = 7
						},
						weave_target_spawner_006 = {
							score = 7
						},
						weave_target_spawner_007 = {
							score = 7
						},
						weave_target_spawner_008 = {
							score = 7
						},
						weave_target_spawner_009 = {
							score = 7
						},
						weave_target_spawner_011 = {
							score = 7
						},
						weave_target_spawner_010 = {
							score = 7
						},
						weave_target_spawner_014 = {
							score = 7
						},
						weave_target_spawner_016 = {
							score = 7
						},
						weave_target_spawner_018 = {
							score = 7
						},
						weave_target_spawner_019 = {
							score = 7
						},
						weave_target_spawner_023 = {
							score = 7
						},
						weave_target_spawner_024 = {
							score = 7
						},
						weave_target_spawner_027 = {
							score = 7
						},
						weave_target_spawner_026 = {
							score = 7
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 118466
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_aoe_skaven_short",
						percentage = 4,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_short",
						percentage = 4,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_short",
						percentage = 4,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_medium",
						percentage = 18,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_stormfiend",
						percentage = 18,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 18,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_long",
						percentage = 35,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 35,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 35,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_long",
						percentage = 50,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_stormfiend",
						percentage = 50,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 50,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_long",
						percentage = 75,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 75,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 75,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_fire",
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
						terror_event_name = "warriors_and_ratling_gunners",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
