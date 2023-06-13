local horde_sound_settings = {
	skaven = {
		stinger_sound_event = "enemy_horde_stinger",
		music_states = {
			horde = "horde"
		}
	},
	chaos = {
		stinger_sound_event = "enemy_horde_chaos_stinger",
		music_states = {
			pre_ambush = "pre_ambush_chaos",
			horde = "horde_chaos"
		}
	},
	beastmen = {
		stinger_sound_event = "enemy_horde_beastmen_stinger",
		music_states = {
			pre_ambush = "pre_ambush_beastmen",
			horde = "horde_beastmen"
		}
	}
}
local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local CATACLYSM2 = 7
local CATACLYSM3 = 8

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
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

local function num_aggroed_enemies()
	local num_aggroed_enemies = Managers.state.conflict:get_num_aggroed_enemies()

	return num_aggroed_enemies
end

local terror_event_blueprints = {
	boss_01 = {
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_life_boss_event_1"
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_chaos_large"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_spice_elite_beastmen"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_spice_elite_skaven"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	boss_04 = {
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_boss_event_1"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	boss_05 = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_skaven_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_spice_berzerker_skaven"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_stormfiend"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_small"
		},
		{
			"delay",
			duration = 6
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	boss_06 = {
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_boss_event_2"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	metal_bosses = {
		{
			"set_master_event_running",
			name = "metal_bosses"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_trickle_chaos_berzerkers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_warriors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_trickle_chaos_berzerkers"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_bestigors"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_bestigors"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_stormfiend"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_warriors"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	metal_bosses_2 = {
		{
			"set_master_event_running",
			name = "metal_bosses_2"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_warriors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_storm_vermin_shields_small"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_boss_skaven_armour"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_minotaur"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	metal_bosses_3 = {
		{
			"set_master_event_running",
			name = "metal_bosses_3"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_storm_vermin_shields_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_extra_spice_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_extra_spice_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	heaven_bosses = {
		{
			"set_master_event_running",
			name = "heaven_bosses"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 4
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "chaos_spawn"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	fire_bosses = {
		{
			"set_master_event_running",
			name = "fire_bosses"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_storm_skaven"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_stormfiend"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_skaven_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_boss_skaven_armour"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_large_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"delay",
			duration = 7
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "chaos_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	chaos_bosses = {
		{
			"set_master_event_running",
			name = "chaos_bosses"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_spice_elite_chaos"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_shields"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_spice_elite_chaos"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_shields"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors_small"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_chaos"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_spice_elite_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	boss_blasters = {
		{
			"set_master_event_running",
			name = "boss_blasters"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 7
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_explosive_horde_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	chaos_swarm_event = {
		{
			"set_master_event_running",
			name = "chaos_swarm_event"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 4
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors_small"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_chaos"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_chaos"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "chaos_spawn"
		},
		{
			"delay",
			duration = 7
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	skaven_swarm_event = {
		{
			"set_master_event_running",
			name = "skaven_swarm_event"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_small"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_spice_elite_skaven"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_pack_master"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_boss_skaven_armour"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_boss_skaven_armour"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_large"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_trickle_skaven_armour"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_pack_master"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_spice_berzerker_skaven"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_trickle_skaven_armour"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_skaven_small"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_stormfiend"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_skaven_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	swarms_2_bosses_event = {
		{
			"set_master_event_running",
			name = "swarms_2_bosses_event"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_skaven_large"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_large"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_troll"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_small"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 45,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_shield"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_skaven_small"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_shield"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	swarms_2_chaos_bosses_event = {
		{
			"set_master_event_running",
			name = "swarms_2_chaos_bosses_event"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_chaos_large"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_chaos_large"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_troll"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_chaos_large"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_chaos_small"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_shields"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 45,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_raiders_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "chaos_spawn"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_chaos"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_raiders_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_chaos_medium"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_chaos_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	swarms_2_beastmen_bosses_event = {
		{
			"set_master_event_running",
			name = "swarms_2_beastmen_bosses_event"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_beastmen_large"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_beastmen_large"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_minotaur"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_beastmen_large"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_beastmen_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_bestigor"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 45,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "beastmen_minotaur"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "beastmen_bestigor"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_beastmen_medium"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_beastmen_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_spice_elite_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	skaven_swarm_heavens_intro = {
		{
			"set_master_event_running",
			name = "skaven_swarm_heavens_intro"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual1",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual3",
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual2",
			difficulty_requirement = HARD
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual1",
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual3",
			difficulty_requirement = CATACLYSM3
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 45,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_large"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_stormfiend"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual1",
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual3",
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual1",
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual3",
			difficulty_requirement = CATACLYSM3
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	beastmen_bosses_heavens_outro = {
		{
			"set_master_event_running",
			name = "beastmen_bosses_heavens_outro"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_minotaur"
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_minotaur",
			spawner_id = "manual1",
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_minotaur",
			spawner_id = "manual1",
			difficulty_requirement = CATACLYSM3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_large_beastmen",
			difficulty_requirement = CATACLYSM2
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers",
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	beastmen_bosses_bestigors = {
		{
			"set_master_event_running",
			name = "beastmen_bosses_heavens_outro"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_minotaur"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_minotaur",
			spawner_id = "manual1",
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_minotaur",
			spawner_id = "manual1",
			difficulty_requirement = CATACLYSM3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_large_beastmen",
			difficulty_requirement = CATACLYSM2
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers",
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	beastmen_charge_event = {
		{
			"set_master_event_running",
			name = "beastmen_charge_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium_beastmen"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_bestigors_small"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors_small"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_bestigors_small"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_bestigors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_bestigors_small"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors_small"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors_small"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 4
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_minotaur"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"delay",
			duration = 7
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	beastmen_charge_event_short = {
		{
			"set_master_event_running",
			name = "beastmen_charge_event_short"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_ungor_archers"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_beastmen"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors_small"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_bestigors_small"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_bestigors_small"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_bestigors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_bestigors_small"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 9
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_minotaur"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	warriors_and_ratling_gunners = {
		{
			"set_master_event_running",
			name = "warriors_and_ratling_gunners"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_warriors_small"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_chaos"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_large_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_warriors"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_warriors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	eshin_swarm = {
		{
			"set_master_event_running",
			name = "eshin_swarm"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_gutter_runner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "skaven_gutter_runner"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium_shield"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_gutter_runner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_gutter_runner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium_shield"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_storm_vermin_shields_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "skaven_stormfiend"
		},
		{
			"delay",
			duration = 7
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "skaven_gutter_runner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_medium_shield"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	buffed_beast_bosses = {
		{
			"set_master_event_running",
			name = "buffed_beast_bosses"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_horde_beastmen_small"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_minotaur"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_horde_beastmen_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_ungor_archers"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "beastmen_minotaur"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual2",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual3",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual4",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual1",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"complete_weave"
		}
	},
	objective_storm_vermin_small_event = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_storm_vermin_small"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		}
	},
	objective_extra_spice_small_event = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "event_extra_spice_small"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		}
	},
	objective_small_chaos_event = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small_chaos"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		}
	},
	objective_chaos_berzerkers_small_event = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_small"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		}
	},
	objective_small_skaven_event = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_small"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		}
	},
	objective_plague_monks_small_event = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_plague_monks_small"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		}
	},
	objective_large_beastmen_event = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_large_beastmen"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		}
	},
	capture_point_1_event_small = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_1"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_1_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_1_event_small_no_chaos = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_1_event_small_no_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_1_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_1_event_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_1"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_shields_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_1_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_1_event_medium_no_chaos = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_1_event_medium_no_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_shields_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_1_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_1_event_large = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_1"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_shields_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_1_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_1_event_large_skaven = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_1_event_large_skaven"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_event_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_event_medium"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_storm_vermin_shields_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_event_small"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_003_skaven",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_1_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_2_event = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_2"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_chaos_berzerkers_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_chaos_shields"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_chaos_berzerkers_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_2",
			composition_type = "weave_chaos_berzerkers_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_2_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_1_chaos = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_1_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_chaos_berzerkers_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_event_small_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_chaos_berzerkers_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_1_chaos",
			composition_type = "weave_chaos_berzerkers_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_2_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_3_event = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_3"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_plague_monks_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_storm_vermin_shields_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_3_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_3_event_no_chaos = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_3_event_no_chaos"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_storm_vermin_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_plague_monks_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_storm_vermin_shields_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_3",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_3_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_4_event = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_4"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_4",
			composition_type = "weave_horde_beastmen_small"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_4",
			composition_type = "weave_spice_elite_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_4",
			composition_type = "weave_horde_beastmen_large"
		},
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_4",
			composition_type = "weave_horde_beastmen_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_4_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_6_boss_event_skaven = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_6_boss_event_skaven"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "capture_point_6_skaven",
			breed_name = "skaven_stormfiend"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_6_skaven",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_6_skaven",
			composition_type = "weave_plague_monks_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_6_skaven",
			composition_type = "weave_event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_6_skaven",
			composition_type = "weave_event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_3_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	capture_point_specials_raid = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_specials_raid"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "capture_point_specials_raid",
			breed_name = "skaven_gutter_runner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_specials_raid",
			composition_type = "weave_horde_skaven_medium"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 7
		},
		{
			"spawn_at_raw",
			spawner_id = "capture_point_specials_raid",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "capture_point_specials_raid",
			breed_name = "skaven_gutter_runner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_specials_raid",
			composition_type = "weave_horde_skaven_small"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "capture_point_specials_raid",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "capture_point_specials_raid",
			breed_name = "skaven_gutter_runner"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_specials_raid",
			composition_type = "weave_horde_skaven_large"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "capture_point_specials_raid",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_3_done"
		}
	},
	objective_specials_raid = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "objective_specials_raid"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "objective_specials_raid",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "objective_specials_raid",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "objective_specials_raid",
			composition_type = "weave_horde_skaven_small"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "objective_specials_raid",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "objective_specials_raid",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "objective_specials_raid",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_3_done"
		}
	},
	capture_point_event_beastmen = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "capture_point_event_beastmen"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_event_beastmen",
			composition_type = "weave_spice_elite_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_event_beastmen",
			composition_type = "weave_horde_beastmen_medium"
		},
		{
			"spawn_at_raw",
			spawner_id = "capture_point_event_beastmen",
			breed_name = "beastmen_minotaur"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 5
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "capture_point_event_beastmen",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_event_beastmen",
			composition_type = "weave_horde_beastmen_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_event_beastmen",
			composition_type = "weave_horde_beastmen_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_event_beastmen",
			composition_type = "weave_spice_elite_beastmen"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_event_beastmen",
			composition_type = "weave_horde_beastmen_large"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "capture_point_event_beastmen",
			composition_type = "weave_spice_elite_beastmen"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "capture_point_event_beastmen_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	objective_event_beastmen = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "objective_event_beastmen"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"delay",
			duration = 6
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "objective_event_beastmen",
			composition_type = "weave_spice_elite_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "objective_event_beastmen",
			composition_type = "weave_horde_beastmen_small"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "objective_event_beastmen",
			breed_name = "beastmen_standard_bearer"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "objective_event_beastmen",
			composition_type = "weave_horde_beastmen_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "objective_event_beastmen",
			composition_type = "weave_horde_beastmen_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "objective_event_beastmen",
			composition_type = "weave_spice_elite_beastmen"
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "objective_event_beastmen_done"
		},
		{
			"delay",
			duration = 10
		}
	},
	weave_spot_event_special_mixed = {
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_special_mixed_done"
		}
	},
	weave_spot_event_special_skaven = {
		{
			"spawn_weave_special_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_special_skaven_done"
		}
	},
	weave_spot_event_chaos_warriors = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "weave_spot_event_chaos_warriors",
			composition_type = "weave_chaos_warriors"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "weave_spot_event_chaos_warriors",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_chaos_warriors_done"
		},
		{
			"delay",
			duration = 3
		}
	},
	weave_spot_event_skaven_specials_small = {
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_skaven_specials_small",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_skaven_specials_small",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_skaven_specials_small_done"
		},
		{
			"delay",
			duration = 3
		}
	},
	weave_spot_event_skaven_specials_medium = {
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_skaven_specials_medium",
			amount = 2,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_skaven_specials_medium",
			amount = 2,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_skaven_specials_small_done"
		},
		{
			"delay",
			duration = 3
		}
	},
	weave_spot_event_beastmen_splice = {
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "weave_spot_event_beastmen_splice",
			composition_type = "weave_spice_elite_beastmen"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_beastmen_splice_done"
		},
		{
			"delay",
			duration = 3
		}
	},
	weave_spot_event_boss_rat_ogre = {
		{
			"delay",
			duration = 10.25
		},
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_boss_rat_ogre_spawn",
			breed_name = {
				"skaven_rat_ogre"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_boss_rat_ogre_dead"
		}
	},
	weave_spot_event_boss_stormfiend = {
		{
			"delay",
			duration = 10.25
		},
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_boss_stormfiend_spawn",
			breed_name = {
				"skaven_stormfiend"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_boss_stormfiend_dead"
		}
	},
	weave_spot_event_boss_chaos_spawn = {
		{
			"delay",
			duration = 10.25
		},
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_boss_chaos_spawn_spawn",
			breed_name = {
				"chaos_spawn"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_boss_chaos_spawn_dead"
		}
	},
	weave_spot_event_boss_minotaur = {
		{
			"delay",
			duration = 10.25
		},
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_boss_minotaur_spawn",
			breed_name = {
				"beastmen_minotaur"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_boss_minotaur_dead"
		}
	},
	weave_spot_event_skaven_gutter_runner = {
		{
			"delay",
			duration = 10.25
		},
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_skaven_gutter_runner_spawn",
			breed_name = {
				"skaven_gutter_runner"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_skaven_gutter_runner_dead"
		}
	},
	weave_spot_event_boss_chaos_troll = {
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_boss_chaos_troll_spawn",
			breed_name = {
				"chaos_troll"
			}
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_boss_chaos_troll_dead"
		}
	},
	weave_spot_event_boss_rat_ogre_nodelay = {
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_boss_rat_ogre_nodelay",
			breed_name = {
				"skaven_rat_ogre"
			}
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_boss_rat_ogre_nodelay_dead"
		}
	},
	weave_spot_event_boss_minotaur_nodelay = {
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_boss_minotaur_nodelay",
			breed_name = {
				"beastmen_minotaur"
			}
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_boss_minotaur_nodelay_dead"
		}
	},
	weave_spot_event_boss_stormfiend_nodelay = {
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_boss_stormfiend_nodelay",
			breed_name = {
				"skaven_stormfiend"
			}
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_boss_stormfiend_nodelay_dead"
		}
	},
	weave_spot_event_boss_chaos_spawn_nodelay = {
		{
			"spawn_at_raw",
			spawner_id = "weave_spot_event_boss_chaos_spawn_nodelay",
			breed_name = {
				"chaos_spawn"
			}
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "weave_spot_event_boss_chaos_spawn_nodelay_dead"
		}
	},
	skaven_main_path_event_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_skaven_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	mixed_main_path_event_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			}
		}
	},
	mixed_main_path_event_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		}
	},
	mixed_main_path_event_03 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner"
			}
		}
	},
	mixed_main_path_event_04 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower"
			}
		}
	},
	mixed_main_path_event_05 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		}
	},
	skaven_main_path_event_horde_small = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_skaven_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	skaven_main_path_event_horde_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_skaven_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	skaven_main_path_event_horde_large = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_skaven_large",
			sound_settings = horde_sound_settings.skaven
		}
	},
	chaos_main_path_event_horde_small = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	chaos_main_path_event_horde_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_medium",
			sound_settings = horde_sound_settings.chaos
		}
	},
	chaos_main_path_event_horde_large = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_large",
			sound_settings = horde_sound_settings.chaos
		}
	},
	beastmen_skaven_main_path_event_horde_small = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_beastmen_skaven_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	beastmen_main_path_event_horde_small = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_beastmen_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	beastmen_main_path_event_horde_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_beastmen_medium",
			sound_settings = horde_sound_settings.chaos
		}
	},
	beastmen_main_path_event_horde_large = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_beastmen_large",
			sound_settings = horde_sound_settings.chaos
		}
	},
	skaven_main_path_event_elite_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_elite_skaven",
			sound_settings = horde_sound_settings.chaos
		}
	},
	chaos_main_path_event_elite_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_elite_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	beastmen_main_path_event_elite_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_elite_beastmen",
			sound_settings = horde_sound_settings.chaos
		}
	},
	skaven_main_path_event_horde_elite_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_skaven_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_elite_skaven",
			sound_settings = horde_sound_settings.chaos
		}
	},
	chaos_main_path_event_horde_elite_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_elite_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	beastmen_main_path_event_horde_elite_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_beastmen_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_elite_beastmen",
			sound_settings = horde_sound_settings.chaos
		}
	},
	skaven_main_path_event_berzerker_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_berzerker_skaven",
			sound_settings = horde_sound_settings.chaos
		}
	},
	chaos_main_path_event_berzerker_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_berzerker_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	skaven_main_path_event_horde_berzerker_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_skaven_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_berzerker_skaven",
			sound_settings = horde_sound_settings.chaos
		}
	},
	chaos_main_path_event_horde_berzerker_spice = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_chaos_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_berzerker_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	chaos_main_path_event_armored_skaven = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"ambush_horde",
			composition_type = "weave_boss_skaven_armour",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_skaven",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_event_special_small = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_event_special_small_beasts = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_event_special_medium = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_event_special_large = {
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_event_special_chaos_disruptors = {
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_event_special_standard_bearer = {
		{
			"spawn_weave_special",
			1,
			breed_name = {
				"beastmen_standard_bearer"
			}
		},
		{
			"spawn_weave_special",
			1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_event_special_chaos = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_standard_skaven_small_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_skaven_small_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_smaller",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_skaven_small_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_skaven_small_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_smaller",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_smaller",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_skaven_small_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_skaven_small_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_smaller",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_smaller",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_smaller",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_skaven_medium_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_skaven_medium_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_skaven_medium_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_skaven_medium_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_smaller",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_skaven_medium_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_skaven_medium_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_smaller",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_skaven_large_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_skaven_large_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_skaven_large_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_skaven_large_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_skaven_large_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_skaven_large_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_chaos_small_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_chaos_small_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_chaos_small_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_chaos_small_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_chaos_small_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_chaos_small_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_chaos_medium_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_chaos_medium_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_chaos_medium_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_chaos_medium_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_chaos_medium_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_chaos_medium_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_chaos_large_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_chaos_large_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_chaos_large_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_chaos_large_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_chaos_large_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_chaos_large_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_beastmen_small_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_beastmen_small_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_beastmen_small_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_beastmen_small_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_beastmen_small_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_beastmen_small_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_beastmen_medium_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_beastmen_medium_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_beastmen_medium_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_beastmen_medium_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_beastmen_medium_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_beastmen_medium_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_beastmen_large_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_beastmen_large_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_beastmen_large_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_beastmen_large_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_beastmen_large_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_beastmen_large_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_mixed_small_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_mixed_small_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_standard_mixed_medium_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_mixed_medium_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_standard_mixed_medium_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_mixed_medium_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_mixed_large_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_mixed_large_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"ambush_horde",
			composition_type = "weave_event_small_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_standard_mixed_large_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_standard_mixed_large_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_large_beastmen",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_theme_berzerkers_skaven_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_berzerkers_skaven_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_plague_monks_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_theme_berzerkers_skaven_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_berzerkers_skaven_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_plague_monks_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_plague_monks_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_theme_berzerkers_skaven_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_berzerkers_skaven_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_plague_monks_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_plague_monks_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_plague_monks_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_theme_shields_skaven_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_shields_skaven_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_shields_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_theme_shields_skaven_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_shields_skaven_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_shields_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_shields_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_theme_shields_skaven_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_shields_skaven_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_shields_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_shields_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_shields_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_theme_armored_skaven_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_armored_skaven_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_theme_armored_skaven_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_armored_skaven_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 25,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_small",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_theme_armored_skaven_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_armored_skaven_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 25,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 25,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_storm_vermin_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_theme_vanilla_chaos_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_vanilla_chaos_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_raiders_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_vanilla_chaos_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_vanilla_chaos_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_raiders_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 25,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_raiders_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_vanilla_chaos_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_vanilla_chaos_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_raiders_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 25,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_raiders_medium",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 25,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_raiders_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_berzerkers_chaos_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_berzerkers_chaos_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_berzerkers_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_berzerkers_chaos_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_berzerkers_chaos_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_berzerkers_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_berzerkers_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_berzerkers_chaos_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_berzerkers_chaos_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_berzerkers_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_berzerkers_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_berzerkers_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_shields_chaos_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_shields_chaos_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_shields",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_shields_chaos_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_shields_chaos_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_shields",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 35,
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_shields",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_shields_chaos_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_shields_chaos_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_shields",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 35,
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_shields",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 35,
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_shields",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_armored_chaos_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_armored_chaos_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_warriors_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_armored_chaos_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_armored_chaos_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_warriors_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 20
		},
		{
			"continue_when",
			duration = 25,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_warriors_small",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_armored_chaos_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_armored_chaos_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_warriors_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 20
		},
		{
			"continue_when",
			duration = 25,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_warriors_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 20
		},
		{
			"continue_when",
			duration = 25,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_warriors",
			sound_settings = horde_sound_settings.chaos
		}
	},
	main_path_theme_armored_beastmen_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_armored_beastmen_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_bestigors",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_theme_armored_beastmen_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_armored_beastmen_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_bestigors_small",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_bestigors",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_theme_armored_beastmen_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_armored_beastmen_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_bestigors_small",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_bestigors",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 1
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_bestigors",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_theme_archers_beastmen_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_archers_beastmen_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_ungor_archers",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_theme_archers_beastmen_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_archers_beastmen_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_ungor_archers",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_ungor_archers",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_theme_archers_beastmen_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_theme_archers_beastmen_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_ungor_archers",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_ungor_archers",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 15
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 2
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_ungor_archers",
			sound_settings = horde_sound_settings.beastmen
		}
	},
	main_path_specials_aoe_skaven_short = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_aoe_skaven_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDEST
		}
	},
	main_path_specials_aoe_skaven_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARD
		}
	},
	main_path_specials_disablers_skaven_short = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_disablers_pure_skaven_short = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_disablers_skaven_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDEST
		}
	},
	main_path_specials_disablers_pure_skaven_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDEST
		}
	},
	main_path_specials_disablers_skaven_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_disablers_pure_skaven_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_ranged_skaven_short = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_ranged_skaven_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARDEST
		}
	},
	main_path_specials_ranged_skaven_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_aoe_chaos_short = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_aoe_chaos_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDEST
		}
	},
	main_path_specials_aoe_pure_chaos_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDEST
		}
	},
	main_path_specials_aoe_chaos_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_aoe_pure_chaos_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = HARDER
		}
	},
	main_path_specials_disablers_chaos_short = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_disablers_chaos_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDEST
		}
	},
	main_path_specials_disablers_chaos_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_disablers_pure_chaos_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		}
	},
	main_path_specials_buff_beastmen_short = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_specials_buff_beastmen_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM3
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_specials_buff_beastmen_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM3
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM3
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_standard_bearer"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_specials_aoe_mixed_short = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_aoe_mixed_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDEST
		}
	},
	main_path_specials_aoe_mixed_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_disablers_mixed_short = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_disablers_mixed_medium = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDEST
		}
	},
	main_path_specials_disablers_mixed_long = {
		{
			"delay",
			duration = 5
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARD
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDEST
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 30
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_specials_disablers_mixed_short_cata = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_specials_disablers_skaven_short_cata = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_specials_aoe_mixed_short_cata = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_specials_aoe_skaven_short_cata = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"skaven_poison_wind_globadier"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_specials_ranged_skaven_short_cata = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_weave_special",
			amount = 2,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_specials_random_mixed_short_cata = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_specials_chaos_short_cata = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM2
		},
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_requirement = CATACLYSM3
		}
	},
	main_path_event_boss_beastmen_minotaur_cata = {
		{
			"spawn_weave_special",
			amount = 1,
			breed_name = {
				"beastmen_minotaur"
			},
			difficulty_requirement = CATACLYSM
		}
	},
	main_path_event_boss_stormfiend = {
		{
			"spawn_weave_special",
			1,
			breed_name = {
				"skaven_stormfiend"
			}
		}
	},
	main_path_event_boss_chaos_spawn = {
		{
			"spawn_weave_special",
			1,
			breed_name = {
				"chaos_spawn"
			}
		}
	},
	main_path_event_boss_chaos_troll = {
		{
			"spawn_weave_special",
			1,
			breed_name = {
				"chaos_troll"
			}
		}
	},
	main_path_event_boss_skaven_rat_ogre = {
		{
			"spawn_weave_special",
			1,
			breed_name = {
				"skaven_rat_ogre"
			}
		}
	},
	main_path_event_boss_beastmen_minotaur = {
		{
			"spawn_weave_special",
			1,
			breed_name = {
				"beastmen_minotaur"
			}
		}
	},
	main_path_horde_skaven_short = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_horde_skaven_short"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_horde_skaven_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_horde_skaven_medium"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	main_path_horde_skaven_long = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"set_master_event_running",
			name = "main_path_horde_skaven_long"
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies_during_event() < 3
			end
		},
		{
			"ambush_horde",
			composition_type = "weave_event_medium",
			sound_settings = horde_sound_settings.skaven
		}
	},
	trickle_event_skaven_small = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 40
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"start_event",
			start_event_name = "trickle_event_skaven_small"
		}
	},
	trickle_event_skaven_medium = {},
	trickle_event_skaven_large = {},
	trickle_event_chaos_small = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 40
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"start_event",
			start_event_name = "trickle_event_chaos_small"
		}
	},
	trickle_event_chaos_medium = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 40
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_medium",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"start_event",
			start_event_name = "trickle_event_chaos_medium"
		}
	},
	trickle_event_chaos_large = {},
	trickle_event_beastmen_small = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 40
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_beastmen_small",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"start_event",
			start_event_name = "trickle_event_beastmen_small"
		}
	},
	trickle_event_beastmen_medium = {},
	trickle_event_beastmen_large = {},
	trickle_event_mixed_small = {},
	trickle_event_mixed_medium = {},
	trickle_event_mixed_large = {},
	trickle_event_mixed_small_slow = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 60
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 60
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_armour",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 60
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_berzerkers",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"start_event",
			start_event_name = "trickle_event_mixed_small_slow"
		}
	},
	trickle_event_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_armour",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_berzerkers",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"start_event",
			start_event_name = "trickle_event_01"
		}
	},
	trickle_event_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_armour",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_beastmen_small",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"start_event",
			start_event_name = "trickle_event_02"
		}
	},
	trickle_event_03 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_berzerker_skaven",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_horde_skaven_large",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_beastmen_small",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"start_event",
			start_event_name = "trickle_event_03"
		}
	},
	trickle_event_04 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_skaven_small",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"start_event",
			start_event_name = "trickle_event_04"
		}
	},
	trickle_event_05 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_berzerkers",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"start_event",
			start_event_name = "trickle_event_05"
		}
	},
	trickle_event_specials = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 60
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 60
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_small",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 60
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_berzerkers",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"start_event",
			start_event_name = "trickle_event_specials"
		}
	},
	trickle_event_06 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_elite_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 30
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_berzerkers",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"start_event",
			start_event_name = "trickle_event_06"
		}
	},
	trickle_event_06_slow = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 60
		},
		{
			"ambush_horde",
			composition_type = "weave_spice_elite_chaos",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 60
		},
		{
			"ambush_horde",
			composition_type = "weave_trickle_chaos_berzerkers",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"start_event",
			start_event_name = "trickle_event_06_slow"
		}
	},
	trickle_event_armour = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 90
		},
		{
			"ambush_horde",
			composition_type = "weave_chaos_warriors",
			sound_settings = horde_sound_settings.chaos
		},
		{
			"delay",
			duration = 90
		},
		{
			"ambush_horde",
			composition_type = "weave_boss_skaven_armour",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"start_event",
			start_event_name = "trickle_event_armour"
		}
	},
	trickle_event_explosive_rats = {
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 60
		},
		{
			"ambush_horde",
			composition_type = "weave_explosive_horde_medium",
			sound_settings = horde_sound_settings.skaven
		},
		{
			"start_event",
			start_event_name = "trickle_event_explosive_rats"
		}
	},
	void_arena_event_dual_spawn = {
		{
			"set_master_event_running",
			name = "void_arena_boss"
		},
		{
			"spawn",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"spawn",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_stormfiend") < 1 and count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "void_arena_boss_dead"
		}
	},
	arena_fight_1 = {
		{
			"set_master_event_running",
			name = "arena_fight_1"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_shields"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_warriors"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_warriors"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_chaos_shields"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "arena_fight1",
			composition_type = "weave_event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "arena_fight2",
			composition_type = "weave_chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_fight_1_done"
		},
		{
			"delay",
			duration = 10
		}
	}
}

return terror_event_blueprints
