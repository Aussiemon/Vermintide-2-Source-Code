return function ()
	define_rule({
		name = "pes_castle_intro_line_a",
		response = "pes_castle_intro_line_a",
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
				"castle_intro_line_a"
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
				"castle_intro_line_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_intro_line_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_intro_line_b",
		response = "pes_castle_intro_line_b",
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
				"castle_intro_line_a"
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
				"castle_intro_line_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_intro_line_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_intro_line_c",
		response = "pes_castle_intro_line_c",
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
				"castle_intro_line_b"
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
				"castle_intro_line_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_intro_line_c",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_door_open",
		response = "pes_castle_vo_door_open",
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
				"castle_vo_door_open"
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
				"castle_vo_door_open",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_door_open",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_hello",
		response = "pes_castle_vo_hello",
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
				"castle_vo_hello"
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
				"castle_vo_hello",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_hello",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_traces_one",
		response = "pes_castle_vo_traces_one",
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
				"castle_vo_traces_one"
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
				"castle_vo_traces_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_traces_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_enter",
		response = "pes_castle_vo_enter",
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
				"castle_vo_enter"
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
				"castle_vo_enter",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_enter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_this_way",
		response = "pes_castle_vo_this_way",
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
				"castle_vo_this_way"
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
				"castle_vo_this_way",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_this_way",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_landed",
		response = "pes_castle_vo_landed",
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
				"castle_vo_landed"
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
				"castle_vo_landed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_landed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_find_a_way_up",
		response = "pes_castle_vo_find_a_way_up",
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
				"castle_vo_find_a_way_up"
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
				"castle_vo_find_a_way_up",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_find_a_way_up",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_blood_pool",
		response = "pes_castle_vo_blood_pool",
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
				"castle_vo_blood_pool"
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
				"castle_vo_blood_pool",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_blood_pool",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_recognize",
		response = "pes_castle_vo_recognize",
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
				"castle_vo_recognize"
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
				"castle_vo_recognize",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_recognize",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_do_not_recognize",
		response = "pes_castle_vo_do_not_recognize",
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
				"castle_vo_do_not_recognize"
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
				"castle_vo_do_not_recognize",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_do_not_recognize",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_trap_switch",
		response = "pes_castle_vo_trap_switch",
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
				"castle_vo_trap_switch"
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
				"castle_vo_trap_switch",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_trap_switch",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_secret_door",
		response = "pes_castle_vo_secret_door",
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
				"castle_vo_secret_door"
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
				"castle_vo_secret_door",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_secret_door",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_halls",
		response = "pes_castle_vo_halls",
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
				"castle_vo_halls"
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
				"castle_vo_halls",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_halls",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_search_again",
		response = "pes_castle_vo_search_again",
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
				"castle_vo_search_again"
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
				"castle_vo_search_again",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_search_again",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_blockage",
		response = "pes_castle_vo_blockage",
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
				"castle_vo_blockage"
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
				"castle_vo_blockage",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_blockage",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_throne_room_approach",
		response = "pes_castle_vo_throne_room_approach",
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
				"castle_vo_throne_room_approach"
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
				"castle_vo_throne_room_approach",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_throne_room_approach",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_vista",
		response = "pes_castle_vo_vista",
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
				"castle_vo_vista"
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
				"castle_vo_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_approaching_throne_room",
		response = "pes_castle_vo_approaching_throne_room",
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
				"castle_vo_approaching_throne_room"
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
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_ meet_sorcerer",
		response = "pes_castle_vo_ meet_sorcerer",
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
				"castle_vo_ meet_sorcerer"
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
				"castle_vo_ meet_sorcerer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_ meet_sorcerer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_sorcerer_slain",
		response = "pes_castle_vo_sorcerer_slain",
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
				"castle_vo_sorcerer_slain"
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
				"castle_vo_sorcerer_slain",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_sorcerer_slain",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_drop_down",
		response = "pes_castle_vo_drop_down",
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
				"castle_vo_drop_down"
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
				"castle_vo_drop_down",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_drop_down",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_crypt_discovered",
		response = "pes_castle_vo_crypt_discovered",
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
				"castle_vo_crypt_discovered"
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
				"castle_vo_crypt_discovered",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_crypt_discovered",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_castle_vo_crypt_not_discovered",
		response = "pes_castle_vo_crypt_not_discovered",
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
				"castle_vo_crypt_not_discovered"
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
				"castle_vo_crypt_not_discovered",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_crypt_not_discovered",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pes_castle_intro_line_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_castle_intro_line_b_01",
				[2.0] = "pes_castle_intro_line_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.4528124332428,
				[2.0] = 3.6227290630341
			},
			sound_events = {
				[1.0] = "pes_castle_intro_line_b_01",
				[2.0] = "pes_castle_intro_line_b_02"
			}
		},
		pes_castle_vo_secret_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_secret_door_01",
				"pes_castle_vo_secret_door_02",
				"pes_castle_vo_secret_door_03",
				"pes_castle_vo_secret_door_04"
			},
			sound_events_duration = {
				1.7486666440964,
				2.0526459217072,
				2.7913334369659,
				1.8678541183472
			},
			sound_events = {
				"pes_castle_vo_secret_door_01",
				"pes_castle_vo_secret_door_02",
				"pes_castle_vo_secret_door_03",
				"pes_castle_vo_secret_door_04"
			}
		},
		pes_castle_vo_halls = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_halls_01",
				"pes_castle_vo_halls_02",
				"pes_castle_vo_halls_03",
				"pes_castle_vo_halls_04"
			},
			sound_events_duration = {
				1.6523958444595,
				4.2540831565857,
				2.4104790687561,
				2.178750038147
			},
			sound_events = {
				"pes_castle_vo_halls_01",
				"pes_castle_vo_halls_02",
				"pes_castle_vo_halls_03",
				"pes_castle_vo_halls_04"
			}
		},
		pes_castle_vo_this_way = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_this_way_01",
				"pes_castle_vo_this_way_02",
				"pes_castle_vo_this_way_03",
				"pes_castle_vo_this_way_04"
			},
			sound_events_duration = {
				1.3788750171661,
				1.9117292165756,
				1.3727707862854,
				1.5285416841507
			},
			sound_events = {
				"pes_castle_vo_this_way_01",
				"pes_castle_vo_this_way_02",
				"pes_castle_vo_this_way_03",
				"pes_castle_vo_this_way_04"
			}
		},
		pes_castle_vo_find_a_way_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_find_a_way_up_01",
				"pes_castle_vo_find_a_way_up_02",
				"pes_castle_vo_find_a_way_up_03",
				"pes_castle_vo_find_a_way_up_04"
			},
			sound_events_duration = {
				1.9917500019074,
				3.5522084236145,
				1.7714791297913,
				2.1842083930969
			},
			sound_events = {
				"pes_castle_vo_find_a_way_up_01",
				"pes_castle_vo_find_a_way_up_02",
				"pes_castle_vo_find_a_way_up_03",
				"pes_castle_vo_find_a_way_up_04"
			}
		},
		pes_castle_vo_crypt_not_discovered = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_crypt_not_discovered_01",
				"pes_castle_vo_crypt_not_discovered_02",
				"pes_castle_vo_crypt_not_discovered_03",
				"pes_castle_vo_crypt_not_discovered_04"
			},
			sound_events_duration = {
				3.0245833396912,
				1.6643542051315,
				4.0902915000916,
				3.7941040992737
			},
			sound_events = {
				"pes_castle_vo_crypt_not_discovered_01",
				"pes_castle_vo_crypt_not_discovered_02",
				"pes_castle_vo_crypt_not_discovered_03",
				"pes_castle_vo_crypt_not_discovered_04"
			}
		},
		pes_castle_vo_hello = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_hello_01",
				"pes_castle_vo_hello_02",
				"pes_castle_vo_hello_03",
				"pes_castle_vo_hello_04"
			},
			sound_events_duration = {
				1.4148958921433,
				3.5601665973663,
				2.419625043869,
				1.1198749542236
			},
			sound_events = {
				"pes_castle_vo_hello_01",
				"pes_castle_vo_hello_02",
				"pes_castle_vo_hello_03",
				"pes_castle_vo_hello_04"
			}
		},
		pes_castle_vo_crypt_discovered = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_crypt_discovered_01",
				"pes_castle_vo_crypt_discovered_02",
				"pes_castle_vo_crypt_discovered_03",
				"pes_castle_vo_crypt_discovered_04"
			},
			sound_events_duration = {
				3.3694167137146,
				3.5015833377838,
				3.1243751049042,
				4.1153125762939
			},
			sound_events = {
				"pes_castle_vo_crypt_discovered_01",
				"pes_castle_vo_crypt_discovered_02",
				"pes_castle_vo_crypt_discovered_03",
				"pes_castle_vo_crypt_discovered_04"
			}
		},
		pes_castle_vo_landed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_landed_01",
				"pes_castle_vo_landed_02",
				"pes_castle_vo_landed_03",
				"pes_castle_vo_landed_04"
			},
			sound_events_duration = {
				3.3518333435059,
				2.4423959255219,
				2.6526250839233,
				2.6537499427795
			},
			sound_events = {
				"pes_castle_vo_landed_01",
				"pes_castle_vo_landed_02",
				"pes_castle_vo_landed_03",
				"pes_castle_vo_landed_04"
			}
		},
		pes_castle_vo_blood_pool = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_blood_pool_01",
				"pes_castle_vo_blood_pool_02",
				"pes_castle_vo_blood_pool_03",
				"pes_castle_vo_blood_pool_04"
			},
			sound_events_duration = {
				2.8253333568573,
				2.7076041698456,
				3.1256875991821,
				3.9008541107178
			},
			sound_events = {
				"pes_castle_vo_blood_pool_01",
				"pes_castle_vo_blood_pool_02",
				"pes_castle_vo_blood_pool_03",
				"pes_castle_vo_blood_pool_04"
			}
		},
		pes_castle_intro_line_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_castle_intro_line_a_01",
				[2.0] = "pes_castle_intro_line_a_02"
			},
			sound_events_duration = {
				[1.0] = 5.2668747901917,
				[2.0] = 4.765604019165
			},
			sound_events = {
				[1.0] = "pes_castle_intro_line_a_01",
				[2.0] = "pes_castle_intro_line_a_02"
			}
		},
		pes_castle_vo_drop_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_drop_down_01",
				"pes_castle_vo_drop_down_02",
				"pes_castle_vo_drop_down_03",
				"pes_castle_vo_drop_down_04"
			},
			sound_events_duration = {
				1.6254374980927,
				4.4937500953674,
				3.2436459064484,
				2.7293748855591
			},
			sound_events = {
				"pes_castle_vo_drop_down_01",
				"pes_castle_vo_drop_down_02",
				"pes_castle_vo_drop_down_03",
				"pes_castle_vo_drop_down_04"
			}
		},
		pes_castle_vo_sorcerer_slain = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_sorcerer_slain_01",
				"pes_castle_vo_sorcerer_slain_02",
				"pes_castle_vo_sorcerer_slain_03",
				"pes_castle_vo_sorcerer_slain_04"
			},
			sound_events_duration = {
				2.5735833644867,
				5.7061667442322,
				5.1990418434143,
				5.7409167289734
			},
			sound_events = {
				"pes_castle_vo_sorcerer_slain_01",
				"pes_castle_vo_sorcerer_slain_02",
				"pes_castle_vo_sorcerer_slain_03",
				"pes_castle_vo_sorcerer_slain_04"
			}
		},
		["pes_castle_vo_ meet_sorcerer"] = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_ meet_sorcerer_01",
				"pes_castle_vo_ meet_sorcerer_02",
				"pes_castle_vo_ meet_sorcerer_03",
				"pes_castle_vo_ meet_sorcerer_04"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			sound_events = {
				"pes_castle_vo_ meet_sorcerer_01",
				"pes_castle_vo_ meet_sorcerer_02",
				"pes_castle_vo_ meet_sorcerer_03",
				"pes_castle_vo_ meet_sorcerer_04"
			}
		},
		pes_castle_vo_trap_switch = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_trap_switch_01",
				"pes_castle_vo_trap_switch_02",
				"pes_castle_vo_trap_switch_03",
				"pes_castle_vo_trap_switch_04"
			},
			sound_events_duration = {
				3.0958125591278,
				2.332729101181,
				2.6972708702087,
				2.5796666145325
			},
			sound_events = {
				"pes_castle_vo_trap_switch_01",
				"pes_castle_vo_trap_switch_02",
				"pes_castle_vo_trap_switch_03",
				"pes_castle_vo_trap_switch_04"
			}
		},
		pes_castle_vo_throne_room_approach = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_throne_room_approach_01",
				"pes_castle_vo_throne_room_approach_02",
				"pes_castle_vo_throne_room_approach_03",
				"pes_castle_vo_throne_room_approach_04"
			},
			sound_events_duration = {
				4.4421668052673,
				3.5498750209808,
				3.2623541355133,
				2.8339583873749
			},
			sound_events = {
				"pes_castle_vo_throne_room_approach_01",
				"pes_castle_vo_throne_room_approach_02",
				"pes_castle_vo_throne_room_approach_03",
				"pes_castle_vo_throne_room_approach_04"
			}
		},
		pes_castle_intro_line_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_castle_intro_line_c_01",
				[2.0] = "pes_castle_intro_line_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.3237707614899,
				[2.0] = 2.9898228645325
			},
			sound_events = {
				[1.0] = "pes_castle_intro_line_c_01",
				[2.0] = "pes_castle_intro_line_c_02"
			}
		},
		pes_castle_vo_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_vista_01",
				"pes_castle_vo_vista_02",
				"pes_castle_vo_vista_03",
				"pes_castle_vo_vista_04"
			},
			sound_events_duration = {
				2.7843332290649,
				4.3219375610352,
				4.1100625991821,
				4.478000164032
			},
			sound_events = {
				"pes_castle_vo_vista_01",
				"pes_castle_vo_vista_02",
				"pes_castle_vo_vista_03",
				"pes_castle_vo_vista_04"
			}
		},
		pes_castle_vo_blockage = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_blockage_01",
				"pes_castle_vo_blockage_02",
				"pes_castle_vo_blockage_03",
				"pes_castle_vo_blockage_04"
			},
			sound_events_duration = {
				0.96564584970474,
				1.2841249704361,
				1.7470208406448,
				2.9096040725708
			},
			sound_events = {
				"pes_castle_vo_blockage_01",
				"pes_castle_vo_blockage_02",
				"pes_castle_vo_blockage_03",
				"pes_castle_vo_blockage_04"
			}
		},
		pes_castle_vo_search_again = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_search_again_01",
				"pes_castle_vo_search_again_02",
				"pes_castle_vo_search_again_03",
				"pes_castle_vo_search_again_04"
			},
			sound_events_duration = {
				2.1256875991821,
				2.3976666927338,
				2.3260834217072,
				3.6737604141235
			},
			sound_events = {
				"pes_castle_vo_search_again_01",
				"pes_castle_vo_search_again_02",
				"pes_castle_vo_search_again_03",
				"pes_castle_vo_search_again_04"
			}
		},
		pes_castle_vo_do_not_recognize = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_do_not_recognize_01",
				"pes_castle_vo_do_not_recognize_02",
				"pes_castle_vo_do_not_recognize_03",
				"pes_castle_vo_do_not_recognize_04"
			},
			sound_events_duration = {
				3.5043957233429,
				3.7019791603088,
				1.8539999723434,
				3.0175416469574
			},
			sound_events = {
				"pes_castle_vo_do_not_recognize_01",
				"pes_castle_vo_do_not_recognize_02",
				"pes_castle_vo_do_not_recognize_03",
				"pes_castle_vo_do_not_recognize_04"
			}
		},
		pes_castle_vo_enter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_enter_01",
				"pes_castle_vo_enter_02",
				"pes_castle_vo_enter_03",
				"pes_castle_vo_enter_04"
			},
			sound_events_duration = {
				1.2123750448227,
				2.784083366394,
				2.6095209121704,
				1.7272708415985
			},
			sound_events = {
				"pes_castle_vo_enter_01",
				"pes_castle_vo_enter_02",
				"pes_castle_vo_enter_03",
				"pes_castle_vo_enter_04"
			}
		},
		pes_castle_vo_door_open = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_door_open_01",
				"pes_castle_vo_door_open_02",
				"pes_castle_vo_door_open_03",
				"pes_castle_vo_door_open_04"
			},
			sound_events_duration = {
				5.1703333854675,
				2.1166250705719,
				3.9332292079926,
				2.4173958301544
			},
			sound_events = {
				"pes_castle_vo_door_open_01",
				"pes_castle_vo_door_open_02",
				"pes_castle_vo_door_open_03",
				"pes_castle_vo_door_open_04"
			}
		},
		pes_castle_vo_traces_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_traces_one_01",
				"pes_castle_vo_traces_one_02",
				"pes_castle_vo_traces_one_03",
				"pes_castle_vo_traces_one_04"
			},
			sound_events_duration = {
				2.2758333683014,
				2.6766457557678,
				2.9223124980927,
				4.6904997825623
			},
			sound_events = {
				"pes_castle_vo_traces_one_01",
				"pes_castle_vo_traces_one_02",
				"pes_castle_vo_traces_one_03",
				"pes_castle_vo_traces_one_04"
			}
		},
		pes_castle_vo_recognize = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_recognize_01",
				"pes_castle_vo_recognize_02",
				"pes_castle_vo_recognize_03",
				"pes_castle_vo_recognize_04"
			},
			sound_events_duration = {
				2.3449583053589,
				1.8663125038147,
				4.3904581069946,
				3.2056040763855
			},
			sound_events = {
				"pes_castle_vo_recognize_01",
				"pes_castle_vo_recognize_02",
				"pes_castle_vo_recognize_03",
				"pes_castle_vo_recognize_04"
			}
		},
		pes_castle_vo_approaching_throne_room = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			localization_strings = {
				"pes_castle_vo_approaching_throne_room_01",
				"pes_castle_vo_approaching_throne_room_02",
				"pes_castle_vo_approaching_throne_room_03",
				"pes_castle_vo_approaching_throne_room_04"
			},
			sound_events_duration = {
				2.4938333034515,
				3.9053542613983,
				3.1235625743866,
				2.7332499027252
			},
			sound_events = {
				"pes_castle_vo_approaching_throne_room_01",
				"pes_castle_vo_approaching_throne_room_02",
				"pes_castle_vo_approaching_throne_room_03",
				"pes_castle_vo_approaching_throne_room_04"
			}
		}
	})
end
