return {
	wind_strength = 2,
	wind = "metal",
	seed = 45654,
	objectives = {
		{
			display_name = "objective_destroy_doom_wheels_name",
			level_id = "dlc_scorpion_mine_metal",
			objective_type = "doom_wheels",
			conflict_settings = "default_weave",
			end_zone_name = "end_zone_01",
			level_seed = 1896357,
			base_level_id = "dlc_scorpion_mine",
			objective_start_flow_event = "weave_objective_doom_wheels_start",
			show_bar = true,
			spawning_seed = 216384,
			terror_events = {
				"weave_spot_event_boss_stormfiend",
				"weave_spot_event_boss_rat_ogre",
				"capture_point_1_event_medium",
				"capture_point_2_event"
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								hardest = 0.4,
								cataclysm_3 = 0.28,
								cataclysm_2 = 0.3
							}
						},
						weave_prop_skaven_doom_wheel_01_spawner_001 = {
							score = 20,
							timer = 10,
							on_socket_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_stormfiend", spawner_id)
							end,
							on_destroy_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("weave_spot_event_boss_stormfiend", spawner_id)
							end
						},
						weave_prop_skaven_doom_wheel_01_spawner_002 = {
							score = 20,
							timer = 10,
							on_socket_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_boss_rat_ogre", spawner_id)
							end,
							on_destroy_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("weave_spot_event_boss_rat_ogre", spawner_id)
							end
						},
						weave_limited_item_track_spawner_004 = {
							score = 0,
							template_name = "explosive_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_medium", spawner_id)
							end,
							on_destroy_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_medium", spawner_id)
							end
						},
						weave_limited_item_track_spawner_002 = {
							score = 0,
							template_name = "explosive_barrel_spawner",
							on_first_pickup_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
							end,
							on_destroy_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_2_event", spawner_id)
							end
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
						terror_event_name = "main_path_standard_chaos_small_short",
						percentage = 5,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_short",
						percentage = 5,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_medium",
						percentage = 5,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 15,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_medium",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_medium",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 45,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_medium",
						percentage = 45,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_medium",
						percentage = 45,
						percentage_spawn_offset = 15
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_metal",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 11854541,
			level_seed = 1268425,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 9826648
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "chaos_swarm_event",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
