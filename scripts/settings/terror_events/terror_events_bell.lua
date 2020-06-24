local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events = nil
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local terror_event_blueprints = {
	canyon_bell_event = {
		{
			"set_master_event_running",
			name = "canyon_bell_event"
		},
		{
			"control_specials",
			enable = false
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_time_challenge",
			time_challenge_name = "bell_speed_event"
		},
		{
			"set_time_challenge",
			time_challenge_name = "bell_speed_event_cata"
		},
		{
			"disable_kick"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "canyon_bell_event_horde",
			composition_type = "event_small"
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner"
			},
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "canyon_bell_event",
			composition_type = "event_extra_spice_medium",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "canyon_bell_event_horde",
			composition_type = "event_small"
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner"
			},
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "canyon_bell_event",
			composition_type = "plague_monks_small",
			difficulty_requirement = CATACLYSM
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "canyon_bell_event_done"
		}
	},
	canyon_ogre_boss = {
		{
			"spawn_at_raw",
			spawner_id = "canyon_ogre_boss",
			breed_name = "skaven_rat_ogre"
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "canyon_bell_event",
			composition_type = "event_extra_spice_medium",
			difficulty_requirement = CATACLYSM
		}
	},
	canyon_escape_event = {
		{
			"set_master_event_running",
			name = "canyon_escape_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "canyon_escape_event",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "canyon_escape_event_done"
		}
	},
	canyon_escape_event_completion_check = {
		{
			"has_completed_time_challenge",
			time_challenge_name = "bell_speed_event"
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "bell_speed_event_cata"
		}
	}
}

return terror_event_blueprints, weighted_random_terror_events
