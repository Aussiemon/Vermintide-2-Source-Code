return function ()
	define_rule({
		name = "pwe_dwarf_beacons_bridge_stuck_b",
		response = "pwe_dwarf_beacons_bridge_stuck_b",
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
		name = "pwe_dwarf_external_begin_end_event_b",
		response = "pwe_dwarf_external_begin_end_event_b",
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
		name = "pwe_dwarf_external_cliff",
		response = "pwe_dwarf_external_cliff",
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
		name = "pwe_dwarf_external_elevator_briefing_a",
		response = "pwe_dwarf_external_elevator_briefing_a",
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
		name = "pwe_dwarf_external_elevator_briefing_c",
		response = "pwe_dwarf_external_elevator_briefing_c",
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
		name = "pwe_dwarf_external_end_event_complete_01_b",
		response = "pwe_dwarf_external_end_event_complete_01_b",
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
		name = "pwe_dwarf_external_end_event_complete_02_b",
		response = "pwe_dwarf_external_end_event_complete_02_b",
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
		name = "pwe_dwarf_external_end_event_complete_03_b",
		response = "pwe_dwarf_external_end_event_complete_03_b",
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
		name = "pwe_dwarf_external_end_event_fuse_lit",
		response = "pwe_dwarf_external_end_event_fuse_lit",
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
		name = "pwe_dwarf_external_event_reminder_b",
		response = "pwe_dwarf_external_event_reminder_b",
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
		name = "pwe_dwarf_external_ghost_town_a",
		response = "pwe_dwarf_external_ghost_town_a",
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
		name = "pwe_dwarf_external_mid_conversation_a_dummy",
		response = "pwe_dwarf_external_mid_conversation_a_dummy",
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
				"enemies_close",
				OP.LT,
				1
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				2
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				0
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
		name = "pwe_dwarf_external_mid_event_done",
		response = "pwe_dwarf_external_mid_event_done",
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
		name = "pwe_dwarf_external_mid_event_seen",
		response = "pwe_dwarf_external_mid_event_seen",
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
		name = "pwe_dwarf_external_migdahl_a",
		response = "pwe_dwarf_external_migdahl_a",
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
		name = "pwe_dwarf_external_natural_beauty",
		response = "pwe_dwarf_external_natural_beauty",
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
		name = "pwe_dwarf_external_nearly_there_b",
		response = "pwe_dwarf_external_nearly_there_b",
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
		name = "pwe_dwarf_external_occupied_mine",
		response = "pwe_dwarf_external_occupied_mine",
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
		name = "pwe_dwarf_external_safety_a",
		response = "pwe_dwarf_external_safety_a",
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
		name = "pwe_dwarf_external_safety_c",
		response = "pwe_dwarf_external_safety_c",
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
		name = "pwe_dwarf_external_skaven_works",
		response = "pwe_dwarf_external_skaven_works",
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
		name = "pwe_dwarf_external_start_banter_a",
		response = "pwe_dwarf_external_start_banter_a",
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
		response = "pwe_dwarf_external_start_banter_b",
		name = "pwe_dwarf_external_start_banter_b",
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
		response = "pwe_dwarf_external_start_banter_c",
		name = "pwe_dwarf_external_start_banter_c",
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
		name = "pwe_dwarf_external_which_way_a",
		response = "pwe_dwarf_external_which_way_a",
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
		name = "pwe_dwarf_external_which_way_c",
		response = "pwe_dwarf_external_which_way_c",
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
	add_dialogues({
		pwe_dwarf_beacons_bridge_stuck_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_beacons_bridge_stuck_b_01",
				"pwe_dwarf_beacons_bridge_stuck_b_02",
				"pwe_dwarf_beacons_bridge_stuck_b_03",
				"pwe_dwarf_beacons_bridge_stuck_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_beacons_bridge_stuck_b_01",
				"pwe_dwarf_beacons_bridge_stuck_b_02",
				"pwe_dwarf_beacons_bridge_stuck_b_03",
				"pwe_dwarf_beacons_bridge_stuck_b_04"
			},
			sound_events_duration = {
				1.9830000400543,
				3.3429999351502,
				3.2249791622162,
				2.5779790878296
			}
		},
		pwe_dwarf_external_begin_end_event_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_begin_end_event_b_01",
				"pwe_dwarf_external_begin_end_event_b_02",
				"pwe_dwarf_external_begin_end_event_b_03",
				"pwe_dwarf_external_begin_end_event_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_begin_end_event_b_01",
				"pwe_dwarf_external_begin_end_event_b_02",
				"pwe_dwarf_external_begin_end_event_b_03",
				"pwe_dwarf_external_begin_end_event_b_04"
			},
			sound_events_duration = {
				1.6330000162125,
				2.4719791412353,
				1.9800000190735,
				3.5929791927338
			}
		},
		pwe_dwarf_external_cliff = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_cliff_01",
				"pwe_dwarf_external_cliff_02",
				"pwe_dwarf_external_cliff_03",
				"pwe_dwarf_external_cliff_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_cliff_01",
				"pwe_dwarf_external_cliff_02",
				"pwe_dwarf_external_cliff_03",
				"pwe_dwarf_external_cliff_04"
			},
			sound_events_duration = {
				2.4949998855591,
				3.573979139328,
				2.569000005722,
				4.5099792480469
			}
		},
		pwe_dwarf_external_elevator_briefing_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_elevator_briefing_a_01",
				"pwe_dwarf_external_elevator_briefing_a_02",
				"pwe_dwarf_external_elevator_briefing_a_03",
				"pwe_dwarf_external_elevator_briefing_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_elevator_briefing_a_01",
				"pwe_dwarf_external_elevator_briefing_a_02",
				"pwe_dwarf_external_elevator_briefing_a_03",
				"pwe_dwarf_external_elevator_briefing_a_04"
			},
			sound_events_duration = {
				4.4279999732971,
				7.334979057312,
				4.3549790382385,
				4.7899789810181
			}
		},
		pwe_dwarf_external_elevator_briefing_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_elevator_briefing_c_01",
				"pwe_dwarf_external_elevator_briefing_c_02",
				"pwe_dwarf_external_elevator_briefing_c_03",
				"pwe_dwarf_external_elevator_briefing_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_elevator_briefing_c_01",
				"pwe_dwarf_external_elevator_briefing_c_02",
				"pwe_dwarf_external_elevator_briefing_c_03",
				"pwe_dwarf_external_elevator_briefing_c_04"
			},
			sound_events_duration = {
				2.6099791526794,
				2.5969791412353,
				5.1869792938232,
				5.4439792633057
			}
		},
		pwe_dwarf_external_end_event_complete_01_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_exterior",
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
				[1.0] = "pwe_dwarf_external_end_event_complete_01_b_01",
				[2.0] = "pwe_dwarf_external_end_event_complete_01_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_dwarf_external_end_event_complete_01_b_01",
				[2.0] = "pwe_dwarf_external_end_event_complete_01_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.5969998836517,
				[2.0] = 3.834979057312
			}
		},
		pwe_dwarf_external_end_event_complete_02_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_exterior",
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
				[1.0] = "pwe_dwarf_external_end_event_complete_02_b_01",
				[2.0] = "pwe_dwarf_external_end_event_complete_02_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_dwarf_external_end_event_complete_02_b_01",
				[2.0] = "pwe_dwarf_external_end_event_complete_02_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.5079793930054,
				[2.0] = 6.3109793663025
			}
		},
		pwe_dwarf_external_end_event_complete_03_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_exterior",
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
				[1.0] = "pwe_dwarf_external_end_event_complete_03_b_01",
				[2.0] = "pwe_dwarf_external_end_event_complete_03_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_dwarf_external_end_event_complete_03_b_01",
				[2.0] = "pwe_dwarf_external_end_event_complete_03_b_02"
			},
			sound_events_duration = {
				[1.0] = 3.4659790992737,
				[2.0] = 3.5829792022705
			}
		},
		pwe_dwarf_external_end_event_fuse_lit = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "wood_elf_dlc_dwarf_exterior",
			sound_events_n = 6,
			category = "level_talk",
			dialogue_animations_n = 6,
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
			localization_strings = {
				"pwe_objective_goal_achieved_escape_07",
				"pwe_objective_goal_achieved_escape_12",
				"pwe_level_nurgle_coming_down_02",
				"pwe_level_nurgle_coming_down_04",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_02",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_03"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_goal_achieved_escape_07",
				"pwe_objective_goal_achieved_escape_12",
				"pwe_level_nurgle_coming_down_02",
				"pwe_level_nurgle_coming_down_04",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_02",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_03"
			},
			sound_events_duration = {
				2.4963958263397,
				2.5476458072662,
				5.1840624809265,
				4.5843749046326,
				1.5274583101273,
				1.6317083835602
			}
		},
		pwe_dwarf_external_event_reminder_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_event_reminder_b_01",
				"pwe_dwarf_external_event_reminder_b_02",
				"pwe_dwarf_external_event_reminder_b_03",
				"pwe_dwarf_external_event_reminder_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_event_reminder_b_01",
				"pwe_dwarf_external_event_reminder_b_02",
				"pwe_dwarf_external_event_reminder_b_03",
				"pwe_dwarf_external_event_reminder_b_04"
			},
			sound_events_duration = {
				4.1929793357849,
				2.875,
				3.0879790782928,
				3.4039790630341
			}
		},
		pwe_dwarf_external_ghost_town_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_ghost_town_a_01",
				"pwe_dwarf_external_ghost_town_a_02",
				"pwe_dwarf_external_ghost_town_a_03",
				"pwe_dwarf_external_ghost_town_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_ghost_town_a_01",
				"pwe_dwarf_external_ghost_town_a_02",
				"pwe_dwarf_external_ghost_town_a_03",
				"pwe_dwarf_external_ghost_town_a_04"
			},
			sound_events_duration = {
				5.8209791183472,
				3.4209792613983,
				3.5269999504089,
				3.948979139328
			}
		},
		pwe_dwarf_external_mid_conversation_a_dummy = {
			override_awareness = "dwarf_external_mid_conversation_a",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_dlc_dwarf_exterior",
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
		pwe_dwarf_external_mid_event_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_arena_ice_continue_01",
				"pwe_arena_ice_continue_02",
				"pwe_arena_ice_continue_03",
				"pwe_arena_ice_continue_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_arena_ice_continue_01",
				"pwe_arena_ice_continue_02",
				"pwe_arena_ice_continue_03",
				"pwe_arena_ice_continue_04"
			},
			sound_events_duration = {
				1.8559166193008,
				1.980229139328,
				1.3808749914169,
				1.8733750581741
			}
		},
		pwe_dwarf_external_mid_event_seen = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_level_helmgart_military_portcullis_01",
				"pwe_level_helmgart_military_portcullis_02",
				"pwe_level_helmgart_military_portcullis_03",
				"pwe_level_helmgart_military_portcullis_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_helmgart_military_portcullis_01",
				"pwe_level_helmgart_military_portcullis_02",
				"pwe_level_helmgart_military_portcullis_03",
				"pwe_level_helmgart_military_portcullis_04"
			},
			sound_events_duration = {
				4.4766664505005,
				4.6113543510437,
				5,
				4.331437587738
			}
		},
		pwe_dwarf_external_migdahl_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_migdahl_a_01",
				"pwe_dwarf_external_migdahl_a_02",
				"pwe_dwarf_external_migdahl_a_03",
				"pwe_dwarf_external_migdahl_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_migdahl_a_01",
				"pwe_dwarf_external_migdahl_a_02",
				"pwe_dwarf_external_migdahl_a_03",
				"pwe_dwarf_external_migdahl_a_04"
			},
			sound_events_duration = {
				3.4139790534973,
				4.664999961853,
				2.6579792499542,
				2.8489792346954
			}
		},
		pwe_dwarf_external_natural_beauty = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_natural_beauty_01",
				"pwe_dwarf_external_natural_beauty_02",
				"pwe_dwarf_external_natural_beauty_03",
				"pwe_dwarf_external_natural_beauty_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_natural_beauty_01",
				"pwe_dwarf_external_natural_beauty_02",
				"pwe_dwarf_external_natural_beauty_03",
				"pwe_dwarf_external_natural_beauty_04"
			},
			sound_events_duration = {
				5.7999792098999,
				3.9579999446869,
				4.0189790725708,
				6.2589793205261
			}
		},
		pwe_dwarf_external_nearly_there_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_nearly_there_b_01",
				"pwe_dwarf_external_nearly_there_b_02",
				"pwe_dwarf_external_nearly_there_b_03",
				"pwe_dwarf_external_nearly_there_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_nearly_there_b_01",
				"pwe_dwarf_external_nearly_there_b_02",
				"pwe_dwarf_external_nearly_there_b_03",
				"pwe_dwarf_external_nearly_there_b_04"
			},
			sound_events_duration = {
				3.1469790935516,
				4.6989793777466,
				4.7189793586731,
				3.2960000038147
			}
		},
		pwe_dwarf_external_occupied_mine = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_occupied_mine_01",
				"pwe_dwarf_external_occupied_mine_02",
				"pwe_dwarf_external_occupied_mine_03",
				"pwe_dwarf_external_occupied_mine_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_occupied_mine_01",
				"pwe_dwarf_external_occupied_mine_02",
				"pwe_dwarf_external_occupied_mine_03",
				"pwe_dwarf_external_occupied_mine_04"
			},
			sound_events_duration = {
				2.7379791736603,
				4.4089789390564,
				6.5129790306091,
				3.7649791240692
			}
		},
		pwe_dwarf_external_safety_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_safety_a_01",
				"pwe_dwarf_external_safety_a_02",
				"pwe_dwarf_external_safety_a_03",
				"pwe_dwarf_external_safety_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_safety_a_01",
				"pwe_dwarf_external_safety_a_02",
				"pwe_dwarf_external_safety_a_03",
				"pwe_dwarf_external_safety_a_04"
			},
			sound_events_duration = {
				3.2139792442322,
				3.631979227066,
				2.4539999961853,
				4.6110000610352
			}
		},
		pwe_dwarf_external_safety_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_safety_c_01",
				"pwe_dwarf_external_safety_c_02",
				"pwe_dwarf_external_safety_c_03",
				"pwe_dwarf_external_safety_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_safety_c_01",
				"pwe_dwarf_external_safety_c_02",
				"pwe_dwarf_external_safety_c_03",
				"pwe_dwarf_external_safety_c_04"
			},
			sound_events_duration = {
				3.6119999885559,
				3.1359791755676,
				4.3660001754761,
				4.1129789352417
			}
		},
		pwe_dwarf_external_skaven_works = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_skaven_works_01",
				"pwe_dwarf_external_skaven_works_02",
				"pwe_dwarf_external_skaven_works_03",
				"pwe_dwarf_external_skaven_works_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_skaven_works_01",
				"pwe_dwarf_external_skaven_works_02",
				"pwe_dwarf_external_skaven_works_03",
				"pwe_dwarf_external_skaven_works_04"
			},
			sound_events_duration = {
				2.9249792098999,
				2.8699998855591,
				5.0329790115356,
				6.2109789848328
			}
		},
		pwe_dwarf_external_start_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_exterior",
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
				[1.0] = "pwe_dwarf_external_start_banter_a_01",
				[2.0] = "pwe_dwarf_external_start_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_dwarf_external_start_banter_a_01",
				[2.0] = "pwe_dwarf_external_start_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 2.9019999504089,
				[2.0] = 3.6949791908264
			}
		},
		pwe_dwarf_external_start_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_exterior",
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
				[1.0] = "pwe_dwarf_external_start_banter_b_01",
				[2.0] = "pwe_dwarf_external_start_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_dwarf_external_start_banter_b_01",
				[2.0] = "pwe_dwarf_external_start_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.7009792327881,
				[2.0] = 4.0299792289734
			}
		},
		pwe_dwarf_external_start_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_exterior",
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
				[1.0] = "pwe_dwarf_external_start_banter_c_01",
				[2.0] = "pwe_dwarf_external_start_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_dwarf_external_start_banter_c_01",
				[2.0] = "pwe_dwarf_external_start_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.3149790763855,
				[2.0] = 4.7709794044495
			}
		},
		pwe_dwarf_external_which_way_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_which_way_a_01",
				"pwe_dwarf_external_which_way_a_02",
				"pwe_dwarf_external_which_way_a_03",
				"pwe_dwarf_external_which_way_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_which_way_a_01",
				"pwe_dwarf_external_which_way_a_02",
				"pwe_dwarf_external_which_way_a_03",
				"pwe_dwarf_external_which_way_a_04"
			},
			sound_events_duration = {
				3.4690001010895,
				2.5599792003632,
				5.8839793205261,
				2.9900000095367
			}
		},
		pwe_dwarf_external_which_way_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_exterior",
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
				"pwe_dwarf_external_which_way_c_01",
				"pwe_dwarf_external_which_way_c_02",
				"pwe_dwarf_external_which_way_c_03",
				"pwe_dwarf_external_which_way_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_dwarf_external_which_way_c_01",
				"pwe_dwarf_external_which_way_c_02",
				"pwe_dwarf_external_which_way_c_03",
				"pwe_dwarf_external_which_way_c_04"
			},
			sound_events_duration = {
				2.7969791889191,
				3.6809792518616,
				1.9889792203903,
				5.2379789352417
			}
		}
	})
end
