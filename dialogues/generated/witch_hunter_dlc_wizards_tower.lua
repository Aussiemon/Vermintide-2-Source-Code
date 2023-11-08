return function ()
	define_rule({
		name = "pwh_enchantment_dummy_trigger",
		response = "pwh_enchantment_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde"
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"wizard_tower_enchantment_horde",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_enchantment_horde",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_keep_climbing_dummy_trigger",
		name = "pwh_keep_climbing_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_keep_climbing_dummy"
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
			}
		}
	})
	define_rule({
		response = "pwh_test_subjects_dummy_trigger",
		name = "pwh_test_subjects_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_test_subjects_dummy"
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
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_another_locked_door",
		response = "pwh_wizard_tower_another_locked_door",
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
				"wizard_tower_another_locked_door"
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
				"wizard_tower_another_locked_door",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_another_locked_door",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_bones",
		response = "pwh_wizard_tower_bones",
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
				"wizard_tower_bones"
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
				"user_context",
				"enemies_close",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"wizard_tower_bones",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_bones",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_brew",
		response = "pwh_wizard_tower_brew",
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
				"wizard_tower_brew"
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
				"user_context",
				"enemies_close",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwh_wizard_tower_destroy_wards_b",
		name = "pwh_wizard_tower_destroy_wards_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_destroy_wards_a_done"
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
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_familiar",
		response = "pwh_wizard_tower_familiar",
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
				"wizard_tower_familiar"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"wizard_tower_familiar",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_familiar",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_gravity_a",
		response = "pwh_wizard_tower_gravity_a",
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
				"wizard_tower_gravity_a"
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
				"wizard_tower_gravity_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_gravity_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_illusion_room",
		response = "pwh_wizard_tower_illusion_room",
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
				"wizard_tower_illusion_room"
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
				"user_context",
				"enemies_close",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"wizard_tower_illusion_room",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_illusion_room",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_intro_a",
		response = "pwh_wizard_tower_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"wizard_tower_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_intro_b",
		response = "pwh_wizard_tower_intro_b",
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
				"wizard_tower_intro_a"
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
				"wizard_tower_intro_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_intro_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_intro_c",
		response = "pwh_wizard_tower_intro_c",
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
				"wizard_tower_intro_b"
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
				"wizard_tower_intro_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_jungle",
		response = "pwh_wizard_tower_jungle",
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
				"wizard_tower_jungle"
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
				"wizard_tower_jungle",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_jungle",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_leap_of_faith",
		response = "pwh_wizard_tower_leap_of_faith",
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
				"wizard_tower_leap_of_faith"
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
				"user_context",
				"enemies_close",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"wizard_tower_leap_of_faith",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_leap_of_faith",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_library",
		response = "pwh_wizard_tower_library",
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
				"wizard_tower_library"
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
				"user_context",
				"enemies_close",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"wizard_tower_library",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_library",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_observatory",
		response = "pwh_wizard_tower_observatory",
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
				"wizard_tower_observatory"
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
				"user_context",
				"enemies_close",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"wizard_tower_observatory",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_observatory",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_pig",
		response = "pwh_wizard_tower_pig",
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
				"wizard_tower_pig"
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
				"user_context",
				"enemies_close",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"wizard_tower_pig",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_pig",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_portal",
		response = "pwh_wizard_tower_portal",
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
				"wizard_tower_portal"
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
				"user_context",
				"enemies_close",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"wizard_tower_portal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_portal",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMESET
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_potion_maker",
		response = "pwh_wizard_tower_potion_maker",
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
				"wizard_tower_potion_maker"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"wizard_tower_potion_maker",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_potion_maker",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_ropes",
		response = "pwh_wizard_tower_ropes",
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
				"wizard_tower_ropes"
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
				"user_context",
				"enemies_close",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"wizard_tower_ropes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_ropes",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_skull_found_subsequent",
		response = "pwh_wizard_tower_skull_found_subsequent",
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
				"wizards_tower_skull"
			},
			{
				"query_context",
				"distance",
				OP.LT,
				12
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				240
			},
			{
				"faction_memory",
				"wizard_tower_skull_found_subsequent",
				OP.LT,
				2
			},
			{
				"faction_memory",
				"last_seen_tower_skull",
				OP.TIMEDIFF,
				OP.GT,
				140
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_tower_skull",
				OP.TIMESET
			},
			{
				"faction_memory",
				"wizard_tower_skull_found_subsequent",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_where_is_she_a",
		response = "pwh_wizard_tower_where_is_she_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_where_is_she_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"wizard_tower_where_is_she_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_where_is_she_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_where_is_she_b",
		response = "pwh_wizard_tower_where_is_she_b",
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
				"wizard_tower_where_is_she_a"
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
				"wizard_tower_where_is_she_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_where_is_she_b",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pwh_enchantment_dummy_trigger = {
			override_awareness = "wizard_tower_enchantment",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_dlc_wizards_tower",
			category = "enemy_alerts_high",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "dummy"
			},
			sound_events = {
				[1.0] = "dummy"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			}
		},
		pwh_keep_climbing_dummy_trigger = {
			override_awareness = "wizard_tower_keep_climbing",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_dlc_wizards_tower",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "dummy"
			},
			sound_events = {
				[1.0] = "dummy"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			}
		},
		pwh_test_subjects_dummy_trigger = {
			override_awareness = "wizard_tower_test_subjects",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_dlc_wizards_tower",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "dummy"
			},
			sound_events = {
				[1.0] = "dummy"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			}
		},
		pwh_wizard_tower_another_locked_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_another_locked_door_01",
				"pwh_wizard_tower_another_locked_door_02",
				"pwh_wizard_tower_another_locked_door_03",
				"pwh_wizard_tower_another_locked_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_another_locked_door_01",
				"pwh_wizard_tower_another_locked_door_02",
				"pwh_wizard_tower_another_locked_door_03",
				"pwh_wizard_tower_another_locked_door_04"
			},
			sound_events_duration = {
				3.9000000953674,
				3.9869999885559,
				3.4730000495911,
				5.8319997787476
			}
		},
		pwh_wizard_tower_bones = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_bones_01",
				"pwh_wizard_tower_bones_02",
				"pwh_wizard_tower_bones_03",
				"pwh_wizard_tower_bones_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_bones_01",
				"pwh_wizard_tower_bones_02",
				"pwh_wizard_tower_bones_03",
				"pwh_wizard_tower_bones_04"
			},
			sound_events_duration = {
				4.8789792060852,
				3.8079791069031,
				4.4549999237061,
				4.1759791374206
			}
		},
		pwh_wizard_tower_brew = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_brew_01",
				"pwh_wizard_tower_brew_02",
				"pwh_wizard_tower_brew_03",
				"pwh_wizard_tower_brew_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_brew_01",
				"pwh_wizard_tower_brew_02",
				"pwh_wizard_tower_brew_03",
				"pwh_wizard_tower_brew_04"
			},
			sound_events_duration = {
				3.9759790897369,
				7.5439791679382,
				3.4567,
				4.125
			}
		},
		pwh_wizard_tower_destroy_wards_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_destroy_wards_b_01",
				"pwh_wizard_tower_destroy_wards_b_02",
				"pwh_wizard_tower_destroy_wards_b_03",
				"pwh_wizard_tower_destroy_wards_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_destroy_wards_b_01",
				"pwh_wizard_tower_destroy_wards_b_02",
				"pwh_wizard_tower_destroy_wards_b_03",
				"pwh_wizard_tower_destroy_wards_b_04"
			},
			sound_events_duration = {
				3.7859792709351,
				3.448979139328,
				4.0300002098083,
				3.4149792194366
			}
		},
		pwh_wizard_tower_familiar = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_familiar_01",
				"pwh_wizard_tower_familiar_02",
				"pwh_wizard_tower_familiar_03",
				"pwh_wizard_tower_familiar_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_familiar_01",
				"pwh_wizard_tower_familiar_02",
				"pwh_wizard_tower_familiar_03",
				"pwh_wizard_tower_familiar_04"
			},
			sound_events_duration = {
				1.5819791555405,
				1.904000043869,
				1.6000000238419,
				3.8180000782013
			}
		},
		pwh_wizard_tower_gravity_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_gravity_a_01",
				"pwh_wizard_tower_gravity_a_02",
				"pwh_wizard_tower_gravity_a_03",
				"pwh_wizard_tower_gravity_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_gravity_a_01",
				"pwh_wizard_tower_gravity_a_02",
				"pwh_wizard_tower_gravity_a_03",
				"pwh_wizard_tower_gravity_a_04"
			},
			sound_events_duration = {
				2.691999912262,
				3.8509790897369,
				1.9500000476837,
				2.8519792556763
			}
		},
		pwh_wizard_tower_illusion_room = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_illusion_room_01",
				"pwh_wizard_tower_illusion_room_02",
				"pwh_wizard_tower_illusion_room_03",
				"pwh_wizard_tower_illusion_room_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_illusion_room_01",
				"pwh_wizard_tower_illusion_room_02",
				"pwh_wizard_tower_illusion_room_03",
				"pwh_wizard_tower_illusion_room_04"
			},
			sound_events_duration = {
				3.0659792423248,
				5.5769791603088,
				3.783979177475,
				4.2859792709351
			}
		},
		pwh_wizard_tower_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_wizards_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_intro_a_01",
				[2.0] = "pwh_wizard_tower_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wizard_tower_intro_a_01",
				[2.0] = "pwh_wizard_tower_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.4589791297913,
				[2.0] = 4.4459791183472
			}
		},
		pwh_wizard_tower_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_wizards_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_intro_b_01",
				[2.0] = "pwh_wizard_tower_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wizard_tower_intro_b_01",
				[2.0] = "pwh_wizard_tower_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 5.0079793930054,
				[2.0] = 3.9439792633057
			}
		},
		pwh_wizard_tower_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_wizards_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_intro_c_01",
				[2.0] = "pwh_wizard_tower_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wizard_tower_intro_c_01",
				[2.0] = "pwh_wizard_tower_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.4189791679382,
				[2.0] = 5.0069789886475
			}
		},
		pwh_wizard_tower_jungle = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_jungle_01",
				"pwh_wizard_tower_jungle_02",
				"pwh_wizard_tower_jungle_03",
				"pwh_wizard_tower_jungle_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_jungle_01",
				"pwh_wizard_tower_jungle_02",
				"pwh_wizard_tower_jungle_03",
				"pwh_wizard_tower_jungle_04"
			},
			sound_events_duration = {
				4.1449790000916,
				2.6329998970032,
				2.2070000171661,
				2.3050000667572
			}
		},
		pwh_wizard_tower_leap_of_faith = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_leap_of_faith_01",
				"pwh_wizard_tower_leap_of_faith_02",
				"pwh_wizard_tower_leap_of_faith_03",
				"pwh_wizard_tower_leap_of_faith_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_leap_of_faith_01",
				"pwh_wizard_tower_leap_of_faith_02",
				"pwh_wizard_tower_leap_of_faith_03",
				"pwh_wizard_tower_leap_of_faith_04"
			},
			sound_events_duration = {
				2.9849998950958,
				1.9090000391007,
				1.8020000457764,
				3.8729999065399
			}
		},
		pwh_wizard_tower_library = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_library_01",
				"pwh_wizard_tower_library_02",
				"pwh_wizard_tower_library_03",
				"pwh_wizard_tower_library_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_library_01",
				"pwh_wizard_tower_library_02",
				"pwh_wizard_tower_library_03",
				"pwh_wizard_tower_library_04"
			},
			sound_events_duration = {
				2.9619791507721,
				5.9519791603088,
				3.683000087738,
				3.6939792633057
			}
		},
		pwh_wizard_tower_observatory = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_observatory_01",
				"pwh_wizard_tower_observatory_02",
				"pwh_wizard_tower_observatory_03",
				"pwh_wizard_tower_observatory_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_observatory_01",
				"pwh_wizard_tower_observatory_02",
				"pwh_wizard_tower_observatory_03",
				"pwh_wizard_tower_observatory_04"
			},
			sound_events_duration = {
				5.2009792327881,
				2.8949792385101,
				6.7199792861939,
				4.6649789810181
			}
		},
		pwh_wizard_tower_pig = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_pig_01",
				"pwh_wizard_tower_pig_02",
				"pwh_wizard_tower_pig_03",
				"pwh_wizard_tower_pig_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_pig_01",
				"pwh_wizard_tower_pig_02",
				"pwh_wizard_tower_pig_03",
				"pwh_wizard_tower_pig_04"
			},
			sound_events_duration = {
				2.6519792079926,
				2.4179792404175,
				3.1359791755676,
				2.5099792480469
			}
		},
		pwh_wizard_tower_portal = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_portal_01",
				"pwh_wizard_tower_portal_02",
				"pwh_wizard_tower_portal_03",
				"pwh_wizard_tower_portal_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_portal_01",
				"pwh_wizard_tower_portal_02",
				"pwh_wizard_tower_portal_03",
				"pwh_wizard_tower_portal_04"
			},
			sound_events_duration = {
				5.6809792518616,
				2.9079792499542,
				2.0479791164398,
				5.022979259491
			}
		},
		pwh_wizard_tower_potion_maker = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_potion_maker_01",
				"pwh_wizard_tower_potion_maker_02",
				"pwh_wizard_tower_potion_maker_03",
				"pwh_wizard_tower_potion_maker_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_potion_maker_01",
				"pwh_wizard_tower_potion_maker_02",
				"pwh_wizard_tower_potion_maker_03",
				"pwh_wizard_tower_potion_maker_04"
			},
			sound_events_duration = {
				4.4489793777466,
				4.6159791946411,
				4.7309789657593,
				4.0029997825623
			}
		},
		pwh_wizard_tower_ropes = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
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
				"pwh_wizard_tower_ropes_01",
				"pwh_wizard_tower_ropes_02",
				"pwh_wizard_tower_ropes_03",
				"pwh_wizard_tower_ropes_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_ropes_01",
				"pwh_wizard_tower_ropes_02",
				"pwh_wizard_tower_ropes_03",
				"pwh_wizard_tower_ropes_04"
			},
			sound_events_duration = {
				4.2160000801086,
				1.9060000181198,
				1.6169999837875,
				1.5870000123978
			}
		},
		pwh_wizard_tower_skull_found_subsequent = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_dlc_wizards_tower",
			sound_events_n = 4,
			category = "seen_items",
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
				"pwh_wizard_tower_skull_found_subsequent_01",
				"pwh_wizard_tower_skull_found_subsequent_02",
				"pwh_wizard_tower_skull_found_subsequent_03",
				"pwh_wizard_tower_skull_found_subsequent_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_wizard_tower_skull_found_subsequent_01",
				"pwh_wizard_tower_skull_found_subsequent_02",
				"pwh_wizard_tower_skull_found_subsequent_03",
				"pwh_wizard_tower_skull_found_subsequent_04"
			},
			sound_events_duration = {
				1.8980000019074,
				2.364000082016,
				2.4189999103546,
				2.3740000724792
			}
		},
		pwh_wizard_tower_where_is_she_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_wizards_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_where_is_she_a_01",
				[2.0] = "pwh_wizard_tower_where_is_she_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wizard_tower_where_is_she_a_01",
				[2.0] = "pwh_wizard_tower_where_is_she_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.9939999580383,
				[2.0] = 3.2629792690277
			}
		},
		pwh_wizard_tower_where_is_she_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_dlc_wizards_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_where_is_she_b_01",
				[2.0] = "pwh_wizard_tower_where_is_she_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wizard_tower_where_is_she_b_01",
				[2.0] = "pwh_wizard_tower_where_is_she_b_02"
			},
			sound_events_duration = {
				[1.0] = 3.993979215622,
				[2.0] = 5.7369999885559
			}
		}
	})
end
