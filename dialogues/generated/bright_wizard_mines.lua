return function ()
	define_rule({
		name = "pbw_level_mine_bell_ringing",
		response = "pbw_level_mine_bell_ringing",
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
		name = "pbw_level_mine_big_troll_cave",
		response = "pbw_level_mine_big_troll_cave",
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
		name = "pbw_level_mine_darkness",
		response = "pbw_level_mine_darkness",
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
		name = "pbw_level_mine_find_explosives",
		response = "pbw_level_mine_find_explosives",
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
		name = "pbw_level_mine_follow_tracks",
		response = "pbw_level_mine_follow_tracks",
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
		name = "pbw_level_mine_found_cart_troll_cave",
		response = "pbw_level_mine_found_cart_troll_cave",
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
		name = "pbw_level_mine_gloat",
		response = "pbw_level_mine_gloat",
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
				"level_mine_gloat"
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
				"level_mine_gloat",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_gloat",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_mine_impressive_cave",
		response = "pbw_level_mine_impressive_cave",
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
		name = "pbw_level_mine_ladder",
		response = "pbw_level_mine_ladder",
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
		name = "pbw_level_mine_lost_cart",
		response = "pbw_level_mine_lost_cart",
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
		name = "pbw_level_mine_mine_cart",
		response = "pbw_level_mine_mine_cart",
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
		name = "pbw_level_mine_mine_cart_drops_away",
		response = "pbw_level_mine_mine_cart_drops_away",
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
		name = "pbw_level_mine_mine_cart_push_upwards",
		response = "pbw_level_mine_mine_cart_push_upwards",
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
		name = "pbw_level_mine_mine_cart_remind",
		response = "pbw_level_mine_mine_cart_remind",
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
		name = "pbw_level_mine_mine_cart_roll_down_back",
		response = "pbw_level_mine_mine_cart_roll_down_back",
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
		name = "pbw_level_mine_mine_cart_roll_down_forward",
		response = "pbw_level_mine_mine_cart_roll_down_forward",
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
		name = "pbw_level_mine_portal",
		response = "pbw_level_mine_portal",
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
		name = "pbw_level_mine_troll_doors",
		response = "pbw_level_mine_troll_doors",
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
		name = "pbw_level_mine_warren",
		response = "pbw_level_mine_warren",
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
		name = "pbw_mine_intro_a",
		response = "pbw_mine_intro_a",
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
		name = "pbw_mine_intro_b",
		response = "pbw_mine_intro_b",
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
				"bright_wizard"
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
		name = "pbw_mine_intro_c",
		response = "pbw_mine_intro_c",
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
				"bright_wizard"
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
	add_dialogues({
		pbw_level_mine_bell_ringing = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_bell_ringing_01",
				"pbw_level_mine_bell_ringing_02",
				"pbw_level_mine_bell_ringing_03",
				"pbw_level_mine_bell_ringing_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_bell_ringing_01",
				"pbw_level_mine_bell_ringing_02",
				"pbw_level_mine_bell_ringing_03",
				"pbw_level_mine_bell_ringing_04"
			},
			sound_events_duration = {
				2.7514791488648,
				2.1733124256134,
				1.9062708616257,
				2.9256665706634
			}
		},
		pbw_level_mine_big_troll_cave = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_big_troll_cave_01",
				"pbw_level_mine_big_troll_cave_02",
				"pbw_level_mine_big_troll_cave_03",
				"pbw_level_mine_big_troll_cave_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_big_troll_cave_01",
				"pbw_level_mine_big_troll_cave_02",
				"pbw_level_mine_big_troll_cave_03",
				"pbw_level_mine_big_troll_cave_04"
			},
			sound_events_duration = {
				3.0978124141693,
				2.9249167442322,
				3.7885625362396,
				4.6431875228882
			}
		},
		pbw_level_mine_darkness = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_darkness_01",
				"pbw_level_mine_darkness_02",
				"pbw_level_mine_darkness_03",
				"pbw_level_mine_darkness_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_darkness_01",
				"pbw_level_mine_darkness_02",
				"pbw_level_mine_darkness_03",
				"pbw_level_mine_darkness_04"
			},
			sound_events_duration = {
				4.287145614624,
				6.1170415878296,
				1.6805416345596,
				3.6562707424164
			}
		},
		pbw_level_mine_find_explosives = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_find_explosives_01",
				"pbw_level_mine_find_explosives_02",
				"pbw_level_mine_find_explosives_03",
				"pbw_level_mine_find_explosives_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_find_explosives_01",
				"pbw_level_mine_find_explosives_02",
				"pbw_level_mine_find_explosives_03",
				"pbw_level_mine_find_explosives_04"
			},
			sound_events_duration = {
				4.0148749351502,
				3.4957709312439,
				2.8175625801086,
				3.6626040935516
			}
		},
		pbw_level_mine_follow_tracks = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_follow_tracks_01",
				"pbw_level_mine_follow_tracks_02",
				"pbw_level_mine_follow_tracks_03",
				"pbw_level_mine_follow_tracks_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_follow_tracks_01",
				"pbw_level_mine_follow_tracks_02",
				"pbw_level_mine_follow_tracks_03",
				"pbw_level_mine_follow_tracks_04"
			},
			sound_events_duration = {
				2.6767709255219,
				1.7670625448227,
				1.8067708015442,
				1.7710624933243
			}
		},
		pbw_level_mine_found_cart_troll_cave = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_found_cart_troll_cave_01",
				"pbw_level_mine_found_cart_troll_cave_02",
				"pbw_level_mine_found_cart_troll_cave_03",
				"pbw_level_mine_found_cart_troll_cave_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_found_cart_troll_cave_01",
				"pbw_level_mine_found_cart_troll_cave_02",
				"pbw_level_mine_found_cart_troll_cave_03",
				"pbw_level_mine_found_cart_troll_cave_04"
			},
			sound_events_duration = {
				5.3596668243408,
				4.5450835227966,
				2.5105624198914,
				2.7912082672119
			}
		},
		pbw_level_mine_gloat = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_gloat_01",
				"pbw_level_mine_gloat_02",
				"pbw_level_mine_gloat_03",
				"pbw_level_mine_gloat_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_gloat_01",
				"pbw_level_mine_gloat_02",
				"pbw_level_mine_gloat_03",
				"pbw_level_mine_gloat_04"
			},
			sound_events_duration = {
				2.9221251010895,
				3.7256667613983,
				3.0234375,
				3.1364998817444
			}
		},
		pbw_level_mine_impressive_cave = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_impressive_cave_01",
				"pbw_level_mine_impressive_cave_02",
				"pbw_level_mine_impressive_cave_03",
				"pbw_level_mine_impressive_cave_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_impressive_cave_01",
				"pbw_level_mine_impressive_cave_02",
				"pbw_level_mine_impressive_cave_03",
				"pbw_level_mine_impressive_cave_04"
			},
			sound_events_duration = {
				3.9008333683014,
				2.3783333301544,
				3.4199376106262,
				8.5442914962769
			}
		},
		pbw_level_mine_ladder = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_ladder_01",
				"pbw_level_mine_ladder_02",
				"pbw_level_mine_ladder_03",
				"pbw_level_mine_ladder_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_ladder_01",
				"pbw_level_mine_ladder_02",
				"pbw_level_mine_ladder_03",
				"pbw_level_mine_ladder_04"
			},
			sound_events_duration = {
				1.7651250362396,
				4.0011873245239,
				2.1721458435059,
				3.7976040840149
			}
		},
		pbw_level_mine_lost_cart = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_lost_cart_01",
				"pbw_level_mine_lost_cart_02",
				"pbw_level_mine_lost_cart_03",
				"pbw_level_mine_lost_cart_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_lost_cart_01",
				"pbw_level_mine_lost_cart_02",
				"pbw_level_mine_lost_cart_03",
				"pbw_level_mine_lost_cart_04"
			},
			sound_events_duration = {
				2.9348957538605,
				3.2464582920074,
				2.5066666603088,
				4.3016042709351
			}
		},
		pbw_level_mine_mine_cart = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_mine_cart_01",
				"pbw_level_mine_mine_cart_02",
				"pbw_level_mine_mine_cart_03",
				"pbw_level_mine_mine_cart_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_mine_cart_01",
				"pbw_level_mine_mine_cart_02",
				"pbw_level_mine_mine_cart_03",
				"pbw_level_mine_mine_cart_04"
			},
			sound_events_duration = {
				4.2564167976379,
				2.928750038147,
				3.2172501087189,
				3.3809583187103
			}
		},
		pbw_level_mine_mine_cart_drops_away = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_mine_cart_drops_away_01",
				"pbw_level_mine_mine_cart_drops_away_02",
				"pbw_level_mine_mine_cart_drops_away_03",
				"pbw_level_mine_mine_cart_drops_away_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_mine_cart_drops_away_01",
				"pbw_level_mine_mine_cart_drops_away_02",
				"pbw_level_mine_mine_cart_drops_away_03",
				"pbw_level_mine_mine_cart_drops_away_04"
			},
			sound_events_duration = {
				1.8272083997726,
				2.1960833072662,
				2.9617290496826,
				2.8734374046326
			}
		},
		pbw_level_mine_mine_cart_push_upwards = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_mine_cart_push_upwards_01",
				"pbw_level_mine_mine_cart_push_upwards_02",
				"pbw_level_mine_mine_cart_push_upwards_03",
				"pbw_level_mine_mine_cart_push_upwards_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_mine_cart_push_upwards_01",
				"pbw_level_mine_mine_cart_push_upwards_02",
				"pbw_level_mine_mine_cart_push_upwards_03",
				"pbw_level_mine_mine_cart_push_upwards_04"
			},
			sound_events_duration = {
				3.7291874885559,
				2.2027082443237,
				1.7393958568573,
				2.4447915554047
			}
		},
		pbw_level_mine_mine_cart_remind = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_mine_cart_remind_01",
				"pbw_level_mine_mine_cart_remind_02",
				"pbw_level_mine_mine_cart_remind_03",
				"pbw_level_mine_mine_cart_remind_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_mine_cart_remind_01",
				"pbw_level_mine_mine_cart_remind_02",
				"pbw_level_mine_mine_cart_remind_03",
				"pbw_level_mine_mine_cart_remind_04"
			},
			sound_events_duration = {
				2.2560207843781,
				2.1032917499542,
				2.3586459159851,
				1.6310207843781
			}
		},
		pbw_level_mine_mine_cart_roll_down_back = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_mine_cart_roll_down_back_01",
				"pbw_level_mine_mine_cart_roll_down_back_02",
				"pbw_level_mine_mine_cart_roll_down_back_03",
				"pbw_level_mine_mine_cart_roll_down_back_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_mine_cart_roll_down_back_01",
				"pbw_level_mine_mine_cart_roll_down_back_02",
				"pbw_level_mine_mine_cart_roll_down_back_03",
				"pbw_level_mine_mine_cart_roll_down_back_04"
			},
			sound_events_duration = {
				2.3436875343323,
				1.8588333129883,
				4.3931875228882,
				1.7147916555405
			}
		},
		pbw_level_mine_mine_cart_roll_down_forward = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_mine_cart_roll_down_forward_01",
				"pbw_level_mine_mine_cart_roll_down_forward_02",
				"pbw_level_mine_mine_cart_roll_down_forward_03",
				"pbw_level_mine_mine_cart_roll_down_forward_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_mine_cart_roll_down_forward_01",
				"pbw_level_mine_mine_cart_roll_down_forward_02",
				"pbw_level_mine_mine_cart_roll_down_forward_03",
				"pbw_level_mine_mine_cart_roll_down_forward_04"
			},
			sound_events_duration = {
				4.3578748703003,
				2.2971458435059,
				2.4090623855591,
				2.8118751049042
			}
		},
		pbw_level_mine_portal = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_portal_01",
				"pbw_level_mine_portal_02",
				"pbw_level_mine_portal_03",
				"pbw_level_mine_portal_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_portal_01",
				"pbw_level_mine_portal_02",
				"pbw_level_mine_portal_03",
				"pbw_level_mine_portal_04"
			},
			sound_events_duration = {
				4.6042499542236,
				5.2719373703003,
				4.3137292861939,
				2.6911041736603
			}
		},
		pbw_level_mine_troll_doors = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_troll_doors_01",
				"pbw_level_mine_troll_doors_02",
				"pbw_level_mine_troll_doors_03",
				"pbw_level_mine_troll_doors_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_troll_doors_01",
				"pbw_level_mine_troll_doors_02",
				"pbw_level_mine_troll_doors_03",
				"pbw_level_mine_troll_doors_04"
			},
			sound_events_duration = {
				3.0787291526794,
				3.6091458797455,
				3.4289166927338,
				2.8775417804718
			}
		},
		pbw_level_mine_warren = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_mines",
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
				"pbw_level_mine_warren_01",
				"pbw_level_mine_warren_02",
				"pbw_level_mine_warren_03",
				"pbw_level_mine_warren_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_mine_warren_01",
				"pbw_level_mine_warren_02",
				"pbw_level_mine_warren_03",
				"pbw_level_mine_warren_04"
			},
			sound_events_duration = {
				3.2526667118073,
				2.7197499275208,
				4.1217708587647,
				5.3250207901001
			}
		},
		pbw_mine_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_mines",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_mine_intro_a_01",
				[2.0] = "pbw_mine_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_mine_intro_a_01",
				[2.0] = "pbw_mine_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.0941250324249,
				[2.0] = 1.8330625295639
			}
		},
		pbw_mine_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_mines",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_mine_intro_b_01",
				[2.0] = "pbw_mine_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_mine_intro_b_01",
				[2.0] = "pbw_mine_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 1.954020857811,
				[2.0] = 1.9018958806992
			}
		},
		pbw_mine_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_mines",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_mine_intro_c_01",
				[2.0] = "pbw_mine_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_mine_intro_c_01",
				[2.0] = "pbw_mine_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.9366040229797,
				[2.0] = 5.1133542060852
			}
		}
	})
end
