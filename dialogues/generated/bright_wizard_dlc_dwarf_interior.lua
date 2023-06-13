return function ()
	define_rule({
		name = "pbw_dwarf_internal_start_banter_a",
		response = "pbw_dwarf_internal_start_banter_a",
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
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pbw_dwarf_internal_start_banter_b",
		name = "pbw_dwarf_internal_start_banter_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_dwarf_internal_start_banter_c",
		name = "pbw_dwarf_internal_start_banter_c",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pbw_dwarf_internal_hasnt_improved",
		response = "pbw_dwarf_internal_hasnt_improved",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_skaven_works",
		response = "pbw_dwarf_internal_skaven_works",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_dead_dwarfs",
		response = "pbw_dwarf_internal_dead_dwarfs",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_dwarf_sign",
		response = "pbw_dwarf_internal_dwarf_sign",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_valaya",
		response = "pbw_dwarf_internal_valaya",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
	define_rule({
		name = "pbw_dwarf_internal_still_a_maze",
		response = "pbw_dwarf_internal_still_a_maze",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_brewery_a",
		response = "pbw_dwarf_internal_brewery_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_brewery_speaking_tube_interact_one_a",
		response = "pbw_dwarf_internal_brewery_speaking_tube_interact_one_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_engineer_reveal_b",
		response = "pbw_dwarf_internal_engineer_reveal_b",
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
				"dwarf_internal_engineer_reveal_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"dwarf_internal_engineer_reveal_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_engineer_reveal_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_dwarf_internal_brewery_speaking_tube_interact_two_a",
		response = "pbw_dwarf_internal_brewery_speaking_tube_interact_two_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_steam_clearing",
		response = "pbw_dwarf_internal_steam_clearing",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_mid_conversation_no_bardin_a",
		response = "pbw_dwarf_internal_mid_conversation_no_bardin_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_mid_conversation_bardin_c",
		response = "pbw_dwarf_internal_mid_conversation_bardin_c",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_massing_skaven_a",
		response = "pbw_dwarf_internal_massing_skaven_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_end_conversation_a",
		response = "pbw_dwarf_internal_end_conversation_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_end_event_interact_a",
		response = "pbw_dwarf_internal_end_event_interact_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_end_event_interact_c",
		response = "pbw_dwarf_internal_end_event_interact_c",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b",
		response = "pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dwarf_internal_end_event_speaking_tube_PLAN_B",
		response = "pbw_dwarf_internal_end_event_speaking_tube_PLAN_B",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_dummy_memory_trigger_end_event",
		response = "pbw_dummy_memory_trigger_end_event",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
	add_dialogues({
		pbw_dwarf_internal_end_event_interact_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_end_event_interact_c_01",
				"pbw_dwarf_internal_end_event_interact_c_02",
				"pbw_dwarf_internal_end_event_interact_c_03",
				"pbw_dwarf_internal_end_event_interact_c_04"
			},
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
			sound_events_duration = {
				2.4639792442322,
				3.3379790782928,
				1.8580000400543,
				3.029000043869
			},
			localization_strings = {
				"pbw_dwarf_internal_end_event_interact_c_01",
				"pbw_dwarf_internal_end_event_interact_c_02",
				"pbw_dwarf_internal_end_event_interact_c_03",
				"pbw_dwarf_internal_end_event_interact_c_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_valaya = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_valaya_01",
				"pbw_dwarf_internal_valaya_02",
				"pbw_dwarf_internal_valaya_03",
				"pbw_dwarf_internal_valaya_04"
			},
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
			sound_events_duration = {
				4.3229789733887,
				3.6719791889191,
				3.6389999389648,
				4.5769791603088
			},
			localization_strings = {
				"pbw_dwarf_internal_valaya_01",
				"pbw_dwarf_internal_valaya_02",
				"pbw_dwarf_internal_valaya_03",
				"pbw_dwarf_internal_valaya_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_start_banter_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_dwarf_internal_start_banter_a_01",
				[2.0] = "pbw_dwarf_internal_start_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.5569791793823,
				[2.0] = 5.0699791908264
			},
			localization_strings = {
				[1.0] = "pbw_dwarf_internal_start_banter_a_01",
				[2.0] = "pbw_dwarf_internal_start_banter_a_02"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_end_event_interact_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_end_event_interact_a_01",
				"pbw_dwarf_internal_end_event_interact_a_02",
				"pbw_dwarf_internal_end_event_interact_a_03",
				"pbw_dwarf_internal_end_event_interact_a_04"
			},
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
			sound_events_duration = {
				3.5929791927338,
				4.754979133606,
				3.5009791851044,
				4.1989793777466
			},
			localization_strings = {
				"pbw_dwarf_internal_end_event_interact_a_01",
				"pbw_dwarf_internal_end_event_interact_a_02",
				"pbw_dwarf_internal_end_event_interact_a_03",
				"pbw_dwarf_internal_end_event_interact_a_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_engineer_reveal_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_dwarf_internal_engineer_reveal_b_01",
				[2.0] = "pbw_dwarf_internal_engineer_reveal_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.7119793891907,
				[2.0] = 4.0699791908264
			},
			localization_strings = {
				[1.0] = "pbw_dwarf_internal_engineer_reveal_b_01",
				[2.0] = "pbw_dwarf_internal_engineer_reveal_b_02"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_brewery_a = {
			override_awareness = "dwarf_internal_brewery_a_done",
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_brewery_a_01",
				"pbw_dwarf_internal_brewery_a_02",
				"pbw_dwarf_internal_brewery_a_03",
				"pbw_dwarf_internal_brewery_a_04"
			},
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
			sound_events_duration = {
				3.8149790763855,
				2.7069792747498,
				3.8999791145325,
				3.1819791793823
			},
			localization_strings = {
				"pbw_dwarf_internal_brewery_a_01",
				"pbw_dwarf_internal_brewery_a_02",
				"pbw_dwarf_internal_brewery_a_03",
				"pbw_dwarf_internal_brewery_a_04"
			},
			randomize_indexes = {}
		},
		pbw_dummy_memory_trigger_end_event = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_dlc_dwarf_interior",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "dummy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			},
			localization_strings = {
				[1.0] = "dummy"
			}
		},
		pbw_dwarf_internal_brewery_speaking_tube_interact_two_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_brewery_speaking_tube_interact_two_a_01",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_two_a_02",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_two_a_03",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_two_a_04"
			},
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
			sound_events_duration = {
				4.124979019165,
				3.9449791908264,
				5.3089790344238,
				4.9269790649414
			},
			localization_strings = {
				"pbw_dwarf_internal_brewery_speaking_tube_interact_two_a_01",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_two_a_02",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_two_a_03",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_two_a_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_start_banter_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_dwarf_internal_start_banter_c_01",
				[2.0] = "pbw_dwarf_internal_start_banter_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.6679792404175,
				[2.0] = 5.0419793128967
			},
			localization_strings = {
				[1.0] = "pbw_dwarf_internal_start_banter_c_01",
				[2.0] = "pbw_dwarf_internal_start_banter_c_02"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_dwarf_sign = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_dwarf_sign_01",
				"pbw_dwarf_internal_dwarf_sign_02",
				"pbw_dwarf_internal_dwarf_sign_03",
				"pbw_dwarf_internal_dwarf_sign_04"
			},
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
			sound_events_duration = {
				2.9419791698456,
				4.7179999351502,
				3.8629791736603,
				3.4459791183472
			},
			localization_strings = {
				"pbw_dwarf_internal_dwarf_sign_01",
				"pbw_dwarf_internal_dwarf_sign_02",
				"pbw_dwarf_internal_dwarf_sign_03",
				"pbw_dwarf_internal_dwarf_sign_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_mid_conversation_bardin_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_mid_conversation_bardin_c_01",
				"pbw_dwarf_internal_mid_conversation_bardin_c_02",
				"pbw_dwarf_internal_mid_conversation_bardin_c_03",
				"pbw_dwarf_internal_mid_conversation_bardin_c_04"
			},
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
			sound_events_duration = {
				4.0239791870117,
				3.8120000362396,
				3.0409791469574,
				3.4429790973663
			},
			localization_strings = {
				"pbw_dwarf_internal_mid_conversation_bardin_c_01",
				"pbw_dwarf_internal_mid_conversation_bardin_c_02",
				"pbw_dwarf_internal_mid_conversation_bardin_c_03",
				"pbw_dwarf_internal_mid_conversation_bardin_c_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_end_conversation_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_end_conversation_a_01",
				"pbw_dwarf_internal_end_conversation_a_02",
				"pbw_dwarf_internal_end_conversation_a_03",
				"pbw_dwarf_internal_end_conversation_a_04"
			},
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
			sound_events_duration = {
				3.8719792366028,
				5.3909792900085,
				6.0879793167114,
				3.1519792079926
			},
			localization_strings = {
				"pbw_dwarf_internal_end_conversation_a_01",
				"pbw_dwarf_internal_end_conversation_a_02",
				"pbw_dwarf_internal_end_conversation_a_03",
				"pbw_dwarf_internal_end_conversation_a_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_end_event_speaking_tube_PLAN_B = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_B_01",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_B_02",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_B_03",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_B_04"
			},
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
			sound_events_duration = {
				3.239000082016,
				4.8390002250671,
				2.5309998989105,
				5.6009793281555
			},
			localization_strings = {
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_B_01",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_B_02",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_B_03",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_B_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_massing_skaven_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_massing_skaven_a_01",
				"pbw_dwarf_internal_massing_skaven_a_02",
				"pbw_dwarf_internal_massing_skaven_a_03",
				"pbw_dwarf_internal_massing_skaven_a_04"
			},
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
			sound_events_duration = {
				3.5099792480469,
				5.5529789924622,
				3.3899791240692,
				4.5779790878296
			},
			localization_strings = {
				"pbw_dwarf_internal_massing_skaven_a_01",
				"pbw_dwarf_internal_massing_skaven_a_02",
				"pbw_dwarf_internal_massing_skaven_a_03",
				"pbw_dwarf_internal_massing_skaven_a_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_skaven_works = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_skaven_works_01",
				"pbw_dwarf_internal_skaven_works_02",
				"pbw_dwarf_internal_skaven_works_03",
				"pbw_dwarf_internal_skaven_works_04"
			},
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
			sound_events_duration = {
				6.3329792022705,
				3.8299791812897,
				3.7019791603088,
				4.6369791030884
			},
			localization_strings = {
				"pbw_dwarf_internal_skaven_works_01",
				"pbw_dwarf_internal_skaven_works_02",
				"pbw_dwarf_internal_skaven_works_03",
				"pbw_dwarf_internal_skaven_works_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b_01",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b_02",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b_03",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b_04"
			},
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
			sound_events_duration = {
				4.3969793319702,
				3.9549791812897,
				4.7409791946411,
				3.5649790763855
			},
			localization_strings = {
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b_01",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b_02",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b_03",
				"pbw_dwarf_internal_end_event_speaking_tube_PLAN_A_b_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_hasnt_improved = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_hasnt_improved_01",
				"pbw_dwarf_internal_hasnt_improved_02",
				"pbw_dwarf_internal_hasnt_improved_03",
				"pbw_dwarf_internal_hasnt_improved_04"
			},
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
			sound_events_duration = {
				4.2959790229797,
				4.0359792709351,
				4.7879791259766,
				3.4789791107178
			},
			localization_strings = {
				"pbw_dwarf_internal_hasnt_improved_01",
				"pbw_dwarf_internal_hasnt_improved_02",
				"pbw_dwarf_internal_hasnt_improved_03",
				"pbw_dwarf_internal_hasnt_improved_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_brewery_speaking_tube_interact_one_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_brewery_speaking_tube_interact_one_a_01",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_one_a_02",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_one_a_03",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_one_a_04"
			},
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
			sound_events_duration = {
				2.5469999313355,
				4.8059792518616,
				4.8549790382385,
				2.3499999046326
			},
			localization_strings = {
				"pbw_dwarf_internal_brewery_speaking_tube_interact_one_a_01",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_one_a_02",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_one_a_03",
				"pbw_dwarf_internal_brewery_speaking_tube_interact_one_a_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_start_banter_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_dwarf_internal_start_banter_b_01",
				[2.0] = "pbw_dwarf_internal_start_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.4399790763855,
				[2.0] = 3.7219791412353
			},
			localization_strings = {
				[1.0] = "pbw_dwarf_internal_start_banter_b_01",
				[2.0] = "pbw_dwarf_internal_start_banter_b_02"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_steam_clearing = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_steam_clearing_01",
				"pbw_dwarf_internal_steam_clearing_02",
				"pbw_dwarf_internal_steam_clearing_03",
				"pbw_dwarf_internal_steam_clearing_04"
			},
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
			sound_events_duration = {
				1.6509791612625,
				2.5869791507721,
				2.948979139328,
				4.7839789390564
			},
			localization_strings = {
				"pbw_dwarf_internal_steam_clearing_01",
				"pbw_dwarf_internal_steam_clearing_02",
				"pbw_dwarf_internal_steam_clearing_03",
				"pbw_dwarf_internal_steam_clearing_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_still_a_maze = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_still_a_maze_01",
				"pbw_dwarf_internal_still_a_maze_02",
				"pbw_dwarf_internal_still_a_maze_03",
				"pbw_dwarf_internal_still_a_maze_04"
			},
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
			sound_events_duration = {
				3.5779790878296,
				3.9519791603088,
				3.5099792480469,
				4.2169790267944
			},
			localization_strings = {
				"pbw_dwarf_internal_still_a_maze_01",
				"pbw_dwarf_internal_still_a_maze_02",
				"pbw_dwarf_internal_still_a_maze_03",
				"pbw_dwarf_internal_still_a_maze_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_mid_conversation_no_bardin_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_mid_conversation_no_bardin_a_01",
				"pbw_dwarf_internal_mid_conversation_no_bardin_a_02",
				"pbw_dwarf_internal_mid_conversation_no_bardin_a_03",
				"pbw_dwarf_internal_mid_conversation_no_bardin_a_04"
			},
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
			sound_events_duration = {
				4.2559790611267,
				4.4389791488647,
				5.0489997863769,
				4.3390002250671
			},
			localization_strings = {
				"pbw_dwarf_internal_mid_conversation_no_bardin_a_01",
				"pbw_dwarf_internal_mid_conversation_no_bardin_a_02",
				"pbw_dwarf_internal_mid_conversation_no_bardin_a_03",
				"pbw_dwarf_internal_mid_conversation_no_bardin_a_04"
			},
			randomize_indexes = {}
		},
		pbw_dwarf_internal_dead_dwarfs = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_dwarf_internal_dead_dwarfs_01",
				"pbw_dwarf_internal_dead_dwarfs_02",
				"pbw_dwarf_internal_dead_dwarfs_03",
				"pbw_dwarf_internal_dead_dwarfs_04"
			},
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
			sound_events_duration = {
				3.4969792366028,
				3.977979183197,
				4.8609790802002,
				3.9360001087189
			},
			localization_strings = {
				"pbw_dwarf_internal_dead_dwarfs_01",
				"pbw_dwarf_internal_dead_dwarfs_02",
				"pbw_dwarf_internal_dead_dwarfs_03",
				"pbw_dwarf_internal_dead_dwarfs_04"
			},
			randomize_indexes = {}
		}
	})
end
