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

local terror_event_blueprints = {
	dlc_bogenhafen_city_sewer_start = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_sewer_start"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"control_specials",
			enable = false
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "sewer_start",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "sewer_rawspawner01",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_at_raw",
			spawner_id = "sewer_rawspawner02",
			breed_name = "skaven_warpfire_thrower"
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
			spawner_id = "sewer_start",
			composition_type = "event_medium"
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
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_start_done"
		}
	},
	dlc_bogenhafen_city_sewer_spice = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewer_spice",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewer_spice",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewer_spice",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_spice_done"
		}
	},
	dlc_bogenhafen_city_sewer_mid01 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_sewer_mid01"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "sewer_mid",
			composition_type = "event_medium"
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
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "sewer_mid",
			composition_type = "event_smaller"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewer_mid",
			composition_type = "event_generic_short_level_extra_spice"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewer_mid",
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
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "sewer_mid",
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
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"event_horde",
			spawner_id = "sewer_mid",
			composition_type = "event_large"
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
			duration = 2
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
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_mid01_done"
		}
	},
	dlc_bogenhafen_city_sewer_end = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_sewer_end"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewer_end_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
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
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "sewer_end",
			composition_type = "event_small"
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
			spawner_id = "sewer_end_chaos",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 5
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
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "sewer_end_chaos2",
			composition_type = "event_small_chaos"
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_end_barricade"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "sewer_rawspawner03",
			breed_name = "skaven_poison_wind_globadier"
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
			duration = 1
		},
		{
			"control_specials",
			enable = true
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_end_done"
		}
	},
	dlc_bogenhafen_city_disable_pacing = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_disable_pacing_start"
		},
		{
			"disable_kick"
		},
		{
			"control_specials",
			enable = false
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_disable_pacing_done"
		}
	},
	dlc_bogenhafen_city_temple_start = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_end_start"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"disable_kick"
		},
		{
			"control_specials",
			enable = false
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			spawner_id = "temple_event_start",
			composition_type = "event_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_commanderspawn01",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_commanderspawn02",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_commanderspawn03",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_commanderspawn04",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_commanderspawn05",
			breed_name = "skaven_storm_vermin_commander"
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
			spawner_id = "temple_event_mid",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_start_done"
		}
	},
	dlc_bogenhafen_city_temple_spice = {
		{
			"spawn_at_raw",
			spawner_id = "end_zombie01",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_zombie02",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_zombie03",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_zombie04",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_zombie05",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_zombie06",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_zombie07",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_zombie08",
			breed_name = "chaos_zombie"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_rawspawner03",
			breed_name = "chaos_warrior"
		}
	},
	dlc_bogenhafen_city_temple_mid01 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_end_mid01"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "temple_event_end",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "temple_event_end",
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
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 4
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "temple_event_end",
			composition_type = "event_generic_short_level_extra_spice"
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
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_mid01_done"
		}
	},
	dlc_bogenhafen_city_temple_mid02 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_end_mid02"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_rawspawner04",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_rawspawner05",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_rawspawner06",
			breed_name = "chaos_warrior"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "temple_event_chaos",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 5
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
			spawner_id = "temple_event_chaos",
			composition_type = "chaos_berzerkers"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "temple_event_chaos",
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
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_mid02_done"
		}
	},
	dlc_bogenhafen_city_temple_button01 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button01"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "temple_button01",
			composition_type = "event_mines_plague_monks"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_rawspawner01",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button01_done"
		}
	},
	dlc_bogenhafen_city_temple_button02 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button02"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_rawspawner02",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button02_done"
		}
	},
	dlc_bogenhafen_city_temple_button03 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button03"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_rawspawner01",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button03_done"
		}
	},
	dlc_bogenhafen_city_temple_button04 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button04"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "temple_button04",
			composition_type = "event_mines_plague_monks"
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button04_done"
		}
	},
	dlc_bogenhafen_city_temple_button05 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button05"
		},
		{
			"spawn_at_raw",
			spawner_id = "end_rawspawner03",
			breed_name = "chaos_warrior"
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button05_done"
		}
	}
}

return terror_event_blueprints
