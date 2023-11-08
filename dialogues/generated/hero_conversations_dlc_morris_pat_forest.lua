return function ()
	define_rule({
		name = "pbw_morris_forest_beacons",
		response = "pbw_morris_forest_beacons",
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
				"pat_forest_beacons"
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
				"pbw_morris_forest_beacons",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_forest_beacons",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_forest_chaos_star",
		response = "pbw_morris_forest_chaos_star",
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
				"pat_forest_chaos_star"
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
				"pbw_morris_forest_chaos_star",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_forest_chaos_star",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_forest_mine",
		response = "pbw_morris_forest_mine",
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
				"pat_forest_mine"
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
				"pbw_morris_forest_mine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_forest_mine",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_forest_river",
		response = "pbw_morris_forest_river",
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
				"pat_forest_river"
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
				"pbw_morris_forest_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_forest_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_forest_skulls",
		response = "pbw_morris_forest_skulls",
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
				"pat_forest_skulls"
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
				"pbw_morris_forest_skulls",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_forest_skulls",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_forest_beacons",
		response = "pdr_morris_forest_beacons",
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
				"pat_forest_beacons"
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
				"pdr_morris_forest_beacons",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_forest_beacons",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_forest_chaos_star",
		response = "pdr_morris_forest_chaos_star",
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
				"pat_forest_chaos_star"
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
				"pdr_morris_forest_chaos_star",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_forest_chaos_star",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_forest_mine",
		response = "pdr_morris_forest_mine",
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
				"pat_forest_mine"
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
				"pdr_morris_forest_mine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_forest_mine",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_forest_river",
		response = "pdr_morris_forest_river",
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
				"pat_forest_river"
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
				"pdr_morris_forest_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_forest_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_forest_skulls",
		response = "pdr_morris_forest_skulls",
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
				"pat_forest_skulls"
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
				"pdr_morris_forest_skulls",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_forest_skulls",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_forest_beacons",
		response = "pes_morris_forest_beacons",
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
				"pat_forest_beacons"
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
				"pes_morris_forest_beacons",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_forest_beacons",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_forest_chaos_star",
		response = "pes_morris_forest_chaos_star",
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
				"pat_forest_chaos_star"
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
				"pes_morris_forest_chaos_star",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_forest_chaos_star",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_forest_mine",
		response = "pes_morris_forest_mine",
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
				"pat_forest_mine"
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
				"pes_morris_forest_mine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_forest_mine",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_forest_river",
		response = "pes_morris_forest_river",
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
				"pat_forest_river"
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
				"pes_morris_forest_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_forest_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_forest_skulls",
		response = "pes_morris_forest_skulls",
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
				"pat_forest_skulls"
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
				"pes_morris_forest_skulls",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_forest_skulls",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_forest_beacons",
		response = "pwe_morris_forest_beacons",
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
				"pat_forest_beacons"
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
				"pwe_morris_forest_beacons",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_forest_beacons",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_forest_chaos_star",
		response = "pwe_morris_forest_chaos_star",
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
				"pat_forest_chaos_star"
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
				"pwe_morris_forest_chaos_star",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_forest_chaos_star",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_forest_mine",
		response = "pwe_morris_forest_mine",
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
				"pat_forest_mine"
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
				"pwe_morris_forest_mine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_forest_mine",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_forest_river",
		response = "pwe_morris_forest_river",
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
				"pat_forest_river"
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
				"pwe_morris_forest_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_forest_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_forest_skulls",
		response = "pwe_morris_forest_skulls",
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
				"pat_forest_skulls"
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
				"pwe_morris_forest_skulls",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_forest_skulls",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_forest_beacons",
		response = "pwh_morris_forest_beacons",
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
				"pat_forest_beacons"
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
				"pwh_morris_forest_beacons",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_forest_beacons",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_forest_chaos_star",
		response = "pwh_morris_forest_chaos_star",
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
				"pat_forest_chaos_star"
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
				"pwh_morris_forest_chaos_star",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_forest_chaos_star",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_forest_mine",
		response = "pwh_morris_forest_mine",
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
				"pat_forest_mine"
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
				"pwh_morris_forest_mine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_forest_mine",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_forest_river",
		response = "pwh_morris_forest_river",
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
				"pat_forest_river"
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
				"pwh_morris_forest_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_forest_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_forest_skulls",
		response = "pwh_morris_forest_skulls",
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
				"pat_forest_skulls"
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
				"pwh_morris_forest_skulls",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_forest_skulls",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_forest_beacons = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pbw_morris_forest_beacons_01",
				"pbw_morris_forest_beacons_02",
				"pbw_morris_forest_beacons_03",
				"pbw_morris_forest_beacons_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_forest_beacons_01",
				"pbw_morris_forest_beacons_02",
				"pbw_morris_forest_beacons_03",
				"pbw_morris_forest_beacons_04"
			},
			sound_events_duration = {
				2.5586667060852,
				2.9077708721161,
				3.681583404541,
				4.4273543357849
			}
		},
		pbw_morris_forest_chaos_star = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pbw_morris_forest_chaos_star_01",
				"pbw_morris_forest_chaos_star_02",
				"pbw_morris_forest_chaos_star_03",
				"pbw_morris_forest_chaos_star_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_forest_chaos_star_01",
				"pbw_morris_forest_chaos_star_02",
				"pbw_morris_forest_chaos_star_03",
				"pbw_morris_forest_chaos_star_04"
			},
			sound_events_duration = {
				4.6887707710266,
				5.7220001220703,
				3.4945833683014,
				3.7216041088104
			}
		},
		pbw_morris_forest_mine = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pbw_morris_forest_mine_01",
				"pbw_morris_forest_mine_02",
				"pbw_morris_forest_mine_03",
				"pbw_morris_forest_mine_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_forest_mine_01",
				"pbw_morris_forest_mine_02",
				"pbw_morris_forest_mine_03",
				"pbw_morris_forest_mine_04"
			},
			sound_events_duration = {
				2.0871458053589,
				4.5999999046326,
				3.8619582653046,
				2.9277083873749
			}
		},
		pbw_morris_forest_river = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pbw_morris_forest_river_01",
				"pbw_morris_forest_river_02",
				"pbw_morris_forest_river_03",
				"pbw_morris_forest_river_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_forest_river_01",
				"pbw_morris_forest_river_02",
				"pbw_morris_forest_river_03",
				"pbw_morris_forest_river_04"
			},
			sound_events_duration = {
				1.936979174614,
				3.1557500362396,
				4.5122289657593,
				2.4852917194366
			}
		},
		pbw_morris_forest_skulls = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pbw_morris_forest_skulls_01",
				"pbw_morris_forest_skulls_02",
				"pbw_morris_forest_skulls_03",
				"pbw_morris_forest_skulls_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_forest_skulls_01",
				"pbw_morris_forest_skulls_02",
				"pbw_morris_forest_skulls_03",
				"pbw_morris_forest_skulls_04"
			},
			sound_events_duration = {
				3.9222707748413,
				3.4333124160767,
				3.9297082424164,
				3.9055416584015
			}
		},
		pdr_morris_forest_beacons = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pdr_morris_forest_beacons_01",
				"pdr_morris_forest_beacons_02",
				"pdr_morris_forest_beacons_03",
				"pdr_morris_forest_beacons_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_forest_beacons_01",
				"pdr_morris_forest_beacons_02",
				"pdr_morris_forest_beacons_03",
				"pdr_morris_forest_beacons_04"
			},
			sound_events_duration = {
				4.1300835609436,
				3.8546042442322,
				4.0797710418701,
				3.6292917728424
			}
		},
		pdr_morris_forest_chaos_star = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pdr_morris_forest_chaos_star_01",
				"pdr_morris_forest_chaos_star_02",
				"pdr_morris_forest_chaos_star_03",
				"pdr_morris_forest_chaos_star_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_forest_chaos_star_01",
				"pdr_morris_forest_chaos_star_02",
				"pdr_morris_forest_chaos_star_03",
				"pdr_morris_forest_chaos_star_04"
			},
			sound_events_duration = {
				3.8779165744781,
				2.4876248836517,
				4.0248332023621,
				2.1322500705719
			}
		},
		pdr_morris_forest_mine = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pdr_morris_forest_mine_01",
				"pdr_morris_forest_mine_02",
				"pdr_morris_forest_mine_03",
				"pdr_morris_forest_mine_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_forest_mine_01",
				"pdr_morris_forest_mine_02",
				"pdr_morris_forest_mine_03",
				"pdr_morris_forest_mine_04"
			},
			sound_events_duration = {
				3.7661249637604,
				2.9858958721161,
				3.3955624103546,
				3.891562461853
			}
		},
		pdr_morris_forest_river = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pdr_morris_forest_river_01",
				"pdr_morris_forest_river_02",
				"pdr_morris_forest_river_03",
				"pdr_morris_forest_river_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_forest_river_01",
				"pdr_morris_forest_river_02",
				"pdr_morris_forest_river_03",
				"pdr_morris_forest_river_04"
			},
			sound_events_duration = {
				4.876416683197,
				2.3422501087189,
				1.6824375391007,
				2.5715000629425
			}
		},
		pdr_morris_forest_skulls = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pdr_morris_forest_skulls_01",
				"pdr_morris_forest_skulls_02",
				"pdr_morris_forest_skulls_03",
				"pdr_morris_forest_skulls_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_forest_skulls_01",
				"pdr_morris_forest_skulls_02",
				"pdr_morris_forest_skulls_03",
				"pdr_morris_forest_skulls_04"
			},
			sound_events_duration = {
				1.7386875152588,
				3.8082082271576,
				5.2282085418701,
				2.2489166259766
			}
		},
		pes_morris_forest_beacons = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pes_morris_forest_beacons_01",
				"pes_morris_forest_beacons_02",
				"pes_morris_forest_beacons_03",
				"pes_morris_forest_beacons_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_forest_beacons_01",
				"pes_morris_forest_beacons_02",
				"pes_morris_forest_beacons_03",
				"pes_morris_forest_beacons_04"
			},
			sound_events_duration = {
				4.4790625572205,
				2.6101458072662,
				2.9400832653046,
				2.4631667137146
			}
		},
		pes_morris_forest_chaos_star = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pes_morris_forest_chaos_star_01",
				"pes_morris_forest_chaos_star_02",
				"pes_morris_forest_chaos_star_03",
				"pes_morris_forest_chaos_star_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_forest_chaos_star_01",
				"pes_morris_forest_chaos_star_02",
				"pes_morris_forest_chaos_star_03",
				"pes_morris_forest_chaos_star_04"
			},
			sound_events_duration = {
				2.8299791812897,
				4.0529165267944,
				4.7990627288818,
				3.106166601181
			}
		},
		pes_morris_forest_mine = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pes_morris_forest_mine_01",
				"pes_morris_forest_mine_02",
				"pes_morris_forest_mine_03",
				"pes_morris_forest_mine_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_forest_mine_01",
				"pes_morris_forest_mine_02",
				"pes_morris_forest_mine_03",
				"pes_morris_forest_mine_04"
			},
			sound_events_duration = {
				1.2732917070389,
				2.9045207500458,
				1.7422292232513,
				3.4395000934601
			}
		},
		pes_morris_forest_river = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pes_morris_forest_river_01",
				"pes_morris_forest_river_02",
				"pes_morris_forest_river_03",
				"pes_morris_forest_river_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_forest_river_01",
				"pes_morris_forest_river_02",
				"pes_morris_forest_river_03",
				"pes_morris_forest_river_04"
			},
			sound_events_duration = {
				1.8237916231155,
				2.9606459140778,
				1.7102082967758,
				3.1477291584015
			}
		},
		pes_morris_forest_skulls = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pes_morris_forest_skulls_01",
				"pes_morris_forest_skulls_02",
				"pes_morris_forest_skulls_03",
				"pes_morris_forest_skulls_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_forest_skulls_01",
				"pes_morris_forest_skulls_02",
				"pes_morris_forest_skulls_03",
				"pes_morris_forest_skulls_04"
			},
			sound_events_duration = {
				4.8775835037231,
				4.1124377250671,
				4.203125,
				3.6649792194366
			}
		},
		pwe_morris_forest_beacons = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwe_morris_forest_beacons_01",
				"pwe_morris_forest_beacons_02",
				"pwe_morris_forest_beacons_03",
				"pwe_morris_forest_beacons_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_forest_beacons_01",
				"pwe_morris_forest_beacons_02",
				"pwe_morris_forest_beacons_03",
				"pwe_morris_forest_beacons_04"
			},
			sound_events_duration = {
				4.8373332023621,
				5.816520690918,
				3.9366250038147,
				3.8963124752045
			}
		},
		pwe_morris_forest_chaos_star = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwe_morris_forest_chaos_star_01",
				"pwe_morris_forest_chaos_star_02",
				"pwe_morris_forest_chaos_star_03",
				"pwe_morris_forest_chaos_star_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_forest_chaos_star_01",
				"pwe_morris_forest_chaos_star_02",
				"pwe_morris_forest_chaos_star_03",
				"pwe_morris_forest_chaos_star_04"
			},
			sound_events_duration = {
				2.6223957538605,
				4.7572083473206,
				5.1692914962769,
				5.3422498703003
			}
		},
		pwe_morris_forest_mine = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwe_morris_forest_mine_01",
				"pwe_morris_forest_mine_02",
				"pwe_morris_forest_mine_03",
				"pwe_morris_forest_mine_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_forest_mine_01",
				"pwe_morris_forest_mine_02",
				"pwe_morris_forest_mine_03",
				"pwe_morris_forest_mine_04"
			},
			sound_events_duration = {
				2.8664374351502,
				3.4249792098999,
				4.7889790534973,
				3.2803750038147
			}
		},
		pwe_morris_forest_river = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwe_morris_forest_river_01",
				"pwe_morris_forest_river_02",
				"pwe_morris_forest_river_03",
				"pwe_morris_forest_river_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_forest_river_01",
				"pwe_morris_forest_river_02",
				"pwe_morris_forest_river_03",
				"pwe_morris_forest_river_04"
			},
			sound_events_duration = {
				2.3531041145325,
				3.624041557312,
				2.3709583282471,
				2.1396979093552
			}
		},
		pwe_morris_forest_skulls = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwe_morris_forest_skulls_01",
				"pwe_morris_forest_skulls_02",
				"pwe_morris_forest_skulls_03",
				"pwe_morris_forest_skulls_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_forest_skulls_01",
				"pwe_morris_forest_skulls_02",
				"pwe_morris_forest_skulls_03",
				"pwe_morris_forest_skulls_04"
			},
			sound_events_duration = {
				5.4506874084473,
				3.153062582016,
				3.9600625038147,
				4.1498956680298
			}
		},
		pwh_morris_forest_beacons = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwh_morris_forest_beacons_01",
				"pwh_morris_forest_beacons_02",
				"pwh_morris_forest_beacons_03",
				"pwh_morris_forest_beacons_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_forest_beacons_01",
				"pwh_morris_forest_beacons_02",
				"pwh_morris_forest_beacons_03",
				"pwh_morris_forest_beacons_04"
			},
			sound_events_duration = {
				4.0973334312439,
				5.0934376716614,
				2.9523124694824,
				4.7038331031799
			}
		},
		pwh_morris_forest_chaos_star = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwh_morris_forest_chaos_star_01",
				"pwh_morris_forest_chaos_star_02",
				"pwh_morris_forest_chaos_star_03",
				"pwh_morris_forest_chaos_star_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_forest_chaos_star_01",
				"pwh_morris_forest_chaos_star_02",
				"pwh_morris_forest_chaos_star_03",
				"pwh_morris_forest_chaos_star_04"
			},
			sound_events_duration = {
				4.3227915763855,
				4.1078748703003,
				2.6555209159851,
				5.2102918624878
			}
		},
		pwh_morris_forest_mine = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwh_morris_forest_mine_01",
				"pwh_morris_forest_mine_02",
				"pwh_morris_forest_mine_03",
				"pwh_morris_forest_mine_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_forest_mine_01",
				"pwh_morris_forest_mine_02",
				"pwh_morris_forest_mine_03",
				"pwh_morris_forest_mine_04"
			},
			sound_events_duration = {
				3.8502917289734,
				3.5441040992737,
				1.1893124580383,
				2.0569999217987
			}
		},
		pwh_morris_forest_river = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwh_morris_forest_river_01",
				"pwh_morris_forest_river_02",
				"pwh_morris_forest_river_03",
				"pwh_morris_forest_river_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_forest_river_01",
				"pwh_morris_forest_river_02",
				"pwh_morris_forest_river_03",
				"pwh_morris_forest_river_04"
			},
			sound_events_duration = {
				1.426916718483,
				3.8411667346954,
				2.220624923706,
				3.947562456131
			}
		},
		pwh_morris_forest_skulls = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_pat_forest",
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
				"pwh_morris_forest_skulls_01",
				"pwh_morris_forest_skulls_02",
				"pwh_morris_forest_skulls_03",
				"pwh_morris_forest_skulls_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_forest_skulls_01",
				"pwh_morris_forest_skulls_02",
				"pwh_morris_forest_skulls_03",
				"pwh_morris_forest_skulls_04"
			},
			sound_events_duration = {
				2.1961667537689,
				4.4862499237061,
				4.9475626945496,
				5.4028749465942
			}
		}
	})
end
