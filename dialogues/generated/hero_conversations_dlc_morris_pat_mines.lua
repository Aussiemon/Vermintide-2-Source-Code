return function ()
	define_rule({
		name = "pbw_morris_mines_closed_gate",
		response = "pbw_morris_mines_closed_gate",
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
				"pat_mines_closed_gate"
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
				"pbw_morris_mines_closed_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mines_closed_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_mines_entrance",
		response = "pbw_morris_mines_entrance",
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
				"pat_mines_entrance"
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
				"pbw_morris_mines_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mines_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_mines_passageways",
		response = "pbw_morris_mines_passageways",
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
				"pat_mines_passageways"
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
				"pbw_morris_mines_passageways",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mines_passageways",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_mines_poison",
		response = "pbw_morris_mines_poison",
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
				"pat_mines_poison"
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
				"pbw_morris_mines_poison",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mines_poison",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_mines_settlement",
		response = "pbw_morris_mines_settlement",
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
				"pat_mines_settlement"
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
				"pbw_morris_mines_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mines_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mines_closed_gate",
		response = "pdr_morris_mines_closed_gate",
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
				"pat_mines_closed_gate"
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
				"pdr_morris_mines_closed_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mines_closed_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mines_entrance",
		response = "pdr_morris_mines_entrance",
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
				"pat_mines_entrance"
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
				"pdr_morris_mines_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mines_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mines_passageways",
		response = "pdr_morris_mines_passageways",
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
				"pat_mines_passageways"
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
				"pdr_morris_mines_passageways",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mines_passageways",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mines_poison",
		response = "pdr_morris_mines_poison",
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
				"pat_mines_poison"
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
				"pdr_morris_mines_poison",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mines_poison",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mines_settlement",
		response = "pdr_morris_mines_settlement",
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
				"pat_mines_settlement"
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
				"pdr_morris_mines_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mines_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mines_closed_gate",
		response = "pes_morris_mines_closed_gate",
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
				"pat_mines_closed_gate"
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
				"pes_morris_mines_closed_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mines_closed_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mines_entrance",
		response = "pes_morris_mines_entrance",
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
				"pat_mines_entrance"
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
				"pes_morris_mines_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mines_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mines_passageways",
		response = "pes_morris_mines_passageways",
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
				"pat_mines_passageways"
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
				"pes_morris_mines_passageways",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mines_passageways",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mines_poison",
		response = "pes_morris_mines_poison",
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
				"pat_mines_poison"
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
				"pes_morris_mines_poison",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mines_poison",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mines_settlement",
		response = "pes_morris_mines_settlement",
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
				"pat_mines_settlement"
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
				"pes_morris_mines_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mines_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mines_closed_gate",
		response = "pwe_morris_mines_closed_gate",
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
				"pat_mines_closed_gate"
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
				"pwe_morris_mines_closed_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mines_closed_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mines_entrance",
		response = "pwe_morris_mines_entrance",
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
				"pat_mines_entrance"
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
				"pwe_morris_mines_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mines_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mines_passageways",
		response = "pwe_morris_mines_passageways",
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
				"pat_mines_passageways"
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
				"pwe_morris_mines_passageways",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mines_passageways",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mines_poison",
		response = "pwe_morris_mines_poison",
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
				"pat_mines_poison"
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
				"pwe_morris_mines_poison",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mines_poison",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mines_settlement",
		response = "pwe_morris_mines_settlement",
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
				"pat_mines_settlement"
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
				"pwe_morris_mines_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mines_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mines_closed_gate",
		response = "pwh_morris_mines_closed_gate",
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
				"pat_mines_closed_gate"
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
				"pwh_morris_mines_closed_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mines_closed_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mines_entrance",
		response = "pwh_morris_mines_entrance",
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
				"pat_mines_entrance"
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
				"pwh_morris_mines_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mines_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mines_passageways",
		response = "pwh_morris_mines_passageways",
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
				"pat_mines_passageways"
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
				"pwh_morris_mines_passageways",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mines_passageways",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mines_poison",
		response = "pwh_morris_mines_poison",
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
				"pat_mines_poison"
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
				"pwh_morris_mines_poison",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mines_poison",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mines_settlement",
		response = "pwh_morris_mines_settlement",
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
				"pat_mines_settlement"
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
				"pwh_morris_mines_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mines_settlement",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_mines_closed_gate = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pbw_morris_mines_closed_gate_01",
				"pbw_morris_mines_closed_gate_02",
				"pbw_morris_mines_closed_gate_03",
				"pbw_morris_mines_closed_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mines_closed_gate_01",
				"pbw_morris_mines_closed_gate_02",
				"pbw_morris_mines_closed_gate_03",
				"pbw_morris_mines_closed_gate_04"
			},
			sound_events_duration = {
				2.9781041145325,
				4.9072289466858,
				2.4359166622162,
				5.4326248168945
			}
		},
		pbw_morris_mines_entrance = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pbw_morris_mines_entrance_01",
				"pbw_morris_mines_entrance_02",
				"pbw_morris_mines_entrance_03",
				"pbw_morris_mines_entrance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mines_entrance_01",
				"pbw_morris_mines_entrance_02",
				"pbw_morris_mines_entrance_03",
				"pbw_morris_mines_entrance_04"
			},
			sound_events_duration = {
				2.2458748817444,
				3.8162291049957,
				3.1318957805634,
				3.4313333034515
			}
		},
		pbw_morris_mines_passageways = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pbw_morris_mines_passageways_01",
				"pbw_morris_mines_passageways_02",
				"pbw_morris_mines_passageways_03",
				"pbw_morris_mines_passageways_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mines_passageways_01",
				"pbw_morris_mines_passageways_02",
				"pbw_morris_mines_passageways_03",
				"pbw_morris_mines_passageways_04"
			},
			sound_events_duration = {
				2.3249790668488,
				3.5515832901001,
				2.3700416088104,
				4.9975624084473
			}
		},
		pbw_morris_mines_poison = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pbw_morris_mines_poison_01",
				"pbw_morris_mines_poison_02",
				"pbw_morris_mines_poison_03",
				"pbw_morris_mines_poison_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mines_poison_01",
				"pbw_morris_mines_poison_02",
				"pbw_morris_mines_poison_03",
				"pbw_morris_mines_poison_04"
			},
			sound_events_duration = {
				2.9102916717529,
				4.6809792518616,
				2.8672709465027,
				2.2756042480469
			}
		},
		pbw_morris_mines_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pbw_morris_mines_settlement_01",
				"pbw_morris_mines_settlement_02",
				"pbw_morris_mines_settlement_03",
				"pbw_morris_mines_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mines_settlement_01",
				"pbw_morris_mines_settlement_02",
				"pbw_morris_mines_settlement_03",
				"pbw_morris_mines_settlement_04"
			},
			sound_events_duration = {
				2.784458398819,
				5.3172917366028,
				3.4035625457764,
				3.796875
			}
		},
		pdr_morris_mines_closed_gate = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pdr_morris_mines_closed_gate_01",
				"pdr_morris_mines_closed_gate_02",
				"pdr_morris_mines_closed_gate_03",
				"pdr_morris_mines_closed_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mines_closed_gate_01",
				"pdr_morris_mines_closed_gate_02",
				"pdr_morris_mines_closed_gate_03",
				"pdr_morris_mines_closed_gate_04"
			},
			sound_events_duration = {
				1.7530208826065,
				2.1031041145325,
				4.0898542404175,
				2.7968542575836
			}
		},
		pdr_morris_mines_entrance = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pdr_morris_mines_entrance_01",
				"pdr_morris_mines_entrance_02",
				"pdr_morris_mines_entrance_03",
				"pdr_morris_mines_entrance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mines_entrance_01",
				"pdr_morris_mines_entrance_02",
				"pdr_morris_mines_entrance_03",
				"pdr_morris_mines_entrance_04"
			},
			sound_events_duration = {
				5.7811460494995,
				2.4988124370575,
				5.6678957939148,
				2.8780832290649
			}
		},
		pdr_morris_mines_passageways = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pdr_morris_mines_passageways_01",
				"pdr_morris_mines_passageways_02",
				"pdr_morris_mines_passageways_03",
				"pdr_morris_mines_passageways_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mines_passageways_01",
				"pdr_morris_mines_passageways_02",
				"pdr_morris_mines_passageways_03",
				"pdr_morris_mines_passageways_04"
			},
			sound_events_duration = {
				3.0527501106262,
				2.8791041374206,
				4.864812374115,
				3.4365208148956
			}
		},
		pdr_morris_mines_poison = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pdr_morris_mines_poison_01",
				"pdr_morris_mines_poison_02",
				"pdr_morris_mines_poison_03",
				"pdr_morris_mines_poison_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mines_poison_01",
				"pdr_morris_mines_poison_02",
				"pdr_morris_mines_poison_03",
				"pdr_morris_mines_poison_04"
			},
			sound_events_duration = {
				5.6097707748413,
				2.5768959522247,
				3.413104057312,
				3.6773333549499
			}
		},
		pdr_morris_mines_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pdr_morris_mines_settlement_01",
				"pdr_morris_mines_settlement_02",
				"pdr_morris_mines_settlement_03",
				"pdr_morris_mines_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mines_settlement_01",
				"pdr_morris_mines_settlement_02",
				"pdr_morris_mines_settlement_03",
				"pdr_morris_mines_settlement_04"
			},
			sound_events_duration = {
				3.3284375667572,
				5.6958541870117,
				3.0571665763855,
				2.9761874675751
			}
		},
		pes_morris_mines_closed_gate = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pes_morris_mines_closed_gate_01",
				"pes_morris_mines_closed_gate_02",
				"pes_morris_mines_closed_gate_03",
				"pes_morris_mines_closed_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mines_closed_gate_01",
				"pes_morris_mines_closed_gate_02",
				"pes_morris_mines_closed_gate_03",
				"pes_morris_mines_closed_gate_04"
			},
			sound_events_duration = {
				2.5961666107178,
				2.6681249141693,
				3.1296665668488,
				2.8923749923706
			}
		},
		pes_morris_mines_entrance = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pes_morris_mines_entrance_01",
				"pes_morris_mines_entrance_02",
				"pes_morris_mines_entrance_03",
				"pes_morris_mines_entrance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mines_entrance_01",
				"pes_morris_mines_entrance_02",
				"pes_morris_mines_entrance_03",
				"pes_morris_mines_entrance_04"
			},
			sound_events_duration = {
				3.145124912262,
				2.0366666316986,
				4.0223331451416,
				4.2326664924622
			}
		},
		pes_morris_mines_passageways = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pes_morris_mines_passageways_01",
				"pes_morris_mines_passageways_02",
				"pes_morris_mines_passageways_03",
				"pes_morris_mines_passageways_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mines_passageways_01",
				"pes_morris_mines_passageways_02",
				"pes_morris_mines_passageways_03",
				"pes_morris_mines_passageways_04"
			},
			sound_events_duration = {
				1.5792917013168,
				2.1907708644867,
				2.6388125419617,
				1.4223958253861
			}
		},
		pes_morris_mines_poison = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pes_morris_mines_poison_01",
				"pes_morris_mines_poison_02",
				"pes_morris_mines_poison_03",
				"pes_morris_mines_poison_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mines_poison_01",
				"pes_morris_mines_poison_02",
				"pes_morris_mines_poison_03",
				"pes_morris_mines_poison_04"
			},
			sound_events_duration = {
				2.068062543869,
				3.0740833282471,
				2.212249994278,
				2.0742499828339
			}
		},
		pes_morris_mines_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pes_morris_mines_settlement_01",
				"pes_morris_mines_settlement_02",
				"pes_morris_mines_settlement_03",
				"pes_morris_mines_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mines_settlement_01",
				"pes_morris_mines_settlement_02",
				"pes_morris_mines_settlement_03",
				"pes_morris_mines_settlement_04"
			},
			sound_events_duration = {
				1.9978958368301,
				2.6237916946411,
				3.7999999523163,
				1.9737708568573
			}
		},
		pwe_morris_mines_closed_gate = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwe_morris_mines_closed_gate_01",
				"pwe_morris_mines_closed_gate_02",
				"pwe_morris_mines_closed_gate_03",
				"pwe_morris_mines_closed_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mines_closed_gate_01",
				"pwe_morris_mines_closed_gate_02",
				"pwe_morris_mines_closed_gate_03",
				"pwe_morris_mines_closed_gate_04"
			},
			sound_events_duration = {
				2.2965624332428,
				2.0751249194145,
				3.9026665687561,
				3.7144792079926
			}
		},
		pwe_morris_mines_entrance = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwe_morris_mines_entrance_01",
				"pwe_morris_mines_entrance_02",
				"pwe_morris_mines_entrance_03",
				"pwe_morris_mines_entrance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mines_entrance_01",
				"pwe_morris_mines_entrance_02",
				"pwe_morris_mines_entrance_03",
				"pwe_morris_mines_entrance_04"
			},
			sound_events_duration = {
				1.5918542146683,
				3.8015415668488,
				2.9405521154404,
				3.983895778656
			}
		},
		pwe_morris_mines_passageways = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwe_morris_mines_passageways_01",
				"pwe_morris_mines_passageways_02",
				"pwe_morris_mines_passageways_03",
				"pwe_morris_mines_passageways_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mines_passageways_01",
				"pwe_morris_mines_passageways_02",
				"pwe_morris_mines_passageways_03",
				"pwe_morris_mines_passageways_04"
			},
			sound_events_duration = {
				2.9829375743866,
				4.2074165344238,
				4.605583190918,
				4.5548958778381
			}
		},
		pwe_morris_mines_poison = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwe_morris_mines_poison_01",
				"pwe_morris_mines_poison_02",
				"pwe_morris_mines_poison_03",
				"pwe_morris_mines_poison_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mines_poison_01",
				"pwe_morris_mines_poison_02",
				"pwe_morris_mines_poison_03",
				"pwe_morris_mines_poison_04"
			},
			sound_events_duration = {
				3.100250005722,
				3.2377707958221,
				4.107958316803,
				4.1996250152588
			}
		},
		pwe_morris_mines_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwe_morris_mines_settlement_01",
				"pwe_morris_mines_settlement_02",
				"pwe_morris_mines_settlement_03",
				"pwe_morris_mines_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mines_settlement_01",
				"pwe_morris_mines_settlement_02",
				"pwe_morris_mines_settlement_03",
				"pwe_morris_mines_settlement_04"
			},
			sound_events_duration = {
				4.1895623207092,
				4.2190833091736,
				5.7091460227966,
				3.5677396059036
			}
		},
		pwh_morris_mines_closed_gate = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwh_morris_mines_closed_gate_01",
				"pwh_morris_mines_closed_gate_02",
				"pwh_morris_mines_closed_gate_03",
				"pwh_morris_mines_closed_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mines_closed_gate_01",
				"pwh_morris_mines_closed_gate_02",
				"pwh_morris_mines_closed_gate_03",
				"pwh_morris_mines_closed_gate_04"
			},
			sound_events_duration = {
				3.8648540973663,
				3.5075209140778,
				4.6507501602173,
				2.6743750572205
			}
		},
		pwh_morris_mines_entrance = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwh_morris_mines_entrance_01",
				"pwh_morris_mines_entrance_02",
				"pwh_morris_mines_entrance_03",
				"pwh_morris_mines_entrance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mines_entrance_01",
				"pwh_morris_mines_entrance_02",
				"pwh_morris_mines_entrance_03",
				"pwh_morris_mines_entrance_04"
			},
			sound_events_duration = {
				1.9726874828339,
				3.617645740509,
				2.8975417613983,
				4.0549583435059
			}
		},
		pwh_morris_mines_passageways = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwh_morris_mines_passageways_01",
				"pwh_morris_mines_passageways_02",
				"pwh_morris_mines_passageways_03",
				"pwh_morris_mines_passageways_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mines_passageways_01",
				"pwh_morris_mines_passageways_02",
				"pwh_morris_mines_passageways_03",
				"pwh_morris_mines_passageways_04"
			},
			sound_events_duration = {
				2.9272916316986,
				2.6038541793823,
				4.5447707176208,
				3.0439791679382
			}
		},
		pwh_morris_mines_poison = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwh_morris_mines_poison_01",
				"pwh_morris_mines_poison_02",
				"pwh_morris_mines_poison_03",
				"pwh_morris_mines_poison_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mines_poison_01",
				"pwh_morris_mines_poison_02",
				"pwh_morris_mines_poison_03",
				"pwh_morris_mines_poison_04"
			},
			sound_events_duration = {
				3.067479133606,
				2.0118958950043,
				3.3675000667572,
				2.8074791431427
			}
		},
		pwh_morris_mines_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mines",
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
				"pwh_morris_mines_settlement_01",
				"pwh_morris_mines_settlement_02",
				"pwh_morris_mines_settlement_03",
				"pwh_morris_mines_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mines_settlement_01",
				"pwh_morris_mines_settlement_02",
				"pwh_morris_mines_settlement_03",
				"pwh_morris_mines_settlement_04"
			},
			sound_events_duration = {
				2.716854095459,
				4.7067499160767,
				4.9828748703003,
				4.4557709693909
			}
		}
	})
end
