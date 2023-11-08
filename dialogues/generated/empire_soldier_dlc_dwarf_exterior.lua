return function ()
	define_rule({
		name = "pes_dwarf_beacons_bridge_stuck_b",
		response = "pes_dwarf_beacons_bridge_stuck_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_begin_end_event_b",
		response = "pes_dwarf_external_begin_end_event_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_cliff",
		response = "pes_dwarf_external_cliff",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_elevator_briefing_a",
		response = "pes_dwarf_external_elevator_briefing_a",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_elevator_briefing_c",
		response = "pes_dwarf_external_elevator_briefing_c",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_end_event_complete_01_b",
		response = "pes_dwarf_external_end_event_complete_01_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_end_event_complete_02_b",
		response = "pes_dwarf_external_end_event_complete_02_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_end_event_complete_03_b",
		response = "pes_dwarf_external_end_event_complete_03_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_end_event_fuse_lit",
		response = "pes_dwarf_external_end_event_fuse_lit",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_event_reminder_b",
		response = "pes_dwarf_external_event_reminder_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_ghost_town_a",
		response = "pes_dwarf_external_ghost_town_a",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_mid_event_done",
		response = "pes_dwarf_external_mid_event_done",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_mid_event_seen",
		response = "pes_dwarf_external_mid_event_seen",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_migdahl_a",
		response = "pes_dwarf_external_migdahl_a",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_natural_beauty",
		response = "pes_dwarf_external_natural_beauty",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_nearly_there_b",
		response = "pes_dwarf_external_nearly_there_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_occupied_mine",
		response = "pes_dwarf_external_occupied_mine",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_safety_a",
		response = "pes_dwarf_external_safety_a",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_safety_c",
		response = "pes_dwarf_external_safety_c",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_skaven_works",
		response = "pes_dwarf_external_skaven_works",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_start_banter_a",
		response = "pes_dwarf_external_start_banter_a",
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
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
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
		response = "pes_dwarf_external_start_banter_b",
		name = "pes_dwarf_external_start_banter_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_dwarf_external_start_banter_c",
		name = "pes_dwarf_external_start_banter_c",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "pes_dwarf_external_which_way_a",
		response = "pes_dwarf_external_which_way_a",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_dwarf_external_which_way_c",
		response = "pes_dwarf_external_which_way_c",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		pes_dwarf_beacons_bridge_stuck_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_beacons_bridge_stuck_b_01",
				"pes_dwarf_beacons_bridge_stuck_b_02",
				"pes_dwarf_beacons_bridge_stuck_b_03",
				"pes_dwarf_beacons_bridge_stuck_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_bridge_stuck_b_01",
				"pes_dwarf_beacons_bridge_stuck_b_02",
				"pes_dwarf_beacons_bridge_stuck_b_03",
				"pes_dwarf_beacons_bridge_stuck_b_04"
			},
			sound_events_duration = {
				1.8309791088104,
				4.1609792709351,
				2.0579791069031,
				2.3149790763855
			}
		},
		pes_dwarf_external_begin_end_event_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_begin_end_event_b_01",
				"pes_dwarf_external_begin_end_event_b_02",
				"pes_dwarf_external_begin_end_event_b_03",
				"pes_dwarf_external_begin_end_event_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_begin_end_event_b_01",
				"pes_dwarf_external_begin_end_event_b_02",
				"pes_dwarf_external_begin_end_event_b_03",
				"pes_dwarf_external_begin_end_event_b_04"
			},
			sound_events_duration = {
				1.7289999723434,
				2.1370000839233,
				2.9549791812897,
				3.7880001068115
			}
		},
		pes_dwarf_external_cliff = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_cliff_01",
				"pes_dwarf_external_cliff_02",
				"pes_dwarf_external_cliff_03",
				"pes_dwarf_external_cliff_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_cliff_01",
				"pes_dwarf_external_cliff_02",
				"pes_dwarf_external_cliff_03",
				"pes_dwarf_external_cliff_04"
			},
			sound_events_duration = {
				3.5479791164398,
				3.3319792747498,
				2.2709791660309,
				2.7259790897369
			}
		},
		pes_dwarf_external_elevator_briefing_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_elevator_briefing_a_01",
				"pes_dwarf_external_elevator_briefing_a_02",
				"pes_dwarf_external_elevator_briefing_a_03",
				"pes_dwarf_external_elevator_briefing_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_elevator_briefing_a_01",
				"pes_dwarf_external_elevator_briefing_a_02",
				"pes_dwarf_external_elevator_briefing_a_03",
				"pes_dwarf_external_elevator_briefing_a_04"
			},
			sound_events_duration = {
				2.8619792461395,
				3.0539791584015,
				3.0969791412353,
				5.2559790611267
			}
		},
		pes_dwarf_external_elevator_briefing_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_elevator_briefing_c_01",
				"pes_dwarf_external_elevator_briefing_c_02",
				"pes_dwarf_external_elevator_briefing_c_03",
				"pes_dwarf_external_elevator_briefing_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_elevator_briefing_c_01",
				"pes_dwarf_external_elevator_briefing_c_02",
				"pes_dwarf_external_elevator_briefing_c_03",
				"pes_dwarf_external_elevator_briefing_c_04"
			},
			sound_events_duration = {
				2.129979133606,
				2.2339792251587,
				2.5939791202545,
				4.4349789619446
			}
		},
		pes_dwarf_external_end_event_complete_01_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				[1.0] = "pes_dwarf_external_end_event_complete_01_b_01",
				[2.0] = "pes_dwarf_external_end_event_complete_01_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_external_end_event_complete_01_b_01",
				[2.0] = "pes_dwarf_external_end_event_complete_01_b_02"
			},
			sound_events_duration = {
				[1.0] = 1.2280000448227,
				[2.0] = 2.1760001182556
			}
		},
		pes_dwarf_external_end_event_complete_02_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				[1.0] = "pes_dwarf_external_end_event_complete_02_b_01",
				[2.0] = "pes_dwarf_external_end_event_complete_02_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_external_end_event_complete_02_b_01",
				[2.0] = "pes_dwarf_external_end_event_complete_02_b_02"
			},
			sound_events_duration = {
				[1.0] = 3.6809792518616,
				[2.0] = 3.2320001125336
			}
		},
		pes_dwarf_external_end_event_complete_03_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				[1.0] = "pes_dwarf_external_end_event_complete_03_b_01",
				[2.0] = "pes_dwarf_external_end_event_complete_03_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_external_end_event_complete_03_b_01",
				[2.0] = "pes_dwarf_external_end_event_complete_03_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.2519791126251,
				[2.0] = 3.6809792518616
			}
		},
		pes_dwarf_external_end_event_fuse_lit = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_objective_skaven_tunnels_lighting_the_fuse_01",
				"pes_objective_skaven_tunnels_lighting_the_fuse_02",
				"pes_objective_skaven_tunnels_lighting_the_fuse_03",
				"pes_objective_skaven_tunnels_lighting_the_fuse_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_skaven_tunnels_lighting_the_fuse_01",
				"pes_objective_skaven_tunnels_lighting_the_fuse_02",
				"pes_objective_skaven_tunnels_lighting_the_fuse_03",
				"pes_objective_skaven_tunnels_lighting_the_fuse_04"
			},
			sound_events_duration = {
				1.5866874456406,
				2.0999999046326,
				2.1289792060852,
				0.60000002384186
			}
		},
		pes_dwarf_external_event_reminder_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_event_reminder_b_01",
				"pes_dwarf_external_event_reminder_b_02",
				"pes_dwarf_external_event_reminder_b_03",
				"pes_dwarf_external_event_reminder_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_event_reminder_b_01",
				"pes_dwarf_external_event_reminder_b_02",
				"pes_dwarf_external_event_reminder_b_03",
				"pes_dwarf_external_event_reminder_b_04"
			},
			sound_events_duration = {
				1.2130000591278,
				1.317999958992,
				1.0440000295639,
				2.6209790706634
			}
		},
		pes_dwarf_external_ghost_town_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_ghost_town_a_01",
				"pes_dwarf_external_ghost_town_a_02",
				"pes_dwarf_external_ghost_town_a_03",
				"pes_dwarf_external_ghost_town_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_ghost_town_a_01",
				"pes_dwarf_external_ghost_town_a_02",
				"pes_dwarf_external_ghost_town_a_03",
				"pes_dwarf_external_ghost_town_a_04"
			},
			sound_events_duration = {
				2.3489792346954,
				2.5409791469574,
				3.5039792060852,
				3.0409998893738
			}
		},
		pes_dwarf_external_mid_event_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_arena_ice_continue_01",
				"pes_arena_ice_continue_02",
				"pes_arena_ice_continue_03",
				"pes_arena_ice_continue_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_arena_ice_continue_01",
				"pes_arena_ice_continue_02",
				"pes_arena_ice_continue_03",
				"pes_arena_ice_continue_04"
			},
			sound_events_duration = {
				1.644770860672,
				1.2259374856949,
				1.5412291288376,
				1.7996666431427
			}
		},
		pes_dwarf_external_mid_event_seen = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_level_helmgart_military_portcullis_01",
				"pes_level_helmgart_military_portcullis_02",
				"pes_level_helmgart_military_portcullis_03",
				"pes_level_helmgart_military_portcullis_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_helmgart_military_portcullis_01",
				"pes_level_helmgart_military_portcullis_02",
				"pes_level_helmgart_military_portcullis_03",
				"pes_level_helmgart_military_portcullis_04"
			},
			sound_events_duration = {
				2.7540624141693,
				1.4147917032242,
				1.4601666927338,
				2.5481667518616
			}
		},
		pes_dwarf_external_migdahl_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_migdahl_a_01",
				"pes_dwarf_external_migdahl_a_02",
				"pes_dwarf_external_migdahl_a_03",
				"pes_dwarf_external_migdahl_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_migdahl_a_01",
				"pes_dwarf_external_migdahl_a_02",
				"pes_dwarf_external_migdahl_a_03",
				"pes_dwarf_external_migdahl_a_04"
			},
			sound_events_duration = {
				2.4639792442322,
				4.1729793548584,
				2.6379792690277,
				4.1509790420532
			}
		},
		pes_dwarf_external_natural_beauty = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_natural_beauty_01",
				"pes_dwarf_external_natural_beauty_02",
				"pes_dwarf_external_natural_beauty_03",
				"pes_dwarf_external_natural_beauty_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_natural_beauty_01",
				"pes_dwarf_external_natural_beauty_02",
				"pes_dwarf_external_natural_beauty_03",
				"pes_dwarf_external_natural_beauty_04"
			},
			sound_events_duration = {
				3.256979227066,
				5.245979309082,
				4.629979133606,
				2.147979259491
			}
		},
		pes_dwarf_external_nearly_there_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_nearly_there_b_01",
				"pes_dwarf_external_nearly_there_b_02",
				"pes_dwarf_external_nearly_there_b_03",
				"pes_dwarf_external_nearly_there_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_nearly_there_b_01",
				"pes_dwarf_external_nearly_there_b_02",
				"pes_dwarf_external_nearly_there_b_03",
				"pes_dwarf_external_nearly_there_b_04"
			},
			sound_events_duration = {
				2.4489998817444,
				2.4730000495911,
				3.5249791145325,
				3.1099791526794
			}
		},
		pes_dwarf_external_occupied_mine = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_occupied_mine_01",
				"pes_dwarf_external_occupied_mine_02",
				"pes_dwarf_external_occupied_mine_03",
				"pes_dwarf_external_occupied_mine_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_occupied_mine_01",
				"pes_dwarf_external_occupied_mine_02",
				"pes_dwarf_external_occupied_mine_03",
				"pes_dwarf_external_occupied_mine_04"
			},
			sound_events_duration = {
				2.9049792289734,
				3.3039791584015,
				3.9659790992737,
				4.2659792900085
			}
		},
		pes_dwarf_external_safety_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_safety_a_01",
				"pes_dwarf_external_safety_a_02",
				"pes_dwarf_external_safety_a_03",
				"pes_dwarf_external_safety_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_safety_a_01",
				"pes_dwarf_external_safety_a_02",
				"pes_dwarf_external_safety_a_03",
				"pes_dwarf_external_safety_a_04"
			},
			sound_events_duration = {
				2.26597905159,
				2.5569791793823,
				1.9899791479111,
				2.8209791183472
			}
		},
		pes_dwarf_external_safety_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_safety_c_01",
				"pes_dwarf_external_safety_c_02",
				"pes_dwarf_external_safety_c_03",
				"pes_dwarf_external_safety_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_safety_c_01",
				"pes_dwarf_external_safety_c_02",
				"pes_dwarf_external_safety_c_03",
				"pes_dwarf_external_safety_c_04"
			},
			sound_events_duration = {
				4.8779792785644,
				4.8089790344238,
				6.3539791107178,
				4.669979095459
			}
		},
		pes_dwarf_external_skaven_works = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_skaven_works_01",
				"pes_dwarf_external_skaven_works_02",
				"pes_dwarf_external_skaven_works_03",
				"pes_dwarf_external_skaven_works_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_skaven_works_01",
				"pes_dwarf_external_skaven_works_02",
				"pes_dwarf_external_skaven_works_03",
				"pes_dwarf_external_skaven_works_04"
			},
			sound_events_duration = {
				3.3939790725708,
				3.6859791278839,
				3.3879792690277,
				3.216979265213
			}
		},
		pes_dwarf_external_start_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				[1.0] = "pes_dwarf_external_start_banter_a_01",
				[2.0] = "pes_dwarf_external_start_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_external_start_banter_a_01",
				[2.0] = "pes_dwarf_external_start_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.6389791965485,
				[2.0] = 4.7689790725708
			}
		},
		pes_dwarf_external_start_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				[1.0] = "pes_dwarf_external_start_banter_b_01",
				[2.0] = "pes_dwarf_external_start_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_external_start_banter_b_01",
				[2.0] = "pes_dwarf_external_start_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.8439791202545,
				[2.0] = 4.620979309082
			}
		},
		pes_dwarf_external_start_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				[1.0] = "pes_dwarf_external_start_banter_c_01",
				[2.0] = "pes_dwarf_external_start_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_external_start_banter_c_01",
				[2.0] = "pes_dwarf_external_start_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.437979221344,
				[2.0] = 3.0669791698456
			}
		},
		pes_dwarf_external_which_way_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_which_way_a_01",
				"pes_dwarf_external_which_way_a_02",
				"pes_dwarf_external_which_way_a_03",
				"pes_dwarf_external_which_way_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_which_way_a_01",
				"pes_dwarf_external_which_way_a_02",
				"pes_dwarf_external_which_way_a_03",
				"pes_dwarf_external_which_way_a_04"
			},
			sound_events_duration = {
				2.8479790687561,
				3.3879792690277,
				6.624979019165,
				3.5119791030884
			}
		},
		pes_dwarf_external_which_way_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_exterior",
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
				"pes_dwarf_external_which_way_c_01",
				"pes_dwarf_external_which_way_c_02",
				"pes_dwarf_external_which_way_c_03",
				"pes_dwarf_external_which_way_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_external_which_way_c_01",
				"pes_dwarf_external_which_way_c_02",
				"pes_dwarf_external_which_way_c_03",
				"pes_dwarf_external_which_way_c_04"
			},
			sound_events_duration = {
				2.4469792842865,
				1.5180000066757,
				2.6050000190735,
				2.8939790725708
			}
		}
	})
end
