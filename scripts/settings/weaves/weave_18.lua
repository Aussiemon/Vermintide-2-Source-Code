return {
	wind_strength = 3,
	wind = "shadow",
	seed = 548672,
	objectives = {
		{
			display_name = "objective_sockets_name",
			level_id = "dlc_scorpion_pit_shadow",
			objective_type = "sockets",
			conflict_settings = "weave_skaven_beastmen",
			end_zone_name = "end_zone_01",
			level_seed = 734621,
			base_level_id = "dlc_scorpion_pit",
			objective_start_flow_event = "weave_objective_sockets_start",
			show_bar = true,
			spawning_seed = 8973420,
			terror_events = {
				"objective_specials_raid",
				"objective_event_beastmen",
				"weave_spot_event_chaos_warriors",
				"weave_spot_event_skaven_specials_small",
				"capture_point_1_event_small"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_001 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("objective_specials_raid", spawner_id)
							end
						},
						weave_limited_item_track_spawner_004 = {
							template_name = "gargoyle_head_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_chaos_warriors", spawner_id)
							end
						}
					},
					{
						kill_enemies = {},
						weave_explosive_barrel_socket_002 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("objective_event_beastmen", spawner_id)
							end
						},
						weave_limited_item_track_spawner_007 = {
							template_name = "gargoyle_head_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_skaven_specials_small", spawner_id)
							end
						}
					},
					{
						kill_enemies = {},
						weave_limited_item_track_spawner_006 = {
							template_name = "gargoyle_head_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
							end
						},
						weave_explosive_barrel_socket_003 = {
							is_scored = true
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 350972
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_short",
						percentage = 50,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_short",
						percentage = 50,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_short",
						percentage = 50,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 75,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_short",
						percentage = 75,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short",
						percentage = 75,
						percentage_spawn_offset = 0
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_short",
						percentage = 95,
						percentage_spawn_offset = -20
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_short",
						percentage = 95,
						percentage_spawn_offset = -20
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 95,
						percentage_spawn_offset = -20
					}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_shadow",
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 903475,
			level_seed = 54987,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 2308954
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "chaos_bosses",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
