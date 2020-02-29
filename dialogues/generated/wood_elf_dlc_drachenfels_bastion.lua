return function ()
	define_rule({
		name = "pwe_bastion_intro_line_a",
		response = "pwe_bastion_intro_line_a",
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
		name = "pwe_bastion_intro_line_b",
		response = "pwe_bastion_intro_line_b",
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
		name = "pwe_bastion_intro_line_c",
		response = "pwe_bastion_intro_line_c",
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
		name = "pwe_bastion_vo_entrance",
		response = "pwe_bastion_vo_entrance",
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
		name = "pwe_bastion_vo_caves",
		response = "pwe_bastion_vo_caves",
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
		name = "pwe_bastion_vo_search_cells",
		response = "pwe_bastion_vo_search_cells",
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
		name = "pwe_bastion_vo_inside_cellblock",
		response = "pwe_bastion_vo_inside_cellblock",
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
		name = "pwe_bastion_vo_no_prisoners",
		response = "pwe_bastion_vo_no_prisoners",
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
		name = "pwe_bastion_vo_head_to_surface",
		response = "pwe_bastion_vo_head_to_surface",
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
		name = "pwe_bastion_vo_entering_courtyard",
		response = "pwe_bastion_vo_entering_courtyard",
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
		name = "pwe_bastion_vo_courtyard_first_villager",
		response = "pwe_bastion_vo_courtyard_first_villager",
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
		name = "pwe_bastion_vo_courtyard_done",
		response = "pwe_bastion_vo_courtyard_done",
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
		name = "pwe_bastion_vo_entering_darkness",
		response = "pwe_bastion_vo_entering_darkness",
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
		name = "pwe_bastion_vo_finale_missile",
		response = "pwe_bastion_vo_finale_missile",
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
		name = "pwe_bastion_vo_finale_tiring",
		response = "pwe_bastion_vo_finale_tiring",
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
		name = "pwe_bastion_vo_finale_done",
		response = "pwe_bastion_vo_finale_done",
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
		name = "pwe_bastion_vo_exiting_pwe_bastion",
		response = "pwe_bastion_vo_exiting_pwe_bastion",
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
		name = "pwe_bastion_vo_possessed",
		response = "pwe_bastion_vo_possessed",
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
		name = "pwe_bastion_vo_entering_finale",
		response = "pwe_bastion_vo_entering_finale",
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
		pwe_bastion_vo_finale_missile = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_finale_missile_01",
				"pwe_bastion_vo_finale_missile_02",
				"pwe_bastion_vo_finale_missile_03",
				"pwe_bastion_vo_finale_missile_04"
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
				2.4427917003632,
				1.9630208015442,
				1.6030000448227,
				1.7298958301544
			},
			localization_strings = {
				"pwe_bastion_vo_finale_missile_01",
				"pwe_bastion_vo_finale_missile_02",
				"pwe_bastion_vo_finale_missile_03",
				"pwe_bastion_vo_finale_missile_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_intro_line_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_bastion_intro_line_a_01",
				[2.0] = "pwe_bastion_intro_line_a_02"
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
				[1.0] = 2.7857291698456,
				[2.0] = 4.3376460075378
			},
			localization_strings = {
				[1.0] = "pwe_bastion_intro_line_a_01",
				[2.0] = "pwe_bastion_intro_line_a_02"
			},
			randomize_indexes = {}
		},
		pwe_bastion_intro_line_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_bastion_intro_line_c_01",
				[2.0] = "pwe_bastion_intro_line_c_02"
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
				[1.0] = 6.4008750915527,
				[2.0] = 6.5519375801086
			},
			localization_strings = {
				[1.0] = "pwe_bastion_intro_line_c_01",
				[2.0] = "pwe_bastion_intro_line_c_02"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_finale_done = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_finale_done_01",
				"pwe_bastion_vo_finale_done_02",
				"pwe_bastion_vo_finale_done_03",
				"pwe_bastion_vo_finale_done_04"
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
				0.97187501192093,
				0.98818749189377,
				1.5176249742508,
				3.1106250286102
			},
			localization_strings = {
				"pwe_bastion_vo_finale_done_01",
				"pwe_bastion_vo_finale_done_02",
				"pwe_bastion_vo_finale_done_03",
				"pwe_bastion_vo_finale_done_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_entering_darkness = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_entering_darkness_01",
				"pwe_bastion_vo_entering_darkness_02",
				"pwe_bastion_vo_entering_darkness_03",
				"pwe_bastion_vo_entering_darkness_04"
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
				2.3847498893738,
				2.9722292423248,
				3.6561665534973,
				6.4052500724792
			},
			localization_strings = {
				"pwe_bastion_vo_entering_darkness_01",
				"pwe_bastion_vo_entering_darkness_02",
				"pwe_bastion_vo_entering_darkness_03",
				"pwe_bastion_vo_entering_darkness_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_search_cells = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_search_cells_01",
				"pwe_bastion_vo_search_cells_02",
				"pwe_bastion_vo_search_cells_03",
				"pwe_bastion_vo_search_cells_04"
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
				4.1973333358765,
				2.7880001068115,
				3.2337708473206,
				1.8201667070389
			},
			localization_strings = {
				"pwe_bastion_vo_search_cells_01",
				"pwe_bastion_vo_search_cells_02",
				"pwe_bastion_vo_search_cells_03",
				"pwe_bastion_vo_search_cells_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_possessed = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_possessed_01",
				"pwe_bastion_vo_possessed_02",
				"pwe_bastion_vo_possessed_03",
				"pwe_bastion_vo_possessed_04"
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
				1.7426458597183,
				1.5307916402817,
				1.5794792175293,
				1.6473541259766
			},
			localization_strings = {
				"pwe_bastion_vo_possessed_01",
				"pwe_bastion_vo_possessed_02",
				"pwe_bastion_vo_possessed_03",
				"pwe_bastion_vo_possessed_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_courtyard_first_villager = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_courtyard_first_villager_01",
				"pwe_bastion_vo_courtyard_first_villager_02",
				"pwe_bastion_vo_courtyard_first_villager_03",
				"pwe_bastion_vo_courtyard_first_villager_04"
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
				2.0684583187103,
				1.9203333854675,
				1.1004166603088,
				2.0987708568573
			},
			localization_strings = {
				"pwe_bastion_vo_courtyard_first_villager_01",
				"pwe_bastion_vo_courtyard_first_villager_02",
				"pwe_bastion_vo_courtyard_first_villager_03",
				"pwe_bastion_vo_courtyard_first_villager_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_inside_cellblock = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_inside_cellblock_01",
				"pwe_bastion_vo_inside_cellblock_02",
				"pwe_bastion_vo_inside_cellblock_03",
				"pwe_bastion_vo_inside_cellblock_04"
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
				2.1795625686645,
				2.2341248989105,
				2.9103541374206,
				3.0153748989105
			},
			localization_strings = {
				"pwe_bastion_vo_inside_cellblock_01",
				"pwe_bastion_vo_inside_cellblock_02",
				"pwe_bastion_vo_inside_cellblock_03",
				"pwe_bastion_vo_inside_cellblock_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_courtyard_done = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_courtyard_done_01",
				"pwe_bastion_vo_courtyard_done_02",
				"pwe_bastion_vo_courtyard_done_03",
				"pwe_bastion_vo_courtyard_done_04"
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
				3.0422916412353,
				2.592437505722,
				4.2702708244324,
				4.2032084465027
			},
			localization_strings = {
				"pwe_bastion_vo_courtyard_done_01",
				"pwe_bastion_vo_courtyard_done_02",
				"pwe_bastion_vo_courtyard_done_03",
				"pwe_bastion_vo_courtyard_done_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_no_prisoners = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_no_prisoners_01",
				"pwe_bastion_vo_no_prisoners_02",
				"pwe_bastion_vo_no_prisoners_03",
				"pwe_bastion_vo_no_prisoners_04"
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
				2.2687082290649,
				3.3536458015442,
				2.7353749275208,
				2.1004374027252
			},
			localization_strings = {
				"pwe_bastion_vo_no_prisoners_01",
				"pwe_bastion_vo_no_prisoners_02",
				"pwe_bastion_vo_no_prisoners_03",
				"pwe_bastion_vo_no_prisoners_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_entering_finale = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_entering_finale_01",
				"pwe_bastion_vo_entering_finale_02",
				"pwe_bastion_vo_entering_finale_03",
				"pwe_bastion_vo_entering_finale_04"
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
				5.5496039390564,
				9.2025623321533,
				5.4083957672119,
				4.9159164428711
			},
			localization_strings = {
				"pwe_bastion_vo_entering_finale_01",
				"pwe_bastion_vo_entering_finale_02",
				"pwe_bastion_vo_entering_finale_03",
				"pwe_bastion_vo_entering_finale_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_exiting_pwe_bastion = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_exiting_pwe_bastion_01",
				"pwe_bastion_vo_exiting_pwe_bastion_02",
				"pwe_bastion_vo_exiting_pwe_bastion_03",
				"pwe_bastion_vo_exiting_pwe_bastion_04"
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
				2.9272916316986,
				4.2960209846497,
				6.7815208435059,
				4.6099581718445
			},
			localization_strings = {
				"pwe_bastion_vo_exiting_pwe_bastion_01",
				"pwe_bastion_vo_exiting_pwe_bastion_02",
				"pwe_bastion_vo_exiting_pwe_bastion_03",
				"pwe_bastion_vo_exiting_pwe_bastion_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_intro_line_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_bastion_intro_line_b_01",
				[2.0] = "pwe_bastion_intro_line_b_02"
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
				[1.0] = 4.5664377212524,
				[2.0] = 4.0633125305176
			},
			localization_strings = {
				[1.0] = "pwe_bastion_intro_line_b_01",
				[2.0] = "pwe_bastion_intro_line_b_02"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_head_to_surface = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_head_to_surface_01",
				"pwe_bastion_vo_head_to_surface_02",
				"pwe_bastion_vo_head_to_surface_03",
				"pwe_bastion_vo_head_to_surface_04"
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
				2.8752291202545,
				2.2138125896454,
				3.0019583702087,
				3.2715208530426
			},
			localization_strings = {
				"pwe_bastion_vo_head_to_surface_01",
				"pwe_bastion_vo_head_to_surface_02",
				"pwe_bastion_vo_head_to_surface_03",
				"pwe_bastion_vo_head_to_surface_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_finale_tiring = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_finale_tiring_01",
				"pwe_bastion_vo_finale_tiring_02",
				"pwe_bastion_vo_finale_tiring_03",
				"pwe_bastion_vo_finale_tiring_04"
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
				1.2285833358765,
				2.2610833644867,
				2.064395904541,
				2.75
			},
			localization_strings = {
				"pwe_bastion_vo_finale_tiring_01",
				"pwe_bastion_vo_finale_tiring_02",
				"pwe_bastion_vo_finale_tiring_03",
				"pwe_bastion_vo_finale_tiring_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_entering_courtyard = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_entering_courtyard_01",
				"pwe_bastion_vo_entering_courtyard_02",
				"pwe_bastion_vo_entering_courtyard_03",
				"pwe_bastion_vo_entering_courtyard_04"
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
				1.2792500257492,
				1.6793124675751,
				1.4803124666214,
				1.5162916183472
			},
			localization_strings = {
				"pwe_bastion_vo_entering_courtyard_01",
				"pwe_bastion_vo_entering_courtyard_02",
				"pwe_bastion_vo_entering_courtyard_03",
				"pwe_bastion_vo_entering_courtyard_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_entrance = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_entrance_01",
				"pwe_bastion_vo_entrance_02",
				"pwe_bastion_vo_entrance_03",
				"pwe_bastion_vo_entrance_04"
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
				4.2421875,
				5.4190001487732,
				3.8926458358765,
				5.531270980835
			},
			localization_strings = {
				"pwe_bastion_vo_entrance_01",
				"pwe_bastion_vo_entrance_02",
				"pwe_bastion_vo_entrance_03",
				"pwe_bastion_vo_entrance_04"
			},
			randomize_indexes = {}
		},
		pwe_bastion_vo_caves = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_bastion_vo_caves_01",
				"pwe_bastion_vo_caves_02",
				"pwe_bastion_vo_caves_03",
				"pwe_bastion_vo_caves_04"
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
				3.3747084140778,
				4.1688542366028,
				3.2887916564941,
				2.8616666793823
			},
			localization_strings = {
				"pwe_bastion_vo_caves_01",
				"pwe_bastion_vo_caves_02",
				"pwe_bastion_vo_caves_03",
				"pwe_bastion_vo_caves_04"
			},
			randomize_indexes = {}
		}
	})
end
