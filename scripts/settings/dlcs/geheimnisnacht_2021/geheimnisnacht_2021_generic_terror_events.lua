-- chunkname: @scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_generic_terror_events.lua

local function geheimnisnacht_2021_event_spawn_function(unit, breed, optional_data)
	local buff_system = Managers.state.entity:system("buff_system")

	buff_system:add_buff(unit, "geheimnisnacht_2021_event_cultist_buff", unit)
end

local function setup_altar_chaos_warrior(optional_data, difficulty, breed_name, event, difficulty_tweak, enhancement_list)
	local names = {
		"shockwave",
		"ignore_death_aura",
	}
	local base_grudgemark_name = "elite_base"
	local grudge_mark_name = names[math.random(1, #names)]
	local list = optional_data.enhancements or {}

	list[#list + 1] = BreedEnhancements[base_grudgemark_name]
	list[#list + 1] = BreedEnhancements[grudge_mark_name]
	optional_data.enhancements = list

	return optional_data
end

local function size_chaos_warrior(breed, extension_init_data, optional_data, spawn_pos, spawn_rot)
	return
end

GenericTerrorEvents.geheimnisnacht_2021_event = {
	{
		"set_master_event_running",
		name = "geheimnisnacht_2021_event",
	},
	{
		"spawn",
		{
			1,
			1,
		},
		breed_name = "chaos_warrior",
		pre_spawn_func = setup_altar_chaos_warrior,
		optional_data = {
			spawn_chance = 1,
			spawned_func = AiUtils.magic_entrance_optional_spawned_func,
			prepare_func = size_chaos_warrior,
		},
	},
	{
		"one_of",
		{
			{
				"inject_event",
				event_name_list = {
					"geheimnisnacht_2021_event_faction_skaven",
				},
				faction_requirement_list = {
					"skaven",
				},
			},
			{
				"inject_event",
				event_name_list = {
					"geheimnisnacht_2021_event_faction_chaos",
				},
				faction_requirement_list = {
					"chaos",
				},
			},
			{
				"inject_event",
				event_name_list = {
					"geheimnisnacht_2021_event_faction_beastmen",
				},
				faction_requirement_list = {
					"beastmen",
				},
			},
		},
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_faction_skaven = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "geheimnisnacht_2021_event_skaven_slaves",
						weight = 3,
					},
					{
						event_name = "geheimnisnacht_2021_event_skaven_shields",
						weight = 3,
					},
					{
						event_name = "geheimnisnacht_2021_event_skaven_big_shields",
						weight = 3,
					},
				},
			},
		},
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_skaven_slaves = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken",
	},
	{
		"delay",
		duration = 0.5,
	},
	{
		"event_horde",
		composition_type = "event_large",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
		},
	},
	{
		"event_horde",
		composition_type = "storm_vermin_small",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
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
			return counter.geheimnisnacht_2021 > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end,
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_skaven_shields = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken",
	},
	{
		"delay",
		duration = 0.5,
	},
	{
		"event_horde",
		composition_type = "event_medium_shield",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
		},
	},
	{
		"event_horde",
		composition_type = "event_extra_spice_small",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
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
			return counter.geheimnisnacht_2021 > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end,
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_skaven_big_shields = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken",
	},
	{
		"delay",
		duration = 0.5,
	},
	{
		"event_horde",
		composition_type = "event_medium",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
		},
	},
	{
		"event_horde",
		composition_type = "storm_vermin_shields_small",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
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
			return counter.geheimnisnacht_2021 > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end,
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_faction_chaos = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "geheimnisnacht_2021_event_chaos_fanatics",
						weight = 3,
					},
					{
						event_name = "geheimnisnacht_2021_event_chaos_spice",
						weight = 3,
					},
					{
						event_name = "geheimnisnacht_2021_event_chaos_berzerkers",
						weight = 3,
					},
				},
			},
		},
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_chaos_fanatics = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken",
	},
	{
		"delay",
		duration = 0.5,
	},
	{
		"event_horde",
		composition_type = "event_large_chaos",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
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
			return counter.geheimnisnacht_2021 > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end,
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_chaos_spice = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken",
	},
	{
		"delay",
		duration = 0.5,
	},
	{
		"event_horde",
		composition_type = "event_medium_chaos",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
		},
	},
	{
		"event_horde",
		composition_type = "event_chaos_extra_spice_small",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
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
			return counter.geheimnisnacht_2021 > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end,
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_chaos_berzerkers = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken",
	},
	{
		"delay",
		duration = 0.5,
	},
	{
		"event_horde",
		composition_type = "event_medium_chaos",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
		},
	},
	{
		"event_horde",
		composition_type = "chaos_berzerkers_small",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
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
			return counter.geheimnisnacht_2021 > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end,
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_faction_beastmen = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						event_name = "geheimnisnacht_2021_event_beastmen_ungor",
						weight = 3,
					},
				},
			},
		},
	},
}
GenericTerrorEvents.geheimnisnacht_2021_event_beastmen_ungor = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken",
	},
	{
		"delay",
		duration = 0.5,
	},
	{
		"event_horde",
		composition_type = "event_large_beastmen",
		spawn_counter_category = "geheimnisnacht_2021",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function,
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
			return counter.geheimnisnacht_2021 > 0
		end,
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end,
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event",
	},
}
