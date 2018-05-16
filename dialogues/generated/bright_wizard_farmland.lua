return function ()
	define_rule({
		name = "pbw_level_farmlands_fence_01",
		response = "pbw_level_farmlands_fence_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_investigate_farm_01",
		response = "pbw_level_farmlands_investigate_farm_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_no_prisoners_01",
		response = "pbw_level_farmlands_no_prisoners_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_unlocking_the_cage_01",
		response = "pbw_level_farmlands_unlocking_the_cage_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_cart_01",
		response = "pbw_level_farmlands_cart_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_next_farm_01",
		response = "pbw_level_farmlands_next_farm_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmland_stick_to_the_road_01",
		response = "pbw_level_farmland_stick_to_the_road_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_locked_gate_01",
		response = "pbw_level_farmlands_locked_gate_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_deserted_01",
		response = "pbw_level_farmlands_deserted_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_monster_in_barn_01",
		response = "pbw_level_farmlands_monster_in_barn_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_kill_the_brute_01",
		response = "pbw_level_farmlands_kill_the_brute_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_move_on_01",
		response = "pbw_level_farmlands_move_on_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_through_the_barn_01",
		response = "pbw_level_farmlands_through_the_barn_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_last_farm_01",
		response = "pbw_level_farmlands_last_farm_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_smoke_plume_01",
		response = "pbw_level_farmlands_smoke_plume_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_prisoners_01",
		response = "pbw_level_farmlands_prisoners_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_farmlands_end_level_01",
		response = "pbw_level_farmlands_end_level_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_farmlands_intro_a",
		response = "pbw_farmlands_intro_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_farmlands_intro_b",
		response = "pbw_farmlands_intro_b",
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
				"bright_wizard"
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
		name = "pbw_farmlands_intro_c",
		response = "pbw_farmlands_intro_c",
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
				"bright_wizard"
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
		pbw_farmlands_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_farmlands_intro_c_01",
				[2.0] = "pbw_farmlands_intro_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_farmlands_intro_c_01",
				[2.0] = "pbw_farmlands_intro_c_02"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_monster_in_barn_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_monster_in_barn_01",
				"pbw_level_farmlands_monster_in_barn_02",
				"pbw_level_farmlands_monster_in_barn_03",
				"pbw_level_farmlands_monster_in_barn_04"
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
			localization_strings = {
				"pbw_level_farmlands_monster_in_barn_01",
				"pbw_level_farmlands_monster_in_barn_02",
				"pbw_level_farmlands_monster_in_barn_03",
				"pbw_level_farmlands_monster_in_barn_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_kill_the_brute_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_kill_the_brute_01",
				"pbw_level_farmlands_kill_the_brute_02",
				"pbw_level_farmlands_kill_the_brute_03",
				"pbw_level_farmlands_kill_the_brute_04"
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
			localization_strings = {
				"pbw_level_farmlands_kill_the_brute_01",
				"pbw_level_farmlands_kill_the_brute_02",
				"pbw_level_farmlands_kill_the_brute_03",
				"pbw_level_farmlands_kill_the_brute_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_fence_01 = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_level_farmlands_fence_01",
				"pbw_level_farmlands_fence_02",
				"pbw_level_farmlands_fence_03"
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
			localization_strings = {
				"pbw_level_farmlands_fence_01",
				"pbw_level_farmlands_fence_02",
				"pbw_level_farmlands_fence_03"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_move_on_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_move_on_01",
				"pbw_level_farmlands_move_on_02",
				"pbw_level_farmlands_move_on_03",
				"pbw_level_farmlands_move_on_04"
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
			localization_strings = {
				"pbw_level_farmlands_move_on_01",
				"pbw_level_farmlands_move_on_02",
				"pbw_level_farmlands_move_on_03",
				"pbw_level_farmlands_move_on_04"
			},
			randomize_indexes = {}
		},
		pbw_farmlands_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_farmlands_intro_b_01",
				[2.0] = "pbw_farmlands_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_farmlands_intro_b_01",
				[2.0] = "pbw_farmlands_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_last_farm_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_last_farm_01",
				"pbw_level_farmlands_last_farm_02",
				"pbw_level_farmlands_last_farm_03",
				"pbw_level_farmlands_last_farm_04"
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
			localization_strings = {
				"pbw_level_farmlands_last_farm_01",
				"pbw_level_farmlands_last_farm_02",
				"pbw_level_farmlands_last_farm_03",
				"pbw_level_farmlands_last_farm_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_investigate_farm_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_investigate_farm_01",
				"pbw_level_farmlands_investigate_farm_02",
				"pbw_level_farmlands_investigate_farm_03",
				"pbw_level_farmlands_investigate_farm_04"
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
			localization_strings = {
				"pbw_level_farmlands_investigate_farm_01",
				"pbw_level_farmlands_investigate_farm_02",
				"pbw_level_farmlands_investigate_farm_03",
				"pbw_level_farmlands_investigate_farm_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_prisoners_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_prisoners_01",
				"pbw_level_farmlands_prisoners_02",
				"pbw_level_farmlands_prisoners_03",
				"pbw_level_farmlands_prisoners_04"
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
			localization_strings = {
				"pbw_level_farmlands_prisoners_01",
				"pbw_level_farmlands_prisoners_02",
				"pbw_level_farmlands_prisoners_03",
				"pbw_level_farmlands_prisoners_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_through_the_barn_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_through_the_barn_01",
				"pbw_level_farmlands_through_the_barn_02",
				"pbw_level_farmlands_through_the_barn_03",
				"pbw_level_farmlands_through_the_barn_04"
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
			localization_strings = {
				"pbw_level_farmlands_through_the_barn_01",
				"pbw_level_farmlands_through_the_barn_02",
				"pbw_level_farmlands_through_the_barn_03",
				"pbw_level_farmlands_through_the_barn_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_deserted_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_deserted_01",
				"pbw_level_farmlands_deserted_02",
				"pbw_level_farmlands_deserted_03",
				"pbw_level_farmlands_deserted_04"
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
			localization_strings = {
				"pbw_level_farmlands_deserted_01",
				"pbw_level_farmlands_deserted_02",
				"pbw_level_farmlands_deserted_03",
				"pbw_level_farmlands_deserted_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_smoke_plume_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_smoke_plume_01",
				"pbw_level_farmlands_smoke_plume_02",
				"pbw_level_farmlands_smoke_plume_03",
				"pbw_level_farmlands_smoke_plume_04"
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
			localization_strings = {
				"pbw_level_farmlands_smoke_plume_01",
				"pbw_level_farmlands_smoke_plume_02",
				"pbw_level_farmlands_smoke_plume_03",
				"pbw_level_farmlands_smoke_plume_04"
			},
			randomize_indexes = {}
		},
		pbw_farmlands_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_farmlands_intro_a_01",
				[2.0] = "pbw_farmlands_intro_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_farmlands_intro_a_01",
				[2.0] = "pbw_farmlands_intro_a_02"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_no_prisoners_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_no_prisoners_01",
				"pbw_level_farmlands_no_prisoners_02",
				"pbw_level_farmlands_no_prisoners_03",
				"pbw_level_farmlands_no_prisoners_04"
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
			localization_strings = {
				"pbw_level_farmlands_no_prisoners_01",
				"pbw_level_farmlands_no_prisoners_02",
				"pbw_level_farmlands_no_prisoners_03",
				"pbw_level_farmlands_no_prisoners_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_end_level_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_end_level_01",
				"pbw_level_farmlands_end_level_02",
				"pbw_level_farmlands_end_level_03",
				"pbw_level_farmlands_end_level_04"
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
			localization_strings = {
				"pbw_level_farmlands_end_level_01",
				"pbw_level_farmlands_end_level_02",
				"pbw_level_farmlands_end_level_03",
				"pbw_level_farmlands_end_level_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_locked_gate_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_locked_gate_01",
				"pbw_level_farmlands_locked_gate_02",
				"pbw_level_farmlands_locked_gate_03",
				"pbw_level_farmlands_locked_gate_04"
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
			localization_strings = {
				"pbw_level_farmlands_locked_gate_01",
				"pbw_level_farmlands_locked_gate_02",
				"pbw_level_farmlands_locked_gate_03",
				"pbw_level_farmlands_locked_gate_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_unlocking_the_cage_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_unlocking_the_cage_01",
				"pbw_level_farmlands_unlocking_the_cage_02",
				"pbw_level_farmlands_unlocking_the_cage_03",
				"pbw_level_farmlands_unlocking_the_cage_04"
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
			localization_strings = {
				"pbw_level_farmlands_unlocking_the_cage_01",
				"pbw_level_farmlands_unlocking_the_cage_02",
				"pbw_level_farmlands_unlocking_the_cage_03",
				"pbw_level_farmlands_unlocking_the_cage_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmland_stick_to_the_road_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmland_stick_to_the_road_01",
				"pbw_level_farmland_stick_to_the_road_02",
				"pbw_level_farmland_stick_to_the_road_03",
				"pbw_level_farmland_stick_to_the_road_04"
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
			localization_strings = {
				"pbw_level_farmland_stick_to_the_road_01",
				"pbw_level_farmland_stick_to_the_road_02",
				"pbw_level_farmland_stick_to_the_road_03",
				"pbw_level_farmland_stick_to_the_road_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_cart_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_cart_01",
				"pbw_level_farmlands_cart_02",
				"pbw_level_farmlands_cart_03",
				"pbw_level_farmlands_cart_04"
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
			localization_strings = {
				"pbw_level_farmlands_cart_01",
				"pbw_level_farmlands_cart_02",
				"pbw_level_farmlands_cart_03",
				"pbw_level_farmlands_cart_04"
			},
			randomize_indexes = {}
		},
		pbw_level_farmlands_next_farm_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_farmland",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_farmlands_next_farm_01",
				"pbw_level_farmlands_next_farm_02",
				"pbw_level_farmlands_next_farm_03",
				"pbw_level_farmlands_next_farm_04"
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
			localization_strings = {
				"pbw_level_farmlands_next_farm_01",
				"pbw_level_farmlands_next_farm_02",
				"pbw_level_farmlands_next_farm_03",
				"pbw_level_farmlands_next_farm_04"
			},
			randomize_indexes = {}
		}
	})
end
