-- chunkname: @scripts/settings/dlcs/morris/deus_generic_terror_events.lua

require("scripts/settings/dlcs/morris/deus_terror_event_tags")

local stagger_types = require("scripts/utils/stagger_types")
local RECRUIT = 2
local VETERAN = 3
local CHAMPION = 4
local LEGENDARY = 5
local CATACLYSM = 6
local SHORT = 8
local LONG = 16
local cursed_chest_enemy_pre_spawn_func

cursed_chest_enemy_pre_spawn_func = TerrorEventUtils.add_enhancements_for_difficulty

local function cursed_chest_enemy_spawned_func(unit, breed, optional_data)
	if not breed.special and not breed.boss and not breed.cannot_be_aggroed then
		local player_unit = PlayerUtils.get_random_alive_hero()

		AiUtils.aggro_unit_of_enemy(unit, player_unit)
	end

	local buff_system = Managers.state.entity:system("buff_system")

	buff_system:add_buff(unit, "cursed_chest_objective_unit", unit)

	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		local sound_event = "Play_normal_spawn_stinger"

		if breed.special or breed.boss then
			sound_event = "Play_special_spawn_stinger"
		end

		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(sound_event, unit)
	end
end

local function cursed_chest_boss_spawn_function(unit, breed, optional_data)
	local buff_system = Managers.state.entity:system("buff_system")

	buff_system:add_buff(unit, "objective_unit", unit)
	cursed_chest_enemy_spawned_func(unit, breed, optional_data)
end

GenericTerrorEvents.cursed_chest_prototype = {
	{
		"set_master_event_running",
		name = "cursed_chest_prototype",
	},
	{
		"inject_event",
		event_name_list = {
			"cursed_chest_challenge_faction_skaven",
			"cursed_chest_challenge_faction_chaos",
			"cursed_chest_challenge_faction_chaos",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"cursed_chest_challenge_faction_skaven",
			"cursed_chest_challenge_faction_beastmen",
			"cursed_chest_challenge_faction_beastmen",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"cursed_chest_challenge_faction_chaos",
			"cursed_chest_challenge_faction_beastmen",
		},
		faction_requirement_list = {
			"chaos",
			"beastmen",
		},
	},
}

local CURSED_CHEST_DELAY_WAVE_1 = 2
local CURSED_CHEST_DELAY_WAVE_2 = 4
local CURSED_CHEST_DELAY_SPAWN = 4
local CURSED_CHEST_SPAWN_DISTANCE_SHORT = 8
local CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED = 15
local CURSED_CHEST_SPAWN_DISTANCE_LONG = 20
local CURSED_CHEST_SPREAD_TIGHT = 5
local CURSED_CHEST_SPREAD_MED = 7
local CURSED_CHEST_SPREAD_WIDE = 9
local DECAL_RADIUS_MAP = {
	boss = 2,
	default = 1,
	elite = 1.2,
	special = 1.2,
}
local SPAWN_DECAL_UNIT_NAME = "units/decals/deus_decal_aoe_cursedchest_01"

local function cursed_chest_enemy_spawn_decal_func(event, element, boxed_spawn_pos, breed_name)
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
	decal_map[boxed_spawn_pos] = decal_unit
end

