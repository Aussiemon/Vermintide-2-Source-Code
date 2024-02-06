﻿-- chunkname: @dialogues/generated/empire_soldier_dlc_dwarf_interior.lua

return function ()
	define_rule({
		name = "pes_dummy_memory_trigger_end_event",
		response = "pes_dummy_memory_trigger_end_event",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dummy_memory_trigger_end_event",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"end_event_memory_trigger",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"end_event_memory_trigger",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_brewery_a",
		response = "pes_dwarf_internal_brewery_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_brewery_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_brewery_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_brewery_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_brewery_speaking_tube_interact_one_a",
		response = "pes_dwarf_internal_brewery_speaking_tube_interact_one_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_brewery_speaking_tube_interact_one_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_brewery_speaking_tube_interact_one_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_brewery_speaking_tube_interact_one_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_brewery_speaking_tube_interact_two_a",
		response = "pes_dwarf_internal_brewery_speaking_tube_interact_two_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_brewery_speaking_tube_interact_two_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_brewery_speaking_tube_interact_two_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_brewery_speaking_tube_interact_two_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_dead_dwarfs",
		response = "pes_dwarf_internal_dead_dwarfs",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_dead_dwarfs",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_dead_dwarfs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_dead_dwarfs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_dwarf_sign",
		response = "pes_dwarf_internal_dwarf_sign",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_dwarf_sign",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_dwarf_sign",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_dwarf_sign",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_end_conversation_a",
		response = "pes_dwarf_internal_end_conversation_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				6,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				30,
			},
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_a",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_a",
				OP.NOT,
				"dwarf_internal_end_event_interact_a",
			},
			{
				"faction_memory",
				"end_event_memory_trigger",
				OP.NOT,
				"end_event_memory_trigger",
			},
			{
				"faction_memory",
				"dwarf_internal_end_conversation_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_conversation_a",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_end_event_interact_a",
		response = "pes_dwarf_internal_end_event_interact_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_end_event_interact_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_end_event_interact_c",
		response = "pes_dwarf_internal_end_event_interact_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"dwarf_internal_end_event_interact_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b",
		response = "pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"dwarf_internal_end_event_speaking_tube_PLAN_A_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_internal_end_event_speaking_tube_PLAN_A_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_event_speaking_tube_PLAN_A_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_end_event_speaking_tube_PLAN_B",
		response = "pes_dwarf_internal_end_event_speaking_tube_PLAN_B",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_end_event_speaking_tube_PLAN_B",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_end_event_speaking_tube_PLAN_B",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_end_event_speaking_tube_PLAN_B",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_engineer_reveal_b",
		response = "pes_dwarf_internal_engineer_reveal_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"dwarf_internal_engineer_reveal_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_internal_engineer_reveal_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_engineer_reveal_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_hasnt_improved",
		response = "pes_dwarf_internal_hasnt_improved",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_hasnt_improved",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_hasnt_improved",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_hasnt_improved",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_massing_skaven_a",
		response = "pes_dwarf_internal_massing_skaven_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_massing_skaven_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_massing_skaven_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_massing_skaven_a",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"dwarf_internal_conversation_memory",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_mid_conversation_bardin_c",
		response = "pes_dwarf_internal_mid_conversation_bardin_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"dwarf_internal_mid_conversation_bardin_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_bardin_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_bardin_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_mid_conversation_no_bardin_a",
		response = "pes_dwarf_internal_mid_conversation_no_bardin_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				4,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				20,
			},
			{
				"faction_memory",
				"dwarf_internal_conversation_memory",
				OP.GTEQ,
				1,
			},
			{
				"faction_memory",
				"dwarf_internal_end_event_interact_a",
				OP.NOT,
				"dwarf_internal_end_event_interact_a",
			},
			{
				"faction_memory",
				"end_event_memory_trigger",
				OP.NOT,
				"end_event_memory_trigger",
			},
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_mid_conversation_a",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_skaven_works",
		response = "pes_dwarf_internal_skaven_works",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_skaven_works",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_internal_skaven_works",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_skaven_works",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_start_banter_a",
		response = "pes_dwarf_internal_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_internal_start_banter_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_start_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_start_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_start_banter_b",
		response = "pes_dwarf_internal_start_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"dwarf_internal_start_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_start_banter_c",
		response = "pes_dwarf_internal_start_banter_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"dwarf_internal_start_banter_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_steam_clearing",
		response = "pes_dwarf_internal_steam_clearing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_steam_clearing",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_steam_clearing",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_steam_clearing",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"dwarf_internal_conversation_memory",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_still_a_maze",
		response = "pes_dwarf_internal_still_a_maze",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_still_a_maze",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_still_a_maze",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_still_a_maze",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_dwarf_internal_valaya",
		response = "pes_dwarf_internal_valaya",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"dwarf_internal_valaya",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"dwarf_internal_valaya",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_valaya",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pes_dummy_memory_trigger_end_event = {
			category = "special_occasion",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pes_dwarf_internal_brewery_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			override_awareness = "dwarf_internal_brewery_a_done",
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_brewery_a_01",
				"pes_dwarf_internal_brewery_a_02",
				"pes_dwarf_internal_brewery_a_03",
				"pes_dwarf_internal_brewery_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_brewery_a_01",
				"pes_dwarf_internal_brewery_a_02",
				"pes_dwarf_internal_brewery_a_03",
				"pes_dwarf_internal_brewery_a_04",
			},
			sound_events_duration = {
				2.9189791679382,
				2.2769792079926,
				3.3699791431427,
				4.51797914505,
			},
		},
		pes_dwarf_internal_brewery_speaking_tube_interact_one_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_brewery_speaking_tube_interact_one_a_01",
				"pes_dwarf_internal_brewery_speaking_tube_interact_one_a_02",
				"pes_dwarf_internal_brewery_speaking_tube_interact_one_a_03",
				"pes_dwarf_internal_brewery_speaking_tube_interact_one_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_brewery_speaking_tube_interact_one_a_01",
				"pes_dwarf_internal_brewery_speaking_tube_interact_one_a_02",
				"pes_dwarf_internal_brewery_speaking_tube_interact_one_a_03",
				"pes_dwarf_internal_brewery_speaking_tube_interact_one_a_04",
			},
			sound_events_duration = {
				3.368979215622,
				4.2339792251587,
				3.209979057312,
				2.3229999542236,
			},
		},
		pes_dwarf_internal_brewery_speaking_tube_interact_two_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_brewery_speaking_tube_interact_two_a_01",
				"pes_dwarf_internal_brewery_speaking_tube_interact_two_a_02",
				"pes_dwarf_internal_brewery_speaking_tube_interact_two_a_03",
				"pes_dwarf_internal_brewery_speaking_tube_interact_two_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_brewery_speaking_tube_interact_two_a_01",
				"pes_dwarf_internal_brewery_speaking_tube_interact_two_a_02",
				"pes_dwarf_internal_brewery_speaking_tube_interact_two_a_03",
				"pes_dwarf_internal_brewery_speaking_tube_interact_two_a_04",
			},
			sound_events_duration = {
				3.4909791946411,
				3.2149791717529,
				2.7539792060852,
				3.9919791221619,
			},
		},
		pes_dwarf_internal_dead_dwarfs = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_dead_dwarfs_01",
				"pes_dwarf_internal_dead_dwarfs_02",
				"pes_dwarf_internal_dead_dwarfs_03",
				"pes_dwarf_internal_dead_dwarfs_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_dead_dwarfs_01",
				"pes_dwarf_internal_dead_dwarfs_02",
				"pes_dwarf_internal_dead_dwarfs_03",
				"pes_dwarf_internal_dead_dwarfs_04",
			},
			sound_events_duration = {
				3.8549792766571,
				4.0489792823792,
				4.4049792289734,
				5.1129789352417,
			},
		},
		pes_dwarf_internal_dwarf_sign = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_dwarf_sign_01",
				"pes_dwarf_internal_dwarf_sign_02",
				"pes_dwarf_internal_dwarf_sign_03",
				"pes_dwarf_internal_dwarf_sign_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_dwarf_sign_01",
				"pes_dwarf_internal_dwarf_sign_02",
				"pes_dwarf_internal_dwarf_sign_03",
				"pes_dwarf_internal_dwarf_sign_04",
			},
			sound_events_duration = {
				2.9519791603088,
				3.6609792709351,
				4.2119793891907,
				4.2600002288818,
			},
		},
		pes_dwarf_internal_end_conversation_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_end_conversation_a_01",
				"pes_dwarf_internal_end_conversation_a_02",
				"pes_dwarf_internal_end_conversation_a_03",
				"pes_dwarf_internal_end_conversation_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_end_conversation_a_01",
				"pes_dwarf_internal_end_conversation_a_02",
				"pes_dwarf_internal_end_conversation_a_03",
				"pes_dwarf_internal_end_conversation_a_04",
			},
			sound_events_duration = {
				2.1129999160767,
				3.0869791507721,
				3.9519791603088,
				3.3519792556763,
			},
		},
		pes_dwarf_internal_end_event_interact_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_end_event_interact_a_01",
				"pes_dwarf_internal_end_event_interact_a_02",
				"pes_dwarf_internal_end_event_interact_a_03",
				"pes_dwarf_internal_end_event_interact_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_end_event_interact_a_01",
				"pes_dwarf_internal_end_event_interact_a_02",
				"pes_dwarf_internal_end_event_interact_a_03",
				"pes_dwarf_internal_end_event_interact_a_04",
			},
			sound_events_duration = {
				1.7719999551773,
				3.9609999656677,
				1.9110000133514,
				2.754979133606,
			},
		},
		pes_dwarf_internal_end_event_interact_c = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_end_event_interact_c_01",
				"pes_dwarf_internal_end_event_interact_c_02",
				"pes_dwarf_internal_end_event_interact_c_03",
				"pes_dwarf_internal_end_event_interact_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_end_event_interact_c_01",
				"pes_dwarf_internal_end_event_interact_c_02",
				"pes_dwarf_internal_end_event_interact_c_03",
				"pes_dwarf_internal_end_event_interact_c_04",
			},
			sound_events_duration = {
				2.7239792346954,
				4.3060002326965,
				2.6079790592194,
				1.965979218483,
			},
		},
		pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b_01",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b_02",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b_03",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b_01",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b_02",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b_03",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_A_b_04",
			},
			sound_events_duration = {
				1.6560000181198,
				1.4069792032242,
				1.8839792013168,
				2.1849792003632,
			},
		},
		pes_dwarf_internal_end_event_speaking_tube_PLAN_B = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_B_01",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_B_02",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_B_03",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_B_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_B_01",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_B_02",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_B_03",
				"pes_dwarf_internal_end_event_speaking_tube_PLAN_B_04",
			},
			sound_events_duration = {
				4.2259793281555,
				3.0369791984558,
				4.1099791526794,
				4.5399789810181,
			},
		},
		pes_dwarf_internal_engineer_reveal_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_dwarf_internal_engineer_reveal_b_01",
				[2] = "pes_dwarf_internal_engineer_reveal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dwarf_internal_engineer_reveal_b_01",
				[2] = "pes_dwarf_internal_engineer_reveal_b_02",
			},
			sound_events_duration = {
				[1] = 3.6499791145325,
				[2] = 5.5159792900085,
			},
		},
		pes_dwarf_internal_hasnt_improved = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_hasnt_improved_01",
				"pes_dwarf_internal_hasnt_improved_03",
				"pes_dwarf_internal_hasnt_improved_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_hasnt_improved_01",
				"pes_dwarf_internal_hasnt_improved_03",
				"pes_dwarf_internal_hasnt_improved_04",
			},
			sound_events_duration = {
				2.8079791069031,
				3.7890000343323,
				3.1749792098999,
			},
		},
		pes_dwarf_internal_massing_skaven_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_massing_skaven_a_01",
				"pes_dwarf_internal_massing_skaven_a_02",
				"pes_dwarf_internal_massing_skaven_a_03",
				"pes_dwarf_internal_massing_skaven_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_massing_skaven_a_01",
				"pes_dwarf_internal_massing_skaven_a_02",
				"pes_dwarf_internal_massing_skaven_a_03",
				"pes_dwarf_internal_massing_skaven_a_04",
			},
			sound_events_duration = {
				2.7749791145325,
				2.9629790782928,
				3.1239790916443,
				4.1729793548584,
			},
		},
		pes_dwarf_internal_mid_conversation_bardin_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_mid_conversation_bardin_c_01",
				"pes_dwarf_internal_mid_conversation_bardin_c_02",
				"pes_dwarf_internal_mid_conversation_bardin_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_mid_conversation_bardin_c_01",
				"pes_dwarf_internal_mid_conversation_bardin_c_02",
				"pes_dwarf_internal_mid_conversation_bardin_c_03",
			},
			sound_events_duration = {
				5.3579792976379,
				2.283979177475,
				2.959979057312,
			},
		},
		pes_dwarf_internal_mid_conversation_no_bardin_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_mid_conversation_no_bardin_a_01",
				"pes_dwarf_internal_mid_conversation_no_bardin_a_02",
				"pes_dwarf_internal_mid_conversation_no_bardin_a_03",
				"pes_dwarf_internal_mid_conversation_no_bardin_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_mid_conversation_no_bardin_a_01",
				"pes_dwarf_internal_mid_conversation_no_bardin_a_02",
				"pes_dwarf_internal_mid_conversation_no_bardin_a_03",
				"pes_dwarf_internal_mid_conversation_no_bardin_a_04",
			},
			sound_events_duration = {
				4.2879791259766,
				4.8179793357849,
				4.8599791526794,
				7.0989789962769,
			},
		},
		pes_dwarf_internal_skaven_works = {
			category = "story_talk",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_skaven_works_01",
				"pes_dwarf_internal_skaven_works_02",
				"pes_dwarf_internal_skaven_works_03",
				"pes_dwarf_internal_skaven_works_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_skaven_works_01",
				"pes_dwarf_internal_skaven_works_02",
				"pes_dwarf_internal_skaven_works_03",
				"pes_dwarf_internal_skaven_works_04",
			},
			sound_events_duration = {
				2.4619791507721,
				3.8559792041779,
				3.4799792766571,
				3.4399790763855,
			},
		},
		pes_dwarf_internal_start_banter_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_dwarf_internal_start_banter_a_01",
				[2] = "pes_dwarf_internal_start_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dwarf_internal_start_banter_a_01",
				[2] = "pes_dwarf_internal_start_banter_a_02",
			},
			sound_events_duration = {
				[1] = 6.3009791374206,
				[2] = 3.6339790821075,
			},
		},
		pes_dwarf_internal_start_banter_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_dwarf_internal_start_banter_b_01",
				[2] = "pes_dwarf_internal_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dwarf_internal_start_banter_b_01",
				[2] = "pes_dwarf_internal_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.1369791030884,
				[2] = 4.0969791412353,
			},
		},
		pes_dwarf_internal_start_banter_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_dwarf_internal_start_banter_c_01",
				[2] = "pes_dwarf_internal_start_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_dwarf_internal_start_banter_c_01",
				[2] = "pes_dwarf_internal_start_banter_c_02",
			},
			sound_events_duration = {
				[1] = 1.9229999780655,
				[2] = 2.8879792690277,
			},
		},
		pes_dwarf_internal_steam_clearing = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_steam_clearing_01",
				"pes_dwarf_internal_steam_clearing_02",
				"pes_dwarf_internal_steam_clearing_03",
				"pes_dwarf_internal_steam_clearing_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_steam_clearing_01",
				"pes_dwarf_internal_steam_clearing_02",
				"pes_dwarf_internal_steam_clearing_03",
				"pes_dwarf_internal_steam_clearing_04",
			},
			sound_events_duration = {
				2.6489791870117,
				2.26597905159,
				4.1349792480469,
				3.4289791584015,
			},
		},
		pes_dwarf_internal_still_a_maze = {
			category = "level_talk",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_still_a_maze_01",
				"pes_dwarf_internal_still_a_maze_02",
				"pes_dwarf_internal_still_a_maze_03",
				"pes_dwarf_internal_still_a_maze_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_still_a_maze_01",
				"pes_dwarf_internal_still_a_maze_02",
				"pes_dwarf_internal_still_a_maze_03",
				"pes_dwarf_internal_still_a_maze_04",
			},
			sound_events_duration = {
				2.8229792118073,
				4.8789792060852,
				2.5389790534973,
				3.812979221344,
			},
		},
		pes_dwarf_internal_valaya = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_dwarf_interior",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_dwarf_internal_valaya_01",
				"pes_dwarf_internal_valaya_02",
				"pes_dwarf_internal_valaya_03",
				"pes_dwarf_internal_valaya_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_internal_valaya_01",
				"pes_dwarf_internal_valaya_02",
				"pes_dwarf_internal_valaya_03",
				"pes_dwarf_internal_valaya_04",
			},
			sound_events_duration = {
				1.993979215622,
				2.1559791564941,
				2.3409790992737,
				4.0939793586731,
			},
		},
	})
end
