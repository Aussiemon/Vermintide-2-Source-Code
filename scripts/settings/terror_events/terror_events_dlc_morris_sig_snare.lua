local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local HARD = 3
local HARDER = 4
local CATACLYSM = 6
local terror_event_blueprints = {
	throneroom_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "throneroom_event"
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
			spawner_id = "throneroom_event_3oc",
			composition_type = "event_chaos_extra_spice_medium"
		},
		{
			"event_horde",
			spawner_id = "throneroom_event_9oc",
			composition_type = "event_small_chaos"
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
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "throneroom_event_3oc_manual",
			breed_name = {
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"delay",
			duration = 2
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
			spawner_id = "throneroom_event_3oc",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"spawn_special",
			breed_name = "skaven_pack_master",
			spawner_id = "throneroom_event_6oc_bridge",
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
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "throneroom_event_done"
		}
	},
	cavern_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "cavern_event"
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
			spawner_id = "cavern_event_3oc",
			composition_type = "event_medium_chaos"
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
			"delay",
			duration = 7
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 2
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
			spawner_id = "cavern_event_12oc",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_special",
			spawner_id = "cavern_event_6oc",
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner"
			}
		},
		{
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "cavern_event_3oc",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "cavern_event_6oc_manual",
			minimum_difficulty_tweak = -5,
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll"
			},
			difficulty_requirement = HARD
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
			flow_event_name = "cavern_event_done"
		}
	},
	camp_arena_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "camp_arena_event"
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
			spawner_id = "camp_arena_event_12oc",
			composition_type = "event_chaos_extra_spice_medium"
		},
		{
			"event_horde",
			spawner_id = "camp_arena_event_3oc",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 15
		},
		{
			"spawn_at_raw",
			spawner_id = "camp_arena_event_3oc_manual",
			breed_name = {
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end
		},
		{
			"delay",
			duration = 15
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
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"delay",
			duration = 2
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
			spawner_id = "camp_arena_event_3oc",
			composition_type = "event_medium_shield"
		},
		{
			"event_horde",
			spawner_id = "camp_arena_event_12oc",
			composition_type = "event_extra_spice_small"
		},
		{
			"delay",
			duration = 7
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			}
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = CATACLYSM
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
			flow_event_name = "camp_arena_event_done"
		}
	},
	keep_courtyard_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "keep_courtyard_event"
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
			spawner_id = "keep_courtyard_event_2oc_towerclimb",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "keep_courtyard_event_12oc_ledge",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			}
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner"
			}
		},
		{
			"delay",
			duration = 2
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
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
			spawner_id = "keep_courtyard_event_6oc",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "keep_courtyard_event_1oc",
			composition_type = "chaos_shields"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "keep_courtyard_event_1oc",
			composition_type = "chaos_berzerkers_small"
		},
		{
			"delay",
			duration = 2
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
			flow_event_name = "keep_courtyard_event_done"
		}
	},
	street_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "street_event"
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
			spawner_id = "street_event_11oc",
			composition_type = "event_small_chaos"
		},
		{
			"event_horde",
			spawner_id = "street_event_3oc",
			composition_type = "event_small_chaos"
		},
		{
			"event_horde",
			spawner_id = "street_event_9oc",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 7
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
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "street_event_3oc_manual",
			breed_name = {
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end
		},
		{
			"delay",
			duration = 15
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
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"delay",
			duration = 2
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
			flow_event_name = "street_event_done"
		}
	}
}

return terror_event_blueprints
