return function ()
	define_rule({
		name = "pdr_objective_cemetery_through_crypt_a",
		response = "pdr_objective_cemetery_through_crypt_a",
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
				"objective_cemetery_through_crypt_a"
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
				"time_since_objective_cemetery_through_crypt_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_through_crypt_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_mausoleum",
		response = "pdr_objective_cemetery_spotting_mausoleum",
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
				"objective_cemetery_spotting_mausoleum"
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
				"time_since_objective_cemetery_spotting_mausoleum",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_mausoleum",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_plague_brew_stains",
		response = "pdr_objective_cemetery_spotting_plague_brew_stains",
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
				"objective_cemetery_spotting_plague_brew_stains"
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
				"time_since_cemetery_spotting_plague_brew_stains",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_cemetery_spotting_plague_brew_stains",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_crypt_maze",
		response = "pdr_objective_cemetery_spotting_crypt_maze",
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
				"objective_cemetery_spotting_crypt_maze"
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
				"time_since_objective_cemetery_spotting_crypt_maze",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_crypt_maze",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_through_crypt_b",
		response = "pdr_objective_cemetery_through_crypt_b",
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
				"objective_cemetery_through_crypt_b"
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
				"time_since_objective_cemetery_through_crypt_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_through_crypt_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_graveyard",
		response = "pdr_objective_cemetery_spotting_graveyard",
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
				"objective_cemetery_spotting_graveyard"
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
				"time_since_objective_cemetery_spotting_graveyard",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_graveyard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_hedge_maze",
		response = "pdr_objective_cemetery_spotting_hedge_maze",
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
				"objective_cemetery_spotting_hedge_maze"
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
				"time_since_objective_cemetery_spotting_hedge_maze",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_hedge_maze",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_plague_pyre",
		response = "pdr_objective_cemetery_spotting_plague_pyre",
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
				"objective_cemetery_spotting_plague_pyre"
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
				"time_since_objective_cemetery_spotting_plague_pyre",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_plague_pyre",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_through_crypt_c",
		response = "pdr_objective_cemetery_through_crypt_c",
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
				"objective_cemetery_through_crypt_c"
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
				"time_since_objective_cemetery_through_crypt_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_through_crypt_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_skaven_tunnels",
		response = "pdr_objective_cemetery_spotting_skaven_tunnels",
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
				"objective_cemetery_spotting_skaven_tunnel"
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
				"time_since_objective_cemetery_spotting_skaven_tunnel",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_skaven_tunnel",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_plague_cauldron",
		response = "pdr_objective_cemetery_spotting_plague_cauldron",
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
				"objective_cemetery_spotting_plague_cauldron"
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
				"time_since_objective_cemetery_spotting_plague_cauldron",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_plague_cauldron",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_destroyed_plague_cauldron",
		response = "pdr_objective_cemetery_destroyed_plague_cauldron",
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
				"objective_cemetery_destroyed_plague_cauldron"
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
				"time_since_objective_cemetery_destroyed_plague_cauldron",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_destroyed_plague_cauldron",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_victim",
		response = "pdr_objective_cemetery_spotting_victim",
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
				"objective_cemetery_spotting_victim"
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
				"time_since_objective_cemetery_spotting_victim",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_victim",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_bringing_down_first_attachment",
		response = "pdr_objective_cemetery_bringing_down_first_attachment",
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
				"objective_cemetery_bringing_down_first_attachment"
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
				"time_since_objective_cemetery_bringing_down_first_attachment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_bringing_down_first_attachment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_bringing_down_second_attachment",
		response = "pdr_objective_cemetery_bringing_down_second_attachment",
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
				"objective_cemetery_bringing_down_second_attachment"
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
				"time_since_objective_cemetery_bringing_down_second_attachment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_bringing_down_second_attachment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_bringing_down_third_attachment",
		response = "pdr_objective_cemetery_bringing_down_third_attachment",
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
				"objective_cemetery_bringing_down_third_attachment"
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
				"time_since_objective_cemetery_bringing_down_third_attachment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_bringing_down_third_attachment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_bringing_down_fourth_attachment",
		response = "pdr_objective_cemetery_bringing_down_fourth_attachment",
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
				"objective_cemetery_bringing_down_fourth_attachment"
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
				"time_since_objective_cemetery_bringing_down_fourth_attachment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_bringing_down_fourth_attachment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_cemetery_spotting_the_attachements",
		response = "pdr_objective_cemetery_spotting_the_attachements",
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
				"objective_cemetery_spotting_the_attachements"
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
				"time_since_objective_cemetery_spotting_the_attachements",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_the_attachements",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_ojective_cemetery_done",
		response = "pdr_ojective_cemetery_done",
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
				"ojective_cemetery_done"
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
				"time_since_ojective_cemetery_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ojective_cemetery_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_cemetary_intro",
		response = "pdr_cemetary_intro",
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
				"objective_cemetery_intro"
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
				"time_since_cemetary_intro",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_cemetary_intro",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_cemetary_intro_b",
		response = "pdr_cemetary_intro_b",
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
				"cemetary_intro"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_cemetary_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_cemetary_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_cemetary_intro_c",
		response = "pdr_cemetary_intro_c",
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
				"cemetary_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_cemetary_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_cemetary_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pdr_objective_cemetery_spotting_hedge_maze = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_spotting_hedge_maze_01",
				"pdr_objective_cemetery_spotting_hedge_maze_02",
				"pdr_objective_cemetery_spotting_hedge_maze_03",
				"pdr_objective_cemetery_spotting_hedge_maze_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.7759165763855,
				3.1476874351502,
				5.434666633606,
				3.2711665630341
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_hedge_maze_01",
				"pdr_objective_cemetery_spotting_hedge_maze_02",
				"pdr_objective_cemetery_spotting_hedge_maze_03",
				"pdr_objective_cemetery_spotting_hedge_maze_04"
			},
			randomize_indexes = {}
		},
		pdr_cemetary_intro = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_cemetary_intro_a_01",
				[2.0] = "pdr_cemetary_intro_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.902583360672,
				[2.0] = 5.466854095459
			},
			localization_strings = {
				[1.0] = "pdr_cemetary_intro_a_01",
				[2.0] = "pdr_cemetary_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_through_crypt_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_through_crypt_a_01",
				"pdr_objective_cemetery_through_crypt_a_02",
				"pdr_objective_cemetery_through_crypt_a_03",
				"pdr_objective_cemetery_through_crypt_a_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.825291633606,
				4.4430832862854,
				3.6500833034515,
				2.2999999523163
			},
			localization_strings = {
				"pdr_objective_cemetery_through_crypt_a_01",
				"pdr_objective_cemetery_through_crypt_a_02",
				"pdr_objective_cemetery_through_crypt_a_03",
				"pdr_objective_cemetery_through_crypt_a_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_spotting_graveyard = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_spotting_graveyard_01",
				"pdr_objective_cemetery_spotting_graveyard_02",
				"pdr_objective_cemetery_spotting_graveyard_03",
				"pdr_objective_cemetery_spotting_graveyard_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.5208749771118,
				4.2399373054504,
				2.8581249713898,
				3.2858126163483
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_graveyard_01",
				"pdr_objective_cemetery_spotting_graveyard_02",
				"pdr_objective_cemetery_spotting_graveyard_03",
				"pdr_objective_cemetery_spotting_graveyard_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_through_crypt_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_through_crypt_c_01",
				"pdr_objective_cemetery_through_crypt_c_02",
				"pdr_objective_cemetery_through_crypt_c_03",
				"pdr_objective_cemetery_through_crypt_c_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				0.93352085351944,
				3.4674792289734,
				1.7971249818802,
				1.3242083787918
			},
			localization_strings = {
				"pdr_objective_cemetery_through_crypt_c_01",
				"pdr_objective_cemetery_through_crypt_c_02",
				"pdr_objective_cemetery_through_crypt_c_03",
				"pdr_objective_cemetery_through_crypt_c_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_spotting_plague_brew_stains = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_spotting_plague_brew_stains_01",
				"pdr_objective_cemetery_spotting_plague_brew_stains_02",
				"pdr_objective_cemetery_spotting_plague_brew_stains_03",
				"pdr_objective_cemetery_spotting_plague_brew_stains_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.313458442688,
				3.8557500839233,
				3.3989374637604,
				5.937020778656
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_plague_brew_stains_01",
				"pdr_objective_cemetery_spotting_plague_brew_stains_02",
				"pdr_objective_cemetery_spotting_plague_brew_stains_03",
				"pdr_objective_cemetery_spotting_plague_brew_stains_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_spotting_victim = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_spotting_victim_01",
				"pdr_objective_cemetery_spotting_victim_02",
				"pdr_objective_cemetery_spotting_victim_03",
				"pdr_objective_cemetery_spotting_victim_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.6226041316986,
				2.2420833110809,
				3.442583322525,
				2.9597084522247
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_victim_01",
				"pdr_objective_cemetery_spotting_victim_02",
				"pdr_objective_cemetery_spotting_victim_03",
				"pdr_objective_cemetery_spotting_victim_04"
			},
			randomize_indexes = {}
		},
		pdr_cemetary_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_cemetary_intro_c_01",
				[2.0] = "pdr_cemetary_intro_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6826457977295,
				[2.0] = 4.8855624198914
			},
			localization_strings = {
				[1.0] = "pdr_cemetary_intro_c_01",
				[2.0] = "pdr_cemetary_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_spotting_skaven_tunnels = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_spotting_skaven_tunnels_01",
				"pdr_objective_cemetery_spotting_skaven_tunnels_02",
				"pdr_objective_cemetery_spotting_skaven_tunnels_03",
				"pdr_objective_cemetery_spotting_skaven_tunnels_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.1746666431427,
				3.4000000953674,
				3.0302500724792,
				3.4083125591278
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_skaven_tunnels_01",
				"pdr_objective_cemetery_spotting_skaven_tunnels_02",
				"pdr_objective_cemetery_spotting_skaven_tunnels_03",
				"pdr_objective_cemetery_spotting_skaven_tunnels_04"
			},
			randomize_indexes = {}
		},
		pdr_cemetary_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_cemetary_intro_b_01",
				[2.0] = "pdr_cemetary_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7628750801086,
				[2.0] = 3.0167291164398
			},
			localization_strings = {
				[1.0] = "pdr_cemetary_intro_b_01",
				[2.0] = "pdr_cemetary_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_spotting_mausoleum = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_spotting_mausoleum_01",
				"pdr_objective_cemetery_spotting_mausoleum_02",
				"pdr_objective_cemetery_spotting_mausoleum_03",
				"pdr_objective_cemetery_spotting_mausoleum_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.4005625247955,
				4.2041668891907,
				3.7235624790192,
				4.2277917861939
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_mausoleum_01",
				"pdr_objective_cemetery_spotting_mausoleum_02",
				"pdr_objective_cemetery_spotting_mausoleum_03",
				"pdr_objective_cemetery_spotting_mausoleum_04"
			},
			randomize_indexes = {}
		},
		pdr_ojective_cemetery_done = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_ojective_cemetary_done_01",
				"pdr_ojective_cemetary_done_02",
				"pdr_ojective_cemetary_done_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.1315417289734,
				5.4897708892822,
				4.5347290039063
			},
			localization_strings = {
				"pdr_ojective_cemetary_done_01",
				"pdr_ojective_cemetary_done_02",
				"pdr_ojective_cemetary_done_03"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_spotting_the_attachements = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_spotting_the_attachements_01",
				"pdr_objective_cemetery_spotting_the_attachements_02",
				"pdr_objective_cemetery_spotting_the_attachements_03",
				"pdr_objective_cemetery_spotting_the_attachements_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.0275416374206,
				2.5987083911896,
				3.7379999160767,
				4.4406042098999
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_the_attachements_01",
				"pdr_objective_cemetery_spotting_the_attachements_02",
				"pdr_objective_cemetery_spotting_the_attachements_03",
				"pdr_objective_cemetery_spotting_the_attachements_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_spotting_plague_cauldron = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_spotting_plague_cauldron_01",
				"pdr_objective_cemetery_spotting_plague_cauldron_02",
				"pdr_objective_cemetery_spotting_plague_cauldron_03",
				"pdr_objective_cemetery_spotting_plague_cauldron_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				7.1991248130798,
				2.5963749885559,
				4.6206040382385,
				3.5608541965485
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_plague_cauldron_01",
				"pdr_objective_cemetery_spotting_plague_cauldron_02",
				"pdr_objective_cemetery_spotting_plague_cauldron_03",
				"pdr_objective_cemetery_spotting_plague_cauldron_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_spotting_plague_pyre = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_spotting_plague_pyre_01",
				"pdr_objective_cemetery_spotting_plague_pyre_02",
				"pdr_objective_cemetery_spotting_plague_pyre_03",
				"pdr_objective_cemetery_spotting_plague_pyre_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.3466041088104,
				2.4373540878296,
				5.5463333129883,
				4.1946458816528
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_plague_pyre_01",
				"pdr_objective_cemetery_spotting_plague_pyre_02",
				"pdr_objective_cemetery_spotting_plague_pyre_03",
				"pdr_objective_cemetery_spotting_plague_pyre_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_bringing_down_first_attachment = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_bringing_down_first_attachment_01",
				"pdr_objective_cemetery_bringing_down_first_attachment_02",
				"pdr_objective_cemetery_bringing_down_first_attachment_03",
				"pdr_objective_cemetery_bringing_down_first_attachment_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.7107499837875,
				1.1717292070389,
				1.3914166688919,
				1.2924791574478
			},
			localization_strings = {
				"pdr_objective_cemetery_bringing_down_first_attachment_01",
				"pdr_objective_cemetery_bringing_down_first_attachment_02",
				"pdr_objective_cemetery_bringing_down_first_attachment_03",
				"pdr_objective_cemetery_bringing_down_first_attachment_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_bringing_down_second_attachment = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_bringing_down_second_attachment_01",
				"pdr_objective_cemetery_bringing_down_second_attachment_02",
				"pdr_objective_cemetery_bringing_down_second_attachment_03",
				"pdr_objective_cemetery_bringing_down_second_attachment_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.4436458349228,
				2.0574998855591,
				1.3205208778381,
				1.3869166374207
			},
			localization_strings = {
				"pdr_objective_cemetery_bringing_down_second_attachment_01",
				"pdr_objective_cemetery_bringing_down_second_attachment_02",
				"pdr_objective_cemetery_bringing_down_second_attachment_03",
				"pdr_objective_cemetery_bringing_down_second_attachment_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_spotting_crypt_maze = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_objective_cemetery_spotting_crypt_maze_01",
				"pdr_objective_cemetery_spotting_crypt_maze_02",
				"pdr_objective_cemetery_spotting_crypt_maze_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.8040626049042,
				4.5177917480469,
				2.8241875171661
			},
			localization_strings = {
				"pdr_objective_cemetery_spotting_crypt_maze_01",
				"pdr_objective_cemetery_spotting_crypt_maze_02",
				"pdr_objective_cemetery_spotting_crypt_maze_03"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_bringing_down_third_attachment = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_bringing_down_third_attachment_01",
				"pdr_objective_cemetery_bringing_down_third_attachment_02",
				"pdr_objective_cemetery_bringing_down_third_attachment_03",
				"pdr_objective_cemetery_bringing_down_third_attachment_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				1.5747292041779,
				1.7064374685288,
				1.8849583864212,
				1.6134375333786
			},
			localization_strings = {
				"pdr_objective_cemetery_bringing_down_third_attachment_01",
				"pdr_objective_cemetery_bringing_down_third_attachment_02",
				"pdr_objective_cemetery_bringing_down_third_attachment_03",
				"pdr_objective_cemetery_bringing_down_third_attachment_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_destroyed_plague_cauldron = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_destroyed_plague_cauldron_01",
				"pdr_objective_cemetery_destroyed_plague_cauldron_02",
				"pdr_objective_cemetery_destroyed_plague_cauldron_03",
				"pdr_objective_cemetery_destroyed_plague_cauldron_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.3433749675751,
				3.1377499103546,
				2.4828124046326,
				3.0143959522247
			},
			localization_strings = {
				"pdr_objective_cemetery_destroyed_plague_cauldron_01",
				"pdr_objective_cemetery_destroyed_plague_cauldron_02",
				"pdr_objective_cemetery_destroyed_plague_cauldron_03",
				"pdr_objective_cemetery_destroyed_plague_cauldron_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_bringing_down_fourth_attachment = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_bringing_down_fourth_attachment_01",
				"pdr_objective_cemetery_bringing_down_fourth_attachment_02",
				"pdr_objective_cemetery_bringing_down_fourth_attachment_03",
				"pdr_objective_cemetery_bringing_down_fourth_attachment_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.3527500629425,
				1.583208322525,
				3.3105626106262,
				2.5199999809265
			},
			localization_strings = {
				"pdr_objective_cemetery_bringing_down_fourth_attachment_01",
				"pdr_objective_cemetery_bringing_down_fourth_attachment_02",
				"pdr_objective_cemetery_bringing_down_fourth_attachment_03",
				"pdr_objective_cemetery_bringing_down_fourth_attachment_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_cemetery_through_crypt_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_cemetery_through_crypt_b_01",
				"pdr_objective_cemetery_through_crypt_b_02",
				"pdr_objective_cemetery_through_crypt_b_03",
				"pdr_objective_cemetery_through_crypt_b_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.7193124294281,
				7.3811664581299,
				2.9310207366943,
				3.7299375534058
			},
			localization_strings = {
				"pdr_objective_cemetery_through_crypt_b_01",
				"pdr_objective_cemetery_through_crypt_b_02",
				"pdr_objective_cemetery_through_crypt_b_03",
				"pdr_objective_cemetery_through_crypt_b_04"
			},
			randomize_indexes = {}
		}
	})
end
