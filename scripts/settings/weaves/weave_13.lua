-- chunkname: @scripts/settings/weaves/weave_13.lua

return {
	seed = 5923569,
	wind = "fire",
	wind_strength = 3,
	objectives = {
		{
			base_level_id = "dlc_scorpion_swamp",
			conflict_settings = "weave_skaven_beastmen",
			display_name = "objective_kill_enemies_name",
			end_zone_name = "end_zone_03",
			level_id = "dlc_scorpion_swamp_fire",
			level_seed = 2920,
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			objective_type = "kill",
			show_bar = true,
			spawning_seed = 3652,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
					},
				},
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294,
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						percentage = 8,
						percentage_spawn_offset = 10,
						terror_event_name = "mixed_main_path_event_01",
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
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 7,
						terror_event_name = "chaos_main_path_event_horde_small",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 7,
						terror_event_name = "skaven_main_path_event_horde_elite_spice",
					},
					{
						percentage = 30,
						percentage_spawn_offset = 7,
						terror_event_name = "mixed_main_path_event_01",
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
						terror_event_name = "chaos_main_path_event_horde_small",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 15,
						terror_event_name = "skaven_main_path_event_horde_small",
					},
					{
						percentage = 60,
						percentage_spawn_offset = 15,
						terror_event_name = "chaos_main_path_event_horde_elite_spice",
					},
					{
						percentage = 63,
						percentage_spawn_offset = 8,
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 12,
						terror_event_name = "chaos_main_path_event_horde_small",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 12,
						terror_event_name = "skaven_main_path_event_horde_elite_spice",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 12,
						terror_event_name = "mixed_main_path_event_02",
					},
					{
						percentage = 80,
						percentage_spawn_offset = 12,
						terror_event_name = "skaven_main_path_event_horde_small",
					},
				},
			},
		},
		{
			conflict_settings = "weave_disabled",
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_castle_fire",
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
						terror_event_name = "boss_04",
					},
				},
			},
		},
	},
}
