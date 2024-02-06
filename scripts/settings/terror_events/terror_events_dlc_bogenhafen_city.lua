-- chunkname: @scripts/settings/terror_events/terror_events_dlc_bogenhafen_city.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events
local HARDER = 4
local HARDEST = 5
local terror_event_blueprints = {
	dlc_bogenhafen_city_sewer_start = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_sewer_start",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "sewer_start",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 20,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_start_done",
		},
	},
	dlc_bogenhafen_city_sewer_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "sewer_spice",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_spice_done",
		},
	},
	dlc_bogenhafen_city_sewer_mid01 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_sewer_mid01",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "sewer_mid",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "sewer_rawspawner01",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "sewer_mid",
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 2,
			spawner_id = "sewer_mid",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stingers_plague_monk",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "sewer_mid",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3
			end,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_mid01_done",
		},
	},
	dlc_bogenhafen_city_sewer_end = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_sewer_end",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawner_id = "sewer_end_chaos",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "sewer_end_chaos",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"control_specials",
			enable = true,
		},
		{
			"control_pacing",
			enable = true,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_end_done",
		},
	},
	dlc_bogenhafen_city_sewer_escape = {
		{
			"set_master_event_running",
			name = "bogenhafenhafen_sewer_escape",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "sewer_escape",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_sewer_escape_done",
		},
	},
	dlc_bogenhafen_city_disable_pacing = {
		{
			"control_specials",
			enable = false,
		},
		{
			"control_pacing",
			enable = false,
		},
	},
	dlc_bogenhafen_city_temple_start = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_end_start",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"disable_kick",
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "temple_event_start",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "temple_event_button4",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "temple_event_start",
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_rawspawner01",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_start_done",
		},
	},
	dlc_bogenhafen_city_temple_button1 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button1",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "temple_event_button1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "temple_event_button2",
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_rawspawner01",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_pack_master",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button1_done",
		},
	},
	dlc_bogenhafen_city_temple_button2 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button2",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "temple_event_button2",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "temple_rawspawner01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "temple_rawspawner02",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "temple_event_button2",
		},
		{
			"spawn_at_raw",
			spawner_id = "temple_rawspawner01",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button2_done",
		},
	},
	dlc_bogenhafen_city_temple_button3 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button3",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stingers_plague_monk",
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 2,
			spawner_id = "temple_event_button3",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "temple_event_button3",
		},
		{
			"spawn_at_raw",
			amount = 2,
			spawner_id = "temple_rawspawner02",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button3_done",
		},
	},
	dlc_bogenhafen_city_temple_button4 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button4",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawner_id = "temple_event_button4",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "temple_event_button4",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "temple_rawspawner02",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_small",
			limit_spawners = 2,
			spawner_id = "temple_event_button4",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button4_done",
		},
	},
	dlc_bogenhafen_city_temple_button5 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_button5",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawner_id = "temple_event_button5",
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			limit_spawners = 2,
			spawner_id = "temple_event_button5",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_warrior") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button5_done",
		},
	},
	dlc_bogenhafen_city_temple_escape = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_escape",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
			spawner_id = "temple_event_escape",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
			spawner_id = "temple_event_escape",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "temple_event_button4",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_button5_done",
		},
	},
	dlc_bogenhafen_city_temple_loop = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_city_temple_loop",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "temple_event_loop",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_storm_vermin_commander") < 1
			end,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_city_temple_loop_done",
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
