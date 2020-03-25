return function ()
	define_rule({
		name = "pwe_castle_intro_line_a",
		response = "pwe_castle_intro_line_a",
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
		name = "pwe_castle_intro_line_b",
		response = "pwe_castle_intro_line_b",
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
		name = "pwe_castle_intro_line_c",
		response = "pwe_castle_intro_line_c",
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
			}
		}
	})
	define_rule({
		name = "pwe_castle_vo_door_open",
		response = "pwe_castle_vo_door_open",
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
		name = "pwe_castle_vo_hello",
		response = "pwe_castle_vo_hello",
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
		name = "pwe_castle_vo_traces_one",
		response = "pwe_castle_vo_traces_one",
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
		name = "pwe_castle_vo_enter",
		response = "pwe_castle_vo_enter",
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
		name = "pwe_castle_vo_this_way",
		response = "pwe_castle_vo_this_way",
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
		name = "pwe_castle_vo_landed",
		response = "pwe_castle_vo_landed",
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
		name = "pwe_castle_vo_find_a_way_up",
		response = "pwe_castle_vo_find_a_way_up",
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
		name = "pwe_castle_vo_blood_pool",
		response = "pwe_castle_vo_blood_pool",
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
		name = "pwe_castle_vo_recognize",
		response = "pwe_castle_vo_recognize",
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
		name = "pwe_castle_vo_do_not_recognize",
		response = "pwe_castle_vo_do_not_recognize",
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
		name = "pwe_castle_vo_trap_switch",
		response = "pwe_castle_vo_trap_switch",
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
		name = "pwe_castle_vo_secret_door",
		response = "pwe_castle_vo_secret_door",
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
		name = "pwe_castle_vo_halls",
		response = "pwe_castle_vo_halls",
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
		name = "pwe_castle_vo_search_again",
		response = "pwe_castle_vo_search_again",
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
		name = "pwe_castle_vo_blockage",
		response = "pwe_castle_vo_blockage",
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
		name = "pwe_castle_vo_throne_room_approach",
		response = "pwe_castle_vo_throne_room_approach",
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
		name = "pwe_castle_vo_vista",
		response = "pwe_castle_vo_vista",
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
		name = "pwe_castle_vo_approaching_throne_room",
		response = "pwe_castle_vo_approaching_throne_room",
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
		name = "pwe_castle_vo_ meet_sorcerer",
		response = "pwe_castle_vo_ meet_sorcerer",
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
		name = "pwe_castle_vo_sorcerer_slain",
		response = "pwe_castle_vo_sorcerer_slain",
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
		name = "pwe_castle_vo_drop_down",
		response = "pwe_castle_vo_drop_down",
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
		name = "pwe_castle_vo_crypt_discovered",
		response = "pwe_castle_vo_crypt_discovered",
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
		name = "pwe_castle_vo_crypt_not_discovered",
		response = "pwe_castle_vo_crypt_not_discovered",
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
		pwe_castle_vo_crypt_not_discovered = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_crypt_not_discovered_01",
				"pwe_castle_vo_crypt_not_discovered_02",
				"pwe_castle_vo_crypt_not_discovered_03",
				"pwe_castle_vo_crypt_not_discovered_04"
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
				2.7244374752045,
				3.1157915592194,
				4.701687335968,
				4.3874793052673
			},
			localization_strings = {
				"pwe_castle_vo_crypt_not_discovered_01",
				"pwe_castle_vo_crypt_not_discovered_02",
				"pwe_castle_vo_crypt_not_discovered_03",
				"pwe_castle_vo_crypt_not_discovered_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_sorcerer_slain = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_sorcerer_slain_01",
				"pwe_castle_vo_sorcerer_slain_02",
				"pwe_castle_vo_sorcerer_slain_03",
				"pwe_castle_vo_sorcerer_slain_04"
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
				4.8305416107178,
				3.0071876049042,
				3.3376457691193,
				4.8228750228882
			},
			localization_strings = {
				"pwe_castle_vo_sorcerer_slain_01",
				"pwe_castle_vo_sorcerer_slain_02",
				"pwe_castle_vo_sorcerer_slain_03",
				"pwe_castle_vo_sorcerer_slain_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_halls = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_halls_01",
				"pwe_castle_vo_halls_02",
				"pwe_castle_vo_halls_03",
				"pwe_castle_vo_halls_04"
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
				2.3983540534973,
				2.4824166297913,
				1.5181250572205,
				3.8126041889191
			},
			localization_strings = {
				"pwe_castle_vo_halls_01",
				"pwe_castle_vo_halls_02",
				"pwe_castle_vo_halls_03",
				"pwe_castle_vo_halls_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_hello = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_hello_01",
				"pwe_castle_vo_hello_02",
				"pwe_castle_vo_hello_03",
				"pwe_castle_vo_hello_04"
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
				1.3816666603088,
				2.891104221344,
				4.0542917251587,
				4.3000001907349
			},
			localization_strings = {
				"pwe_castle_vo_hello_01",
				"pwe_castle_vo_hello_02",
				"pwe_castle_vo_hello_03",
				"pwe_castle_vo_hello_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_blockage = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_blockage_01",
				"pwe_castle_vo_blockage_02",
				"pwe_castle_vo_blockage_03",
				"pwe_castle_vo_blockage_04"
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
				2.7820415496826,
				2.7951874732971,
				2.0941457748413,
				5.1608958244324
			},
			localization_strings = {
				"pwe_castle_vo_blockage_01",
				"pwe_castle_vo_blockage_02",
				"pwe_castle_vo_blockage_03",
				"pwe_castle_vo_blockage_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_do_not_recognize = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_do_not_recognize_01",
				"pwe_castle_vo_do_not_recognize_02",
				"pwe_castle_vo_do_not_recognize_03",
				"pwe_castle_vo_do_not_recognize_04"
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
				2.6636457443237,
				4.5972499847412,
				4.3868126869202,
				4.0119166374206
			},
			localization_strings = {
				"pwe_castle_vo_do_not_recognize_01",
				"pwe_castle_vo_do_not_recognize_02",
				"pwe_castle_vo_do_not_recognize_03",
				"pwe_castle_vo_do_not_recognize_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_enter = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_enter_01",
				"pwe_castle_vo_enter_02",
				"pwe_castle_vo_enter_03",
				"pwe_castle_vo_enter_04"
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
				1.9358333349228,
				2.238874912262,
				2.0276041030884,
				2.9480834007263
			},
			localization_strings = {
				"pwe_castle_vo_enter_01",
				"pwe_castle_vo_enter_02",
				"pwe_castle_vo_enter_03",
				"pwe_castle_vo_enter_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_traces_one = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_traces_one_01",
				"pwe_castle_vo_traces_one_02",
				"pwe_castle_vo_traces_one_03",
				"pwe_castle_vo_traces_one_04"
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
				5.8680000305176,
				4.3440208435059,
				3.5347917079926,
				4.1788749694824
			},
			localization_strings = {
				"pwe_castle_vo_traces_one_01",
				"pwe_castle_vo_traces_one_02",
				"pwe_castle_vo_traces_one_03",
				"pwe_castle_vo_traces_one_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_this_way = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_this_way_01",
				"pwe_castle_vo_this_way_02",
				"pwe_castle_vo_this_way_03",
				"pwe_castle_vo_this_way_04"
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
				2.2798540592194,
				1.4877500534058,
				2.2677292823791,
				1.7686874866486
			},
			localization_strings = {
				"pwe_castle_vo_this_way_01",
				"pwe_castle_vo_this_way_02",
				"pwe_castle_vo_this_way_03",
				"pwe_castle_vo_this_way_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_drop_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_drop_down_01",
				"pwe_castle_vo_drop_down_02",
				"pwe_castle_vo_drop_down_03",
				"pwe_castle_vo_drop_down_04"
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
				1.7947916984558,
				3.8945417404175,
				4.4240207672119,
				2.7157707214356
			},
			localization_strings = {
				"pwe_castle_vo_drop_down_01",
				"pwe_castle_vo_drop_down_02",
				"pwe_castle_vo_drop_down_03",
				"pwe_castle_vo_drop_down_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_intro_line_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_castle_intro_line_a_01",
				[2.0] = "pwe_castle_intro_line_a_02"
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
				[1.0] = 3.869916677475,
				[2.0] = 5.007333278656
			},
			localization_strings = {
				[1.0] = "pwe_castle_intro_line_a_01",
				[2.0] = "pwe_castle_intro_line_a_02"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_blood_pool = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_blood_pool_01",
				"pwe_castle_vo_blood_pool_02",
				"pwe_castle_vo_blood_pool_03",
				"pwe_castle_vo_blood_pool_04"
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
				3.5470416545868,
				4.7024793624878,
				2.9448957443237,
				1.8283958435059
			},
			localization_strings = {
				"pwe_castle_vo_blood_pool_01",
				"pwe_castle_vo_blood_pool_02",
				"pwe_castle_vo_blood_pool_03",
				"pwe_castle_vo_blood_pool_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_secret_door = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_secret_door_01",
				"pwe_castle_vo_secret_door_02",
				"pwe_castle_vo_secret_door_03",
				"pwe_castle_vo_secret_door_04"
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
				1.7406666278839,
				3.6049375534058,
				2.100729227066,
				2.720062494278
			},
			localization_strings = {
				"pwe_castle_vo_secret_door_01",
				"pwe_castle_vo_secret_door_02",
				"pwe_castle_vo_secret_door_03",
				"pwe_castle_vo_secret_door_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_find_a_way_up = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_find_a_way_up_01",
				"pwe_castle_vo_find_a_way_up_02",
				"pwe_castle_vo_find_a_way_up_03",
				"pwe_castle_vo_find_a_way_up_04"
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
				2.1575000286102,
				3.8096249103546,
				3.6605000495911,
				3.6834583282471
			},
			localization_strings = {
				"pwe_castle_vo_find_a_way_up_01",
				"pwe_castle_vo_find_a_way_up_02",
				"pwe_castle_vo_find_a_way_up_03",
				"pwe_castle_vo_find_a_way_up_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_recognize = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_recognize_01",
				"pwe_castle_vo_recognize_02",
				"pwe_castle_vo_recognize_03",
				"pwe_castle_vo_recognize_04"
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
				2.9896249771118,
				4.1435418128967,
				4.1662502288818,
				6.3006873130798
			},
			localization_strings = {
				"pwe_castle_vo_recognize_01",
				"pwe_castle_vo_recognize_02",
				"pwe_castle_vo_recognize_03",
				"pwe_castle_vo_recognize_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_landed = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_landed_01",
				"pwe_castle_vo_landed_02",
				"pwe_castle_vo_landed_03",
				"pwe_castle_vo_landed_04"
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
				2.8544790744781,
				5.6931247711182,
				3.414999961853,
				3.9382708072662
			},
			localization_strings = {
				"pwe_castle_vo_landed_01",
				"pwe_castle_vo_landed_02",
				"pwe_castle_vo_landed_03",
				"pwe_castle_vo_landed_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_vista_01",
				"pwe_castle_vo_vista_02",
				"pwe_castle_vo_vista_03",
				"pwe_castle_vo_vista_04"
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
				4.801146030426,
				3.8737916946411,
				3.6567709445953,
				4.0523543357849
			},
			localization_strings = {
				"pwe_castle_vo_vista_01",
				"pwe_castle_vo_vista_02",
				"pwe_castle_vo_vista_03",
				"pwe_castle_vo_vista_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_crypt_discovered = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_crypt_discovered_01",
				"pwe_castle_vo_crypt_discovered_02",
				"pwe_castle_vo_crypt_discovered_03",
				"pwe_castle_vo_crypt_discovered_04"
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
				5.7690415382385,
				4.9796042442322,
				4.5867500305176,
				5.1488752365112
			},
			localization_strings = {
				"pwe_castle_vo_crypt_discovered_01",
				"pwe_castle_vo_crypt_discovered_02",
				"pwe_castle_vo_crypt_discovered_03",
				"pwe_castle_vo_crypt_discovered_04"
			},
			randomize_indexes = {}
		},
		["pwe_castle_vo_ meet_sorcerer"] = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_ meet_sorcerer_01",
				"pwe_castle_vo_ meet_sorcerer_02",
				"pwe_castle_vo_ meet_sorcerer_03",
				"pwe_castle_vo_ meet_sorcerer_04"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_castle_vo_ meet_sorcerer_01",
				"pwe_castle_vo_ meet_sorcerer_02",
				"pwe_castle_vo_ meet_sorcerer_03",
				"pwe_castle_vo_ meet_sorcerer_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_approaching_throne_room = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_approaching_throne_room_01",
				"pwe_castle_vo_approaching_throne_room_02",
				"pwe_castle_vo_approaching_throne_room_03",
				"pwe_castle_vo_approaching_throne_room_04"
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
				3.5202083587647,
				4.0203123092651,
				3.8414790630341,
				2.8035209178925
			},
			localization_strings = {
				"pwe_castle_vo_approaching_throne_room_01",
				"pwe_castle_vo_approaching_throne_room_02",
				"pwe_castle_vo_approaching_throne_room_03",
				"pwe_castle_vo_approaching_throne_room_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_intro_line_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_castle_intro_line_c_01",
				[2.0] = "pwe_castle_intro_line_c_02"
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
				[1.0] = 2.8226666450501,
				[2.0] = 2.5329999923706
			},
			localization_strings = {
				[1.0] = "pwe_castle_intro_line_c_01",
				[2.0] = "pwe_castle_intro_line_c_02"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_trap_switch = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_trap_switch_01",
				"pwe_castle_vo_trap_switch_02",
				"pwe_castle_vo_trap_switch_03",
				"pwe_castle_vo_trap_switch_04"
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
				3.634604215622,
				2.8957500457764,
				1.614937543869,
				1.8543750047684
			},
			localization_strings = {
				"pwe_castle_vo_trap_switch_01",
				"pwe_castle_vo_trap_switch_02",
				"pwe_castle_vo_trap_switch_03",
				"pwe_castle_vo_trap_switch_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_door_open = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_door_open_01",
				"pwe_castle_vo_door_open_02",
				"pwe_castle_vo_door_open_03",
				"pwe_castle_vo_door_open_04"
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
				3.2547917366028,
				2.7943332195282,
				3.829916715622,
				2.8716666698456
			},
			localization_strings = {
				"pwe_castle_vo_door_open_01",
				"pwe_castle_vo_door_open_02",
				"pwe_castle_vo_door_open_03",
				"pwe_castle_vo_door_open_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_throne_room_approach = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_throne_room_approach_01",
				"pwe_castle_vo_throne_room_approach_02",
				"pwe_castle_vo_throne_room_approach_03",
				"pwe_castle_vo_throne_room_approach_04"
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
				3.6368124485016,
				3.6962082386017,
				5.0839376449585,
				4.1105623245239
			},
			localization_strings = {
				"pwe_castle_vo_throne_room_approach_01",
				"pwe_castle_vo_throne_room_approach_02",
				"pwe_castle_vo_throne_room_approach_03",
				"pwe_castle_vo_throne_room_approach_04"
			},
			randomize_indexes = {}
		},
		pwe_castle_intro_line_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_castle_intro_line_b_01",
				[2.0] = "pwe_castle_intro_line_b_02"
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
				[1.0] = 3.865291595459,
				[2.0] = 4.2628540992737
			},
			localization_strings = {
				[1.0] = "pwe_castle_intro_line_b_01",
				[2.0] = "pwe_castle_intro_line_b_02"
			},
			randomize_indexes = {}
		},
		pwe_castle_vo_search_again = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_castle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_castle_vo_search_again_01",
				"pwe_castle_vo_search_again_02",
				"pwe_castle_vo_search_again_03",
				"pwe_castle_vo_search_again_04"
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
				2.8774790763855,
				3.5818123817444,
				3.4385416507721,
				3.4020624160767
			},
			localization_strings = {
				"pwe_castle_vo_search_again_01",
				"pwe_castle_vo_search_again_02",
				"pwe_castle_vo_search_again_03",
				"pwe_castle_vo_search_again_04"
			},
			randomize_indexes = {}
		}
	})
end