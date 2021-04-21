local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local terror_event_blueprints = {
	pat_tower_1_terror_event = {
		{
			"set_master_event_running",
			name = "pat_tower_1_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "terror_library_12oc_bridge",
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
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 4
			end
		},
		{
			"event_horde",
			spawner_id = "terror_library_9oc_door",
			composition_type = "event_chaos_extra_spice_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 4
			end
		},
		{
			"event_horde",
			spawner_id = "terror_library_3oc_ledge",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier"
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
			duration = 2
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_tower_1_arena_survival_done"
		}
	},
	pat_tower_2_terror_event = {
		{
			"set_master_event_running",
			name = "pat_tower_2_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "terror_library_3oc_ledge",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier"
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
			duration = 2
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			spawner_id = "terror_library_12oc_bridge",
			composition_type = "chaos_event_defensive"
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
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_tower_2_arena_survival_done"
		}
	},
	pat_tower_3_terror_event = {
		{
			"set_master_event_running",
			name = "pat_tower_3_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "terror_library_9oc_door",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_special",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_special",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
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
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_tower_3_arena_survival_done"
		}
	},
	pat_tower_4_terror_event = {
		{
			"set_master_event_running",
			name = "pat_tower_4_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "terror_event_path4_11oc_climb",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "terror_event_path4_6oc_climb",
			composition_type = "event_medium_shield"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"spawn_special",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_special",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			spawner_id = "terror_event_path4_3oc_bridge",
			composition_type = "event_medium_chaos"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_tower_4_arena_survival_done"
		}
	},
	pat_tower_5_terror_event = {
		{
			"set_master_event_running",
			name = "pat_tower_5_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "terror_library_9oc_door",
			composition_type = "event_chaos_extra_spice_medium"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			spawner_id = "terror_library_12oc_bridge",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"spawn_special",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_special",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			spawner_id = "terror_library_3oc_ledge",
			composition_type = "event_medium"
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_tower_5_arena_survival_done"
		}
	}
}

return terror_event_blueprints
