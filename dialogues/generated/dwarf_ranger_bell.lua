-- chunkname: @dialogues/generated/dwarf_ranger_bell.lua

return function ()
	define_rule({
		name = "pdr_bell_intro_a",
		probability = 1,
		response = "pdr_bell_intro_a",
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
				"bell_intro_a",
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
				"bell_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_bell_intro_b",
		probability = 1,
		response = "pdr_bell_intro_b",
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
				"bell_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"bell_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_bell_intro_c",
		probability = 1,
		response = "pdr_bell_intro_c",
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
				"bell_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"bell_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_chime_01",
		probability = 1,
		response = "pdr_level_bell_chime_01",
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
				"bell_chime",
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
				"level_bell_chime",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_chime",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_destroyed_01",
		probability = 1,
		response = "pdr_level_bell_destroyed_01",
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
				"bell_destroyed",
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
				"level_bell_destroyed",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_destroyed",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_distance_01",
		probability = 1,
		response = "pdr_level_bell_distance_01",
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
				"bell_distance",
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
				"level_bell_distance",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_distance",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_effect_01",
		probability = 1,
		response = "pdr_level_bell_effect_01",
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
				"bell_effect",
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
				"level_bell_effect",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_effect",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_exit_01",
		probability = 1,
		response = "pdr_level_bell_exit_01",
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
				"bell_exit",
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
				"level_bell_exit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_exit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_falling_01",
		probability = 1,
		response = "pdr_level_bell_falling_01",
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
				"bell_falling",
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
				"level_bell_falling",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_falling",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_horde_01",
		probability = 1,
		response = "pdr_level_bell_horde_01",
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
				"bell_horde",
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
				"level_bell_horde",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_horde",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_long_stairs_01",
		probability = 1,
		response = "pdr_level_bell_long_stairs_01",
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
				"bell_long_stairs",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_bell_long_stairs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_long_stairs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_poor_quarters_01",
		probability = 1,
		response = "pdr_level_bell_poor_quarters_01",
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
				"bell_poor_quarters",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_bell_poor_quarters",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_poor_quarters",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_rain_01",
		probability = 1,
		response = "pdr_level_bell_rain_01",
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
				"bell_rain",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_bell_rain",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_rain",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_reaching_bell_01",
		probability = 1,
		response = "pdr_level_bell_reaching_bell_01",
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
				"bell_reaching_bell",
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
				"level_bell_reaching_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_rich_quarters_01",
		probability = 1,
		response = "pdr_level_bell_rich_quarters_01",
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
				"bell_rich_quarters",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_bell_rich_quarters",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_rich_quarters",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_rooftops_01",
		probability = 1,
		response = "pdr_level_bell_rooftops_01",
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
				"bell_rooftops",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_bell_rooftops",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_rooftops",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_spotting_01",
		probability = 1,
		response = "pdr_level_bell_spotting_01",
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
				"bell_spotting",
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
				"level_bell_spotting",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_spotting",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_bell_vista_01",
		probability = 1,
		response = "pdr_level_bell_vista_01",
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
				"bell_vista",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_bell_vista",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_vista",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pdr_bell_intro_a = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_bell_intro_a_01",
				[2] = "pdr_bell_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_bell_intro_a_01",
				[2] = "pdr_bell_intro_a_02",
			},
			sound_events_duration = {
				[1] = 6.0192499160767,
				[2] = 4.5682291984558,
			},
		},
		pdr_bell_intro_b = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_bell_intro_b_01",
				[2] = "pdr_bell_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_bell_intro_b_01",
				[2] = "pdr_bell_intro_b_02",
			},
			sound_events_duration = {
				[1] = 4.5980834960938,
				[2] = 5.3934373855591,
			},
		},
		pdr_bell_intro_c = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_bell_intro_c_01",
				[2] = "pdr_bell_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_bell_intro_c_01",
				[2] = "pdr_bell_intro_c_02",
			},
			sound_events_duration = {
				[1] = 9.0970211029053,
				[2] = 6.1025414466858,
			},
		},
		pdr_level_bell_chime_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_bell_chime_01",
				[2] = "pdr_level_bell_chime_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_bell_chime_01",
				[2] = "pdr_level_bell_chime_02",
			},
			sound_events_duration = {
				[1] = 5.1868958473206,
				[2] = 4.4231457710266,
			},
		},
		pdr_level_bell_destroyed_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pdr_level_bell_destroyed_01",
				"pdr_level_bell_destroyed_02",
				"pdr_level_bell_destroyed_03",
				"pdr_level_bell_destroyed_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_destroyed_01",
				"pdr_level_bell_destroyed_02",
				"pdr_level_bell_destroyed_03",
				"pdr_level_bell_destroyed_04",
			},
			sound_events_duration = {
				5.8755416870117,
				5.7366666793823,
				9.2258539199829,
				8.4164171218872,
			},
		},
		pdr_level_bell_distance_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
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
				"pdr_level_bell_distance_01",
				"pdr_level_bell_distance_02",
				"pdr_level_bell_distance_03",
				"pdr_level_bell_distance_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_distance_01",
				"pdr_level_bell_distance_02",
				"pdr_level_bell_distance_03",
				"pdr_level_bell_distance_04",
			},
			sound_events_duration = {
				3.5888750553131,
				5.3616042137146,
				6.9099998474121,
				3.5873334407806,
			},
		},
		pdr_level_bell_effect_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_bell_effect_01",
				[2] = "pdr_level_bell_effect_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_bell_effect_01",
				[2] = "pdr_level_bell_effect_02",
			},
			sound_events_duration = {
				[1] = 5.8673748970032,
				[2] = 5.776771068573,
			},
		},
		pdr_level_bell_exit_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pdr_level_bell_exit_01",
				"pdr_level_bell_exit_02",
				"pdr_level_bell_exit_03",
				"pdr_level_bell_exit_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_exit_01",
				"pdr_level_bell_exit_02",
				"pdr_level_bell_exit_03",
				"pdr_level_bell_exit_04",
			},
			sound_events_duration = {
				4.7827501296997,
				3.4658749103546,
				4.8020625114441,
				6.8474998474121,
			},
		},
		pdr_level_bell_falling_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_bell_falling_01",
				[2] = "pdr_level_bell_falling_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_bell_falling_01",
				[2] = "pdr_level_bell_falling_02",
			},
			sound_events_duration = {
				[1] = 6.2999167442322,
				[2] = 5.1300835609436,
			},
		},
		pdr_level_bell_horde_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_bell_horde_01",
				[2] = "pdr_level_bell_horde_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_bell_horde_01",
				[2] = "pdr_level_bell_horde_02",
			},
			sound_events_duration = {
				[1] = 3.8573124408722,
				[2] = 4.3348956108093,
			},
		},
		pdr_level_bell_long_stairs_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pdr_level_bell_long_stairs_01",
				"pdr_level_bell_long_stairs_02",
				"pdr_level_bell_long_stairs_03",
				"pdr_level_bell_long_stairs_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_long_stairs_01",
				"pdr_level_bell_long_stairs_02",
				"pdr_level_bell_long_stairs_03",
				"pdr_level_bell_long_stairs_04",
			},
			sound_events_duration = {
				5.6026668548584,
				5.8229789733887,
				5.831916809082,
				7.3522706031799,
			},
		},
		pdr_level_bell_poor_quarters_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_level_bell_poor_quarters_01",
				"pdr_level_bell_poor_quarters_02",
				"pdr_level_bell_poor_quarters_03",
				"pdr_level_bell_poor_quarters_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_poor_quarters_01",
				"pdr_level_bell_poor_quarters_02",
				"pdr_level_bell_poor_quarters_03",
				"pdr_level_bell_poor_quarters_04",
			},
			sound_events_duration = {
				5.256875038147,
				5.6291041374206,
				3.6473751068115,
				7.2979583740234,
			},
		},
		pdr_level_bell_rain_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
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
				"pdr_level_bell_rain_01",
				"pdr_level_bell_rain_02",
				"pdr_level_bell_rain_03",
				"pdr_level_bell_rain_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_rain_01",
				"pdr_level_bell_rain_02",
				"pdr_level_bell_rain_03",
				"pdr_level_bell_rain_04",
			},
			sound_events_duration = {
				3.1257915496826,
				4.796895980835,
				3.9100832939148,
				4.9491667747498,
			},
		},
		pdr_level_bell_reaching_bell_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pdr_level_bell_reaching_bell_01",
				"pdr_level_bell_reaching_bell_02",
				"pdr_level_bell_reaching_bell_03",
				"pdr_level_bell_reaching_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_reaching_bell_01",
				"pdr_level_bell_reaching_bell_02",
				"pdr_level_bell_reaching_bell_03",
				"pdr_level_bell_reaching_bell_04",
			},
			sound_events_duration = {
				3.4315416812897,
				3.9605417251587,
				4.569854259491,
				6.2167081832886,
			},
		},
		pdr_level_bell_rich_quarters_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pdr_level_bell_rich_quarters_01",
				"pdr_level_bell_rich_quarters_02",
				"pdr_level_bell_rich_quarters_03",
				"pdr_level_bell_rich_quarters_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_rich_quarters_01",
				"pdr_level_bell_rich_quarters_02",
				"pdr_level_bell_rich_quarters_03",
				"pdr_level_bell_rich_quarters_04",
			},
			sound_events_duration = {
				9.2093124389648,
				4.2815208435059,
				4.836437702179,
				6.9480624198914,
			},
		},
		pdr_level_bell_rooftops_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
			},
			localization_strings = {
				"pdr_level_bell_rooftops_01",
				"pdr_level_bell_rooftops_02",
				"pdr_level_bell_rooftops_03",
				"pdr_level_bell_rooftops_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_rooftops_01",
				"pdr_level_bell_rooftops_02",
				"pdr_level_bell_rooftops_03",
				"pdr_level_bell_rooftops_04",
			},
			sound_events_duration = {
				4.9016666412353,
				4.5667915344238,
				5.2000207901001,
				4.5145831108093,
			},
		},
		pdr_level_bell_spotting_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pdr_level_bell_spotting_01",
				"pdr_level_bell_spotting_02",
				"pdr_level_bell_spotting_03",
				"pdr_level_bell_spotting_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_spotting_01",
				"pdr_level_bell_spotting_02",
				"pdr_level_bell_spotting_03",
				"pdr_level_bell_spotting_04",
			},
			sound_events_duration = {
				2.5473749637604,
				4.5481042861939,
				4.9636249542236,
				7.0402498245239,
			},
		},
		pdr_level_bell_vista_01 = {
			category = "level_talk",
			database = "dwarf_ranger_bell",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pdr_level_bell_vista_01",
				"pdr_level_bell_vista_02",
				"pdr_level_bell_vista_03",
				"pdr_level_bell_vista_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_bell_vista_01",
				"pdr_level_bell_vista_02",
				"pdr_level_bell_vista_03",
				"pdr_level_bell_vista_04",
			},
			sound_events_duration = {
				5.8680834770203,
				6.5,
				5.0137710571289,
				6.5048332214356,
			},
		},
	})
end
