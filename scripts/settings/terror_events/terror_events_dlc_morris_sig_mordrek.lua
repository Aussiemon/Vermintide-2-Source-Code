local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local weighted_random_terror_events = nil
local terror_event_blueprints = {
	sig_mordrek_1_event = {
		{
			"set_master_event_running",
			name = "sig_mordrek_1"
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
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "terror_event_a",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "terror_event_special_a",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			spawner_id = "terror_event_b",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "terror_event_monster",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 1 or count_event_breed("skaven_stormfiend") == 1 or count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_stormfiend") < 1 and count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "sig_mordrek_1_event_done"
		}
	}
}

return terror_event_blueprints
