return {
	wind_strength = 2,
	wind = "death",
	seed = 5923569,
	terror_events = {},
	objectives = {
		{
			display_name = "objective_targets_name",
			level_id = "dlc_scorpion_alleys_death",
			objective_type = "targets",
			conflict_settings = "default_weave",
			level_seed = 295720,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_alleys",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 3654632,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								harder = 0.27,
								cataclysm_3 = 0.135,
								cataclysm_2 = 0.14850000000000002
							}
						},
						weave_target_spawner_006 = {
							score = 7
						},
						weave_target_spawner_040 = {
							score = 7
						},
						weave_target_spawner_010 = {
							score = 7
						},
						weave_target_spawner_041 = {
							score = 7
						},
						weave_target_spawner_011 = {
							score = 7
						},
						weave_target_spawner_045 = {
							score = 7
						},
						weave_target_spawner_020 = {
							score = 7
						},
						weave_target_spawner_024 = {
							score = 7
						},
						weave_target_spawner_030 = {
							score = 7
						},
						weave_target_spawner_032 = {
							score = 7
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 2,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_medium",
						percentage = 22,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
						percentage = 22,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 22,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 28,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_medium",
						percentage = 57,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_medium",
						percentage = 57,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_short",
						percentage = 57,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 67,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_medium",
						percentage = 74,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_medium",
						percentage = 74,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 74,
						percentage_spawn_offset = 20
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_death",
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 549684,
			level_seed = 5684648,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 8721685
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "eshin_swarm",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
