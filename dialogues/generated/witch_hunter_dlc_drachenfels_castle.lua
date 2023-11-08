return function ()
	define_rule({
		name = "pwh_castle_intro_line_a",
		response = "pwh_castle_intro_line_a",
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
		name = "pwh_castle_intro_line_b",
		response = "pwh_castle_intro_line_b",
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
		name = "pwh_castle_intro_line_c",
		response = "pwh_castle_intro_line_c",
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
		name = "pwh_castle_vo_approaching_throne_room",
		response = "pwh_castle_vo_approaching_throne_room",
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
		name = "pwh_castle_vo_blockage",
		response = "pwh_castle_vo_blockage",
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
		name = "pwh_castle_vo_blood_pool",
		response = "pwh_castle_vo_blood_pool",
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
		name = "pwh_castle_vo_crypt_discovered",
		response = "pwh_castle_vo_crypt_discovered",
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
		name = "pwh_castle_vo_crypt_not_discovered",
		response = "pwh_castle_vo_crypt_not_discovered",
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
	define_rule({
		name = "pwh_castle_vo_do_not_recognize",
		response = "pwh_castle_vo_do_not_recognize",
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
		name = "pwh_castle_vo_door_open",
		response = "pwh_castle_vo_door_open",
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
		name = "pwh_castle_vo_drop_down",
		response = "pwh_castle_vo_drop_down",
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
		name = "pwh_castle_vo_enter",
		response = "pwh_castle_vo_enter",
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
		name = "pwh_castle_vo_find_a_way_up",
		response = "pwh_castle_vo_find_a_way_up",
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
		name = "pwh_castle_vo_halls",
		response = "pwh_castle_vo_halls",
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
		name = "pwh_castle_vo_hello",
		response = "pwh_castle_vo_hello",
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
		name = "pwh_castle_vo_landed",
		response = "pwh_castle_vo_landed",
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
		name = "pwh_castle_vo_meet_sorcerer",
		response = "pwh_castle_vo_meet_sorcerer",
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
				"castle_vo_meet_sorcerer"
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
				"castle_vo_meet_sorcerer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"castle_vo_meet_sorcerer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_castle_vo_recognize",
		response = "pwh_castle_vo_recognize",
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
		name = "pwh_castle_vo_search_again",
		response = "pwh_castle_vo_search_again",
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
		name = "pwh_castle_vo_secret_door",
		response = "pwh_castle_vo_secret_door",
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
		name = "pwh_castle_vo_sorcerer_slain",
		response = "pwh_castle_vo_sorcerer_slain",
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
		name = "pwh_castle_vo_this_way",
		response = "pwh_castle_vo_this_way",
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
		name = "pwh_castle_vo_throne_room_approach",
		response = "pwh_castle_vo_throne_room_approach",
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
		name = "pwh_castle_vo_traces_one",
		response = "pwh_castle_vo_traces_one",
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
		name = "pwh_castle_vo_trap_switch",
		response = "pwh_castle_vo_trap_switch",
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
		name = "pwh_castle_vo_vista",
		response = "pwh_castle_vo_vista",
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
	add_dialogues({
		pwh_castle_intro_line_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				[1.0] = "pwh_castle_intro_line_a_01",
				[2.0] = "pwh_castle_intro_line_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_castle_intro_line_a_01",
				[2.0] = "pwh_castle_intro_line_a_02"
			},
			sound_events_duration = {
				[1.0] = 4.6176252365112,
				[2.0] = 4.940333366394
			}
		},
		pwh_castle_intro_line_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				[1.0] = "pwh_castle_intro_line_b_01",
				[2.0] = "pwh_castle_intro_line_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_castle_intro_line_b_01",
				[2.0] = "pwh_castle_intro_line_b_02"
			},
			sound_events_duration = {
				[1.0] = 5.5480208396912,
				[2.0] = 2.8873333930969
			}
		},
		pwh_castle_intro_line_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				[1.0] = "pwh_castle_intro_line_c_01",
				[2.0] = "pwh_castle_intro_line_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_castle_intro_line_c_01",
				[2.0] = "pwh_castle_intro_line_c_02"
			},
			sound_events_duration = {
				[1.0] = 2.6261665821075,
				[2.0] = 4.3703956604004
			}
		},
		pwh_castle_vo_approaching_throne_room = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_approaching_throne_room_01",
				"pwh_castle_vo_approaching_throne_room_02",
				"pwh_castle_vo_approaching_throne_room_03",
				"pwh_castle_vo_approaching_throne_room_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_approaching_throne_room_01",
				"pwh_castle_vo_approaching_throne_room_02",
				"pwh_castle_vo_approaching_throne_room_03",
				"pwh_castle_vo_approaching_throne_room_04"
			},
			sound_events_duration = {
				3.4591250419617,
				5.114812374115,
				4.5003747940064,
				8.7716245651245
			}
		},
		pwh_castle_vo_blockage = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_blockage_01",
				"pwh_castle_vo_blockage_02",
				"pwh_castle_vo_blockage_03",
				"pwh_castle_vo_blockage_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_blockage_01",
				"pwh_castle_vo_blockage_02",
				"pwh_castle_vo_blockage_03",
				"pwh_castle_vo_blockage_04"
			},
			sound_events_duration = {
				3.5337083339691,
				4.1385626792908,
				4.2964792251587,
				3.3200416564941
			}
		},
		pwh_castle_vo_blood_pool = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_blood_pool_01",
				"pwh_castle_vo_blood_pool_02",
				"pwh_castle_vo_blood_pool_03",
				"pwh_castle_vo_blood_pool_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_blood_pool_01",
				"pwh_castle_vo_blood_pool_02",
				"pwh_castle_vo_blood_pool_03",
				"pwh_castle_vo_blood_pool_04"
			},
			sound_events_duration = {
				3.2637915611267,
				3.0374791622162,
				4.546416759491,
				5.6460208892822
			}
		},
		pwh_castle_vo_crypt_discovered = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_crypt_discovered_01",
				"pwh_castle_vo_crypt_discovered_02",
				"pwh_castle_vo_crypt_discovered_03",
				"pwh_castle_vo_crypt_discovered_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_crypt_discovered_01",
				"pwh_castle_vo_crypt_discovered_02",
				"pwh_castle_vo_crypt_discovered_03",
				"pwh_castle_vo_crypt_discovered_04"
			},
			sound_events_duration = {
				6.3546457290649,
				6.9873957633972,
				5.2310833930969,
				7.5756039619446
			}
		},
		pwh_castle_vo_crypt_not_discovered = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_crypt_not_discovered_01",
				"pwh_castle_vo_crypt_not_discovered_02",
				"pwh_castle_vo_crypt_not_discovered_03",
				"pwh_castle_vo_crypt_not_discovered_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_crypt_not_discovered_01",
				"pwh_castle_vo_crypt_not_discovered_02",
				"pwh_castle_vo_crypt_not_discovered_03",
				"pwh_castle_vo_crypt_not_discovered_04"
			},
			sound_events_duration = {
				5.8842082023621,
				4.8336873054504,
				6.4431877136231,
				4.8914585113525
			}
		},
		pwh_castle_vo_do_not_recognize = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_do_not_recognize_01",
				"pwh_castle_vo_do_not_recognize_02",
				"pwh_castle_vo_do_not_recognize_03",
				"pwh_castle_vo_do_not_recognize_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_do_not_recognize_01",
				"pwh_castle_vo_do_not_recognize_02",
				"pwh_castle_vo_do_not_recognize_03",
				"pwh_castle_vo_do_not_recognize_04"
			},
			sound_events_duration = {
				4.0485000610352,
				3.1592500209808,
				3.5143749713898,
				4.333083152771
			}
		},
		pwh_castle_vo_door_open = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_door_open_01",
				"pwh_castle_vo_door_open_02",
				"pwh_castle_vo_door_open_03",
				"pwh_castle_vo_door_open_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_door_open_01",
				"pwh_castle_vo_door_open_02",
				"pwh_castle_vo_door_open_03",
				"pwh_castle_vo_door_open_04"
			},
			sound_events_duration = {
				6.872166633606,
				3.3618125915527,
				4.7387290000916,
				7.2385625839233
			}
		},
		pwh_castle_vo_drop_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_drop_down_01",
				"pwh_castle_vo_drop_down_02",
				"pwh_castle_vo_drop_down_03",
				"pwh_castle_vo_drop_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_drop_down_01",
				"pwh_castle_vo_drop_down_02",
				"pwh_castle_vo_drop_down_03",
				"pwh_castle_vo_drop_down_04"
			},
			sound_events_duration = {
				3.9937500953674,
				4.1428751945496,
				3.5407500267029,
				5.3618960380554
			}
		},
		pwh_castle_vo_enter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_enter_01",
				"pwh_castle_vo_enter_02",
				"pwh_castle_vo_enter_03",
				"pwh_castle_vo_enter_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_enter_01",
				"pwh_castle_vo_enter_02",
				"pwh_castle_vo_enter_03",
				"pwh_castle_vo_enter_04"
			},
			sound_events_duration = {
				1.9042708873749,
				2.6090834140778,
				5.5507497787476,
				2.7953751087189
			}
		},
		pwh_castle_vo_find_a_way_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_find_a_way_up_01",
				"pwh_castle_vo_find_a_way_up_02",
				"pwh_castle_vo_find_a_way_up_03",
				"pwh_castle_vo_find_a_way_up_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_find_a_way_up_01",
				"pwh_castle_vo_find_a_way_up_02",
				"pwh_castle_vo_find_a_way_up_03",
				"pwh_castle_vo_find_a_way_up_04"
			},
			sound_events_duration = {
				4.0136456489563,
				5.7680830955505,
				2.6573333740234,
				3.5980417728424
			}
		},
		pwh_castle_vo_halls = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_halls_01",
				"pwh_castle_vo_halls_02",
				"pwh_castle_vo_halls_03",
				"pwh_castle_vo_halls_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_halls_01",
				"pwh_castle_vo_halls_02",
				"pwh_castle_vo_halls_03",
				"pwh_castle_vo_halls_04"
			},
			sound_events_duration = {
				2.3321042060852,
				4.298291683197,
				3.7771666049957,
				3.8711457252502
			}
		},
		pwh_castle_vo_hello = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_hello_01",
				"pwh_castle_vo_hello_02",
				"pwh_castle_vo_hello_03",
				"pwh_castle_vo_hello_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_hello_01",
				"pwh_castle_vo_hello_02",
				"pwh_castle_vo_hello_03",
				"pwh_castle_vo_hello_04"
			},
			sound_events_duration = {
				1.7839167118073,
				5.5233960151672,
				3.2983958721161,
				3.4167499542236
			}
		},
		pwh_castle_vo_landed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_landed_01",
				"pwh_castle_vo_landed_02",
				"pwh_castle_vo_landed_03",
				"pwh_castle_vo_landed_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_landed_01",
				"pwh_castle_vo_landed_02",
				"pwh_castle_vo_landed_03",
				"pwh_castle_vo_landed_04"
			},
			sound_events_duration = {
				4.9430418014526,
				2.1178750991821,
				4.9442501068115,
				3.8943958282471
			}
		},
		pwh_castle_vo_meet_sorcerer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_meet_sorcerer_01",
				"pwh_castle_vo_meet_sorcerer_02",
				"pwh_castle_vo_meet_sorcerer_03",
				"pwh_castle_vo_meet_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_meet_sorcerer_01",
				"pwh_castle_vo_meet_sorcerer_02",
				"pwh_castle_vo_meet_sorcerer_03",
				"pwh_castle_vo_meet_sorcerer_04"
			},
			sound_events_duration = {
				6.6816668510437,
				3.700395822525,
				3.2299582958221,
				7.9926042556763
			}
		},
		pwh_castle_vo_recognize = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_recognize_01",
				"pwh_castle_vo_recognize_02",
				"pwh_castle_vo_recognize_03",
				"pwh_castle_vo_recognize_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_recognize_01",
				"pwh_castle_vo_recognize_02",
				"pwh_castle_vo_recognize_03",
				"pwh_castle_vo_recognize_04"
			},
			sound_events_duration = {
				2.875958442688,
				5.7313542366028,
				2.3834373950958,
				3.588770866394
			}
		},
		pwh_castle_vo_search_again = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_search_again_01",
				"pwh_castle_vo_search_again_02",
				"pwh_castle_vo_search_again_03",
				"pwh_castle_vo_search_again_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_search_again_01",
				"pwh_castle_vo_search_again_02",
				"pwh_castle_vo_search_again_03",
				"pwh_castle_vo_search_again_04"
			},
			sound_events_duration = {
				3.5126667022705,
				2.4732291698456,
				4.0764164924622,
				5.6101040840149
			}
		},
		pwh_castle_vo_secret_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_secret_door_01",
				"pwh_castle_vo_secret_door_02",
				"pwh_castle_vo_secret_door_03",
				"pwh_castle_vo_secret_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_secret_door_01",
				"pwh_castle_vo_secret_door_02",
				"pwh_castle_vo_secret_door_03",
				"pwh_castle_vo_secret_door_04"
			},
			sound_events_duration = {
				7.4866042137146,
				5.6523542404175,
				5.2357082366943,
				4.886604309082
			}
		},
		pwh_castle_vo_sorcerer_slain = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_sorcerer_slain_01",
				"pwh_castle_vo_sorcerer_slain_02",
				"pwh_castle_vo_sorcerer_slain_03",
				"pwh_castle_vo_sorcerer_slain_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_sorcerer_slain_01",
				"pwh_castle_vo_sorcerer_slain_02",
				"pwh_castle_vo_sorcerer_slain_03",
				"pwh_castle_vo_sorcerer_slain_04"
			},
			sound_events_duration = {
				4.781708240509,
				7.594229221344,
				6.6730208396912,
				7.0863332748413
			}
		},
		pwh_castle_vo_this_way = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_this_way_01",
				"pwh_castle_vo_this_way_02",
				"pwh_castle_vo_this_way_03",
				"pwh_castle_vo_this_way_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_this_way_01",
				"pwh_castle_vo_this_way_02",
				"pwh_castle_vo_this_way_03",
				"pwh_castle_vo_this_way_04"
			},
			sound_events_duration = {
				1.5403541326523,
				2.202187538147,
				4.5424790382385,
				3.1726665496826
			}
		},
		pwh_castle_vo_throne_room_approach = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_throne_room_approach_01",
				"pwh_castle_vo_throne_room_approach_02",
				"pwh_castle_vo_throne_room_approach_03",
				"pwh_castle_vo_throne_room_approach_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_throne_room_approach_01",
				"pwh_castle_vo_throne_room_approach_02",
				"pwh_castle_vo_throne_room_approach_03",
				"pwh_castle_vo_throne_room_approach_04"
			},
			sound_events_duration = {
				6.4202499389648,
				3.6353750228882,
				5.169979095459,
				5.6616668701172
			}
		},
		pwh_castle_vo_traces_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_traces_one_01",
				"pwh_castle_vo_traces_one_02",
				"pwh_castle_vo_traces_one_03",
				"pwh_castle_vo_traces_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_traces_one_01",
				"pwh_castle_vo_traces_one_02",
				"pwh_castle_vo_traces_one_03",
				"pwh_castle_vo_traces_one_04"
			},
			sound_events_duration = {
				4.6803541183472,
				4.754478931427,
				6.033625125885,
				3.4337499141693
			}
		},
		pwh_castle_vo_trap_switch = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_trap_switch_01",
				"pwh_castle_vo_trap_switch_02",
				"pwh_castle_vo_trap_switch_03",
				"pwh_castle_vo_trap_switch_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_trap_switch_01",
				"pwh_castle_vo_trap_switch_02",
				"pwh_castle_vo_trap_switch_03",
				"pwh_castle_vo_trap_switch_04"
			},
			sound_events_duration = {
				3.5476875305176,
				4.5791249275208,
				3.5594375133514,
				2.8757708072662
			}
		},
		pwh_castle_vo_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_castle",
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
				"pwh_castle_vo_vista_01",
				"pwh_castle_vo_vista_02",
				"pwh_castle_vo_vista_03",
				"pwh_castle_vo_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_vista_01",
				"pwh_castle_vo_vista_02",
				"pwh_castle_vo_vista_03",
				"pwh_castle_vo_vista_04"
			},
			sound_events_duration = {
				6.3165416717529,
				5.0963540077209,
				6.5002918243408,
				3.588666677475
			}
		}
	})
end
