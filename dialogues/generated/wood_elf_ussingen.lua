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
	add_dialogues({
		pwe_level_ussingen_at_last_end = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
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
				"pwe_level_ussingen_at_last_end_01",
				"pwe_level_ussingen_at_last_end_02",
				"pwe_level_ussingen_at_last_end_03",
				"pwe_level_ussingen_at_last_end_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_at_last_end_01",
				"pwe_level_ussingen_at_last_end_02",
				"pwe_level_ussingen_at_last_end_03",
				"pwe_level_ussingen_at_last_end_04"
			},
			sound_events_duration = {
				4.3180623054504,
				4.4443335533142,
				6.0562705993652,
				5.477041721344
			}
		},
		pwe_level_ussingen_caravan = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
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
				"pwe_level_ussingen_caravan_01",
				"pwe_level_ussingen_caravan_02",
				"pwe_level_ussingen_caravan_03",
				"pwe_level_ussingen_caravan_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_caravan_01",
				"pwe_level_ussingen_caravan_02",
				"pwe_level_ussingen_caravan_03",
				"pwe_level_ussingen_caravan_04"
			},
			sound_events_duration = {
				3.1367917060852,
				2.5155832767487,
				3.088770866394,
				4.9071459770203
			}
		},
		pwe_level_ussingen_cart_full = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_cart_full_01",
				"pwe_level_ussingen_cart_full_02",
				"pwe_level_ussingen_cart_full_03",
				"pwe_level_ussingen_cart_full_04"
			},
			sound_events_duration = {
				3.3564791679382,
				4.4048542976379,
				5.8232707977295,
				3.6150000095367
			}
		},
		pwe_level_ussingen_cart_idea = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_cart_idea_01",
				"pwe_level_ussingen_cart_idea_02",
				"pwe_level_ussingen_cart_idea_03",
				"pwe_level_ussingen_cart_idea_04"
			},
			sound_events_duration = {
				5.8447499275208,
				5.1698956489563,
				4.7903332710266,
				3.7925832271576
			}
		},
		pwe_level_ussingen_cellar = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_cellar_01",
				"pwe_level_ussingen_cellar_02",
				"pwe_level_ussingen_cellar_03",
				"pwe_level_ussingen_cellar_04"
			},
			sound_events_duration = {
				2.8633124828339,
				3.1852707862854,
				1.7802395820618,
				5.5535416603088
			}
		},
		pwe_level_ussingen_devastation = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
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
				"pwe_level_ussingen_devastation_01",
				"pwe_level_ussingen_devastation_02",
				"pwe_level_ussingen_devastation_03",
				"pwe_level_ussingen_devastation_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_devastation_01",
				"pwe_level_ussingen_devastation_02",
				"pwe_level_ussingen_devastation_03",
				"pwe_level_ussingen_devastation_04"
			},
			sound_events_duration = {
				2.3815417289734,
				4.0616664886475,
				5.3263125419617,
				4.7785210609436
			}
		},
		pwe_level_ussingen_doomed_town = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_doomed_town_01",
				"pwe_level_ussingen_doomed_town_02",
				"pwe_level_ussingen_doomed_town_03",
				"pwe_level_ussingen_doomed_town_04"
			},
			sound_events_duration = {
				6.7635416984558,
				5.9404997825623,
				6.0305209159851,
				3.9647707939148
			}
		},
		pwe_level_ussingen_escape = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_escape_01",
				"pwe_level_ussingen_escape_02",
				"pwe_level_ussingen_escape_03",
				"pwe_level_ussingen_escape_04"
			},
			sound_events_duration = {
				2.7202084064484,
				4.7913751602173,
				3.1119582653046,
				1.9771875143051
			}
		},
		pwe_level_ussingen_find_way_around = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
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
				"pwe_level_ussingen_find_way_around_01",
				"pwe_level_ussingen_find_way_around_02",
				"pwe_level_ussingen_find_way_around_03",
				"pwe_level_ussingen_find_way_around_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_find_way_around_01",
				"pwe_level_ussingen_find_way_around_02",
				"pwe_level_ussingen_find_way_around_03",
				"pwe_level_ussingen_find_way_around_04"
			},
			sound_events_duration = {
				3.2821042537689,
				2.553614616394,
				3.2833333015442,
				2.4439165592194
			}
		},
		pwe_level_ussingen_gatehouse = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "wood_elf_ussingen",
			sound_events_n = 3,
			category = "level_talk",
			dialogue_animations_n = 3,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_gatehouse_01",
				"pwe_level_ussingen_gatehouse_02",
				"pwe_level_ussingen_gatehouse_04"
			},
			sound_events_duration = {
				2.8412916660309,
				5.4327707290649,
				2.9232082366943
			}
		},
		pwe_level_ussingen_hurry = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_hurry_01",
				"pwe_level_ussingen_hurry_02",
				"pwe_level_ussingen_hurry_03",
				"pwe_level_ussingen_hurry_04"
			},
			sound_events_duration = {
				2.3478751182556,
				2.7251875400543,
				2.7378125190735,
				2.0225625038147
			}
		},
		pwe_level_ussingen_less_damaged = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_less_damaged_01",
				"pwe_level_ussingen_less_damaged_02",
				"pwe_level_ussingen_less_damaged_03",
				"pwe_level_ussingen_less_damaged_04"
			},
			sound_events_duration = {
				2.555520772934,
				5.0170207023621,
				6.5571455955505,
				5.5162706375122
			}
		},
		pwe_level_ussingen_marktplatz = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
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
				"pwe_level_ussingen_marktplatz_01",
				"pwe_level_ussingen_marktplatz_02",
				"pwe_level_ussingen_marktplatz_03",
				"pwe_level_ussingen_marktplatz_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_marktplatz_01",
				"pwe_level_ussingen_marktplatz_02",
				"pwe_level_ussingen_marktplatz_03",
				"pwe_level_ussingen_marktplatz_04"
			},
			sound_events_duration = {
				3.6443958282471,
				4.0666041374206,
				5.9973540306091,
				5.6204166412353
			}
		},
		pwe_level_ussingen_search_for_manor = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "wood_elf_ussingen",
			sound_events_n = 3,
			category = "cut_scene",
			dialogue_animations_n = 3,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_search_for_manor_01",
				"pwe_level_ussingen_search_for_manor_02",
				"pwe_level_ussingen_search_for_manor_03"
			},
			sound_events_duration = {
				3.147958278656,
				3.8641457557678,
				3.6222083568573
			}
		},
		pwe_level_ussingen_spotting_manor = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "cut_scene",
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
				"pwe_level_ussingen_spotting_manor_01",
				"pwe_level_ussingen_spotting_manor_02",
				"pwe_level_ussingen_spotting_manor_03",
				"pwe_level_ussingen_spotting_manor_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_spotting_manor_01",
				"pwe_level_ussingen_spotting_manor_02",
				"pwe_level_ussingen_spotting_manor_03",
				"pwe_level_ussingen_spotting_manor_04"
			},
			sound_events_duration = {
				2.6997082233429,
				2.9278957843781,
				2.7129166126251,
				4.1907916069031
			}
		},
		pwe_level_ussingen_spotting_town = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
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
				"pwe_level_ussingen_spotting_town_01",
				"pwe_level_ussingen_spotting_town_02",
				"pwe_level_ussingen_spotting_town_03",
				"pwe_level_ussingen_spotting_town_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_spotting_town_01",
				"pwe_level_ussingen_spotting_town_02",
				"pwe_level_ussingen_spotting_town_03",
				"pwe_level_ussingen_spotting_town_04"
			},
			sound_events_duration = {
				3.2217916250229,
				4.267520904541,
				2.464250087738,
				5.4693126678467
			}
		},
		pwe_level_ussingen_stockpile_burned = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_stockpile_burned_01",
				"pwe_level_ussingen_stockpile_burned_02",
				"pwe_level_ussingen_stockpile_burned_03",
				"pwe_level_ussingen_stockpile_burned_04"
			},
			sound_events_duration = {
				2.4694166183472,
				3.4552707672119,
				1.9078541994095,
				4.2831873893738
			}
		},
		pwe_level_ussingen_thick_smoke = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_thick_smoke_01",
				"pwe_level_ussingen_thick_smoke_02",
				"pwe_level_ussingen_thick_smoke_03",
				"pwe_level_ussingen_thick_smoke_04"
			},
			sound_events_duration = {
				2.7643749713898,
				4.9759583473206,
				4.4845209121704,
				6.0921874046326
			}
		},
		pwe_level_ussingen_way_through = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_way_through_01",
				"pwe_level_ussingen_way_through_02",
				"pwe_level_ussingen_way_through_03",
				"pwe_level_ussingen_way_through_04"
			},
			sound_events_duration = {
				2.5867917537689,
				4.397958278656,
				3.3800001144409,
				2.4499479532242
			}
		},
		pwe_level_ussingen_wine_cellar = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
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
				"pwe_level_ussingen_wine_cellar_01",
				"pwe_level_ussingen_wine_cellar_02",
				"pwe_level_ussingen_wine_cellar_03",
				"pwe_level_ussingen_wine_cellar_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_wine_cellar_01",
				"pwe_level_ussingen_wine_cellar_02",
				"pwe_level_ussingen_wine_cellar_03",
				"pwe_level_ussingen_wine_cellar_04"
			},
			sound_events_duration = {
				3.6824791431427,
				5.3216042518616,
				5.2741250991821,
				4.0282502174377
			}
		},
		pwe_level_ussingen_wrong_way = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_ussingen",
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
				"pwe_level_ussingen_wrong_way_01",
				"pwe_level_ussingen_wrong_way_02",
				"pwe_level_ussingen_wrong_way_03",
				"pwe_level_ussingen_wrong_way_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_ussingen_wrong_way_01",
				"pwe_level_ussingen_wrong_way_02",
				"pwe_level_ussingen_wrong_way_03",
				"pwe_level_ussingen_wrong_way_04"
			},
			sound_events_duration = {
				3.5232501029968,
				2.4895832538605,
				3.5157812833786,
				7.405749797821
			}
		}
	})
end