local function cursed_chest_enemy_despawn_decal_func(event, element, boxed_spawn_pos)
	local decal_map = event.decal_map
	local unit = decal_map and decal_map[boxed_spawn_pos]

	if unit then
		Unit.flow_event(unit, "despawned")

		local unit_go_id = Managers.state.unit_storage:go_id(unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_flow_event", unit_go_id, NetworkLookup.flow_events.despawned)

		decal_map[boxed_spawn_pos] = nil
	end
end

local BELAKOR_ALTAR_MIN_DISTANCE_CULTIST_SPAWN = 2.5
local BELAKOR_ALTAR_MAX_DISTANCE_CULTIST_SPAWN = 3.5
local BELAKOR_ALTAR_MAX_ABOVE_CULTIST_SPAWN = 1
local BELAKOR_ALTAR_MAX_BELOW_CULTIST_SPAWN = 1
local BELAKOR_ALTAR_CULTIST_DISTANCE = 1
local BELAKOR_ALTAR_ROW_DISTANCE = 0.5
local BELAKOR_ALTAR_CIRCLE_SUBDIVISION = 8
local BELAKOR_CHAMPION_CIRCLE_SUBDIVISION = 64
local BELAKOR_CHAMPION_CIRCLE_TRIES = 192
local BELAKOR_CULTIST_IDLE_ANIMATIONS = {
	"idle_pray_01",
	"idle_pray_02",
	"idle_pray_03",
	"idle_pray_04",
	"idle_pray_05",
}

GenericTerrorEvents.cursed_chest_challenge_faction_skaven = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_vermin_shielded",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_stormvermin",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_plague_monks",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_ELITES,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_skaven_warpfire_thrower",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_ratling_gunner",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_poison_wind_globadier",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_SPECIALS,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_skaven_rat_ogre",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_stormfiend",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_double_monster",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_MONSTERS,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_vermin_shielded",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_stormvermin",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_plague_monks",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_warpfire_thrower",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_ratling_gunner",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_poison_wind_globadier",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_rat_ogre",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_stormfiend",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_double_monster",
						weight = 3,
					},
				},
			},
		},
	},
}
GenericTerrorEvents.cursed_chest_challenge_stormvermin = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_stormvermin",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_storm_vermin_commander",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 10,
			hard = 7,
			harder = 8,
			hardest = 9,
			normal = 6,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_TIGHT * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
			cataclysm = 10,
			hard = 7,
			harder = 8,
			hardest = 9,
			normal = 6,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_TIGHT * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
			cataclysm = 10,
			hard = 7,
			harder = 8,
			hardest = 9,
			normal = 6,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_TIGHT * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_stormvermin",
	},
}
GenericTerrorEvents.cursed_chest_challenge_vermin_shielded = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_vermin_shielded",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_storm_vermin_with_shield",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 4,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_TIGHT * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat_with_shield",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 7,
			harder = 6,
			hardest = 5,
			normal = 8,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_TIGHT * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 4,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_TIGHT * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat_with_shield",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 7,
			harder = 6,
			hardest = 5,
			normal = 8,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_TIGHT * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_TIGHT * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_vermin_shielded",
	},
}
GenericTerrorEvents.cursed_chest_challenge_plague_monks = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_plague_monks",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_plague_monk",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 4,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 10,
			harder = 9,
			hardest = 7,
			normal = 12,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 4,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 10,
			harder = 9,
			hardest = 7,
			normal = 12,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
			cataclysm = 8,
			hard = 5,
			harder = 6,
			hardest = 7,
			normal = 4,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_clan_rat",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 10,
			harder = 9,
			hardest = 7,
			normal = 12,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_plague_monks",
	},
}
GenericTerrorEvents.cursed_chest_challenge_skaven_warpfire_thrower = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_skaven_warpfire_thrower",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_warpfire_thrower",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_warpfire_thrower",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_warpfire_thrower",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_skaven_warpfire_thrower",
	},
}
GenericTerrorEvents.cursed_chest_challenge_skaven_ratling_gunner = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_skaven_ratling_gunner",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_ratling_gunner",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_ratling_gunner",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_ratling_gunner",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_skaven_ratling_gunner",
	},
}
GenericTerrorEvents.cursed_chest_challenge_skaven_poison_wind_globadier = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_skaven_poison_wind_globadier",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_poison_wind_globadier",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_poison_wind_globadier",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_poison_wind_globadier",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_skaven_poison_wind_globadier",
	},
}
GenericTerrorEvents.cursed_chest_challenge_skaven_rat_ogre = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_skaven_rat_ogre",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "cursed_chest_enemies",
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
		pre_spawn_func = cursed_chest_enemy_pre_spawn_func,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_skaven_rat_ogre",
	},
}
GenericTerrorEvents.cursed_chest_challenge_skaven_stormfiend = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_skaven_stormfiend",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "cursed_chest_enemies",
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
		pre_spawn_func = cursed_chest_enemy_pre_spawn_func,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_skaven_stormfiend",
	},
}
GenericTerrorEvents.cursed_chest_challenge_double_monster = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_double_monster",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		spawn_counter_category = "cursed_chest_enemies",
		breed_name = {
			"skaven_rat_ogre",
			"skaven_stormfiend",
			"chaos_troll",
			"chaos_spawn",
		},
		optional_data = {
			max_health_modifier = 0.5,
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
		pre_spawn_func = cursed_chest_enemy_pre_spawn_func,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"spawn_around_origin_unit",
		spawn_counter_category = "cursed_chest_enemies",
		breed_name = {
			"skaven_rat_ogre",
			"skaven_stormfiend",
			"chaos_troll",
			"chaos_spawn",
		},
		optional_data = {
			max_health_modifier = 0.5,
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
		pre_spawn_func = cursed_chest_enemy_pre_spawn_func,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_double_monster",
	},
}
GenericTerrorEvents.cursed_chest_challenge_faction_chaos = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_chaos_raider",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_berzerker",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_warrior",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_bulwark",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_ELITES,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_skaven_warpfire_thrower",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_ratling_gunner",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_poison_wind_globadier",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_SPECIALS,
					DeusTerrorEventTags.NO_SORCERERS,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_chaos_vortex_sorcerer",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_corruptor_sorcerer",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_SPECIALS,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_chaos_troll",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_spawn",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_MONSTERS,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_chaos_raider",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_berzerker",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_warrior",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_bulwark",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_warpfire_thrower",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_ratling_gunner",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_skaven_poison_wind_globadier",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_troll",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_spawn",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.NO_SORCERERS,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_chaos_raider",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_berzerker",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_warrior",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_bulwark",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_vortex_sorcerer",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_corruptor_sorcerer",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_troll",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_chaos_spawn",
						weight = 3,
					},
				},
			},
		},
	},
}
GenericTerrorEvents.cursed_chest_challenge_chaos_raider = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_chaos_raider",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_raider",
		spawn_counter_category = "cursed_chest_enemies",
		spawn_delay = 4,
		difficulty_amount = {
			cataclysm = 7,
			hard = 4,
			harder = 5,
			hardest = 6,
			normal = 3,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		spawn_delay = 4,
		difficulty_amount = {
			cataclysm = 5,
			hard = 8,
			harder = 7,
			hardest = 6,
			normal = 9,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_raider",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 7,
			hard = 4,
			harder = 5,
			hardest = 6,
			normal = 3,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 8,
			harder = 7,
			hardest = 6,
			normal = 9,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_raider",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 7,
			hard = 4,
			harder = 5,
			hardest = 6,
			normal = 3,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 8,
			harder = 7,
			hardest = 6,
			normal = 9,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_chaos_raider",
	},
}
GenericTerrorEvents.cursed_chest_challenge_chaos_berzerker = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_chaos_berzerker",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_berzerker",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 7,
			hard = 4,
			harder = 5,
			hardest = 6,
			normal = 3,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 8,
			harder = 7,
			hardest = 6,
			normal = 9,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_berzerker",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 7,
			hard = 4,
			harder = 5,
			hardest = 6,
			normal = 3,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 8,
			harder = 7,
			hardest = 6,
			normal = 9,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 5
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_berzerker",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 7,
			hard = 4,
			harder = 5,
			hardest = 6,
			normal = 3,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 8,
			harder = 7,
			hardest = 6,
			normal = 9,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_chaos_berzerker",
	},
}
GenericTerrorEvents.cursed_chest_challenge_chaos_warrior = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_chaos_warrior",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_warrior",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 9,
			harder = 8,
			hardest = 7,
			normal = 10,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 4
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_warrior",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 9,
			harder = 8,
			hardest = 7,
			normal = 10,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 4
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_warrior",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 9,
			harder = 8,
			hardest = 7,
			normal = 10,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_chaos_warrior",
	},
}
GenericTerrorEvents.cursed_chest_challenge_chaos_bulwark = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_chaos_bulwark",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_bulwark",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 9,
			harder = 8,
			hardest = 7,
			normal = 10,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 4
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_bulwark",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 9,
			harder = 8,
			hardest = 7,
			normal = 10,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 4
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_bulwark",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 3,
			harder = 4,
			hardest = 5,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_marauder",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 6,
			hard = 9,
			harder = 8,
			hardest = 7,
			normal = 10,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_chaos_bulwark",
	},
}
GenericTerrorEvents.cursed_chest_challenge_chaos_vortex_sorcerer = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_chaos_vortex_sorcerer",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_chaos_vortex_sorcerer",
	},
}
GenericTerrorEvents.cursed_chest_challenge_chaos_corruptor_sorcerer = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_chaos_corruptor_sorcerer",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_chaos_corruptor_sorcerer",
	},
}
GenericTerrorEvents.cursed_chest_challenge_chaos_troll = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_chaos_troll",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_troll",
		spawn_counter_category = "cursed_chest_enemies",
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
		pre_spawn_func = cursed_chest_enemy_pre_spawn_func,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = 10,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_chaos_troll",
	},
}
GenericTerrorEvents.cursed_chest_challenge_chaos_spawn = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_chaos_spawn",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "chaos_spawn",
		spawn_counter_category = "cursed_chest_enemies",
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
		pre_spawn_func = cursed_chest_enemy_pre_spawn_func,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_chaos_spawn",
	},
}
GenericTerrorEvents.cursed_chest_challenge_faction_beastmen = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_beastmen_ungor_archer",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_beastmen_bestigor",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_ELITES,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_beastmen_bestigor_bearer",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_beastmen_horde_bearer",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_SPECIALS,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_beastmen_minotaur",
						weight = 3,
					},
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_MONSTERS,
				},
			},
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "cursed_chest_challenge_beastmen_bestigor_bearer",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_beastmen_horde_bearer",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_beastmen_ungor_archer",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_beastmen_bestigor",
						weight = 3,
					},
					{
						event_name = "cursed_chest_challenge_beastmen_minotaur",
						weight = 3,
					},
				},
			},
		},
	},
}
GenericTerrorEvents.cursed_chest_challenge_beastmen_bestigor_bearer = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_beastmen_bestigor_bearer",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_bestigor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 2
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_bestigor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 5,
			hard = 3,
			harder = 3,
			hardest = 4,
			normal = 2,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_beastmen_bestigor_bearer",
	},
}
GenericTerrorEvents.cursed_chest_challenge_beastmen_horde_bearer = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_beastmen_horde_bearer",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "cursed_chest_elites",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_beastmen_horde_bearer",
	},
}
GenericTerrorEvents.cursed_chest_challenge_beastmen_ungor_archer = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_beastmen_ungor_archer",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor_archer",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 20,
			hard = 12,
			harder = 14,
			hardest = 18,
			normal = 10,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 10,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor_archer",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 20,
			hard = 12,
			harder = 14,
			hardest = 18,
			normal = 10,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 10,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_ungor_archer",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 20,
			hard = 12,
			harder = 14,
			hardest = 18,
			normal = 10,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_SPAWN_DISTANCE_MED + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_beastmen_ungor_archer",
	},
}
GenericTerrorEvents.cursed_chest_challenge_beastmen_bestigor = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_beastmen_bestigor",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_gor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 7,
			harder = 6,
			hardest = 5,
			normal = 8,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 2
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_gor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 7,
			harder = 6,
			hardest = 5,
			normal = 8,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_2,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 2
		end,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_gor",
		spawn_counter_category = "cursed_chest_enemies",
		difficulty_amount = {
			cataclysm = 4,
			hard = 7,
			harder = 6,
			hardest = 5,
			normal = 8,
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_beastmen_bestigor",
	},
}
GenericTerrorEvents.cursed_chest_challenge_beastmen_minotaur = {
	{
		"start_mission",
		mission_name = "cursed_chest_challenge_beastmen_minotaur",
	},
	{
		"delay",
		duration = CURSED_CHEST_DELAY_WAVE_1,
	},
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger",
	},
	{
		"spawn_around_origin_unit",
		breed_name = "beastmen_minotaur",
		spawn_counter_category = "cursed_chest_enemies",
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_LONG + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
		pre_spawn_func = cursed_chest_enemy_pre_spawn_func,
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
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = cursed_chest_enemy_spawned_func,
		},
		min_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT - CURSED_CHEST_SPREAD_MED * 0.5,
		max_distance = CURSED_CHEST_SPAWN_DISTANCE_SHORT + CURSED_CHEST_SPREAD_MED * 0.5,
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		spawn_delay = CURSED_CHEST_DELAY_SPAWN,
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
	{
		"end_mission",
		mission_name = "cursed_chest_challenge_beastmen_minotaur",
	},
}
GenericTerrorEvents.cursed_chest_challenge_test = {
	{
		"set_master_event_running",
		name = "cursed_chest_prototype",
	},
	{
		"event_horde",
		composition_type = "cursed_chest_challenge_test",
		spawn_counter_category = "cursed_chest_enemies",
		optional_data = {
			spawned_func = function (unit, breed, optional_data)
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "objective_unit", unit)
			end,
		},
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
		duration = 60,
		condition = function (counter)
			return counter.cursed_chest_enemies <= 0
		end,
	},
}

local POSSIBLE_SHADOW_LIEUTENANT_GRUDGE_MARK_NAMES = {
	{
		crippling = true,
		frenzy = true,
		intangible = true,
	},
	{
		periodic_curse = true,
		regenerating = true,
		unstaggerable = true,
	},
	{
		crushing = true,
		ranged_immune = true,
		vampiric = true,
	},
}
local shadow_lieutenant_vo_table = {
	"shadow_curse_sc1_spawn",
	"shadow_curse_sc2_spawn",
	"shadow_curse_sc3_spawn",
}

