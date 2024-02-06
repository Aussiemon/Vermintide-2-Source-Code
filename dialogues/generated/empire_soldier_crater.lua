-- chunkname: @dialogues/generated/empire_soldier_crater.lua

return function ()
	define_rule({
		name = "pes_crater_ambush_done",
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
				4.9622707366943,
				5.8852915763855,
				5.1279373168945,
				6.1155414581299,
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
				2.0566458702087,
				5.0332708358765,
				3.21875,
				4.678249835968,
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
				3.1319167613983,
				5.3088541030884,
				5.3444375991821,
				4.3597707748413,
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
				2.1294584274292,
				1.7557708024979,
				2.3845207691193,
				2.1116666793823,
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
				1.8269582986832,
				1.8269375562668,
				2.2065832614899,
				2.1235415935516,
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
				3.2980000972748,
				2.9777083396912,
				4.3657083511353,
				3.8199999332428,
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
				3.1635415554047,
				2.3430624008179,
				2.9189791679382,
				3.5027709007263,
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
				4.4862395524979,
				8.8673753738403,
				4.1891250610352,
				5.7748332023621,
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
				5.8773956298828,
				7.5262293815613,
				4.2212707996368,
				4.4494581222534,
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
				3.4759583473206,
				5.3622498512268,
				5.136833190918,
				5.1961460113525,
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
				[1] = 3.179229259491,
				[2] = 6.2579164505005,
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
				[1] = 4.5311250686645,
				[2] = 3.3047916889191,
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
				[1] = 4.8167085647583,
				[2] = 5.0122709274292,
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
				[1] = 8.6149168014526,
				[2] = 6.5400834083557,
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
				[1] = 7.3053331375122,
				[2] = 8.8673753738403,
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
				[1] = 10.027083396912,
				[2] = 7.6806039810181,
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
				5.0096039772034,
				7.242208480835,
				5.9455938339233,
				7.0211665630341,
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
				5.1989374160767,
				3.025333404541,
				5.0096039772034,
				5.0332708358765,
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
				4.1916251182556,
				6.1155624389648,
				6.2875833511353,
				4.4606251716614,
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
				9.0803747177124,
				6.5164375305176,
				7.7155623435974,
				7.4788956642151,
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
				2.1616249084473,
				2.1537292003632,
				1.9880625009537,
				1.7987291812897,
			},
		},
	})
end
