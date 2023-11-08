return function ()
	define_rule({
		name = "pbw_morris_bay_cursed_shore",
		response = "pbw_morris_bay_cursed_shore",
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
				"pat_bay_cursed_shore"
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
				"pbw_morris_bay_cursed_shore",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_bay_cursed_shore",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_bay_ice_cave",
		response = "pbw_morris_bay_ice_cave",
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
				"pat_bay_ice_cave"
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
				"pbw_morris_bay_ice_cave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_bay_ice_cave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_bay_lookout",
		response = "pbw_morris_bay_lookout",
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
				"pat_bay_lookout"
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
				"pbw_morris_bay_lookout",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_bay_lookout",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_bay_stranded_ships",
		response = "pbw_morris_bay_stranded_ships",
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
				"pat_bay_stranded_ships"
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
				"pbw_morris_bay_stranded_ships",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_bay_stranded_ships",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_bay_cursed_shore",
		response = "pdr_morris_bay_cursed_shore",
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
				"pat_bay_cursed_shore"
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
				"pdr_morris_bay_cursed_shore",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_bay_cursed_shore",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_bay_ice_cave",
		response = "pdr_morris_bay_ice_cave",
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
				"pat_bay_ice_cave"
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
				"pdr_morris_bay_ice_cave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_bay_ice_cave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_bay_lookout",
		response = "pdr_morris_bay_lookout",
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
				"pat_bay_lookout"
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
				"pdr_morris_bay_lookout",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_bay_lookout",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_bay_stranded_ships",
		response = "pdr_morris_bay_stranded_ships",
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
				"pat_bay_stranded_ships"
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
				"pdr_morris_bay_stranded_ships",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_bay_stranded_ships",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_bay_cursed_shore",
		response = "pes_morris_bay_cursed_shore",
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
				"pat_bay_cursed_shore"
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
				"pes_morris_bay_cursed_shore",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_bay_cursed_shore",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_bay_ice_cave",
		response = "pes_morris_bay_ice_cave",
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
				"pat_bay_ice_cave"
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
				"pes_morris_bay_ice_cave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_bay_ice_cave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_bay_lookout",
		response = "pes_morris_bay_lookout",
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
				"pat_bay_lookout"
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
				"pes_morris_bay_lookout",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_bay_lookout",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_bay_stranded_ships",
		response = "pes_morris_bay_stranded_ships",
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
				"pat_bay_stranded_ships"
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
				"pes_morris_bay_stranded_ships",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_bay_stranded_ships",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_bay_cursed_shore",
		response = "pwe_morris_bay_cursed_shore",
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
				"pat_bay_cursed_shore"
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
				"pwe_morris_bay_cursed_shore",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_bay_cursed_shore",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_bay_ice_cave",
		response = "pwe_morris_bay_ice_cave",
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
				"pat_bay_ice_cave"
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
				"pwe_morris_bay_ice_cave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_bay_ice_cave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_bay_lookout",
		response = "pwe_morris_bay_lookout",
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
				"pat_bay_lookout"
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
				"pwe_morris_bay_lookout",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_bay_lookout",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_bay_stranded_ships",
		response = "pwe_morris_bay_stranded_ships",
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
				"pat_bay_stranded_ships"
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
				"pwe_morris_bay_stranded_ships",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_bay_stranded_ships",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_bay_cursed_shore",
		response = "pwh_morris_bay_cursed_shore",
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
				"pat_bay_cursed_shore"
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
				"pwh_morris_bay_cursed_shore",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_bay_cursed_shore",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_bay_ice_cave",
		response = "pwh_morris_bay_ice_cave",
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
				"pat_bay_ice_cave"
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
				"pwh_morris_bay_ice_cave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_bay_ice_cave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_bay_lookout",
		response = "pwh_morris_bay_lookout",
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
				"pat_bay_lookout"
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
				"pwh_morris_bay_lookout",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_bay_lookout",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_bay_stranded_ships",
		response = "pwh_morris_bay_stranded_ships",
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
				"pat_bay_stranded_ships"
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
				"pwh_morris_bay_stranded_ships",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_bay_stranded_ships",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_bay_cursed_shore = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pbw_morris_bay_cursed_shore_01",
				"pbw_morris_bay_cursed_shore_02",
				"pbw_morris_bay_cursed_shore_03",
				"pbw_morris_bay_cursed_shore_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_bay_cursed_shore_01",
				"pbw_morris_bay_cursed_shore_02",
				"pbw_morris_bay_cursed_shore_03",
				"pbw_morris_bay_cursed_shore_04"
			},
			sound_events_duration = {
				2.2135207653046,
				5.3811249732971,
				5.5999999046326,
				3.2000000476837
			}
		},
		pbw_morris_bay_ice_cave = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pbw_morris_bay_ice_cave_01",
				"pbw_morris_bay_ice_cave_02",
				"pbw_morris_bay_ice_cave_03",
				"pbw_morris_bay_ice_cave_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_bay_ice_cave_01",
				"pbw_morris_bay_ice_cave_02",
				"pbw_morris_bay_ice_cave_03",
				"pbw_morris_bay_ice_cave_04"
			},
			sound_events_duration = {
				2.2305834293366,
				2.5461249351502,
				4.2687706947327,
				5.1554584503174
			}
		},
		pbw_morris_bay_lookout = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pbw_morris_bay_lookout_01",
				"pbw_morris_bay_lookout_02",
				"pbw_morris_bay_lookout_03",
				"pbw_morris_bay_lookout_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_bay_lookout_01",
				"pbw_morris_bay_lookout_02",
				"pbw_morris_bay_lookout_03",
				"pbw_morris_bay_lookout_04"
			},
			sound_events_duration = {
				0.98706251382828,
				3.5052292346954,
				3.6924166679382,
				2.9098541736603
			}
		},
		pbw_morris_bay_stranded_ships = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pbw_morris_bay_stranded_ships_01",
				"pbw_morris_bay_stranded_ships_02",
				"pbw_morris_bay_stranded_ships_03",
				"pbw_morris_bay_stranded_ships_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_bay_stranded_ships_01",
				"pbw_morris_bay_stranded_ships_02",
				"pbw_morris_bay_stranded_ships_03",
				"pbw_morris_bay_stranded_ships_04"
			},
			sound_events_duration = {
				2.9985625743866,
				3.8196249008179,
				2.7944374084473,
				2.5647292137146
			}
		},
		pdr_morris_bay_cursed_shore = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pdr_morris_bay_cursed_shore_01",
				"pdr_morris_bay_cursed_shore_02",
				"pdr_morris_bay_cursed_shore_03",
				"pdr_morris_bay_cursed_shore_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_bay_cursed_shore_01",
				"pdr_morris_bay_cursed_shore_02",
				"pdr_morris_bay_cursed_shore_03",
				"pdr_morris_bay_cursed_shore_04"
			},
			sound_events_duration = {
				2.0607917308807,
				4.5696873664856,
				2.4638540744781,
				3.1182084083557
			}
		},
		pdr_morris_bay_ice_cave = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pdr_morris_bay_ice_cave_01",
				"pdr_morris_bay_ice_cave_02",
				"pdr_morris_bay_ice_cave_03",
				"pdr_morris_bay_ice_cave_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_bay_ice_cave_01",
				"pdr_morris_bay_ice_cave_02",
				"pdr_morris_bay_ice_cave_03",
				"pdr_morris_bay_ice_cave_04"
			},
			sound_events_duration = {
				2.0773959159851,
				3.0297083854675,
				2.9734582901001,
				3.0589792728424
			}
		},
		pdr_morris_bay_lookout = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pdr_morris_bay_lookout_01",
				"pdr_morris_bay_lookout_02",
				"pdr_morris_bay_lookout_03",
				"pdr_morris_bay_lookout_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_bay_lookout_01",
				"pdr_morris_bay_lookout_02",
				"pdr_morris_bay_lookout_03",
				"pdr_morris_bay_lookout_04"
			},
			sound_events_duration = {
				1.8862500190735,
				3.7056040763855,
				2.204437494278,
				5.7449793815613
			}
		},
		pdr_morris_bay_stranded_ships = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pdr_morris_bay_stranded_ships_01",
				"pdr_morris_bay_stranded_ships_02",
				"pdr_morris_bay_stranded_ships_03",
				"pdr_morris_bay_stranded_ships_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_bay_stranded_ships_01",
				"pdr_morris_bay_stranded_ships_02",
				"pdr_morris_bay_stranded_ships_03",
				"pdr_morris_bay_stranded_ships_04"
			},
			sound_events_duration = {
				3.3336458206177,
				3.0277707576752,
				2.8716459274292,
				4.184166431427
			}
		},
		pes_morris_bay_cursed_shore = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pes_morris_bay_cursed_shore_01",
				"pes_morris_bay_cursed_shore_02",
				"pes_morris_bay_cursed_shore_03",
				"pes_morris_bay_cursed_shore_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_bay_cursed_shore_01",
				"pes_morris_bay_cursed_shore_02",
				"pes_morris_bay_cursed_shore_03",
				"pes_morris_bay_cursed_shore_04"
			},
			sound_events_duration = {
				2.588187456131,
				2.7704374790192,
				3.3160624504089,
				2.6416873931885
			}
		},
		pes_morris_bay_ice_cave = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pes_morris_bay_ice_cave_01",
				"pes_morris_bay_ice_cave_02",
				"pes_morris_bay_ice_cave_03",
				"pes_morris_bay_ice_cave_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_bay_ice_cave_01",
				"pes_morris_bay_ice_cave_02",
				"pes_morris_bay_ice_cave_03",
				"pes_morris_bay_ice_cave_04"
			},
			sound_events_duration = {
				3.2043957710266,
				2.2327499389648,
				3.7989583015442,
				3.096583366394
			}
		},
		pes_morris_bay_lookout = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pes_morris_bay_lookout_01",
				"pes_morris_bay_lookout_02",
				"pes_morris_bay_lookout_03",
				"pes_morris_bay_lookout_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_bay_lookout_01",
				"pes_morris_bay_lookout_02",
				"pes_morris_bay_lookout_03",
				"pes_morris_bay_lookout_04"
			},
			sound_events_duration = {
				1.9696041345596,
				1.8970416784286,
				1.8751457929611,
				2.3438959121704
			}
		},
		pes_morris_bay_stranded_ships = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pes_morris_bay_stranded_ships_01",
				"pes_morris_bay_stranded_ships_02",
				"pes_morris_bay_stranded_ships_03",
				"pes_morris_bay_stranded_ships_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_bay_stranded_ships_01",
				"pes_morris_bay_stranded_ships_02",
				"pes_morris_bay_stranded_ships_03",
				"pes_morris_bay_stranded_ships_04"
			},
			sound_events_duration = {
				1.8379583358765,
				3.4898958206177,
				3.2014374732971,
				2.5960416793823
			}
		},
		pwe_morris_bay_cursed_shore = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pwe_morris_bay_cursed_shore_01",
				"pwe_morris_bay_cursed_shore_02",
				"pwe_morris_bay_cursed_shore_03",
				"pwe_morris_bay_cursed_shore_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_bay_cursed_shore_01",
				"pwe_morris_bay_cursed_shore_02",
				"pwe_morris_bay_cursed_shore_03",
				"pwe_morris_bay_cursed_shore_04"
			},
			sound_events_duration = {
				3.5139167308807,
				4.4735832214356,
				3.9518332481384,
				5.3734169006348
			}
		},
		pwe_morris_bay_ice_cave = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pwe_morris_bay_ice_cave_01",
				"pwe_morris_bay_ice_cave_02",
				"pwe_morris_bay_ice_cave_03",
				"pwe_morris_bay_ice_cave_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_bay_ice_cave_01",
				"pwe_morris_bay_ice_cave_02",
				"pwe_morris_bay_ice_cave_03",
				"pwe_morris_bay_ice_cave_04"
			},
			sound_events_duration = {
				3.3687915802002,
				2.8229999542236,
				3.4326770305634,
				4.2350831031799
			}
		},
		pwe_morris_bay_lookout = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pwe_morris_bay_lookout_01",
				"pwe_morris_bay_lookout_02",
				"pwe_morris_bay_lookout_03",
				"pwe_morris_bay_lookout_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_bay_lookout_01",
				"pwe_morris_bay_lookout_02",
				"pwe_morris_bay_lookout_03",
				"pwe_morris_bay_lookout_04"
			},
			sound_events_duration = {
				1.922354221344,
				3.3017499446869,
				2.6729791164398,
				4.3874373435974
			}
		},
		pwe_morris_bay_stranded_ships = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pwe_morris_bay_stranded_ships_01",
				"pwe_morris_bay_stranded_ships_02",
				"pwe_morris_bay_stranded_ships_03",
				"pwe_morris_bay_stranded_ships_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_bay_stranded_ships_01",
				"pwe_morris_bay_stranded_ships_02",
				"pwe_morris_bay_stranded_ships_03",
				"pwe_morris_bay_stranded_ships_04"
			},
			sound_events_duration = {
				3.5753540992737,
				3.2269582748413,
				2.8577916622162,
				2.8251042366028
			}
		},
		pwh_morris_bay_cursed_shore = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pwh_morris_bay_cursed_shore_01",
				"pwh_morris_bay_cursed_shore_02",
				"pwh_morris_bay_cursed_shore_03",
				"pwh_morris_bay_cursed_shore_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_bay_cursed_shore_01",
				"pwh_morris_bay_cursed_shore_02",
				"pwh_morris_bay_cursed_shore_03",
				"pwh_morris_bay_cursed_shore_04"
			},
			sound_events_duration = {
				2.772479057312,
				3.3784999847412,
				4.537145614624,
				5.9396042823792
			}
		},
		pwh_morris_bay_ice_cave = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pwh_morris_bay_ice_cave_01",
				"pwh_morris_bay_ice_cave_02",
				"pwh_morris_bay_ice_cave_03",
				"pwh_morris_bay_ice_cave_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_bay_ice_cave_01",
				"pwh_morris_bay_ice_cave_02",
				"pwh_morris_bay_ice_cave_03",
				"pwh_morris_bay_ice_cave_04"
			},
			sound_events_duration = {
				2.9079167842865,
				3.1714792251587,
				1.3912082910538,
				3.5008542537689
			}
		},
		pwh_morris_bay_lookout = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pwh_morris_bay_lookout_01",
				"pwh_morris_bay_lookout_02",
				"pwh_morris_bay_lookout_03",
				"pwh_morris_bay_lookout_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_bay_lookout_01",
				"pwh_morris_bay_lookout_02",
				"pwh_morris_bay_lookout_03",
				"pwh_morris_bay_lookout_04"
			},
			sound_events_duration = {
				4.1079998016357,
				3.7304792404175,
				4.1739373207092,
				2.9431042671204
			}
		},
		pwh_morris_bay_stranded_ships = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_bay",
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
				"pwh_morris_bay_stranded_ships_01",
				"pwh_morris_bay_stranded_ships_02",
				"pwh_morris_bay_stranded_ships_03",
				"pwh_morris_bay_stranded_ships_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_bay_stranded_ships_01",
				"pwh_morris_bay_stranded_ships_02",
				"pwh_morris_bay_stranded_ships_03",
				"pwh_morris_bay_stranded_ships_04"
			},
			sound_events_duration = {
				5.4642081260681,
				3.8555624485016,
				4.5096249580383,
				2.9294166564941
			}
		}
	})
end
