return function ()
	define_rule({
		name = "pdr_level_mine_ladder",
		response = "pdr_level_mine_ladder",
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
				"level_mine_ladder"
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
				"level_mine_ladder",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_ladder",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_shoddy",
		response = "pdr_level_mine_shoddy",
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
				"level_mine_shoddy"
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
				"level_mine_shoddy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_shoddy",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_follow_tracks",
		response = "pdr_level_mine_follow_tracks",
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
				"level_mine_follow_tracks"
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
				"level_mine_follow_tracks",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_follow_tracks",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_mine_cart",
		response = "pdr_level_mine_mine_cart",
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
				"level_mine_mine_cart"
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
				"level_mine_mine_cart",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_mine_cart_remind",
		response = "pdr_level_mine_mine_cart_remind",
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
				"level_mine_mine_cart_remind"
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
				"level_mine_mine_cart_remind",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_remind",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_warren",
		response = "pdr_level_mine_warren",
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
				"level_mine_warren"
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
				"level_mine_warren",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_warren",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_mine_cart_push_upwards",
		response = "pdr_level_mine_mine_cart_push_upwards",
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
				"level_mine_mine_cart_push_upwards"
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
				"level_mine_mine_cart_push_upwards",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_push_upwards",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_mine_cart_roll_down_back",
		response = "pdr_level_mine_mine_cart_roll_down_back",
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
				"level_mine_mine_cart_roll_down_back"
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
				"level_mine_mine_cart_roll_down_back",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_roll_down_back",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_mine_cart_roll_down_forward",
		response = "pdr_level_mine_mine_cart_roll_down_forward",
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
				"level_mine_mine_cart_roll_down_forward"
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
				"level_mine_mine_cart_roll_down_forward",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_roll_down_forward",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_find_explosives",
		response = "pdr_level_mine_find_explosives",
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
				"level_mine_find_explosives"
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
				"level_mine_find_explosives",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_find_explosives",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_darkness",
		response = "pdr_level_mine_darkness",
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
				"level_mine_darkness"
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
				"level_mine_darkness",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_darkness",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_mine_cart_drops_away",
		response = "pdr_level_mine_mine_cart_drops_away",
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
				"level_mine_mine_cart_drops_away"
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
				"level_mine_mine_cart_drops_away",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_mine_cart_drops_away",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_lost_cart",
		response = "pdr_level_mine_lost_cart",
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
				"level_mine_lost_cart"
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
				"level_mine_lost_cart",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_lost_cart",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_troll_food_storage",
		response = "pdr_level_mine_troll_food_storage",
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
				"level_mine_troll_food_storage"
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
				"level_mine_troll_food_storage",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_troll_food_storage",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_big_troll_cave",
		response = "pdr_level_mine_big_troll_cave",
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
				"level_mine_big_troll_cave"
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
				"level_mine_big_troll_cave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_big_troll_cave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_impressive_cave",
		response = "pdr_level_mine_impressive_cave",
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
				"level_mine_impressive_cave"
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
				"level_mine_impressive_cave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_impressive_cave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_found_cart_troll_cave",
		response = "pdr_level_mine_found_cart_troll_cave",
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
				"level_mine_found_cart_troll_cave"
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
				"level_mine_found_cart_troll_cave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_found_cart_troll_cave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_bell_ringing",
		response = "pdr_level_mine_bell_ringing",
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
				"level_mine_bell_ringing"
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
				"level_mine_bell_ringing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_bell_ringing",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_portal",
		response = "pdr_level_mine_portal",
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
				"level_mine_portal"
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
				"level_mine_portal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_portal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_mine_intro_a",
		response = "pdr_mine_intro_a",
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
				"mine_intro_a"
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
				"mine_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"mine_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_mine_intro_b",
		response = "pdr_mine_intro_b",
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
				"mine_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"mine_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"mine_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_mine_intro_c",
		response = "pdr_mine_intro_c",
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
				"mine_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"mine_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"mine_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_troll_doors",
		response = "pdr_level_mine_troll_doors",
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
				"level_mine_troll_doors"
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
				"level_mine_troll_doors",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_troll_doors",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_mine_bridge",
		response = "pdr_level_mine_bridge",
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
				"level_mine_bridge"
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
				"level_mine_bridge",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_bridge",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pdr_level_mine_lost_cart = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_lost_cart_01",
				"pdr_level_mine_lost_cart_02",
				"pdr_level_mine_lost_cart_03",
				"pdr_level_mine_lost_cart_04"
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
				"pdr_level_mine_lost_cart_01",
				"pdr_level_mine_lost_cart_02",
				"pdr_level_mine_lost_cart_03",
				"pdr_level_mine_lost_cart_04"
			},
			randomize_indexes = {}
		},
		pdr_mine_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_mine_intro_b_01",
				[2.0] = "pdr_mine_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_mine_intro_b_01",
				[2.0] = "pdr_mine_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_troll_food_storage = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_troll_food_storage_01",
				"pdr_level_mine_troll_food_storage_02",
				"pdr_level_mine_troll_food_storage_03",
				"pdr_level_mine_troll_food_storage_04"
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
				"pdr_level_mine_troll_food_storage_01",
				"pdr_level_mine_troll_food_storage_02",
				"pdr_level_mine_troll_food_storage_03",
				"pdr_level_mine_troll_food_storage_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_follow_tracks = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_follow_tracks_01",
				"pdr_level_mine_follow_tracks_02",
				"pdr_level_mine_follow_tracks_03",
				"pdr_level_mine_follow_tracks_04"
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
				"pdr_level_mine_follow_tracks_01",
				"pdr_level_mine_follow_tracks_02",
				"pdr_level_mine_follow_tracks_03",
				"pdr_level_mine_follow_tracks_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_mine_cart_roll_down_back = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_mine_cart_roll_down_back_01",
				"pdr_level_mine_mine_cart_roll_down_back_02",
				"pdr_level_mine_mine_cart_roll_down_back_03",
				"pdr_level_mine_mine_cart_roll_down_back_04"
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
				"pdr_level_mine_mine_cart_roll_down_back_01",
				"pdr_level_mine_mine_cart_roll_down_back_02",
				"pdr_level_mine_mine_cart_roll_down_back_03",
				"pdr_level_mine_mine_cart_roll_down_back_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_bell_ringing = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_bell_ringing_01",
				"pdr_level_mine_bell_ringing_02",
				"pdr_level_mine_bell_ringing_03",
				"pdr_level_mine_bell_ringing_04"
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
				"pdr_level_mine_bell_ringing_01",
				"pdr_level_mine_bell_ringing_02",
				"pdr_level_mine_bell_ringing_03",
				"pdr_level_mine_bell_ringing_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_mine_cart_push_upwards = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_mine_cart_push_upwards_01",
				"pdr_level_mine_mine_cart_push_upwards_02",
				"pdr_level_mine_mine_cart_push_upwards_03",
				"pdr_level_mine_mine_cart_push_upwards_04"
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
				"pdr_level_mine_mine_cart_push_upwards_01",
				"pdr_level_mine_mine_cart_push_upwards_02",
				"pdr_level_mine_mine_cart_push_upwards_03",
				"pdr_level_mine_mine_cart_push_upwards_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_darkness = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_darkness_01",
				"pdr_level_mine_darkness_02",
				"pdr_level_mine_darkness_03",
				"pdr_level_mine_darkness_04"
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
				"pdr_level_mine_darkness_01",
				"pdr_level_mine_darkness_02",
				"pdr_level_mine_darkness_03",
				"pdr_level_mine_darkness_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_bridge = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_mines",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_objective_correct_path_bridge_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pdr_objective_correct_path_bridge_01"
			}
		},
		pdr_level_mine_troll_doors = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_troll_doors_01",
				"pdr_level_mine_troll_doors_02",
				"pdr_level_mine_troll_doors_03",
				"pdr_level_mine_troll_doors_04"
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
				"pdr_level_mine_troll_doors_01",
				"pdr_level_mine_troll_doors_02",
				"pdr_level_mine_troll_doors_03",
				"pdr_level_mine_troll_doors_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_mine_cart_drops_away = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_mine_cart_drops_away_01",
				"pdr_level_mine_mine_cart_drops_away_02",
				"pdr_level_mine_mine_cart_drops_away_03",
				"pdr_level_mine_mine_cart_drops_away_04"
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
				"pdr_level_mine_mine_cart_drops_away_01",
				"pdr_level_mine_mine_cart_drops_away_02",
				"pdr_level_mine_mine_cart_drops_away_03",
				"pdr_level_mine_mine_cart_drops_away_04"
			},
			randomize_indexes = {}
		},
		pdr_mine_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_mine_intro_c_01",
				[2.0] = "pdr_mine_intro_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_mine_intro_c_01",
				[2.0] = "pdr_mine_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_mine_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_mine_intro_a_01",
				[2.0] = "pdr_mine_intro_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_mine_intro_a_01",
				[2.0] = "pdr_mine_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_portal = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_portal_01",
				"pdr_level_mine_portal_02",
				"pdr_level_mine_portal_03",
				"pdr_level_mine_portal_04"
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
				"pdr_level_mine_portal_01",
				"pdr_level_mine_portal_02",
				"pdr_level_mine_portal_03",
				"pdr_level_mine_portal_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_found_cart_troll_cave = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_found_cart_troll_cave_01",
				"pdr_level_mine_found_cart_troll_cave_02",
				"pdr_level_mine_found_cart_troll_cave_03",
				"pdr_level_mine_found_cart_troll_cave_04"
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
				"pdr_level_mine_found_cart_troll_cave_01",
				"pdr_level_mine_found_cart_troll_cave_02",
				"pdr_level_mine_found_cart_troll_cave_03",
				"pdr_level_mine_found_cart_troll_cave_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_ladder = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_ladder_01",
				"pdr_level_mine_ladder_02",
				"pdr_level_mine_ladder_03",
				"pdr_level_mine_ladder_04"
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
				"pdr_level_mine_ladder_01",
				"pdr_level_mine_ladder_02",
				"pdr_level_mine_ladder_03",
				"pdr_level_mine_ladder_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_mine_cart_roll_down_forward = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_mine_cart_roll_down_forward_01",
				"pdr_level_mine_mine_cart_roll_down_forward_02",
				"pdr_level_mine_mine_cart_roll_down_forward_03",
				"pdr_level_mine_mine_cart_roll_down_forward_04"
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
				"pdr_level_mine_mine_cart_roll_down_forward_01",
				"pdr_level_mine_mine_cart_roll_down_forward_02",
				"pdr_level_mine_mine_cart_roll_down_forward_03",
				"pdr_level_mine_mine_cart_roll_down_forward_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_mine_cart_remind = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_mine_cart_remind_01",
				"pdr_level_mine_mine_cart_remind_02",
				"pdr_level_mine_mine_cart_remind_03",
				"pdr_level_mine_mine_cart_remind_04"
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
				"pdr_level_mine_mine_cart_remind_01",
				"pdr_level_mine_mine_cart_remind_02",
				"pdr_level_mine_mine_cart_remind_03",
				"pdr_level_mine_mine_cart_remind_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_warren = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_warren_01",
				"pdr_level_mine_warren_02",
				"pdr_level_mine_warren_03",
				"pdr_level_mine_warren_04"
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
				"pdr_level_mine_warren_01",
				"pdr_level_mine_warren_02",
				"pdr_level_mine_warren_03",
				"pdr_level_mine_warren_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_find_explosives = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_find_explosives_01",
				"pdr_level_mine_find_explosives_02",
				"pdr_level_mine_find_explosives_03",
				"pdr_level_mine_find_explosives_04"
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
				"pdr_level_mine_find_explosives_01",
				"pdr_level_mine_find_explosives_02",
				"pdr_level_mine_find_explosives_03",
				"pdr_level_mine_find_explosives_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_mine_cart = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_mine_cart_01",
				"pdr_level_mine_mine_cart_02",
				"pdr_level_mine_mine_cart_03",
				"pdr_level_mine_mine_cart_04"
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
				"pdr_level_mine_mine_cart_01",
				"pdr_level_mine_mine_cart_02",
				"pdr_level_mine_mine_cart_03",
				"pdr_level_mine_mine_cart_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_big_troll_cave = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_big_troll_cave_01",
				"pdr_level_mine_big_troll_cave_02",
				"pdr_level_mine_big_troll_cave_03",
				"pdr_level_mine_big_troll_cave_04"
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
				"pdr_level_mine_big_troll_cave_01",
				"pdr_level_mine_big_troll_cave_02",
				"pdr_level_mine_big_troll_cave_03",
				"pdr_level_mine_big_troll_cave_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_shoddy = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_shoddy_01",
				"pdr_level_mine_shoddy_02",
				"pdr_level_mine_shoddy_03",
				"pdr_level_mine_shoddy_04"
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
				"pdr_level_mine_shoddy_01",
				"pdr_level_mine_shoddy_02",
				"pdr_level_mine_shoddy_03",
				"pdr_level_mine_shoddy_04"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_impressive_cave = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_mine_impressive_cave_01",
				"pdr_level_mine_impressive_cave_02",
				"pdr_level_mine_impressive_cave_03",
				"pdr_level_mine_impressive_cave_04"
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
				"pdr_level_mine_impressive_cave_01",
				"pdr_level_mine_impressive_cave_02",
				"pdr_level_mine_impressive_cave_03",
				"pdr_level_mine_impressive_cave_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end
