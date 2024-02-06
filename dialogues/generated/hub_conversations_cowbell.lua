-- chunkname: @dialogues/generated/hub_conversations_cowbell.lua

return function ()
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_bardin_blk",
		response = "ndw_morris_daemon_whispers_hub_bardin_blk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers",
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				360,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon",
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_bardin",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_bardin",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_kerillian_blk",
		response = "ndw_morris_daemon_whispers_hub_kerillian_blk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				360,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon",
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kerillian",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kerillian",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_kruber_blk",
		response = "ndw_morris_daemon_whispers_hub_kruber_blk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				360,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon",
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kruber",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kruber",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_sienna_blk",
		response = "ndw_morris_daemon_whispers_hub_sienna_blk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				360,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon",
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_sienna",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_sienna",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_victor_blk",
		response = "ndw_morris_daemon_whispers_hub_victor_blk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers",
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				360,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon",
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_victor",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_victor",
				OP.ADD,
				1,
			},
		},
	})
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
		ndw_morris_daemon_whispers_hub_bardin_blk = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			intended_player_profile = "dwarf_ranger",
			randomize_indexes_n = 0,
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
				"nwd_hub_whispers_redux_bardin_01",
				"nwd_hub_whispers_redux_bardin_02",
				"nwd_hub_whispers_redux_bardin_03",
				"nwd_hub_whispers_redux_bardin_04",
				"nwd_hub_whispers_redux_bardin_05",
				"nwd_hub_whispers_redux_bardin_06",
				"nwd_hub_whispers_redux_bardin_07",
				"nwd_hub_whispers_redux_bardin_08",
				"nwd_hub_whispers_redux_bardin_09",
				"nwd_hub_whispers_redux_bardin_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nwd_hub_whispers_redux_bardin_01",
				"nwd_hub_whispers_redux_bardin_02",
				"nwd_hub_whispers_redux_bardin_03",
				"nwd_hub_whispers_redux_bardin_04",
				"nwd_hub_whispers_redux_bardin_05",
				"nwd_hub_whispers_redux_bardin_06",
				"nwd_hub_whispers_redux_bardin_07",
				"nwd_hub_whispers_redux_bardin_08",
				"nwd_hub_whispers_redux_bardin_09",
				"nwd_hub_whispers_redux_bardin_10",
			},
			sound_events_duration = {
				8.9870004653931,
				10.248000144959,
				8.2580003738403,
				9.753999710083,
				9.6129999160767,
				11.519000053406,
				13.00800037384,
				10.13300037384,
				9.1020002365112,
				8.9770002365112,
			},
		},
		ndw_morris_daemon_whispers_hub_kerillian_blk = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			intended_player_profile = "wood_elf",
			randomize_indexes_n = 0,
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
				"nwd_hub_whispers_redux_kerillian_01",
				"nwd_hub_whispers_redux_kerillian_02",
				"nwd_hub_whispers_redux_kerillian_03",
				"nwd_hub_whispers_redux_kerillian_04",
				"nwd_hub_whispers_redux_kerillian_05",
				"nwd_hub_whispers_redux_kerillian_06",
				"nwd_hub_whispers_redux_kerillian_07",
				"nwd_hub_whispers_redux_kerillian_08",
				"nwd_hub_whispers_redux_kerillian_09",
				"nwd_hub_whispers_redux_kerillian_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nwd_hub_whispers_redux_kerillian_01",
				"nwd_hub_whispers_redux_kerillian_02",
				"nwd_hub_whispers_redux_kerillian_03",
				"nwd_hub_whispers_redux_kerillian_04",
				"nwd_hub_whispers_redux_kerillian_05",
				"nwd_hub_whispers_redux_kerillian_06",
				"nwd_hub_whispers_redux_kerillian_07",
				"nwd_hub_whispers_redux_kerillian_08",
				"nwd_hub_whispers_redux_kerillian_09",
				"nwd_hub_whispers_redux_kerillian_10",
			},
			sound_events_duration = {
				9.2270002365112,
				10.237000465393,
				9.5080003738403,
				9.5920000076294,
				11.727000236511,
				11.413999557495,
				10.465999603272,
				11.237000465393,
				13.90299987793,
				13.746999740601,
			},
		},
		ndw_morris_daemon_whispers_hub_kruber_blk = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			intended_player_profile = "empire_soldier",
			randomize_indexes_n = 0,
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
				"nwd_hub_whispers_redux_kruber_01",
				"nwd_hub_whispers_redux_kruber_02",
				"nwd_hub_whispers_redux_kruber_03",
				"nwd_hub_whispers_redux_kruber_04",
				"nwd_hub_whispers_redux_kruber_05",
				"nwd_hub_whispers_redux_kruber_06",
				"nwd_hub_whispers_redux_kruber_07",
				"nwd_hub_whispers_redux_kruber_08",
				"nwd_hub_whispers_redux_kruber_09",
				"nwd_hub_whispers_redux_kruber_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nwd_hub_whispers_redux_kruber_01",
				"nwd_hub_whispers_redux_kruber_02",
				"nwd_hub_whispers_redux_kruber_03",
				"nwd_hub_whispers_redux_kruber_04",
				"nwd_hub_whispers_redux_kruber_05",
				"nwd_hub_whispers_redux_kruber_06",
				"nwd_hub_whispers_redux_kruber_07",
				"nwd_hub_whispers_redux_kruber_08",
				"nwd_hub_whispers_redux_kruber_09",
				"nwd_hub_whispers_redux_kruber_10",
			},
			sound_events_duration = {
				7.5110001564026,
				9.8830003738403,
				9.9029998779297,
				7.5310001373291,
				9.3669996261597,
				10.5640001297,
				9.9040002822876,
				9.2019996643066,
				10.914999961853,
				14.937000274658,
			},
		},
		ndw_morris_daemon_whispers_hub_sienna_blk = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			intended_player_profile = "bright_wizard",
			randomize_indexes_n = 0,
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
				"nwd_hub_whispers_redux_sienna_01",
				"nwd_hub_whispers_redux_sienna_02",
				"nwd_hub_whispers_redux_sienna_03",
				"nwd_hub_whispers_redux_sienna_04",
				"nwd_hub_whispers_redux_sienna_05",
				"nwd_hub_whispers_redux_sienna_06",
				"nwd_hub_whispers_redux_sienna_07",
				"nwd_hub_whispers_redux_sienna_08",
				"nwd_hub_whispers_redux_sienna_09",
				"nwd_hub_whispers_redux_sienna_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nwd_hub_whispers_redux_sienna_01",
				"nwd_hub_whispers_redux_sienna_02",
				"nwd_hub_whispers_redux_sienna_03",
				"nwd_hub_whispers_redux_sienna_04",
				"nwd_hub_whispers_redux_sienna_05",
				"nwd_hub_whispers_redux_sienna_06",
				"nwd_hub_whispers_redux_sienna_07",
				"nwd_hub_whispers_redux_sienna_08",
				"nwd_hub_whispers_redux_sienna_09",
				"nwd_hub_whispers_redux_sienna_10",
			},
			sound_events_duration = {
				11.100999832153,
				10.192000389099,
				10.571999549866,
				10.571999549866,
				10.222999572754,
				9.4099998474121,
				9.4670000076294,
				10.935000419617,
				10.99199962616,
				10.977999687195,
			},
		},
		ndw_morris_daemon_whispers_hub_victor_blk = {
			category = "story_talk_keep",
			database = "hub_conversations_cowbell",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			intended_player_profile = "witch_hunter",
			randomize_indexes_n = 0,
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
				"nwd_hub_whispers_redux_saltzpyre_01",
				"nwd_hub_whispers_redux_saltzpyre_02",
				"nwd_hub_whispers_redux_saltzpyre_03",
				"nwd_hub_whispers_redux_saltzpyre_04",
				"nwd_hub_whispers_redux_saltzpyre_05",
				"nwd_hub_whispers_redux_saltzpyre_06",
				"nwd_hub_whispers_redux_saltzpyre_07",
				"nwd_hub_whispers_redux_saltzpyre_08",
				"nwd_hub_whispers_redux_saltzpyre_09",
				"nwd_hub_whispers_redux_saltzpyre_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nwd_hub_whispers_redux_saltzpyre_01",
				"nwd_hub_whispers_redux_saltzpyre_02",
				"nwd_hub_whispers_redux_saltzpyre_03",
				"nwd_hub_whispers_redux_saltzpyre_04",
				"nwd_hub_whispers_redux_saltzpyre_05",
				"nwd_hub_whispers_redux_saltzpyre_06",
				"nwd_hub_whispers_redux_saltzpyre_07",
				"nwd_hub_whispers_redux_saltzpyre_08",
				"nwd_hub_whispers_redux_saltzpyre_09",
				"nwd_hub_whispers_redux_saltzpyre_10",
			},
			sound_events_duration = {
				10.260000228882,
				15.043000221252,
				11.64999961853,
				11.569000244141,
				11.609000205994,
				12.581000328064,
				11.64999961853,
				13.324000358582,
				10.335000038147,
				11.303000450134,
			},
		},
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
				8.0375413894653,
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
				9.0469789505005,
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
				7.6262292861939,
				7.8611664772034,
				7.7947292327881,
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
				[1] = 9.1497287750244,
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
