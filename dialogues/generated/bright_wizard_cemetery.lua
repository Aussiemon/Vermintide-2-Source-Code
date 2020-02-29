return function ()
	define_rule({
		name = "pbw_objective_cemetery_through_crypt_a",
		response = "pbw_objective_cemetery_through_crypt_a",
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
		name = "pbw_objective_cemetery_spotting_mausoleum",
		response = "pbw_objective_cemetery_spotting_mausoleum",
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
		name = "pbw_objective_cemetery_spotting_plague_brew_stains",
		response = "pbw_objective_cemetery_spotting_plague_brew_stains",
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
		name = "pbw_objective_cemetery_spotting_crypt_maze",
		response = "pbw_objective_cemetery_spotting_crypt_maze",
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
		name = "pbw_objective_cemetery_through_crypt_b",
		response = "pbw_objective_cemetery_through_crypt_b",
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
		name = "pbw_objective_cemetery_spotting_graveyard",
		response = "pbw_objective_cemetery_spotting_graveyard",
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
		name = "pbw_objective_cemetery_spotting_hedge_maze",
		response = "pbw_objective_cemetery_spotting_hedge_maze",
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
		name = "pbw_objective_cemetery_spotting_plague_pyre",
		response = "pbw_objective_cemetery_spotting_plague_pyre",
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
		name = "pbw_objective_cemetery_through_crypt_c",
		response = "pbw_objective_cemetery_through_crypt_c",
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
		name = "pbw_objective_cemetery_spotting_skaven_tunnels",
		response = "pbw_objective_cemetery_spotting_skaven_tunnels",
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
		name = "pbw_objective_cemetery_spotting_plague_cauldron",
		response = "pbw_objective_cemetery_spotting_plague_cauldron",
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
		name = "pbw_objective_cemetery_destroyed_plague_cauldron",
		response = "pbw_objective_cemetery_destroyed_plague_cauldron",
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
		name = "pbw_objective_cemetery_spotting_victim",
		response = "pbw_objective_cemetery_spotting_victim",
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
		name = "pbw_objective_cemetery_bringing_down_first_attachment",
		response = "pbw_objective_cemetery_bringing_down_first_attachment",
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
		name = "pbw_objective_cemetery_bringing_down_second_attachment",
		response = "pbw_objective_cemetery_bringing_down_second_attachment",
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
		name = "pbw_objective_cemetery_bringing_down_third_attachment",
		response = "pbw_objective_cemetery_bringing_down_third_attachment",
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
		name = "pbw_objective_cemetery_bringing_down_fourth_attachment",
		response = "pbw_objective_cemetery_bringing_down_fourth_attachment",
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
		name = "pbw_objective_cemetery_spotting_the_attachements",
		response = "pbw_objective_cemetery_spotting_the_attachements",
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
		name = "pbw_objective_cemetery_done",
		response = "pbw_objective_cemetery_done",
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
				"objective_cemetery_done"
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
				"time_since_objective_cemetery_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_cemetary_intro",
		response = "pbw_cemetary_intro",
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
		name = "pbw_cemetary_intro_b",
		response = "pbw_cemetary_intro_b",
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
				"bright_wizard"
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
		name = "pbw_cemetary_intro_c",
		response = "pbw_cemetary_intro_c",
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
				"bright_wizard"
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
		pbw_objective_cemetery_through_crypt_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_through_crypt_a_01",
				"pbw_objective_cemetery_through_crypt_a_02",
				"pbw_objective_cemetery_through_crypt_a_03",
				"pbw_objective_cemetery_through_crypt_a_04"
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
				2.7662084102631,
				3.973354101181,
				2.6191875934601,
				1.9430832862854
			},
			localization_strings = {
				"pbw_objective_cemetery_through_crypt_a_01",
				"pbw_objective_cemetery_through_crypt_a_02",
				"pbw_objective_cemetery_through_crypt_a_03",
				"pbw_objective_cemetery_through_crypt_a_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_hedge_maze = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_hedge_maze_01",
				"pbw_objective_cemetery_spotting_hedge_maze_02",
				"pbw_objective_cemetery_spotting_hedge_maze_03",
				"pbw_objective_cemetery_spotting_hedge_maze_04"
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
				5.4723749160767,
				2.433833360672,
				3.6481666564941,
				3.327166557312
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_hedge_maze_01",
				"pbw_objective_cemetery_spotting_hedge_maze_02",
				"pbw_objective_cemetery_spotting_hedge_maze_03",
				"pbw_objective_cemetery_spotting_hedge_maze_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_the_attachements = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_the_attachements_01",
				"pbw_objective_cemetery_spotting_the_attachements_02",
				"pbw_objective_cemetery_spotting_the_attachements_03",
				"pbw_objective_cemetery_spotting_the_attachements_04"
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
				2.4522082805634,
				2.147958278656,
				2.1999583244324,
				1.7892708778381
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_the_attachements_01",
				"pbw_objective_cemetery_spotting_the_attachements_02",
				"pbw_objective_cemetery_spotting_the_attachements_03",
				"pbw_objective_cemetery_spotting_the_attachements_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_graveyard = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_graveyard_01",
				"pbw_objective_cemetery_spotting_graveyard_02",
				"pbw_objective_cemetery_spotting_graveyard_03",
				"pbw_objective_cemetery_spotting_graveyard_04"
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
				2.7653334140778,
				2.9436249732971,
				2.2245624065399,
				5.3439373970032
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_graveyard_01",
				"pbw_objective_cemetery_spotting_graveyard_02",
				"pbw_objective_cemetery_spotting_graveyard_03",
				"pbw_objective_cemetery_spotting_graveyard_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_victim = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_victim_01",
				"pbw_objective_cemetery_spotting_victim_02",
				"pbw_objective_cemetery_spotting_victim_03",
				"pbw_objective_cemetery_spotting_victim_04"
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
				4.1266460418701,
				1.5300625562668,
				1.2566250562668,
				2.0560624599457
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_victim_01",
				"pbw_objective_cemetery_spotting_victim_02",
				"pbw_objective_cemetery_spotting_victim_03",
				"pbw_objective_cemetery_spotting_victim_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_through_crypt_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_through_crypt_c_01",
				"pbw_objective_cemetery_through_crypt_c_02",
				"pbw_objective_cemetery_through_crypt_c_03",
				"pbw_objective_cemetery_through_crypt_c_04"
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
				3.6316459178925,
				3.1878957748413,
				2.7999999523163,
				3.9771249294281
			},
			localization_strings = {
				"pbw_objective_cemetery_through_crypt_c_01",
				"pbw_objective_cemetery_through_crypt_c_02",
				"pbw_objective_cemetery_through_crypt_c_03",
				"pbw_objective_cemetery_through_crypt_c_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_plague_brew_stains = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_plague_brew_stains_01",
				"pbw_objective_cemetery_spotting_plague_brew_stains_02",
				"pbw_objective_cemetery_spotting_plague_brew_stains_03",
				"pbw_objective_cemetery_spotting_plague_brew_stains_04"
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
				6.664999961853,
				6.7257499694824,
				5.1891460418701,
				6.2896041870117
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_plague_brew_stains_01",
				"pbw_objective_cemetery_spotting_plague_brew_stains_02",
				"pbw_objective_cemetery_spotting_plague_brew_stains_03",
				"pbw_objective_cemetery_spotting_plague_brew_stains_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_skaven_tunnels = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_skaven_tunnels_01",
				"pbw_objective_cemetery_spotting_skaven_tunnels_02",
				"pbw_objective_cemetery_spotting_skaven_tunnels_03",
				"pbw_objective_cemetery_spotting_skaven_tunnels_04"
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
				2.5534167289734,
				3.5097498893738,
				1.6995416879654,
				2.9661874771118
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_skaven_tunnels_01",
				"pbw_objective_cemetery_spotting_skaven_tunnels_02",
				"pbw_objective_cemetery_spotting_skaven_tunnels_03",
				"pbw_objective_cemetery_spotting_skaven_tunnels_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_bringing_down_first_attachment = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_bringing_down_first_attachment_01",
				"pbw_objective_cemetery_bringing_down_first_attachment_02",
				"pbw_objective_cemetery_bringing_down_first_attachment_03",
				"pbw_objective_cemetery_bringing_down_first_attachment_04"
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
				1.346479177475,
				1.9283541440964,
				1.7706874608993,
				1.9433749914169
			},
			localization_strings = {
				"pbw_objective_cemetery_bringing_down_first_attachment_01",
				"pbw_objective_cemetery_bringing_down_first_attachment_02",
				"pbw_objective_cemetery_bringing_down_first_attachment_03",
				"pbw_objective_cemetery_bringing_down_first_attachment_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_bringing_down_third_attachment = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_bringing_down_third_attachment_01",
				"pbw_objective_cemetery_bringing_down_third_attachment_02",
				"pbw_objective_cemetery_bringing_down_third_attachment_03",
				"pbw_objective_cemetery_bringing_down_third_attachment_04"
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
				1.7822291851044,
				1.3999999761581,
				1.1373125314713,
				2.2199375629425
			},
			localization_strings = {
				"pbw_objective_cemetery_bringing_down_third_attachment_01",
				"pbw_objective_cemetery_bringing_down_third_attachment_02",
				"pbw_objective_cemetery_bringing_down_third_attachment_03",
				"pbw_objective_cemetery_bringing_down_third_attachment_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_destroyed_plague_cauldron = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_destroyed_plague_cauldron_01",
				"pbw_objective_cemetery_destroyed_plague_cauldron_02",
				"pbw_objective_cemetery_destroyed_plague_cauldron_03",
				"pbw_objective_cemetery_destroyed_plague_cauldron_04"
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
				3.1694374084473,
				2.4242291450501,
				1.4362291097641,
				1.6162707805634
			},
			localization_strings = {
				"pbw_objective_cemetery_destroyed_plague_cauldron_01",
				"pbw_objective_cemetery_destroyed_plague_cauldron_02",
				"pbw_objective_cemetery_destroyed_plague_cauldron_03",
				"pbw_objective_cemetery_destroyed_plague_cauldron_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_done = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_done_01",
				"pbw_objective_cemetery_done_02",
				"pbw_objective_cemetery_done_03",
				"pbw_objective_cemetery_done_04"
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
				3.6863541603088,
				2.442125082016,
				2.8648540973663,
				3.0197916030884
			},
			localization_strings = {
				"pbw_objective_cemetery_done_01",
				"pbw_objective_cemetery_done_02",
				"pbw_objective_cemetery_done_03",
				"pbw_objective_cemetery_done_04"
			},
			randomize_indexes = {}
		},
		pbw_cemetary_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_cemetary_intro_c_01",
				[2.0] = "pbw_cemetary_intro_c_02"
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
				[1.0] = 2.9476873874664,
				[2.0] = 4.8361873626709
			},
			localization_strings = {
				[1.0] = "pbw_cemetary_intro_c_01",
				[2.0] = "pbw_cemetary_intro_c_02"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_plague_pyre = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_plague_pyre_01",
				"pbw_objective_cemetery_spotting_plague_pyre_02",
				"pbw_objective_cemetery_spotting_plague_pyre_03",
				"pbw_objective_cemetery_spotting_plague_pyre_04"
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
				3.0606458187103,
				2.0685000419617,
				1.9192916154861,
				4.1810626983643
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_plague_pyre_01",
				"pbw_objective_cemetery_spotting_plague_pyre_02",
				"pbw_objective_cemetery_spotting_plague_pyre_03",
				"pbw_objective_cemetery_spotting_plague_pyre_04"
			},
			randomize_indexes = {}
		},
		pbw_cemetary_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_cemetary_intro_b_01",
				[2.0] = "pbw_cemetary_intro_b_02"
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
				[1.0] = 3.174604177475,
				[2.0] = 3.6883125305176
			},
			localization_strings = {
				[1.0] = "pbw_cemetary_intro_b_01",
				[2.0] = "pbw_cemetary_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_crypt_maze = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_crypt_maze_01",
				"pbw_objective_cemetery_spotting_crypt_maze_02",
				"pbw_objective_cemetery_spotting_crypt_maze_03",
				"pbw_objective_cemetery_spotting_crypt_maze_04"
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
				3.5232291221619,
				4.141583442688,
				2.9983332157135,
				3.8649165630341
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_crypt_maze_01",
				"pbw_objective_cemetery_spotting_crypt_maze_02",
				"pbw_objective_cemetery_spotting_crypt_maze_03",
				"pbw_objective_cemetery_spotting_crypt_maze_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_through_crypt_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_through_crypt_b_01",
				"pbw_objective_cemetery_through_crypt_b_02",
				"pbw_objective_cemetery_through_crypt_b_03",
				"pbw_objective_cemetery_through_crypt_b_04"
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
				1.4275833368301,
				1.6597083806992,
				4.4611668586731,
				2.7613542079926
			},
			localization_strings = {
				"pbw_objective_cemetery_through_crypt_b_01",
				"pbw_objective_cemetery_through_crypt_b_02",
				"pbw_objective_cemetery_through_crypt_b_03",
				"pbw_objective_cemetery_through_crypt_b_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_bringing_down_fourth_attachment = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_bringing_down_fourth_attachment_01",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_02",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_03",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_04"
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
				2.6500000953674,
				2.3940000534058,
				2.2975416183472,
				1.7465000152588
			},
			localization_strings = {
				"pbw_objective_cemetery_bringing_down_fourth_attachment_01",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_02",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_03",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_plague_cauldron = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_plague_cauldron_01",
				"pbw_objective_cemetery_spotting_plague_cauldron_02",
				"pbw_objective_cemetery_spotting_plague_cauldron_03",
				"pbw_objective_cemetery_spotting_plague_cauldron_04"
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
				3.827166557312,
				4.7216248512268,
				3.8339791297913,
				2.9962916374206
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_plague_cauldron_01",
				"pbw_objective_cemetery_spotting_plague_cauldron_02",
				"pbw_objective_cemetery_spotting_plague_cauldron_03",
				"pbw_objective_cemetery_spotting_plague_cauldron_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_mausoleum = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_mausoleum_01",
				"pbw_objective_cemetery_spotting_mausoleum_02",
				"pbw_objective_cemetery_spotting_mausoleum_03",
				"pbw_objective_cemetery_spotting_mausoleum_04"
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
				6,
				4.3273749351502,
				4.6634793281555,
				3.7096457481384
			},
			localization_strings = {
				"pbw_objective_cemetery_spotting_mausoleum_01",
				"pbw_objective_cemetery_spotting_mausoleum_02",
				"pbw_objective_cemetery_spotting_mausoleum_03",
				"pbw_objective_cemetery_spotting_mausoleum_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_bringing_down_second_attachment = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_bringing_down_second_attachment_01",
				"pbw_objective_cemetery_bringing_down_second_attachment_02",
				"pbw_objective_cemetery_bringing_down_second_attachment_03",
				"pbw_objective_cemetery_bringing_down_second_attachment_04"
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
				1.2890625,
				1.495437502861,
				1.0789583921433,
				1.3888125419617
			},
			localization_strings = {
				"pbw_objective_cemetery_bringing_down_second_attachment_01",
				"pbw_objective_cemetery_bringing_down_second_attachment_02",
				"pbw_objective_cemetery_bringing_down_second_attachment_03",
				"pbw_objective_cemetery_bringing_down_second_attachment_04"
			},
			randomize_indexes = {}
		},
		pbw_cemetary_intro = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_cemetery",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_cemetary_intro_a_01",
				[2.0] = "pbw_cemetary_intro_a_02"
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
				[1.0] = 3.3889999389648,
				[2.0] = 5.0301666259766
			},
			localization_strings = {
				[1.0] = "pbw_cemetary_intro_a_01",
				[2.0] = "pbw_cemetary_intro_a_02"
			},
			randomize_indexes = {}
		}
	})
end
