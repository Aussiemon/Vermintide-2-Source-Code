-- chunkname: @scripts/settings/terror_events/terror_events_dlc_termite_1.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local NORMAL = 1
local HARD = 2
local HARDER = 3
local HARDEST = 4
local CATACLYSM = 5
local terror_event_blueprints = {
	termite_01_pacing_off = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	termite_01_pacing_on = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	termite_01_detour = {
		{
			"set_master_event_running",
			name = "termite_01_detour",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 50,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			spawner_id = "detour_spawner",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "termite_01_detour_done",
		},
	},
	termite_01_end_event_01 = {
		{
			"set_master_event_running",
			name = "termite_01_end_event_01",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "end_event_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			spawner_id = "end_event_01_plagues",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_plague_monk") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "termite_01_end_event_01_done",
		},
	},
	termite_01_end_event_trickle = {
		{
			"set_master_event_running",
			name = "termite_01_end_event_trickle",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 30,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "end_event_trickle",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"flow_event",
			flow_event_name = "termite_01_end_event_trickle_done",
		},
	},
	termite_01_end_event_left = {
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "end_event_left",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "end_event_left",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "termite_01_end_event_left_done",
		},
	},
	termite_01_end_event_left_extras = {
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "end_event_left_extras",
			difficulty_requirement = NORMAL,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARD,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			spawner_id = "end_event_left_extras",
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "end_event_left_extras",
			difficulty_requirement = CATACLYSM,
		},
	},
	termite_01_end_event_right = {
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "end_event_right",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "end_event_right",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "termite_01_end_event_right_done",
		},
	},
	termite_01_end_event_right_extras = {
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "end_event_right_extras",
			difficulty_requirement = NORMAL,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARD,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_small",
			spawner_id = "end_event_right_extras",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDER,
		},
	},
	termite_01_end_event_center = {
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			spawner_id = "end_event_center",
		},
	},
	termite_01_end_event_center_extras = {
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			spawner_id = "end_event_right_extras",
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
	},
	termite_01_end_event_manual_01 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "end_event_manual_01",
		},
	},
	termite_01_end_event_manual_ratling_01 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "end_event_manual_ratling_01",
		},
	},
	termite_01_end_event_manual_02 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "end_event_manual_02",
		},
	},
	termite_01_end_event_manual_03 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "end_event_manual_03",
		},
	},
	termite_01_end_event_stormfiend = {
		{
			"spawn_at_raw",
			breed_name = "skaven_stormfiend",
			spawner_id = "end_event_stormfiend",
		},
	},
}

return terror_event_blueprints
