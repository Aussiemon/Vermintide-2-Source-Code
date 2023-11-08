return function ()
	define_rule({
		name = "pbw_morris_town_arena",
		response = "pbw_morris_town_arena",
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
				"pat_town_arena"
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
				"pbw_morris_town_arena",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_town_arena",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_town_behind",
		response = "pbw_morris_town_behind",
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
				"pat_town_behind"
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
				"pbw_morris_town_behind",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_town_behind",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_town_harbour",
		response = "pbw_morris_town_harbour",
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
				"pat_town_harbour"
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
				"pbw_morris_town_harbour",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_town_harbour",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_town_settlement",
		response = "pbw_morris_town_settlement",
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
				"pat_town_settlement"
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
				"pbw_morris_town_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_town_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_town_shipwreck",
		response = "pbw_morris_town_shipwreck",
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
				"pat_town_shipwreck"
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
				"pbw_morris_town_shipwreck",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_town_shipwreck",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_town_arena",
		response = "pdr_morris_town_arena",
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
				"pat_town_arena"
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
				"pdr_morris_town_arena",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_town_arena",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_town_behind",
		response = "pdr_morris_town_behind",
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
				"pat_town_behind"
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
				"pdr_morris_town_behind",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_town_behind",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_town_harbour",
		response = "pdr_morris_town_harbour",
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
				"pat_town_harbour"
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
				"pdr_morris_town_harbour",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_town_harbour",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_town_settlement",
		response = "pdr_morris_town_settlement",
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
				"pat_town_settlement"
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
				"pdr_morris_town_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_town_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_town_shipwreck",
		response = "pdr_morris_town_shipwreck",
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
				"pat_town_shipwreck"
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
				"pdr_morris_town_shipwreck",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_town_shipwreck",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_town_arena",
		response = "pes_morris_town_arena",
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
				"pat_town_arena"
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
				"pes_morris_town_arena",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_town_arena",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_town_behind",
		response = "pes_morris_town_behind",
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
				"pat_town_behind"
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
				"pes_morris_town_behind",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_town_behind",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_town_harbour",
		response = "pes_morris_town_harbour",
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
				"pat_town_harbour"
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
				"pes_morris_town_harbour",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_town_harbour",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_town_settlement",
		response = "pes_morris_town_settlement",
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
				"pat_town_settlement"
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
				"pes_morris_town_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_town_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_town_shipwreck",
		response = "pes_morris_town_shipwreck",
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
				"pat_town_shipwreck"
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
				"pes_morris_town_shipwreck",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_town_shipwreck",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_town_arena",
		response = "pwe_morris_town_arena",
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
				"pat_town_arena"
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
				"pwe_morris_town_arena",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_town_arena",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_town_behind",
		response = "pwe_morris_town_behind",
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
				"pat_town_behind"
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
				"pwe_morris_town_behind",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_town_behind",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_town_harbour",
		response = "pwe_morris_town_harbour",
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
				"pat_town_harbour"
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
				"pwe_morris_town_harbour",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_town_harbour",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_town_settlement",
		response = "pwe_morris_town_settlement",
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
				"pat_town_settlement"
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
				"pwe_morris_town_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_town_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_town_shipwreck",
		response = "pwe_morris_town_shipwreck",
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
				"pat_town_shipwreck"
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
				"pwe_morris_town_shipwreck",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_town_shipwreck",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_town_arena",
		response = "pwh_morris_town_arena",
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
				"pat_town_arena"
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
				"pwh_morris_town_arena",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_town_arena",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_town_behind",
		response = "pwh_morris_town_behind",
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
				"pat_town_behind"
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
				"pwh_morris_town_behind",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_town_behind",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_town_harbour",
		response = "pwh_morris_town_harbour",
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
				"pat_town_harbour"
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
				"pwh_morris_town_harbour",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_town_harbour",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_town_settlement",
		response = "pwh_morris_town_settlement",
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
				"pat_town_settlement"
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
				"pwh_morris_town_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_town_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_town_shipwreck",
		response = "pwh_morris_town_shipwreck",
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
				"pat_town_shipwreck"
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
				"pwh_morris_town_shipwreck",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_town_shipwreck",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_town_arena = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pbw_morris_town_arena_01",
				"pbw_morris_town_arena_02",
				"pbw_morris_town_arena_03",
				"pbw_morris_town_arena_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_town_arena_01",
				"pbw_morris_town_arena_02",
				"pbw_morris_town_arena_03",
				"pbw_morris_town_arena_04"
			},
			sound_events_duration = {
				4.4306664466858,
				3.1270833015442,
				5.3706459999084,
				5.1146039962769
			}
		},
		pbw_morris_town_behind = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pbw_morris_town_behind_01",
				"pbw_morris_town_behind_02",
				"pbw_morris_town_behind_03",
				"pbw_morris_town_behind_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_town_behind_01",
				"pbw_morris_town_behind_02",
				"pbw_morris_town_behind_03",
				"pbw_morris_town_behind_04"
			},
			sound_events_duration = {
				2.8003332614899,
				3.1005415916443,
				3.9146459102631,
				1.8843749761581
			}
		},
		pbw_morris_town_harbour = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pbw_morris_town_harbour_01",
				"pbw_morris_town_harbour_02",
				"pbw_morris_town_harbour_03",
				"pbw_morris_town_harbour_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_town_harbour_01",
				"pbw_morris_town_harbour_02",
				"pbw_morris_town_harbour_03",
				"pbw_morris_town_harbour_04"
			},
			sound_events_duration = {
				2.8079583644867,
				7.5761041641235,
				7.1722083091736,
				6.4768958091736
			}
		},
		pbw_morris_town_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pbw_morris_town_settlement_01",
				"pbw_morris_town_settlement_02",
				"pbw_morris_town_settlement_03",
				"pbw_morris_town_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_town_settlement_01",
				"pbw_morris_town_settlement_02",
				"pbw_morris_town_settlement_03",
				"pbw_morris_town_settlement_04"
			},
			sound_events_duration = {
				3.8879375457764,
				3.4540207386017,
				3.7768125534058,
				2.7580416202545
			}
		},
		pbw_morris_town_shipwreck = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pbw_morris_town_shipwreck_01",
				"pbw_morris_town_shipwreck_02",
				"pbw_morris_town_shipwreck_03",
				"pbw_morris_town_shipwreck_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_town_shipwreck_01",
				"pbw_morris_town_shipwreck_02",
				"pbw_morris_town_shipwreck_03",
				"pbw_morris_town_shipwreck_04"
			},
			sound_events_duration = {
				3.6291875839233,
				5.1267499923706,
				4.1542916297913,
				5.0787291526794
			}
		},
		pdr_morris_town_arena = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pdr_morris_town_arena_01",
				"pdr_morris_town_arena_02",
				"pdr_morris_town_arena_03",
				"pdr_morris_town_arena_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_town_arena_01",
				"pdr_morris_town_arena_02",
				"pdr_morris_town_arena_03",
				"pdr_morris_town_arena_04"
			},
			sound_events_duration = {
				2.1928958892822,
				2.3215625286102,
				3.5509374141693,
				3.3778123855591
			}
		},
		pdr_morris_town_behind = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pdr_morris_town_behind_01",
				"pdr_morris_town_behind_02",
				"pdr_morris_town_behind_03",
				"pdr_morris_town_behind_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_town_behind_01",
				"pdr_morris_town_behind_02",
				"pdr_morris_town_behind_03",
				"pdr_morris_town_behind_04"
			},
			sound_events_duration = {
				2.5315625667572,
				2.7737500667572,
				2.1177499294281,
				2.6786251068115
			}
		},
		pdr_morris_town_harbour = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pdr_morris_town_harbour_01",
				"pdr_morris_town_harbour_02",
				"pdr_morris_town_harbour_03",
				"pdr_morris_town_harbour_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_town_harbour_01",
				"pdr_morris_town_harbour_02",
				"pdr_morris_town_harbour_03",
				"pdr_morris_town_harbour_04"
			},
			sound_events_duration = {
				4.0118126869202,
				3.0874166488648,
				3.2419166564941,
				6.6465001106262
			}
		},
		pdr_morris_town_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pdr_morris_town_settlement_01",
				"pdr_morris_town_settlement_02",
				"pdr_morris_town_settlement_03",
				"pdr_morris_town_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_town_settlement_01",
				"pdr_morris_town_settlement_02",
				"pdr_morris_town_settlement_03",
				"pdr_morris_town_settlement_04"
			},
			sound_events_duration = {
				2.4499790668488,
				3.6175832748413,
				3.9028749465942,
				4.1740207672119
			}
		},
		pdr_morris_town_shipwreck = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pdr_morris_town_shipwreck_01",
				"pdr_morris_town_shipwreck_02",
				"pdr_morris_town_shipwreck_03",
				"pdr_morris_town_shipwreck_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_town_shipwreck_01",
				"pdr_morris_town_shipwreck_02",
				"pdr_morris_town_shipwreck_03",
				"pdr_morris_town_shipwreck_04"
			},
			sound_events_duration = {
				5.151291847229,
				5.5668125152588,
				3.6721665859222,
				5.782666683197
			}
		},
		pes_morris_town_arena = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pes_morris_town_arena_01",
				"pes_morris_town_arena_02",
				"pes_morris_town_arena_03",
				"pes_morris_town_arena_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_town_arena_01",
				"pes_morris_town_arena_02",
				"pes_morris_town_arena_03",
				"pes_morris_town_arena_04"
			},
			sound_events_duration = {
				3.0999166965485,
				2.4888541698456,
				3.3099792003632,
				3.7608542442322
			}
		},
		pes_morris_town_behind = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pes_morris_town_behind_01",
				"pes_morris_town_behind_02",
				"pes_morris_town_behind_03",
				"pes_morris_town_behind_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_town_behind_01",
				"pes_morris_town_behind_02",
				"pes_morris_town_behind_03",
				"pes_morris_town_behind_04"
			},
			sound_events_duration = {
				1.6754167079925,
				3.1622083187103,
				3.532083272934,
				2.5107290744781
			}
		},
		pes_morris_town_harbour = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pes_morris_town_harbour_01",
				"pes_morris_town_harbour_02",
				"pes_morris_town_harbour_03",
				"pes_morris_town_harbour_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_town_harbour_01",
				"pes_morris_town_harbour_02",
				"pes_morris_town_harbour_03",
				"pes_morris_town_harbour_04"
			},
			sound_events_duration = {
				5.6033959388733,
				3.5605833530426,
				3.1089375019074,
				3.1380207538605
			}
		},
		pes_morris_town_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pes_morris_town_settlement_01",
				"pes_morris_town_settlement_02",
				"pes_morris_town_settlement_03",
				"pes_morris_town_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_town_settlement_01",
				"pes_morris_town_settlement_02",
				"pes_morris_town_settlement_03",
				"pes_morris_town_settlement_04"
			},
			sound_events_duration = {
				2.8188750743866,
				2.8300833702087,
				2.2882916927338,
				2.7314999103546
			}
		},
		pes_morris_town_shipwreck = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pes_morris_town_shipwreck_01",
				"pes_morris_town_shipwreck_02",
				"pes_morris_town_shipwreck_03",
				"pes_morris_town_shipwreck_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_town_shipwreck_01",
				"pes_morris_town_shipwreck_02",
				"pes_morris_town_shipwreck_03",
				"pes_morris_town_shipwreck_04"
			},
			sound_events_duration = {
				3.1494998931885,
				2.4433124065399,
				5.4820418357849,
				4.3967914581299
			}
		},
		pwe_morris_town_arena = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwe_morris_town_arena_01",
				"pwe_morris_town_arena_02",
				"pwe_morris_town_arena_03",
				"pwe_morris_town_arena_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_town_arena_01",
				"pwe_morris_town_arena_02",
				"pwe_morris_town_arena_03",
				"pwe_morris_town_arena_04"
			},
			sound_events_duration = {
				5.4251456260681,
				4.0567293167114,
				4.0984792709351,
				4.7212290763855
			}
		},
		pwe_morris_town_behind = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwe_morris_town_behind_01",
				"pwe_morris_town_behind_02",
				"pwe_morris_town_behind_03",
				"pwe_morris_town_behind_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_town_behind_01",
				"pwe_morris_town_behind_02",
				"pwe_morris_town_behind_03",
				"pwe_morris_town_behind_04"
			},
			sound_events_duration = {
				3.3141458034515,
				3.4574582576752,
				3.2638332843781,
				2.8427188396454
			}
		},
		pwe_morris_town_harbour = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwe_morris_town_harbour_01",
				"pwe_morris_town_harbour_02",
				"pwe_morris_town_harbour_03",
				"pwe_morris_town_harbour_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_town_harbour_01",
				"pwe_morris_town_harbour_02",
				"pwe_morris_town_harbour_03",
				"pwe_morris_town_harbour_04"
			},
			sound_events_duration = {
				4.1983542442322,
				5.2110414505005,
				3.5603542327881,
				3.0156042575836
			}
		},
		pwe_morris_town_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwe_morris_town_settlement_01",
				"pwe_morris_town_settlement_02",
				"pwe_morris_town_settlement_03",
				"pwe_morris_town_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_town_settlement_01",
				"pwe_morris_town_settlement_02",
				"pwe_morris_town_settlement_03",
				"pwe_morris_town_settlement_04"
			},
			sound_events_duration = {
				4.0741872787476,
				3.5121042728424,
				4.8435416221619,
				4.4493126869202
			}
		},
		pwe_morris_town_shipwreck = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwe_morris_town_shipwreck_01",
				"pwe_morris_town_shipwreck_02",
				"pwe_morris_town_shipwreck_03",
				"pwe_morris_town_shipwreck_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_town_shipwreck_01",
				"pwe_morris_town_shipwreck_02",
				"pwe_morris_town_shipwreck_03",
				"pwe_morris_town_shipwreck_04"
			},
			sound_events_duration = {
				3.7718334197998,
				2.6497917175293,
				4.8548331260681,
				4.8488125801086
			}
		},
		pwh_morris_town_arena = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwh_morris_town_arena_01",
				"pwh_morris_town_arena_02",
				"pwh_morris_town_arena_03",
				"pwh_morris_town_arena_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_town_arena_01",
				"pwh_morris_town_arena_02",
				"pwh_morris_town_arena_03",
				"pwh_morris_town_arena_04"
			},
			sound_events_duration = {
				6.4840207099915,
				3.4932291507721,
				4.7000832557678,
				4.6581873893738
			}
		},
		pwh_morris_town_behind = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwh_morris_town_behind_01",
				"pwh_morris_town_behind_02",
				"pwh_morris_town_behind_03",
				"pwh_morris_town_behind_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_town_behind_01",
				"pwh_morris_town_behind_02",
				"pwh_morris_town_behind_03",
				"pwh_morris_town_behind_04"
			},
			sound_events_duration = {
				3.8747084140778,
				3.0593750476837,
				3.3201251029968,
				3.2797501087189
			}
		},
		pwh_morris_town_harbour = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwh_morris_town_harbour_01",
				"pwh_morris_town_harbour_02",
				"pwh_morris_town_harbour_03",
				"pwh_morris_town_harbour_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_town_harbour_01",
				"pwh_morris_town_harbour_02",
				"pwh_morris_town_harbour_03",
				"pwh_morris_town_harbour_04"
			},
			sound_events_duration = {
				3.673291683197,
				5.8498959541321,
				5.9299373626709,
				4.6698751449585
			}
		},
		pwh_morris_town_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwh_morris_town_settlement_01",
				"pwh_morris_town_settlement_02",
				"pwh_morris_town_settlement_03",
				"pwh_morris_town_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_town_settlement_01",
				"pwh_morris_town_settlement_02",
				"pwh_morris_town_settlement_03",
				"pwh_morris_town_settlement_04"
			},
			sound_events_duration = {
				4.4186248779297,
				5.0963125228882,
				3.711895942688,
				4.5011248588562
			}
		},
		pwh_morris_town_shipwreck = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_town",
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
				"pwh_morris_town_shipwreck_01",
				"pwh_morris_town_shipwreck_02",
				"pwh_morris_town_shipwreck_03",
				"pwh_morris_town_shipwreck_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_town_shipwreck_01",
				"pwh_morris_town_shipwreck_02",
				"pwh_morris_town_shipwreck_03",
				"pwh_morris_town_shipwreck_04"
			},
			sound_events_duration = {
				4.7962498664856,
				5.6682915687561,
				5.3699374198914,
				4.0727705955505
			}
		}
	})
end
