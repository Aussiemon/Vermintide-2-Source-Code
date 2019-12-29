return {
	wind_strength = 5,
	wind = "light",
	seed = 5923569,
	objectives = {
		{
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_woods_light",
			objective_type = "kill",
			conflict_settings = "default_weave",
			level_seed = 295720,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_woods",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 209384,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								cataclysm = 0.32,
								cataclysm_3 = 0.28,
								hard = 0.52
							}
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294
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
				mutator_item_spawner_025 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_002 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_026 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_008 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_009 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_013 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_014 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_022 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_temple_light",
			spawning_seed = 549684,
			level_seed = 5684648,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			system_seeds = {
				pickups = 8721685
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
				mutator_item_spawner = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				}
			}
		}
	}
}
