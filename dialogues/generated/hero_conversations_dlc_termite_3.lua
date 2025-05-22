-- chunkname: @dialogues/generated/hero_conversations_dlc_termite_3.lua

return function ()
	define_rule({
		name = "nik_gateway_elevator_conversation_b",
		probability = 1,
		response = "nik_gateway_elevator_conversation_b",
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
				"gateway_elevator_conversation_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
		},
	})
	define_rule({
		name = "pbw_gateway_elevator_conversation_a",
		probability = 1,
		response = "pbw_gateway_elevator_conversation_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gateway_elevator_conversation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_gateway_elevator_conversation_c",
		probability = 1,
		response = "pbw_gateway_elevator_conversation_c",
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
				"gateway_elevator_conversation_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_elevator_conversation_a",
		probability = 1,
		response = "pdr_gateway_elevator_conversation_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gateway_elevator_conversation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_gateway_elevator_conversation_c",
		probability = 1,
		response = "pdr_gateway_elevator_conversation_c",
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
				"gateway_elevator_conversation_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pes_gateway_elevator_conversation_a",
		probability = 1,
		response = "pes_gateway_elevator_conversation_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gateway_elevator_conversation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_gateway_elevator_conversation_c",
		probability = 1,
		response = "pes_gateway_elevator_conversation_c",
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
				"gateway_elevator_conversation_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pwe_gateway_elevator_conversation_b",
		probability = 1,
		response = "pwe_gateway_elevator_conversation_b",
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
				"gateway_elevator_conversation_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_elevator_conversation_a",
		probability = 1,
		response = "pwh_gateway_elevator_conversation_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gateway_elevator_conversation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_gateway_elevator_conversation_c",
		probability = 1,
		response = "pwh_gateway_elevator_conversation_c",
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
				"gateway_elevator_conversation_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	add_dialogues({
		nik_gateway_elevator_conversation_b = {
			category = "npc_talk",
			database = "hero_conversations_dlc_termite_3",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"nik_gateway_elevator_conversation_b_01",
				"nik_gateway_elevator_conversation_b_02",
				"nik_gateway_elevator_conversation_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_gateway_elevator_conversation_b_01",
				"nik_gateway_elevator_conversation_b_02",
				"nik_gateway_elevator_conversation_b_03",
			},
			sound_events_duration = {
				5.3220210075378,
				4.7155833244324,
				5.4767918586731,
			},
		},
		pbw_gateway_elevator_conversation_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_3",
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
				[1] = "pbw_gateway_elevator_conversation_a_01",
				[2] = "pbw_gateway_elevator_conversation_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_elevator_conversation_a_01",
				[2] = "pbw_gateway_elevator_conversation_a_02",
			},
			sound_events_duration = {
				[1] = 4.1068959236145,
				[2] = 7.2105627059936,
			},
		},
		pbw_gateway_elevator_conversation_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_3",
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
				[1] = "pbw_gateway_elevator_conversation_c_01",
				[2] = "pbw_gateway_elevator_conversation_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_gateway_elevator_conversation_c_01",
				[2] = "pbw_gateway_elevator_conversation_c_02",
			},
			sound_events_duration = {
				[1] = 4.9123749732971,
				[2] = 5.7871041297913,
			},
		},
		pdr_gateway_elevator_conversation_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_3",
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
				[1] = "pdr_gateway_elevator_conversation_a_01",
				[2] = "pdr_gateway_elevator_conversation_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_elevator_conversation_a_01",
				[2] = "pdr_gateway_elevator_conversation_a_02",
			},
			sound_events_duration = {
				[1] = 4.6481876373291,
				[2] = 5.5264167785644,
			},
		},
		pdr_gateway_elevator_conversation_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_3",
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
				[1] = "pdr_gateway_elevator_conversation_c_01",
				[2] = "pdr_gateway_elevator_conversation_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_gateway_elevator_conversation_c_01",
				[2] = "pdr_gateway_elevator_conversation_c_02",
			},
			sound_events_duration = {
				[1] = 4.0061459541321,
				[2] = 4.0707082748413,
			},
		},
		pes_gateway_elevator_conversation_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_3",
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
				[1] = "pes_gateway_elevator_conversation_a_01",
				[2] = "pes_gateway_elevator_conversation_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_elevator_conversation_a_01",
				[2] = "pes_gateway_elevator_conversation_a_02",
			},
			sound_events_duration = {
				[1] = 4.6683125495911,
				[2] = 7.0209794044495,
			},
		},
		pes_gateway_elevator_conversation_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_3",
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
				[1] = "pes_gateway_elevator_conversation_c_01",
				[2] = "pes_gateway_elevator_conversation_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_gateway_elevator_conversation_c_01",
				[2] = "pes_gateway_elevator_conversation_c_02",
			},
			sound_events_duration = {
				[1] = 3.4613125324249,
				[2] = 4.2279582023621,
			},
		},
		pwe_gateway_elevator_conversation_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_3",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwe_gateway_elevator_conversation_b_01",
				"pwe_gateway_elevator_conversation_b_02",
				"pwe_gateway_elevator_conversation_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_gateway_elevator_conversation_b_01",
				"pwe_gateway_elevator_conversation_b_02",
				"pwe_gateway_elevator_conversation_b_03",
			},
			sound_events_duration = {
				6.469708442688,
				7.6598539352417,
				6.0302710533142,
			},
		},
		pwh_gateway_elevator_conversation_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_3",
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
				[1] = "pwh_gateway_elevator_conversation_a_01",
				[2] = "pwh_gateway_elevator_conversation_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_elevator_conversation_a_01",
				[2] = "pwh_gateway_elevator_conversation_a_02",
			},
			sound_events_duration = {
				[1] = 5.4876041412353,
				[2] = 6.4495210647583,
			},
		},
		pwh_gateway_elevator_conversation_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_3",
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
				[1] = "pwh_gateway_elevator_conversation_c_01",
				[2] = "pwh_gateway_elevator_conversation_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_gateway_elevator_conversation_c_01",
				[2] = "pwh_gateway_elevator_conversation_c_02",
			},
			sound_events_duration = {
				[1] = 4.1011667251587,
				[2] = 4.0911459922791,
			},
		},
	})
end
