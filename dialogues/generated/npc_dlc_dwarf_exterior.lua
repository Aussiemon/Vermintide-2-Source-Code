return function ()
	define_rule({
		response = "nde_dwarf_beacons_bridge_stuck_a",
		name = "nde_dwarf_beacons_bridge_stuck_a",
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
				"dwarf_beacons_bridge_stuck_a"
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
		response = "nde_dwarf_external_begin_end_event_a",
		name = "nde_dwarf_external_begin_end_event_a",
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
				"dwarf_external_begin_end_event_a"
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
		response = "nde_dwarf_external_bomb_cart",
		name = "nde_dwarf_external_bomb_cart",
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
				"dwarf_external_bomb_cart"
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
		response = "nde_dwarf_external_bomb_cart_blocked",
		name = "nde_dwarf_external_bomb_cart_blocked",
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
				"dwarf_external_bomb_cart_blocked"
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
		response = "nde_dwarf_external_cart_door",
		name = "nde_dwarf_external_cart_door",
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
				"dwarf_external_cart_door"
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
		response = "nde_dwarf_external_elevator_briefing_b",
		name = "nde_dwarf_external_elevator_briefing_b",
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
				"dwarf_external_elevator_briefing_a"
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
		response = "nde_dwarf_external_end_event_complete_01_a",
		name = "nde_dwarf_external_end_event_complete_01_a",
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
				"dwarf_external_end_event_complete_a"
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
		response = "nde_dwarf_external_end_event_complete_02_a",
		name = "nde_dwarf_external_end_event_complete_02_a",
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
				"dwarf_external_end_event_complete_a"
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
		response = "nde_dwarf_external_end_event_complete_03_a",
		name = "nde_dwarf_external_end_event_complete_03_a",
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
				"dwarf_external_end_event_complete_a"
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
		response = "nde_dwarf_external_event_almost",
		name = "nde_dwarf_external_event_almost",
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
				"dwarf_external_event_almost"
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
		response = "nde_dwarf_external_event_good_start",
		name = "nde_dwarf_external_event_good_start",
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
				"dwarf_external_event_good_start"
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
		response = "nde_dwarf_external_event_reminder_a",
		name = "nde_dwarf_external_event_reminder_a",
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
				"dwarf_external_event_reminder_a"
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
		response = "nde_dwarf_external_frozen_river",
		name = "nde_dwarf_external_frozen_river",
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
				"dwarf_external_frozen_river"
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
		response = "nde_dwarf_external_get_out",
		name = "nde_dwarf_external_get_out",
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
				"dwarf_external_get_out"
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
		response = "nde_dwarf_external_ghost_town_b",
		name = "nde_dwarf_external_ghost_town_b",
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
				"dwarf_external_ghost_town_a"
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
		response = "nde_dwarf_external_mid_conversation_b",
		name = "nde_dwarf_external_mid_conversation_b",
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
				"dwarf_external_mid_conversation_a"
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
		response = "nde_dwarf_external_mid_conversation_no_bardin_b",
		name = "nde_dwarf_external_mid_conversation_no_bardin_b",
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
				"dwarf_external_mid_conversation_no_bardin_a"
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
		response = "nde_dwarf_external_migdahl_b",
		name = "nde_dwarf_external_migdahl_b",
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
				"dwarf_external_migdahl_a"
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
		name = "nde_dwarf_external_nearly_there_a",
		response = "nde_dwarf_external_nearly_there_a",
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
				"dwarf_external_nearly_there_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer"
			},
			{
				"user_memory",
				"dwarf_external_nearly_there_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_external_nearly_there_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nde_dwarf_external_safety_b",
		name = "nde_dwarf_external_safety_b",
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
				"dwarf_external_safety_a"
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
		name = "nde_dwarf_external_start_banter_a",
		response = "nde_dwarf_external_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_external_start_banter_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer"
			},
			{
				"user_memory",
				"dwarf_external_start_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_external_start_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nde_dwarf_external_start_banter_b",
		name = "nde_dwarf_external_start_banter_b",
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
				"dwarf_engineer"
			}
		}
	})
	define_rule({
		response = "nde_dwarf_external_start_banter_c",
		name = "nde_dwarf_external_start_banter_c",
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
				"dwarf_engineer"
			}
		}
	})
	define_rule({
		response = "nde_dwarf_external_which_way_b",
		name = "nde_dwarf_external_which_way_b",
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
				"dwarf_external_which_way_a"
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
		response = "nde_dwarf_external_wyr_migdahl_a",
		name = "nde_dwarf_external_wyr_migdahl_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_external_wyr_migdahl_a"
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
		response = "nde_dwarf_external_wyr_migdahl_c",
		name = "nde_dwarf_external_wyr_migdahl_c",
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
				"dwarf_external_wyr_migdahl_b"
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
		response = "nik_dwarf_external_bomb_cart",
		name = "nik_dwarf_external_bomb_cart",
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
				"dwarf_external_bomb_cart"
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
		response = "nik_dwarf_external_bomb_cart_blocked",
		name = "nik_dwarf_external_bomb_cart_blocked",
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
				"dwarf_external_bomb_cart_blocked"
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
		response = "nik_dwarf_external_cart_door",
		name = "nik_dwarf_external_cart_door",
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
				"dwarf_external_cart_door"
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
		response = "nik_dwarf_external_elevator_briefing_d",
		name = "nik_dwarf_external_elevator_briefing_d",
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
				"dwarf_external_elevator_briefing_c"
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
		response = "nik_dwarf_external_event_almost",
		name = "nik_dwarf_external_event_almost",
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
				"dwarf_external_event_almost"
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
		response = "nik_dwarf_external_event_good_start",
		name = "nik_dwarf_external_event_good_start",
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
				"dwarf_external_event_good_start"
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
		response = "nik_dwarf_external_event_reminder_a",
		name = "nik_dwarf_external_event_reminder_a",
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
				"dwarf_external_event_reminder_a"
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
		response = "nik_dwarf_external_frozen_river",
		name = "nik_dwarf_external_frozen_river",
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
				"dwarf_external_frozen_river"
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
		response = "nik_dwarf_external_get_out",
		name = "nik_dwarf_external_get_out",
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
				"dwarf_external_get_out"
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
		response = "nik_dwarf_external_ghost_town_b",
		name = "nik_dwarf_external_ghost_town_b",
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
				"dwarf_external_ghost_town_a"
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
		response = "nik_dwarf_external_mid_conversation_no_bardin_a",
		name = "nik_dwarf_external_mid_conversation_no_bardin_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_external_mid_conversation_a"
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
			}
		}
	})
	define_rule({
		response = "nik_dwarf_external_mid_conversation_no_bardin_c",
		name = "nik_dwarf_external_mid_conversation_no_bardin_c",
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
				"dwarf_external_mid_conversation_no_bardin_b"
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
		name = "nik_dwarf_external_start_banter_a",
		response = "nik_dwarf_external_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_external_start_banter_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"dwarf_external_start_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"dwarf_external_start_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nik_dwarf_external_start_banter_b",
		name = "nik_dwarf_external_start_banter_b",
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
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_dwarf_external_start_banter_c",
		name = "nik_dwarf_external_start_banter_c",
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
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_dwarf_external_which_way_b",
		name = "nik_dwarf_external_which_way_b",
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
				"dwarf_external_which_way_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	add_dialogues({
		nde_dwarf_beacons_bridge_stuck_a = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "npc_dlc_dwarf_exterior",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
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
			localization_strings = {
				"nde_dwarf_beacons_bridge_stuck_a_01",
				"nde_dwarf_beacons_bridge_stuck_a_02",
				"nde_dwarf_beacons_bridge_stuck_a_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_beacons_bridge_stuck_a_01",
				"nde_dwarf_beacons_bridge_stuck_a_02",
				"nde_dwarf_beacons_bridge_stuck_a_04"
			},
			sound_events_duration = {
				4.0460000038147,
				2.4509999752045,
				2.4920001029968
			}
		},
		nde_dwarf_external_begin_end_event_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_begin_end_event_a_01",
				"nde_dwarf_external_begin_end_event_a_02",
				"nde_dwarf_external_begin_end_event_a_03",
				"nde_dwarf_external_begin_end_event_a_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_external_begin_end_event_a_01",
				"nde_dwarf_external_begin_end_event_a_02",
				"nde_dwarf_external_begin_end_event_a_03",
				"nde_dwarf_external_begin_end_event_a_04"
			},
			sound_events_duration = {
				2.9030001163483,
				3.1340000629425,
				6.8779997825623,
				3.8959999084473
			}
		},
		nde_dwarf_external_bomb_cart = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_bomb_cart_01",
				"nde_dwarf_external_bomb_cart_02",
				"nde_dwarf_external_bomb_cart_03",
				"nde_dwarf_external_bomb_cart_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_bomb_cart_01",
				"nde_dwarf_external_bomb_cart_02",
				"nde_dwarf_external_bomb_cart_03",
				"nde_dwarf_external_bomb_cart_04"
			},
			sound_events_duration = {
				5.9039998054504,
				5.0339999198914,
				5.0859999656677,
				4.6680002212524
			}
		},
		nde_dwarf_external_bomb_cart_blocked = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_bomb_cart_blocked_01",
				"nde_dwarf_external_bomb_cart_blocked_02",
				"nde_dwarf_external_bomb_cart_blocked_03",
				"nde_dwarf_external_bomb_cart_blocked_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_bomb_cart_blocked_01",
				"nde_dwarf_external_bomb_cart_blocked_02",
				"nde_dwarf_external_bomb_cart_blocked_03",
				"nde_dwarf_external_bomb_cart_blocked_04"
			},
			sound_events_duration = {
				3.4140000343323,
				5.1890001296997,
				4.3020000457764,
				7.4389791488647
			}
		},
		nde_dwarf_external_cart_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_cart_door_01",
				"nde_dwarf_external_cart_door_02",
				"nde_dwarf_external_cart_door_03",
				"nde_dwarf_external_cart_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_cart_door_01",
				"nde_dwarf_external_cart_door_02",
				"nde_dwarf_external_cart_door_03",
				"nde_dwarf_external_cart_door_04"
			},
			sound_events_duration = {
				1.9299999475479,
				2.1909999847412,
				1.9400000572205,
				3.1240000724792
			}
		},
		nde_dwarf_external_elevator_briefing_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nde_dwarf_external_elevator_briefing_b_01",
				"nde_dwarf_external_elevator_briefing_b_02",
				"nde_dwarf_external_elevator_briefing_b_03",
				"nde_dwarf_external_elevator_briefing_b_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_external_elevator_briefing_b_01",
				"nde_dwarf_external_elevator_briefing_b_02",
				"nde_dwarf_external_elevator_briefing_b_03",
				"nde_dwarf_external_elevator_briefing_b_04"
			},
			sound_events_duration = {
				5.6810002326965,
				8.758978843689,
				6.1259999275208,
				8.620979309082
			}
		},
		nde_dwarf_external_end_event_complete_01_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "npc_dlc_dwarf_exterior",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "nde_dwarf_external_end_event_complete_01_a_01"
			},
			sound_distance = math.huge,
			sound_events = {
				[1.0] = "nde_dwarf_external_end_event_complete_01_a_01"
			},
			sound_events_duration = {
				[1.0] = 2.6930000782013
			}
		},
		nde_dwarf_external_end_event_complete_02_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_exterior",
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
				[1.0] = "nde_dwarf_external_end_event_complete_02_a_01",
				[2.0] = "nde_dwarf_external_end_event_complete_02_a_02"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1.0] = "nde_dwarf_external_end_event_complete_02_a_01",
				[2.0] = "nde_dwarf_external_end_event_complete_02_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.5479791164398,
				[2.0] = 5.8899998664856
			}
		},
		nde_dwarf_external_end_event_complete_03_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_exterior",
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
				[1.0] = "nde_dwarf_external_end_event_complete_03_a_01",
				[2.0] = "nde_dwarf_external_end_event_complete_03_a_02"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1.0] = "nde_dwarf_external_end_event_complete_03_a_01",
				[2.0] = "nde_dwarf_external_end_event_complete_03_a_02"
			},
			sound_events_duration = {
				[1.0] = 4.9679999351502,
				[2.0] = 4.8990001678467
			}
		},
		nde_dwarf_external_event_almost = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_event_almost_01",
				"nde_dwarf_external_event_almost_02",
				"nde_dwarf_external_event_almost_03",
				"nde_dwarf_external_event_almost_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_event_almost_01",
				"nde_dwarf_external_event_almost_02",
				"nde_dwarf_external_event_almost_03",
				"nde_dwarf_external_event_almost_04"
			},
			sound_events_duration = {
				2.9019999504089,
				2.6040000915527,
				1.3439999818802,
				2.3150000572205
			}
		},
		nde_dwarf_external_event_good_start = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_event_good_start_01",
				"nde_dwarf_external_event_good_start_02",
				"nde_dwarf_external_event_good_start_03",
				"nde_dwarf_external_event_good_start_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_event_good_start_01",
				"nde_dwarf_external_event_good_start_02",
				"nde_dwarf_external_event_good_start_03",
				"nde_dwarf_external_event_good_start_04"
			},
			sound_events_duration = {
				2.8469998836517,
				2.6180000305176,
				2.1500000953674,
				2.9539999961853
			}
		},
		nde_dwarf_external_event_reminder_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_event_reminder_a_01",
				"nde_dwarf_external_event_reminder_a_02",
				"nde_dwarf_external_event_reminder_a_03",
				"nde_dwarf_external_event_reminder_a_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_external_event_reminder_a_01",
				"nde_dwarf_external_event_reminder_a_02",
				"nde_dwarf_external_event_reminder_a_03",
				"nde_dwarf_external_event_reminder_a_04"
			},
			sound_events_duration = {
				3.0810000896454,
				2.7190001010895,
				4.893000125885,
				4.6209998130798
			}
		},
		nde_dwarf_external_frozen_river = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nde_dwarf_external_frozen_river_01",
				"nde_dwarf_external_frozen_river_02",
				"nde_dwarf_external_frozen_river_03",
				"nde_dwarf_external_frozen_river_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_frozen_river_01",
				"nde_dwarf_external_frozen_river_02",
				"nde_dwarf_external_frozen_river_03",
				"nde_dwarf_external_frozen_river_04"
			},
			sound_events_duration = {
				3.0969998836517,
				2.1110000610352,
				3.3840000629425,
				3.6459999084473
			}
		},
		nde_dwarf_external_get_out = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nde_dwarf_external_get_out_01",
				"nde_dwarf_external_get_out_02",
				"nde_dwarf_external_get_out_03",
				"nde_dwarf_external_get_out_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_get_out_01",
				"nde_dwarf_external_get_out_02",
				"nde_dwarf_external_get_out_03",
				"nde_dwarf_external_get_out_04"
			},
			sound_events_duration = {
				2.2590000629425,
				4.0120000839233,
				2.1710000038147,
				2.8039999008179
			}
		},
		nde_dwarf_external_ghost_town_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_ghost_town_b_01",
				"nde_dwarf_external_ghost_town_b_02",
				"nde_dwarf_external_ghost_town_b_03",
				"nde_dwarf_external_ghost_town_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_ghost_town_b_01",
				"nde_dwarf_external_ghost_town_b_02",
				"nde_dwarf_external_ghost_town_b_03",
				"nde_dwarf_external_ghost_town_b_04"
			},
			sound_events_duration = {
				5.4790000915527,
				5.7789998054504,
				6.6599793434143,
				3.2509791851044
			}
		},
		nde_dwarf_external_mid_conversation_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_mid_conversation_b_01",
				"nde_dwarf_external_mid_conversation_b_02",
				"nde_dwarf_external_mid_conversation_b_03",
				"nde_dwarf_external_mid_conversation_b_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_external_mid_conversation_b_01",
				"nde_dwarf_external_mid_conversation_b_02",
				"nde_dwarf_external_mid_conversation_b_03",
				"nde_dwarf_external_mid_conversation_b_04"
			},
			sound_events_duration = {
				6.539999961853,
				4.8420000076294,
				4.1380000114441,
				5.6779999732971
			}
		},
		nde_dwarf_external_mid_conversation_no_bardin_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_mid_conversation_no_bardin_b_01",
				"nde_dwarf_external_mid_conversation_no_bardin_b_02",
				"nde_dwarf_external_mid_conversation_no_bardin_b_03",
				"nde_dwarf_external_mid_conversation_no_bardin_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_mid_conversation_no_bardin_b_01",
				"nde_dwarf_external_mid_conversation_no_bardin_b_02",
				"nde_dwarf_external_mid_conversation_no_bardin_b_03",
				"nde_dwarf_external_mid_conversation_no_bardin_b_04"
			},
			sound_events_duration = {
				4.4169998168945,
				3.3149790763855,
				4.4460000991821,
				3.6380000114441
			}
		},
		nde_dwarf_external_migdahl_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_migdahl_b_01",
				"nde_dwarf_external_migdahl_b_02",
				"nde_dwarf_external_migdahl_b_03",
				"nde_dwarf_external_migdahl_b_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_external_migdahl_b_01",
				"nde_dwarf_external_migdahl_b_02",
				"nde_dwarf_external_migdahl_b_03",
				"nde_dwarf_external_migdahl_b_04"
			},
			sound_events_duration = {
				3.2109999656677,
				3.8699998855591,
				3.2090001106262,
				4.4920001029968
			}
		},
		nde_dwarf_external_nearly_there_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_nearly_there_a_01",
				"nde_dwarf_external_nearly_there_a_02",
				"nde_dwarf_external_nearly_there_a_03",
				"nde_dwarf_external_nearly_there_a_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_external_nearly_there_a_01",
				"nde_dwarf_external_nearly_there_a_02",
				"nde_dwarf_external_nearly_there_a_03",
				"nde_dwarf_external_nearly_there_a_04"
			},
			sound_events_duration = {
				5.066999912262,
				3.1570000648499,
				2.9649999141693,
				5.9580001831055
			}
		},
		nde_dwarf_external_safety_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_safety_b_01",
				"nde_dwarf_external_safety_b_02",
				"nde_dwarf_external_safety_b_03",
				"nde_dwarf_external_safety_b_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_external_safety_b_01",
				"nde_dwarf_external_safety_b_02",
				"nde_dwarf_external_safety_b_03",
				"nde_dwarf_external_safety_b_04"
			},
			sound_events_duration = {
				5.0250000953674,
				5.8809790611267,
				5.3499794006348,
				3.3389792442322
			}
		},
		nde_dwarf_external_start_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_exterior",
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
				[1.0] = "nde_dwarf_external_start_banter_a_01",
				[2.0] = "nde_dwarf_external_start_banter_a_02"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1.0] = "nde_dwarf_external_start_banter_a_01",
				[2.0] = "nde_dwarf_external_start_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.4030001163483,
				[2.0] = 4.8369998931885
			}
		},
		nde_dwarf_external_start_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_exterior",
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
				[1.0] = "nde_dwarf_external_start_banter_b_01",
				[2.0] = "nde_dwarf_external_start_banter_b_02"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1.0] = "nde_dwarf_external_start_banter_b_01",
				[2.0] = "nde_dwarf_external_start_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.3909997940064,
				[2.0] = 4.8550000190735
			}
		},
		nde_dwarf_external_start_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_exterior",
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
				[1.0] = "nde_dwarf_external_start_banter_c_01",
				[2.0] = "nde_dwarf_external_start_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "nde_dwarf_external_start_banter_c_01",
				[2.0] = "nde_dwarf_external_start_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 2.1019999980927,
				[2.0] = 4.4270000457764
			}
		},
		nde_dwarf_external_which_way_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_which_way_b_01",
				"nde_dwarf_external_which_way_b_02",
				"nde_dwarf_external_which_way_b_03",
				"nde_dwarf_external_which_way_b_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_external_which_way_b_01",
				"nde_dwarf_external_which_way_b_02",
				"nde_dwarf_external_which_way_b_03",
				"nde_dwarf_external_which_way_b_04"
			},
			sound_events_duration = {
				4.7300000190735,
				3.3670001029968,
				3.7899792194366,
				2.4289999008179
			}
		},
		nde_dwarf_external_wyr_migdahl_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_wyr_migdahl_a_01",
				"nde_dwarf_external_wyr_migdahl_a_02",
				"nde_dwarf_external_wyr_migdahl_a_03",
				"nde_dwarf_external_wyr_migdahl_a_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_external_wyr_migdahl_a_01",
				"nde_dwarf_external_wyr_migdahl_a_02",
				"nde_dwarf_external_wyr_migdahl_a_03",
				"nde_dwarf_external_wyr_migdahl_a_04"
			},
			sound_events_duration = {
				7.0479998588562,
				3.885999917984,
				5.669979095459,
				3.0810000896454
			}
		},
		nde_dwarf_external_wyr_migdahl_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nde_dwarf_external_wyr_migdahl_c_01",
				"nde_dwarf_external_wyr_migdahl_c_02",
				"nde_dwarf_external_wyr_migdahl_c_03",
				"nde_dwarf_external_wyr_migdahl_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_external_wyr_migdahl_c_01",
				"nde_dwarf_external_wyr_migdahl_c_02",
				"nde_dwarf_external_wyr_migdahl_c_03",
				"nde_dwarf_external_wyr_migdahl_c_04"
			},
			sound_events_duration = {
				2.6710000038147,
				2.3139998912811,
				1.7589999437332,
				2.8610000610352
			}
		},
		nik_dwarf_external_bomb_cart = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_bomb_cart_01",
				"nik_dwarf_external_bomb_cart_02",
				"nik_dwarf_external_bomb_cart_03",
				"nik_dwarf_external_bomb_cart_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_bomb_cart_01",
				"nik_dwarf_external_bomb_cart_02",
				"nik_dwarf_external_bomb_cart_03",
				"nik_dwarf_external_bomb_cart_04"
			},
			sound_events_duration = {
				3.8479790687561,
				5.0459790229797,
				4.4529790878296,
				6.2569789886475
			}
		},
		nik_dwarf_external_bomb_cart_blocked = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_bomb_cart_blocked_01",
				"nik_dwarf_external_bomb_cart_blocked_02",
				"nik_dwarf_external_bomb_cart_blocked_03",
				"nik_dwarf_external_bomb_cart_blocked_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_bomb_cart_blocked_01",
				"nik_dwarf_external_bomb_cart_blocked_02",
				"nik_dwarf_external_bomb_cart_blocked_03",
				"nik_dwarf_external_bomb_cart_blocked_04"
			},
			sound_events_duration = {
				7.438000202179,
				4.2639999389648,
				5.4629998207092,
				4.9959998130798
			}
		},
		nik_dwarf_external_cart_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_cart_door_01",
				"nik_dwarf_external_cart_door_02",
				"nik_dwarf_external_cart_door_03",
				"nik_dwarf_external_cart_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_cart_door_01",
				"nik_dwarf_external_cart_door_02",
				"nik_dwarf_external_cart_door_03",
				"nik_dwarf_external_cart_door_04"
			},
			sound_events_duration = {
				4.1689791679382,
				1.9110000133514,
				3.4130001068115,
				5.103000164032
			}
		},
		nik_dwarf_external_elevator_briefing_d = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nik_dwarf_external_elevator_briefing_d_01",
				"nik_dwarf_external_elevator_briefing_d_02",
				"nik_dwarf_external_elevator_briefing_d_03",
				"nik_dwarf_external_elevator_briefing_d_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_elevator_briefing_d_01",
				"nik_dwarf_external_elevator_briefing_d_02",
				"nik_dwarf_external_elevator_briefing_d_03",
				"nik_dwarf_external_elevator_briefing_d_04"
			},
			sound_events_duration = {
				5.0009789466858,
				4.6549792289734,
				4.0370001792908,
				3.6519792079926
			}
		},
		nik_dwarf_external_event_almost = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_event_almost_01",
				"nik_dwarf_external_event_almost_02",
				"nik_dwarf_external_event_almost_03",
				"nik_dwarf_external_event_almost_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_event_almost_01",
				"nik_dwarf_external_event_almost_02",
				"nik_dwarf_external_event_almost_03",
				"nik_dwarf_external_event_almost_04"
			},
			sound_events_duration = {
				3.7279999256134,
				2.8450000286102,
				2.3949999809265,
				3.0090000629425
			}
		},
		nik_dwarf_external_event_good_start = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_event_good_start_01",
				"nik_dwarf_external_event_good_start_02",
				"nik_dwarf_external_event_good_start_03",
				"nik_dwarf_external_event_good_start_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_event_good_start_01",
				"nik_dwarf_external_event_good_start_02",
				"nik_dwarf_external_event_good_start_03",
				"nik_dwarf_external_event_good_start_04"
			},
			sound_events_duration = {
				4.018000125885,
				2.2260000705719,
				2.6670000553131,
				4.8759999275208
			}
		},
		nik_dwarf_external_event_reminder_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_event_reminder_a_01",
				"nik_dwarf_external_event_reminder_a_02",
				"nik_dwarf_external_event_reminder_a_03",
				"nik_dwarf_external_event_reminder_a_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_dwarf_external_event_reminder_a_01",
				"nik_dwarf_external_event_reminder_a_02",
				"nik_dwarf_external_event_reminder_a_03",
				"nik_dwarf_external_event_reminder_a_04"
			},
			sound_events_duration = {
				3.0590000152588,
				3.4570000171661,
				3.9800000190735,
				5.0209794044495
			}
		},
		nik_dwarf_external_frozen_river = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nik_dwarf_external_frozen_river_01",
				"nik_dwarf_external_frozen_river_02",
				"nik_dwarf_external_frozen_river_03",
				"nik_dwarf_external_frozen_river_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_frozen_river_01",
				"nik_dwarf_external_frozen_river_02",
				"nik_dwarf_external_frozen_river_03",
				"nik_dwarf_external_frozen_river_04"
			},
			sound_events_duration = {
				2.6370000839233,
				4.540979385376,
				5.8340001106262,
				4.0999794006348
			}
		},
		nik_dwarf_external_get_out = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nik_dwarf_external_get_out_01",
				"nik_dwarf_external_get_out_02",
				"nik_dwarf_external_get_out_03",
				"nik_dwarf_external_get_out_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_get_out_01",
				"nik_dwarf_external_get_out_02",
				"nik_dwarf_external_get_out_03",
				"nik_dwarf_external_get_out_04"
			},
			sound_events_duration = {
				3.3849792480469,
				4.2579998970032,
				5.4749794006348,
				3.8659791946411
			}
		},
		nik_dwarf_external_ghost_town_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_ghost_town_b_01",
				"nik_dwarf_external_ghost_town_b_02",
				"nik_dwarf_external_ghost_town_b_03",
				"nik_dwarf_external_ghost_town_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_ghost_town_b_01",
				"nik_dwarf_external_ghost_town_b_02",
				"nik_dwarf_external_ghost_town_b_03",
				"nik_dwarf_external_ghost_town_b_04"
			},
			sound_events_duration = {
				6.919979095459,
				6.4979791641235,
				5.6399793624878,
				6.0999999046326
			}
		},
		nik_dwarf_external_mid_conversation_no_bardin_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_mid_conversation_no_bardin_a_01",
				"nik_dwarf_external_mid_conversation_no_bardin_a_02",
				"nik_dwarf_external_mid_conversation_no_bardin_a_03",
				"nik_dwarf_external_mid_conversation_no_bardin_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_mid_conversation_no_bardin_a_01",
				"nik_dwarf_external_mid_conversation_no_bardin_a_02",
				"nik_dwarf_external_mid_conversation_no_bardin_a_03",
				"nik_dwarf_external_mid_conversation_no_bardin_a_04"
			},
			sound_events_duration = {
				6.165979385376,
				6.1189789772034,
				6.6319789886475,
				5.5319790840149
			}
		},
		nik_dwarf_external_mid_conversation_no_bardin_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_mid_conversation_no_bardin_c_01",
				"nik_dwarf_external_mid_conversation_no_bardin_c_02",
				"nik_dwarf_external_mid_conversation_no_bardin_c_03",
				"nik_dwarf_external_mid_conversation_no_bardin_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_external_mid_conversation_no_bardin_c_01",
				"nik_dwarf_external_mid_conversation_no_bardin_c_02",
				"nik_dwarf_external_mid_conversation_no_bardin_c_03",
				"nik_dwarf_external_mid_conversation_no_bardin_c_04"
			},
			sound_events_duration = {
				4.0999999046326,
				6.2259793281555,
				4.2929792404175,
				6.0619792938232
			}
		},
		nik_dwarf_external_start_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_exterior",
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
				[1.0] = "nik_dwarf_external_start_banter_a_01",
				[2.0] = "nik_dwarf_external_start_banter_a_02"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1.0] = "nik_dwarf_external_start_banter_a_01",
				[2.0] = "nik_dwarf_external_start_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 4.0989999771118,
				[2.0] = 3.6709792613983
			}
		},
		nik_dwarf_external_start_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_exterior",
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
				[1.0] = "nik_dwarf_external_start_banter_b_01",
				[2.0] = "nik_dwarf_external_start_banter_b_02"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1.0] = "nik_dwarf_external_start_banter_b_01",
				[2.0] = "nik_dwarf_external_start_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 5.5949792861939,
				[2.0] = 7.4250001907349
			}
		},
		nik_dwarf_external_start_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_dwarf_exterior",
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
				[1.0] = "nik_dwarf_external_start_banter_c_01",
				[2.0] = "nik_dwarf_external_start_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "nik_dwarf_external_start_banter_c_01",
				[2.0] = "nik_dwarf_external_start_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.1279792785644,
				[2.0] = 4.7820000648499
			}
		},
		nik_dwarf_external_which_way_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_dwarf_exterior",
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
				"nik_dwarf_external_which_way_b_01",
				"nik_dwarf_external_which_way_b_02",
				"nik_dwarf_external_which_way_b_03",
				"nik_dwarf_external_which_way_b_04"
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_dwarf_external_which_way_b_01",
				"nik_dwarf_external_which_way_b_02",
				"nik_dwarf_external_which_way_b_03",
				"nik_dwarf_external_which_way_b_04"
			},
			sound_events_duration = {
				5.0709791183472,
				5.789999961853,
				3.7530000209808,
				4.1579790115356
			}
		}
	})
end
