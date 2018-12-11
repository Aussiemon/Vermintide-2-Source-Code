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

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_units()

	return #spawned_enemies
end

local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local terror_event_blueprints = {
	magnus_door_event_guards = {
		{
			"spawn_at_raw",
			spawner_id = "magnus_door_event_guards_01",
			breed_name = "chaos_warrior"
		}
	},
	magnus_gutter_runner_treasure = {
		{
			"spawn_special",
			breed_name = "skaven_gutter_runner",
			amount = {
				1,
				2
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "gutter_runner_treasure_restart"
		}
	},
	magnus_door_a = {
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
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			{
				2,
				3
			},
			spawner_id = "magnus_door_event_specials",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_special",
			spawner_id = "magnus_door_event_specials",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("chaos_marauder") < 3 and count_breed("chaos_fanatic") < 3
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 3 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			"skaven_plague_monk",
			{
				1,
				3
			},
			spawner_id = "magnus_door_event_specials",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("chaos_marauder") < 4
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 3 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("chaos_marauder") < 4 and count_breed("chaos_fanatic") < 3
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_special",
			spawner_id = "magnus_door_event_specials",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 3 and count_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "magnus_door_event_specials",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("chaos_marauder") < 3 and count_breed("chaos_fanatic") < 3
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 3 and count_breed("skaven_slave") < 3
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		}
	},
	magnus_door_b = {
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
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_medium"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn",
			spawner_id = "magnus_door_event_specials",
			breed_name = "chaos_warrior"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("chaos_marauder") < 3
			end
		},
		{
			"spawn",
			"skaven_plague_monk",
			{
				2,
				3
			},
			spawner_id = "magnus_door_event_specials",
			breed_name = "chaos_warrior"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 4 and count_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("chaos_marauder") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 3 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_special",
			"skaven_warpfire_thrower",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "magnus_door_event_specials",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 3 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "magnus_door_event_specials",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_breed("chaos_marauder") < 2 and count_breed("chaos_fanatic") < 2
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_c",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_b",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			spawner_id = "magnus_door_event_specials",
			breed_name = "chaos_warrior"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_chaos",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("chaos_marauder") < 2
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "magnus_door_event_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		}
	},
	magnus_end_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "magnus_end_horde_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			spawner_id = "magnus_end_horde_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		},
		{
			"delay",
			duration = 9
		},
		{
			"event_horde",
			spawner_id = "magnus_end_horde_a",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		}
	},
	magnus_door_event_stop = {
		{
			"stop_event",
			stop_event_name = "magnus_door_a"
		},
		{
			"stop_event",
			stop_event_name = "magnus_door_b"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"control_specials",
			enable = true
		},
		{
			"disable_bots_in_carry_event"
		}
	},
	magnus_tower_tower_climb = {
		{
			"event_horde",
			spawner_id = "magnus_tower_tower_climb_spawners",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_breed("skaven_clan_rat") < 2 and count_breed("skaven_slave") < 2
			end
		}
	},
	magnus_end_event = {
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
			name = "magnus_end_event"
		},
		{
			"flow_event",
			flow_event_name = "magnus_horn_crescendo_starting"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "magnus_tower_horn_first",
			composition_type = "event_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "magnus_end_event_first_wave_killed"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_extra_spice_large"
		},
		{
			"disable_kick"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "magnus_tower_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "magnus_tower_chaos",
			composition_type = "chaos_shields"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "magnus_tower_chaos",
			composition_type = "chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_special",
			amount = 2,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner"
			}
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_extra_spice_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "magnus_tower_horn",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"control_specials",
			enable = true
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_extra_spice_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 7 and count_event_breed("skaven_storm_vermin_commander") < 4
			end
		},
		{
			"spawn_special",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			}
		},
		{
			"delay",
			duration = 7
		},
		{
			"event_horde",
			spawner_id = "magnus_tower_chaos",
			composition_type = "chaos_berzerkers_small"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "magnus_tower_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_fanatic") < 2
			end
		},
		{
			"event_horde",
			spawner_id = "magnus_tower_chaos",
			composition_type = "chaos_warriors"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_warrior") < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_extra_spice_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "magnus_tower_horn",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_plague_monk") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "magnus_tower_horn",
			composition_type = "event_large"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "magnus_tower_horn",
			composition_type = "event_extra_spice_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "magnus_horn_event_done"
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		}
	},
	magnus_disable_pacing = {
		{
			"control_pacing",
			enable = false
		}
	},
	cemetery_plague_brew_event_1_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_shields_small"
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_1_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_2_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_special",
			breed_name = "chaos_vortex_sorcerer",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_2_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_special",
			breed_name = "chaos_vortex_sorcerer",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_3_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_special",
			breed_name = "skaven_warpfire_thrower",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		}
	},
	cemetery_plague_brew_event_3_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_shields_small"
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_4_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		}
	},
	cemetery_plague_brew_event_4_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		}
	},
	cemetery_plague_brew_exit_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "cemetery_brew_event_chaos",
			composition_type = "chaos_shields"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "cemetery_brew_event_chaos",
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
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_alt_objective_1_v1 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Prepare to fight the horde, v1...",
			duration = 3
		},
		{
			"delay",
			duration = 5
		},
		{
			"horde",
			min_amount = 15,
			peak_amount = 25,
			duration = {
				15,
				25
			}
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_alt_objective_1_v2 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Prepare to fight the horde, v2...",
			duration = 3
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = {
				10,
				25
			}
		},
		{
			"horde",
			duration = 10,
			min_amount = 5,
			peak_amount = 10
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_alt_objective_2 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Prepare to fight the horde...",
			duration = 3
		},
		{
			"delay",
			duration = 5
		},
		{
			"horde",
			duration = 20,
			min_amount = 15,
			peak_amount = 25
		},
		{
			"delay",
			duration = 20
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	cemetery_alt_objective_3 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Prepare to fight the horde...",
			duration = 3
		},
		{
			"delay",
			duration = 5
		},
		{
			"horde",
			duration = 20,
			min_amount = 15,
			peak_amount = 25
		},
		{
			"delay",
			duration = 20
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
			"flow_event",
			flow_event_name = "cemetery_alt_objective_3_end_event"
		}
	},
	cemetery_random_terror_event = {
		{
			"delay",
			duration = {
				5,
				40
			}
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				5,
				10
			}
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		}
	},
	forest_end_event_start = {
		{
			"control_pacing",
			enable = false
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_start_debug"
		},
		{
			"disable_kick"
		}
	},
	forest_end_event_a = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"disable_kick"
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
			spawner_id = "forest_end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = {
				6,
				9
			}
		},
		{
			"spawn",
			"skaven_poison_wind_globadier",
			{
				1,
				2
			},
			spawner_id = "forest_end_event_specials",
			breed_name = "skaven_plague_monk"
		},
		{
			"event_horde",
			spawner_id = "forest_end_event",
			composition_type = "storm_vermin_shields_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "forest_end_event",
			composition_type = "event_small"
		},
		{
			"event_horde",
			spawner_id = "forest_end_event",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_plague_monk") < 5
			end
		},
		{
			"delay",
			duration = {
				3,
				7
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart"
		}
	},
	forest_end_event_b = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"disable_kick"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "forest_end_event_chaos",
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
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_fanatic") < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "forest_end_event_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"event_horde",
			spawner_id = "forest_end_event_chaos",
			composition_type = "chaos_berzerkers_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_berzerker") < 2
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
			"flow_event",
			flow_event_name = "forest_end_event_restart"
		}
	},
	forest_end_event_c = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"disable_kick"
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
			"spawn",
			"skaven_poison_wind_globadier",
			{
				1,
				2
			},
			spawner_id = "forest_end_event_specials",
			breed_name = "skaven_plague_monk"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "forest_end_event",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "forest_end_event_chaos",
			composition_type = "storm_vermin_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin") < 2
			end
		},
		{
			"delay",
			duration = {
				3,
				7
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart"
		}
	},
	forest_end_finale = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"disable_kick"
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
			spawner_id = "forest_end_event_finale",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "forest_end_event_chaos",
			composition_type = "chaos_warriors"
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
			spawner_id = "forest_end_event_finale",
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
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("chaos_warrior") < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart"
		}
	},
	forest_end_event_loop = {
		{
			"set_master_event_running",
			name = "forest_finale"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "forest_end_event",
			composition_type = "event_extra_spice_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
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
			"flow_event",
			flow_event_name = "forest_end_event_loop_restart"
		}
	},
	forest_end_cutscene = {
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "forest_cutscene_a",
			composition_type = "event_smaller"
		}
	},
	forest_skaven_camp_guards_01 = {
		{
			"spawn_at_raw",
			spawner_id = "forest_skaven_camp_guards_01a",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest_skaven_camp_guards_01b",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest_skaven_camp_guards_01c",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	forest_skaven_camp_guards_02 = {
		{
			"spawn_at_raw",
			spawner_id = "forest_skaven_camp_guards_02a",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest_skaven_camp_guards_02b",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest_skaven_camp_guards_02c",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	forest_skaven_camp_guards_03 = {
		{
			"spawn_at_raw",
			spawner_id = "forest_skaven_camp_guards_03a",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest_skaven_camp_guards_03b",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest_skaven_camp_guards_03c",
			breed_name = "skaven_storm_vermin_commander"
		}
	},
	forest_skaven_camp_loop = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "forest_camp"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "skaven_camp_loop",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "skaven_camp_loop",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = {
				2,
				4
			}
		},
		{
			"spawn_special",
			spawner_id = "forest_camp_specials",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_poison_wind_globadier") < 1
			end
		},
		{
			"delay",
			duration = {
				2,
				4
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_loop_restart"
		}
	},
	forest_skaven_camp_resistance_loop = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "forest_camp"
		},
		{
			"spawn",
			{
				4,
				7
			},
			spawner_id = "forest_camp_specials",
			breed_name = "skaven_plague_monk"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "skaven_camp_loop",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_clan_rat") < 4
			end
		},
		{
			"delay",
			duration = {
				13,
				17
			}
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_resistance_loop_restart"
		}
	},
	forest_skaven_camp_a = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "forest_camp"
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
			spawner_id = "forest_skaven_camp",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
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
			"event_horde",
			spawner_id = "forest_skaven_camp",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_a_done"
		}
	},
	forest_skaven_camp_b = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "forest_camp"
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
			spawner_id = "forest_skaven_camp",
			composition_type = "event_small"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
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
			"flow_event",
			flow_event_name = "forest_skaven_camp_b_done"
		}
	},
	forest_skaven_camp_c = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "forest_camp"
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
			spawner_id = "forest_skaven_camp",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
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
			"event_horde",
			spawner_id = "forest_skaven_camp",
			composition_type = "event_smaller"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_c_done"
		}
	},
	forest_skaven_camp_finale = {
		{
			"set_master_event_running",
			name = "forest_camp"
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
			spawner_id = "forest_door_a",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "forest_skaven_camp",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"stop_master_event"
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_finale_done"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	plaza_disable_pacing = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	plaza_load_bosses = {
		{
			"force_load_breed_package",
			breed_name = "skaven_rat_ogre"
		},
		{
			"force_load_breed_package",
			breed_name = "skaven_stormfiend"
		},
		{
			"force_load_breed_package",
			breed_name = "chaos_spawn"
		},
		{
			"force_load_breed_package",
			breed_name = "chaos_troll"
		}
	},
	plaza_wave_1 = {
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
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_1_01"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_1_02"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_h",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_1_03"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_pack_master"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_1_04"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_1_04"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_1_complete"
		}
	},
	plaza_wave_2 = {
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
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_2_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_2_02"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_c",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_a",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_2_03"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_2_03"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_2_04"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_k",
			breed_name = "chaos_spawn"
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_2_05"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_2_05"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_j",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_2_complete"
		}
	},
	plaza_wave_3 = {
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
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
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_3_01"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_c",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_a",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_d",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_i",
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_k",
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_b",
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_j",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 4
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_3_02"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 12
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_3_03"
		},
		{
			"event_horde",
			spawner_id = "directional_b",
			composition_type = "plaza_wave_3_03"
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_3_03"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_3_03"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_3_04"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_3_06"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_3_05"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_3_complete"
		}
	},
	plaza_wave_4 = {
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
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_4_01"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_4_01"
		},
		{
			"delay",
			duration = 8
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_4_02"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_4_02"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_4_03"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_4_03"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_k",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_a",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_b",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_4_04"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_4_04"
		},
		{
			"delay",
			duration = 6
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 6
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_4_05"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_4_05"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_4_04"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_b",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_4_complete"
		}
	},
	plaza_wave_5 = {
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"disable_kick"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_5_01"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_a",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_d",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_b",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_5_02"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_5_02"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_stormfiend"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_5_03"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_5_04"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_a",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_b",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_d",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_i",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_e",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_5_04"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_5_05"
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_5_complete"
		}
	},
	plaza_wave_6 = {
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
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_6_04"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_b",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_6_05"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_6_01"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_6_01"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_g",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_6_02"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_6_02"
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_k",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_a",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_b",
			composition_type = "plaza_wave_6_03"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_6_03"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_e",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_b",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_i",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_a",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_6_04"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_6_04"
		},
		{
			"delay",
			duration = 12
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_6_complete"
		}
	},
	plaza_wave_7 = {
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
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_7_01"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_7_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_7_02"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_7_02"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_7_03"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_7_03"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_7_04"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_7_04"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_h",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_f",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_e",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 2
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
			spawner_id = "directional_e",
			composition_type = "plaza_wave_7_05"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_7_05"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_b",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_b",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_f",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_c",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_7_02"
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_7_complete"
		}
	},
	plaza_wave_8 = {
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
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_01"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_8_01"
		},
		{
			"delay",
			duration = 20
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_troll"
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "manual_d",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_02"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_8_02"
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_d",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_e",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_8_03"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_8_03"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_02"
		},
		{
			"delay",
			duration = 12
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_01"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_e",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_8_04"
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_8_04"
		},
		{
			"delay",
			duration = 15
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_k",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "manual_a",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_05"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_8_08"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_8_08"
		},
		{
			"delay",
			duration = 12
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_06"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_8_06"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_a",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_d",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_8_09"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_8_09"
		},
		{
			"delay",
			duration = 25
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_h",
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_8_07"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_k",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_g",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_f",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_b",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_02"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_05"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_8_07"
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_07"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 300,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_8_complete"
		}
	}
}

return terror_event_blueprints
