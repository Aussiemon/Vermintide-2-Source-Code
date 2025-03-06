-- chunkname: @scripts/settings/terror_events/terror_events_dwarf_exterior_pvp.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local spawned_during_event = TerrorEventUtils.spawned_during_event
local terror_event_blueprints = {
	dwarf_exterior_disable_pacing = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_hordes",
			enable = false,
		},
	},
	dwarf_exterior_enable_pacing = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_hordes",
			enable = true,
		},
	},
	dwarf_exterior_courtyard_event_start = {
		{
			"control_hordes",
			enable = false,
		},
	},
	dwarf_exterior_courtyard_event_01 = {
		{
			"control_hordes",
			enable = false,
		},
		{
			"set_master_event_running",
			name = "dwarf_exterior_courtyard",
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
			composition_type = "event_smaller",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return spawned_during_event() < 8
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 8,
			spawner_id = "courtyard_hidden",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
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
				return spawned_during_event() < 10
			end,
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
			spawner_id = "courtyard_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 2,
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
				return spawned_during_event() < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_courtyard_event_done",
		},
	},
	dwarf_exterior_courtyard_event_02 = {
		{
			"control_hordes",
			enable = false,
		},
		{
			"set_master_event_running",
			name = "dwarf_exterior_courtyard",
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
			composition_type = "event_smaller",
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
				return spawned_during_event() < 8
			end,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "courtyard",
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
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return spawned_during_event() < 6
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 2,
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
				return spawned_during_event() < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_courtyard_event_done",
		},
	},
	dwarf_exterior_courtyard_event_end = {
		{
			"control_pacing",
			enable = true,
		},
	},
	dwarf_exterior_temple_guards = {
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
	dwarf_exterior_chamber_guards = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chamber_guards01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chamber_guards02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chamber_guards03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chamber_guards04",
		},
	},
	dwarf_exterior_escape_guards = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards05",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards06",
		},
	},
	dwarf_exterior_end_event_survival_01 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 7 and count_event_breed("skaven_slave") < 8 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_01_done",
		},
	},
	dwarf_exterior_end_event_survival_02 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 4,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 7 and count_event_breed("skaven_slave") < 8 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_02_done",
		},
	},
	dwarf_exterior_end_event_survival_end = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 4,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_end_done",
		},
	},
	dwarf_exterior_end_event_survival_stop = {
		{
			"stop_event",
			stop_event_name = "dwarf_exterior_end_event_survival_01",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_exterior_end_event_survival_02",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_exterior_end_event_survival_end",
		},
	},
	dwarf_exterior_end_event_escape = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_escape",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_escape_done",
		},
	},
	dwarf_exterior_end_event_escape_02 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_escape",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_escape_02_done",
		},
	},
	dwarf_exterior_end_event_start = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"disable_kick",
		},
		{
			"enable_bots_in_carry_event",
		},
	},
	dwarf_exterior_end_event_invasion = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_invasion",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "tunnel_invaders",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "tunnel_invaders",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_invasion_done",
		},
	},
	dwarf_water_boss = {
		{
			"spawn_at_raw",
			"skaven_stormfiend",
			"chaos_troll",
			"chaos_spawn",
			breed_name = "skaven_rat_ogre",
			spawner_id = "lake_manual",
		},
	},
	dwarf_exterior_end_event_guards = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_01b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_02b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_03b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_04b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_05",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_05b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_06",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_06b",
		},
	},
}

return {
	terror_event_blueprints,
}
