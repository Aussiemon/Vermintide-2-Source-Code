return function ()
	define_rule({
		name = "pwe_level_ussingen_at_last_end",
		response = "pwe_level_ussingen_at_last_end",
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
		name = "pwe_level_ussingen_cart_full",
		response = "pwe_level_ussingen_cart_full",
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
		name = "pwe_level_ussingen_cart_idea",
		response = "pwe_level_ussingen_cart_idea",
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
		name = "pwe_level_ussingen_cellar",
		response = "pwe_level_ussingen_cellar",
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
		name = "pwe_level_ussingen_doomed_town",
		response = "pwe_level_ussingen_doomed_town",
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
		name = "pwe_level_ussingen_escape",
		response = "pwe_level_ussingen_escape",
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
		name = "pwe_level_ussingen_gatehouse",
		response = "pwe_level_ussingen_gatehouse",
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
		name = "pwe_level_ussingen_hurry",
		response = "pwe_level_ussingen_hurry",
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
		name = "pwe_level_ussingen_less_damaged",
		response = "pwe_level_ussingen_less_damaged",
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
		name = "pwe_level_ussingen_stockpile_burned",
		response = "pwe_level_ussingen_stockpile_burned",
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
		name = "pwe_level_ussingen_thick_smoke",
		response = "pwe_level_ussingen_thick_smoke",
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
		name = "pwe_level_ussingen_way_through",
		response = "pwe_level_ussingen_way_through",
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
		name = "pwe_level_ussingen_spotting_town",
		response = "pwe_level_ussingen_spotting_town",
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
		name = "pwe_level_ussingen_caravan",
		response = "pwe_level_ussingen_caravan",
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
		name = "pwe_level_ussingen_devastation",
		response = "pwe_level_ussingen_devastation",
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
		name = "pwe_level_ussingen_search_for_manor",
		response = "pwe_level_ussingen_search_for_manor",
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
		name = "pwe_level_ussingen_marktplatz",
		response = "pwe_level_ussingen_marktplatz",
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
		name = "pwe_level_ussingen_wrong_way",
		response = "pwe_level_ussingen_wrong_way",
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
		name = "pwe_level_ussingen_wine_cellar",
		response = "pwe_level_ussingen_wine_cellar",
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
		name = "pwe_level_ussingen_spotting_manor",
		response = "pwe_level_ussingen_spotting_manor",
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
		name = "pwe_level_ussingen_find_way_around",
		response = "pwe_level_ussingen_find_way_around",
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
		pwe_level_ussingen_way_through = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_way_through_01",
				"pwe_level_ussingen_way_through_02",
				"pwe_level_ussingen_way_through_03",
				"pwe_level_ussingen_way_through_04"
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
				"pwe_level_ussingen_way_through_01",
				"pwe_level_ussingen_way_through_02",
				"pwe_level_ussingen_way_through_03",
				"pwe_level_ussingen_way_through_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_search_for_manor = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pwe_level_ussingen_search_for_manor_01",
				"pwe_level_ussingen_search_for_manor_02",
				"pwe_level_ussingen_search_for_manor_03"
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
				"pwe_level_ussingen_search_for_manor_01",
				"pwe_level_ussingen_search_for_manor_02",
				"pwe_level_ussingen_search_for_manor_03"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_less_damaged = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_less_damaged_01",
				"pwe_level_ussingen_less_damaged_02",
				"pwe_level_ussingen_less_damaged_03",
				"pwe_level_ussingen_less_damaged_04"
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
				"pwe_level_ussingen_less_damaged_01",
				"pwe_level_ussingen_less_damaged_02",
				"pwe_level_ussingen_less_damaged_03",
				"pwe_level_ussingen_less_damaged_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_cart_full = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_cart_full_01",
				"pwe_level_ussingen_cart_full_02",
				"pwe_level_ussingen_cart_full_03",
				"pwe_level_ussingen_cart_full_04"
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
				"pwe_level_ussingen_cart_full_01",
				"pwe_level_ussingen_cart_full_02",
				"pwe_level_ussingen_cart_full_03",
				"pwe_level_ussingen_cart_full_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_hurry = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_hurry_01",
				"pwe_level_ussingen_hurry_02",
				"pwe_level_ussingen_hurry_03",
				"pwe_level_ussingen_hurry_04"
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
				"pwe_level_ussingen_hurry_01",
				"pwe_level_ussingen_hurry_02",
				"pwe_level_ussingen_hurry_03",
				"pwe_level_ussingen_hurry_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_spotting_town = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_spotting_town_01",
				"pwe_level_ussingen_spotting_town_02",
				"pwe_level_ussingen_spotting_town_03",
				"pwe_level_ussingen_spotting_town_04"
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
				"pwe_level_ussingen_spotting_town_01",
				"pwe_level_ussingen_spotting_town_02",
				"pwe_level_ussingen_spotting_town_03",
				"pwe_level_ussingen_spotting_town_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_cellar = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_cellar_01",
				"pwe_level_ussingen_cellar_02",
				"pwe_level_ussingen_cellar_03",
				"pwe_level_ussingen_cellar_04"
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
				"pwe_level_ussingen_cellar_01",
				"pwe_level_ussingen_cellar_02",
				"pwe_level_ussingen_cellar_03",
				"pwe_level_ussingen_cellar_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_thick_smoke = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_thick_smoke_01",
				"pwe_level_ussingen_thick_smoke_02",
				"pwe_level_ussingen_thick_smoke_03",
				"pwe_level_ussingen_thick_smoke_04"
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
				"pwe_level_ussingen_thick_smoke_01",
				"pwe_level_ussingen_thick_smoke_02",
				"pwe_level_ussingen_thick_smoke_03",
				"pwe_level_ussingen_thick_smoke_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_doomed_town = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_doomed_town_01",
				"pwe_level_ussingen_doomed_town_02",
				"pwe_level_ussingen_doomed_town_03",
				"pwe_level_ussingen_doomed_town_04"
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
				"pwe_level_ussingen_doomed_town_01",
				"pwe_level_ussingen_doomed_town_02",
				"pwe_level_ussingen_doomed_town_03",
				"pwe_level_ussingen_doomed_town_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_escape = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_escape_01",
				"pwe_level_ussingen_escape_02",
				"pwe_level_ussingen_escape_03",
				"pwe_level_ussingen_escape_04"
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
				"pwe_level_ussingen_escape_01",
				"pwe_level_ussingen_escape_02",
				"pwe_level_ussingen_escape_03",
				"pwe_level_ussingen_escape_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_devastation = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_devastation_01",
				"pwe_level_ussingen_devastation_02",
				"pwe_level_ussingen_devastation_03",
				"pwe_level_ussingen_devastation_04"
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
				"pwe_level_ussingen_devastation_01",
				"pwe_level_ussingen_devastation_02",
				"pwe_level_ussingen_devastation_03",
				"pwe_level_ussingen_devastation_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_caravan = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_caravan_01",
				"pwe_level_ussingen_caravan_02",
				"pwe_level_ussingen_caravan_03",
				"pwe_level_ussingen_caravan_04"
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
				"pwe_level_ussingen_caravan_01",
				"pwe_level_ussingen_caravan_02",
				"pwe_level_ussingen_caravan_03",
				"pwe_level_ussingen_caravan_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_stockpile_burned = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_stockpile_burned_01",
				"pwe_level_ussingen_stockpile_burned_02",
				"pwe_level_ussingen_stockpile_burned_03",
				"pwe_level_ussingen_stockpile_burned_04"
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
				"pwe_level_ussingen_stockpile_burned_01",
				"pwe_level_ussingen_stockpile_burned_02",
				"pwe_level_ussingen_stockpile_burned_03",
				"pwe_level_ussingen_stockpile_burned_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_marktplatz = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_marktplatz_01",
				"pwe_level_ussingen_marktplatz_02",
				"pwe_level_ussingen_marktplatz_03",
				"pwe_level_ussingen_marktplatz_04"
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
				"pwe_level_ussingen_marktplatz_01",
				"pwe_level_ussingen_marktplatz_02",
				"pwe_level_ussingen_marktplatz_03",
				"pwe_level_ussingen_marktplatz_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_wine_cellar = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_wine_cellar_01",
				"pwe_level_ussingen_wine_cellar_02",
				"pwe_level_ussingen_wine_cellar_03",
				"pwe_level_ussingen_wine_cellar_04"
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
				"pwe_level_ussingen_wine_cellar_01",
				"pwe_level_ussingen_wine_cellar_02",
				"pwe_level_ussingen_wine_cellar_03",
				"pwe_level_ussingen_wine_cellar_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_find_way_around = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_find_way_around_01",
				"pwe_level_ussingen_find_way_around_02",
				"pwe_level_ussingen_find_way_around_03",
				"pwe_level_ussingen_find_way_around_04"
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
				"pwe_level_ussingen_find_way_around_01",
				"pwe_level_ussingen_find_way_around_02",
				"pwe_level_ussingen_find_way_around_03",
				"pwe_level_ussingen_find_way_around_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_cart_idea = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_cart_idea_01",
				"pwe_level_ussingen_cart_idea_02",
				"pwe_level_ussingen_cart_idea_03",
				"pwe_level_ussingen_cart_idea_04"
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
				"pwe_level_ussingen_cart_idea_01",
				"pwe_level_ussingen_cart_idea_02",
				"pwe_level_ussingen_cart_idea_03",
				"pwe_level_ussingen_cart_idea_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_spotting_manor = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_spotting_manor_01",
				"pwe_level_ussingen_spotting_manor_02",
				"pwe_level_ussingen_spotting_manor_03",
				"pwe_level_ussingen_spotting_manor_04"
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
				"pwe_level_ussingen_spotting_manor_01",
				"pwe_level_ussingen_spotting_manor_02",
				"pwe_level_ussingen_spotting_manor_03",
				"pwe_level_ussingen_spotting_manor_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_gatehouse = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pwe_level_ussingen_gatehouse_01",
				"pwe_level_ussingen_gatehouse_02",
				"pwe_level_ussingen_gatehouse_04"
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
				"pwe_level_ussingen_gatehouse_01",
				"pwe_level_ussingen_gatehouse_02",
				"pwe_level_ussingen_gatehouse_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_at_last_end = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_at_last_end_01",
				"pwe_level_ussingen_at_last_end_02",
				"pwe_level_ussingen_at_last_end_03",
				"pwe_level_ussingen_at_last_end_04"
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
				"pwe_level_ussingen_at_last_end_01",
				"pwe_level_ussingen_at_last_end_02",
				"pwe_level_ussingen_at_last_end_03",
				"pwe_level_ussingen_at_last_end_04"
			},
			randomize_indexes = {}
		},
		pwe_level_ussingen_wrong_way = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_ussingen_wrong_way_01",
				"pwe_level_ussingen_wrong_way_02",
				"pwe_level_ussingen_wrong_way_03",
				"pwe_level_ussingen_wrong_way_04"
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
				"pwe_level_ussingen_wrong_way_01",
				"pwe_level_ussingen_wrong_way_02",
				"pwe_level_ussingen_wrong_way_03",
				"pwe_level_ussingen_wrong_way_04"
			},
			randomize_indexes = {}
		}
	})
end
