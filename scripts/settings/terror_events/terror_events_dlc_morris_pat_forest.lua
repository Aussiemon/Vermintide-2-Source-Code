local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local HARDER = 4
local terror_event_blueprints = {
	forest5_terror1 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "forest5_terror1"
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
			spawner_id = "forest5_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "forest5_terror1_spawn2",
			composition_type = "crater_detour"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest5_terror1_spawn2",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "forest5_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
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
			spawner_id = "forest5_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "forest5_terror1_spawn2",
			minimum_difficulty_tweak = -5,
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll"
			}
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "forest5_terror1_spawn2",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "forest5_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "forest5_terror1_spawn2",
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
			flow_event_name = "forest5_terror1_done"
		}
	},
	forest4_terror1 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "forest4_terror1"
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
			spawner_id = "forest4_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "forest4_terror1_spawn2",
			composition_type = "crater_detour"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest4_terror1_spawn2",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "forest4_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
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
			spawner_id = "forest4_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "forest4_terror1_spawn2",
			minimum_difficulty_tweak = -5,
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll"
			}
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "forest4_terror1_spawn2",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "forest4_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "forest4_terror1_spawn2",
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
			flow_event_name = "forest4_terror1_done"
		}
	},
	forest3_terror1 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "forest3_terror1"
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
			spawner_id = "forest3_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "forest3_terror1_spawn2",
			composition_type = "crater_detour"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest3_terror1_spawn2",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "forest3_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
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
			spawner_id = "forest3_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "forest3_terror1_spawn2",
			minimum_difficulty_tweak = -5,
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll"
			}
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "forest3_terror1_spawn2",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "forest3_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "forest3_terror1_spawn2",
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
			flow_event_name = "forest3_terror1_done"
		}
	},
	forest2_terror1 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "forest2_terror1"
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
			spawner_id = "forest2_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "forest2_terror1_spawn2",
			composition_type = "crater_detour"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest2_terror1_spawn2",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "forest2_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
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
			spawner_id = "forest2_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "forest2_terror1_spawn2",
			minimum_difficulty_tweak = -5,
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll"
			}
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "forest2_terror1_spawn2",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "forest2_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "forest2_terror1_spawn2",
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
			flow_event_name = "forest2_terror1_done"
		}
	},
	forest1_terror1 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "forest1_terror1"
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
			spawner_id = "forest1_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "forest1_terror1_spawn2",
			composition_type = "crater_detour"
		},
		{
			"spawn_at_raw",
			spawner_id = "forest1_terror1_spawn2",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "forest1_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
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
			spawner_id = "forest1_terror1_spawn1",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "forest1_terror1_spawn2",
			minimum_difficulty_tweak = -5,
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll"
			}
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "forest1_terror1_spawn2",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "forest1_terror1_spawn2",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "forest1_terror1_spawn2",
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
			flow_event_name = "forest1_terror1_done"
		}
	}
}

return terror_event_blueprints
