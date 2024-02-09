-- chunkname: @scripts/settings/terror_events/terror_events_carousel_test_range.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events
local HARDEST = 5
local CATACLYSM = 6
local terror_event_blueprints = {
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
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "canyon_ogre_boss",
		},
	},
	bell_event_two = {
		{
			"set_master_event_running",
			name = "military_courtyard",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_military_courtyard_plague_monks",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 8,
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
	bell_pvp_event_su01_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_medium_shield",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
		},
	},
	bell_pvp_event_su01_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_medium_shield",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su01_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su01_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_extra_spice_small",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su02_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_extra_spice_large",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su02_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su02_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_medium",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_medium",
			limit_spawners = 2,
		},
	},
	bell_pvp_event_su02_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_medium",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			limit_spawners = 1,
		},
	},
	bell_pvp_event_su03_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 1,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			limit_spawners = 1,
		},
	},
	bell_pvp_event_su03_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_medium_shield",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 6,
		},
	},
	bell_pvp_event_su03_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su03_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su04_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			limit_spawners = 1,
		},
	},
	bell_pvp_event_su04_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_medium",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_medium",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 2,
		},
	},
	bell_pvp_event_su04_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su04_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "plague_monks_medium",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su05_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "plague_monks_medium",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su05_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "chaos_raiders_medium",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			limit_spawners = 2,
		},
	},
	bell_pvp_event_su05_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_medium_shield",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 6,
		},
	},
	bell_pvp_event_su05_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su06_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
	},
	bell_pvp_event_su06_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			limit_spawners = 6,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 6,
		},
	},
	bell_pvp_event_su06_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_medium",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			limit_spawners = 2,
		},
	},
	bell_pvp_event_su06_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "chaos_raiders_medium",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			limit_spawners = 2,
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
