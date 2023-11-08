return function ()
	define_rule({
		name = "pwe_crater_ambush_done",
		response = "pwe_crater_ambush_done",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_ambush_interactable",
		response = "pwe_crater_ambush_interactable",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_arena_end",
		response = "pwe_crater_arena_end",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_arena_standard",
		response = "pwe_crater_arena_standard",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_arena_standard_02",
		response = "pwe_crater_arena_standard_02",
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
				"pwe_crater_arena_standard_02"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwe_crater_arena_standard_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_crater_arena_standard_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_crater_arena_waystone",
		response = "pwe_crater_arena_waystone",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_bridge_sighted",
		response = "pwe_crater_bridge_sighted",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_climb_top",
		response = "pwe_crater_climb_top",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_devastation",
		response = "pwe_crater_devastation",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_dummy",
		response = "pwe_crater_dummy",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
	define_rule({
		name = "pwe_crater_forest_ascent_top",
		response = "pwe_crater_forest_ascent_top",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_intro_banter_a",
		response = "pwe_crater_intro_banter_a",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_intro_banter_b",
		response = "pwe_crater_intro_banter_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_intro_banter_c",
		response = "pwe_crater_intro_banter_c",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_plan_banter_a",
		response = "pwe_crater_plan_banter_a",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_plan_banter_b",
		response = "pwe_crater_plan_banter_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_plan_banter_c",
		response = "pwe_crater_plan_banter_c",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_rim_vista",
		response = "pwe_crater_rim_vista",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_tracking_camp",
		response = "pwe_crater_tracking_camp",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_vista_reveal",
		response = "pwe_crater_vista_reveal",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_wasteland_intro",
		response = "pwe_crater_wasteland_intro",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_crater_wasteland_tree_push",
		response = "pwe_crater_wasteland_tree_push",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
	add_dialogues({
		pwe_crater_ambush_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
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
				"pwe_crater_ambush_done_01",
				"pwe_crater_ambush_done_02",
				"pwe_crater_ambush_done_03",
				"pwe_crater_ambush_done_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_ambush_done_01",
				"pwe_crater_ambush_done_02",
				"pwe_crater_ambush_done_03",
				"pwe_crater_ambush_done_04"
			},
			sound_events_duration = {
				5.6938123703003,
				4.824458360672,
				2.6583125591278,
				5.792603969574
			}
		},
		pwe_crater_ambush_interactable = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_ambush_interactable_01",
				"pwe_crater_ambush_interactable_02",
				"pwe_crater_ambush_interactable_03",
				"pwe_crater_ambush_interactable_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_ambush_interactable_01",
				"pwe_crater_ambush_interactable_02",
				"pwe_crater_ambush_interactable_03",
				"pwe_crater_ambush_interactable_04"
			},
			sound_events_duration = {
				4.9124999046326,
				2.5774791240692,
				3.2869582176209,
				4.7418541908264
			}
		},
		pwe_crater_arena_end = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_arena_end_01",
				"pwe_crater_arena_end_02",
				"pwe_crater_arena_end_03",
				"pwe_crater_arena_end_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_arena_end_01",
				"pwe_crater_arena_end_02",
				"pwe_crater_arena_end_03",
				"pwe_crater_arena_end_04"
			},
			sound_events_duration = {
				3.3742916584015,
				3.7829999923706,
				5.7635626792908,
				4.7051458358765
			}
		},
		pwe_crater_arena_standard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_arena_standard_01",
				"pwe_crater_arena_standard_02",
				"pwe_crater_arena_standard_03",
				"pwe_crater_arena_standard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_arena_standard_01",
				"pwe_crater_arena_standard_02",
				"pwe_crater_arena_standard_03",
				"pwe_crater_arena_standard_04"
			},
			sound_events_duration = {
				2.157562494278,
				2.2855000495911,
				3.7975416183472,
				2.8437917232513
			}
		},
		pwe_crater_arena_standard_02 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_arena_standard_02_01",
				"pwe_crater_arena_standard_02_02",
				"pwe_crater_arena_standard_02_03",
				"pwe_crater_arena_standard_02_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_arena_standard_02_01",
				"pwe_crater_arena_standard_02_02",
				"pwe_crater_arena_standard_02_03",
				"pwe_crater_arena_standard_02_04"
			},
			sound_events_duration = {
				2.4475209116936,
				3.2508957386017,
				3.6056249141693,
				2.9368333816528
			}
		},
		pwe_crater_arena_waystone = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_arena_waystone_01",
				"pwe_crater_arena_waystone_02",
				"pwe_crater_arena_waystone_03",
				"pwe_crater_arena_waystone_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_arena_waystone_01",
				"pwe_crater_arena_waystone_02",
				"pwe_crater_arena_waystone_03",
				"pwe_crater_arena_waystone_04"
			},
			sound_events_duration = {
				2.9656040668488,
				3.9042916297913,
				3.0579894781113,
				3.133270740509
			}
		},
		pwe_crater_bridge_sighted = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_bridge_sighted_01",
				"pwe_crater_bridge_sighted_02",
				"pwe_crater_bridge_sighted_03",
				"pwe_crater_bridge_sighted_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_bridge_sighted_01",
				"pwe_crater_bridge_sighted_02",
				"pwe_crater_bridge_sighted_03",
				"pwe_crater_bridge_sighted_04"
			},
			sound_events_duration = {
				2.4748749732971,
				2.7449374198914,
				3.5474584102631,
				2.9546666145325
			}
		},
		pwe_crater_climb_top = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_climb_top_01",
				"pwe_crater_climb_top_02",
				"pwe_crater_climb_top_03",
				"pwe_crater_climb_top_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_climb_top_01",
				"pwe_crater_climb_top_02",
				"pwe_crater_climb_top_03",
				"pwe_crater_climb_top_04"
			},
			sound_events_duration = {
				4.5689373016357,
				4.9881043434143,
				5.8683333396912,
				4.4746251106262
			}
		},
		pwe_crater_devastation = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_devastation_01",
				"pwe_crater_devastation_02",
				"pwe_crater_devastation_03",
				"pwe_crater_devastation_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_devastation_01",
				"pwe_crater_devastation_02",
				"pwe_crater_devastation_03",
				"pwe_crater_devastation_04"
			},
			sound_events_duration = {
				3.0624582767487,
				6.3389792442322,
				6.2087292671204,
				2.6931457519531
			}
		},
		pwe_crater_dummy = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_crater",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "dummy"
			},
			sound_events = {
				[1.0] = "dummy"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			}
		},
		pwe_crater_forest_ascent_top = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_forest_ascent_top_01",
				"pwe_crater_forest_ascent_top_02",
				"pwe_crater_forest_ascent_top_03",
				"pwe_crater_forest_ascent_top_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_forest_ascent_top_01",
				"pwe_crater_forest_ascent_top_02",
				"pwe_crater_forest_ascent_top_03",
				"pwe_crater_forest_ascent_top_04"
			},
			sound_events_duration = {
				3.789895772934,
				5.3615417480469,
				3.4935207366943,
				2.5864791870117
			}
		},
		pwe_crater_intro_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_crater",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_intro_banter_a_01",
				[2.0] = "pwe_crater_intro_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_crater_intro_banter_a_01",
				[2.0] = "pwe_crater_intro_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 6.0351042747498,
				[2.0] = 4.5802083015442
			}
		},
		pwe_crater_intro_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_crater",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_intro_banter_b_01",
				[2.0] = "pwe_crater_intro_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_crater_intro_banter_b_01",
				[2.0] = "pwe_crater_intro_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 5.810583114624,
				[2.0] = 2.2092707157135
			}
		},
		pwe_crater_intro_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_crater",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_intro_banter_c_01",
				[2.0] = "pwe_crater_intro_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_crater_intro_banter_c_01",
				[2.0] = "pwe_crater_intro_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.2600417137146,
				[2.0] = 3.7180624008179
			}
		},
		pwe_crater_plan_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_crater",
			sound_events_n = 2,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_plan_banter_a_01",
				[2.0] = "pwe_crater_plan_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_crater_plan_banter_a_01",
				[2.0] = "pwe_crater_plan_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 8.1079587936401,
				[2.0] = 7.9013123512268
			}
		},
		pwe_crater_plan_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_crater",
			sound_events_n = 2,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_plan_banter_b_01",
				[2.0] = "pwe_crater_plan_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_crater_plan_banter_b_01",
				[2.0] = "pwe_crater_plan_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 9.2531042098999,
				[2.0] = 7.2620625495911
			}
		},
		pwe_crater_plan_banter_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_crater",
			sound_events_n = 2,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_plan_banter_c_01",
				[2.0] = "pwe_crater_plan_banter_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_crater_plan_banter_c_01",
				[2.0] = "pwe_crater_plan_banter_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.8893122673035,
				[2.0] = 7.021062374115
			}
		},
		pwe_crater_rim_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_rim_vista_01",
				"pwe_crater_rim_vista_02",
				"pwe_crater_rim_vista_03",
				"pwe_crater_rim_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_rim_vista_01",
				"pwe_crater_rim_vista_02",
				"pwe_crater_rim_vista_03",
				"pwe_crater_rim_vista_04"
			},
			sound_events_duration = {
				6.2036666870117,
				6.3503751754761,
				6.0255208015442,
				6.2036876678467
			}
		},
		pwe_crater_tracking_camp = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_tracking_camp_01",
				"pwe_crater_tracking_camp_02",
				"pwe_crater_tracking_camp_03",
				"pwe_crater_tracking_camp_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_tracking_camp_01",
				"pwe_crater_tracking_camp_02",
				"pwe_crater_tracking_camp_03",
				"pwe_crater_tracking_camp_04"
			},
			sound_events_duration = {
				3.4037292003632,
				3.2966769933701,
				3.376791715622,
				4.0682916641235
			}
		},
		pwe_crater_vista_reveal = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
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
				"pwe_crater_vista_reveal_01",
				"pwe_crater_vista_reveal_02",
				"pwe_crater_vista_reveal_03",
				"pwe_crater_vista_reveal_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_vista_reveal_01",
				"pwe_crater_vista_reveal_02",
				"pwe_crater_vista_reveal_03",
				"pwe_crater_vista_reveal_04"
			},
			sound_events_duration = {
				5.8644585609436,
				6.4122915267944,
				6.3203125,
				5.6758542060852
			}
		},
		pwe_crater_wasteland_intro = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_wasteland_intro_01",
				"pwe_crater_wasteland_intro_02",
				"pwe_crater_wasteland_intro_03",
				"pwe_crater_wasteland_intro_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_wasteland_intro_01",
				"pwe_crater_wasteland_intro_02",
				"pwe_crater_wasteland_intro_03",
				"pwe_crater_wasteland_intro_04"
			},
			sound_events_duration = {
				7.040958404541,
				7.4989581108093,
				7.5348958969116,
				7.6965417861939
			}
		},
		pwe_crater_wasteland_tree_push = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_crater",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwe_crater_wasteland_tree_push_01",
				"pwe_crater_wasteland_tree_push_02",
				"pwe_crater_wasteland_tree_push_03",
				"pwe_crater_wasteland_tree_push_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_wasteland_tree_push_01",
				"pwe_crater_wasteland_tree_push_02",
				"pwe_crater_wasteland_tree_push_03",
				"pwe_crater_wasteland_tree_push_04"
			},
			sound_events_duration = {
				3.8615000247955,
				2.6576874256134,
				2.5413959026337,
				3.3381042480469
			}
		}
	})
end
