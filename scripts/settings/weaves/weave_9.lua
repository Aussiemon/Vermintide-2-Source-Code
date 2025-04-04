﻿-- chunkname: @scripts/settings/weaves/weave_9.lua

return {
	seed = 5923569,
	wind = "light",
	wind_strength = 4,
	objectives = {
		{
			base_level_id = "dlc_scorpion_woods",
			conflict_settings = "default_weave_light",
			display_name = "objective_capture_points_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_woods_light",
			level_seed = 295720,
			objective_start_flow_event = "weave_objective_capture_points_start",
			objective_type = "capture_points",
			show_bar = true,
			spawning_seed = 3654632,
			terror_events = {
				"capture_point_1_chaos",
				"capture_point_6_boss_event_skaven",
				"capture_point_event_beastmen",
			},
			objective_settings = {
				objective_lists = "weave_9",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						percentage = 25,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_chaos_medium_medium",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_aoe_chaos_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_large_short",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_skaven_short",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_small_short",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
					},
					{
						percentage = 75,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_buff_beastmen_short",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_theme_armored_beastmen_short",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_beastmen_small_short",
					},
					{
						percentage = 95,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_beastmen_small_short",
					},
				},
			},
			mutator_item_config = {
				mutator_item_spawner_025 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_002 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_026 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_020 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_017 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_015 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_light",
			level_seed = 5684648,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 549684,
			system_seeds = {
				pickups = 8721685,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "swarms_2_bosses_event",
					},
				},
			},
			mutator_item_config = {
				mutator_item_spawner_002 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
			},
		},
	},
}
