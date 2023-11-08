return function ()
	define_rule({
		name = "nfl_wizard_trail_join_hands_portal_a",
		response = "nfl_wizard_trail_join_hands_portal_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_join_hands_portal_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady_01"
			},
			{
				"user_memory",
				"wizard_trail_join_hands_portal_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_join_hands_portal_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nfl_wizard_trail_join_hands_portal_b",
		name = "nfl_wizard_trail_join_hands_portal_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_join_hands_portal_a_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"ferry_lady_01"
			}
		}
	})
	define_rule({
		name = "nfl_wizard_trail_make_for_tower",
		response = "nfl_wizard_trail_make_for_tower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_make_for_tower"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_trail_make_for_tower",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_make_for_tower",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_trail_muffled_complaint",
		response = "nfl_wizard_trail_muffled_complaint",
		criterias = {
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_muffled_complaint"
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"ferry_lady_crate"
			},
			{
				"user_memory",
				"nfl_complaints_trail",
				OP.LT,
				4
			}
		},
		on_done = {
			{
				"user_memory",
				"nfl_complaints_trail",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_trail_olesya_revealed_a",
		response = "nfl_wizard_trail_olesya_revealed_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_olesya_revealed_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_trail_olesya_revealed_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_olesya_revealed_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_trail_ritual_plan_a",
		response = "nfl_wizard_trail_ritual_plan_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_ritual_plan_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_trail_ritual_plan_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_ritual_plan_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nfl_wizard_trail_ritual_plan_b",
		name = "nfl_wizard_trail_ritual_plan_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_ritual_plan_a_done"
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		response = "nfl_wizard_trail_ritual_plan_c",
		name = "nfl_wizard_trail_ritual_plan_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_ritual_plan_b_done"
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		response = "nfl_wizard_trail_ritual_plan_d",
		name = "nfl_wizard_trail_ritual_plan_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_ritual_plan_c_done"
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_broken_mechanism",
		response = "nik_wizard_trail_broken_mechanism",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_broken_mechanism"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_broken_mechanism",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_broken_mechanism",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_caravan_a",
		response = "nik_wizard_trail_caravan_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_caravan_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_caravan_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_caravan_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_crate_drop_a",
		response = "nik_wizard_trail_crate_drop_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_crate_drop_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_crate_drop_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_crate_drop_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_dead_end",
		response = "nik_wizard_trail_dead_end",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_dead_end"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_dead_end",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_dead_end",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_find_cogs",
		response = "nik_wizard_trail_find_cogs",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_find_cogs"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_find_cogs",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_find_cogs",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_fixed_mechanism",
		response = "nik_wizard_trail_fixed_mechanism",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_fixed_mechanism"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_fixed_mechanism",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_fixed_mechanism",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_frozen_skaven",
		response = "nik_wizard_trail_frozen_skaven",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_frozen_skaven"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_frozen_skaven",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_frozen_skaven",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_idle",
		response = "nik_wizard_trail_idle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_idle"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_idle",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_idle",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_ignorance",
		response = "nik_wizard_trail_ignorance",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_olesya_revealed_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_ignorance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_ignorance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_intro_a",
		response = "nik_wizard_trail_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_intro_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_light_beacons",
		response = "nik_wizard_trail_light_beacons",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_light_beacons"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_light_beacons",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_light_beacons",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_lower_bridge_a",
		response = "nik_wizard_trail_lower_bridge_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_lower_bridge_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_lower_bridge_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_lower_bridge_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_new_torch",
		response = "nik_wizard_trail_new_torch",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_new_torch"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_new_torch",
				OP.LT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_new_torch",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_sleigh_lost",
		response = "nik_wizard_trail_sleigh_lost",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_sleigh_lost"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_sleigh_lost",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_sleigh_lost",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_winch",
		response = "nik_wizard_trail_winch",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_winch"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_winch",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_winch",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nsf_wizard_trail_intruders_a",
		response = "nsf_wizard_trail_intruders_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_intruders_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			},
			{
				"user_memory",
				"wizard_trail_intruders_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_intruders_a",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		nfl_wizard_trail_join_hands_portal_a = {
			override_awareness = "wizard_trail_join_hands_portal_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nfl_wizard_trail_join_hands_portal_a_01",
				"nfl_wizard_trail_join_hands_portal_a_02",
				"nfl_wizard_trail_join_hands_portal_a_03",
				"nfl_wizard_trail_join_hands_portal_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_trail_join_hands_portal_a_01",
				"nfl_wizard_trail_join_hands_portal_a_02",
				"nfl_wizard_trail_join_hands_portal_a_03",
				"nfl_wizard_trail_join_hands_portal_a_04"
			},
			sound_events_duration = {
				7.2242293357849,
				5.9530000686645,
				5.5434374809265,
				8.2484788894653
			}
		},
		nfl_wizard_trail_join_hands_portal_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nfl_wizard_trail_join_hands_portal_b_01",
				"nfl_wizard_trail_join_hands_portal_b_02",
				"nfl_wizard_trail_join_hands_portal_b_03",
				"nfl_wizard_trail_join_hands_portal_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_trail_join_hands_portal_b_01",
				"nfl_wizard_trail_join_hands_portal_b_02",
				"nfl_wizard_trail_join_hands_portal_b_03",
				"nfl_wizard_trail_join_hands_portal_b_04"
			},
			sound_events_duration = {
				5.1548542976379,
				5.4287915229797,
				7.0957918167114,
				6.5038542747498
			}
		},
		nfl_wizard_trail_make_for_tower = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nfl_wizard_trail_make_for_tower_01",
				"nfl_wizard_trail_make_for_tower_02",
				"nfl_wizard_trail_make_for_tower_03",
				"nfl_wizard_trail_make_for_tower_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_trail_make_for_tower_01",
				"nfl_wizard_trail_make_for_tower_02",
				"nfl_wizard_trail_make_for_tower_03",
				"nfl_wizard_trail_make_for_tower_04"
			},
			sound_events_duration = {
				2.2409791946411,
				1.7519999742508,
				2.2130000591278,
				2.441999912262
			}
		},
		nfl_wizard_trail_muffled_complaint = {
			intended_player_profile = "wood_elf",
			randomize_indexes_n = 0,
			face_animations_n = 19,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 19,
			category = "level_talk",
			dialogue_animations_n = 19,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"nfl_wizard_trail_muffled_complaint_01",
				"nfl_wizard_trail_muffled_complaint_02",
				"nfl_wizard_trail_muffled_complaint_03",
				"nfl_wizard_trail_muffled_complaint_04",
				"nfl_wizard_trail_muffled_complaint_05",
				"nfl_wizard_trail_muffled_complaint_07",
				"nfl_wizard_trail_muffled_complaint_08",
				"nfl_wizard_trail_muffled_complaint_09",
				"nfl_wizard_trail_muffled_complaint_10",
				"nfl_wizard_trail_muffled_oof_01",
				"nfl_wizard_trail_muffled_oof_02",
				"nfl_wizard_trail_muffled_oof_03",
				"nfl_wizard_trail_muffled_oof_04",
				"nfl_wizard_trail_muffled_oof_05",
				"nfl_wizard_trail_muffled_oof_06",
				"nfl_wizard_trail_muffled_oof_07",
				"nfl_wizard_trail_muffled_oof_08",
				"nfl_wizard_trail_muffled_oof_09",
				"nfl_wizard_trail_muffled_oof_10"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_trail_muffled_complaint_01",
				"nfl_wizard_trail_muffled_complaint_02",
				"nfl_wizard_trail_muffled_complaint_03",
				"nfl_wizard_trail_muffled_complaint_04",
				"nfl_wizard_trail_muffled_complaint_05",
				"nfl_wizard_trail_muffled_complaint_07",
				"nfl_wizard_trail_muffled_complaint_08",
				"nfl_wizard_trail_muffled_complaint_09",
				"nfl_wizard_trail_muffled_complaint_10",
				"nfl_wizard_trail_muffled_oof_01",
				"nfl_wizard_trail_muffled_oof_02",
				"nfl_wizard_trail_muffled_oof_03",
				"nfl_wizard_trail_muffled_oof_04",
				"nfl_wizard_trail_muffled_oof_05",
				"nfl_wizard_trail_muffled_oof_06",
				"nfl_wizard_trail_muffled_oof_07",
				"nfl_wizard_trail_muffled_oof_08",
				"nfl_wizard_trail_muffled_oof_09",
				"nfl_wizard_trail_muffled_oof_10"
			},
			sound_events_duration = {
				0.82842808961868,
				0.60104387998581,
				1.007646560669,
				0.41800001263619,
				0.36320525407791,
				1.1863391399384,
				0.67385339736938,
				0.9203690290451,
				0.71100002527237,
				0.56699997186661,
				0.4839999973774,
				0.32600000500679,
				0.43299999833107,
				0.65200001001358,
				0.81599998474121,
				0.97600001096725,
				0.50700002908707,
				0.52300000190735,
				0.91299998760223
			}
		},
		nfl_wizard_trail_olesya_revealed_a = {
			override_awareness = "wizard_trail_olesya_revealed_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nfl_wizard_trail_olesya_revealed_a_01",
				"nfl_wizard_trail_olesya_revealed_a_02",
				"nfl_wizard_trail_olesya_revealed_a_03",
				"nfl_wizard_trail_olesya_revealed_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_trail_olesya_revealed_a_01",
				"nfl_wizard_trail_olesya_revealed_a_02",
				"nfl_wizard_trail_olesya_revealed_a_03",
				"nfl_wizard_trail_olesya_revealed_a_04"
			},
			sound_events_duration = {
				3.3892290592194,
				3.646187543869,
				4.3796248435974,
				3.0483748912811
			}
		},
		nfl_wizard_trail_ritual_plan_a = {
			override_awareness = "wizard_trail_ritual_plan_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nfl_wizard_trail_ritual_plan_a_01",
				"nfl_wizard_trail_ritual_plan_a_02",
				"nfl_wizard_trail_ritual_plan_a_03",
				"nfl_wizard_trail_ritual_plan_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_trail_ritual_plan_a_01",
				"nfl_wizard_trail_ritual_plan_a_02",
				"nfl_wizard_trail_ritual_plan_a_03",
				"nfl_wizard_trail_ritual_plan_a_04"
			},
			sound_events_duration = {
				4.9060206413269,
				5.4338331222534,
				7.0984997749329,
				5.785728931427
			}
		},
		nfl_wizard_trail_ritual_plan_b = {
			override_awareness = "wizard_trail_ritual_plan_b_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nfl_wizard_trail_ritual_plan_b_01",
				"nfl_wizard_trail_ritual_plan_b_02",
				"nfl_wizard_trail_ritual_plan_b_03",
				"nfl_wizard_trail_ritual_plan_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_trail_ritual_plan_b_01",
				"nfl_wizard_trail_ritual_plan_b_02",
				"nfl_wizard_trail_ritual_plan_b_03",
				"nfl_wizard_trail_ritual_plan_b_04"
			},
			sound_events_duration = {
				8.1947498321533,
				8.0052709579468,
				7.5992708206177,
				5.6030206680298
			}
		},
		nfl_wizard_trail_ritual_plan_c = {
			override_awareness = "wizard_trail_ritual_plan_c_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nfl_wizard_trail_ritual_plan_c_01",
				"nfl_wizard_trail_ritual_plan_c_02",
				"nfl_wizard_trail_ritual_plan_c_03",
				"nfl_wizard_trail_ritual_plan_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_trail_ritual_plan_c_01",
				"nfl_wizard_trail_ritual_plan_c_02",
				"nfl_wizard_trail_ritual_plan_c_03",
				"nfl_wizard_trail_ritual_plan_c_04"
			},
			sound_events_duration = {
				6.0699377059936,
				5.6842083930969,
				3.9045000076294,
				4.5947289466858
			}
		},
		nfl_wizard_trail_ritual_plan_d = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nfl_wizard_trail_ritual_plan_d_01",
				"nfl_wizard_trail_ritual_plan_d_02",
				"nfl_wizard_trail_ritual_plan_d_03",
				"nfl_wizard_trail_ritual_plan_d_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_trail_ritual_plan_d_01",
				"nfl_wizard_trail_ritual_plan_d_02",
				"nfl_wizard_trail_ritual_plan_d_03",
				"nfl_wizard_trail_ritual_plan_d_04"
			},
			sound_events_duration = {
				3.9789373874664,
				4.2766876220703,
				4.1481251716614,
				5.6706876754761
			}
		},
		nik_wizard_trail_broken_mechanism = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_broken_mechanism_01",
				"nik_wizard_trail_broken_mechanism_02",
				"nik_wizard_trail_broken_mechanism_03",
				"nik_wizard_trail_broken_mechanism_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_broken_mechanism_01",
				"nik_wizard_trail_broken_mechanism_02",
				"nik_wizard_trail_broken_mechanism_03",
				"nik_wizard_trail_broken_mechanism_04"
			},
			sound_events_duration = {
				5.4333543777466,
				4.1426248550415,
				5.5845832824707,
				4.0630416870117
			}
		},
		nik_wizard_trail_caravan_a = {
			override_awareness = "nik_wizard_trail_caravan_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_caravan_a_01",
				"nik_wizard_trail_caravan_a_02",
				"nik_wizard_trail_caravan_a_03",
				"nik_wizard_trail_caravan_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_caravan_a_01",
				"nik_wizard_trail_caravan_a_02",
				"nik_wizard_trail_caravan_a_03",
				"nik_wizard_trail_caravan_a_04"
			},
			sound_events_duration = {
				6.0706872940064,
				5.6311459541321,
				5.5562705993652,
				5.800208568573
			}
		},
		nik_wizard_trail_crate_drop_a = {
			override_awareness = "nik_wizard_trail_crate_drop_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_crate_drop_a_01",
				"nik_wizard_trail_crate_drop_a_02",
				"nik_wizard_trail_crate_drop_a_03",
				"nik_wizard_trail_crate_drop_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_crate_drop_a_01",
				"nik_wizard_trail_crate_drop_a_02",
				"nik_wizard_trail_crate_drop_a_03",
				"nik_wizard_trail_crate_drop_a_04"
			},
			sound_events_duration = {
				3.8259582519531,
				2.8234791755676,
				3.2563333511352,
				5.6842918395996
			}
		},
		nik_wizard_trail_dead_end = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_dead_end_01",
				"nik_wizard_trail_dead_end_02",
				"nik_wizard_trail_dead_end_03",
				"nik_wizard_trail_dead_end_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_dead_end_01",
				"nik_wizard_trail_dead_end_02",
				"nik_wizard_trail_dead_end_03",
				"nik_wizard_trail_dead_end_04"
			},
			sound_events_duration = {
				6.2171039581299,
				4.5730834007263,
				6.9168334007263,
				4.4809999465942
			}
		},
		nik_wizard_trail_find_cogs = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_find_cogs_01",
				"nik_wizard_trail_find_cogs_02",
				"nik_wizard_trail_find_cogs_03",
				"nik_wizard_trail_find_cogs_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_find_cogs_01",
				"nik_wizard_trail_find_cogs_02",
				"nik_wizard_trail_find_cogs_03",
				"nik_wizard_trail_find_cogs_04"
			},
			sound_events_duration = {
				3.8534791469574,
				7.1375622749329,
				7.9504375457764,
				5.5037498474121
			}
		},
		nik_wizard_trail_fixed_mechanism = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_fixed_mechanism_01",
				"nik_wizard_trail_fixed_mechanism_02",
				"nik_wizard_trail_fixed_mechanism_03",
				"nik_wizard_trail_fixed_mechanism_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_fixed_mechanism_01",
				"nik_wizard_trail_fixed_mechanism_02",
				"nik_wizard_trail_fixed_mechanism_03",
				"nik_wizard_trail_fixed_mechanism_04"
			},
			sound_events_duration = {
				4.9676456451416,
				3.8248541355133,
				4.7871875762939,
				4.4052290916443
			}
		},
		nik_wizard_trail_frozen_skaven = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
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
				"nik_wizard_trail_frozen_skaven_01",
				"nik_wizard_trail_frozen_skaven_02",
				"nik_wizard_trail_frozen_skaven_03",
				"nik_wizard_trail_frozen_skaven_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_frozen_skaven_01",
				"nik_wizard_trail_frozen_skaven_02",
				"nik_wizard_trail_frozen_skaven_03",
				"nik_wizard_trail_frozen_skaven_04"
			},
			sound_events_duration = {
				4.3854789733887,
				4.1340622901917,
				5.8414793014526,
				8.5621042251587
			}
		},
		nik_wizard_trail_idle = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 10,
			category = "story_talk",
			dialogue_animations_n = 10,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"nik_wizard_trail_idle_01",
				"nik_wizard_trail_idle_02",
				"nik_wizard_trail_idle_03",
				"nik_wizard_trail_idle_04",
				"nik_wizard_trail_idle_05",
				"nik_wizard_trail_idle_06",
				"nik_wizard_trail_idle_07",
				"nik_wizard_trail_idle_08",
				"nik_wizard_trail_idle_09",
				"nik_wizard_trail_idle_10"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_idle_01",
				"nik_wizard_trail_idle_02",
				"nik_wizard_trail_idle_03",
				"nik_wizard_trail_idle_04",
				"nik_wizard_trail_idle_05",
				"nik_wizard_trail_idle_06",
				"nik_wizard_trail_idle_07",
				"nik_wizard_trail_idle_08",
				"nik_wizard_trail_idle_09",
				"nik_wizard_trail_idle_10"
			},
			sound_events_duration = {
				4.5731043815613,
				5.2546248435974,
				7.6170415878296,
				7.0415000915527,
				4.5178542137146,
				5.3928127288818,
				6.3230209350586,
				5.7289791107178,
				9.2872705459595,
				6.125
			}
		},
		nik_wizard_trail_ignorance = {
			override_awareness = "wizard_trail_ritual_plan_a",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_ignorance_01",
				"nik_wizard_trail_ignorance_02",
				"nik_wizard_trail_ignorance_03",
				"nik_wizard_trail_ignorance_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_ignorance_01",
				"nik_wizard_trail_ignorance_02",
				"nik_wizard_trail_ignorance_03",
				"nik_wizard_trail_ignorance_04"
			},
			sound_events_duration = {
				4.1068539619446,
				4.9257292747498,
				5.0056667327881,
				6.4669790267944
			}
		},
		nik_wizard_trail_intro_a = {
			override_awareness = "nik_wizard_trail_intro_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_intro_a_01",
				"nik_wizard_trail_intro_a_02",
				"nik_wizard_trail_intro_a_03",
				"nik_wizard_trail_intro_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_intro_a_01",
				"nik_wizard_trail_intro_a_02",
				"nik_wizard_trail_intro_a_03",
				"nik_wizard_trail_intro_a_04"
			},
			sound_events_duration = {
				11.729541778564,
				13.071249961853,
				12.245583534241,
				15.188625335693
			}
		},
		nik_wizard_trail_light_beacons = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_light_beacons_01",
				"nik_wizard_trail_light_beacons_02",
				"nik_wizard_trail_light_beacons_03",
				"nik_wizard_trail_light_beacons_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_light_beacons_01",
				"nik_wizard_trail_light_beacons_02",
				"nik_wizard_trail_light_beacons_03",
				"nik_wizard_trail_light_beacons_04"
			},
			sound_events_duration = {
				6.1416873931885,
				5.4211874008179,
				6.1566877365112,
				7.6314582824707
			}
		},
		nik_wizard_trail_lower_bridge_a = {
			override_awareness = "nik_wizard_trail_lower_bridge_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_lower_bridge_a_01",
				"nik_wizard_trail_lower_bridge_a_02",
				"nik_wizard_trail_lower_bridge_a_03",
				"nik_wizard_trail_lower_bridge_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_lower_bridge_a_01",
				"nik_wizard_trail_lower_bridge_a_02",
				"nik_wizard_trail_lower_bridge_a_03",
				"nik_wizard_trail_lower_bridge_a_04"
			},
			sound_events_duration = {
				4.9296040534973,
				8.4636878967285,
				3.1830625534058,
				7.2784376144409
			}
		},
		nik_wizard_trail_new_torch = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 6,
			category = "level_talk",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"nik_wizard_trail_new_torch_01",
				"nik_wizard_trail_new_torch_02",
				"nik_wizard_trail_new_torch_03",
				"nik_wizard_trail_new_torch_04",
				"nik_wizard_trail_new_torch_05",
				"nik_wizard_trail_new_torch_06"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_new_torch_01",
				"nik_wizard_trail_new_torch_02",
				"nik_wizard_trail_new_torch_03",
				"nik_wizard_trail_new_torch_04",
				"nik_wizard_trail_new_torch_05",
				"nik_wizard_trail_new_torch_06"
			},
			sound_events_duration = {
				2.6423749923706,
				2.5272500514984,
				2.6879999637604,
				3.2748959064484,
				2.6362292766571,
				3.5692083835602
			}
		},
		nik_wizard_trail_sleigh_lost = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
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
				"nik_wizard_trail_sleigh_lost_01",
				"nik_wizard_trail_sleigh_lost_02",
				"nik_wizard_trail_sleigh_lost_03",
				"nik_wizard_trail_sleigh_lost_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_sleigh_lost_01",
				"nik_wizard_trail_sleigh_lost_02",
				"nik_wizard_trail_sleigh_lost_03",
				"nik_wizard_trail_sleigh_lost_04"
			},
			sound_events_duration = {
				2.9887917041779,
				4.357458114624,
				4.6255831718445,
				4.0182290077209
			}
		},
		nik_wizard_trail_winch = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nik_wizard_trail_winch_01",
				"nik_wizard_trail_winch_02",
				"nik_wizard_trail_winch_03",
				"nik_wizard_trail_winch_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_trail_winch_01",
				"nik_wizard_trail_winch_02",
				"nik_wizard_trail_winch_03",
				"nik_wizard_trail_winch_04"
			},
			sound_events_duration = {
				5.4553542137146,
				3.4285624027252,
				4.8733124732971,
				7.2972497940064
			}
		},
		nsf_wizard_trail_intruders_a = {
			override_awareness = "nsf_wizard_trail_intruders_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"nsf_wizard_trail_intruders_a_01",
				"nsf_wizard_trail_intruders_a_02",
				"nsf_wizard_trail_intruders_a_03",
				"nsf_wizard_trail_intruders_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_trail_intruders_a_01",
				"nsf_wizard_trail_intruders_a_02",
				"nsf_wizard_trail_intruders_a_03",
				"nsf_wizard_trail_intruders_a_04"
			},
			sound_events_duration = {
				6.600604057312,
				5.5250415802002,
				9.3503751754761,
				8.6354789733887
			}
		}
	})
end
