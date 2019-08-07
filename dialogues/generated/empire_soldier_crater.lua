return function ()
	define_rule({
		name = "pes_crater_intro_banter_a",
		response = "pes_crater_intro_banter_a",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_intro_banter_b",
		response = "pes_crater_intro_banter_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_intro_banter_c",
		response = "pes_crater_intro_banter_c",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_tracking_camp",
		response = "pes_crater_tracking_camp",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_ambush_interactable",
		response = "pes_crater_ambush_interactable",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_ambush_done",
		response = "pes_crater_ambush_done",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_forest_ascent_top",
		response = "pes_crater_forest_ascent_top",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_vista_reveal",
		response = "pes_crater_vista_reveal",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_wasteland_intro",
		response = "pes_crater_wasteland_intro",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_devastation",
		response = "pes_crater_devastation",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_bridge_sighted",
		response = "pes_crater_bridge_sighted",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_wasteland_tree_push",
		response = "pes_crater_wasteland_tree_push",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_climb_top",
		response = "pes_crater_climb_top",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_rim_vista",
		response = "pes_crater_rim_vista",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_plan_banter_a",
		response = "pes_crater_plan_banter_a",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_plan_banter_b",
		response = "pes_crater_plan_banter_b",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_plan_banter_c",
		response = "pes_crater_plan_banter_c",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_arena_standard",
		response = "pes_crater_arena_standard",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_arena_standard_02",
		response = "pes_crater_arena_standard_02",
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
				"pes_crater_arena_standard_02"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_crater_arena_standard_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_crater_arena_standard_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_crater_arena_end",
		response = "pes_crater_arena_end",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_arena_waystone",
		response = "pes_crater_arena_waystone",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_crater_dummy",
		response = "pes_crater_dummy",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		pes_crater_plan_banter_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_crater",
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_crater_plan_banter_b_01",
				[2.0] = "pes_crater_plan_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_plan_banter_b_01",
				[2.0] = "pes_crater_plan_banter_b_02"
			},
			randomize_indexes = {}
		},
		pes_crater_wasteland_tree_push = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_wasteland_tree_push_01",
				"pes_crater_wasteland_tree_push_02",
				"pes_crater_wasteland_tree_push_03",
				"pes_crater_wasteland_tree_push_04"
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
			localization_strings = {
				"pes_crater_wasteland_tree_push_01",
				"pes_crater_wasteland_tree_push_02",
				"pes_crater_wasteland_tree_push_03",
				"pes_crater_wasteland_tree_push_04"
			},
			randomize_indexes = {}
		},
		pes_crater_ambush_interactable = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_ambush_interactable_01",
				"pes_crater_ambush_interactable_02",
				"pes_crater_ambush_interactable_03",
				"pes_crater_ambush_interactable_04"
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
			localization_strings = {
				"pes_crater_ambush_interactable_01",
				"pes_crater_ambush_interactable_02",
				"pes_crater_ambush_interactable_03",
				"pes_crater_ambush_interactable_04"
			},
			randomize_indexes = {}
		},
		pes_crater_intro_banter_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_crater_intro_banter_b_01",
				[2.0] = "pes_crater_intro_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_intro_banter_b_01",
				[2.0] = "pes_crater_intro_banter_b_02"
			},
			randomize_indexes = {}
		},
		pes_crater_intro_banter_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_crater_intro_banter_a_01",
				[2.0] = "pes_crater_intro_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_intro_banter_a_01",
				[2.0] = "pes_crater_intro_banter_a_02"
			},
			randomize_indexes = {}
		},
		pes_crater_vista_reveal = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_vista_reveal_01",
				"pes_crater_vista_reveal_02",
				"pes_crater_vista_reveal_03",
				"pes_crater_vista_reveal_04"
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
			localization_strings = {
				"pes_crater_vista_reveal_01",
				"pes_crater_vista_reveal_02",
				"pes_crater_vista_reveal_03",
				"pes_crater_vista_reveal_04"
			},
			randomize_indexes = {}
		},
		pes_crater_climb_top = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_climb_top_01",
				"pes_crater_climb_top_02",
				"pes_crater_climb_top_03",
				"pes_crater_climb_top_04"
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
			localization_strings = {
				"pes_crater_climb_top_01",
				"pes_crater_climb_top_02",
				"pes_crater_climb_top_03",
				"pes_crater_climb_top_04"
			},
			randomize_indexes = {}
		},
		pes_crater_arena_waystone = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_arena_waystone_01",
				"pes_crater_arena_waystone_02",
				"pes_crater_arena_waystone_03",
				"pes_crater_arena_waystone_04"
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
			localization_strings = {
				"pes_crater_arena_waystone_01",
				"pes_crater_arena_waystone_02",
				"pes_crater_arena_waystone_03",
				"pes_crater_arena_waystone_04"
			},
			randomize_indexes = {}
		},
		pes_crater_wasteland_intro = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_wasteland_intro_01",
				"pes_crater_wasteland_intro_02",
				"pes_crater_wasteland_intro_03",
				"pes_crater_wasteland_intro_04"
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
			localization_strings = {
				"pes_crater_wasteland_intro_01",
				"pes_crater_wasteland_intro_02",
				"pes_crater_wasteland_intro_03",
				"pes_crater_wasteland_intro_04"
			},
			randomize_indexes = {}
		},
		pes_crater_arena_end = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_arena_end_01",
				"pes_crater_arena_end_02",
				"pes_crater_arena_end_03",
				"pes_crater_arena_end_04"
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
			localization_strings = {
				"pes_crater_arena_end_01",
				"pes_crater_arena_end_02",
				"pes_crater_arena_end_03",
				"pes_crater_arena_end_04"
			},
			randomize_indexes = {}
		},
		pes_crater_arena_standard_02 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_arena_standard_02_01",
				"pes_crater_arena_standard_02_02",
				"pes_crater_arena_standard_02_03",
				"pes_crater_arena_standard_02_04"
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
			localization_strings = {
				"pes_crater_arena_standard_02_01",
				"pes_crater_arena_standard_02_02",
				"pes_crater_arena_standard_02_03",
				"pes_crater_arena_standard_02_04"
			},
			randomize_indexes = {}
		},
		pes_crater_tracking_camp = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_tracking_camp_01",
				"pes_crater_tracking_camp_02",
				"pes_crater_tracking_camp_03",
				"pes_crater_tracking_camp_04"
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
			localization_strings = {
				"pes_crater_tracking_camp_01",
				"pes_crater_tracking_camp_02",
				"pes_crater_tracking_camp_03",
				"pes_crater_tracking_camp_04"
			},
			randomize_indexes = {}
		},
		pes_crater_bridge_sighted = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_bridge_sighted_01",
				"pes_crater_bridge_sighted_02",
				"pes_crater_bridge_sighted_03",
				"pes_crater_bridge_sighted_04"
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
			localization_strings = {
				"pes_crater_bridge_sighted_01",
				"pes_crater_bridge_sighted_02",
				"pes_crater_bridge_sighted_03",
				"pes_crater_bridge_sighted_04"
			},
			randomize_indexes = {}
		},
		pes_crater_intro_banter_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_crater_intro_banter_c_01",
				[2.0] = "pes_crater_intro_banter_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_intro_banter_c_01",
				[2.0] = "pes_crater_intro_banter_c_02"
			},
			randomize_indexes = {}
		},
		pes_crater_forest_ascent_top = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_forest_ascent_top_01",
				"pes_crater_forest_ascent_top_02",
				"pes_crater_forest_ascent_top_03",
				"pes_crater_forest_ascent_top_04"
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
			localization_strings = {
				"pes_crater_forest_ascent_top_01",
				"pes_crater_forest_ascent_top_02",
				"pes_crater_forest_ascent_top_03",
				"pes_crater_forest_ascent_top_04"
			},
			randomize_indexes = {}
		},
		pes_crater_devastation = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_devastation_01",
				"pes_crater_devastation_02",
				"pes_crater_devastation_03",
				"pes_crater_devastation_04"
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
			localization_strings = {
				"pes_crater_devastation_01",
				"pes_crater_devastation_02",
				"pes_crater_devastation_03",
				"pes_crater_devastation_04"
			},
			randomize_indexes = {}
		},
		pes_crater_plan_banter_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_crater",
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_crater_plan_banter_c_01",
				[2.0] = "pes_crater_plan_banter_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_plan_banter_c_01",
				[2.0] = "pes_crater_plan_banter_c_02"
			},
			randomize_indexes = {}
		},
		pes_crater_ambush_done = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_ambush_done_01",
				"pes_crater_ambush_done_02",
				"pes_crater_ambush_done_03",
				"pes_crater_ambush_done_04"
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
			localization_strings = {
				"pes_crater_ambush_done_01",
				"pes_crater_ambush_done_02",
				"pes_crater_ambush_done_03",
				"pes_crater_ambush_done_04"
			},
			randomize_indexes = {}
		},
		pes_crater_plan_banter_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_crater",
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_crater_plan_banter_a_01",
				[2.0] = "pes_crater_plan_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_plan_banter_a_01",
				[2.0] = "pes_crater_plan_banter_a_02"
			},
			randomize_indexes = {}
		},
		pes_crater_dummy = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_crater",
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
			localization_strings = {
				[1.0] = "dummy"
			}
		},
		pes_crater_arena_standard = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_arena_standard_01",
				"pes_crater_arena_standard_02",
				"pes_crater_arena_standard_03",
				"pes_crater_arena_standard_04"
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
			localization_strings = {
				"pes_crater_arena_standard_01",
				"pes_crater_arena_standard_02",
				"pes_crater_arena_standard_03",
				"pes_crater_arena_standard_04"
			},
			randomize_indexes = {}
		},
		pes_crater_rim_vista = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_crater",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_crater_rim_vista_01",
				"pes_crater_rim_vista_02",
				"pes_crater_rim_vista_03",
				"pes_crater_rim_vista_04"
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
			localization_strings = {
				"pes_crater_rim_vista_01",
				"pes_crater_rim_vista_02",
				"pes_crater_rim_vista_03",
				"pes_crater_rim_vista_04"
			},
			randomize_indexes = {}
		}
	})
end
