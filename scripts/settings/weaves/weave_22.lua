return {
	wind_strength = 2,
	wind = "life",
	seed = 5923569,
	objectives = {
		{
			display_name = "objective_targets_name",
			level_id = "dlc_scorpion_alleys_life",
			objective_type = "targets",
			conflict_settings = "default_weave",
			level_seed = 295720,
			end_zone_name = "end_zone_03",
			show_bar = true,
			base_level_id = "dlc_scorpion_alleys",
			objective_start_flow_event = "weave_objective_kill_enemies_start",
			spawning_seed = 3654632,
			objective_settings = {
				objective_lists = {
					{
						kill_enemies = {},
						weave_target_spawner_006 = {
							is_scored = true
						},
						weave_target_spawner_040 = {
							is_scored = true
						},
						weave_target_spawner_010 = {
							is_scored = true
						},
						weave_target_spawner_041 = {
							is_scored = true
						},
						weave_target_spawner_011 = {
							is_scored = true
						},
						weave_target_spawner_045 = {
							is_scored = true
						},
						weave_target_spawner_020 = {
							is_scored = true
						},
						weave_target_spawner_024 = {
							is_scored = true
						},
						weave_target_spawner_030 = {
							is_scored = true
						},
						weave_target_spawner_032 = {
							is_scored = true
						}
					}
				}
			},
			bonus_time_on_complete = WeaveSettings.bonus_time,
			system_seeds = {
				pickups = 48294
			},
			spawning_settings = {
				terror_event_trickle = "trickle_event_skaven_small",
				main_path_spawning = {
					{
						terror_event_name = "main_path_standard_skaven_small_medium",
						percentage = 15,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_shields_chaos_medium",
						percentage = 15,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_mixed_medium",
						percentage = 15,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_standard_skaven_medium_short",
						percentage = 30,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_berzerkers_skaven_short",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short",
						percentage = 30,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short_cata",
						percentage = 38,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_beastmen_small_medium",
						percentage = 45,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_event_boss_chaos_troll",
						percentage = 45,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_skaven_small_short",
						percentage = 65,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_archers_beastmen_short",
						percentage = 65,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_disablers_mixed_short",
						percentage = 65,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_ranged_skaven_short_cata",
						percentage = 70,
						percentage_spawn_offset = 10
					},
					{
						terror_event_name = "main_path_standard_mixed_medium_long",
						percentage = 75,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_theme_berzerkers_chaos_long",
						percentage = 75,
						percentage_spawn_offset = 5
					},
					{
						terror_event_name = "main_path_specials_aoe_chaos_long",
						percentage = 75,
						percentage_spawn_offset = 5
					}
				}
			}
		},
		{
			allow_mutator_item_respawning = true,
			display_name = "objective_waves_name",
			level_id = "dlc_scorpion_arena_temple_life",
			spawning_seed = 549684,
			level_seed = 5684648,
			conflict_settings = "weave_disabled",
			objective_start_flow_event = "weave_objective_waves_start",
			system_seeds = {
				pickups = 8721685
			},
			spawning_settings = {
				main_path_spawning = {
					{
						terror_event_name = "heaven_bosses",
						percentage = 0,
						percentage_spawn_offset = 0
					}
				}
			}
		}
	}
}
