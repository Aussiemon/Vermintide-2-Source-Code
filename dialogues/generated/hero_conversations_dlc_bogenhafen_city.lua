-- chunkname: @dialogues/generated/hero_conversations_dlc_bogenhafen_city.lua

return function ()
	define_rule({
		name = "pbw_level_bogenhafen_city_story_eight_01",
		response = "pbw_level_bogenhafen_city_story_eight_01",
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
				"pwh_level_bogenhafen_city_story_eight_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pbw_level_bogenhafen_city_story_five_01",
		response = "pbw_level_bogenhafen_city_story_five_01",
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
				"pes_level_bogenhafen_city_story_five_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pbw_level_bogenhafen_city_story_four_01",
		response = "pbw_level_bogenhafen_city_story_four_01",
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
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_bogenhafen_city_story_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_bogenhafen_city_story_four_01",
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
		name = "pbw_level_bogenhafen_city_story_four_02",
		response = "pbw_level_bogenhafen_city_story_four_02",
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
				"pdr_level_bogenhafen_city_story_four_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pbw_level_bogenhafen_city_story_three_01",
		response = "pbw_level_bogenhafen_city_story_three_01",
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
				"pes_level_bogenhafen_city_story_three_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pbw_level_bogenhafen_city_story_two_01",
		response = "pbw_level_bogenhafen_city_story_two_01",
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
				"pwh_level_bogenhafen_city_story_two_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pdr_level_bogenhafen_city_story_five_01",
		response = "pdr_level_bogenhafen_city_story_five_01",
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
				"pbw_level_bogenhafen_city_story_five_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pdr_level_bogenhafen_city_story_four_01",
		response = "pdr_level_bogenhafen_city_story_four_01",
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
				"pbw_level_bogenhafen_city_story_four_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pdr_level_bogenhafen_city_story_four_02",
		response = "pdr_level_bogenhafen_city_story_four_02",
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
				"pbw_level_bogenhafen_city_story_four_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pdr_level_bogenhafen_city_story_seven_01",
		response = "pdr_level_bogenhafen_city_story_seven_01",
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pdr_level_bogenhafen_city_story_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_bogenhafen_city_story_seven_01",
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
		name = "pdr_level_bogenhafen_city_story_seven_02",
		response = "pdr_level_bogenhafen_city_story_seven_02",
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
				"pwh_level_bogenhafen_city_story_seven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pdr_level_bogenhafen_city_story_six_01",
		response = "pdr_level_bogenhafen_city_story_six_01",
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
				"pes_level_bogenhafen_city_story_six_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pdr_level_bogenhafen_city_story_six_02",
		response = "pdr_level_bogenhafen_city_story_six_02",
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
				"pwe_level_bogenhafen_city_story_six_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pdr_level_bogenhafen_city_story_twelve_01",
		response = "pdr_level_bogenhafen_city_story_twelve_01",
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
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pdr_level_bogenhafen_city_story_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_bogenhafen_city_story_twelve_01",
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
		name = "pdr_level_bogenhafen_city_story_twelve_02",
		response = "pdr_level_bogenhafen_city_story_twelve_02",
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
				"pwh_level_bogenhafen_city_story_twelve_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pes_level_bogenhafen_city_story_eight_01",
		response = "pes_level_bogenhafen_city_story_eight_01",
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_eight_01",
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
		name = "pes_level_bogenhafen_city_story_eleven_01",
		response = "pes_level_bogenhafen_city_story_eleven_01",
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
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_eleven_01",
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
		name = "pes_level_bogenhafen_city_story_eleven_02",
		response = "pes_level_bogenhafen_city_story_eleven_02",
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
				"pwh_level_bogenhafen_city_story_eleven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pes_level_bogenhafen_city_story_five_01",
		response = "pes_level_bogenhafen_city_story_five_01",
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
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_five_01",
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
		name = "pes_level_bogenhafen_city_story_nine_01",
		response = "pes_level_bogenhafen_city_story_nine_01",
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
				"pwh_level_bogenhafen_city_story_nine_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pes_level_bogenhafen_city_story_one_01",
		response = "pes_level_bogenhafen_city_story_one_01",
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
				"pwe_level_bogenhafen_city_story_one_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pes_level_bogenhafen_city_story_one_02",
		response = "pes_level_bogenhafen_city_story_one_02",
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
				"pwe_level_bogenhafen_city_story_one_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pes_level_bogenhafen_city_story_six_01",
		response = "pes_level_bogenhafen_city_story_six_01",
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
				"wood_elf",
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
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_six_01",
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
		name = "pes_level_bogenhafen_city_story_three_01",
		response = "pes_level_bogenhafen_city_story_three_01",
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
				"bright_wizard",
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
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_city_story_three_01",
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
		name = "pes_level_bogenhafen_city_story_three_02",
		response = "pes_level_bogenhafen_city_story_three_02",
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
				"pwe_level_bogenhafen_city_story_three_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwe_level_bogenhafen_city_story_one_01",
		response = "pwe_level_bogenhafen_city_story_one_01",
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
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pwe_level_bogenhafen_city_story_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_bogenhafen_city_story_one_01",
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
		name = "pwe_level_bogenhafen_city_story_one_02",
		response = "pwe_level_bogenhafen_city_story_one_02",
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
				"pes_level_bogenhafen_city_story_one_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwe_level_bogenhafen_city_story_six_01",
		response = "pwe_level_bogenhafen_city_story_six_01",
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
				"pdr_level_bogenhafen_city_story_six_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwe_level_bogenhafen_city_story_ten_01",
		response = "pwe_level_bogenhafen_city_story_ten_01",
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
				"pwh_level_bogenhafen_city_story_ten_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwe_level_bogenhafen_city_story_ten_02",
		response = "pwe_level_bogenhafen_city_story_ten_02",
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
				"pwh_level_bogenhafen_city_story_ten_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwe_level_bogenhafen_city_story_three_01",
		response = "pwe_level_bogenhafen_city_story_three_01",
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
				"pes_level_bogenhafen_city_story_three_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwe_level_bogenhafen_city_story_twelve_01",
		response = "pwe_level_bogenhafen_city_story_twelve_01",
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
				"pdr_level_bogenhafen_city_story_twelve_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwh_level_bogenhafen_city_story_eight_01",
		response = "pwh_level_bogenhafen_city_story_eight_01",
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
				"pes_level_bogenhafen_city_story_eight_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwh_level_bogenhafen_city_story_eight_02",
		response = "pwh_level_bogenhafen_city_story_eight_02",
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
				"pbw_level_bogenhafen_city_story_eight_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwh_level_bogenhafen_city_story_eleven_01",
		response = "pwh_level_bogenhafen_city_story_eleven_01",
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
				"pes_level_bogenhafen_city_story_eleven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwh_level_bogenhafen_city_story_nine_01",
		response = "pwh_level_bogenhafen_city_story_nine_01",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pwh_level_bogenhafen_city_story_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_bogenhafen_city_story_nine_01",
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
		name = "pwh_level_bogenhafen_city_story_nine_02",
		response = "pwh_level_bogenhafen_city_story_nine_02",
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
				"pes_level_bogenhafen_city_story_nine_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwh_level_bogenhafen_city_story_seven_01",
		response = "pwh_level_bogenhafen_city_story_seven_01",
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
				"pdr_level_bogenhafen_city_story_seven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwh_level_bogenhafen_city_story_ten_01",
		response = "pwh_level_bogenhafen_city_story_ten_01",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pwh_level_bogenhafen_city_story_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_bogenhafen_city_story_ten_01",
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
		name = "pwh_level_bogenhafen_city_story_ten_02",
		response = "pwh_level_bogenhafen_city_story_ten_02",
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
				"pwe_level_bogenhafen_city_story_ten_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwh_level_bogenhafen_city_story_twelve_01",
		response = "pwh_level_bogenhafen_city_story_twelve_01",
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
				"pdr_level_bogenhafen_city_story_twelve_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		name = "pwh_level_bogenhafen_city_story_two_01",
		response = "pwh_level_bogenhafen_city_story_two_01",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.NOT,
				"level_bogenhafen_city_artefact",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pwh_level_bogenhafen_city_story_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_bogenhafen_city_story_two_01",
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
		name = "pwh_level_bogenhafen_city_story_two_02",
		response = "pwh_level_bogenhafen_city_story_two_02",
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
				"pbw_level_bogenhafen_city_story_two_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
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
		pbw_level_bogenhafen_city_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_story_eight_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_story_eight_01",
			},
			sound_events_duration = {
				[1] = 4.0925626754761,
			},
		},
		pbw_level_bogenhafen_city_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_story_five_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_story_five_01",
			},
			sound_events_duration = {
				[1] = 4.769896030426,
			},
		},
		pbw_level_bogenhafen_city_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_story_four_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_story_four_01",
			},
			sound_events_duration = {
				[1] = 4.7864375114441,
			},
		},
		pbw_level_bogenhafen_city_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_story_four_02",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_story_four_02",
			},
			sound_events_duration = {
				[1] = 5.3220624923706,
			},
		},
		pbw_level_bogenhafen_city_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_story_three_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_story_three_01",
			},
			sound_events_duration = {
				[1] = 3.3082082271576,
			},
		},
		pbw_level_bogenhafen_city_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_story_two_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_story_two_01",
			},
			sound_events_duration = {
				[1] = 3.9970417022705,
			},
		},
		pdr_level_bogenhafen_city_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pdr_level_bogenhafen_city_story_five_01",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_city_story_five_01",
			},
			sound_events_duration = {
				[1] = 2.2548542022705,
			},
		},
		pdr_level_bogenhafen_city_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pdr_level_bogenhafen_city_story_four_01",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_city_story_four_01",
			},
			sound_events_duration = {
				[1] = 3.2303750514984,
			},
		},
		pdr_level_bogenhafen_city_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pdr_level_bogenhafen_city_story_four_02",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_city_story_four_02",
			},
			sound_events_duration = {
				[1] = 5.3639998435974,
			},
		},
		pdr_level_bogenhafen_city_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pdr_level_bogenhafen_city_story_seven_01",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_city_story_seven_01",
			},
			sound_events_duration = {
				[1] = 3.0330834388733,
			},
		},
		pdr_level_bogenhafen_city_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pdr_level_bogenhafen_city_story_seven_02",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_city_story_seven_02",
			},
			sound_events_duration = {
				[1] = 5.8682293891907,
			},
		},
		pdr_level_bogenhafen_city_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pdr_level_bogenhafen_city_story_six_01",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_city_story_six_01",
			},
			sound_events_duration = {
				[1] = 5.1280832290649,
			},
		},
		pdr_level_bogenhafen_city_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pdr_level_bogenhafen_city_story_six_02",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_city_story_six_02",
			},
			sound_events_duration = {
				[1] = 2.139666557312,
			},
		},
		pdr_level_bogenhafen_city_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pdr_level_bogenhafen_city_story_twelve_01",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_city_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.7088959217072,
			},
		},
		pdr_level_bogenhafen_city_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pdr_level_bogenhafen_city_story_twelve_02",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_city_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 5.2518539428711,
			},
		},
		pes_level_bogenhafen_city_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_eight_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_eight_01",
			},
			sound_events_duration = {
				[1] = 2.4199062585831,
			},
		},
		pes_level_bogenhafen_city_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_eleven_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.3341457843781,
			},
		},
		pes_level_bogenhafen_city_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_eleven_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 7.3827085494995,
			},
		},
		pes_level_bogenhafen_city_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_five_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_five_01",
			},
			sound_events_duration = {
				[1] = 6.1552081108093,
			},
		},
		pes_level_bogenhafen_city_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_nine_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_nine_01",
			},
			sound_events_duration = {
				[1] = 2.0901666879654,
			},
		},
		pes_level_bogenhafen_city_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_one_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_one_01",
			},
			sound_events_duration = {
				[1] = 3.9972290992737,
			},
		},
		pes_level_bogenhafen_city_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_one_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_one_02",
			},
			sound_events_duration = {
				[1] = 3.1776666641235,
			},
		},
		pes_level_bogenhafen_city_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_six_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_six_01",
			},
			sound_events_duration = {
				[1] = 5.2794585227966,
			},
		},
		pes_level_bogenhafen_city_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_three_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_three_01",
			},
			sound_events_duration = {
				[1] = 2.7211875915527,
			},
		},
		pes_level_bogenhafen_city_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pes_level_bogenhafen_city_story_three_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_city_story_three_02",
			},
			sound_events_duration = {
				[1] = 2.5469584465027,
			},
		},
		pwe_level_bogenhafen_city_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwe_level_bogenhafen_city_story_one_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_story_one_01",
			},
			sound_events_duration = {
				[1] = 4.0985417366028,
			},
		},
		pwe_level_bogenhafen_city_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwe_level_bogenhafen_city_story_one_02",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_story_one_02",
			},
			sound_events_duration = {
				[1] = 2.1277916431427,
			},
		},
		pwe_level_bogenhafen_city_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwe_level_bogenhafen_city_story_six_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_story_six_01",
			},
			sound_events_duration = {
				[1] = 5.1313543319702,
			},
		},
		pwe_level_bogenhafen_city_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwe_level_bogenhafen_city_story_ten_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_story_ten_01",
			},
			sound_events_duration = {
				[1] = 3.0751667022705,
			},
		},
		pwe_level_bogenhafen_city_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwe_level_bogenhafen_city_story_ten_02",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_story_ten_02",
			},
			sound_events_duration = {
				[1] = 2.8674583435059,
			},
		},
		pwe_level_bogenhafen_city_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwe_level_bogenhafen_city_story_three_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_story_three_01",
			},
			sound_events_duration = {
				[1] = 6.5022082328796,
			},
		},
		pwe_level_bogenhafen_city_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwe_level_bogenhafen_city_story_twelve_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.5711665153503,
			},
		},
		pwh_level_bogenhafen_city_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_eight_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_eight_01",
			},
			sound_events_duration = {
				[1] = 6.4808959960938,
			},
		},
		pwh_level_bogenhafen_city_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_eight_02",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_eight_02",
			},
			sound_events_duration = {
				[1] = 2.0745625495911,
			},
		},
		pwh_level_bogenhafen_city_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_eleven_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 10.440541267395,
			},
		},
		pwh_level_bogenhafen_city_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_nine_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_nine_01",
			},
			sound_events_duration = {
				[1] = 4.5808124542236,
			},
		},
		pwh_level_bogenhafen_city_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_nine_02",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_nine_02",
			},
			sound_events_duration = {
				[1] = 13.767312049866,
			},
		},
		pwh_level_bogenhafen_city_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_seven_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_seven_01",
			},
			sound_events_duration = {
				[1] = 2.4743332862854,
			},
		},
		pwh_level_bogenhafen_city_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_ten_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_ten_01",
			},
			sound_events_duration = {
				[1] = 5.6510834693909,
			},
		},
		pwh_level_bogenhafen_city_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_ten_02",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_ten_02",
			},
			sound_events_duration = {
				[1] = 7.7427082061768,
			},
		},
		pwh_level_bogenhafen_city_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_twelve_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.4855625629425,
			},
		},
		pwh_level_bogenhafen_city_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_two_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_two_01",
			},
			sound_events_duration = {
				[1] = 11.878520965576,
			},
		},
		pwh_level_bogenhafen_city_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_story_two_02",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_story_two_02",
			},
			sound_events_duration = {
				[1] = 7.0674166679382,
			},
		},
	})
end
