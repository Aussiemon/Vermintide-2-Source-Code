return {
	wind_strength = 4,
	wind = "metal",
	seed = 213048,
	objectives = {
		{
			objective_type = "kill",
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_canyon_metal",
			show_bar = true,
			conflict_settings = "default_weave",
			level_seed = 85394,
			end_zone_name = "end_zone_03",
			base_level_id = "dlc_scorpion_canyon",
			spawning_seed = 312093,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 484
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_armour",
				main_path_spawning = {
					{
						terror_event_name = "main_path_specials_aoe_skaven_short",
						percentage = 4,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_short",
						percentage = 4,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_theme_shields_skaven_short",
						percentage = 4,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_medium",
						percentage = 18,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_stormfiend",
						percentage = 18,
						percentage_spawn_offset = 7
					},
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 18,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_long",
						percentage = 35,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 35,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_short",
						percentage = 35,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_long",
						percentage = 50,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_event_boss_stormfiend",
						percentage = 50,
						percentage_spawn_offset = 13
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 50,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_armored_skaven_long",
						percentage = 75,
						percentage_spawn_offset = 12
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 75,
						percentage_spawn_offset = 8
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 75,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_void_metal",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 23094,
			level_seed = 3890,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 29843
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "metal_bosses",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
