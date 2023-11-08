return function ()
	define_rule({
		name = "pwe_dummy_memory_trigger_end_event",
		response = "pwe_dummy_memory_trigger_end_event",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dummy_memory_trigger_end_event"
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
				"end_event_memory_trigger",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"end_event_memory_trigger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_brewery_a",
		response = "pwe_dwarf_internal_brewery_a",
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
				"dwarf_internal_brewery_a"
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
				"dwarf_internal_brewery_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_brewery_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_brewery_speaking_tube_interact_one_a",
		response = "pwe_dwarf_internal_brewery_speaking_tube_interact_one_a",
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
				"dwarf_internal_brewery_speaking_tube_interact_one_a"
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
				"dwarf_internal_brewery_speaking_tube_interact_one_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_brewery_speaking_tube_interact_one_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_brewery_speaking_tube_interact_two_a",
		response = "pwe_dwarf_internal_brewery_speaking_tube_interact_two_a",
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
				"dwarf_internal_brewery_speaking_tube_interact_two_a"
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
				"dwarf_internal_brewery_speaking_tube_interact_two_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_brewery_speaking_tube_interact_two_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_dead_dwarfs",
		response = "pwe_dwarf_internal_dead_dwarfs",
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
				"dwarf_internal_dead_dwarfs"
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
				"dwarf_internal_dead_dwarfs",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_dead_dwarfs",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_dwarf_sign",
		response = "pwe_dwarf_internal_dwarf_sign",
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
				"dwarf_internal_dwarf_sign"
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
				"dwarf_internal_dwarf_sign",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_dwarf_sign",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_end_conversation_a",
		response = "pwe_dwarf_internal_end_conversation_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				6
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				30
			},
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_a",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_a",
				OP.NOT,
				"dwarf_internal_end_event_interact_a"
			},
			{
				"faction_memory",
				"end_event_memory_trigger",
				OP.NOT,
				"end_event_memory_trigger"
			},
			{
				"faction_memory",
				"dwarf_internal_end_conversation_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_conversation_a",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_end_event_interact_a",
		response = "pwe_dwarf_internal_end_event_interact_a",
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
				"dwarf_internal_end_event_interact_a"
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
				"dwarf_internal_end_event_interact_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_end_event_interact_c",
		response = "pwe_dwarf_internal_end_event_interact_c",
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
				"dwarf_internal_end_event_interact_b"
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
				"dwarf_internal_end_event_interact_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b",
		response = "pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b",
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
				"dwarf_internal_end_event_speaking_tube_PLAN_A_a"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"dwarf_internal_end_event_speaking_tube_PLAN_A_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_event_speaking_tube_PLAN_A_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_end_event_speaking_tube_PLAN_B",
		response = "pwe_dwarf_internal_end_event_speaking_tube_PLAN_B",
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
				"dwarf_internal_end_event_speaking_tube_PLAN_B"
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
				"dwarf_internal_end_event_speaking_tube_PLAN_B",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_event_speaking_tube_PLAN_B",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_hasnt_improved",
		response = "pwe_dwarf_internal_hasnt_improved",
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
				"dwarf_internal_hasnt_improved"
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
				"dwarf_internal_hasnt_improved",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_hasnt_improved",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_massing_skaven_a",
		response = "pwe_dwarf_internal_massing_skaven_a",
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
				"dwarf_internal_massing_skaven_a"
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
				"dwarf_internal_massing_skaven_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_massing_skaven_a",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_internal_conversation_memory",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_mid_conversation_bardin_c",
		response = "pwe_dwarf_internal_mid_conversation_bardin_c",
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
				"dwarf_internal_mid_conversation_bardin_b"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_bardin_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_bardin_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_mid_conversation_no_bardin_a",
		response = "pwe_dwarf_internal_mid_conversation_no_bardin_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				4
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"dwarf_internal_conversation_memory",
				OP.GTEQ,
				1
			},
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_a",
				OP.NOT,
				"dwarf_internal_end_event_interact_a"
			},
			{
				"faction_memory",
				"end_event_memory_trigger",
				OP.NOT,
				"end_event_memory_trigger"
			},
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_a",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_skaven_works",
		response = "pwe_dwarf_internal_skaven_works",
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
				"dwarf_internal_skaven_works"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"dwarf_internal_skaven_works",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_skaven_works",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_start_banter_a",
		response = "pwe_dwarf_internal_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_internal_start_banter_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"dwarf_internal_start_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_start_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_dwarf_internal_start_banter_b",
		name = "pwe_dwarf_internal_start_banter_b",
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
				"dwarf_internal_start_banter_a"
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
			}
		}
	})
	define_rule({
		response = "pwe_dwarf_internal_start_banter_c",
		name = "pwe_dwarf_internal_start_banter_c",
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
				"dwarf_internal_start_banter_b"
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
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_steam_clearing",
		response = "pwe_dwarf_internal_steam_clearing",
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
				"dwarf_internal_steam_clearing"
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
				"dwarf_internal_steam_clearing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_steam_clearing",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_internal_conversation_memory",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_still_a_maze",
		response = "pwe_dwarf_internal_still_a_maze",
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
				"dwarf_internal_still_a_maze"
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
				"dwarf_internal_still_a_maze",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_still_a_maze",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_dwarf_internal_valaya",
		response = "pwe_dwarf_internal_valaya",
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
				"dwarf_internal_valaya"
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
				"dwarf_internal_valaya",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_valaya",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pwe_dummy_memory_trigger_end_event = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_dlc_dwarf_interior",
			category = "special_occasion",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "dummy"
			},
			sound_events = {
				[1.0] = "dummy"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			}
		},
		pwe_dwarf_internal_brewery_a = {
			override_awareness = "dwarf_internal_brewery_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_brewery_a_01",
				"pwe_dwarf_internal_brewery_a_02",
				"pwe_dwarf_internal_brewery_a_03",
				"pwe_dwarf_internal_brewery_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_brewery_a_01",
				"pwe_dwarf_internal_brewery_a_02",
				"pwe_dwarf_internal_brewery_a_03",
				"pwe_dwarf_internal_brewery_a_04"
			},
			sound_events_duration = {
				4.8629789352417,
				4.4739789962769,
				4.727979183197,
				4.3549790382385
			}
		},
		pwe_dwarf_internal_brewery_speaking_tube_interact_one_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_brewery_speaking_tube_interact_one_a_01",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_one_a_02",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_one_a_03",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_one_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_brewery_speaking_tube_interact_one_a_01",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_one_a_02",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_one_a_03",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_one_a_04"
			},
			sound_events_duration = {
				3.9730000495911,
				3.9349999427795,
				7.040979385376,
				4.4099998474121
			}
		},
		pwe_dwarf_internal_brewery_speaking_tube_interact_two_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_brewery_speaking_tube_interact_two_a_01",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_two_a_02",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_two_a_03",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_two_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_brewery_speaking_tube_interact_two_a_01",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_two_a_02",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_two_a_03",
				"pwe_dwarf_internal_brewery_speaking_tube_interact_two_a_04"
			},
			sound_events_duration = {
				4.688000202179,
				3.2969791889191,
				3.7459790706634,
				3.1859791278839
			}
		},
		pwe_dwarf_internal_dead_dwarfs = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_dead_dwarfs_01",
				"pwe_dwarf_internal_dead_dwarfs_02",
				"pwe_dwarf_internal_dead_dwarfs_03",
				"pwe_dwarf_internal_dead_dwarfs_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_dead_dwarfs_01",
				"pwe_dwarf_internal_dead_dwarfs_02",
				"pwe_dwarf_internal_dead_dwarfs_03",
				"pwe_dwarf_internal_dead_dwarfs_04"
			},
			sound_events_duration = {
				4.2239789962769,
				2.9039790630341,
				3.9149792194366,
				7.0489792823792
			}
		},
		pwe_dwarf_internal_dwarf_sign = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_dwarf_sign_01",
				"pwe_dwarf_internal_dwarf_sign_02",
				"pwe_dwarf_internal_dwarf_sign_03",
				"pwe_dwarf_internal_dwarf_sign_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_dwarf_sign_01",
				"pwe_dwarf_internal_dwarf_sign_02",
				"pwe_dwarf_internal_dwarf_sign_03",
				"pwe_dwarf_internal_dwarf_sign_04"
			},
			sound_events_duration = {
				4.6419792175293,
				3.7289791107178,
				4.1669793128967,
				3.9609792232513
			}
		},
		pwe_dwarf_internal_end_conversation_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
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
				"pwe_dwarf_internal_end_conversation_a_01",
				"pwe_dwarf_internal_end_conversation_a_02",
				"pwe_dwarf_internal_end_conversation_a_03",
				"pwe_dwarf_internal_end_conversation_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_end_conversation_a_01",
				"pwe_dwarf_internal_end_conversation_a_02",
				"pwe_dwarf_internal_end_conversation_a_03",
				"pwe_dwarf_internal_end_conversation_a_04"
			},
			sound_events_duration = {
				2.8709790706634,
				4.6469793319702,
				4.5999794006348,
				3.7520000934601
			}
		},
		pwe_dwarf_internal_end_event_interact_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_end_event_interact_a_01",
				"pwe_dwarf_internal_end_event_interact_a_02",
				"pwe_dwarf_internal_end_event_interact_a_03",
				"pwe_dwarf_internal_end_event_interact_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_end_event_interact_a_01",
				"pwe_dwarf_internal_end_event_interact_a_02",
				"pwe_dwarf_internal_end_event_interact_a_03",
				"pwe_dwarf_internal_end_event_interact_a_04"
			},
			sound_events_duration = {
				6.2379789352417,
				4.811999797821,
				3.6539790630341,
				3.9739792346954
			}
		},
		pwe_dwarf_internal_end_event_interact_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_end_event_interact_c_01",
				"pwe_dwarf_internal_end_event_interact_c_02",
				"pwe_dwarf_internal_end_event_interact_c_03",
				"pwe_dwarf_internal_end_event_interact_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_end_event_interact_c_01",
				"pwe_dwarf_internal_end_event_interact_c_02",
				"pwe_dwarf_internal_end_event_interact_c_03",
				"pwe_dwarf_internal_end_event_interact_c_04"
			},
			sound_events_duration = {
				3.5029792785645,
				3.8309791088104,
				2.9579792022705,
				3.8299791812897
			}
		},
		pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b_01",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b_02",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b_03",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b_01",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b_02",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b_03",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_A_b_04"
			},
			sound_events_duration = {
				3.2189791202545,
				4.4859790802002,
				2.7189791202545,
				2.5759999752045
			}
		},
		pwe_dwarf_internal_end_event_speaking_tube_PLAN_B = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_B_01",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_B_02",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_B_03",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_B_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_B_01",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_B_02",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_B_03",
				"pwe_dwarf_internal_end_event_speaking_tube_PLAN_B_04"
			},
			sound_events_duration = {
				4,
				4.9509792327881,
				5.084979057312,
				6.941978931427
			}
		},
		pwe_dwarf_internal_hasnt_improved = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_hasnt_improved_01",
				"pwe_dwarf_internal_hasnt_improved_02",
				"pwe_dwarf_internal_hasnt_improved_03",
				"pwe_dwarf_internal_hasnt_improved_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_hasnt_improved_01",
				"pwe_dwarf_internal_hasnt_improved_02",
				"pwe_dwarf_internal_hasnt_improved_03",
				"pwe_dwarf_internal_hasnt_improved_04"
			},
			sound_events_duration = {
				4.51797914505,
				4.7819790840149,
				4.7289791107178,
				4.397979259491
			}
		},
		pwe_dwarf_internal_massing_skaven_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
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
				"pwe_dwarf_internal_massing_skaven_a_01",
				"pwe_dwarf_internal_massing_skaven_a_02",
				"pwe_dwarf_internal_massing_skaven_a_03",
				"pwe_dwarf_internal_massing_skaven_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_massing_skaven_a_01",
				"pwe_dwarf_internal_massing_skaven_a_02",
				"pwe_dwarf_internal_massing_skaven_a_03",
				"pwe_dwarf_internal_massing_skaven_a_04"
			},
			sound_events_duration = {
				5.9979791641235,
				6.7929792404175,
				4.8109793663025,
				5.5029792785644
			}
		},
		pwe_dwarf_internal_mid_conversation_bardin_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
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
				"pwe_dwarf_internal_mid_conversation_bardin_c_01",
				"pwe_dwarf_internal_mid_conversation_bardin_c_02",
				"pwe_dwarf_internal_mid_conversation_bardin_c_03",
				"pwe_dwarf_internal_mid_conversation_bardin_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_mid_conversation_bardin_c_01",
				"pwe_dwarf_internal_mid_conversation_bardin_c_02",
				"pwe_dwarf_internal_mid_conversation_bardin_c_03",
				"pwe_dwarf_internal_mid_conversation_bardin_c_04"
			},
			sound_events_duration = {
				6.2119998931885,
				6.772979259491,
				5.0869793891907,
				4.2849793434143
			}
		},
		pwe_dwarf_internal_mid_conversation_no_bardin_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
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
				"pwe_dwarf_internal_mid_conversation_no_bardin_a_01",
				"pwe_dwarf_internal_mid_conversation_no_bardin_a_02",
				"pwe_dwarf_internal_mid_conversation_no_bardin_a_03",
				"pwe_dwarf_internal_mid_conversation_no_bardin_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_mid_conversation_no_bardin_a_01",
				"pwe_dwarf_internal_mid_conversation_no_bardin_a_02",
				"pwe_dwarf_internal_mid_conversation_no_bardin_a_03",
				"pwe_dwarf_internal_mid_conversation_no_bardin_a_04"
			},
			sound_events_duration = {
				5.2999792098999,
				3.9479999542236,
				7.4859790802002,
				6.9749794006348
			}
		},
		pwe_dwarf_internal_skaven_works = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "story_talk",
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
				"pwe_dwarf_internal_skaven_works_01",
				"pwe_dwarf_internal_skaven_works_02",
				"pwe_dwarf_internal_skaven_works_03",
				"pwe_dwarf_internal_skaven_works_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_skaven_works_01",
				"pwe_dwarf_internal_skaven_works_02",
				"pwe_dwarf_internal_skaven_works_03",
				"pwe_dwarf_internal_skaven_works_04"
			},
			sound_events_duration = {
				4.745979309082,
				3.9119791984558,
				2.7209792137146,
				3.5949790477753
			}
		},
		pwe_dwarf_internal_start_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_interior",
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
				[1.0] = "pwe_dwarf_internal_start_banter_a_01",
				[2.0] = "pwe_dwarf_internal_start_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_dwarf_internal_start_banter_a_01",
				[2.0] = "pwe_dwarf_internal_start_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 4.7069792747498,
				[2.0] = 3.0199999809265
			}
		},
		pwe_dwarf_internal_start_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_interior",
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
				[1.0] = "pwe_dwarf_internal_start_banter_b_01",
				[2.0] = "pwe_dwarf_internal_start_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_dwarf_internal_start_banter_b_01",
				[2.0] = "pwe_dwarf_internal_start_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 3.1579792499542,
				[2.0] = 4.1939792633057
			}
		},
		pwe_dwarf_internal_start_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_interior",
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
				[1.0] = "pwe_dwarf_internal_start_banter_c_01",
				[2.0] = "pwe_dwarf_internal_start_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_dwarf_internal_start_banter_c_01",
				[2.0] = "pwe_dwarf_internal_start_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.9729790687561,
				[2.0] = 5.2889790534973
			}
		},
		pwe_dwarf_internal_steam_clearing = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_steam_clearing_01",
				"pwe_dwarf_internal_steam_clearing_02",
				"pwe_dwarf_internal_steam_clearing_03",
				"pwe_dwarf_internal_steam_clearing_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_steam_clearing_01",
				"pwe_dwarf_internal_steam_clearing_02",
				"pwe_dwarf_internal_steam_clearing_03",
				"pwe_dwarf_internal_steam_clearing_04"
			},
			sound_events_duration = {
				3.879979133606,
				4.9609789848328,
				5.1369791030884,
				3.0569791793823
			}
		},
		pwe_dwarf_internal_still_a_maze = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
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
				"pwe_dwarf_internal_still_a_maze_01",
				"pwe_dwarf_internal_still_a_maze_02",
				"pwe_dwarf_internal_still_a_maze_03",
				"pwe_dwarf_internal_still_a_maze_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_still_a_maze_01",
				"pwe_dwarf_internal_still_a_maze_02",
				"pwe_dwarf_internal_still_a_maze_03",
				"pwe_dwarf_internal_still_a_maze_04"
			},
			sound_events_duration = {
				3.5249791145325,
				5.9299793243408,
				3.8389792442322,
				4.8029789924622
			}
		},
		pwe_dwarf_internal_valaya = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_interior",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pwe_dwarf_internal_valaya_01",
				"pwe_dwarf_internal_valaya_02",
				"pwe_dwarf_internal_valaya_03",
				"pwe_dwarf_internal_valaya_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_internal_valaya_01",
				"pwe_dwarf_internal_valaya_02",
				"pwe_dwarf_internal_valaya_03",
				"pwe_dwarf_internal_valaya_04"
			},
			sound_events_duration = {
				5.3079791069031,
				5.3569793701172,
				4.3740000724792,
				6.8189792633057
			}
		}
	})
end
