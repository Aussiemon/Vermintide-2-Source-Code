-- chunkname: @dialogues/generated/wood_elf_crater.lua

return function ()
	define_rule({
		name = "pwe_crater_ambush_done",
		probability = 1,
		response = "pwe_crater_ambush_done",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_ambush_interactable",
		probability = 1,
		response = "pwe_crater_ambush_interactable",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_arena_end",
		probability = 1,
		response = "pwe_crater_arena_end",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_arena_standard",
		probability = 1,
		response = "pwe_crater_arena_standard",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_arena_standard_02",
		probability = 1,
		response = "pwe_crater_arena_standard_02",
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
				"pwe_crater_arena_standard_02",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"pwe_crater_arena_standard_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_crater_arena_standard_02",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_crater_arena_waystone",
		probability = 1,
		response = "pwe_crater_arena_waystone",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_bridge_sighted",
		probability = 1,
		response = "pwe_crater_bridge_sighted",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_climb_top",
		probability = 1,
		response = "pwe_crater_climb_top",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_devastation",
		probability = 1,
		response = "pwe_crater_devastation",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_dummy",
		probability = 1,
		response = "pwe_crater_dummy",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_forest_ascent_top",
		probability = 1,
		response = "pwe_crater_forest_ascent_top",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_intro_banter_a",
		probability = 1,
		response = "pwe_crater_intro_banter_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_intro_banter_b",
		probability = 1,
		response = "pwe_crater_intro_banter_b",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_intro_banter_c",
		probability = 1,
		response = "pwe_crater_intro_banter_c",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_plan_banter_a",
		probability = 1,
		response = "pwe_crater_plan_banter_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_plan_banter_b",
		probability = 1,
		response = "pwe_crater_plan_banter_b",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_plan_banter_c",
		probability = 1,
		response = "pwe_crater_plan_banter_c",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_rim_vista",
		probability = 1,
		response = "pwe_crater_rim_vista",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_tracking_camp",
		probability = 1,
		response = "pwe_crater_tracking_camp",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_vista_reveal",
		probability = 1,
		response = "pwe_crater_vista_reveal",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_wasteland_intro",
		probability = 1,
		response = "pwe_crater_wasteland_intro",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_crater_wasteland_tree_push",
		probability = 1,
		response = "pwe_crater_wasteland_tree_push",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		pwe_crater_ambush_done = {
			category = "level_talk_must_play",
			database = "wood_elf_crater",
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
				"pwe_crater_ambush_done_01",
				"pwe_crater_ambush_done_02",
				"pwe_crater_ambush_done_03",
				"pwe_crater_ambush_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_ambush_done_01",
				"pwe_crater_ambush_done_02",
				"pwe_crater_ambush_done_03",
				"pwe_crater_ambush_done_04",
			},
			sound_events_duration = {
				5.6929793357849,
				4.8242812156677,
				2.6579792499542,
				5.7919793128967,
			},
		},
		pwe_crater_ambush_interactable = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_ambush_interactable_01",
				"pwe_crater_ambush_interactable_02",
				"pwe_crater_ambush_interactable_03",
				"pwe_crater_ambush_interactable_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_ambush_interactable_01",
				"pwe_crater_ambush_interactable_02",
				"pwe_crater_ambush_interactable_03",
				"pwe_crater_ambush_interactable_04",
			},
			sound_events_duration = {
				4.9119791984558,
				2.5769791603088,
				3.2859792709351,
				4.7409791946411,
			},
		},
		pwe_crater_arena_end = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_arena_end_01",
				"pwe_crater_arena_end_02",
				"pwe_crater_arena_end_03",
				"pwe_crater_arena_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_arena_end_01",
				"pwe_crater_arena_end_02",
				"pwe_crater_arena_end_03",
				"pwe_crater_arena_end_04",
			},
			sound_events_duration = {
				3.3739790916443,
				3.7829792499542,
				5.7629790306091,
				4.7049789428711,
			},
		},
		pwe_crater_arena_standard = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_arena_standard_01",
				"pwe_crater_arena_standard_02",
				"pwe_crater_arena_standard_03",
				"pwe_crater_arena_standard_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_arena_standard_01",
				"pwe_crater_arena_standard_02",
				"pwe_crater_arena_standard_03",
				"pwe_crater_arena_standard_04",
			},
			sound_events_duration = {
				2.1569790840149,
				2.239000082016,
				3.7969999313355,
				2.8429999351502,
			},
		},
		pwe_crater_arena_standard_02 = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_arena_standard_02_01",
				"pwe_crater_arena_standard_02_02",
				"pwe_crater_arena_standard_02_03",
				"pwe_crater_arena_standard_02_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_arena_standard_02_01",
				"pwe_crater_arena_standard_02_02",
				"pwe_crater_arena_standard_02_03",
				"pwe_crater_arena_standard_02_04",
			},
			sound_events_duration = {
				2.4475000500679,
				3.25,
				3.6050000190735,
				2.9360001087189,
			},
		},
		pwe_crater_arena_waystone = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_arena_waystone_01",
				"pwe_crater_arena_waystone_02",
				"pwe_crater_arena_waystone_03",
				"pwe_crater_arena_waystone_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_arena_waystone_01",
				"pwe_crater_arena_waystone_02",
				"pwe_crater_arena_waystone_03",
				"pwe_crater_arena_waystone_04",
			},
			sound_events_duration = {
				2.9649791717529,
				3.9039790630341,
				3.0574895143509,
				3.1329791545868,
			},
		},
		pwe_crater_bridge_sighted = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_bridge_sighted_01",
				"pwe_crater_bridge_sighted_02",
				"pwe_crater_bridge_sighted_03",
				"pwe_crater_bridge_sighted_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_bridge_sighted_01",
				"pwe_crater_bridge_sighted_02",
				"pwe_crater_bridge_sighted_03",
				"pwe_crater_bridge_sighted_04",
			},
			sound_events_duration = {
				2.4739999771118,
				2.743979215622,
				3.5469999313355,
				2.9545936584473,
			},
		},
		pwe_crater_climb_top = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_climb_top_01",
				"pwe_crater_climb_top_02",
				"pwe_crater_climb_top_03",
				"pwe_crater_climb_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_climb_top_01",
				"pwe_crater_climb_top_02",
				"pwe_crater_climb_top_03",
				"pwe_crater_climb_top_04",
			},
			sound_events_duration = {
				4.5679793357849,
				4.9879789352417,
				5.8679790496826,
				4.4739789962769,
			},
		},
		pwe_crater_devastation = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_devastation_01",
				"pwe_crater_devastation_02",
				"pwe_crater_devastation_03",
				"pwe_crater_devastation_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_devastation_01",
				"pwe_crater_devastation_02",
				"pwe_crater_devastation_03",
				"pwe_crater_devastation_04",
			},
			sound_events_duration = {
				3.0619790554047,
				6.1439790725708,
				6.0039792060852,
				2.6929790973663,
			},
		},
		pwe_crater_dummy = {
			category = "level_talk_must_play",
			database = "wood_elf_crater",
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
		pwe_crater_forest_ascent_top = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_forest_ascent_top_01",
				"pwe_crater_forest_ascent_top_02",
				"pwe_crater_forest_ascent_top_03",
				"pwe_crater_forest_ascent_top_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_forest_ascent_top_01",
				"pwe_crater_forest_ascent_top_02",
				"pwe_crater_forest_ascent_top_03",
				"pwe_crater_forest_ascent_top_04",
			},
			sound_events_duration = {
				3.7889790534973,
				5.3609790802002,
				3.4929790496826,
				2.5859792232513,
			},
		},
		pwe_crater_intro_banter_a = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				[1] = "pwe_crater_intro_banter_a_01",
				[2] = "pwe_crater_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_crater_intro_banter_a_01",
				[2] = "pwe_crater_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 6.0349793434143,
				[2] = 4.5799789428711,
			},
		},
		pwe_crater_intro_banter_b = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				[1] = "pwe_crater_intro_banter_b_01",
				[2] = "pwe_crater_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_crater_intro_banter_b_01",
				[2] = "pwe_crater_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 5.8099789619446,
				[2] = 2.2089791297913,
			},
		},
		pwe_crater_intro_banter_c = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				[1] = "pwe_crater_intro_banter_c_01",
				[2] = "pwe_crater_intro_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_crater_intro_banter_c_01",
				[2] = "pwe_crater_intro_banter_c_02",
			},
			sound_events_duration = {
				[1] = 3.2599792480469,
				[2] = 3.7179791927338,
			},
		},
		pwe_crater_plan_banter_a = {
			category = "level_talk_must_play",
			database = "wood_elf_crater",
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
				[1] = "pwe_crater_plan_banter_a_01",
				[2] = "pwe_crater_plan_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_crater_plan_banter_a_01",
				[2] = "pwe_crater_plan_banter_a_02",
			},
			sound_events_duration = {
				[1] = 8.0549793243408,
				[2] = 7.9009790420532,
			},
		},
		pwe_crater_plan_banter_b = {
			category = "level_talk_must_play",
			database = "wood_elf_crater",
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
				[1] = "pwe_crater_plan_banter_b_01",
				[2] = "pwe_crater_plan_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_crater_plan_banter_b_01",
				[2] = "pwe_crater_plan_banter_b_02",
			},
			sound_events_duration = {
				[1] = 9.2529792785644,
				[2] = 7.2619791030884,
			},
		},
		pwe_crater_plan_banter_c = {
			category = "level_talk_must_play",
			database = "wood_elf_crater",
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
				[1] = "pwe_crater_plan_banter_c_01",
				[2] = "pwe_crater_plan_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_crater_plan_banter_c_01",
				[2] = "pwe_crater_plan_banter_c_02",
			},
			sound_events_duration = {
				[1] = 5.8889789581299,
				[2] = 7.0209794044495,
			},
		},
		pwe_crater_rim_vista = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_rim_vista_01",
				"pwe_crater_rim_vista_02",
				"pwe_crater_rim_vista_03",
				"pwe_crater_rim_vista_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_rim_vista_01",
				"pwe_crater_rim_vista_02",
				"pwe_crater_rim_vista_03",
				"pwe_crater_rim_vista_04",
			},
			sound_events_duration = {
				6.0919790267944,
				6.3499794006348,
				6.0249791145325,
				6.2029790878296,
			},
		},
		pwe_crater_tracking_camp = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_tracking_camp_01",
				"pwe_crater_tracking_camp_02",
				"pwe_crater_tracking_camp_03",
				"pwe_crater_tracking_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_tracking_camp_01",
				"pwe_crater_tracking_camp_02",
				"pwe_crater_tracking_camp_03",
				"pwe_crater_tracking_camp_04",
			},
			sound_events_duration = {
				3.4029791355133,
				3.2965624332428,
				3.3759791851044,
				4.0679793357849,
			},
		},
		pwe_crater_vista_reveal = {
			category = "level_talk_must_play",
			database = "wood_elf_crater",
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
				"pwe_crater_vista_reveal_01",
				"pwe_crater_vista_reveal_02",
				"pwe_crater_vista_reveal_03",
				"pwe_crater_vista_reveal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_vista_reveal_01",
				"pwe_crater_vista_reveal_02",
				"pwe_crater_vista_reveal_03",
				"pwe_crater_vista_reveal_04",
			},
			sound_events_duration = {
				5.8639793395996,
				6.4119791984558,
				6.3199791908264,
				5.6749792098999,
			},
		},
		pwe_crater_wasteland_intro = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_wasteland_intro_01",
				"pwe_crater_wasteland_intro_02",
				"pwe_crater_wasteland_intro_03",
				"pwe_crater_wasteland_intro_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_wasteland_intro_01",
				"pwe_crater_wasteland_intro_02",
				"pwe_crater_wasteland_intro_03",
				"pwe_crater_wasteland_intro_04",
			},
			sound_events_duration = {
				7.0399789810181,
				7.4979791641235,
				7.5339789390564,
				7.6959791183472,
			},
		},
		pwe_crater_wasteland_tree_push = {
			category = "level_talk",
			database = "wood_elf_crater",
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
				"pwe_crater_wasteland_tree_push_01",
				"pwe_crater_wasteland_tree_push_02",
				"pwe_crater_wasteland_tree_push_03",
				"pwe_crater_wasteland_tree_push_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_crater_wasteland_tree_push_01",
				"pwe_crater_wasteland_tree_push_02",
				"pwe_crater_wasteland_tree_push_03",
				"pwe_crater_wasteland_tree_push_04",
			},
			sound_events_duration = {
				3.8610000610352,
				2.6570000648499,
				2.5409791469574,
				3.3379790782928,
			},
		},
	})
end
