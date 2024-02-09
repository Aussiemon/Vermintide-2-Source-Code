-- chunkname: @scripts/settings/terror_events/terror_events_military_pvp.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function spawned_during_event()
	return Managers.state.conflict:enemies_spawned_during_event()
end

local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local weighted_random_terror_events = {
	military_end_event_survival_01 = {
		"military_end_event_survival_01_back",
		1,
		"military_end_event_survival_01_right",
		1,
	},
	military_end_event_survival_02 = {
		"military_end_event_survival_02_right",
		5,
		"military_end_event_survival_02_left",
		5,
		"military_end_event_survival_02_middle",
		3,
		"military_end_event_survival_02_back",
		5,
	},
	military_end_event_survival_03 = {
		"military_end_event_survival_03_right",
		5,
		"military_end_event_survival_03_left",
		5,
		"military_end_event_survival_03_middle",
		3,
		"military_end_event_survival_03_back",
		5,
	},
	military_end_event_survival_04 = {
		"military_end_event_survival_04_right",
		5,
		"military_end_event_survival_04_left",
		5,
		"military_end_event_survival_04_middle",
		3,
		"military_end_event_survival_04_back",
		5,
	},
	military_end_event_survival_05 = {
		"military_end_event_survival_05_right",
		5,
		"military_end_event_survival_05_left",
		5,
		"military_end_event_survival_05_middle",
		3,
		"military_end_event_survival_05_back",
		5,
	},
}
local terror_event_blueprints = {
	military_pvp_pacing_off = {
		{
			"control_hordes",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"control_pacing",
			enable = false,
		},
	},
	military_pvp_pacing_on = {
		{
			"control_hordes",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	military_courtyard_event_start = {
		{
			"control_hordes",
			enable = false,
		},
	},
	military_courtyard_event = {
		{
			"control_hordes",
			enable = false,
		},
		{
			"set_master_event_running",
			name = "military_courtyard",
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
			spawner_id = "courtyard_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 5 and count_event_breed("chaos_fanatic") < 6 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_military_courtyard_plague_monks",
			limit_spawners = 2,
			spawner_id = "courtyard_hidden",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 5 and count_event_breed("chaos_fanatic") < 6 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_courtyard_event_done",
		},
	},
	military_courtyard_event_end = {
		{
			"control_pacing",
			enable = true,
		},
	},
	military_temple_guards = {
		{
			"disable_kick",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "temple_guards02",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder_with_shield",
			spawner_id = "temple_guards05",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "temple_guards06",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder_with_shield",
			spawner_id = "temple_guards07",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "temple_guards09",
		},
	},
	military_end_event_disable_pacing = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	military_end_event_survival_start = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"disable_kick",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "end_event_start",
		},
		{
			"event_horde",
			composition_type = "storm_vermin_small",
			spawner_id = "end_event_start",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_start_done",
		},
	},
	military_end_event_survival_01_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "end_event_back",
		},
		{
			"event_horde",
			composition_type = "military_end_event_chaos_01",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4 and count_event_breed("chaos_warrior") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_01_done",
		},
	},
	military_end_event_survival_01_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "end_event_right",
		},
		{
			"event_horde",
			composition_type = "military_end_event_chaos_01",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_01_done",
		},
	},
	military_end_event_survival_02_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "end_event_left",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "military_end_event_chaos_01",
			limit_spawners = 2,
			spawner_id = "end_event_left_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done",
		},
	},
	military_end_event_survival_02_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "end_event_right",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "military_end_event_chaos_01",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors_small",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4 and count_event_breed("chaos_warrior") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done",
		},
	},
	military_end_event_survival_02_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "military_end_event_chaos_01",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done",
		},
	},
	military_end_event_survival_02_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "end_event_back",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "military_end_event_chaos_01",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_02_done",
		},
	},
	military_end_event_survival_03_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 4,
			spawner_id = "end_event_left_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "end_event_left",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done",
		},
	},
	military_end_event_survival_03_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 4,
			spawner_id = "end_event_right",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "end_event_right",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done",
		},
	},
	military_end_event_survival_03_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "end_event_middle",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done",
		},
	},
	military_end_event_survival_03_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 4,
			spawner_id = "end_event_back",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "end_event_back",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_03_done",
		},
	},
	military_end_event_survival_04_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "military_end_event_berzerkers",
			limit_spawners = 4,
			spawner_id = "end_event_left_hidden",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "end_event_left",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done",
		},
	},
	military_end_event_survival_04_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "military_end_event_berzerkers",
			limit_spawners = 4,
			spawner_id = "end_event_right_hidden",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "end_event_right",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done",
		},
	},
	military_end_event_survival_04_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "military_end_event_berzerkers",
			limit_spawners = 4,
			spawner_id = "end_event_back_hidden",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "end_event_middle",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done",
		},
	},
	military_end_event_survival_04_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "military_end_event_berzerkers",
			limit_spawners = 4,
			spawner_id = "end_event_back_hidden",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "end_event_back",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_04_done",
		},
	},
	military_end_event_survival_05_left = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "end_event_left",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 1,
			spawner_id = "end_event_left",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 2,
			spawner_id = "end_event_left_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done",
		},
	},
	military_end_event_survival_05_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "end_event_right",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 1,
			spawner_id = "end_event_right",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done",
		},
	},
	military_end_event_survival_05_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 1,
			spawner_id = "end_event_middle",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done",
		},
	},
	military_end_event_survival_05_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "end_event_back",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 1,
			spawner_id = "end_event_back",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_05_done",
		},
	},
	military_end_event_survival_06_right = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "end_event_right",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "end_event_right_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done",
		},
	},
	military_end_event_survival_06_middle = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "end_event_middle",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done",
		},
	},
	military_end_event_survival_06_back = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "end_event_back",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "end_event_back_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_06_done",
		},
	},
	military_end_event_survival_escape = {
		{
			"set_master_event_running",
			name = "military_end_event_survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "end_event_start",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "military_end_event_survival_escape_done",
		},
	},
	military_benchmark_cut_1 = {
		{
			"run_benchmark_func",
			duration = 2,
			func_name = "recycler_spawn_at",
			position = {
				122.242,
				120.009,
				-13.67,
			},
		},
	},
	military_benchmark_cut_2 = {
		{
			"run_benchmark_func",
			duration = 2,
			func_name = "recycler_spawn_at",
			position = {
				134.609,
				72.881,
				-11.826,
			},
		},
	},
	military_benchmark_cut_3 = {
		{
			"run_benchmark_func",
			duration = 2,
			func_name = "recycler_spawn_at",
			position = {
				149.89,
				26.701,
				59.579,
			},
		},
	},
	military_benchmark_cut_4 = {
		{
			"run_benchmark_func",
			duration = 2,
			func_name = "recycler_spawn_at",
			position = {
				96.911,
				46.139,
				67.782,
			},
		},
	},
	military_benchmark_cut_5 = {
		{
			"run_benchmark_func",
			duration = 2,
			func_name = "recycler_spawn_at",
			position = {
				-78.803,
				-76.952,
				66.482,
			},
		},
	},
	military_benchmark_cut_6 = {
		{
			"run_benchmark_func",
			duration = 2,
			func_name = "recycler_spawn_at",
			position = {
				-131.688,
				-85.017,
				66.583,
			},
		},
	},
	military_benchmark_troll_sound = {
		{
			"run_benchmark_func",
			func_name = "story_troll_sound",
		},
	},
	military_benchmark_1 = {
		{
			"run_benchmark_func",
			func_name = "story_teleport_party",
			portal_id = "benchmark_fight1",
		},
		{
			"delay",
			duration = 0.3,
		},
		{
			"event_horde",
			composition_type = "ai_benchmark_cycle_stormvermin",
			spawner_id = "benchmark_1_2",
		},
		{
			"delay",
			duration = 0.2,
		},
		{
			"event_horde",
			composition_type = "ai_benchmark_cycle_chaos_berzerker",
			spawner_id = "benchmark_1_3",
		},
		{
			"delay",
			duration = 0.2,
		},
		{
			"event_horde",
			composition_type = "ai_benchmark_cycle_slaves",
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 30,
		},
		{
			"run_benchmark_func",
			func_name = "story_destroy_close_units",
			radius_squared = 900,
		},
		{
			"run_benchmark_func",
			func_name = "story_teleport_party",
			portal_id = "Start",
		},
	},
	military_benchmark_2 = {
		{
			"run_benchmark_func",
			func_name = "story_teleport_party",
			portal_id = "benchmark_fight2",
		},
		{
			"event_horde",
			composition_type = "ai_benchmark_cycle_plague_monks",
			spawner_id = "benchmark_2_2",
		},
		{
			"delay",
			duration = 0.5,
		},
		{
			"delay",
			duration = 0.5,
		},
		{
			"event_horde",
			composition_type = "ai_benchmark_cycle_chaos_marauder",
			spawner_id = "benchmark_2_3",
		},
		{
			"delay",
			duration = 0.5,
		},
		{
			"event_horde",
			composition_type = "ai_benchmark_cycle_slaves",
			spawner_id = "benchmark_2_4",
		},
		{
			"delay",
			duration = 30,
		},
		{
			"run_benchmark_func",
			func_name = "story_destroy_close_units",
			radius_squared = 900,
		},
		{
			"run_benchmark_func",
			func_name = "story_teleport_party",
			portal_id = "Start",
		},
	},
	military_benchmark_troll = {
		{
			"run_benchmark_func",
			ai_node_id = "benchmark_troll",
			func_name = "story_spawn_and_animate_troll",
		},
	},
	military_benchmark_end = {
		{
			"run_benchmark_func",
			func_name = "story_end_benchmark",
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
