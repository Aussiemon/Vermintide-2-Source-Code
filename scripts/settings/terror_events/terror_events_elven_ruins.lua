-- chunkname: @scripts/settings/terror_events/terror_events_elven_ruins.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local HARDEST = TerrorEventUtils.HARDEST
local terror_event_blueprints = {
	generic_disable_specials = GenericTerrorEvents.generic_disable_specials,
	generic_enable_specials = GenericTerrorEvents.generic_enable_specials,
	generic_disable_pacing = GenericTerrorEvents.generic_disable_pacing,
	elven_ruins_end_event = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_time_challenge",
			time_challenge_name = "elven_ruins_speed_event",
		},
		{
			"set_time_challenge",
			time_challenge_name = "elven_ruins_speed_event_cata",
		},
		{
			"set_master_event_running",
			name = "ruins_end_event",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"disable_kick",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "elven_ruins_bottomtier",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 1,
				hardest = 1,
				normal = 1,
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
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
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
		},
		{
			"delay",
			duration = {
				2,
				3,
			},
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
			composition_type = "event_extra_spice_large",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn_special",
			breed_name = "chaos_vortex_sorcerer",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "chaos_corruptor_sorcerer",
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "elven_ruins_bottomtier",
		},
		{
			"delay",
			duration = {
				9,
				11,
			},
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
	},
	elven_ruins_end_event_flush = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "elven_ruins_speed_event",
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "elven_ruins_speed_event_cata",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				1,
				2,
			},
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			limit_spawners = 4,
			spawner_id = "elven_ruins_toptier",
		},
		{
			"delay",
			duration = {
				3,
				4,
			},
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			limit_spawners = 4,
			spawner_id = "elven_ruins_toptier",
		},
	},
	elven_ruins_end_event_device_fiddlers = {
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "device_skaven_1",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "device_skaven_2",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "device_skaven_3",
		},
	},
}

return {
	terror_event_blueprints,
}
