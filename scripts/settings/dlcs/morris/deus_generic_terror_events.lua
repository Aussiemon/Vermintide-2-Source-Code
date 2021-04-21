local RECRUIT = 2
local VETERAN = 3
local CHAMPION = 4
local LEGENDARY = 5
local CATACLYSM = 6
local SHORT = 8
local LONG = 16
GenericTerrorEvents.cursed_chest_prototype = {
	{
		"set_master_event_running",
		name = "cursed_chest_prototype"
	},
	{
		"spawn",
		spawn_counter_category = "cursed_chest_boss",
		breed_name = {
			"skaven_rat_ogre",
			"skaven_stormfiend",
			"chaos_troll",
			"chaos_spawn"
		},
		optional_data = {
			prevent_killed_enemy_dialogue = true,
			spawned_func = function (unit, breed, optional_data)
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "objective_unit", unit)
			end
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
			return counter.cursed_chest_boss > 0
		end
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.cursed_chest_boss <= 0
		end
	}
}
GenericTerrorEvents.cursed_chest_challenge = {
	{
		"inject_event",
		event_name_list = {
			"cursed_chest_challenge_skaven",
			"cursed_chest_challenge_chaos",
			"cursed_chest_challenge_chaos"
		},
		faction_requirement_list = {
			"skaven",
			"chaos"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"cursed_chest_challenge_skaven",
			"cursed_chest_challenge_beastmen",
			"cursed_chest_challenge_beastmen"
		},
		faction_requirement_list = {
			"skaven",
			"beastmen"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"cursed_chest_challenge_chaos",
			"cursed_chest_challenge_beastmen"
		},
		faction_requirement_list = {
			"chaos",
			"beastmen"
		}
	}
}
GenericTerrorEvents.cursed_chest_challenge_skaven = {
	{
		"event_horde",
		spawn_counter_category = "cursed_chest_boss",
		composition_type = "cursed_chest_challenge_skaven",
		optional_data = {
			spawned_func = function (unit, breed, optional_data)
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "objective_unit", unit)
			end
		}
	}
}
GenericTerrorEvents.cursed_chest_challenge_chaos = {
	{
		"event_horde",
		spawn_counter_category = "cursed_chest_boss",
		composition_type = "cursed_chest_challenge_chaos",
		optional_data = {
			spawned_func = function (unit, breed, optional_data)
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "objective_unit", unit)
			end
		}
	}
}
GenericTerrorEvents.cursed_chest_challenge_beastmen = {
	{
		"event_horde",
		spawn_counter_category = "cursed_chest_boss",
		composition_type = "cursed_chest_challenge_beastmen",
		optional_data = {
			spawned_func = function (unit, breed, optional_data)
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "objective_unit", unit)
			end
		}
	}
}
GenericTerrorEvents.cursed_chest_challenge_test = {
	{
		"set_master_event_running",
		name = "cursed_chest_prototype"
	},
	{
		"event_horde",
		spawn_counter_category = "cursed_chest_boss",
		composition_type = "cursed_chest_challenge_test",
		optional_data = {
			spawned_func = function (unit, breed, optional_data)
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "objective_unit", unit)
			end
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
			return counter.cursed_chest_boss > 0
		end
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.cursed_chest_boss <= 0
		end
	}
}
GenericTerrorEvents.deus_generic_terror_event_with_interception_and_escape = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_with_interception_sequence"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end"
	},
	{
		"activate_mutator",
		name = "escape"
	}
}
GenericTerrorEvents.deus_generic_terror_event = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_sequence"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end"
	}
}
GenericTerrorEvents.deus_generic_terror_event_small = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start_no_wwise"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_sequence_small"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end"
	}
}
GenericTerrorEvents.deus_generic_terror_event_long = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_sequence_long"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end"
	}
}
GenericTerrorEvents.deus_generic_terror_event_with_door = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start"
	},
	{
		"flow_event",
		flow_event_name = "deus_generic_terror_event_close_door"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_sequence"
	},
	{
		"flow_event",
		flow_event_name = "deus_generic_terror_event_open_door"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end"
	}
}
GenericTerrorEvents.deus_generic_terror_event_with_interception = {
	{
		"inject_event",
		event_name = "deus_generic_terror_event_start"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_with_interception_sequence"
	},
	{
		"inject_event",
		event_name = "deus_generic_terror_event_end"
	}
}
GenericTerrorEvents.deus_generic_terror_event_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence",
			"deus_chaos_stinger_and_sequence",
			"deus_chaos_stinger_and_sequence"
		},
		faction_requirement_list = {
			"skaven",
			"chaos"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence",
			"deus_beastmen_stinger_and_sequence",
			"deus_beastmen_stinger_and_sequence"
		},
		faction_requirement_list = {
			"skaven",
			"beastmen"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_stinger_and_sequence",
			"deus_beastmen_stinger_and_sequence"
		},
		faction_requirement_list = {
			"chaos",
			"beastmen"
		}
	}
}
GenericTerrorEvents.deus_generic_terror_event_sequence_small = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence_small",
			"deus_chaos_stinger_and_sequence_small",
			"deus_chaos_stinger_and_sequence_small"
		},
		faction_requirement_list = {
			"skaven",
			"chaos"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence_small",
			"deus_beastmen_stinger_and_sequence_small",
			"deus_beastmen_stinger_and_sequence_small"
		},
		faction_requirement_list = {
			"skaven",
			"beastmen"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_stinger_and_sequence_small",
			"deus_beastmen_stinger_and_sequence_small"
		},
		faction_requirement_list = {
			"chaos",
			"beastmen"
		}
	}
}
GenericTerrorEvents.deus_generic_terror_event_sequence_long = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence_long",
			"deus_chaos_stinger_and_sequence_long",
			"deus_chaos_stinger_and_sequence_long"
		},
		faction_requirement_list = {
			"skaven",
			"chaos"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_stinger_and_sequence_long",
			"deus_beastmen_stinger_and_sequence_long",
			"deus_beastmen_stinger_and_sequence_long"
		},
		faction_requirement_list = {
			"skaven",
			"beastmen"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_stinger_and_sequence_long",
			"deus_beastmen_stinger_and_sequence_long"
		},
		faction_requirement_list = {
			"chaos",
			"beastmen"
		}
	}
}
GenericTerrorEvents.deus_generic_terror_event_with_interception_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_generic_terror_event_skaven_with_interception_sequence",
			"deus_generic_terror_event_chaos_with_interception_sequence",
			"deus_generic_terror_event_chaos_with_interception_sequence"
		},
		faction_requirement_list = {
			"skaven",
			"chaos"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_generic_terror_event_skaven_with_interception_sequence",
			"deus_generic_terror_event_beastmen_with_interception_sequence",
			"deus_generic_terror_event_beastmen_with_interception_sequence"
		},
		faction_requirement_list = {
			"skaven",
			"beastmen"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_generic_terror_event_chaos_with_interception_sequence",
			"deus_generic_terror_event_beastmen_with_interception_sequence"
		},
		faction_requirement_list = {
			"chaos",
			"beastmen"
		}
	}
}
GenericTerrorEvents.deus_generic_terror_event_skaven_with_interception_sequence = {
	{
		"inject_event",
		event_name = "deus_skaven_interception_sequence"
	},
	{
		"inject_event",
		event_name = "deus_skaven_sequence"
	}
}
GenericTerrorEvents.deus_generic_terror_event_chaos_with_interception_sequence = {
	{
		"inject_event",
		event_name = "deus_chaos_interception_sequence"
	},
	{
		"inject_event",
		event_name = "deus_chaos_sequence"
	}
}
GenericTerrorEvents.deus_generic_terror_event_beastmen_with_interception_sequence = {
	{
		"inject_event",
		event_name = "deus_beastmen_interception_sequence"
	},
	{
		"inject_event",
		event_name = "deus_skaven_sequence"
	}
}
GenericTerrorEvents.deus_generic_terror_event_start = {
	{
		"set_master_event_running",
		name = "deus_generic_terror_event"
	},
	{
		"control_pacing",
		enable = false
	},
	{
		"control_specials",
		enable = false
	},
	{
		"enable_bots_in_carry_event"
	},
	{
		"set_freeze_condition",
		max_active_enemies = 100
	},
	{
		"freeze_story_trigger",
		freeze = true
	},
	{
		"set_wwise_override_state",
		name = "terror_mb1"
	}
}
GenericTerrorEvents.deus_generic_terror_event_start_no_wwise = {
	{
		"set_master_event_running",
		name = "deus_generic_terror_event"
	},
	{
		"control_pacing",
		enable = false
	},
	{
		"control_specials",
		enable = false
	},
	{
		"enable_bots_in_carry_event"
	},
	{
		"freeze_story_trigger",
		freeze = true
	},
	{
		"set_freeze_condition",
		max_active_enemies = 100
	}
}
GenericTerrorEvents.deus_generic_terror_event_end = {
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
		end
	},
	{
		"flow_event",
		flow_event_name = "deus_generic_terror_event_done"
	},
	{
		"control_pacing",
		enable = true
	},
	{
		"control_specials",
		enable = true
	},
	{
		"set_wwise_override_state",
		name = "false"
	},
	{
		"disable_bots_in_carry_event"
	},
	{
		"freeze_story_trigger",
		freeze = false
	}
}
GenericTerrorEvents.deus_generic_terror_event_escape = {
	{
		"activate_mutator",
		name = "escape"
	}
}
GenericTerrorEvents.deus_skaven_stinger_and_sequence = {
	{
		"inject_event",
		event_name = "deus_skaven_stinger"
	},
	{
		"inject_event",
		event_name = "deus_skaven_sequence"
	}
}
GenericTerrorEvents.deus_chaos_stinger_and_sequence = {
	{
		"inject_event",
		event_name = "deus_chaos_stinger"
	},
	{
		"inject_event",
		event_name = "deus_chaos_sequence"
	}
}
GenericTerrorEvents.deus_beastmen_stinger_and_sequence = {
	{
		"inject_event",
		event_name = "deus_beastmen_stinger"
	},
	{
		"inject_event",
		event_name = "deus_beastmen_sequence"
	}
}
GenericTerrorEvents.deus_skaven_stinger_and_sequence_small = {
	{
		"inject_event",
		event_name = "deus_skaven_stinger"
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	}
}
GenericTerrorEvents.deus_chaos_stinger_and_sequence_small = {
	{
		"inject_event",
		event_name = "deus_chaos_stinger"
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	}
}
GenericTerrorEvents.deus_beastmen_stinger_and_sequence_small = {
	{
		"inject_event",
		event_name = "deus_beastmen_stinger"
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	}
}
GenericTerrorEvents.deus_skaven_stinger_and_sequence_long = {
	{
		"inject_event",
		event_name = "deus_skaven_stinger"
	},
	{
		"inject_event",
		event_name = "deus_skaven_sequence"
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	}
}
GenericTerrorEvents.deus_chaos_stinger_and_sequence_long = {
	{
		"inject_event",
		event_name = "deus_chaos_stinger"
	},
	{
		"inject_event",
		event_name = "deus_chaos_sequence"
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	}
}
GenericTerrorEvents.deus_beastmen_stinger_and_sequence_long = {
	{
		"inject_event",
		event_name = "deus_beastmen_stinger"
	},
	{
		"inject_event",
		event_name = "deus_beastmen_sequence"
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	}
}
GenericTerrorEvents.deus_skaven_interception_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_interception_wave_a",
			"deus_skaven_interception_wave_b",
			"deus_skaven_interception_wave_c"
		}
	}
}
GenericTerrorEvents.deus_chaos_interception_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_interception_wave_a",
			"deus_chaos_interception_wave_b",
			"deus_chaos_interception_wave_c"
		}
	}
}
GenericTerrorEvents.deus_beastmen_interception_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_interception_wave_a",
			"deus_beastmen_interception_wave_b",
			"deus_beastmen_interception_wave_c"
		}
	}
}
GenericTerrorEvents.deus_skaven_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_1a",
			"deus_skaven_wave_1b",
			"deus_skaven_wave_1c",
			"deus_skaven_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_skaven_wave_2a",
			"deus_skaven_wave_2b",
			"deus_skaven_wave_2c",
			"deus_skaven_wave_2d",
			"deus_skaven_wave_2e",
			"deus_skaven_wave_2f"
		}
	}
}
GenericTerrorEvents.deus_chaos_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_1a",
			"deus_chaos_wave_1b",
			"deus_chaos_wave_1c",
			"deus_chaos_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_chaos_wave_2a",
			"deus_chaos_wave_2b",
			"deus_chaos_wave_2c",
			"deus_chaos_wave_2d"
		}
	}
}
GenericTerrorEvents.deus_beastmen_sequence = {
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_1a",
			"deus_beastmen_wave_1b",
			"deus_beastmen_wave_1c",
			"deus_beastmen_wave_1d"
		}
	},
	{
		"inject_event",
		event_name_list = {
			"deus_beastmen_wave_2a",
			"deus_beastmen_wave_2b",
			"deus_beastmen_wave_2c"
		}
	}
}
GenericTerrorEvents.deus_skaven_stinger = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger"
	}
}
GenericTerrorEvents.deus_chaos_stinger = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger"
	}
}
GenericTerrorEvents.deus_beastmen_stinger = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger"
	}
}
GenericTerrorEvents.deus_skaven_wave_1a = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 15
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_gutter_runner"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		spawner_id = "terror_event_special_b",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_gutter_runner"
		},
		difficulty_amount = {
			hardest = 1,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_wave_1b = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "event_extra_spice_medium",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 100,
		condition = function (counter)
			return counter.main < 30
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_gutter_runner",
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_ratling_gunner"
		},
		difficulty_amount = {
			hardest = 3,
			hard = 1,
			harder = 2,
			cataclysm = 4,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 100,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_wave_1c = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "plague_monks_medium",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_gutter_runner"
		},
		difficulty_amount = {
			hardest = 3,
			hard = 1,
			harder = 2,
			cataclysm = 4,
			normal = 1
		}
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "plague_monks_medium",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_wave_1d = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 15
		end
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "event_large"
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_chaos_wave_1a = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_chaos_extra_spice_medium",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		spawn_counter_category = "special",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 1,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		},
		difficulty_requirement = CHAMPION
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 120,
		condition = function (counter)
			return counter.special <= 1
		end
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_chaos_wave_1b = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_chaos_shields_large",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "chaos_warriors",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		spawn_counter_category = "special",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_requirement = CHAMPION
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 120,
		condition = function (counter)
			return counter.special <= 1
		end
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_chaos_wave_1c = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "chaos_berzerkers_medium"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "event_small_fanatics"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "event_small_fanatics"
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = LONG
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "chaos_berzerkers_medium"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "event_small_fanatics"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "event_small_fanatics"
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = LONG
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "chaos_berzerkers_medium"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "event_small_fanatics"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "event_small_fanatics"
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = LONG
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "chaos_berzerkers_medium"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "event_small_fanatics"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "event_small_fanatics"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_chaos_wave_1d = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 15
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_beastmen_wave_1a = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "bestigors",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "ungor_archers",
		limit_spawners = 1,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		},
		difficulty_requirement = CHAMPION
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_beastmen_wave_1b = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "bestigors",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "ungor_archers",
		limit_spawners = 1,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		},
		difficulty_requirement = CHAMPION
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_beastmen_wave_1c = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		breed_name = "beastmen_standard_bearer",
		spawner_id = "terror_event_special_a"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		breed_name = "beastmen_standard_bearer",
		spawner_id = "terror_event_special_b",
		spawn_counter_category = "main",
		difficulty_requirement = CHAMPION
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "bestigors",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_beastmen_wave_1d = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 15
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_wave_2a = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "boss",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		breed_name = {
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		difficulty_amount = {
			hardest = 3,
			hard = 1,
			harder = 2,
			cataclysm = 4,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_wave_2b = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 4
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "boss",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner"
		},
		difficulty_amount = {
			hardest = 3,
			hard = 1,
			harder = 2,
			cataclysm = 4,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner"
		},
		difficulty_amount = {
			hardest = 3,
			hard = 1,
			harder = 2,
			cataclysm = 4,
			normal = 1
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_wave_2c = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "elite",
		composition_type = "morris_storm_vermin_large",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		breed_name = {
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		difficulty_amount = {
			hardest = 3,
			hard = 1,
			harder = 2,
			cataclysm = 4,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.elite < 5
		end
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "morris_storm_vermin_large",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_wave_2d = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_ratling_gunner",
		spawn_counter_category = "special",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 4,
			hard = 2,
			harder = 3,
			cataclysm = 5,
			normal = 2
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.special < 2
		end
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "morris_storm_vermin_large",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner"
		},
		difficulty_amount = {
			hardest = 3,
			hard = 1,
			harder = 2,
			cataclysm = 4,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_wave_2e = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "boss",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		limit_spawners = 1,
		spawner_id = "terror_event_a",
		composition_type = "morris_plague_monk_medium"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_wave_2f = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "event_small",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "event_small",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "morris_storm_vermin_large",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_plague_monk_medium",
		limit_spawners = 1,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		spawn_counter_category = "elite",
		spawner_id = "terror_event_a",
		composition_type = "storm_vermin_shields_medium"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner",
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		difficulty_amount = {
			hardest = 3,
			hard = 1,
			harder = 2,
			cataclysm = 4,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10 and counter.elite < 5 and counter.special < 2
		end
	},
	{
		"event_horde",
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "elite",
		spawner_id = "terror_event_b",
		composition_type = "storm_vermin_shields_medium"
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		minimum_difficulty_tweak = 0,
		spawner_id = "terror_event_special_b",
		spawn_counter_category = "special",
		breed_name = {
			"skaven_warpfire_thrower",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner",
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		difficulty_amount = {
			hardest = 3,
			hard = 1,
			harder = 2,
			cataclysm = 4,
			normal = 1
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10 and counter.elite < 5 and counter.special < 2
		end
	}
}
GenericTerrorEvents.deus_chaos_wave_2a = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "boss",
		spawner_id = "terror_event_monster",
		breed_name = {
			"chaos_troll",
			"chaos_spawn"
		}
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_chaos_wave_2b = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "event_chaos_extra_spice_medium",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 1,
		spawn_counter_category = "main",
		composition_type = "chaos_raiders_medium",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "chaos_berzerkers_medium"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "chaos_berzerkers_medium"
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_chaos_shields_large",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "chaos_warriors",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		minimum_difficulty_tweak = 0,
		composition_type = "chaos_warriors",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_chaos_wave_2c = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "boss",
		spawner_id = "terror_event_monster",
		breed_name = {
			"chaos_troll",
			"chaos_spawn"
		}
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		spawn_counter_category = "special",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 1,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		},
		difficulty_requirement = CHAMPION
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 120,
		condition = function (counter)
			return counter.special <= 1
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		spawn_counter_category = "special",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 1,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		},
		difficulty_requirement = CHAMPION
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 60,
		condition = function (counter)
			return counter.special <= 1
		end
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_chaos_wave_2d = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		spawn_counter_category = "elite",
		limit_spawners = 1,
		spawner_id = "terror_event_a",
		composition_type = "chaos_raiders_medium"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		limit_spawners = 2,
		spawner_id = "terror_event_a",
		composition_type = "morris_small_chaos"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		limit_spawners = 2,
		spawner_id = "terror_event_a",
		composition_type = "morris_small_chaos"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.elite < 3
		end
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "chaos_raiders_medium",
		limit_spawners = 1,
		minimum_difficulty_tweak = 0
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "morris_small_chaos",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		spawn_counter_category = "special",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 1,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		},
		difficulty_requirement = CHAMPION
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 120,
		condition = function (counter)
			return counter.special <= 1
		end
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_chaos_shields_large",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "elite",
		minimum_difficulty_tweak = 0,
		composition_type = "chaos_warriors",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.elite <= 2
		end
	},
	{
		"event_horde",
		spawn_counter_category = "elite",
		composition_type = "chaos_warriors",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "special",
		spawner_id = "terror_event_special_a",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		}
	},
	{
		"delay",
		duration = SHORT,
		difficulty_requirement = CHAMPION
	},
	{
		"spawn_at_raw",
		spawner_id = "terror_event_special_b",
		spawn_counter_category = "special",
		breed_name = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer"
		},
		difficulty_amount = {
			hardest = 1,
			hard = 1,
			harder = 1,
			cataclysm = 2,
			normal = 1
		},
		difficulty_requirement = CHAMPION
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		duration = 20,
		condition = function (counter)
			return counter.elite <= 2
		end
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 60,
		condition = function (counter)
			return counter.special <= 1
		end
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_beastmen_wave_2a = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "boss",
		breed_name = "beastmen_minotaur",
		spawner_id = "terror_event_monster"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		breed_name = "beastmen_standard_bearer",
		spawner_id = "terror_event_special_a"
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		limit_spawners = 2,
		spawner_id = "terror_event_a",
		composition_type = "morris_small_beastmen"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_beastmen_wave_2b = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "boss",
		breed_name = "beastmen_minotaur",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		duration = 120,
		condition = function (counter)
			return counter.boss > 0
		end
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = -5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 5,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "end_event_crater_small"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_beastmen_wave_2c = {
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = -5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = -5,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 5,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 5,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "ungor_archers"
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"event_horde",
		spawn_counter_category = "elite",
		spawner_id = "terror_event_a",
		composition_type = "bestigors"
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 120,
		condition = function (counter)
			return counter.elite > 0
		end
	},
	{
		"continue_when_spawned_count",
		s,
		duration = 120,
		condition = function (counter)
			return counter.elite <= 1
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"event_horde",
		limit_spawners = 2,
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		composition_type = "morris_small_beastmen",
		limit_spawners = 2,
		minimum_difficulty_tweak = 0,
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		minimum_difficulty_tweak = 0,
		condition = function (counter)
			return counter.boss <= 0
		end,
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		breed_name = "beastmen_standard_bearer",
		spawner_id = "terror_event_special_a"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"event_horde",
		spawn_counter_category = "main",
		spawner_id = "terror_event_a",
		composition_type = "bestigors"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "main",
		breed_name = "beastmen_standard_bearer",
		spawner_id = "terror_event_special_b",
		minimum_difficulty_tweak = 0
	},
	{
		"delay",
		minimum_difficulty_tweak = 0,
		duration = SHORT
	},
	{
		"event_horde",
		minimum_difficulty_tweak = 0,
		spawn_counter_category = "main",
		spawner_id = "terror_event_b",
		composition_type = "bestigors"
	},
	{
		"delay",
		duration = SHORT
	},
	{
		"continue_when_spawned_count",
		duration = 60,
		condition = function (counter)
			return counter.main < 10
		end
	}
}
GenericTerrorEvents.deus_skaven_interception_wave_a = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "event_medium"
	},
	{
		"delay",
		duration = SHORT
	}
}
GenericTerrorEvents.deus_skaven_interception_wave_b = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "event_small"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "plague_monks_small"
	},
	{
		"delay",
		duration = SHORT
	}
}
GenericTerrorEvents.deus_skaven_interception_wave_c = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_stinger"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "event_extra_spice_medium"
	},
	{
		"delay",
		duration = SHORT
	}
}
GenericTerrorEvents.deus_chaos_interception_wave_a = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "event_medium_chaos"
	},
	{
		"delay",
		duration = SHORT
	}
}
GenericTerrorEvents.deus_chaos_interception_wave_b = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "chaos_berzerkers_medium"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "morris_small_chaos"
	},
	{
		"delay",
		duration = SHORT
	}
}
GenericTerrorEvents.deus_chaos_interception_wave_c = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_chaos_stinger"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "chaos_shields"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "morris_small_chaos"
	},
	{
		"delay",
		duration = SHORT
	}
}
GenericTerrorEvents.deus_beastmen_interception_wave_a = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "event_medium_beastmen"
	},
	{
		"delay",
		duration = SHORT
	}
}
GenericTerrorEvents.deus_beastmen_interception_wave_b = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "morris_small_beastmen"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "bestigors"
	},
	{
		"delay",
		duration = SHORT
	}
}
GenericTerrorEvents.deus_beastmen_interception_wave_c = {
	{
		"play_stinger",
		stinger_name = "enemy_horde_beastmen_stinger"
	},
	{
		"event_horde",
		spawner_id = "terror_event_interception",
		composition_type = "morris_small_beastmen"
	},
	{
		"event_horde",
		composition_type = "ungor_archers",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = SHORT
	}
}
GenericTerrorEvents.deus_TEST_ALL_BREED = {
	{
		"control_pacing",
		enable = false
	},
	{
		"control_specials",
		enable = false
	},
	{
		"inject_event",
		event_name = "deus_TEST_skaven"
	},
	{
		"inject_event",
		event_name = "deus_TEST_chaos"
	},
	{
		"inject_event",
		event_name = "deus_TEST_beastmen"
	},
	{
		"inject_event",
		event_name = "deus_TEST_special"
	},
	{
		"inject_event",
		event_name = "deus_TEST_monster"
	},
	{
		"control_pacing",
		enable = true
	},
	{
		"control_specials",
		enable = true
	}
}
GenericTerrorEvents.deus_TEST_monster_and_special = {
	{
		"control_pacing",
		enable = false
	},
	{
		"control_specials",
		enable = false
	},
	{
		"inject_event",
		event_name = "deus_TEST_monster"
	},
	{
		"inject_event",
		event_name = "deus_TEST_special"
	},
	{
		"control_pacing",
		enable = true
	},
	{
		"control_specials",
		enable = true
	}
}
GenericTerrorEvents.deus_TEST_roamers = {
	{
		"control_pacing",
		enable = false
	},
	{
		"control_specials",
		enable = false
	},
	{
		"inject_event",
		event_name = "deus_TEST_skaven"
	},
	{
		"inject_event",
		event_name = "deus_TEST_chaos"
	},
	{
		"inject_event",
		event_name = "deus_TEST_beastmen"
	},
	{
		"control_pacing",
		enable = true
	},
	{
		"control_specials",
		enable = true
	}
}
GenericTerrorEvents.deus_TEST_small_skaven_encounter = {
	{
		"event_horde",
		spawn_counter_category = "skaven_slave",
		composition_type = "morris_TEST_small_skaven_encounter",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_slave <= 0
		end
	}
}
GenericTerrorEvents.deus_TEST_skaven = {
	{
		"event_horde",
		spawn_counter_category = "skaven_slave",
		composition_type = "morris_TEST_skaven_slave",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_slave <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "skaven_clan_rat",
		composition_type = "morris_TEST_skaven_clan_rat",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_clan_rat <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "skaven_clan_rat_with_shield",
		composition_type = "morris_TEST_skaven_clan_rat_with_shield",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_clan_rat_with_shield <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "skaven_plague_monk",
		composition_type = "morris_TEST_skaven_plague_monk",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_plague_monk <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "skaven_storm_vermin",
		composition_type = "morris_TEST_skaven_storm_vermin",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_storm_vermin <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "skaven_storm_vermin_commander",
		composition_type = "morris_TEST_skaven_storm_vermin_commander",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_storm_vermin_commander <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "skaven_storm_vermin_with_shield",
		composition_type = "morris_TEST_skaven_storm_vermin_with_shield",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_storm_vermin_with_shield <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "skaven_explosive_loot_rat",
		composition_type = "morris_TEST_skaven_explosive_loot_rat",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_explosive_loot_rat <= 0
		end
	}
}
GenericTerrorEvents.deus_TEST_chaos = {
	{
		"event_horde",
		spawn_counter_category = "chaos_fanatic",
		composition_type = "morris_TEST_chaos_fanatic",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_fanatic <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "chaos_marauder",
		composition_type = "morris_TEST_chaos_marauder",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_marauder <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "chaos_marauder_with_shield",
		composition_type = "morris_TEST_chaos_marauder_with_shield",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_marauder_with_shield <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "chaos_berzerker",
		composition_type = "morris_TEST_chaos_berzerker",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_berzerker <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "chaos_raider",
		composition_type = "morris_TEST_chaos_raider",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_raider <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "chaos_warrior",
		composition_type = "morris_TEST_chaos_warrior",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_warrior <= 0
		end
	}
}
GenericTerrorEvents.deus_TEST_beastmen = {
	{
		"event_horde",
		spawn_counter_category = "beastmen_ungor",
		composition_type = "morris_TEST_beastmen_ungor",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_ungor <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "beastmen_gor",
		composition_type = "morris_TEST_beastmen_gor",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_gor <= 0
		end
	},
	{
		"event_horde",
		spawn_counter_category = "beastmen_bestigor",
		composition_type = "morris_TEST_beastmen_bestigor",
		spawner_ids = {
			"terror_event_a",
			"terror_event_b"
		}
	},
	{
		"delay",
		duration = LONG
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_bestigor <= 0
		end
	}
}
GenericTerrorEvents.deus_TEST_special = {
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_gutter_runner",
		spawn_counter_category = "skaven_gutter_runner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_gutter_runner <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_warpfire_thrower",
		spawn_counter_category = "skaven_warpfire_thrower",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 10,
			hard = 10,
			harder = 10,
			cataclysm = 10,
			normal = 10
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_warpfire_thrower > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_warpfire_thrower <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_poison_wind_globadier",
		spawn_counter_category = "skaven_poison_wind_globadier",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 10,
			hard = 10,
			harder = 10,
			cataclysm = 10,
			normal = 10
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_poison_wind_globadier > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_poison_wind_globadier <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "skaven_ratling_gunner",
		spawn_counter_category = "skaven_ratling_gunner",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 10,
			hard = 10,
			harder = 10,
			cataclysm = 10,
			normal = 10
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_ratling_gunner > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_ratling_gunner <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_corruptor_sorcerer",
		spawn_counter_category = "chaos_corruptor_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 2,
			hard = 2,
			harder = 2,
			cataclysm = 2,
			normal = 2
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_corruptor_sorcerer <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "chaos_vortex_sorcerer",
		spawn_counter_category = "chaos_vortex_sorcerer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 10,
			hard = 10,
			harder = 10,
			cataclysm = 10,
			normal = 10
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_vortex_sorcerer > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_vortex_sorcerer <= 0
		end
	},
	{
		"spawn_at_raw",
		breed_name = "beastmen_standard_bearer",
		spawn_counter_category = "beastmen_standard_bearer",
		spawner_ids = {
			"terror_event_special_a",
			"terror_event_special_b"
		},
		difficulty_amount = {
			hardest = 10,
			hard = 10,
			harder = 10,
			cataclysm = 10,
			normal = 10
		}
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_standard_bearer > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.beastmen_standard_bearer <= 0
		end
	}
}
GenericTerrorEvents.deus_TEST_monster = {
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_rat_ogre",
		breed_name = "skaven_rat_ogre",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_rat_ogre <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "skaven_stormfiend",
		breed_name = "skaven_stormfiend",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.skaven_stormfiend <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_troll",
		breed_name = "chaos_troll",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_troll <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	},
	{
		"spawn_at_raw",
		spawn_counter_category = "chaos_spawn",
		breed_name = "chaos_spawn",
		spawner_id = "terror_event_monster"
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn > 0
		end
	},
	{
		"continue_when_spawned_count",
		condition = function (counter)
			return counter.chaos_spawn <= 0
		end
	}
}

return
