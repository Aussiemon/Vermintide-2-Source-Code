-- chunkname: @scripts/settings/terror_events/terror_events_dlc_morris_arena_belakor.lua

local RECRUIT = 2
local VETERAN = 3
local CHAMPION = 4
local LEGENDARY = 5
local CATACLYSM = 6
local SHORT = 8
local LONG = 16
local AROUND_STATUE_SPAWNS_DELAY_WAVE_1 = 2
local AROUND_STATUE_SPAWNS_DELAY_WAVE_2 = 4
local AROUND_STATUE_SPAWNS_DELAY_SPAWN = 4
local AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT = 9
local AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED = 9
local AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG = 9
local AROUND_STATUE_SPAWNS_SPREAD_TIGHT = 4
local AROUND_STATUE_SPAWNS_SPREAD_MED = 4
local AROUND_STATUE_SPAWNS_SPREAD_WIDE = 4
local DECAL_RADIUS_MAP = {
	boss = 2,
	default = 1,
	elite = 1.2,
	special = 1.2,
}
local SPAWN_DECAL_UNIT_NAME = "units/decals/deus_decal_aoe_cursedchest_01"
local SPAWN_PARTICLE_NAME = "fx/cursed_chest_spawn_01_portal"

local function spawn_decal_func(event, element, boxed_spawn_pos, breed_name)
	local decal_map = event.decal_map or {}

	event.decal_map = decal_map

	local breed = Breeds[breed_name]
	local spawn_radius

	if breed.boss then
		spawn_radius = DECAL_RADIUS_MAP.boss
	elseif breed.special then
		spawn_radius = DECAL_RADIUS_MAP.special
	elseif breed.elite then
		spawn_radius = DECAL_RADIUS_MAP.elite
	else
		spawn_radius = DECAL_RADIUS_MAP.default
	end

	local spawn_pos = boxed_spawn_pos:unbox()
	local decal_unit, decal_unit_go_id
	local decal_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), spawn_pos)
	local decal_radius = spawn_radius

	Matrix4x4.set_scale(decal_spawn_pose, Vector3(decal_radius, decal_radius, decal_radius))

	decal_unit, decal_unit_go_id = Managers.state.unit_spawner:spawn_network_unit(SPAWN_DECAL_UNIT_NAME, "network_synched_dummy_unit", nil, decal_spawn_pose)

	local particle_name = SPAWN_PARTICLE_NAME
	local offset = Vector3(0, 0, 0)
	local rotation_offset = Quaternion.identity()
	local linked = true
	local object = 0

	Managers.state.event:trigger("event_play_particle_effect", particle_name, decal_unit, object, offset, rotation_offset, linked)

	local network_manager = Managers.state.network

	network_manager.network_transmit:send_rpc_clients("rpc_play_particle_effect", NetworkLookup.effects[particle_name], decal_unit_go_id, object, offset, rotation_offset, linked)

	decal_map[boxed_spawn_pos] = decal_unit
end

local function cursed_chest_enemy_despawn_decal_func(event, element, boxed_spawn_pos)
	local decal_map = event.decal_map
	local unit = decal_map and decal_map[boxed_spawn_pos]

	if unit then
		Managers.state.unit_spawner:mark_for_deletion(unit)

		decal_map[boxed_spawn_pos] = nil
	end
end

local terror_event_blueprints = {}

