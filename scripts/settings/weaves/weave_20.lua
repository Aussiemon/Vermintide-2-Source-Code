return {
	wind_strength = 5,
	wind = "metal",
	seed = 548672,
	objectives = {
		{
			display_name = "objective_capture_points_name",
			level_id = "dlc_scorpion_field_metal",
			objective_type = "capture_points",
			conflict_settings = "default_weave_light",
			end_zone_name = "end_zone_03",
			level_seed = 734621,
			base_level_id = "dlc_scorpion_field",
			objective_start_flow_event = "weave_objective_capture_points_start",
			show_bar = true,
			spawning_seed = 8973420,
			terror_events = {
				"capture_point_1_event_large_skaven",
				"capture_point_2_event",
				"capture_point_event_beastmen"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						capture_point_006 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_large_skaven", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_large_skaven", spawner_id)
							end
						},
						capture_point_002 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_2_event", spawner_id)
							end
						},
						capture_point_003 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_event_beastmen", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_event_beastmen", spawner_id)
							end
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 350972
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_armour",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 3,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_medium",
						percentage = 3,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_medium",
						percentage = 3,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_stormfiend",
						percentage = 10,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 15,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_medium",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_medium",
						percentage = 15,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_short",
						percentage = 30,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 30,
						percentage_spawn_offset = 25
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_long",
						percentage = 40,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_long",
						percentage = 40,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_long",
						percentage = 40,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_event_boss_skaven_rat_ogre",
						percentage = 53,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_long",
						percentage = 70,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_skaven_small_long",
						percentage = 70,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_event_boss_chaos_spawn",
						percentage = 80,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_metal",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 903475,
			level_seed = 54987,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 2308954
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "metal_bosses_3",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
