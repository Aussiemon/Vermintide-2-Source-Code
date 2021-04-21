return function ()
	define_rule({
		name = "pwh_level_ussingen_at_last_end",
		response = "pwh_level_ussingen_at_last_end",
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
		name = "pwh_level_ussingen_cart_full",
		response = "pwh_level_ussingen_cart_full",
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
		name = "pwh_level_ussingen_cellar",
		response = "pwh_level_ussingen_cellar",
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
		name = "pwh_level_ussingen_doomed_town",
		response = "pwh_level_ussingen_doomed_town",
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
				"level_ussingen_doomed_town"
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
		name = "pwh_level_ussingen_escape",
		response = "pwh_level_ussingen_escape",
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
		name = "pwh_level_ussingen_gatehouse",
		response = "pwh_level_ussingen_gatehouse",
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
		name = "pwh_level_ussingen_hurry",
		response = "pwh_level_ussingen_hurry",
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
		name = "pwh_level_ussingen_less_damaged",
		response = "pwh_level_ussingen_less_damaged",
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
		name = "pwh_level_ussingen_stockpile_burned",
		response = "pwh_level_ussingen_stockpile_burned",
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
		name = "pwh_level_ussingen_thick_smoke",
		response = "pwh_level_ussingen_thick_smoke",
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
		name = "pwh_level_ussingen_way_through",
		response = "pwh_level_ussingen_way_through",
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
		name = "pwh_ussingen_intro_a",
		response = "pwh_ussingen_intro_a",
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
		name = "pwh_ussingen_intro_b",
		response = "pwh_ussingen_intro_b",
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
				"witch_hunter"
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
		name = "pwh_ussingen_intro_c",
		response = "pwh_ussingen_intro_c",
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
				"witch_hunter"
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
		name = "pwh_level_ussingen_spotting_town",
		response = "pwh_level_ussingen_spotting_town",
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
		name = "pwh_level_ussingen_caravan",
		response = "pwh_level_ussingen_caravan",
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
		name = "pwh_level_ussingen_devastation",
		response = "pwh_level_ussingen_devastation",
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
		name = "pwh_level_ussingen_gate_closed",
		response = "pwh_level_ussingen_gate_closed",
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
		name = "pwh_level_ussingen_search_for_manor",
		response = "pwh_level_ussingen_search_for_manor",
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
		name = "pwh_level_ussingen_wrong_way",
		response = "pwh_level_ussingen_wrong_way",
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
		name = "pwh_level_ussingen_wine_cellar",
		response = "pwh_level_ussingen_wine_cellar",
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
		name = "pwh_level_ussingen_spotting_manor",
		response = "pwh_level_ussingen_spotting_manor",
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
		name = "pwh_level_ussingen_find_way_around",
		response = "pwh_level_ussingen_find_way_around",
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
	add_dialogues({
		pwh_level_ussingen_cellar = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_cellar_01",
				"pwh_level_ussingen_cellar_02",
				"pwh_level_ussingen_cellar_03",
				"pwh_level_ussingen_cellar_04"
			},
			sound_events = {
				"pwh_level_ussingen_cellar_01",
				"pwh_level_ussingen_cellar_02",
				"pwh_level_ussingen_cellar_03",
				"pwh_level_ussingen_cellar_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.5781874656677,
				2.9441459178925,
				2.9300832748413,
				5.0250415802002
			}
		},
		pwh_level_ussingen_spotting_town = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_spotting_town_01",
				"pwh_level_ussingen_spotting_town_02",
				"pwh_level_ussingen_spotting_town_03",
				"pwh_level_ussingen_spotting_town_04"
			},
			sound_events = {
				"pwh_level_ussingen_spotting_town_01",
				"pwh_level_ussingen_spotting_town_02",
				"pwh_level_ussingen_spotting_town_03",
				"pwh_level_ussingen_spotting_town_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.3728957176209,
				4.8917083740234,
				6.250500202179,
				4.4638333320618
			}
		},
		pwh_level_ussingen_at_last_end = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_at_last_end_01",
				"pwh_level_ussingen_at_last_end_02",
				"pwh_level_ussingen_at_last_end_03",
				"pwh_level_ussingen_at_last_end_04"
			},
			sound_events = {
				"pwh_level_ussingen_at_last_end_01",
				"pwh_level_ussingen_at_last_end_02",
				"pwh_level_ussingen_at_last_end_03",
				"pwh_level_ussingen_at_last_end_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4307708740234,
				2.975145816803,
				4.9451041221619,
				3.0595624446869
			}
		},
		pwh_level_ussingen_less_damaged = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_less_damaged_01",
				"pwh_level_ussingen_less_damaged_02",
				"pwh_level_ussingen_less_damaged_03",
				"pwh_level_ussingen_less_damaged_04"
			},
			sound_events = {
				"pwh_level_ussingen_less_damaged_01",
				"pwh_level_ussingen_less_damaged_02",
				"pwh_level_ussingen_less_damaged_03",
				"pwh_level_ussingen_less_damaged_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.6036667823791,
				7.1044998168945,
				7.5058751106262,
				5.8700833320618
			}
		},
		pwh_ussingen_intro_a = {
			face_animations_n = 2,
			database = "witch_hunter_ussingen",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_ussingen_intro_a_01",
				[2.0] = "pwh_ussingen_intro_a_02"
			},
			sound_events = {
				[1.0] = "pwh_ussingen_intro_a_01",
				[2.0] = "pwh_ussingen_intro_a_02"
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
				[1.0] = 4.252375125885,
				[2.0] = 6.4973540306091
			}
		},
		pwh_level_ussingen_escape = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_escape_01",
				"pwh_level_ussingen_escape_02",
				"pwh_level_ussingen_escape_03",
				"pwh_level_ussingen_escape_04"
			},
			sound_events = {
				"pwh_level_ussingen_escape_01",
				"pwh_level_ussingen_escape_02",
				"pwh_level_ussingen_escape_03",
				"pwh_level_ussingen_escape_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.8477709293366,
				3.9476873874664,
				2.4309792518616,
				5.5948748588562
			}
		},
		pwh_level_ussingen_cart_full = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_cart_full_01",
				"pwh_level_ussingen_cart_full_02",
				"pwh_level_ussingen_cart_full_03",
				"pwh_level_ussingen_cart_full_04"
			},
			sound_events = {
				"pwh_level_ussingen_cart_full_01",
				"pwh_level_ussingen_cart_full_02",
				"pwh_level_ussingen_cart_full_03",
				"pwh_level_ussingen_cart_full_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.374062538147,
				4.1447501182556,
				3.6122291088104,
				4.6267290115356
			}
		},
		pwh_level_ussingen_search_for_manor = {
			face_animations_n = 3,
			database = "witch_hunter_ussingen",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_search_for_manor_01",
				"pwh_level_ussingen_search_for_manor_02",
				"pwh_level_ussingen_search_for_manor_03"
			},
			sound_events = {
				"pwh_level_ussingen_search_for_manor_01",
				"pwh_level_ussingen_search_for_manor_02",
				"pwh_level_ussingen_search_for_manor_03"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.1335000991821,
				3.3987708091736,
				4.4058332443237
			}
		},
		pwh_level_ussingen_devastation = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_devastation_01",
				"pwh_level_ussingen_devastation_02",
				"pwh_level_ussingen_devastation_03",
				"pwh_level_ussingen_devastation_04"
			},
			sound_events = {
				"pwh_level_ussingen_devastation_01",
				"pwh_level_ussingen_devastation_02",
				"pwh_level_ussingen_devastation_03",
				"pwh_level_ussingen_devastation_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.281708240509,
				7.3156456947327,
				5.0132083892822,
				8.5477705001831
			}
		},
		pwh_level_ussingen_find_way_around = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_find_way_around_01",
				"pwh_level_ussingen_find_way_around_02",
				"pwh_level_ussingen_find_way_around_03",
				"pwh_level_ussingen_find_way_around_04"
			},
			sound_events = {
				"pwh_level_ussingen_find_way_around_01",
				"pwh_level_ussingen_find_way_around_02",
				"pwh_level_ussingen_find_way_around_03",
				"pwh_level_ussingen_find_way_around_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.9140207767487,
				3.6017916202545,
				3.7778959274292,
				3.6766874790192
			}
		},
		pwh_level_ussingen_gate_closed = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_gate_closed_01",
				"pwh_level_ussingen_gate_closed_02",
				"pwh_level_ussingen_gate_closed_03",
				"pwh_level_ussingen_gate_closed_04"
			},
			sound_events = {
				"pwh_level_ussingen_gate_closed_01",
				"pwh_level_ussingen_gate_closed_02",
				"pwh_level_ussingen_gate_closed_03",
				"pwh_level_ussingen_gate_closed_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4218542575836,
				6.0997085571289,
				3.9698750972748,
				5.6091666221619
			}
		},
		pwh_level_ussingen_hurry = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_hurry_01",
				"pwh_level_ussingen_hurry_02",
				"pwh_level_ussingen_hurry_03",
				"pwh_level_ussingen_hurry_04"
			},
			sound_events = {
				"pwh_level_ussingen_hurry_01",
				"pwh_level_ussingen_hurry_02",
				"pwh_level_ussingen_hurry_03",
				"pwh_level_ussingen_hurry_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.7228331565857,
				3.8121874332428,
				2.0476875305176,
				1.3209999799728
			}
		},
		pwh_level_ussingen_way_through = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_way_through_01",
				"pwh_level_ussingen_way_through_02",
				"pwh_level_ussingen_way_through_03",
				"pwh_level_ussingen_way_through_04"
			},
			sound_events = {
				"pwh_level_ussingen_way_through_01",
				"pwh_level_ussingen_way_through_02",
				"pwh_level_ussingen_way_through_03",
				"pwh_level_ussingen_way_through_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.9978125095367,
				3.1315624713898,
				3.7166249752045,
				4.2156043052673
			}
		},
		pwh_level_ussingen_wine_cellar = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_wine_cellar_01",
				"pwh_level_ussingen_wine_cellar_02",
				"pwh_level_ussingen_wine_cellar_03",
				"pwh_level_ussingen_wine_cellar_04"
			},
			sound_events = {
				"pwh_level_ussingen_wine_cellar_01",
				"pwh_level_ussingen_wine_cellar_02",
				"pwh_level_ussingen_wine_cellar_03",
				"pwh_level_ussingen_wine_cellar_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.985687494278,
				4.7735209465027,
				3.7020416259766,
				4.7671251296997
			}
		},
		pwh_level_ussingen_wrong_way = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_wrong_way_01",
				"pwh_level_ussingen_wrong_way_02",
				"pwh_level_ussingen_wrong_way_03",
				"pwh_level_ussingen_wrong_way_04"
			},
			sound_events = {
				"pwh_level_ussingen_wrong_way_01",
				"pwh_level_ussingen_wrong_way_02",
				"pwh_level_ussingen_wrong_way_03",
				"pwh_level_ussingen_wrong_way_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.8107914924622,
				6.1543960571289,
				5.9769372940064,
				3.3961250782013
			}
		},
		pwh_level_ussingen_spotting_manor = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_spotting_manor_01",
				"pwh_level_ussingen_spotting_manor_02",
				"pwh_level_ussingen_spotting_manor_03",
				"pwh_level_ussingen_spotting_manor_04"
			},
			sound_events = {
				"pwh_level_ussingen_spotting_manor_01",
				"pwh_level_ussingen_spotting_manor_02",
				"pwh_level_ussingen_spotting_manor_03",
				"pwh_level_ussingen_spotting_manor_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.531729221344,
				2.9665832519531,
				3.1598749160767,
				2.3540000915527
			}
		},
		pwh_ussingen_intro_b = {
			face_animations_n = 2,
			database = "witch_hunter_ussingen",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_ussingen_intro_b_01",
				[2.0] = "pwh_ussingen_intro_b_02"
			},
			sound_events = {
				[1.0] = "pwh_ussingen_intro_b_01",
				[2.0] = "pwh_ussingen_intro_b_02"
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
				[1.0] = 2.9406666755676,
				[2.0] = 7.3495416641235
			}
		},
		pwh_level_ussingen_caravan = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_caravan_01",
				"pwh_level_ussingen_caravan_02",
				"pwh_level_ussingen_caravan_03",
				"pwh_level_ussingen_caravan_04"
			},
			sound_events = {
				"pwh_level_ussingen_caravan_01",
				"pwh_level_ussingen_caravan_02",
				"pwh_level_ussingen_caravan_03",
				"pwh_level_ussingen_caravan_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				6.5678958892822,
				4.9969582557678,
				5.5576872825623,
				4.9460000991821
			}
		},
		pwh_ussingen_intro_c = {
			face_animations_n = 2,
			database = "witch_hunter_ussingen",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_ussingen_intro_c_01",
				[2.0] = "pwh_ussingen_intro_c_02"
			},
			sound_events = {
				[1.0] = "pwh_ussingen_intro_c_01",
				[2.0] = "pwh_ussingen_intro_c_02"
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
				[1.0] = 4.5384583473206,
				[2.0] = 3.6921458244324
			}
		},
		pwh_level_ussingen_thick_smoke = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_thick_smoke_01",
				"pwh_level_ussingen_thick_smoke_02",
				"pwh_level_ussingen_thick_smoke_03",
				"pwh_level_ussingen_thick_smoke_04"
			},
			sound_events = {
				"pwh_level_ussingen_thick_smoke_01",
				"pwh_level_ussingen_thick_smoke_02",
				"pwh_level_ussingen_thick_smoke_03",
				"pwh_level_ussingen_thick_smoke_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				8.3112287521362,
				4.3544998168945,
				5.415958404541,
				5.9980626106262
			}
		},
		pwh_level_ussingen_gatehouse = {
			face_animations_n = 3,
			database = "witch_hunter_ussingen",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_gatehouse_01",
				"pwh_level_ussingen_gatehouse_02",
				"pwh_level_ussingen_gatehouse_04"
			},
			sound_events = {
				"pwh_level_ussingen_gatehouse_01",
				"pwh_level_ussingen_gatehouse_02",
				"pwh_level_ussingen_gatehouse_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				7.4451251029968,
				4.8858332633972,
				4.8322291374206
			}
		},
		pwh_level_ussingen_stockpile_burned = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_stockpile_burned_01",
				"pwh_level_ussingen_stockpile_burned_02",
				"pwh_level_ussingen_stockpile_burned_03",
				"pwh_level_ussingen_stockpile_burned_04"
			},
			sound_events = {
				"pwh_level_ussingen_stockpile_burned_01",
				"pwh_level_ussingen_stockpile_burned_02",
				"pwh_level_ussingen_stockpile_burned_03",
				"pwh_level_ussingen_stockpile_burned_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.1459999084473,
				4.5374374389648,
				3.2752916812897,
				5.6174373626709
			}
		},
		pwh_level_ussingen_doomed_town = {
			face_animations_n = 4,
			database = "witch_hunter_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_ussingen_doomed_town_01",
				"pwh_level_ussingen_doomed_town_02",
				"pwh_level_ussingen_doomed_town_03",
				"pwh_level_ussingen_doomed_town_04"
			},
			sound_events = {
				"pwh_level_ussingen_doomed_town_01",
				"pwh_level_ussingen_doomed_town_02",
				"pwh_level_ussingen_doomed_town_03",
				"pwh_level_ussingen_doomed_town_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.5481247901917,
				6.0150208473206,
				5.916895866394,
				5.3695206642151
			}
		}
	})
end
