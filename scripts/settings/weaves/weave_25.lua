return {
	wind_strength = 5,
	wind = "light",
	seed = 1417,
	objectives = {
		{
			display_name = "objective_capture_points_name",
			level_id = "dlc_scorpion_pit_light",
			objective_type = "capture_points",
			conflict_settings = "default_weave",
			end_zone_name = "end_zone_02",
			level_seed = 874583,
			base_level_id = "dlc_scorpion_pit",
			objective_start_flow_event = "weave_objective_capture_points_start",
			show_bar = true,
			spawning_seed = 2569,
			terror_events = {
				"capture_point_1_event_medium",
				"capture_point_3_event",
				"capture_point_2_event"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						capture_point_007 = {
							is_scored = true,
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
							is_scored = true,
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
							is_scored = true,
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
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 22,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
						percentage = 22,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 22,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_short_cata",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_long",
						percentage = 37,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_long",
						percentage = 37,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_long",
						percentage = 37,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 50,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_chaos_small_long",
						percentage = 68,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_long",
						percentage = 68,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_long",
						percentage = 68,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 78,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 84,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_short",
						percentage = 84,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short",
						percentage = 84,
						percentage_spawn_offset = 10
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner_002 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_016 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_029 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_004 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_013 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_007 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				}
			}
		},
		{
			allow_mutator_item_respawning = true,
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_light",
			spawning_seed = 459078,
			level_seed = 9084,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			system_seeds = {
				pickups = 79025
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "beastmen_bosses_heavens_outro",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner_002 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				}
			}
		}
	}
}
