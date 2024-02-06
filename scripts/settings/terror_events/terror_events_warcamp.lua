-- chunkname: @scripts/settings/terror_events/terror_events_warcamp.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events
local HARDER = 4
local HARDEST = 5
local terror_event_blueprints = {
	generic_disable_specials = GenericTerrorEvents.generic_disable_specials,
	generic_enable_specials = GenericTerrorEvents.generic_enable_specials,
	generic_disable_pacing = GenericTerrorEvents.generic_disable_pacing,
	generic_enable_pacing = GenericTerrorEvents.generic_enable_pacing,
	warcamp_payload = {
		{
			"set_master_event_running",
			name = "warcamp_payload",
		},
		{
			"control_pacing",
			enable = false,
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
			limit_spawners = 2,
			spawner_id = "payload_event_l",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 1,
			spawner_id = "payload_event_l",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_small",
			limit_spawners = 1,
			spawner_id = "payload_event_r",
		},
		{
			"delay",
			duration = 10,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_pack_master",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
			},
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_poison_wind_globadier",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 2,
			spawner_id = "payload_event_l",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 1,
			spawner_id = "payload_event_r",
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "payload_event_r",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 1,
			spawner_id = "payload_event_l",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "warcamp_payload",
		},
	},
	warcamp_chaos_boss = {
		{
			"set_master_event_running",
			name = "warcamp_chaos_boss",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_exalted_champion_warcamp",
			spawner_id = "warcamp_chaos_boss",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_exalted_champion_warcamp") == 1
			end,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_champion_warcamp") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "warcamp_chaos_boss_dead",
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	warcamp_door_guard = {
		{
			"disable_kick",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder_with_shield",
			spawner_id = "wc_shield_dude_1",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder_with_shield",
			spawner_id = "wc_shield_dude_2",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "wc_sword_dude_1",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "wc_sword_dude_2",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_raider",
			spawner_id = "wc_2h_dude_1",
		},
	},
	warcamp_camp = {
		{
			"set_master_event_running",
			name = "warcamp_camp",
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
			composition_type = "warcamp_inside_camp",
			limit_spawners = 2,
			spawner_id = "camp_event",
		},
		{
			"delay",
			duration = 3,
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "camp_event",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "camp_event",
		},
		{
			"flow_event",
			flow_event_name = "warcamp_camp_restart",
		},
	},
	warcamp_load_chaos_exalted_champion = {
		{
			"force_load_breed_package",
			breed_name = "chaos_exalted_champion_warcamp",
		},
	},
	warcamp_arena_chase = {
		{
			"set_master_event_running",
			name = "warcamp_chase",
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
			limit_spawners = 2,
			spawner_id = "arena_chase",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "warcamp_chase_restart",
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
