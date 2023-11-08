return function ()
	define_rule({
		name = "pwh_bell_intro_a",
		response = "pwh_bell_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_intro_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"bell_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_bell_intro_b",
		response = "pwh_bell_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"bell_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"bell_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_bell_intro_c",
		response = "pwh_bell_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"bell_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"bell_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_chime_01",
		response = "pwh_level_bell_chime_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_chime"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_bell_chime",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_chime",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_destroyed_01",
		response = "pwh_level_bell_destroyed_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_destroyed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_bell_destroyed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_destroyed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_distance_01",
		response = "pwh_level_bell_distance_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_distance"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_bell_distance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_distance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_effect_01",
		response = "pwh_level_bell_effect_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_effect"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_bell_effect",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_effect",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_exit_01",
		response = "pwh_level_bell_exit_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_exit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_bell_exit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_exit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_falling_01",
		response = "pwh_level_bell_falling_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_falling"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_bell_falling",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_falling",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_horde",
		response = "pwh_level_bell_horde",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_horde"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_bell_horde",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_horde",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_long_stairs_01",
		response = "pwh_level_bell_long_stairs_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_long_stairs"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_long_stairs",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_long_stairs",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_poor_quarters_01",
		response = "pwh_level_bell_poor_quarters_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_poor_quarters"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_poor_quarters",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_poor_quarters",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_rain_01",
		response = "pwh_level_bell_rain_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_rain"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_rain",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_rain",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_reaching_bell_01",
		response = "pwh_level_bell_reaching_bell_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_reaching_bell"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_rich_quarters_01",
		response = "pwh_level_bell_rich_quarters_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_rich_quarters"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_rich_quarters",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_rich_quarters",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_rooftops_01",
		response = "pwh_level_bell_rooftops_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_rooftops"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_rooftops",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_rooftops",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_spotting_01",
		response = "pwh_level_bell_spotting_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_spotting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_bell_spotting",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_spotting",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bell_vista_01",
		response = "pwh_level_bell_vista_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bell_vista"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_vista",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pwh_bell_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_bell",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_bell_intro_a_01",
				[2.0] = "pwh_bell_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_bell_intro_a_01",
				[2.0] = "pwh_bell_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 7.3617081642151,
				[2.0] = 9.481520652771
			}
		},
		pwh_bell_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_bell",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_bell_intro_b_01",
				[2.0] = "pwh_bell_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_bell_intro_b_01",
				[2.0] = "pwh_bell_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.543562412262,
				[2.0] = 6.1170625686645
			}
		},
		pwh_bell_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_bell",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_bell_intro_c_01",
				[2.0] = "pwh_bell_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_bell_intro_c_01",
				[2.0] = "pwh_bell_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 8.6488752365112,
				[2.0] = 11.389437675476
			}
		},
		pwh_level_bell_chime_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_bell",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_level_bell_chime_01"
			},
			sound_events = {
				[1.0] = "pwh_level_bell_chime_01"
			},
			sound_events_duration = {
				[1.0] = 3.5412499904633
			}
		},
		pwh_level_bell_destroyed_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_bell_destroyed_01",
				"pwh_level_bell_destroyed_02",
				"pwh_level_bell_destroyed_03",
				"pwh_level_bell_destroyed_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_destroyed_01",
				"pwh_level_bell_destroyed_02",
				"pwh_level_bell_destroyed_03",
				"pwh_level_bell_destroyed_04"
			},
			sound_events_duration = {
				7.7287707328796,
				8.5542497634888,
				6.7414164543152,
				7.5535416603088
			}
		},
		pwh_level_bell_distance_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_bell_distance_01",
				"pwh_level_bell_distance_02",
				"pwh_level_bell_distance_03",
				"pwh_level_bell_distance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_distance_01",
				"pwh_level_bell_distance_02",
				"pwh_level_bell_distance_03",
				"pwh_level_bell_distance_04"
			},
			sound_events_duration = {
				5.2800416946411,
				3.672333240509,
				5.9386043548584,
				4.8357081413269
			}
		},
		pwh_level_bell_effect_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_bell",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_level_bell_effect_01"
			},
			sound_events = {
				[1.0] = "pwh_level_bell_effect_01"
			},
			sound_events_duration = {
				[1.0] = 3.783979177475
			}
		},
		pwh_level_bell_exit_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_bell_exit_01",
				"pwh_level_bell_exit_02",
				"pwh_level_bell_exit_03",
				"pwh_level_bell_exit_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_exit_01",
				"pwh_level_bell_exit_02",
				"pwh_level_bell_exit_03",
				"pwh_level_bell_exit_04"
			},
			sound_events_duration = {
				4.6666460037231,
				7.5345416069031,
				5.4951248168945,
				6.5721459388733
			}
		},
		pwh_level_bell_falling_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_bell",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_level_bell_falling_01"
			},
			sound_events = {
				[1.0] = "pwh_level_bell_falling_01"
			},
			sound_events_duration = {
				[1.0] = 3.9954791069031
			}
		},
		pwh_level_bell_horde = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_bell",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_level_bell_horde_02"
			},
			sound_events = {
				[1.0] = "pwh_level_bell_horde_02"
			},
			sound_events_duration = {
				[1.0] = 5.8921456336975
			}
		},
		pwh_level_bell_long_stairs_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_bell_long_stairs_01",
				"pwh_level_bell_long_stairs_02",
				"pwh_level_bell_long_stairs_03",
				"pwh_level_bell_long_stairs_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_long_stairs_01",
				"pwh_level_bell_long_stairs_02",
				"pwh_level_bell_long_stairs_03",
				"pwh_level_bell_long_stairs_04"
			},
			sound_events_duration = {
				3.6874165534973,
				6.6520414352417,
				7.785041809082,
				5.2505626678467
			}
		},
		pwh_level_bell_poor_quarters_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_bell_poor_quarters_01",
				"pwh_level_bell_poor_quarters_02",
				"pwh_level_bell_poor_quarters_03",
				"pwh_level_bell_poor_quarters_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_poor_quarters_01",
				"pwh_level_bell_poor_quarters_02",
				"pwh_level_bell_poor_quarters_03",
				"pwh_level_bell_poor_quarters_04"
			},
			sound_events_duration = {
				4.2943749427795,
				3.6865208148956,
				3.7575209140778,
				6.2827706336975
			}
		},
		pwh_level_bell_rain_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_bell_rain_01",
				"pwh_level_bell_rain_02",
				"pwh_level_bell_rain_03",
				"pwh_level_bell_rain_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_rain_01",
				"pwh_level_bell_rain_02",
				"pwh_level_bell_rain_03",
				"pwh_level_bell_rain_04"
			},
			sound_events_duration = {
				6.9913539886475,
				8.4179582595825,
				7.5013957023621,
				8.2006664276123
			}
		},
		pwh_level_bell_reaching_bell_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_bell_reaching_bell_01",
				"pwh_level_bell_reaching_bell_02",
				"pwh_level_bell_reaching_bell_03",
				"pwh_level_bell_reaching_bell_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_reaching_bell_01",
				"pwh_level_bell_reaching_bell_02",
				"pwh_level_bell_reaching_bell_03",
				"pwh_level_bell_reaching_bell_04"
			},
			sound_events_duration = {
				8.2937498092651,
				7.0533123016357,
				8.3363542556763,
				8.4976043701172
			}
		},
		pwh_level_bell_rich_quarters_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_bell_rich_quarters_01",
				"pwh_level_bell_rich_quarters_02",
				"pwh_level_bell_rich_quarters_03",
				"pwh_level_bell_rich_quarters_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_rich_quarters_01",
				"pwh_level_bell_rich_quarters_02",
				"pwh_level_bell_rich_quarters_03",
				"pwh_level_bell_rich_quarters_04"
			},
			sound_events_duration = {
				5.4555625915527,
				8.7414579391479,
				6.2893333435059,
				5.3397083282471
			}
		},
		pwh_level_bell_rooftops_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pwh_level_bell_rooftops_01",
				"pwh_level_bell_rooftops_02",
				"pwh_level_bell_rooftops_03",
				"pwh_level_bell_rooftops_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_rooftops_01",
				"pwh_level_bell_rooftops_02",
				"pwh_level_bell_rooftops_03",
				"pwh_level_bell_rooftops_04"
			},
			sound_events_duration = {
				4.0565624237061,
				4.4871459007263,
				2.8333332538605,
				2.7748959064484
			}
		},
		pwh_level_bell_spotting_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_bell_spotting_01",
				"pwh_level_bell_spotting_02",
				"pwh_level_bell_spotting_03",
				"pwh_level_bell_spotting_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_spotting_01",
				"pwh_level_bell_spotting_02",
				"pwh_level_bell_spotting_03",
				"pwh_level_bell_spotting_04"
			},
			sound_events_duration = {
				7.2924375534058,
				3.8248333930969,
				8.1348123550415,
				6.0365209579468
			}
		},
		pwh_level_bell_vista_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_bell",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_bell_vista_01",
				"pwh_level_bell_vista_02",
				"pwh_level_bell_vista_03",
				"pwh_level_bell_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bell_vista_01",
				"pwh_level_bell_vista_02",
				"pwh_level_bell_vista_03",
				"pwh_level_bell_vista_04"
			},
			sound_events_duration = {
				5.2424583435059,
				5.8803124427795,
				4.3824791908264,
				5.7624373435974
			}
		}
	})
end
