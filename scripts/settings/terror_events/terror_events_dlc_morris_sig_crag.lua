local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local weighted_random_terror_events = {
	sig_crag_terror_street = {
		"sig_crag_terror_street_a",
		8,
		"nothing",
		2
	},
	sig_crag_terror_street2 = {
		"sig_crag_terror_street2_a",
		8,
		"nothing",
		2
	},
	sig_crag_terror_street3 = {
		"sig_crag_terror_street3_a",
		8,
		"nothing",
		2
	},
	sig_crag_terror_top = {
		"sig_crag_terror_top_a",
		8,
		"nothing",
		2
	},
	sig_crag_terror_bottom = {
		"sig_crag_terror_bottom_a",
		8,
		"nothing",
		2
	},
	sig_crag_terror_castle = {
		"sig_crag_terror_castle_a",
		8,
		"nothing",
		2
	}
}
local terror_event_blueprints = {
	nothing = {
		{
			"set_master_event_running",
			name = "nothing"
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"delay",
			duration = 10
		},
		{
			"flow_event",
			flow_event_name = "nothing_end"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	sig_crag_terror_street_a = {
		{
			"set_master_event_running",
			name = "sig_crag_terror_street"
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
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
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_street_11oc_climb",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_street_3oc_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_street_12oc",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 5
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
			flow_event_name = "sig_crag_terror_street_end"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	sig_crag_terror_street2_a = {
		{
			"set_master_event_running",
			name = "sig_crag_terror_street"
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
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
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_street2_1oc_climb",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_street2_9oc_ledge",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_street2_3oc",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 5
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
			flow_event_name = "sig_crag_terror_street_end"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	sig_crag_terror_street3_a = {
		{
			"set_master_event_running",
			name = "sig_crag_terror_street"
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
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
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_street2_1oc_climb",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_street2_9oc_ledge",
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
				return num_spawned_enemies() < 20
			end
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 5
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
			flow_event_name = "sig_crag_terror_street_end"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	sig_crag_terror_top_a = {
		{
			"set_master_event_running",
			name = "sig_crag_terror_top"
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
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
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_top_ledge",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_top_3oc",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 5
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
			flow_event_name = "sig_crag_terror_street_end"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	sig_crag_terror_bottom_a = {
		{
			"set_master_event_running",
			name = "sig_crag_terror_bottom"
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
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
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_bottom_12oc_ledge",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_bottom_3oc_ledge",
			composition_type = "event_small"
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_bottom_6oc_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_top_3oc",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 5
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
			flow_event_name = "sig_crag_terror_street_end"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	sig_crag_terror_castle_a = {
		{
			"set_master_event_running",
			name = "sig_crag_terror_bottom"
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
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
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_castle_12oc_ledge",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "sig_crag_terror_castle_6oc",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 5
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
			flow_event_name = "sig_crag_terror_street_end"
		},
		{
			"control_pacing",
			enable = true
		}
	}
}

return terror_event_blueprints, weighted_random_terror_events
