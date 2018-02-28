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
		name = "pes_level_ussingen_what_next",
		response = "pes_level_ussingen_what_next",
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
				"level_ussingen_what_next"
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
				"level_ussingen_what_next",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_what_next",
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
		name = "pes_level_ussingen_gate_closed",
		response = "pes_level_ussingen_gate_closed",
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
		name = "pes_level_ussingen_manor_found",
		response = "pes_level_ussingen_manor_found",
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
	define_rule({
		name = "pes_level_ussingen_cart_torch",
		response = "pes_level_ussingen_cart_torch",
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
				"level_ussingen_cart_torch"
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
				"level_ussingen_cart_torch",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ussingen_cart_torch",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pes_level_ussingen_manor_found = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_manor_found_01",
				"pes_level_ussingen_manor_found_02",
				"pes_level_ussingen_manor_found_03",
				"pes_level_ussingen_manor_found_04"
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
			localization_strings = {
				"pes_level_ussingen_manor_found_01",
				"pes_level_ussingen_manor_found_02",
				"pes_level_ussingen_manor_found_03",
				"pes_level_ussingen_manor_found_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_devastation = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_devastation_01",
				"pes_level_ussingen_devastation_02",
				"pes_level_ussingen_devastation_03",
				"pes_level_ussingen_devastation_04"
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
			localization_strings = {
				"pes_level_ussingen_devastation_01",
				"pes_level_ussingen_devastation_02",
				"pes_level_ussingen_devastation_03",
				"pes_level_ussingen_devastation_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_caravan = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_caravan_01",
				"pes_level_ussingen_caravan_02",
				"pes_level_ussingen_caravan_03",
				"pes_level_ussingen_caravan_04"
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
			localization_strings = {
				"pes_level_ussingen_caravan_01",
				"pes_level_ussingen_caravan_02",
				"pes_level_ussingen_caravan_03",
				"pes_level_ussingen_caravan_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_thick_smoke = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_thick_smoke_01",
				"pes_level_ussingen_thick_smoke_02",
				"pes_level_ussingen_thick_smoke_03",
				"pes_level_ussingen_thick_smoke_04"
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
			localization_strings = {
				"pes_level_ussingen_thick_smoke_01",
				"pes_level_ussingen_thick_smoke_02",
				"pes_level_ussingen_thick_smoke_03",
				"pes_level_ussingen_thick_smoke_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_stockpile_burned = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_stockpile_burned_01",
				"pes_level_ussingen_stockpile_burned_02",
				"pes_level_ussingen_stockpile_burned_03",
				"pes_level_ussingen_stockpile_burned_04"
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
			localization_strings = {
				"pes_level_ussingen_stockpile_burned_01",
				"pes_level_ussingen_stockpile_burned_02",
				"pes_level_ussingen_stockpile_burned_03",
				"pes_level_ussingen_stockpile_burned_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_cart_full = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_cart_full_01",
				"pes_level_ussingen_cart_full_02",
				"pes_level_ussingen_cart_full_03",
				"pes_level_ussingen_cart_full_04"
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
			localization_strings = {
				"pes_level_ussingen_cart_full_01",
				"pes_level_ussingen_cart_full_02",
				"pes_level_ussingen_cart_full_03",
				"pes_level_ussingen_cart_full_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_cart_idea = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_cart_idea_01",
				"pes_level_ussingen_cart_idea_02",
				"pes_level_ussingen_cart_idea_03",
				"pes_level_ussingen_cart_idea_04"
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
			localization_strings = {
				"pes_level_ussingen_cart_idea_01",
				"pes_level_ussingen_cart_idea_02",
				"pes_level_ussingen_cart_idea_03",
				"pes_level_ussingen_cart_idea_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_spotting_manor = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_spotting_manor_01",
				"pes_level_ussingen_spotting_manor_02",
				"pes_level_ussingen_spotting_manor_03",
				"pes_level_ussingen_spotting_manor_04"
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
			localization_strings = {
				"pes_level_ussingen_spotting_manor_01",
				"pes_level_ussingen_spotting_manor_02",
				"pes_level_ussingen_spotting_manor_03",
				"pes_level_ussingen_spotting_manor_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_cart_torch = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_cart_torch_01",
				"pes_level_ussingen_cart_torch_02",
				"pes_level_ussingen_cart_torch_03",
				"pes_level_ussingen_cart_torch_04"
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
			localization_strings = {
				"pes_level_ussingen_cart_torch_01",
				"pes_level_ussingen_cart_torch_02",
				"pes_level_ussingen_cart_torch_03",
				"pes_level_ussingen_cart_torch_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_at_last_end = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_at_last_end_01",
				"pes_level_ussingen_at_last_end_02",
				"pes_level_ussingen_at_last_end_03",
				"pes_level_ussingen_at_last_end_04"
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
			localization_strings = {
				"pes_level_ussingen_at_last_end_01",
				"pes_level_ussingen_at_last_end_02",
				"pes_level_ussingen_at_last_end_03",
				"pes_level_ussingen_at_last_end_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_less_damaged = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_less_damaged_01",
				"pes_level_ussingen_less_damaged_02",
				"pes_level_ussingen_less_damaged_03",
				"pes_level_ussingen_less_damaged_04"
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
			localization_strings = {
				"pes_level_ussingen_less_damaged_01",
				"pes_level_ussingen_less_damaged_02",
				"pes_level_ussingen_less_damaged_03",
				"pes_level_ussingen_less_damaged_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_wrong_way = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_wrong_way_01",
				"pes_level_ussingen_wrong_way_02",
				"pes_level_ussingen_wrong_way_03",
				"pes_level_ussingen_wrong_way_04"
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
			localization_strings = {
				"pes_level_ussingen_wrong_way_01",
				"pes_level_ussingen_wrong_way_02",
				"pes_level_ussingen_wrong_way_03",
				"pes_level_ussingen_wrong_way_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_wine_cellar = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_wine_cellar_01",
				"pes_level_ussingen_wine_cellar_02",
				"pes_level_ussingen_wine_cellar_03",
				"pes_level_ussingen_wine_cellar_04"
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
			localization_strings = {
				"pes_level_ussingen_wine_cellar_01",
				"pes_level_ussingen_wine_cellar_02",
				"pes_level_ussingen_wine_cellar_03",
				"pes_level_ussingen_wine_cellar_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_find_way_around = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_find_way_around_01",
				"pes_level_ussingen_find_way_around_02",
				"pes_level_ussingen_find_way_around_03",
				"pes_level_ussingen_find_way_around_04"
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
			localization_strings = {
				"pes_level_ussingen_find_way_around_01",
				"pes_level_ussingen_find_way_around_02",
				"pes_level_ussingen_find_way_around_03",
				"pes_level_ussingen_find_way_around_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_marktplatz = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_marktplatz_01",
				"pes_level_ussingen_marktplatz_02",
				"pes_level_ussingen_marktplatz_03",
				"pes_level_ussingen_marktplatz_04"
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
			localization_strings = {
				"pes_level_ussingen_marktplatz_01",
				"pes_level_ussingen_marktplatz_02",
				"pes_level_ussingen_marktplatz_03",
				"pes_level_ussingen_marktplatz_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_way_through = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_way_through_01",
				"pes_level_ussingen_way_through_02",
				"pes_level_ussingen_way_through_03",
				"pes_level_ussingen_way_through_04"
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
			localization_strings = {
				"pes_level_ussingen_way_through_01",
				"pes_level_ussingen_way_through_02",
				"pes_level_ussingen_way_through_03",
				"pes_level_ussingen_way_through_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_hurry = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_hurry_01",
				"pes_level_ussingen_hurry_02",
				"pes_level_ussingen_hurry_03",
				"pes_level_ussingen_hurry_04"
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
			localization_strings = {
				"pes_level_ussingen_hurry_01",
				"pes_level_ussingen_hurry_02",
				"pes_level_ussingen_hurry_03",
				"pes_level_ussingen_hurry_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_spotting_town = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_spotting_town_01",
				"pes_level_ussingen_spotting_town_02",
				"pes_level_ussingen_spotting_town_03",
				"pes_level_ussingen_spotting_town_04"
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
			localization_strings = {
				"pes_level_ussingen_spotting_town_01",
				"pes_level_ussingen_spotting_town_02",
				"pes_level_ussingen_spotting_town_03",
				"pes_level_ussingen_spotting_town_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_doomed_town = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_doomed_town_01",
				"pes_level_ussingen_doomed_town_02",
				"pes_level_ussingen_doomed_town_03",
				"pes_level_ussingen_doomed_town_04"
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
			localization_strings = {
				"pes_level_ussingen_doomed_town_01",
				"pes_level_ussingen_doomed_town_02",
				"pes_level_ussingen_doomed_town_03",
				"pes_level_ussingen_doomed_town_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_gate_closed = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_gate_closed_01",
				"pes_level_ussingen_gate_closed_02",
				"pes_level_ussingen_gate_closed_03",
				"pes_level_ussingen_gate_closed_04"
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
			localization_strings = {
				"pes_level_ussingen_gate_closed_01",
				"pes_level_ussingen_gate_closed_02",
				"pes_level_ussingen_gate_closed_03",
				"pes_level_ussingen_gate_closed_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_search_for_manor = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pes_level_ussingen_search_for_manor_01",
				"pes_level_ussingen_search_for_manor_02",
				"pes_level_ussingen_search_for_manor_03"
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
			localization_strings = {
				"pes_level_ussingen_search_for_manor_01",
				"pes_level_ussingen_search_for_manor_02",
				"pes_level_ussingen_search_for_manor_03"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_escape = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_escape_01",
				"pes_level_ussingen_escape_02",
				"pes_level_ussingen_escape_03",
				"pes_level_ussingen_escape_04"
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
			localization_strings = {
				"pes_level_ussingen_escape_01",
				"pes_level_ussingen_escape_02",
				"pes_level_ussingen_escape_03",
				"pes_level_ussingen_escape_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_what_next = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_what_next_01",
				"pes_level_ussingen_what_next_02",
				"pes_level_ussingen_what_next_03",
				"pes_level_ussingen_what_next_04"
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
			localization_strings = {
				"pes_level_ussingen_what_next_01",
				"pes_level_ussingen_what_next_02",
				"pes_level_ussingen_what_next_03",
				"pes_level_ussingen_what_next_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_gatehouse = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pes_level_ussingen_gatehouse_01",
				"pes_level_ussingen_gatehouse_02",
				"pes_level_ussingen_gatehouse_04"
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
			localization_strings = {
				"pes_level_ussingen_gatehouse_01",
				"pes_level_ussingen_gatehouse_02",
				"pes_level_ussingen_gatehouse_04"
			},
			randomize_indexes = {}
		},
		pes_level_ussingen_cellar = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_ussingen_cellar_01",
				"pes_level_ussingen_cellar_02",
				"pes_level_ussingen_cellar_03",
				"pes_level_ussingen_cellar_04"
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
			localization_strings = {
				"pes_level_ussingen_cellar_01",
				"pes_level_ussingen_cellar_02",
				"pes_level_ussingen_cellar_03",
				"pes_level_ussingen_cellar_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end
