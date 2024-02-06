-- chunkname: @dialogues/generated/witch_hunter_crater.lua

return function ()
	define_rule({
		name = "pwh_crater_ambush_done",
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
				6.7250833511353,
				9.4347085952759,
				8.3377914428711,
				5.97420835495,
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
				7.6913957595825,
				4.2243957519531,
				5.3082499504089,
				6.2811040878296,
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
				8.845624923706,
				3.8366875648499,
				5.4352917671204,
				6.3052916526794,
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
				4.3362293243408,
				2.709625005722,
				3.8717083930969,
				2.4110832214356,
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
				3.0724792480469,
				4.4366459846497,
				3.1828334331513,
				3.4582290649414,
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
				5.1129789352417,
				5.3533749580383,
				6.7864999771118,
				5.3348956108093,
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
				3.2266249656677,
				3.1721665859222,
				4.201708316803,
				6.8073749542236,
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
				4.2068958282471,
				4.5256252288818,
				7.7026042938232,
				8.8774585723877,
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
				6.0745625495911,
				5.8988752365112,
				7.9145002365112,
				7.0361456871033,
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
				7.5020623207092,
				4.2505207061768,
				8.0700836181641,
				4.8642706871033,
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
				[1] = 5.2951874732971,
				[2] = 4.3419375419617,
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
				[1] = 6.6467289924622,
				[2] = 8.1680212020874,
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
				[1] = 2.6116666793823,
				[2] = 7.7566876411438,
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
				[1] = 11.288687705994,
				[2] = 8.989146232605,
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
				[1] = 6.9970207214356,
				[2] = 8.9522495269775,
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
				[1] = 8.9276456832886,
				[2] = 7.9561877250671,
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
				6.9726667404175,
				11.241062164307,
				5.9646458625794,
				9.5170412063599,
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
				5.092791557312,
				6.548791885376,
				4.5051460266113,
				5.6216459274292,
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
				7.6456875801086,
				5.6216249465942,
				7.0188956260681,
				8.4849796295166,
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
				10.13277053833,
				8.5833539962769,
				9.2643957138062,
				10.152000427246,
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
				3.7486457824707,
				3.2706875801086,
				4.4942083358765,
				3.8651249408722,
			},
		},
	})
end
