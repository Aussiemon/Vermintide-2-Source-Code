return function ()
	define_rule({
		name = "pes_bastion_intro_line_a",
		response = "pes_bastion_intro_line_a",
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
				"bastion_intro_line_a"
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
				"bastion_intro_line_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_intro_line_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_intro_line_b",
		response = "pes_bastion_intro_line_b",
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
				"bastion_intro_line_a"
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
				"bastion_intro_line_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_intro_line_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_intro_line_c",
		response = "pes_bastion_intro_line_c",
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
				"bastion_intro_line_b"
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
				"bastion_intro_line_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_intro_line_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_entrance",
		response = "pes_bastion_vo_entrance",
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
				"bastion_vo_entrance"
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
				"bastion_vo_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_caves",
		response = "pes_bastion_vo_caves",
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
				"bastion_vo_caves"
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
				"bastion_vo_caves",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_caves",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_search_cells",
		response = "pes_bastion_vo_search_cells",
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
				"bastion_vo_search_cells"
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
				"bastion_vo_search_cells",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_search_cells",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_inside_cellblock",
		response = "pes_bastion_vo_inside_cellblock",
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
				"bastion_vo_inside_cellblock"
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
				"bastion_vo_inside_cellblock",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_inside_cellblock",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_no_prisoners",
		response = "pes_bastion_vo_no_prisoners",
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
				"bastion_vo_no_prisoners"
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
				"bastion_vo_no_prisoners",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_no_prisoners",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_head_to_surface",
		response = "pes_bastion_vo_head_to_surface",
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
				"bastion_vo_head_to_surface"
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
				"bastion_vo_head_to_surface",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_head_to_surface",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_entering_courtyard",
		response = "pes_bastion_vo_entering_courtyard",
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
				"bastion_vo_entering_courtyard"
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
				"bastion_vo_entering_courtyard",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entering_courtyard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_courtyard_first_villager",
		response = "pes_bastion_vo_courtyard_first_villager",
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
				"bastion_vo_courtyard_first_villager"
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
				"bastion_vo_courtyard_first_villager",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_courtyard_first_villager",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_courtyard_done",
		response = "pes_bastion_vo_courtyard_done",
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
				"bastion_vo_courtyard_done"
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
				"bastion_vo_courtyard_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_courtyard_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_entering_darkness",
		response = "pes_bastion_vo_entering_darkness",
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
				"bastion_vo_entering_darkness"
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
				"bastion_vo_entering_darkness",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entering_darkness",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_finale_missile",
		response = "pes_bastion_vo_finale_missile",
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
				"bastion_vo_finale_missile"
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
				"bastion_vo_finale_missile",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_finale_missile",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_finale_tiring",
		response = "pes_bastion_vo_finale_tiring",
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
				"bastion_vo_finale_tiring"
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
				"bastion_vo_finale_tiring",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_finale_tiring",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_finale_done",
		response = "pes_bastion_vo_finale_done",
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
				"bastion_vo_finale_done"
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
				"bastion_vo_finale_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_finale_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_exiting_pes_bastion",
		response = "pes_bastion_vo_exiting_pes_bastion",
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
				"bastion_vo_exiting_bastion"
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
				"bastion_vo_exiting_bastion",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_exiting_bastion",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_possessed",
		response = "pes_bastion_vo_possessed",
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
				"bastion_vo_possessed"
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
				"bastion_vo_possessed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_possessed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_entering_finale",
		response = "pes_bastion_vo_entering_finale",
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
				"bastion_vo_entering_finale"
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
				"bastion_vo_entering_finale",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pes_bastion_vo_no_prisoners = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_no_prisoners_01",
				"pes_bastion_vo_no_prisoners_02",
				"pes_bastion_vo_no_prisoners_03",
				"pes_bastion_vo_no_prisoners_04"
			},
			sound_events = {
				"pes_bastion_vo_no_prisoners_01",
				"pes_bastion_vo_no_prisoners_02",
				"pes_bastion_vo_no_prisoners_03",
				"pes_bastion_vo_no_prisoners_04"
			},
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
			sound_events_duration = {
				1.991666674614,
				3.2177290916443,
				2.7770833969116,
				2.7640416622162
			}
		},
		pes_bastion_vo_entering_courtyard = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_entering_courtyard_01",
				"pes_bastion_vo_entering_courtyard_02",
				"pes_bastion_vo_entering_courtyard_03",
				"pes_bastion_vo_entering_courtyard_04"
			},
			sound_events = {
				"pes_bastion_vo_entering_courtyard_01",
				"pes_bastion_vo_entering_courtyard_02",
				"pes_bastion_vo_entering_courtyard_03",
				"pes_bastion_vo_entering_courtyard_04"
			},
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
			sound_events_duration = {
				2.1239790916443,
				2.7184270620346,
				1.9661874771118,
				2.7855417728424
			}
		},
		pes_bastion_vo_finale_tiring = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_finale_tiring_01",
				"pes_bastion_vo_finale_tiring_02",
				"pes_bastion_vo_finale_tiring_03",
				"pes_bastion_vo_finale_tiring_04"
			},
			sound_events = {
				"pes_bastion_vo_finale_tiring_01",
				"pes_bastion_vo_finale_tiring_02",
				"pes_bastion_vo_finale_tiring_03",
				"pes_bastion_vo_finale_tiring_04"
			},
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
			sound_events_duration = {
				1.6961041688919,
				1.4846874475479,
				2.1960415840149,
				2.6568748950958
			}
		},
		pes_bastion_vo_search_cells = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_search_cells_01",
				"pes_bastion_vo_search_cells_02",
				"pes_bastion_vo_search_cells_03",
				"pes_bastion_vo_search_cells_04"
			},
			sound_events = {
				"pes_bastion_vo_search_cells_01",
				"pes_bastion_vo_search_cells_02",
				"pes_bastion_vo_search_cells_03",
				"pes_bastion_vo_search_cells_04"
			},
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
			sound_events_duration = {
				2.4969999790192,
				1.4951666593552,
				1.4713749885559,
				1.9938958883286
			}
		},
		pes_bastion_vo_head_to_surface = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_head_to_surface_01",
				"pes_bastion_vo_head_to_surface_02",
				"pes_bastion_vo_head_to_surface_03",
				"pes_bastion_vo_head_to_surface_04"
			},
			sound_events = {
				"pes_bastion_vo_head_to_surface_01",
				"pes_bastion_vo_head_to_surface_02",
				"pes_bastion_vo_head_to_surface_03",
				"pes_bastion_vo_head_to_surface_04"
			},
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
			sound_events_duration = {
				2.0023958683014,
				2.4236249923706,
				0.6258749961853,
				2.8332500457764
			}
		},
		pes_bastion_vo_entrance = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_entrance_01",
				"pes_bastion_vo_entrance_02",
				"pes_bastion_vo_entrance_03",
				"pes_bastion_vo_entrance_04"
			},
			sound_events = {
				"pes_bastion_vo_entrance_01",
				"pes_bastion_vo_entrance_02",
				"pes_bastion_vo_entrance_03",
				"pes_bastion_vo_entrance_04"
			},
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
			sound_events_duration = {
				4.0052084922791,
				3.4777708053589,
				2.6307916641235,
				1.7633541822434
			}
		},
		pes_bastion_intro_line_b = {
			face_animations_n = 2,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_bastion_intro_line_b_01",
				[2.0] = "pes_bastion_intro_line_b_02"
			},
			sound_events = {
				[1.0] = "pes_bastion_intro_line_b_01",
				[2.0] = "pes_bastion_intro_line_b_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.2828958034515,
				[2.0] = 5.0144376754761
			}
		},
		pes_bastion_vo_finale_missile = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_finale_missile_01",
				"pes_bastion_vo_finale_missile_02",
				"pes_bastion_vo_finale_missile_03",
				"pes_bastion_vo_finale_missile_04"
			},
			sound_events = {
				"pes_bastion_vo_finale_missile_01",
				"pes_bastion_vo_finale_missile_02",
				"pes_bastion_vo_finale_missile_03",
				"pes_bastion_vo_finale_missile_04"
			},
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
			sound_events_duration = {
				2.0889375209808,
				1.0618541240692,
				2.3098957538605,
				2.0730209350586
			}
		},
		pes_bastion_vo_entering_finale = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_entering_finale_01",
				"pes_bastion_vo_entering_finale_02",
				"pes_bastion_vo_entering_finale_03",
				"pes_bastion_vo_entering_finale_04"
			},
			sound_events = {
				"pes_bastion_vo_entering_finale_01",
				"pes_bastion_vo_entering_finale_02",
				"pes_bastion_vo_entering_finale_03",
				"pes_bastion_vo_entering_finale_04"
			},
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
			sound_events_duration = {
				3.8963541984558,
				3.948979139328,
				3.337812423706,
				3.6772084236145
			}
		},
		pes_bastion_vo_finale_done = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_finale_done_01",
				"pes_bastion_vo_finale_done_02",
				"pes_bastion_vo_finale_done_03",
				"pes_bastion_vo_finale_done_04"
			},
			sound_events = {
				"pes_bastion_vo_finale_done_01",
				"pes_bastion_vo_finale_done_02",
				"pes_bastion_vo_finale_done_03",
				"pes_bastion_vo_finale_done_04"
			},
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
			sound_events_duration = {
				1.7058124542236,
				3.2274167537689,
				2.8628125190735,
				2.8412708044052
			}
		},
		pes_bastion_vo_possessed = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_possessed_01",
				"pes_bastion_vo_possessed_02",
				"pes_bastion_vo_possessed_03",
				"pes_bastion_vo_possessed_04"
			},
			sound_events = {
				"pes_bastion_vo_possessed_01",
				"pes_bastion_vo_possessed_02",
				"pes_bastion_vo_possessed_03",
				"pes_bastion_vo_possessed_04"
			},
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
			sound_events_duration = {
				2.3918853998184,
				1.2925833463669,
				1.5744374990463,
				1.1755207777023
			}
		},
		pes_bastion_vo_courtyard_done = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_courtyard_done_01",
				"pes_bastion_vo_courtyard_done_02",
				"pes_bastion_vo_courtyard_done_03",
				"pes_bastion_vo_courtyard_done_04"
			},
			sound_events = {
				"pes_bastion_vo_courtyard_done_01",
				"pes_bastion_vo_courtyard_done_02",
				"pes_bastion_vo_courtyard_done_03",
				"pes_bastion_vo_courtyard_done_04"
			},
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
			sound_events_duration = {
				2.778520822525,
				3.6093332767487,
				3.2343542575836,
				4.6515831947327
			}
		},
		pes_bastion_vo_entering_darkness = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_entering_darkness_01",
				"pes_bastion_vo_entering_darkness_02",
				"pes_bastion_vo_entering_darkness_03",
				"pes_bastion_vo_entering_darkness_04"
			},
			sound_events = {
				"pes_bastion_vo_entering_darkness_01",
				"pes_bastion_vo_entering_darkness_02",
				"pes_bastion_vo_entering_darkness_03",
				"pes_bastion_vo_entering_darkness_04"
			},
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
			sound_events_duration = {
				3.761125087738,
				2.2148749828339,
				1.8617708683014,
				3.2374374866486
			}
		},
		pes_bastion_intro_line_c = {
			face_animations_n = 2,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_bastion_intro_line_c_01",
				[2.0] = "pes_bastion_intro_line_c_02"
			},
			sound_events = {
				[1.0] = "pes_bastion_intro_line_c_01",
				[2.0] = "pes_bastion_intro_line_c_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.3877291679382,
				[2.0] = 4.5370626449585
			}
		},
		pes_bastion_vo_exiting_pes_bastion = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_exiting_pes_bastion_01",
				"pes_bastion_vo_exiting_pes_bastion_02",
				"pes_bastion_vo_exiting_pes_bastion_03",
				"pes_bastion_vo_exiting_pes_bastion_04"
			},
			sound_events = {
				"pes_bastion_vo_exiting_pes_bastion_01",
				"pes_bastion_vo_exiting_pes_bastion_02",
				"pes_bastion_vo_exiting_pes_bastion_03",
				"pes_bastion_vo_exiting_pes_bastion_04"
			},
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
			sound_events_duration = {
				2.753666639328,
				4.9759168624878,
				5.006395816803,
				4.720166683197
			}
		},
		pes_bastion_intro_line_a = {
			face_animations_n = 2,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_bastion_intro_line_a_01",
				[2.0] = "pes_bastion_intro_line_a_02"
			},
			sound_events = {
				[1.0] = "pes_bastion_intro_line_a_01",
				[2.0] = "pes_bastion_intro_line_a_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.9938335418701,
				[2.0] = 4.0484790802002
			}
		},
		pes_bastion_vo_courtyard_first_villager = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_courtyard_first_villager_01",
				"pes_bastion_vo_courtyard_first_villager_02",
				"pes_bastion_vo_courtyard_first_villager_03",
				"pes_bastion_vo_courtyard_first_villager_04"
			},
			sound_events = {
				"pes_bastion_vo_courtyard_first_villager_01",
				"pes_bastion_vo_courtyard_first_villager_02",
				"pes_bastion_vo_courtyard_first_villager_03",
				"pes_bastion_vo_courtyard_first_villager_04"
			},
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
			sound_events_duration = {
				2.5035417079926,
				2.5845625400543,
				1.4909374713898,
				4.5511040687561
			}
		},
		pes_bastion_vo_caves = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_caves_01",
				"pes_bastion_vo_caves_02",
				"pes_bastion_vo_caves_03",
				"pes_bastion_vo_caves_04"
			},
			sound_events = {
				"pes_bastion_vo_caves_01",
				"pes_bastion_vo_caves_02",
				"pes_bastion_vo_caves_03",
				"pes_bastion_vo_caves_04"
			},
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
			sound_events_duration = {
				3.3893959522247,
				3.2925832271576,
				2.4206666946411,
				1.7094374895096
			}
		},
		pes_bastion_vo_inside_cellblock = {
			face_animations_n = 4,
			database = "empire_soldier_dlc_drachenfels_bastion",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_bastion_vo_inside_cellblock_01",
				"pes_bastion_vo_inside_cellblock_02",
				"pes_bastion_vo_inside_cellblock_03",
				"pes_bastion_vo_inside_cellblock_04"
			},
			sound_events = {
				"pes_bastion_vo_inside_cellblock_01",
				"pes_bastion_vo_inside_cellblock_02",
				"pes_bastion_vo_inside_cellblock_03",
				"pes_bastion_vo_inside_cellblock_04"
			},
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
			sound_events_duration = {
				2.8689999580383,
				2.815708398819,
				1.347833275795,
				3.396187543869
			}
		}
	})
end
