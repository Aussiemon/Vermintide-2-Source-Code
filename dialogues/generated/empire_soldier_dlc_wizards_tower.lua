-- chunkname: @dialogues/generated/empire_soldier_dlc_wizards_tower.lua

return function ()
	define_rule({
		name = "pes_enchantment_dummy_trigger",
		probability = 1,
		response = "pes_enchantment_dummy_trigger",
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
				"empire_soldier",
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
		name = "pes_keep_climbing_dummy_trigger",
		probability = 1,
		response = "pes_keep_climbing_dummy_trigger",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_test_subjects_dummy_trigger",
		probability = 1,
		response = "pes_test_subjects_dummy_trigger",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_bones",
		probability = 1,
		response = "pes_wizard_tower_bones",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_brew",
		probability = 1,
		response = "pes_wizard_tower_brew",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_destroy_wards_b",
		probability = 1,
		response = "pes_wizard_tower_destroy_wards_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_familiar",
		probability = 1,
		response = "pes_wizard_tower_familiar",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_gravity_a",
		probability = 1,
		response = "pes_wizard_tower_gravity_a",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_illusion_room",
		probability = 1,
		response = "pes_wizard_tower_illusion_room",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_intro_a",
		probability = 1,
		response = "pes_wizard_tower_intro_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_intro_b",
		probability = 1,
		response = "pes_wizard_tower_intro_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_intro_c",
		probability = 1,
		response = "pes_wizard_tower_intro_c",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_jungle",
		probability = 1,
		response = "pes_wizard_tower_jungle",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_leap_of_faith",
		probability = 1,
		response = "pes_wizard_tower_leap_of_faith",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_library",
		probability = 1,
		response = "pes_wizard_tower_library",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_observatory",
		probability = 1,
		response = "pes_wizard_tower_observatory",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_pig",
		probability = 1,
		response = "pes_wizard_tower_pig",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_portal",
		probability = 1,
		response = "pes_wizard_tower_portal",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_potion_maker",
		probability = 1,
		response = "pes_wizard_tower_potion_maker",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_ropes",
		probability = 1,
		response = "pes_wizard_tower_ropes",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_skull_found_subsequent",
		probability = 1,
		response = "pes_wizard_tower_skull_found_subsequent",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_where_is_she_a",
		probability = 1,
		response = "pes_wizard_tower_where_is_she_a",
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
				"empire_soldier",
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
		name = "pes_wizard_tower_where_is_she_b",
		probability = 1,
		response = "pes_wizard_tower_where_is_she_b",
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
				"empire_soldier",
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
		pes_enchantment_dummy_trigger = {
			category = "enemy_alerts_high",
			database = "empire_soldier_dlc_wizards_tower",
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
		pes_keep_climbing_dummy_trigger = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
		pes_test_subjects_dummy_trigger = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
		pes_wizard_tower_bones = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_bones_01",
				"pes_wizard_tower_bones_02",
				"pes_wizard_tower_bones_03",
				"pes_wizard_tower_bones_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_bones_01",
				"pes_wizard_tower_bones_02",
				"pes_wizard_tower_bones_03",
				"pes_wizard_tower_bones_04",
			},
			sound_events_duration = {
				3.2920000553131,
				2.5199999809265,
				3.5260000228882,
				4.5980000495911,
			},
		},
		pes_wizard_tower_brew = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_brew_01",
				"pes_wizard_tower_brew_02",
				"pes_wizard_tower_brew_03",
				"pes_wizard_tower_brew_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_brew_01",
				"pes_wizard_tower_brew_02",
				"pes_wizard_tower_brew_03",
				"pes_wizard_tower_brew_04",
			},
			sound_events_duration = {
				4.1490001678467,
				3.9400000572205,
				3.2769999504089,
				3.2219998836517,
			},
		},
		pes_wizard_tower_destroy_wards_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_destroy_wards_b_01",
				"pes_wizard_tower_destroy_wards_b_02",
				"pes_wizard_tower_destroy_wards_b_03",
				"pes_wizard_tower_destroy_wards_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_destroy_wards_b_01",
				"pes_wizard_tower_destroy_wards_b_02",
				"pes_wizard_tower_destroy_wards_b_03",
				"pes_wizard_tower_destroy_wards_b_04",
			},
			sound_events_duration = {
				1.9249792098999,
				0.73900002241135,
				2.7850000858307,
				2.9660000801086,
			},
		},
		pes_wizard_tower_familiar = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_familiar_01",
				"pes_wizard_tower_familiar_02",
				"pes_wizard_tower_familiar_03",
				"pes_wizard_tower_familiar_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_familiar_01",
				"pes_wizard_tower_familiar_02",
				"pes_wizard_tower_familiar_03",
				"pes_wizard_tower_familiar_04",
			},
			sound_events_duration = {
				1.630979180336,
				4.5269999504089,
				9.0159788131714,
				3.6970000267029,
			},
		},
		pes_wizard_tower_gravity_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_gravity_a_01",
				"pes_wizard_tower_gravity_a_02",
				"pes_wizard_tower_gravity_a_03",
				"pes_wizard_tower_gravity_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_gravity_a_01",
				"pes_wizard_tower_gravity_a_02",
				"pes_wizard_tower_gravity_a_03",
				"pes_wizard_tower_gravity_a_04",
			},
			sound_events_duration = {
				3.904000043869,
				3.0610001087189,
				1.6210000514984,
				3.6319999694824,
			},
		},
		pes_wizard_tower_illusion_room = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_illusion_room_01",
				"pes_wizard_tower_illusion_room_02",
				"pes_wizard_tower_illusion_room_03",
				"pes_wizard_tower_illusion_room_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_illusion_room_01",
				"pes_wizard_tower_illusion_room_02",
				"pes_wizard_tower_illusion_room_03",
				"pes_wizard_tower_illusion_room_04",
			},
			sound_events_duration = {
				3.1349999904633,
				3.3440001010895,
				3.3339791297913,
				3.3869791030884,
			},
		},
		pes_wizard_tower_intro_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_intro_a_01",
				[2] = "pes_wizard_tower_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wizard_tower_intro_a_01",
				[2] = "pes_wizard_tower_intro_a_02",
			},
			sound_events_duration = {
				[1] = 3.0050001144409,
				[2] = 3.0139791965485,
			},
		},
		pes_wizard_tower_intro_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_intro_b_01",
				[2] = "pes_wizard_tower_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wizard_tower_intro_b_01",
				[2] = "pes_wizard_tower_intro_b_02",
			},
			sound_events_duration = {
				[1] = 3.8789999485016,
				[2] = 3.1519999504089,
			},
		},
		pes_wizard_tower_intro_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_intro_c_01",
				[2] = "pes_wizard_tower_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wizard_tower_intro_c_01",
				[2] = "pes_wizard_tower_intro_c_02",
			},
			sound_events_duration = {
				[1] = 4.1159791946411,
				[2] = 3.739000082016,
			},
		},
		pes_wizard_tower_jungle = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_jungle_01",
				"pes_wizard_tower_jungle_02",
				"pes_wizard_tower_jungle_03",
				"pes_wizard_tower_jungle_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_jungle_01",
				"pes_wizard_tower_jungle_02",
				"pes_wizard_tower_jungle_03",
				"pes_wizard_tower_jungle_04",
			},
			sound_events_duration = {
				3.3239998817444,
				8.794979095459,
				3.5709791183472,
				3.7679791450501,
			},
		},
		pes_wizard_tower_leap_of_faith = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_leap_of_faith_01",
				"pes_wizard_tower_leap_of_faith_02",
				"pes_wizard_tower_leap_of_faith_03",
				"pes_wizard_tower_leap_of_faith_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_leap_of_faith_01",
				"pes_wizard_tower_leap_of_faith_02",
				"pes_wizard_tower_leap_of_faith_03",
				"pes_wizard_tower_leap_of_faith_04",
			},
			sound_events_duration = {
				2.6949999332428,
				2.0659999847412,
				1.9110000133514,
				1.8730000257492,
			},
		},
		pes_wizard_tower_library = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_library_01",
				"pes_wizard_tower_library_02",
				"pes_wizard_tower_library_03",
				"pes_wizard_tower_library_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_library_01",
				"pes_wizard_tower_library_02",
				"pes_wizard_tower_library_03",
				"pes_wizard_tower_library_04",
			},
			sound_events_duration = {
				2.6410000324249,
				3.3619999885559,
				3.591979265213,
				4.6149997711182,
			},
		},
		pes_wizard_tower_observatory = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_observatory_01",
				"pes_wizard_tower_observatory_02",
				"pes_wizard_tower_observatory_03",
				"pes_wizard_tower_observatory_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_observatory_01",
				"pes_wizard_tower_observatory_02",
				"pes_wizard_tower_observatory_03",
				"pes_wizard_tower_observatory_04",
			},
			sound_events_duration = {
				4.401978969574,
				4.2340002059936,
				2.1440000534058,
				5.8759789466858,
			},
		},
		pes_wizard_tower_pig = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_pig_01",
				"pes_wizard_tower_pig_02",
				"pes_wizard_tower_pig_03",
				"pes_wizard_tower_pig_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_pig_01",
				"pes_wizard_tower_pig_02",
				"pes_wizard_tower_pig_03",
				"pes_wizard_tower_pig_04",
			},
			sound_events_duration = {
				2.1180000305176,
				1.3980000019074,
				1.5700000524521,
				3.4439792633057,
			},
		},
		pes_wizard_tower_portal = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_portal_01",
				"pes_wizard_tower_portal_02",
				"pes_wizard_tower_portal_03",
				"pes_wizard_tower_portal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_portal_01",
				"pes_wizard_tower_portal_02",
				"pes_wizard_tower_portal_03",
				"pes_wizard_tower_portal_04",
			},
			sound_events_duration = {
				2.2669999599457,
				4.5039792060852,
				3.0480000972748,
				2.4179999828339,
			},
		},
		pes_wizard_tower_potion_maker = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_potion_maker_01",
				"pes_wizard_tower_potion_maker_02",
				"pes_wizard_tower_potion_maker_03",
				"pes_wizard_tower_potion_maker_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_potion_maker_01",
				"pes_wizard_tower_potion_maker_02",
				"pes_wizard_tower_potion_maker_03",
				"pes_wizard_tower_potion_maker_04",
			},
			sound_events_duration = {
				2.6429998874664,
				2.6040000915527,
				3.9860000610352,
				3.4670000076294,
			},
		},
		pes_wizard_tower_ropes = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_ropes_01",
				"pes_wizard_tower_ropes_02",
				"pes_wizard_tower_ropes_03",
				"pes_wizard_tower_ropes_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_ropes_01",
				"pes_wizard_tower_ropes_02",
				"pes_wizard_tower_ropes_03",
				"pes_wizard_tower_ropes_04",
			},
			sound_events_duration = {
				2.6399791240692,
				1.9170000553131,
				1.4880000352859,
				3.8550000190735,
			},
		},
		pes_wizard_tower_skull_found_subsequent = {
			category = "seen_items",
			database = "empire_soldier_dlc_wizards_tower",
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
				"pes_wizard_tower_skull_found_subsequent_01",
				"pes_wizard_tower_skull_found_subsequent_02",
				"pes_wizard_tower_skull_found_subsequent_03",
				"pes_wizard_tower_skull_found_subsequent_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wizard_tower_skull_found_subsequent_01",
				"pes_wizard_tower_skull_found_subsequent_02",
				"pes_wizard_tower_skull_found_subsequent_03",
				"pes_wizard_tower_skull_found_subsequent_04",
			},
			sound_events_duration = {
				2.0419790744781,
				1.0900000333786,
				0.61199998855591,
				1.1100000143051,
			},
		},
		pes_wizard_tower_where_is_she_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_where_is_she_a_01",
				[2] = "pes_wizard_tower_where_is_she_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wizard_tower_where_is_she_a_01",
				[2] = "pes_wizard_tower_where_is_she_a_02",
			},
			sound_events_duration = {
				[1] = 3.9299790859222,
				[2] = 4.8619999885559,
			},
		},
		pes_wizard_tower_where_is_she_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_where_is_she_b_01",
				[2] = "pes_wizard_tower_where_is_she_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wizard_tower_where_is_she_b_01",
				[2] = "pes_wizard_tower_where_is_she_b_02",
			},
			sound_events_duration = {
				[1] = 3.6109790802002,
				[2] = 2.4730000495911,
			},
		},
	})
end
