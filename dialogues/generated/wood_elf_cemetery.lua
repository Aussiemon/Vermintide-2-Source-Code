return function ()
	define_rule({
		name = "pwe_objective_cemetery_through_crypt_a",
		response = "pwe_objective_cemetery_through_crypt_a",
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
		name = "pwe_objective_cemetery_spotting_mausoleum",
		response = "pwe_objective_cemetery_spotting_mausoleum",
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
		name = "pwe_objective_cemetery_spotting_plague_brew_stains",
		response = "pwe_objective_cemetery_spotting_plague_brew_stains",
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
		name = "pwe_objective_cemetery_spotting_crypt_maze",
		response = "pwe_objective_cemetery_spotting_crypt_maze",
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
		name = "pwe_objective_cemetery_through_crypt_b",
		response = "pwe_objective_cemetery_through_crypt_b",
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
		name = "pwe_objective_cemetery_spotting_graveyard",
		response = "pwe_objective_cemetery_spotting_graveyard",
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
		name = "pwe_objective_cemetery_spotting_hedge_maze",
		response = "pwe_objective_cemetery_spotting_hedge_maze",
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
		name = "pwe_objective_cemetery_spotting_plague_pyre",
		response = "pwe_objective_cemetery_spotting_plague_pyre",
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
		name = "pwe_objective_cemetery_through_crypt_c",
		response = "pwe_objective_cemetery_through_crypt_c",
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
		name = "pwe_objective_cemetery_spotting_skaven_tunnels",
		response = "pwe_objective_cemetery_spotting_skaven_tunnels",
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
		name = "pwe_objective_cemetery_spotting_plague_cauldron",
		response = "pwe_objective_cemetery_spotting_plague_cauldron",
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
		name = "pwe_objective_cemetery_destroyed_plague_cauldron",
		response = "pwe_objective_cemetery_destroyed_plague_cauldron",
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
		name = "pwe_objective_cemetery_spotting_victim",
		response = "pwe_objective_cemetery_spotting_victim",
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
		name = "pwe_objective_cemetery_bringing_down_first_attachment",
		response = "pwe_objective_cemetery_bringing_down_first_attachment",
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
		name = "pwe_objective_cemetery_bringing_down_second_attachment",
		response = "pwe_objective_cemetery_bringing_down_second_attachment",
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
		name = "pwe_objective_cemetery_bringing_down_third_attachment",
		response = "pwe_objective_cemetery_bringing_down_third_attachment",
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
		name = "pwe_objective_cemetery_bringing_down_fourth_attachment",
		response = "pwe_objective_cemetery_bringing_down_fourth_attachment",
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
		name = "pwe_objective_cemetery_spotting_the_attachements",
		response = "pwe_objective_cemetery_spotting_the_attachements",
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
		name = "pwe_ojective_cemetery_done",
		response = "pwe_ojective_cemetery_done",
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
		name = "pwe_cemetary_intro",
		response = "pwe_cemetary_intro",
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
		name = "pwe_cemetary_intro_b",
		response = "pwe_cemetary_intro_b",
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
				"wood_elf"
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
		name = "pwe_cemetary_intro_c",
		response = "pwe_cemetary_intro_c",
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
				"wood_elf"
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
		pwe_objective_cemetery_spotting_hedge_maze = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_hedge_maze_01",
				"pwe_objective_cemetery_spotting_hedge_maze_02",
				"pwe_objective_cemetery_spotting_hedge_maze_03",
				"pwe_objective_cemetery_spotting_hedge_maze_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_hedge_maze_01",
				"pwe_objective_cemetery_spotting_hedge_maze_02",
				"pwe_objective_cemetery_spotting_hedge_maze_03",
				"pwe_objective_cemetery_spotting_hedge_maze_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.502833366394,
				3.0448124408722,
				3.424708366394,
				4.4712080955505
			}
		},
		pwe_objective_cemetery_through_crypt_c = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_through_crypt_c_01",
				"pwe_objective_cemetery_through_crypt_c_02",
				"pwe_objective_cemetery_through_crypt_c_03",
				"pwe_objective_cemetery_through_crypt_c_04"
			},
			sound_events = {
				"pwe_objective_cemetery_through_crypt_c_01",
				"pwe_objective_cemetery_through_crypt_c_02",
				"pwe_objective_cemetery_through_crypt_c_03",
				"pwe_objective_cemetery_through_crypt_c_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.2000000476837,
				2.8582708835602,
				1.7346041202545,
				0.95416665077209
			}
		},
		pwe_objective_cemetery_spotting_skaven_tunnels = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_skaven_tunnels_01",
				"pwe_objective_cemetery_spotting_skaven_tunnels_02",
				"pwe_objective_cemetery_spotting_skaven_tunnels_03",
				"pwe_objective_cemetery_spotting_skaven_tunnels_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_skaven_tunnels_01",
				"pwe_objective_cemetery_spotting_skaven_tunnels_02",
				"pwe_objective_cemetery_spotting_skaven_tunnels_03",
				"pwe_objective_cemetery_spotting_skaven_tunnels_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.5801665782928,
				0.836854159832,
				1.7050000429153,
				2.1473958492279
			}
		},
		pwe_cemetary_intro = {
			face_animations_n = 2,
			database = "wood_elf_cemetery",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_cemetary_intro_a_01",
				[2.0] = "pwe_cemetary_intro_a_02"
			},
			sound_events = {
				[1.0] = "pwe_cemetary_intro_a_01",
				[2.0] = "pwe_cemetary_intro_a_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.1260209083557,
				[2.0] = 1.9740624427795
			}
		},
		pwe_objective_cemetery_spotting_the_attachements = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_the_attachements_01",
				"pwe_objective_cemetery_spotting_the_attachements_02",
				"pwe_objective_cemetery_spotting_the_attachements_03",
				"pwe_objective_cemetery_spotting_the_attachements_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_the_attachements_01",
				"pwe_objective_cemetery_spotting_the_attachements_02",
				"pwe_objective_cemetery_spotting_the_attachements_03",
				"pwe_objective_cemetery_spotting_the_attachements_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.9714374542236,
				2.7043957710266,
				2.1683750152588,
				2.938916683197
			}
		},
		pwe_ojective_cemetery_done = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_ojective_cemetery_done_01",
				"pwe_ojective_cemetery_done_02",
				"pwe_ojective_cemetery_done_03",
				"pwe_ojective_cemetery_done_04"
			},
			sound_events = {
				"pwe_ojective_cemetery_done_01",
				"pwe_ojective_cemetery_done_02",
				"pwe_ojective_cemetery_done_03",
				"pwe_ojective_cemetery_done_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.3724584579468,
				5.1503958702087,
				4.6909790039063,
				4.0355625152588
			}
		},
		pwe_cemetary_intro_c = {
			face_animations_n = 2,
			database = "wood_elf_cemetery",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_cemetary_intro_c_01",
				[2.0] = "pwe_cemetary_intro_c_02"
			},
			sound_events = {
				[1.0] = "pwe_cemetary_intro_c_01",
				[2.0] = "pwe_cemetary_intro_c_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.0694582462311,
				[2.0] = 4.6398749351502
			}
		},
		pwe_cemetary_intro_b = {
			face_animations_n = 2,
			database = "wood_elf_cemetery",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_cemetary_intro_b_01",
				[2.0] = "pwe_cemetary_intro_b_02"
			},
			sound_events = {
				[1.0] = "pwe_cemetary_intro_b_01",
				[2.0] = "pwe_cemetary_intro_b_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.6695208549499,
				[2.0] = 3.2235832214356
			}
		},
		pwe_objective_cemetery_spotting_plague_brew_stains = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_plague_brew_stains_01",
				"pwe_objective_cemetery_spotting_plague_brew_stains_02",
				"pwe_objective_cemetery_spotting_plague_brew_stains_03",
				"pwe_objective_cemetery_spotting_plague_brew_stains_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_plague_brew_stains_01",
				"pwe_objective_cemetery_spotting_plague_brew_stains_02",
				"pwe_objective_cemetery_spotting_plague_brew_stains_03",
				"pwe_objective_cemetery_spotting_plague_brew_stains_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.9622082710266,
				2.2172708511352,
				6.1697916984558,
				4.6449790000916
			}
		},
		pwe_objective_cemetery_destroyed_plague_cauldron = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_destroyed_plague_cauldron_01",
				"pwe_objective_cemetery_destroyed_plague_cauldron_02",
				"pwe_objective_cemetery_destroyed_plague_cauldron_03",
				"pwe_objective_cemetery_destroyed_plague_cauldron_04"
			},
			sound_events = {
				"pwe_objective_cemetery_destroyed_plague_cauldron_01",
				"pwe_objective_cemetery_destroyed_plague_cauldron_02",
				"pwe_objective_cemetery_destroyed_plague_cauldron_03",
				"pwe_objective_cemetery_destroyed_plague_cauldron_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.1437709331513,
				2.7762291431427,
				1.8047499656677,
				2.9348957538605
			}
		},
		pwe_objective_cemetery_bringing_down_third_attachment = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_bringing_down_third_attachment_01",
				"pwe_objective_cemetery_bringing_down_third_attachment_02",
				"pwe_objective_cemetery_bringing_down_third_attachment_03",
				"pwe_objective_cemetery_bringing_down_third_attachment_04"
			},
			sound_events = {
				"pwe_objective_cemetery_bringing_down_third_attachment_01",
				"pwe_objective_cemetery_bringing_down_third_attachment_02",
				"pwe_objective_cemetery_bringing_down_third_attachment_03",
				"pwe_objective_cemetery_bringing_down_third_attachment_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.63741666078568,
				1.6404792070389,
				2.4753541946411,
				1.8281874656677
			}
		},
		pwe_objective_cemetery_bringing_down_second_attachment = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_bringing_down_second_attachment_01",
				"pwe_objective_cemetery_bringing_down_second_attachment_02",
				"pwe_objective_cemetery_bringing_down_second_attachment_03",
				"pwe_objective_cemetery_bringing_down_second_attachment_04"
			},
			sound_events = {
				"pwe_objective_cemetery_bringing_down_second_attachment_01",
				"pwe_objective_cemetery_bringing_down_second_attachment_02",
				"pwe_objective_cemetery_bringing_down_second_attachment_03",
				"pwe_objective_cemetery_bringing_down_second_attachment_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.5153332948685,
				0.71366667747498,
				2.1468749046326,
				1.4918750524521
			}
		},
		pwe_objective_cemetery_spotting_graveyard = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_graveyard_01",
				"pwe_objective_cemetery_spotting_graveyard_02",
				"pwe_objective_cemetery_spotting_graveyard_03",
				"pwe_objective_cemetery_spotting_graveyard_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_graveyard_01",
				"pwe_objective_cemetery_spotting_graveyard_02",
				"pwe_objective_cemetery_spotting_graveyard_03",
				"pwe_objective_cemetery_spotting_graveyard_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.2177500724792,
				3.8252499103546,
				5.2924585342407,
				1.5962083339691
			}
		},
		pwe_objective_cemetery_bringing_down_fourth_attachment = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_bringing_down_fourth_attachment_01",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_02",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_03",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_04"
			},
			sound_events = {
				"pwe_objective_cemetery_bringing_down_fourth_attachment_01",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_02",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_03",
				"pwe_objective_cemetery_bringing_down_fourth_attachment_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7167291641235,
				1.6495624780655,
				1.6317083835602,
				1.1643333435059
			}
		},
		pwe_objective_cemetery_bringing_down_first_attachment = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_bringing_down_first_attachment_01",
				"pwe_objective_cemetery_bringing_down_first_attachment_02",
				"pwe_objective_cemetery_bringing_down_first_attachment_03",
				"pwe_objective_cemetery_bringing_down_first_attachment_04"
			},
			sound_events = {
				"pwe_objective_cemetery_bringing_down_first_attachment_01",
				"pwe_objective_cemetery_bringing_down_first_attachment_02",
				"pwe_objective_cemetery_bringing_down_first_attachment_03",
				"pwe_objective_cemetery_bringing_down_first_attachment_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.8202708363533,
				1.3412083387375,
				3.0045208930969,
				1.0681041479111
			}
		},
		pwe_objective_cemetery_through_crypt_b = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_through_crypt_b_01",
				"pwe_objective_cemetery_through_crypt_b_02",
				"pwe_objective_cemetery_through_crypt_b_03",
				"pwe_objective_cemetery_through_crypt_b_04"
			},
			sound_events = {
				"pwe_objective_cemetery_through_crypt_b_01",
				"pwe_objective_cemetery_through_crypt_b_02",
				"pwe_objective_cemetery_through_crypt_b_03",
				"pwe_objective_cemetery_through_crypt_b_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.1719164848328,
				4.233916759491,
				3.5712292194366,
				0.86683332920074
			}
		},
		pwe_objective_cemetery_spotting_plague_cauldron = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_plague_cauldron_01",
				"pwe_objective_cemetery_spotting_plague_cauldron_02",
				"pwe_objective_cemetery_spotting_plague_cauldron_03",
				"pwe_objective_cemetery_spotting_plague_cauldron_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_plague_cauldron_01",
				"pwe_objective_cemetery_spotting_plague_cauldron_02",
				"pwe_objective_cemetery_spotting_plague_cauldron_03",
				"pwe_objective_cemetery_spotting_plague_cauldron_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.6803541183472,
				5.3558125495911,
				3.3185832500458,
				3.6432082653046
			}
		},
		pwe_objective_cemetery_through_crypt_a = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_through_crypt_a_01",
				"pwe_objective_cemetery_through_crypt_a_02",
				"pwe_objective_cemetery_through_crypt_a_03",
				"pwe_objective_cemetery_through_crypt_a_04"
			},
			sound_events = {
				"pwe_objective_cemetery_through_crypt_a_01",
				"pwe_objective_cemetery_through_crypt_a_02",
				"pwe_objective_cemetery_through_crypt_a_03",
				"pwe_objective_cemetery_through_crypt_a_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2,
				6.0261874198914,
				3.6812915802002,
				3.4281666278839
			}
		},
		pwe_objective_cemetery_spotting_crypt_maze = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_crypt_maze_01",
				"pwe_objective_cemetery_spotting_crypt_maze_02",
				"pwe_objective_cemetery_spotting_crypt_maze_03",
				"pwe_objective_cemetery_spotting_crypt_maze_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_crypt_maze_01",
				"pwe_objective_cemetery_spotting_crypt_maze_02",
				"pwe_objective_cemetery_spotting_crypt_maze_03",
				"pwe_objective_cemetery_spotting_crypt_maze_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.4483958482742,
				2.8934166431427,
				3.6979167461395,
				6.5704793930054
			}
		},
		pwe_objective_cemetery_spotting_plague_pyre = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_plague_pyre_01",
				"pwe_objective_cemetery_spotting_plague_pyre_02",
				"pwe_objective_cemetery_spotting_plague_pyre_03",
				"pwe_objective_cemetery_spotting_plague_pyre_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_plague_pyre_01",
				"pwe_objective_cemetery_spotting_plague_pyre_02",
				"pwe_objective_cemetery_spotting_plague_pyre_03",
				"pwe_objective_cemetery_spotting_plague_pyre_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.2752499580383,
				2.9015417098999,
				2.1769165992737,
				4.1746039390564
			}
		},
		pwe_objective_cemetery_spotting_victim = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_victim_01",
				"pwe_objective_cemetery_spotting_victim_02",
				"pwe_objective_cemetery_spotting_victim_03",
				"pwe_objective_cemetery_spotting_victim_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_victim_01",
				"pwe_objective_cemetery_spotting_victim_02",
				"pwe_objective_cemetery_spotting_victim_03",
				"pwe_objective_cemetery_spotting_victim_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1675000190735,
				2.8293540477753,
				2.2999999523163,
				1.7812082767487
			}
		},
		pwe_objective_cemetery_spotting_mausoleum = {
			face_animations_n = 4,
			database = "wood_elf_cemetery",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_objective_cemetery_spotting_mausoleum_01",
				"pwe_objective_cemetery_spotting_mausoleum_02",
				"pwe_objective_cemetery_spotting_mausoleum_03",
				"pwe_objective_cemetery_spotting_mausoleum_04"
			},
			sound_events = {
				"pwe_objective_cemetery_spotting_mausoleum_01",
				"pwe_objective_cemetery_spotting_mausoleum_02",
				"pwe_objective_cemetery_spotting_mausoleum_03",
				"pwe_objective_cemetery_spotting_mausoleum_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.8541458845139,
				3.4517500400543,
				2.6284582614899,
				5.3866248130798
			}
		}
	})
end
