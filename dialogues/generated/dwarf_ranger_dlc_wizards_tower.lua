-- chunkname: @dialogues/generated/dwarf_ranger_dlc_wizards_tower.lua

return function ()
	define_rule({
		name = "pdr_enchantment_dummy_trigger",
		probability = 1,
		response = "pdr_enchantment_dummy_trigger",
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
				"dwarf_ranger",
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
		name = "pdr_keep_climbing_dummy_trigger",
		probability = 1,
		response = "pdr_keep_climbing_dummy_trigger",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_test_subjects_dummy_trigger",
		probability = 1,
		response = "pdr_test_subjects_dummy_trigger",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_tower_npc_intro_dummy_trigger",
		probability = 1,
		response = "pdr_tower_npc_intro_dummy_trigger",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_wizard_tower_bones",
		probability = 1,
		response = "pdr_wizard_tower_bones",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_brew",
		probability = 1,
		response = "pdr_wizard_tower_brew",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_destroy_wards_b",
		probability = 1,
		response = "pdr_wizard_tower_destroy_wards_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_wizard_tower_familiar",
		probability = 1,
		response = "pdr_wizard_tower_familiar",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_gravity_a",
		probability = 1,
		response = "pdr_wizard_tower_gravity_a",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_illusion_room",
		probability = 1,
		response = "pdr_wizard_tower_illusion_room",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_intro_a",
		probability = 1,
		response = "pdr_wizard_tower_intro_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_wizard_tower_intro_b",
		probability = 1,
		response = "pdr_wizard_tower_intro_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_wizard_tower_intro_c",
		probability = 1,
		response = "pdr_wizard_tower_intro_c",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_jungle",
		probability = 1,
		response = "pdr_wizard_tower_jungle",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_wizard_tower_leap_of_faith",
		probability = 1,
		response = "pdr_wizard_tower_leap_of_faith",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_library",
		probability = 1,
		response = "pdr_wizard_tower_library",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_observatory",
		probability = 1,
		response = "pdr_wizard_tower_observatory",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_pig",
		probability = 1,
		response = "pdr_wizard_tower_pig",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_portal",
		probability = 1,
		response = "pdr_wizard_tower_portal",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_potion_maker",
		probability = 1,
		response = "pdr_wizard_tower_potion_maker",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_ropes",
		probability = 1,
		response = "pdr_wizard_tower_ropes",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_skull_found_subsequent",
		probability = 1,
		response = "pdr_wizard_tower_skull_found_subsequent",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_where_is_she_a",
		probability = 1,
		response = "pdr_wizard_tower_where_is_she_a",
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
				"dwarf_ranger",
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
		name = "pdr_wizard_tower_where_is_she_b",
		probability = 1,
		response = "pdr_wizard_tower_where_is_she_b",
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
				"dwarf_ranger",
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
		pdr_enchantment_dummy_trigger = {
			category = "enemy_alerts_high",
			database = "dwarf_ranger_dlc_wizards_tower",
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
		pdr_keep_climbing_dummy_trigger = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
		pdr_test_subjects_dummy_trigger = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
		pdr_tower_npc_intro_dummy_trigger = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
		pdr_wizard_tower_bones = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_bones_01",
				"pdr_wizard_tower_bones_02",
				"pdr_wizard_tower_bones_03",
				"pdr_wizard_tower_bones_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_bones_01",
				"pdr_wizard_tower_bones_02",
				"pdr_wizard_tower_bones_03",
				"pdr_wizard_tower_bones_04",
			},
			sound_events_duration = {
				2.7300000190735,
				3.2509791851044,
				2.562979221344,
				4.231999874115,
			},
		},
		pdr_wizard_tower_brew = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_brew_01",
				"pdr_wizard_tower_brew_02",
				"pdr_wizard_tower_brew_03",
				"pdr_wizard_tower_brew_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_brew_01",
				"pdr_wizard_tower_brew_02",
				"pdr_wizard_tower_brew_03",
				"pdr_wizard_tower_brew_04",
			},
			sound_events_duration = {
				4.9939789772034,
				3.4079792499542,
				3.5679790973663,
				5.6539793014526,
			},
		},
		pdr_wizard_tower_destroy_wards_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_destroy_wards_b_01",
				"pdr_wizard_tower_destroy_wards_b_02",
				"pdr_wizard_tower_destroy_wards_b_03",
				"pdr_wizard_tower_destroy_wards_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_destroy_wards_b_01",
				"pdr_wizard_tower_destroy_wards_b_02",
				"pdr_wizard_tower_destroy_wards_b_03",
				"pdr_wizard_tower_destroy_wards_b_04",
			},
			sound_events_duration = {
				3.4459791183472,
				4.3819789886475,
				3.4559791088104,
				3.727979183197,
			},
		},
		pdr_wizard_tower_familiar = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_familiar_01",
				"pdr_wizard_tower_familiar_02",
				"pdr_wizard_tower_familiar_03",
				"pdr_wizard_tower_familiar_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_familiar_01",
				"pdr_wizard_tower_familiar_02",
				"pdr_wizard_tower_familiar_03",
				"pdr_wizard_tower_familiar_04",
			},
			sound_events_duration = {
				2.2369792461395,
				3.3749792575836,
				4.2839789390564,
				3.102979183197,
			},
		},
		pdr_wizard_tower_gravity_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_gravity_a_01",
				"pdr_wizard_tower_gravity_a_02",
				"pdr_wizard_tower_gravity_a_03",
				"pdr_wizard_tower_gravity_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_gravity_a_01",
				"pdr_wizard_tower_gravity_a_02",
				"pdr_wizard_tower_gravity_a_03",
				"pdr_wizard_tower_gravity_a_04",
			},
			sound_events_duration = {
				3.4129791259766,
				1.9969791173935,
				2.8469791412353,
				4.709979057312,
			},
		},
		pdr_wizard_tower_illusion_room = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_illusion_room_01",
				"pdr_wizard_tower_illusion_room_02",
				"pdr_wizard_tower_illusion_room_03",
				"pdr_wizard_tower_illusion_room_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_illusion_room_01",
				"pdr_wizard_tower_illusion_room_02",
				"pdr_wizard_tower_illusion_room_03",
				"pdr_wizard_tower_illusion_room_04",
			},
			sound_events_duration = {
				1.9929791688919,
				1.8269791603088,
				3.6469790935516,
				2.3479790687561,
			},
		},
		pdr_wizard_tower_intro_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				[1] = "pdr_wizard_tower_intro_a_01",
				[2] = "pdr_wizard_tower_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_tower_intro_a_01",
				[2] = "pdr_wizard_tower_intro_a_02",
			},
			sound_events_duration = {
				[1] = 3.5489792823791,
				[2] = 3.9639792442322,
			},
		},
		pdr_wizard_tower_intro_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				[1] = "pdr_wizard_tower_intro_b_01",
				[2] = "pdr_wizard_tower_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_tower_intro_b_01",
				[2] = "pdr_wizard_tower_intro_b_02",
			},
			sound_events_duration = {
				[1] = 2.8849792480469,
				[2] = 2.9969792366028,
			},
		},
		pdr_wizard_tower_intro_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				[1] = "pdr_wizard_tower_intro_c_01",
				[2] = "pdr_wizard_tower_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_tower_intro_c_01",
				[2] = "pdr_wizard_tower_intro_c_02",
			},
			sound_events_duration = {
				[1] = 3.6839792728424,
				[2] = 5.9979791641235,
			},
		},
		pdr_wizard_tower_jungle = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_jungle_01",
				"pdr_wizard_tower_jungle_02",
				"pdr_wizard_tower_jungle_03",
				"pdr_wizard_tower_jungle_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_jungle_01",
				"pdr_wizard_tower_jungle_02",
				"pdr_wizard_tower_jungle_03",
				"pdr_wizard_tower_jungle_04",
			},
			sound_events_duration = {
				2.4609999656677,
				2.4989790916443,
				1.408979177475,
				3.8229792118073,
			},
		},
		pdr_wizard_tower_leap_of_faith = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_leap_of_faith_01",
				"pdr_wizard_tower_leap_of_faith_02",
				"pdr_wizard_tower_leap_of_faith_03",
				"pdr_wizard_tower_leap_of_faith_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_leap_of_faith_01",
				"pdr_wizard_tower_leap_of_faith_02",
				"pdr_wizard_tower_leap_of_faith_03",
				"pdr_wizard_tower_leap_of_faith_04",
			},
			sound_events_duration = {
				3.4259791374206,
				3.2609791755676,
				4.6619791984558,
				2.6739792823791,
			},
		},
		pdr_wizard_tower_library = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_library_01",
				"pdr_wizard_tower_library_02",
				"pdr_wizard_tower_library_03",
				"pdr_wizard_tower_library_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_library_01",
				"pdr_wizard_tower_library_02",
				"pdr_wizard_tower_library_03",
				"pdr_wizard_tower_library_04",
			},
			sound_events_duration = {
				2.0489792823791,
				4.227979183197,
				3.5389790534973,
				3.2589790821075,
			},
		},
		pdr_wizard_tower_observatory = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_observatory_01",
				"pdr_wizard_tower_observatory_02",
				"pdr_wizard_tower_observatory_03",
				"pdr_wizard_tower_observatory_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_observatory_01",
				"pdr_wizard_tower_observatory_02",
				"pdr_wizard_tower_observatory_03",
				"pdr_wizard_tower_observatory_04",
			},
			sound_events_duration = {
				4.120979309082,
				4.1119790077209,
				5.3599791526794,
				2.9929790496826,
			},
		},
		pdr_wizard_tower_pig = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_pig_01",
				"pdr_wizard_tower_pig_02",
				"pdr_wizard_tower_pig_03",
				"pdr_wizard_tower_pig_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_pig_01",
				"pdr_wizard_tower_pig_02",
				"pdr_wizard_tower_pig_03",
				"pdr_wizard_tower_pig_04",
			},
			sound_events_duration = {
				3.8099792003632,
				4.705979347229,
				3.0009791851044,
				2.9549791812897,
			},
		},
		pdr_wizard_tower_portal = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_portal_01",
				"pdr_wizard_tower_portal_02",
				"pdr_wizard_tower_portal_03",
				"pdr_wizard_tower_portal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_portal_01",
				"pdr_wizard_tower_portal_02",
				"pdr_wizard_tower_portal_03",
				"pdr_wizard_tower_portal_04",
			},
			sound_events_duration = {
				2.0809791088104,
				3.4119791984558,
				2.2779791355133,
				2.8339791297913,
			},
		},
		pdr_wizard_tower_potion_maker = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_potion_maker_01",
				"pdr_wizard_tower_potion_maker_02",
				"pdr_wizard_tower_potion_maker_03",
				"pdr_wizard_tower_potion_maker_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_potion_maker_01",
				"pdr_wizard_tower_potion_maker_02",
				"pdr_wizard_tower_potion_maker_03",
				"pdr_wizard_tower_potion_maker_04",
			},
			sound_events_duration = {
				2.7980000972748,
				1.9949791431427,
				2.2199790477753,
				2.3839790821075,
			},
		},
		pdr_wizard_tower_ropes = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_ropes_01",
				"pdr_wizard_tower_ropes_02",
				"pdr_wizard_tower_ropes_03",
				"pdr_wizard_tower_ropes_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_ropes_01",
				"pdr_wizard_tower_ropes_02",
				"pdr_wizard_tower_ropes_03",
				"pdr_wizard_tower_ropes_04",
			},
			sound_events_duration = {
				4.3199791908264,
				1.7869999408722,
				2.4879999160767,
				3.9079792499542,
			},
		},
		pdr_wizard_tower_skull_found_subsequent = {
			category = "seen_items",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				"pdr_wizard_tower_skull_found_subsequent_01",
				"pdr_wizard_tower_skull_found_subsequent_02",
				"pdr_wizard_tower_skull_found_subsequent_03",
				"pdr_wizard_tower_skull_found_subsequent_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_tower_skull_found_subsequent_01",
				"pdr_wizard_tower_skull_found_subsequent_02",
				"pdr_wizard_tower_skull_found_subsequent_03",
				"pdr_wizard_tower_skull_found_subsequent_04",
			},
			sound_events_duration = {
				0.97600001096725,
				1.9700000286102,
				1.5389791727066,
				1.1039999723434,
			},
		},
		pdr_wizard_tower_where_is_she_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				[1] = "pdr_wizard_tower_where_is_she_a_01",
				[2] = "pdr_wizard_tower_where_is_she_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_tower_where_is_she_a_01",
				[2] = "pdr_wizard_tower_where_is_she_a_02",
			},
			sound_events_duration = {
				[1] = 3.0959792137146,
				[2] = 3.3679790496826,
			},
		},
		pdr_wizard_tower_where_is_she_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_tower",
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
				[1] = "pdr_wizard_tower_where_is_she_b_01",
				[2] = "pdr_wizard_tower_where_is_she_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_tower_where_is_she_b_01",
				[2] = "pdr_wizard_tower_where_is_she_b_02",
			},
			sound_events_duration = {
				[1] = 4.3589792251587,
				[2] = 2.5119791030884,
			},
		},
	})
end
