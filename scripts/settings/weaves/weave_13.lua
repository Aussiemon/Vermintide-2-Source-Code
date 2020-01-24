return {
	wind_strength = 3,
	wind = "light",
	seed = 5923569,
	objectives = {
		{
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_mine_light",
			objective_type = "kill",
			conflict_settings = "default_weave",
			level_seed = 2920,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_mine",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 3652,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {}
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
						terror_event_name = "main_path_standard_skaven_medium_medium",
						percentage = 6,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 6,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 6,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
						percentage = 6,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_mixed_medium_medium",
						percentage = 24,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 24,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_medium",
						percentage = 24,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_chaos_large_long",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_chaos_long",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_chaos_long",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 57,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 64,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short",
						percentage = 64,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_short",
						percentage = 64,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_random_mixed_short_cata",
						percentage = 72,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_standard_skaven_large_medium",
						percentage = 80,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_medium",
						percentage = 80,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
						percentage = 80,
						percentage_spawn_offset = 15
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner_002 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_007 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_015 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_012 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_013 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_017 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_light",
			spawning_seed = 549684,
			level_seed = 5684648,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			system_seeds = {
				pickups = 8721685
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "beastmen_charge_event",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner_004 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_006 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				}
			}
		}
	}
}
