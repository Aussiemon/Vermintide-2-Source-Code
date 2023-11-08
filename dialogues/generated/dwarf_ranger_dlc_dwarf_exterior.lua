return function ()
	define_rule({
		name = "pdr_dwarf_beacons_bridge_stuck_b",
		response = "pdr_dwarf_beacons_bridge_stuck_b",
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
				"dwarf_beacons_bridge_stuck_a"
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
				3
			},
			{
				"faction_memory",
				"dwarf_beacons_bridge_stuck_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_bridge_stuck_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_begin_end_event_b",
		response = "pdr_dwarf_external_begin_end_event_b",
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
				"dwarf_external_begin_end_event_a"
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
				"dwarf_external_begin_end_event_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_begin_end_event_b",
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
		name = "pdr_dwarf_external_cliff",
		response = "pdr_dwarf_external_cliff",
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
				"dwarf_external_cliff"
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
				3
			},
			{
				"faction_memory",
				"dwarf_external_cliff",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_cliff",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_elevator_briefing_a",
		response = "pdr_dwarf_external_elevator_briefing_a",
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
				"dwarf_external_elevator_briefing_a"
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
				"dwarf_external_elevator_briefing_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_elevator_briefing_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_elevator_briefing_c",
		response = "pdr_dwarf_external_elevator_briefing_c",
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
				"dwarf_external_elevator_briefing_b"
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
				"dwarf_external_elevator_briefing_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_elevator_briefing_c",
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
		name = "pdr_dwarf_external_end_event_complete_01_b",
		response = "pdr_dwarf_external_end_event_complete_01_b",
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
				"dwarf_external_end_event_complete_01_a"
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
				"dwarf_external_end_event_complete_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_end_event_complete_b",
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
		name = "pdr_dwarf_external_end_event_complete_02_b",
		response = "pdr_dwarf_external_end_event_complete_02_b",
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
				"dwarf_external_end_event_complete_02_a"
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
				"dwarf_external_end_event_complete_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_end_event_complete_b",
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
		name = "pdr_dwarf_external_end_event_complete_03_b",
		response = "pdr_dwarf_external_end_event_complete_03_b",
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
				"dwarf_external_end_event_complete_03_a"
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
				"dwarf_external_end_event_complete_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_end_event_complete_b",
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
		name = "pdr_dwarf_external_end_event_fuse_lit",
		response = "pdr_dwarf_external_end_event_fuse_lit",
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
				"dwarf_external_end_event_fuse_lit"
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
				"dwarf_external_end_event_fuse_lit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_end_event_fuse_lit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_event_reminder_b",
		response = "pdr_dwarf_external_event_reminder_b",
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
				"nde_dwarf_external_event_reminder_a"
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
				"dwarf_external_event_reminder_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_event_reminder_b",
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
		name = "pdr_dwarf_external_ghost_town_a",
		response = "pdr_dwarf_external_ghost_town_a",
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
				"dwarf_external_ghost_town_a"
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
				2
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				2
			},
			{
				"faction_memory",
				"dwarf_external_ghost_town_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_ghost_town_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_mid_conversation_a",
		response = "pdr_dwarf_external_mid_conversation_a",
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
				"enemies_close",
				OP.LT,
				3
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				2
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"dwarf_external_natural_beauty",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"dwarf_external_elevator_briefing_a",
				OP.NOT,
				"dwarf_external_elevator_briefing_a"
			},
			{
				"faction_memory",
				"dwarf_external_mid_conversation_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_mid_conversation_a",
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
		name = "pdr_dwarf_external_mid_conversation_c",
		response = "pdr_dwarf_external_mid_conversation_c",
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
				"dwarf_external_mid_conversation_b"
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
				3
			},
			{
				"faction_memory",
				"dwarf_external_mid_conversation_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_mid_conversation_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_mid_event_done",
		response = "pdr_dwarf_external_mid_event_done",
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
				"dwarf_external_mid_event_done"
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
				"dwarf_external_mid_event_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_mid_event_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_mid_event_seen",
		response = "pdr_dwarf_external_mid_event_seen",
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
				"dwarf_external_mid_event_seen"
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
				"dwarf_external_mid_event_seen",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_mid_event_seen",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_migdahl_a",
		response = "pdr_dwarf_external_migdahl_a",
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
				"dwarf_external_migdahl_a"
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
				"faction_memory",
				"dwarf_external_migdahl_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_migdahl_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_migdahl_c",
		response = "pdr_dwarf_external_migdahl_c",
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
				"dwarf_external_migdahl_b"
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
				3
			},
			{
				"faction_memory",
				"dwarf_external_migdahl_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_migdahl_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_natural_beauty",
		response = "pdr_dwarf_external_natural_beauty",
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
				"dwarf_external_natural_beauty"
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
				3
			},
			{
				"faction_memory",
				"dwarf_external_natural_beauty",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_natural_beauty",
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
		name = "pdr_dwarf_external_nearly_there_b",
		response = "pdr_dwarf_external_nearly_there_b",
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
				"dwarf_external_nearly_there_a"
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
				3
			},
			{
				"faction_memory",
				"dwarf_external_nearly_there_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_nearly_there_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_occupied_mine",
		response = "pdr_dwarf_external_occupied_mine",
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
				"dwarf_external_occupied_mine"
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
				3
			},
			{
				"faction_memory",
				"dwarf_external_occupied_mine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_occupied_mine",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_safety_a",
		response = "pdr_dwarf_external_safety_a",
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
				"enemies_close",
				OP.LT,
				3
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				20
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
				"dwarf_external_end_event_complete_b",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"dwarf_external_safety_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_safety_a",
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
		name = "pdr_dwarf_external_safety_c",
		response = "pdr_dwarf_external_safety_c",
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
				"dwarf_external_safety_b"
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
				3
			},
			{
				"faction_memory",
				"dwarf_external_safety_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_safety_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_skaven_works",
		response = "pdr_dwarf_external_skaven_works",
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
				"dwarf_external_skaven_works"
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
				3
			},
			{
				"faction_memory",
				"dwarf_external_skaven_works",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_skaven_works",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_start_banter_a",
		response = "pdr_dwarf_external_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_external_start_banter_a"
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
				"dwarf_external_start_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_start_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_dwarf_external_start_banter_b",
		name = "pdr_dwarf_external_start_banter_b",
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
				"dwarf_external_start_banter_a"
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
		response = "pdr_dwarf_external_start_banter_c",
		name = "pdr_dwarf_external_start_banter_c",
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
				"dwarf_external_start_banter_b"
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
		name = "pdr_dwarf_external_which_way_a",
		response = "pdr_dwarf_external_which_way_a",
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
				"dwarf_external_which_way_a"
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
				"dwarf_external_which_way_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_which_way_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_which_way_c",
		response = "pdr_dwarf_external_which_way_c",
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
				"nde_dwarf_external_which_way_b"
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
				3
			},
			{
				"faction_memory",
				"dwarf_external_which_way_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_which_way_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_dwarf_external_wyr_migdahl_a_dummy",
		response = "pdr_dwarf_external_wyr_migdahl_a_dummy",
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
				"enemies_close",
				OP.LT,
				3
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				10
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"dwarf_external_natural_beauty",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"dwarf_external_elevator_briefing_a",
				OP.NOT,
				"dwarf_external_elevator_briefing_a"
			},
			{
				"faction_memory",
				"dwarf_external_wyr_migdahl_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_wyr_migdahl_a",
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
		name = "pdr_dwarf_external_wyr_migdahl_b",
		response = "pdr_dwarf_external_wyr_migdahl_b",
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
				"dwarf_external_wyr_migdahl_a"
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
				"faction_memory",
				"dwarf_external_wyr_migdahl_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_wyr_migdahl_b",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pdr_dwarf_beacons_bridge_stuck_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_beacons_bridge_stuck_b_01",
				"pdr_dwarf_beacons_bridge_stuck_b_02",
				"pdr_dwarf_beacons_bridge_stuck_b_03",
				"pdr_dwarf_beacons_bridge_stuck_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_bridge_stuck_b_01",
				"pdr_dwarf_beacons_bridge_stuck_b_02",
				"pdr_dwarf_beacons_bridge_stuck_b_03",
				"pdr_dwarf_beacons_bridge_stuck_b_04"
			},
			sound_events_duration = {
				1.4719791412354,
				2.4999792575836,
				2.272979259491,
				2.408979177475
			}
		},
		pdr_dwarf_external_begin_end_event_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_begin_end_event_b_01",
				"pdr_dwarf_external_begin_end_event_b_02",
				"pdr_dwarf_external_begin_end_event_b_03",
				"pdr_dwarf_external_begin_end_event_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_begin_end_event_b_01",
				"pdr_dwarf_external_begin_end_event_b_02",
				"pdr_dwarf_external_begin_end_event_b_03",
				"pdr_dwarf_external_begin_end_event_b_04"
			},
			sound_events_duration = {
				1.7379791736603,
				1.24899995327,
				2.1689791679382,
				1.6899791955948
			}
		},
		pdr_dwarf_external_cliff = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_cliff_01",
				"pdr_dwarf_external_cliff_02",
				"pdr_dwarf_external_cliff_03",
				"pdr_dwarf_external_cliff_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_cliff_01",
				"pdr_dwarf_external_cliff_02",
				"pdr_dwarf_external_cliff_03",
				"pdr_dwarf_external_cliff_04"
			},
			sound_events_duration = {
				2.7289791107178,
				4.6889791488647,
				4.8219790458679,
				4.6239790916443
			}
		},
		pdr_dwarf_external_elevator_briefing_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_elevator_briefing_a_01",
				"pdr_dwarf_external_elevator_briefing_a_02",
				"pdr_dwarf_external_elevator_briefing_a_03",
				"pdr_dwarf_external_elevator_briefing_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_elevator_briefing_a_01",
				"pdr_dwarf_external_elevator_briefing_a_02",
				"pdr_dwarf_external_elevator_briefing_a_03",
				"pdr_dwarf_external_elevator_briefing_a_04"
			},
			sound_events_duration = {
				2.6349792480469,
				2.7119791507721,
				4.0479793548584,
				5.5639791488647
			}
		},
		pdr_dwarf_external_elevator_briefing_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_elevator_briefing_c_01",
				"pdr_dwarf_external_elevator_briefing_c_02",
				"pdr_dwarf_external_elevator_briefing_c_03",
				"pdr_dwarf_external_elevator_briefing_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_elevator_briefing_c_01",
				"pdr_dwarf_external_elevator_briefing_c_02",
				"pdr_dwarf_external_elevator_briefing_c_03",
				"pdr_dwarf_external_elevator_briefing_c_04"
			},
			sound_events_duration = {
				1.7029792070389,
				3.3879792690277,
				3.7249791622162,
				3.1769790649414
			}
		},
		pdr_dwarf_external_end_event_complete_01_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_exterior",
			sound_events_n = 2,
			category = "level_talk_must_play",
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
				[1.0] = "pdr_dwarf_external_end_event_complete_01_b_01",
				[2.0] = "pdr_dwarf_external_end_event_complete_01_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_dwarf_external_end_event_complete_01_b_01",
				[2.0] = "pdr_dwarf_external_end_event_complete_01_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.6219792366028,
				[2.0] = 2.6180000305176
			}
		},
		pdr_dwarf_external_end_event_complete_02_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_exterior",
			sound_events_n = 2,
			category = "level_talk_must_play",
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
				[1.0] = "pdr_dwarf_external_end_event_complete_02_b_01",
				[2.0] = "pdr_dwarf_external_end_event_complete_02_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_dwarf_external_end_event_complete_02_b_01",
				[2.0] = "pdr_dwarf_external_end_event_complete_02_b_02"
			},
			sound_events_duration = {
				[1.0] = 1.7329791784286,
				[2.0] = 3.1919791698456
			}
		},
		pdr_dwarf_external_end_event_complete_03_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_exterior",
			sound_events_n = 2,
			category = "level_talk_must_play",
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
				[1.0] = "pdr_dwarf_external_end_event_complete_03_b_01",
				[2.0] = "pdr_dwarf_external_end_event_complete_03_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_dwarf_external_end_event_complete_03_b_01",
				[2.0] = "pdr_dwarf_external_end_event_complete_03_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.0699791908264,
				[2.0] = 4.3729791641235
			}
		},
		pdr_dwarf_external_end_event_fuse_lit = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_objective_skaven_tunnels_lighting_the_fuse_01",
				"pdr_objective_skaven_tunnels_lighting_the_fuse_02",
				"pdr_objective_skaven_tunnels_lighting_the_fuse_03",
				"pdr_objective_skaven_tunnels_lighting_the_fuse_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_skaven_tunnels_lighting_the_fuse_01",
				"pdr_objective_skaven_tunnels_lighting_the_fuse_02",
				"pdr_objective_skaven_tunnels_lighting_the_fuse_03",
				"pdr_objective_skaven_tunnels_lighting_the_fuse_04"
			},
			sound_events_duration = {
				1.9850833415985,
				1.254562497139,
				1.9603542089462,
				3.841875076294
			}
		},
		pdr_dwarf_external_event_reminder_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_event_reminder_b_01",
				"pdr_dwarf_external_event_reminder_b_02",
				"pdr_dwarf_external_event_reminder_b_03",
				"pdr_dwarf_external_event_reminder_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_event_reminder_b_01",
				"pdr_dwarf_external_event_reminder_b_02",
				"pdr_dwarf_external_event_reminder_b_03",
				"pdr_dwarf_external_event_reminder_b_04"
			},
			sound_events_duration = {
				2.0829792022705,
				2.4439792633057,
				3.4979791641235,
				2.9399790763855
			}
		},
		pdr_dwarf_external_ghost_town_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_ghost_town_a_01",
				"pdr_dwarf_external_ghost_town_a_02",
				"pdr_dwarf_external_ghost_town_a_03",
				"pdr_dwarf_external_ghost_town_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_ghost_town_a_01",
				"pdr_dwarf_external_ghost_town_a_02",
				"pdr_dwarf_external_ghost_town_a_03",
				"pdr_dwarf_external_ghost_town_a_04"
			},
			sound_events_duration = {
				4.6539793014526,
				2.8769791126251,
				2.9589791297913,
				3.5269792079926
			}
		},
		pdr_dwarf_external_mid_conversation_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_mid_conversation_a_01",
				"pdr_dwarf_external_mid_conversation_a_02",
				"pdr_dwarf_external_mid_conversation_a_03",
				"pdr_dwarf_external_mid_conversation_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_mid_conversation_a_01",
				"pdr_dwarf_external_mid_conversation_a_02",
				"pdr_dwarf_external_mid_conversation_a_03",
				"pdr_dwarf_external_mid_conversation_a_04"
			},
			sound_events_duration = {
				4.1099791526794,
				2.9569792747498,
				5.9359793663025,
				4.665979385376
			}
		},
		pdr_dwarf_external_mid_conversation_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_mid_conversation_c_01",
				"pdr_dwarf_external_mid_conversation_c_02",
				"pdr_dwarf_external_mid_conversation_c_03",
				"pdr_dwarf_external_mid_conversation_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_mid_conversation_c_01",
				"pdr_dwarf_external_mid_conversation_c_02",
				"pdr_dwarf_external_mid_conversation_c_03",
				"pdr_dwarf_external_mid_conversation_c_04"
			},
			sound_events_duration = {
				1.7129791975021,
				0.84700000286102,
				2.0639791488648,
				1.9959791898727
			}
		},
		pdr_dwarf_external_mid_event_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_arena_ice_continue_01",
				"pdr_arena_ice_continue_02",
				"pdr_arena_ice_continue_03",
				"pdr_arena_ice_continue_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_arena_ice_continue_01",
				"pdr_arena_ice_continue_02",
				"pdr_arena_ice_continue_03",
				"pdr_arena_ice_continue_04"
			},
			sound_events_duration = {
				1.9748958349228,
				1.737104177475,
				2.297708272934,
				2.8956875801086
			}
		},
		pdr_dwarf_external_mid_event_seen = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_level_helmgart_military_portcullis_01",
				"pdr_level_helmgart_military_portcullis_02",
				"pdr_level_helmgart_military_portcullis_03",
				"pdr_level_helmgart_military_portcullis_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_helmgart_military_portcullis_01",
				"pdr_level_helmgart_military_portcullis_02",
				"pdr_level_helmgart_military_portcullis_03",
				"pdr_level_helmgart_military_portcullis_04"
			},
			sound_events_duration = {
				3.2545416355133,
				3.6763958930969,
				4.2153749465942,
				3.487104177475
			}
		},
		pdr_dwarf_external_migdahl_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_migdahl_a_01",
				"pdr_dwarf_external_migdahl_a_02",
				"pdr_dwarf_external_migdahl_a_03",
				"pdr_dwarf_external_migdahl_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_migdahl_a_01",
				"pdr_dwarf_external_migdahl_a_02",
				"pdr_dwarf_external_migdahl_a_03",
				"pdr_dwarf_external_migdahl_a_04"
			},
			sound_events_duration = {
				4.0689792633057,
				2.5909790992737,
				2.3069791793823,
				3.272979259491
			}
		},
		pdr_dwarf_external_migdahl_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_migdahl_c_01",
				"pdr_dwarf_external_migdahl_c_02",
				"pdr_dwarf_external_migdahl_c_03",
				"pdr_dwarf_external_migdahl_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_migdahl_c_01",
				"pdr_dwarf_external_migdahl_c_02",
				"pdr_dwarf_external_migdahl_c_03",
				"pdr_dwarf_external_migdahl_c_04"
			},
			sound_events_duration = {
				2.4439792633057,
				1.505979180336,
				2.6649792194366,
				5.4429793357849
			}
		},
		pdr_dwarf_external_natural_beauty = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_natural_beauty_01",
				"pdr_dwarf_external_natural_beauty_02",
				"pdr_dwarf_external_natural_beauty_03",
				"pdr_dwarf_external_natural_beauty_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_natural_beauty_01",
				"pdr_dwarf_external_natural_beauty_02",
				"pdr_dwarf_external_natural_beauty_03",
				"pdr_dwarf_external_natural_beauty_04"
			},
			sound_events_duration = {
				5.6399793624878,
				3.863979101181,
				3.647979259491,
				4.7869791984558
			}
		},
		pdr_dwarf_external_nearly_there_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_nearly_there_b_01",
				"pdr_dwarf_external_nearly_there_b_02",
				"pdr_dwarf_external_nearly_there_b_03",
				"pdr_dwarf_external_nearly_there_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_nearly_there_b_01",
				"pdr_dwarf_external_nearly_there_b_02",
				"pdr_dwarf_external_nearly_there_b_03",
				"pdr_dwarf_external_nearly_there_b_04"
			},
			sound_events_duration = {
				2.0980000495911,
				2.3119790554047,
				2.3039999008179,
				2.9189791679382
			}
		},
		pdr_dwarf_external_occupied_mine = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_occupied_mine_01",
				"pdr_dwarf_external_occupied_mine_02",
				"pdr_dwarf_external_occupied_mine_03",
				"pdr_dwarf_external_occupied_mine_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_occupied_mine_01",
				"pdr_dwarf_external_occupied_mine_02",
				"pdr_dwarf_external_occupied_mine_03",
				"pdr_dwarf_external_occupied_mine_04"
			},
			sound_events_duration = {
				4.2199792861939,
				2.6649792194366,
				3.1019792556763,
				3.1159791946411
			}
		},
		pdr_dwarf_external_safety_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_safety_a_01",
				"pdr_dwarf_external_safety_a_02",
				"pdr_dwarf_external_safety_a_03",
				"pdr_dwarf_external_safety_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_safety_a_01",
				"pdr_dwarf_external_safety_a_02",
				"pdr_dwarf_external_safety_a_03",
				"pdr_dwarf_external_safety_a_04"
			},
			sound_events_duration = {
				3.0989792346954,
				4.8199791908264,
				2.6829791069031,
				4.6789793968201
			}
		},
		pdr_dwarf_external_safety_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_safety_c_01",
				"pdr_dwarf_external_safety_c_02",
				"pdr_dwarf_external_safety_c_03",
				"pdr_dwarf_external_safety_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_safety_c_01",
				"pdr_dwarf_external_safety_c_02",
				"pdr_dwarf_external_safety_c_03",
				"pdr_dwarf_external_safety_c_04"
			},
			sound_events_duration = {
				1.6749792098999,
				2.3709790706634,
				3.7869791984558,
				5.4399790763855
			}
		},
		pdr_dwarf_external_skaven_works = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_skaven_works_01",
				"pdr_dwarf_external_skaven_works_02",
				"pdr_dwarf_external_skaven_works_03",
				"pdr_dwarf_external_skaven_works_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_skaven_works_01",
				"pdr_dwarf_external_skaven_works_02",
				"pdr_dwarf_external_skaven_works_03",
				"pdr_dwarf_external_skaven_works_04"
			},
			sound_events_duration = {
				3.5529792308807,
				2.5639791488648,
				3.2109792232513,
				4.5329790115356
			}
		},
		pdr_dwarf_external_start_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				[1.0] = "pdr_dwarf_external_start_banter_a_01",
				[2.0] = "pdr_dwarf_external_start_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_dwarf_external_start_banter_a_01",
				[2.0] = "pdr_dwarf_external_start_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.408979177475,
				[2.0] = 4.3899793624878
			}
		},
		pdr_dwarf_external_start_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				[1.0] = "pdr_dwarf_external_start_banter_b_01",
				[2.0] = "pdr_dwarf_external_start_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_dwarf_external_start_banter_b_01",
				[2.0] = "pdr_dwarf_external_start_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 5.2239789962769,
				[2.0] = 4.977979183197
			}
		},
		pdr_dwarf_external_start_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				[1.0] = "pdr_dwarf_external_start_banter_c_01",
				[2.0] = "pdr_dwarf_external_start_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_dwarf_external_start_banter_c_01",
				[2.0] = "pdr_dwarf_external_start_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 2.9179792404175,
				[2.0] = 3.1329791545868
			}
		},
		pdr_dwarf_external_which_way_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_which_way_a_01",
				"pdr_dwarf_external_which_way_a_02",
				"pdr_dwarf_external_which_way_a_03",
				"pdr_dwarf_external_which_way_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_which_way_a_01",
				"pdr_dwarf_external_which_way_a_02",
				"pdr_dwarf_external_which_way_a_03",
				"pdr_dwarf_external_which_way_a_04"
			},
			sound_events_duration = {
				5.2229790687561,
				4.3099789619446,
				2.0179791450501,
				7.6229791641235
			}
		},
		pdr_dwarf_external_which_way_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_which_way_c_01",
				"pdr_dwarf_external_which_way_c_02",
				"pdr_dwarf_external_which_way_c_03",
				"pdr_dwarf_external_which_way_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_which_way_c_01",
				"pdr_dwarf_external_which_way_c_02",
				"pdr_dwarf_external_which_way_c_03",
				"pdr_dwarf_external_which_way_c_04"
			},
			sound_events_duration = {
				2.3320000171661,
				2.1529791355133,
				3.4229791164398,
				1.9299999475479
			}
		},
		pdr_dwarf_external_wyr_migdahl_a_dummy = {
			override_awareness = "dwarf_external_wyr_migdahl_a",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_dlc_dwarf_exterior",
			category = "level_talk",
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
		pdr_dwarf_external_wyr_migdahl_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_dwarf_exterior",
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
				"pdr_dwarf_external_wyr_migdahl_b_01",
				"pdr_dwarf_external_wyr_migdahl_b_02",
				"pdr_dwarf_external_wyr_migdahl_b_03",
				"pdr_dwarf_external_wyr_migdahl_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_external_wyr_migdahl_b_01",
				"pdr_dwarf_external_wyr_migdahl_b_02",
				"pdr_dwarf_external_wyr_migdahl_b_03",
				"pdr_dwarf_external_wyr_migdahl_b_04"
			},
			sound_events_duration = {
				3.4569792747498,
				3.8029792308807,
				2.8209791183472,
				4.3149790763855
			}
		}
	})
end
