return {
	wind_strength = 5,
	wind = "death",
	seed = 1417,
	terror_events = {
		"capture_point_1_event_medium",
		"capture_point_3_event",
		"capture_point_2_event"
	},
	objectives = {
		{
			display_name = "objective_capture_points_name",
			level_id = "dlc_scorpion_pit_death",
			objective_type = "capture_points",
			conflict_settings = "default_weave",
			level_seed = 874583,
			end_zone_name = "end_zone_02",
			show_bar = true,
			base_level_id = "dlc_scorpion_pit",
			objective_start_flow_event = "weave_objective_capture_points_start",
			spawning_seed = 2569,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								harder = 0.27,
								cataclysm_3 = 0.14040000000000002,
								cataclysm_2 = 0.1458
							}
						},
						capture_point_007 = {
							score = 20,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_medium", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_medium", spawner_id)
							end
						},
						capture_point_008 = {
							score = 20,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_3_event", spawner_id)
							end
						},
						capture_point_005 = {
							score = 20,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_2_event", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 23085
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
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_death",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 459078,
			level_seed = 9084,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 79025
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
