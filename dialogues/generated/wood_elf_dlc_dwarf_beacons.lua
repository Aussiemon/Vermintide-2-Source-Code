return function ()
	define_rule({
		name = "pwe_dwarf_beacons_start_banter_a",
		response = "pwe_dwarf_beacons_start_banter_a",
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
		response = "pwe_dwarf_beacons_start_banter_b",
		name = "pwe_dwarf_beacons_start_banter_b",
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
		response = "pwe_dwarf_beacons_start_banter_c",
		name = "pwe_dwarf_beacons_start_banter_c",
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
		name = "pwe_dwarf_beacons_long_walk_b",
		response = "pwe_dwarf_beacons_long_walk_b",
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
		name = "pwe_dwarf_beacons_outpost_empty_a",
		response = "pwe_dwarf_beacons_outpost_empty_a",
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
		name = "pwe_dwarf_beacons_bridge_down",
		response = "pwe_dwarf_beacons_bridge_down",
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
		name = "pwe_dwarf_beacons_beacon_gas_b",
		response = "pwe_dwarf_beacons_beacon_gas_b",
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
		name = "pwe_dwarf_beacons_beacon_gas_e",
		response = "pwe_dwarf_beacons_beacon_gas_e",
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
		name = "pwe_dwarf_beacons_over_the_mountain_c",
		response = "pwe_dwarf_beacons_over_the_mountain_c",
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
		name = "pwe_dwarf_beacons_head_for_heights_a",
		response = "pwe_dwarf_beacons_head_for_heights_a",
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
		name = "pwe_dwarf_beacons_head_for_heights_b",
		response = "pwe_dwarf_beacons_head_for_heights_b",
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
		name = "pwe_dwarf_beacons_not_far",
		response = "pwe_dwarf_beacons_not_far",
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
		name = "pwe_dwarf_beacons_beacon_lit",
		response = "pwe_dwarf_beacons_beacon_lit",
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
		name = "pwe_dwarf_beacons_victory_b",
		response = "pwe_dwarf_beacons_victory_b",
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
	define_rule({
		name = "pwe_dwarf_beacons_skaven_retreat_a",
		response = "pwe_dwarf_beacons_skaven_retreat_a",
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
		name = "pwe_dummy_memory_trigger_beacons",
		response = "pwe_dummy_memory_trigger_beacons",
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
	add_dialogues({
		pwe_dwarf_beacons_over_the_mountain_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_over_the_mountain_c_01",
				"pwe_dwarf_beacons_over_the_mountain_c_02",
				"pwe_dwarf_beacons_over_the_mountain_c_03",
				"pwe_dwarf_beacons_over_the_mountain_c_04"
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
				2.7029790878296,
				4.0710000991821,
				3.2209792137146,
				3.4639792442322
			},
			localization_strings = {
				"pwe_dwarf_beacons_over_the_mountain_c_01",
				"pwe_dwarf_beacons_over_the_mountain_c_02",
				"pwe_dwarf_beacons_over_the_mountain_c_03",
				"pwe_dwarf_beacons_over_the_mountain_c_04"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_beacon_gas_e = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_beacon_gas_e_01",
				"pwe_dwarf_beacons_beacon_gas_e_02",
				"pwe_dwarf_beacons_beacon_gas_e_03",
				"pwe_dwarf_beacons_beacon_gas_e_04"
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
				5.2239999771118,
				3.2649791240692,
				1.4699791669846,
				3.5359792709351
			},
			localization_strings = {
				"pwe_dwarf_beacons_beacon_gas_e_01",
				"pwe_dwarf_beacons_beacon_gas_e_02",
				"pwe_dwarf_beacons_beacon_gas_e_03",
				"pwe_dwarf_beacons_beacon_gas_e_04"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_victory_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_victory_b_01",
				"pwe_dwarf_beacons_victory_b_02",
				"pwe_dwarf_beacons_victory_b_03",
				"pwe_dwarf_beacons_victory_b_04"
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
				5.5469789505005,
				4.1829791069031,
				4.3769793510437,
				4.7759790420532
			},
			localization_strings = {
				"pwe_dwarf_beacons_victory_b_01",
				"pwe_dwarf_beacons_victory_b_02",
				"pwe_dwarf_beacons_victory_b_03",
				"pwe_dwarf_beacons_victory_b_04"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_long_walk_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_long_walk_b_01",
				"pwe_dwarf_beacons_long_walk_b_02",
				"pwe_dwarf_beacons_long_walk_b_03",
				"pwe_dwarf_beacons_long_walk_b_04"
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
				3.3509790897369,
				3.9479792118073,
				4.1169791221619,
				4.6739792823792
			},
			localization_strings = {
				"pwe_dwarf_beacons_long_walk_b_01",
				"pwe_dwarf_beacons_long_walk_b_02",
				"pwe_dwarf_beacons_long_walk_b_03",
				"pwe_dwarf_beacons_long_walk_b_04"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_skaven_retreat_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_skaven_retreat_a_01",
				"pwe_dwarf_beacons_skaven_retreat_a_02",
				"pwe_dwarf_beacons_skaven_retreat_a_03",
				"pwe_dwarf_beacons_skaven_retreat_a_04"
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
				3.7249999046326,
				4.8390002250671,
				5.6759791374206,
				4.0329790115356
			},
			localization_strings = {
				"pwe_dwarf_beacons_skaven_retreat_a_01",
				"pwe_dwarf_beacons_skaven_retreat_a_02",
				"pwe_dwarf_beacons_skaven_retreat_a_03",
				"pwe_dwarf_beacons_skaven_retreat_a_04"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_not_far = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_not_far_01",
				"pwe_dwarf_beacons_not_far_02",
				"pwe_dwarf_beacons_not_far_03",
				"pwe_dwarf_beacons_not_far_04"
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
				2.2069792747498,
				4.9580001831055,
				2.6829791069031,
				4.330979347229
			},
			localization_strings = {
				"pwe_dwarf_beacons_not_far_01",
				"pwe_dwarf_beacons_not_far_02",
				"pwe_dwarf_beacons_not_far_03",
				"pwe_dwarf_beacons_not_far_04"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_beacon_lit = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_beacon_lit_01",
				"pwe_dwarf_beacons_beacon_lit_02",
				"pwe_dwarf_beacons_beacon_lit_03",
				"pwe_dwarf_beacons_beacon_lit_04"
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
				3.7399792671204,
				4.1059789657593,
				4.7509789466858,
				6.2239789962769
			},
			localization_strings = {
				"pwe_dwarf_beacons_beacon_lit_01",
				"pwe_dwarf_beacons_beacon_lit_02",
				"pwe_dwarf_beacons_beacon_lit_03",
				"pwe_dwarf_beacons_beacon_lit_04"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_bridge_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_bridge_down_01",
				"pwe_dwarf_beacons_bridge_down_02",
				"pwe_dwarf_beacons_bridge_down_03",
				"pwe_dwarf_beacons_bridge_down_04"
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
				4.2149791717529,
				1.9680000543594,
				1.847000002861,
				3.1329998970032
			},
			localization_strings = {
				"pwe_dwarf_beacons_bridge_down_01",
				"pwe_dwarf_beacons_bridge_down_02",
				"pwe_dwarf_beacons_bridge_down_03",
				"pwe_dwarf_beacons_bridge_down_04"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_head_for_heights_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_dwarf_beacons_head_for_heights_b_01",
				[2.0] = "pwe_dwarf_beacons_head_for_heights_b_02"
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
				[1.0] = 2.0239791870117,
				[2.0] = 3.2860000133514
			},
			localization_strings = {
				[1.0] = "pwe_dwarf_beacons_head_for_heights_b_01",
				[2.0] = "pwe_dwarf_beacons_head_for_heights_b_02"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_outpost_empty_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_outpost_empty_a_01",
				"pwe_dwarf_beacons_outpost_empty_a_02",
				"pwe_dwarf_beacons_outpost_empty_a_03",
				"pwe_dwarf_beacons_outpost_empty_a_04"
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
				3.6909792423248,
				3.4549791812897,
				5.4539999961853,
				2.3289792537689
			},
			localization_strings = {
				"pwe_dwarf_beacons_outpost_empty_a_01",
				"pwe_dwarf_beacons_outpost_empty_a_02",
				"pwe_dwarf_beacons_outpost_empty_a_03",
				"pwe_dwarf_beacons_outpost_empty_a_04"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_start_banter_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_dwarf_beacons_start_banter_b_01",
				[2.0] = "pwe_dwarf_beacons_start_banter_b_02"
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
				[1.0] = 5.9829792976379,
				[2.0] = 6.1169791221619
			},
			localization_strings = {
				[1.0] = "pwe_dwarf_beacons_start_banter_b_01",
				[2.0] = "pwe_dwarf_beacons_start_banter_b_02"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_start_banter_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_dwarf_beacons_start_banter_c_01",
				[2.0] = "pwe_dwarf_beacons_start_banter_c_02"
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
				[1.0] = 3.4999792575836,
				[2.0] = 6.0819792747498
			},
			localization_strings = {
				[1.0] = "pwe_dwarf_beacons_start_banter_c_01",
				[2.0] = "pwe_dwarf_beacons_start_banter_c_02"
			},
			randomize_indexes = {}
		},
		pwe_dummy_memory_trigger_beacons = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_dlc_dwarf_beacons",
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
		pwe_dwarf_beacons_start_banter_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_dwarf_beacons_start_banter_a_01",
				[2.0] = "pwe_dwarf_beacons_start_banter_a_02"
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
				[1.0] = 6.5169792175293,
				[2.0] = 4.4409790039063
			},
			localization_strings = {
				[1.0] = "pwe_dwarf_beacons_start_banter_a_01",
				[2.0] = "pwe_dwarf_beacons_start_banter_a_02"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_head_for_heights_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_dwarf_beacons_head_for_heights_a_01",
				[2.0] = "pwe_dwarf_beacons_head_for_heights_a_02"
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
				[1.0] = 3.3550000190735,
				[2.0] = 2.1089999675751
			},
			localization_strings = {
				[1.0] = "pwe_dwarf_beacons_head_for_heights_a_01",
				[2.0] = "pwe_dwarf_beacons_head_for_heights_a_02"
			},
			randomize_indexes = {}
		},
		pwe_dwarf_beacons_beacon_gas_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_dwarf_beacons",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_dwarf_beacons_beacon_gas_b_01",
				"pwe_dwarf_beacons_beacon_gas_b_02",
				"pwe_dwarf_beacons_beacon_gas_b_03",
				"pwe_dwarf_beacons_beacon_gas_b_04"
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
				4.1589789390564,
				5.2799792289734,
				5.004979133606,
				4.5209999084473
			},
			localization_strings = {
				"pwe_dwarf_beacons_beacon_gas_b_01",
				"pwe_dwarf_beacons_beacon_gas_b_02",
				"pwe_dwarf_beacons_beacon_gas_b_03",
				"pwe_dwarf_beacons_beacon_gas_b_04"
			},
			randomize_indexes = {}
		}
	})
end
