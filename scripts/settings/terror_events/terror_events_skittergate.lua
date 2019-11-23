local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local weighted_random_terror_events = nil
local terror_event_blueprints = {
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
			duration = 120,
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
			"set_time_challenge",
			time_challenge_name = "skittergate_speed_event_cata"
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
			"has_completed_time_challenge",
			time_challenge_name = "skittergate_speed_event_cata"
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
	}
}

return terror_event_blueprints, weighted_random_terror_events
