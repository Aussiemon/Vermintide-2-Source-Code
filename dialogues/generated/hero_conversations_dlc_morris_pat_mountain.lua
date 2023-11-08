return function ()
	define_rule({
		name = "pbw_morris_mountain_bones",
		response = "pbw_morris_mountain_bones",
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
				"pat_mountain_bones"
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
				"pbw_morris_mountain_bones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mountain_bones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_mountain_monolith",
		response = "pbw_morris_mountain_monolith",
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
				"pat_mountain_monolith"
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
				"pbw_morris_mountain_monolith",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mountain_monolith",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_mountain_ritual_location",
		response = "pbw_morris_mountain_ritual_location",
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
				"pat_mountain_ritual_location"
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
				"pbw_morris_mountain_ritual_location",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mountain_ritual_location",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_mountain_stacked_stones",
		response = "pbw_morris_mountain_stacked_stones",
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
				"pat_mountain_stacked_stones"
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
				"pbw_morris_mountain_stacked_stones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mountain_stacked_stones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_mountain_throne",
		response = "pbw_morris_mountain_throne",
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
				"pat_mountain_throne"
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
				"pbw_morris_mountain_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mountain_throne",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mountain_bones",
		response = "pdr_morris_mountain_bones",
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
				"pat_mountain_bones"
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
				"pdr_morris_mountain_bones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mountain_bones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mountain_monolith",
		response = "pdr_morris_mountain_monolith",
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
				"pat_mountain_monolith"
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
				"pdr_morris_mountain_monolith",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mountain_monolith",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mountain_ritual_location",
		response = "pdr_morris_mountain_ritual_location",
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
				"pat_mountain_ritual_location"
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
				"pdr_morris_mountain_ritual_location",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mountain_ritual_location",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mountain_stacked_stones",
		response = "pdr_morris_mountain_stacked_stones",
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
				"pat_mountain_stacked_stones"
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
				"pdr_morris_mountain_stacked_stones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mountain_stacked_stones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_mountain_throne",
		response = "pdr_morris_mountain_throne",
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
				"pat_mountain_throne"
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
				"pdr_morris_mountain_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mountain_throne",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mountain_bones",
		response = "pes_morris_mountain_bones",
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
				"pat_mountain_bones"
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
				"pes_morris_mountain_bones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mountain_bones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mountain_monolith",
		response = "pes_morris_mountain_monolith",
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
				"pat_mountain_monolith"
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
				"pes_morris_mountain_monolith",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mountain_monolith",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mountain_ritual_location",
		response = "pes_morris_mountain_ritual_location",
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
				"pat_mountain_ritual_location"
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
				"pes_morris_mountain_ritual_location",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mountain_ritual_location",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mountain_stacked_stones",
		response = "pes_morris_mountain_stacked_stones",
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
				"pat_mountain_stacked_stones"
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
				"pes_morris_mountain_stacked_stones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mountain_stacked_stones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_mountain_throne",
		response = "pes_morris_mountain_throne",
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
				"pat_mountain_throne"
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
				"pes_morris_mountain_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mountain_throne",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mountain_bones",
		response = "pwe_morris_mountain_bones",
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
				"pat_mountain_bones"
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
				"pwe_morris_mountain_bones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mountain_bones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mountain_monolith",
		response = "pwe_morris_mountain_monolith",
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
				"pat_mountain_monolith"
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
				"pwe_morris_mountain_monolith",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mountain_monolith",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mountain_ritual_location",
		response = "pwe_morris_mountain_ritual_location",
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
				"pat_mountain_ritual_location"
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
				"pwe_morris_mountain_ritual_location",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mountain_ritual_location",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mountain_stacked_stones",
		response = "pwe_morris_mountain_stacked_stones",
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
				"pat_mountain_stacked_stones"
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
				"pwe_morris_mountain_stacked_stones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mountain_stacked_stones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_mountain_throne",
		response = "pwe_morris_mountain_throne",
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
				"pat_mountain_throne"
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
				"pwe_morris_mountain_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mountain_throne",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mountain_bones",
		response = "pwh_morris_mountain_bones",
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
				"pat_mountain_bones"
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
				"pwh_morris_mountain_bones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mountain_bones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mountain_monolith",
		response = "pwh_morris_mountain_monolith",
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
				"pat_mountain_monolith"
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
				"pwh_morris_mountain_monolith",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mountain_monolith",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mountain_ritual_location",
		response = "pwh_morris_mountain_ritual_location",
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
				"pat_mountain_ritual_location"
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
				"pwh_morris_mountain_ritual_location",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mountain_ritual_location",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mountain_stacked_stones",
		response = "pwh_morris_mountain_stacked_stones",
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
				"pat_mountain_stacked_stones"
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
				"pwh_morris_mountain_stacked_stones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mountain_stacked_stones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_mountain_throne",
		response = "pwh_morris_mountain_throne",
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
				"pat_mountain_throne"
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
				"pwh_morris_mountain_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mountain_throne",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_mountain_bones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pbw_morris_mountain_bones_01",
				"pbw_morris_mountain_bones_02",
				"pbw_morris_mountain_bones_03",
				"pbw_morris_mountain_bones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mountain_bones_01",
				"pbw_morris_mountain_bones_02",
				"pbw_morris_mountain_bones_03",
				"pbw_morris_mountain_bones_04"
			},
			sound_events_duration = {
				2.5413334369659,
				2.761479139328,
				3.6727707386017,
				4.6674790382385
			}
		},
		pbw_morris_mountain_monolith = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pbw_morris_mountain_monolith_01",
				"pbw_morris_mountain_monolith_02",
				"pbw_morris_mountain_monolith_03",
				"pbw_morris_mountain_monolith_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mountain_monolith_01",
				"pbw_morris_mountain_monolith_02",
				"pbw_morris_mountain_monolith_03",
				"pbw_morris_mountain_monolith_04"
			},
			sound_events_duration = {
				5.884250164032,
				5.7463126182556,
				5.1641249656677,
				4.2823543548584
			}
		},
		pbw_morris_mountain_ritual_location = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pbw_morris_mountain_ritual_location_01",
				"pbw_morris_mountain_ritual_location_02",
				"pbw_morris_mountain_ritual_location_03",
				"pbw_morris_mountain_ritual_location_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mountain_ritual_location_01",
				"pbw_morris_mountain_ritual_location_02",
				"pbw_morris_mountain_ritual_location_03",
				"pbw_morris_mountain_ritual_location_04"
			},
			sound_events_duration = {
				3.5859999656677,
				4.6459794044495,
				5.5797915458679,
				4.0696043968201
			}
		},
		pbw_morris_mountain_stacked_stones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pbw_morris_mountain_stacked_stones_01",
				"pbw_morris_mountain_stacked_stones_02",
				"pbw_morris_mountain_stacked_stones_03",
				"pbw_morris_mountain_stacked_stones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mountain_stacked_stones_01",
				"pbw_morris_mountain_stacked_stones_02",
				"pbw_morris_mountain_stacked_stones_03",
				"pbw_morris_mountain_stacked_stones_04"
			},
			sound_events_duration = {
				3.0117082595825,
				4.1684374809265,
				4.3207502365112,
				4.6956667900085
			}
		},
		pbw_morris_mountain_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pbw_morris_mountain_throne_01",
				"pbw_morris_mountain_throne_02",
				"pbw_morris_mountain_throne_03",
				"pbw_morris_mountain_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mountain_throne_01",
				"pbw_morris_mountain_throne_02",
				"pbw_morris_mountain_throne_03",
				"pbw_morris_mountain_throne_04"
			},
			sound_events_duration = {
				4.0602293014526,
				4.0077085494995,
				2.4756875038147,
				4.8550209999084
			}
		},
		pdr_morris_mountain_bones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pdr_morris_mountain_bones_01",
				"pdr_morris_mountain_bones_02",
				"pdr_morris_mountain_bones_03",
				"pdr_morris_mountain_bones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mountain_bones_01",
				"pdr_morris_mountain_bones_02",
				"pdr_morris_mountain_bones_03",
				"pdr_morris_mountain_bones_04"
			},
			sound_events_duration = {
				2.8230624198914,
				3.3205208778381,
				3.8641042709351,
				2.4153542518616
			}
		},
		pdr_morris_mountain_monolith = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pdr_morris_mountain_monolith_01",
				"pdr_morris_mountain_monolith_02",
				"pdr_morris_mountain_monolith_03",
				"pdr_morris_mountain_monolith_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mountain_monolith_01",
				"pdr_morris_mountain_monolith_02",
				"pdr_morris_mountain_monolith_03",
				"pdr_morris_mountain_monolith_04"
			},
			sound_events_duration = {
				2.9305000305176,
				3.392874956131,
				4.2475624084473,
				5.0171666145325
			}
		},
		pdr_morris_mountain_ritual_location = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pdr_morris_mountain_ritual_location_01",
				"pdr_morris_mountain_ritual_location_02",
				"pdr_morris_mountain_ritual_location_03",
				"pdr_morris_mountain_ritual_location_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mountain_ritual_location_01",
				"pdr_morris_mountain_ritual_location_02",
				"pdr_morris_mountain_ritual_location_03",
				"pdr_morris_mountain_ritual_location_04"
			},
			sound_events_duration = {
				3.1110417842865,
				3.2412917613983,
				3.7319583892822,
				4.0230417251587
			}
		},
		pdr_morris_mountain_stacked_stones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pdr_morris_mountain_stacked_stones_01",
				"pdr_morris_mountain_stacked_stones_02",
				"pdr_morris_mountain_stacked_stones_03",
				"pdr_morris_mountain_stacked_stones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mountain_stacked_stones_01",
				"pdr_morris_mountain_stacked_stones_02",
				"pdr_morris_mountain_stacked_stones_03",
				"pdr_morris_mountain_stacked_stones_04"
			},
			sound_events_duration = {
				1.9537916183472,
				3.070791721344,
				2.5776875019074,
				2.5435209274292
			}
		},
		pdr_morris_mountain_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pdr_morris_mountain_throne_01",
				"pdr_morris_mountain_throne_02",
				"pdr_morris_mountain_throne_03",
				"pdr_morris_mountain_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mountain_throne_01",
				"pdr_morris_mountain_throne_02",
				"pdr_morris_mountain_throne_03",
				"pdr_morris_mountain_throne_04"
			},
			sound_events_duration = {
				3.7213749885559,
				2.7687499523163,
				4.4915208816528,
				2.9186458587647
			}
		},
		pes_morris_mountain_bones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pes_morris_mountain_bones_01",
				"pes_morris_mountain_bones_02",
				"pes_morris_mountain_bones_03",
				"pes_morris_mountain_bones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mountain_bones_01",
				"pes_morris_mountain_bones_02",
				"pes_morris_mountain_bones_03",
				"pes_morris_mountain_bones_04"
			},
			sound_events_duration = {
				2.0834374427795,
				1.8685417175293,
				3.4219584465027,
				2.5922915935516
			}
		},
		pes_morris_mountain_monolith = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pes_morris_mountain_monolith_01",
				"pes_morris_mountain_monolith_02",
				"pes_morris_mountain_monolith_03",
				"pes_morris_mountain_monolith_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mountain_monolith_01",
				"pes_morris_mountain_monolith_02",
				"pes_morris_mountain_monolith_03",
				"pes_morris_mountain_monolith_04"
			},
			sound_events_duration = {
				2.7106873989105,
				4.4422292709351,
				2.8358957767487,
				4.9103126525879
			}
		},
		pes_morris_mountain_ritual_location = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pes_morris_mountain_ritual_location_01",
				"pes_morris_mountain_ritual_location_02",
				"pes_morris_mountain_ritual_location_03",
				"pes_morris_mountain_ritual_location_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mountain_ritual_location_01",
				"pes_morris_mountain_ritual_location_02",
				"pes_morris_mountain_ritual_location_03",
				"pes_morris_mountain_ritual_location_04"
			},
			sound_events_duration = {
				2.3390207290649,
				3.1052916049957,
				2.6734375953674,
				2.1728749275208
			}
		},
		pes_morris_mountain_stacked_stones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pes_morris_mountain_stacked_stones_01",
				"pes_morris_mountain_stacked_stones_02",
				"pes_morris_mountain_stacked_stones_03",
				"pes_morris_mountain_stacked_stones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mountain_stacked_stones_01",
				"pes_morris_mountain_stacked_stones_02",
				"pes_morris_mountain_stacked_stones_03",
				"pes_morris_mountain_stacked_stones_04"
			},
			sound_events_duration = {
				3.1942915916443,
				1.8224999904633,
				1.8403749465942,
				1.9786041975021
			}
		},
		pes_morris_mountain_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pes_morris_mountain_throne_01",
				"pes_morris_mountain_throne_02",
				"pes_morris_mountain_throne_03",
				"pes_morris_mountain_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mountain_throne_01",
				"pes_morris_mountain_throne_02",
				"pes_morris_mountain_throne_03",
				"pes_morris_mountain_throne_04"
			},
			sound_events_duration = {
				1.9446874856949,
				2.6578540802002,
				2.1627082824707,
				2.3945624828339
			}
		},
		pwe_morris_mountain_bones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwe_morris_mountain_bones_01",
				"pwe_morris_mountain_bones_02",
				"pwe_morris_mountain_bones_03",
				"pwe_morris_mountain_bones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mountain_bones_01",
				"pwe_morris_mountain_bones_02",
				"pwe_morris_mountain_bones_03",
				"pwe_morris_mountain_bones_04"
			},
			sound_events_duration = {
				4.0557708740234,
				4.8762917518616,
				6.043541431427,
				4.1508541107178
			}
		},
		pwe_morris_mountain_monolith = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwe_morris_mountain_monolith_01",
				"pwe_morris_mountain_monolith_02",
				"pwe_morris_mountain_monolith_03",
				"pwe_morris_mountain_monolith_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mountain_monolith_01",
				"pwe_morris_mountain_monolith_02",
				"pwe_morris_mountain_monolith_03",
				"pwe_morris_mountain_monolith_04"
			},
			sound_events_duration = {
				5.7369999885559,
				4.357458114624,
				4.093291759491,
				3.254625082016
			}
		},
		pwe_morris_mountain_ritual_location = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwe_morris_mountain_ritual_location_01",
				"pwe_morris_mountain_ritual_location_02",
				"pwe_morris_mountain_ritual_location_03",
				"pwe_morris_mountain_ritual_location_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mountain_ritual_location_01",
				"pwe_morris_mountain_ritual_location_02",
				"pwe_morris_mountain_ritual_location_03",
				"pwe_morris_mountain_ritual_location_04"
			},
			sound_events_duration = {
				4.3420834541321,
				3.0945415496826,
				4.2843956947327,
				5.8441877365112
			}
		},
		pwe_morris_mountain_stacked_stones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwe_morris_mountain_stacked_stones_01",
				"pwe_morris_mountain_stacked_stones_02",
				"pwe_morris_mountain_stacked_stones_03",
				"pwe_morris_mountain_stacked_stones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mountain_stacked_stones_01",
				"pwe_morris_mountain_stacked_stones_02",
				"pwe_morris_mountain_stacked_stones_03",
				"pwe_morris_mountain_stacked_stones_04"
			},
			sound_events_duration = {
				3.173749923706,
				2.6281249523163,
				2.4976041316986,
				2.6725833415985
			}
		},
		pwe_morris_mountain_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwe_morris_mountain_throne_01",
				"pwe_morris_mountain_throne_02",
				"pwe_morris_mountain_throne_03",
				"pwe_morris_mountain_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mountain_throne_01",
				"pwe_morris_mountain_throne_02",
				"pwe_morris_mountain_throne_03",
				"pwe_morris_mountain_throne_04"
			},
			sound_events_duration = {
				2.8275833129883,
				3.8084375858307,
				4.2064790725708,
				4.8974165916443
			}
		},
		pwh_morris_mountain_bones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwh_morris_mountain_bones_01",
				"pwh_morris_mountain_bones_02",
				"pwh_morris_mountain_bones_03",
				"pwh_morris_mountain_bones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mountain_bones_01",
				"pwh_morris_mountain_bones_02",
				"pwh_morris_mountain_bones_03",
				"pwh_morris_mountain_bones_04"
			},
			sound_events_duration = {
				3.8575625419617,
				4.1672501564026,
				6.3908958435059,
				5.5052084922791
			}
		},
		pwh_morris_mountain_monolith = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwh_morris_mountain_monolith_01",
				"pwh_morris_mountain_monolith_02",
				"pwh_morris_mountain_monolith_03",
				"pwh_morris_mountain_monolith_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mountain_monolith_01",
				"pwh_morris_mountain_monolith_02",
				"pwh_morris_mountain_monolith_03",
				"pwh_morris_mountain_monolith_04"
			},
			sound_events_duration = {
				4.2716250419617,
				3.0314373970032,
				4.055624961853,
				5.6807498931885
			}
		},
		pwh_morris_mountain_ritual_location = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwh_morris_mountain_ritual_location_01",
				"pwh_morris_mountain_ritual_location_02",
				"pwh_morris_mountain_ritual_location_03",
				"pwh_morris_mountain_ritual_location_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mountain_ritual_location_01",
				"pwh_morris_mountain_ritual_location_02",
				"pwh_morris_mountain_ritual_location_03",
				"pwh_morris_mountain_ritual_location_04"
			},
			sound_events_duration = {
				5.336437702179,
				5.9422917366028,
				5.3729791641235,
				6.671416759491
			}
		},
		pwh_morris_mountain_stacked_stones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwh_morris_mountain_stacked_stones_01",
				"pwh_morris_mountain_stacked_stones_02",
				"pwh_morris_mountain_stacked_stones_03",
				"pwh_morris_mountain_stacked_stones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mountain_stacked_stones_01",
				"pwh_morris_mountain_stacked_stones_02",
				"pwh_morris_mountain_stacked_stones_03",
				"pwh_morris_mountain_stacked_stones_04"
			},
			sound_events_duration = {
				2.9966042041779,
				3.6135625839233,
				3.8007082939148,
				3.9478542804718
			}
		},
		pwh_morris_mountain_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_mountain",
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
				"pwh_morris_mountain_throne_01",
				"pwh_morris_mountain_throne_02",
				"pwh_morris_mountain_throne_03",
				"pwh_morris_mountain_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mountain_throne_01",
				"pwh_morris_mountain_throne_02",
				"pwh_morris_mountain_throne_03",
				"pwh_morris_mountain_throne_04"
			},
			sound_events_duration = {
				4.297333240509,
				4.0297918319702,
				4.629979133606,
				4.0987501144409
			}
		}
	})
end
