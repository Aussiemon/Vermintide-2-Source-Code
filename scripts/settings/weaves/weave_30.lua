return {
	wind_strength = 5,
	wind = "life",
	seed = 238947,
	objectives = {
		{
			display_name = "objective_targets_name",
			level_id = "dlc_scorpion_rubble_life",
			objective_type = "targets",
			conflict_settings = "weave_skaven_beastmen",
			end_zone_name = "end_zone_02",
			level_seed = 4093782,
			base_level_id = "dlc_scorpion_rubble",
			objective_start_flow_event = "weave_objective_targets_start",
			show_bar = true,
			spawning_seed = 493207,
			terror_events = {
				"weave_spot_event_boss_rat_ogre_nodelay",
				"objective_event_beastmen",
				"weave_spot_event_boss_stormfiend_nodelay",
				"weave_spot_event_boss_minotaur_nodelay",
				"capture_point_1_event_small"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								harder = 0.15,
								cataclysm_3 = 0.1,
								cataclysm_2 = 0.12
							}
						},
						weave_target_spawner_004 = {
							score = 14,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_rat_ogre_nodelay", spawner_id)
							end
						},
						weave_target_spawner_006 = {
							score = 14,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
							end
						},
						weave_target_spawner_028 = {
							score = 14,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_minotaur_nodelay", spawner_id)
							end
						},
						weave_target_spawner_024 = {
							score = 14,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("objective_event_beastmen", spawner_id)
							end
						},
						weave_target_spawner_035 = {
							score = 14,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_stormfiend_nodelay", spawner_id)
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
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						terror_event_name = "mixed_main_path_event_01",
						percentage = 8,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "skaven_main_path_event_01",
						percentage = 8,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "skaven_main_path_event_horde_small",
						percentage = 8,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 15,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "chaos_main_path_event_horde_small",
						percentage = 30,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "skaven_main_path_event_horde_elite_spice",
						percentage = 30,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "mixed_main_path_event_01",
						percentage = 30,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "skaven_main_path_event_horde_small",
						percentage = 30,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 37,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "chaos_main_path_event_horde_small",
						percentage = 60,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "skaven_main_path_event_horde_small",
						percentage = 60,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "chaos_main_path_event_horde_elite_spice",
						percentage = 60,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 63,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "chaos_main_path_event_horde_small",
						percentage = 80,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "skaven_main_path_event_horde_elite_spice",
						percentage = 80,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "mixed_main_path_event_02",
						percentage = 80,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "skaven_main_path_event_horde_small",
						percentage = 80,
						percentage_spawn_offset = 12
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_life",
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 492374,
			level_seed = 403826,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 938472
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
