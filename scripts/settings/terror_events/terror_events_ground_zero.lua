-- chunkname: @scripts/settings/terror_events/terror_events_ground_zero.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local HARD = TerrorEventUtils.HARD
local HARDER = TerrorEventUtils.HARDER
local weighted_random_terror_events = {
	gz_elevator_guards = {
		"gz_elevator_guards_a",
		1,
	},
}
local terror_event_blueprints = {
	generic_disable_specials = GenericTerrorEvents.generic_disable_specials,
	generic_disable_pacing = GenericTerrorEvents.generic_disable_pacing,
	gz_chaos_boss = {
		{
			"set_master_event_running",
			name = "gz_chaos_boss",
		},
		{
			"disable_kick",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_exalted_sorcerer",
			spawner_id = "warcamp_chaos_boss",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_sorcerer") == 1
			end,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_exalted_sorcerer") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "gz_chaos_boss_dead",
		},
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	gz_elevator_guards_a = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "ele_guard_a_1",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "ele_guard_a_2",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "ele_guard_a_3",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "ele_guard_a_4",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "ele_guard_a_5",
			difficulty_requirement = HARD,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "ele_guard_a_6",
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "ele_guard_b_1",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "ele_guard_b_2",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "ele_guard_b_3",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "ele_guard_b_4",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "ele_guard_b_5",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "ele_guard_b_6",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "ele_guard_b_7",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "ele_guard_b_8",
		},
		{
			"delay",
			duration = 5,
		},
	},
}

return {
	terror_event_blueprints,
	weighted_random_terror_events,
}
