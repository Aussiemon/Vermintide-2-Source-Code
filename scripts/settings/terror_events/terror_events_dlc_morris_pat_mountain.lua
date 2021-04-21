local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local weighted_random_terror_events = nil
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local terror_event_blueprints = {
	mountain_cavern_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "mountain_cavern_event"
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
			spawner_id = "mountain_cavern_event",
			composition_type = "event_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "mountain_cavern_event",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "mountain_cavern_event",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
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
			spawner_id = "mountain_cavern_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "mountain_cavern_event",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mountain_cavern_event",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "mountain_cavern_event",
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
			flow_event_name = "mountain_cavern_event_done"
		}
	},
	mountain1_end_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "mountain1_end_event"
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
			spawner_id = "mountain1_end_event",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() <= 25
			end
		},
		{
			"delay",
			duration = 7
		},
		{
			"event_horde",
			spawner_id = "mountain1_end_event",
			composition_type = "event_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "mountain1_end_event",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_at_raw",
			spawner_id = "mountain1_end_event",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "mountain1_end_event",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mountain1_end_event",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
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
			spawner_id = "mountain1_end_event",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "mountain1_end_event",
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
			spawner_id = "mountain1_end_event",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "mountain1_end_event",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mountain1_end_event",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mountain1_end_event",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "mountain1_end_event",
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
			flow_event_name = "mountain1_end_event_done"
		}
	}
}

return terror_event_blueprints
