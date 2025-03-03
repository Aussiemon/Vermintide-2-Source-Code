﻿-- chunkname: @scripts/settings/weaves/weave_17.lua

return {
	seed = 5923569,
	wind = "light",
	wind_strength = 2,
	objectives = {
		{
			base_level_id = "dlc_scorpion_canyon",
			conflict_settings = "weave_skaven_light",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_canyon_light",
			level_seed = 295720,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 3654632,
			objective_settings = {
				objective_lists = "weave_17",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 15,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_standard_skaven_small_medium",
					},
					{
						percentage = 15,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_theme_shields_chaos_medium",
					},
					{
						percentage = 15,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_aoe_mixed_medium",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_standard_skaven_medium_short",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 38,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_standard_beastmen_small_medium",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_event_boss_chaos_troll",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_standard_skaven_small_short",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_theme_archers_beastmen_short",
					},
					{
						percentage = 65,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_disablers_mixed_short",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 75,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_standard_mixed_medium_long",
					},
					{
						percentage = 75,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_theme_berzerkers_chaos_long",
					},
					{
						percentage = 75,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_aoe_chaos_long",
					},
				},
			},
			mutator_item_config = {
				mutator_item_spawner_002 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_024 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_010 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_014 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_018 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_light",
			level_seed = 5684648,
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 549684,
			system_seeds = {
				pickups = 8721685,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "heaven_bosses",
					},
				},
			},
			mutator_item_config = {
				mutator_item_spawner_003 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
			},
		},
	},
}
