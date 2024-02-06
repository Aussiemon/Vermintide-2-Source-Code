-- chunkname: @dialogues/generated/empire_soldier_bell.lua

return function ()
	define_rule({
		name = "pes_bell_intro_a",
		response = "pes_bell_intro_a",
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
		name = "pes_bell_intro_b",
		response = "pes_bell_intro_b",
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
				"empire_soldier",
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
		name = "pes_bell_intro_c",
		response = "pes_bell_intro_c",
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
				"empire_soldier",
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
		name = "pes_level_bell_chime_01",
		response = "pes_level_bell_chime_01",
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
		name = "pes_level_bell_effect_01",
		response = "pes_level_bell_effect_01",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
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
		name = "pes_level_bell_falling_01",
		response = "pes_level_bell_falling_01",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
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
		name = "pes_level_bell_horde_01",
		response = "pes_level_bell_horde_01",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
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
	add_dialogues({
		pes_bell_intro_a = {
			category = "level_talk",
			database = "empire_soldier_bell",
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
				[1] = "pes_bell_intro_a_01",
				[2] = "pes_bell_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_bell_intro_a_01",
				[2] = "pes_bell_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.2126460075378,
				[2] = 5.7999377250671,
			},
		},
		pes_bell_intro_b = {
			category = "level_talk",
			database = "empire_soldier_bell",
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
				[1] = "pes_bell_intro_b_01",
				[2] = "pes_bell_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_bell_intro_b_01",
				[2] = "pes_bell_intro_b_02",
			},
			sound_events_duration = {
				[1] = 5.0934791564941,
				[2] = 5.7214374542236,
			},
		},
		pes_bell_intro_c = {
			category = "level_talk",
			database = "empire_soldier_bell",
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
				[1] = "pes_bell_intro_c_01",
				[2] = "pes_bell_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_bell_intro_c_01",
				[2] = "pes_bell_intro_c_02",
			},
			sound_events_duration = {
				[1] = 4.7649374008179,
				[2] = 5.614333152771,
			},
		},
		pes_level_bell_chime_01 = {
			category = "level_talk",
			database = "empire_soldier_bell",
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
				[1] = "pes_level_bell_chime_01",
				[2] = "pes_level_bell_chime_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_bell_chime_01",
				[2] = "pes_level_bell_chime_02",
			},
			sound_events_duration = {
				[1] = 6.2704377174377,
				[2] = 4.1613960266113,
			},
		},
		pes_level_bell_effect_01 = {
			category = "level_talk",
			database = "empire_soldier_bell",
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
				[1] = "pes_level_bell_effect_01",
				[2] = "pes_level_bell_effect_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_bell_effect_01",
				[2] = "pes_level_bell_effect_02",
			},
			sound_events_duration = {
				[1] = 4.6985206604004,
				[2] = 5.7538123130798,
			},
		},
		pes_level_bell_falling_01 = {
			category = "level_talk",
			database = "empire_soldier_bell",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bell_falling_01",
				[2] = "pes_level_bell_falling_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_bell_falling_01",
				[2] = "pes_level_bell_falling_02",
			},
			sound_events_duration = {
				[1] = 5.7711770534515,
				[2] = 6.3294582366943,
			},
		},
		pes_level_bell_horde_01 = {
			category = "level_talk",
			database = "empire_soldier_bell",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bell_horde_01",
				[2] = "pes_level_bell_horde_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_bell_horde_01",
				[2] = "pes_level_bell_horde_02",
			},
			sound_events_duration = {
				[1] = 3.045562505722,
				[2] = 4.8086876869202,
			},
		},
	})
end
