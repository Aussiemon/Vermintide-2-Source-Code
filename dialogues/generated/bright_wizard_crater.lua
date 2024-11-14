-- chunkname: @dialogues/generated/bright_wizard_crater.lua

return function ()
	define_rule({
		name = "pbw_crater_ambush_done",
		probability = 1,
		response = "pbw_crater_ambush_done",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_ambush_interactable",
		probability = 1,
		response = "pbw_crater_ambush_interactable",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_arena_end",
		probability = 1,
		response = "pbw_crater_arena_end",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_arena_standard",
		probability = 1,
		response = "pbw_crater_arena_standard",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_arena_standard_02",
		probability = 1,
		response = "pbw_crater_arena_standard_02",
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
				"pbw_crater_arena_standard_02",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"pbw_crater_arena_standard_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_crater_arena_standard_02",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_crater_arena_waystone",
		probability = 1,
		response = "pbw_crater_arena_waystone",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_bridge_sighted",
		probability = 1,
		response = "pbw_crater_bridge_sighted",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_climb_top",
		probability = 1,
		response = "pbw_crater_climb_top",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_devastation",
		probability = 1,
		response = "pbw_crater_devastation",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_dummy",
		probability = 1,
		response = "pbw_crater_dummy",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_forest_ascent_top",
		probability = 1,
		response = "pbw_crater_forest_ascent_top",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_intro_banter_a",
		probability = 1,
		response = "pbw_crater_intro_banter_a",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_intro_banter_b",
		probability = 1,
		response = "pbw_crater_intro_banter_b",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_intro_banter_c",
		probability = 1,
		response = "pbw_crater_intro_banter_c",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_plan_banter_a",
		probability = 1,
		response = "pbw_crater_plan_banter_a",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_plan_banter_b",
		probability = 1,
		response = "pbw_crater_plan_banter_b",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_plan_banter_c",
		probability = 1,
		response = "pbw_crater_plan_banter_c",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_rim_vista",
		probability = 1,
		response = "pbw_crater_rim_vista",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_tracking_camp",
		probability = 1,
		response = "pbw_crater_tracking_camp",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_vista_reveal",
		probability = 1,
		response = "pbw_crater_vista_reveal",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_wasteland_intro",
		probability = 1,
		response = "pbw_crater_wasteland_intro",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_crater_wasteland_tree_push",
		probability = 1,
		response = "pbw_crater_wasteland_tree_push",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		pbw_crater_ambush_done = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_ambush_done_01",
				"pbw_crater_ambush_done_02",
				"pbw_crater_ambush_done_03",
				"pbw_crater_ambush_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_ambush_done_01",
				"pbw_crater_ambush_done_02",
				"pbw_crater_ambush_done_03",
				"pbw_crater_ambush_done_04",
			},
			sound_events_duration = {
				3.7719790935516,
				6.1649789810181,
				4.959979057312,
				4.5229997634888,
			},
		},
		pbw_crater_ambush_interactable = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_ambush_interactable_01",
				"pbw_crater_ambush_interactable_02",
				"pbw_crater_ambush_interactable_03",
				"pbw_crater_ambush_interactable_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_ambush_interactable_01",
				"pbw_crater_ambush_interactable_02",
				"pbw_crater_ambush_interactable_03",
				"pbw_crater_ambush_interactable_04",
			},
			sound_events_duration = {
				3.4659790992737,
				5.8889789581299,
				2.1870000362396,
				5.7529792785644,
			},
		},
		pbw_crater_arena_end = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_arena_end_01",
				"pbw_crater_arena_end_02",
				"pbw_crater_arena_end_03",
				"pbw_crater_arena_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_arena_end_01",
				"pbw_crater_arena_end_02",
				"pbw_crater_arena_end_03",
				"pbw_crater_arena_end_04",
			},
			sound_events_duration = {
				6.4979791641235,
				5.1779789924622,
				4.8439793586731,
				3.4079792499542,
			},
		},
		pbw_crater_arena_standard = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_arena_standard_01",
				"pbw_crater_arena_standard_02",
				"pbw_crater_arena_standard_03",
				"pbw_crater_arena_standard_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_arena_standard_01",
				"pbw_crater_arena_standard_02",
				"pbw_crater_arena_standard_03",
				"pbw_crater_arena_standard_04",
			},
			sound_events_duration = {
				3.9169790744781,
				2.0669791698456,
				3.2689790725708,
				3.1679792404175,
			},
		},
		pbw_crater_arena_standard_02 = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_arena_standard_02_01",
				"pbw_crater_arena_standard_02_02",
				"pbw_crater_arena_standard_02_03",
				"pbw_crater_arena_standard_02_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_arena_standard_02_01",
				"pbw_crater_arena_standard_02_02",
				"pbw_crater_arena_standard_02_03",
				"pbw_crater_arena_standard_02_04",
			},
			sound_events_duration = {
				1.2309999465942,
				1.5720000267029,
				2.5289790630341,
				1.9709792137146,
			},
		},
		pbw_crater_arena_waystone = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_arena_waystone_01",
				"pbw_crater_arena_waystone_02",
				"pbw_crater_arena_waystone_03",
				"pbw_crater_arena_waystone_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_arena_waystone_01",
				"pbw_crater_arena_waystone_02",
				"pbw_crater_arena_waystone_03",
				"pbw_crater_arena_waystone_04",
			},
			sound_events_duration = {
				2.8699791431427,
				4.165979385376,
				2.8259792327881,
				5.4519791603088,
			},
		},
		pbw_crater_bridge_sighted = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_bridge_sighted_01",
				"pbw_crater_bridge_sighted_02",
				"pbw_crater_bridge_sighted_03",
				"pbw_crater_bridge_sighted_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_bridge_sighted_01",
				"pbw_crater_bridge_sighted_02",
				"pbw_crater_bridge_sighted_03",
				"pbw_crater_bridge_sighted_04",
			},
			sound_events_duration = {
				1.9930000305176,
				3.0269792079926,
				2.3219792842865,
				3.2009792327881,
			},
		},
		pbw_crater_climb_top = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_climb_top_01",
				"pbw_crater_climb_top_02",
				"pbw_crater_climb_top_03",
				"pbw_crater_climb_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_climb_top_01",
				"pbw_crater_climb_top_02",
				"pbw_crater_climb_top_03",
				"pbw_crater_climb_top_04",
			},
			sound_events_duration = {
				3.51597905159,
				4.0689792633057,
				4.2409791946411,
				4.8999791145325,
			},
		},
		pbw_crater_devastation = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_devastation_01",
				"pbw_crater_devastation_02",
				"pbw_crater_devastation_03",
				"pbw_crater_devastation_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_devastation_01",
				"pbw_crater_devastation_02",
				"pbw_crater_devastation_03",
				"pbw_crater_devastation_04",
			},
			sound_events_duration = {
				5.4929790496826,
				5.7539792060852,
				4.9299793243408,
				5.2419791221619,
			},
		},
		pbw_crater_dummy = {
			category = "level_talk_must_play",
			database = "bright_wizard_crater",
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
		pbw_crater_forest_ascent_top = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_forest_ascent_top_01",
				"pbw_crater_forest_ascent_top_02",
				"pbw_crater_forest_ascent_top_03",
				"pbw_crater_forest_ascent_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_forest_ascent_top_01",
				"pbw_crater_forest_ascent_top_02",
				"pbw_crater_forest_ascent_top_03",
				"pbw_crater_forest_ascent_top_04",
			},
			sound_events_duration = {
				4.3829793930054,
				2.8889999389648,
				6.0699791908264,
				4.9519791603088,
			},
		},
		pbw_crater_intro_banter_a = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				[1] = "pbw_crater_intro_banter_a_01",
				[2] = "pbw_crater_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_crater_intro_banter_a_01",
				[2] = "pbw_crater_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.4749791622162,
				[2] = 4.8449792861939,
			},
		},
		pbw_crater_intro_banter_b = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				[1] = "pbw_crater_intro_banter_b_01",
				[2] = "pbw_crater_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_crater_intro_banter_b_01",
				[2] = "pbw_crater_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 7.794979095459,
				[2] = 5.5539793968201,
			},
		},
		pbw_crater_intro_banter_c = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				[1] = "pbw_crater_intro_banter_c_01",
				[2] = "pbw_crater_intro_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_crater_intro_banter_c_01",
				[2] = "pbw_crater_intro_banter_c_02",
			},
			sound_events_duration = {
				[1] = 4.8589792251587,
				[2] = 3.8719792366028,
			},
		},
		pbw_crater_plan_banter_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_crater",
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
				[1] = "pbw_crater_plan_banter_a_01",
				[2] = "pbw_crater_plan_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_crater_plan_banter_a_01",
				[2] = "pbw_crater_plan_banter_a_02",
			},
			sound_events_duration = {
				[1] = 9.9489793777466,
				[2] = 6.2709794044495,
			},
		},
		pbw_crater_plan_banter_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_crater",
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
				[1] = "pbw_crater_plan_banter_b_01",
				[2] = "pbw_crater_plan_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_crater_plan_banter_b_01",
				[2] = "pbw_crater_plan_banter_b_02",
			},
			sound_events_duration = {
				[1] = 8.0199794769287,
				[2] = 10.903979301453,
			},
		},
		pbw_crater_plan_banter_c = {
			category = "level_talk_must_play",
			database = "bright_wizard_crater",
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
				[1] = "pbw_crater_plan_banter_c_01",
				[2] = "pbw_crater_plan_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_crater_plan_banter_c_01",
				[2] = "pbw_crater_plan_banter_c_02",
			},
			sound_events_duration = {
				[1] = 5.4299793243408,
				[2] = 6.6619791984558,
			},
		},
		pbw_crater_rim_vista = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_rim_vista_01",
				"pbw_crater_rim_vista_02",
				"pbw_crater_rim_vista_03",
				"pbw_crater_rim_vista_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_rim_vista_01",
				"pbw_crater_rim_vista_02",
				"pbw_crater_rim_vista_03",
				"pbw_crater_rim_vista_04",
			},
			sound_events_duration = {
				5.6509790420532,
				6.1529793739319,
				8.2449789047241,
				6.3089790344238,
			},
		},
		pbw_crater_tracking_camp = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_tracking_camp_01",
				"pbw_crater_tracking_camp_02",
				"pbw_crater_tracking_camp_03",
				"pbw_crater_tracking_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_tracking_camp_01",
				"pbw_crater_tracking_camp_02",
				"pbw_crater_tracking_camp_03",
				"pbw_crater_tracking_camp_04",
			},
			sound_events_duration = {
				2.7239792346954,
				3.8229999542236,
				3.8679790496826,
				6.3719792366028,
			},
		},
		pbw_crater_vista_reveal = {
			category = "level_talk_must_play",
			database = "bright_wizard_crater",
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
				"pbw_crater_vista_reveal_01",
				"pbw_crater_vista_reveal_02",
				"pbw_crater_vista_reveal_03",
				"pbw_crater_vista_reveal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_vista_reveal_01",
				"pbw_crater_vista_reveal_02",
				"pbw_crater_vista_reveal_03",
				"pbw_crater_vista_reveal_04",
			},
			sound_events_duration = {
				4.9736769199371,
				3.8469791412353,
				4.566978931427,
				3.9769792556763,
			},
		},
		pbw_crater_wasteland_intro = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_wasteland_intro_01",
				"pbw_crater_wasteland_intro_02",
				"pbw_crater_wasteland_intro_03",
				"pbw_crater_wasteland_intro_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_wasteland_intro_01",
				"pbw_crater_wasteland_intro_02",
				"pbw_crater_wasteland_intro_03",
				"pbw_crater_wasteland_intro_04",
			},
			sound_events_duration = {
				5.0489792823792,
				8.3949794769287,
				8.9049787521362,
				10.157979011536,
			},
		},
		pbw_crater_wasteland_tree_push = {
			category = "level_talk",
			database = "bright_wizard_crater",
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
				"pbw_crater_wasteland_tree_push_01",
				"pbw_crater_wasteland_tree_push_02",
				"pbw_crater_wasteland_tree_push_03",
				"pbw_crater_wasteland_tree_push_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_crater_wasteland_tree_push_01",
				"pbw_crater_wasteland_tree_push_02",
				"pbw_crater_wasteland_tree_push_03",
				"pbw_crater_wasteland_tree_push_04",
			},
			sound_events_duration = {
				1.4329999685288,
				1.5659999847412,
				3.2130000591278,
				2.8879792690277,
			},
		},
	})
end
