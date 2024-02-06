-- chunkname: @scripts/settings/terror_events/terror_events_dlc_wizards_tower.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local function current_intensity()
	return Managers.state.conflict.pacing:get_intensity()
end

local function current_difficulty()
	return Managers.state.difficulty.difficulty
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_enemies()

	return #spawned_enemies
end

local function num_spawned_enemies_during_event()
	local spawned_enemies = Managers.state.conflict:enemies_spawned_during_event()

	return spawned_enemies
end

local function num_alive_standards()
	local alive_standards = Managers.state.conflict:alive_standards()

	return #alive_standards
end

local horde_sound_settings = {
	skaven = {
		stinger_sound_event = "enemy_horde_stinger",
		music_states = {
			horde = "horde",
		},
	},
	chaos = {
		stinger_sound_event = "enemy_horde_chaos_stinger",
		music_states = {
			horde = "horde_chaos",
			pre_ambush = "pre_ambush_chaos",
		},
	},
	beastmen = {
		stinger_sound_event = "enemy_horde_beastmen_stinger",
		music_states = {
			horde = "horde_beastmen",
			pre_ambush = "pre_ambush_beastmen",
		},
	},
}
local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local weighted_random_terror_events = {
	wt_end_event_intro_wave = {
		"wt_end_event_intro_wave_a",
		1,
		"wt_end_event_intro_wave_b",
		1,
		"wt_end_event_intro_wave_c",
		1,
	},
	wt_end_event_wave_01 = {
		"wt_end_event_wave_01_a",
		1,
		"wt_end_event_wave_01_b",
		1,
		"wt_end_event_wave_01_c",
		1,
	},
	wt_end_event_wave_02 = {
		"wt_end_event_wave_02_a",
		1,
		"wt_end_event_wave_02_b",
		1,
		"wt_end_event_wave_02_c",
		1,
	},
	wt_end_event_wave_03 = {
		"wt_end_event_wave_03_a",
		1,
		"wt_end_event_wave_03_b",
		1,
		"wt_end_event_wave_03_c",
		1,
	},
	wt_end_event_wave_04 = {
		"wt_end_event_wave_04_a",
		1,
		"wt_end_event_wave_04_b",
		1,
		"wt_end_event_wave_04_c",
		1,
	},
	wt_end_event_specials = {
		"wt_end_event_specials_01",
		1,
		"wt_end_event_specials_02",
		1,
		"wt_end_event_specials_03",
		1,
		"wt_end_event_specials_04",
		1,
		"wt_end_event_specials_05",
		1,
	},
}

local function gutter_runner_ambush_spawn(unit, breed, optional_data)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.high_ground_opportunity = true
		blackboard.spawning_finished = true
		blackboard.instant_spawn = true

		local spawn_pos = POSITION_LOOKUP[unit]
		local jump_forward = Quaternion.forward(Unit.local_rotation(unit, 0))
		local jump_pos = spawn_pos + jump_forward * 5 + Vector3.down()

		blackboard.jump_data = {
			delay_jump_start = false,
			enemy_spine_node = 0,
			instant_jump = true,
			segment_list = {},
			jump_target_pos = Vector3Box(jump_pos),
			jump_velocity_boxed = Vector3Box(jump_forward * 5),
			total_distance = Vector3.distance(jump_pos, spawn_pos),
		}
	end
end

