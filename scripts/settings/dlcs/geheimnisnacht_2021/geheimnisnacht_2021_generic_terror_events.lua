local function geheimnisnacht_2021_event_spawn_function(unit, breed, optional_data)
	local buff_system = Managers.state.entity:system("buff_system")

	buff_system:add_buff(unit, "geheimnisnacht_2021_event_cultist_buff", unit)
end

GenericTerrorEvents.geheimnisnacht_2021_event = {
	{
		"set_master_event_running",
		name = "geheimnisnacht_2021_event"
	},
	{
		"one_of",
		{
			{
				"inject_event",
				event_name_list = {
					"geheimnisnacht_2021_event_faction_skaven"
				},
				faction_requirement_list = {
					"skaven"
				}
			},
			{
				"inject_event",
				event_name_list = {
					"geheimnisnacht_2021_event_faction_chaos"
				},
				faction_requirement_list = {
					"chaos"
				}
			},
			{
				"inject_event",
				event_name_list = {
					"geheimnisnacht_2021_event_faction_beastmen"
				},
				faction_requirement_list = {
					"beastmen"
				}
			}
		}
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_faction_skaven = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						weight = 3,
						event_name = "geheimnisnacht_2021_event_skaven_slaves"
					},
					{
						weight = 3,
						event_name = "geheimnisnacht_2021_event_skaven_shields"
					},
					{
						weight = 3,
						event_name = "geheimnisnacht_2021_event_skaven_big_shields"
					}
				}
			}
		}
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_skaven_slaves = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken"
	},
	{
		"delay",
		duration = 0.5
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "event_large",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "storm_vermin_small",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"delay",
		duration = 1
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.geheimnisnacht_2021 > 0
		end
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_skaven_shields = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken"
	},
	{
		"delay",
		duration = 0.5
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "event_medium_shield",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "event_extra_spice_small",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"delay",
		duration = 1
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.geheimnisnacht_2021 > 0
		end
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_skaven_big_shields = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken"
	},
	{
		"delay",
		duration = 0.5
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "event_medium",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "storm_vermin_shields_small",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"delay",
		duration = 1
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.geheimnisnacht_2021 > 0
		end
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_faction_chaos = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						weight = 3,
						event_name = "geheimnisnacht_2021_event_chaos_fanatics"
					},
					{
						weight = 3,
						event_name = "geheimnisnacht_2021_event_chaos_spice"
					},
					{
						weight = 3,
						event_name = "geheimnisnacht_2021_event_chaos_berzerkers"
					}
				}
			}
		}
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_chaos_fanatics = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken"
	},
	{
		"delay",
		duration = 0.5
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "event_large_chaos",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"delay",
		duration = 1
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.geheimnisnacht_2021 > 0
		end
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_chaos_spice = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken"
	},
	{
		"delay",
		duration = 0.5
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "event_medium_chaos",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "event_chaos_extra_spice_small",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"delay",
		duration = 1
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.geheimnisnacht_2021 > 0
		end
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_chaos_berzerkers = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken"
	},
	{
		"delay",
		duration = 0.5
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "event_medium_chaos",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "chaos_berzerkers_small",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"delay",
		duration = 1
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.geheimnisnacht_2021 > 0
		end
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_faction_beastmen = {
	{
		"one_of",
		{
			{
				"inject_event",
				weighted_event_names = {
					{
						weight = 3,
						event_name = "geheimnisnacht_2021_event_beastmen_ungor"
					}
				}
			}
		}
	}
}
GenericTerrorEvents.geheimnisnacht_2021_event_beastmen_ungor = {
	{
		"start_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	},
	{
		"play_stinger",
		stinger_name = "Play_event_stinger_geheimnisnacht_ritual_broken"
	},
	{
		"delay",
		duration = 0.5
	},
	{
		"event_horde",
		spawn_counter_category = "geheimnisnacht_2021",
		composition_type = "event_large_beastmen",
		optional_data = {
			spawned_func = geheimnisnacht_2021_event_spawn_function
		}
	},
	{
		"delay",
		duration = 1
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.geheimnisnacht_2021 > 0
		end
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.geheimnisnacht_2021 <= 0
		end
	},
	{
		"end_mission",
		mission_name = "mission_geheimnisnacht_2021_event"
	}
}
