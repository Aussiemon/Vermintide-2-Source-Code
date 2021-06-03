return function ()
	define_rule({
		name = "pdr_castle_intro_line_a",
		response = "pdr_castle_intro_line_a",
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
		name = "pdr_castle_intro_line_b",
		response = "pdr_castle_intro_line_b",
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
		name = "pdr_castle_intro_line_c",
		response = "pdr_castle_intro_line_c",
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
		name = "pdr_castle_vo_door_open",
		response = "pdr_castle_vo_door_open",
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
		name = "pdr_castle_vo_hello",
		response = "pdr_castle_vo_hello",
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
		name = "pdr_castle_vo_traces_one",
		response = "pdr_castle_vo_traces_one",
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
		name = "pdr_castle_vo_enter",
		response = "pdr_castle_vo_enter",
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
		name = "pdr_castle_vo_this_way",
		response = "pdr_castle_vo_this_way",
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
		name = "pdr_castle_vo_landed",
		response = "pdr_castle_vo_landed",
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
		name = "pdr_castle_vo_find_a_way_up",
		response = "pdr_castle_vo_find_a_way_up",
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
		name = "pdr_castle_vo_blood_pool",
		response = "pdr_castle_vo_blood_pool",
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
		name = "pdr_castle_vo_recognize",
		response = "pdr_castle_vo_recognize",
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
		name = "pdr_castle_vo_do_not_recognize",
		response = "pdr_castle_vo_do_not_recognize",
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
		name = "pdr_castle_vo_trap_switch",
		response = "pdr_castle_vo_trap_switch",
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
		name = "pdr_castle_vo_secret_door",
		response = "pdr_castle_vo_secret_door",
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
		name = "pdr_castle_vo_halls",
		response = "pdr_castle_vo_halls",
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
		name = "pdr_castle_vo_search_again",
		response = "pdr_castle_vo_search_again",
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
		name = "pdr_castle_vo_blockage",
		response = "pdr_castle_vo_blockage",
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
		name = "pdr_castle_vo_throne_room_approach",
		response = "pdr_castle_vo_throne_room_approach",
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
		name = "pdr_castle_vo_vista",
		response = "pdr_castle_vo_vista",
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
		name = "pdr_castle_vo_approaching_throne_room",
		response = "pdr_castle_vo_approaching_throne_room",
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
		name = "pdr_castle_vo_ meet_sorcerer",
		response = "pdr_castle_vo_ meet_sorcerer",
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
		name = "pdr_castle_vo_sorcerer_slain",
		response = "pdr_castle_vo_sorcerer_slain",
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
		name = "pdr_castle_vo_drop_down",
		response = "pdr_castle_vo_drop_down",
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
		name = "pdr_castle_vo_crypt_discovered",
		response = "pdr_castle_vo_crypt_discovered",
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
		name = "pdr_castle_vo_crypt_not_discovered",
		response = "pdr_castle_vo_crypt_not_discovered",
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
		pdr_castle_vo_this_way = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_this_way_01",
				"pdr_castle_vo_this_way_02",
				"pdr_castle_vo_this_way_03",
				"pdr_castle_vo_this_way_04"
			},
			sound_events_duration = {
				3.8713126182556,
				1.1933125257492,
				2.8359582424164,
				1.9754375219345
			},
			sound_events = {
				"pdr_castle_vo_this_way_01",
				"pdr_castle_vo_this_way_02",
				"pdr_castle_vo_this_way_03",
				"pdr_castle_vo_this_way_04"
			}
		},
		pdr_castle_intro_line_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				[1.0] = "pdr_castle_intro_line_a_01",
				[2.0] = "pdr_castle_intro_line_a_02"
			},
			sound_events_duration = {
				[1.0] = 2.7880625724792,
				[2.0] = 2.9306874275208
			},
			sound_events = {
				[1.0] = "pdr_castle_intro_line_a_01",
				[2.0] = "pdr_castle_intro_line_a_02"
			}
		},
		pdr_castle_vo_find_a_way_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_find_a_way_up_01",
				"pdr_castle_vo_find_a_way_up_02",
				"pdr_castle_vo_find_a_way_up_03",
				"pdr_castle_vo_find_a_way_up_04"
			},
			sound_events_duration = {
				2.3932292461395,
				3.9467084407806,
				3.8203542232513,
				4.8592710494995
			},
			sound_events = {
				"pdr_castle_vo_find_a_way_up_01",
				"pdr_castle_vo_find_a_way_up_02",
				"pdr_castle_vo_find_a_way_up_03",
				"pdr_castle_vo_find_a_way_up_04"
			}
		},
		pdr_castle_intro_line_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				[1.0] = "pdr_castle_intro_line_b_01",
				[2.0] = "pdr_castle_intro_line_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.0602293014526,
				[2.0] = 5.7414164543152
			},
			sound_events = {
				[1.0] = "pdr_castle_intro_line_b_01",
				[2.0] = "pdr_castle_intro_line_b_02"
			}
		},
		pdr_castle_vo_blood_pool = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_blood_pool_01",
				"pdr_castle_vo_blood_pool_02",
				"pdr_castle_vo_blood_pool_03",
				"pdr_castle_vo_blood_pool_04"
			},
			sound_events_duration = {
				3.207750082016,
				4.4510207176208,
				3.1675000190735,
				3.4205000400543
			},
			sound_events = {
				"pdr_castle_vo_blood_pool_01",
				"pdr_castle_vo_blood_pool_02",
				"pdr_castle_vo_blood_pool_03",
				"pdr_castle_vo_blood_pool_04"
			}
		},
		pdr_castle_vo_secret_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_secret_door_01",
				"pdr_castle_vo_secret_door_02",
				"pdr_castle_vo_secret_door_03",
				"pdr_castle_vo_secret_door_04"
			},
			sound_events_duration = {
				3.4349999427795,
				3.9946665763855,
				3.8324167728424,
				2.7152707576752
			},
			sound_events = {
				"pdr_castle_vo_secret_door_01",
				"pdr_castle_vo_secret_door_02",
				"pdr_castle_vo_secret_door_03",
				"pdr_castle_vo_secret_door_04"
			}
		},
		pdr_castle_vo_trap_switch = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_trap_switch_01",
				"pdr_castle_vo_trap_switch_02",
				"pdr_castle_vo_trap_switch_03",
				"pdr_castle_vo_trap_switch_04"
			},
			sound_events_duration = {
				3.0364582538605,
				3.6308124065399,
				2.5409166812897,
				1.8771458864212
			},
			sound_events = {
				"pdr_castle_vo_trap_switch_01",
				"pdr_castle_vo_trap_switch_02",
				"pdr_castle_vo_trap_switch_03",
				"pdr_castle_vo_trap_switch_04"
			}
		},
		pdr_castle_vo_recognize = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_recognize_01",
				"pdr_castle_vo_recognize_02",
				"pdr_castle_vo_recognize_03",
				"pdr_castle_vo_recognize_04"
			},
			sound_events_duration = {
				2.4572916030884,
				2.6827082633972,
				2.9978749752045,
				2.6346666812897
			},
			sound_events = {
				"pdr_castle_vo_recognize_01",
				"pdr_castle_vo_recognize_02",
				"pdr_castle_vo_recognize_03",
				"pdr_castle_vo_recognize_04"
			}
		},
		pdr_castle_vo_crypt_not_discovered = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_crypt_not_discovered_01",
				"pdr_castle_vo_crypt_not_discovered_02",
				"pdr_castle_vo_crypt_not_discovered_03",
				"pdr_castle_vo_crypt_not_discovered_04"
			},
			sound_events_duration = {
				2.9343750476837,
				3.263375043869,
				5.1383748054504,
				4.0920000076294
			},
			sound_events = {
				"pdr_castle_vo_crypt_not_discovered_01",
				"pdr_castle_vo_crypt_not_discovered_02",
				"pdr_castle_vo_crypt_not_discovered_03",
				"pdr_castle_vo_crypt_not_discovered_04"
			}
		},
		pdr_castle_vo_crypt_discovered = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_crypt_discovered_01",
				"pdr_castle_vo_crypt_discovered_02",
				"pdr_castle_vo_crypt_discovered_03",
				"pdr_castle_vo_crypt_discovered_04"
			},
			sound_events_duration = {
				4.2529997825623,
				4.3190627098083,
				3.3343958854675,
				5.6726875305176
			},
			sound_events = {
				"pdr_castle_vo_crypt_discovered_01",
				"pdr_castle_vo_crypt_discovered_02",
				"pdr_castle_vo_crypt_discovered_03",
				"pdr_castle_vo_crypt_discovered_04"
			}
		},
		pdr_castle_vo_throne_room_approach = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_throne_room_approach_01",
				"pdr_castle_vo_throne_room_approach_02",
				"pdr_castle_vo_throne_room_approach_03",
				"pdr_castle_vo_throne_room_approach_04"
			},
			sound_events_duration = {
				2.992666721344,
				2.9736042022705,
				2.9508125782013,
				3.3761875629425
			},
			sound_events = {
				"pdr_castle_vo_throne_room_approach_01",
				"pdr_castle_vo_throne_room_approach_02",
				"pdr_castle_vo_throne_room_approach_03",
				"pdr_castle_vo_throne_room_approach_04"
			}
		},
		pdr_castle_vo_sorcerer_slain = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_sorcerer_slain_01",
				"pdr_castle_vo_sorcerer_slain_02",
				"pdr_castle_vo_sorcerer_slain_03",
				"pdr_castle_vo_sorcerer_slain_04"
			},
			sound_events_duration = {
				2.8173959255219,
				3.7614998817444,
				3.0585417747498,
				5.0506248474121
			},
			sound_events = {
				"pdr_castle_vo_sorcerer_slain_01",
				"pdr_castle_vo_sorcerer_slain_02",
				"pdr_castle_vo_sorcerer_slain_03",
				"pdr_castle_vo_sorcerer_slain_04"
			}
		},
		pdr_castle_vo_search_again = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_search_again_01",
				"pdr_castle_vo_search_again_02",
				"pdr_castle_vo_search_again_03",
				"pdr_castle_vo_search_again_04"
			},
			sound_events_duration = {
				2.96839594841,
				2.4316248893738,
				2.19566655159,
				3.8728749752045
			},
			sound_events = {
				"pdr_castle_vo_search_again_01",
				"pdr_castle_vo_search_again_02",
				"pdr_castle_vo_search_again_03",
				"pdr_castle_vo_search_again_04"
			}
		},
		pdr_castle_vo_traces_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_traces_one_01",
				"pdr_castle_vo_traces_one_02",
				"pdr_castle_vo_traces_one_03",
				"pdr_castle_vo_traces_one_04"
			},
			sound_events_duration = {
				4.1444792747498,
				2.7925624847412,
				2.3717083930969,
				3.0419583320618
			},
			sound_events = {
				"pdr_castle_vo_traces_one_01",
				"pdr_castle_vo_traces_one_02",
				"pdr_castle_vo_traces_one_03",
				"pdr_castle_vo_traces_one_04"
			}
		},
		pdr_castle_vo_enter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_enter_01",
				"pdr_castle_vo_enter_02",
				"pdr_castle_vo_enter_03",
				"pdr_castle_vo_enter_04"
			},
			sound_events_duration = {
				2.8213958740234,
				2.0040416717529,
				3.018458366394,
				2.8081874847412
			},
			sound_events = {
				"pdr_castle_vo_enter_01",
				"pdr_castle_vo_enter_02",
				"pdr_castle_vo_enter_03",
				"pdr_castle_vo_enter_04"
			}
		},
		pdr_castle_intro_line_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				[1.0] = "pdr_castle_intro_line_c_01",
				[2.0] = "pdr_castle_intro_line_c_02"
			},
			sound_events_duration = {
				[1.0] = 2.2448332309723,
				[2.0] = 2.443437576294
			},
			sound_events = {
				[1.0] = "pdr_castle_intro_line_c_01",
				[2.0] = "pdr_castle_intro_line_c_02"
			}
		},
		pdr_castle_vo_landed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_landed_01",
				"pdr_castle_vo_landed_02",
				"pdr_castle_vo_landed_03",
				"pdr_castle_vo_landed_04"
			},
			sound_events_duration = {
				3.0329999923706,
				2.2278957366943,
				2.7437500953674,
				4.5647916793823
			},
			sound_events = {
				"pdr_castle_vo_landed_01",
				"pdr_castle_vo_landed_02",
				"pdr_castle_vo_landed_03",
				"pdr_castle_vo_landed_04"
			}
		},
		pdr_castle_vo_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_vista_01",
				"pdr_castle_vo_vista_02",
				"pdr_castle_vo_vista_03",
				"pdr_castle_vo_vista_04"
			},
			sound_events_duration = {
				4.773895740509,
				2.3618750572205,
				5.7190623283386,
				3.1698334217072
			},
			sound_events = {
				"pdr_castle_vo_vista_01",
				"pdr_castle_vo_vista_02",
				"pdr_castle_vo_vista_03",
				"pdr_castle_vo_vista_04"
			}
		},
		pdr_castle_vo_hello = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_hello_01",
				"pdr_castle_vo_hello_02",
				"pdr_castle_vo_hello_03",
				"pdr_castle_vo_hello_04"
			},
			sound_events_duration = {
				6.2090625762939,
				1.3930000066757,
				3.6359167098999,
				1.9603958129883
			},
			sound_events = {
				"pdr_castle_vo_hello_01",
				"pdr_castle_vo_hello_02",
				"pdr_castle_vo_hello_03",
				"pdr_castle_vo_hello_04"
			}
		},
		["pdr_castle_vo_ meet_sorcerer"] = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_ meet_sorcerer_01",
				"pdr_castle_vo_ meet_sorcerer_02",
				"pdr_castle_vo_ meet_sorcerer_03",
				"pdr_castle_vo_ meet_sorcerer_04"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			sound_events = {
				"pdr_castle_vo_ meet_sorcerer_01",
				"pdr_castle_vo_ meet_sorcerer_02",
				"pdr_castle_vo_ meet_sorcerer_03",
				"pdr_castle_vo_ meet_sorcerer_04"
			}
		},
		pdr_castle_vo_door_open = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_door_open_01",
				"pdr_castle_vo_door_open_02",
				"pdr_castle_vo_door_open_03",
				"pdr_castle_vo_door_open_04"
			},
			sound_events_duration = {
				2.0890207290649,
				2.8119790554047,
				2.6292500495911,
				3.2843124866486
			},
			sound_events = {
				"pdr_castle_vo_door_open_01",
				"pdr_castle_vo_door_open_02",
				"pdr_castle_vo_door_open_03",
				"pdr_castle_vo_door_open_04"
			}
		},
		pdr_castle_vo_drop_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_drop_down_01",
				"pdr_castle_vo_drop_down_02",
				"pdr_castle_vo_drop_down_03",
				"pdr_castle_vo_drop_down_04"
			},
			sound_events_duration = {
				2.4454791545868,
				1.6362291574478,
				2.6312916278839,
				2.9817500114441
			},
			sound_events = {
				"pdr_castle_vo_drop_down_01",
				"pdr_castle_vo_drop_down_02",
				"pdr_castle_vo_drop_down_03",
				"pdr_castle_vo_drop_down_04"
			}
		},
		pdr_castle_vo_blockage = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_blockage_01",
				"pdr_castle_vo_blockage_02",
				"pdr_castle_vo_blockage_03",
				"pdr_castle_vo_blockage_04"
			},
			sound_events_duration = {
				1.3090000152588,
				2.3179790973663,
				2.7224373817444,
				2.1614167690277
			},
			sound_events = {
				"pdr_castle_vo_blockage_01",
				"pdr_castle_vo_blockage_02",
				"pdr_castle_vo_blockage_03",
				"pdr_castle_vo_blockage_04"
			}
		},
		pdr_castle_vo_do_not_recognize = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_do_not_recognize_01",
				"pdr_castle_vo_do_not_recognize_02",
				"pdr_castle_vo_do_not_recognize_03",
				"pdr_castle_vo_do_not_recognize_04"
			},
			sound_events_duration = {
				1.9875832796097,
				1.5793333053589,
				2.7241458892822,
				2.7062709331513
			},
			sound_events = {
				"pdr_castle_vo_do_not_recognize_01",
				"pdr_castle_vo_do_not_recognize_02",
				"pdr_castle_vo_do_not_recognize_03",
				"pdr_castle_vo_do_not_recognize_04"
			}
		},
		pdr_castle_vo_approaching_throne_room = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_approaching_throne_room_01",
				"pdr_castle_vo_approaching_throne_room_02",
				"pdr_castle_vo_approaching_throne_room_03",
				"pdr_castle_vo_approaching_throne_room_04"
			},
			sound_events_duration = {
				1.9636875391007,
				4.0206251144409,
				4.2710418701172,
				3.5767707824707
			},
			sound_events = {
				"pdr_castle_vo_approaching_throne_room_01",
				"pdr_castle_vo_approaching_throne_room_02",
				"pdr_castle_vo_approaching_throne_room_03",
				"pdr_castle_vo_approaching_throne_room_04"
			}
		},
		pdr_castle_vo_halls = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_castle",
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
				"pdr_castle_vo_halls_01",
				"pdr_castle_vo_halls_02",
				"pdr_castle_vo_halls_03",
				"pdr_castle_vo_halls_04"
			},
			sound_events_duration = {
				2.9504582881927,
				1.4750208854675,
				2.1846041679382,
				2.7588541507721
			},
			sound_events = {
				"pdr_castle_vo_halls_01",
				"pdr_castle_vo_halls_02",
				"pdr_castle_vo_halls_03",
				"pdr_castle_vo_halls_04"
			}
		}
	})
end