local function belakor_shadow_lieutenant_spawn(locus_type_id, add_base_enhancement)
	return {
		{
			"play_stinger",
			stinger_name = "Play_wave_start_spawn_stinger_small",
		},
		{
			"inject_event",
			event_name_list = {
				"belakor_locus_wave_one_one",
				"belakor_locus_wave_one_two",
				"belakor_locus_wave_one_three",
			},
			faction_requirement_list = {},
		},
		{
			"continue_when_spawned_count",
			duration = 4,
			condition = function (counter)
				return counter.belakor_totem_enemies < 1
			end,
		},
		{
			"inject_event",
			event_name_list = {
				"belakor_locus_wave_two_one",
				"belakor_locus_wave_two_two",
				"belakor_locus_wave_two_three",
			},
			faction_requirement_list = {},
		},
		{
			"continue_when_spawned_count",
			duration = 4,
			condition = function (counter)
				return counter.belakor_totem_enemies < 1
			end,
		},
		{
			"spawn_around_origin_unit",
			breed_name = "shadow_lieutenant",
			check_line_of_sight = true,
			face_nearest_player_of_side = "heroes",
			spawn_counter_category = "belakor_altar_enemies",
			difficulty_amount = {
				cataclysm = 1,
				hard = 1,
				harder = 1,
				hardest = 1,
				normal = 1,
			},
			optional_data = {
				prevent_killed_enemy_dialogue = true,
				spawned_func = function (unit, breed, optional_data)
					if not breed.special and not breed.boss and not breed.cannot_be_aggroed then
						local player_unit = PlayerUtils.get_random_alive_hero()

						AiUtils.aggro_unit_of_enemy(unit, player_unit)
					end

					local buff_system = Managers.state.entity:system("buff_system")

					buff_system:add_buff(unit, "belakor_shadow_lieutenant", unit)

					local blackboard = BLACKBOARDS[unit]

					if blackboard then
						local world = blackboard.world
						local sound_event = "shadow_lieutenant_spawn"

						WwiseUtils.trigger_unit_event(world, sound_event, unit, 0)
					end

					local dialogue_event = shadow_lieutenant_vo_table[locus_type_id]

					if dialogue_event then
						local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
						local event_data = FrameTable.alloc_table()

						dialogue_input:trigger_dialogue_event(dialogue_event, event_data)
					end
				end,
			},
			min_distance = BELAKOR_ALTAR_MIN_DISTANCE_CULTIST_SPAWN,
			max_distance = BELAKOR_ALTAR_MAX_DISTANCE_CULTIST_SPAWN,
			row_distance = BELAKOR_ALTAR_ROW_DISTANCE,
			above_max = BELAKOR_ALTAR_MAX_ABOVE_CULTIST_SPAWN,
			below_max = BELAKOR_ALTAR_MAX_BELOW_CULTIST_SPAWN,
			distance_to_enemies = BELAKOR_ALTAR_CULTIST_DISTANCE,
			circle_subdivision = BELAKOR_CHAMPION_CIRCLE_SUBDIVISION,
			tries = BELAKOR_CHAMPION_CIRCLE_TRIES,
			pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
			post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
			spawn_delay = CURSED_CHEST_DELAY_SPAWN,
			pre_spawn_func = function (optional_data, difficulty, breed_name, event, difficulty_tweak)
				optional_data = optional_data or {}

				if add_base_enhancement then
					optional_data.enhancements = {
						BreedEnhancements.base,
					}
				end

				local possible_grudge_mark_names = POSSIBLE_SHADOW_LIEUTENANT_GRUDGE_MARK_NAMES[locus_type_id]
				local number_of_grudgemarks = 2

				for i = 1, number_of_grudgemarks do
					if possible_grudge_mark_names and not table.is_empty(possible_grudge_mark_names) then
						local available_enhancements = {}

						for name, data in pairs(BreedEnhancements) do
							if possible_grudge_mark_names[name] then
								table.insert(available_enhancements, data)
							end
						end

						if #available_enhancements > 0 then
							local random_index = Math.random(1, #available_enhancements)
							local random_enhancement = available_enhancements[random_index]

							table.insert(optional_data.enhancements, random_enhancement)
						end
					end
				end

				return optional_data
			end,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when_spawned_count",
			duration = 20,
			condition = function (counter)
				return counter.belakor_altar_enemies > 0
			end,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.belakor_altar_enemies <= 0
			end,
		},
	}
end

GenericTerrorEvents.belakor_shadow_lieutenant_spawn = belakor_shadow_lieutenant_spawn(-1, true)
GenericTerrorEvents.belakor_altar_shadow_lieutenant_spawn_01 = belakor_shadow_lieutenant_spawn(1, true)
GenericTerrorEvents.belakor_altar_shadow_lieutenant_spawn_02 = belakor_shadow_lieutenant_spawn(2, true)
GenericTerrorEvents.belakor_altar_shadow_lieutenant_spawn_03 = belakor_shadow_lieutenant_spawn(3, true)
GenericTerrorEvents.belakor_altar_cultists_spawn = {
	{
		"spawn_around_origin_unit",
		check_line_of_sight = true,
		face_unit = true,
		group_template = "deus_belakor_locus_cultists",
		spawn_counter_category = "belakor_altar_enemies",
		breed_spawn_table_per_difficulty = {
			default = {
				"skaven_plague_monk",
				"skaven_clan_rat",
				"skaven_plague_monk",
				"skaven_clan_rat",
				"skaven_plague_monk",
				"skaven_clan_rat",
			},
		},
		optional_data = {
			far_off_despawn_immunity = true,
			ignore_breed_limits = true,
			prevent_killed_enemy_dialogue = true,
			spawned_func = function (unit, breed, optional_data)
				local ai_extension = ScriptUnit.extension(unit, "ai_system")

				ai_extension:set_perception("perception_regular", "pick_closest_target_with_spillover_wakeup_group")

				local blackboard = BLACKBOARDS[unit]

				if blackboard then
					blackboard.ignore_interest_points = true
					blackboard.only_trust_your_own_eyes = true

					local audio_system = Managers.state.entity:system("audio_system")

					audio_system:play_audio_unit_event("Play_normal_spawn_stinger", unit)
				end

				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "belakor_cultists_buff", unit)
			end,
		},
		min_distance = BELAKOR_ALTAR_MIN_DISTANCE_CULTIST_SPAWN,
		max_distance = BELAKOR_ALTAR_MAX_DISTANCE_CULTIST_SPAWN,
		row_distance = BELAKOR_ALTAR_ROW_DISTANCE,
		circle_subdivision = BELAKOR_ALTAR_CIRCLE_SUBDIVISION,
		distance_to_enemies = BELAKOR_ALTAR_CULTIST_DISTANCE,
		above_max = BELAKOR_ALTAR_MAX_ABOVE_CULTIST_SPAWN,
		below_max = BELAKOR_ALTAR_MAX_BELOW_CULTIST_SPAWN,
		pre_spawn_func = function (optional_data, difficulty, breed_name, event, difficulty_tweak)
			optional_data = optional_data or {}
			optional_data.idle_animation = BELAKOR_CULTIST_IDLE_ANIMATIONS[math.random(#BELAKOR_CULTIST_IDLE_ANIMATIONS)]

			return optional_data
		end,
	},
	{
		"delay",
		duration = 1,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.belakor_altar_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.belakor_altar_enemies <= 0
		end,
	},
}

local function belakor_totem_around_origin_line(spawn_table)
	return {
		"spawn_around_origin_unit",
		circle_subdivision = 3,
		distance_to_enemies = 2,
		max_distance = 4,
		min_distance = 2,
		row_distance = 0.5,
		spawn_counter_category = "belakor_totem_enemies",
		spawn_delay = 1.7,
		breed_spawn_table_per_difficulty = spawn_table,
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = function (unit, breed, optional_data)
				if not breed.special and not breed.boss and not breed.cannot_be_aggroed then
					local player_unit = PlayerUtils.get_random_alive_hero()

					AiUtils.aggro_unit_of_enemy(unit, player_unit)

					local blackboard = BLACKBOARDS[unit]

					if blackboard then
						local audio_system = Managers.state.entity:system("audio_system")

						audio_system:play_audio_unit_event("Play_normal_spawn_stinger", unit)
					end
				end
			end,
		},
		pre_spawn_unit_func = cursed_chest_enemy_spawn_decal_func,
		post_spawn_unit_func = cursed_chest_enemy_despawn_decal_func,
		above_max = BELAKOR_ALTAR_MAX_ABOVE_CULTIST_SPAWN,
		below_max = BELAKOR_ALTAR_MAX_BELOW_CULTIST_SPAWN,
	}
end

local totem_spawn_cooldown = BelakorBalancing.totem_spawn_cooldown

GenericTerrorEvents.belakor_easy_totem_spawns = {
	{
		"inject_event",
		event_name_list = {
			"belakor_totem_skaven_slaves",
			"belakor_totem_stormvermin",
			"belakor_totem_clan_rat_with_shield",
			"belakor_totem_clan_rats",
			"belakor_totem_chaos_fanatics",
			"belakor_totem_chaos_marauders",
			"belakor_totem_chaos_raider",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"belakor_totem_skaven_slaves",
			"belakor_totem_stormvermin",
			"belakor_totem_clan_rat_with_shield",
			"belakor_totem_clan_rats",
			"belakor_totem_beastmen_ungor",
			"belakor_totem_beastmen_gor",
			"belakor_totem_beastmen_archers",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
}
GenericTerrorEvents.belakor_hard_totem_spawns = {
	{
		"inject_event",
		event_name_list = {
			"belakor_totem_plague_monk",
			"belakor_totem_stormvermin",
			"belakor_totem_stormvermin_shield",
			"belakor_totem_chaos_raider",
			"belakor_totem_chaos_warriors",
			"belakor_totem_chaos_berzerkers",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"belakor_totem_plague_monk",
			"belakor_totem_stormvermin",
			"belakor_totem_stormvermin_shield",
			"belakor_totem_beastmen_archers",
			"belakor_totem_beastmen_bestigor",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
}
GenericTerrorEvents.belakor_totem_panic_spawns = {
	{
		"inject_event",
		event_name_list = {
			"belakor_totem_skaven_panic_storm_vermin",
			"belakor_totem_skaven_panic_plague_monk",
			"belakor_totem_skaven_shield",
			"belakor_totem_chaos_panic_berzerkers",
			"belakor_totem_chaos_panic_raiders",
			"belakor_totem_chaos_panic_chaos_warrior",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"belakor_totem_skaven_panic_storm_vermin",
			"belakor_totem_skaven_panic_plague_monk",
			"belakor_totem_skaven_shield",
			"belakor_totem_beastmen_panic_bestigor",
			"belakor_totem_beastmen_panic_ungors",
			"belakor_totem_beastmen_panic_archers",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
}
GenericTerrorEvents.belakor_arena_totem_spawns = {
	{
		"inject_event",
		event_name_list = {
			"belakor_totem_plague_monk",
			"belakor_totem_stormvermin",
			"belakor_totem_stormvermin_shield",
			"belakor_totem_clan_rat_with_shield",
			"belakor_totem_clan_rats",
			"belakor_totem_chaos_fanatics",
			"belakor_totem_chaos_marauders",
			"belakor_totem_chaos_raider",
			"belakor_totem_chaos_warriors",
			"belakor_totem_chaos_berzerkers",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"belakor_totem_plague_monk",
			"belakor_totem_stormvermin",
			"belakor_totem_stormvermin_shield",
			"belakor_totem_clan_rat_with_shield",
			"belakor_totem_clan_rats",
			"belakor_totem_beastmen_ungor",
			"belakor_totem_beastmen_gor",
			"belakor_totem_beastmen_archers",
			"belakor_totem_beastmen_bestigor",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.belakor_totem_enemies < 1
		end,
	},
}
GenericTerrorEvents.belakor_totem_plague_monk = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_plague_monk",
			"skaven_clan_rat_with_shield",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_stormvermin = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_storm_vermin_commander",
			"skaven_slave",
			"skaven_slave",
			"skaven_slave",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_stormvermin_shield = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_storm_vermin_with_shield",
			"skaven_clan_rat_with_shield",
			"skaven_clan_rat_with_shield",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_clan_rat_with_shield = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_clan_rat_with_shield",
			"skaven_clan_rat_with_shield",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_clan_rats = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_clan_rat",
			"skaven_clan_rat",
			"skaven_clan_rat",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_skaven_slaves = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_slave",
			"skaven_slave",
			"skaven_slave",
			"skaven_slave",
			"skaven_slave",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_skaven_panic_storm_vermin = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_storm_vermin_commander",
			"skaven_storm_vermin_commander",
			"skaven_clan_rat",
			"skaven_clan_rat",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_skaven_panic_plague_monk = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_plague_monk",
			"skaven_storm_vermin_commander",
			"skaven_slave",
			"skaven_clan_rat",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_skaven_shield = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_clan_rat_with_shield",
			"skaven_clan_rat_with_shield",
			"skaven_slave",
			"skaven_slave",
			"skaven_slave",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_chaos_fanatics = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_fanatic",
			"chaos_fanatic",
			"chaos_fanatic",
			"chaos_fanatic",
			"chaos_fanatic",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_chaos_marauders = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_chaos_raider = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_raider",
			"chaos_raider",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_chaos_warriors = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_warrior",
			"chaos_marauder",
			"chaos_marauder",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_chaos_berzerkers = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_berzerker",
			"chaos_fanatic",
			"chaos_fanatic",
			"chaos_fanatic",
			"chaos_fanatic",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_chaos_panic_berzerkers = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_berzerker",
			"chaos_berzerker",
			"chaos_fanatic",
			"chaos_fanatic",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_chaos_panic_raiders = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_raider",
			"chaos_raider",
			"chaos_fanatic",
			"chaos_marauder",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_chaos_panic_chaos_warrior = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_warrior",
			"chaos_marauder",
			"chaos_marauder",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_locus_wave_one_one = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_raider",
			"chaos_raider",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_locus_wave_one_two = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_storm_vermin_commander",
			"skaven_storm_vermin_commander",
			"skaven_clan_rat",
			"skaven_clan_rat",
			"skaven_clan_rat",
			"skaven_clan_rat",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_locus_wave_one_three = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_raider",
			"skaven_storm_vermin_with_shield",
			"skaven_clan_rat",
			"skaven_clan_rat",
			"chaos_marauder",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_locus_wave_two_one = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"chaos_berzerker",
			"chaos_fanatic",
			"chaos_fanatic",
			"chaos_fanatic",
			"chaos_fanatic",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_locus_wave_two_two = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_plague_monk",
			"skaven_slave",
			"skaven_slave",
			"skaven_slave",
			"skaven_slave",
			"skaven_slave",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_locus_wave_two_three = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_plague_monk",
			"skaven_clan_rat_with_shield",
			"skaven_clan_rat_with_shield",
			"skaven_clan_rat_with_shield",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_locus_wave_two_three = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"skaven_plague_monk",
			"skaven_plague_monk",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_beastmen_ungor = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"beastmen_ungor",
			"beastmen_ungor",
			"beastmen_ungor",
			"beastmen_ungor",
			"beastmen_ungor",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_beastmen_gor = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"beastmen_gor",
			"beastmen_gor",
			"beastmen_gor",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_beastmen_archers = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"beastmen_ungor_archer",
			"beastmen_ungor_archer",
			"beastmen_ungor_archer",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_beastmen_bestigor = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"beastmen_bestigor",
			"beastmen_gor",
			"beastmen_gor",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_beastmen_panic_bestigor = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"beastmen_bestigor",
			"beastmen_bestigor",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_beastmen_panic_ungors = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"beastmen_ungor",
			"beastmen_ungor",
			"beastmen_ungor",
			"beastmen_ungor",
			"beastmen_ungor",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}
GenericTerrorEvents.belakor_totem_beastmen_panic_archers = {
	{
		"play_stinger",
		stinger_name = "Play_wave_start_spawn_stinger_small",
		use_origin_unit_position = true,
	},
	belakor_totem_around_origin_line({
		default = {
			"beastmen_ungor_archer",
			"beastmen_ungor_archer",
			"beastmen_ungor_archer",
			"beastmen_ungor_archer",
		},
	}),
	{
		"delay",
		duration = totem_spawn_cooldown,
	},
}

local function grey_wings_spawn(spawn_table)
	return {
		"spawn_around_origin_unit",
		circle_subdivision = 3,
		distance_to_enemies = 2,
		max_distance = 3,
		min_distance = 2,
		spawn_counter_category = "grey_wings_enemies",
		spawn_delay = 0.25,
		breed_spawn_table_per_difficulty = spawn_table,
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = function (unit, breed, optional_data)
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "belakor_grey_wings", unit)

				local player_unit = PlayerUtils.get_random_alive_hero()

				if not breed.cannot_be_aggroed then
					AiUtils.aggro_unit_of_enemy(unit, player_unit)
				end
			end,
		},
		pre_spawn_unit_func = function (event, element, boxed_spawn_pos, breed_name)
			local teleport_effect = "fx/blk_grey_wings_spawn_01"
			local effect_name_id = NetworkLookup.effects[teleport_effect]
			local node_id = 0
			local rotation_offset = Quaternion.identity()
			local network_manager = Managers.state.network

			network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, boxed_spawn_pos:unbox(), rotation_offset, false)
		end,
	}
end

GenericTerrorEvents.grey_wings_plague_monks = {
	grey_wings_spawn({
		default = {
			"skaven_plague_monk",
			"skaven_plague_monk",
			"skaven_plague_monk",
		},
	}),
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.grey_wings_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.grey_wings_enemies <= 0
		end,
	},
}
GenericTerrorEvents.grey_wings_berserkers = {
	grey_wings_spawn({
		default = {
			"chaos_berzerker",
			"chaos_berzerker",
			"chaos_berzerker",
		},
	}),
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.grey_wings_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.grey_wings_enemies <= 0
		end,
	},
}
GenericTerrorEvents.grey_wings_bestigors = {
	grey_wings_spawn({
		default = {
			"beastmen_bestigor",
			"beastmen_bestigor",
			"beastmen_bestigor",
		},
	}),
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.grey_wings_enemies > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.grey_wings_enemies <= 0
		end,
	},
}
GenericTerrorEvents.grey_wings_spawns = {
	{
		"inject_event",
		event_name_list = {
			"grey_wings_plague_monks",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"grey_wings_plague_monks",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
}

local function grudge_mark_commander_enemy_spawned_func(unit, breed, optional_data)
	if not breed.special and not breed.boss and not breed.cannot_be_aggroed then
		local player_unit = PlayerUtils.get_random_alive_hero()

		AiUtils.aggro_unit_of_enemy(unit, player_unit)
	end

	local teleport_effect = "fx/grudge_marks_shadow_step"
	local effect_name_id = NetworkLookup.effects[teleport_effect]
	local node_id = 0
	local network_manager = Managers.state.network

	network_manager:rpc_play_particle_effect_no_rotation(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, POSITION_LOOKUP[unit], false)

	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("Play_normal_spawn_stinger", unit)

		local direction = Quaternion.forward(Quaternion.axis_angle(Vector3.up(), math.pi * 2 * math.random()))
		local distance = 0.5
		local stagger_type = stagger_types.medium
		local stun_duration = 0.5
		local t = Managers.time:time("game")

		AiUtils.stagger(unit, blackboard, unit, direction, distance, stagger_type, stun_duration, nil, t)
	end
end

local GRUDGE_MARK_COMMANDER_SPAWN_COMMON = {
	"spawn_around_origin_unit_staggered",
	max_distance = 5,
	min_distance = 2,
	spawn_counter_category = "grudge_mark_commander_enemies",
	optional_data = {
		prevent_killed_enemy_dialogue = true,
		spawned_func = grudge_mark_commander_enemy_spawned_func,
	},
	staggered_spawn_batch_size = {
		1,
		2,
	},
	staggered_spawn_delay = {
		0.25,
		0.5,
	},
}

GenericTerrorEvents.grudge_mark_commander_terror_event_skaven_storm = {
	table.merge({
		breed_name = "skaven_storm_vermin_commander",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 2,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
	table.merge({
		breed_name = "skaven_clan_rat",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
}
GenericTerrorEvents.grudge_mark_commander_terror_event_skaven_storm_shield = {
	table.merge({
		breed_name = "skaven_storm_vermin_with_shield",
		difficulty_amount = {
			cataclysm = 2,
			hard = 1,
			harder = 1,
			hardest = 2,
			normal = 1,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
	table.merge({
		breed_name = "skaven_clan_rat_with_shield",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 3,
			hardest = 2,
			normal = 2,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
}
GenericTerrorEvents.grudge_mark_commander_terror_event_skaven = {
	{
		"inject_event",
		weighted_event_names = {
			{
				event_name = "grudge_mark_commander_terror_event_skaven_storm",
				weight = 3,
			},
			{
				event_name = "grudge_mark_commander_terror_event_skaven_storm_shield",
				weight = 3,
			},
		},
	},
}
GenericTerrorEvents.grudge_mark_commander_terror_event_chaos_raiders = {
	table.merge({
		breed_name = "chaos_raider",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
	table.merge({
		breed_name = "chaos_marauder",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
}
GenericTerrorEvents.grudge_mark_commander_terror_event_chaos_warriors = {
	table.merge({
		breed_name = "chaos_warrior",
		difficulty_amount = {
			cataclysm = 1,
			hard = 1,
			harder = 1,
			hardest = 1,
			normal = 1,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
	table.merge({
		breed_name = "chaos_marauder",
		difficulty_amount = {
			cataclysm = 4,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 2,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
}
GenericTerrorEvents.grudge_mark_commander_terror_event_chaos = {
	{
		"inject_event",
		weighted_event_names = {
			{
				event_name = "grudge_mark_commander_terror_event_chaos_raiders",
				weight = 3,
			},
			{
				event_name = "grudge_mark_commander_terror_event_chaos_warriors",
				weight = 3,
			},
		},
	},
}
GenericTerrorEvents.grudge_mark_commander_terror_event_beastmen_bestigors = {
	table.merge({
		breed_name = "beastmen_bestigor",
		difficulty_amount = {
			cataclysm = 3,
			hard = 2,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
}
GenericTerrorEvents.grudge_mark_commander_terror_event_beastmen_double_action = {
	table.merge({
		breed_name = "beastmen_bestigor",
		difficulty_amount = {
			cataclysm = 2,
			hard = 1,
			harder = 2,
			hardest = 2,
			normal = 1,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
	table.merge({
		breed_name = "beastmen_gor",
		difficulty_amount = {
			cataclysm = 4,
			hard = 3,
			harder = 3,
			hardest = 3,
			normal = 2,
		},
	}, GRUDGE_MARK_COMMANDER_SPAWN_COMMON),
}
GenericTerrorEvents.grudge_mark_commander_terror_event_beastmen = {
	{
		"inject_event",
		weighted_event_names = {
			{
				event_name = "grudge_mark_commander_terror_event_beastmen_bestigors",
				weight = 3,
			},
			{
				event_name = "grudge_mark_commander_terror_event_beastmen_double_action",
				weight = 3,
			},
		},
	},
}
GenericTerrorEvents.deus_generic_terror_event_with_interception_and_escape = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_with_interception_sequence",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end",
	},
	{
		"activate_mutator",
		name = "escape",
	},
}
GenericTerrorEvents.deus_generic_terror_event = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_sequence",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end",
	},
}
GenericTerrorEvents.deus_generic_terror_event_small = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start_no_wwise",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_sequence_small",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end",
	},
}
GenericTerrorEvents.deus_generic_terror_event_long = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_sequence_long",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end",
	},
}
GenericTerrorEvents.deus_generic_terror_event_with_door = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start",
	},
	{
		"flow_event",
		flow_event_name = "deus_generic_terror_event_close_door",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_sequence",
	},
	{
		"flow_event",
		flow_event_name = "deus_generic_terror_event_open_door",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end",
	},
}
GenericTerrorEvents.deus_generic_terror_event_with_interception = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_with_interception_sequence",
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end",
	},
}
GenericTerrorEvents.deus_generic_terror_event_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence",
			"deus_chaos_stinger_and_sequence",
			"deus_chaos_stinger_and_sequence",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence",
			"deus_beastmen_stinger_and_sequence",
			"deus_beastmen_stinger_and_sequence",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_stinger_and_sequence",
			"deus_beastmen_stinger_and_sequence",
		},
		faction_requirement_list = {
			"chaos",
			"beastmen",
		},
	},
}
GenericTerrorEvents.deus_generic_terror_event_sequence_small = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence_small",
			"deus_chaos_stinger_and_sequence_small",
			"deus_chaos_stinger_and_sequence_small",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence_small",
			"deus_beastmen_stinger_and_sequence_small",
			"deus_beastmen_stinger_and_sequence_small",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_stinger_and_sequence_small",
			"deus_beastmen_stinger_and_sequence_small",
		},
		faction_requirement_list = {
			"chaos",
			"beastmen",
		},
	},
}
GenericTerrorEvents.deus_generic_terror_event_sequence_long = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence_long",
			"deus_chaos_stinger_and_sequence_long",
			"deus_chaos_stinger_and_sequence_long",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence_long",
			"deus_beastmen_stinger_and_sequence_long",
			"deus_beastmen_stinger_and_sequence_long",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_stinger_and_sequence_long",
			"deus_beastmen_stinger_and_sequence_long",
		},
		faction_requirement_list = {
			"chaos",
			"beastmen",
		},
	},
}
GenericTerrorEvents.deus_generic_terror_event_with_interception_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_generic_terror_event_skaven_with_interception_sequence",
			"deus_generic_terror_event_chaos_with_interception_sequence",
			"deus_generic_terror_event_chaos_with_interception_sequence",
		},
		faction_requirement_list = {
			"skaven",
			"chaos",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_generic_terror_event_skaven_with_interception_sequence",
			"deus_generic_terror_event_beastmen_with_interception_sequence",
			"deus_generic_terror_event_beastmen_with_interception_sequence",
		},
		faction_requirement_list = {
			"skaven",
			"beastmen",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_generic_terror_event_chaos_with_interception_sequence",
			"deus_generic_terror_event_beastmen_with_interception_sequence",
		},
		faction_requirement_list = {
			"chaos",
			"beastmen",
		},
	},
}
GenericTerrorEvents.deus_generic_terror_event_skaven_with_interception_sequence = {
	{
		"inject_event",
		event_name = "deus_skaven_interception_sequence",
	},
	{
		"inject_event",
		event_name = "deus_skaven_sequence",
	},
}
GenericTerrorEvents.deus_generic_terror_event_chaos_with_interception_sequence = {
	{
		"inject_event",
		event_name = "deus_chaos_interception_sequence",
	},
	{
		"inject_event",
		event_name = "deus_chaos_sequence",
	},
}
GenericTerrorEvents.deus_generic_terror_event_beastmen_with_interception_sequence = {
	{
		"inject_event",
		event_name = "deus_beastmen_interception_sequence",
	},
	{
		"inject_event",
		event_name = "deus_skaven_sequence",
	},
}
GenericTerrorEvents.deus_generic_terror_event_start = {
	{
		"set_master_event_running",
		name = "deus_generic_terror_event",
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
		"freeze_story_trigger",
		freeze = true,
	},
	{
		"set_wwise_override_state",
		name = "terror_mb1",
	},
}
GenericTerrorEvents.deus_generic_terror_event_start_no_wwise = {
	{
		"set_master_event_running",
		name = "deus_generic_terror_event",
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
		"freeze_story_trigger",
		freeze = true,
	},
	{
		"set_freeze_condition",
		max_active_enemies = 100,
	},
}
GenericTerrorEvents.deus_generic_terror_event_end = {
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
		end,
	},
	{
		"flow_event",
		flow_event_name = "deus_generic_terror_event_done",
	},
	{
		"flow_event",
		flow_event_name = "deus_generic_terror_event_done2",
	},
	{
		"control_pacing",
		enable = true,
	},
	{
		"control_specials",
		enable = true,
	},
	{
		"set_wwise_override_state",
		name = "false",
	},
	{
		"disable_bots_in_carry_event",
	},
	{
		"freeze_story_trigger",
		freeze = false,
	},
}
GenericTerrorEvents.deus_generic_terror_event_escape = {
	{
		"activate_mutator",
		name = "escape",
	},
}
GenericTerrorEvents.deus_skaven_stinger_and_sequence = {
	{
		"inject_event",
		event_name = "deus_skaven_stinger",
	},
	{
		"inject_event",
		event_name = "deus_skaven_sequence",
	},
}
GenericTerrorEvents.deus_chaos_stinger_and_sequence = {
	{
		"inject_event",
		event_name = "deus_chaos_stinger",
	},
	{
		"inject_event",
		event_name = "deus_chaos_sequence",
	},
}
GenericTerrorEvents.deus_beastmen_stinger_and_sequence = {
	{
		"inject_event",
		event_name = "deus_beastmen_stinger",
	},
	{
		"inject_event",
		event_name = "deus_beastmen_sequence",
	},
}
GenericTerrorEvents.deus_skaven_stinger_and_sequence_small = {
	{
		"inject_event",
		event_name = "deus_skaven_stinger",
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
}
GenericTerrorEvents.deus_chaos_stinger_and_sequence_small = {
	{
		"inject_event",
		event_name = "deus_chaos_stinger",
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
}
GenericTerrorEvents.deus_beastmen_stinger_and_sequence_small = {
	{
		"inject_event",
		event_name = "deus_beastmen_stinger",
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
}
GenericTerrorEvents.deus_skaven_stinger_and_sequence_long = {
	{
		"inject_event",
		event_name = "deus_skaven_stinger",
	},
	{
		"inject_event",
		event_name = "deus_skaven_sequence",
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
}
GenericTerrorEvents.deus_chaos_stinger_and_sequence_long = {
	{
		"inject_event",
		event_name = "deus_chaos_stinger",
	},
	{
		"inject_event",
		event_name = "deus_chaos_sequence",
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
}
GenericTerrorEvents.deus_beastmen_stinger_and_sequence_long = {
	{
		"inject_event",
		event_name = "deus_beastmen_stinger",
	},
	{
		"inject_event",
		event_name = "deus_beastmen_sequence",
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
}
GenericTerrorEvents.deus_skaven_interception_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_interception_wave_a",
			"deus_skaven_interception_wave_b",
			"deus_skaven_interception_wave_c",
		},
	},
}
GenericTerrorEvents.deus_chaos_interception_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_interception_wave_a",
			"deus_chaos_interception_wave_b",
			"deus_chaos_interception_wave_c",
		},
	},
}
GenericTerrorEvents.deus_beastmen_interception_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_interception_wave_a",
			"deus_beastmen_interception_wave_b",
			"deus_beastmen_interception_wave_c",
		},
	},
}
GenericTerrorEvents.deus_skaven_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d",
		},
	},
	{
		"one_of",
		{
			{
				"inject_event",
				event_name_list = {
					"deus_skaven_wave_2a",
					"deus_skaven_wave_2b",
					"deus_skaven_wave_2e",
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_MONSTERS,
				},
			},
			{
				"inject_event",
				event_name_list = {
					"deus_skaven_wave_2c",
					"deus_skaven_wave_2d",
					"deus_skaven_wave_2f",
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_SPECIALS,
				},
			},
			{
				"inject_event",
				event_name_list = {
					"deus_skaven_wave_2c",
					"deus_skaven_wave_2d",
					"deus_skaven_wave_2f",
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_ELITES,
				},
			},
			{
				"inject_event",
				event_name_list = {
					"deus_skaven_wave_2a",
					"deus_skaven_wave_2b",
					"deus_skaven_wave_2c",
					"deus_skaven_wave_2d",
					"deus_skaven_wave_2e",
					"deus_skaven_wave_2f",
				},
			},
		},
	},
}
GenericTerrorEvents.deus_chaos_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d",
		},
	},
	{
		"one_of",
		{
			{
				"inject_event",
				event_name_list = {
					"deus_chaos_wave_2a",
					"deus_chaos_wave_2c",
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_MONSTERS,
				},
			},
			{
				"inject_event",
				event_name_list = {
					"deus_chaos_wave_2c",
					"deus_chaos_wave_2d",
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_SPECIALS,
				},
			},
			{
				"inject_event",
				event_name_list = {
					"deus_chaos_wave_2b",
					"deus_chaos_wave_2d",
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_ELITES,
				},
			},
			{
				"inject_event",
				event_name_list = {
					"deus_chaos_wave_2a",
					"deus_chaos_wave_2b",
					"deus_chaos_wave_2c",
					"deus_chaos_wave_2d",
				},
			},
		},
	},
}
GenericTerrorEvents.deus_beastmen_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d",
		},
	},
	{
		"one_of",
		{
			{
				"inject_event",
				event_name_list = {
					"deus_beastmen_wave_2a",
					"deus_beastmen_wave_2b",
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_MONSTERS,
				},
			},
			{
				"inject_event",
				event_name_list = {
					"deus_beastmen_wave_2a",
					"deus_beastmen_wave_2c",
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_SPECIALS,
				},
			},
			{
				"inject_event",
				event_name_list = {
					"deus_beastmen_wave_2c",
				},
				tag_requirement_list = {
					DeusTerrorEventTags.MORE_ELITES,
				},
			},
			{
				"inject_event",
				event_name_list = {
					"deus_beastmen_wave_2a",
					"deus_beastmen_wave_2b",
					"deus_beastmen_wave_2c",
				},
			},
		},
	},
}
GenericTerrorEvents.deus_skaven_stinger = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger",
	},
}
GenericTerrorEvents.deus_chaos_stinger = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger",
	},
}
GenericTerrorEvents.deus_beastmen_stinger = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger",
	},
}
GenericTerrorEvents.deus_skaven_wave_1a = {
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 15
		end,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_gutter_runner",
		},
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
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
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
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_skaven_wave_1b = {
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_extra_spice_medium",
		limit_spawners = 1,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 100,
		condition = function (counter)
			return counter.main < 30
		end,
	},
	{
		"spawn_at_raw",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_gutter_runner",
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_ratling_gunner",
		},
		difficulty_amount = {
			cataclysm = 4,
			hard = 1,
			harder = 2,
			hardest = 3,
			normal = 1,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 100,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_skaven_wave_1c = {
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		"event_horde",
		composition_type = "plague_monks_medium",
		limit_spawners = 1,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_gutter_runner",
		},
		difficulty_amount = {
			cataclysm = 4,
			hard = 1,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "plague_monks_medium",
		limit_spawners = 1,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
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
}
GenericTerrorEvents.deus_skaven_wave_1d = {
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 15
		end,
	},
	{
		"event_horde",
		composition_type = "event_large",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
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
}
GenericTerrorEvents.deus_chaos_wave_1a = {
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		"event_horde",
		composition_type = "event_chaos_extra_spice_medium",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
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
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 1,
			harder = 1,
			hardest = 1,
			normal = 1,
		},
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_chaos_wave_1b = {
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		"event_horde",
		composition_type = "morris_chaos_shields_large",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "chaos_warriors",
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
		difficulty_requirement = CHAMPION,
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_chaos_wave_1c = {
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		"event_horde",
		composition_type = "chaos_berzerkers_medium",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"event_horde",
		composition_type = "event_small_fanatics",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"event_horde",
		composition_type = "event_small_fanatics",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "chaos_berzerkers_medium",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
	},
	{
		"event_horde",
		composition_type = "event_small_fanatics",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
	},
	{
		"event_horde",
		composition_type = "event_small_fanatics",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "chaos_berzerkers_medium",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"event_horde",
		composition_type = "event_small_fanatics",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"event_horde",
		composition_type = "event_small_fanatics",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = LONG,
	},
	{
		"event_horde",
		composition_type = "chaos_berzerkers_medium",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
	},
	{
		"event_horde",
		composition_type = "event_small_fanatics",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
	},
	{
		"event_horde",
		composition_type = "event_small_fanatics",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_chaos_wave_1d = {
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 15
		end,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_beastmen_wave_1a = {
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"event_horde",
		composition_type = "bestigors",
		limit_spawners = 1,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "ungor_archers",
		limit_spawners = 1,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
		difficulty_requirement = CHAMPION,
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_beastmen_wave_1b = {
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"event_horde",
		composition_type = "bestigors",
		limit_spawners = 1,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "ungor_archers",
		limit_spawners = 1,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
		difficulty_requirement = CHAMPION,
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_beastmen_wave_1c = {
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"spawn_at_raw",
		breed_name = "beastmen_standard_bearer",
		spawner_id = "terror_event_special_a",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		breed_name = "beastmen_standard_bearer",
		spawner_id = "terror_event_special_b",
	},
	{
		"event_horde",
		composition_type = "bestigors",
		limit_spawners = 1,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_beastmen_wave_1d = {
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 15
		end,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_skaven_wave_2a = {
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
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "boss",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		breed_name = {
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		difficulty_amount = {
			cataclysm = 4,
			hard = 1,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_skaven_wave_2b = {
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
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 4
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "boss",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner",
		},
		difficulty_amount = {
			cataclysm = 4,
			hard = 1,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner",
		},
		difficulty_amount = {
			cataclysm = 4,
			hard = 1,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_skaven_wave_2c = {
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
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"event_horde",
		composition_type = "morris_storm_vermin_large",
		limit_spawners = 1,
		spawn_counter_category = "elite",
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
		"spawn_at_raw",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		breed_name = {
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		difficulty_amount = {
			cataclysm = 4,
			hard = 1,
			harder = 2,
			hardest = 3,
			normal = 1,
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
			return counter.elite < 5
		end,
	},
	{
		"event_horde",
		composition_type = "morris_storm_vermin_large",
		limit_spawners = 1,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
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
}
GenericTerrorEvents.deus_skaven_wave_2d = {
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
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_ratling_gunner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 5,
			hard = 2,
			harder = 3,
			hardest = 4,
			normal = 2,
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
			return counter.special < 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
	{
		"event_horde",
		composition_type = "morris_storm_vermin_large",
		limit_spawners = 1,
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
		"spawn_at_raw",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner",
		},
		difficulty_amount = {
			cataclysm = 4,
			hard = 1,
			harder = 2,
			hardest = 3,
			normal = 1,
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
}
GenericTerrorEvents.deus_skaven_wave_2e = {
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
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "boss",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end,
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_plague_monk_medium",
		limit_spawners = 1,
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_skaven_wave_2f = {
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
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"event_horde",
		composition_type = "morris_storm_vermin_large",
		limit_spawners = 1,
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
		"event_horde",
		composition_type = "morris_plague_monk_medium",
		limit_spawners = 1,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
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
		"event_horde",
		composition_type = "storm_vermin_shields_medium",
		spawn_counter_category = "elite",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner",
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		difficulty_amount = {
			cataclysm = 4,
			hard = 1,
			harder = 2,
			hardest = 3,
			normal = 1,
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
			return counter.main < 10 and counter.elite < 5
		end,
	},
	{
		"event_horde",
		composition_type = "storm_vermin_shields_medium",
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "elite",
		spawner_id = "terror_event_b",
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		minimum_difficulty_tweak = 0,
		spawner_id = "terror_event_special_b",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner",
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		difficulty_amount = {
			cataclysm = 4,
			hard = 1,
			harder = 2,
			hardest = 3,
			normal = 1,
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10 and counter.elite < 5
		end,
	},
}
GenericTerrorEvents.deus_chaos_wave_2a = {
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"spawn_at_raw",
		spawn_counter_category = "boss",
		spawner_id = "terror_event_monster",
		breed_name = {
			"chaos_troll",
			"chaos_spawn",
		},
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end,
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_chaos_wave_2b = {
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"event_horde",
		composition_type = "event_chaos_extra_spice_medium",
		limit_spawners = 1,
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
		composition_type = "chaos_raiders_medium",
		limit_spawners = 1,
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
		"event_horde",
		composition_type = "morris_small_chaos",
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"event_horde",
		composition_type = "chaos_berzerkers_medium",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "chaos_berzerkers_medium",
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
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
		"event_horde",
		composition_type = "morris_chaos_shields_large",
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
		composition_type = "chaos_warriors",
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
		composition_type = "chaos_warriors",
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_chaos_wave_2c = {
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"spawn_at_raw",
		spawn_counter_category = "boss",
		spawner_id = "terror_event_monster",
		breed_name = {
			"chaos_troll",
			"chaos_spawn",
		},
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end,
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
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
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 1,
			harder = 1,
			hardest = 1,
			normal = 1,
		},
		difficulty_requirement = CHAMPION,
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
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
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 1,
			harder = 1,
			hardest = 1,
			normal = 1,
		},
		difficulty_requirement = CHAMPION,
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_chaos_wave_2d = {
	{
		"event_horde",
		composition_type = "morris_small_chaos",
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
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"event_horde",
		composition_type = "chaos_raiders_medium",
		limit_spawners = 1,
		spawn_counter_category = "elite",
		spawner_id = "terror_event_a",
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.elite < 3
		end,
	},
	{
		"event_horde",
		composition_type = "chaos_raiders_medium",
		limit_spawners = 1,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
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
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 1,
			harder = 1,
			hardest = 1,
			normal = 1,
		},
		difficulty_requirement = CHAMPION,
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
		"event_horde",
		composition_type = "morris_chaos_shields_large",
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
		composition_type = "chaos_warriors",
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "elite",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.elite <= 2
		end,
	},
	{
		"event_horde",
		composition_type = "chaos_warriors",
		spawn_counter_category = "elite",
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
		"spawn_at_raw",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
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
		duration = SHORT,
		difficulty_requirement = CHAMPION,
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 1,
			harder = 1,
			hardest = 1,
			normal = 1,
		},
		difficulty_requirement = CHAMPION,
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.elite <= 2
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_beastmen_wave_2a = {
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"spawn_at_raw",
		breed_name = "beastmen_minotaur",
		spawn_counter_category = "boss",
		spawner_id = "terror_event_monster",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		breed_name = "beastmen_standard_bearer",
		spawner_id = "terror_event_special_a",
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_beastmen_wave_2b = {
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		"spawn_at_raw",
		breed_name = "beastmen_minotaur",
		spawn_counter_category = "boss",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end,
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
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
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "end_event_crater_small",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end,
	},
}
GenericTerrorEvents.deus_beastmen_wave_2c = {
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
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
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "ungor_archers",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"event_horde",
		composition_type = "bestigors",
		spawn_counter_category = "elite",
		spawner_id = "terror_event_a",
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 120,
		condition = function (counter)
			return counter.elite > 0
		end,
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 120,
		condition = function (counter)
			return counter.elite <= 1
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
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
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		breed_name = "beastmen_standard_bearer",
		spawner_id = "terror_event_special_a",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "bestigors",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
	},
	{
		"delay",
		duration = SHORT,
	},
	{
		"spawn_at_raw",
		breed_name = "beastmen_standard_bearer",
		minimum_difficulty_tweak = 0,
		spawner_id = "terror_event_special_b",
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT,
	},
	{
		"event_horde",
		composition_type = "bestigors",
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
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
}
GenericTerrorEvents.deus_skaven_interception_wave_a = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger",
	},
	{
		"event_horde",
		composition_type = "event_medium",
		spawner_id = "terror_event_interception",
	},
	{
		"delay",
		duration = SHORT,
	},
}
GenericTerrorEvents.deus_skaven_interception_wave_b = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger",
	},
	{
		"event_horde",
		composition_type = "event_small",
		spawner_id = "terror_event_interception",
	},
	{
		"event_horde",
		composition_type = "plague_monks_small",
		spawner_id = "terror_event_interception",
	},
	{
		"delay",
		duration = SHORT,
	},
}
GenericTerrorEvents.deus_skaven_interception_wave_c = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger",
	},
	{
		"event_horde",
		composition_type = "event_extra_spice_medium",
		spawner_id = "terror_event_interception",
	},
	{
		"delay",
		duration = SHORT,
	},
}
GenericTerrorEvents.deus_chaos_interception_wave_a = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger",
	},
	{
		"event_horde",
		composition_type = "event_medium_chaos",
		spawner_id = "terror_event_interception",
	},
	{
		"delay",
		duration = SHORT,
	},
}
GenericTerrorEvents.deus_chaos_interception_wave_b = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger",
	},
	{
		"event_horde",
		composition_type = "chaos_berzerkers_medium",
		spawner_id = "terror_event_interception",
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		spawner_id = "terror_event_interception",
	},
	{
		"delay",
		duration = SHORT,
	},
}
GenericTerrorEvents.deus_chaos_interception_wave_c = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger",
	},
	{
		"event_horde",
		composition_type = "chaos_shields",
		spawner_id = "terror_event_interception",
	},
	{
		"event_horde",
		composition_type = "morris_small_chaos",
		spawner_id = "terror_event_interception",
	},
	{
		"delay",
		duration = SHORT,
	},
}
GenericTerrorEvents.deus_beastmen_interception_wave_a = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger",
	},
	{
		"event_horde",
		composition_type = "event_medium_beastmen",
		spawner_id = "terror_event_interception",
	},
	{
		"delay",
		duration = SHORT,
	},
}
GenericTerrorEvents.deus_beastmen_interception_wave_b = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger",
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		spawner_id = "terror_event_interception",
	},
	{
		"event_horde",
		composition_type = "bestigors",
		spawner_id = "terror_event_interception",
	},
	{
		"delay",
		duration = SHORT,
	},
}
GenericTerrorEvents.deus_beastmen_interception_wave_c = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger",
	},
	{
		"event_horde",
		composition_type = "morris_small_beastmen",
		spawner_id = "terror_event_interception",
	},
	{
		"event_horde",
		composition_type = "ungor_archers",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = SHORT,
	},
}
GenericTerrorEvents.deus_TEST_ALL_BREED = {
	{
		"control_pacing",
		enable = false,
	},
	{
		"control_specials",
		enable = false,
	},
	{
		"inject_event",
		event_name = "deus_TEST_skaven",
	},
	{
		"inject_event",
		event_name = "deus_TEST_chaos",
	},
	{
		"inject_event",
		event_name = "deus_TEST_beastmen",
	},
	{
		"inject_event",
		event_name = "deus_TEST_special",
	},
	{
		"inject_event",
		event_name = "deus_TEST_monster",
	},
	{
		"control_pacing",
		enable = true,
	},
	{
		"control_specials",
		enable = true,
	},
}
GenericTerrorEvents.deus_TEST_monster_and_special = {
	{
		"control_pacing",
		enable = false,
	},
	{
		"control_specials",
		enable = false,
	},
	{
		"inject_event",
		event_name = "deus_TEST_monster",
	},
	{
		"inject_event",
		event_name = "deus_TEST_special",
	},
	{
		"control_pacing",
		enable = true,
	},
	{
		"control_specials",
		enable = true,
	},
}
GenericTerrorEvents.deus_TEST_roamers = {
	{
		"control_pacing",
		enable = false,
	},
	{
		"control_specials",
		enable = false,
	},
	{
		"inject_event",
		event_name = "deus_TEST_skaven",
	},
	{
		"inject_event",
		event_name = "deus_TEST_chaos",
	},
	{
		"inject_event",
		event_name = "deus_TEST_beastmen",
	},
	{
		"control_pacing",
		enable = true,
	},
	{
		"control_specials",
		enable = true,
	},
}
GenericTerrorEvents.deus_TEST_small_skaven_encounter = {
	{
		"event_horde",
		composition_type = "morris_TEST_small_skaven_encounter",
		spawn_counter_category = "skaven_slave",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_slave <= 0
		end,
	},
}
GenericTerrorEvents.deus_TEST_skaven = {
	{
		"event_horde",
		composition_type = "morris_TEST_skaven_slave",
		spawn_counter_category = "skaven_slave",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_slave <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_skaven_clan_rat",
		spawn_counter_category = "skaven_clan_rat",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_clan_rat <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_skaven_clan_rat_with_shield",
		spawn_counter_category = "skaven_clan_rat_with_shield",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_clan_rat_with_shield <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_skaven_plague_monk",
		spawn_counter_category = "skaven_plague_monk",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_plague_monk <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_skaven_storm_vermin",
		spawn_counter_category = "skaven_storm_vermin",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_storm_vermin <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_skaven_storm_vermin_commander",
		spawn_counter_category = "skaven_storm_vermin_commander",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_storm_vermin_commander <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_skaven_storm_vermin_with_shield",
		spawn_counter_category = "skaven_storm_vermin_with_shield",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_storm_vermin_with_shield <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_skaven_explosive_loot_rat",
		spawn_counter_category = "skaven_explosive_loot_rat",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_explosive_loot_rat <= 0
		end,
	},
}
GenericTerrorEvents.deus_TEST_chaos = {
	{
		"event_horde",
		composition_type = "morris_TEST_chaos_fanatic",
		spawn_counter_category = "chaos_fanatic",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_fanatic <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_chaos_marauder",
		spawn_counter_category = "chaos_marauder",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_marauder <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_chaos_marauder_with_shield",
		spawn_counter_category = "chaos_marauder_with_shield",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_marauder_with_shield <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_chaos_berzerker",
		spawn_counter_category = "chaos_berzerker",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_berzerker <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_chaos_raider",
		spawn_counter_category = "chaos_raider",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_raider <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_chaos_warrior",
		spawn_counter_category = "chaos_warrior",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_warrior <= 0
		end,
	},
}
GenericTerrorEvents.deus_TEST_beastmen = {
	{
		"event_horde",
		composition_type = "morris_TEST_beastmen_ungor",
		spawn_counter_category = "beastmen_ungor",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_ungor <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_beastmen_gor",
		spawn_counter_category = "beastmen_gor",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_gor <= 0
		end,
	},
	{
		"event_horde",
		composition_type = "morris_TEST_beastmen_bestigor",
		spawn_counter_category = "beastmen_bestigor",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b",
		},
	},
	{
		"delay",
		duration = LONG,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_bestigor <= 0
		end,
	},
}
GenericTerrorEvents.deus_TEST_special = {
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_warpfire_thrower",
		spawn_counter_category = "skaven_warpfire_thrower",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 10,
			hard = 10,
			harder = 10,
			hardest = 10,
			normal = 10,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_warpfire_thrower > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_warpfire_thrower <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_poison_wind_globadier",
		spawn_counter_category = "skaven_poison_wind_globadier",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 10,
			hard = 10,
			harder = 10,
			hardest = 10,
			normal = 10,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_poison_wind_globadier > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_poison_wind_globadier <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_ratling_gunner",
		spawn_counter_category = "skaven_ratling_gunner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 10,
			hard = 10,
			harder = 10,
			hardest = 10,
			normal = 10,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_ratling_gunner > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_ratling_gunner <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 2,
			hard = 2,
			harder = 2,
			hardest = 2,
			normal = 2,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_vortex_sorcerer",
		spawn_counter_category = "chaos_vortex_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 10,
			hard = 10,
			harder = 10,
			hardest = 10,
			normal = 10,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_vortex_sorcerer > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_vortex_sorcerer <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "beastmen_standard_bearer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b",
		},
		difficulty_amount = {
			cataclysm = 10,
			hard = 10,
			harder = 10,
			hardest = 10,
			normal = 10,
		},
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_standard_bearer > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_standard_bearer <= 0
		end,
	},
}
GenericTerrorEvents.deus_TEST_monster = {
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_rat_ogre",
		spawn_counter_category = "skaven_rat_ogre",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_stormfiend",
		spawn_counter_category = "skaven_stormfiend",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_troll",
		spawn_counter_category = "chaos_troll",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_spawn",
		spawn_counter_category = "chaos_spawn",
		spawner_id = "terror_event_monster",
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end,
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end,
	},
}
