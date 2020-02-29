return function ()
	define_rule({
		name = "pdr_crater_intro_banter_a",
		response = "pdr_crater_intro_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_intro_banter_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_intro_banter_b",
		response = "pdr_crater_intro_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"crater_intro_banter_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_intro_banter_c",
		response = "pdr_crater_intro_banter_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"crater_intro_banter_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_intro_banter_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_intro_banter_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_tracking_camp",
		response = "pdr_crater_tracking_camp",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_tracking_camp"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_tracking_camp",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_tracking_camp",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_ambush_interactable",
		response = "pdr_crater_ambush_interactable",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_ambush_interactable"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_ambush_interactable",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_ambush_interactable",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_ambush_done",
		response = "pdr_crater_ambush_done",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_ambush_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_ambush_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_ambush_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_forest_ascent_top",
		response = "pdr_crater_forest_ascent_top",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_forest_ascent_top"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_forest_ascent_top",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_forest_ascent_top",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_vista_reveal",
		response = "pdr_crater_vista_reveal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_vista_reveal"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_vista_reveal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_vista_reveal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_wasteland_intro",
		response = "pdr_crater_wasteland_intro",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"crater_vista_reveal"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_wasteland_intro",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_wasteland_intro",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_devastation",
		response = "pdr_crater_devastation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_devastation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_devastation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_devastation",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_bridge_sighted",
		response = "pdr_crater_bridge_sighted",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_bridge_sighted"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_bridge_sighted",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_bridge_sighted",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_wasteland_tree_push",
		response = "pdr_crater_wasteland_tree_push",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_wasteland_tree_push"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_wasteland_tree_push",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_wasteland_tree_push",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_climb_top",
		response = "pdr_crater_climb_top",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_climb_top"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_climb_top",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_climb_top",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_rim_vista",
		response = "pdr_crater_rim_vista",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_rim_vista"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_rim_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_rim_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_plan_banter_a",
		response = "pdr_crater_plan_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_plan_banter_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_plan_banter_b",
		response = "pdr_crater_plan_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"crater_plan_banter_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_plan_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_plan_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_plan_banter_c",
		response = "pdr_crater_plan_banter_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"crater_plan_banter_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_plan_banter_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_plan_banter_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_arena_standard",
		response = "pdr_crater_arena_standard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_arena_standard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_arena_standard",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_arena_standard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_arena_standard_02",
		response = "pdr_crater_arena_standard_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pdr_crater_arena_standard_02"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pdr_crater_arena_standard_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_crater_arena_standard_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_arena_end",
		response = "pdr_crater_arena_end",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_arena_end"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_arena_end",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_arena_end",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_arena_waystone",
		response = "pdr_crater_arena_waystone",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_arena_waystone"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_arena_waystone",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_arena_waystone",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_crater_dummy",
		response = "pdr_crater_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"crater_dummy"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"crater_dummy",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pdr_crater_vista_reveal = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_vista_reveal_01",
				"pdr_crater_vista_reveal_02",
				"pdr_crater_vista_reveal_03",
				"pdr_crater_vista_reveal_04"
			},
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
			sound_events_duration = {
				5.1310625076294,
				5.3475208282471,
				4.7682085037231,
				7.2255206108093
			},
			localization_strings = {
				"pdr_crater_vista_reveal_01",
				"pdr_crater_vista_reveal_02",
				"pdr_crater_vista_reveal_03",
				"pdr_crater_vista_reveal_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_forest_ascent_top = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_forest_ascent_top_01",
				"pdr_crater_forest_ascent_top_02",
				"pdr_crater_forest_ascent_top_03",
				"pdr_crater_forest_ascent_top_04"
			},
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
			sound_events_duration = {
				3.1066665649414,
				3.978812456131,
				3.6477708816528,
				7.9767293930054
			},
			localization_strings = {
				"pdr_crater_forest_ascent_top_01",
				"pdr_crater_forest_ascent_top_02",
				"pdr_crater_forest_ascent_top_03",
				"pdr_crater_forest_ascent_top_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_wasteland_tree_push = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_wasteland_tree_push_01",
				"pdr_crater_wasteland_tree_push_02",
				"pdr_crater_wasteland_tree_push_03",
				"pdr_crater_wasteland_tree_push_04"
			},
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
			sound_events_duration = {
				2.9602291584015,
				2.8774790763855,
				2.5910000801086,
				2.5655417442322
			},
			localization_strings = {
				"pdr_crater_wasteland_tree_push_01",
				"pdr_crater_wasteland_tree_push_02",
				"pdr_crater_wasteland_tree_push_03",
				"pdr_crater_wasteland_tree_push_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_intro_banter_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crater_intro_banter_a_01",
				[2.0] = "pdr_crater_intro_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.2431666851044,
				[2.0] = 4.4480834007263
			},
			localization_strings = {
				[1.0] = "pdr_crater_intro_banter_a_01",
				[2.0] = "pdr_crater_intro_banter_a_02"
			},
			randomize_indexes = {}
		},
		pdr_crater_arena_standard_02 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_arena_standard_02_01",
				"pdr_crater_arena_standard_02_02",
				"pdr_crater_arena_standard_02_03",
				"pdr_crater_arena_standard_02_04"
			},
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
			sound_events_duration = {
				3.1909582614899,
				2.2535834312439,
				1.7335208654404,
				2.2664165496826
			},
			localization_strings = {
				"pdr_crater_arena_standard_02_01",
				"pdr_crater_arena_standard_02_02",
				"pdr_crater_arena_standard_02_03",
				"pdr_crater_arena_standard_02_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_arena_standard = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_arena_standard_01",
				"pdr_crater_arena_standard_02",
				"pdr_crater_arena_standard_03",
				"pdr_crater_arena_standard_04"
			},
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
			sound_events_duration = {
				1.990354180336,
				1.791312456131,
				3.5505208969116,
				3.556937456131
			},
			localization_strings = {
				"pdr_crater_arena_standard_01",
				"pdr_crater_arena_standard_02",
				"pdr_crater_arena_standard_03",
				"pdr_crater_arena_standard_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_arena_waystone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_arena_waystone_01",
				"pdr_crater_arena_waystone_02",
				"pdr_crater_arena_waystone_03",
				"pdr_crater_arena_waystone_04"
			},
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
			sound_events_duration = {
				2.0930624008179,
				3.2615833282471,
				2.1187500953674,
				3.8651041984558
			},
			localization_strings = {
				"pdr_crater_arena_waystone_01",
				"pdr_crater_arena_waystone_02",
				"pdr_crater_arena_waystone_03",
				"pdr_crater_arena_waystone_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_bridge_sighted = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_bridge_sighted_01",
				"pdr_crater_bridge_sighted_02",
				"pdr_crater_bridge_sighted_03",
				"pdr_crater_bridge_sighted_04"
			},
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
			sound_events_duration = {
				2.1644792556763,
				3.2594583034515,
				2.9092917442322,
				4.3225831985474
			},
			localization_strings = {
				"pdr_crater_bridge_sighted_01",
				"pdr_crater_bridge_sighted_02",
				"pdr_crater_bridge_sighted_03",
				"pdr_crater_bridge_sighted_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_climb_top = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_climb_top_01",
				"pdr_crater_climb_top_02",
				"pdr_crater_climb_top_03",
				"pdr_crater_climb_top_04"
			},
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
			sound_events_duration = {
				4.1188750267029,
				3.4695208072662,
				6.1751041412353,
				3.0429792404175
			},
			localization_strings = {
				"pdr_crater_climb_top_01",
				"pdr_crater_climb_top_02",
				"pdr_crater_climb_top_03",
				"pdr_crater_climb_top_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_devastation = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_devastation_01",
				"pdr_crater_devastation_02",
				"pdr_crater_devastation_03",
				"pdr_crater_devastation_04"
			},
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
			sound_events_duration = {
				4.2016248703003,
				2.7183332443237,
				4.0297293663025,
				7.1173124313355
			},
			localization_strings = {
				"pdr_crater_devastation_01",
				"pdr_crater_devastation_02",
				"pdr_crater_devastation_03",
				"pdr_crater_devastation_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_plan_banter_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crater_plan_banter_a_01",
				[2.0] = "pdr_crater_plan_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.7723121643066,
				[2.0] = 7.9164791107178
			},
			localization_strings = {
				[1.0] = "pdr_crater_plan_banter_a_01",
				[2.0] = "pdr_crater_plan_banter_a_02"
			},
			randomize_indexes = {}
		},
		pdr_crater_plan_banter_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crater_plan_banter_c_01",
				[2.0] = "pdr_crater_plan_banter_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.830979347229,
				[2.0] = 4.4255623817444
			},
			localization_strings = {
				[1.0] = "pdr_crater_plan_banter_c_01",
				[2.0] = "pdr_crater_plan_banter_c_02"
			},
			randomize_indexes = {}
		},
		pdr_crater_dummy = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_crater",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "dummy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			},
			localization_strings = {
				[1.0] = "dummy"
			}
		},
		pdr_crater_arena_end = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_arena_end_01",
				"pdr_crater_arena_end_02",
				"pdr_crater_arena_end_03",
				"pdr_crater_arena_end_04"
			},
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
			sound_events_duration = {
				3.5248334407806,
				2.7607917785645,
				4.0834164619446,
				2.4205000400543
			},
			localization_strings = {
				"pdr_crater_arena_end_01",
				"pdr_crater_arena_end_02",
				"pdr_crater_arena_end_03",
				"pdr_crater_arena_end_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_ambush_done = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_ambush_done_01",
				"pdr_crater_ambush_done_02",
				"pdr_crater_ambush_done_03",
				"pdr_crater_ambush_done_04"
			},
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
			sound_events_duration = {
				3.0748333930969,
				3.8387498855591,
				5.2966041564941,
				5.3220624923706
			},
			localization_strings = {
				"pdr_crater_ambush_done_01",
				"pdr_crater_ambush_done_02",
				"pdr_crater_ambush_done_03",
				"pdr_crater_ambush_done_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_rim_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_rim_vista_01",
				"pdr_crater_rim_vista_02",
				"pdr_crater_rim_vista_03",
				"pdr_crater_rim_vista_04"
			},
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
			sound_events_duration = {
				5.0483331680298,
				4.2016248703003,
				6.7480626106262,
				9.3578748703003
			},
			localization_strings = {
				"pdr_crater_rim_vista_01",
				"pdr_crater_rim_vista_02",
				"pdr_crater_rim_vista_03",
				"pdr_crater_rim_vista_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_wasteland_intro = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_wasteland_intro_01",
				"pdr_crater_wasteland_intro_02",
				"pdr_crater_wasteland_intro_03",
				"pdr_crater_wasteland_intro_04"
			},
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
			sound_events_duration = {
				6.5825414657593,
				6.8562917709351,
				7.4737915992737,
				9.0971460342407
			},
			localization_strings = {
				"pdr_crater_wasteland_intro_01",
				"pdr_crater_wasteland_intro_02",
				"pdr_crater_wasteland_intro_03",
				"pdr_crater_wasteland_intro_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_plan_banter_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crater_plan_banter_b_01",
				[2.0] = "pdr_crater_plan_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.1710209846497,
				[2.0] = 8.8849372863769
			},
			localization_strings = {
				[1.0] = "pdr_crater_plan_banter_b_01",
				[2.0] = "pdr_crater_plan_banter_b_02"
			},
			randomize_indexes = {}
		},
		pdr_crater_ambush_interactable = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_ambush_interactable_01",
				"pdr_crater_ambush_interactable_02",
				"pdr_crater_ambush_interactable_03",
				"pdr_crater_ambush_interactable_04"
			},
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
			sound_events_duration = {
				2.5146040916443,
				3.3103749752045,
				3.1384999752045,
				3.6668541431427
			},
			localization_strings = {
				"pdr_crater_ambush_interactable_01",
				"pdr_crater_ambush_interactable_02",
				"pdr_crater_ambush_interactable_03",
				"pdr_crater_ambush_interactable_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_intro_banter_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crater_intro_banter_c_01",
				[2.0] = "pdr_crater_intro_banter_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.4557499885559,
				[2.0] = 6.5379791259766
			},
			localization_strings = {
				[1.0] = "pdr_crater_intro_banter_c_01",
				[2.0] = "pdr_crater_intro_banter_c_02"
			},
			randomize_indexes = {}
		},
		pdr_crater_tracking_camp = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_crater_tracking_camp_01",
				"pdr_crater_tracking_camp_02",
				"pdr_crater_tracking_camp_03",
				"pdr_crater_tracking_camp_04"
			},
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
			sound_events_duration = {
				3.6859583854675,
				3.3294792175293,
				2.9474999904633,
				3.9278750419617
			},
			localization_strings = {
				"pdr_crater_tracking_camp_01",
				"pdr_crater_tracking_camp_02",
				"pdr_crater_tracking_camp_03",
				"pdr_crater_tracking_camp_04"
			},
			randomize_indexes = {}
		},
		pdr_crater_intro_banter_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "dwarf_ranger_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_crater_intro_banter_b_01",
				[2.0] = "pdr_crater_intro_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.7139167785644,
				[2.0] = 5.3093123435974
			},
			localization_strings = {
				[1.0] = "pdr_crater_intro_banter_b_01",
				[2.0] = "pdr_crater_intro_banter_b_02"
			},
			randomize_indexes = {}
		}
	})
end
