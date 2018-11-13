local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local function current_intensity()
	return Managers.state.conflict.pacing:get_intensity()
end

local function current_difficulty()
	return Managers.state.difficulty.difficulty
end

WeightedRandomTerrorEvents = {
	roger_and_friends = {
		"roger_mayhem",
		10,
		"lonely_roger",
		1
	},
	generic_special_fun = {
		"generic_specials_fun_a",
		1,
		"generic_specials_fun_b",
		1
	},
	gz_elevator_guards = {
		"gz_elevator_guards_a",
		1
	},
	military_end_event_survival_01 = {
		"military_end_event_survival_01_back",
		1,
		"military_end_event_survival_01_right",
		1
	},
	military_end_event_survival_02 = {
		"military_end_event_survival_02_right",
		5,
		"military_end_event_survival_02_left",
		5,
		"military_end_event_survival_02_middle",
		3,
		"military_end_event_survival_02_back",
		5
	},
	military_end_event_survival_03 = {
		"military_end_event_survival_03_right",
		5,
		"military_end_event_survival_03_left",
		5,
		"military_end_event_survival_03_middle",
		3,
		"military_end_event_survival_03_back",
		5
	},
	military_end_event_survival_04 = {
		"military_end_event_survival_04_right",
		5,
		"military_end_event_survival_04_left",
		5,
		"military_end_event_survival_04_middle",
		3,
		"military_end_event_survival_04_back",
		5
	},
	military_end_event_survival_05 = {
		"military_end_event_survival_05_right",
		5,
		"military_end_event_survival_05_left",
		5,
		"military_end_event_survival_05_middle",
		3,
		"military_end_event_survival_05_back",
		5
	},
	military_end_event_specials = {
		"military_end_event_specials_01",
		1,
		"military_end_event_specials_02",
		1,
		"military_end_event_specials_03",
		1,
		"military_end_event_specials_04",
		1,
		"military_end_event_specials_05",
		1,
		"military_end_event_specials_06",
		1
	},
	military_courtyard_event_specials = {
		"military_courtyard_event_specials_01",
		1,
		"military_courtyard_event_specials_02",
		1,
		"military_courtyard_event_specials_03",
		1,
		"military_courtyard_event_specials_04",
		1,
		"military_courtyard_event_specials_05",
		1
	},
	catacombs_end_event_specials = {
		"catacombs_end_event_specials_01",
		1,
		"catacombs_end_event_specials_02",
		1,
		"catacombs_end_event_specials_03",
		1
	},
	nurgle_end_event_specials = {
		"nurgle_end_event_specials_01",
		1,
		"nurgle_end_event_specials_02",
		1,
		"nurgle_end_event_specials_03",
		1
	},
	mines_end_event_specials = {
		"mines_end_event_specials_01",
		1,
		"mines_end_event_specials_02",
		1,
		"mines_end_event_specials_03",
		1
	}
}
TerrorEventBlueprints = {
	boss_event_rat_ogre = {
		{
			"create_boss_door_group",
			group_size = 1
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"close_boss_doors",
			breed_name = "skaven_rat_ogre"
		}
	},
	boss_event_storm_fiend = {
		{
			"create_boss_door_group",
			group_size = 1
		},
		{
			"spawn",
			breed_name = "skaven_stormfiend"
		},
		{
			"close_boss_doors",
			breed_name = "skaven_stormfiend"
		}
	},
	boss_event_chaos_troll = {
		{
			"create_boss_door_group",
			group_size = 1
		},
		{
			"spawn",
			breed_name = "chaos_troll"
		},
		{
			"close_boss_doors",
			breed_name = "chaos_troll"
		}
	},
	boss_event_chaos_spawn = {
		{
			"create_boss_door_group",
			group_size = 1
		},
		{
			"spawn",
			breed_name = "chaos_spawn"
		},
		{
			"close_boss_doors",
			breed_name = "chaos_spawn"
		}
	},
	boss_event_spline_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"storm_vermin_shields_infront",
				"storm_vermin_two_column",
				"chaos_warrior_default"
			}
		}
	},
	boss_event_skaven_spline_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"storm_vermin_shields_infront",
				"storm_vermin_two_column"
			}
		}
	},
	boss_event_chaos_spline_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"chaos_warrior_default"
			}
		}
	},
	escort_troll_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"escorted_troll"
			},
			splines = {
				"event_1",
				"event_2"
			}
		}
	},
	prologue_intro_patrol = {
		{
			"spawn_patrol",
			spline_type = "event",
			patrol_template = "spline_patrol",
			formations = {
				"prologue_skittergate_patrol"
			},
			splines = {
				"event_1"
			}
		}
	},
	benchmark_dummy_troll = {
		{
			"force_load_breed_package",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "dummy_troll_spawn",
			breed_name = "chaos_dummy_troll"
		}
	},
	test_patrol = {
		{
			"spawn_patrol",
			spline_type = "event",
			patrol_template = "spline_patrol",
			formations = {
				"escorted_troll"
			},
			splines = {
				"event_1"
			}
		}
	},
	rare_event_loot_rat = {
		{
			"spawn",
			breed_name = "skaven_loot_rat"
		}
	},
	boss_event_encampment = {
		{
			"spawn_encampment"
		}
	},
	roaming_patrol = {
		{
			"roaming_patrol"
		}
	},
	generic_specials_fun_a = {
		{
			"spawn",
			{
				2,
				3
			},
			breed_name = "skaven_poison_wind_globadier"
		}
	},
	generic_specials_fun_b = {
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_ratling_gunner"
		}
	},
	generic_enable_pacing = {
		{
			"control_pacing",
			enable = true
		}
	},
	generic_disable_pacing = {
		{
			"control_pacing",
			enable = false
		}
	},
	generic_disable_specials = {
		{
			"control_specials",
			enable = false
		}
	},
	generic_enable_specials = {
		{
			"control_specials",
			enable = true
		}
	},
	roger_mayhem = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Event starts... can you beat it?",
			duration = 2
		},
		{
			"start_event",
			start_event_name = "lonely_roger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"horde",
			duration = 40,
			min_amount = 30,
			peak_amount = 50
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5
			end
		},
		{
			"delay",
			duration = {
				20,
				30
			}
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = 15
		},
		{
			"horde",
			duration = 40,
			min_amount = 30,
			peak_amount = 50
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 5
			end
		},
		{
			"delay",
			duration = {
				20,
				30
			}
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"text",
			text = "You beat the event",
			duration = 2
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"stop_event",
			stop_event_name = "roger_mayhem"
		},
		{
			"text",
			text = "This will never be shown.. since we run 'stop_event' element above",
			duration = 2
		}
	},
	lonely_roger = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Lonely Roger wants to be friends!",
			duration = {
				2,
				3
			}
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"text",
			text = "stops in 3 secs",
			duration = 3
		},
		{
			"stop_event",
			stop_event_name = "lonely_roger"
		},
		{
			"text",
			text = "XXXXXX Lonely Roger wants to be friends!",
			duration = {
				20,
				30
			}
		}
	},
	event_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "",
			composition_type = "event_smaller"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	steady_70_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"debug_horde",
			duration = 3600,
			amount = 70
		},
		{
			"control_pacing",
			enable = true
		}
	},
	steady_60_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"debug_horde",
			duration = 3600,
			amount = 60
		},
		{
			"control_pacing",
			enable = true
		}
	},
	steady_50_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"debug_horde",
			duration = 3600,
			amount = 50
		},
		{
			"control_pacing",
			enable = true
		}
	},
	steady_40_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"debug_horde",
			duration = 3600,
			amount = 40
		},
		{
			"control_pacing",
			enable = true
		}
	},
	force_horde = {
		{
			"force_horde",
			horde_type = "random",
			duration = 5
		}
	},
	test_raw_spawn = {
		{
			"control_specials",
			enable = false
		},
		{
			"spawn_at_raw",
			spawner_id = "roger",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 10
		},
		{
			"control_specials",
			enable = true
		}
	},
	test_event_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"escorted_troll"
			},
			splines = {
				"event_1"
			}
		}
	},
	whitebox_dummy_troll_test = {
		{
			"force_load_breed_package",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "test_spawner_1",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "test_spawner_2",
			breed_name = "chaos_dummy_troll"
		}
	},
	morja_test_sorcerer_dummies = {
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_1",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_2",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_3",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_4",
			breed_name = "chaos_dummy_sorcerer"
		}
	},
	test_spawn_warcamp_exalted_champion = {
		{
			"spawn_at_raw",
			spawner_id = "exalted_champion_spawner",
			breed_name = "chaos_exalted_champion_warcamp"
		}
	},
	test_spawn_grey_seer_stormfiend = {
		{
			"spawn_at_raw",
			spawner_id = "grey_seer_stormfiend_spawner",
			breed_name = "skaven_grey_seer"
		},
		{
			"delay",
			duration = 20
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_stormfiend_boss") < 1
			end
		},
		{
			"set_time_challenge",
			time_challenge_name = "skittergate_speed_event"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_grey_seer") < 1
			end
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "skittergate_speed_event"
		}
	},
	test_spawn_exalted_sorcerer = {
		{
			"spawn_at_raw",
			spawner_id = "exalted_sorcerer_spawner",
			breed_name = "chaos_exalted_sorcerer"
		}
	},
	test_spawn_skaven_warlord = {
		{
			"spawn_at_raw",
			spawner_id = "skaven_warlord_spawner",
			breed_name = "skaven_storm_vermin_warlord"
		}
	},
	whitebox_combat_event_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Spawning horde",
			duration = 2
		},
		{
			"horde",
			duration = 20,
			min_amount = 15,
			peak_amount = 20
		},
		{
			"delay",
			duration = {
				5,
				7
			}
		},
		{
			"text",
			text = "Spawning Pack Master",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_pack_master"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"text",
			text = "Spawning Rat Ogre",
			duration = 2
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"horde",
			duration = 20,
			min_amount = 10,
			peak_amount = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"text",
			text = "Wave 2 incoming",
			duration = 2
		},
		{
			"horde",
			duration = 30,
			min_amount = 20,
			peak_amount = 25
		},
		{
			"text",
			text = "Spawning Globadier",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"delay",
			duration = {
				5,
				10
			}
		},
		{
			"text",
			text = "Wave 3 incoming",
			duration = 2
		},
		{
			"text",
			text = "Spawning Gutter Runner",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_gutter_runner"
		},
		{
			"horde",
			duration = 40,
			min_amount = 15,
			peak_amount = 20
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"text",
			text = "Event done",
			duration = 2
		},
		{
			"control_pacing",
			enable = true
		}
	},
	performance_test_1 = {
		{
			"event_horde",
			spawner_id = "performancetester",
			composition_type = "performance_test"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		}
	},
	military_benchmark_cut_1 = {
		{
			"run_benchmark_func",
			func_name = "recycler_spawn_at",
			duration = 2,
			position = {
				122.242,
				120.009,
				-13.67
			}
		}
	},
	military_benchmark_cut_2 = {
		{
			"run_benchmark_func",
			func_name = "recycler_spawn_at",
			duration = 2,
			position = {
				134.609,
				72.881,
				-11.826
			}
		}
	},
	military_benchmark_cut_3 = {
		{
			"run_benchmark_func",
			func_name = "recycler_spawn_at",
			duration = 2,
			position = {
				149.89,
				26.701,
				59.579
			}
		}
	},
	military_benchmark_cut_4 = {
		{
			"run_benchmark_func",
			func_name = "recycler_spawn_at",
			duration = 2,
			position = {
				96.911,
				46.139,
				67.782
			}
		}
	},
	military_benchmark_cut_5 = {
		{
			"run_benchmark_func",
			func_name = "recycler_spawn_at",
			duration = 2,
			position = {
				-78.803,
				-76.952,
				66.482
			}
		}
	},
	military_benchmark_cut_6 = {
		{
			"run_benchmark_func",
			func_name = "recycler_spawn_at",
			duration = 2,
			position = {
				-131.688,
				-85.017,
				66.583
			}
		}
	},
	military_benchmark_troll_sound = {
		{
			"run_benchmark_func",
			func_name = "story_troll_sound"
		}
	},
	military_benchmark_1 = {
		{
			"run_benchmark_func",
			portal_id = "benchmark_fight1",
			func_name = "story_teleport_party"
		},
		{
			"delay",
			duration = 0.3
		},
		{
			"event_horde",
			spawner_id = "benchmark_1_2",
			composition_type = "ai_benchmark_cycle_stormvermin"
		},
		{
			"delay",
			duration = 0.2
		},
		{
			"event_horde",
			spawner_id = "benchmark_1_3",
			composition_type = "ai_benchmark_cycle_chaos_berzerker"
		},
		{
			"delay",
			duration = 0.2
		},
		{
			"event_horde",
			spawner_id = "courtyard",
			composition_type = "ai_benchmark_cycle_slaves"
		},
		{
			"delay",
			duration = 30
		},
		{
			"run_benchmark_func",
			radius_squared = 900,
			func_name = "story_destroy_close_units"
		},
		{
			"run_benchmark_func",
			portal_id = "Start",
			func_name = "story_teleport_party"
		}
	},
	military_benchmark_2 = {
		{
			"run_benchmark_func",
			portal_id = "benchmark_fight2",
			func_name = "story_teleport_party"
		},
		{
			"event_horde",
			spawner_id = "benchmark_2_2",
			composition_type = "ai_benchmark_cycle_plague_monks"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"event_horde",
			spawner_id = "benchmark_2_3",
			composition_type = "ai_benchmark_cycle_chaos_marauder"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"event_horde",
			spawner_id = "benchmark_2_4",
			composition_type = "ai_benchmark_cycle_slaves"
		},
		{
			"delay",
			duration = 30
		},
		{
			"run_benchmark_func",
			radius_squared = 900,
			func_name = "story_destroy_close_units"
		},
		{
			"run_benchmark_func",
			portal_id = "Start",
			func_name = "story_teleport_party"
		}
	},
	military_benchmark_troll = {
		{
			"run_benchmark_func",
			ai_node_id = "benchmark_troll",
			func_name = "story_spawn_and_animate_troll"
		}
	},
	military_benchmark_end = {
		{
			"run_benchmark_func",
			func_name = "story_end_benchmark"
		}
	},
	ai_benchmark_cycle = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"text",
			text = "Turned off pacing and specials",
			duration = 5
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_slaves"
		},
		{
			"text",
			text = "Spawning 20 slaves (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_clanrat"
		},
		{
			"text",
			text = "Spawning 10 clanrats (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"text",
			text = "Spawning 10 shield clanrats (wait 30 sec until wipe) REMOVED BECAUSE OF CRASH",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_stormvermin"
		},
		{
			"text",
			text = "Spawning 4 storm vermin (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_stormvermin_shield"
		},
		{
			"text",
			text = "Spawning 4 shield storm vermin (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_plague_monks"
		},
		{
			"text",
			text = "Spawning 6 plague monks (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			2,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"text",
			text = "Spawning 2 globadier",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"text",
			text = "Spawning 2 ratling gunner",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_gutter_runner"
		},
		{
			"text",
			text = "Spawning 2 gutter runner",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"text",
			text = "Spawning 2 gutter runner",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_pack_master"
		},
		{
			"text",
			text = "Spawning 2 pack master (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "skaven_rat_ogre"
		},
		{
			"text",
			text = "Spawning 1 rat ogre (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "skaven_stormfiend"
		},
		{
			"text",
			text = "Spawning 1 stormfiend (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"text",
			text = "TIME FOR CHAOS",
			duration = 5
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_marauder"
		},
		{
			"text",
			text = "Spawning 10 marauders (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_marauder_shield"
		},
		{
			"text",
			text = "Spawning 10 shield marauders (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_berzerker"
		},
		{
			"text",
			text = "Spawning 10 berzerkers (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_raider"
		},
		{
			"text",
			text = "Spawning 10 raiders (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior1",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior2",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior3",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior4",
			breed_name = "chaos_warrior"
		},
		{
			"text",
			text = "Spawning 4 warriors (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			2,
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"text",
			text = "Spawning 2 Vortex Sorcerers",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "chaos_plague_sorcerer"
		},
		{
			"text",
			text = "Spawning 2 Plague Sorcerers (wait 30sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "chaos_troll"
		},
		{
			"text",
			text = "Spawning 1 Troll (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "chaos_spawn"
		},
		{
			"text",
			text = "Spawning 1 Chaos Spawn (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"text",
			text = "Restarting",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_cycle_restart"
		}
	},
	pathfind_test_climb = {
		{
			"event_horde",
			spawner_id = "pathfind_test_climb",
			composition_type = "pathfind_test_light"
		}
	},
	pathfind_test_straight = {
		{
			"event_horde",
			spawner_id = "pathfind_test_straight",
			composition_type = "pathfind_test_light"
		}
	},
	catacombs_puzzle_event_start = {
		{
			"control_pacing",
			enable = false
		}
	},
	catacombs_puzzle_event_stinger = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	catacombs_puzzle_event_a = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "catacombs_puzzle_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "enemy_door",
			composition_type = "chaos_shields"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_puzzle_event_a_done"
		}
	},
	catacombs_puzzle_event_b = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "catacombs_puzzle_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "enemy_door",
			composition_type = "event_small_chaos"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_puzzle_event_b_done"
		}
	},
	catacombs_puzzle_event_c = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "catacombs_puzzle_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "enemy_door",
			composition_type = "chaos_berzerkers"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_puzzle_event_c_done"
		}
	},
	catacombs_puzzle_event_loop = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "catacombs_puzzle_event_loop"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "puzzle_event_loop",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "puzzle_event_loop",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "catacombs_puzzle_event_loop_done"
		}
	},
	catacombs_special_event_a = {
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_01",
			breed_name = "skaven_ratling_gunner"
		}
	},
	catacombs_special_event_b = {
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_02",
			breed_name = "skaven_poison_wind_globadier"
		}
	},
	catacombs_special_event_c = {
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_03",
			breed_name = "skaven_warpfire_thrower"
		}
	},
	catacombs_puzzle_event_end = {
		{
			"control_pacing",
			enable = true
		}
	},
	catacombs_end_event_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		}
	},
	catacombs_end_event_zombies = {
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_01",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_02",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_03",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_04",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_05",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "corpse_pit_zombie_06",
			breed_name = "chaos_fanatic"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_zombies_done"
		}
	},
	catacombs_end_event_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "catacombs_end_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 6,
			spawner_id = "end_event",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 4 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_01_done"
		}
	},
	catacombs_end_event_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "catacombs_end_event"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 6,
			spawner_id = "end_event",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_long_level_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 6,
			spawner_id = "end_event",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_02_done"
		}
	},
	catacombs_end_event_specials_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "catacombs_end_event_specials"
		},
		{
			"spawn",
			{
				2,
				3
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_specials_done"
		}
	},
	catacombs_end_event_specials_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "catacombs_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_gutter_runner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_specials_done"
		}
	},
	catacombs_end_event_specials_03 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "catacombs_end_event_specials"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_specials_done"
		}
	},
	catacombs_end_event_pool_challenge = {
		{
			"do_volume_challenge",
			increment_stat_name = "catacombs_added_souls",
			volume_name = "volume_corpse_pit_damage"
		}
	},
	catacombs_plague_wave = {
		{
			"set_master_event_running",
			name = "plague_wave"
		},
		{
			"spawn_at_raw",
			spawner_id = "wave",
			breed_name = "chaos_plague_wave_spawner"
		},
		{
			"flow_event",
			flow_event_name = "catacombs_plague_wave_done"
		}
	},
	catacombs_sorcerers = {
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_1",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_2",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_3",
			breed_name = "chaos_dummy_sorcerer"
		}
	},
	catacombs_end_event_escape = {
		{
			"control_specials",
			enable = true
		}
	},
	catacombs_load_sorcerers = {
		{
			"force_load_breed_package",
			breed_name = "chaos_dummy_sorcerer"
		}
	},
	elven_ruins_end_event = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_time_challenge",
			time_challenge_name = "elven_ruins_speed_event"
		},
		{
			"set_master_event_running",
			name = "ruins_end_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"disable_kick"
		},
		{
			"event_horde",
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"spawn",
			2,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"event_horde",
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"spawn",
			2,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"spawn",
			2,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = {
				2,
				3
			}
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"spawn",
			1,
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_mines_plague_monks"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = {
				9,
				11
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	elven_ruins_end_event_flush = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "elven_ruins_speed_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = {
				1,
				2
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_generic_short_level_stormvermin"
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "elven_ruins_toptier",
			composition_type = "event_generic_short_level_stormvermin"
		}
	},
	elven_ruins_end_event_device_fiddlers = {
		{
			"spawn_at_raw",
			spawner_id = "device_skaven_1",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "device_skaven_2",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "device_skaven_3",
			breed_name = "skaven_clan_rat"
		}
	},
	farmlands_rat_ogre = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn"
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 1 or count_event_breed("skaven_stormfiend") == 1 or count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_spawned"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_stormfiend") < 1 and count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead"
		}
	},
	farmlands_spawn_guards = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"spawn_at_raw",
			spawner_id = "wall_guard_01",
			breed_name = "chaos_raider"
		},
		{
			"spawn_at_raw",
			spawner_id = "wall_guard_02",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "wall_guard_03",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "windmill_guard",
			breed_name = "chaos_warrior"
		}
	},
	farmlands_prisoner_event_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "farmlands_prisoner_event_01"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "square_front",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "hay_barn_bridge_invis",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "square_center",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "sawmill_yard_invis",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			spawner_id = "hay_barn_back",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	farmlands_hay_barn_bridge_guards = {
		{
			"spawn_at_raw",
			spawner_id = "hay_barn_bridge_guards",
			breed_name = "chaos_warrior"
		},
		{
			"set_time_challenge",
			time_challenge_name = "farmlands_speed_event"
		}
	},
	farmlands_prisoner_event_hay_barn = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "farmlands_prisoner_event_hay_barn"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"spawn_at_raw",
			spawner_id = "hay_barn_guards",
			breed_name = "chaos_raider"
		},
		{
			"spawn_at_raw",
			spawner_id = "hay_barn_manual_spawns",
			breed_name = "chaos_marauder"
		},
		{
			"event_horde",
			spawner_id = "hay_barn_cellar_invis",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "hay_barn_front_invis",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "hay_barn_interior",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	farmlands_prisoner_event_upper_square = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "farmlands_prisoner_event_upper_square"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "square_center",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "sawmill_yard_invis",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "sawmill_yard",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "sawmill_yard_invis",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			spawner_id = "sawmill_creek",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	farmlands_saw_mill_guards = {
		{
			"spawn_at_raw",
			spawner_id = "saw_mill_guards",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			}
		}
	},
	farmlands_prisoner_event_sawmill_door = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "farmlands_prisoner_event_sawmill_door"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "sawmill_interior",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	farmlands_prisoner_event_sawmill = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "farmlands_prisoner_event_sawmill"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "sawmill_interior",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "sawmill_interior_invis",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "sawmill_yard",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	farmlands_gate_open_event = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "farmlands_speed_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "sawmill_yard",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	ussingen_gate_guards = {
		{
			"spawn_at_raw",
			spawner_id = "gate_spawner_1",
			breed_name = "chaos_warrior"
		},
		{
			"delay",
			duration = 0.8
		},
		{
			"spawn_at_raw",
			spawner_id = "gate_spawner_2",
			breed_name = "chaos_warrior"
		}
	},
	ussingen_gate_open_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "ussingen_gate_open",
			composition_type = "event_ussingen_gate_group"
		},
		{
			"delay",
			duration = 15
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	ussingen_payload_event_01 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "ussingen_payload_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_start",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "ussingen_payload_start",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_transit",
			composition_type = "event_small_chaos"
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		}
	},
	ussingen_payload_event_02 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "ussingen_payload_event"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "ussingen_payload_square",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "ussingen_payload_square",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		}
	},
	ussingen_payload_event_03 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"event_horde",
			spawner_id = "ussingen_mansion_garden_payload",
			composition_type = "event_medium"
		}
	},
	ussingen_escape = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "ussingen_escape"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_escape_event",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "ussingen_escape_restart"
		}
	},
	demo_spawn_spawn = {
		{
			"set_master_event_running",
			name = "demo_spawn"
		},
		{
			"spawn_at_raw",
			spawner_id = "ussingen_demo_spawn",
			breed_name = "chaos_spawn"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 400,
			condition = function (t)
				return count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "ussingen_demo_spawn_dead"
		}
	},
	demo_spawn_fiend = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "ussingen_demo_horde",
			composition_type = "end_boss_event_stormvermin"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "ussingen_demo_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 2.5
		},
		{
			"spawn_at_raw",
			spawner_id = "ussingen_demo_fiend",
			breed_name = "skaven_stormfiend_demo"
		}
	},
	fort_pacing_off = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	fort_pacing_on = {
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	fort_terror_event_climb = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "fort_terror_event_climb"
		},
		{
			"event_horde",
			spawner_id = "terror_event_climb",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_terror_event_climb_done"
		}
	},
	fort_terror_event_inner_yard = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "fort_terror_event_inner_yard"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "terror_event_inner_yard",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_terror_event_inner_yard_done"
		}
	},
	fort_horde_gate = {
		{
			"set_master_event_running",
			name = "fort_horde_gate"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "fort_horde_gate",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_gate_done"
		}
	},
	fort_horde_basement = {
		{
			"set_master_event_running",
			name = "fort_horde_basement"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "fort_horde_basement",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_basement_done"
		}
	},
	fort_horde_wall = {
		{
			"set_master_event_running",
			name = "fort_horde_wall"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "fort_horde_wall",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_wall_done"
		}
	},
	fort_horde_cannon = {
		{
			"set_master_event_running",
			name = "fort_horde_cannon"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "fort_horde_cannon",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_cannon_done"
		}
	},
	fort_horde_fleeing = {
		{
			"set_master_event_running",
			name = "fort_horde_fleeing"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "fort_horde_fleeing",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_small_done"
		}
	},
	fort_siegers = {
		{
			"set_master_event_running",
			name = "fort_siegers"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_1",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_2",
			breed_name = "chaos_berzerker"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_3",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_4",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_5",
			breed_name = "chaos_berzerker"
		},
		{
			"spawn_at_raw",
			spawner_id = "siege_6",
			breed_name = "chaos_marauder"
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_raider") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "siege_broken"
		}
	},
	stronghold_pacing_off = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	stronghold_pacing_on = {
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	stronghold_horde_water_wheels = {
		{
			"set_master_event_running",
			name = "stronghold_horde_water_wheels"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "stronghold_horde_water_wheels",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "stronghold_horde_water_wheels_done"
		}
	},
	stronghold_boss = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "stronghold_boss"
		},
		{
			"spawn_at_raw",
			spawner_id = "stronghold_boss",
			breed_name = "skaven_storm_vermin_warlord"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_warlord") == 1
			end
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_warlord") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "stronghold_boss_killed"
		}
	},
	skittergate_pacing_off = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	skittergate_pacing_on = {
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	skittergate_spawn_guards = {
		{
			"spawn_at_raw",
			spawner_id = "gate_guard_01",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "gate_guard_02",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	skittergate_terror_event_01 = {
		{
			"set_master_event_running",
			name = "skittergate_terror_event_01"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "terror_event_01",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_marauder") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "skittergate_terror_event_01_done"
		}
	},
	skittergate_norsca_chaos_warrior = {
		{
			"spawn_at_raw",
			spawner_id = "skittergate_norsca_chaos_warrior",
			breed_name = "chaos_warrior"
		}
	},
	skittergate_chaos_boss = {
		{
			"set_master_event_running",
			name = "skittergate_chaos_boss"
		},
		{
			"spawn_at_raw",
			spawner_id = "skittergate_chaos_boss",
			breed_name = "chaos_exalted_champion_norsca"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_champion_norsca") == 1
			end
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_champion_norsca") < 1
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_champion_norsca") < 1 and count_event_breed("chaos_spawn_exalted_champion_norsca") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "skittergate_chaos_boss_killed"
		}
	},
	skittergate_gatekeeper_marauders = {
		{
			"spawn_at_raw",
			spawner_id = "skittergate_gatekeeper_marauder_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "skittergate_gatekeeper_marauder_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "skittergate_gatekeeper_marauder_03",
			breed_name = "chaos_marauder_with_shield"
		}
	},
	skittergate_terror_event_02 = {
		{
			"set_master_event_running",
			name = "skittergate_terror_event_02"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "terror_event_02",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "terror_event_02",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "skittergate_terror_event_02_done"
		}
	},
	skittergate_rasknitt_boss = {
		{
			"disable_kick"
		},
		{
			"set_master_event_running",
			name = "skittergate_rasknitt_boss"
		},
		{
			"spawn_at_raw",
			spawner_id = "skittergate_rasknitt_boss",
			breed_name = "skaven_grey_seer"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_stormfiend_boss") == 1
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_stormfiend_boss") < 1
			end
		},
		{
			"set_time_challenge",
			time_challenge_name = "skittergate_speed_event"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_grey_seer") < 1
			end
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "skittergate_speed_event"
		},
		{
			"flow_event",
			flow_event_name = "skittergate_rasknitt_boss_killed"
		}
	},
	skittergate_crumble_escape_01 = {
		{
			"set_master_event_running",
			name = "skittergate_crumble_escape_01"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "skittergate_crumble_escape_01",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "skittergate_crumble_escape_01_done"
		}
	},
	canyon_bell_event = {
		{
			"set_master_event_running",
			name = "canyon_bell_event"
		},
		{
			"set_time_challenge",
			time_challenge_name = "bell_speed_event"
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "canyon_bell_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "canyon_bell_event_done"
		}
	},
	canyon_ogre_boss = {
		{
			"spawn_at_raw",
			spawner_id = "canyon_ogre_boss",
			breed_name = "skaven_rat_ogre"
		}
	},
	canyon_escape_event = {
		{
			"set_master_event_running",
			name = "canyon_escape_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "canyon_escape_event",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_specials",
			enable = true
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end
		},
		{
			"flow_event",
			flow_event_name = "canyon_escape_event_done"
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "bell_speed_event"
		}
	},
	gz_end_event = {
		{
			"set_master_event_running",
			name = "gz_end_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "gz_end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"event_horde",
			spawner_id = "gz_end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				4
			}
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "gz_end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				5,
				6
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_magnus_horn_small"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "gz_end_event",
			composition_type = "event_docks_warehouse_extra_spice"
		},
		{
			"delay",
			duration = 14
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		}
	},
	gz_chaos_boss = {
		{
			"set_master_event_running",
			name = "gz_chaos_boss"
		},
		{
			"disable_kick"
		},
		{
			"spawn_at_raw",
			spawner_id = "warcamp_chaos_boss",
			breed_name = "chaos_exalted_sorcerer"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_sorcerer") == 1
			end
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_sorcerer") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "gz_chaos_boss_dead"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	gz_elevator_guards_a = {
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_1",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_2",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_3",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_4",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_5",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_a_6",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_1",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_2",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_3",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_4",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_5",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_6",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_7",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "ele_guard_b_8",
			breed_name = "skaven_clan_rat"
		},
		{
			"delay",
			duration = 5
		}
	},
	mines_enable_carry_bots = {
		{
			"enable_bots_in_carry_event"
		}
	},
	mines_disable_carry_bots = {
		{
			"disable_bots_in_carry_event"
		}
	},
	mines_end_event_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"control_specials",
			enable = false
		},
		{
			"enable_bots_in_carry_event"
		}
	},
	mines_end_event_first_wave = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_first_wave_done"
		}
	},
	mines_end_event_loop = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "chaos_berzerkers"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_berzerker") < 2
			end
		},
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "event_mines_plague_monks"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stingers_plague_monk"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_loop_done"
		}
	},
	mines_end_event_loop_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_loop_02_done"
		}
	},
	mines_end_event_specials_01 = {
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_specials_done"
		}
	},
	mines_end_event_specials_02 = {
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_specials_done"
		}
	},
	mines_end_event_specials_03 = {
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_specials_done"
		}
	},
	mines_end_event_stop = {
		{
			"stop_event",
			stop_event_name = "mines_end_event_loop"
		},
		{
			"stop_event",
			stop_event_name = "mines_end_event_loop_02"
		},
		{
			"control_specials",
			enable = true
		}
	},
	mines_end_event_intro_trolls = {
		{
			"force_load_breed_package",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_09",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_10",
			breed_name = "chaos_dummy_troll"
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_intro_trolls_done"
		}
	},
	mines_end_event_trolls = {
		{
			"force_load_breed_package",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_01",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_02",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_03",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_04",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_05",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_06",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_07",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "troll_08",
			breed_name = "chaos_dummy_troll"
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_trolls_done"
		}
	},
	mines_troll_boss = {
		{
			"spawn_at_raw",
			spawner_id = "troll_boss",
			breed_name = "chaos_troll"
		},
		{
			"set_time_challenge",
			time_challenge_name = "mines_speed_event"
		},
		{
			"continue_when",
			duration = 10000,
			condition = function (t)
				return count_event_breed("chaos_troll") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_troll_boss_done"
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "mines_speed_event"
		}
	},
	mines_enable_specials = {
		{
			"control_specials",
			enable = true
		}
	},
	mines_end_event_escape = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "end_event"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "escape",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "escape",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "mines_end_event_escape_done"
		}
	},
	military_cannon_event_start = {
		{
			"control_pacing",
			enable = true
		}
	},
	military_cannon_event_end = {
		{
			"control_pacing",
			enable = true
		}
	},
	military_cannon_event_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "military_cannon"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "cannon_event_02",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "cannon_event_02",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "cannon_event_02",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "cannon_event_02",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "military_cannon_event_01_done"
		}
	},
	military_cannon_event_specials = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "military_specials"
		},
		{
			"delay",
			duration = 15
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 25
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"flow_event",
			flow_event_name = "military_cannon_event_specials_done"
		}
	},
	military_cannon_event_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "military_cannon"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "cannon_event_01",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "military_cannon_event_02_done"
		}
	},
	military_courtyard_event_start = {
		{
			"control_pacing",
			enable = false
		}
	},
	military_courtyard_event = {
		{
			"control_specials",
			enable = false
		},
		{
			"set_master_event_running",
			name = "military_courtyard"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 6 and count_event_breed("chaos_marauder_with_shield") < 5 and count_event_breed("chaos_fanatic") < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "courtyard",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3 and count_event_breed("skaven_slave") < 10
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard_hidden",
			composition_type = "event_few_plague_monks"
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "courtyard",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("chaos_corruptor_sorcerer") < 1 and count_event_breed("chaos_vortex_sorcerer") < 1 and count_event_breed("skaven_warpfire_thrower") < 1
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 6 and count_event_breed("chaos_marauder_with_shield") < 5 and count_event_breed("chaos_fanatic") < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "courtyard",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "courtyard",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_done"
		}
	},
	military_courtyard_event_end = {
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		}
	},
	military_courtyard_event_specials_01 = {
		{
			"set_master_event_running",
			name = "military_courtyard"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"spawn",
			2,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_courtyard_event_specials_02 = {
		{
			"set_master_event_running",
			name = "military_courtyard"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"spawn",
			1,
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn",
			1,
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_corruptor_sorcerer") < 1 and count_event_breed("chaos_vortex_sorcerer") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_courtyard_event_specials_03 = {
		{
			"set_master_event_running",
			name = "military_courtyard"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"spawn",
			1,
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_vortex_sorcerer") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_courtyard_event_specials_04 = {
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_courtyard_event_specials_05 = {
		{
			"set_master_event_running",
			name = "military_courtyard"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_specials_done"
		}
	},
	military_temple_guards = {
		{
			"disable_kick"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards05",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards06",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards07",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_guards09",
			breed_name = "chaos_warrior"
		}
	},
	military_end_event_disable_pacing = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	military_end_event_survival_start = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"disable_kick"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "end_event_start",
			composition_type = "event_large"
		},
		{
			"event_horde",
			spawner_id = "end_event_start",
			composition_type = "event_generic_long_level_stormvermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_start_done"
		}
	},
	military_end_event_survival_01_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "military_end_event_chaos_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_01_done"
		}
	},
	military_end_event_survival_01_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
			composition_type = "military_end_event_chaos_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_01_done"
		}
	},
	military_end_event_survival_02_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left_hidden",
			composition_type = "military_end_event_chaos_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done"
		}
	},
	military_end_event_survival_02_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
			composition_type = "military_end_event_chaos_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done"
		}
	},
	military_end_event_survival_02_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "military_end_event_chaos_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done"
		}
	},
	military_end_event_survival_02_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "military_end_event_chaos_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done"
		}
	},
	military_end_event_survival_03_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left_hidden",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done"
		}
	},
	military_end_event_survival_03_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done"
		}
	},
	military_end_event_survival_03_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_middle",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done"
		}
	},
	military_end_event_survival_03_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done"
		}
	},
	military_end_event_survival_04_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left_hidden",
			composition_type = "military_end_event_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done"
		}
	},
	military_end_event_survival_04_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right_hidden",
			composition_type = "military_end_event_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done"
		}
	},
	military_end_event_survival_04_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back_hidden",
			composition_type = "military_end_event_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_middle",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done"
		}
	},
	military_end_event_survival_04_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back_hidden",
			composition_type = "military_end_event_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done"
		}
	},
	military_end_event_survival_05_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "end_event_left",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left_hidden",
			composition_type = "military_end_event_plague_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done"
		}
	},
	military_end_event_survival_05_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "end_event_right",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
			composition_type = "military_end_event_plague_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done"
		}
	},
	military_end_event_survival_05_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "end_event_middle",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "military_end_event_plague_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done"
		}
	},
	military_end_event_survival_05_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "end_event_back",
			composition_type = "event_generic_long_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "military_end_event_plague_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done"
		}
	},
	military_end_event_survival_06_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_left",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_left_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done"
		}
	},
	military_end_event_survival_06_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_right",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done"
		}
	},
	military_end_event_survival_06_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done"
		}
	},
	military_end_event_survival_06_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_back",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done"
		}
	},
	military_end_event_specials_01 = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"spawn",
			3,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_02 = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"spawn",
			1,
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_corruptor_sorcerer") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_03 = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_04 = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_05 = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_specials_06 = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_specials_done"
		}
	},
	military_end_event_survival_escape = {
		{
			"set_master_event_running",
			name = "military_end_event_survival"
		},
		{
			"control_specials",
			enable = true
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "end_event_start",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_escape_done"
		}
	},
	prologue_well_01 = {
		{
			"spawn_at_raw",
			spawner_id = "e01_r01",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r02",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r03",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r04",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r05",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r06",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r07",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r08",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r09",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r10",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r11",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "e01_r12",
			breed_name = "skaven_dummy_clan_rat"
		},
		{
			"flow_event",
			flow_event_name = "prologue_well_01_done"
		}
	},
	prologue_well_02 = {
		{
			"spawn_at_raw",
			spawner_id = "e02_r01",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r02",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r03",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r04",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r05",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r06",
			breed_name = "skaven_dummy_slave"
		},
		{
			"flow_event",
			flow_event_name = "prologue_well_02_done"
		}
	},
	prologue_special_ability_event = {
		{
			"spawn_at_raw",
			spawner_id = "ability_cr_01",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "ability_cr_02",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "ability_cr_03",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "ability_sv",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"flow_event",
			flow_event_name = "prologue_special_ability_event_done"
		}
	},
	prologue_melee_pickup = {
		{
			"set_master_event_running",
			name = "prologue_melee_pickup_roamer"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_melee_pickup",
			breed_name = "skaven_clan_rat_tutorial"
		}
	},
	prologue_ranged_roamers = {
		{
			"set_master_event_running",
			name = "prologue_ranged_roamers"
		},
		{
			"spawn_at_raw",
			spawner_id = "ranged_roamer_01",
			breed_name = "skaven_clan_rat_tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "ranged_roamer_02",
			breed_name = "skaven_clan_rat_tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "ranged_roamer_03",
			breed_name = "skaven_clan_rat_tutorial"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat_tutorial") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_ranged_roamers_done"
		}
	},
	prologue_ranged_event = {
		{
			"set_master_event_running",
			name = "prologue_ranged"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_ranged",
			composition_type = "event_prologue_ranged"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_ranged_event_done"
		}
	},
	prologue_nodamage_event = {
		{
			"spawn_at_raw",
			spawner_id = "nodamage_spawn",
			breed_name = "chaos_warrior"
		}
	},
	prologue_nodamage_scaffold_event = {
		{
			"set_master_event_running",
			name = "prologue_nodamage_scaffold"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_nodamage_scaffold",
			composition_type = "event_prologue_ranged"
		}
	},
	prologue_push_event = {
		{
			"spawn_at_raw",
			spawner_id = "push_poor_rat",
			breed_name = "skaven_clan_rat_tutorial"
		}
	},
	prologue_block_event = {
		{
			"set_master_event_running",
			name = "prologue_block"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena_a",
			composition_type = "event_prologue_block"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_marauder_tutorial") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_block_event_done"
		}
	},
	prologue_dodge_event = {
		{
			"set_master_event_running",
			name = "prologue_dodge"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena_b",
			composition_type = "event_prologue_dodge"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_raider_tutorial") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_dodge_event_done"
		}
	},
	prologue_heavy_attack_event = {
		{
			"set_master_event_running",
			name = "prologue_heavy_attack"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "prologue_arena_c",
			composition_type = "event_prologue_practice_02"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_heavy_attack_event_done"
		}
	},
	prologue_practice_event_01 = {
		{
			"set_master_event_running",
			name = "prologue_practice_01"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena",
			composition_type = "event_prologue_practice_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_practice_event_01_done"
		}
	},
	prologue_practice_event_02 = {
		{
			"set_master_event_running",
			name = "prologue_practice_02"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena",
			composition_type = "event_prologue_practice_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_practice_event_02_done"
		}
	},
	prologue_practice_end = {
		{
			"set_master_event_running",
			name = "prologue_practice_end"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena_end",
			composition_type = "event_prologue_practice_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_practice_end_done"
		}
	},
	prologue_clanrats_event = {
		{
			"spawn_at_raw",
			spawner_id = "light_melee_01",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "light_melee_03",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "light_melee_04",
			breed_name = "skaven_clan_rat"
		}
	},
	prologue_pre_ranged_event = {
		{
			"spawn_at_raw",
			spawner_id = "pre_ranged_01",
			breed_name = "chaos_marauder"
		}
	},
	prologue_roamers_event_01 = {
		{
			"spawn_at_raw",
			spawner_id = "group_01_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_01_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_01_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_01",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_02",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_03",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_04",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_05",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_05",
			breed_name = "chaos_marauder"
		}
	},
	prologue_roamers_event_02 = {
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_05",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_07_roamer_01",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_07_roamer_02",
			breed_name = "skaven_clan_rat"
		}
	},
	prologue_roamers_event_03 = {
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_08_roamer_01",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_08_roamer_02",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_08_roamer_03",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_04",
			breed_name = "chaos_marauder"
		}
	},
	prologue_horde_event = {
		{
			"set_master_event_running",
			name = "prologue_horde"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "prologue_horde",
			composition_type = "event_prologue_horde"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_horde_event_done"
		}
	},
	prologue_horde_event_2 = {
		{
			"set_master_event_running",
			name = "prologue_horde_2"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "prologue_horde",
			composition_type = "event_prologue_horde"
		}
	},
	prologue_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"prologue_marauder"
			},
			splines = {
				"patrol"
			}
		}
	},
	prologue_elevator = {
		{
			"set_master_event_running",
			name = "prologue_elevator"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_elevator_start",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_elevator_start",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_elevator_start_2",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_elevator_start_2",
			breed_name = "skaven_dummy_slave"
		},
		{
			"delay",
			duration = 14.5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_03",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_04",
			composition_type = "event_smaller"
		},
		{
			"flow_event",
			flow_event_name = "prologue_helmgart_chase_done"
		}
	},
	prologue_helmgart_chase = {
		{
			"set_master_event_running",
			name = "prologue_helmgart_chase"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "helmgart_horde",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_helmgart_chase_done"
		}
	},
	bell_event_dynspawn_middle01 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_middle"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"flow_event",
			flow_event_name = "middledyn01_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_middle_spawner_dyn01",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "middledyn01_wave_complete"
		}
	},
	bell_event_dynspawn_middle02 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_middle"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"flow_event",
			flow_event_name = "middledyn02_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_middle_spawner_dyn02",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "middledyn02_wave_complete"
		}
	},
	bell_event_dynspawn_middle03 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_middle"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"flow_event",
			flow_event_name = "middledyn03_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_middle_spawner_dyn03",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "middledyn03_wave_complete"
		}
	},
	bell_event_dynspawn_middle04 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_middle"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"flow_event",
			flow_event_name = "middledyn04_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_middle_spawner_dyn04",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "middledyn04_wave_complete"
		}
	},
	bell_event_dynspawn_last01 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_last"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"flow_event",
			flow_event_name = "last01_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_last_spawner_dyn",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "last01_wave_complete"
		}
	},
	bell_event_dynspawn_last02 = {
		{
			"set_master_event_running",
			name = "bell_event_dynspawn_last"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"flow_event",
			flow_event_name = "last02_wave_started"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "bell_last_spawner_dyn",
			composition_type = "event_bell_slaves_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "last02_wave_complete"
		}
	},
	bell_spawn01 = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_a",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 35
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_b",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 35
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete"
		}
	},
	bell_spawn02 = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d2",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_d2",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 25
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 25
		},
		{
			"event_horde",
			spawner_id = "spawner_d",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete02"
		}
	},
	bell_spawn02ending = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_d3",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_d3",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete02ending"
		}
	},
	bell_spawn03 = {
		{
			"control_specials",
			enable = true
		},
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				-20,
				-5,
				20
			}
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "spawner_e",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_e",
			composition_type = "event_survival_pack"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 35
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				90,
				0,
				18
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_e2",
			composition_type = "event_survival_main"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_e2",
			composition_type = "event_survival_pack"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 3
			end
		},
		{
			"delay",
			duration = 35
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
			optional_pos = {
				20,
				50,
				25
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "spawner_c",
			composition_type = "event_survival_slaves_large"
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "survival_wave_complete03"
		}
	},
	bell_rat_ogre = {
		{
			"spawn_at_raw",
			spawner_id = "bell_rat_ogre",
			breed_name = "skaven_rat_ogre"
		}
	},
	bell_pacing_off = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	nurgle_spawn_zombies_test = {
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_01",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_02",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_03",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_04",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_05",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_06",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_07",
			breed_name = "chaos_fanatic"
		},
		{
			"spawn_at_raw",
			spawner_id = "plaza_zombie_08",
			breed_name = "chaos_fanatic"
		},
		{
			"flow_event",
			flow_event_name = "nurgle_spawn_zombies_test_done"
		}
	},
	nurgle_end_event_start = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"disable_kick"
		}
	},
	nurgle_end_event_stinger = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	nurgle_end_event01 = {
		{
			"set_master_event_running",
			name = "nurgle_end_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "nurgle_end_event_chaos",
			composition_type = "chaos_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event",
			composition_type = "event_generic_short_level_stormvermin"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "nurgle_end_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "end_event_monk",
			composition_type = "event_mines_plague_monks"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stingers_plague_monk"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event01_done"
		}
	},
	nurgle_end_event_escape = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_master_event_running",
			name = "nurgle_end_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event02",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_escape_done"
		}
	},
	nurgle_end_event_escape_02 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"set_master_event_running",
			name = "nurgle_end_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event02",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "nurgle_end_event02",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"event_horde",
			spawner_id = "nurgle_end_event02",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_escape_02_done"
		}
	},
	nurgle_end_event_specials_01 = {
		{
			"set_master_event_running",
			name = "nurgle_end_event"
		},
		{
			"spawn",
			{
				2,
				3
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_specials_done"
		}
	},
	nurgle_end_event_specials_02 = {
		{
			"set_master_event_running",
			name = "nurgle_end_event"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_gutter_runner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_specials_done"
		}
	},
	nurgle_end_event_specials_03 = {
		{
			"set_master_event_running",
			name = "nurgle_end_event"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn",
			1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "nurgle_end_event_specials_done"
		}
	},
	nurgle_end_event_enable_specials = {
		{
			"control_specials",
			enable = true
		}
	},
	warcamp_payload = {
		{
			"set_master_event_running",
			name = "warcamp_payload"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "payload_event_l",
			composition_type = "chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "payload_event_r",
			composition_type = "chaos_berzerkers"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "payload_event_r",
			composition_type = "chaos_shields"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "payload_event_l",
			composition_type = "chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "warcamp_payload"
		}
	},
	warcamp_chaos_boss = {
		{
			"set_master_event_running",
			name = "warcamp_chaos_boss"
		},
		{
			"spawn_at_raw",
			spawner_id = "warcamp_chaos_boss",
			breed_name = "chaos_exalted_champion_warcamp"
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_champion_warcamp") == 1
			end
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_champion_warcamp") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "warcamp_chaos_boss_dead"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	warcamp_door_guard = {
		{
			"disable_kick"
		},
		{
			"spawn_at_raw",
			spawner_id = "wc_shield_dude_1",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "wc_shield_dude_2",
			breed_name = "chaos_marauder_with_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "wc_sword_dude_1",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "wc_sword_dude_2",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "wc_2h_dude_1",
			breed_name = "chaos_raider"
		}
	},
	warcamp_camp = {
		{
			"set_master_event_running",
			name = "warcamp_camp"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "camp_event",
			composition_type = "warcamp_inside_camp"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "warcamp_camp_restart"
		}
	},
	warcamp_load_chaos_exalted_champion = {
		{
			"force_load_breed_package",
			breed_name = "chaos_exalted_champion_warcamp"
		}
	},
	warcamp_arena_chase = {
		{
			"set_master_event_running",
			name = "warcamp_chase"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_chase",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"control_specials",
			enable = false
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "warcamp_chase_restart"
		}
	},
	boss_event_dual_spawn = {
		{
			"spawn",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			},
			optional_data = {
				max_health_modifier = 0.5
			}
		},
		{
			"spawn",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			},
			optional_data = {
				max_health_modifier = 0.5
			}
		}
	}
}

for _, dlc in pairs(DLCSettings) do
	local event_file_name = dlc.terror_event_blueprints_filename

	if event_file_name then
		events = dofile(event_file_name)

		for blue_print_name, event in pairs(events) do
			TerrorEventBlueprints[blue_print_name] = event
		end
	else
		local events = dlc.terror_event_blueprints

		if events then
			for blue_print_name, event in pairs(events) do
				TerrorEventBlueprints[blue_print_name] = event
			end
		end
	end

	local events = dlc.weighted_random_terror_events

	if events then
		for event_name, event in pairs(events) do
			WeightedRandomTerrorEvents[event_name] = event
		end
	end
end

for chunk_name, chunk in pairs(WeightedRandomTerrorEvents) do
	for i = 1, #chunk, 2 do
		local event_name = chunk[i]

		fassert(TerrorEventBlueprints[event_name], "TerrorEventChunk %s has a bad event: '%s'.", chunk_name, tostring(event_name))
	end

	chunk.loaded_probability_table = LoadedDice.create_from_mixed(chunk)
end

return
