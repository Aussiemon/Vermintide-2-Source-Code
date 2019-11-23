local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events = {
	cemetery_plague_brew_event_1 = {
		"cemetery_plague_brew_event_1_a",
		1,
		"cemetery_plague_brew_event_1_b",
		1
	},
	cemetery_plague_brew_event_2 = {
		"cemetery_plague_brew_event_2_a",
		1,
		"cemetery_plague_brew_event_2_b",
		1
	},
	cemetery_plague_brew_event_3 = {
		"cemetery_plague_brew_event_3_a",
		1,
		"cemetery_plague_brew_event_3_b",
		1
	},
	cemetery_plague_brew_event_4 = {
		"cemetery_plague_brew_event_4_a",
		1,
		"cemetery_plague_brew_event_4_b",
		1
	}
}
local terror_event_blueprints = {
	cemetery_plague_brew_event_1_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_shields_small"
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_1_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_2_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_special",
			breed_name = "chaos_vortex_sorcerer",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_2_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_special",
			breed_name = "chaos_vortex_sorcerer",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_3_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_special",
			breed_name = "skaven_warpfire_thrower",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		}
	},
	cemetery_plague_brew_event_3_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = {
				3,
				5
			}
		},
		{
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			amount = {
				1,
				2
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		},
		{
			"delay",
			duration = {
				8,
				10
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "cemetery_brew_event_specials",
			composition_type = "storm_vermin_shields_small"
		},
		{
			"delay",
			duration = 5
		}
	},
	cemetery_plague_brew_event_4_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		}
	},
	cemetery_plague_brew_event_4_b = {
		{
			"control_pacing",
			enable = false
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium"
		}
	},
	cemetery_plague_brew_exit_event = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "cemetery_brew_event_chaos",
			composition_type = "chaos_shields"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "cemetery_brew_event_chaos",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end
		},
		{
			"control_pacing",
			enable = true
		}
	}
}

return terror_event_blueprints, weighted_random_terror_events
