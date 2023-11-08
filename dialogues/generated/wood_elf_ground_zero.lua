return function ()
	define_rule({
		name = "pwe_ground_zero_intro_a",
		response = "pwe_ground_zero_intro_a",
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
				"ground_zero_intro_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"ground_zero_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_ground_zero_intro_b",
		response = "pwe_ground_zero_intro_b",
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
				"ground_zero_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"ground_zero_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_ground_zero_intro_c",
		response = "pwe_ground_zero_intro_c",
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
				"ground_zero_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"ground_zero_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_level_ground_zero_boss_spotted",
		response = "pwe_level_ground_zero_boss_spotted",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ebh_level_ground_zero_lord_intro"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"ground_zero_boss_spotted",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_boss_spotted",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_level_ground_zero_boss_taunt_reply",
		response = "pwe_level_ground_zero_boss_taunt_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ebh_level_ground_zero_lord_banter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"ground_zero_boss_taunt_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_boss_taunt_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_level_ground_zero_canal_crossing",
		response = "pwe_level_ground_zero_canal_crossing",
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
				"ground_zero_canal_crossing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"level_ground_zero_canal_crossing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_canal_crossing",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_ground_zero_canals",
		response = "pwe_level_ground_zero_canals",
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
				"ground_zero_canals"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"level_ground_zero_canals",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_canals",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_ground_zero_cargo_elevator",
		response = "pwe_level_ground_zero_cargo_elevator",
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
				"ground_zero_cargo_elevator"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"level_ground_zero_cargo_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_cargo_elevator",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_ground_zero_complete",
		response = "pwe_level_ground_zero_complete",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"level_ground_zero_complete",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"level_ground_zero_complete",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_level_ground_zero_looking_for_elevator",
		response = "pwe_level_ground_zero_looking_for_elevator",
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
				"ground_zero_looking_for_elevator"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"level_ground_zero_looking_for_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_looking_for_elevator",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_ground_zero_welcoming_committee",
		response = "pwe_level_ground_zero_welcoming_committee",
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
				"ground_zero_welcoming_committee"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"level_ground_zero_welcoming_committee",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_welcoming_committee",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pwe_ground_zero_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_ground_zero",
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
				[1.0] = "pwe_ground_zero_intro_a_01",
				[2.0] = "pwe_ground_zero_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_ground_zero_intro_a_01",
				[2.0] = "pwe_ground_zero_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.6785209178925,
				[2.0] = 1.854708313942
			}
		},
		pwe_ground_zero_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_ground_zero",
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
				[1.0] = "pwe_ground_zero_intro_b_01",
				[2.0] = "pwe_ground_zero_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_ground_zero_intro_b_01",
				[2.0] = "pwe_ground_zero_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.6432290077209,
				[2.0] = 4.2170000076294
			}
		},
		pwe_ground_zero_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_ground_zero",
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
				[1.0] = "pwe_ground_zero_intro_c_01",
				[2.0] = "pwe_ground_zero_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_ground_zero_intro_c_01",
				[2.0] = "pwe_ground_zero_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.953125,
				[2.0] = 4.5817084312439
			}
		},
		pwe_level_ground_zero_boss_spotted = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_ground_zero",
			sound_events_n = 2,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_level_ground_zero_boss_spotted_01",
				[2.0] = "pwe_level_ground_zero_boss_spotted_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_level_ground_zero_boss_spotted_01",
				[2.0] = "pwe_level_ground_zero_boss_spotted_02"
			},
			sound_events_duration = {
				[1.0] = 5.1214165687561,
				[2.0] = 4.866250038147
			}
		},
		pwe_level_ground_zero_boss_taunt_reply = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_ground_zero",
			sound_events_n = 2,
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_level_ground_zero_boss_taunt_reply_01",
				[2.0] = "pwe_level_ground_zero_boss_taunt_reply_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_level_ground_zero_boss_taunt_reply_01",
				[2.0] = "pwe_level_ground_zero_boss_taunt_reply_02"
			},
			sound_events_duration = {
				[1.0] = 3.5200207233429,
				[2.0] = 1.8721874952316
			}
		},
		pwe_level_ground_zero_canal_crossing = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ground_zero",
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
				"pwe_level_ground_zero_canal_crossing_01",
				"pwe_level_ground_zero_canal_crossing_02",
				"pwe_level_ground_zero_canal_crossing_03",
				"pwe_level_ground_zero_canal_crossing_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ground_zero_canal_crossing_01",
				"pwe_level_ground_zero_canal_crossing_02",
				"pwe_level_ground_zero_canal_crossing_03",
				"pwe_level_ground_zero_canal_crossing_04"
			},
			sound_events_duration = {
				3.7730417251587,
				6.8293542861939,
				5.5374374389648,
				6.2351665496826
			}
		},
		pwe_level_ground_zero_canals = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ground_zero",
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
				"pwe_level_ground_zero_canals_01",
				"pwe_level_ground_zero_canals_02",
				"pwe_level_ground_zero_canals_03",
				"pwe_level_ground_zero_canals_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ground_zero_canals_01",
				"pwe_level_ground_zero_canals_02",
				"pwe_level_ground_zero_canals_03",
				"pwe_level_ground_zero_canals_04"
			},
			sound_events_duration = {
				2.910854101181,
				4.4534168243408,
				3.3230625391007,
				3.9127917289734
			}
		},
		pwe_level_ground_zero_cargo_elevator = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ground_zero",
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
				"pwe_level_ground_zero_cargo_elevator_01",
				"pwe_level_ground_zero_cargo_elevator_02",
				"pwe_level_ground_zero_cargo_elevator_03",
				"pwe_level_ground_zero_cargo_elevator_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ground_zero_cargo_elevator_01",
				"pwe_level_ground_zero_cargo_elevator_02",
				"pwe_level_ground_zero_cargo_elevator_03",
				"pwe_level_ground_zero_cargo_elevator_04"
			},
			sound_events_duration = {
				3.9305832386017,
				4.1603126525879,
				3.4346874952316,
				2.2262499332428
			}
		},
		pwe_level_ground_zero_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_ground_zero",
			sound_events_n = 2,
			category = "player_alerts_boss",
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
				[1.0] = "pwe_level_ground_zero_complete_01",
				[2.0] = "pwe_level_ground_zero_complete_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_level_ground_zero_complete_01",
				[2.0] = "pwe_level_ground_zero_complete_02"
			},
			sound_events_duration = {
				[1.0] = 2.9773540496826,
				[2.0] = 4.769896030426
			}
		},
		pwe_level_ground_zero_looking_for_elevator = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ground_zero",
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
				"pwe_level_ground_zero_looking_for_elevator_01",
				"pwe_level_ground_zero_looking_for_elevator_02",
				"pwe_level_ground_zero_looking_for_elevator_03",
				"pwe_level_ground_zero_looking_for_elevator_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ground_zero_looking_for_elevator_01",
				"pwe_level_ground_zero_looking_for_elevator_02",
				"pwe_level_ground_zero_looking_for_elevator_03",
				"pwe_level_ground_zero_looking_for_elevator_04"
			},
			sound_events_duration = {
				2.7750000953674,
				3.438458442688,
				2.5067708492279,
				2.7000000476837
			}
		},
		pwe_level_ground_zero_welcoming_committee = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "wood_elf_ground_zero",
			sound_events_n = 3,
			category = "story_talk",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_level_ground_zero_welcoming_committee_01",
				"pwe_level_ground_zero_welcoming_committee_02",
				"pwe_level_ground_zero_welcoming_committee_03"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ground_zero_welcoming_committee_01",
				"pwe_level_ground_zero_welcoming_committee_02",
				"pwe_level_ground_zero_welcoming_committee_03"
			},
			sound_events_duration = {
				3.3032290935516,
				3.827645778656,
				3.3443748950958
			}
		}
	})
end
