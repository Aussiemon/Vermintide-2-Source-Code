return {
	wind_strength = 2,
	wind = "light",
	seed = 5923569,
	objectives = {
		{
			display_name = "objective_sockets_name",
			level_id = "dlc_scorpion_rubble_light",
			objective_type = "sockets",
			conflict_settings = "default_weave",
			level_seed = 295720,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_rubble",
			objective_start_flow_event = "weave_objective_sockets_start",
			spawning_seed = 3654632,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								cataclysm = 0.25,
								cataclysm_3 = 0.21,
								hard = 0.35
							}
						},
						weave_explosive_barrel_socket_004 = {
							score = 20
						},
						weave_limited_item_track_spawner_008 = {
							score = 0,
							template_name = "gargoyle_head_spawner"
						}
					},
					{
						kill_enemies = {
							score_multiplier = {
								cataclysm = 0.25,
								cataclysm_3 = 0.21,
								hard = 0.35
							}
						},
						weave_explosive_barrel_socket_008 = {
							score = 20
						},
						weave_limited_item_track_spawner_004 = {
							score = 0,
							template_name = "gargoyle_head_spawner"
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
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 15,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_shields_chaos_medium",
						percentage = 15,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_medium",
						percentage = 15,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_short",
						percentage = 30,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 38,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_medium",
						percentage = 45,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 65,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_short",
						percentage = 65,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short",
						percentage = 65,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 70,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_mixed_medium_long",
						percentage = 75,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_long",
						percentage = 75,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_long",
						percentage = 75,
						percentage_spawn_offset = 5
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner_003 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_005 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_008 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_010 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_013 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_016 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				}
			}
		},
		{
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_light",
			spawning_seed = 549684,
			level_seed = 5684648,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_waves_start",
			system_seeds = {
				pickups = 8721685
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "boss_blasters",
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
