-- chunkname: @dialogues/generated/empire_soldier_crater.lua

return function ()
	define_rule({
		name = "pes_crater_ambush_done",
		probability = 1,
		response = "pes_crater_ambush_done",
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
				"crater_ambush_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_ambush_done",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_ambush_done",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_ambush_interactable",
		probability = 1,
		response = "pes_crater_ambush_interactable",
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
				"crater_ambush_interactable",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_ambush_interactable",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_ambush_interactable",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_arena_end",
		probability = 1,
		response = "pes_crater_arena_end",
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
				"crater_arena_end",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_arena_end",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_arena_end",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_arena_standard",
		probability = 1,
		response = "pes_crater_arena_standard",
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
				"crater_arena_standard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_arena_standard",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_arena_standard",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_arena_standard_02",
		probability = 1,
		response = "pes_crater_arena_standard_02",
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
				"pes_crater_arena_standard_02",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"pes_crater_arena_standard_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_crater_arena_standard_02",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_arena_waystone",
		probability = 1,
		response = "pes_crater_arena_waystone",
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
				"crater_arena_waystone",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_arena_waystone",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_arena_waystone",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_bridge_sighted",
		probability = 1,
		response = "pes_crater_bridge_sighted",
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
				"crater_bridge_sighted",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_bridge_sighted",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_bridge_sighted",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_climb_top",
		probability = 1,
		response = "pes_crater_climb_top",
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
				"crater_climb_top",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_climb_top",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_climb_top",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_devastation",
		probability = 1,
		response = "pes_crater_devastation",
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
				"crater_devastation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_devastation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_devastation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_dummy",
		probability = 1,
		response = "pes_crater_dummy",
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
				"crater_dummy",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_dummy",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_forest_ascent_top",
		probability = 1,
		response = "pes_crater_forest_ascent_top",
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
				"crater_forest_ascent_top",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_forest_ascent_top",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_forest_ascent_top",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_intro_banter_a",
		probability = 1,
		response = "pes_crater_intro_banter_a",
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
				"crater_intro_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_intro_banter_b",
		probability = 1,
		response = "pes_crater_intro_banter_b",
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
				"crater_intro_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_intro_banter_c",
		probability = 1,
		response = "pes_crater_intro_banter_c",
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
				"crater_intro_banter_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_intro_banter_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_intro_banter_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_plan_banter_a",
		probability = 1,
		response = "pes_crater_plan_banter_a",
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
				"crater_plan_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_plan_banter_b",
		probability = 1,
		response = "pes_crater_plan_banter_b",
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
				"crater_plan_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_plan_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_plan_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_plan_banter_c",
		probability = 1,
		response = "pes_crater_plan_banter_c",
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
				"crater_plan_banter_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_plan_banter_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_plan_banter_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_rim_vista",
		probability = 1,
		response = "pes_crater_rim_vista",
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
				"crater_rim_vista",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_rim_vista",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_rim_vista",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_tracking_camp",
		probability = 1,
		response = "pes_crater_tracking_camp",
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
				"crater_tracking_camp",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_tracking_camp",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_tracking_camp",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_vista_reveal",
		probability = 1,
		response = "pes_crater_vista_reveal",
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
				"crater_vista_reveal",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_vista_reveal",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_vista_reveal",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_wasteland_intro",
		probability = 1,
		response = "pes_crater_wasteland_intro",
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
				"crater_vista_reveal",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_wasteland_intro",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_wasteland_intro",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_crater_wasteland_tree_push",
		probability = 1,
		response = "pes_crater_wasteland_tree_push",
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
				"crater_wasteland_tree_push",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"crater_wasteland_tree_push",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crater_wasteland_tree_push",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pes_crater_ambush_done = {
			category = "level_talk_must_play",
			database = "empire_soldier_crater",
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
				"pes_crater_ambush_done_01",
				"pes_crater_ambush_done_02",
				"pes_crater_ambush_done_03",
				"pes_crater_ambush_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_ambush_done_01",
				"pes_crater_ambush_done_02",
				"pes_crater_ambush_done_03",
				"pes_crater_ambush_done_04",
			},
			sound_events_duration = {
				4.9619793891907,
				5.8849792480469,
				5.1269793510437,
				6.1149792671204,
			},
		},
		pes_crater_ambush_interactable = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_ambush_interactable_01",
				"pes_crater_ambush_interactable_02",
				"pes_crater_ambush_interactable_03",
				"pes_crater_ambush_interactable_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_ambush_interactable_01",
				"pes_crater_ambush_interactable_02",
				"pes_crater_ambush_interactable_03",
				"pes_crater_ambush_interactable_04",
			},
			sound_events_duration = {
				2.0559792518616,
				5.0329790115356,
				3.2179791927338,
				4.6779789924622,
			},
		},
		pes_crater_arena_end = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_arena_end_01",
				"pes_crater_arena_end_02",
				"pes_crater_arena_end_03",
				"pes_crater_arena_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_arena_end_01",
				"pes_crater_arena_end_02",
				"pes_crater_arena_end_03",
				"pes_crater_arena_end_04",
			},
			sound_events_duration = {
				3.1309790611267,
				5.3079791069031,
				5.3439793586731,
				4.3589792251587,
			},
		},
		pes_crater_arena_standard = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_arena_standard_01",
				"pes_crater_arena_standard_02",
				"pes_crater_arena_standard_03",
				"pes_crater_arena_standard_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_arena_standard_01",
				"pes_crater_arena_standard_02",
				"pes_crater_arena_standard_03",
				"pes_crater_arena_standard_04",
			},
			sound_events_duration = {
				2.1289792060852,
				1.754979133606,
				2.3839790821075,
				2.1109790802002,
			},
		},
		pes_crater_arena_standard_02 = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_arena_standard_02_01",
				"pes_crater_arena_standard_02_02",
				"pes_crater_arena_standard_02_03",
				"pes_crater_arena_standard_02_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_arena_standard_02_01",
				"pes_crater_arena_standard_02_02",
				"pes_crater_arena_standard_02_03",
				"pes_crater_arena_standard_02_04",
			},
			sound_events_duration = {
				1.8259791135788,
				1.8259999752045,
				2.2059791088104,
				2.1229791641235,
			},
		},
		pes_crater_arena_waystone = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_arena_waystone_01",
				"pes_crater_arena_waystone_02",
				"pes_crater_arena_waystone_03",
				"pes_crater_arena_waystone_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_arena_waystone_01",
				"pes_crater_arena_waystone_02",
				"pes_crater_arena_waystone_03",
				"pes_crater_arena_waystone_04",
			},
			sound_events_duration = {
				3.2979791164398,
				2.9769792556763,
				4.3649792671204,
				3.8199791908264,
			},
		},
		pes_crater_bridge_sighted = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_bridge_sighted_01",
				"pes_crater_bridge_sighted_02",
				"pes_crater_bridge_sighted_03",
				"pes_crater_bridge_sighted_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_bridge_sighted_01",
				"pes_crater_bridge_sighted_02",
				"pes_crater_bridge_sighted_03",
				"pes_crater_bridge_sighted_04",
			},
			sound_events_duration = {
				3.1629791259766,
				2.3429791927338,
				2.9179792404175,
				3.5019791126251,
			},
		},
		pes_crater_climb_top = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_climb_top_01",
				"pes_crater_climb_top_02",
				"pes_crater_climb_top_03",
				"pes_crater_climb_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_climb_top_01",
				"pes_crater_climb_top_02",
				"pes_crater_climb_top_03",
				"pes_crater_climb_top_04",
			},
			sound_events_duration = {
				4.4858750104904,
				8.866979598999,
				4.1889791488647,
				5.7739791870117,
			},
		},
		pes_crater_devastation = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_devastation_01",
				"pes_crater_devastation_02",
				"pes_crater_devastation_03",
				"pes_crater_devastation_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_devastation_01",
				"pes_crater_devastation_02",
				"pes_crater_devastation_03",
				"pes_crater_devastation_04",
			},
			sound_events_duration = {
				5.8769793510437,
				7.5259790420532,
				4.2211146354675,
				4.4489793777466,
			},
		},
		pes_crater_dummy = {
			category = "level_talk_must_play",
			database = "empire_soldier_crater",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
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
		pes_crater_forest_ascent_top = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_forest_ascent_top_01",
				"pes_crater_forest_ascent_top_02",
				"pes_crater_forest_ascent_top_03",
				"pes_crater_forest_ascent_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_forest_ascent_top_01",
				"pes_crater_forest_ascent_top_02",
				"pes_crater_forest_ascent_top_03",
				"pes_crater_forest_ascent_top_04",
			},
			sound_events_duration = {
				3.4749791622162,
				5.3619790077209,
				5.1359791755676,
				5.1959791183472,
			},
		},
		pes_crater_intro_banter_a = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				[1] = "pes_crater_intro_banter_a_01",
				[2] = "pes_crater_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_crater_intro_banter_a_01",
				[2] = "pes_crater_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.1789791584015,
				[2] = 6.2569999694824,
			},
		},
		pes_crater_intro_banter_b = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				[1] = "pes_crater_intro_banter_b_01",
				[2] = "pes_crater_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_crater_intro_banter_b_01",
				[2] = "pes_crater_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.5309791564941,
				[2] = 3.3039791584015,
			},
		},
		pes_crater_intro_banter_c = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				[1] = "pes_crater_intro_banter_c_01",
				[2] = "pes_crater_intro_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_crater_intro_banter_c_01",
				[2] = "pes_crater_intro_banter_c_02",
			},
			sound_events_duration = {
				[1] = 4.8159790039063,
				[2] = 5.0119791030884,
			},
		},
		pes_crater_plan_banter_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_crater",
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
				[1] = "pes_crater_plan_banter_a_01",
				[2] = "pes_crater_plan_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_crater_plan_banter_a_01",
				[2] = "pes_crater_plan_banter_a_02",
			},
			sound_events_duration = {
				[1] = 8.6139793395996,
				[2] = 6.5399789810181,
			},
		},
		pes_crater_plan_banter_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_crater",
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
				[1] = "pes_crater_plan_banter_b_01",
				[2] = "pes_crater_plan_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_crater_plan_banter_b_01",
				[2] = "pes_crater_plan_banter_b_02",
			},
			sound_events_duration = {
				[1] = 7.3049793243408,
				[2] = 8.866979598999,
			},
		},
		pes_crater_plan_banter_c = {
			category = "level_talk_must_play",
			database = "empire_soldier_crater",
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
				[1] = "pes_crater_plan_banter_c_01",
				[2] = "pes_crater_plan_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_crater_plan_banter_c_01",
				[2] = "pes_crater_plan_banter_c_02",
			},
			sound_events_duration = {
				[1] = 10.026979446411,
				[2] = 7.6799793243408,
			},
		},
		pes_crater_rim_vista = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_rim_vista_01",
				"pes_crater_rim_vista_02",
				"pes_crater_rim_vista_03",
				"pes_crater_rim_vista_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_rim_vista_01",
				"pes_crater_rim_vista_02",
				"pes_crater_rim_vista_03",
				"pes_crater_rim_vista_04",
			},
			sound_events_duration = {
				5.0089793205261,
				7.2419791221619,
				5.9453022480011,
				7.020708322525,
			},
		},
		pes_crater_tracking_camp = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_tracking_camp_01",
				"pes_crater_tracking_camp_02",
				"pes_crater_tracking_camp_03",
				"pes_crater_tracking_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_tracking_camp_01",
				"pes_crater_tracking_camp_02",
				"pes_crater_tracking_camp_03",
				"pes_crater_tracking_camp_04",
			},
			sound_events_duration = {
				5.1979789733887,
				3.0249791145325,
				5.0089793205261,
				5.0329790115356,
			},
		},
		pes_crater_vista_reveal = {
			category = "level_talk_must_play",
			database = "empire_soldier_crater",
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
				"pes_crater_vista_reveal_01",
				"pes_crater_vista_reveal_02",
				"pes_crater_vista_reveal_03",
				"pes_crater_vista_reveal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_vista_reveal_01",
				"pes_crater_vista_reveal_02",
				"pes_crater_vista_reveal_03",
				"pes_crater_vista_reveal_04",
			},
			sound_events_duration = {
				4.1913645267487,
				6.1149792671204,
				6.2869791984558,
				4.459979057312,
			},
		},
		pes_crater_wasteland_intro = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_wasteland_intro_01",
				"pes_crater_wasteland_intro_02",
				"pes_crater_wasteland_intro_03",
				"pes_crater_wasteland_intro_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_wasteland_intro_01",
				"pes_crater_wasteland_intro_02",
				"pes_crater_wasteland_intro_03",
				"pes_crater_wasteland_intro_04",
			},
			sound_events_duration = {
				9.0799789428711,
				6.5159792900085,
				7.7149791717529,
				7.477979183197,
			},
		},
		pes_crater_wasteland_tree_push = {
			category = "level_talk",
			database = "empire_soldier_crater",
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
				"pes_crater_wasteland_tree_push_01",
				"pes_crater_wasteland_tree_push_02",
				"pes_crater_wasteland_tree_push_03",
				"pes_crater_wasteland_tree_push_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_crater_wasteland_tree_push_01",
				"pes_crater_wasteland_tree_push_02",
				"pes_crater_wasteland_tree_push_03",
				"pes_crater_wasteland_tree_push_04",
			},
			sound_events_duration = {
				2.1609792709351,
				2.1530001163483,
				1.9879791736603,
				1.7979791164398,
			},
		},
	})
end
