-- chunkname: @dialogues/generated/bright_wizard_dlc_drachenfels_bastion.lua

return function ()
	define_rule({
		name = "pbw_bastion_intro_line_a",
		response = "pbw_bastion_intro_line_a",
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
				"bastion_intro_line_a",
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
				"bastion_intro_line_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_intro_line_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_intro_line_b",
		response = "pbw_bastion_intro_line_b",
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
				"bastion_intro_line_a",
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
				"bastion_intro_line_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_intro_line_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_intro_line_c",
		response = "pbw_bastion_intro_line_c",
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
				"bastion_intro_line_b",
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
				"bastion_intro_line_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_intro_line_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_caves",
		response = "pbw_bastion_vo_caves",
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
				"bastion_vo_caves",
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
				"bastion_vo_caves",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_caves",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_courtyard_done",
		response = "pbw_bastion_vo_courtyard_done",
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
				"bastion_vo_courtyard_done",
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
				"bastion_vo_courtyard_done",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_courtyard_done",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_courtyard_first_villager",
		response = "pbw_bastion_vo_courtyard_first_villager",
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
				"bastion_vo_courtyard_first_villager",
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
				"bastion_vo_courtyard_first_villager",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_courtyard_first_villager",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_entering_courtyard",
		response = "pbw_bastion_vo_entering_courtyard",
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
				"bastion_vo_entering_courtyard",
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
				"bastion_vo_entering_courtyard",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entering_courtyard",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_entering_darkness",
		response = "pbw_bastion_vo_entering_darkness",
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
				"bastion_vo_entering_darkness",
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
				"bastion_vo_entering_darkness",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entering_darkness",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_entering_finale",
		response = "pbw_bastion_vo_entering_finale",
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
				"bastion_vo_entering_finale",
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
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_entrance",
		response = "pbw_bastion_vo_entrance",
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
				"bastion_vo_entrance",
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
				"bastion_vo_entrance",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entrance",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_exiting_pbw_bastion",
		response = "pbw_bastion_vo_exiting_pbw_bastion",
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
				"bastion_vo_exiting_bastion",
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
				"bastion_vo_exiting_bastion",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_exiting_bastion",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_finale_done",
		response = "pbw_bastion_vo_finale_done",
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
				"bastion_vo_finale_done",
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
				"bastion_vo_finale_done",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_finale_done",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_finale_missile",
		response = "pbw_bastion_vo_finale_missile",
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
				"bastion_vo_finale_missile",
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
				"bastion_vo_finale_missile",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_finale_missile",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_finale_tiring",
		response = "pbw_bastion_vo_finale_tiring",
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
				"bastion_vo_finale_tiring",
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
				"bastion_vo_finale_tiring",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_finale_tiring",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_head_to_surface",
		response = "pbw_bastion_vo_head_to_surface",
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
				"bastion_vo_head_to_surface",
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
				"bastion_vo_head_to_surface",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_head_to_surface",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_inside_cellblock",
		response = "pbw_bastion_vo_inside_cellblock",
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
				"bastion_vo_inside_cellblock",
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
				"bastion_vo_inside_cellblock",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_inside_cellblock",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_no_prisoners",
		response = "pbw_bastion_vo_no_prisoners",
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
				"bastion_vo_no_prisoners",
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
				"bastion_vo_no_prisoners",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_no_prisoners",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_possessed",
		response = "pbw_bastion_vo_possessed",
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
				"bastion_vo_possessed",
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
				"bastion_vo_possessed",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_possessed",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bastion_vo_search_cells",
		response = "pbw_bastion_vo_search_cells",
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
				"bastion_vo_search_cells",
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
				"bastion_vo_search_cells",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_search_cells",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_bastion_intro_line_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_intro_line_a_01",
				[2] = "pbw_bastion_intro_line_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_bastion_intro_line_a_01",
				[2] = "pbw_bastion_intro_line_a_02",
			},
			sound_events_duration = {
				[1] = 2.9375834465027,
				[2] = 3.0599582195282,
			},
		},
		pbw_bastion_intro_line_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_intro_line_b_01",
				[2] = "pbw_bastion_intro_line_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_bastion_intro_line_b_01",
				[2] = "pbw_bastion_intro_line_b_02",
			},
			sound_events_duration = {
				[1] = 2.4223124980927,
				[2] = 2.2643542289734,
			},
		},
		pbw_bastion_intro_line_c = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_intro_line_c_01",
				[2] = "pbw_bastion_intro_line_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_bastion_intro_line_c_01",
				[2] = "pbw_bastion_intro_line_c_02",
			},
			sound_events_duration = {
				[1] = 3.4656457901001,
				[2] = 3.8634374141693,
			},
		},
		pbw_bastion_vo_caves = {
			category = "level_talk",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_caves_01",
				"pbw_bastion_vo_caves_02",
				"pbw_bastion_vo_caves_03",
				"pbw_bastion_vo_caves_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_caves_01",
				"pbw_bastion_vo_caves_02",
				"pbw_bastion_vo_caves_03",
				"pbw_bastion_vo_caves_04",
			},
			sound_events_duration = {
				3.8409583568573,
				2.3979165554047,
				2.3960416316986,
				2.8893332481384,
			},
		},
		pbw_bastion_vo_courtyard_done = {
			category = "level_talk",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_courtyard_done_01",
				"pbw_bastion_vo_courtyard_done_02",
				"pbw_bastion_vo_courtyard_done_03",
				"pbw_bastion_vo_courtyard_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_courtyard_done_01",
				"pbw_bastion_vo_courtyard_done_02",
				"pbw_bastion_vo_courtyard_done_03",
				"pbw_bastion_vo_courtyard_done_04",
			},
			sound_events_duration = {
				3.2310416698456,
				5.7828330993652,
				4.8849167823792,
				4.8905415534973,
			},
		},
		pbw_bastion_vo_courtyard_first_villager = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_courtyard_first_villager_01",
				"pbw_bastion_vo_courtyard_first_villager_02",
				"pbw_bastion_vo_courtyard_first_villager_03",
				"pbw_bastion_vo_courtyard_first_villager_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_courtyard_first_villager_01",
				"pbw_bastion_vo_courtyard_first_villager_02",
				"pbw_bastion_vo_courtyard_first_villager_03",
				"pbw_bastion_vo_courtyard_first_villager_04",
			},
			sound_events_duration = {
				2.4360001087189,
				3.0686249732971,
				3.0583124160767,
				2.0628333091736,
			},
		},
		pbw_bastion_vo_entering_courtyard = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_entering_courtyard_01",
				"pbw_bastion_vo_entering_courtyard_02",
				"pbw_bastion_vo_entering_courtyard_03",
				"pbw_bastion_vo_entering_courtyard_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_entering_courtyard_01",
				"pbw_bastion_vo_entering_courtyard_02",
				"pbw_bastion_vo_entering_courtyard_03",
				"pbw_bastion_vo_entering_courtyard_04",
			},
			sound_events_duration = {
				3.4233958721161,
				2.7001042366028,
				3.016083240509,
				1.4460208415985,
			},
		},
		pbw_bastion_vo_entering_darkness = {
			category = "level_talk",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_entering_darkness_01",
				"pbw_bastion_vo_entering_darkness_02",
				"pbw_bastion_vo_entering_darkness_03",
				"pbw_bastion_vo_entering_darkness_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_entering_darkness_01",
				"pbw_bastion_vo_entering_darkness_02",
				"pbw_bastion_vo_entering_darkness_03",
				"pbw_bastion_vo_entering_darkness_04",
			},
			sound_events_duration = {
				3.2198750972748,
				3.6827292442322,
				5.1220831871033,
				3.6817917823791,
			},
		},
		pbw_bastion_vo_entering_finale = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_entering_finale_01",
				"pbw_bastion_vo_entering_finale_02",
				"pbw_bastion_vo_entering_finale_03",
				"pbw_bastion_vo_entering_finale_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_entering_finale_01",
				"pbw_bastion_vo_entering_finale_02",
				"pbw_bastion_vo_entering_finale_03",
				"pbw_bastion_vo_entering_finale_04",
			},
			sound_events_duration = {
				4.8756875991821,
				4.0955624580383,
				5.0859999656677,
				6.5812082290649,
			},
		},
		pbw_bastion_vo_entrance = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_entrance_01",
				"pbw_bastion_vo_entrance_02",
				"pbw_bastion_vo_entrance_03",
				"pbw_bastion_vo_entrance_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_entrance_01",
				"pbw_bastion_vo_entrance_02",
				"pbw_bastion_vo_entrance_03",
				"pbw_bastion_vo_entrance_04",
			},
			sound_events_duration = {
				4.2627501487732,
				2.9867916107178,
				4.2044582366943,
				2.6972916126251,
			},
		},
		pbw_bastion_vo_exiting_pbw_bastion = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_exiting_pbw_bastion_01",
				"pbw_bastion_vo_exiting_pbw_bastion_02",
				"pbw_bastion_vo_exiting_pbw_bastion_03",
				"pbw_bastion_vo_exiting_pbw_bastion_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_exiting_pbw_bastion_01",
				"pbw_bastion_vo_exiting_pbw_bastion_02",
				"pbw_bastion_vo_exiting_pbw_bastion_03",
				"pbw_bastion_vo_exiting_pbw_bastion_04",
			},
			sound_events_duration = {
				2.0666875839233,
				3.4156875610352,
				3.7843542098999,
				5.9524793624878,
			},
		},
		pbw_bastion_vo_finale_done = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_finale_done_01",
				"pbw_bastion_vo_finale_done_02",
				"pbw_bastion_vo_finale_done_03",
				"pbw_bastion_vo_finale_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_finale_done_01",
				"pbw_bastion_vo_finale_done_02",
				"pbw_bastion_vo_finale_done_03",
				"pbw_bastion_vo_finale_done_04",
			},
			sound_events_duration = {
				1.6000624895096,
				6.0763959884644,
				3.6624166965485,
				4.4519376754761,
			},
		},
		pbw_bastion_vo_finale_missile = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_finale_missile_01",
				"pbw_bastion_vo_finale_missile_02",
				"pbw_bastion_vo_finale_missile_03",
				"pbw_bastion_vo_finale_missile_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_finale_missile_01",
				"pbw_bastion_vo_finale_missile_02",
				"pbw_bastion_vo_finale_missile_03",
				"pbw_bastion_vo_finale_missile_04",
			},
			sound_events_duration = {
				2.9806666374206,
				1.8767083883286,
				2.9094998836517,
				1.7838541269302,
			},
		},
		pbw_bastion_vo_finale_tiring = {
			category = "level_talk",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_finale_tiring_01",
				"pbw_bastion_vo_finale_tiring_02",
				"pbw_bastion_vo_finale_tiring_03",
				"pbw_bastion_vo_finale_tiring_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_finale_tiring_01",
				"pbw_bastion_vo_finale_tiring_02",
				"pbw_bastion_vo_finale_tiring_03",
				"pbw_bastion_vo_finale_tiring_04",
			},
			sound_events_duration = {
				3.3663332462311,
				3.4901249408722,
				2.5339167118073,
				2.0715832710266,
			},
		},
		pbw_bastion_vo_head_to_surface = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_head_to_surface_01",
				"pbw_bastion_vo_head_to_surface_02",
				"pbw_bastion_vo_head_to_surface_03",
				"pbw_bastion_vo_head_to_surface_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_head_to_surface_01",
				"pbw_bastion_vo_head_to_surface_02",
				"pbw_bastion_vo_head_to_surface_03",
				"pbw_bastion_vo_head_to_surface_04",
			},
			sound_events_duration = {
				1.0562083721161,
				2.6863334178925,
				3.3155624866486,
				2.8962292671204,
			},
		},
		pbw_bastion_vo_inside_cellblock = {
			category = "level_talk",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_inside_cellblock_01",
				"pbw_bastion_vo_inside_cellblock_02",
				"pbw_bastion_vo_inside_cellblock_03",
				"pbw_bastion_vo_inside_cellblock_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_inside_cellblock_01",
				"pbw_bastion_vo_inside_cellblock_02",
				"pbw_bastion_vo_inside_cellblock_03",
				"pbw_bastion_vo_inside_cellblock_04",
			},
			sound_events_duration = {
				2.2778542041779,
				3.3463125228882,
				1.2840000391007,
				3.8358957767487,
			},
		},
		pbw_bastion_vo_no_prisoners = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_no_prisoners_01",
				"pbw_bastion_vo_no_prisoners_02",
				"pbw_bastion_vo_no_prisoners_03",
				"pbw_bastion_vo_no_prisoners_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_no_prisoners_01",
				"pbw_bastion_vo_no_prisoners_02",
				"pbw_bastion_vo_no_prisoners_03",
				"pbw_bastion_vo_no_prisoners_04",
			},
			sound_events_duration = {
				2.5082082748413,
				2.8762917518616,
				3.0890207290649,
				2.8777916431427,
			},
		},
		pbw_bastion_vo_possessed = {
			category = "level_talk",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_possessed_01",
				"pbw_bastion_vo_possessed_02",
				"pbw_bastion_vo_possessed_03",
				"pbw_bastion_vo_possessed_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_possessed_01",
				"pbw_bastion_vo_possessed_02",
				"pbw_bastion_vo_possessed_03",
				"pbw_bastion_vo_possessed_04",
			},
			sound_events_duration = {
				1.8104374408722,
				2.9232499599457,
				2.6519167423248,
				1.4867082834244,
			},
		},
		pbw_bastion_vo_search_cells = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_search_cells_01",
				"pbw_bastion_vo_search_cells_02",
				"pbw_bastion_vo_search_cells_03",
				"pbw_bastion_vo_search_cells_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_search_cells_01",
				"pbw_bastion_vo_search_cells_02",
				"pbw_bastion_vo_search_cells_03",
				"pbw_bastion_vo_search_cells_04",
			},
			sound_events_duration = {
				0.80516666173935,
				3.0686874389648,
				2.4807500839233,
				2.1712291240692,
			},
		},
	})
end
