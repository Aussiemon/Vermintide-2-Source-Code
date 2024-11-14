-- chunkname: @scripts/settings/weaves/weave_22.lua

return {
	seed = 5923569,
	wind = "beasts",
	wind_strength = 2,
	objectives = {
		{
			base_level_id = "dlc_scorpion_alleys",
			conflict_settings = "default_weave",
			display_name = "objective_targets_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_alleys_beasts",
			level_seed = 295720,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "targets",
			show_bar = true,
			spawning_seed = 3654632,
			objective_settings = {
				objective_lists = "weave_22",
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						percentage = 2,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
					},
					{
						percentage = 22,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_buff_beastmen_medium",
					},
					{
						percentage = 22,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_berzerkers_skaven_medium",
					},
					{
						percentage = 22,
						percentage_spawn_offset = 25,
						terror_event_name = "main_path_theme_archers_beastmen_medium",
					},
					{
						percentage = 28,
						percentage_spawn_offset = 5,
						terror_event_name = "main_path_specials_disablers_skaven_short_cata",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_shields_skaven_medium",
					},
					{
						percentage = 57,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_specials_disablers_skaven_short",
					},
					{
						percentage = 67,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 74,
						percentage_spawn_offset = 15,
						terror_event_name = "main_path_theme_armored_skaven_medium",
					},
					{
						percentage = 74,
						percentage_spawn_offset = 10,
						terror_event_name = "main_path_standard_skaven_medium_medium",
					},
					{
						percentage = 74,
						percentage_spawn_offset = 20,
						terror_event_name = "main_path_specials_ranged_skaven_short",
					},
				},
			},
			mutator_item_config = {
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
				mutator_item_spawner_005 = {
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
				mutator_item_spawner_019 = {
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
			allow_mutator_item_respawning = true,
			conflict_settings = "weave_disabled",
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_beasts",
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
						terror_event_name = "eshin_swarm",
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
