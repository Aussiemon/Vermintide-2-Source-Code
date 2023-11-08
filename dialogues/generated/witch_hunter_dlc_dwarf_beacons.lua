return function ()
	define_rule({
		name = "pwh_dummy_memory_trigger_beacons",
		response = "pwh_dummy_memory_trigger_beacons",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_beacon_gas_b",
		response = "pwh_dwarf_beacons_beacon_gas_b",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_beacon_gas_e",
		response = "pwh_dwarf_beacons_beacon_gas_e",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_beacon_lit",
		response = "pwh_dwarf_beacons_beacon_lit",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_bridge_down",
		response = "pwh_dwarf_beacons_bridge_down",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_head_for_heights_a",
		response = "pwh_dwarf_beacons_head_for_heights_a",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_head_for_heights_b",
		response = "pwh_dwarf_beacons_head_for_heights_b",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_long_walk_b",
		response = "pwh_dwarf_beacons_long_walk_b",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_not_far",
		response = "pwh_dwarf_beacons_not_far",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_outpost_empty_a",
		response = "pwh_dwarf_beacons_outpost_empty_a",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_over_the_mountain_c",
		response = "pwh_dwarf_beacons_over_the_mountain_c",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_skaven_retreat_a",
		response = "pwh_dwarf_beacons_skaven_retreat_a",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_dwarf_beacons_start_banter_a",
		response = "pwh_dwarf_beacons_start_banter_a",
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
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pwh_dwarf_beacons_start_banter_b",
		name = "pwh_dwarf_beacons_start_banter_b",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_dwarf_beacons_start_banter_c",
		name = "pwh_dwarf_beacons_start_banter_c",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "pwh_dwarf_beacons_victory_b",
		response = "pwh_dwarf_beacons_victory_b",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		pwh_dummy_memory_trigger_beacons = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_dlc_dwarf_beacons",
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
		pwh_dwarf_beacons_beacon_gas_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_beacon_gas_b_01",
				"pwh_dwarf_beacons_beacon_gas_b_02",
				"pwh_dwarf_beacons_beacon_gas_b_03",
				"pwh_dwarf_beacons_beacon_gas_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_beacon_gas_b_01",
				"pwh_dwarf_beacons_beacon_gas_b_02",
				"pwh_dwarf_beacons_beacon_gas_b_03",
				"pwh_dwarf_beacons_beacon_gas_b_04"
			},
			sound_events_duration = {
				5.6599793434143,
				4.6229791641235,
				6.4319791793823,
				6.2119793891907
			}
		},
		pwh_dwarf_beacons_beacon_gas_e = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_beacon_gas_e_01",
				"pwh_dwarf_beacons_beacon_gas_e_02",
				"pwh_dwarf_beacons_beacon_gas_e_03",
				"pwh_dwarf_beacons_beacon_gas_e_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_beacon_gas_e_01",
				"pwh_dwarf_beacons_beacon_gas_e_02",
				"pwh_dwarf_beacons_beacon_gas_e_03",
				"pwh_dwarf_beacons_beacon_gas_e_04"
			},
			sound_events_duration = {
				3.1739792823791,
				3.1809792518616,
				2.6229999065399,
				7.1539998054504
			}
		},
		pwh_dwarf_beacons_beacon_lit = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_beacon_lit_01",
				"pwh_dwarf_beacons_beacon_lit_02",
				"pwh_dwarf_beacons_beacon_lit_03",
				"pwh_dwarf_beacons_beacon_lit_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_beacon_lit_01",
				"pwh_dwarf_beacons_beacon_lit_02",
				"pwh_dwarf_beacons_beacon_lit_03",
				"pwh_dwarf_beacons_beacon_lit_04"
			},
			sound_events_duration = {
				8.0749788284302,
				5.3499794006348,
				5.2269792556763,
				7.8829793930054
			}
		},
		pwh_dwarf_beacons_bridge_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_bridge_down_01",
				"pwh_dwarf_beacons_bridge_down_02",
				"pwh_dwarf_beacons_bridge_down_03",
				"pwh_dwarf_beacons_bridge_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_bridge_down_01",
				"pwh_dwarf_beacons_bridge_down_02",
				"pwh_dwarf_beacons_bridge_down_03",
				"pwh_dwarf_beacons_bridge_down_04"
			},
			sound_events_duration = {
				3.1839792728424,
				3.408979177475,
				2.6529791355133,
				4.4579792022705
			}
		},
		pwh_dwarf_beacons_head_for_heights_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				[1.0] = "pwh_dwarf_beacons_head_for_heights_a_01",
				[2.0] = "pwh_dwarf_beacons_head_for_heights_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_dwarf_beacons_head_for_heights_a_01",
				[2.0] = "pwh_dwarf_beacons_head_for_heights_a_02"
			},
			sound_events_duration = {
				[1.0] = 2.3429999351502,
				[2.0] = 3.433000087738
			}
		},
		pwh_dwarf_beacons_head_for_heights_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				[1.0] = "pwh_dwarf_beacons_head_for_heights_b_01",
				[2.0] = "pwh_dwarf_beacons_head_for_heights_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_dwarf_beacons_head_for_heights_b_01",
				[2.0] = "pwh_dwarf_beacons_head_for_heights_b_02"
			},
			sound_events_duration = {
				[1.0] = 5.4099793434143,
				[2.0] = 6.0019998550415
			}
		},
		pwh_dwarf_beacons_long_walk_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_long_walk_b_01",
				"pwh_dwarf_beacons_long_walk_b_02",
				"pwh_dwarf_beacons_long_walk_b_03",
				"pwh_dwarf_beacons_long_walk_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_long_walk_b_01",
				"pwh_dwarf_beacons_long_walk_b_02",
				"pwh_dwarf_beacons_long_walk_b_03",
				"pwh_dwarf_beacons_long_walk_b_04"
			},
			sound_events_duration = {
				5.3689789772034,
				5.6129789352417,
				3.1149792671204,
				4.3669791221619
			}
		},
		pwh_dwarf_beacons_not_far = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_not_far_01",
				"pwh_dwarf_beacons_not_far_02",
				"pwh_dwarf_beacons_not_far_03",
				"pwh_dwarf_beacons_not_far_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_not_far_01",
				"pwh_dwarf_beacons_not_far_02",
				"pwh_dwarf_beacons_not_far_03",
				"pwh_dwarf_beacons_not_far_04"
			},
			sound_events_duration = {
				5.9459791183472,
				2.7609791755676,
				7.4949793815613,
				4.0409998893738
			}
		},
		pwh_dwarf_beacons_outpost_empty_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_outpost_empty_a_01",
				"pwh_dwarf_beacons_outpost_empty_a_02",
				"pwh_dwarf_beacons_outpost_empty_a_03",
				"pwh_dwarf_beacons_outpost_empty_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_outpost_empty_a_01",
				"pwh_dwarf_beacons_outpost_empty_a_02",
				"pwh_dwarf_beacons_outpost_empty_a_03",
				"pwh_dwarf_beacons_outpost_empty_a_04"
			},
			sound_events_duration = {
				2.805999994278,
				2.7009792327881,
				3.7419791221619,
				4.7009792327881
			}
		},
		pwh_dwarf_beacons_over_the_mountain_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_over_the_mountain_c_01",
				"pwh_dwarf_beacons_over_the_mountain_c_02",
				"pwh_dwarf_beacons_over_the_mountain_c_03",
				"pwh_dwarf_beacons_over_the_mountain_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_over_the_mountain_c_01",
				"pwh_dwarf_beacons_over_the_mountain_c_02",
				"pwh_dwarf_beacons_over_the_mountain_c_03",
				"pwh_dwarf_beacons_over_the_mountain_c_04"
			},
			sound_events_duration = {
				3.6749792098999,
				2.6519792079926,
				4.8849792480469,
				5.3969793319702
			}
		},
		pwh_dwarf_beacons_skaven_retreat_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_skaven_retreat_a_01",
				"pwh_dwarf_beacons_skaven_retreat_a_02",
				"pwh_dwarf_beacons_skaven_retreat_a_03",
				"pwh_dwarf_beacons_skaven_retreat_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_skaven_retreat_a_01",
				"pwh_dwarf_beacons_skaven_retreat_a_02",
				"pwh_dwarf_beacons_skaven_retreat_a_03",
				"pwh_dwarf_beacons_skaven_retreat_a_04"
			},
			sound_events_duration = {
				5.2219791412353,
				5.977979183197,
				5.6289792060852,
				8.116979598999
			}
		},
		pwh_dwarf_beacons_start_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				[1.0] = "pwh_dwarf_beacons_start_banter_a_01",
				[2.0] = "pwh_dwarf_beacons_start_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_dwarf_beacons_start_banter_a_01",
				[2.0] = "pwh_dwarf_beacons_start_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 7.2329792976379,
				[2.0] = 3.9459791183472
			}
		},
		pwh_dwarf_beacons_start_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				[1.0] = "pwh_dwarf_beacons_start_banter_b_01",
				[2.0] = "pwh_dwarf_beacons_start_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_dwarf_beacons_start_banter_b_01",
				[2.0] = "pwh_dwarf_beacons_start_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 6.2569789886475,
				[2.0] = 6.7629790306091
			}
		},
		pwh_dwarf_beacons_start_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				[1.0] = "pwh_dwarf_beacons_start_banter_c_01",
				[2.0] = "pwh_dwarf_beacons_start_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_dwarf_beacons_start_banter_c_01",
				[2.0] = "pwh_dwarf_beacons_start_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 6.5609793663025,
				[2.0] = 5.4549789428711
			}
		},
		pwh_dwarf_beacons_victory_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_dwarf_beacons",
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
				"pwh_dwarf_beacons_victory_b_01",
				"pwh_dwarf_beacons_victory_b_02",
				"pwh_dwarf_beacons_victory_b_03",
				"pwh_dwarf_beacons_victory_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_dwarf_beacons_victory_b_01",
				"pwh_dwarf_beacons_victory_b_02",
				"pwh_dwarf_beacons_victory_b_03",
				"pwh_dwarf_beacons_victory_b_04"
			},
			sound_events_duration = {
				6.1799793243408,
				7.3269791603088,
				6.26797914505,
				8.6309795379639
			}
		}
	})
end
