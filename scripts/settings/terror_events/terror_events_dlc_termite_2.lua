-- chunkname: @scripts/settings/terror_events/terror_events_dlc_termite_2.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_enemies()

	return #spawned_enemies
end

local function setup_grudgemarked_stormfiend(optional_data, difficulty, breed_name, event, difficulty_tweak, enhancement_list)
	local names = {
		"crushing",
	}
	local base_grudgemark_name = "termite_base"
	local list = optional_data.enhancements or {}

	list[#list + 1] = BreedEnhancements[base_grudgemark_name]
	optional_data.enhancements = list

	return optional_data
end

local function size_skaven_stormfiend(breed, extension_init_data, optional_data, spawn_pos, spawn_rot)
	return
end

local function setup_grudgemarked_ogre(optional_data, difficulty, breed_name, event, difficulty_tweak, enhancement_list)
	local names = {
		"crushing",
	}
	local base_grudgemark_name = "termite_small"
	local list = optional_data.enhancements or {}

	list[#list + 1] = BreedEnhancements[base_grudgemark_name]
	optional_data.enhancements = list

	return optional_data
end

local function size_skaven_ogre(breed, extension_init_data, optional_data, spawn_pos, spawn_rot)
	optional_data.size_variation_range = {
		0.75,
		0.75,
	}
end

local NORMAL = 1
local HARD = 2
local HARDER = 3
local HARDEST = 4
local CATACLYSM = 5
local weighted_random_terror_events
local terror_event_blueprints = {
	termite_lvl2_disable_pacing = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	termite_lvl2_enable_pacing = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	termite_lvl2_enable_special_pacing = {
		{
			"control_specials",
			enable = true,
		},
	},
	termite_lvl2_disable_special_pacing = {
		{
			"control_specials",
			enable = false,
		},
	},
	termite_lvl2_enable_hordes_pacing = {
		{
			"control_hordes",
			enable = true,
		},
	},
	termite_lvl2_disable_hordes_pacing = {
		{
			"control_hordes",
			enable = false,
		},
	},
	termite_lvl2_wheelguards = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "guard_wheel_2_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "guard_wheel_2_02",
			difficulty_requirement = HARDER,
		},
	},
	termite_lvl2_wheelguards_2 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "guard_wheel_4_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "guard_wheel_4_02",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_with_shield",
			spawner_id = "guard_wheel_4_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_with_shield",
			spawner_id = "guard_wheel_4_02",
			difficulty_requirement = HARDER,
		},
	},
	termite_lvl2_wheelguards_3 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "guard_wheel_1_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "guard_wheel_1_02",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_with_shield",
			spawner_id = "guard_wheel_1_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_with_shield",
			spawner_id = "guard_wheel_1_02",
			difficulty_requirement = HARDER,
		},
	},
	termite_lvl2_wheelguards_4 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "guard_wheel_3_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "guard_wheel_3_02",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_with_shield",
			spawner_id = "guard_wheel_3_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_with_shield",
			spawner_id = "guard_wheel_3_02",
			difficulty_requirement = HARDER,
		},
	},
	termite_lvl2_gnawguards = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "gnawtooth_guardians_1",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "gnawtooth_guardians_2",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_with_shield",
			spawner_id = "gnawtooth_guardians_1",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_with_shield",
			spawner_id = "gnawtooth_guardians_2",
			difficulty_requirement = HARDER,
		},
	},
	termite_lvl2_stormfiend_fight = {
		{
			"set_master_event_running",
			name = "grudgemarked_stormfiend_event",
		},
		{
			"spawn_at_raw",
			{
				1,
				1,
			},
			breed_name = "skaven_rat_ogre",
			spawner_id = "stormfiend_fight_spawn",
			pre_spawn_func = setup_grudgemarked_stormfiend,
			optional_data = {
				spawn_chance = 1,
				spawned_func = AiUtils.magic_entrance_optional_spawned_func,
				prepare_func = size_skaven_stormfiend,
			},
		},
	},
	termite_lvl2_stormfiend_slaves = {
		{
			"set_master_event_running",
			name = "stormfiend_slaves",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "termite_lvl2_end",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "stormfiend_slaves_done",
		},
	},
	termite_lvl2_slaves_1 = {
		{
			"set_master_event_running",
			name = "wheel_1_slaves",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "termite_lvl2_wheel_1",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wheel_1_slaves_done",
		},
	},
	termite_lvl2_slaves_2 = {
		{
			"set_master_event_running",
			name = "wheel_2_slaves",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "termite_lvl2_wheel_2",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wheel_2_slaves_done",
		},
	},
	termite_lvl2_slaves_3 = {
		{
			"set_master_event_running",
			name = "wheel_3_slaves",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "termite_lvl2_wheel_3",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wheel_3_slaves_done",
		},
	},
	termite_lvl2_slaves_4 = {
		{
			"set_master_event_running",
			name = "wheel_4_slaves",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "termite_lvl2_wheel_4",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wheel_4_slaves_done",
		},
	},
	termite_lvl2_stormfiend_extra_a = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "termite_lvl2_end_x",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = CATACLYSM,
		},
	},
	termite_lvl2_stormfiend_extra_b = {
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "termite_lvl2_end_x",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = CATACLYSM,
		},
	},
	termite_lvl2_stormfiend_extra_c = {
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "termite_lvl2_end_x",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "termite_lvl2_end_x",
			difficulty_requirement = CATACLYSM,
		},
	},
	termite_lvl2_ratswarm = {
		{
			"set_master_event_running",
			name = "swarm_active",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"spawn_at_raw",
			breed_name = "critter_rat",
			spawner_id = "spawner_swarm",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "swarm_dead",
		},
	},
	termite_lvl2_wave_1 = {
		{
			"set_master_event_running",
			name = "survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 20,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_1_small_slaves",
			spawner_id = "directional_a",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_1_medium_slaves",
			spawner_id = "directional_d",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_1_commanders",
			spawner_id = "directional_h",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_f",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_e",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_h",
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "manual_e",
			difficulty_requirement = CATACLYSM,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_1_medium_slaves",
			spawner_id = "spawner_flush_out",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_f",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_1_commanders",
			spawner_id = "directional_h",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_1_commanders",
			spawner_id = "directional_e",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wave_1_complete",
		},
	},
	termite_lvl2_wave_2 = {
		{
			"set_master_event_running",
			name = "survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_1_small_slaves",
			spawner_id = "directional_a",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_2_slaves_shields",
			spawner_id = "directional_d",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_g",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_h",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_a",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_i",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_2_slaves_shields",
			spawner_id = "directional_e",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_2_slaves_shields",
			spawner_id = "directional_c",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_2_slaves_shields",
			spawner_id = "spawner_flush_in",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_2_slaves_shields",
			spawner_id = "directional_a",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_2_slaves_shields",
			spawner_id = "directional_f",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_f",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_e",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_g",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_j",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_k",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wave_2_complete",
		},
	},
	termite_lvl2_wave_3 = {
		{
			"set_master_event_running",
			name = "survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_3_shields",
			spawner_id = "spawner_flush_out",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_h",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_f",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_a",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_i",
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_j",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_h",
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_h",
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_3_clan_shields",
			spawner_id = "spawner_flush_in",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_3_commanders",
			spawner_id = "directional_a",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_3_commanders",
			spawner_id = "directional_b",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_3_commanders",
			spawner_id = "directional_g",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = CATACLYSM,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_3_commanders",
			spawner_id = "directional_f",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_3_commanders",
			spawner_id = "directional_a",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_e",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_g",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_f",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_k",
			difficulty_requirement = CATACLYSM,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 8
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_3_commanders",
			spawner_id = "directional_d",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_3_commanders",
			spawner_id = "directional_a",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wave_3_complete",
		},
	},
	termite_lvl2_wave_4 = {
		{
			"set_master_event_running",
			name = "survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_slave_clan_shield",
			spawner_id = "directional_c",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_slave_clan_shield",
			spawner_id = "directional_f",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_e",
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_slave_clan_shield",
			spawner_id = "directional_a",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_command_shield",
			spawner_id = "directional_d",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_slave_clan_shield",
			spawner_id = "directional_g",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_command_shield",
			spawner_id = "directional_c",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_k",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_b",
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_slave_clan_shield",
			spawner_id = "spawner_flush_out",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_slave_clan_shield",
			spawner_id = "spawner_flush_in",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_e",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_command_shield",
			spawner_id = "directional_h",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_command_shield",
			spawner_id = "directional_e",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_4_slave_clan_shield",
			spawner_id = "spawner_flush_in",
		},
		{
			"delay",
			duration = 4,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_b",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM,
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wave_4_complete",
		},
	},
	termite_lvl2_wave_5 = {
		{
			"set_master_event_running",
			name = "survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 70,
		},
		{
			"delay",
			duration = 15,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_5_monks",
			spawner_id = "directional_a",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_i",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_d",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = CATACLYSM,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_b",
			difficulty_requirement = CATACLYSM,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_5_slave_clan_shield",
			spawner_id = "directional_g",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_5_monks",
			spawner_id = "directional_e",
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_5_slave_clan_shield",
			spawner_id = "spawner_flush_out",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_h",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_5_slave_clan",
			spawner_id = "spawner_flush_out",
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_f",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_b",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_d",
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_5_slave_clan",
			spawner_id = "directional_a",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_5_commanders",
			spawner_id = "directional_f",
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wave_5_complete",
		},
	},
	termite_lvl2_wave_6 = {
		{
			"set_master_event_running",
			name = "survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 70,
		},
		{
			"delay",
			duration = 15,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_6_flush_slave_clan_shields",
			spawner_id = "mid_spawner_flush_in",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_6_monks",
			spawner_id = "mid_directional_h",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_6_commander_shields",
			spawner_id = "mid_directional_c",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_h",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_g",
			difficulty_requirement = HARDER,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_6_slave_clan_shields",
			spawner_id = "mid_directional_e",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "mid_manual_k",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "mid_manual_a",
			difficulty_requirement = HARDER,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_6_flush_slave_clan_shields",
			spawner_id = "mid_directional_b",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mid_manual_c",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mid_manual_f",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_j",
			difficulty_requirement = CATACLYSM,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_6_flush_slave_clan_shields",
			spawner_id = "mid_spawner_flush_out",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wave_6_complete",
		},
	},
	termite_lvl2_wave_7 = {
		{
			"set_master_event_running",
			name = "survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 70,
		},
		{
			"delay",
			duration = 15,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_7_slaves",
			spawner_id = "mid_directional_a",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "mid_manual_j",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_g",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_f",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mid_manual_f",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_7_medium_slaves",
			spawner_id = "mid_spawner_flush_out",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_7_monks",
			spawner_id = "mid_directional_h",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_7_commanders",
			spawner_id = "mid_directional_a",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_j",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_h",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_f",
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_7_medium_slaves",
			spawner_id = "mid_spawner_flush_out",
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wave_7_complete",
		},
	},
	termite_lvl2_wave_8 = {
		{
			"set_master_event_running",
			name = "survival",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 70,
		},
		{
			"delay",
			duration = 15,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_slave_clan_shield",
			spawner_id = "mid_directional_a",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_slave_clan_shield",
			spawner_id = "mid_spawner_flush_out",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "mid_manual_i",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "mid_manual_e",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_commander_shields",
			spawner_id = "mid_directional_h",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "mid_manual_i",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "mid_manual_f",
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_slave_clan_shield",
			spawner_id = "mid_spawner_flush_out",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_slave_clan_shield",
			spawner_id = "mid_directional_a",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_h",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_f",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_e",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_commander_shields",
			spawner_id = "mid_directional_c",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mid_manual_j",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "mid_manual_k",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mid_manual_h",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "mid_manual_h",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mid_manual_f",
			difficulty_requirement = HARDER,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_big_slaves",
			spawner_id = "mid_spawner_flush_out",
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_monks",
			spawner_id = "mid_directional_h",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "mid_manual_a",
		},
		{
			"delay",
			duration = 51,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "mid_manual_c",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "mid_manual_h",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "mid_manual_f",
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_monks",
			spawner_id = "mid_directional_a",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "mid_manual_a",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "mid_manual_d",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 2,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_commander_shields",
			spawner_id = "mid_directional_f",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "mid_manual_f",
		},
		{
			"delay",
			duration = 5,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "mid_manual_h",
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_monks",
			spawner_id = "mid_directional_e",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_commander_shields",
			spawner_id = "mid_directional_a",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 10,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"event_horde",
			composition_type = "termite_lvl2_wave_8_big_slaves",
			spawner_id = "mid_spawner_flush_out",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "wave_8_complete",
		},
	},
	termite_lvl2_end_guards = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "end_event_guards_1",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "end_event_guards_2",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "end_event_guards_3",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "end_event_guards_4",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "end_event_guards_5",
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "end_event_guards_6",
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "end_event_guards_7",
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "end_event_guards_8",
			difficulty_requirement = HARDEST,
		},
	},
}

return terror_event_blueprints
