return function ()
	define_rule({
		name = "pwe_bell_intro_a",
		response = "pwe_bell_intro_a",
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
		name = "pwe_bell_intro_b",
		response = "pwe_bell_intro_b",
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
				"wood_elf"
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
		name = "pwe_bell_intro_c",
		response = "pwe_bell_intro_c",
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
				"wood_elf"
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
		name = "pwe_level_bell_destroyed_01",
		response = "pwe_level_bell_destroyed_01",
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
		name = "pwe_level_bell_distance_01",
		response = "pwe_level_bell_distance_01",
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
				"level_bell_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_elevator",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_bell_effect_01",
		response = "pwe_level_bell_effect_01",
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
		name = "pwe_level_bell_falling_01",
		response = "pwe_level_bell_falling_01",
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
		name = "pwe_level_bell_reaching_bell_01",
		response = "pwe_level_bell_reaching_bell_01",
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
		name = "pwe_level_bell_spotting_01",
		response = "pwe_level_bell_spotting_01",
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
	add_dialogues({
		pwe_bell_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_bell",
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
				[1.0] = "pwe_bell_intro_a_01",
				[2.0] = "pwe_bell_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_bell_intro_a_01",
				[2.0] = "pwe_bell_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 5.6873750686645,
				[2.0] = 6.0246248245239
			}
		},
		pwe_bell_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_bell",
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
				[1.0] = "pwe_bell_intro_b_01",
				[2.0] = "pwe_bell_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_bell_intro_b_01",
				[2.0] = "pwe_bell_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 6.3633127212524,
				[2.0] = 6.2121667861939
			}
		},
		pwe_bell_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_bell",
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
				[1.0] = "pwe_bell_intro_c_01",
				[2.0] = "pwe_bell_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_bell_intro_c_01",
				[2.0] = "pwe_bell_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 7.0178751945496,
				[2.0] = 6.726437330246
			}
		},
		pwe_level_bell_destroyed_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_bell",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwe_level_bell_destroyed_01",
				[2.0] = "pwe_level_bell_destroyed_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_level_bell_destroyed_01",
				[2.0] = "pwe_level_bell_destroyed_02"
			},
			sound_events_duration = {
				[1.0] = 2.9728751182556,
				[2.0] = 2.2525417804718
			}
		},
		pwe_level_bell_distance_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_bell",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_bell_distance_01",
				[2.0] = "pwe_level_bell_distance_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_level_bell_distance_01",
				[2.0] = "pwe_level_bell_distance_02"
			},
			sound_events_duration = {
				[1.0] = 3.101083278656,
				[2.0] = 4.0112396478653
			}
		},
		pwe_level_bell_effect_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_bell",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwe_level_bell_effect_01",
				[2.0] = "pwe_level_bell_effect_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_level_bell_effect_01",
				[2.0] = "pwe_level_bell_effect_02"
			},
			sound_events_duration = {
				[1.0] = 5.6722497940064,
				[2.0] = 4.1969165802002
			}
		},
		pwe_level_bell_falling_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_bell",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwe_level_bell_falling_01",
				[2.0] = "pwe_level_bell_falling_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_level_bell_falling_01",
				[2.0] = "pwe_level_bell_falling_02"
			},
			sound_events_duration = {
				[1.0] = 5.8203959465027,
				[2.0] = 5.5686664581299
			}
		},
		pwe_level_bell_reaching_bell_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_bell",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwe_level_bell_reaching_bell_01",
				[2.0] = "pwe_level_bell_reaching_bell_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_level_bell_reaching_bell_01",
				[2.0] = "pwe_level_bell_reaching_bell_02"
			},
			sound_events_duration = {
				[1.0] = 3.5663125514984,
				[2.0] = 3.6468749046326
			}
		},
		pwe_level_bell_spotting_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "wood_elf_bell",
			sound_events_n = 3,
			category = "level_talk",
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
				"pwe_level_bell_spotting_01",
				"pwe_level_bell_spotting_02",
				"pwe_level_bell_spotting_03"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bell_spotting_01",
				"pwe_level_bell_spotting_02",
				"pwe_level_bell_spotting_03"
			},
			sound_events_duration = {
				2.6632499694824,
				2.0719375610352,
				2.592916727066
			}
		}
	})
end
