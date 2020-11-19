local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local weighted_random_terror_events = {
	crawl_gauntlet = {
		"crawl_gauntlet_01",
		1,
		"crawl_gauntlet_02",
		1
	},
	crawl_bar_fight_specials = {
		"crawl_bar_fight_specials_01",
		1,
		"crawl_bar_fight_specials_02",
		1,
		"crawl_bar_fight_specials_03",
		1,
		"crawl_bar_fight_specials_04",
		1,
		"crawl_bar_fight_specials_05",
		1,
		"crawl_bar_fight_specials_06",
		1
	}
}
local terror_event_blueprints = {
	crawl_pub_collapse_01 = {
		{
			"set_master_event_running",
			name = "crawl_pub_collapse_01"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "crawl_pub_collapse_skaven_horde",
			composition_type = "crawl_pub_01_skaven_small"
		},
		{
			"event_horde",
			spawner_id = "crawl_pub_collapse_skaven_horde5",
			composition_type = "crawl_pub_01_skaven_extras"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "crawl_pub_collapse_skaven_horde2",
			composition_type = "crawl_pub_01_skaven_medium"
		},
		{
			"event_horde",
			spawner_id = "crawl_pub_collapse_skaven_horde4",
			composition_type = "crawl_pub_01_skaven_extras"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_storm_vermin_with_shield") < 2 and count_event_breed("skaven_plague_monk") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_pub_collapse_01_done"
		}
	},
	crawl_pub_collapse_02 = {
		{
			"set_master_event_running",
			name = "crawl_pub_collapse_02"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "crawl_pub_collapse_chaos4",
			composition_type = "chaos_warriors"
		},
		{
			"event_horde",
			spawner_id = "crawl_pub_collapse_chaos",
			composition_type = "crawl_pub_01_chaos_small"
		},
		{
			"event_horde",
			spawner_id = "crawl_pub_collapse_chaos3",
			composition_type = "crawl_pub_01_chaos_extras"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "crawl_pub_collapse_chaos2",
			composition_type = "crawl_pub_01_chaos_large"
		},
		{
			"event_horde",
			spawner_id = "crawl_pub_collapse_chaos5",
			composition_type = "crawl_pub_01_chaos_extras"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 2 and count_event_breed("chaos_warrior") < 1 and count_event_breed("chaos_berzerker") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_pub_collapse_02_done"
		}
	},
	crawl_pub_collapse_disable_pacing = {
		{
			"control_hordes",
			enable = false
		}
	},
	crawl_pub_collapse_enable_pacing = {
		{
			"control_hordes",
			enable = true
		}
	},
	crawl_pub_02_disable_pacing = {
		{
			"control_hordes",
			enable = false
		}
	},
	crawl_pub_02_wave_01 = {
		{
			"set_master_event_running",
			name = "crawl_bar_02"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "pub_02",
			composition_type = "crawl_end_event_skaven_small"
		},
		{
			"event_horde",
			spawner_id = "pub_02",
			composition_type = "crawl_end_event_storm_vermin"
		},
		{
			"event_horde",
			spawner_id = "pub_02_behind",
			composition_type = "crawl_end_event_skaven_medium"
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
			"event_horde",
			spawner_id = "pub_02_chaos",
			composition_type = "crawl_end_event_chaos_01"
		},
		{
			"event_horde",
			spawner_id = "pub_02_chaos",
			composition_type = "crawl_end_event_chaos_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_fanatic") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_pub_02_wave_01_done"
		}
	},
	crawl_pub_02_enable_pacing = {
		{
			"control_pacing",
			enable = true
		}
	},
	crawl_bar_fight_start = {
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
	crawl_bar_fight_stinger = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		}
	},
	crawl_bar_fight_01 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_skaven_large"
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
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_chaos_01"
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_storm_vermin"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_fanatic") < 2
			end
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_skaven_shield"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_with_shield") < 1 and count_event_breed("skaven_clan_rat_with_shield") < 1
			end
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_chaos_02"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_fanatic") < 2 and count_event_breed("chaos_berzerker") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_bar_fight_01_done"
		}
	},
	crawl_bar_fight_02 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_skaven_small"
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_chaos_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2 and count_event_breed("chaos_marauder") < 1 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_fanatic") < 2
			end
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_skaven_medium"
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_storm_vermin"
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
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_chaos_02"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_fanatic") < 2 and count_event_breed("chaos_berzerker") < 1
			end
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_chaos_small"
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_skaven_small"
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "storm_vermin_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 1 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_fanatic") < 2
			end
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_chaos_small"
		},
		{
			"event_horde",
			spawner_id = "pub_floor_fall_b",
			composition_type = "crawl_end_event_floor_fall"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "end_event_specials_bar",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("chaos_raider") < 2 and count_event_breed("chaos_marauder") < 1 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_fanatic") < 2 and count_event_breed("skaven_rat_ogre") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_bar_fight_fire_vo"
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_skaven_medium"
		},
		{
			"event_horde",
			spawner_id = "end_event",
			composition_type = "crawl_end_event_skaven_monks"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1 and count_event_breed("skaven_slave") < 1 and count_event_breed("skaven_plague_monk") < 1 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_fanatic") < 1 and count_event_breed("chaos_marauder") < 1 and count_event_breed("chaos_marauder_with_shield") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_bar_fight_02_done"
		}
	},
	crawl_bar_fight_specials_01 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_specials",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "end_event_specials",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 5
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
			flow_event_name = "crawl_bar_fight_specials_done"
		}
	},
	crawl_bar_fight_specials_02 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_specials",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "end_event_specials",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_bar_fight_specials_done"
		}
	},
	crawl_bar_fight_specials_03 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_specials",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "end_event_specials",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_ratling_gunner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_bar_fight_specials_done"
		}
	},
	crawl_bar_fight_specials_04 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_specials",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "end_event_specials",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_bar_fight_specials_done"
		}
	},
	crawl_bar_fight_specials_05 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_specials",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "end_event_specials",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_gutter_runner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_bar_fight_specials_done"
		}
	},
	crawl_bar_fight_specials_06 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_specials",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_specials",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "end_event_specials",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "end_event_specials",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_ratling_gunner") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_bar_fight_specials_done"
		}
	},
	crawl_bar_fight_specials_bar = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_event_specials_bar",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "end_event_specials",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 5
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
			flow_event_name = "crawl_bar_fight_specials_bar_done"
		}
	},
	crawl_bar_fight_open_stairs = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"event_horde",
			spawner_id = "end_event_break_wall_01",
			composition_type = "crawl_end_event_open_stairs"
		},
		{
			"event_horde",
			spawner_id = "end_event_break_wall_01_2",
			composition_type = "crawl_end_event_open_stairs"
		},
		{
			"event_horde",
			spawner_id = "end_event_break_wall_01_3",
			composition_type = "crawl_end_event_open_stairs"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_warrior") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "crawl_bar_fight_open_stairs_done"
		}
	},
	crawl_gauntlet_start = {
		{
			"control_specials",
			enable = true
		}
	},
	crawl_gauntlet_01 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "gauntlet",
			composition_type = "crawl_end_event_chaos_01"
		},
		{
			"event_horde",
			spawner_id = "gauntlet",
			composition_type = "crawl_end_event_chaos_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_fanatic") < 2
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"flow_event",
			flow_event_name = "crawl_gauntlet_done"
		}
	},
	crawl_gauntlet_02 = {
		{
			"set_master_event_running",
			name = "crawl_bar_fight"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "gauntlet",
			composition_type = "crawl_end_event_skaven_large"
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
			duration = 4
		},
		{
			"flow_event",
			flow_event_name = "crawl_gauntlet_done"
		}
	},
	crawl_preload = {
		{
			"force_load_breed_package",
			breed_name = "chaos_warrior"
		},
		{
			"force_load_breed_package",
			breed_name = "chaos_raider"
		}
	},
	crawl_floor_fall = {
		{
			"event_horde",
			spawner_id = "pub_floor_fall_a",
			composition_type = "crawl_end_event_floor_fall"
		},
		{
			"event_horde",
			spawner_id = "pub_floor_fall_b",
			composition_type = "crawl_end_event_floor_fall"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"event_horde",
			spawner_id = "pub_floor_fall_a",
			composition_type = "chaos_berzerkers_small"
		},
		{
			"event_horde",
			spawner_id = "pub_floor_fall_b",
			composition_type = "chaos_berzerkers_small"
		}
	},
	crawl_drachenwine_challenge = {
		{
			"set_master_event_running",
			name = "crawl_drachenwine_challenge"
		},
		{
			"spawn_at_raw",
			spawner_id = "drachenwine_challenge",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "drachenwine_challenge_enabled"
		}
	}
}

return terror_event_blueprints, weighted_random_terror_events
