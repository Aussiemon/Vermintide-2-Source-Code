return function ()
	define_rule({
		name = "pbw_morris_crag_city",
		response = "pbw_morris_crag_city",
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
				"sig_crag_city"
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
				"pbw_morris_crag_city",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_crag_city",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_crag_fumes",
		response = "pbw_morris_crag_fumes",
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
				"sig_crag_fumes"
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
				"pbw_morris_crag_fumes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_crag_fumes",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_crag_hollowed",
		response = "pbw_morris_crag_hollowed",
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
				"sig_crag_hollowed"
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
				"pbw_morris_crag_hollowed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_crag_hollowed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_crag_ritual",
		response = "pbw_morris_crag_ritual",
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
				"sig_crag_ritual"
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
				"pbw_morris_crag_ritual",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_crag_ritual",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_crag_towers",
		response = "pbw_morris_crag_towers",
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
				"sig_crag_towers"
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
				"pbw_morris_crag_towers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_crag_towers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_crag_city",
		response = "pdr_morris_crag_city",
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
				"sig_crag_city"
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
				"pdr_morris_crag_city",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_crag_city",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_crag_fumes",
		response = "pdr_morris_crag_fumes",
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
				"sig_crag_fumes"
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
				"pdr_morris_crag_fumes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_crag_fumes",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_crag_hollowed",
		response = "pdr_morris_crag_hollowed",
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
				"sig_crag_hollowed"
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
				"pdr_morris_crag_hollowed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_crag_hollowed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_crag_ritual",
		response = "pdr_morris_crag_ritual",
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
				"sig_crag_ritual"
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
				"pdr_morris_crag_ritual",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_crag_ritual",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_crag_towers",
		response = "pdr_morris_crag_towers",
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
				"sig_crag_towers"
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
				"pdr_morris_crag_towers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_crag_towers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_crag_city",
		response = "pes_morris_crag_city",
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
				"sig_crag_city"
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
				"pes_morris_crag_city",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_crag_city",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_crag_fumes",
		response = "pes_morris_crag_fumes",
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
				"sig_crag_fumes"
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
				"pes_morris_crag_fumes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_crag_fumes",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_crag_hollowed",
		response = "pes_morris_crag_hollowed",
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
				"sig_crag_hollowed"
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
				"pes_morris_crag_hollowed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_crag_hollowed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_crag_ritual",
		response = "pes_morris_crag_ritual",
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
				"sig_crag_ritual"
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
				"pes_morris_crag_ritual",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_crag_ritual",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_crag_towers",
		response = "pes_morris_crag_towers",
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
				"sig_crag_towers"
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
				"pes_morris_crag_towers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_crag_towers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_crag_city",
		response = "pwe_morris_crag_city",
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
				"sig_crag_city"
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
				"pwe_morris_crag_city",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_crag_city",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_crag_fumes",
		response = "pwe_morris_crag_fumes",
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
				"sig_crag_fumes"
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
				"pwe_morris_crag_fumes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_crag_fumes",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_crag_hollowed",
		response = "pwe_morris_crag_hollowed",
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
				"sig_crag_hollowed"
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
				"pwe_morris_crag_hollowed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_crag_hollowed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_crag_ritual",
		response = "pwe_morris_crag_ritual",
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
				"sig_crag_ritual"
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
				"pwe_morris_crag_ritual",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_crag_ritual",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_crag_towers",
		response = "pwe_morris_crag_towers",
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
				"sig_crag_towers"
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
				"pwe_morris_crag_towers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_crag_towers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_crag_city",
		response = "pwh_morris_crag_city",
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
				"sig_crag_city"
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
				"pwh_morris_crag_city",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_crag_city",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_crag_fumes",
		response = "pwh_morris_crag_fumes",
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
				"sig_crag_fumes"
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
				"pwh_morris_crag_fumes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_crag_fumes",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_crag_hollowed",
		response = "pwh_morris_crag_hollowed",
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
				"sig_crag_hollowed"
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
				"pwh_morris_crag_hollowed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_crag_hollowed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_crag_ritual",
		response = "pwh_morris_crag_ritual",
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
				"sig_crag_ritual"
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
				"pwh_morris_crag_ritual",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_crag_ritual",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_crag_towers",
		response = "pwh_morris_crag_towers",
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
				"sig_crag_towers"
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
				"pwh_morris_crag_towers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_crag_towers",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_crag_city = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pbw_morris_crag_city_01",
				"pbw_morris_crag_city_02",
				"pbw_morris_crag_city_03",
				"pbw_morris_crag_city_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_crag_city_01",
				"pbw_morris_crag_city_02",
				"pbw_morris_crag_city_03",
				"pbw_morris_crag_city_04"
			},
			sound_events_duration = {
				3.9833126068115,
				5.5436458587647,
				6.2508540153503,
				3.0791249275208
			}
		},
		pbw_morris_crag_fumes = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pbw_morris_crag_fumes_01",
				"pbw_morris_crag_fumes_02",
				"pbw_morris_crag_fumes_03",
				"pbw_morris_crag_fumes_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_crag_fumes_01",
				"pbw_morris_crag_fumes_02",
				"pbw_morris_crag_fumes_03",
				"pbw_morris_crag_fumes_04"
			},
			sound_events_duration = {
				3.1404376029968,
				4.5434584617615,
				4.1258540153503,
				3.3136875629425
			}
		},
		pbw_morris_crag_hollowed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pbw_morris_crag_hollowed_01",
				"pbw_morris_crag_hollowed_02",
				"pbw_morris_crag_hollowed_03",
				"pbw_morris_crag_hollowed_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_crag_hollowed_01",
				"pbw_morris_crag_hollowed_02",
				"pbw_morris_crag_hollowed_03",
				"pbw_morris_crag_hollowed_04"
			},
			sound_events_duration = {
				4.5574374198914,
				4.5470623970032,
				4.0285415649414,
				5.8413124084473
			}
		},
		pbw_morris_crag_ritual = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pbw_morris_crag_ritual_01",
				"pbw_morris_crag_ritual_02",
				"pbw_morris_crag_ritual_03",
				"pbw_morris_crag_ritual_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_crag_ritual_01",
				"pbw_morris_crag_ritual_02",
				"pbw_morris_crag_ritual_03",
				"pbw_morris_crag_ritual_04"
			},
			sound_events_duration = {
				4.6079998016357,
				2.2673332691193,
				2.9445416927338,
				2.9096667766571
			}
		},
		pbw_morris_crag_towers = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pbw_morris_crag_towers_01",
				"pbw_morris_crag_towers_02",
				"pbw_morris_crag_towers_03",
				"pbw_morris_crag_towers_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_crag_towers_01",
				"pbw_morris_crag_towers_02",
				"pbw_morris_crag_towers_03",
				"pbw_morris_crag_towers_04"
			},
			sound_events_duration = {
				3.9082291126251,
				5.4118747711182,
				5.6538124084473,
				4.0238332748413
			}
		},
		pdr_morris_crag_city = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pdr_morris_crag_city_01",
				"pdr_morris_crag_city_02",
				"pdr_morris_crag_city_03",
				"pdr_morris_crag_city_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_crag_city_01",
				"pdr_morris_crag_city_02",
				"pdr_morris_crag_city_03",
				"pdr_morris_crag_city_04"
			},
			sound_events_duration = {
				2.9906666278839,
				4.2602081298828,
				2.5380833148956,
				1.8882083892822
			}
		},
		pdr_morris_crag_fumes = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pdr_morris_crag_fumes_01",
				"pdr_morris_crag_fumes_02",
				"pdr_morris_crag_fumes_03",
				"pdr_morris_crag_fumes_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_crag_fumes_01",
				"pdr_morris_crag_fumes_02",
				"pdr_morris_crag_fumes_03",
				"pdr_morris_crag_fumes_04"
			},
			sound_events_duration = {
				4.086416721344,
				3.2000000476837,
				4.103000164032,
				2.5180208683014
			}
		},
		pdr_morris_crag_hollowed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pdr_morris_crag_hollowed_01",
				"pdr_morris_crag_hollowed_02",
				"pdr_morris_crag_hollowed_03",
				"pdr_morris_crag_hollowed_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_crag_hollowed_01",
				"pdr_morris_crag_hollowed_02",
				"pdr_morris_crag_hollowed_03",
				"pdr_morris_crag_hollowed_04"
			},
			sound_events_duration = {
				2.0011250972748,
				2.8791041374206,
				3.4094166755676,
				3.1213750839233
			}
		},
		pdr_morris_crag_ritual = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pdr_morris_crag_ritual_01",
				"pdr_morris_crag_ritual_02",
				"pdr_morris_crag_ritual_03",
				"pdr_morris_crag_ritual_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_crag_ritual_01",
				"pdr_morris_crag_ritual_02",
				"pdr_morris_crag_ritual_03",
				"pdr_morris_crag_ritual_04"
			},
			sound_events_duration = {
				3.3113749027252,
				3.1261458396912,
				4.126916885376,
				2.6016249656677
			}
		},
		pdr_morris_crag_towers = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pdr_morris_crag_towers_01",
				"pdr_morris_crag_towers_02",
				"pdr_morris_crag_towers_03",
				"pdr_morris_crag_towers_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_crag_towers_01",
				"pdr_morris_crag_towers_02",
				"pdr_morris_crag_towers_03",
				"pdr_morris_crag_towers_04"
			},
			sound_events_duration = {
				1.4162291288376,
				3.6285207271576,
				2.4604165554047,
				1.8802917003632
			}
		},
		pes_morris_crag_city = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pes_morris_crag_city_01",
				"pes_morris_crag_city_02",
				"pes_morris_crag_city_03",
				"pes_morris_crag_city_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_crag_city_01",
				"pes_morris_crag_city_02",
				"pes_morris_crag_city_03",
				"pes_morris_crag_city_04"
			},
			sound_events_duration = {
				3.9027292728424,
				3.8772709369659,
				2.8575208187103,
				3.9169583320618
			}
		},
		pes_morris_crag_fumes = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pes_morris_crag_fumes_01",
				"pes_morris_crag_fumes_02",
				"pes_morris_crag_fumes_03",
				"pes_morris_crag_fumes_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_crag_fumes_01",
				"pes_morris_crag_fumes_02",
				"pes_morris_crag_fumes_03",
				"pes_morris_crag_fumes_04"
			},
			sound_events_duration = {
				3.5669791698456,
				4.1976456642151,
				2.6642708778381,
				4.8399167060852
			}
		},
		pes_morris_crag_hollowed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pes_morris_crag_hollowed_01",
				"pes_morris_crag_hollowed_02",
				"pes_morris_crag_hollowed_03",
				"pes_morris_crag_hollowed_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_crag_hollowed_01",
				"pes_morris_crag_hollowed_02",
				"pes_morris_crag_hollowed_03",
				"pes_morris_crag_hollowed_04"
			},
			sound_events_duration = {
				3.7274374961853,
				3.67152094841,
				2.9491457939148,
				3.9667084217072
			}
		},
		pes_morris_crag_ritual = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pes_morris_crag_ritual_01",
				"pes_morris_crag_ritual_02",
				"pes_morris_crag_ritual_03",
				"pes_morris_crag_ritual_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_crag_ritual_01",
				"pes_morris_crag_ritual_02",
				"pes_morris_crag_ritual_03",
				"pes_morris_crag_ritual_04"
			},
			sound_events_duration = {
				3.6192917823791,
				3.9256041049957,
				4.164999961853,
				4.5999999046326
			}
		},
		pes_morris_crag_towers = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pes_morris_crag_towers_01",
				"pes_morris_crag_towers_02",
				"pes_morris_crag_towers_03",
				"pes_morris_crag_towers_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_crag_towers_01",
				"pes_morris_crag_towers_02",
				"pes_morris_crag_towers_03",
				"pes_morris_crag_towers_04"
			},
			sound_events_duration = {
				3.0712916851044,
				1.7825833559036,
				2.8976249694824,
				3.4231667518616
			}
		},
		pwe_morris_crag_city = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwe_morris_crag_city_01",
				"pwe_morris_crag_city_02",
				"pwe_morris_crag_city_03",
				"pwe_morris_crag_city_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_crag_city_01",
				"pwe_morris_crag_city_02",
				"pwe_morris_crag_city_03",
				"pwe_morris_crag_city_04"
			},
			sound_events_duration = {
				3.3491876125336,
				2.583208322525,
				5.1005415916443,
				4.2867498397827
			}
		},
		pwe_morris_crag_fumes = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwe_morris_crag_fumes_01",
				"pwe_morris_crag_fumes_02",
				"pwe_morris_crag_fumes_03",
				"pwe_morris_crag_fumes_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_crag_fumes_01",
				"pwe_morris_crag_fumes_02",
				"pwe_morris_crag_fumes_03",
				"pwe_morris_crag_fumes_04"
			},
			sound_events_duration = {
				3.6772499084473,
				3.651624917984,
				2.7374167442322,
				3.8393957614899
			}
		},
		pwe_morris_crag_hollowed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwe_morris_crag_hollowed_01",
				"pwe_morris_crag_hollowed_02",
				"pwe_morris_crag_hollowed_03",
				"pwe_morris_crag_hollowed_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_crag_hollowed_01",
				"pwe_morris_crag_hollowed_02",
				"pwe_morris_crag_hollowed_03",
				"pwe_morris_crag_hollowed_04"
			},
			sound_events_duration = {
				2.335000038147,
				3.3313958644867,
				2.6452915668488,
				2.0287499427795
			}
		},
		pwe_morris_crag_ritual = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwe_morris_crag_ritual_01",
				"pwe_morris_crag_ritual_02",
				"pwe_morris_crag_ritual_03",
				"pwe_morris_crag_ritual_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_crag_ritual_01",
				"pwe_morris_crag_ritual_02",
				"pwe_morris_crag_ritual_03",
				"pwe_morris_crag_ritual_04"
			},
			sound_events_duration = {
				2.7242708206177,
				2.6221249103546,
				2.1773125529289,
				2.2796874046326
			}
		},
		pwe_morris_crag_towers = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwe_morris_crag_towers_01",
				"pwe_morris_crag_towers_02",
				"pwe_morris_crag_towers_03",
				"pwe_morris_crag_towers_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_crag_towers_01",
				"pwe_morris_crag_towers_02",
				"pwe_morris_crag_towers_03",
				"pwe_morris_crag_towers_04"
			},
			sound_events_duration = {
				4.7684998512268,
				2.6683332920074,
				6.6174168586731,
				4.1987709999084
			}
		},
		pwh_morris_crag_city = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwh_morris_crag_city_01",
				"pwh_morris_crag_city_02",
				"pwh_morris_crag_city_03",
				"pwh_morris_crag_city_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_crag_city_01",
				"pwh_morris_crag_city_02",
				"pwh_morris_crag_city_03",
				"pwh_morris_crag_city_04"
			},
			sound_events_duration = {
				7.8694791793823,
				2.6627082824707,
				8.2896251678467,
				5.349187374115
			}
		},
		pwh_morris_crag_fumes = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwh_morris_crag_fumes_01",
				"pwh_morris_crag_fumes_02",
				"pwh_morris_crag_fumes_03",
				"pwh_morris_crag_fumes_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_crag_fumes_01",
				"pwh_morris_crag_fumes_02",
				"pwh_morris_crag_fumes_03",
				"pwh_morris_crag_fumes_04"
			},
			sound_events_duration = {
				4.9284167289734,
				2.9087917804718,
				2.1522290706634,
				3.4828124046326
			}
		},
		pwh_morris_crag_hollowed = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwh_morris_crag_hollowed_01",
				"pwh_morris_crag_hollowed_02",
				"pwh_morris_crag_hollowed_03",
				"pwh_morris_crag_hollowed_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_crag_hollowed_01",
				"pwh_morris_crag_hollowed_02",
				"pwh_morris_crag_hollowed_03",
				"pwh_morris_crag_hollowed_04"
			},
			sound_events_duration = {
				5.0552916526794,
				4.6998333930969,
				5.5188541412353,
				4.3205208778381
			}
		},
		pwh_morris_crag_ritual = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwh_morris_crag_ritual_01",
				"pwh_morris_crag_ritual_02",
				"pwh_morris_crag_ritual_03",
				"pwh_morris_crag_ritual_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_crag_ritual_01",
				"pwh_morris_crag_ritual_02",
				"pwh_morris_crag_ritual_03",
				"pwh_morris_crag_ritual_04"
			},
			sound_events_duration = {
				3.0697708129883,
				4.2030835151672,
				1.7299582958221,
				5.2020001411438
			}
		},
		pwh_morris_crag_towers = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_crag",
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
				"pwh_morris_crag_towers_01",
				"pwh_morris_crag_towers_02",
				"pwh_morris_crag_towers_03",
				"pwh_morris_crag_towers_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_crag_towers_01",
				"pwh_morris_crag_towers_02",
				"pwh_morris_crag_towers_03",
				"pwh_morris_crag_towers_04"
			},
			sound_events_duration = {
				4.1312084197998,
				5.6104168891907,
				4.4264793395996,
				3.7181458473206
			}
		}
	})
end
