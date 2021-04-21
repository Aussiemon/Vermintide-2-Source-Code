local RECRUIT = 2
local VETERAN = 3
local CHAMPION = 4
local LEGENDARY = 5
local CATACLYSM = 6
local terror_event_blueprints = {
	citadel_arena_a1 = {
		{
			"inject_event",
			event_name = "citadel_arena_a1_start"
		},
		{
			"inject_event",
			event_name = "citadel_arena_a1_sequence"
		},
		{
			"inject_event",
			event_name = "citadel_arena_a1_end"
		}
	},
	citadel_arena_a1_sequence = {
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_a1_skaven",
				"deus_citadel_arena_a1_chaos"
			},
			faction_requirement_list = {
				"skaven",
				"chaos"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_a1_skaven",
				"deus_citadel_arena_a1_beastmen"
			},
			faction_requirement_list = {
				"skaven",
				"beastmen"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_a1_chaos",
				"deus_citadel_arena_a1_beastmen"
			},
			faction_requirement_list = {
				"chaos",
				"beastmen"
			}
		}
	},
	citadel_arena_a1_start = {
		{
			"set_master_event_running",
			name = "citadel_arena_a1"
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
	citadel_arena_a1_end = {
		{
			"continue_when_spawned_count",
			condition = function (counter)
				return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
			end
		},
		{
			"flow_event",
			flow_event_name = "citadel_arena_a1_done"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"set_wwise_override_state",
			name = "false"
		}
	},
	deus_citadel_arena_a1_skaven = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1_ledge",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1_manual",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"spawn_at_raw",
			spawner_id = "arena_citadel_a1_manual",
			spawn_counter_category = "main",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "morris_elite_medium_skaven"
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
			spawner_id = "arena_citadel_a1_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	deus_citadel_arena_a1_chaos = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "event_chaos_extra_spice_small"
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
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "morris_elite_medium_chaos"
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
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	deus_citadel_arena_a1_beastmen = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "event_medium_beastmen"
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
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "morris_elite_medium_beastmen"
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
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a1",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	citadel_arena_a2 = {
		{
			"inject_event",
			event_name = "citadel_arena_a2_start"
		},
		{
			"inject_event",
			event_name = "citadel_arena_a2_sequence"
		},
		{
			"inject_event",
			event_name = "citadel_arena_a2_end"
		}
	},
	citadel_arena_a2_sequence = {
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_a2_skaven",
				"deus_citadel_arena_a2_chaos"
			},
			faction_requirement_list = {
				"skaven",
				"chaos"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_a2_skaven",
				"deus_citadel_arena_a2_beastmen"
			},
			faction_requirement_list = {
				"skaven",
				"beastmen"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_a2_chaos",
				"deus_citadel_arena_a2_beastmen"
			},
			faction_requirement_list = {
				"chaos",
				"beastmen"
			}
		}
	},
	citadel_arena_a2_start = {
		{
			"set_master_event_running",
			name = "citadel_arena_a2"
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
	citadel_arena_a2_end = {
		{
			"continue_when_spawned_count",
			condition = function (counter)
				return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
			end
		},
		{
			"flow_event",
			flow_event_name = "citadel_arena_a2_done"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"set_wwise_override_state",
			name = "false"
		}
	},
	deus_citadel_arena_a2_skaven = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2_ledge",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2_manual",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
			}
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2_manual",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
			}
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = CHAMPION
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_citadel_a2_manual",
			spawn_counter_category = "main",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
			},
			difficulty_requirement = CHAMPION
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
			spawner_id = "arena_citadel_a2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "morris_elite_medium_skaven"
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
			spawner_id = "arena_citadel_a2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	deus_citadel_arena_a2_chaos = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "event_chaos_extra_spice_small"
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
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "morris_elite_medium_chaos"
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
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	deus_citadel_arena_a2_beastmen = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "event_medium_beastmen"
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
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "morris_elite_medium_beastmen"
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
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_a2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	citadel_arena_b1 = {
		{
			"inject_event",
			event_name = "citadel_arena_b1_start"
		},
		{
			"inject_event",
			event_name = "citadel_arena_b1_sequence"
		},
		{
			"inject_event",
			event_name = "citadel_arena_b1_end"
		}
	},
	citadel_arena_b1_sequence = {
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_b1_chaos",
				"deus_citadel_arena_b1_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"chaos"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_b1_beastmen",
				"deus_citadel_arena_b1_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"beastmen"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_b1_beastmen",
				"deus_citadel_arena_b1_chaos"
			},
			faction_requirement_list = {
				"chaos",
				"beastmen"
			}
		}
	},
	citadel_arena_b1_start = {
		{
			"set_master_event_running",
			name = "citadel_arena_b1"
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
	citadel_arena_b1_end = {
		{
			"continue_when_spawned_count",
			condition = function (counter)
				return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
			end
		},
		{
			"flow_event",
			flow_event_name = "citadel_arena_b1_done"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"set_wwise_override_state",
			name = "false"
		}
	},
	deus_citadel_arena_b1_skaven = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"spawn_at_raw",
			spawner_id = "arena_citadel_b1_manual",
			spawn_counter_category = "main",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"spawn_at_raw",
			spawner_id = "arena_citadel_b1_manual",
			spawn_counter_category = "main",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_ledge",
			composition_type = "event_small"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 2,
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
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_ledge",
			composition_type = "event_small"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 2,
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
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	deus_citadel_arena_b1_chaos = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"spawn_at_raw",
			spawner_id = "arena_citadel_b1_manual",
			spawn_counter_category = "main",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"spawn_at_raw",
			spawner_id = "arena_citadel_b1_manual",
			spawn_counter_category = "main",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_chaos"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 2,
				harder = 2,
				cataclysm = 2,
				normal = 1
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_chaos"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 2,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	deus_citadel_arena_b1_beastmen = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"spawn_at_raw",
			spawner_id = "arena_citadel_b1_manual",
			spawn_counter_category = "main",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"spawn_at_raw",
			spawner_id = "arena_citadel_b1_manual",
			spawn_counter_category = "main",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_beastmen"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 2,
				harder = 2,
				cataclysm = 2,
				normal = 1
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1",
			composition_type = "morris_small_beastmen"
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b1_manual",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 2,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	citadel_arena_b2 = {
		{
			"inject_event",
			event_name = "citadel_arena_b2_start"
		},
		{
			"inject_event",
			event_name = "citadel_arena_b2_sequence"
		},
		{
			"inject_event",
			event_name = "citadel_arena_b2_end"
		}
	},
	citadel_arena_b2_sequence = {
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_b2_chaos",
				"deus_citadel_arena_b2_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"chaos"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_b2_beastmen",
				"deus_citadel_arena_b2_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"beastmen"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_citadel_arena_b2_beastmen",
				"deus_citadel_arena_b2_chaos"
			},
			faction_requirement_list = {
				"chaos",
				"beastmen"
			}
		}
	},
	citadel_arena_b2_start = {
		{
			"set_master_event_running",
			name = "citadel_arena_b2"
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
	citadel_arena_b2_end = {
		{
			"continue_when_spawned_count",
			condition = function (counter)
				return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
			end
		},
		{
			"flow_event",
			flow_event_name = "citadel_arena_b2_done"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"set_wwise_override_state",
			name = "false"
		}
	},
	deus_citadel_arena_b2_skaven = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2_ledge",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2_manual",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"spawn_at_raw",
			spawner_id = "arena_citadel_b2_manual",
			spawn_counter_category = "main",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master"
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
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 8
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "morris_elite_medium_skaven"
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
			spawner_id = "arena_citadel_b2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2_ledge",
			composition_type = "event_small"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	deus_citadel_arena_b2_chaos = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "event_chaos_extra_spice_small"
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
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "morris_elite_medium_chaos"
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
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	deus_citadel_arena_b2_beastmen = {
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "event_medium_beastmen"
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
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "morris_elite_medium_beastmen"
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
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_b2",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	arena_citadel_terror = {
		{
			"inject_event",
			event_name = "arena_citadel_terror_start"
		},
		{
			"inject_event",
			event_name = "arena_citadel_terror_sequence"
		},
		{
			"inject_event",
			event_name = "arena_citadel_terror_end"
		}
	},
	arena_citadel_terror_sequence = {
		{
			"inject_event",
			event_name_list = {
				"deus_arena_citadel_terror_skaven_chaos",
				"deus_arena_citadel_terror_chaos_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"chaos"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_arena_citadel_terror_skaven_beastmen",
				"deus_arena_citadel_terror_beastmen_skaven"
			},
			faction_requirement_list = {
				"skaven",
				"beastmen"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"deus_arena_citadel_terror_chaos_beastmen",
				"deus_arena_citadel_terror_beastmen_chaos"
			},
			faction_requirement_list = {
				"chaos",
				"beastmen"
			}
		}
	},
	arena_citadel_terror_start = {
		{
			"set_master_event_running",
			name = "arena_citadel_terror"
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
			name = "terror_mb3"
		}
	},
	arena_citadel_terror_end = {
		{
			"continue_when_spawned_count",
			condition = function (counter)
				return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
			end
		},
		{
			"flow_event",
			flow_event_name = "arena_citadel_terror_done"
		},
		{
			"disable_bots_in_carry_event"
		},
		{
			"set_wwise_override_state",
			name = "false"
		}
	},
	deus_arena_citadel_terror_skaven_chaos = {
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_skaven_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_chaos_wave_2"
			}
		}
	},
	deus_arena_citadel_terror_skaven_beastmen = {
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_skaven_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_beastmen_wave_2"
			}
		}
	},
	deus_arena_citadel_terror_chaos_skaven = {
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_chaos_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_skaven_wave_2"
			}
		}
	},
	deus_arena_citadel_terror_chaos_beastmen = {
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_chaos_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_beastmen_wave_2"
			}
		}
	},
	deus_arena_citadel_terror_beastmen_skaven = {
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_beastmen_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_skaven_wave_2"
			}
		}
	},
	deus_arena_citadel_terror_beastmen_chaos = {
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_beastmen_wave_1"
			}
		},
		{
			"inject_event",
			event_name_list = {
				"arena_citadel_terror_chaos_wave_2"
			}
		}
	},
	arena_citadel_terror_skaven_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"flow_event",
			flow_event_name = "arena_citadel_terror_skaven_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			limit_spawners = 2,
			spawner_id = "arena_citadel_final_ledge",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 15
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			limit_spawners = 2,
			spawner_id = "arena_citadel_final_ledge",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 30
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final_platform",
			composition_type = "morris_elite_medium_skaven"
		},
		{
			"delay",
			duration = 5
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
			spawner_id = "arena_citadel_final_manual",
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
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final_platform",
			composition_type = "morris_elite_medium_skaven"
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
		}
	},
	arena_citadel_terror_skaven_wave_2 = {
		{
			"flow_event",
			flow_event_name = "arena_citadel_terror_skaven_special"
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final_ledge",
			composition_type = "event_large"
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final_ledge",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			spawner_id = "arena_citadel_final_manual",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend"
			}
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
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
			spawner_id = "arena_citadel_final",
			composition_type = "morris_elite_medium_skaven"
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final_ledge",
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "morris_elite_medium_skaven"
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "morris_elite_medium_skaven"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	arena_citadel_terror_chaos_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"flow_event",
			flow_event_name = "arena_citadel_terror_chaos_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			limit_spawners = 2,
			spawner_id = "arena_citadel_final",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 15
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			limit_spawners = 2,
			spawner_id = "arena_citadel_final",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 30
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final_platform",
			composition_type = "morris_elite_medium_chaos"
		},
		{
			"delay",
			duration = 5
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
			spawner_id = "arena_citadel_final_manual",
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
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 10
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final_platform",
			composition_type = "morris_elite_medium_chaos"
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
		}
	},
	arena_citadel_terror_chaos_wave_2 = {
		{
			"flow_event",
			flow_event_name = "arena_citadel_terror_chaos_special"
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "event_large_chaos"
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			spawner_id = "arena_citadel_final_manual",
			breed_name = {
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "event_small_chaos"
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
			spawner_id = "arena_citadel_final_platform",
			composition_type = "morris_elite_medium_chaos"
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "event_medium_chaos"
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "morris_elite_medium_chaos"
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "chaos_warriors"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	arena_citadel_terror_beastmen_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"flow_event",
			flow_event_name = "arena_citadel_terror_beastmen_special"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			limit_spawners = 2,
			spawner_id = "arena_citadel_final",
			composition_type = "event_large_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 15
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			limit_spawners = 2,
			spawner_id = "arena_citadel_final",
			composition_type = "event_large_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 30
			end
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final_platform",
			composition_type = "morris_elite_medium_beastmen"
		},
		{
			"delay",
			duration = 5
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
			breed_name = "beastmen_minotaur",
			spawner_id = "arena_citadel_final_manual"
		},
		{
			"delay",
			duration = 5
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
			spawner_id = "arena_citadel_final_platform",
			composition_type = "morris_elite_medium_beastmen"
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
		}
	},
	arena_citadel_terror_beastmen_wave_2 = {
		{
			"flow_event",
			flow_event_name = "arena_citadel_terror_beastmen_special"
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "event_large_beastmen"
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
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "event_large_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.boss < 1
			end
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			breed_name = "beastmen_minotaur",
			spawner_id = "arena_citadel_final_manual"
		},
		{
			"delay",
			duration = 20
		},
		{
			"event_horde",
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "event_small_beastmen"
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
			spawner_id = "arena_citadel_final_platform",
			composition_type = "morris_elite_medium_beastmen"
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "event_medium_beastmen"
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "morris_elite_medium_beastmen"
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
			spawn_counter_category = "main",
			spawner_id = "arena_citadel_final",
			composition_type = "bestigors"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when_spawned_count",
			duration = 120,
			condition = function (counter)
				return counter.main < 1
			end
		}
	},
	arena_citadel_terror_skaven_special = {
		{
			"set_master_event_running",
			name = "arena_citadel_terror"
		},
		{
			"spawn_special",
			spawn_counter_category = "special",
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
			"spawn_special",
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
			flow_event_name = "arena_citadel_terror_specials_done"
		}
	},
	arena_citadel_terror_chaos_special = {
		{
			"set_master_event_running",
			name = "arena_citadel_terror"
		},
		{
			"spawn_special",
			spawn_counter_category = "special",
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
			"spawn_special",
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
			flow_event_name = "arena_citadel_terror_specials_done"
		}
	},
	arena_citadel_terror_beastmen_special = {
		{
			"set_master_event_running",
			name = "arena_citadel_terror"
		},
		{
			"spawn_special",
			spawn_counter_category = "special",
			breed_name = "beastmen_standard_bearer",
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
			flow_event_name = "arena_citadel_terror_specials_done"
		}
	}
}

return terror_event_blueprints
