return {
	wind_strength = 3,
	wind = "life",
	seed = 238947,
	objectives = {
		{
			display_name = "objective_targets_name",
			level_id = "dlc_scorpion_mine_life",
			objective_type = "targets",
			conflict_settings = "default_weave",
			end_zone_name = "end_zone_03",
			level_seed = 4093782,
			base_level_id = "dlc_scorpion_mine",
			objective_start_flow_event = "weave_objective_targets_start",
			show_bar = true,
			spawning_seed = 493207,
			terror_events = {
				"weave_spot_event_special_skaven"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								harder = 0.2,
								cataclysm_3 = 0.11,
								cataclysm_2 = 0.14
							}
						},
						weave_target_spawner_001 = {
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
						weave_target_spawner_016 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_skaven", spawner_id)
							end
						},
						weave_target_spawner_022 = {
							score = 7
						},
						weave_target_spawner_031 = {
							score = 7
						},
						weave_target_spawner_034 = {
							score = 7
						},
						weave_target_spawner_041 = {
							score = 7
						},
						weave_target_spawner_043 = {
							score = 7,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_skaven", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 95372
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 2,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 2,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 2,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 27,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_short",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 48,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 72,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_medium",
						percentage = 72,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_life",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 492374,
			level_seed = 403826,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 938472
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "beastmen_charge_event_short",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
