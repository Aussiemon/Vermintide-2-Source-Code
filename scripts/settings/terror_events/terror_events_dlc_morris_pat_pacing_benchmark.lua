local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local terror_event_blueprints = {
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
				"skaven_stormfiend"
			}
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
