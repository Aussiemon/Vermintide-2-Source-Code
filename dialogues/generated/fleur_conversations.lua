-- chunkname: @dialogues/generated/fleur_conversations.lua

return function ()
	define_rule({
		name = "pbw_fleur_conversation_fifteen_01",
		probability = 1,
		response = "pbw_fleur_conversation_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pbw_fleur_conversation_fifteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_fleur_conversation_fifteen_01",
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
		name = "pbw_fleur_conversation_fifteen_02",
		probability = 1,
		response = "pbw_fleur_conversation_fifteen_02",
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
				"pes_fleur_conversation_fifteen_01",
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
		name = "pbw_fleur_conversation_fourteen_01",
		probability = 1,
		response = "pbw_fleur_conversation_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pbw_fleur_conversation_fourteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_fleur_conversation_fourteen_01",
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
		name = "pbw_fleur_conversation_fourteen_02",
		probability = 1,
		response = "pbw_fleur_conversation_fourteen_02",
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
				"pes_fleur_conversation_fourteen_01",
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
		name = "pbw_fleur_conversation_sixteen_01",
		probability = 1,
		response = "pbw_fleur_conversation_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pbw_fleur_conversation_sixteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_fleur_conversation_sixteen_01",
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
		name = "pbw_fleur_conversation_sixteen_02",
		probability = 1,
		response = "pbw_fleur_conversation_sixteen_02",
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
				"pes_fleur_conversation_sixteen_01",
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
		name = "pbw_fleur_conversation_thirteen_01",
		probability = 1,
		response = "pbw_fleur_conversation_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pbw_fleur_conversation_thirteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_fleur_conversation_thirteen_01",
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
		name = "pbw_fleur_conversation_thirteen_02",
		probability = 1,
		response = "pbw_fleur_conversation_thirteen_02",
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
				"pes_fleur_conversation_thirteen_01",
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
		name = "pbw_fleur_conversation_twentyfour_01",
		probability = 1,
		response = "pbw_fleur_conversation_twentyfour_01",
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
				"pwe_fleur_conversation_twentyfour_01",
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
		name = "pbw_fleur_conversation_twentyfour_02",
		probability = 1,
		response = "pbw_fleur_conversation_twentyfour_02",
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
				"pwe_fleur_conversation_twentyfour_02",
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
		name = "pbw_fleur_conversation_twentyseven_01",
		probability = 1,
		response = "pbw_fleur_conversation_twentyseven_01",
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
				"pdr_fleur_conversation_twentyseven_01",
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
		name = "pbw_fleur_conversation_twentyseven_02",
		probability = 1,
		response = "pbw_fleur_conversation_twentyseven_02",
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
				"pdr_fleur_conversation_twentyseven_02",
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
		name = "pbw_fleur_conversation_twentysix_01",
		probability = 1,
		response = "pbw_fleur_conversation_twentysix_01",
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
				"pwh_fleur_conversation_twentysix_01",
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
		name = "pbw_fleur_conversation_twentysix_02",
		probability = 1,
		response = "pbw_fleur_conversation_twentysix_02",
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
				"pwh_fleur_conversation_twentysix_02",
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
		name = "pdr_fleur_conversation_eight_01",
		probability = 1,
		response = "pdr_fleur_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
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
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pdr_fleur_conversation_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_fleur_conversation_eight_01",
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
		name = "pdr_fleur_conversation_eight_02",
		probability = 1,
		response = "pdr_fleur_conversation_eight_02",
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
				"pes_fleur_conversation_eight_01",
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
		name = "pdr_fleur_conversation_eight_03",
		probability = 1,
		response = "pdr_fleur_conversation_eight_03",
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
				"pes_fleur_conversation_eight_02",
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
		name = "pdr_fleur_conversation_five_01",
		probability = 1,
		response = "pdr_fleur_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
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
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pdr_fleur_conversation_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_fleur_conversation_five_01",
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
		name = "pdr_fleur_conversation_five_02",
		probability = 1,
		response = "pdr_fleur_conversation_five_02",
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
				"pes_fleur_conversation_five_01",
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
		name = "pdr_fleur_conversation_seven_01",
		probability = 1,
		response = "pdr_fleur_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
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
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pdr_fleur_conversation_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_fleur_conversation_seven_01",
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
		name = "pdr_fleur_conversation_seven_02",
		probability = 1,
		response = "pdr_fleur_conversation_seven_02",
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
				"pes_fleur_conversation_seven_01",
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
		name = "pdr_fleur_conversation_seven_03",
		probability = 1,
		response = "pdr_fleur_conversation_seven_03",
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
				"pes_fleur_conversation_seven_02",
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
		name = "pdr_fleur_conversation_six_01",
		probability = 1,
		response = "pdr_fleur_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
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
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pdr_fleur_conversation_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_fleur_conversation_six_01",
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
		name = "pdr_fleur_conversation_six_02",
		probability = 1,
		response = "pdr_fleur_conversation_six_02",
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
				"pes_fleur_conversation_six_01",
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
		name = "pdr_fleur_conversation_twentyeight_01",
		probability = 1,
		response = "pdr_fleur_conversation_twentyeight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
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
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pdr_fleur_conversation_twentyeight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_fleur_conversation_twentyeight_01",
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
		name = "pdr_fleur_conversation_twentyeight_02",
		probability = 1,
		response = "pdr_fleur_conversation_twentyeight_02",
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
				"pwe_fleur_conversation_twentyeight_01",
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
		name = "pdr_fleur_conversation_twentyseven_01",
		probability = 1,
		response = "pdr_fleur_conversation_twentyseven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
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
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pdr_fleur_conversation_twentyseven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_fleur_conversation_twentyseven_01",
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
		name = "pdr_fleur_conversation_twentyseven_02",
		probability = 1,
		response = "pdr_fleur_conversation_twentyseven_02",
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
				"pbw_fleur_conversation_twentyseven_01",
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
		name = "pdr_fleur_conversation_twentyseven_03",
		probability = 1,
		response = "pdr_fleur_conversation_twentyseven_03",
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
				"pbw_fleur_conversation_twentyseven_02",
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
		name = "pdr_fleur_conversation_twentythree_01",
		probability = 1,
		response = "pdr_fleur_conversation_twentythree_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
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
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pdr_fleur_conversation_twentythree_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_fleur_conversation_twentythree_01",
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
		name = "pdr_fleur_conversation_twentythree_02",
		probability = 1,
		response = "pdr_fleur_conversation_twentythree_02",
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
				"pwh_fleur_conversation_twentythree_01",
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
		name = "pes_fleur_conversation_eight_01",
		probability = 1,
		response = "pes_fleur_conversation_eight_01",
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
				"pdr_fleur_conversation_eight_01",
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
		name = "pes_fleur_conversation_eight_02",
		probability = 1,
		response = "pes_fleur_conversation_eight_02",
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
				"pdr_fleur_conversation_eight_02",
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
		name = "pes_fleur_conversation_eight_03",
		probability = 1,
		response = "pes_fleur_conversation_eight_03",
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
				"pdr_fleur_conversation_eight_03",
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
		name = "pes_fleur_conversation_eleven_01",
		probability = 1,
		response = "pes_fleur_conversation_eleven_01",
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
				"pwh_fleur_conversation_eleven_01",
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
		name = "pes_fleur_conversation_eleven_02",
		probability = 1,
		response = "pes_fleur_conversation_eleven_02",
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
				"pwh_fleur_conversation_eleven_02",
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
		name = "pes_fleur_conversation_eleven_03",
		probability = 1,
		response = "pes_fleur_conversation_eleven_03",
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
				"pwh_fleur_conversation_eleven_03",
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
		name = "pes_fleur_conversation_fifteen_01",
		probability = 1,
		response = "pes_fleur_conversation_fifteen_01",
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
				"pbw_fleur_conversation_fifteen_01",
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
		name = "pes_fleur_conversation_fifteen_02",
		probability = 1,
		response = "pes_fleur_conversation_fifteen_02",
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
				"pbw_fleur_conversation_fifteen_02",
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
		name = "pes_fleur_conversation_five_01",
		probability = 1,
		response = "pes_fleur_conversation_five_01",
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
				"pdr_fleur_conversation_five_01",
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
		name = "pes_fleur_conversation_five_02",
		probability = 1,
		response = "pes_fleur_conversation_five_02",
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
				"pdr_fleur_conversation_five_02",
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
		name = "pes_fleur_conversation_four_01",
		probability = 1,
		response = "pes_fleur_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pes_fleur_conversation_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_fleur_conversation_four_01",
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
		name = "pes_fleur_conversation_four_02",
		probability = 1,
		response = "pes_fleur_conversation_four_02",
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
				"pwe_fleur_conversation_four_01",
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
		name = "pes_fleur_conversation_four_03",
		probability = 1,
		response = "pes_fleur_conversation_four_03",
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
				"pwe_fleur_conversation_four_02",
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
		name = "pes_fleur_conversation_fourteen_01",
		probability = 1,
		response = "pes_fleur_conversation_fourteen_01",
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
				"pbw_fleur_conversation_fourteen_01",
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
		name = "pes_fleur_conversation_fourteen_02",
		probability = 1,
		response = "pes_fleur_conversation_fourteen_02",
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
				"pbw_fleur_conversation_fourteen_02",
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
		name = "pes_fleur_conversation_nine_01",
		probability = 1,
		response = "pes_fleur_conversation_nine_01",
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
				"pwh_fleur_conversation_nine_01",
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
		name = "pes_fleur_conversation_nine_02",
		probability = 1,
		response = "pes_fleur_conversation_nine_02",
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
				"pwh_fleur_conversation_nine_02",
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
		name = "pes_fleur_conversation_one_01",
		probability = 1,
		response = "pes_fleur_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pes_fleur_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_fleur_conversation_one_01",
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
		name = "pes_fleur_conversation_one_02",
		probability = 1,
		response = "pes_fleur_conversation_one_02",
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
				"pwe_fleur_conversation_one_01",
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
		name = "pes_fleur_conversation_one_03",
		probability = 1,
		response = "pes_fleur_conversation_one_03",
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
				"pwe_fleur_conversation_one_02",
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
		name = "pes_fleur_conversation_seven_01",
		probability = 1,
		response = "pes_fleur_conversation_seven_01",
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
				"pdr_fleur_conversation_seven_01",
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
		name = "pes_fleur_conversation_seven_02",
		probability = 1,
		response = "pes_fleur_conversation_seven_02",
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
				"pdr_fleur_conversation_seven_02",
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
		name = "pes_fleur_conversation_six_01",
		probability = 1,
		response = "pes_fleur_conversation_six_01",
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
				"pdr_fleur_conversation_six_01",
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
		name = "pes_fleur_conversation_six_02",
		probability = 1,
		response = "pes_fleur_conversation_six_02",
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
				"pdr_fleur_conversation_six_02",
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
		name = "pes_fleur_conversation_sixteen_01",
		probability = 1,
		response = "pes_fleur_conversation_sixteen_01",
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
				"pbw_fleur_conversation_sixteen_01",
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
		name = "pes_fleur_conversation_sixteen_02",
		probability = 1,
		response = "pes_fleur_conversation_sixteen_02",
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
				"pbw_fleur_conversation_sixteen_02",
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
		name = "pes_fleur_conversation_ten_01",
		probability = 1,
		response = "pes_fleur_conversation_ten_01",
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
				"pwh_fleur_conversation_ten_01",
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
		name = "pes_fleur_conversation_ten_02",
		probability = 1,
		response = "pes_fleur_conversation_ten_02",
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
				"pwh_fleur_conversation_ten_02",
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
		name = "pes_fleur_conversation_thirteen_01",
		probability = 1,
		response = "pes_fleur_conversation_thirteen_01",
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
				"pbw_fleur_conversation_thirteen_01",
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
		name = "pes_fleur_conversation_thirteen_02",
		probability = 1,
		response = "pes_fleur_conversation_thirteen_02",
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
				"pbw_fleur_conversation_thirteen_02",
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
		name = "pes_fleur_conversation_three_01",
		probability = 1,
		response = "pes_fleur_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pes_fleur_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_fleur_conversation_three_01",
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
		name = "pes_fleur_conversation_twelve_01",
		probability = 1,
		response = "pes_fleur_conversation_twelve_01",
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
				"pwh_fleur_conversation_twelve_01",
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
		name = "pes_fleur_conversation_twelve_02",
		probability = 1,
		response = "pes_fleur_conversation_twelve_02",
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
				"pwh_fleur_conversation_twelve_02",
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
		name = "pes_fleur_conversation_two_01",
		probability = 1,
		response = "pes_fleur_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pes_fleur_conversation_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_fleur_conversation_two_01",
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
		name = "pes_fleur_conversation_two_02",
		probability = 1,
		response = "pes_fleur_conversation_two_02",
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
				"pwe_fleur_conversation_two_01",
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
		name = "pwe_fleur_conversation_four_01",
		probability = 1,
		response = "pwe_fleur_conversation_four_01",
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
				"pes_fleur_conversation_four_01",
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
		name = "pwe_fleur_conversation_four_02",
		probability = 1,
		response = "pwe_fleur_conversation_four_02",
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
				"pes_fleur_conversation_four_02",
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
		name = "pwe_fleur_conversation_four_03",
		probability = 1,
		response = "pwe_fleur_conversation_four_03",
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
				"pes_fleur_conversation_four_03",
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
		name = "pwe_fleur_conversation_one_01",
		probability = 1,
		response = "pwe_fleur_conversation_one_01",
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
				"pes_fleur_conversation_one_01",
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
		name = "pwe_fleur_conversation_one_02",
		probability = 1,
		response = "pwe_fleur_conversation_one_02",
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
				"pes_fleur_conversation_one_02",
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
		name = "pwe_fleur_conversation_three_01",
		probability = 1,
		response = "pwe_fleur_conversation_three_01",
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
				"pes_fleur_conversation_three_01",
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
		name = "pwe_fleur_conversation_twentyeight_01",
		probability = 1,
		response = "pwe_fleur_conversation_twentyeight_01",
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
				"pdr_fleur_conversation_twentyeight_01",
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
		name = "pwe_fleur_conversation_twentyeight_02",
		probability = 1,
		response = "pwe_fleur_conversation_twentyeight_02",
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
				"pdr_fleur_conversation_twentyeight_02",
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
		name = "pwe_fleur_conversation_twentyfive_01",
		probability = 1,
		response = "pwe_fleur_conversation_twentyfive_01",
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
				"pwh_fleur_conversation_twentyfive_01",
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
		name = "pwe_fleur_conversation_twentyfive_02",
		probability = 1,
		response = "pwe_fleur_conversation_twentyfive_02",
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
				"pwh_fleur_conversation_twentyfive_02",
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
		name = "pwe_fleur_conversation_twentyfive_03",
		probability = 1,
		response = "pwe_fleur_conversation_twentyfive_03",
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
				"pwh_fleur_conversation_twentyfive_03",
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
		name = "pwe_fleur_conversation_twentyfour_01",
		probability = 1,
		response = "pwe_fleur_conversation_twentyfour_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pwe_fleur_conversation_twentyfour_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_fleur_conversation_twentyfour_01",
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
		name = "pwe_fleur_conversation_twentyfour_02",
		probability = 1,
		response = "pwe_fleur_conversation_twentyfour_02",
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
				"pbw_fleur_conversation_twentyfour_01",
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
		name = "pwe_fleur_conversation_twentyfour_03",
		probability = 1,
		response = "pwe_fleur_conversation_twentyfour_03",
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
				"pbw_fleur_conversation_twentyfour_02",
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
		name = "pwe_fleur_conversation_two_01",
		probability = 1,
		response = "pwe_fleur_conversation_two_01",
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
				"pes_fleur_conversation_two_01",
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
		name = "pwe_fleur_conversation_two_02",
		probability = 1,
		response = "pwe_fleur_conversation_two_02",
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
				"pes_fleur_conversation_two_02",
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
		name = "pwh_fleur_conversation_eleven_01",
		probability = 1,
		response = "pwh_fleur_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pwh_fleur_conversation_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_fleur_conversation_eleven_01",
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
		name = "pwh_fleur_conversation_eleven_02",
		probability = 1,
		response = "pwh_fleur_conversation_eleven_02",
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
				"pes_fleur_conversation_eleven_01",
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
		name = "pwh_fleur_conversation_eleven_03",
		probability = 1,
		response = "pwh_fleur_conversation_eleven_03",
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
				"pes_fleur_conversation_eleven_02",
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
		name = "pwh_fleur_conversation_nine_01",
		probability = 1,
		response = "pwh_fleur_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pwh_fleur_conversation_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_fleur_conversation_nine_01",
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
		name = "pwh_fleur_conversation_nine_02",
		probability = 1,
		response = "pwh_fleur_conversation_nine_02",
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
				"pes_fleur_conversation_nine_01",
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
		name = "pwh_fleur_conversation_nine_03",
		probability = 1,
		response = "pwh_fleur_conversation_nine_03",
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
				"pes_fleur_conversation_nine_02",
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
		name = "pwh_fleur_conversation_ten_01",
		probability = 1,
		response = "pwh_fleur_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pwh_fleur_conversation_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_fleur_conversation_ten_01",
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
		name = "pwh_fleur_conversation_ten_02",
		probability = 1,
		response = "pwh_fleur_conversation_ten_02",
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
				"pes_fleur_conversation_ten_01",
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
		name = "pwh_fleur_conversation_ten_03",
		probability = 1,
		response = "pwh_fleur_conversation_ten_03",
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
				"pes_fleur_conversation_ten_02",
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
		name = "pwh_fleur_conversation_twelve_01",
		probability = 1,
		response = "pwh_fleur_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pwh_fleur_conversation_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_fleur_conversation_twelve_01",
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
		name = "pwh_fleur_conversation_twelve_02",
		probability = 1,
		response = "pwh_fleur_conversation_twelve_02",
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
				"pes_fleur_conversation_twelve_01",
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
		name = "pwh_fleur_conversation_twentyfive_01",
		probability = 1,
		response = "pwh_fleur_conversation_twentyfive_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pwh_fleur_conversation_twentyfive_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_fleur_conversation_twentyfive_01",
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
		name = "pwh_fleur_conversation_twentyfive_02",
		probability = 1,
		response = "pwh_fleur_conversation_twentyfive_02",
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
				"pwe_fleur_conversation_twentyfive_01",
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
		name = "pwh_fleur_conversation_twentyfive_03",
		probability = 1,
		response = "pwh_fleur_conversation_twentyfive_03",
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
				"pwe_fleur_conversation_twentyfive_02",
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
		name = "pwh_fleur_conversation_twentysix_01",
		probability = 1,
		response = "pwh_fleur_conversation_twentysix_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"pwh_fleur_conversation_twentysix_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_fleur_conversation_twentysix_01",
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
		name = "pwh_fleur_conversation_twentysix_02",
		probability = 1,
		response = "pwh_fleur_conversation_twentysix_02",
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
				"pbw_fleur_conversation_twentysix_01",
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
		name = "pwh_fleur_conversation_twentythree_01",
		probability = 1,
		response = "pwh_fleur_conversation_twentythree_01",
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
				"pdr_fleur_conversation_twentythree_01",
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
		name = "pwh_fleur_conversation_twentythree_02",
		probability = 1,
		response = "pwh_fleur_conversation_twentythree_02",
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
				"pdr_fleur_conversation_twentythree_02",
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
		pbw_fleur_conversation_fifteen_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_fifteen_01",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_fifteen_01",
			},
			sound_events_duration = {
				[1] = 4.6902709007263,
			},
		},
		pbw_fleur_conversation_fifteen_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_fifteen_02",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_fifteen_02",
			},
			sound_events_duration = {
				[1] = 3.4968957901001,
			},
		},
		pbw_fleur_conversation_fourteen_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_fourteen_01",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_fourteen_01",
			},
			sound_events_duration = {
				[1] = 5.1693124771118,
			},
		},
		pbw_fleur_conversation_fourteen_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_fourteen_02",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_fourteen_02",
			},
			sound_events_duration = {
				[1] = 1.3564374446869,
			},
		},
		pbw_fleur_conversation_sixteen_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_sixteen_01",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_sixteen_01",
			},
			sound_events_duration = {
				[1] = 6.1856460571289,
			},
		},
		pbw_fleur_conversation_sixteen_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_sixteen_02",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_sixteen_02",
			},
			sound_events_duration = {
				[1] = 3.887416601181,
			},
		},
		pbw_fleur_conversation_thirteen_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_thirteen_01",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_thirteen_01",
			},
			sound_events_duration = {
				[1] = 4.4289584159851,
			},
		},
		pbw_fleur_conversation_thirteen_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_thirteen_02",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_thirteen_02",
			},
			sound_events_duration = {
				[1] = 3.2772917747498,
			},
		},
		pbw_fleur_conversation_twentyfour_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_twentyfour_01",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_twentyfour_01",
			},
			sound_events_duration = {
				[1] = 2.7445209026337,
			},
		},
		pbw_fleur_conversation_twentyfour_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_twentyfour_02",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_twentyfour_02",
			},
			sound_events_duration = {
				[1] = 4.4869585037231,
			},
		},
		pbw_fleur_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 1.4913958311081,
			},
		},
		pbw_fleur_conversation_twentyseven_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_twentyseven_02",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_twentyseven_02",
			},
			sound_events_duration = {
				[1] = 2.6101665496826,
			},
		},
		pbw_fleur_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 3.4056458473206,
			},
		},
		pbw_fleur_conversation_twentysix_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pbw_fleur_conversation_twentysix_02",
			},
			sound_events = {
				[1] = "pbw_fleur_conversation_twentysix_02",
			},
			sound_events_duration = {
				[1] = 6.1726040840149,
			},
		},
		pdr_fleur_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_eight_01",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 3.4621665477753,
			},
		},
		pdr_fleur_conversation_eight_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_eight_02",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 3.1484375,
			},
		},
		pdr_fleur_conversation_eight_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_eight_03",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_eight_03",
			},
			sound_events_duration = {
				[1] = 0.6397500038147,
			},
		},
		pdr_fleur_conversation_five_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_five_01",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 6.4927501678467,
			},
		},
		pdr_fleur_conversation_five_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_five_02",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 2.7802290916443,
			},
		},
		pdr_fleur_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_seven_01",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 4.6776251792908,
			},
		},
		pdr_fleur_conversation_seven_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_seven_02",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 2.1089792251587,
			},
		},
		pdr_fleur_conversation_seven_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_seven_03",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_seven_03",
			},
			sound_events_duration = {
				[1] = 2.017041683197,
			},
		},
		pdr_fleur_conversation_six_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_six_01",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 3.2263541221619,
			},
		},
		pdr_fleur_conversation_six_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_six_02",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 3.5835626125336,
			},
		},
		pdr_fleur_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 6.0747084617615,
			},
		},
		pdr_fleur_conversation_twentyeight_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_twentyeight_02",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_twentyeight_02",
			},
			sound_events_duration = {
				[1] = 9.3523960113525,
			},
		},
		pdr_fleur_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 4.3073959350586,
			},
		},
		pdr_fleur_conversation_twentyseven_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_twentyseven_02",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_twentyseven_02",
			},
			sound_events_duration = {
				[1] = 7.9932918548584,
			},
		},
		pdr_fleur_conversation_twentyseven_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_twentyseven_03",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_twentyseven_03",
			},
			sound_events_duration = {
				[1] = 2.2177500724792,
			},
		},
		pdr_fleur_conversation_twentythree_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_twentythree_01",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_twentythree_01",
			},
			sound_events_duration = {
				[1] = 8.1563749313354,
			},
		},
		pdr_fleur_conversation_twentythree_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pdr_fleur_conversation_twentythree_02",
			},
			sound_events = {
				[1] = "pdr_fleur_conversation_twentythree_02",
			},
			sound_events_duration = {
				[1] = 3.3758542537689,
			},
		},
		pes_fleur_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_eight_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 4.1928749084473,
			},
		},
		pes_fleur_conversation_eight_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_eight_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 2.9591250419617,
			},
		},
		pes_fleur_conversation_eight_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_eight_03",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_eight_03",
			},
			sound_events_duration = {
				[1] = 4.8964581489563,
			},
		},
		pes_fleur_conversation_eleven_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.2976665496826,
			},
		},
		pes_fleur_conversation_eleven_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 5.4573125839233,
			},
		},
		pes_fleur_conversation_eleven_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_eleven_03",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_eleven_03",
			},
			sound_events_duration = {
				[1] = 2.0257084369659,
			},
		},
		pes_fleur_conversation_fifteen_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_fifteen_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_fifteen_01",
			},
			sound_events_duration = {
				[1] = 3.1070415973663,
			},
		},
		pes_fleur_conversation_fifteen_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_fifteen_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_fifteen_02",
			},
			sound_events_duration = {
				[1] = 8.1326246261597,
			},
		},
		pes_fleur_conversation_five_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_five_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 4.5713124275208,
			},
		},
		pes_fleur_conversation_five_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_five_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 3.8380000591278,
			},
		},
		pes_fleur_conversation_four_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_four_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 3.0853958129883,
			},
		},
		pes_fleur_conversation_four_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_four_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 0.88752084970474,
			},
		},
		pes_fleur_conversation_four_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_four_03",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_four_03",
			},
			sound_events_duration = {
				[1] = 2.2256667613983,
			},
		},
		pes_fleur_conversation_fourteen_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_fourteen_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_fourteen_01",
			},
			sound_events_duration = {
				[1] = 6.085000038147,
			},
		},
		pes_fleur_conversation_fourteen_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_fourteen_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_fourteen_02",
			},
			sound_events_duration = {
				[1] = 1.8061457872391,
			},
		},
		pes_fleur_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_nine_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 2.7414166927338,
			},
		},
		pes_fleur_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_nine_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 3.138854265213,
			},
		},
		pes_fleur_conversation_one_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_one_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 2.6940207481384,
			},
		},
		pes_fleur_conversation_one_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_one_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 2.868020772934,
			},
		},
		pes_fleur_conversation_one_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_one_03",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_one_03",
			},
			sound_events_duration = {
				[1] = 2.2553541660309,
			},
		},
		pes_fleur_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_seven_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 11.278520584106,
			},
		},
		pes_fleur_conversation_seven_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_seven_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 5.4818959236145,
			},
		},
		pes_fleur_conversation_six_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_six_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 3.170458316803,
			},
		},
		pes_fleur_conversation_six_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_six_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 2.9413957595825,
			},
		},
		pes_fleur_conversation_sixteen_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_sixteen_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_sixteen_01",
			},
			sound_events_duration = {
				[1] = 3.2231042385101,
			},
		},
		pes_fleur_conversation_sixteen_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_sixteen_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_sixteen_02",
			},
			sound_events_duration = {
				[1] = 5.7121043205261,
			},
		},
		pes_fleur_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_ten_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 1.9531667232513,
			},
		},
		pes_fleur_conversation_ten_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_ten_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 2.5496459007263,
			},
		},
		pes_fleur_conversation_thirteen_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_thirteen_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_thirteen_01",
			},
			sound_events_duration = {
				[1] = 3.3167500495911,
			},
		},
		pes_fleur_conversation_thirteen_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_thirteen_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_thirteen_02",
			},
			sound_events_duration = {
				[1] = 1.6628124713898,
			},
		},
		pes_fleur_conversation_three_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_three_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 4.6890001296997,
			},
		},
		pes_fleur_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 5.2594165802002,
			},
		},
		pes_fleur_conversation_twelve_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.5606875419617,
			},
		},
		pes_fleur_conversation_two_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_two_01",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.5134999752045,
			},
		},
		pes_fleur_conversation_two_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pes_fleur_conversation_two_02",
			},
			sound_events = {
				[1] = "pes_fleur_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 2.6830832958221,
			},
		},
		pwe_fleur_conversation_four_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_four_01",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 4.86172914505,
			},
		},
		pwe_fleur_conversation_four_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_four_02",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 5.7377500534058,
			},
		},
		pwe_fleur_conversation_four_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_four_03",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_four_03",
			},
			sound_events_duration = {
				[1] = 3.2824375629425,
			},
		},
		pwe_fleur_conversation_one_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_one_01",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 1.7285416126251,
			},
		},
		pwe_fleur_conversation_one_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_one_02",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 5.1999998092651,
			},
		},
		pwe_fleur_conversation_three_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_three_01",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 8.8712291717529,
			},
		},
		pwe_fleur_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 4.4766874313355,
			},
		},
		pwe_fleur_conversation_twentyeight_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_twentyeight_02",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_twentyeight_02",
			},
			sound_events_duration = {
				[1] = 5.1695623397827,
			},
		},
		pwe_fleur_conversation_twentyfive_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_twentyfive_01",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 3.3296875953674,
			},
		},
		pwe_fleur_conversation_twentyfive_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_twentyfive_02",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 7.0694999694824,
			},
		},
		pwe_fleur_conversation_twentyfive_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_twentyfive_03",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_twentyfive_03",
			},
			sound_events_duration = {
				[1] = 2.8183124065399,
			},
		},
		pwe_fleur_conversation_twentyfour_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_twentyfour_01",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_twentyfour_01",
			},
			sound_events_duration = {
				[1] = 8.2547292709351,
			},
		},
		pwe_fleur_conversation_twentyfour_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_twentyfour_02",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_twentyfour_02",
			},
			sound_events_duration = {
				[1] = 4.5524582862854,
			},
		},
		pwe_fleur_conversation_twentyfour_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_twentyfour_03",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_twentyfour_03",
			},
			sound_events_duration = {
				[1] = 2.7769792079926,
			},
		},
		pwe_fleur_conversation_two_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 2.948499917984,
			},
		},
		pwe_fleur_conversation_two_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwe_fleur_conversation_two_02",
			},
			sound_events = {
				[1] = "pwe_fleur_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 4.9519581794739,
			},
		},
		pwh_fleur_conversation_eleven_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 5.6969585418701,
			},
		},
		pwh_fleur_conversation_eleven_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 0.566645860672,
			},
		},
		pwh_fleur_conversation_eleven_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_eleven_03",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_eleven_03",
			},
			sound_events_duration = {
				[1] = 1.5049166679382,
			},
		},
		pwh_fleur_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_nine_01",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 7.0547499656677,
			},
		},
		pwh_fleur_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_nine_02",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 6.2304582595825,
			},
		},
		pwh_fleur_conversation_nine_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_nine_03",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_nine_03",
			},
			sound_events_duration = {
				[1] = 2.7620000839233,
			},
		},
		pwh_fleur_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_ten_01",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 3.1309583187103,
			},
		},
		pwh_fleur_conversation_ten_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_ten_02",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 3.2299375534058,
			},
		},
		pwh_fleur_conversation_ten_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_ten_03",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_ten_03",
			},
			sound_events_duration = {
				[1] = 1.7563749551773,
			},
		},
		pwh_fleur_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 6.813458442688,
			},
		},
		pwh_fleur_conversation_twelve_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.7708332538605,
			},
		},
		pwh_fleur_conversation_twentyfive_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_twentyfive_01",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 4.7993750572205,
			},
		},
		pwh_fleur_conversation_twentyfive_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_twentyfive_02",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 1.4051666259766,
			},
		},
		pwh_fleur_conversation_twentyfive_03 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_twentyfive_03",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_twentyfive_03",
			},
			sound_events_duration = {
				[1] = 2.2620000839233,
			},
		},
		pwh_fleur_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 2.835000038147,
			},
		},
		pwh_fleur_conversation_twentysix_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_twentysix_02",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_twentysix_02",
			},
			sound_events_duration = {
				[1] = 2.8529999256134,
			},
		},
		pwh_fleur_conversation_twentythree_01 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_twentythree_01",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_twentythree_01",
			},
			sound_events_duration = {
				[1] = 1.7332082986832,
			},
		},
		pwh_fleur_conversation_twentythree_02 = {
			category = "story_talk_keep",
			database = "fleur_conversations",
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
				[1] = "pwh_fleur_conversation_twentythree_02",
			},
			sound_events = {
				[1] = "pwh_fleur_conversation_twentythree_02",
			},
			sound_events_duration = {
				[1] = 2.8726875782013,
			},
		},
	})
end
