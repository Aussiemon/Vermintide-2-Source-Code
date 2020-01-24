return {
	wind_strength = 2,
	wind = "heavens",
	seed = 293048,
	objectives = {
		{
			objective_type = "kill",
			display_name = "objective_kill_enemies_name",
			level_id = "dlc_scorpion_field_heavens",
			show_bar = true,
			conflict_settings = "default_weave",
			level_seed = 8135394,
			end_zone_name = "end_zone_03",
			base_level_id = "dlc_scorpion_field",
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
				pickups = 439284
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_beastmen_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_beastmen_small_medium",
						percentage = 10,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_skaven_medium",
						percentage = 10,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short",
						percentage = 10,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 20,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_buff_beastmen_short",
						percentage = 40,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_standard_beastmen_medium_short",
						percentage = 40,
						percentage_spawn_offset = 20
					},
					{
						terror_event_name = "main_path_theme_armored_beastmen_short",
						percentage = 40,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 45,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_skaven_short_cata",
						percentage = 55,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_short",
						percentage = 62,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_medium",
						percentage = 62,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_medium",
						percentage = 62,
						percentage_spawn_offset = 15
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 75,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 80,
						percentage_spawn_offset = 10
					}
				}
			}
		},
		{
			display_name = "objective_kill_bosses_name",
			level_id = "dlc_scorpion_arena_temple_heavens",
			objective_start_flow_event = "weave_objective_kill_bosses_start",
			spawning_seed = 23094,
			level_seed = 389090,
			conflict_settings = "weave_disabled",
			system_seeds = {
				pickups = 29843
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "boss_05",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
