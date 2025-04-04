﻿-- chunkname: @scripts/settings/weaves/weave_6.lua

return {
	seed = 23094,
	wind = "beasts",
	wind_strength = 1,
	objectives = {
		{
			base_level_id = "dlc_scorpion_field",
			conflict_settings = "weave_skaven_light",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_field_beasts",
			level_seed = 45982256,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 452354,
			objective_settings = {
				objective_lists = "weave_6",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 239840,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						percentage = 7,
						percentage_spawn_offset = 25,
						terror_event_name = "main_path_standard_beastmen_small_long",
					},
					{
						percentage = 7,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_theme_armored_beastmen_short",
					},
					{
						percentage = 20,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 13,
						terror_event_name = "main_path_theme_armored_beastmen_medium",
					},
					{
						percentage = 40,
						percentage_spawn_offset = 13,
						terror_event_name = "main_path_specials_aoe_skaven_medium",
					},
					{
						percentage = 55,
						percentage_spawn_offset = 13,
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_standard_beastmen_large_medium",
					},
					{
						percentage = 70,
						percentage_spawn_offset = 25,
						terror_event_name = "main_path_specials_aoe_skaven_long",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 0,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
				},
			},
			mutator_item_config = {
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
				mutator_item_spawner_029 = {
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
				mutator_item_spawner_031 = {
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
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_beasts",
			level_seed = 795483,
			objective_start_flow_event = "weave_objective_waves_start",
			spawning_seed = 450982,
			system_seeds = {
				pickups = 908340,
			},
			spawning_settings = {
				main_path_spawning = {
					{
						percentage = 0,
						percentage_spawn_offset = 0,
						terror_event_name = "swarms_2_beastmen_bosses_event",
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
