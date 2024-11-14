-- chunkname: @dialogues/generated/dwarf_ranger_crater.lua

return function ()
	define_rule({
		name = "pdr_crater_ambush_done",
		probability = 1,
		response = "pdr_crater_ambush_done",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_ambush_interactable",
		probability = 1,
		response = "pdr_crater_ambush_interactable",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_arena_end",
		probability = 1,
		response = "pdr_crater_arena_end",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_arena_standard",
		probability = 1,
		response = "pdr_crater_arena_standard",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_arena_standard_02",
		probability = 1,
		response = "pdr_crater_arena_standard_02",
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
				"pdr_crater_arena_standard_02",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"pdr_crater_arena_standard_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_crater_arena_standard_02",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_crater_arena_waystone",
		probability = 1,
		response = "pdr_crater_arena_waystone",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_bridge_sighted",
		probability = 1,
		response = "pdr_crater_bridge_sighted",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_climb_top",
		probability = 1,
		response = "pdr_crater_climb_top",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_devastation",
		probability = 1,
		response = "pdr_crater_devastation",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_dummy",
		probability = 1,
		response = "pdr_crater_dummy",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_forest_ascent_top",
		probability = 1,
		response = "pdr_crater_forest_ascent_top",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_intro_banter_a",
		probability = 1,
		response = "pdr_crater_intro_banter_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_intro_banter_b",
		probability = 1,
		response = "pdr_crater_intro_banter_b",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_intro_banter_c",
		probability = 1,
		response = "pdr_crater_intro_banter_c",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_plan_banter_a",
		probability = 1,
		response = "pdr_crater_plan_banter_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_plan_banter_b",
		probability = 1,
		response = "pdr_crater_plan_banter_b",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_plan_banter_c",
		probability = 1,
		response = "pdr_crater_plan_banter_c",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_rim_vista",
		probability = 1,
		response = "pdr_crater_rim_vista",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_tracking_camp",
		probability = 1,
		response = "pdr_crater_tracking_camp",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_vista_reveal",
		probability = 1,
		response = "pdr_crater_vista_reveal",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_wasteland_intro",
		probability = 1,
		response = "pdr_crater_wasteland_intro",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_crater_wasteland_tree_push",
		probability = 1,
		response = "pdr_crater_wasteland_tree_push",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		pdr_crater_ambush_done = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_ambush_done_01",
				"pdr_crater_ambush_done_02",
				"pdr_crater_ambush_done_03",
				"pdr_crater_ambush_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_ambush_done_01",
				"pdr_crater_ambush_done_02",
				"pdr_crater_ambush_done_03",
				"pdr_crater_ambush_done_04",
			},
			sound_events_duration = {
				3.073979139328,
				3.8379790782928,
				5.2959790229797,
				5.3219790458679,
			},
		},
		pdr_crater_ambush_interactable = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_ambush_interactable_01",
				"pdr_crater_ambush_interactable_02",
				"pdr_crater_ambush_interactable_03",
				"pdr_crater_ambush_interactable_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_ambush_interactable_01",
				"pdr_crater_ambush_interactable_02",
				"pdr_crater_ambush_interactable_03",
				"pdr_crater_ambush_interactable_04",
			},
			sound_events_duration = {
				2.5139791965485,
				3.3099792003632,
				3.1379792690277,
				3.6659791469574,
			},
		},
		pdr_crater_arena_end = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_arena_end_01",
				"pdr_crater_arena_end_02",
				"pdr_crater_arena_end_03",
				"pdr_crater_arena_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_arena_end_01",
				"pdr_crater_arena_end_02",
				"pdr_crater_arena_end_03",
				"pdr_crater_arena_end_04",
			},
			sound_events_duration = {
				3.5239791870117,
				2.7599792480469,
				4.0829792022705,
				2.419979095459,
			},
		},
		pdr_crater_arena_standard = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_arena_standard_01",
				"pdr_crater_arena_standard_02",
				"pdr_crater_arena_standard_03",
				"pdr_crater_arena_standard_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_arena_standard_01",
				"pdr_crater_arena_standard_02",
				"pdr_crater_arena_standard_03",
				"pdr_crater_arena_standard_04",
			},
			sound_events_duration = {
				1.9899791479111,
				1.7909791469574,
				3.5499792098999,
				3.5559792518616,
			},
		},
		pdr_crater_arena_standard_02 = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_arena_standard_02_01",
				"pdr_crater_arena_standard_02_02",
				"pdr_crater_arena_standard_02_03",
				"pdr_crater_arena_standard_02_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_arena_standard_02_01",
				"pdr_crater_arena_standard_02_02",
				"pdr_crater_arena_standard_02_03",
				"pdr_crater_arena_standard_02_04",
			},
			sound_events_duration = {
				3.1899790763855,
				2.2529792785645,
				1.7329791784286,
				2.26597905159,
			},
		},
		pdr_crater_arena_waystone = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_arena_waystone_01",
				"pdr_crater_arena_waystone_02",
				"pdr_crater_arena_waystone_03",
				"pdr_crater_arena_waystone_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_arena_waystone_01",
				"pdr_crater_arena_waystone_02",
				"pdr_crater_arena_waystone_03",
				"pdr_crater_arena_waystone_04",
			},
			sound_events_duration = {
				2.0929791927338,
				3.2609791755676,
				2.1179790496826,
				3.8649792671204,
			},
		},
		pdr_crater_bridge_sighted = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_bridge_sighted_01",
				"pdr_crater_bridge_sighted_02",
				"pdr_crater_bridge_sighted_03",
				"pdr_crater_bridge_sighted_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_bridge_sighted_01",
				"pdr_crater_bridge_sighted_02",
				"pdr_crater_bridge_sighted_03",
				"pdr_crater_bridge_sighted_04",
			},
			sound_events_duration = {
				2.1639790534973,
				3.2589790821075,
				2.908979177475,
				4.3219790458679,
			},
		},
		pdr_crater_climb_top = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_climb_top_01",
				"pdr_crater_climb_top_02",
				"pdr_crater_climb_top_03",
				"pdr_crater_climb_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_climb_top_01",
				"pdr_crater_climb_top_02",
				"pdr_crater_climb_top_03",
				"pdr_crater_climb_top_04",
			},
			sound_events_duration = {
				4.1179790496826,
				3.4689791202545,
				6.1749792098999,
				3.0420000553131,
			},
		},
		pdr_crater_devastation = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_devastation_01",
				"pdr_crater_devastation_02",
				"pdr_crater_devastation_03",
				"pdr_crater_devastation_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_devastation_01",
				"pdr_crater_devastation_02",
				"pdr_crater_devastation_03",
				"pdr_crater_devastation_04",
			},
			sound_events_duration = {
				4.2009792327881,
				2.7179791927338,
				4.0289793014526,
				7.1169791221619,
			},
		},
		pdr_crater_dummy = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_crater",
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
		pdr_crater_forest_ascent_top = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_forest_ascent_top_01",
				"pdr_crater_forest_ascent_top_02",
				"pdr_crater_forest_ascent_top_03",
				"pdr_crater_forest_ascent_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_forest_ascent_top_01",
				"pdr_crater_forest_ascent_top_02",
				"pdr_crater_forest_ascent_top_03",
				"pdr_crater_forest_ascent_top_04",
			},
			sound_events_duration = {
				3.1059792041779,
				3.977979183197,
				3.6469790935516,
				7.9759793281555,
			},
		},
		pdr_crater_intro_banter_a = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				[1] = "pdr_crater_intro_banter_a_01",
				[2] = "pdr_crater_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_crater_intro_banter_a_01",
				[2] = "pdr_crater_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.2429790496826,
				[2] = 4.4479789733887,
			},
		},
		pdr_crater_intro_banter_b = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				[1] = "pdr_crater_intro_banter_b_01",
				[2] = "pdr_crater_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_crater_intro_banter_b_01",
				[2] = "pdr_crater_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.7129793167114,
				[2] = 5.3089790344238,
			},
		},
		pdr_crater_intro_banter_c = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				[1] = "pdr_crater_intro_banter_c_01",
				[2] = "pdr_crater_intro_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_crater_intro_banter_c_01",
				[2] = "pdr_crater_intro_banter_c_02",
			},
			sound_events_duration = {
				[1] = 5.4549789428711,
				[2] = 6.5369791984558,
			},
		},
		pdr_crater_plan_banter_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_crater",
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
				[1] = "pdr_crater_plan_banter_a_01",
				[2] = "pdr_crater_plan_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_crater_plan_banter_a_01",
				[2] = "pdr_crater_plan_banter_a_02",
			},
			sound_events_duration = {
				[1] = 8.7719793319702,
				[2] = 7.915979385376,
			},
		},
		pdr_crater_plan_banter_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_crater",
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
				[1] = "pdr_crater_plan_banter_b_01",
				[2] = "pdr_crater_plan_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_crater_plan_banter_b_01",
				[2] = "pdr_crater_plan_banter_b_02",
			},
			sound_events_duration = {
				[1] = 6.1709790229797,
				[2] = 8.883978843689,
			},
		},
		pdr_crater_plan_banter_c = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_crater",
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
				[1] = "pdr_crater_plan_banter_c_01",
				[2] = "pdr_crater_plan_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_crater_plan_banter_c_01",
				[2] = "pdr_crater_plan_banter_c_02",
			},
			sound_events_duration = {
				[1] = 4.8299789428711,
				[2] = 4.4249792098999,
			},
		},
		pdr_crater_rim_vista = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_rim_vista_01",
				"pdr_crater_rim_vista_02",
				"pdr_crater_rim_vista_03",
				"pdr_crater_rim_vista_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_rim_vista_01",
				"pdr_crater_rim_vista_02",
				"pdr_crater_rim_vista_03",
				"pdr_crater_rim_vista_04",
			},
			sound_events_duration = {
				5.0479793548584,
				4.2009792327881,
				6.7479791641235,
				9.3569793701172,
			},
		},
		pdr_crater_tracking_camp = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_tracking_camp_01",
				"pdr_crater_tracking_camp_02",
				"pdr_crater_tracking_camp_03",
				"pdr_crater_tracking_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_tracking_camp_01",
				"pdr_crater_tracking_camp_02",
				"pdr_crater_tracking_camp_03",
				"pdr_crater_tracking_camp_04",
			},
			sound_events_duration = {
				3.6849792003632,
				3.3289792537689,
				2.9469792842865,
				3.9269790649414,
			},
		},
		pdr_crater_vista_reveal = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_vista_reveal_01",
				"pdr_crater_vista_reveal_02",
				"pdr_crater_vista_reveal_03",
				"pdr_crater_vista_reveal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_vista_reveal_01",
				"pdr_crater_vista_reveal_02",
				"pdr_crater_vista_reveal_03",
				"pdr_crater_vista_reveal_04",
			},
			sound_events_duration = {
				5.1309790611267,
				5.3469791412353,
				4.76797914505,
				7.2249794006348,
			},
		},
		pdr_crater_wasteland_intro = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_wasteland_intro_01",
				"pdr_crater_wasteland_intro_02",
				"pdr_crater_wasteland_intro_03",
				"pdr_crater_wasteland_intro_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_wasteland_intro_01",
				"pdr_crater_wasteland_intro_02",
				"pdr_crater_wasteland_intro_03",
				"pdr_crater_wasteland_intro_04",
			},
			sound_events_duration = {
				6.5819792747498,
				6.8559789657593,
				7.4729790687561,
				9.0969791412353,
			},
		},
		pdr_crater_wasteland_tree_push = {
			category = "level_talk",
			database = "dwarf_ranger_crater",
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
				"pdr_crater_wasteland_tree_push_01",
				"pdr_crater_wasteland_tree_push_02",
				"pdr_crater_wasteland_tree_push_03",
				"pdr_crater_wasteland_tree_push_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_crater_wasteland_tree_push_01",
				"pdr_crater_wasteland_tree_push_02",
				"pdr_crater_wasteland_tree_push_03",
				"pdr_crater_wasteland_tree_push_04",
			},
			sound_events_duration = {
				2.960000038147,
				2.8769791126251,
				2.5909790992737,
				2.5649790763855,
			},
		},
	})
end
