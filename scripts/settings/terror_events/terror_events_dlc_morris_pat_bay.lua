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
local terror_event_blueprints = {
	pat_bay_boat_arena = {
		{
			"set_master_event_running",
			name = "pat_bay_boat_arena"
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
			duration = 3
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
			spawner_id = "pat_bay_boat_arena_2_oclock_ledge",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "pat_bay_boat_arena_11_oclock_wall_climb",
			composition_type = "event_small"
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
			"event_horde",
			spawner_id = "pat_bay_boat_arena_4_oclock_ledge",
			composition_type = "event_small"
		},
		{
			"event_horde",
			spawner_id = "pat_bay_boat_arena_6_oclock_ledge",
			composition_type = "event_extra_spice_medium"
		},
		{
			"event_horde",
			spawner_id = "pat_bay_boat_arena_8_oclock_wall_climb",
			composition_type = "event_small"
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
			"event_horde",
			spawner_id = "pat_bay_boat_arena_12_oclock",
			composition_type = "event_large_chaos"
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
			"spawn_at_raw",
			spawner_id = "pat_bay_boat_arena_12_oclock_manual",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"event_horde",
			spawner_id = "pat_bay_boat_arena_12_oclock",
			composition_type = "event_chaos_extra_spice_medium"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 1 or count_event_breed("skaven_stormfiend") == 1 or count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_stormfiend") < 1 and count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "pat_bay_boat_arena_dead"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	pat_bay_boss_arena = {
		{
			"set_master_event_running",
			name = "pat_bay_boss_arena"
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
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "pat_bay_boss_arena_10_oclock_manual",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"event_horde",
			spawner_id = "pat_bay_boss_arena_7_oclock_climb_boat",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 1 or count_event_breed("skaven_stormfiend") == 1 or count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_stormfiend") < 1 and count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "pat_bay_boss_arena_dead"
		},
		{
			"control_pacing",
			enable = true
		}
	}
}

return terror_event_blueprints
