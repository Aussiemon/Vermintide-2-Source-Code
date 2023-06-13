return function ()
	define_rule({
		name = "nik_dwarf_internal_start_banter_a",
		response = "nik_dwarf_internal_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_internal_start_banter_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_start_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_start_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nik_dwarf_internal_start_banter_b",
		name = "nik_dwarf_internal_start_banter_b",
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
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_dwarf_internal_start_banter_c",
		name = "nik_dwarf_internal_start_banter_c",
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
				"inn_keeper"
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_hasnt_improved",
		response = "nik_dwarf_internal_hasnt_improved",
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
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_hasnt_improved",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_hasnt_improved",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_skaven_works",
		response = "nik_dwarf_internal_skaven_works",
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
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_skaven_works",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_skaven_works",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_dead_dwarfs",
		response = "nik_dwarf_internal_dead_dwarfs",
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
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_dead_dwarfs",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_dead_dwarfs",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_dwarf_sign",
		response = "nik_dwarf_internal_dwarf_sign",
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
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_dwarf_sign",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_dwarf_sign",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_valaya",
		response = "nik_dwarf_internal_valaya",
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
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_valaya",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_valaya",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_still_a_maze",
		response = "nik_dwarf_internal_still_a_maze",
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
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_still_a_maze",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_still_a_maze",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_brewery_c",
		response = "nik_dwarf_internal_brewery_c",
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
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_engineer_reveal_no_bardin",
		response = "nik_dwarf_internal_engineer_reveal_no_bardin",
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
				"inn_keeper"
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				0
			},
			{
				"user_memory",
				"dwarf_internal_engineer_reveal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_engineer_reveal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder",
		response = "nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder",
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
				"dwarf_internal_brewery_speaking_tube_progress_one_reminder"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_progress_one_reminder",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_progress_one_reminder",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder",
		response = "nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder",
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
				"dwarf_internal_brewery_speaking_tube_progress_two_reminder"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_progress_two_reminder",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_progress_two_reminder",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_brewery_speaking_tube_complete",
		response = "nik_dwarf_internal_brewery_speaking_tube_complete",
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
				"dwarf_internal_brewery_speaking_tube_complete"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_complete",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_complete",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_brewery_speaking_tube_interact_two_c",
		response = "nik_dwarf_internal_brewery_speaking_tube_interact_two_c",
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
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_interact_two_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_interact_two_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_mid_conversation_no_bardin_b",
		response = "nik_dwarf_internal_mid_conversation_no_bardin_b",
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
				"dwarf_internal_mid_conversation_no_bardin_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_mid_conversation_no_bardin_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_mid_conversation_no_bardin_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_mid_conversation_bardin_b",
		response = "nik_dwarf_internal_mid_conversation_bardin_b",
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
				"dwarf_internal_mid_conversation_bardin_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_mid_conversation_bardin_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_mid_conversation_bardin_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_end_conversation_b",
		response = "nik_dwarf_internal_end_conversation_b",
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
				"dwarf_internal_end_conversation_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_end_conversation_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_end_conversation_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_end_event_reminder",
		response = "nik_dwarf_internal_end_event_reminder",
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
				"dwarf_internal_end_event_reminder"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_end_event_reminder",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_end_event_reminder",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_dwarf_internal_come_home",
		response = "nik_dwarf_internal_come_home",
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
				"dwarf_internal_come_home"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_internal_come_home",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_come_home",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_brewery_b",
		response = "nde_dwarf_internal_brewery_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_internal_brewery_a_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer_01"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_brewery_attention",
		response = "nde_dwarf_internal_brewery_attention",
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
				"dwarf_internal_brewery_attention"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer_01"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_attention",
				OP.LT,
				4
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_attention",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_brewery_event_start",
		response = "nde_dwarf_internal_brewery_event_start",
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
				"dwarf_internal_brewery_event_start"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer_01"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_event_start",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_event_start",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_brewery_guidance",
		response = "nde_dwarf_internal_brewery_guidance",
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
				"dwarf_internal_brewery_guidance"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_guidance",
				OP.LT,
				4
			},
			{
				"user_memory",
				"time_since_engineer_talk",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_engineer_talk",
				OP.TIMESET
			},
			{
				"user_memory",
				"dwarf_internal_brewery_guidance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_brewery_speaking_tube_interact_one_b",
		response = "nde_dwarf_internal_brewery_speaking_tube_interact_one_b",
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
				"dwarf_internal_brewery_speaking_tube_interact_one_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer_01"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_interact_one_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_interact_one_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_brewery_speaking_tube_progress_one",
		response = "nde_dwarf_internal_brewery_speaking_tube_progress_one",
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
				"dwarf_internal_brewery_speaking_tube_progress_one"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer_01"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_progress_one",
				OP.EQ,
				0
			},
			{
				"user_memory",
				"time_since_engineer_talk",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_engineer_talk",
				OP.TIMESET
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_progress_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_brewery_speaking_tube_progress_two",
		response = "nde_dwarf_internal_brewery_speaking_tube_progress_two",
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
				"dwarf_internal_brewery_speaking_tube_progress_two"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer_01"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_progress_two",
				OP.EQ,
				0
			},
			{
				"user_memory",
				"time_since_engineer_talk",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_engineer_talk",
				OP.TIMESET
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_progress_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_brewery_speaking_tube_complete",
		response = "nde_dwarf_internal_brewery_speaking_tube_complete",
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
				"dwarf_internal_brewery_speaking_tube_complete"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer_01"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_complete",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_complete",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_brewery_speaking_tube_interact_two_b",
		response = "nde_dwarf_internal_brewery_speaking_tube_interact_two_b",
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
				"dwarf_internal_brewery_speaking_tube_interact_two_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer_01"
			},
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_interact_two_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_brewery_speaking_tube_interact_two_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_end_event_attention",
		response = "nde_dwarf_internal_end_event_attention",
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
				"dwarf_internal_end_event_attention"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer"
			},
			{
				"user_memory",
				"dwarf_internal_end_event_attention",
				OP.LT,
				4
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_end_event_attention",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_end_event_interact_b",
		response = "nde_dwarf_internal_end_event_interact_b",
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
				"dwarf_internal_end_event_interact_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer"
			},
			{
				"user_memory",
				"dwarf_internal_end_event_interact_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_end_event_interact_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nde_dwarf_internal_barrel_drop",
		name = "nde_dwarf_internal_barrel_drop",
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
				"dwarf_internal_barrel_drop"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer"
			}
		}
	})
	define_rule({
		name = "nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a",
		response = "nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a",
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
				"dwarf_internal_end_event_speaking_tube_PLAN_A_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer"
			},
			{
				"user_memory",
				"dwarf_internal_end_event_speaking_tube_PLAN_A_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_end_event_speaking_tube_PLAN_A_a",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		nik_dwarf_internal_mid_conversation_no_bardin_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_mid_conversation_no_bardin_b_01",
				"nik_dwarf_internal_mid_conversation_no_bardin_b_02",
				"nik_dwarf_internal_mid_conversation_no_bardin_b_03",
				"nik_dwarf_internal_mid_conversation_no_bardin_b_04"
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
				11.052000045776,
				6.4530000686645,
				6.7559790611267,
				7.0529999732971
			},
			localization_strings = {
				"nik_dwarf_internal_mid_conversation_no_bardin_b_01",
				"nik_dwarf_internal_mid_conversation_no_bardin_b_02",
				"nik_dwarf_internal_mid_conversation_no_bardin_b_03",
				"nik_dwarf_internal_mid_conversation_no_bardin_b_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_skaven_works = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_skaven_works_01",
				"nik_dwarf_internal_skaven_works_02",
				"nik_dwarf_internal_skaven_works_03",
				"nik_dwarf_internal_skaven_works_04"
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
				3.154000043869,
				6.3330001831055,
				6.2259998321533,
				7.1050000190735
			},
			localization_strings = {
				"nik_dwarf_internal_skaven_works_01",
				"nik_dwarf_internal_skaven_works_02",
				"nik_dwarf_internal_skaven_works_03",
				"nik_dwarf_internal_skaven_works_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_start_banter_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "nik_dwarf_internal_start_banter_c_01",
				[2.0] = "nik_dwarf_internal_start_banter_c_02"
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
				[1.0] = 5.7420001029968,
				[2.0] = 4.7690000534058
			},
			localization_strings = {
				[1.0] = "nik_dwarf_internal_start_banter_c_01",
				[2.0] = "nik_dwarf_internal_start_banter_c_02"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_mid_conversation_bardin_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_mid_conversation_bardin_b_01",
				"nik_dwarf_internal_mid_conversation_bardin_b_02",
				"nik_dwarf_internal_mid_conversation_bardin_b_03",
				"nik_dwarf_internal_mid_conversation_bardin_b_04"
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
				4.7420001029968,
				6.1859998703003,
				2.6710000038147,
				4.276978969574
			},
			sound_distance = math.huge,
			localization_strings = {
				"nik_dwarf_internal_mid_conversation_bardin_b_01",
				"nik_dwarf_internal_mid_conversation_bardin_b_02",
				"nik_dwarf_internal_mid_conversation_bardin_b_03",
				"nik_dwarf_internal_mid_conversation_bardin_b_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_end_event_reminder = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_end_event_reminder_01",
				"nik_dwarf_internal_end_event_reminder_02",
				"nik_dwarf_internal_end_event_reminder_03",
				"nik_dwarf_internal_end_event_reminder_04"
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
				3.3939790725708,
				3.904000043869,
				3.430999994278,
				4.6680002212524
			},
			localization_strings = {
				"nik_dwarf_internal_end_event_reminder_01",
				"nik_dwarf_internal_end_event_reminder_02",
				"nik_dwarf_internal_end_event_reminder_03",
				"nik_dwarf_internal_end_event_reminder_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder_01",
				"nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder_02",
				"nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder_03",
				"nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder_04"
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
				2.4479999542236,
				2.7639999389648,
				3.6229999065399,
				3.5420000553131
			},
			localization_strings = {
				"nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder_01",
				"nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder_02",
				"nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder_03",
				"nik_dwarf_internal_brewery_speaking_tube_progress_one_reminder_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_brewery_speaking_tube_interact_two_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_brewery_speaking_tube_interact_two_c_01",
				"nik_dwarf_internal_brewery_speaking_tube_interact_two_c_02",
				"nik_dwarf_internal_brewery_speaking_tube_interact_two_c_03",
				"nik_dwarf_internal_brewery_speaking_tube_interact_two_c_04"
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
				3.5509791374206,
				1.8789999485016,
				3.2109999656677,
				3.8670001029968
			},
			localization_strings = {
				"nik_dwarf_internal_brewery_speaking_tube_interact_two_c_01",
				"nik_dwarf_internal_brewery_speaking_tube_interact_two_c_02",
				"nik_dwarf_internal_brewery_speaking_tube_interact_two_c_03",
				"nik_dwarf_internal_brewery_speaking_tube_interact_two_c_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_brewery_speaking_tube_progress_one = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_brewery_speaking_tube_progress_one_01",
				"nde_dwarf_internal_brewery_speaking_tube_progress_one_02",
				"nde_dwarf_internal_brewery_speaking_tube_progress_one_03",
				"nde_dwarf_internal_brewery_speaking_tube_progress_one_04"
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
				2.9479999542236,
				2.0810000896454,
				2.6879999637604,
				4.5549998283386
			},
			localization_strings = {
				"nde_dwarf_internal_brewery_speaking_tube_progress_one_01",
				"nde_dwarf_internal_brewery_speaking_tube_progress_one_02",
				"nde_dwarf_internal_brewery_speaking_tube_progress_one_03",
				"nde_dwarf_internal_brewery_speaking_tube_progress_one_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_brewery_speaking_tube_interact_one_b = {
			override_awareness = "speaking_tube_interact_one_b_done",
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_brewery_speaking_tube_interact_one_b_01",
				"nde_dwarf_internal_brewery_speaking_tube_interact_one_b_02",
				"nde_dwarf_internal_brewery_speaking_tube_interact_one_b_03",
				"nde_dwarf_internal_brewery_speaking_tube_interact_one_b_04"
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
				13.742979049683,
				13.814979553223,
				15.915979385376,
				14.471979141235
			},
			localization_strings = {
				"nde_dwarf_internal_brewery_speaking_tube_interact_one_b_01",
				"nde_dwarf_internal_brewery_speaking_tube_interact_one_b_02",
				"nde_dwarf_internal_brewery_speaking_tube_interact_one_b_03",
				"nde_dwarf_internal_brewery_speaking_tube_interact_one_b_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_start_banter_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "nik_dwarf_internal_start_banter_a_01",
				[2.0] = "nik_dwarf_internal_start_banter_a_02"
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
				[1.0] = 4.8260002136231,
				[2.0] = 4.0560002326965
			},
			sound_distance = math.huge,
			localization_strings = {
				[1.0] = "nik_dwarf_internal_start_banter_a_01",
				[2.0] = "nik_dwarf_internal_start_banter_a_02"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_brewery_speaking_tube_complete = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "story_talk_must_reply",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_brewery_speaking_tube_complete_01",
				"nde_dwarf_internal_brewery_speaking_tube_complete_02",
				"nde_dwarf_internal_brewery_speaking_tube_complete_03",
				"nde_dwarf_internal_brewery_speaking_tube_complete_04"
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
				4.5380001068115,
				3.3570001125336,
				6.1689791679382,
				4.2309789657593
			},
			localization_strings = {
				"nde_dwarf_internal_brewery_speaking_tube_complete_01",
				"nde_dwarf_internal_brewery_speaking_tube_complete_02",
				"nde_dwarf_internal_brewery_speaking_tube_complete_03",
				"nde_dwarf_internal_brewery_speaking_tube_complete_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_brewery_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "story_talk_must_reply",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_brewery_b_01",
				"nde_dwarf_internal_brewery_b_02",
				"nde_dwarf_internal_brewery_b_03",
				"nde_dwarf_internal_brewery_b_04"
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
				5.6680002212524,
				6.7119998931885,
				5.9019999504089,
				5.1380000114441
			},
			sound_distance = math.huge,
			localization_strings = {
				"nde_dwarf_internal_brewery_b_01",
				"nde_dwarf_internal_brewery_b_02",
				"nde_dwarf_internal_brewery_b_03",
				"nde_dwarf_internal_brewery_b_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_dead_dwarfs = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_dead_dwarfs_01",
				"nik_dwarf_internal_dead_dwarfs_02",
				"nik_dwarf_internal_dead_dwarfs_03",
				"nik_dwarf_internal_dead_dwarfs_04"
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
				7.7340002059936,
				3.1219999790192,
				5.9539999961853,
				5.191999912262
			},
			sound_distance = math.huge,
			localization_strings = {
				"nik_dwarf_internal_dead_dwarfs_01",
				"nik_dwarf_internal_dead_dwarfs_02",
				"nik_dwarf_internal_dead_dwarfs_03",
				"nik_dwarf_internal_dead_dwarfs_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_brewery_speaking_tube_complete = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_brewery_speaking_tube_complete_01",
				"nik_dwarf_internal_brewery_speaking_tube_complete_02",
				"nik_dwarf_internal_brewery_speaking_tube_complete_03",
				"nik_dwarf_internal_brewery_speaking_tube_complete_04"
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
				4.8189997673035,
				4.1630001068115,
				3.5510001182556,
				4.7369999885559
			},
			localization_strings = {
				"nik_dwarf_internal_brewery_speaking_tube_complete_01",
				"nik_dwarf_internal_brewery_speaking_tube_complete_02",
				"nik_dwarf_internal_brewery_speaking_tube_complete_03",
				"nik_dwarf_internal_brewery_speaking_tube_complete_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_still_a_maze = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_still_a_maze_01",
				"nik_dwarf_internal_still_a_maze_02",
				"nik_dwarf_internal_still_a_maze_03",
				"nik_dwarf_internal_still_a_maze_04"
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
				4.7490000724792,
				5.9229793548584,
				9.133978843689,
				3.885999917984
			},
			localization_strings = {
				"nik_dwarf_internal_still_a_maze_01",
				"nik_dwarf_internal_still_a_maze_02",
				"nik_dwarf_internal_still_a_maze_03",
				"nik_dwarf_internal_still_a_maze_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_brewery_guidance = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 6,
			sound_events = {
				"nde_dwarf_internal_brewery_guidance_01",
				"nde_dwarf_internal_brewery_guidance_02",
				"nde_dwarf_internal_brewery_guidance_03",
				"nde_dwarf_internal_brewery_guidance_04",
				"nde_dwarf_internal_brewery_guidance_05",
				"nde_dwarf_internal_brewery_guidance_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				3.1860001087189,
				2.7060000896454,
				2.7920000553131,
				1.9659999608993,
				2.1900000572205,
				2.7269999980927
			},
			localization_strings = {
				"nde_dwarf_internal_brewery_guidance_01",
				"nde_dwarf_internal_brewery_guidance_02",
				"nde_dwarf_internal_brewery_guidance_03",
				"nde_dwarf_internal_brewery_guidance_04",
				"nde_dwarf_internal_brewery_guidance_05",
				"nde_dwarf_internal_brewery_guidance_06"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_brewery_speaking_tube_progress_two = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_brewery_speaking_tube_progress_two_01",
				"nde_dwarf_internal_brewery_speaking_tube_progress_two_02",
				"nde_dwarf_internal_brewery_speaking_tube_progress_two_03",
				"nde_dwarf_internal_brewery_speaking_tube_progress_two_04"
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
				2.2620000839233,
				1.8389999866486,
				2.0729999542236,
				2.1050000190735
			},
			localization_strings = {
				"nde_dwarf_internal_brewery_speaking_tube_progress_two_01",
				"nde_dwarf_internal_brewery_speaking_tube_progress_two_02",
				"nde_dwarf_internal_brewery_speaking_tube_progress_two_03",
				"nde_dwarf_internal_brewery_speaking_tube_progress_two_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a_01",
				"nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a_02",
				"nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a_03",
				"nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a_04"
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
				6.4049792289734,
				6.9869999885559,
				6.3239998817444,
				5.7389998435974
			},
			sound_distance = math.huge,
			localization_strings = {
				"nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a_01",
				"nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a_02",
				"nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a_03",
				"nde_dwarf_internal_end_event_speaking_tube_PLAN_A_a_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_end_event_interact_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_end_event_interact_b_01",
				"nde_dwarf_internal_end_event_interact_b_02",
				"nde_dwarf_internal_end_event_interact_b_03",
				"nde_dwarf_internal_end_event_interact_b_04"
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
				5.5649790763855,
				5.9710001945496,
				4.9840002059936,
				6.1149792671204
			},
			localization_strings = {
				"nde_dwarf_internal_end_event_interact_b_01",
				"nde_dwarf_internal_end_event_interact_b_02",
				"nde_dwarf_internal_end_event_interact_b_03",
				"nde_dwarf_internal_end_event_interact_b_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_valaya = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_valaya_01",
				"nik_dwarf_internal_valaya_02",
				"nik_dwarf_internal_valaya_03",
				"nik_dwarf_internal_valaya_04"
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
				3.6710000038147,
				3.8229999542236,
				9.2220001220703,
				6.2760000228882
			},
			localization_strings = {
				"nik_dwarf_internal_valaya_01",
				"nik_dwarf_internal_valaya_02",
				"nik_dwarf_internal_valaya_03",
				"nik_dwarf_internal_valaya_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_brewery_event_start = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_brewery_event_start_01",
				"nde_dwarf_internal_brewery_event_start_02",
				"nde_dwarf_internal_brewery_event_start_03",
				"nde_dwarf_internal_brewery_event_start_04"
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
				3.3970000743866,
				3.5190000534058,
				3.3729999065399,
				2.9960000514984
			},
			localization_strings = {
				"nde_dwarf_internal_brewery_event_start_01",
				"nde_dwarf_internal_brewery_event_start_02",
				"nde_dwarf_internal_brewery_event_start_03",
				"nde_dwarf_internal_brewery_event_start_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_end_event_attention = {
			override_awareness = "dummy_memory_trigger_end_event",
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "story_talk_must_reply",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_end_event_attention_01",
				"nde_dwarf_internal_end_event_attention_02",
				"nde_dwarf_internal_end_event_attention_03",
				"nde_dwarf_internal_end_event_attention_04"
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
				2.6960000991821,
				1.9359999895096,
				2.7369999885559,
				1.8960000276566
			},
			localization_strings = {
				"nde_dwarf_internal_end_event_attention_01",
				"nde_dwarf_internal_end_event_attention_02",
				"nde_dwarf_internal_end_event_attention_03",
				"nde_dwarf_internal_end_event_attention_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_start_banter_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "nik_dwarf_internal_start_banter_b_01",
				[2.0] = "nik_dwarf_internal_start_banter_b_02"
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
				[1.0] = 4.9889998435974,
				[2.0] = 5.8920001983643
			},
			sound_distance = math.huge,
			localization_strings = {
				[1.0] = "nik_dwarf_internal_start_banter_b_01",
				[2.0] = "nik_dwarf_internal_start_banter_b_02"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_brewery_attention = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_brewery_attention_01",
				"nde_dwarf_internal_brewery_attention_02",
				"nde_dwarf_internal_brewery_attention_03",
				"nde_dwarf_internal_brewery_attention_04"
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
				3.0039999485016,
				3.460000038147,
				3.2969999313355,
				5.5029997825623
			},
			localization_strings = {
				"nde_dwarf_internal_brewery_attention_01",
				"nde_dwarf_internal_brewery_attention_02",
				"nde_dwarf_internal_brewery_attention_03",
				"nde_dwarf_internal_brewery_attention_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_barrel_drop = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 10,
			sound_events = {
				"nde_dwarf_internal_barrel_drop_01",
				"nde_dwarf_internal_barrel_drop_02",
				"nde_dwarf_internal_barrel_drop_03",
				"nde_dwarf_internal_barrel_drop_04",
				"nde_dwarf_internal_barrel_drop_05",
				"nde_dwarf_internal_barrel_drop_06",
				"nde_dwarf_internal_barrel_drop_07",
				"nde_dwarf_internal_barrel_drop_08",
				"nde_dwarf_internal_barrel_drop_09",
				"nde_dwarf_internal_barrel_drop_10"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				1.7999999523163,
				1.944000005722,
				1.7429791688919,
				1.3109999895096,
				1.9939999580383,
				1.2819999456406,
				1.6590000391007,
				1.9079999923706,
				1.2539999485016,
				1.6130000352859
			},
			localization_strings = {
				"nde_dwarf_internal_barrel_drop_01",
				"nde_dwarf_internal_barrel_drop_02",
				"nde_dwarf_internal_barrel_drop_03",
				"nde_dwarf_internal_barrel_drop_04",
				"nde_dwarf_internal_barrel_drop_05",
				"nde_dwarf_internal_barrel_drop_06",
				"nde_dwarf_internal_barrel_drop_07",
				"nde_dwarf_internal_barrel_drop_08",
				"nde_dwarf_internal_barrel_drop_09",
				"nde_dwarf_internal_barrel_drop_10"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_hasnt_improved = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_hasnt_improved_01",
				"nik_dwarf_internal_hasnt_improved_02",
				"nik_dwarf_internal_hasnt_improved_03",
				"nik_dwarf_internal_hasnt_improved_04"
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
				3.3429999351502,
				4.8949999809265,
				5.6019792556763,
				6.3520002365112
			},
			localization_strings = {
				"nik_dwarf_internal_hasnt_improved_01",
				"nik_dwarf_internal_hasnt_improved_02",
				"nik_dwarf_internal_hasnt_improved_03",
				"nik_dwarf_internal_hasnt_improved_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_engineer_reveal_no_bardin = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_engineer_reveal_no_bardin_01",
				"nik_dwarf_internal_engineer_reveal_no_bardin_02",
				"nik_dwarf_internal_engineer_reveal_no_bardin_03",
				"nik_dwarf_internal_engineer_reveal_no_bardin_04"
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
				11.638999938965,
				12.060978889465,
				9.0829792022705,
				11.647978782654
			},
			localization_strings = {
				"nik_dwarf_internal_engineer_reveal_no_bardin_01",
				"nik_dwarf_internal_engineer_reveal_no_bardin_02",
				"nik_dwarf_internal_engineer_reveal_no_bardin_03",
				"nik_dwarf_internal_engineer_reveal_no_bardin_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder_01",
				"nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder_02",
				"nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder_03",
				"nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder_04"
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
				4.0679998397827,
				3.6840000152588,
				3.3680000305176,
				3.7149791717529
			},
			localization_strings = {
				"nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder_01",
				"nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder_02",
				"nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder_03",
				"nik_dwarf_internal_brewery_speaking_tube_progress_two_reminder_04"
			},
			randomize_indexes = {}
		},
		nde_dwarf_internal_brewery_speaking_tube_interact_two_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nde_dwarf_internal_brewery_speaking_tube_interact_two_b_01",
				"nde_dwarf_internal_brewery_speaking_tube_interact_two_b_02",
				"nde_dwarf_internal_brewery_speaking_tube_interact_two_b_03",
				"nde_dwarf_internal_brewery_speaking_tube_interact_two_b_04"
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
				3.4939999580383,
				3.3020000457764,
				1.8250000476837,
				3.8239998817444
			},
			localization_strings = {
				"nde_dwarf_internal_brewery_speaking_tube_interact_two_b_01",
				"nde_dwarf_internal_brewery_speaking_tube_interact_two_b_02",
				"nde_dwarf_internal_brewery_speaking_tube_interact_two_b_03",
				"nde_dwarf_internal_brewery_speaking_tube_interact_two_b_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_dwarf_sign = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_dwarf_sign_01",
				"nik_dwarf_internal_dwarf_sign_02",
				"nik_dwarf_internal_dwarf_sign_03",
				"nik_dwarf_internal_dwarf_sign_04"
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
				4.7049999237061,
				4.643000125885,
				3.954999923706,
				6.3649792671204
			},
			localization_strings = {
				"nik_dwarf_internal_dwarf_sign_01",
				"nik_dwarf_internal_dwarf_sign_02",
				"nik_dwarf_internal_dwarf_sign_03",
				"nik_dwarf_internal_dwarf_sign_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_end_conversation_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_end_conversation_b_01",
				"nik_dwarf_internal_end_conversation_b_02",
				"nik_dwarf_internal_end_conversation_b_03",
				"nik_dwarf_internal_end_conversation_b_04"
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
				8.290979385376,
				8.1709995269775,
				6.8059792518616,
				4.5289793014526
			},
			localization_strings = {
				"nik_dwarf_internal_end_conversation_b_01",
				"nik_dwarf_internal_end_conversation_b_02",
				"nik_dwarf_internal_end_conversation_b_03",
				"nik_dwarf_internal_end_conversation_b_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_brewery_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_brewery_c_01",
				"nik_dwarf_internal_brewery_c_02",
				"nik_dwarf_internal_brewery_c_03",
				"nik_dwarf_internal_brewery_c_04"
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
				4.7059998512268,
				5.191999912262,
				5.2839999198914,
				4.8048257827759
			},
			localization_strings = {
				"nik_dwarf_internal_brewery_c_01",
				"nik_dwarf_internal_brewery_c_02",
				"nik_dwarf_internal_brewery_c_03",
				"nik_dwarf_internal_brewery_c_04"
			},
			randomize_indexes = {}
		},
		nik_dwarf_internal_come_home = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_interior",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_dwarf_internal_come_home_01",
				"nik_dwarf_internal_come_home_02",
				"nik_dwarf_internal_come_home_03",
				"nik_dwarf_internal_come_home_04"
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
				3.7779791355133,
				3.4130001068115,
				5.5069789886475,
				5.3109998703003
			},
			localization_strings = {
				"nik_dwarf_internal_come_home_01",
				"nik_dwarf_internal_come_home_02",
				"nik_dwarf_internal_come_home_03",
				"nik_dwarf_internal_come_home_04"
			},
			randomize_indexes = {}
		}
	})
end
