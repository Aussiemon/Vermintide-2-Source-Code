-- chunkname: @scripts/settings/terror_events/terror_events_dlc_dwarf_beacons.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_enemies()

	return #spawned_enemies
end

local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local weighted_random_terror_events
local terror_event_blueprints = {
	dwarf_disable_pacing = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	dwarf_enable_pacing = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	dwarf_beacons_gate_part1 = {
		{
			"set_master_event_running",
			name = "beacons_gate",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "gate_currentside",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "gate_currentside",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				5,
				6,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_otherside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_otherside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_otherside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
	},
	dwarf_beacons_gate_part2 = {
		{
			"set_master_event_running",
			name = "beacons_gate",
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
			composition_type = "event_large",
			spawner_id = "gate_otherside",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_otherside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "gate_currentside",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "gate_otherside",
		},
		{
			"delay",
			duration = {
				5,
				6,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	dwarf_beacons_gate_part3 = {
		{
			"set_master_event_running",
			name = "beacons_gate",
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
			composition_type = "event_large",
			spawner_id = "gate_otherside",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_otherside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "gate_currentside",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "gate_otherside",
		},
		{
			"delay",
			duration = {
				5,
				6,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "gate_currentside",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	dwarf_beacons_beacon = {
		{
			"set_master_event_running",
			name = "beacons_beacon",
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
			composition_type = "event_medium",
			spawner_id = "beacon",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"spawn",
			{
				1,
				2,
			},
			breed_name = "skaven_poison_wind_globadier",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "beacon",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"spawn",
			{
				1,
			},
			breed_name = "skaven_ratling_gunner",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				5,
				6,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn",
			{
				1,
				2,
			},
			breed_name = "skaven_poison_wind_globadier",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "beacon",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
	},
	dwarf_beacons_skaven_horde = {
		{
			"set_master_event_running",
			name = "beacons_skaven_horde",
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
			spawner_id = "beacon",
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_special_spawners",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARD,
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_special_spawners",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 8,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "beacon",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_slave") < 10 and count_event_breed("skaven_clan_rat") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "beacon",
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_special_spawners",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARD,
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_special_spawners",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDER,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_slave") < 10 and count_event_breed("skaven_clan_rat") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 3,
			spawner_id = "beacon",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
			difficulty_requirement = HARDEST,
		},
		{
			"flow_event",
			flow_event_name = "beacons_skaven_horde_done",
		},
	},
	dwarf_beacons_barrier = {
		{
			"set_master_event_running",
			name = "beacons_barrier",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "beacon_barrier",
		},
	},
	dwarf_beacons_horde_fleeing = {
		{
			"set_master_event_running",
			name = "beacon_horde_fleeing",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "beacon_horde_fleeing",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "beacon_horde_small_done",
		},
	},
}

return terror_event_blueprints