local terror_event_blueprints = {
	wt_disable_pacing = {
		{
			"control_hordes",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	wt_enable_pacing = {
		{
			"control_hordes",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	painting_jumper_spawn_001 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "painting_jumper_spawn_001",
			optional_data = {
				spawned_func = gutter_runner_ambush_spawn,
			},
		},
	},
	painting_jumper_spawn_002 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "painting_jumper_spawn_002",
			optional_data = {
				spawned_func = gutter_runner_ambush_spawn,
			},
		},
	},
	painting_jumper_spawn_003 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "painting_jumper_spawn_003",
			optional_data = {
				spawned_func = gutter_runner_ambush_spawn,
			},
		},
	},
	wt_library_event = {
		{
			"enable_bots_in_carry_event",
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
			"delay",
			duration = 5,
		},
		{
			"set_master_event_running",
			name = "wt_library",
		},
		{
			"flow_event",
			flow_event_name = "wt_library_starting",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners_side",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"flow_event",
			flow_event_name = "wt_library_event_pause_a",
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
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners_side",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_alt_objectives",
		},
		{
			"delay",
			duration = 7,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "library_spawners",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 7,
		},
		{
			"flow_event",
			flow_event_name = "wt_library_event_pause_b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "library_spawners_side",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "library_spawners",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn",
			{
				2,
				4,
			},
			breed_name = "skaven_poison_wind_globadier",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 7,
		},
		{
			"flow_event",
			flow_event_name = "wt_library_event_pause_c",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners_side",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "library_spawners_side",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 2,
			spawner_id = "library_spawners_side",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "library_spawners",
		},
		{
			"delay",
			duration = 7,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 7,
		},
		{
			"flow_event",
			flow_event_name = "wt_library_event_done",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"disable_bots_in_carry_event",
		},
		{
			"stop_master_event",
		},
	},
	wt_library_boss4 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "library_manual_4",
		},
	},
	wt_library_boss2 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "library_manual_2",
		},
	},
	wt_library_boss3 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "library_manual_3",
		},
	},
	wt_library_boss1 = {
		{
			"set_master_event_running",
			name = "wt_library_boss1",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_stormfiend",
			spawner_id = "library_manual_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_stormfiend") < 1
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "wt_library_boss_dead",
		},
	},
	wt_dining_boss = {
		{
			"spawn_at_raw",
			"skaven_stormfiend",
			"chaos_troll",
			"chaos_spawn",
			breed_name = "skaven_rat_ogre",
			spawner_id = "dining_manual",
		},
	},
	wt_end_event_intro_wave_a = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_intro_wave",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 4 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_intro_wave_done",
		},
	},
	wt_end_event_intro_wave_b = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_intro_wave",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_intro_wave_done",
		},
	},
	wt_end_event_intro_wave_c = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_intro_wave",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_intro_wave_done",
		},
	},
	wt_end_event_wave_01_a = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_01",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 15
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_01_done",
		},
	},
	wt_end_event_wave_01_b = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_01",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 15
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_01_done",
		},
	},
	wt_end_event_wave_01_c = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_01",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"event_horde",
			composition_type = "chaos_warriors_small",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_warrior") < 1
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_01_done",
		},
	},
	wt_end_event_wave_02_a = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_02",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 20
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_02_done",
		},
	},
	wt_end_event_wave_02_b = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_02",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 20
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_02_done",
		},
	},
	wt_end_event_wave_02_c = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_02",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "wt_end_event",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 20
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_02_done",
		},
	},
	wt_end_event_wave_03_a = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_02",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
		},
		{
			"event_horde",
			composition_type = "chaos_warriors_small",
			limit_spawners = 2,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 20
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_03_done",
		},
	},
	wt_end_event_wave_03_b = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_02",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
		},
		{
			"event_horde",
			composition_type = "storm_vermin_small",
			limit_spawners = 2,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 20
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_03_done",
		},
	},
	wt_end_event_wave_03_c = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_02",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "crawl_end_event_chaos_small",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
		},
		{
			"event_horde",
			composition_type = "chaos_raiders_small",
			limit_spawners = 6,
			spawner_id = "wt_end_event",
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_small",
			limit_spawners = 2,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 20
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_03_done",
		},
	},
	wt_end_event_wave_04_a = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_04",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 8
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
			spawner_id = "wtr_end_event",
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 4,
			spawner_id = "wtr_end_event",
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_04_repeat",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_04_done",
		},
	},
	wt_end_event_wave_04_b = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_04",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 8
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
			spawner_id = "wtr_end_event",
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_04_repeat",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_04_done",
		},
	},
	wt_end_event_wave_04_c = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 60,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_wave_04",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
			spawner_id = "wt_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 8
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
			spawner_id = "wtr_end_event",
		},
		{
			"event_horde",
			composition_type = "storm_vermin_shields_small",
			limit_spawners = 4,
			spawner_id = "wtr_end_event",
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_04_repeat",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_wave_04_done",
		},
	},
	wt_end_event_constant = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 20,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_constant",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_small_fanatics",
			limit_spawners = 8,
			spawner_id = "wt_end_event_pool",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 15,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 15
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_constant_done",
		},
	},
	wt_end_warriors = {
		{
			"set_master_event_running",
			name = "end_warriors",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "end_event_warriors_recruit",
			difficulty_requirement = NORMAL,
		},
		{
			"delay",
			duration = 0.8,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "end_event_warriors_veteran",
			difficulty_requirement = HARD,
		},
		{
			"delay",
			duration = 0.8,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "end_event_warriors_champion",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 0.8,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "end_event_warriors_legend",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 0.8,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "end_event_warriors_cataclysm",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 0.8,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "end_event_warriors_cataclysm_02",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 240,
			condition = function (t)
				return count_event_breed("chaos_warrior") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "end_warriors_dead",
		},
	},
	wt_end_event_specials_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_specials",
		},
		{
			"spawn_special",
			breed_name = "skaven_gutter_runner",
			difficulty_amount = {
				cataclysm = 1,
				hard = 1,
				harder = 1,
				hardest = 1,
				normal = 1,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_pack_master",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 20,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_pack_master") < 1
			end,
		},
		{
			"delay",
			duration = 42,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_specials_done",
		},
	},
	wt_end_event_specials_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_specials",
		},
		{
			"spawn_special",
			breed_name = "skaven_warpfire_thrower",
			difficulty_amount = {
				cataclysm = 1,
				hard = 1,
				harder = 1,
				hardest = 1,
				normal = 1,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_gutter_runner",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_gutter_runner") < 1
			end,
		},
		{
			"delay",
			duration = 42,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_specials_done",
		},
	},
	wt_end_event_specials_03 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_specials",
		},
		{
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			difficulty_amount = {
				cataclysm = 1,
				hard = 1,
				harder = 1,
				hardest = 1,
				normal = 1,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "chaos_corruptor_sorcerer",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_pack_master") < 1
			end,
		},
		{
			"delay",
			duration = 42,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_specials_done",
		},
	},
	wt_end_event_specials_04 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_specials",
		},
		{
			"spawn_special",
			breed_name = "chaos_corruptor_sorcerer",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 1,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_corruptor_sorcerer") < 1
			end,
		},
		{
			"delay",
			duration = 42,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_specials_done",
		},
	},
	wt_end_event_specials_05 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_specials",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "chaos_vortex_sorcerer",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "chaos_vortex_sorcerer",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_vortex_sorcerer") < 1
			end,
		},
		{
			"delay",
			duration = 42,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_specials_done",
		},
	},
	wt_end_event_boss = {
		{
			"set_master_event_running",
			name = "wt_end_event_boss",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_spawn",
			spawner_id = "event_minotaur",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_spawn") < 1
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_boss_dead",
		},
	},
	wt_dining_sorcerers = {
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "sorcerer_1",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "sorcerer_2",
		},
	},
	wt_end_event_skeletons = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_skeletons",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "wt_end_event_skeletons_01",
			limit_spawners = 12,
			spawner_id = "wt_end_event_skeletons",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_event_breed("ethereal_skeleton_with_hammer") < 3 and count_event_breed("ethereal_skeleton_with_shield") < 3
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_skeletons_done",
		},
	},
	wt_end_event_skeletons_end = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "wt_end_event_skeletons_end",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "wt_end_event_skeletons_01",
			limit_spawners = 12,
			spawner_id = "wt_end_event_skeletons",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_event_breed("ethereal_skeleton_with_hammer") < 3 and count_event_breed("ethereal_skeleton_with_shield") < 3
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "wt_end_event_skeletons_end_done",
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
