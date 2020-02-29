return function ()
	define_rule({
		name = "pbw_crater_intro_banter_a",
		response = "pbw_crater_intro_banter_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_intro_banter_b",
		response = "pbw_crater_intro_banter_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_intro_banter_c",
		response = "pbw_crater_intro_banter_c",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_tracking_camp",
		response = "pbw_crater_tracking_camp",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_ambush_interactable",
		response = "pbw_crater_ambush_interactable",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_ambush_done",
		response = "pbw_crater_ambush_done",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_forest_ascent_top",
		response = "pbw_crater_forest_ascent_top",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_vista_reveal",
		response = "pbw_crater_vista_reveal",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_wasteland_intro",
		response = "pbw_crater_wasteland_intro",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_devastation",
		response = "pbw_crater_devastation",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_bridge_sighted",
		response = "pbw_crater_bridge_sighted",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_wasteland_tree_push",
		response = "pbw_crater_wasteland_tree_push",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_climb_top",
		response = "pbw_crater_climb_top",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_rim_vista",
		response = "pbw_crater_rim_vista",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_plan_banter_a",
		response = "pbw_crater_plan_banter_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_plan_banter_b",
		response = "pbw_crater_plan_banter_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_plan_banter_c",
		response = "pbw_crater_plan_banter_c",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_arena_standard",
		response = "pbw_crater_arena_standard",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_arena_standard_02",
		response = "pbw_crater_arena_standard_02",
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
				"pbw_crater_arena_standard_02"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_crater_arena_standard_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_crater_arena_standard_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_crater_arena_end",
		response = "pbw_crater_arena_end",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_arena_waystone",
		response = "pbw_crater_arena_waystone",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_crater_dummy",
		response = "pbw_crater_dummy",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		pbw_crater_vista_reveal = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_vista_reveal_01",
				"pbw_crater_vista_reveal_02",
				"pbw_crater_vista_reveal_03",
				"pbw_crater_vista_reveal_04"
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
				5.1139373779297,
				3.8478751182556,
				4.5677914619446,
				3.9777083396912
			},
			localization_strings = {
				"pbw_crater_vista_reveal_01",
				"pbw_crater_vista_reveal_02",
				"pbw_crater_vista_reveal_03",
				"pbw_crater_vista_reveal_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_tracking_camp = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_tracking_camp_01",
				"pbw_crater_tracking_camp_02",
				"pbw_crater_tracking_camp_03",
				"pbw_crater_tracking_camp_04"
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
				2.7245416641235,
				3.823041677475,
				3.8685207366943,
				6.3723125457764
			},
			localization_strings = {
				"pbw_crater_tracking_camp_01",
				"pbw_crater_tracking_camp_02",
				"pbw_crater_tracking_camp_03",
				"pbw_crater_tracking_camp_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_intro_banter_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_crater_intro_banter_c_01",
				[2.0] = "pbw_crater_intro_banter_c_02"
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
				[1.0] = 4.8594999313355,
				[2.0] = 3.8727083206177
			},
			localization_strings = {
				[1.0] = "pbw_crater_intro_banter_c_01",
				[2.0] = "pbw_crater_intro_banter_c_02"
			},
			randomize_indexes = {}
		},
		pbw_crater_devastation = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_devastation_01",
				"pbw_crater_devastation_02",
				"pbw_crater_devastation_03",
				"pbw_crater_devastation_04"
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
				5.4934167861939,
				5.7545623779297,
				4.9308958053589,
				5.2421040534973
			},
			localization_strings = {
				"pbw_crater_devastation_01",
				"pbw_crater_devastation_02",
				"pbw_crater_devastation_03",
				"pbw_crater_devastation_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_arena_standard_02 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_arena_standard_02_01",
				"pbw_crater_arena_standard_02_02",
				"pbw_crater_arena_standard_02_03",
				"pbw_crater_arena_standard_02_04"
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
				1.231124997139,
				1.5722082853317,
				2.5291042327881,
				1.9712291955948
			},
			localization_strings = {
				"pbw_crater_arena_standard_02_01",
				"pbw_crater_arena_standard_02_02",
				"pbw_crater_arena_standard_02_03",
				"pbw_crater_arena_standard_02_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_bridge_sighted = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_bridge_sighted_01",
				"pbw_crater_bridge_sighted_02",
				"pbw_crater_bridge_sighted_03",
				"pbw_crater_bridge_sighted_04"
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
				1.9932291507721,
				3.0271458625794,
				2.3225834369659,
				3.2010834217072
			},
			localization_strings = {
				"pbw_crater_bridge_sighted_01",
				"pbw_crater_bridge_sighted_02",
				"pbw_crater_bridge_sighted_03",
				"pbw_crater_bridge_sighted_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_plan_banter_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_crater_plan_banter_b_01",
				[2.0] = "pbw_crater_plan_banter_b_02"
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
				[1.0] = 8.0206670761108,
				[2.0] = 10.904479026794
			},
			localization_strings = {
				[1.0] = "pbw_crater_plan_banter_b_01",
				[2.0] = "pbw_crater_plan_banter_b_02"
			},
			randomize_indexes = {}
		},
		pbw_crater_intro_banter_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_crater_intro_banter_a_01",
				[2.0] = "pbw_crater_intro_banter_a_02"
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
				[1.0] = 3.4750626087189,
				[2.0] = 4.8452706336975
			},
			localization_strings = {
				[1.0] = "pbw_crater_intro_banter_a_01",
				[2.0] = "pbw_crater_intro_banter_a_02"
			},
			randomize_indexes = {}
		},
		pbw_crater_wasteland_intro = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_wasteland_intro_01",
				"pbw_crater_wasteland_intro_02",
				"pbw_crater_wasteland_intro_03",
				"pbw_crater_wasteland_intro_04"
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
				5.0499167442322,
				8.3950834274292,
				8.9057292938232,
				10.158708572388
			},
			localization_strings = {
				"pbw_crater_wasteland_intro_01",
				"pbw_crater_wasteland_intro_02",
				"pbw_crater_wasteland_intro_03",
				"pbw_crater_wasteland_intro_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_intro_banter_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_crater_intro_banter_b_01",
				[2.0] = "pbw_crater_intro_banter_b_02"
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
				[1.0] = 7.7950210571289,
				[2.0] = 5.5545835494995
			},
			localization_strings = {
				[1.0] = "pbw_crater_intro_banter_b_01",
				[2.0] = "pbw_crater_intro_banter_b_02"
			},
			randomize_indexes = {}
		},
		pbw_crater_plan_banter_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_crater_plan_banter_c_01",
				[2.0] = "pbw_crater_plan_banter_c_02"
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
				[1.0] = 5.4302501678467,
				[2.0] = 6.662145614624
			},
			localization_strings = {
				[1.0] = "pbw_crater_plan_banter_c_01",
				[2.0] = "pbw_crater_plan_banter_c_02"
			},
			randomize_indexes = {}
		},
		pbw_crater_forest_ascent_top = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_forest_ascent_top_01",
				"pbw_crater_forest_ascent_top_02",
				"pbw_crater_forest_ascent_top_03",
				"pbw_crater_forest_ascent_top_04"
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
				4.3830418586731,
				2.8889999389648,
				6.0705208778381,
				4.9525833129883
			},
			localization_strings = {
				"pbw_crater_forest_ascent_top_01",
				"pbw_crater_forest_ascent_top_02",
				"pbw_crater_forest_ascent_top_03",
				"pbw_crater_forest_ascent_top_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_ambush_done = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_ambush_done_01",
				"pbw_crater_ambush_done_02",
				"pbw_crater_ambush_done_03",
				"pbw_crater_ambush_done_04"
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
				3.7722084522247,
				6.165958404541,
				4.9608335494995,
				4.5233540534973
			},
			localization_strings = {
				"pbw_crater_ambush_done_01",
				"pbw_crater_ambush_done_02",
				"pbw_crater_ambush_done_03",
				"pbw_crater_ambush_done_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_plan_banter_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_crater_plan_banter_a_01",
				[2.0] = "pbw_crater_plan_banter_a_02"
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
				[1.0] = 9.9491662979126,
				[2.0] = 6.7294998168945
			},
			localization_strings = {
				[1.0] = "pbw_crater_plan_banter_a_01",
				[2.0] = "pbw_crater_plan_banter_a_02"
			},
			randomize_indexes = {}
		},
		pbw_crater_climb_top = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_climb_top_01",
				"pbw_crater_climb_top_02",
				"pbw_crater_climb_top_03",
				"pbw_crater_climb_top_04"
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
				3.5167291164398,
				4.069833278656,
				4.2412710189819,
				4.9009790420532
			},
			localization_strings = {
				"pbw_crater_climb_top_01",
				"pbw_crater_climb_top_02",
				"pbw_crater_climb_top_03",
				"pbw_crater_climb_top_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_dummy = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_crater",
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
		pbw_crater_arena_waystone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_arena_waystone_01",
				"pbw_crater_arena_waystone_02",
				"pbw_crater_arena_waystone_03",
				"pbw_crater_arena_waystone_04"
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
				2.8707916736603,
				4.1665415763855,
				2.8264999389648,
				5.4520206451416
			},
			localization_strings = {
				"pbw_crater_arena_waystone_01",
				"pbw_crater_arena_waystone_02",
				"pbw_crater_arena_waystone_03",
				"pbw_crater_arena_waystone_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_arena_end = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_arena_end_01",
				"pbw_crater_arena_end_02",
				"pbw_crater_arena_end_03",
				"pbw_crater_arena_end_04"
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
				7.0056042671204,
				5.1786041259766,
				4.9877710342407,
				3.4089584350586
			},
			localization_strings = {
				"pbw_crater_arena_end_01",
				"pbw_crater_arena_end_02",
				"pbw_crater_arena_end_03",
				"pbw_crater_arena_end_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_arena_standard = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_arena_standard_01",
				"pbw_crater_arena_standard_02",
				"pbw_crater_arena_standard_03",
				"pbw_crater_arena_standard_04"
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
				3.9171667098999,
				2.0678334236145,
				3.2690625190735,
				3.168687582016
			},
			localization_strings = {
				"pbw_crater_arena_standard_01",
				"pbw_crater_arena_standard_02",
				"pbw_crater_arena_standard_03",
				"pbw_crater_arena_standard_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_ambush_interactable = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_ambush_interactable_01",
				"pbw_crater_ambush_interactable_02",
				"pbw_crater_ambush_interactable_03",
				"pbw_crater_ambush_interactable_04"
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
				3.4668126106262,
				5.8897290229797,
				2.1873750686645,
				5.7532501220703
			},
			localization_strings = {
				"pbw_crater_ambush_interactable_01",
				"pbw_crater_ambush_interactable_02",
				"pbw_crater_ambush_interactable_03",
				"pbw_crater_ambush_interactable_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_rim_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_rim_vista_01",
				"pbw_crater_rim_vista_02",
				"pbw_crater_rim_vista_03",
				"pbw_crater_rim_vista_04"
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
				5.6513748168945,
				6.1530418395996,
				8.2454586029053,
				6.309645652771
			},
			localization_strings = {
				"pbw_crater_rim_vista_01",
				"pbw_crater_rim_vista_02",
				"pbw_crater_rim_vista_03",
				"pbw_crater_rim_vista_04"
			},
			randomize_indexes = {}
		},
		pbw_crater_wasteland_tree_push = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_crater",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crater_wasteland_tree_push_01",
				"pbw_crater_wasteland_tree_push_02",
				"pbw_crater_wasteland_tree_push_03",
				"pbw_crater_wasteland_tree_push_04"
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
				1.4336249828339,
				1.5668749809265,
				3.2131042480469,
				2.8881874084473
			},
			localization_strings = {
				"pbw_crater_wasteland_tree_push_01",
				"pbw_crater_wasteland_tree_push_02",
				"pbw_crater_wasteland_tree_push_03",
				"pbw_crater_wasteland_tree_push_04"
			},
			randomize_indexes = {}
		}
	})
end
