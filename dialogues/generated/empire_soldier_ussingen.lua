return function ()
	define_rule({
		name = "pes_level_ussingen_at_last_end",
		response = "pes_level_ussingen_at_last_end",
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
		name = "pes_level_ussingen_cart_full",
		response = "pes_level_ussingen_cart_full",
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
		name = "pes_level_ussingen_cart_idea",
		response = "pes_level_ussingen_cart_idea",
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
				"level_ussingen_cart_idea"
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
				"level_ussingen_cart_idea",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_cart_idea",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_ussingen_cellar",
		response = "pes_level_ussingen_cellar",
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
		name = "pes_level_ussingen_doomed_town",
		response = "pes_level_ussingen_doomed_town",
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
		name = "pes_level_ussingen_escape",
		response = "pes_level_ussingen_escape",
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
		name = "pes_level_ussingen_gatehouse",
		response = "pes_level_ussingen_gatehouse",
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
		name = "pes_level_ussingen_hurry",
		response = "pes_level_ussingen_hurry",
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
		name = "pes_level_ussingen_less_damaged",
		response = "pes_level_ussingen_less_damaged",
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
		name = "pes_level_ussingen_stockpile_burned",
		response = "pes_level_ussingen_stockpile_burned",
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
		name = "pes_level_ussingen_thick_smoke",
		response = "pes_level_ussingen_thick_smoke",
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
		name = "pes_level_ussingen_way_through",
		response = "pes_level_ussingen_way_through",
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
		name = "pes_level_ussingen_spotting_town",
		response = "pes_level_ussingen_spotting_town",
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
		name = "pes_level_ussingen_caravan",
		response = "pes_level_ussingen_caravan",
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
		name = "pes_level_ussingen_devastation",
		response = "pes_level_ussingen_devastation",
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
		name = "pes_level_ussingen_search_for_manor",
		response = "pes_level_ussingen_search_for_manor",
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
		name = "pes_level_ussingen_marktplatz",
		response = "pes_level_ussingen_marktplatz",
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
				"level_ussingen_marktplatz"
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
				"level_ussingen_marktplatz",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_marktplatz",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_ussingen_wrong_way",
		response = "pes_level_ussingen_wrong_way",
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
		name = "pes_level_ussingen_wine_cellar",
		response = "pes_level_ussingen_wine_cellar",
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
		name = "pes_level_ussingen_spotting_manor",
		response = "pes_level_ussingen_spotting_manor",
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
		name = "pes_level_ussingen_find_way_around",
		response = "pes_level_ussingen_find_way_around",
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
		name = "pes_ussingen_intro_a",
		response = "pes_ussingen_intro_a",
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
		name = "pes_ussingen_intro_b",
		response = "pes_ussingen_intro_b",
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
				"empire_soldier"
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
		name = "pes_ussingen_intro_c",
		response = "pes_ussingen_intro_c",
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
				"empire_soldier"
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
	add_dialogues({
		pes_level_ussingen_hurry = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_hurry_01",
				"pes_level_ussingen_hurry_02",
				"pes_level_ussingen_hurry_03",
				"pes_level_ussingen_hurry_04"
			},
			sound_events = {
				"pes_level_ussingen_hurry_01",
				"pes_level_ussingen_hurry_02",
				"pes_level_ussingen_hurry_03",
				"pes_level_ussingen_hurry_04"
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
				1.796395778656,
				2.5667083263397,
				2.204916715622,
				2.1741459369659
			}
		},
		pes_level_ussingen_cart_idea = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_cart_idea_01",
				"pes_level_ussingen_cart_idea_02",
				"pes_level_ussingen_cart_idea_03",
				"pes_level_ussingen_cart_idea_04"
			},
			sound_events = {
				"pes_level_ussingen_cart_idea_01",
				"pes_level_ussingen_cart_idea_02",
				"pes_level_ussingen_cart_idea_03",
				"pes_level_ussingen_cart_idea_04"
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
				3.5391770601273,
				4.2493333816528,
				3.0557708740234,
				4.0239582061768
			}
		},
		pes_level_ussingen_gatehouse = {
			face_animations_n = 3,
			database = "empire_soldier_ussingen",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_gatehouse_01",
				"pes_level_ussingen_gatehouse_02",
				"pes_level_ussingen_gatehouse_04"
			},
			sound_events = {
				"pes_level_ussingen_gatehouse_01",
				"pes_level_ussingen_gatehouse_02",
				"pes_level_ussingen_gatehouse_04"
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
				4.261146068573,
				4.8223333358765,
				3.8589582443237
			}
		},
		pes_level_ussingen_doomed_town = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_doomed_town_01",
				"pes_level_ussingen_doomed_town_02",
				"pes_level_ussingen_doomed_town_03",
				"pes_level_ussingen_doomed_town_04"
			},
			sound_events = {
				"pes_level_ussingen_doomed_town_01",
				"pes_level_ussingen_doomed_town_02",
				"pes_level_ussingen_doomed_town_03",
				"pes_level_ussingen_doomed_town_04"
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
				4.3022084236145,
				6.8772501945496,
				4.1010417938232,
				4.6380624771118
			}
		},
		pes_ussingen_intro_c = {
			face_animations_n = 2,
			database = "empire_soldier_ussingen",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_ussingen_intro_c_01",
				[2.0] = "pes_ussingen_intro_c_02"
			},
			sound_events = {
				[1.0] = "pes_ussingen_intro_c_01",
				[2.0] = "pes_ussingen_intro_c_02"
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
				[1.0] = 6.4578747749329,
				[2.0] = 6.4307708740234
			}
		},
		pes_level_ussingen_less_damaged = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_less_damaged_01",
				"pes_level_ussingen_less_damaged_02",
				"pes_level_ussingen_less_damaged_03",
				"pes_level_ussingen_less_damaged_04"
			},
			sound_events = {
				"pes_level_ussingen_less_damaged_01",
				"pes_level_ussingen_less_damaged_02",
				"pes_level_ussingen_less_damaged_03",
				"pes_level_ussingen_less_damaged_04"
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
				2.7014999389648,
				6.4931874275208,
				3.321270942688,
				2.5295207500458
			}
		},
		pes_ussingen_intro_b = {
			face_animations_n = 2,
			database = "empire_soldier_ussingen",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_ussingen_intro_b_01",
				[2.0] = "pes_ussingen_intro_b_02"
			},
			sound_events = {
				[1.0] = "pes_ussingen_intro_b_01",
				[2.0] = "pes_ussingen_intro_b_02"
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
				[1.0] = 6.4898958206177,
				[2.0] = 5.5479168891907
			}
		},
		pes_level_ussingen_devastation = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_devastation_01",
				"pes_level_ussingen_devastation_02",
				"pes_level_ussingen_devastation_03",
				"pes_level_ussingen_devastation_04"
			},
			sound_events = {
				"pes_level_ussingen_devastation_01",
				"pes_level_ussingen_devastation_02",
				"pes_level_ussingen_devastation_03",
				"pes_level_ussingen_devastation_04"
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
				5.0673956871033,
				5.0506978034973,
				4.9562706947327,
				6.3349375724792
			}
		},
		pes_level_ussingen_escape = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_escape_01",
				"pes_level_ussingen_escape_02",
				"pes_level_ussingen_escape_03",
				"pes_level_ussingen_escape_04"
			},
			sound_events = {
				"pes_level_ussingen_escape_01",
				"pes_level_ussingen_escape_02",
				"pes_level_ussingen_escape_03",
				"pes_level_ussingen_escape_04"
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
				2.6188542842865,
				2.5341041088104,
				3.4588124752045,
				5.7206249237061
			}
		},
		pes_level_ussingen_cellar = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_cellar_01",
				"pes_level_ussingen_cellar_02",
				"pes_level_ussingen_cellar_03",
				"pes_level_ussingen_cellar_04"
			},
			sound_events = {
				"pes_level_ussingen_cellar_01",
				"pes_level_ussingen_cellar_02",
				"pes_level_ussingen_cellar_03",
				"pes_level_ussingen_cellar_04"
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
				1.7814999818802,
				1.9860208034515,
				2.5190207958221,
				2.2358124256134
			}
		},
		pes_level_ussingen_find_way_around = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_find_way_around_01",
				"pes_level_ussingen_find_way_around_02",
				"pes_level_ussingen_find_way_around_03",
				"pes_level_ussingen_find_way_around_04"
			},
			sound_events = {
				"pes_level_ussingen_find_way_around_01",
				"pes_level_ussingen_find_way_around_02",
				"pes_level_ussingen_find_way_around_03",
				"pes_level_ussingen_find_way_around_04"
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
				1.4530832767487,
				2.4639582633972,
				2.4063959121704,
				1.8260833024979
			}
		},
		pes_level_ussingen_stockpile_burned = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_stockpile_burned_01",
				"pes_level_ussingen_stockpile_burned_02",
				"pes_level_ussingen_stockpile_burned_03",
				"pes_level_ussingen_stockpile_burned_04"
			},
			sound_events = {
				"pes_level_ussingen_stockpile_burned_01",
				"pes_level_ussingen_stockpile_burned_02",
				"pes_level_ussingen_stockpile_burned_03",
				"pes_level_ussingen_stockpile_burned_04"
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
				1.3650208711624,
				4.1781772375107,
				2.5027916431427,
				3.5213124752045
			}
		},
		pes_level_ussingen_search_for_manor = {
			face_animations_n = 3,
			database = "empire_soldier_ussingen",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_search_for_manor_01",
				"pes_level_ussingen_search_for_manor_02",
				"pes_level_ussingen_search_for_manor_03"
			},
			sound_events = {
				"pes_level_ussingen_search_for_manor_01",
				"pes_level_ussingen_search_for_manor_02",
				"pes_level_ussingen_search_for_manor_03"
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
				2.392499923706,
				2.2616875171661,
				1.9606041908264
			}
		},
		pes_level_ussingen_thick_smoke = {
			face_animations_n = 3,
			database = "empire_soldier_ussingen",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_thick_smoke_01",
				"pes_level_ussingen_thick_smoke_03",
				"pes_level_ussingen_thick_smoke_04"
			},
			sound_events = {
				"pes_level_ussingen_thick_smoke_01",
				"pes_level_ussingen_thick_smoke_03",
				"pes_level_ussingen_thick_smoke_04"
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
				1.8107708692551,
				3.9058332443237,
				5.0215625762939
			}
		},
		pes_level_ussingen_spotting_manor = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_spotting_manor_01",
				"pes_level_ussingen_spotting_manor_02",
				"pes_level_ussingen_spotting_manor_03",
				"pes_level_ussingen_spotting_manor_04"
			},
			sound_events = {
				"pes_level_ussingen_spotting_manor_01",
				"pes_level_ussingen_spotting_manor_02",
				"pes_level_ussingen_spotting_manor_03",
				"pes_level_ussingen_spotting_manor_04"
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
				1.8630207777023,
				2.0986042022705,
				4.5054793357849,
				1.1374583244324
			}
		},
		pes_level_ussingen_cart_full = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_cart_full_01",
				"pes_level_ussingen_cart_full_02",
				"pes_level_ussingen_cart_full_03",
				"pes_level_ussingen_cart_full_04"
			},
			sound_events = {
				"pes_level_ussingen_cart_full_01",
				"pes_level_ussingen_cart_full_02",
				"pes_level_ussingen_cart_full_03",
				"pes_level_ussingen_cart_full_04"
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
				3.8033230304718,
				2.1428332328796,
				2.0068957805634,
				3.585458278656
			}
		},
		pes_level_ussingen_way_through = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_way_through_01",
				"pes_level_ussingen_way_through_02",
				"pes_level_ussingen_way_through_03",
				"pes_level_ussingen_way_through_04"
			},
			sound_events = {
				"pes_level_ussingen_way_through_01",
				"pes_level_ussingen_way_through_02",
				"pes_level_ussingen_way_through_03",
				"pes_level_ussingen_way_through_04"
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
				2.6318125724792,
				3.5222084522247,
				2.7486667633057,
				3.1354582309723
			}
		},
		pes_level_ussingen_at_last_end = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_at_last_end_01",
				"pes_level_ussingen_at_last_end_02",
				"pes_level_ussingen_at_last_end_03",
				"pes_level_ussingen_at_last_end_04"
			},
			sound_events = {
				"pes_level_ussingen_at_last_end_01",
				"pes_level_ussingen_at_last_end_02",
				"pes_level_ussingen_at_last_end_03",
				"pes_level_ussingen_at_last_end_04"
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
				2.7547082901001,
				2.5494375228882,
				2.9492707252502,
				2.6584792137146
			}
		},
		pes_level_ussingen_wrong_way = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_wrong_way_01",
				"pes_level_ussingen_wrong_way_02",
				"pes_level_ussingen_wrong_way_03",
				"pes_level_ussingen_wrong_way_04"
			},
			sound_events = {
				"pes_level_ussingen_wrong_way_01",
				"pes_level_ussingen_wrong_way_02",
				"pes_level_ussingen_wrong_way_03",
				"pes_level_ussingen_wrong_way_04"
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
				2.9933540821075,
				2.0056042671204,
				2.3732082843781,
				3.4901874065399
			}
		},
		pes_level_ussingen_marktplatz = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_marktplatz_01",
				"pes_level_ussingen_marktplatz_02",
				"pes_level_ussingen_marktplatz_03",
				"pes_level_ussingen_marktplatz_04"
			},
			sound_events = {
				"pes_level_ussingen_marktplatz_01",
				"pes_level_ussingen_marktplatz_02",
				"pes_level_ussingen_marktplatz_03",
				"pes_level_ussingen_marktplatz_04"
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
				6.2487916946411,
				5.8918333053589,
				3.1692500114441,
				4.3039374351502
			}
		},
		pes_level_ussingen_spotting_town = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_spotting_town_01",
				"pes_level_ussingen_spotting_town_02",
				"pes_level_ussingen_spotting_town_03",
				"pes_level_ussingen_spotting_town_04"
			},
			sound_events = {
				"pes_level_ussingen_spotting_town_01",
				"pes_level_ussingen_spotting_town_02",
				"pes_level_ussingen_spotting_town_03",
				"pes_level_ussingen_spotting_town_04"
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
				8.2615623474121,
				4.9712290763855,
				5.3424582481384,
				6.9219999313355
			}
		},
		pes_ussingen_intro_a = {
			face_animations_n = 2,
			database = "empire_soldier_ussingen",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_ussingen_intro_a_01",
				[2.0] = "pes_ussingen_intro_a_02"
			},
			sound_events = {
				[1.0] = "pes_ussingen_intro_a_01",
				[2.0] = "pes_ussingen_intro_a_02"
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
				[1.0] = 5.8199582099915,
				[2.0] = 4.5999999046326
			}
		},
		pes_level_ussingen_wine_cellar = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_wine_cellar_01",
				"pes_level_ussingen_wine_cellar_02",
				"pes_level_ussingen_wine_cellar_03",
				"pes_level_ussingen_wine_cellar_04"
			},
			sound_events = {
				"pes_level_ussingen_wine_cellar_01",
				"pes_level_ussingen_wine_cellar_02",
				"pes_level_ussingen_wine_cellar_03",
				"pes_level_ussingen_wine_cellar_04"
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
				3.6202812194824,
				4.6640210151672,
				4.0823335647583,
				4.5768332481384
			}
		},
		pes_level_ussingen_caravan = {
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_ussingen_caravan_01",
				"pes_level_ussingen_caravan_02",
				"pes_level_ussingen_caravan_03",
				"pes_level_ussingen_caravan_04"
			},
			sound_events = {
				"pes_level_ussingen_caravan_01",
				"pes_level_ussingen_caravan_02",
				"pes_level_ussingen_caravan_03",
				"pes_level_ussingen_caravan_04"
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
				5.6506042480469,
				5.9289999008179,
				5.5411667823792,
				3.4078333377838
			}
		}
	})
end
