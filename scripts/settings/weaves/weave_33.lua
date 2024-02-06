-- chunkname: @scripts/settings/weaves/weave_33.lua

return {
	seed = 571238,
	wind = "light",
	wind_strength = 3,
	objectives = {
		{
			base_level_id = "dlc_scorpion_pit",
			conflict_settings = "weave_chaos",
			display_name = "objective_targets_name",
			end_zone_name = "end_zone_02",
			level_id = "dlc_scorpion_pit_light",
			level_seed = 789654,
			objective_start_flow_event = "weave_objective_targets_start",
			objective_type = "targets",
			show_bar = true,
			spawning_seed = 2156845,
			terror_events = {
				"weave_spot_event_special_mixed",
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_target_spawner_001 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
						weave_target_spawner_005 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
						weave_target_spawner_009 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
						weave_target_spawner_013 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
						weave_target_spawner_011 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
						weave_target_spawner_012 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
						weave_target_spawner_022 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
						weave_target_spawner_028 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
						weave_target_spawner_016 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
						weave_target_spawner_015 = {
							is_scored = true,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
							end,
						},
					},
				},
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 156873,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_chaos_medium",
				main_path_spawning = {
					{
						percentage = 2,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 10,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_skaven_small_short",
					},
					{
						percentage = 10,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_shields_skaven_short",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_chaos_small_short",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 50,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_vanilla_chaos_medium",
					},
					{
						percentage = 50,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_chaos_medium_medium",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_random_mixed_short_cata",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_armored_skaven_medium",
					},
					{
						percentage = 90,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_standard_chaos_large_long",
					},
					{
						percentage = 90,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_theme_shields_chaos_long",
					},
				},
			},
			mutator_item_config = {
				mutator_item_spawner_026 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_019 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_013 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_009 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_003 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_018 = {
					unit_extension_template = "positioned_prop_unit",
					unit_name = "units/test_unit/light_beacon",
					extension_init_data = {},
				},
				mutator_item_spawner_007 = {
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
			level_seed = 2065462,
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 165415,
			system_seeds = {
				pickups = 7891215,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "eshin_swarm",
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
