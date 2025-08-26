-- chunkname: @dialogues/generated/wood_elf_dlc_wizards_tower.lua

return function ()
	define_rule({
		name = "pwe_enchantment_dummy_trigger",
		probability = 1,
		response = "pwe_enchantment_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"wizard_tower_enchantment_horde",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_enchantment_horde",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_keep_climbing_dummy_trigger",
		probability = 1,
		response = "pwe_keep_climbing_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_keep_climbing_dummy",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_test_subjects_dummy_trigger",
		probability = 1,
		response = "pwe_test_subjects_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_test_subjects_dummy",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_tower_npc_intro_dummy_trigger",
		probability = 1,
		response = "pwe_tower_npc_intro_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_intro_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_bones",
		probability = 1,
		response = "pwe_wizard_tower_bones",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_bones",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_bones",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_bones",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_brew",
		probability = 1,
		response = "pwe_wizard_tower_brew",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_brew",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_destroy_wards_b",
		probability = 1,
		response = "pwe_wizard_tower_destroy_wards_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_destroy_wards_a_done",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_familiar",
		probability = 1,
		response = "pwe_wizard_tower_familiar",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_familiar",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"wizard_tower_familiar",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_familiar",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_gravity_a",
		probability = 1,
		response = "pwe_wizard_tower_gravity_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_gravity_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"wizard_tower_gravity_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_gravity_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_illusion_room",
		probability = 1,
		response = "pwe_wizard_tower_illusion_room",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_illusion_room",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_illusion_room",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_illusion_room",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_intro_a",
		probability = 1,
		response = "pwe_wizard_tower_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_intro_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_intro_b",
		probability = 1,
		response = "pwe_wizard_tower_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"wizard_tower_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_intro_c",
		probability = 1,
		response = "pwe_wizard_tower_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"wizard_tower_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_jungle",
		probability = 1,
		response = "pwe_wizard_tower_jungle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_jungle",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_leap_of_faith",
		probability = 1,
		response = "pwe_wizard_tower_leap_of_faith",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_leap_of_faith",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_library",
		probability = 1,
		response = "pwe_wizard_tower_library",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_library",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_observatory",
		probability = 1,
		response = "pwe_wizard_tower_observatory",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_observatory",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_pig",
		probability = 1,
		response = "pwe_wizard_tower_pig",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_pig",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_pig",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_pig",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_portal",
		probability = 1,
		response = "pwe_wizard_tower_portal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_portal",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_portal",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_portal",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_potion_maker",
		probability = 1,
		response = "pwe_wizard_tower_potion_maker",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_potion_maker",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"wizard_tower_potion_maker",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_potion_maker",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_ropes",
		probability = 1,
		response = "pwe_wizard_tower_ropes",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizard_tower_ropes",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_ropes",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_ropes",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_skull_found_subsequent",
		probability = 1,
		response = "pwe_wizard_tower_skull_found_subsequent",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wizards_tower_skull",
			},
			{
				"query_context",
				"distance",
				OP.LT,
				12,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"wizard_tower_skull_found_subsequent",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"last_seen_tower_skull",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_tower_skull",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"wizard_tower_skull_found_subsequent",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_where_is_she_a",
		probability = 1,
		response = "pwe_wizard_tower_where_is_she_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_where_is_she_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"wizard_tower_where_is_she_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_where_is_she_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_where_is_she_b",
		probability = 1,
		response = "pwe_wizard_tower_where_is_she_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"wizard_tower_where_is_she_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"wizard_tower_where_is_she_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_where_is_she_b",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pwe_enchantment_dummy_trigger = {
			category = "enemy_alerts_high",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "wizard_tower_enchantment",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pwe_keep_climbing_dummy_trigger = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "wizard_tower_keep_climbing",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pwe_test_subjects_dummy_trigger = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "wizard_tower_test_subjects",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pwe_tower_npc_intro_dummy_trigger = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "wizard_tower_intro_a_dummy_trigger",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pwe_wizard_tower_bones = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_bones_01",
				"pwe_wizard_tower_bones_02",
				"pwe_wizard_tower_bones_03",
				"pwe_wizard_tower_bones_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_bones_01",
				"pwe_wizard_tower_bones_02",
				"pwe_wizard_tower_bones_03",
				"pwe_wizard_tower_bones_04",
			},
			sound_events_duration = {
				3.2449791431427,
				3.4399790763855,
				2.0989792346954,
				4.5149793624878,
			},
		},
		pwe_wizard_tower_brew = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_brew_01",
				"pwe_wizard_tower_brew_02",
				"pwe_wizard_tower_brew_03",
				"pwe_wizard_tower_brew_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_brew_01",
				"pwe_wizard_tower_brew_02",
				"pwe_wizard_tower_brew_03",
				"pwe_wizard_tower_brew_04",
			},
			sound_events_duration = {
				3.0009791851044,
				2.3710000514984,
				3.1440000534058,
				2.2149999141693,
			},
		},
		pwe_wizard_tower_destroy_wards_b = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_destroy_wards_b_01",
				"pwe_wizard_tower_destroy_wards_b_02",
				"pwe_wizard_tower_destroy_wards_b_03",
				"pwe_wizard_tower_destroy_wards_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_destroy_wards_b_01",
				"pwe_wizard_tower_destroy_wards_b_02",
				"pwe_wizard_tower_destroy_wards_b_03",
				"pwe_wizard_tower_destroy_wards_b_04",
			},
			sound_events_duration = {
				1.4379999637604,
				2.8800001144409,
				4.4829998016357,
				1.8109999895096,
			},
		},
		pwe_wizard_tower_familiar = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_familiar_01",
				"pwe_wizard_tower_familiar_02",
				"pwe_wizard_tower_familiar_03",
				"pwe_wizard_tower_familiar_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_familiar_01",
				"pwe_wizard_tower_familiar_02",
				"pwe_wizard_tower_familiar_03",
				"pwe_wizard_tower_familiar_04",
			},
			sound_events_duration = {
				1.6089792251587,
				3.4789791107178,
				3.1779792308807,
				4.0100002288818,
			},
		},
		pwe_wizard_tower_gravity_a = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_gravity_a_01",
				"pwe_wizard_tower_gravity_a_02",
				"pwe_wizard_tower_gravity_a_03",
				"pwe_wizard_tower_gravity_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_gravity_a_01",
				"pwe_wizard_tower_gravity_a_02",
				"pwe_wizard_tower_gravity_a_03",
				"pwe_wizard_tower_gravity_a_04",
			},
			sound_events_duration = {
				2.9909791946411,
				1.9879791736603,
				2.6849999427795,
				2.2809791564941,
			},
		},
		pwe_wizard_tower_illusion_room = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_illusion_room_01",
				"pwe_wizard_tower_illusion_room_02",
				"pwe_wizard_tower_illusion_room_03",
				"pwe_wizard_tower_illusion_room_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_illusion_room_01",
				"pwe_wizard_tower_illusion_room_02",
				"pwe_wizard_tower_illusion_room_03",
				"pwe_wizard_tower_illusion_room_04",
			},
			sound_events_duration = {
				1.7249791622162,
				2.2529792785645,
				3.295000076294,
				2.4039790630341,
			},
		},
		pwe_wizard_tower_intro_a = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wizard_tower_intro_a_01",
				[2] = "pwe_wizard_tower_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wizard_tower_intro_a_01",
				[2] = "pwe_wizard_tower_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.540979385376,
				[2] = 3.0169792175293,
			},
		},
		pwe_wizard_tower_intro_b = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wizard_tower_intro_b_01",
				[2] = "pwe_wizard_tower_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wizard_tower_intro_b_01",
				[2] = "pwe_wizard_tower_intro_b_02",
			},
			sound_events_duration = {
				[1] = 1.6990000009537,
				[2] = 2.4760000705719,
			},
		},
		pwe_wizard_tower_intro_c = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wizard_tower_intro_c_01",
				[2] = "pwe_wizard_tower_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wizard_tower_intro_c_01",
				[2] = "pwe_wizard_tower_intro_c_02",
			},
			sound_events_duration = {
				[1] = 3.510999917984,
				[2] = 4.1479997634888,
			},
		},
		pwe_wizard_tower_jungle = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_jungle_01",
				"pwe_wizard_tower_jungle_02",
				"pwe_wizard_tower_jungle_03",
				"pwe_wizard_tower_jungle_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_jungle_01",
				"pwe_wizard_tower_jungle_02",
				"pwe_wizard_tower_jungle_03",
				"pwe_wizard_tower_jungle_04",
			},
			sound_events_duration = {
				2.4370000362396,
				6.2449793815613,
				2.1319999694824,
				2.7269792556763,
			},
		},
		pwe_wizard_tower_leap_of_faith = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_leap_of_faith_01",
				"pwe_wizard_tower_leap_of_faith_02",
				"pwe_wizard_tower_leap_of_faith_03",
				"pwe_wizard_tower_leap_of_faith_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_leap_of_faith_01",
				"pwe_wizard_tower_leap_of_faith_02",
				"pwe_wizard_tower_leap_of_faith_03",
				"pwe_wizard_tower_leap_of_faith_04",
			},
			sound_events_duration = {
				2.9570000171661,
				2.3710000514984,
				3.0060000419617,
				2.8829791545868,
			},
		},
		pwe_wizard_tower_library = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_library_01",
				"pwe_wizard_tower_library_02",
				"pwe_wizard_tower_library_03",
				"pwe_wizard_tower_library_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_library_01",
				"pwe_wizard_tower_library_02",
				"pwe_wizard_tower_library_03",
				"pwe_wizard_tower_library_04",
			},
			sound_events_duration = {
				2.6449792385101,
				3.2609791755676,
				3.2230000495911,
				2.8110001087189,
			},
		},
		pwe_wizard_tower_observatory = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_observatory_01",
				"pwe_wizard_tower_observatory_02",
				"pwe_wizard_tower_observatory_03",
				"pwe_wizard_tower_observatory_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_observatory_01",
				"pwe_wizard_tower_observatory_02",
				"pwe_wizard_tower_observatory_03",
				"pwe_wizard_tower_observatory_04",
			},
			sound_events_duration = {
				2.64097905159,
				4.64297914505,
				3.4719791412353,
				5.3509793281555,
			},
		},
		pwe_wizard_tower_pig = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_pig_01",
				"pwe_wizard_tower_pig_02",
				"pwe_wizard_tower_pig_03",
				"pwe_wizard_tower_pig_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_pig_01",
				"pwe_wizard_tower_pig_02",
				"pwe_wizard_tower_pig_03",
				"pwe_wizard_tower_pig_04",
			},
			sound_events_duration = {
				3.5810000896454,
				4.2950000762939,
				5.2849793434143,
				5.0759792327881,
			},
		},
		pwe_wizard_tower_portal = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_portal_01",
				"pwe_wizard_tower_portal_02",
				"pwe_wizard_tower_portal_03",
				"pwe_wizard_tower_portal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_portal_01",
				"pwe_wizard_tower_portal_02",
				"pwe_wizard_tower_portal_03",
				"pwe_wizard_tower_portal_04",
			},
			sound_events_duration = {
				2.9509792327881,
				3.4479792118073,
				2.864000082016,
				3.6129791736603,
			},
		},
		pwe_wizard_tower_potion_maker = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_potion_maker_01",
				"pwe_wizard_tower_potion_maker_02",
				"pwe_wizard_tower_potion_maker_03",
				"pwe_wizard_tower_potion_maker_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_potion_maker_01",
				"pwe_wizard_tower_potion_maker_02",
				"pwe_wizard_tower_potion_maker_03",
				"pwe_wizard_tower_potion_maker_04",
			},
			sound_events_duration = {
				2.5510001182556,
				2.9689791202545,
				3.0819792747498,
				3.9919791221619,
			},
		},
		pwe_wizard_tower_ropes = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_ropes_01",
				"pwe_wizard_tower_ropes_02",
				"pwe_wizard_tower_ropes_03",
				"pwe_wizard_tower_ropes_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_ropes_01",
				"pwe_wizard_tower_ropes_02",
				"pwe_wizard_tower_ropes_03",
				"pwe_wizard_tower_ropes_04",
			},
			sound_events_duration = {
				4.620979309082,
				2.2849791049957,
				2.0349791049957,
				1.0340000391007,
			},
		},
		pwe_wizard_tower_skull_found_subsequent = {
			category = "seen_items",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_wizard_tower_skull_found_subsequent_01",
				"pwe_wizard_tower_skull_found_subsequent_02",
				"pwe_wizard_tower_skull_found_subsequent_03",
				"pwe_wizard_tower_skull_found_subsequent_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_tower_skull_found_subsequent_01",
				"pwe_wizard_tower_skull_found_subsequent_02",
				"pwe_wizard_tower_skull_found_subsequent_03",
				"pwe_wizard_tower_skull_found_subsequent_04",
			},
			sound_events_duration = {
				1.6950000524521,
				2.4500000476837,
				1.5620000362396,
				2.522979259491,
			},
		},
		pwe_wizard_tower_where_is_she_a = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wizard_tower_where_is_she_a_01",
				[2] = "pwe_wizard_tower_where_is_she_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wizard_tower_where_is_she_a_01",
				[2] = "pwe_wizard_tower_where_is_she_a_02",
			},
			sound_events_duration = {
				[1] = 3.6199998855591,
				[2] = 4.4679999351502,
			},
		},
		pwe_wizard_tower_where_is_she_b = {
			category = "level_talk",
			database = "wood_elf_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wizard_tower_where_is_she_b_01",
				[2] = "pwe_wizard_tower_where_is_she_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wizard_tower_where_is_she_b_01",
				[2] = "pwe_wizard_tower_where_is_she_b_02",
			},
			sound_events_duration = {
				[1] = 5.8109793663025,
				[2] = 4.2699790000916,
			},
		},
	})
end
