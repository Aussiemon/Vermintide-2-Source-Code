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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.1602709293366,
				2.1444165706634,
				2.3684375286102,
				2.0729374885559
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
			face_animations_n = 2,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				[1.0] = 2.0870625972748,
				[2.0] = 3.5054790973663
			},
			localization_strings = {
				[1.0] = "pdr_mine_intro_b_01",
				[2.0] = "pdr_mine_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_troll_food_storage = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.9016041755676,
				3.2365624904633,
				4.2695207595825,
				3.6899166107178
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.2157917022705,
				3.5490624904633,
				4.4396457672119,
				3.7969374656677
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.1365833282471,
				1.713250041008,
				1.8866666555405,
				1.9516041278839
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.242645740509,
				2.9944791793823,
				2.0544791221619,
				1.4229583740234
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.6026041507721,
				1.7503541707993,
				3.958104133606,
				3.3438959121704
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.9317291975021,
				4.0772500038147,
				3.6716876029968,
				3.1271250247955
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
			sound_events_duration = {
				[1.0] = 1.9352707862854
			},
			localization_strings = {
				[1.0] = "pdr_objective_correct_path_bridge_01"
			}
		},
		pdr_level_mine_troll_doors = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				4.0621666908264,
				3.4729166030884,
				4.5026459693909,
				3.3411457538605
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.6631875038147,
				3.4902083873749,
				2.9715623855591,
				2.6189374923706
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
			face_animations_n = 2,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				[1.0] = 4.6116876602173,
				[2.0] = 5.7574582099915
			},
			localization_strings = {
				[1.0] = "pdr_mine_intro_c_01",
				[2.0] = "pdr_mine_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_mine_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				[1.0] = 4.4790835380554,
				[2.0] = 3.5715625286102
			},
			localization_strings = {
				[1.0] = "pdr_mine_intro_a_01",
				[2.0] = "pdr_mine_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_mine_portal = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.5208333730698,
				4.4732918739319,
				3.7136042118073,
				2.3756875991821
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.9921040534973,
				3.532208442688,
				3.3631250858307,
				3.2220833301544
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				4.8097081184387,
				1.8506875038147,
				3.0993332862854,
				3.3432083129883
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.4181249141693,
				1.8259375095367,
				2.0453541278839,
				4.2781457901001
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.0988750457764,
				2.9305832386017,
				3.3357291221619,
				2.1337292194366
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.8159999847412,
				5.2782082557678,
				4.0168333053589,
				4.3377289772034
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.7934167385101,
				2.6813542842865,
				2.4442708492279,
				2.8680832386017
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.1450417041779,
				3.8961250782013,
				2.4312915802002,
				2.4114582538605
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.1014165878296,
				5.819375038147,
				3.2796041965485,
				3.2574999332428
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				4.615749835968,
				8.4274997711182,
				4.0286459922791,
				5.2257289886475
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
			face_animations_n = 4,
			database = "dwarf_ranger_mines",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				4.2397084236145,
				4.8200831413269,
				5.5991668701172,
				3.295937538147
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
end
