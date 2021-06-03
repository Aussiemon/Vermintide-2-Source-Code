local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local weighted_random_terror_events = {
	catacombs_end_event_02 = {
		"catacombs_end_event_02a",
		1,
		"catacombs_end_event_02b",
		1,
		"catacombs_end_event_02c",
		1
	},
	catacombs_end_event_specials = {
		"catacombs_end_event_specials_01",
		1,
		"catacombs_end_event_specials_02",
		1,
		"catacombs_end_event_specials_03",
		1
	}
}
local terror_event_blueprints = {
	catacombs_puzzle_event_start = {
		{
			"control_pacing",
			enable = false
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
			composition_type = "chaos_berzerkers_small"
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
			composition_type = "event_extra_spice_small"
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
			"event_horde",
			limit_spawners = 2,
			spawner_id = "puzzle_event_loop",
			composition_type = "event_extra_spice_small",
			difficulty_requirement = CATACLYSM
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
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_01",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARDEST
		}
	},
	catacombs_special_event_b = {
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_01",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_01",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner"
			},
			difficulty_requirement = HARDEST
		}
	},
	catacombs_special_event_c = {
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_01",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "puzzle_special_01",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDEST
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
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 4 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_01_done"
		}
	},
	catacombs_end_event_02a = {
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
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 100,
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
			"event_horde",
			limit_spawners = 6,
			spawner_id = "end_event",
			composition_type = "chaos_warriors_small",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 3 and count_event_breed("chaos_warrior") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_02_done"
		}
	},
	catacombs_end_event_02b = {
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
			composition_type = "event_smaller"
		},
		{
			"event_horde",
			limit_spawners = 6,
			spawner_id = "end_event",
			composition_type = "chaos_warriors_small",
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			limit_spawners = 4,
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
			composition_type = "storm_vermin_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("chaos_warrior") < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "catacombs_end_event_02_done"
		}
	},
	catacombs_end_event_02c = {
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
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = 10
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
			duration = 100,
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
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			difficulty_amount = {
				hardest = 1,
				hard = 1,
				harder = 1,
				cataclysm = 1,
				normal = 1
			}
		},
		{
			"spawn_special",
			breed_name = "skaven_pack_master",
			amount = 1,
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_pack_master") < 1
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
			"spawn_special",
			breed_name = "skaven_warpfire_thrower",
			difficulty_amount = {
				hardest = 1,
				hard = 1,
				harder = 1,
				cataclysm = 1,
				normal = 1
			}
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 120,
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
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			difficulty_amount = {
				hardest = 1,
				hard = 1,
				harder = 1,
				cataclysm = 1,
				normal = 1
			}
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 120,
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
			challenge_name = "volume_corpse_pit_damage",
			increment_stat_name = "catacombs_added_souls",
			volume_name = "volume_corpse_pit_damage",
			only_on_difficulty = HARDEST
		},
		{
			"do_volume_challenge",
			challenge_name = "volume_corpse_pit_damage_cata",
			increment_stat_name = "catacombs_added_souls_cata",
			volume_name = "volume_corpse_pit_damage",
			only_on_difficulty = CATACLYSM
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
	}
}

return terror_event_blueprints, weighted_random_terror_events
