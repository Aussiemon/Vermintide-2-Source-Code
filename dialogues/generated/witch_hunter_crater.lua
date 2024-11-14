-- chunkname: @dialogues/generated/witch_hunter_crater.lua

return function ()
	define_rule({
		name = "pwh_crater_ambush_done",
		probability = 1,
		response = "pwh_crater_ambush_done",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_ambush_interactable",
		probability = 1,
		response = "pwh_crater_ambush_interactable",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_arena_end",
		probability = 1,
		response = "pwh_crater_arena_end",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_arena_standard",
		probability = 1,
		response = "pwh_crater_arena_standard",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_arena_standard_02",
		probability = 1,
		response = "pwh_crater_arena_standard_02",
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
				"pwh_crater_arena_standard_02",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"pwh_crater_arena_standard_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_crater_arena_standard_02",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_crater_arena_waystone",
		probability = 1,
		response = "pwh_crater_arena_waystone",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_bridge_sighted",
		probability = 1,
		response = "pwh_crater_bridge_sighted",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_climb_top",
		probability = 1,
		response = "pwh_crater_climb_top",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_devastation",
		probability = 1,
		response = "pwh_crater_devastation",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_dummy",
		probability = 1,
		response = "pwh_crater_dummy",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_forest_ascent_top",
		probability = 1,
		response = "pwh_crater_forest_ascent_top",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_intro_banter_a",
		probability = 1,
		response = "pwh_crater_intro_banter_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_intro_banter_b",
		probability = 1,
		response = "pwh_crater_intro_banter_b",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_intro_banter_c",
		probability = 1,
		response = "pwh_crater_intro_banter_c",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_plan_banter_a",
		probability = 1,
		response = "pwh_crater_plan_banter_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_plan_banter_b",
		probability = 1,
		response = "pwh_crater_plan_banter_b",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_plan_banter_c",
		probability = 1,
		response = "pwh_crater_plan_banter_c",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_rim_vista",
		probability = 1,
		response = "pwh_crater_rim_vista",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_tracking_camp",
		probability = 1,
		response = "pwh_crater_tracking_camp",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_vista_reveal",
		probability = 1,
		response = "pwh_crater_vista_reveal",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_wasteland_intro",
		probability = 1,
		response = "pwh_crater_wasteland_intro",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_crater_wasteland_tree_push",
		probability = 1,
		response = "pwh_crater_wasteland_tree_push",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		pwh_crater_ambush_done = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_ambush_done_01",
				"pwh_crater_ambush_done_02",
				"pwh_crater_ambush_done_03",
				"pwh_crater_ambush_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_ambush_done_01",
				"pwh_crater_ambush_done_02",
				"pwh_crater_ambush_done_03",
				"pwh_crater_ambush_done_04",
			},
			sound_events_duration = {
				6.7249794006348,
				9.4339790344238,
				8.3369789123535,
				5.9739789962769,
			},
		},
		pwh_crater_ambush_interactable = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_ambush_interactable_01",
				"pwh_crater_ambush_interactable_02",
				"pwh_crater_ambush_interactable_03",
				"pwh_crater_ambush_interactable_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_ambush_interactable_01",
				"pwh_crater_ambush_interactable_02",
				"pwh_crater_ambush_interactable_03",
				"pwh_crater_ambush_interactable_04",
			},
			sound_events_duration = {
				7.6909790039063,
				4.2239789962769,
				5.3079791069031,
				6.2809791564941,
			},
		},
		pwh_crater_arena_end = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_arena_end_01",
				"pwh_crater_arena_end_02",
				"pwh_crater_arena_end_03",
				"pwh_crater_arena_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_arena_end_01",
				"pwh_crater_arena_end_02",
				"pwh_crater_arena_end_03",
				"pwh_crater_arena_end_04",
			},
			sound_events_duration = {
				8.2429790496826,
				3.8359792232513,
				5.4349789619446,
				6.3049793243408,
			},
		},
		pwh_crater_arena_standard = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_arena_standard_01",
				"pwh_crater_arena_standard_02",
				"pwh_crater_arena_standard_03",
				"pwh_crater_arena_standard_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_arena_standard_01",
				"pwh_crater_arena_standard_02",
				"pwh_crater_arena_standard_03",
				"pwh_crater_arena_standard_04",
			},
			sound_events_duration = {
				4.3359789848328,
				2.7089791297913,
				3.8709790706634,
				2.4110000133514,
			},
		},
		pwh_crater_arena_standard_02 = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_arena_standard_02_01",
				"pwh_crater_arena_standard_02_02",
				"pwh_crater_arena_standard_02_03",
				"pwh_crater_arena_standard_02_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_arena_standard_02_01",
				"pwh_crater_arena_standard_02_02",
				"pwh_crater_arena_standard_02_03",
				"pwh_crater_arena_standard_02_04",
			},
			sound_events_duration = {
				3.0719792842865,
				4.4359793663025,
				3.1819791793823,
				3.4579792022705,
			},
		},
		pwh_crater_arena_waystone = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_arena_waystone_01",
				"pwh_crater_arena_waystone_02",
				"pwh_crater_arena_waystone_03",
				"pwh_crater_arena_waystone_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_arena_waystone_01",
				"pwh_crater_arena_waystone_02",
				"pwh_crater_arena_waystone_03",
				"pwh_crater_arena_waystone_04",
			},
			sound_events_duration = {
				5.1119790077209,
				5.352979183197,
				6.7859792709351,
				5.3339791297913,
			},
		},
		pwh_crater_bridge_sighted = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_bridge_sighted_01",
				"pwh_crater_bridge_sighted_02",
				"pwh_crater_bridge_sighted_03",
				"pwh_crater_bridge_sighted_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_bridge_sighted_01",
				"pwh_crater_bridge_sighted_02",
				"pwh_crater_bridge_sighted_03",
				"pwh_crater_bridge_sighted_04",
			},
			sound_events_duration = {
				3.2259790897369,
				3.1719791889191,
				4.2009792327881,
				6.8069791793823,
			},
		},
		pwh_crater_climb_top = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_climb_top_01",
				"pwh_crater_climb_top_02",
				"pwh_crater_climb_top_03",
				"pwh_crater_climb_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_climb_top_01",
				"pwh_crater_climb_top_02",
				"pwh_crater_climb_top_03",
				"pwh_crater_climb_top_04",
			},
			sound_events_duration = {
				4.205979347229,
				4.5249791145325,
				7.7019791603088,
				8.8769788742065,
			},
		},
		pwh_crater_devastation = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_devastation_01",
				"pwh_crater_devastation_02",
				"pwh_crater_devastation_03",
				"pwh_crater_devastation_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_devastation_01",
				"pwh_crater_devastation_02",
				"pwh_crater_devastation_03",
				"pwh_crater_devastation_04",
			},
			sound_events_duration = {
				6.0739793777466,
				5.897979259491,
				7.9139790534973,
				7.0359792709351,
			},
		},
		pwh_crater_dummy = {
			category = "level_talk_must_play",
			database = "witch_hunter_crater",
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
		pwh_crater_forest_ascent_top = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_forest_ascent_top_01",
				"pwh_crater_forest_ascent_top_02",
				"pwh_crater_forest_ascent_top_03",
				"pwh_crater_forest_ascent_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_forest_ascent_top_01",
				"pwh_crater_forest_ascent_top_02",
				"pwh_crater_forest_ascent_top_03",
				"pwh_crater_forest_ascent_top_04",
			},
			sound_events_duration = {
				7.5019793510437,
				4.249979019165,
				8.0699787139893,
				4.8639793395996,
			},
		},
		pwh_crater_intro_banter_a = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				[1] = "pwh_crater_intro_banter_a_01",
				[2] = "pwh_crater_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crater_intro_banter_a_01",
				[2] = "pwh_crater_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 5.294979095459,
				[2] = 4.3409790992737,
			},
		},
		pwh_crater_intro_banter_b = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				[1] = "pwh_crater_intro_banter_b_01",
				[2] = "pwh_crater_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crater_intro_banter_b_01",
				[2] = "pwh_crater_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 6.6459794044495,
				[2] = 8.1679792404175,
			},
		},
		pwh_crater_intro_banter_c = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				[1] = "pwh_crater_intro_banter_c_01",
				[2] = "pwh_crater_intro_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crater_intro_banter_c_01",
				[2] = "pwh_crater_intro_banter_c_02",
			},
			sound_events_duration = {
				[1] = 2.6110000610352,
				[2] = 7.7559790611267,
			},
		},
		pwh_crater_plan_banter_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_crater",
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
				[1] = "pwh_crater_plan_banter_a_01",
				[2] = "pwh_crater_plan_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crater_plan_banter_a_01",
				[2] = "pwh_crater_plan_banter_a_02",
			},
			sound_events_duration = {
				[1] = 11.287979125977,
				[2] = 8.9889793395996,
			},
		},
		pwh_crater_plan_banter_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_crater",
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
				[1] = "pwh_crater_plan_banter_b_01",
				[2] = "pwh_crater_plan_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crater_plan_banter_b_01",
				[2] = "pwh_crater_plan_banter_b_02",
			},
			sound_events_duration = {
				[1] = 6.9969792366028,
				[2] = 8.951979637146,
			},
		},
		pwh_crater_plan_banter_c = {
			category = "level_talk_must_play",
			database = "witch_hunter_crater",
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
				[1] = "pwh_crater_plan_banter_c_01",
				[2] = "pwh_crater_plan_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_crater_plan_banter_c_01",
				[2] = "pwh_crater_plan_banter_c_02",
			},
			sound_events_duration = {
				[1] = 8.9269790649414,
				[2] = 7.955979347229,
			},
		},
		pwh_crater_rim_vista = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_rim_vista_01",
				"pwh_crater_rim_vista_02",
				"pwh_crater_rim_vista_03",
				"pwh_crater_rim_vista_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_rim_vista_01",
				"pwh_crater_rim_vista_02",
				"pwh_crater_rim_vista_03",
				"pwh_crater_rim_vista_04",
			},
			sound_events_duration = {
				6.9719791412353,
				11.240979194641,
				5.9639792442322,
				9.5169792175293,
			},
		},
		pwh_crater_tracking_camp = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_tracking_camp_01",
				"pwh_crater_tracking_camp_02",
				"pwh_crater_tracking_camp_03",
				"pwh_crater_tracking_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_tracking_camp_01",
				"pwh_crater_tracking_camp_02",
				"pwh_crater_tracking_camp_03",
				"pwh_crater_tracking_camp_04",
			},
			sound_events_duration = {
				5.0919790267944,
				6.5479793548584,
				4.504979133606,
				5.620979309082,
			},
		},
		pwh_crater_vista_reveal = {
			category = "level_talk_must_play",
			database = "witch_hunter_crater",
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
				"pwh_crater_vista_reveal_01",
				"pwh_crater_vista_reveal_02",
				"pwh_crater_vista_reveal_03",
				"pwh_crater_vista_reveal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_vista_reveal_01",
				"pwh_crater_vista_reveal_02",
				"pwh_crater_vista_reveal_03",
				"pwh_crater_vista_reveal_04",
			},
			sound_events_duration = {
				7.6449790000916,
				5.620979309082,
				7.01797914505,
				8.4840002059937,
			},
		},
		pwh_crater_wasteland_intro = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_wasteland_intro_01",
				"pwh_crater_wasteland_intro_02",
				"pwh_crater_wasteland_intro_03",
				"pwh_crater_wasteland_intro_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_wasteland_intro_01",
				"pwh_crater_wasteland_intro_02",
				"pwh_crater_wasteland_intro_03",
				"pwh_crater_wasteland_intro_04",
			},
			sound_events_duration = {
				10.131978988648,
				8.5829792022705,
				9.2639789581299,
				10.151979446411,
			},
		},
		pwh_crater_wasteland_tree_push = {
			category = "level_talk",
			database = "witch_hunter_crater",
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
				"pwh_crater_wasteland_tree_push_01",
				"pwh_crater_wasteland_tree_push_02",
				"pwh_crater_wasteland_tree_push_03",
				"pwh_crater_wasteland_tree_push_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_crater_wasteland_tree_push_01",
				"pwh_crater_wasteland_tree_push_02",
				"pwh_crater_wasteland_tree_push_03",
				"pwh_crater_wasteland_tree_push_04",
			},
			sound_events_duration = {
				3.7479791641235,
				3.2699792385101,
				4.4939789772034,
				3.8649792671204,
			},
		},
	})
end
