return function ()
	define_rule({
		name = "pdr_bastion_intro_line_a",
		response = "pdr_bastion_intro_line_a",
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
		name = "pdr_bastion_intro_line_b",
		response = "pdr_bastion_intro_line_b",
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
		name = "pdr_bastion_intro_line_c",
		response = "pdr_bastion_intro_line_c",
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
		name = "pdr_bastion_vo_entrance",
		response = "pdr_bastion_vo_entrance",
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
		name = "pdr_bastion_vo_caves",
		response = "pdr_bastion_vo_caves",
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
		name = "pdr_bastion_vo_search_cells",
		response = "pdr_bastion_vo_search_cells",
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
		name = "pdr_bastion_vo_inside_cellblock",
		response = "pdr_bastion_vo_inside_cellblock",
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
		name = "pdr_bastion_vo_no_prisoners",
		response = "pdr_bastion_vo_no_prisoners",
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
		name = "pdr_bastion_vo_head_to_surface",
		response = "pdr_bastion_vo_head_to_surface",
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
		name = "pdr_bastion_vo_entering_courtyard",
		response = "pdr_bastion_vo_entering_courtyard",
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
		name = "pdr_bastion_vo_courtyard_first_villager",
		response = "pdr_bastion_vo_courtyard_first_villager",
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
		name = "pdr_bastion_vo_courtyard_done",
		response = "pdr_bastion_vo_courtyard_done",
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
		name = "pdr_bastion_vo_entering_darkness",
		response = "pdr_bastion_vo_entering_darkness",
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
		name = "pdr_bastion_vo_finale_missile",
		response = "pdr_bastion_vo_finale_missile",
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
		name = "pdr_bastion_vo_finale_tiring",
		response = "pdr_bastion_vo_finale_tiring",
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
		name = "pdr_bastion_vo_finale_done",
		response = "pdr_bastion_vo_finale_done",
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
		name = "pdr_bastion_vo_exiting_pdr_bastion",
		response = "pdr_bastion_vo_exiting_pdr_bastion",
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
		name = "pdr_bastion_vo_possessed",
		response = "pdr_bastion_vo_possessed",
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
		name = "pdr_bastion_vo_entering_finale",
		response = "pdr_bastion_vo_entering_finale",
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
		pdr_bastion_vo_finale_tiring = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_finale_tiring_01",
				"pdr_bastion_vo_finale_tiring_02",
				"pdr_bastion_vo_finale_tiring_03",
				"pdr_bastion_vo_finale_tiring_04"
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
				2.3074374198914,
				3.0713958740234,
				2.5232915878296,
				2.7697501182556
			},
			localization_strings = {
				"pdr_bastion_vo_finale_tiring_01",
				"pdr_bastion_vo_finale_tiring_02",
				"pdr_bastion_vo_finale_tiring_03",
				"pdr_bastion_vo_finale_tiring_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_courtyard_first_villager = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_courtyard_first_villager_01",
				"pdr_bastion_vo_courtyard_first_villager_02",
				"pdr_bastion_vo_courtyard_first_villager_03",
				"pdr_bastion_vo_courtyard_first_villager_04"
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
				1.9206458330154,
				1.7409583330154,
				2.4105832576752,
				2.99964594841
			},
			localization_strings = {
				"pdr_bastion_vo_courtyard_first_villager_01",
				"pdr_bastion_vo_courtyard_first_villager_02",
				"pdr_bastion_vo_courtyard_first_villager_03",
				"pdr_bastion_vo_courtyard_first_villager_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_no_prisoners = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_no_prisoners_01",
				"pdr_bastion_vo_no_prisoners_02",
				"pdr_bastion_vo_no_prisoners_03",
				"pdr_bastion_vo_no_prisoners_04"
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
				3.6527917385101,
				3.4033334255219,
				2.0893125534058,
				3.8499999046326
			},
			localization_strings = {
				"pdr_bastion_vo_no_prisoners_01",
				"pdr_bastion_vo_no_prisoners_02",
				"pdr_bastion_vo_no_prisoners_03",
				"pdr_bastion_vo_no_prisoners_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_head_to_surface = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_head_to_surface_01",
				"pdr_bastion_vo_head_to_surface_02",
				"pdr_bastion_vo_head_to_surface_03",
				"pdr_bastion_vo_head_to_surface_04"
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
				2.0272500514984,
				1.2338750362396,
				3.7992708683014,
				2.5556666851044
			},
			localization_strings = {
				"pdr_bastion_vo_head_to_surface_01",
				"pdr_bastion_vo_head_to_surface_02",
				"pdr_bastion_vo_head_to_surface_03",
				"pdr_bastion_vo_head_to_surface_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_inside_cellblock = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_inside_cellblock_01",
				"pdr_bastion_vo_inside_cellblock_02",
				"pdr_bastion_vo_inside_cellblock_03",
				"pdr_bastion_vo_inside_cellblock_04"
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
				2.2469792366028,
				4.0451459884644,
				2.430520772934,
				2.7420208454132
			},
			localization_strings = {
				"pdr_bastion_vo_inside_cellblock_01",
				"pdr_bastion_vo_inside_cellblock_02",
				"pdr_bastion_vo_inside_cellblock_03",
				"pdr_bastion_vo_inside_cellblock_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_entering_courtyard = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_entering_courtyard_01",
				"pdr_bastion_vo_entering_courtyard_02",
				"pdr_bastion_vo_entering_courtyard_03",
				"pdr_bastion_vo_entering_courtyard_04"
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
				4.2897081375122,
				3.4418125152588,
				2.1206042766571,
				1.262854218483
			},
			localization_strings = {
				"pdr_bastion_vo_entering_courtyard_01",
				"pdr_bastion_vo_entering_courtyard_02",
				"pdr_bastion_vo_entering_courtyard_03",
				"pdr_bastion_vo_entering_courtyard_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_courtyard_done = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_courtyard_done_01",
				"pdr_bastion_vo_courtyard_done_02",
				"pdr_bastion_vo_courtyard_done_03",
				"pdr_bastion_vo_courtyard_done_04"
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
				3.9193749427795,
				4.2394375801086,
				6.4260416030884,
				4.4331874847412
			},
			localization_strings = {
				"pdr_bastion_vo_courtyard_done_01",
				"pdr_bastion_vo_courtyard_done_02",
				"pdr_bastion_vo_courtyard_done_03",
				"pdr_bastion_vo_courtyard_done_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_exiting_pdr_bastion = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_exiting_pdr_bastion_01",
				"pdr_bastion_vo_exiting_pdr_bastion_02",
				"pdr_bastion_vo_exiting_pdr_bastion_03",
				"pdr_bastion_vo_exiting_pdr_bastion_04"
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
				3.8647708892822,
				5.2039999961853,
				3.7481875419617,
				4.3673543930054
			},
			localization_strings = {
				"pdr_bastion_vo_exiting_pdr_bastion_01",
				"pdr_bastion_vo_exiting_pdr_bastion_02",
				"pdr_bastion_vo_exiting_pdr_bastion_03",
				"pdr_bastion_vo_exiting_pdr_bastion_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_intro_line_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_bastion_intro_line_b_01",
				[2.0] = "pdr_bastion_intro_line_b_02"
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
				[1.0] = 3.7859792709351,
				[2.0] = 4.2828330993652
			},
			localization_strings = {
				[1.0] = "pdr_bastion_intro_line_b_01",
				[2.0] = "pdr_bastion_intro_line_b_02"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_entering_finale = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_entering_finale_01",
				"pdr_bastion_vo_entering_finale_02",
				"pdr_bastion_vo_entering_finale_03",
				"pdr_bastion_vo_entering_finale_04"
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
				3.0604166984558,
				3.4109375476837,
				4.6568331718445,
				6.435604095459
			},
			localization_strings = {
				"pdr_bastion_vo_entering_finale_01",
				"pdr_bastion_vo_entering_finale_02",
				"pdr_bastion_vo_entering_finale_03",
				"pdr_bastion_vo_entering_finale_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_caves = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_caves_01",
				"pdr_bastion_vo_caves_02",
				"pdr_bastion_vo_caves_03",
				"pdr_bastion_vo_caves_04"
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
				3.7599999904633,
				6.4593334197998,
				4.0443749427795,
				4.1454582214356
			},
			localization_strings = {
				"pdr_bastion_vo_caves_01",
				"pdr_bastion_vo_caves_02",
				"pdr_bastion_vo_caves_03",
				"pdr_bastion_vo_caves_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_intro_line_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_bastion_intro_line_c_01",
				[2.0] = "pdr_bastion_intro_line_c_02"
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
				[1.0] = 2.6219167709351,
				[2.0] = 3.8325624465942
			},
			localization_strings = {
				[1.0] = "pdr_bastion_intro_line_c_01",
				[2.0] = "pdr_bastion_intro_line_c_02"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_entrance = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_entrance_01",
				"pdr_bastion_vo_entrance_02",
				"pdr_bastion_vo_entrance_03",
				"pdr_bastion_vo_entrance_04"
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
				3.1138334274292,
				2.7471041679382,
				2.8896250724792,
				2.5923540592194
			},
			localization_strings = {
				"pdr_bastion_vo_entrance_01",
				"pdr_bastion_vo_entrance_02",
				"pdr_bastion_vo_entrance_03",
				"pdr_bastion_vo_entrance_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_finale_missile = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_finale_missile_01",
				"pdr_bastion_vo_finale_missile_02",
				"pdr_bastion_vo_finale_missile_03",
				"pdr_bastion_vo_finale_missile_04"
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
				1.7041875123978,
				1.8952292203903,
				2.5121042728424,
				2.7267498970032
			},
			localization_strings = {
				"pdr_bastion_vo_finale_missile_01",
				"pdr_bastion_vo_finale_missile_02",
				"pdr_bastion_vo_finale_missile_03",
				"pdr_bastion_vo_finale_missile_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_finale_done = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_finale_done_01",
				"pdr_bastion_vo_finale_done_02",
				"pdr_bastion_vo_finale_done_03",
				"pdr_bastion_vo_finale_done_04"
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
				3.4781875610352,
				1.5666041374207,
				2.8871667385101,
				3.9242708683014
			},
			localization_strings = {
				"pdr_bastion_vo_finale_done_01",
				"pdr_bastion_vo_finale_done_02",
				"pdr_bastion_vo_finale_done_03",
				"pdr_bastion_vo_finale_done_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_intro_line_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_bastion_intro_line_a_01",
				[2.0] = "pdr_bastion_intro_line_a_02"
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
				[1.0] = 3.7399165630341,
				[2.0] = 3.3069791793823
			},
			localization_strings = {
				[1.0] = "pdr_bastion_intro_line_a_01",
				[2.0] = "pdr_bastion_intro_line_a_02"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_entering_darkness = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_entering_darkness_01",
				"pdr_bastion_vo_entering_darkness_02",
				"pdr_bastion_vo_entering_darkness_03",
				"pdr_bastion_vo_entering_darkness_04"
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
				4.3806877136231,
				2.1615417003632,
				4.5445623397827,
				3.9609999656677
			},
			localization_strings = {
				"pdr_bastion_vo_entering_darkness_01",
				"pdr_bastion_vo_entering_darkness_02",
				"pdr_bastion_vo_entering_darkness_03",
				"pdr_bastion_vo_entering_darkness_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_possessed = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_possessed_01",
				"pdr_bastion_vo_possessed_02",
				"pdr_bastion_vo_possessed_03",
				"pdr_bastion_vo_possessed_04"
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
				2.7442917823791,
				1.233437538147,
				2.0224165916443,
				1.8564791679382
			},
			localization_strings = {
				"pdr_bastion_vo_possessed_01",
				"pdr_bastion_vo_possessed_02",
				"pdr_bastion_vo_possessed_03",
				"pdr_bastion_vo_possessed_04"
			},
			randomize_indexes = {}
		},
		pdr_bastion_vo_search_cells = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_dlc_drachenfels_bastion",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_bastion_vo_search_cells_01",
				"pdr_bastion_vo_search_cells_02",
				"pdr_bastion_vo_search_cells_03",
				"pdr_bastion_vo_search_cells_04"
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
				1.9406875371933,
				2.2277083396912,
				2.4351251125336,
				3.2185626029968
			},
			localization_strings = {
				"pdr_bastion_vo_search_cells_01",
				"pdr_bastion_vo_search_cells_02",
				"pdr_bastion_vo_search_cells_03",
				"pdr_bastion_vo_search_cells_04"
			},
			randomize_indexes = {}
		}
	})
end
