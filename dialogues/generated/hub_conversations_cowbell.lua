-- chunkname: @dialogues/generated/hub_conversations_cowbell.lua

return function ()
	define_rule({
		name = "nik_chaos_wastes_hub_cowbell_conversation_eight_a",
		response = "nik_chaos_wastes_hub_cowbell_conversation_eight_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_cowbell",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_hub_cowbell_conversation_ab",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_cowbell_conversation_ab",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_chaos_wastes_hub_cowbell_conversation_seven_a",
		response = "nik_chaos_wastes_hub_cowbell_conversation_seven_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_cowbell",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_hub_cowbell_conversation_ab",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_cowbell_conversation_ab",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_chaos_wastes_hub_cowbell_conversation_six_a",
		response = "nik_chaos_wastes_hub_cowbell_conversation_six_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_cowbell",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_hub_cowbell_conversation_ab",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_cowbell_conversation_ab",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_hub_cowbell_conversation_five_a",
		response = "nik_hub_cowbell_conversation_five_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_cowbell",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_hub_cowbell_conversation_four_a",
		response = "nik_hub_cowbell_conversation_four_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_cowbell",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_hub_cowbell_conversation_one_a",
		response = "nik_hub_cowbell_conversation_one_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_cowbell",
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_hub_cowbell_conversation_three_a",
		response = "nik_hub_cowbell_conversation_three_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_cowbell",
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_hub_cowbell_conversation_two_a",
		response = "nik_hub_cowbell_conversation_two_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_cowbell",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_cowbell_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_morris_hub_cowbell_idle",
		response = "nik_morris_hub_cowbell_idle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_morris_hub_cowbell_idle",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_morris_hub_cowbell_idle",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_morris_hub_cowbell_idle",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_chaos_wastes_hub_cowbell_conversation_eight_b",
		response = "pbw_chaos_wastes_hub_cowbell_conversation_eight_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_chaos_wastes_hub_cowbell_conversation_seven_b",
		response = "pbw_chaos_wastes_hub_cowbell_conversation_seven_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_chaos_wastes_hub_cowbell_conversation_six_b",
		response = "pbw_chaos_wastes_hub_cowbell_conversation_six_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_six_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_hub_cowbell_conversation_two_b",
		response = "pbw_hub_cowbell_conversation_two_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_cowbell_conversation_two_a_01",
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
		name = "pdr_chaos_wastes_hub_cowbell_conversation_eight_b",
		response = "pdr_chaos_wastes_hub_cowbell_conversation_eight_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_chaos_wastes_hub_cowbell_conversation_seven_b",
		response = "pdr_chaos_wastes_hub_cowbell_conversation_seven_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_chaos_wastes_hub_cowbell_conversation_six_b",
		response = "pdr_chaos_wastes_hub_cowbell_conversation_six_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_six_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_hub_cowbell_conversation_three_b",
		response = "pdr_hub_cowbell_conversation_three_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_cowbell_conversation_three_a_01",
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
		name = "pes_chaos_wastes_hub_cowbell_conversation_eight_b",
		response = "pes_chaos_wastes_hub_cowbell_conversation_eight_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_chaos_wastes_hub_cowbell_conversation_seven_b",
		response = "pes_chaos_wastes_hub_cowbell_conversation_seven_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_chaos_wastes_hub_cowbell_conversation_six_b",
		response = "pes_chaos_wastes_hub_cowbell_conversation_six_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_six_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_hub_cowbell_conversation_five_b",
		response = "pes_hub_cowbell_conversation_five_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_cowbell_conversation_five_a_01",
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
		name = "pwe_chaos_wastes_hub_cowbell_conversation_eight_b",
		response = "pwe_chaos_wastes_hub_cowbell_conversation_eight_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_chaos_wastes_hub_cowbell_conversation_seven_b",
		response = "pwe_chaos_wastes_hub_cowbell_conversation_seven_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_chaos_wastes_hub_cowbell_conversation_six_b",
		response = "pwe_chaos_wastes_hub_cowbell_conversation_six_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_six_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_hub_cowbell_conversation_four_b",
		response = "pwe_hub_cowbell_conversation_four_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_cowbell_conversation_four_a_01",
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
		name = "pwh_chaos_wastes_hub_cowbell_conversation_eight_b",
		response = "pwh_chaos_wastes_hub_cowbell_conversation_eight_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_eight",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_chaos_wastes_hub_cowbell_conversation_seven_b",
		response = "pwh_chaos_wastes_hub_cowbell_conversation_seven_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_seven",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_chaos_wastes_hub_cowbell_conversation_six_b",
		response = "pwh_chaos_wastes_hub_cowbell_conversation_six_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_chaos_wastes_hub_cowbell_conversation_six_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"hub_cowbell_conversation_six",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_hub_cowbell_conversation_one_b",
		response = "pwh_hub_cowbell_conversation_one_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_cowbell_conversation_one_a_01",
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
		nik_chaos_wastes_hub_cowbell_conversation_eight_a = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_distance = 20,
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
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a_01",
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a_02",
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a_01",
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a_02",
				"nik_chaos_wastes_hub_cowbell_conversation_eight_a_03",
			},
			sound_events_duration = {
				7.8802676200867,
				11.152978897095,
				8.1862916946411,
			},
		},
		nik_chaos_wastes_hub_cowbell_conversation_seven_a = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_distance = 20,
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
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a_01",
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a_02",
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a_01",
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a_02",
				"nik_chaos_wastes_hub_cowbell_conversation_seven_a_03",
			},
			sound_events_duration = {
				9.0811252593994,
				10.108687400818,
				8.8047323226929,
			},
		},
		nik_chaos_wastes_hub_cowbell_conversation_six_a = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_distance = 20,
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
				"nik_chaos_wastes_hub_cowbell_conversation_six_a_01",
				"nik_chaos_wastes_hub_cowbell_conversation_six_a_02",
				"nik_chaos_wastes_hub_cowbell_conversation_six_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_chaos_wastes_hub_cowbell_conversation_six_a_01",
				"nik_chaos_wastes_hub_cowbell_conversation_six_a_02",
				"nik_chaos_wastes_hub_cowbell_conversation_six_a_03",
			},
			sound_events_duration = {
				7.4298791885376,
				7.6911516189575,
				7.5940408706665,
			},
		},
		nik_hub_cowbell_conversation_five_a = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_cowbell_conversation_five_a_01",
			},
			sound_events = {
				[1] = "nik_hub_cowbell_conversation_five_a_01",
			},
			sound_events_duration = {
				[1] = 4.7424583435059,
			},
		},
		nik_hub_cowbell_conversation_four_a = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_cowbell_conversation_four_a_01",
			},
			sound_events = {
				[1] = "nik_hub_cowbell_conversation_four_a_01",
			},
			sound_events_duration = {
				[1] = 8.7916555404663,
			},
		},
		nik_hub_cowbell_conversation_one_a = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_cowbell_conversation_one_a_01",
			},
			sound_events = {
				[1] = "nik_hub_cowbell_conversation_one_a_01",
			},
			sound_events_duration = {
				[1] = 12.3000831604,
			},
		},
		nik_hub_cowbell_conversation_three_a = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_cowbell_conversation_three_a_01",
			},
			sound_events = {
				[1] = "nik_hub_cowbell_conversation_three_a_01",
			},
			sound_events_duration = {
				[1] = 3.879979133606,
			},
		},
		nik_hub_cowbell_conversation_two_a = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_cowbell_conversation_two_a_01",
			},
			sound_events = {
				[1] = "nik_hub_cowbell_conversation_two_a_01",
			},
			sound_events_duration = {
				[1] = 4.5291457176208,
			},
		},
		nik_morris_hub_cowbell_idle = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			randomize_indexes_n = 0,
			sound_distance = 15,
			sound_events_n = 10,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"nik_chaos_wastes_hub_cowbell_idle_01",
				"nik_chaos_wastes_hub_cowbell_idle_02",
				"nik_chaos_wastes_hub_cowbell_idle_03",
				"nik_chaos_wastes_hub_cowbell_idle_04",
				"nik_chaos_wastes_hub_cowbell_idle_05",
				"nik_chaos_wastes_hub_cowbell_idle_06",
				"nik_chaos_wastes_hub_cowbell_idle_07",
				"nik_chaos_wastes_hub_cowbell_idle_08",
				"nik_chaos_wastes_hub_cowbell_idle_09",
				"nik_chaos_wastes_hub_cowbell_idle_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_chaos_wastes_hub_cowbell_idle_01",
				"nik_chaos_wastes_hub_cowbell_idle_02",
				"nik_chaos_wastes_hub_cowbell_idle_03",
				"nik_chaos_wastes_hub_cowbell_idle_04",
				"nik_chaos_wastes_hub_cowbell_idle_05",
				"nik_chaos_wastes_hub_cowbell_idle_06",
				"nik_chaos_wastes_hub_cowbell_idle_07",
				"nik_chaos_wastes_hub_cowbell_idle_08",
				"nik_chaos_wastes_hub_cowbell_idle_09",
				"nik_chaos_wastes_hub_cowbell_idle_10",
			},
			sound_events_duration = {
				6.6889791488647,
				7.65079164505,
				6.8351459503174,
				5.6394376754761,
				5.3878750801086,
				4.8756666183472,
				3.7832083702087,
				5.7330207824707,
				4.9411249160767,
				6.0850834846497,
			},
		},
		pbw_chaos_wastes_hub_cowbell_conversation_eight_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events = {
				[1] = "pbw_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events_duration = {
				[1] = 4.941978931427,
			},
		},
		pbw_chaos_wastes_hub_cowbell_conversation_seven_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events = {
				[1] = "pbw_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events_duration = {
				[1] = 2.8179790973663,
			},
		},
		pbw_chaos_wastes_hub_cowbell_conversation_six_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events = {
				[1] = "pbw_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events_duration = {
				[1] = 4.3299999237061,
			},
		},
		pbw_hub_cowbell_conversation_two_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
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
				[1] = "pbw_hub_cowbell_conversation_two_b_01",
			},
			sound_events = {
				[1] = "pbw_hub_cowbell_conversation_two_b_01",
			},
			sound_events_duration = {
				[1] = 6.4139790534973,
			},
		},
		pdr_chaos_wastes_hub_cowbell_conversation_eight_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events = {
				[1] = "pdr_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events_duration = {
				[1] = 6.7799792289734,
			},
		},
		pdr_chaos_wastes_hub_cowbell_conversation_seven_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events = {
				[1] = "pdr_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events_duration = {
				[1] = 4.7629790306091,
			},
		},
		pdr_chaos_wastes_hub_cowbell_conversation_six_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events = {
				[1] = "pdr_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events_duration = {
				[1] = 5.9069790840149,
			},
		},
		pdr_hub_cowbell_conversation_three_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
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
				[1] = "pdr_hub_cowbell_conversation_three_b_01",
			},
			sound_events = {
				[1] = "pdr_hub_cowbell_conversation_three_b_01",
			},
			sound_events_duration = {
				[1] = 9.4389791488647,
			},
		},
		pes_chaos_wastes_hub_cowbell_conversation_eight_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events = {
				[1] = "pes_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events_duration = {
				[1] = 5.4759793281555,
			},
		},
		pes_chaos_wastes_hub_cowbell_conversation_seven_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events = {
				[1] = "pes_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events_duration = {
				[1] = 3.7229790687561,
			},
		},
		pes_chaos_wastes_hub_cowbell_conversation_six_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events = {
				[1] = "pes_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events_duration = {
				[1] = 4.5759792327881,
			},
		},
		pes_hub_cowbell_conversation_five_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
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
				[1] = "pes_hub_cowbell_conversation_five_b_01",
			},
			sound_events = {
				[1] = "pes_hub_cowbell_conversation_five_b_01",
			},
			sound_events_duration = {
				[1] = 5.7139792442322,
			},
		},
		pwe_chaos_wastes_hub_cowbell_conversation_eight_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events = {
				[1] = "pwe_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events_duration = {
				[1] = 3.7520000934601,
			},
		},
		pwe_chaos_wastes_hub_cowbell_conversation_seven_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events = {
				[1] = "pwe_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events_duration = {
				[1] = 1.9609999656677,
			},
		},
		pwe_chaos_wastes_hub_cowbell_conversation_six_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events = {
				[1] = "pwe_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events_duration = {
				[1] = 5.0929999351502,
			},
		},
		pwe_hub_cowbell_conversation_four_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
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
				[1] = "pwe_hub_cowbell_conversation_four_b_01",
			},
			sound_events = {
				[1] = "pwe_hub_cowbell_conversation_four_b_01",
			},
			sound_events_duration = {
				[1] = 5.7089791297913,
			},
		},
		pwh_chaos_wastes_hub_cowbell_conversation_eight_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events = {
				[1] = "pwh_chaos_wastes_hub_cowbell_conversation_eight_b_01",
			},
			sound_events_duration = {
				[1] = 4.0799789428711,
			},
		},
		pwh_chaos_wastes_hub_cowbell_conversation_seven_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events = {
				[1] = "pwh_chaos_wastes_hub_cowbell_conversation_seven_b_01",
			},
			sound_events_duration = {
				[1] = 3.9689791202545,
			},
		},
		pwh_chaos_wastes_hub_cowbell_conversation_six_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events = {
				[1] = "pwh_chaos_wastes_hub_cowbell_conversation_six_b_01",
			},
			sound_events_duration = {
				[1] = 5.8269791603088,
			},
		},
		pwh_hub_cowbell_conversation_one_b = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
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
				[1] = "pwh_hub_cowbell_conversation_one_b_01",
			},
			sound_events = {
				[1] = "pwh_hub_cowbell_conversation_one_b_01",
			},
			sound_events_duration = {
				[1] = 7.8259792327881,
			},
		},
	})
end
