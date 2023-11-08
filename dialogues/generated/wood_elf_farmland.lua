return function ()
	define_rule({
		name = "pwe_farmlands_intro_a",
		response = "pwe_farmlands_intro_a",
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
		name = "pwe_farmlands_intro_b",
		response = "pwe_farmlands_intro_b",
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
				"wood_elf"
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
		name = "pwe_farmlands_intro_c",
		response = "pwe_farmlands_intro_c",
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
				"wood_elf"
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
	define_rule({
		name = "pwe_level_farmland_stick_to_the_road_01",
		response = "pwe_level_farmland_stick_to_the_road_01",
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
		name = "pwe_level_farmlands_cart_01",
		response = "pwe_level_farmlands_cart_01",
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
		name = "pwe_level_farmlands_deserted_01",
		response = "pwe_level_farmlands_deserted_01",
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
		name = "pwe_level_farmlands_end_level_01",
		response = "pwe_level_farmlands_end_level_01",
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
		name = "pwe_level_farmlands_fence_01",
		response = "pwe_level_farmlands_fence_01",
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
		name = "pwe_level_farmlands_investigate_farm_01",
		response = "pwe_level_farmlands_investigate_farm_01",
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
		name = "pwe_level_farmlands_kill_the_brute_01",
		response = "pwe_level_farmlands_kill_the_brute_01",
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
		name = "pwe_level_farmlands_last_farm_01",
		response = "pwe_level_farmlands_last_farm_01",
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
		name = "pwe_level_farmlands_locked_gate_01",
		response = "pwe_level_farmlands_locked_gate_01",
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
		name = "pwe_level_farmlands_monster_in_barn_01",
		response = "pwe_level_farmlands_monster_in_barn_01",
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
		name = "pwe_level_farmlands_move_on_01",
		response = "pwe_level_farmlands_move_on_01",
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
		name = "pwe_level_farmlands_next_farm_01",
		response = "pwe_level_farmlands_next_farm_01",
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
		name = "pwe_level_farmlands_no_prisoners_01",
		response = "pwe_level_farmlands_no_prisoners_01",
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
		name = "pwe_level_farmlands_orchard_01",
		response = "pwe_level_farmlands_orchard_01",
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
		name = "pwe_level_farmlands_prisoners_01",
		response = "pwe_level_farmlands_prisoners_01",
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
		name = "pwe_level_farmlands_smoke_plume_01",
		response = "pwe_level_farmlands_smoke_plume_01",
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
		name = "pwe_level_farmlands_through_the_barn_01",
		response = "pwe_level_farmlands_through_the_barn_01",
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
		name = "pwe_level_farmlands_unlocking_the_cage_01",
		response = "pwe_level_farmlands_unlocking_the_cage_01",
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
	add_dialogues({
		pwe_farmlands_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_farmland",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_farmlands_intro_a_01",
				[2.0] = "pwe_farmlands_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_farmlands_intro_a_01",
				[2.0] = "pwe_farmlands_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 5.0183334350586,
				[2.0] = 6.5060415267944
			}
		},
		pwe_farmlands_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_farmland",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_farmlands_intro_b_01",
				[2.0] = "pwe_farmlands_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_farmlands_intro_b_01",
				[2.0] = "pwe_farmlands_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 5.4818539619446,
				[2.0] = 4.9928541183472
			}
		},
		pwe_farmlands_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_farmland",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_farmlands_intro_c_01",
				[2.0] = "pwe_farmlands_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_farmlands_intro_c_01",
				[2.0] = "pwe_farmlands_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.5533747673035,
				[2.0] = 5.18452501297
			}
		},
		pwe_level_farmland_stick_to_the_road_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_level_farmland_stick_to_the_road_01",
				"pwe_level_farmland_stick_to_the_road_02",
				"pwe_level_farmland_stick_to_the_road_03",
				"pwe_level_farmland_stick_to_the_road_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmland_stick_to_the_road_01",
				"pwe_level_farmland_stick_to_the_road_02",
				"pwe_level_farmland_stick_to_the_road_03",
				"pwe_level_farmland_stick_to_the_road_04"
			},
			sound_events_duration = {
				4.2829790115356,
				2.6000626087189,
				4.8709373474121,
				5.6319789886475
			}
		},
		pwe_level_farmlands_cart_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_level_farmlands_cart_01",
				"pwe_level_farmlands_cart_02",
				"pwe_level_farmlands_cart_03",
				"pwe_level_farmlands_cart_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_cart_01",
				"pwe_level_farmlands_cart_02",
				"pwe_level_farmlands_cart_03",
				"pwe_level_farmlands_cart_04"
			},
			sound_events_duration = {
				1.943062543869,
				2.0757917165756,
				4.2956876754761,
				4.8050208091736
			}
		},
		pwe_level_farmlands_deserted_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_level_farmlands_deserted_01",
				"pwe_level_farmlands_deserted_02",
				"pwe_level_farmlands_deserted_03",
				"pwe_level_farmlands_deserted_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_deserted_01",
				"pwe_level_farmlands_deserted_02",
				"pwe_level_farmlands_deserted_03",
				"pwe_level_farmlands_deserted_04"
			},
			sound_events_duration = {
				2.4711041450501,
				3.6129999160767,
				3.6514896154404,
				3.4322082996368
			}
		},
		pwe_level_farmlands_end_level_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
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
				"pwe_level_farmlands_end_level_01",
				"pwe_level_farmlands_end_level_02",
				"pwe_level_farmlands_end_level_03",
				"pwe_level_farmlands_end_level_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_end_level_01",
				"pwe_level_farmlands_end_level_02",
				"pwe_level_farmlands_end_level_03",
				"pwe_level_farmlands_end_level_04"
			},
			sound_events_duration = {
				4.26327085495,
				4.5220832824707,
				3.069854259491,
				5.0796666145325
			}
		},
		pwe_level_farmlands_fence_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
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
				"pwe_level_farmlands_fence_01",
				"pwe_level_farmlands_fence_02",
				"pwe_level_farmlands_fence_03",
				"pwe_level_farmlands_fence_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_fence_01",
				"pwe_level_farmlands_fence_02",
				"pwe_level_farmlands_fence_03",
				"pwe_level_farmlands_fence_04"
			},
			sound_events_duration = {
				2.6439478397369,
				7.374041557312,
				3.8764584064484,
				3.4790415763855
			}
		},
		pwe_level_farmlands_investigate_farm_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_level_farmlands_investigate_farm_01",
				"pwe_level_farmlands_investigate_farm_02",
				"pwe_level_farmlands_investigate_farm_03",
				"pwe_level_farmlands_investigate_farm_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_investigate_farm_01",
				"pwe_level_farmlands_investigate_farm_02",
				"pwe_level_farmlands_investigate_farm_03",
				"pwe_level_farmlands_investigate_farm_04"
			},
			sound_events_duration = {
				3.7820000648499,
				2.4317917823791,
				3.5186874866486,
				3.9617917537689
			}
		},
		pwe_level_farmlands_kill_the_brute_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
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
				"pwe_level_farmlands_kill_the_brute_01",
				"pwe_level_farmlands_kill_the_brute_02",
				"pwe_level_farmlands_kill_the_brute_03",
				"pwe_level_farmlands_kill_the_brute_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_kill_the_brute_01",
				"pwe_level_farmlands_kill_the_brute_02",
				"pwe_level_farmlands_kill_the_brute_03",
				"pwe_level_farmlands_kill_the_brute_04"
			},
			sound_events_duration = {
				1.4956041574478,
				4.3625626564026,
				3.4339375495911,
				3.3517291545868
			}
		},
		pwe_level_farmlands_last_farm_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
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
				"pwe_level_farmlands_last_farm_01",
				"pwe_level_farmlands_last_farm_02",
				"pwe_level_farmlands_last_farm_03",
				"pwe_level_farmlands_last_farm_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_last_farm_01",
				"pwe_level_farmlands_last_farm_02",
				"pwe_level_farmlands_last_farm_03",
				"pwe_level_farmlands_last_farm_04"
			},
			sound_events_duration = {
				4.3973956108093,
				5.3956251144409,
				4.2848334312439,
				4.964729309082
			}
		},
		pwe_level_farmlands_locked_gate_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_level_farmlands_locked_gate_01",
				"pwe_level_farmlands_locked_gate_02",
				"pwe_level_farmlands_locked_gate_03",
				"pwe_level_farmlands_locked_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_locked_gate_01",
				"pwe_level_farmlands_locked_gate_02",
				"pwe_level_farmlands_locked_gate_03",
				"pwe_level_farmlands_locked_gate_04"
			},
			sound_events_duration = {
				3.2205624580383,
				3.9907083511352,
				2.1463749408722,
				4.8778958320618
			}
		},
		pwe_level_farmlands_monster_in_barn_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
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
				"pwe_level_farmlands_monster_in_barn_01",
				"pwe_level_farmlands_monster_in_barn_02",
				"pwe_level_farmlands_monster_in_barn_03",
				"pwe_level_farmlands_monster_in_barn_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_monster_in_barn_01",
				"pwe_level_farmlands_monster_in_barn_02",
				"pwe_level_farmlands_monster_in_barn_03",
				"pwe_level_farmlands_monster_in_barn_04"
			},
			sound_events_duration = {
				3.0386250019074,
				2.8240625858307,
				4.5222706794739,
				4.7777500152588
			}
		},
		pwe_level_farmlands_move_on_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
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
				"pwe_level_farmlands_move_on_01",
				"pwe_level_farmlands_move_on_02",
				"pwe_level_farmlands_move_on_03",
				"pwe_level_farmlands_move_on_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_move_on_01",
				"pwe_level_farmlands_move_on_02",
				"pwe_level_farmlands_move_on_03",
				"pwe_level_farmlands_move_on_04"
			},
			sound_events_duration = {
				3.8376667499542,
				3.586895942688,
				3.6056458950043,
				1.6956249475479
			}
		},
		pwe_level_farmlands_next_farm_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_level_farmlands_next_farm_01",
				"pwe_level_farmlands_next_farm_02",
				"pwe_level_farmlands_next_farm_03",
				"pwe_level_farmlands_next_farm_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_next_farm_01",
				"pwe_level_farmlands_next_farm_02",
				"pwe_level_farmlands_next_farm_03",
				"pwe_level_farmlands_next_farm_04"
			},
			sound_events_duration = {
				4.2348127365112,
				2.5003957748413,
				2.215541601181,
				2.2608542442322
			}
		},
		pwe_level_farmlands_no_prisoners_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_level_farmlands_no_prisoners_01",
				"pwe_level_farmlands_no_prisoners_02",
				"pwe_level_farmlands_no_prisoners_03",
				"pwe_level_farmlands_no_prisoners_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_no_prisoners_01",
				"pwe_level_farmlands_no_prisoners_02",
				"pwe_level_farmlands_no_prisoners_03",
				"pwe_level_farmlands_no_prisoners_04"
			},
			sound_events_duration = {
				2.571729183197,
				2.1102917194366,
				3.3713958263397,
				3.0979375839233
			}
		},
		pwe_level_farmlands_orchard_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_level_farmlands_orchard_01",
				"pwe_level_farmlands_orchard_02",
				"pwe_level_farmlands_orchard_03",
				"pwe_level_farmlands_orchard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_orchard_01",
				"pwe_level_farmlands_orchard_02",
				"pwe_level_farmlands_orchard_03",
				"pwe_level_farmlands_orchard_04"
			},
			sound_events_duration = {
				3.5805416107178,
				5.0118751525879,
				4.3318748474121,
				6.4182081222534
			}
		},
		pwe_level_farmlands_prisoners_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
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
				"pwe_level_farmlands_prisoners_01",
				"pwe_level_farmlands_prisoners_02",
				"pwe_level_farmlands_prisoners_03",
				"pwe_level_farmlands_prisoners_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_prisoners_01",
				"pwe_level_farmlands_prisoners_02",
				"pwe_level_farmlands_prisoners_03",
				"pwe_level_farmlands_prisoners_04"
			},
			sound_events_duration = {
				2.6494166851044,
				4.2918748855591,
				3.8159999847412,
				6.4894375801086
			}
		},
		pwe_level_farmlands_smoke_plume_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
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
				"pwe_level_farmlands_smoke_plume_01",
				"pwe_level_farmlands_smoke_plume_02",
				"pwe_level_farmlands_smoke_plume_03",
				"pwe_level_farmlands_smoke_plume_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_smoke_plume_01",
				"pwe_level_farmlands_smoke_plume_02",
				"pwe_level_farmlands_smoke_plume_03",
				"pwe_level_farmlands_smoke_plume_04"
			},
			sound_events_duration = {
				3.9401457309723,
				4.8610625267029,
				2.4665417671204,
				3.8738958835602
			}
		},
		pwe_level_farmlands_through_the_barn_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
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
				"pwe_level_farmlands_through_the_barn_01",
				"pwe_level_farmlands_through_the_barn_02",
				"pwe_level_farmlands_through_the_barn_03",
				"pwe_level_farmlands_through_the_barn_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_through_the_barn_01",
				"pwe_level_farmlands_through_the_barn_02",
				"pwe_level_farmlands_through_the_barn_03",
				"pwe_level_farmlands_through_the_barn_04"
			},
			sound_events_duration = {
				2.0104582309723,
				2.1881875991821,
				2.5605417490006,
				2.2410416603088
			}
		},
		pwe_level_farmlands_unlocking_the_cage_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_farmland",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_level_farmlands_unlocking_the_cage_01",
				"pwe_level_farmlands_unlocking_the_cage_02",
				"pwe_level_farmlands_unlocking_the_cage_03",
				"pwe_level_farmlands_unlocking_the_cage_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_farmlands_unlocking_the_cage_01",
				"pwe_level_farmlands_unlocking_the_cage_02",
				"pwe_level_farmlands_unlocking_the_cage_03",
				"pwe_level_farmlands_unlocking_the_cage_04"
			},
			sound_events_duration = {
				1.5481666326523,
				2.1335833072662,
				3.0283124446869,
				3.3544166088104
			}
		}
	})
end
