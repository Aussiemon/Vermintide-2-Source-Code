return function ()
	define_rule({
		name = "pwh_bastion_intro_line_a",
		response = "pwh_bastion_intro_line_a",
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
		name = "pwh_bastion_intro_line_b",
		response = "pwh_bastion_intro_line_b",
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
		name = "pwh_bastion_intro_line_c",
		response = "pwh_bastion_intro_line_c",
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
		name = "pwh_bastion_vo_caves",
		response = "pwh_bastion_vo_caves",
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
		name = "pwh_bastion_vo_courtyard_done",
		response = "pwh_bastion_vo_courtyard_done",
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
		name = "pwh_bastion_vo_courtyard_first_villager",
		response = "pwh_bastion_vo_courtyard_first_villager",
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
		name = "pwh_bastion_vo_entering_courtyard",
		response = "pwh_bastion_vo_entering_courtyard",
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
		name = "pwh_bastion_vo_entering_darkness",
		response = "pwh_bastion_vo_entering_darkness",
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
		name = "pwh_bastion_vo_entering_finale",
		response = "pwh_bastion_vo_entering_finale",
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
	define_rule({
		name = "pwh_bastion_vo_entrance",
		response = "pwh_bastion_vo_entrance",
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
		name = "pwh_bastion_vo_exiting_pwh_bastion",
		response = "pwh_bastion_vo_exiting_pwh_bastion",
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
		name = "pwh_bastion_vo_finale_done",
		response = "pwh_bastion_vo_finale_done",
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
		name = "pwh_bastion_vo_finale_missile",
		response = "pwh_bastion_vo_finale_missile",
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
		name = "pwh_bastion_vo_finale_tiring",
		response = "pwh_bastion_vo_finale_tiring",
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
		name = "pwh_bastion_vo_head_to_surface",
		response = "pwh_bastion_vo_head_to_surface",
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
		name = "pwh_bastion_vo_inside_cellblock",
		response = "pwh_bastion_vo_inside_cellblock",
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
		name = "pwh_bastion_vo_no_prisoners",
		response = "pwh_bastion_vo_no_prisoners",
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
		name = "pwh_bastion_vo_possessed",
		response = "pwh_bastion_vo_possessed",
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
		name = "pwh_bastion_vo_search_cells",
		response = "pwh_bastion_vo_search_cells",
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
	add_dialogues({
		pwh_bastion_intro_line_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_drachenfels_bastion",
			sound_events_n = 2,
			category = "level_talk_must_play",
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
				[1.0] = "pwh_bastion_intro_line_a_01",
				[2.0] = "pwh_bastion_intro_line_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_bastion_intro_line_a_01",
				[2.0] = "pwh_bastion_intro_line_a_02"
			},
			sound_events_duration = {
				[1.0] = 5.4710416793823,
				[2.0] = 6.6300625801086
			}
		},
		pwh_bastion_intro_line_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_drachenfels_bastion",
			sound_events_n = 2,
			category = "level_talk_must_play",
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
				[1.0] = "pwh_bastion_intro_line_b_01",
				[2.0] = "pwh_bastion_intro_line_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_bastion_intro_line_b_01",
				[2.0] = "pwh_bastion_intro_line_b_02"
			},
			sound_events_duration = {
				[1.0] = 6.0414791107178,
				[2.0] = 5.5894374847412
			}
		},
		pwh_bastion_intro_line_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_drachenfels_bastion",
			sound_events_n = 2,
			category = "level_talk_must_play",
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
				[1.0] = "pwh_bastion_intro_line_c_01",
				[2.0] = "pwh_bastion_intro_line_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_bastion_intro_line_c_01",
				[2.0] = "pwh_bastion_intro_line_c_02"
			},
			sound_events_duration = {
				[1.0] = 10.246312141419,
				[2.0] = 6.6927289962769
			}
		},
		pwh_bastion_vo_caves = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_caves_01",
				"pwh_bastion_vo_caves_02",
				"pwh_bastion_vo_caves_03",
				"pwh_bastion_vo_caves_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_caves_01",
				"pwh_bastion_vo_caves_02",
				"pwh_bastion_vo_caves_03",
				"pwh_bastion_vo_caves_04"
			},
			sound_events_duration = {
				5.0032291412353,
				5.2365627288818,
				3.698979139328,
				6.1806664466858
			}
		},
		pwh_bastion_vo_courtyard_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_courtyard_done_01",
				"pwh_bastion_vo_courtyard_done_02",
				"pwh_bastion_vo_courtyard_done_03",
				"pwh_bastion_vo_courtyard_done_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_courtyard_done_01",
				"pwh_bastion_vo_courtyard_done_02",
				"pwh_bastion_vo_courtyard_done_03",
				"pwh_bastion_vo_courtyard_done_04"
			},
			sound_events_duration = {
				8.4549789428711,
				6.0023956298828,
				7.4392914772034,
				8.0126247406006
			}
		},
		pwh_bastion_vo_courtyard_first_villager = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_courtyard_first_villager_01",
				"pwh_bastion_vo_courtyard_first_villager_02",
				"pwh_bastion_vo_courtyard_first_villager_03",
				"pwh_bastion_vo_courtyard_first_villager_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_courtyard_first_villager_01",
				"pwh_bastion_vo_courtyard_first_villager_02",
				"pwh_bastion_vo_courtyard_first_villager_03",
				"pwh_bastion_vo_courtyard_first_villager_04"
			},
			sound_events_duration = {
				3.1292707920074,
				3.1052083969116,
				1.9459583759308,
				3.0482499599457
			}
		},
		pwh_bastion_vo_entering_courtyard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_entering_courtyard_01",
				"pwh_bastion_vo_entering_courtyard_02",
				"pwh_bastion_vo_entering_courtyard_03",
				"pwh_bastion_vo_entering_courtyard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_entering_courtyard_01",
				"pwh_bastion_vo_entering_courtyard_02",
				"pwh_bastion_vo_entering_courtyard_03",
				"pwh_bastion_vo_entering_courtyard_04"
			},
			sound_events_duration = {
				4.8284168243408,
				4.7769374847412,
				2.9607915878296,
				4.5533542633057
			}
		},
		pwh_bastion_vo_entering_darkness = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_entering_darkness_01",
				"pwh_bastion_vo_entering_darkness_02",
				"pwh_bastion_vo_entering_darkness_03",
				"pwh_bastion_vo_entering_darkness_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_entering_darkness_01",
				"pwh_bastion_vo_entering_darkness_02",
				"pwh_bastion_vo_entering_darkness_03",
				"pwh_bastion_vo_entering_darkness_04"
			},
			sound_events_duration = {
				3.9837083816528,
				3.2801876068115,
				2.8783540725708,
				3.9806249141693
			}
		},
		pwh_bastion_vo_entering_finale = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_entering_finale_01",
				"pwh_bastion_vo_entering_finale_02",
				"pwh_bastion_vo_entering_finale_03",
				"pwh_bastion_vo_entering_finale_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_entering_finale_01",
				"pwh_bastion_vo_entering_finale_02",
				"pwh_bastion_vo_entering_finale_03",
				"pwh_bastion_vo_entering_finale_04"
			},
			sound_events_duration = {
				8.0086460113525,
				7.956437587738,
				6.5384583473206,
				8.4246664047241
			}
		},
		pwh_bastion_vo_entrance = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_entrance_01",
				"pwh_bastion_vo_entrance_02",
				"pwh_bastion_vo_entrance_03",
				"pwh_bastion_vo_entrance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_entrance_01",
				"pwh_bastion_vo_entrance_02",
				"pwh_bastion_vo_entrance_03",
				"pwh_bastion_vo_entrance_04"
			},
			sound_events_duration = {
				5.8338332176208,
				2.0029375553131,
				4.6290001869202,
				5.4695625305176
			}
		},
		pwh_bastion_vo_exiting_pwh_bastion = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_exiting_pwh_bastion_01",
				"pwh_bastion_vo_exiting_pwh_bastion_02",
				"pwh_bastion_vo_exiting_pwh_bastion_03",
				"pwh_bastion_vo_exiting_pwh_bastion_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_exiting_pwh_bastion_01",
				"pwh_bastion_vo_exiting_pwh_bastion_02",
				"pwh_bastion_vo_exiting_pwh_bastion_03",
				"pwh_bastion_vo_exiting_pwh_bastion_04"
			},
			sound_events_duration = {
				7.0149168968201,
				5.4130415916443,
				5.686999797821,
				6.1349582672119
			}
		},
		pwh_bastion_vo_finale_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_finale_done_01",
				"pwh_bastion_vo_finale_done_02",
				"pwh_bastion_vo_finale_done_03",
				"pwh_bastion_vo_finale_done_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_finale_done_01",
				"pwh_bastion_vo_finale_done_02",
				"pwh_bastion_vo_finale_done_03",
				"pwh_bastion_vo_finale_done_04"
			},
			sound_events_duration = {
				4.9992499351502,
				3.1940207481384,
				3.6463959217072,
				3.4447708129883
			}
		},
		pwh_bastion_vo_finale_missile = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_finale_missile_01",
				"pwh_bastion_vo_finale_missile_02",
				"pwh_bastion_vo_finale_missile_03",
				"pwh_bastion_vo_finale_missile_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_finale_missile_01",
				"pwh_bastion_vo_finale_missile_02",
				"pwh_bastion_vo_finale_missile_03",
				"pwh_bastion_vo_finale_missile_04"
			},
			sound_events_duration = {
				3.3911249637604,
				3.2332708835602,
				5.6926040649414,
				3.0907082557678
			}
		},
		pwh_bastion_vo_finale_tiring = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_finale_tiring_01",
				"pwh_bastion_vo_finale_tiring_02",
				"pwh_bastion_vo_finale_tiring_03",
				"pwh_bastion_vo_finale_tiring_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_finale_tiring_01",
				"pwh_bastion_vo_finale_tiring_02",
				"pwh_bastion_vo_finale_tiring_03",
				"pwh_bastion_vo_finale_tiring_04"
			},
			sound_events_duration = {
				2.0707292556763,
				2.5236248970032,
				2.4456250667572,
				4.8852705955505
			}
		},
		pwh_bastion_vo_head_to_surface = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_head_to_surface_01",
				"pwh_bastion_vo_head_to_surface_02",
				"pwh_bastion_vo_head_to_surface_03",
				"pwh_bastion_vo_head_to_surface_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_head_to_surface_01",
				"pwh_bastion_vo_head_to_surface_02",
				"pwh_bastion_vo_head_to_surface_03",
				"pwh_bastion_vo_head_to_surface_04"
			},
			sound_events_duration = {
				1.6514166593552,
				6.2721247673035,
				4.5919790267944,
				5.8011875152588
			}
		},
		pwh_bastion_vo_inside_cellblock = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_inside_cellblock_01",
				"pwh_bastion_vo_inside_cellblock_02",
				"pwh_bastion_vo_inside_cellblock_03",
				"pwh_bastion_vo_inside_cellblock_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_inside_cellblock_01",
				"pwh_bastion_vo_inside_cellblock_02",
				"pwh_bastion_vo_inside_cellblock_03",
				"pwh_bastion_vo_inside_cellblock_04"
			},
			sound_events_duration = {
				2.6666457653046,
				4.9349374771118,
				3.4983749389648,
				6.0012497901917
			}
		},
		pwh_bastion_vo_no_prisoners = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_no_prisoners_01",
				"pwh_bastion_vo_no_prisoners_02",
				"pwh_bastion_vo_no_prisoners_03",
				"pwh_bastion_vo_no_prisoners_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_no_prisoners_01",
				"pwh_bastion_vo_no_prisoners_02",
				"pwh_bastion_vo_no_prisoners_03",
				"pwh_bastion_vo_no_prisoners_04"
			},
			sound_events_duration = {
				3.9690625667572,
				4.2049374580383,
				5.1279792785644,
				4.1436247825623
			}
		},
		pwh_bastion_vo_possessed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_possessed_01",
				"pwh_bastion_vo_possessed_02",
				"pwh_bastion_vo_possessed_03",
				"pwh_bastion_vo_possessed_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_possessed_01",
				"pwh_bastion_vo_possessed_02",
				"pwh_bastion_vo_possessed_03",
				"pwh_bastion_vo_possessed_04"
			},
			sound_events_duration = {
				2.6935625076294,
				3.5031459331513,
				2.2352917194366,
				4.5367918014526
			}
		},
		pwh_bastion_vo_search_cells = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_search_cells_01",
				"pwh_bastion_vo_search_cells_02",
				"pwh_bastion_vo_search_cells_03",
				"pwh_bastion_vo_search_cells_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_search_cells_01",
				"pwh_bastion_vo_search_cells_02",
				"pwh_bastion_vo_search_cells_03",
				"pwh_bastion_vo_search_cells_04"
			},
			sound_events_duration = {
				2.9186458587647,
				4.2366666793823,
				1.3992708921433,
				4.8994793891907
			}
		}
	})
end
