local RECRUIT = 2
local VETERAN = 3
local CHAMPION = 4
local LEGENDARY = 5
local CATACLYSM = 6
local terror_event_blueprints = {
	arena_ice_terror = {
		{
			"inject_event",
			event_name = "arena_ice_terror_start"
		},
		{
			"inject_event",
			event_name = "arena_ice_terror_sequence"
		},
		{
			"inject_event",
			event_name = "arena_ice_terror_end"
		}
	},
	arena_ice_terror_sequence = {
		{
			"inject_event",
			event_name_list = {
				"deus_arena_ice_terror_skaven_chaos",
				"deus_arena_ice_terror_chaos_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"chaos"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_arena_ice_terror_skaven_beastmen",
				"deus_arena_ice_terror_beastmen_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"beastmen"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_arena_ice_terror_chaos_beastmen",
				"deus_arena_ice_terror_beastmen_chaos"
			},
			faction_requirement_list = {
				"chaos",
				"beastmen"
			}
		}
	},
	arena_ice_terror_start = {
		{
			"set_master_event_running",
			name = "arena_ice_terror"
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
			"set_wwise_override_state",
			name = "terror_mb1"
		}
	},
	arena_ice_terror_end = {
		{
			"continue_when_spawned_count",
			condition = function (counter)
				return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_done"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"set_wwise_override_state",
			name = "false"
		}
	},
	deus_arena_ice_terror_skaven_chaos = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_skaven_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_chaos_wave_2"
			}
		}
	},
	deus_arena_ice_terror_skaven_beastmen = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_skaven_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_beastmen_wave_2"
			}
		}
	},
	deus_arena_ice_terror_chaos_skaven = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_chaos_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_skaven_wave_2"
			}
		}
	},
	deus_arena_ice_terror_chaos_beastmen = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_chaos_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_beastmen_wave_2"
			}
		}
	},
	deus_arena_ice_terror_beastmen_skaven = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_beastmen_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_skaven_wave_2"
			}
		}
	},
	deus_arena_ice_terror_beastmen_chaos = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_beastmen_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_chaos_wave_2"
			}
		}
	},
	arena_ice_terror_skaven_wave_1 = {
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_skaven_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 7
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			spawner_id = "arena_ice_terror_special",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend"
			}
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"event_horde",
			spawn_counter_category = "elite",
			spawner_id = "arena_ice_terror_horde2",
			composition_type = "morris_elite_medium_skaven"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.elite < 4
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		}
	},
	arena_ice_terror_skaven_wave_2 = {
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "event_large",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"event_horde",
			spawn_counter_category = "elite",
			spawner_id = "arena_ice_terror_horde",
			composition_type = "storm_vermin_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "elite",
			spawner_id = "arena_ice_terror_horde",
			composition_type = "storm_vermin_shields_small"
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde2",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		}
	},
	arena_ice_terror_chaos_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_chaos_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "event_medium_chaos",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde2",
			composition_type = "morris_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawn_counter_category = "elite",
			composition_type = "morris_elite_medium_chaos",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.elite < 4
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			spawner_id = "arena_ice_terror_special",
			breed_name = {
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "morris_small_chaos",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "morris_small_chaos",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		}
	},
	arena_ice_terror_chaos_wave_2 = {
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "event_medium_chaos",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "elite",
			composition_type = "morris_elite_medium_chaos",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.elite < 4
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawn_counter_category = "main",
			composition_type = "event_medium_chaos",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 10
		}
	},
	arena_ice_terror_beastmen_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_beastmen_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "event_medium_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			composition_type = "ungor_archers",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			breed_name = "beastmen_minotaur",
			spawner_id = "arena_ice_terror_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "event_medium_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			composition_type = "ungor_archers",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		}
	},
	arena_ice_terror_beastmen_wave_2 = {
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "event_medium_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			composition_type = "ungor_archers",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			composition_type = "ungor_archers",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "elite",
			composition_type = "morris_elite_medium_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde",
				"arena_ice_terror_horde2"
			}
		},
		{
			"delay",
			duration = 10
		}
	},
	arena_ice_terror_down = {
		{
			"inject_event",
			event_name = "arena_ice_terror_down_start"
		},
		{
			"inject_event",
			event_name = "arena_ice_terror_down_sequence"
		},
		{
			"inject_event",
			event_name = "arena_ice_terror_down_end"
		}
	},
	arena_ice_terror_down_sequence = {
		{
			"inject_event",
			event_name_list = {
				"deus_arena_ice_terror_down_skaven_chaos",
				"deus_arena_ice_terror_down_chaos_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"chaos"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_arena_ice_terror_down_skaven_beastmen",
				"deus_arena_ice_terror_down_beastmen_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"beastmen"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_arena_ice_terror_down_chaos_beastmen",
				"deus_arena_ice_terror_down_beastmen_chaos"
			},
			faction_requirement_list = {
				"chaos",
				"beastmen"
			}
		}
	},
	arena_ice_terror_down_start = {
		{
			"set_master_event_running",
			name = "arena_ice_terror_down"
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
			"set_wwise_override_state",
			name = "terror_mb2"
		}
	},
	arena_ice_terror_down_end = {
		{
			"continue_when_spawned_count",
			condition = function (counter)
				return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_down_done"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"set_wwise_override_state",
			name = "false"
		}
	},
	deus_arena_ice_terror_down_skaven_chaos = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_skaven_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_chaos_wave_2"
			}
		}
	},
	deus_arena_ice_terror_down_skaven_beastmen = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_skaven_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_beastmen_wave_2"
			}
		}
	},
	deus_arena_ice_terror_down_chaos_skaven = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_chaos_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_skaven_wave_2"
			}
		}
	},
	deus_arena_ice_terror_down_chaos_beastmen = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_chaos_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_beastmen_wave_2"
			}
		}
	},
	deus_arena_ice_terror_down_beastmen_skaven = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_beastmen_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_skaven_wave_2"
			}
		}
	},
	deus_arena_ice_terror_down_beastmen_chaos = {
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_beastmen_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_ice_terror_down_chaos_wave_2"
			}
		}
	},
	arena_ice_terror_down_skaven_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_down_skaven_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde3",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "elite",
			spawner_id = "arena_ice_terror_horde3",
			composition_type = "morris_elite_medium_skaven"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.elite < 4
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			spawner_id = "arena_ice_terror_special2",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde4",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde4",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde4",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 20,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		}
	},
	arena_ice_terror_down_skaven_wave_2 = {
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde4",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde4",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "elite",
			composition_type = "storm_vermin_medium",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.elite < 4
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde4",
			composition_type = "morris_elite_medium_skaven"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde3",
			composition_type = "storm_vermin_shields_small"
		},
		{
			"delay",
			duration = 10
		}
	},
	arena_ice_terror_down_chaos_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_down_chaos_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "event_chaos_extra_spice_medium",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde4",
			composition_type = "military_end_event_berzerkers"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			spawner_id = "arena_ice_terror_special2",
			breed_name = {
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde3",
			composition_type = "morris_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde4",
			composition_type = "morris_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_ice_terror_horde4",
			composition_type = "morris_small_chaos"
		},
		{
			"continue_when_spawned_count",
			duration = 20,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		}
	},
	arena_ice_terror_down_chaos_wave_2 = {
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "military_end_event_berzerkers",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "elite",
			composition_type = "morris_elite_medium_chaos",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawn_counter_category = "main",
			composition_type = "event_medium_chaos",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.elite < 4
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "elite",
			composition_type = "morris_elite_medium_chaos",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawn_counter_category = "main",
			composition_type = "event_medium_chaos",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 10
		}
	},
	arena_ice_terror_down_beastmen_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_down_beastmen_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "morris_small_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "elite",
			composition_type = "bestigors",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			breed_name = "beastmen_minotaur",
			spawner_id = "arena_ice_terror_special2"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "morris_small_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawn_counter_category = "main",
			composition_type = "ungor_archers",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 20,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		}
	},
	arena_ice_terror_down_beastmen_wave_2 = {
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "morris_small_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawn_counter_category = "main",
			composition_type = "ungor_archers",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "elite",
			composition_type = "bestigors",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.elite < 4
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "morris_small_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "elite",
			composition_type = "morris_elite_medium_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 10,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.elite < 4
			end
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawn_counter_category = "main",
			composition_type = "morris_elite_medium_beastmen",
			spawner_ids = {
				"arena_ice_terror_horde3",
				"arena_ice_terror_horde4"
			}
		},
		{
			"delay",
			duration = 10
		}
	},
	arena_ice_terror_skaven_special = {
		{
			"set_master_event_running",
			name = "arena_ice_terror"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			spawner_id = "arena_ice_terror_special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_ratling_gunner"
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
			"spawn_at_raw",
			spawner_id = "arena_ice_terror_special",
			spawn_counter_category = "special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 1,
				hard = 1,
				harder = 1,
				cataclysm = 2,
				normal = 1
			},
			difficulty_requirement = LEGENDARY
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.special < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_specials_done"
		}
	},
	arena_ice_terror_chaos_special = {
		{
			"set_master_event_running",
			name = "arena_ice_terror"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			spawner_id = "arena_ice_terror_special",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
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
			"spawn_at_raw",
			spawner_id = "arena_ice_terror_special",
			spawn_counter_category = "special",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_amount = {
				hardest = 1,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			},
			difficulty_requirement = LEGENDARY
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.special < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_specials_done"
		}
	},
	arena_ice_terror_beastmen_special = {
		{
			"set_master_event_running",
			name = "arena_ice_terror"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			breed_name = "beastmen_standard_bearer",
			spawner_id = "arena_ice_terror_special",
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
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.special < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_specials_done"
		}
	},
	arena_ice_terror_down_skaven_special = {
		{
			"set_master_event_running",
			name = "arena_ice_terror"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			spawner_id = "arena_ice_terror_special2",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_ratling_gunner"
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
			"spawn_at_raw",
			spawner_id = "arena_ice_terror_special2",
			spawn_counter_category = "special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 1,
				hard = 1,
				harder = 1,
				cataclysm = 2,
				normal = 1
			},
			difficulty_requirement = LEGENDARY
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.special < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_down_specials_done"
		}
	},
	arena_ice_terror_down_chaos_special = {
		{
			"set_master_event_running",
			name = "arena_ice_terror"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			spawner_id = "arena_ice_terror_special2",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
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
			"spawn_at_raw",
			spawner_id = "arena_ice_terror_special2",
			spawn_counter_category = "special",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer"
			},
			difficulty_amount = {
				hardest = 1,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			},
			difficulty_requirement = LEGENDARY
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.special < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_down_specials_done"
		}
	},
	arena_ice_terror_down_beastmen_special = {
		{
			"set_master_event_running",
			name = "arena_ice_terror"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			breed_name = "beastmen_standard_bearer",
			spawner_id = "arena_ice_terror_special2",
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
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.special < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_ice_terror_down_specials_done"
		}
	}
}

return terror_event_blueprints
