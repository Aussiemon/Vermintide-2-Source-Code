return function ()
	define_rule({
		name = "pbw_castle_intro_line_a",
		response = "pbw_castle_intro_line_a",
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
		name = "pbw_castle_intro_line_b",
		response = "pbw_castle_intro_line_b",
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
		name = "pbw_castle_intro_line_c",
		response = "pbw_castle_intro_line_c",
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
		name = "pbw_castle_vo_approaching_throne_room",
		response = "pbw_castle_vo_approaching_throne_room",
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
		name = "pbw_castle_vo_blockage",
		response = "pbw_castle_vo_blockage",
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
		name = "pbw_castle_vo_blood_pool",
		response = "pbw_castle_vo_blood_pool",
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
		name = "pbw_castle_vo_crypt_discovered",
		response = "pbw_castle_vo_crypt_discovered",
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
		name = "pbw_castle_vo_crypt_not_discovered",
		response = "pbw_castle_vo_crypt_not_discovered",
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
		name = "pbw_castle_vo_do_not_recognize",
		response = "pbw_castle_vo_do_not_recognize",
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
		name = "pbw_castle_vo_door_open",
		response = "pbw_castle_vo_door_open",
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
		name = "pbw_castle_vo_drop_down",
		response = "pbw_castle_vo_drop_down",
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
		name = "pbw_castle_vo_enter",
		response = "pbw_castle_vo_enter",
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
		name = "pbw_castle_vo_find_a_way_up",
		response = "pbw_castle_vo_find_a_way_up",
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
		name = "pbw_castle_vo_halls",
		response = "pbw_castle_vo_halls",
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
		name = "pbw_castle_vo_hello",
		response = "pbw_castle_vo_hello",
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
		name = "pbw_castle_vo_landed",
		response = "pbw_castle_vo_landed",
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
		name = "pbw_castle_vo_meet_sorcerer",
		response = "pbw_castle_vo_meet_sorcerer",
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
		name = "pbw_castle_vo_recognize",
		response = "pbw_castle_vo_recognize",
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
		name = "pbw_castle_vo_search_again",
		response = "pbw_castle_vo_search_again",
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
		name = "pbw_castle_vo_secret_door",
		response = "pbw_castle_vo_secret_door",
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
		name = "pbw_castle_vo_sorcerer_slain",
		response = "pbw_castle_vo_sorcerer_slain",
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
		name = "pbw_castle_vo_this_way",
		response = "pbw_castle_vo_this_way",
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
		name = "pbw_castle_vo_throne_room_approach",
		response = "pbw_castle_vo_throne_room_approach",
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
		name = "pbw_castle_vo_traces_one",
		response = "pbw_castle_vo_traces_one",
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
		name = "pbw_castle_vo_trap_switch",
		response = "pbw_castle_vo_trap_switch",
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
		name = "pbw_castle_vo_vista",
		response = "pbw_castle_vo_vista",
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
		pbw_castle_intro_line_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				[1.0] = "pbw_castle_intro_line_a_01",
				[2.0] = "pbw_castle_intro_line_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_castle_intro_line_a_01",
				[2.0] = "pbw_castle_intro_line_a_02"
			},
			sound_events_duration = {
				[1.0] = 5.0251250267029,
				[2.0] = 4.4495415687561
			}
		},
		pbw_castle_intro_line_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				[1.0] = "pbw_castle_intro_line_b_01",
				[2.0] = "pbw_castle_intro_line_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_castle_intro_line_b_01",
				[2.0] = "pbw_castle_intro_line_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.9083125591278,
				[2.0] = 4.6492915153503
			}
		},
		pbw_castle_intro_line_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				[1.0] = "pbw_castle_intro_line_c_01",
				[2.0] = "pbw_castle_intro_line_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_castle_intro_line_c_01",
				[2.0] = "pbw_castle_intro_line_c_02"
			},
			sound_events_duration = {
				[1.0] = 6.2596664428711,
				[2.0] = 3.0865623950958
			}
		},
		pbw_castle_vo_approaching_throne_room = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_approaching_throne_room_01",
				"pbw_castle_vo_approaching_throne_room_02",
				"pbw_castle_vo_approaching_throne_room_03",
				"pbw_castle_vo_approaching_throne_room_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_approaching_throne_room_01",
				"pbw_castle_vo_approaching_throne_room_02",
				"pbw_castle_vo_approaching_throne_room_03",
				"pbw_castle_vo_approaching_throne_room_04"
			},
			sound_events_duration = {
				2.8421041965485,
				2.7778959274292,
				1.1336874961853,
				3.7239375114441
			}
		},
		pbw_castle_vo_blockage = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_blockage_01",
				"pbw_castle_vo_blockage_02",
				"pbw_castle_vo_blockage_03",
				"pbw_castle_vo_blockage_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_blockage_01",
				"pbw_castle_vo_blockage_02",
				"pbw_castle_vo_blockage_03",
				"pbw_castle_vo_blockage_04"
			},
			sound_events_duration = {
				1.9865208864212,
				1.3881249427795,
				2.365770816803,
				2.4318125247955
			}
		},
		pbw_castle_vo_blood_pool = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_blood_pool_01",
				"pbw_castle_vo_blood_pool_02",
				"pbw_castle_vo_blood_pool_03",
				"pbw_castle_vo_blood_pool_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_blood_pool_01",
				"pbw_castle_vo_blood_pool_02",
				"pbw_castle_vo_blood_pool_03",
				"pbw_castle_vo_blood_pool_04"
			},
			sound_events_duration = {
				4.8706040382385,
				2.1717500686645,
				3.9210624694824,
				3.4117500782013
			}
		},
		pbw_castle_vo_crypt_discovered = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_crypt_discovered_01",
				"pbw_castle_vo_crypt_discovered_02",
				"pbw_castle_vo_crypt_discovered_03",
				"pbw_castle_vo_crypt_discovered_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_crypt_discovered_01",
				"pbw_castle_vo_crypt_discovered_02",
				"pbw_castle_vo_crypt_discovered_03",
				"pbw_castle_vo_crypt_discovered_04"
			},
			sound_events_duration = {
				6.1846041679382,
				4.875458240509,
				3.7142291069031,
				5.5838332176208
			}
		},
		pbw_castle_vo_crypt_not_discovered = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_crypt_not_discovered_01",
				"pbw_castle_vo_crypt_not_discovered_02",
				"pbw_castle_vo_crypt_not_discovered_03",
				"pbw_castle_vo_crypt_not_discovered_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_crypt_not_discovered_01",
				"pbw_castle_vo_crypt_not_discovered_02",
				"pbw_castle_vo_crypt_not_discovered_03",
				"pbw_castle_vo_crypt_not_discovered_04"
			},
			sound_events_duration = {
				2.831791639328,
				3.4495208263397,
				3.4243540763855,
				4.3636040687561
			}
		},
		pbw_castle_vo_do_not_recognize = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_do_not_recognize_01",
				"pbw_castle_vo_do_not_recognize_02",
				"pbw_castle_vo_do_not_recognize_03",
				"pbw_castle_vo_do_not_recognize_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_do_not_recognize_01",
				"pbw_castle_vo_do_not_recognize_02",
				"pbw_castle_vo_do_not_recognize_03",
				"pbw_castle_vo_do_not_recognize_04"
			},
			sound_events_duration = {
				2.2811040878296,
				1.4961041212082,
				1.2622916698456,
				3.1798541545868
			}
		},
		pbw_castle_vo_door_open = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_door_open_01",
				"pbw_castle_vo_door_open_02",
				"pbw_castle_vo_door_open_03",
				"pbw_castle_vo_door_open_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_door_open_01",
				"pbw_castle_vo_door_open_02",
				"pbw_castle_vo_door_open_03",
				"pbw_castle_vo_door_open_04"
			},
			sound_events_duration = {
				2.4581458568573,
				2.0349583625794,
				4.516083240509,
				2.8922708034515
			}
		},
		pbw_castle_vo_drop_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_drop_down_01",
				"pbw_castle_vo_drop_down_02",
				"pbw_castle_vo_drop_down_03",
				"pbw_castle_vo_drop_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_drop_down_01",
				"pbw_castle_vo_drop_down_02",
				"pbw_castle_vo_drop_down_03",
				"pbw_castle_vo_drop_down_04"
			},
			sound_events_duration = {
				3.8778958320618,
				4.1916875839233,
				3.7712707519531,
				4.3984789848328
			}
		},
		pbw_castle_vo_enter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_enter_01",
				"pbw_castle_vo_enter_02",
				"pbw_castle_vo_enter_03",
				"pbw_castle_vo_enter_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_enter_01",
				"pbw_castle_vo_enter_02",
				"pbw_castle_vo_enter_03",
				"pbw_castle_vo_enter_04"
			},
			sound_events_duration = {
				1.6915208101273,
				1.8003541231155,
				1.7085000276566,
				1.6975417137146
			}
		},
		pbw_castle_vo_find_a_way_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_find_a_way_up_01",
				"pbw_castle_vo_find_a_way_up_02",
				"pbw_castle_vo_find_a_way_up_03",
				"pbw_castle_vo_find_a_way_up_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_find_a_way_up_01",
				"pbw_castle_vo_find_a_way_up_02",
				"pbw_castle_vo_find_a_way_up_03",
				"pbw_castle_vo_find_a_way_up_04"
			},
			sound_events_duration = {
				2.0309791564941,
				2.8848333358765,
				1.4812500476837,
				3.6292083263397
			}
		},
		pbw_castle_vo_halls = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_halls_01",
				"pbw_castle_vo_halls_02",
				"pbw_castle_vo_halls_03",
				"pbw_castle_vo_halls_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_halls_01",
				"pbw_castle_vo_halls_02",
				"pbw_castle_vo_halls_03",
				"pbw_castle_vo_halls_04"
			},
			sound_events_duration = {
				2.8734374046326,
				2.4476249217987,
				2.5137083530426,
				4.0876665115356
			}
		},
		pbw_castle_vo_hello = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_hello_01",
				"pbw_castle_vo_hello_02",
				"pbw_castle_vo_hello_03",
				"pbw_castle_vo_hello_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_hello_01",
				"pbw_castle_vo_hello_02",
				"pbw_castle_vo_hello_03",
				"pbw_castle_vo_hello_04"
			},
			sound_events_duration = {
				3.0353541374206,
				4.690354347229,
				3.7727084159851,
				4.0984373092651
			}
		},
		pbw_castle_vo_landed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_landed_01",
				"pbw_castle_vo_landed_02",
				"pbw_castle_vo_landed_03",
				"pbw_castle_vo_landed_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_landed_01",
				"pbw_castle_vo_landed_02",
				"pbw_castle_vo_landed_03",
				"pbw_castle_vo_landed_04"
			},
			sound_events_duration = {
				3.7081458568573,
				5.0056042671204,
				3.4490625858307,
				3.4873957633972
			}
		},
		pbw_castle_vo_meet_sorcerer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_meet_sorcerer_01",
				"pbw_castle_vo_meet_sorcerer_02",
				"pbw_castle_vo_meet_sorcerer_03",
				"pbw_castle_vo_meet_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_meet_sorcerer_01",
				"pbw_castle_vo_meet_sorcerer_02",
				"pbw_castle_vo_meet_sorcerer_03",
				"pbw_castle_vo_meet_sorcerer_04"
			},
			sound_events_duration = {
				3.4121251106262,
				4.2257084846497,
				2.7504167556763,
				2.5710208415985
			}
		},
		pbw_castle_vo_recognize = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_recognize_01",
				"pbw_castle_vo_recognize_02",
				"pbw_castle_vo_recognize_03",
				"pbw_castle_vo_recognize_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_recognize_01",
				"pbw_castle_vo_recognize_02",
				"pbw_castle_vo_recognize_03",
				"pbw_castle_vo_recognize_04"
			},
			sound_events_duration = {
				1.5807083845139,
				2.0460000038147,
				3.4942708015442,
				4.2898125648499
			}
		},
		pbw_castle_vo_search_again = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_search_again_01",
				"pbw_castle_vo_search_again_02",
				"pbw_castle_vo_search_again_03",
				"pbw_castle_vo_search_again_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_search_again_01",
				"pbw_castle_vo_search_again_02",
				"pbw_castle_vo_search_again_03",
				"pbw_castle_vo_search_again_04"
			},
			sound_events_duration = {
				4.3944792747498,
				2.8328125476837,
				2.7534792423248,
				5.1657710075378
			}
		},
		pbw_castle_vo_secret_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_secret_door_01",
				"pbw_castle_vo_secret_door_02",
				"pbw_castle_vo_secret_door_03",
				"pbw_castle_vo_secret_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_secret_door_01",
				"pbw_castle_vo_secret_door_02",
				"pbw_castle_vo_secret_door_03",
				"pbw_castle_vo_secret_door_04"
			},
			sound_events_duration = {
				3.6920833587647,
				3.026750087738,
				5.8900833129883,
				2.6958541870117
			}
		},
		pbw_castle_vo_sorcerer_slain = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_sorcerer_slain_01",
				"pbw_castle_vo_sorcerer_slain_02",
				"pbw_castle_vo_sorcerer_slain_03",
				"pbw_castle_vo_sorcerer_slain_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_sorcerer_slain_01",
				"pbw_castle_vo_sorcerer_slain_02",
				"pbw_castle_vo_sorcerer_slain_03",
				"pbw_castle_vo_sorcerer_slain_04"
			},
			sound_events_duration = {
				1.7523750066757,
				2.7119998931885,
				2.7583749294281,
				2.7947082519531
			}
		},
		pbw_castle_vo_this_way = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_this_way_01",
				"pbw_castle_vo_this_way_02",
				"pbw_castle_vo_this_way_03",
				"pbw_castle_vo_this_way_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_this_way_01",
				"pbw_castle_vo_this_way_02",
				"pbw_castle_vo_this_way_03",
				"pbw_castle_vo_this_way_04"
			},
			sound_events_duration = {
				0.6328958272934,
				1.4348750114441,
				1.6779375076294,
				1.7371666431427
			}
		},
		pbw_castle_vo_throne_room_approach = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_throne_room_approach_01",
				"pbw_castle_vo_throne_room_approach_02",
				"pbw_castle_vo_throne_room_approach_03",
				"pbw_castle_vo_throne_room_approach_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_throne_room_approach_01",
				"pbw_castle_vo_throne_room_approach_02",
				"pbw_castle_vo_throne_room_approach_03",
				"pbw_castle_vo_throne_room_approach_04"
			},
			sound_events_duration = {
				1.9420833587647,
				4.3342499732971,
				3.8477499485016,
				3.1768958568573
			}
		},
		pbw_castle_vo_traces_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_traces_one_01",
				"pbw_castle_vo_traces_one_02",
				"pbw_castle_vo_traces_one_03",
				"pbw_castle_vo_traces_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_traces_one_01",
				"pbw_castle_vo_traces_one_02",
				"pbw_castle_vo_traces_one_03",
				"pbw_castle_vo_traces_one_04"
			},
			sound_events_duration = {
				5.1547293663025,
				5.250479221344,
				2.909916639328,
				3.0025417804718
			}
		},
		pbw_castle_vo_trap_switch = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_trap_switch_01",
				"pbw_castle_vo_trap_switch_02",
				"pbw_castle_vo_trap_switch_03",
				"pbw_castle_vo_trap_switch_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_trap_switch_01",
				"pbw_castle_vo_trap_switch_02",
				"pbw_castle_vo_trap_switch_03",
				"pbw_castle_vo_trap_switch_04"
			},
			sound_events_duration = {
				1.9201458692551,
				1.9827083349228,
				2.4789583683014,
				1.5860208272934
			}
		},
		pbw_castle_vo_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_drachenfels_castle",
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
				"pbw_castle_vo_vista_01",
				"pbw_castle_vo_vista_02",
				"pbw_castle_vo_vista_03",
				"pbw_castle_vo_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_vista_01",
				"pbw_castle_vo_vista_02",
				"pbw_castle_vo_vista_03",
				"pbw_castle_vo_vista_04"
			},
			sound_events_duration = {
				5.259229183197,
				4.7352709770203,
				4.5625834465027,
				5.7388958930969
			}
		}
	})
end
