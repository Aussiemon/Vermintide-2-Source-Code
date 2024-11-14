-- chunkname: @scripts/settings/weaves/weave_1.lua

return {
	seed = 459078,
	wind = "light",
	wind_strength = 1,
	objectives = {
		{
			base_level_id = "dlc_scorpion_wall",
			conflict_settings = "default_weave_light",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_wall_light",
			level_seed = 45982256,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 31293,
			objective_settings = {
				objective_lists = "weave_1",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 239840,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_mixed_small_slow",
				main_path_spawning = {
					{
						percentage = 10,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_small_medium",
					},
					{
						percentage = 10,
						percentage_spawn_offset = 13,
						terror_event_name = "main_path_theme_shields_skaven_medium",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_aoe_mixed_medium",
					},
					{
						percentage = 48,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_chaos_medium_short",
					},
					{
						percentage = 48,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_berzerkers_chaos_medium",
					},
					{
						percentage = 48,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_aoe_chaos_long",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_beastmen_medium_short",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_buff_beastmen_short",
					},
					{
						percentage = 85,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_long",
					},
					{
						percentage = 85,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_mixed_medium_long",
					},
				},
			},
			mutator_item_config = {
				mutator_item_spawner_009 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_007 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_013 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_017 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_019 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_020 = {
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
			level_seed = 389090,
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 23094,
			system_seeds = {
				pickups = 29843,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "boss_01",
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
