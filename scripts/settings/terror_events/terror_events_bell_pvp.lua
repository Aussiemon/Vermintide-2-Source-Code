-- chunkname: @scripts/settings/terror_events/terror_events_bell_pvp.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events
local HARDEST = 5
local CATACLYSM = 6
local terror_event_blueprints = {
	bell_pvp_pacing_off = {
		{
			"control_hordes",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"control_pacing",
			enable = false,
		},
	},
	bell_pvp_pacing_on = {
		{
			"control_hordes",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	bell_pvp_capzone_event_reinforcements_start = {
		{
			"set_master_event_running",
			name = "bell_pvp_capzone_event_reinforcements_start",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "bell_pvp_capzone_start",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "bell_pvp_capzone_event_reinforcements_start_done",
		},
	},
	bell_pvp_capzone_reinforcements = {
		{
			"set_master_event_running",
			name = "bell_pvp_capzone_reinforcements",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 30,
		},
		{
			"flow_event",
			flow_event_name = "bell_pvp_capzone_reinforcements_done",
		},
	},
	bell_pvp_payload_event_reinforcements_start = {
		{
			"set_master_event_running",
			name = "bell_pvp_payload_event_reinforcements_start",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "bell_pvp_payload_start",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "bell_pvp_payload_event_reinforcements_start_done",
		},
	},
	bell_pvp_payload_reinforcements = {
		{
			"set_master_event_running",
			name = "bell_pvp_payload_reinforcements",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 30,
		},
		{
			"flow_event",
			flow_event_name = "bell_pvp_payload_reinforcements_done",
		},
	},
	canyon_bell_event = {
		{
			"set_master_event_running",
			name = "canyon_bell_event",
		},
		{
			"set_time_challenge",
			time_challenge_name = "bell_speed_event",
		},
		{
			"set_time_challenge",
			time_challenge_name = "bell_speed_event_cata",
		},
		{
			"disable_kick",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "canyon_bell_event",
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "canyon_bell_event",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			spawner_id = "canyon_bell_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "canyon_bell_event_done",
		},
	},
	canyon_ogre_boss = {
		{
			"set_master_event_running",
			name = "canyon_ogre_boss",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_with_shield",
			spawner_id = "canyon_ogre_boss",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "canyon_bell_end_guards",
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "canyon_bell_end_elite_guards",
		},
	},
	canyon_escape_event = {
		{
			"set_master_event_running",
			name = "canyon_escape_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "canyon_escape_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"control_specials",
			enable = true,
		},
		{
			"control_pacing",
			enable = false,
		},
	},
	canyon_escape_event_completion_check = {
		{
			"has_completed_time_challenge",
			time_challenge_name = "bell_speed_event",
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "bell_speed_event_cata",
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
