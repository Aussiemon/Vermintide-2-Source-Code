return function ()
	define_rule({
		name = "pbw_level_ussingen_at_last_end",
		response = "pbw_level_ussingen_at_last_end",
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
				"level_ussingen_at_last_end"
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
				"level_ussingen_at_last_end",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_at_last_end",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_cart_full",
		response = "pbw_level_ussingen_cart_full",
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
				"level_ussingen_cart_full"
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
				"level_ussingen_cart_full",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_cart_full",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_cellar",
		response = "pbw_level_ussingen_cellar",
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
				"level_ussingen_cellar"
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
				"level_ussingen_cellar",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_cellar",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_doomed_town",
		response = "pbw_level_ussingen_doomed_town",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_ussingen_doomed_town"
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
				"level_ussingen_doomed_town",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_doomed_town",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_escape",
		response = "pbw_level_ussingen_escape",
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
				"level_ussingen_escape"
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
				"level_ussingen_escape",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_escape",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_gatehouse",
		response = "pbw_level_ussingen_gatehouse",
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
				"level_ussingen_gatehouse"
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
				"level_ussingen_gatehouse",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_gatehouse",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_hurry",
		response = "pbw_level_ussingen_hurry",
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
				"level_ussingen_hurry"
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
				"level_ussingen_hurry",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_hurry",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_less_damaged",
		response = "pbw_level_ussingen_less_damaged",
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
				"level_ussingen_less_damaged"
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
				"level_ussingen_less_damaged",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_less_damaged",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_stockpile_burned",
		response = "pbw_level_ussingen_stockpile_burned",
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
				"level_ussingen_stockpile_burned"
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
				"level_ussingen_stockpile_burned",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_stockpile_burned",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_thick_smoke",
		response = "pbw_level_ussingen_thick_smoke",
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
				"level_ussingen_thick_smoke"
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
				"level_ussingen_thick_smoke",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_thick_smoke",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_way_through",
		response = "pbw_level_ussingen_way_through",
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
				"level_ussingen_way_through"
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
				"level_ussingen_way_through",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_way_through",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_ussingen_intro_a",
		response = "pbw_ussingen_intro_a",
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
				"ussingen_intro_a"
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
				"ussingen_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"ussingen_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_ussingen_intro_b",
		response = "pbw_ussingen_intro_b",
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
				"ussingen_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"ussingen_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"ussingen_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_ussingen_intro_c",
		response = "pbw_ussingen_intro_c",
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
				"ussingen_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"ussingen_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"ussingen_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_spotting_town",
		response = "pbw_level_ussingen_spotting_town",
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
				"level_ussingen_spotting_town"
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
				"level_ussingen_spotting_town",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_spotting_town",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_caravan",
		response = "pbw_level_ussingen_caravan",
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
				"level_ussingen_caravan"
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
				"level_ussingen_caravan",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_caravan",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_devastation",
		response = "pbw_level_ussingen_devastation",
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
				"level_ussingen_devastation"
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
				"level_ussingen_devastation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_devastation",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_gate_closed",
		response = "pbw_level_ussingen_gate_closed",
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
				"level_ussingen_gate_closed"
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
				"level_ussingen_gate_closed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_gate_closed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_search_for_manor",
		response = "pbw_level_ussingen_search_for_manor",
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
				"level_ussingen_search_for_manor"
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
				"level_ussingen_search_for_manor",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_search_for_manor",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_wrong_way",
		response = "pbw_level_ussingen_wrong_way",
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
				"level_ussingen_wrong_way"
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
				"level_ussingen_wrong_way",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_wrong_way",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_wine_cellar",
		response = "pbw_level_ussingen_wine_cellar",
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
				"level_ussingen_wine_cellar"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
				"level_ussingen_wine_cellar",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_wine_cellar",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_spotting_manor",
		response = "pbw_level_ussingen_spotting_manor",
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
				"level_ussingen_spotting_manor"
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
				"level_ussingen_spotting_manor",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_spotting_manor",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_find_way_around",
		response = "pbw_level_ussingen_find_way_around",
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
				"level_ussingen_find_way_around"
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
				"level_ussingen_find_way_around",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_find_way_around",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ussingen_manor_found",
		response = "pbw_level_ussingen_manor_found",
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
				"level_ussingen_manor_found"
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
				"level_ussingen_manor_found",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_manor_found",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_level_ussingen_doomed_town = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_doomed_town_01",
				"pbw_level_ussingen_doomed_town_02",
				"pbw_level_ussingen_doomed_town_03",
				"pbw_level_ussingen_doomed_town_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.0547292232513,
				5.8807291984558,
				4.907187461853,
				5.4046874046326
			},
			localization_strings = {
				"pbw_level_ussingen_doomed_town_01",
				"pbw_level_ussingen_doomed_town_02",
				"pbw_level_ussingen_doomed_town_03",
				"pbw_level_ussingen_doomed_town_04"
			},
			randomize_indexes = {}
		},
		pbw_ussingen_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_ussingen_intro_a_01",
				[2.0] = "pbw_ussingen_intro_a_02"
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
				[1.0] = 7.9073123931885,
				[2.0] = 5.3159999847412
			},
			localization_strings = {
				[1.0] = "pbw_ussingen_intro_a_01",
				[2.0] = "pbw_ussingen_intro_a_02"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_devastation = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_devastation_01",
				"pbw_level_ussingen_devastation_02",
				"pbw_level_ussingen_devastation_03",
				"pbw_level_ussingen_devastation_04"
			},
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
			sound_events_duration = {
				6.6824793815613,
				5.6075000762939,
				8.7630414962769,
				5.6609582901001
			},
			localization_strings = {
				"pbw_level_ussingen_devastation_01",
				"pbw_level_ussingen_devastation_02",
				"pbw_level_ussingen_devastation_03",
				"pbw_level_ussingen_devastation_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_stockpile_burned = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_stockpile_burned_01",
				"pbw_level_ussingen_stockpile_burned_02",
				"pbw_level_ussingen_stockpile_burned_03",
				"pbw_level_ussingen_stockpile_burned_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.8896458148956,
				2.6409583091736,
				2.7958958148956,
				4.165979385376
			},
			localization_strings = {
				"pbw_level_ussingen_stockpile_burned_01",
				"pbw_level_ussingen_stockpile_burned_02",
				"pbw_level_ussingen_stockpile_burned_03",
				"pbw_level_ussingen_stockpile_burned_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_manor_found = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_manor_found_01",
				"pbw_level_ussingen_manor_found_02",
				"pbw_level_ussingen_manor_found_03",
				"pbw_level_ussingen_manor_found_04"
			},
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
			sound_events_duration = {
				4.1368541717529,
				3.1271457672119,
				5.6959791183472,
				6.6395831108093
			},
			localization_strings = {
				"pbw_level_ussingen_manor_found_01",
				"pbw_level_ussingen_manor_found_02",
				"pbw_level_ussingen_manor_found_03",
				"pbw_level_ussingen_manor_found_04"
			},
			randomize_indexes = {}
		},
		pbw_ussingen_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_ussingen_intro_c_01",
				[2.0] = "pbw_ussingen_intro_c_02"
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
				[1.0] = 4.4432082176208,
				[2.0] = 5.0286664962769
			},
			localization_strings = {
				[1.0] = "pbw_ussingen_intro_c_01",
				[2.0] = "pbw_ussingen_intro_c_02"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_caravan = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_caravan_01",
				"pbw_level_ussingen_caravan_02",
				"pbw_level_ussingen_caravan_03",
				"pbw_level_ussingen_caravan_04"
			},
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
			sound_events_duration = {
				6.9932708740234,
				6.0635209083557,
				5.2191457748413,
				8.4996662139893
			},
			localization_strings = {
				"pbw_level_ussingen_caravan_01",
				"pbw_level_ussingen_caravan_02",
				"pbw_level_ussingen_caravan_03",
				"pbw_level_ussingen_caravan_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_thick_smoke = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_thick_smoke_01",
				"pbw_level_ussingen_thick_smoke_02",
				"pbw_level_ussingen_thick_smoke_03",
				"pbw_level_ussingen_thick_smoke_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				4.0353126525879,
				3.4998750686645,
				4.3491668701172,
				3.6972498893738
			},
			localization_strings = {
				"pbw_level_ussingen_thick_smoke_01",
				"pbw_level_ussingen_thick_smoke_02",
				"pbw_level_ussingen_thick_smoke_03",
				"pbw_level_ussingen_thick_smoke_04"
			},
			randomize_indexes = {}
		},
		pbw_ussingen_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_ussingen_intro_b_01",
				[2.0] = "pbw_ussingen_intro_b_02"
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
				[1.0] = 2.7926459312439,
				[2.0] = 3.4391667842865
			},
			localization_strings = {
				[1.0] = "pbw_ussingen_intro_b_01",
				[2.0] = "pbw_ussingen_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_find_way_around = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_find_way_around_01",
				"pbw_level_ussingen_find_way_around_02",
				"pbw_level_ussingen_find_way_around_03",
				"pbw_level_ussingen_find_way_around_04"
			},
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
			sound_events_duration = {
				1.6046874523163,
				2.0662291049957,
				2.0234792232513,
				3.6228749752045
			},
			localization_strings = {
				"pbw_level_ussingen_find_way_around_01",
				"pbw_level_ussingen_find_way_around_02",
				"pbw_level_ussingen_find_way_around_03",
				"pbw_level_ussingen_find_way_around_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_spotting_manor = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_spotting_manor_01",
				"pbw_level_ussingen_spotting_manor_02",
				"pbw_level_ussingen_spotting_manor_03",
				"pbw_level_ussingen_spotting_manor_04"
			},
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
			sound_events_duration = {
				5.2849168777466,
				2.286812543869,
				4.2297501564026,
				3.5033540725708
			},
			localization_strings = {
				"pbw_level_ussingen_spotting_manor_01",
				"pbw_level_ussingen_spotting_manor_02",
				"pbw_level_ussingen_spotting_manor_03",
				"pbw_level_ussingen_spotting_manor_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_less_damaged = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_less_damaged_01",
				"pbw_level_ussingen_less_damaged_02",
				"pbw_level_ussingen_less_damaged_03",
				"pbw_level_ussingen_less_damaged_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				4.5611042976379,
				5.3914375305176,
				3.2552917003632,
				3.8257083892822
			},
			localization_strings = {
				"pbw_level_ussingen_less_damaged_01",
				"pbw_level_ussingen_less_damaged_02",
				"pbw_level_ussingen_less_damaged_03",
				"pbw_level_ussingen_less_damaged_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_gatehouse = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_level_ussingen_gatehouse_01",
				"pbw_level_ussingen_gatehouse_02",
				"pbw_level_ussingen_gatehouse_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				4.8946251869202,
				4.0646247863769,
				5.8339581489563
			},
			localization_strings = {
				"pbw_level_ussingen_gatehouse_01",
				"pbw_level_ussingen_gatehouse_02",
				"pbw_level_ussingen_gatehouse_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_hurry = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_hurry_01",
				"pbw_level_ussingen_hurry_02",
				"pbw_level_ussingen_hurry_03",
				"pbw_level_ussingen_hurry_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.4458124637604,
				2.3526248931885,
				3.0476875305176,
				2.0043542385101
			},
			localization_strings = {
				"pbw_level_ussingen_hurry_01",
				"pbw_level_ussingen_hurry_02",
				"pbw_level_ussingen_hurry_03",
				"pbw_level_ussingen_hurry_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_gate_closed = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_gate_closed_01",
				"pbw_level_ussingen_gate_closed_02",
				"pbw_level_ussingen_gate_closed_03",
				"pbw_level_ussingen_gate_closed_04"
			},
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
			sound_events_duration = {
				2.5023748874664,
				3.3980417251587,
				3.3129374980927,
				3.4515624046326
			},
			localization_strings = {
				"pbw_level_ussingen_gate_closed_01",
				"pbw_level_ussingen_gate_closed_02",
				"pbw_level_ussingen_gate_closed_03",
				"pbw_level_ussingen_gate_closed_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_cellar = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_cellar_01",
				"pbw_level_ussingen_cellar_02",
				"pbw_level_ussingen_cellar_03",
				"pbw_level_ussingen_cellar_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.8317083120346,
				3.9800832271576,
				3.5898542404175,
				2.7132291793823
			},
			localization_strings = {
				"pbw_level_ussingen_cellar_01",
				"pbw_level_ussingen_cellar_02",
				"pbw_level_ussingen_cellar_03",
				"pbw_level_ussingen_cellar_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_wine_cellar = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_wine_cellar_01",
				"pbw_level_ussingen_wine_cellar_02",
				"pbw_level_ussingen_wine_cellar_03",
				"pbw_level_ussingen_wine_cellar_04"
			},
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
			sound_events_duration = {
				1.7468333244324,
				4.0927290916443,
				3.9479792118073,
				4.1164374351502
			},
			localization_strings = {
				"pbw_level_ussingen_wine_cellar_01",
				"pbw_level_ussingen_wine_cellar_02",
				"pbw_level_ussingen_wine_cellar_03",
				"pbw_level_ussingen_wine_cellar_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_wrong_way = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_wrong_way_01",
				"pbw_level_ussingen_wrong_way_02",
				"pbw_level_ussingen_wrong_way_03",
				"pbw_level_ussingen_wrong_way_04"
			},
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
			sound_events_duration = {
				2.5474791526794,
				2.6956250667572,
				2.3597917556763,
				2.7066249847412
			},
			localization_strings = {
				"pbw_level_ussingen_wrong_way_01",
				"pbw_level_ussingen_wrong_way_02",
				"pbw_level_ussingen_wrong_way_03",
				"pbw_level_ussingen_wrong_way_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_search_for_manor = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_level_ussingen_search_for_manor_01",
				"pbw_level_ussingen_search_for_manor_02",
				"pbw_level_ussingen_search_for_manor_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				2.9372708797455,
				2.7091875076294,
				3.5981874465942
			},
			localization_strings = {
				"pbw_level_ussingen_search_for_manor_01",
				"pbw_level_ussingen_search_for_manor_02",
				"pbw_level_ussingen_search_for_manor_03"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_way_through = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_way_through_01",
				"pbw_level_ussingen_way_through_02",
				"pbw_level_ussingen_way_through_03",
				"pbw_level_ussingen_way_through_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.752833366394,
				3.1340208053589,
				4.1608543395996,
				2.6007916927338
			},
			localization_strings = {
				"pbw_level_ussingen_way_through_01",
				"pbw_level_ussingen_way_through_02",
				"pbw_level_ussingen_way_through_03",
				"pbw_level_ussingen_way_through_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_cart_full = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_cart_full_01",
				"pbw_level_ussingen_cart_full_02",
				"pbw_level_ussingen_cart_full_03",
				"pbw_level_ussingen_cart_full_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				2.6009166240692,
				2.8748126029968,
				1.7768125534058,
				1.7299791574478
			},
			localization_strings = {
				"pbw_level_ussingen_cart_full_01",
				"pbw_level_ussingen_cart_full_02",
				"pbw_level_ussingen_cart_full_03",
				"pbw_level_ussingen_cart_full_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_spotting_town = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_spotting_town_01",
				"pbw_level_ussingen_spotting_town_02",
				"pbw_level_ussingen_spotting_town_03",
				"pbw_level_ussingen_spotting_town_04"
			},
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
			sound_events_duration = {
				7.0114998817444,
				6.3788957595825,
				5.5232291221619,
				3.3530623912811
			},
			localization_strings = {
				"pbw_level_ussingen_spotting_town_01",
				"pbw_level_ussingen_spotting_town_02",
				"pbw_level_ussingen_spotting_town_03",
				"pbw_level_ussingen_spotting_town_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_escape = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_escape_01",
				"pbw_level_ussingen_escape_02",
				"pbw_level_ussingen_escape_03",
				"pbw_level_ussingen_escape_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.8456041812897,
				2.1435000896454,
				1.9753957986832,
				1.4189791679382
			},
			localization_strings = {
				"pbw_level_ussingen_escape_01",
				"pbw_level_ussingen_escape_02",
				"pbw_level_ussingen_escape_03",
				"pbw_level_ussingen_escape_04"
			},
			randomize_indexes = {}
		},
		pbw_level_ussingen_at_last_end = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_ussingen",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_ussingen_at_last_end_01",
				"pbw_level_ussingen_at_last_end_02",
				"pbw_level_ussingen_at_last_end_03",
				"pbw_level_ussingen_at_last_end_04"
			},
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
			sound_events_duration = {
				3.4767916202545,
				2.1505417823791,
				2.3392915725708,
				5.2379999160767
			},
			localization_strings = {
				"pbw_level_ussingen_at_last_end_01",
				"pbw_level_ussingen_at_last_end_02",
				"pbw_level_ussingen_at_last_end_03",
				"pbw_level_ussingen_at_last_end_04"
			},
			randomize_indexes = {}
		}
	})
end
