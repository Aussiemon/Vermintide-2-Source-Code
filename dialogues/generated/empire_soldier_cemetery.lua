return function ()
	define_rule({
		name = "pes_cemetary_intro",
		response = "pes_cemetary_intro",
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
		name = "pes_cemetary_intro_b",
		response = "pes_cemetary_intro_b",
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
				"empire_soldier"
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
		name = "pes_cemetary_intro_c",
		response = "pes_cemetary_intro_c",
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
				"empire_soldier"
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
	define_rule({
		name = "pes_objective_cemetery_bringing_down_first_attachment",
		response = "pes_objective_cemetery_bringing_down_first_attachment",
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
		name = "pes_objective_cemetery_bringing_down_fourth_attachment",
		response = "pes_objective_cemetery_bringing_down_fourth_attachment",
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
		name = "pes_objective_cemetery_bringing_down_second_attachment",
		response = "pes_objective_cemetery_bringing_down_second_attachment",
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
		name = "pes_objective_cemetery_bringing_down_third_attachment",
		response = "pes_objective_cemetery_bringing_down_third_attachment",
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
		name = "pes_objective_cemetery_destroyed_plague_cauldron",
		response = "pes_objective_cemetery_destroyed_plague_cauldron",
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
		name = "pes_objective_cemetery_spotting_crypt_maze",
		response = "pes_objective_cemetery_spotting_crypt_maze",
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
		name = "pes_objective_cemetery_spotting_graveyard",
		response = "pes_objective_cemetery_spotting_graveyard",
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
		name = "pes_objective_cemetery_spotting_hedge_maze",
		response = "pes_objective_cemetery_spotting_hedge_maze",
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
		name = "pes_objective_cemetery_spotting_mausoleum",
		response = "pes_objective_cemetery_spotting_mausoleum",
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
		name = "pes_objective_cemetery_spotting_plague_brew_stains",
		response = "pes_objective_cemetery_spotting_plague_brew_stains",
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
		name = "pes_objective_cemetery_spotting_plague_cauldron",
		response = "pes_objective_cemetery_spotting_plague_cauldron",
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
		name = "pes_objective_cemetery_spotting_plague_pyre",
		response = "pes_objective_cemetery_spotting_plague_pyre",
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
		name = "pes_objective_cemetery_spotting_skaven_tunnels",
		response = "pes_objective_cemetery_spotting_skaven_tunnels",
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
		name = "pes_objective_cemetery_spotting_the_attachements",
		response = "pes_objective_cemetery_spotting_the_attachements",
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
		name = "pes_objective_cemetery_spotting_victim",
		response = "pes_objective_cemetery_spotting_victim",
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
		name = "pes_objective_cemetery_through_crypt_a",
		response = "pes_objective_cemetery_through_crypt_a",
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
		name = "pes_objective_cemetery_through_crypt_b",
		response = "pes_objective_cemetery_through_crypt_b",
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
		name = "pes_objective_cemetery_through_crypt_c",
		response = "pes_objective_cemetery_through_crypt_c",
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
		name = "pes_ojective_cemetery_done",
		response = "pes_ojective_cemetery_done",
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
	add_dialogues({
		pes_cemetary_intro = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_cemetery",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_cemetary_intro_a_01"
			},
			sound_events = {
				[1.0] = "pes_cemetary_intro_a_01"
			},
			sound_events_duration = {
				[1.0] = 3.4714999198914
			}
		},
		pes_cemetary_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_cemetery",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_cemetary_intro_b_01",
				[2.0] = "pes_cemetary_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_cemetary_intro_b_01",
				[2.0] = "pes_cemetary_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.0939373970032,
				[2.0] = 4.2468543052673
			}
		},
		pes_cemetary_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_cemetery",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_cemetary_intro_c_01",
				[2.0] = "pes_cemetary_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_cemetary_intro_c_01",
				[2.0] = "pes_cemetary_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.5179581642151,
				[2.0] = 3.3482084274292
			}
		},
		pes_objective_cemetery_bringing_down_first_attachment = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_bringing_down_first_attachment_01",
				"pes_objective_cemetery_bringing_down_first_attachment_02",
				"pes_objective_cemetery_bringing_down_first_attachment_03",
				"pes_objective_cemetery_bringing_down_first_attachment_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_bringing_down_first_attachment_01",
				"pes_objective_cemetery_bringing_down_first_attachment_02",
				"pes_objective_cemetery_bringing_down_first_attachment_03",
				"pes_objective_cemetery_bringing_down_first_attachment_04"
			},
			sound_events_duration = {
				1.1573749780655,
				1.576708316803,
				1.0287708044052,
				0.81631249189377
			}
		},
		pes_objective_cemetery_bringing_down_fourth_attachment = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_bringing_down_fourth_attachment_01",
				"pes_objective_cemetery_bringing_down_fourth_attachment_02",
				"pes_objective_cemetery_bringing_down_fourth_attachment_03",
				"pes_objective_cemetery_bringing_down_fourth_attachment_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_bringing_down_fourth_attachment_01",
				"pes_objective_cemetery_bringing_down_fourth_attachment_02",
				"pes_objective_cemetery_bringing_down_fourth_attachment_03",
				"pes_objective_cemetery_bringing_down_fourth_attachment_04"
			},
			sound_events_duration = {
				2.2811875343323,
				1.375416636467,
				2.1302499771118,
				3.1478333473206
			}
		},
		pes_objective_cemetery_bringing_down_second_attachment = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_bringing_down_second_attachment_01",
				"pes_objective_cemetery_bringing_down_second_attachment_02",
				"pes_objective_cemetery_bringing_down_second_attachment_03",
				"pes_objective_cemetery_bringing_down_second_attachment_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_bringing_down_second_attachment_01",
				"pes_objective_cemetery_bringing_down_second_attachment_02",
				"pes_objective_cemetery_bringing_down_second_attachment_03",
				"pes_objective_cemetery_bringing_down_second_attachment_04"
			},
			sound_events_duration = {
				0.68210417032242,
				1.3616042137146,
				1.5386667251587,
				1.3307083845139
			}
		},
		pes_objective_cemetery_bringing_down_third_attachment = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_bringing_down_third_attachment_01",
				"pes_objective_cemetery_bringing_down_third_attachment_02",
				"pes_objective_cemetery_bringing_down_third_attachment_03",
				"pes_objective_cemetery_bringing_down_third_attachment_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_bringing_down_third_attachment_01",
				"pes_objective_cemetery_bringing_down_third_attachment_02",
				"pes_objective_cemetery_bringing_down_third_attachment_03",
				"pes_objective_cemetery_bringing_down_third_attachment_04"
			},
			sound_events_duration = {
				1.1909166574478,
				1.2132707834244,
				1.3181666135788,
				1
			}
		},
		pes_objective_cemetery_destroyed_plague_cauldron = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_destroyed_plague_cauldron_01",
				"pes_objective_cemetery_destroyed_plague_cauldron_02",
				"pes_objective_cemetery_destroyed_plague_cauldron_03",
				"pes_objective_cemetery_destroyed_plague_cauldron_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_destroyed_plague_cauldron_01",
				"pes_objective_cemetery_destroyed_plague_cauldron_02",
				"pes_objective_cemetery_destroyed_plague_cauldron_03",
				"pes_objective_cemetery_destroyed_plague_cauldron_04"
			},
			sound_events_duration = {
				1.7552291154861,
				1.7261667251587,
				1.8289583921433,
				2.2134582996368
			}
		},
		pes_objective_cemetery_spotting_crypt_maze = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_crypt_maze_01",
				"pes_objective_cemetery_spotting_crypt_maze_02",
				"pes_objective_cemetery_spotting_crypt_maze_03",
				"pes_objective_cemetery_spotting_crypt_maze_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_crypt_maze_01",
				"pes_objective_cemetery_spotting_crypt_maze_02",
				"pes_objective_cemetery_spotting_crypt_maze_03",
				"pes_objective_cemetery_spotting_crypt_maze_04"
			},
			sound_events_duration = {
				2.9355626106262,
				1.5438333749771,
				2.87535405159,
				2.460520863533
			}
		},
		pes_objective_cemetery_spotting_graveyard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_graveyard_01",
				"pes_objective_cemetery_spotting_graveyard_02",
				"pes_objective_cemetery_spotting_graveyard_03",
				"pes_objective_cemetery_spotting_graveyard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_graveyard_01",
				"pes_objective_cemetery_spotting_graveyard_02",
				"pes_objective_cemetery_spotting_graveyard_03",
				"pes_objective_cemetery_spotting_graveyard_04"
			},
			sound_events_duration = {
				3.2077083587647,
				3.8287708759308,
				1.6765208244324,
				2.7650833129883
			}
		},
		pes_objective_cemetery_spotting_hedge_maze = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_hedge_maze_01",
				"pes_objective_cemetery_spotting_hedge_maze_02",
				"pes_objective_cemetery_spotting_hedge_maze_03",
				"pes_objective_cemetery_spotting_hedge_maze_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_hedge_maze_01",
				"pes_objective_cemetery_spotting_hedge_maze_02",
				"pes_objective_cemetery_spotting_hedge_maze_03",
				"pes_objective_cemetery_spotting_hedge_maze_04"
			},
			sound_events_duration = {
				2.1310937404633,
				3.3410832881927,
				2.302812576294,
				1.7296249866486
			}
		},
		pes_objective_cemetery_spotting_mausoleum = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_mausoleum_01",
				"pes_objective_cemetery_spotting_mausoleum_02",
				"pes_objective_cemetery_spotting_mausoleum_03",
				"pes_objective_cemetery_spotting_mausoleum_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_mausoleum_01",
				"pes_objective_cemetery_spotting_mausoleum_02",
				"pes_objective_cemetery_spotting_mausoleum_03",
				"pes_objective_cemetery_spotting_mausoleum_04"
			},
			sound_events_duration = {
				3.1148438453674,
				1.6314582824707,
				3.3796458244324,
				3.4274165630341
			}
		},
		pes_objective_cemetery_spotting_plague_brew_stains = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_plague_brew_stains_01",
				"pes_objective_cemetery_spotting_plague_brew_stains_02",
				"pes_objective_cemetery_spotting_plague_brew_stains_03",
				"pes_objective_cemetery_spotting_plague_brew_stains_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_plague_brew_stains_01",
				"pes_objective_cemetery_spotting_plague_brew_stains_02",
				"pes_objective_cemetery_spotting_plague_brew_stains_03",
				"pes_objective_cemetery_spotting_plague_brew_stains_04"
			},
			sound_events_duration = {
				2.7720000743866,
				2.9019792079926,
				2.3257708549499,
				3.9468333721161
			}
		},
		pes_objective_cemetery_spotting_plague_cauldron = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_plague_cauldron_01",
				"pes_objective_cemetery_spotting_plague_cauldron_02",
				"pes_objective_cemetery_spotting_plague_cauldron_03",
				"pes_objective_cemetery_spotting_plague_cauldron_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_plague_cauldron_01",
				"pes_objective_cemetery_spotting_plague_cauldron_02",
				"pes_objective_cemetery_spotting_plague_cauldron_03",
				"pes_objective_cemetery_spotting_plague_cauldron_04"
			},
			sound_events_duration = {
				2.6380832195282,
				3.5672708749771,
				2.8687915802002,
				2.1164999008179
			}
		},
		pes_objective_cemetery_spotting_plague_pyre = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_plague_pyre_01",
				"pes_objective_cemetery_spotting_plague_pyre_02",
				"pes_objective_cemetery_spotting_plague_pyre_03",
				"pes_objective_cemetery_spotting_plague_pyre_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_plague_pyre_01",
				"pes_objective_cemetery_spotting_plague_pyre_02",
				"pes_objective_cemetery_spotting_plague_pyre_03",
				"pes_objective_cemetery_spotting_plague_pyre_04"
			},
			sound_events_duration = {
				2.3654792308807,
				3.2814373970032,
				2.0645937919617,
				2.2223541736603
			}
		},
		pes_objective_cemetery_spotting_skaven_tunnels = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_skaven_tunnels_01",
				"pes_objective_cemetery_spotting_skaven_tunnels_02",
				"pes_objective_cemetery_spotting_skaven_tunnels_03",
				"pes_objective_cemetery_spotting_skaven_tunnels_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_skaven_tunnels_01",
				"pes_objective_cemetery_spotting_skaven_tunnels_02",
				"pes_objective_cemetery_spotting_skaven_tunnels_03",
				"pes_objective_cemetery_spotting_skaven_tunnels_04"
			},
			sound_events_duration = {
				2.1041874885559,
				2.020124912262,
				2.4000000953674,
				3.4915729761124
			}
		},
		pes_objective_cemetery_spotting_the_attachements = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_the_attachements_01",
				"pes_objective_cemetery_spotting_the_attachements_02",
				"pes_objective_cemetery_spotting_the_attachements_03",
				"pes_objective_cemetery_spotting_the_attachements_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_the_attachements_01",
				"pes_objective_cemetery_spotting_the_attachements_02",
				"pes_objective_cemetery_spotting_the_attachements_03",
				"pes_objective_cemetery_spotting_the_attachements_04"
			},
			sound_events_duration = {
				1.8115208148956,
				1.9513332843781,
				1.2636041641235,
				2.4992499351502
			}
		},
		pes_objective_cemetery_spotting_victim = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_spotting_victim_01",
				"pes_objective_cemetery_spotting_victim_02",
				"pes_objective_cemetery_spotting_victim_03",
				"pes_objective_cemetery_spotting_victim_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_spotting_victim_01",
				"pes_objective_cemetery_spotting_victim_02",
				"pes_objective_cemetery_spotting_victim_03",
				"pes_objective_cemetery_spotting_victim_04"
			},
			sound_events_duration = {
				3.430520772934,
				2.3811666965485,
				2.5645415782928,
				2.9735417366028
			}
		},
		pes_objective_cemetery_through_crypt_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_through_crypt_a_01",
				"pes_objective_cemetery_through_crypt_a_02",
				"pes_objective_cemetery_through_crypt_a_03",
				"pes_objective_cemetery_through_crypt_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_through_crypt_a_01",
				"pes_objective_cemetery_through_crypt_a_02",
				"pes_objective_cemetery_through_crypt_a_03",
				"pes_objective_cemetery_through_crypt_a_04"
			},
			sound_events_duration = {
				1.7220833301544,
				2.3580832481384,
				3.1558853387833,
				2.9679374694824
			}
		},
		pes_objective_cemetery_through_crypt_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_through_crypt_b_01",
				"pes_objective_cemetery_through_crypt_b_02",
				"pes_objective_cemetery_through_crypt_b_03",
				"pes_objective_cemetery_through_crypt_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_through_crypt_b_01",
				"pes_objective_cemetery_through_crypt_b_02",
				"pes_objective_cemetery_through_crypt_b_03",
				"pes_objective_cemetery_through_crypt_b_04"
			},
			sound_events_duration = {
				1.1000000238419,
				0.90327084064484,
				1.1698750257492,
				1.2792916297913
			}
		},
		pes_objective_cemetery_through_crypt_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_cemetery_through_crypt_c_01",
				"pes_objective_cemetery_through_crypt_c_02",
				"pes_objective_cemetery_through_crypt_c_03",
				"pes_objective_cemetery_through_crypt_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_cemetery_through_crypt_c_01",
				"pes_objective_cemetery_through_crypt_c_02",
				"pes_objective_cemetery_through_crypt_c_03",
				"pes_objective_cemetery_through_crypt_c_04"
			},
			sound_events_duration = {
				1.4933124780655,
				1.1842708587647,
				1.1790416240692,
				1.7245833873749
			}
		},
		pes_ojective_cemetery_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_cemetery",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_ojective_cemetary_done_01",
				"pes_ojective_cemetary_done_02",
				"pes_ojective_cemetary_done_03",
				"pes_ojective_cemetary_done_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_ojective_cemetary_done_01",
				"pes_ojective_cemetary_done_02",
				"pes_ojective_cemetary_done_03",
				"pes_ojective_cemetary_done_04"
			},
			sound_events_duration = {
				4.7245206832886,
				3.9865000247955,
				3.0751249790192,
				6.2564997673035
			}
		}
	})
end
