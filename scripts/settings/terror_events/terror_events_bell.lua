-- chunkname: @scripts/settings/terror_events/terror_events_bell.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local HARDER = TerrorEventUtils.HARDER
local HARDEST = TerrorEventUtils.HARDEST
local CATACLYSM = TerrorEventUtils.CATACLYSM
local terror_event_blueprints = {
	canyon_bell_event = {
		{
			"set_master_event_running",
			name = "canyon_bell_event",
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"control_pacing",
			enable = false,
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
			composition_type = "event_small",
			spawner_id = "canyon_bell_event_horde",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "canyon_bell_event",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "canyon_bell_event_horde",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 3,
			spawner_id = "canyon_bell_event",
			difficulty_requirement = CATACLYSM,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5
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
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = CATACLYSM,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "canyon_bell_event",
			difficulty_requirement = CATACLYSM,
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
			composition_type = "event_small",
			spawner_id = "canyon_escape_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_clan_rat") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "canyon_escape_event_done",
		},
	},
	canyon_escape_event_start = {
		{
			"set_time_challenge",
			time_challenge_name = "bell_speed_event",
		},
		{
			"set_time_challenge",
			time_challenge_name = "bell_speed_event_cata",
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

return {
	terror_event_blueprints,
}
