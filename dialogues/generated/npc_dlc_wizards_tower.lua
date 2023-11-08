return function ()
	define_rule({
		name = "nfl_wizard_tower_challenge",
		response = "nfl_wizard_tower_challenge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_challenge_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_challenge_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_challenge_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nfl_wizard_tower_cutscene_a",
		name = "nfl_wizard_tower_cutscene_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_cutscene_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady_01"
			}
		}
	})
	define_rule({
		response = "nfl_wizard_tower_cutscene_b",
		name = "nfl_wizard_tower_cutscene_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_cutscene_a_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady_01"
			}
		}
	})
	define_rule({
		response = "nfl_wizard_tower_cutscene_c",
		name = "nfl_wizard_tower_cutscene_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_cutscene_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady_01"
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_destroy_wards_a",
		response = "nfl_wizard_tower_destroy_wards_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_destroy_wards"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_destroy_wards_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_destroy_wards_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_door",
		response = "nfl_wizard_tower_door",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_door"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_door",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_door",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_enchantment",
		response = "nfl_wizard_tower_enchantment",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_enchantment"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_enchantment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_enchantment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_flame_source",
		response = "nfl_wizard_tower_flame_source",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_flame_source"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_flame_source",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_flame_source",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_jungle_two",
		response = "nfl_wizard_tower_jungle_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_jungle_two"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_jungle_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_jungle_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_keep_climbing",
		response = "nfl_wizard_tower_keep_climbing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_keep_climbing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_keep_climbing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_keep_climbing",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nfl_wizard_tower_ready_end_event",
		name = "nfl_wizard_tower_ready_end_event",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_ready_end_event"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady_02"
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_scheme_a",
		response = "nfl_wizard_tower_scheme_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_scheme_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady_02"
			},
			{
				"user_memory",
				"wizard_tower_scheme_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_scheme_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nfl_wizard_tower_scheme_b",
		name = "nfl_wizard_tower_scheme_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_scheme_a_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady_02"
			}
		}
	})
	define_rule({
		response = "nfl_wizard_tower_scheme_c",
		name = "nfl_wizard_tower_scheme_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_scheme_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady_02"
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_skull_found_first",
		response = "nfl_wizard_tower_skull_found_first",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_skull_found_first"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_skull_found_first",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_skull_found_first",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nfl_wizard_tower_spellcasting",
		name = "nfl_wizard_tower_spellcasting",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_spellcasting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_test_subjects",
		response = "nfl_wizard_tower_test_subjects",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_test_subjects"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_test_subjects",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_test_subjects",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_thanks",
		response = "nfl_wizard_tower_thanks",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_thanks"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady_03"
			},
			{
				"user_memory",
				"wizard_tower_thanks",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_thanks",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_wards_done",
		response = "nfl_wizard_tower_wards_done",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_wards_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_wards_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_wards_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_destroy_wards_a",
		response = "nik_wizard_tower_destroy_wards_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_destroy_wards"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_destroy_wards_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_destroy_wards_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_door",
		response = "nik_wizard_tower_door",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_door"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_door",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_door",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_enchantment",
		response = "nik_wizard_tower_enchantment",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_enchantment"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_enchantment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_enchantment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_flame_source",
		response = "nik_wizard_tower_flame_source",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_flame_source"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_flame_source",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_flame_source",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_hurry",
		response = "nik_wizard_tower_hurry",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_hurry"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_hurry",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_hurry",
				OP.ADD,
				3
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_intro_a",
		response = "nik_wizard_tower_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_intro_a_dummy_trigger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_jungle_two",
		response = "nik_wizard_tower_jungle_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_jungle_two"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_jungle_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_jungle_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_keep_climbing",
		response = "nik_wizard_tower_keep_climbing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_keep_climbing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_keep_climbing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_keep_climbing",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_test_subjects",
		response = "nik_wizard_tower_test_subjects",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_test_subjects"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_test_subjects",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_test_subjects",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_wards_done",
		response = "nik_wizard_tower_wards_done",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_wards_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_wards_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_wards_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nsf_wizard_tower_block_well",
		name = "nsf_wizard_tower_block_well",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_block_well"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus_01"
			}
		}
	})
	define_rule({
		response = "nsf_wizard_tower_challenge_reply",
		name = "nsf_wizard_tower_challenge_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_challenge_a_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus_01"
			}
		}
	})
	define_rule({
		name = "nsf_wizard_tower_defeat",
		response = "nsf_wizard_tower_defeat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_defeat"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus_01"
			},
			{
				"user_memory",
				"wizard_tower_defeat",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_defeat",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nsf_wizard_tower_door",
		response = "nsf_wizard_tower_door",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_door_mid"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			},
			{
				"user_memory",
				"wizard_tower_door",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_door",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nsf_wizard_tower_enchantment",
		response = "nsf_wizard_tower_enchantment",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_enchantment"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			},
			{
				"user_memory",
				"wizard_tower_enchantment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_enchantment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nsf_wizard_tower_keep_climbing",
		response = "nsf_wizard_tower_keep_climbing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_keep_climbing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			},
			{
				"user_memory",
				"wizard_tower_keep_climbing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_keep_climbing",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nsf_wizard_tower_library_two_a",
		response = "nsf_wizard_tower_library_two_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_library_two"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			},
			{
				"user_memory",
				"wizard_tower_library_two_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_library_two_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nsf_wizard_tower_library_two_long_a",
		name = "nsf_wizard_tower_library_two_long_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_library_two_long_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			}
		}
	})
	define_rule({
		response = "nsf_wizard_tower_library_two_long_b",
		name = "nsf_wizard_tower_library_two_long_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_library_two_long_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			}
		}
	})
	define_rule({
		response = "nsf_wizard_tower_library_two_long_c",
		name = "nsf_wizard_tower_library_two_long_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_library_two_long_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			}
		}
	})
	define_rule({
		response = "nsf_wizard_tower_spellcasting",
		name = "nsf_wizard_tower_spellcasting",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_spellcasting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus_01"
			}
		}
	})
	define_rule({
		name = "nsf_wizard_tower_test_subjects",
		response = "nsf_wizard_tower_test_subjects",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_test_subjects"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			},
			{
				"user_memory",
				"wizard_tower_test_subjects",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_test_subjects",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nsf_wizard_tower_waste_disposal_a",
		response = "nsf_wizard_tower_waste_disposal_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_waste_disposal"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			},
			{
				"user_memory",
				"wizard_tower_waste_disposal_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_waste_disposal_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nsf_wizard_tower_welcome_a",
		response = "nsf_wizard_tower_welcome_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_welcome"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"sofia_fuegonasus"
			},
			{
				"user_memory",
				"wizard_tower_welcome_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_welcome_a",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		nfl_wizard_tower_challenge = {
			override_awareness = "wizard_tower_challenge_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 3,
			category = "level_talk_must_play",
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
				"nfl_wizard_tower_challenge_02",
				"nfl_wizard_tower_challenge_03",
				"nfl_wizard_tower_challenge_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_challenge_02",
				"nfl_wizard_tower_challenge_03",
				"nfl_wizard_tower_challenge_04"
			},
			sound_events_duration = {
				2.0569999217987,
				2.4820001125336,
				2.6470000743866
			}
		},
		nfl_wizard_tower_cutscene_a = {
			override_awareness = "wizard_tower_cutscene_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 3,
			category = "level_talk_must_play",
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
				"nfl_wizard_tower_cutscene_a_01",
				"nfl_wizard_tower_cutscene_a_02",
				"nfl_wizard_tower_cutscene_a_03"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_cutscene_a_01",
				"nfl_wizard_tower_cutscene_a_02",
				"nfl_wizard_tower_cutscene_a_03"
			},
			sound_events_duration = {
				6.1721043586731,
				5.890625,
				4.8249793052673
			}
		},
		nfl_wizard_tower_cutscene_b = {
			override_awareness = "wizard_tower_cutscene_b_done",
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 2,
			category = "level_talk_must_play",
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
				[1.0] = "nfl_wizard_tower_cutscene_b_02",
				[2.0] = "nfl_wizard_tower_cutscene_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "nfl_wizard_tower_cutscene_b_02",
				[2.0] = "nfl_wizard_tower_cutscene_b_04"
			},
			sound_events_duration = {
				[1.0] = 5.499979019165,
				[2.0] = 4.2619791030884
			}
		},
		nfl_wizard_tower_cutscene_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nfl_wizard_tower_cutscene_c_01",
				"nfl_wizard_tower_cutscene_c_02",
				"nfl_wizard_tower_cutscene_c_03",
				"nfl_wizard_tower_cutscene_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_cutscene_c_01",
				"nfl_wizard_tower_cutscene_c_02",
				"nfl_wizard_tower_cutscene_c_03",
				"nfl_wizard_tower_cutscene_c_04"
			},
			sound_events_duration = {
				5.0159792900085,
				5.786687374115,
				4.7719788551331,
				5.5380001068115
			}
		},
		nfl_wizard_tower_destroy_wards_a = {
			override_awareness = "wizard_tower_destroy_wards_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nfl_wizard_tower_destroy_wards_a_01",
				"nfl_wizard_tower_destroy_wards_a_02",
				"nfl_wizard_tower_destroy_wards_a_03",
				"nfl_wizard_tower_destroy_wards_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_destroy_wards_a_01",
				"nfl_wizard_tower_destroy_wards_a_02",
				"nfl_wizard_tower_destroy_wards_a_03",
				"nfl_wizard_tower_destroy_wards_a_04"
			},
			sound_events_duration = {
				5.4544792175293,
				3.5658957958221,
				2.8757500648499,
				3.042249917984
			}
		},
		nfl_wizard_tower_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nfl_wizard_tower_door_01",
				"nfl_wizard_tower_door_02",
				"nfl_wizard_tower_door_03",
				"nfl_wizard_tower_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_door_01",
				"nfl_wizard_tower_door_02",
				"nfl_wizard_tower_door_03",
				"nfl_wizard_tower_door_04"
			},
			sound_events_duration = {
				2.9376666545868,
				3.2287499904633,
				4.0734376907349,
				2.4720416069031
			}
		},
		nfl_wizard_tower_enchantment = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nfl_wizard_tower_enchantment_01",
				"nfl_wizard_tower_enchantment_02",
				"nfl_wizard_tower_enchantment_03",
				"nfl_wizard_tower_enchantment_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_enchantment_01",
				"nfl_wizard_tower_enchantment_02",
				"nfl_wizard_tower_enchantment_03",
				"nfl_wizard_tower_enchantment_04"
			},
			sound_events_duration = {
				6.1636667251587,
				6.0669164657593,
				6.8027291297913,
				5.8817291259766
			}
		},
		nfl_wizard_tower_flame_source = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nfl_wizard_tower_flame_source_01",
				"nfl_wizard_tower_flame_source_02",
				"nfl_wizard_tower_flame_source_03",
				"nfl_wizard_tower_flame_source_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_flame_source_01",
				"nfl_wizard_tower_flame_source_02",
				"nfl_wizard_tower_flame_source_03",
				"nfl_wizard_tower_flame_source_04"
			},
			sound_events_duration = {
				4.1308331489563,
				4.9603748321533,
				4.0374584197998,
				5.0667500495911
			}
		},
		nfl_wizard_tower_jungle_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nfl_wizard_tower_jungle_two_01",
				"nfl_wizard_tower_jungle_two_02",
				"nfl_wizard_tower_jungle_two_03",
				"nfl_wizard_tower_jungle_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_jungle_two_01",
				"nfl_wizard_tower_jungle_two_02",
				"nfl_wizard_tower_jungle_two_03",
				"nfl_wizard_tower_jungle_two_04"
			},
			sound_events_duration = {
				3.4157500267029,
				5.7245626449585,
				2.7236459255219,
				3.662291765213
			}
		},
		nfl_wizard_tower_keep_climbing = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nfl_wizard_tower_keep_climbing_01",
				"nfl_wizard_tower_keep_climbing_02",
				"nfl_wizard_tower_keep_climbing_03",
				"nfl_wizard_tower_keep_climbing_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_keep_climbing_01",
				"nfl_wizard_tower_keep_climbing_02",
				"nfl_wizard_tower_keep_climbing_03",
				"nfl_wizard_tower_keep_climbing_04"
			},
			sound_events_duration = {
				3.2766873836517,
				3.2225832939148,
				4.3532290458679,
				4.3635835647583
			}
		},
		nfl_wizard_tower_ready_end_event = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "npc_dlc_wizards_tower",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "nfl_wizard_tower_challenge_01"
			},
			sound_events = {
				[1.0] = "nfl_wizard_tower_challenge_01"
			},
			sound_events_duration = {
				[1.0] = 1.6347708702087
			}
		},
		nfl_wizard_tower_scheme_a = {
			override_awareness = "wizard_tower_scheme_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 3,
			category = "level_talk_must_play",
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
				"nfl_wizard_tower_scheme_a_01",
				"nfl_wizard_tower_scheme_a_02",
				"nfl_wizard_tower_scheme_a_03"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_scheme_a_01",
				"nfl_wizard_tower_scheme_a_02",
				"nfl_wizard_tower_scheme_a_03"
			},
			sound_events_duration = {
				7.0259790420532,
				5.2469792366028,
				7.1674165725708
			}
		},
		nfl_wizard_tower_scheme_b = {
			override_awareness = "wizard_tower_scheme_b_done",
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 3,
			category = "level_talk_must_play",
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
				"nfl_wizard_tower_scheme_b_01",
				"nfl_wizard_tower_scheme_b_02",
				"nfl_wizard_tower_scheme_b_03"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_scheme_b_01",
				"nfl_wizard_tower_scheme_b_02",
				"nfl_wizard_tower_scheme_b_03"
			},
			sound_events_duration = {
				5.0889792442322,
				5.5549788475037,
				6.042854309082
			}
		},
		nfl_wizard_tower_scheme_c = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 3,
			category = "level_talk_must_play",
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
				"nfl_wizard_tower_scheme_c_01",
				"nfl_wizard_tower_scheme_c_02",
				"nfl_wizard_tower_scheme_c_03"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_scheme_c_01",
				"nfl_wizard_tower_scheme_c_02",
				"nfl_wizard_tower_scheme_c_03"
			},
			sound_events_duration = {
				5.1289792060852,
				5.883978843689,
				5.9484581947327
			}
		},
		nfl_wizard_tower_skull_found_first = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nfl_wizard_tower_skull_found_first_01",
				"nfl_wizard_tower_skull_found_first_02",
				"nfl_wizard_tower_skull_found_first_03",
				"nfl_wizard_tower_skull_found_first_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_skull_found_first_01",
				"nfl_wizard_tower_skull_found_first_02",
				"nfl_wizard_tower_skull_found_first_03",
				"nfl_wizard_tower_skull_found_first_04"
			},
			sound_events_duration = {
				4.5963335037231,
				5.4224376678467,
				6.3744792938232,
				5.5317916870117
			}
		},
		nfl_wizard_tower_spellcasting = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 8,
			category = "npc_talk",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_calm"
			},
			localization_strings = {
				"nfl_wizard_tower_spellcasting_01",
				"nfl_wizard_tower_spellcasting_02",
				"nfl_wizard_tower_spellcasting_03",
				"nfl_wizard_tower_spellcasting_04",
				"nfl_wizard_tower_spellcasting_05",
				"nfl_wizard_tower_spellcasting_06",
				"nfl_wizard_tower_spellcasting_07",
				"nfl_wizard_tower_spellcasting_08"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_spellcasting_01",
				"nfl_wizard_tower_spellcasting_02",
				"nfl_wizard_tower_spellcasting_03",
				"nfl_wizard_tower_spellcasting_04",
				"nfl_wizard_tower_spellcasting_05",
				"nfl_wizard_tower_spellcasting_06",
				"nfl_wizard_tower_spellcasting_07",
				"nfl_wizard_tower_spellcasting_08"
			},
			sound_events_duration = {
				1.9259999990463,
				1.5460000038147,
				1.2330000400543,
				2.3389999866486,
				1.4340000152588,
				1.6059999465942,
				1.5420000553131,
				1.5720000267029
			}
		},
		nfl_wizard_tower_test_subjects = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nfl_wizard_tower_test_subjects_01",
				"nfl_wizard_tower_test_subjects_02",
				"nfl_wizard_tower_test_subjects_03",
				"nfl_wizard_tower_test_subjects_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_test_subjects_01",
				"nfl_wizard_tower_test_subjects_02",
				"nfl_wizard_tower_test_subjects_03",
				"nfl_wizard_tower_test_subjects_04"
			},
			sound_events_duration = {
				3.3350207805634,
				3.2562291622162,
				4.5965418815613,
				6.2797498703003
			}
		},
		nfl_wizard_tower_thanks = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nfl_wizard_tower_thanks_01",
				"nfl_wizard_tower_thanks_02",
				"nfl_wizard_tower_thanks_03",
				"nfl_wizard_tower_thanks_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_thanks_01",
				"nfl_wizard_tower_thanks_02",
				"nfl_wizard_tower_thanks_03",
				"nfl_wizard_tower_thanks_04"
			},
			sound_events_duration = {
				5.5989999771118,
				5.0170001983643,
				6.254979133606,
				5.2369790077209
			}
		},
		nfl_wizard_tower_wards_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nfl_wizard_tower_wards_done_01",
				"nfl_wizard_tower_wards_done_02",
				"nfl_wizard_tower_wards_done_03",
				"nfl_wizard_tower_wards_done_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_wizard_tower_wards_done_01",
				"nfl_wizard_tower_wards_done_02",
				"nfl_wizard_tower_wards_done_03",
				"nfl_wizard_tower_wards_done_04"
			},
			sound_events_duration = {
				4.553729057312,
				3.5442500114441,
				4.9660625457764,
				4.5327291488647
			}
		},
		nik_wizard_tower_destroy_wards_a = {
			override_awareness = "wizard_tower_destroy_wards_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nik_wizard_tower_destroy_wards_a_01",
				"nik_wizard_tower_destroy_wards_a_02",
				"nik_wizard_tower_destroy_wards_a_03",
				"nik_wizard_tower_destroy_wards_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_destroy_wards_a_01",
				"nik_wizard_tower_destroy_wards_a_02",
				"nik_wizard_tower_destroy_wards_a_03",
				"nik_wizard_tower_destroy_wards_a_04"
			},
			sound_events_duration = {
				6.2860207557678,
				4.6120414733887,
				4.5623331069946,
				7.0535416603088
			}
		},
		nik_wizard_tower_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nik_wizard_tower_door_01",
				"nik_wizard_tower_door_02",
				"nik_wizard_tower_door_03",
				"nik_wizard_tower_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_door_01",
				"nik_wizard_tower_door_02",
				"nik_wizard_tower_door_03",
				"nik_wizard_tower_door_04"
			},
			sound_events_duration = {
				6.8838124275208,
				4.208083152771,
				4.5577502250671,
				5.0543541908264
			}
		},
		nik_wizard_tower_enchantment = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nik_wizard_tower_enchantment_01",
				"nik_wizard_tower_enchantment_02",
				"nik_wizard_tower_enchantment_03",
				"nik_wizard_tower_enchantment_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_enchantment_01",
				"nik_wizard_tower_enchantment_02",
				"nik_wizard_tower_enchantment_03",
				"nik_wizard_tower_enchantment_04"
			},
			sound_events_duration = {
				5.2644791603088,
				6.0026664733887,
				5.1353335380554,
				6.8399376869202
			}
		},
		nik_wizard_tower_flame_source = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nik_wizard_tower_flame_source_01",
				"nik_wizard_tower_flame_source_02",
				"nik_wizard_tower_flame_source_03",
				"nik_wizard_tower_flame_source_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_flame_source_01",
				"nik_wizard_tower_flame_source_02",
				"nik_wizard_tower_flame_source_03",
				"nik_wizard_tower_flame_source_04"
			},
			sound_events_duration = {
				4.5377497673035,
				4.4685831069946,
				5.6055207252502,
				4.830958366394
			}
		},
		nik_wizard_tower_hurry = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 8,
			category = "npc_talk",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_calm"
			},
			localization_strings = {
				"nik_wizard_tower_hurry_01",
				"nik_wizard_tower_hurry_02",
				"nik_wizard_tower_hurry_03",
				"nik_wizard_tower_hurry_04",
				"nik_wizard_tower_hurry_05",
				"nik_wizard_tower_hurry_06",
				"nik_wizard_tower_hurry_07",
				"nik_wizard_tower_hurry_08"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_hurry_01",
				"nik_wizard_tower_hurry_02",
				"nik_wizard_tower_hurry_03",
				"nik_wizard_tower_hurry_04",
				"nik_wizard_tower_hurry_05",
				"nik_wizard_tower_hurry_06",
				"nik_wizard_tower_hurry_07",
				"nik_wizard_tower_hurry_08"
			},
			sound_events_duration = {
				1.8195208311081,
				4.976104259491,
				2.8476042747498,
				4.2621665000916,
				3.3196249008179,
				2.8476042747498,
				3.3467707633972,
				3.0949165821075
			}
		},
		nik_wizard_tower_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nik_wizard_tower_intro_a_01",
				"nik_wizard_tower_intro_a_02",
				"nik_wizard_tower_intro_a_03",
				"nik_wizard_tower_intro_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_intro_a_01",
				"nik_wizard_tower_intro_a_02",
				"nik_wizard_tower_intro_a_03",
				"nik_wizard_tower_intro_a_04"
			},
			sound_events_duration = {
				6.4231247901917,
				8.8848123550415,
				4.188437461853,
				5.7159581184387
			}
		},
		nik_wizard_tower_jungle_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nik_wizard_tower_jungle_two_01",
				"nik_wizard_tower_jungle_two_02",
				"nik_wizard_tower_jungle_two_03",
				"nik_wizard_tower_jungle_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_jungle_two_01",
				"nik_wizard_tower_jungle_two_02",
				"nik_wizard_tower_jungle_two_03",
				"nik_wizard_tower_jungle_two_04"
			},
			sound_events_duration = {
				5.6224584579468,
				4.2078747749329,
				5.3464789390564,
				5.0056457519531
			}
		},
		nik_wizard_tower_keep_climbing = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nik_wizard_tower_keep_climbing_01",
				"nik_wizard_tower_keep_climbing_02",
				"nik_wizard_tower_keep_climbing_03",
				"nik_wizard_tower_keep_climbing_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_keep_climbing_01",
				"nik_wizard_tower_keep_climbing_02",
				"nik_wizard_tower_keep_climbing_03",
				"nik_wizard_tower_keep_climbing_04"
			},
			sound_events_duration = {
				5.1021666526794,
				4.4970002174377,
				5.4158539772034,
				6.156270980835
			}
		},
		nik_wizard_tower_test_subjects = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nik_wizard_tower_test_subjects_01",
				"nik_wizard_tower_test_subjects_02",
				"nik_wizard_tower_test_subjects_03",
				"nik_wizard_tower_test_subjects_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_test_subjects_01",
				"nik_wizard_tower_test_subjects_02",
				"nik_wizard_tower_test_subjects_03",
				"nik_wizard_tower_test_subjects_04"
			},
			sound_events_duration = {
				4.0103335380554,
				3.0244166851044,
				8.2531661987305,
				4.7221460342407
			}
		},
		nik_wizard_tower_wards_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nik_wizard_tower_wards_done_01",
				"nik_wizard_tower_wards_done_02",
				"nik_wizard_tower_wards_done_03",
				"nik_wizard_tower_wards_done_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nik_wizard_tower_wards_done_01",
				"nik_wizard_tower_wards_done_02",
				"nik_wizard_tower_wards_done_03",
				"nik_wizard_tower_wards_done_04"
			},
			sound_events_duration = {
				4.4229998588562,
				6.835916519165,
				4.2574167251587,
				7.1154375076294
			}
		},
		nsf_wizard_tower_block_well = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 2,
			category = "boss_talk",
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
				[1.0] = "nsf_wizard_tower_spellcasting_01",
				[2.0] = "nsf_wizard_tower_spellcasting_05"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "nsf_wizard_tower_spellcasting_01",
				[2.0] = "nsf_wizard_tower_spellcasting_05"
			},
			sound_events_duration = {
				[1.0] = 2.5184373855591,
				[2.0] = 2.3635833263397
			}
		},
		nsf_wizard_tower_challenge_reply = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nsf_wizard_tower_challenge_reply_01",
				"nsf_wizard_tower_challenge_reply_02",
				"nsf_wizard_tower_challenge_reply_03",
				"nsf_wizard_tower_challenge_reply_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_challenge_reply_01",
				"nsf_wizard_tower_challenge_reply_02",
				"nsf_wizard_tower_challenge_reply_03",
				"nsf_wizard_tower_challenge_reply_04"
			},
			sound_events_duration = {
				2.7986249923706,
				3.0078959465027,
				2.6972291469574,
				3.7576041221619
			}
		},
		nsf_wizard_tower_defeat = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nsf_wizard_tower_defeat_01",
				"nsf_wizard_tower_defeat_02",
				"nsf_wizard_tower_defeat_03",
				"nsf_wizard_tower_defeat_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_defeat_01",
				"nsf_wizard_tower_defeat_02",
				"nsf_wizard_tower_defeat_03",
				"nsf_wizard_tower_defeat_04"
			},
			sound_events_duration = {
				4.9519166946411,
				5.0635209083557,
				6.7493958473206,
				6.8145208358765
			}
		},
		nsf_wizard_tower_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nsf_wizard_tower_door_01",
				"nsf_wizard_tower_door_02",
				"nsf_wizard_tower_door_03",
				"nsf_wizard_tower_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_door_01",
				"nsf_wizard_tower_door_02",
				"nsf_wizard_tower_door_03",
				"nsf_wizard_tower_door_04"
			},
			sound_events_duration = {
				4.7703542709351,
				3.6823542118073,
				4.4632081985474,
				4.5833539962769
			}
		},
		nsf_wizard_tower_enchantment = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nsf_wizard_tower_enchantment_01",
				"nsf_wizard_tower_enchantment_02",
				"nsf_wizard_tower_enchantment_03",
				"nsf_wizard_tower_enchantment_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_enchantment_01",
				"nsf_wizard_tower_enchantment_02",
				"nsf_wizard_tower_enchantment_03",
				"nsf_wizard_tower_enchantment_04"
			},
			sound_events_duration = {
				5.3852081298828,
				6.4763541221619,
				7.1623539924622,
				6.9373540878296
			}
		},
		nsf_wizard_tower_keep_climbing = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 4,
			category = "npc_talk",
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
				"nsf_wizard_tower_keep_climbing_01",
				"nsf_wizard_tower_keep_climbing_02",
				"nsf_wizard_tower_keep_climbing_03",
				"nsf_wizard_tower_keep_climbing_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_keep_climbing_01",
				"nsf_wizard_tower_keep_climbing_02",
				"nsf_wizard_tower_keep_climbing_03",
				"nsf_wizard_tower_keep_climbing_04"
			},
			sound_events_duration = {
				10.165353775024,
				4.3583540916443,
				5.87735414505,
				6.9543542861939
			}
		},
		nsf_wizard_tower_library_two_a = {
			override_awareness = "nsf_wizard_tower_library_two_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nsf_wizard_tower_library_two_a_01",
				"nsf_wizard_tower_library_two_a_02",
				"nsf_wizard_tower_library_two_a_03",
				"nsf_wizard_tower_library_two_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_library_two_a_01",
				"nsf_wizard_tower_library_two_a_02",
				"nsf_wizard_tower_library_two_a_03",
				"nsf_wizard_tower_library_two_a_04"
			},
			sound_events_duration = {
				4.0953540802002,
				4.8523540496826,
				4.6383543014526,
				5.4103541374206
			}
		},
		nsf_wizard_tower_library_two_long_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "npc_dlc_wizards_tower",
			category = "cut_scene_interrupt_three",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "nsf_wizard_tower_library_two_long_a_01"
			},
			sound_events = {
				[1.0] = "nsf_wizard_tower_library_two_long_a_01"
			},
			sound_events_duration = {
				[1.0] = 12.549660682678
			}
		},
		nsf_wizard_tower_library_two_long_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "npc_dlc_wizards_tower",
			category = "cut_scene_interrupt_three",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "nsf_wizard_tower_library_two_long_a_02"
			},
			sound_events = {
				[1.0] = "nsf_wizard_tower_library_two_long_a_02"
			},
			sound_events_duration = {
				[1.0] = 8.170539855957
			}
		},
		nsf_wizard_tower_library_two_long_c = {
			override_awareness = "nsf_wizard_tower_library_two_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "npc_dlc_wizards_tower",
			category = "cut_scene_interrupt_three",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "nsf_wizard_tower_library_two_long_a_03"
			},
			sound_events = {
				[1.0] = "nsf_wizard_tower_library_two_long_a_03"
			},
			sound_events_duration = {
				[1.0] = 11.770421028137
			}
		},
		nsf_wizard_tower_spellcasting = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "npc_dlc_wizards_tower",
			sound_events_n = 6,
			category = "npc_talk",
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
				"nsf_wizard_tower_spellcasting_02",
				"nsf_wizard_tower_spellcasting_03",
				"nsf_wizard_tower_spellcasting_04",
				"nsf_wizard_tower_spellcasting_06",
				"nsf_wizard_tower_spellcasting_07",
				"nsf_wizard_tower_spellcasting_08"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_spellcasting_02",
				"nsf_wizard_tower_spellcasting_03",
				"nsf_wizard_tower_spellcasting_04",
				"nsf_wizard_tower_spellcasting_06",
				"nsf_wizard_tower_spellcasting_07",
				"nsf_wizard_tower_spellcasting_08"
			},
			sound_events_duration = {
				1.4595625400543,
				2.5994582176209,
				2.4955415725708,
				1.8310416936874,
				3.2195208072662,
				2.6737084388733
			}
		},
		nsf_wizard_tower_test_subjects = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nsf_wizard_tower_test_subjects_01",
				"nsf_wizard_tower_test_subjects_02",
				"nsf_wizard_tower_test_subjects_03",
				"nsf_wizard_tower_test_subjects_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_test_subjects_01",
				"nsf_wizard_tower_test_subjects_02",
				"nsf_wizard_tower_test_subjects_03",
				"nsf_wizard_tower_test_subjects_04"
			},
			sound_events_duration = {
				3.4643542766571,
				5.6923542022705,
				7.0213541984558,
				5.7053542137146
			}
		},
		nsf_wizard_tower_waste_disposal_a = {
			override_awareness = "wizard_tower_waste_disposal_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nsf_wizard_tower_waste_disposal_a_01",
				"nsf_wizard_tower_waste_disposal_a_02",
				"nsf_wizard_tower_waste_disposal_a_03",
				"nsf_wizard_tower_waste_disposal_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_waste_disposal_a_01",
				"nsf_wizard_tower_waste_disposal_a_02",
				"nsf_wizard_tower_waste_disposal_a_03",
				"nsf_wizard_tower_waste_disposal_a_04"
			},
			sound_events_duration = {
				6.1283540725708,
				4.9253540039063,
				6.5963335037231,
				8.8693542480469
			}
		},
		nsf_wizard_tower_welcome_a = {
			override_awareness = "wizard_tower_welcome_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_wizards_tower",
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
				"nsf_wizard_tower_welcome_a_01",
				"nsf_wizard_tower_welcome_a_02",
				"nsf_wizard_tower_welcome_a_03",
				"nsf_wizard_tower_welcome_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nsf_wizard_tower_welcome_a_01",
				"nsf_wizard_tower_welcome_a_02",
				"nsf_wizard_tower_welcome_a_03",
				"nsf_wizard_tower_welcome_a_04"
			},
			sound_events_duration = {
				7.2537083625794,
				7.3098750114441,
				6.5093541145325,
				5.9280414581299
			}
		}
	})
end
