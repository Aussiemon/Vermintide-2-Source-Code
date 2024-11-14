-- chunkname: @dialogues/generated/hero_conversations_dlc_drachenfels_portals.lua

return function ()
	define_rule({
		name = "pbw_portals_conversation_eight_01",
		probability = 1,
		response = "pbw_portals_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_eight_01",
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
		name = "pbw_portals_conversation_eight_02",
		probability = 1,
		response = "pbw_portals_conversation_eight_02",
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
				"pwe_portals_conversation_eight_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_portals_conversation_one_01",
		probability = 1,
		response = "pbw_portals_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_one_01",
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
		name = "pbw_portals_conversation_one_02",
		probability = 1,
		response = "pbw_portals_conversation_one_02",
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
				"pes_portals_conversation_one_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_portals_conversation_six_01",
		probability = 1,
		response = "pbw_portals_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_six_01",
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
		name = "pbw_portals_conversation_six_02",
		probability = 1,
		response = "pbw_portals_conversation_six_02",
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
				"pwh_portals_conversation_six_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_portals_conversation_twelve_01",
		probability = 1,
		response = "pbw_portals_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_twelve_01",
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
		name = "pbw_portals_conversation_twelve_02",
		probability = 1,
		response = "pbw_portals_conversation_twelve_02",
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
				"pdr_portals_conversation_twelve_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_portals_conversation_eleven_01",
		probability = 1,
		response = "pdr_portals_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_eleven_01",
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
		name = "pdr_portals_conversation_eleven_02",
		probability = 1,
		response = "pdr_portals_conversation_eleven_02",
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
				"pes_portals_conversation_eleven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_portals_conversation_five_01",
		probability = 1,
		response = "pdr_portals_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_five_01",
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
		name = "pdr_portals_conversation_five_02",
		probability = 1,
		response = "pdr_portals_conversation_five_02",
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
				"pwh_portals_conversation_five_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_portals_conversation_four_01",
		probability = 1,
		response = "pdr_portals_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_four_01",
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
		name = "pdr_portals_conversation_four_02",
		probability = 1,
		response = "pdr_portals_conversation_four_02",
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
				"pwe_portals_conversation_four_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_portals_conversation_nine_01",
		probability = 1,
		response = "pdr_portals_conversation_nine_01",
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
				"pes_portals_conversation_nine_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_portals_conversation_nine_02",
		probability = 1,
		response = "pdr_portals_conversation_nine_02",
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
				"pes_portals_conversation_nine_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_portals_conversation_twelve_01",
		probability = 1,
		response = "pdr_portals_conversation_twelve_01",
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
				"pbw_portals_conversation_twelve_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_portals_conversation_twelve_02",
		probability = 1,
		response = "pdr_portals_conversation_twelve_02",
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
				"pes_portals_conversation_twelve_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_portals_conversation_two_01",
		probability = 1,
		response = "pdr_portals_conversation_two_01",
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
				"pwh_portals_conversation_two_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_portals_conversation_eleven_01",
		probability = 1,
		response = "pes_portals_conversation_eleven_01",
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
				"pdr_portals_conversation_eleven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_portals_conversation_nine_01",
		probability = 1,
		response = "pes_portals_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_nine_01",
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
		name = "pes_portals_conversation_nine_02",
		probability = 1,
		response = "pes_portals_conversation_nine_02",
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
				"pdr_portals_conversation_nine_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_portals_conversation_one_01",
		probability = 1,
		response = "pes_portals_conversation_one_01",
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
				"pbw_portals_conversation_one_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_portals_conversation_one_02",
		probability = 1,
		response = "pes_portals_conversation_one_02",
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
				"pbw_portals_conversation_one_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_portals_conversation_seven_01",
		probability = 1,
		response = "pes_portals_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_seven_01",
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
		name = "pes_portals_conversation_three_01",
		probability = 1,
		response = "pes_portals_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_three_01",
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
		name = "pes_portals_conversation_three_02",
		probability = 1,
		response = "pes_portals_conversation_three_02",
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
				"pwh_portals_conversation_three_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_portals_conversation_twelve_01",
		probability = 1,
		response = "pes_portals_conversation_twelve_01",
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
				"pdr_portals_conversation_twelve_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_portals_conversation_eight_01",
		probability = 1,
		response = "pwe_portals_conversation_eight_01",
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
				"pbw_portals_conversation_eight_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_portals_conversation_eight_02",
		probability = 1,
		response = "pwe_portals_conversation_eight_02",
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
				"pbw_portals_conversation_eight_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_portals_conversation_four_01",
		probability = 1,
		response = "pwe_portals_conversation_four_01",
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
				"pdr_portals_conversation_four_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_portals_conversation_four_02",
		probability = 1,
		response = "pwe_portals_conversation_four_02",
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
				"pdr_portals_conversation_four_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_portals_conversation_seven_01",
		probability = 1,
		response = "pwe_portals_conversation_seven_01",
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
				"pwh_portals_conversation_seven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_portals_conversation_ten_01",
		probability = 1,
		response = "pwe_portals_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pwe_portals_conversation_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_portals_conversation_ten_01",
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
		name = "pwe_portals_conversation_two_01",
		probability = 1,
		response = "pwe_portals_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pwe_portals_conversation_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_portals_conversation_two_01",
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
		name = "pwe_portals_conversation_two_02",
		probability = 1,
		response = "pwe_portals_conversation_two_02",
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
				"pdr_portals_conversation_two_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_portals_conversation_five_01",
		probability = 1,
		response = "pwh_portals_conversation_five_01",
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
				"pdr_portals_conversation_five_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_portals_conversation_five_02",
		probability = 1,
		response = "pwh_portals_conversation_five_02",
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
				"pdr_portals_conversation_five_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_portals_conversation_seven_01",
		probability = 1,
		response = "pwh_portals_conversation_seven_01",
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
				"pes_portals_conversation_seven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_portals_conversation_seven_02",
		probability = 1,
		response = "pwh_portals_conversation_seven_02",
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
				"pwe_portals_conversation_seven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_portals_conversation_six_01",
		probability = 1,
		response = "pwh_portals_conversation_six_01",
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
				"pbw_portals_conversation_six_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_portals_conversation_ten_01",
		probability = 1,
		response = "pwh_portals_conversation_ten_01",
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
				"pwe_portals_conversation_ten_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_portals_conversation_three_01",
		probability = 1,
		response = "pwh_portals_conversation_three_01",
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
				"pes_portals_conversation_three_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_portals_conversation_two_01",
		probability = 1,
		response = "pwh_portals_conversation_two_01",
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
				"pwe_portals_conversation_two_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	add_dialogues({
		pbw_portals_conversation_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pbw_portals_conversation_eight_01",
			},
			sound_events = {
				[1] = "pbw_portals_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 7.4609789848328,
			},
		},
		pbw_portals_conversation_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pbw_portals_conversation_eight_02",
			},
			sound_events = {
				[1] = "pbw_portals_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 7.2129793167114,
			},
		},
		pbw_portals_conversation_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pbw_portals_conversation_one_01",
			},
			sound_events = {
				[1] = "pbw_portals_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 4.1929793357849,
			},
		},
		pbw_portals_conversation_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pbw_portals_conversation_one_02",
			},
			sound_events = {
				[1] = "pbw_portals_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 2.8309791088104,
			},
		},
		pbw_portals_conversation_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pbw_portals_conversation_six_01",
			},
			sound_events = {
				[1] = "pbw_portals_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 4.4079790115356,
			},
		},
		pbw_portals_conversation_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pbw_portals_conversation_six_02",
			},
			sound_events = {
				[1] = "pbw_portals_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 5.6039791107178,
			},
		},
		pbw_portals_conversation_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pbw_portals_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pbw_portals_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 1.9789791107178,
			},
		},
		pbw_portals_conversation_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pbw_portals_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pbw_portals_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.4709792137146,
			},
		},
		pdr_portals_conversation_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.1009790897369,
			},
		},
		pdr_portals_conversation_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 1.7939791679382,
			},
		},
		pdr_portals_conversation_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_five_01",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 4.8229789733887,
			},
		},
		pdr_portals_conversation_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_five_02",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 4.1079792976379,
			},
		},
		pdr_portals_conversation_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_four_01",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 6.0799789428711,
			},
		},
		pdr_portals_conversation_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_four_02",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 2.4929790496826,
			},
		},
		pdr_portals_conversation_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_nine_01",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 7.2599792480469,
			},
		},
		pdr_portals_conversation_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_nine_02",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 1.8659791946411,
			},
		},
		pdr_portals_conversation_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.5319790840149,
			},
		},
		pdr_portals_conversation_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 6.7539792060852,
			},
		},
		pdr_portals_conversation_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pdr_portals_conversation_two_01",
			},
			sound_events = {
				[1] = "pdr_portals_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 6.1009793281555,
			},
		},
		pes_portals_conversation_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pes_portals_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pes_portals_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 8.0589790344238,
			},
		},
		pes_portals_conversation_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pes_portals_conversation_nine_01",
			},
			sound_events = {
				[1] = "pes_portals_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 4.0349793434143,
			},
		},
		pes_portals_conversation_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pes_portals_conversation_nine_02",
			},
			sound_events = {
				[1] = "pes_portals_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 2.6999790668488,
			},
		},
		pes_portals_conversation_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pes_portals_conversation_one_01",
			},
			sound_events = {
				[1] = "pes_portals_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 5.209979057312,
			},
		},
		pes_portals_conversation_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pes_portals_conversation_one_02",
			},
			sound_events = {
				[1] = "pes_portals_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 3.0379791259766,
			},
		},
		pes_portals_conversation_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pes_portals_conversation_seven_01",
			},
			sound_events = {
				[1] = "pes_portals_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 3.8159792423248,
			},
		},
		pes_portals_conversation_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pes_portals_conversation_three_01",
			},
			sound_events = {
				[1] = "pes_portals_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 3.4039790630341,
			},
		},
		pes_portals_conversation_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pes_portals_conversation_three_02",
			},
			sound_events = {
				[1] = "pes_portals_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 2.4679791927338,
			},
		},
		pes_portals_conversation_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pes_portals_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pes_portals_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 7.7089791297913,
			},
		},
		pwe_portals_conversation_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwe_portals_conversation_eight_01",
			},
			sound_events = {
				[1] = "pwe_portals_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 6.2399792671204,
			},
		},
		pwe_portals_conversation_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwe_portals_conversation_eight_02",
			},
			sound_events = {
				[1] = "pwe_portals_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 3.0939791202545,
			},
		},
		pwe_portals_conversation_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwe_portals_conversation_four_01",
			},
			sound_events = {
				[1] = "pwe_portals_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 3.0969791412353,
			},
		},
		pwe_portals_conversation_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwe_portals_conversation_four_02",
			},
			sound_events = {
				[1] = "pwe_portals_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 5.191978931427,
			},
		},
		pwe_portals_conversation_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwe_portals_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwe_portals_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 1.9539791345596,
			},
		},
		pwe_portals_conversation_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwe_portals_conversation_ten_01",
			},
			sound_events = {
				[1] = "pwe_portals_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 4.76797914505,
			},
		},
		pwe_portals_conversation_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwe_portals_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_portals_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.7819790840149,
			},
		},
		pwe_portals_conversation_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwe_portals_conversation_two_02",
			},
			sound_events = {
				[1] = "pwe_portals_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 2.1959791183472,
			},
		},
		pwh_portals_conversation_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwh_portals_conversation_five_01",
			},
			sound_events = {
				[1] = "pwh_portals_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 7.209979057312,
			},
		},
		pwh_portals_conversation_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwh_portals_conversation_five_02",
			},
			sound_events = {
				[1] = "pwh_portals_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 4.3489789962769,
			},
		},
		pwh_portals_conversation_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwh_portals_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwh_portals_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 4.0019793510437,
			},
		},
		pwh_portals_conversation_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwh_portals_conversation_seven_02",
			},
			sound_events = {
				[1] = "pwh_portals_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 0.93797916173935,
			},
		},
		pwh_portals_conversation_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwh_portals_conversation_six_01",
			},
			sound_events = {
				[1] = "pwh_portals_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 12.309979438782,
			},
		},
		pwh_portals_conversation_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwh_portals_conversation_ten_01",
			},
			sound_events = {
				[1] = "pwh_portals_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 2.1499791145325,
			},
		},
		pwh_portals_conversation_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwh_portals_conversation_three_01",
			},
			sound_events = {
				[1] = "pwh_portals_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 5.6589789390564,
			},
		},
		pwh_portals_conversation_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_portals",
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
				[1] = "pwh_portals_conversation_two_01",
			},
			sound_events = {
				[1] = "pwh_portals_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 6.3519792556763,
			},
		},
	})
end
