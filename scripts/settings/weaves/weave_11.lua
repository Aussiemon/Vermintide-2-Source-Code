return {
	wind_strength = 1,
	wind = "light",
	seed = 5923569,
	objectives = {
		{
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_swamp_light",
			objective_type = "kill",
			conflict_settings = "default_weave",
			level_seed = 295720,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_swamp",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 209384,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {
							score_multiplier = {
								cataclysm = 0.28,
								cataclysm_3 = 0.26,
								hard = 0.42
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
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 14,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_short",
						percentage = 14,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_short",
						percentage = 14,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 20,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_large_long",
						percentage = 25,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_long",
						percentage = 25,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_standard_chaos_medium_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_medium",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 60,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_large_long",
						percentage = 70,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_long",
						percentage = 70,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_long",
						percentage = 70,
						percentage_spawn_offset = 15
					}
				}
			},
			mutator_item_config = {
				mutator_item_spawner_001 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_004 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				},
				mutator_item_spawner_014 = {
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
				mutator_item_spawner_012 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {}
				}
			}
		},
		{
			display_name = "objective_kill_enemies_name",
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
						terror_event_name = "skaven_swarm_heavens_intro",
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
