-- chunkname: @scripts/settings/weaves/weave_38.lua

return {
	seed = 45654,
	wind = "beasts",
	wind_strength = 3,
	objectives = {
		{
			base_level_id = "dlc_scorpion_pit",
			conflict_settings = "default_weave",
			display_name = "objective_capture_points_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_pit_beasts",
			level_seed = 1896357,
			objective_start_flow_event = "weave_objective_capture_points_start",
			objective_type = "capture_points",
			show_bar = true,
			spawning_seed = 216384,
			terror_events = {
				"capture_point_1_chaos",
				"capture_point_1_event_large_skaven",
				"capture_point_1_event_large",
				"capture_point_2_event",
				"capture_point_6_boss_event_skaven",
			},
			objective_settings = {
				objective_lists = "weave_38",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 118466,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						percentage = 8,
						percentage_spawn_offset = 10,
						terror_event_name = "beastmen_main_path_event_horde_small",
					},
					{
						percentage = 8,
						percentage_spawn_offset = 8,
						terror_event_name = "skaven_main_path_event_01",
					},
					{
						percentage = 8,
						percentage_spawn_offset = 8,
						terror_event_name = "skaven_main_path_event_horde_small",
					},
					{
						percentage = 15,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 7,
						terror_event_name = "beastmen_skaven_main_path_event_horde_small",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 7,
						terror_event_name = "skaven_main_path_event_horde_elite_spice",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 7,
						terror_event_name = "beastmen_main_path_event_horde_small",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 7,
						terror_event_name = "skaven_main_path_event_horde_small",
					},
					{
						percentage = 37,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 15,
						terror_event_name = "beastmen_skaven_main_path_event_horde_small",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 15,
						terror_event_name = "skaven_main_path_event_horde_small",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 15,
						terror_event_name = "beastmen_main_path_event_horde_elite_spice",
					},
					{
						percentage = 63,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 12,
						terror_event_name = "beastmen_skaven_main_path_event_horde_small",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 12,
						terror_event_name = "skaven_main_path_event_horde_elite_spice",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 12,
						terror_event_name = "beastmen_main_path_event_horde_medium",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 12,
						terror_event_name = "skaven_main_path_event_horde_small",
					},
				},
			},
			mutator_item_config = {
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
				mutator_item_spawner_016 = {
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
				mutator_item_spawner_001 = {
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
				mutator_item_spawner_026 = {
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
				mutator_item_spawner_023 = {
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
				mutator_item_spawner_004 = {
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
				mutator_item_spawner_018 = {
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
				mutator_item_spawner_014 = {
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
				mutator_item_spawner_032 = {
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
				mutator_item_spawner_030 = {
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
				mutator_item_spawner_025 = {
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
				mutator_item_spawner_008 = {
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
				mutator_item_spawner_022 = {
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
				mutator_item_spawner_010 = {
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
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_void_beasts",
			level_seed = 1268425,
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 11854541,
			system_seeds = {
				pickups = 9826648,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "boss_06",
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
