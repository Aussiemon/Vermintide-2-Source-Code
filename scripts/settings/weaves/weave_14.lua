-- chunkname: @scripts/settings/weaves/weave_14.lua

return {
	seed = 293048,
	wind = "beasts",
	wind_strength = 4,
	objectives = {
		{
			base_level_id = "dlc_scorpion_wall",
			conflict_settings = "weave_skaven_beastmen",
			display_name = "objective_capture_points_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_wall_beasts",
			level_seed = 8435394,
			objective_start_flow_event = "weave_objective_capture_points_start",
			objective_type = "capture_points",
			show_bar = true,
			spawning_seed = 312093,
			terror_events = {
				"capture_point_3_event",
				"capture_point_1_event_large",
				"capture_point_1_event_small",
			},
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						capture_point_002 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_3_event", spawner_id)
							end,
						},
						capture_point_001 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_small", spawner_id)
							end,
						},
						capture_point_003 = {
							is_scored = true,
							on_start_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:start_terror_event("capture_point_1_event_large", spawner_id)
							end,
							on_complete_func = function (unit)
								local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

								Managers.weave:stop_terror_event("capture_point_1_event_large", spawner_id)
							end,
						},
					},
				},
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 439284,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 5,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_disablers_skaven_medium",
					},
					{
						percentage = 5,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
					},
					{
						percentage = 5,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_theme_armored_beastmen_medium",
					},
					{
						percentage = 10,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
					},
					{
						percentage = 16,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 16,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_buff_beastmen_short",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 12,
						terror_event_name = "main_path_standard_skaven_small_long",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 12,
						terror_event_name = "main_path_standard_skaven_medium_short",
					},
					{
						percentage = 35,
						percentage_spawn_offset = 12,
						terror_event_name = "main_path_standard_skaven_large_short",
					},
					{
						percentage = 45,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
					},
					{
						percentage = 55,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
					},
					{
						percentage = 55,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_beastmen_short",
					},
					{
						percentage = 61,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_buff_beastmen_medium",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_theme_armored_skaven_long",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_skaven_small_long",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_disablers_skaven_short",
					},
				},
			},
			mutator_item_config = {
				mutator_item_spawner_009 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
				mutator_item_spawner_006 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
				mutator_item_spawner_012 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
				mutator_item_spawner_011 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
				mutator_item_spawner_013 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
				mutator_item_spawner_017 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
				mutator_item_spawner_020 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_beasts",
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
						terror_event_name = "beastmen_bosses_bestigors",
					},
				},
			},
			mutator_item_config = {
				mutator_item_spawner = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
				mutator_item_spawner_002 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
				mutator_item_spawner_003 = {
					unit_extension_template = "destructible_objective_unit",
					unit_name = "units/weave/beasts/beast_totem_mutator",
					extension_init_data = {
						health_system = {
							damage_cap_per_hit = 1,
							health = 5,
						},
						hit_reaction_system = {
							hit_reaction_template = "level_object",
						},
					},
				},
			},
		},
	},
}
