return function ()
	define_rule({
		name = "pes_level_farmlands_fence_01",
		response = "pes_level_farmlands_fence_01",
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
				"farmlands_fence"
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
				"farmlands_fence",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_fence",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_investigate_farm_01",
		response = "pes_level_farmlands_investigate_farm_01",
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
				"farmlands_investigate_farm"
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
				"farmlands_investigate_farm",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_investigate_farm",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_no_prisoners_01",
		response = "pes_level_farmlands_no_prisoners_01",
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
				"farmlands_no_prisoners"
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
				"farmlands_no_prisoners",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_no_prisoners",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_unlocking_the_cage_01",
		response = "pes_level_farmlands_unlocking_the_cage_01",
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
				"farmlands_unlocking_the_cage"
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
				"farmlands_unlocking_the_cage",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_unlocking_the_cage",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_cart_01",
		response = "pes_level_farmlands_cart_01",
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
				"farmlands_cart"
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
				"farmlands_cart",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_cart",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_next_farm_01",
		response = "pes_level_farmlands_next_farm_01",
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
				"farmlands_next_farm"
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
				"farmlands_next_farm",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_next_farm",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmland_stick_to_the_road_01",
		response = "pes_level_farmland_stick_to_the_road_01",
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
				"farmland_stick_to_the_road"
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
				"farmland_stick_to_the_road",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmland_stick_to_the_road",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_locked_gate_01",
		response = "pes_level_farmlands_locked_gate_01",
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
				"farmlands_locked_gate"
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
				"farmlands_locked_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_locked_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_orchard_01",
		response = "pes_level_farmlands_orchard_01",
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
				"farmlands_orchard"
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
				"farmlands_orchard",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_orchard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_deserted_01",
		response = "pes_level_farmlands_deserted_01",
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
				"farmlands_deserted"
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
				"farmlands_deserted",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_deserted",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_monster_in_barn_01",
		response = "pes_level_farmlands_monster_in_barn_01",
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
				"farmlands_monster_in_barn"
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
				"farmlands_monster_in_barn",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_monster_in_barn",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_kill_the_brute_01",
		response = "pes_level_farmlands_kill_the_brute_01",
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
				"farmlands_kill_the_brute"
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
				"farmlands_kill_the_brute",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_kill_the_brute",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_move_on_01",
		response = "pes_level_farmlands_move_on_01",
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
				"farmlands_move_on"
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
				"farmlands_move_on",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_move_on",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_through_the_barn_01",
		response = "pes_level_farmlands_through_the_barn_01",
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
				"farmlands_through_the_barn"
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
				"farmlands_through_the_barn",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_through_the_barn",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_last_farm_01",
		response = "pes_level_farmlands_last_farm_01",
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
				"farmlands_last_farm"
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
				"farmlands_last_farm",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_last_farm",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_smoke_plume_01",
		response = "pes_level_farmlands_smoke_plume_01",
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
				"farmlands_smoke_plume"
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
				"farmlands_smoke_plume",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_smoke_plume",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_prisoners_01",
		response = "pes_level_farmlands_prisoners_01",
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
				"farmlands_prisoners"
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
				"farmlands_prisoners",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_prisoners",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_end_level_01",
		response = "pes_level_farmlands_end_level_01",
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
				"farmlands_end_level"
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
				"farmlands_end_level",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_end_level",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_farmlands_portal_01",
		response = "pes_level_farmlands_portal_01",
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
				"farmlands_portal"
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
				"farmlands_portal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_portal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_farmlands_intro_a",
		response = "pes_farmlands_intro_a",
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
				"farmlands_intro_a"
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
				"farmlands_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_farmlands_intro_b",
		response = "pes_farmlands_intro_b",
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
				"farmlands_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"farmlands_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_farmlands_intro_c",
		response = "pes_farmlands_intro_c",
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
				"farmlands_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"farmlands_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pes_level_farmlands_investigate_farm_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_investigate_farm_01",
				"pes_level_farmlands_investigate_farm_02",
				"pes_level_farmlands_investigate_farm_03",
				"pes_level_farmlands_investigate_farm_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				2.9231457710266,
				3.1863124370575,
				4.4359998703003,
				3.2357292175293
			},
			localization_strings = {
				"pes_level_farmlands_investigate_farm_01",
				"pes_level_farmlands_investigate_farm_02",
				"pes_level_farmlands_investigate_farm_03",
				"pes_level_farmlands_investigate_farm_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_monster_in_barn_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_monster_in_barn_01",
				"pes_level_farmlands_monster_in_barn_02",
				"pes_level_farmlands_monster_in_barn_03",
				"pes_level_farmlands_monster_in_barn_04"
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
				4.0136876106262,
				3.2032084465027,
				3.5612709522247,
				3.0620832443237
			},
			localization_strings = {
				"pes_level_farmlands_monster_in_barn_01",
				"pes_level_farmlands_monster_in_barn_02",
				"pes_level_farmlands_monster_in_barn_03",
				"pes_level_farmlands_monster_in_barn_04"
			},
			randomize_indexes = {}
		},
		pes_farmlands_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_farmlands_intro_c_01",
				[2.0] = "pes_farmlands_intro_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3027501106262,
				[2.0] = 3.3678541183472
			},
			localization_strings = {
				[1.0] = "pes_farmlands_intro_c_01",
				[2.0] = "pes_farmlands_intro_c_02"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_portal_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_portal_01",
				"pes_level_farmlands_portal_02",
				"pes_level_farmlands_portal_03",
				"pes_level_farmlands_portal_04"
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
				4.580958366394,
				4.3407707214356,
				4.6412501335144,
				5.0515418052673
			},
			localization_strings = {
				"pes_level_farmlands_portal_01",
				"pes_level_farmlands_portal_02",
				"pes_level_farmlands_portal_03",
				"pes_level_farmlands_portal_04"
			},
			randomize_indexes = {}
		},
		pes_farmlands_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_farmlands_intro_b_01",
				[2.0] = "pes_farmlands_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8905625343323,
				[2.0] = 3.9825415611267
			},
			localization_strings = {
				[1.0] = "pes_farmlands_intro_b_01",
				[2.0] = "pes_farmlands_intro_b_02"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_last_farm_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_last_farm_01",
				"pes_level_farmlands_last_farm_02",
				"pes_level_farmlands_last_farm_03",
				"pes_level_farmlands_last_farm_04"
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
				3.4170207977295,
				2.8678750991821,
				5.2502708435059,
				2.9065415859222
			},
			localization_strings = {
				"pes_level_farmlands_last_farm_01",
				"pes_level_farmlands_last_farm_02",
				"pes_level_farmlands_last_farm_03",
				"pes_level_farmlands_last_farm_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_no_prisoners_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_no_prisoners_01",
				"pes_level_farmlands_no_prisoners_02",
				"pes_level_farmlands_no_prisoners_03",
				"pes_level_farmlands_no_prisoners_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				3.9318125247955,
				3.0349373817444,
				2.6589374542236,
				3.7767291069031
			},
			localization_strings = {
				"pes_level_farmlands_no_prisoners_01",
				"pes_level_farmlands_no_prisoners_02",
				"pes_level_farmlands_no_prisoners_03",
				"pes_level_farmlands_no_prisoners_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_locked_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_locked_gate_01",
				"pes_level_farmlands_locked_gate_02",
				"pes_level_farmlands_locked_gate_03",
				"pes_level_farmlands_locked_gate_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.3107917308807,
				2.3695209026337,
				3.9129583835602,
				1.4889999628067
			},
			localization_strings = {
				"pes_level_farmlands_locked_gate_01",
				"pes_level_farmlands_locked_gate_02",
				"pes_level_farmlands_locked_gate_03",
				"pes_level_farmlands_locked_gate_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_smoke_plume_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_smoke_plume_01",
				"pes_level_farmlands_smoke_plume_02",
				"pes_level_farmlands_smoke_plume_03",
				"pes_level_farmlands_smoke_plume_04"
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
				3.5354583263397,
				2.5836250782013,
				1.4440833330154,
				3.7761874198914
			},
			localization_strings = {
				"pes_level_farmlands_smoke_plume_01",
				"pes_level_farmlands_smoke_plume_02",
				"pes_level_farmlands_smoke_plume_03",
				"pes_level_farmlands_smoke_plume_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_fence_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_fence_01",
				"pes_level_farmlands_fence_02",
				"pes_level_farmlands_fence_03",
				"pes_level_farmlands_fence_04"
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
				1.4880207777023,
				2.4421875476837,
				2.5759792327881,
				2.2955207824707
			},
			localization_strings = {
				"pes_level_farmlands_fence_01",
				"pes_level_farmlands_fence_02",
				"pes_level_farmlands_fence_03",
				"pes_level_farmlands_fence_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_end_level_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_end_level_01",
				"pes_level_farmlands_end_level_02",
				"pes_level_farmlands_end_level_03",
				"pes_level_farmlands_end_level_04"
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
				2.3735208511352,
				4.5805830955505,
				3.747270822525,
				2.249166727066
			},
			localization_strings = {
				"pes_level_farmlands_end_level_01",
				"pes_level_farmlands_end_level_02",
				"pes_level_farmlands_end_level_03",
				"pes_level_farmlands_end_level_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_cart_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_cart_01",
				"pes_level_farmlands_cart_02",
				"pes_level_farmlands_cart_03",
				"pes_level_farmlands_cart_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.8588333129883,
				2.3732707500458,
				1.8668124675751,
				1.7112499475479
			},
			localization_strings = {
				"pes_level_farmlands_cart_01",
				"pes_level_farmlands_cart_02",
				"pes_level_farmlands_cart_03",
				"pes_level_farmlands_cart_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_deserted_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_deserted_01",
				"pes_level_farmlands_deserted_02",
				"pes_level_farmlands_deserted_03",
				"pes_level_farmlands_deserted_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.7693958282471,
				3.9046666622162,
				1.9394166469574,
				3.5368542671204
			},
			localization_strings = {
				"pes_level_farmlands_deserted_01",
				"pes_level_farmlands_deserted_02",
				"pes_level_farmlands_deserted_03",
				"pes_level_farmlands_deserted_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_orchard_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_orchard_01",
				"pes_level_farmlands_orchard_02",
				"pes_level_farmlands_orchard_03",
				"pes_level_farmlands_orchard_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.5025000572205,
				4.556583404541,
				2.5245208740234,
				5.203625202179
			},
			localization_strings = {
				"pes_level_farmlands_orchard_01",
				"pes_level_farmlands_orchard_02",
				"pes_level_farmlands_orchard_03",
				"pes_level_farmlands_orchard_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_unlocking_the_cage_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_unlocking_the_cage_01",
				"pes_level_farmlands_unlocking_the_cage_02",
				"pes_level_farmlands_unlocking_the_cage_03",
				"pes_level_farmlands_unlocking_the_cage_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.2542916536331,
				1.4832082986832,
				1.8760207891464,
				1.4396250247955
			},
			localization_strings = {
				"pes_level_farmlands_unlocking_the_cage_01",
				"pes_level_farmlands_unlocking_the_cage_02",
				"pes_level_farmlands_unlocking_the_cage_03",
				"pes_level_farmlands_unlocking_the_cage_04"
			},
			randomize_indexes = {}
		},
		pes_farmlands_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_farmlands_intro_a_01",
				[2.0] = "pes_farmlands_intro_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9763333797455,
				[2.0] = 2.845999956131
			},
			localization_strings = {
				[1.0] = "pes_farmlands_intro_a_01",
				[2.0] = "pes_farmlands_intro_a_02"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_prisoners_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_prisoners_01",
				"pes_level_farmlands_prisoners_02",
				"pes_level_farmlands_prisoners_03",
				"pes_level_farmlands_prisoners_04"
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
				1.6570833921433,
				4.4845833778381,
				1.7219791412354,
				2.3229792118073
			},
			localization_strings = {
				"pes_level_farmlands_prisoners_01",
				"pes_level_farmlands_prisoners_02",
				"pes_level_farmlands_prisoners_03",
				"pes_level_farmlands_prisoners_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmland_stick_to_the_road_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmland_stick_to_the_road_01",
				"pes_level_farmland_stick_to_the_road_02",
				"pes_level_farmland_stick_to_the_road_03",
				"pes_level_farmland_stick_to_the_road_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.5025207996368,
				2.0647082328796,
				2.2557916641235,
				2.1058750152588
			},
			localization_strings = {
				"pes_level_farmland_stick_to_the_road_01",
				"pes_level_farmland_stick_to_the_road_02",
				"pes_level_farmland_stick_to_the_road_03",
				"pes_level_farmland_stick_to_the_road_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_next_farm_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_next_farm_01",
				"pes_level_farmlands_next_farm_02",
				"pes_level_farmlands_next_farm_03",
				"pes_level_farmlands_next_farm_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.0278124809265,
				1.9070208072662,
				2.2326457500458,
				2.0954167842865
			},
			localization_strings = {
				"pes_level_farmlands_next_farm_01",
				"pes_level_farmlands_next_farm_02",
				"pes_level_farmlands_next_farm_03",
				"pes_level_farmlands_next_farm_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_through_the_barn_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_through_the_barn_01",
				"pes_level_farmlands_through_the_barn_02",
				"pes_level_farmlands_through_the_barn_03",
				"pes_level_farmlands_through_the_barn_04"
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
				1.6781250238419,
				2.7180416584015,
				1.630979180336,
				1.6724582910538
			},
			localization_strings = {
				"pes_level_farmlands_through_the_barn_01",
				"pes_level_farmlands_through_the_barn_02",
				"pes_level_farmlands_through_the_barn_03",
				"pes_level_farmlands_through_the_barn_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_move_on_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_move_on_01",
				"pes_level_farmlands_move_on_02",
				"pes_level_farmlands_move_on_03",
				"pes_level_farmlands_move_on_04"
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
				1.2347500324249,
				2.8156249523163,
				1.8014999628067,
				2.5967082977295
			},
			localization_strings = {
				"pes_level_farmlands_move_on_01",
				"pes_level_farmlands_move_on_02",
				"pes_level_farmlands_move_on_03",
				"pes_level_farmlands_move_on_04"
			},
			randomize_indexes = {}
		},
		pes_level_farmlands_kill_the_brute_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_farmlands_kill_the_brute_01",
				"pes_level_farmlands_kill_the_brute_02",
				"pes_level_farmlands_kill_the_brute_03",
				"pes_level_farmlands_kill_the_brute_04"
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
				3.8066248893738,
				4.3688540458679,
				3.3671250343323,
				2.1926875114441
			},
			localization_strings = {
				"pes_level_farmlands_kill_the_brute_01",
				"pes_level_farmlands_kill_the_brute_02",
				"pes_level_farmlands_kill_the_brute_03",
				"pes_level_farmlands_kill_the_brute_04"
			},
			randomize_indexes = {}
		}
	})
end
