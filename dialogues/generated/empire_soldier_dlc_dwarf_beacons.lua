return function ()
	define_rule({
		name = "pes_dummy_memory_trigger_beacons",
		response = "pes_dummy_memory_trigger_beacons",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dummy_memory_trigger_beacons"
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
				"dummy_memory_trigger_beacons",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dummy_memory_trigger_beacons",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_beacon_gas_b",
		response = "pes_dwarf_beacons_beacon_gas_b",
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
				"dwarf_beacons_beacon_gas_a"
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
				"dwarf_beacons_beacon_gas_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_beacon_gas_e",
		response = "pes_dwarf_beacons_beacon_gas_e",
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
				"dwarf_beacons_beacon_gas_d"
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
				"dwarf_beacons_beacon_gas_e",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_e",
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
		name = "pes_dwarf_beacons_beacon_lit",
		response = "pes_dwarf_beacons_beacon_lit",
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
				"dwarf_beacons_beacon_lit"
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
				"dwarf_beacons_beacon_lit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_beacon_lit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_bridge_down",
		response = "pes_dwarf_beacons_bridge_down",
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
				"dwarf_beacons_bridge_down"
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
				"dwarf_beacons_bridge_down",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_bridge_down",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_head_for_heights_a",
		response = "pes_dwarf_beacons_head_for_heights_a",
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
				"dwarf_beacons_head_for_heights_a"
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
				"dwarf_beacons_head_for_heights_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_head_for_heights_b",
		response = "pes_dwarf_beacons_head_for_heights_b",
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
				"dwarf_beacons_head_for_heights_a"
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
				"dwarf_beacons_head_for_heights_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_long_walk_b",
		response = "pes_dwarf_beacons_long_walk_b",
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
				"dwarf_beacons_long_walk_a"
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
				"dwarf_beacons_long_walk_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_long_walk_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_not_far",
		response = "pes_dwarf_beacons_not_far",
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
				"dwarf_beacons_not_far"
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
				"dwarf_beacons_not_far",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_not_far",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_outpost_empty_a",
		response = "pes_dwarf_beacons_outpost_empty_a",
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
				"dwarf_beacons_outpost_empty_a"
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
				"dwarf_beacons_outpost_empty_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_outpost_empty_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_over_the_mountain_c",
		response = "pes_dwarf_beacons_over_the_mountain_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_beacons_over_the_mountain_b_done"
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
				"dwarf_beacons_over_the_mountain_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_skaven_retreat_a",
		response = "pes_dwarf_beacons_skaven_retreat_a",
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
				"dwarf_beacons_skaven_retreat_a"
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
				"dwarf_beacons_skaven_retreat_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_skaven_retreat_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_dwarf_beacons_start_banter_a",
		response = "pes_dwarf_beacons_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_beacons_start_banter_a"
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
				"dwarf_beacons_start_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_start_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_dwarf_beacons_start_banter_b",
		name = "pes_dwarf_beacons_start_banter_b",
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
				"dwarf_beacons_start_banter_a"
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
		response = "pes_dwarf_beacons_start_banter_c",
		name = "pes_dwarf_beacons_start_banter_c",
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
				"dwarf_beacons_start_banter_b"
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
		name = "pes_dwarf_beacons_victory_b",
		response = "pes_dwarf_beacons_victory_b",
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
				"dwarf_beacons_victory_b"
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
				"dwarf_beacons_victory_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_victory_b",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pes_dummy_memory_trigger_beacons = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_dlc_dwarf_beacons",
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
		pes_dwarf_beacons_beacon_gas_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_beacon_gas_b_01",
				"pes_dwarf_beacons_beacon_gas_b_02",
				"pes_dwarf_beacons_beacon_gas_b_03",
				"pes_dwarf_beacons_beacon_gas_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_beacon_gas_b_01",
				"pes_dwarf_beacons_beacon_gas_b_02",
				"pes_dwarf_beacons_beacon_gas_b_03",
				"pes_dwarf_beacons_beacon_gas_b_04"
			},
			sound_events_duration = {
				3.2119791507721,
				1.8930000066757,
				2.8159792423248,
				2.6489791870117
			}
		},
		pes_dwarf_beacons_beacon_gas_e = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_beacon_gas_e_01",
				"pes_dwarf_beacons_beacon_gas_e_02",
				"pes_dwarf_beacons_beacon_gas_e_03",
				"pes_dwarf_beacons_beacon_gas_e_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_beacon_gas_e_01",
				"pes_dwarf_beacons_beacon_gas_e_02",
				"pes_dwarf_beacons_beacon_gas_e_03",
				"pes_dwarf_beacons_beacon_gas_e_04"
			},
			sound_events_duration = {
				1.8489791154861,
				2.5490000247955,
				3.4969999790192,
				3.5439999103546
			}
		},
		pes_dwarf_beacons_beacon_lit = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_beacon_lit_01",
				"pes_dwarf_beacons_beacon_lit_02",
				"pes_dwarf_beacons_beacon_lit_03",
				"pes_dwarf_beacons_beacon_lit_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_beacon_lit_01",
				"pes_dwarf_beacons_beacon_lit_02",
				"pes_dwarf_beacons_beacon_lit_03",
				"pes_dwarf_beacons_beacon_lit_04"
			},
			sound_events_duration = {
				4.0549793243408,
				2.7909791469574,
				4.5009999275208,
				3.2719790935516
			}
		},
		pes_dwarf_beacons_bridge_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_bridge_down_01",
				"pes_dwarf_beacons_bridge_down_02",
				"pes_dwarf_beacons_bridge_down_03",
				"pes_dwarf_beacons_bridge_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_bridge_down_01",
				"pes_dwarf_beacons_bridge_down_02",
				"pes_dwarf_beacons_bridge_down_03",
				"pes_dwarf_beacons_bridge_down_04"
			},
			sound_events_duration = {
				1.5449999570847,
				2.5149791240692,
				1.1560000181198,
				3.5299792289734
			}
		},
		pes_dwarf_beacons_head_for_heights_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				[1.0] = "pes_dwarf_beacons_head_for_heights_a_01",
				[2.0] = "pes_dwarf_beacons_head_for_heights_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_beacons_head_for_heights_a_01",
				[2.0] = "pes_dwarf_beacons_head_for_heights_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.1470000743866,
				[2.0] = 2.9579792022705
			}
		},
		pes_dwarf_beacons_head_for_heights_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				[1.0] = "pes_dwarf_beacons_head_for_heights_b_01",
				[2.0] = "pes_dwarf_beacons_head_for_heights_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_beacons_head_for_heights_b_01",
				[2.0] = "pes_dwarf_beacons_head_for_heights_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.680999994278,
				[2.0] = 2.0969791412353
			}
		},
		pes_dwarf_beacons_long_walk_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_long_walk_b_01",
				"pes_dwarf_beacons_long_walk_b_02",
				"pes_dwarf_beacons_long_walk_b_03",
				"pes_dwarf_beacons_long_walk_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_long_walk_b_01",
				"pes_dwarf_beacons_long_walk_b_02",
				"pes_dwarf_beacons_long_walk_b_03",
				"pes_dwarf_beacons_long_walk_b_04"
			},
			sound_events_duration = {
				2.9329791069031,
				2.2739999294281,
				3.2490000724792,
				3.9879999160767
			}
		},
		pes_dwarf_beacons_not_far = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_not_far_01",
				"pes_dwarf_beacons_not_far_02",
				"pes_dwarf_beacons_not_far_03",
				"pes_dwarf_beacons_not_far_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_not_far_01",
				"pes_dwarf_beacons_not_far_02",
				"pes_dwarf_beacons_not_far_03",
				"pes_dwarf_beacons_not_far_04"
			},
			sound_events_duration = {
				3.1769790649414,
				2.6999790668488,
				3.8339791297913,
				2.948979139328
			}
		},
		pes_dwarf_beacons_outpost_empty_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_outpost_empty_a_01",
				"pes_dwarf_beacons_outpost_empty_a_02",
				"pes_dwarf_beacons_outpost_empty_a_03",
				"pes_dwarf_beacons_outpost_empty_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_outpost_empty_a_01",
				"pes_dwarf_beacons_outpost_empty_a_02",
				"pes_dwarf_beacons_outpost_empty_a_03",
				"pes_dwarf_beacons_outpost_empty_a_04"
			},
			sound_events_duration = {
				2.8029792308807,
				4.5789790153503,
				3.3679790496826,
				1.9439791440964
			}
		},
		pes_dwarf_beacons_over_the_mountain_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_over_the_mountain_c_01",
				"pes_dwarf_beacons_over_the_mountain_c_02",
				"pes_dwarf_beacons_over_the_mountain_c_03",
				"pes_dwarf_beacons_over_the_mountain_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_over_the_mountain_c_01",
				"pes_dwarf_beacons_over_the_mountain_c_02",
				"pes_dwarf_beacons_over_the_mountain_c_03",
				"pes_dwarf_beacons_over_the_mountain_c_04"
			},
			sound_events_duration = {
				2.3769791126251,
				3.0219790935516,
				2.7219791412353,
				2.2449791431427
			}
		},
		pes_dwarf_beacons_skaven_retreat_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_skaven_retreat_a_01",
				"pes_dwarf_beacons_skaven_retreat_a_02",
				"pes_dwarf_beacons_skaven_retreat_a_03",
				"pes_dwarf_beacons_skaven_retreat_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_skaven_retreat_a_01",
				"pes_dwarf_beacons_skaven_retreat_a_02",
				"pes_dwarf_beacons_skaven_retreat_a_03",
				"pes_dwarf_beacons_skaven_retreat_a_04"
			},
			sound_events_duration = {
				3.6199791431427,
				3.0009791851044,
				3.5299792289734,
				4.3069791793823
			}
		},
		pes_dwarf_beacons_start_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				[1.0] = "pes_dwarf_beacons_start_banter_a_01",
				[2.0] = "pes_dwarf_beacons_start_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_beacons_start_banter_a_01",
				[2.0] = "pes_dwarf_beacons_start_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.7339792251587,
				[2.0] = 5.5089793205261
			}
		},
		pes_dwarf_beacons_start_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				[1.0] = "pes_dwarf_beacons_start_banter_b_01",
				[2.0] = "pes_dwarf_beacons_start_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_beacons_start_banter_b_01",
				[2.0] = "pes_dwarf_beacons_start_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 1.9900000095367,
				[2.0] = 2.4709792137146
			}
		},
		pes_dwarf_beacons_start_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				[1.0] = "pes_dwarf_beacons_start_banter_c_01",
				[2.0] = "pes_dwarf_beacons_start_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_dwarf_beacons_start_banter_c_01",
				[2.0] = "pes_dwarf_beacons_start_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.9899792671204,
				[2.0] = 3.2449791431427
			}
		},
		pes_dwarf_beacons_victory_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_dwarf_beacons",
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
				"pes_dwarf_beacons_victory_b_01",
				"pes_dwarf_beacons_victory_b_02",
				"pes_dwarf_beacons_victory_b_03",
				"pes_dwarf_beacons_victory_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_beacons_victory_b_01",
				"pes_dwarf_beacons_victory_b_02",
				"pes_dwarf_beacons_victory_b_03",
				"pes_dwarf_beacons_victory_b_04"
			},
			sound_events_duration = {
				3.1569790840149,
				4.4759793281555,
				3.75,
				4.5769791603088
			}
		}
	})
end
