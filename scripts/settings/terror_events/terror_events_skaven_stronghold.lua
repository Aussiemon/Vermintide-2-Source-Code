-- chunkname: @scripts/settings/terror_events/terror_events_skaven_stronghold.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local terror_event_blueprints = {
	stronghold_pacing_off = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	stronghold_pacing_on = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	stronghold_horde_water_wheels = {
		{
			"set_master_event_running",
			name = "stronghold_horde_water_wheels",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "stronghold_horde_water_wheels",
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
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "stronghold_horde_water_wheels_done",
		},
	},
	stronghold_boss = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"disable_kick",
		},
		{
			"set_master_event_running",
			name = "stronghold_boss",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_warlord",
			spawner_id = "stronghold_boss",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_warlord") == 1
			end,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_warlord") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "stronghold_boss_killed",
		},
	},
}

return {
	terror_event_blueprints,
}
