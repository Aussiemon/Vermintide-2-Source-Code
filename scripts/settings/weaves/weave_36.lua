return {
	wind_strength = 1,
	wind = "metal",
	seed = 45654,
	objectives = {
		{
			display_name = "objective_targets_name",
			level_id = "dlc_scorpion_woods_metal",
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
				terror_event_trickle = "trickle_event_armour",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 2,
						percentage_spawn_offset = 14
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_medium",
						percentage = 2,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_standard_beastmen_large_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_medium",
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
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 39,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_short",
						percentage = 47,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_short",
						percentage = 47,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
						percentage = 47,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_medium",
						percentage = 60,
						percentage_spawn_offset = 14
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_long",
						percentage = 60,
						percentage_spawn_offset = 14
					},
					{
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
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
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_long",
						percentage = 95,
						percentage_spawn_offset = -15
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_metal",
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
						terror_event_name = "metal_bosses_2",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
