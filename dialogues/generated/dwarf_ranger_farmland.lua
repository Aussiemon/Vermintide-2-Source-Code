return function ()
	define_rule({
		name = "pdr_level_farmlands_fence_01",
		response = "pdr_level_farmlands_fence_01",
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
		name = "pdr_level_farmlands_investigate_farm_01",
		response = "pdr_level_farmlands_investigate_farm_01",
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
		name = "pdr_level_farmlands_no_prisoners_01",
		response = "pdr_level_farmlands_no_prisoners_01",
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
		name = "pdr_level_farmlands_unlocking_the_cage_01",
		response = "pdr_level_farmlands_unlocking_the_cage_01",
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
		name = "pdr_level_farmlands_cart_01",
		response = "pdr_level_farmlands_cart_01",
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
		name = "pdr_level_farmlands_next_farm_01",
		response = "pdr_level_farmlands_next_farm_01",
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
		name = "pdr_level_farmland_stick_to_the_road_01",
		response = "pdr_level_farmland_stick_to_the_road_01",
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
		name = "pdr_level_farmlands_locked_gate_01",
		response = "pdr_level_farmlands_locked_gate_01",
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
		name = "pdr_level_farmlands_deserted_01",
		response = "pdr_level_farmlands_deserted_01",
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
		name = "pdr_level_farmlands_monster_in_barn_01",
		response = "pdr_level_farmlands_monster_in_barn_01",
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
		name = "pdr_level_farmlands_kill_the_brute_01",
		response = "pdr_level_farmlands_kill_the_brute_01",
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
		name = "pdr_level_farmlands_move_on_01",
		response = "pdr_level_farmlands_move_on_01",
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
		name = "pdr_level_farmlands_through_the_barn_01",
		response = "pdr_level_farmlands_through_the_barn_01",
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
		name = "pdr_level_farmlands_last_farm_01",
		response = "pdr_level_farmlands_last_farm_01",
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
		name = "pdr_level_farmlands_smoke_plume_01",
		response = "pdr_level_farmlands_smoke_plume_01",
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
		name = "pdr_level_farmlands_prisoners_01",
		response = "pdr_level_farmlands_prisoners_01",
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
		name = "pdr_level_farmlands_end_level_01",
		response = "pdr_level_farmlands_end_level_01",
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
		name = "pdr_level_farmlands_portal_01",
		response = "pdr_level_farmlands_portal_01",
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
		name = "pdr_farmlands_intro_a",
		response = "pdr_farmlands_intro_a",
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
		name = "pdr_farmlands_intro_b",
		response = "pdr_farmlands_intro_b",
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
				"dwarf_ranger"
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
		name = "pdr_farmlands_intro_c",
		response = "pdr_farmlands_intro_c",
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
				"dwarf_ranger"
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
		pdr_level_farmlands_kill_the_brute_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_kill_the_brute_01",
				"pdr_level_farmlands_kill_the_brute_02",
				"pdr_level_farmlands_kill_the_brute_03",
				"pdr_level_farmlands_kill_the_brute_04"
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
				6.0003747940064,
				5.0049166679382,
				3.4424166679382,
				4.8049583435059
			},
			localization_strings = {
				"pdr_level_farmlands_kill_the_brute_01",
				"pdr_level_farmlands_kill_the_brute_02",
				"pdr_level_farmlands_kill_the_brute_03",
				"pdr_level_farmlands_kill_the_brute_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_monster_in_barn_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_monster_in_barn_01",
				"pdr_level_farmlands_monster_in_barn_02",
				"pdr_level_farmlands_monster_in_barn_03",
				"pdr_level_farmlands_monster_in_barn_04"
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
				2.3102917671204,
				3.0842292308807,
				4.0271873474121,
				5.2413334846497
			},
			localization_strings = {
				"pdr_level_farmlands_monster_in_barn_01",
				"pdr_level_farmlands_monster_in_barn_02",
				"pdr_level_farmlands_monster_in_barn_03",
				"pdr_level_farmlands_monster_in_barn_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_investigate_farm_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_investigate_farm_01",
				"pdr_level_farmlands_investigate_farm_02",
				"pdr_level_farmlands_investigate_farm_03",
				"pdr_level_farmlands_investigate_farm_04"
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
				4.0553750991821,
				2.9460000991821,
				4.7422289848328,
				3.0882499217987
			},
			localization_strings = {
				"pdr_level_farmlands_investigate_farm_01",
				"pdr_level_farmlands_investigate_farm_02",
				"pdr_level_farmlands_investigate_farm_03",
				"pdr_level_farmlands_investigate_farm_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_last_farm_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_last_farm_01",
				"pdr_level_farmlands_last_farm_02",
				"pdr_level_farmlands_last_farm_03",
				"pdr_level_farmlands_last_farm_04"
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
				4.8353543281555,
				4.7928123474121,
				5.4052081108093,
				6.1900625228882
			},
			localization_strings = {
				"pdr_level_farmlands_last_farm_01",
				"pdr_level_farmlands_last_farm_02",
				"pdr_level_farmlands_last_farm_03",
				"pdr_level_farmlands_last_farm_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_through_the_barn_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_through_the_barn_01",
				"pdr_level_farmlands_through_the_barn_02",
				"pdr_level_farmlands_through_the_barn_03",
				"pdr_level_farmlands_through_the_barn_04"
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
				1.8895833492279,
				1.8630000352859,
				1.8515416383743,
				5.2683334350586
			},
			localization_strings = {
				"pdr_level_farmlands_through_the_barn_01",
				"pdr_level_farmlands_through_the_barn_02",
				"pdr_level_farmlands_through_the_barn_03",
				"pdr_level_farmlands_through_the_barn_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_fence_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_fence_01",
				"pdr_level_farmlands_fence_02",
				"pdr_level_farmlands_fence_03",
				"pdr_level_farmlands_fence_04"
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
				1.8428750038147,
				2.6042499542236,
				2.0174584388733,
				3.1749792098999
			},
			localization_strings = {
				"pdr_level_farmlands_fence_01",
				"pdr_level_farmlands_fence_02",
				"pdr_level_farmlands_fence_03",
				"pdr_level_farmlands_fence_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_no_prisoners_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_no_prisoners_01",
				"pdr_level_farmlands_no_prisoners_02",
				"pdr_level_farmlands_no_prisoners_03",
				"pdr_level_farmlands_no_prisoners_04"
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
				6.136353969574,
				3.8411874771118,
				4.7508540153503,
				3.1497082710266
			},
			localization_strings = {
				"pdr_level_farmlands_no_prisoners_01",
				"pdr_level_farmlands_no_prisoners_02",
				"pdr_level_farmlands_no_prisoners_03",
				"pdr_level_farmlands_no_prisoners_04"
			},
			randomize_indexes = {}
		},
		pdr_farmlands_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_farmlands_intro_c_01",
				[2.0] = "pdr_farmlands_intro_c_02"
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
				[1.0] = 4.9353332519531,
				[2.0] = 4.9142918586731
			},
			localization_strings = {
				[1.0] = "pdr_farmlands_intro_c_01",
				[2.0] = "pdr_farmlands_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_cart_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_cart_01",
				"pdr_level_farmlands_cart_02",
				"pdr_level_farmlands_cart_03",
				"pdr_level_farmlands_cart_04"
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
				4.5978751182556,
				1.9599583148956,
				2.8542292118073,
				1.8132083415985
			},
			localization_strings = {
				"pdr_level_farmlands_cart_01",
				"pdr_level_farmlands_cart_02",
				"pdr_level_farmlands_cart_03",
				"pdr_level_farmlands_cart_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_prisoners_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_prisoners_01",
				"pdr_level_farmlands_prisoners_02",
				"pdr_level_farmlands_prisoners_03",
				"pdr_level_farmlands_prisoners_04"
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
				5.9417500495911,
				2.9075417518616,
				3.6526041030884,
				3.4025626182556
			},
			localization_strings = {
				"pdr_level_farmlands_prisoners_01",
				"pdr_level_farmlands_prisoners_02",
				"pdr_level_farmlands_prisoners_03",
				"pdr_level_farmlands_prisoners_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_deserted_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_deserted_01",
				"pdr_level_farmlands_deserted_02",
				"pdr_level_farmlands_deserted_03",
				"pdr_level_farmlands_deserted_04"
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
				4.5661458969116,
				2.6438958644867,
				2.8723750114441,
				4.3191876411438
			},
			localization_strings = {
				"pdr_level_farmlands_deserted_01",
				"pdr_level_farmlands_deserted_02",
				"pdr_level_farmlands_deserted_03",
				"pdr_level_farmlands_deserted_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_smoke_plume_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_smoke_plume_01",
				"pdr_level_farmlands_smoke_plume_02",
				"pdr_level_farmlands_smoke_plume_03",
				"pdr_level_farmlands_smoke_plume_04"
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
				5.8307085037231,
				4.5639581680298,
				5.0969581604004,
				3.4567
			},
			localization_strings = {
				"pdr_level_farmlands_smoke_plume_01",
				"pdr_level_farmlands_smoke_plume_02",
				"pdr_level_farmlands_smoke_plume_03",
				"pdr_level_farmlands_smoke_plume_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_end_level_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_end_level_01",
				"pdr_level_farmlands_end_level_02",
				"pdr_level_farmlands_end_level_03",
				"pdr_level_farmlands_end_level_04"
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
				2.6758332252502,
				2.0434999465942,
				3.3850834369659,
				7.7023539543152
			},
			localization_strings = {
				"pdr_level_farmlands_end_level_01",
				"pdr_level_farmlands_end_level_02",
				"pdr_level_farmlands_end_level_03",
				"pdr_level_farmlands_end_level_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_next_farm_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_next_farm_01",
				"pdr_level_farmlands_next_farm_02",
				"pdr_level_farmlands_next_farm_03",
				"pdr_level_farmlands_next_farm_04"
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
				2.8051249980927,
				2.9531667232513,
				3.3287291526794,
				3.7240624427795
			},
			localization_strings = {
				"pdr_level_farmlands_next_farm_01",
				"pdr_level_farmlands_next_farm_02",
				"pdr_level_farmlands_next_farm_03",
				"pdr_level_farmlands_next_farm_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_unlocking_the_cage_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_unlocking_the_cage_01",
				"pdr_level_farmlands_unlocking_the_cage_02",
				"pdr_level_farmlands_unlocking_the_cage_03",
				"pdr_level_farmlands_unlocking_the_cage_04"
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
				2.963666677475,
				2.2269582748413,
				2.3253540992737,
				1.8982917070389
			},
			localization_strings = {
				"pdr_level_farmlands_unlocking_the_cage_01",
				"pdr_level_farmlands_unlocking_the_cage_02",
				"pdr_level_farmlands_unlocking_the_cage_03",
				"pdr_level_farmlands_unlocking_the_cage_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmland_stick_to_the_road_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmland_stick_to_the_road_01",
				"pdr_level_farmland_stick_to_the_road_02",
				"pdr_level_farmland_stick_to_the_road_03",
				"pdr_level_farmland_stick_to_the_road_04"
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
				5.5881876945496,
				2.6668541431427,
				2.6469790935516,
				4.9362502098083
			},
			localization_strings = {
				"pdr_level_farmland_stick_to_the_road_01",
				"pdr_level_farmland_stick_to_the_road_02",
				"pdr_level_farmland_stick_to_the_road_03",
				"pdr_level_farmland_stick_to_the_road_04"
			},
			randomize_indexes = {}
		},
		pdr_farmlands_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_farmlands_intro_a_01",
				[2.0] = "pdr_farmlands_intro_a_02"
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
				[1.0] = 5.7805624008179,
				[2.0] = 5.0056667327881
			},
			localization_strings = {
				[1.0] = "pdr_farmlands_intro_a_01",
				[2.0] = "pdr_farmlands_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_portal_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_portal_01",
				"pdr_level_farmlands_portal_02",
				"pdr_level_farmlands_portal_03",
				"pdr_level_farmlands_portal_04"
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
				4.4517498016357,
				3.590437412262,
				5.167396068573,
				4.095187664032
			},
			localization_strings = {
				"pdr_level_farmlands_portal_01",
				"pdr_level_farmlands_portal_02",
				"pdr_level_farmlands_portal_03",
				"pdr_level_farmlands_portal_04"
			},
			randomize_indexes = {}
		},
		pdr_farmlands_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_farmlands_intro_b_01",
				[2.0] = "pdr_farmlands_intro_b_02"
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
				[1.0] = 5.6740417480469,
				[2.0] = 1.767041683197
			},
			localization_strings = {
				[1.0] = "pdr_farmlands_intro_b_01",
				[2.0] = "pdr_farmlands_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_locked_gate_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_locked_gate_01",
				"pdr_level_farmlands_locked_gate_02",
				"pdr_level_farmlands_locked_gate_03",
				"pdr_level_farmlands_locked_gate_04"
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
				2.9201667308807,
				2.7237501144409,
				3.8112292289734,
				3.3149790763855
			},
			localization_strings = {
				"pdr_level_farmlands_locked_gate_01",
				"pdr_level_farmlands_locked_gate_02",
				"pdr_level_farmlands_locked_gate_03",
				"pdr_level_farmlands_locked_gate_04"
			},
			randomize_indexes = {}
		},
		pdr_level_farmlands_move_on_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_farmland",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_farmlands_move_on_01",
				"pdr_level_farmlands_move_on_02",
				"pdr_level_farmlands_move_on_03",
				"pdr_level_farmlands_move_on_04"
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
				4.451708316803,
				3.5213124752045,
				3.3913333415985,
				1.88181245327
			},
			localization_strings = {
				"pdr_level_farmlands_move_on_01",
				"pdr_level_farmlands_move_on_02",
				"pdr_level_farmlands_move_on_03",
				"pdr_level_farmlands_move_on_04"
			},
			randomize_indexes = {}
		}
	})
end
