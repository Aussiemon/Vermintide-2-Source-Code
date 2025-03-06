-- chunkname: @scripts/settings/terror_events/terror_events_dlc_bogenhafen_slum.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local weighted_random_terror_events = {
	dlc_bogenhafen_slum_event_spice_random = {
		"dlc_bogenhafen_slum_event_spice_left",
		1,
		"dlc_bogenhafen_slum_event_spice_right",
		1,
	},
}
local terror_event_blueprints = {
	dlc_bogenhafen_slum_pacing_off = {
		{
			"control_specials",
			enable = false,
		},
		{
			"control_pacing",
			enable = false,
		},
	},
	dlc_bogenhafen_slum_pacing_on = {
		{
			"control_specials",
			enable = true,
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	dlc_bogenhafen_slum_event_pacing_off = {
		{
			"control_specials",
			enable = false,
		},
		{
			"control_pacing",
			enable = false,
		},
	},
	dlc_bogenhafen_slum_event_start = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_slum_event_start",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "bogenhafen_slum_event_front_mid_01",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder_with_shield") < 3 and count_event_breed("chaos_marauder") < 4
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_slum_event_start_done",
		},
	},
	dlc_bogenhafen_slum_event_loop = {
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
			composition_type = "event_small_chaos",
			spawner_id = "bogenhafen_slum_event_front_left_01",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			spawner_id = "bogenhafen_slum_event_front_mid_01",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "bogenhafen_slum_event_front_right_01",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder_with_shield") < 3 and count_event_breed("chaos_marauder") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_slum_event_loop_done",
		},
	},
	dlc_bogenhafen_slum_event_spice_mid = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerkers_small") < 1
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_small",
			spawner_id = "bogenhafen_slum_event_front_mid_01",
		},
	},
	dlc_bogenhafen_slum_event_spice_left = {
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
			composition_type = "chaos_shields",
			spawner_id = "bogenhafen_slum_event_left_01",
		},
		{
			"event_horde",
			composition_type = "event_small_fanatics",
			spawner_id = "bogenhafen_slum_event_left_01",
		},
	},
	dlc_bogenhafen_slum_event_spice_right = {
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
			composition_type = "chaos_shields",
			spawner_id = "bogenhafen_slum_event_right_01",
		},
		{
			"event_horde",
			composition_type = "event_small_fanatics",
			spawner_id = "bogenhafen_slum_event_right_01",
		},
	},
	dlc_bogenhafen_slum_event_end_loop = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "bogenhafen_slum_event_roof_01",
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "bogenhafen_slum_event_roof_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder_with_shield") < 3 and count_event_breed("chaos_marauder") < 4
			end,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_slum_event_end_loop",
		},
	},
	dlc_bogenhafen_slum_gauntlet_wall = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_slum_gauntlet_master",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_small",
			spawner_id = "bogenhafen_slum_gauntlet_wall_01",
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			spawner_id = "bogenhafen_slum_gauntlet_wall_01",
		},
	},
	dlc_bogenhafen_slum_gauntlet_wall_smash = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_slum_gauntlet_master",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			spawner_id = "bogenhafen_slum_gauntlet_wall",
		},
	},
	dlc_bogenhafen_slum_gauntlet_part_01 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_slum_gauntlet_master",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "dlc_bogenhafen_slum_gauntlet_part_01",
		},
	},
	dlc_bogenhafen_slum_gauntlet_part_02 = {
		{
			"set_master_event_running",
			name = "dlc_bogenhafen_slum_gauntlet_master",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "dlc_bogenhafen_slum_gauntlet_part_02",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerkers_small") < 1 and count_event_breed("chaos_shields") < 1 and count_event_breed("chaos_warriors") < 1 and count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "dlc_bogenhafen_slum_gauntlet_part_02_done",
		},
	},
	dlc_bogenhafen_slum_gauntlet_disable_kick = {
		{
			"disable_kick",
		},
	},
}

return {
	terror_event_blueprints,
	weighted_random_terror_events,
}
