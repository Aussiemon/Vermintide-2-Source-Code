return function ()
	define_rule({
		name = "pdr_dwarf_internal_start_banter_a",
		response = "pdr_dwarf_internal_start_banter_a",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pdr_dwarf_internal_start_banter_b",
		name = "pdr_dwarf_internal_start_banter_b",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_dwarf_internal_start_banter_c",
		name = "pdr_dwarf_internal_start_banter_c",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_internal_hasnt_improved",
		response = "pdr_dwarf_internal_hasnt_improved",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_skaven_works",
		response = "pdr_dwarf_internal_skaven_works",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_dead_dwarfs_special_reply",
		response = "pdr_dwarf_internal_dead_dwarfs_special_reply",
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
				"dwarf_internal_dead_dwarfs"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				35
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				0
			},
			{
				"user_memory",
				"dwarf_internal_dead_dwarfs_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_dead_dwarfs_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_internal_dead_dwarfs",
		response = "pdr_dwarf_internal_dead_dwarfs",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				35
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				0
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
		name = "pdr_dwarf_internal_dwarf_sign",
		response = "pdr_dwarf_internal_dwarf_sign",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_valaya",
		response = "pdr_dwarf_internal_valaya",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_still_a_maze",
		response = "pdr_dwarf_internal_still_a_maze",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_brewery_a",
		response = "pdr_dwarf_internal_brewery_a",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_brewery_c",
		response = "pdr_dwarf_internal_brewery_c",
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
				"dwarf_internal_brewery_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				0
			},
			{
				"faction_memory",
				"dwarf_internal_brewery_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_brewery_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_internal_brewery_speaking_tube_interact_one_a",
		response = "pdr_dwarf_internal_brewery_speaking_tube_interact_one_a",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_engineer_reveal_a",
		response = "pdr_dwarf_internal_engineer_reveal_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"speaking_tube_interact_one_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"dwarf_internal_engineer_reveal_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_engineer_reveal_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_internal_engineer_reveal_c",
		response = "pdr_dwarf_internal_engineer_reveal_c",
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
				"dwarf_internal_engineer_reveal_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"dwarf_internal_engineer_reveal_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_engineer_reveal_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_internal_brewery_speaking_tube_interact_two_a",
		response = "pdr_dwarf_internal_brewery_speaking_tube_interact_two_a",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_brewery_speaking_tube_interact_two_c",
		response = "pdr_dwarf_internal_brewery_speaking_tube_interact_two_c",
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
				"dwarf_internal_brewery_speaking_tube_interact_two_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"dwarf_internal_brewery_speaking_tube_interact_two_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_internal_brewery_speaking_tube_interact_two_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_internal_steam_clearing",
		response = "pdr_dwarf_internal_steam_clearing",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_mid_conversation_bardin_a",
		response = "pdr_dwarf_internal_mid_conversation_bardin_a",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_massing_skaven_a",
		response = "pdr_dwarf_internal_massing_skaven_a",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_end_conversation_a",
		response = "pdr_dwarf_internal_end_conversation_a",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_end_event_interact_a",
		response = "pdr_dwarf_internal_end_event_interact_a",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_end_event_interact_c",
		response = "pdr_dwarf_internal_end_event_interact_c",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b",
		response = "pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_end_event_speaking_tube_PLAN_B",
		response = "pdr_dwarf_internal_end_event_speaking_tube_PLAN_B",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_dwarf_internal_plan_b_waystone_b",
		response = "pdr_dwarf_internal_plan_b_waystone_b",
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
				"dwarf_internal_plan_b_waystone_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"pdr_dwarf_internal_plan_b_waystone_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_dwarf_internal_plan_b_waystone_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dummy_memory_trigger_end_event",
		response = "pdr_dummy_memory_trigger_end_event",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		pdr_dwarf_internal_brewery_a = {
			override_awareness = "dwarf_internal_brewery_a_done",
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_brewery_a_01",
				"pdr_dwarf_internal_brewery_a_02",
				"pdr_dwarf_internal_brewery_a_03",
				"pdr_dwarf_internal_brewery_a_04"
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
				4.6079792976379,
				5.1529793739319,
				4.1959791183472,
				7.3239793777466
			},
			localization_strings = {
				"pdr_dwarf_internal_brewery_a_01",
				"pdr_dwarf_internal_brewery_a_02",
				"pdr_dwarf_internal_brewery_a_03",
				"pdr_dwarf_internal_brewery_a_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_skaven_works = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_skaven_works_01",
				"pdr_dwarf_internal_skaven_works_02",
				"pdr_dwarf_internal_skaven_works_03",
				"pdr_dwarf_internal_skaven_works_04"
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
				2.1819791793823,
				2.9879791736603,
				4.2699790000916,
				5.8629789352417
			},
			localization_strings = {
				"pdr_dwarf_internal_skaven_works_01",
				"pdr_dwarf_internal_skaven_works_02",
				"pdr_dwarf_internal_skaven_works_03",
				"pdr_dwarf_internal_skaven_works_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_brewery_speaking_tube_interact_two_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_c_01",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_c_02",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_c_03",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_c_04"
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
				3.2899792194366,
				3.4449791908264,
				2.9979791641235,
				3.5549790859222
			},
			localization_strings = {
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_c_01",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_c_02",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_c_03",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_c_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_dead_dwarfs_special_reply = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_dwarf_internal_dead_dwarfs_01",
				"pdr_dwarf_internal_dead_dwarfs_03",
				"pdr_dwarf_internal_dead_dwarfs_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				4.3519792556763,
				3.2619791030884,
				9.4759788513184
			},
			localization_strings = {
				"pdr_dwarf_internal_dead_dwarfs_01",
				"pdr_dwarf_internal_dead_dwarfs_03",
				"pdr_dwarf_internal_dead_dwarfs_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_end_event_interact_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_end_event_interact_a_01",
				"pdr_dwarf_internal_end_event_interact_a_02",
				"pdr_dwarf_internal_end_event_interact_a_03",
				"pdr_dwarf_internal_end_event_interact_a_04"
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
				3.2409791946411,
				2.5379791259766,
				2.6679792404175,
				3.0809791088104
			},
			localization_strings = {
				"pdr_dwarf_internal_end_event_interact_a_01",
				"pdr_dwarf_internal_end_event_interact_a_02",
				"pdr_dwarf_internal_end_event_interact_a_03",
				"pdr_dwarf_internal_end_event_interact_a_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_start_banter_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_dwarf_internal_start_banter_c_01",
				[2.0] = "pdr_dwarf_internal_start_banter_c_02"
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
				[1.0] = 3.5539791584015,
				[2.0] = 5.2899789810181
			},
			localization_strings = {
				[1.0] = "pdr_dwarf_internal_start_banter_c_01",
				[2.0] = "pdr_dwarf_internal_start_banter_c_02"
			},
			randomize_indexes = {}
		},
		pdr_dummy_memory_trigger_end_event = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_dlc_dwarf_interior",
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
		pdr_dwarf_internal_hasnt_improved = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_hasnt_improved_01",
				"pdr_dwarf_internal_hasnt_improved_02",
				"pdr_dwarf_internal_hasnt_improved_03",
				"pdr_dwarf_internal_hasnt_improved_04"
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
				4.2899789810181,
				5.1359791755676,
				2.4959790706634,
				4.0949792861939
			},
			localization_strings = {
				"pdr_dwarf_internal_hasnt_improved_01",
				"pdr_dwarf_internal_hasnt_improved_02",
				"pdr_dwarf_internal_hasnt_improved_03",
				"pdr_dwarf_internal_hasnt_improved_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_brewery_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_brewery_c_01",
				"pdr_dwarf_internal_brewery_c_02",
				"pdr_dwarf_internal_brewery_c_03",
				"pdr_dwarf_internal_brewery_c_04"
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
				2.4279792308807,
				1.727979183197,
				3.3119790554047,
				2.1500000953674
			},
			localization_strings = {
				"pdr_dwarf_internal_brewery_c_01",
				"pdr_dwarf_internal_brewery_c_02",
				"pdr_dwarf_internal_brewery_c_03",
				"pdr_dwarf_internal_brewery_c_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_steam_clearing = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_steam_clearing_01",
				"pdr_dwarf_internal_steam_clearing_02",
				"pdr_dwarf_internal_steam_clearing_03",
				"pdr_dwarf_internal_steam_clearing_04"
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
				4.7159790992737,
				1.8919792175293,
				4.1099791526794,
				2.0379791259766
			},
			localization_strings = {
				"pdr_dwarf_internal_steam_clearing_01",
				"pdr_dwarf_internal_steam_clearing_02",
				"pdr_dwarf_internal_steam_clearing_03",
				"pdr_dwarf_internal_steam_clearing_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_start_banter_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_dwarf_internal_start_banter_b_01",
				[2.0] = "pdr_dwarf_internal_start_banter_b_02"
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
				[1.0] = 3.2079792022705,
				[2.0] = 3.0529792308807
			},
			localization_strings = {
				[1.0] = "pdr_dwarf_internal_start_banter_b_01",
				[2.0] = "pdr_dwarf_internal_start_banter_b_02"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_engineer_reveal_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_dwarf_internal_engineer_reveal_a_01",
				[2.0] = "pdr_dwarf_internal_engineer_reveal_a_02"
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
				[1.0] = 5.5609793663025,
				[2.0] = 8.6179790496826
			},
			localization_strings = {
				[1.0] = "pdr_dwarf_internal_engineer_reveal_a_01",
				[2.0] = "pdr_dwarf_internal_engineer_reveal_a_02"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_brewery_speaking_tube_interact_one_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_brewery_speaking_tube_interact_one_a_01",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_one_a_02",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_one_a_03",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_one_a_04"
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
				1.7569999694824,
				2.948979139328,
				2.2330000400543,
				2.4119791984558
			},
			localization_strings = {
				"pdr_dwarf_internal_brewery_speaking_tube_interact_one_a_01",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_one_a_02",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_one_a_03",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_one_a_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_end_event_speaking_tube_PLAN_B = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_B_01",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_B_02",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_B_03",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_B_04"
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
				3.3209791183472,
				2.5579791069031,
				3.5149791240692,
				2.5459792613983
			},
			localization_strings = {
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_B_01",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_B_02",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_B_03",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_B_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_plan_b_waystone_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_plan_b_waystone_b_01",
				"pdr_dwarf_internal_plan_b_waystone_b_02",
				"pdr_dwarf_internal_plan_b_waystone_b_03",
				"pdr_dwarf_internal_plan_b_waystone_b_04"
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
				5.6039791107178,
				4.6750001907349,
				2.613979101181,
				3.9709792137146
			},
			localization_strings = {
				"pdr_dwarf_internal_plan_b_waystone_b_01",
				"pdr_dwarf_internal_plan_b_waystone_b_02",
				"pdr_dwarf_internal_plan_b_waystone_b_03",
				"pdr_dwarf_internal_plan_b_waystone_b_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_end_conversation_a = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_dwarf_internal_end_conversation_a_02",
				"pdr_dwarf_internal_end_conversation_a_03",
				"pdr_dwarf_internal_end_conversation_a_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				3.368979215622,
				5.1529793739319,
				3.8959791660309
			},
			localization_strings = {
				"pdr_dwarf_internal_end_conversation_a_02",
				"pdr_dwarf_internal_end_conversation_a_03",
				"pdr_dwarf_internal_end_conversation_a_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_massing_skaven_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_massing_skaven_a_01",
				"pdr_dwarf_internal_massing_skaven_a_02",
				"pdr_dwarf_internal_massing_skaven_a_03",
				"pdr_dwarf_internal_massing_skaven_a_04"
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
				3.2869791984558,
				5.1439790725708,
				5.8419790267944,
				4.727979183197
			},
			localization_strings = {
				"pdr_dwarf_internal_massing_skaven_a_01",
				"pdr_dwarf_internal_massing_skaven_a_02",
				"pdr_dwarf_internal_massing_skaven_a_03",
				"pdr_dwarf_internal_massing_skaven_a_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_mid_conversation_bardin_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_mid_conversation_bardin_a_01",
				"pdr_dwarf_internal_mid_conversation_bardin_a_02",
				"pdr_dwarf_internal_mid_conversation_bardin_a_03",
				"pdr_dwarf_internal_mid_conversation_bardin_a_04"
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
				8.1079788208008,
				4.7959790229797,
				5.062979221344,
				7.3199791908264
			},
			localization_strings = {
				"pdr_dwarf_internal_mid_conversation_bardin_a_01",
				"pdr_dwarf_internal_mid_conversation_bardin_a_02",
				"pdr_dwarf_internal_mid_conversation_bardin_a_03",
				"pdr_dwarf_internal_mid_conversation_bardin_a_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_dwarf_sign = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_dwarf_sign_01",
				"pdr_dwarf_internal_dwarf_sign_02",
				"pdr_dwarf_internal_dwarf_sign_03",
				"pdr_dwarf_internal_dwarf_sign_04"
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
				3.0699791908264,
				2.9929790496826,
				3.7899792194366,
				6.8629789352417
			},
			localization_strings = {
				"pdr_dwarf_internal_dwarf_sign_01",
				"pdr_dwarf_internal_dwarf_sign_02",
				"pdr_dwarf_internal_dwarf_sign_03",
				"pdr_dwarf_internal_dwarf_sign_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_end_event_interact_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_end_event_interact_c_01",
				"pdr_dwarf_internal_end_event_interact_c_02",
				"pdr_dwarf_internal_end_event_interact_c_03",
				"pdr_dwarf_internal_end_event_interact_c_04"
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
				1.6339792013168,
				1.851979136467,
				1.2969791889191,
				2.2899792194366
			},
			localization_strings = {
				"pdr_dwarf_internal_end_event_interact_c_01",
				"pdr_dwarf_internal_end_event_interact_c_02",
				"pdr_dwarf_internal_end_event_interact_c_03",
				"pdr_dwarf_internal_end_event_interact_c_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_still_a_maze = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_still_a_maze_01",
				"pdr_dwarf_internal_still_a_maze_02",
				"pdr_dwarf_internal_still_a_maze_03",
				"pdr_dwarf_internal_still_a_maze_04"
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
				5.2839789390564,
				4.7689790725708,
				4.727979183197,
				6.080979347229
			},
			localization_strings = {
				"pdr_dwarf_internal_still_a_maze_01",
				"pdr_dwarf_internal_still_a_maze_02",
				"pdr_dwarf_internal_still_a_maze_03",
				"pdr_dwarf_internal_still_a_maze_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_brewery_speaking_tube_interact_two_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_a_01",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_a_02",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_a_03",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_a_04"
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
				6.169979095459,
				4.4239792823792,
				5.2389793395996,
				4.7599792480469
			},
			localization_strings = {
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_a_01",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_a_02",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_a_03",
				"pdr_dwarf_internal_brewery_speaking_tube_interact_two_a_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_engineer_reveal_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_dwarf_internal_engineer_reveal_c_01",
				[2.0] = "pdr_dwarf_internal_engineer_reveal_c_02"
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
				[1.0] = 2.5329792499542,
				[2.0] = 4.8319792747498
			},
			localization_strings = {
				[1.0] = "pdr_dwarf_internal_engineer_reveal_c_01",
				[2.0] = "pdr_dwarf_internal_engineer_reveal_c_02"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b_01",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b_02",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b_03",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b_04"
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
				2.1489791870117,
				4.2999792098999,
				3.3339791297913,
				4.1550002098083
			},
			localization_strings = {
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b_01",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b_02",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b_03",
				"pdr_dwarf_internal_end_event_speaking_tube_PLAN_A_b_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_start_banter_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_dwarf_internal_start_banter_a_01",
				[2.0] = "pdr_dwarf_internal_start_banter_a_02"
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
				[1.0] = 4.9509792327881,
				[2.0] = 6.9589791297913
			},
			localization_strings = {
				[1.0] = "pdr_dwarf_internal_start_banter_a_01",
				[2.0] = "pdr_dwarf_internal_start_banter_a_02"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_valaya = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_valaya_01",
				"pdr_dwarf_internal_valaya_02",
				"pdr_dwarf_internal_valaya_03",
				"pdr_dwarf_internal_valaya_04"
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
				5.5309791564941,
				7.3369793891907,
				5.1619791984558,
				4.9059791564941
			},
			localization_strings = {
				"pdr_dwarf_internal_valaya_01",
				"pdr_dwarf_internal_valaya_02",
				"pdr_dwarf_internal_valaya_03",
				"pdr_dwarf_internal_valaya_04"
			},
			randomize_indexes = {}
		},
		pdr_dwarf_internal_dead_dwarfs = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_dwarf_internal_dead_dwarfs_01",
				"pdr_dwarf_internal_dead_dwarfs_02",
				"pdr_dwarf_internal_dead_dwarfs_03",
				"pdr_dwarf_internal_dead_dwarfs_04"
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
				4.3519792556763,
				2.562979221344,
				3.2619791030884,
				9.4759788513184
			},
			localization_strings = {
				"pdr_dwarf_internal_dead_dwarfs_01",
				"pdr_dwarf_internal_dead_dwarfs_02",
				"pdr_dwarf_internal_dead_dwarfs_03",
				"pdr_dwarf_internal_dead_dwarfs_04"
			},
			randomize_indexes = {}
		}
	})
end