terror_event_blueprints.arena_belakor_terror_phase_1 = {
	{
		"inject_event",
		event_name = "arena_belakor_terror_phase_1_start",
	},
	{
		"inject_event",
		event_name = "arena_belakor_terror_phase_1_sequence",
	},
}
terror_event_blueprints.arena_belakor_terror_phase_1_start = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
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
		"enable_bots_in_carry_event",
	},
	{
		"set_freeze_condition",
		max_active_enemies = 100,
	},
	{
		"set_wwise_override_state",
		name = "terror_mb4",
	},
}
terror_event_blueprints.arena_belakor_terror_phase_1_sequence = {
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_terror_phase_1_skaven",
			"arena_belakor_terror_phase_1_chaos",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_terror_phase_1_beastmen",
			"arena_belakor_terror_phase_1_skaven",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_terror_phase_1_chaos",
			"arena_belakor_terror_phase_1_beastmen",
		},
		faction_requirement_list = {
			"chaos",
			"beastmen",
		},
	},
}
terror_event_blueprints.arena_belakor_terror_phase_1_skaven = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
	},
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger",
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_skaven_special",
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_phase_1_done",
	},
}
terror_event_blueprints.arena_belakor_terror_phase_1_chaos = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
	},
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger",
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_chaos_special",
	},
	{
		"event_horde",
		composition_type = "event_small_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_phase_1_done",
	},
}
terror_event_blueprints.arena_belakor_terror_phase_1_beastmen = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
	},
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger",
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_beastmen_special",
	},
	{
		"event_horde",
		composition_type = "event_small_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_phase_1_done",
	},
}
terror_event_blueprints.arena_belakor_terror_end = {
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_done",
	},
	{
		"disable_bots_in_carry_event",
	},
	{
		"set_wwise_override_state",
		name = "terror_mb4",
	},
}
terror_event_blueprints.arena_belakor_terror_specials = {
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_terror_skaven_specials",
			"arena_belakor_terror_chaos_specials",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_terror_skaven_specials",
			"arena_belakor_terror_beastmen_specials",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_terror_chaos_specials",
			"arena_belakor_terror_beastmen_specials",
		},
		faction_requirement_list = {
			"chaos",
			"beastmen",
		},
	},
}
terror_event_blueprints.arena_belakor_terror_skaven_specials = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "arena_belakor_specials",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_gutter_runner",
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_ratling_gunner",
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
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "arena_belakor_specials",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_gutter_runner",
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_ratling_gunner",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 1,
			harder = 1,
			hardest = 1,
			normal = 1,
		},
		difficulty_requirement = LEGENDARY,
	},
	{
		"delay",
		duration = 10,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.special < 1
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_specials_done",
	},
}
terror_event_blueprints.arena_belakor_terror_chaos_specials = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "arena_belakor_specials",
		breed_name = {
			"chaos_corruptor_sorcerer",
			"chaos_vortex_sorcerer",
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
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "arena_belakor_specials",
		breed_name = {
			"chaos_corruptor_sorcerer",
			"chaos_vortex_sorcerer",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 1,
			harder = 2,
			hardest = 1,
			normal = 1,
		},
		difficulty_requirement = LEGENDARY,
	},
	{
		"delay",
		duration = 10,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.special < 1
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_specials_done",
	},
}
terror_event_blueprints.arena_belakor_terror_beastmen_specials = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
	},
	{
		"spawn_at_raw",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "special",
		spawner_id = "arena_belakor_specials",
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
		duration = 10,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.special < 1
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_specials_done",
	},
}
terror_event_blueprints.arena_belakor_terror_phase_2 = {
	{
		"inject_event",
		event_name = "arena_belakor_terror_phase_2_start",
	},
	{
		"inject_event",
		event_name = "arena_belakor_terror_phase_2_sequence",
	},
}
terror_event_blueprints.arena_belakor_terror_phase_2_start = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
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
		"enable_bots_in_carry_event",
	},
	{
		"set_freeze_condition",
		max_active_enemies = 100,
	},
	{
		"set_wwise_override_state",
		name = "terror_mb4",
	},
}
terror_event_blueprints.arena_belakor_terror_phase_2_sequence = {
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_terror_phase_2_skaven",
			"arena_belakor_terror_phase_2_chaos",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_terror_phase_2_beastmen",
			"arena_belakor_terror_phase_2_skaven",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_terror_phase_2_chaos",
			"arena_belakor_terror_phase_2_beastmen",
		},
		faction_requirement_list = {
			"chaos",
			"beastmen",
		},
	},
}
terror_event_blueprints.arena_belakor_terror_phase_2_skaven = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
	},
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger",
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_skaven_special",
	},
	{
		"event_horde",
		composition_type = "event_medium",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "event_medium",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "event_medium",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "event_medium",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_phase_2_done",
	},
}
terror_event_blueprints.arena_belakor_terror_phase_2_chaos = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
	},
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger",
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_chaos_special",
	},
	{
		"event_horde",
		composition_type = "event_medium_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "event_medium_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "event_medium_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "event_medium_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_phase_2_done",
	},
}
terror_event_blueprints.arena_belakor_terror_phase_2_beastmen = {
	{
		"set_master_event_running",
		name = "arena_belakor_terror",
	},
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger",
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_beastmen_special",
	},
	{
		"event_horde",
		composition_type = "event_medium_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "event_medium_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "event_medium_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "event_medium_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_c",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
	{
		"flow_event",
		flow_event_name = "arena_belakor_terror_phase_2_done",
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns = {
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_around_statue_spawns_faction_skaven",
			"arena_belakor_around_statue_spawns_faction_chaos",
			"arena_belakor_around_statue_spawns_faction_chaos",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_around_statue_spawns_faction_skaven",
			"arena_belakor_around_statue_spawns_faction_beastmen",
			"arena_belakor_around_statue_spawns_faction_beastmen",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"arena_belakor_around_statue_spawns_faction_chaos",
			"arena_belakor_around_statue_spawns_faction_beastmen",
		},
		faction_requirement_list = {
			"chaos",
			"beastmen",
		},
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_faction_skaven = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "arena_belakor_around_statue_spawns_vermin_shielded",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_stormvermin",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_plague_monks",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_skaven_warpfire_thrower",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_skaven_ratling_gunner",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_skaven_poison_wind_globadier",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_skaven_rat_ogre",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_skaven_stormfiend",
						weight = 3,
					},
				},
			},
		},
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_stormvermin = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_storm_vermin_commander",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 4,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 4
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_storm_vermin_commander",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 4,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 4
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_storm_vermin_commander",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 4,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_vermin_shielded = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_storm_vermin_with_shield",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat_with_shield",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 7,
			harder = 7,
			hardest = 8,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_storm_vermin_with_shield",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat_with_shield",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 7,
			harder = 7,
			hardest = 8,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_plague_monks = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_plague_monk",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 12,
			hard = 7,
			harder = 9,
			hardest = 10,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_plague_monk",
		distance_to_players = 3,
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 12,
			hard = 7,
			harder = 9,
			hardest = 10,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_plague_monk",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 3,
			hardest = 5,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 12,
			hard = 7,
			harder = 9,
			hardest = 10,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_skaven_warpfire_thrower = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_warpfire_thrower",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_warpfire_thrower",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_warpfire_thrower",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_skaven_ratling_gunner = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_ratling_gunner",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_ratling_gunner",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_ratling_gunner",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_skaven_poison_wind_globadier = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_poison_wind_globadier",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_poison_wind_globadier",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_poison_wind_globadier",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_skaven_rat_ogre = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "cursed_chest_enemies",
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
		pre_spawn_func = TerrorEventUtils.add_enhancements_for_difficulty,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_skaven_stormfiend = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "cursed_chest_enemies",
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
		pre_spawn_func = TerrorEventUtils.add_enhancements_for_difficulty,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 18,
			hard = 12,
			harder = 14,
			hardest = 16,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_faction_chaos = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "arena_belakor_around_statue_spawns_chaos_raider",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_chaos_berzerker",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_chaos_warrior",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_chaos_vortex_sorcerer",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_chaos_corruptor_sorcerer",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_chaos_troll",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_chaos_spawn",
						weight = 3,
					},
				},
			},
		},
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_chaos_raider = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_raider",
		spawn_counter_category = "cursed_chest_enemies",
		spawn_delay = 4,
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		spawn_delay = 4,
		difficulty_amount = {
			cataclysm = 8,
			hard = 7,
			harder = 7,
			hardest = 8,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_raider",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 7,
			harder = 7,
			hardest = 8,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_raider",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 7,
			harder = 7,
			hardest = 8,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_chaos_berzerker = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_berzerker",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 5,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_berzerker",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 5,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_berzerker",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 5,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_chaos_warrior = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_warrior",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 2,
			harder = 3,
			hardest = 3,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_fanatic",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 4
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_warrior",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 2,
			harder = 3,
			hardest = 3,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 10,
			hard = 6,
			harder = 7,
			hardest = 8,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 4
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_warrior",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 2,
			harder = 3,
			hardest = 3,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 10,
			hard = 6,
			harder = 7,
			hardest = 8,
			normal = 6,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_chaos_vortex_sorcerer = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_fanatic",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_vortex_sorcerer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 6
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 10,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_fanatic",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_vortex_sorcerer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 6
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 10,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_fanatic",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_vortex_sorcerer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_chaos_corruptor_sorcerer = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_fanatic",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 6
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 10,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_fanatic",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 6
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 10,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_fanatic",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_chaos_troll = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_troll",
		spawn_counter_category = "cursed_chest_enemies",
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
		pre_spawn_func = TerrorEventUtils.add_enhancements_for_difficulty,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_fanatic",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 16,
			hard = 10,
			harder = 12,
			hardest = 14,
			normal = 8,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 10,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_fanatic",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 16,
			hard = 10,
			harder = 12,
			hardest = 14,
			normal = 8,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_chaos_spawn = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_spawn",
		spawn_counter_category = "cursed_chest_enemies",
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
		pre_spawn_func = TerrorEventUtils.add_enhancements_for_difficulty,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 16,
			hard = 10,
			harder = 12,
			hardest = 14,
			normal = 8,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_faction_beastmen = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "arena_belakor_around_statue_spawns_beastmen_bestigor_bearer",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_beastmen_horde_bearer",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_beastmen_ungor_archer",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_beastmen_bestigor",
						weight = 3,
					},
					{
						event_name = "arena_belakor_around_statue_spawns_beastmen_minotaur",
						weight = 3,
					},
				},
			},
		},
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_beastmen_bestigor_bearer = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_bestigor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 2,
			harder = 3,
			hardest = 3,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 2
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_bestigor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 2,
			harder = 3,
			hardest = 3,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 2
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_bestigor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_beastmen_horde_bearer = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 1,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 10
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 1,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_elites <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 10
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 1,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_elites <= 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_beastmen_ungor_archer = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor_archer",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 16,
			hard = 12,
			harder = 12,
			hardest = 14,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 10,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor_archer",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 16,
			hard = 12,
			harder = 12,
			hardest = 14,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 10,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor_archer",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 16,
			hard = 12,
			harder = 12,
			hardest = 14,
			normal = 10,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_SPAWN_DISTANCE_MED + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 40,
			hard = 32,
			harder = 34,
			hardest = 38,
			normal = 30,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_beastmen_bestigor = {
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_bestigor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 4,
			hardest = 4,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_gor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 5,
			harder = 5,
			hardest = 5,
			normal = 5,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 2
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_bestigor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 4,
			hardest = 4,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_gor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 5,
			harder = 5,
			hardest = 5,
			normal = 5,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 2
		end,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_bestigor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 4,
			hardest = 4,
			normal = 2,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_gor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 5,
			harder = 5,
			hardest = 5,
			normal = 5,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}
terror_event_blueprints.arena_belakor_around_statue_spawns_beastmen_minotaur = {
	{
		"delay",
		duration = AROUND_STATUE_SPAWNS_DELAY_WAVE_1,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_minotaur",
		spawn_counter_category = "cursed_chest_enemies",
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_LONG + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
		pre_spawn_func = TerrorEventUtils.add_enhancements_for_difficulty,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_gor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 16,
			hard = 10,
			harder = 12,
			hardest = 14,
			normal = 8,
		},
		min_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT - AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		max_distance = AROUND_STATUE_SPAWNS_SPAWN_DISTANCE_SHORT + AROUND_STATUE_SPAWNS_SPREAD_MED * 0.5,
		pre_spawn_unit_func = spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = AROUND_STATUE_SPAWNS_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.cursed_chest_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}

return terror_event_blueprints
