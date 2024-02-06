-- chunkname: @dialogues/generated/dlc_cog.lua

return function ()
	define_rule({
		name = "nfl_whisper_conversation_eight_01",
		response = "nfl_whisper_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_eight_01",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"nfl_whisper_conversation_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_eight_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nfl_whisper_conversation_nine_01",
		response = "nfl_whisper_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_nine_01",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"nfl_whisper_conversation_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_nine_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nfl_whisper_conversation_seven_01",
		response = "nfl_whisper_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_six_01",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				0,
			},
			{
				"user_memory",
				"nfl_whisper_conversation_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_seven_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nfl_whisper_conversation_six_01",
		response = "nfl_whisper_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_six_01",
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nfl_whisper_conversation_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_six_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nfl_whisper_conversation_ten_01",
		response = "nfl_whisper_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_ten_01",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"user_memory",
				"nfl_whisper_conversation_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_ten_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_cog_conversation_twentyeight_01",
		response = "nik_cog_conversation_twentyeight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_cog_conversations",
			},
			{
				"global_context",
				"dr_engineer",
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
				"nik_cog_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_cog_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_cog_conversation_twentyfive_01",
		response = "nik_cog_conversation_twentyfive_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_cog_conversations",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"dr_engineer",
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
				"nik_cog_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_cog_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_cog_conversation_twentyseven_01",
		response = "nik_cog_conversation_twentyseven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_cog_conversations",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"dr_engineer",
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
				"nik_cog_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_cog_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_cog_conversation_twentysix_01",
		response = "nik_cog_conversation_twentysix_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_cog_conversations",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"dr_engineer",
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
				"nik_cog_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_cog_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_comet_conversation_five_01",
		response = "nik_comet_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations",
			},
			{
				"global_context",
				"empire_soldier",
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
				"global_context",
				"es_questingknight",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_comet_conversation_four_01",
		response = "nik_comet_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations",
			},
			{
				"global_context",
				"wood_elf",
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
				"global_context",
				"we_thornsister",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_comet_conversation_one_01",
		response = "nik_comet_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations",
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
				1,
			},
			{
				"global_context",
				"wh_priest",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_comet_conversation_three_01",
		response = "nik_comet_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations",
			},
			{
				"global_context",
				"dwarf_ranger",
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
				"global_context",
				"dr_engineer",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_comet_conversation_two_01",
		response = "nik_comet_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations",
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
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_whisper_conversation_eleven_02",
		response = "nik_whisper_conversation_eleven_02",
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
				"npp_whisper_conversation_eleven_01",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_whispers_conversation_five_01",
		response = "nik_whispers_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations",
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
				3600,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_whispers_conversation_four_01",
		response = "nik_whispers_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations",
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
				3600,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_whispers_conversation_one_01",
		response = "nik_whispers_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations",
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
				3600,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_whispers_conversation_three_01",
		response = "nik_whispers_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations",
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
				3600,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_whispers_conversation_two_01",
		response = "nik_whispers_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations",
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
				3600,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "npp_comet_conversation_ten_01",
		response = "npp_comet_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_comet_conversation_ten_01",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
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
				"user_memory",
				"npp_comet_conversation_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"npp_comet_conversation_ten_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "npp_whisper_conversation_eleven_01",
		response = "npp_whisper_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_whisper_conversation_eleven_01",
			},
			{
				"user_memory",
				"npp_whisper_conversation_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"npp_whisper_conversation_eleven_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw__comet_conversation_four_01",
		response = "pbw__comet_conversation_four_01",
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
				"pwe_comet_conversation_four_01",
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
		},
	})
	define_rule({
		name = "pbw_cog_conversation_eight_01",
		response = "pbw_cog_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pbw_cog_conversation_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_eight_01",
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
		name = "pbw_cog_conversation_eight_02",
		response = "pbw_cog_conversation_eight_02",
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
				"pdr_cog_conversation_eight_01",
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
		name = "pbw_cog_conversation_eleven_01",
		response = "pbw_cog_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pbw_cog_conversation_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_eleven_01",
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
		name = "pbw_cog_conversation_eleven_02",
		response = "pbw_cog_conversation_eleven_02",
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
				"pdr_cog_conversation_eleven_01",
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
		name = "pbw_cog_conversation_nine_01",
		response = "pbw_cog_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pbw_cog_conversation_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_nine_01",
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
		name = "pbw_cog_conversation_nine_02",
		response = "pbw_cog_conversation_nine_02",
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
				"pdr_cog_conversation_nine_01",
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
		name = "pbw_cog_conversation_seven_01",
		response = "pbw_cog_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pbw_cog_conversation_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_seven_01",
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
		name = "pbw_cog_conversation_seven_02",
		response = "pbw_cog_conversation_seven_02",
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
				"pdr_cog_conversation_seven_01",
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
		name = "pbw_cog_conversation_ten_01",
		response = "pbw_cog_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
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
				"dr_engineer",
				OP.EQ,
				1,
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
				"pbw_cog_conversation_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_ten_01",
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
		name = "pbw_cog_conversation_ten_02",
		response = "pbw_cog_conversation_ten_02",
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
				"pdr_cog_conversation_ten_01",
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
		name = "pbw_cog_conversation_twelve_01",
		response = "pbw_cog_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pbw_cog_conversation_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_twelve_01",
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
		name = "pbw_cog_conversation_twelve_02",
		response = "pbw_cog_conversation_twelve_02",
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
				"pdr_cog_conversation_twelve_01",
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
		name = "pbw_cog_conversation_twentyseven_01",
		response = "pbw_cog_conversation_twentyseven_01",
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
				"pdr_cog_conversation_twentyseven_01",
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
		name = "pbw_comet_conversation_five_01",
		response = "pbw_comet_conversation_five_01",
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
				"pes_comet_conversation_five_01",
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
		},
	})
	define_rule({
		name = "pbw_comet_conversation_six_01",
		response = "pbw_comet_conversation_six_01",
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
				"pwh_comet_conversation_six_01",
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
		name = "pbw_comet_conversation_six_02",
		response = "pbw_comet_conversation_six_02",
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
				"pwh_comet_conversation_six_02",
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
		name = "pbw_comet_conversation_ten_01",
		response = "pbw_comet_conversation_ten_01",
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
				"pes_comet_conversation_ten_02",
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
		name = "pbw_comet_conversation_two_01",
		response = "pbw_comet_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_two_01_done",
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
		},
	})
	define_rule({
		name = "pbw_comet_conversation_two_02",
		response = "pbw_comet_conversation_two_02",
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
				"pwh_comet_conversation_two_01",
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
		},
	})
	define_rule({
		name = "pbw_whisper_conversation_seven_01",
		response = "pbw_whisper_conversation_seven_01",
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
				"nfl_whisper_conversation_seven_01",
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
		name = "pbw_whisper_conversation_twelve_01",
		response = "pbw_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pbw_whisper_conversation_twelve_01_a",
		response = "pbw_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pbw_whisper_conversation_twelve_01_b",
		response = "pbw_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pbw_whisper_conversation_twelve_01_c",
		response = "pbw_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pbw_whisper_conversation_twelve_02_1",
		response = "pbw_whisper_conversation_twelve_02_1",
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
				"pwh_whisper_conversation_twelve_01",
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
		name = "pbw_whisper_conversation_twelve_02_2",
		response = "pbw_whisper_conversation_twelve_02_2",
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
				"pdr_whisper_conversation_twelve_01",
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
		name = "pbw_whisper_conversation_twelve_02_3",
		response = "pbw_whisper_conversation_twelve_02_3",
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
				"pwe_whisper_conversation_twelve_01",
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
		name = "pbw_whisper_conversation_twelve_02_4",
		response = "pbw_whisper_conversation_twelve_02_4",
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
				"pes_whisper_conversation_twelve_01",
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
		name = "pbw_whisper_conversation_twelve_03_1",
		response = "pbw_whisper_conversation_twelve_03_1",
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
				"pwh_whisper_conversation_twelve_02",
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
		name = "pbw_whisper_conversation_twelve_03_2",
		response = "pbw_whisper_conversation_twelve_03_2",
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
				"pdr_whisper_conversation_twelve_02",
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
		name = "pbw_whisper_conversation_twelve_03_3",
		response = "pbw_whisper_conversation_twelve_03_3",
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
				"pwe_whisper_conversation_twelve_02",
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
		name = "pbw_whisper_conversation_twelve_03_4",
		response = "pbw_whisper_conversation_twelve_03_4",
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
				"pes_whisper_conversation_twelve_02",
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
		name = "pbw_whispers_conversation_two_01",
		response = "pbw_whispers_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_two_01_done",
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
		},
	})
	define_rule({
		name = "pdr_cog_conversation_eight_01",
		response = "pdr_cog_conversation_eight_01",
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
				"pbw_cog_conversation_eight_01",
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
		name = "pdr_cog_conversation_eight_02",
		response = "pdr_cog_conversation_eight_02",
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
				"pbw_cog_conversation_eight_02",
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
		name = "pdr_cog_conversation_eighteen_01",
		response = "pdr_cog_conversation_eighteen_01",
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
				"pes_cog_conversation_eighteen_01",
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
		name = "pdr_cog_conversation_eighteen_02",
		response = "pdr_cog_conversation_eighteen_02",
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
				"pes_cog_conversation_eighteen_02",
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
		name = "pdr_cog_conversation_eleven_01",
		response = "pdr_cog_conversation_eleven_01",
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
				"pbw_cog_conversation_eleven_01",
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
		name = "pdr_cog_conversation_eleven_02",
		response = "pdr_cog_conversation_eleven_02",
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
				"pbw_cog_conversation_eleven_02",
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
		name = "pdr_cog_conversation_fifteen_01",
		response = "pdr_cog_conversation_fifteen_01",
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
				"pes_cog_conversation_fifteen_01",
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
		name = "pdr_cog_conversation_fifteen_02",
		response = "pdr_cog_conversation_fifteen_02",
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
				"pes_cog_conversation_fifteen_02",
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
		name = "pdr_cog_conversation_five_01",
		response = "pdr_cog_conversation_five_01",
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
				"pwe_cog_conversation_five_01",
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
		name = "pdr_cog_conversation_five_02",
		response = "pdr_cog_conversation_five_02",
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
				"pwe_cog_conversation_five_02",
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
		name = "pdr_cog_conversation_four_01",
		response = "pdr_cog_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer",
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
				"pdr_cog_conversation_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_cog_conversation_four_01",
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
		name = "pdr_cog_conversation_four_02",
		response = "pdr_cog_conversation_four_02",
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
				"pwe_cog_conversation_four_01",
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
		name = "pdr_cog_conversation_fourteen_01",
		response = "pdr_cog_conversation_fourteen_01",
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
				"pes_cog_conversation_fourteen_01",
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
		name = "pdr_cog_conversation_fourteen_02",
		response = "pdr_cog_conversation_fourteen_02",
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
				"pes_cog_conversation_fourteen_02",
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
		name = "pdr_cog_conversation_nine_01",
		response = "pdr_cog_conversation_nine_01",
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
				"pbw_cog_conversation_nine_01",
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
		name = "pdr_cog_conversation_nine_02",
		response = "pdr_cog_conversation_nine_02",
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
				"pbw_cog_conversation_nine_02",
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
		name = "pdr_cog_conversation_nineteen_01",
		response = "pdr_cog_conversation_nineteen_01",
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
				"pwh_cog_conversation_nineteen_01",
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
		name = "pdr_cog_conversation_nineteen_02",
		response = "pdr_cog_conversation_nineteen_02",
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
				"pwh_cog_conversation_nineteen_02",
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
		name = "pdr_cog_conversation_one_01",
		response = "pdr_cog_conversation_one_01",
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
				"pwe_cog_conversation_one_01",
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
		name = "pdr_cog_conversation_one_02",
		response = "pdr_cog_conversation_one_02",
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
				"pwe_cog_conversation_one_02",
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
		name = "pdr_cog_conversation_seven_01",
		response = "pdr_cog_conversation_seven_01",
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
				"pbw_cog_conversation_seven_01",
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
		name = "pdr_cog_conversation_seven_02",
		response = "pdr_cog_conversation_seven_02",
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
				"pbw_cog_conversation_seven_02",
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
		name = "pdr_cog_conversation_seventeen_01",
		response = "pdr_cog_conversation_seventeen_01",
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
				"pes_cog_conversation_seventeen_01",
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
		name = "pdr_cog_conversation_six_01",
		response = "pdr_cog_conversation_six_01",
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
				"pwe_cog_conversation_six_01",
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
		name = "pdr_cog_conversation_six_02",
		response = "pdr_cog_conversation_six_02",
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
				"pwe_cog_conversation_six_02",
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
		name = "pdr_cog_conversation_six_03",
		response = "pdr_cog_conversation_six_03",
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
				"pwe_cog_conversation_six_03",
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
		name = "pdr_cog_conversation_sixteen_01",
		response = "pdr_cog_conversation_sixteen_01",
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
				"pes_cog_conversation_sixteen_01",
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
		name = "pdr_cog_conversation_sixteen_02",
		response = "pdr_cog_conversation_sixteen_02",
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
				"pes_cog_conversation_sixteen_02",
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
		name = "pdr_cog_conversation_ten_01",
		response = "pdr_cog_conversation_ten_01",
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
				"pbw_cog_conversation_ten_01",
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
		name = "pdr_cog_conversation_ten_02",
		response = "pdr_cog_conversation_ten_02",
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
				"pbw_cog_conversation_ten_02",
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
		name = "pdr_cog_conversation_thirteen_01",
		response = "pdr_cog_conversation_thirteen_01",
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
				"pes_cog_conversation_thirteen_01",
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
		name = "pdr_cog_conversation_thirteen_02",
		response = "pdr_cog_conversation_thirteen_02",
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
				"pes_cog_conversation_thirteen_02",
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
		name = "pdr_cog_conversation_thirtythree_01",
		response = "pdr_cog_conversation_thirtythree_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				0,
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
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
				"pdr_cog_conversation_thirtythree_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_cog_conversation_thirtythree_01",
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
		name = "pdr_cog_conversation_three_01",
		response = "pdr_cog_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				0,
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pwe_cog_conversation_two_01",
				OP.EQ,
				1,
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
				"pdr_cog_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_cog_conversation_three_01",
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
		name = "pdr_cog_conversation_three_02",
		response = "pdr_cog_conversation_three_02",
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
				"pwe_cog_conversation_three_01",
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
		name = "pdr_cog_conversation_three_03",
		response = "pdr_cog_conversation_three_03",
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
				"pwe_cog_conversation_three_02",
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
		name = "pdr_cog_conversation_twelve_01",
		response = "pdr_cog_conversation_twelve_01",
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
				"pbw_cog_conversation_twelve_01",
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
		name = "pdr_cog_conversation_twelve_02",
		response = "pdr_cog_conversation_twelve_02",
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
				"pbw_cog_conversation_twelve_02",
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
		name = "pdr_cog_conversation_twenty_01",
		response = "pdr_cog_conversation_twenty_01",
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
				"pwh_cog_conversation_twenty_01",
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
		name = "pdr_cog_conversation_twenty_02",
		response = "pdr_cog_conversation_twenty_02",
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
				"pwh_cog_conversation_twenty_02",
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
		name = "pdr_cog_conversation_twenty_03",
		response = "pdr_cog_conversation_twenty_03",
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
				"pwh_cog_conversation_twenty_03",
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
		name = "pdr_cog_conversation_twentyeight_01",
		response = "pdr_cog_conversation_twentyeight_01",
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
				"nik_cog_conversation_twentyeight_01",
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
		name = "pdr_cog_conversation_twentyfive_01",
		response = "pdr_cog_conversation_twentyfive_01",
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
				"nik_cog_conversation_twentyfive_01",
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
		name = "pdr_cog_conversation_twentyfive_02",
		response = "pdr_cog_conversation_twentyfive_02",
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
				"pes_cog_conversation_twentyfive_01",
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
		name = "pdr_cog_conversation_twentyfour_02",
		response = "pdr_cog_conversation_twentyfour_02",
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
				"pwh_cog_conversation_twentyfour_01",
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
		name = "pdr_cog_conversation_twentyfour_04",
		response = "pdr_cog_conversation_twentyfour_04",
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
				"pwh_cog_conversation_twentyfour_03",
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
		name = "pdr_cog_conversation_twentyone_01",
		response = "pdr_cog_conversation_twentyone_01",
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
				"pwh_cog_conversation_twentyone_01",
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
		name = "pdr_cog_conversation_twentyone_02",
		response = "pdr_cog_conversation_twentyone_02",
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
				"pwh_cog_conversation_twentyone_02",
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
		name = "pdr_cog_conversation_twentyseven_01",
		response = "pdr_cog_conversation_twentyseven_01",
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
				"nik_cog_conversation_twentyseven_01",
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
		name = "pdr_cog_conversation_twentyseven_02",
		response = "pdr_cog_conversation_twentyseven_02",
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
				"pbw_cog_conversation_twentyseven_01",
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
		name = "pdr_cog_conversation_twentysix_01",
		response = "pdr_cog_conversation_twentysix_01",
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
				"nik_cog_conversation_twentysix_01",
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
		name = "pdr_cog_conversation_twentysix_02",
		response = "pdr_cog_conversation_twentysix_02",
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
				"pes_cog_conversation_twentysix_01",
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
		name = "pdr_cog_conversation_twentythree_02",
		response = "pdr_cog_conversation_twentythree_02",
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
				"pwh_cog_conversation_twentythree_01",
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
		name = "pdr_cog_conversation_twentythree_04",
		response = "pdr_cog_conversation_twentythree_04",
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
				"pwh_cog_conversation_twentythree_03",
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
		name = "pdr_cog_conversation_twentytwo_01",
		response = "pdr_cog_conversation_twentytwo_01",
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
				"pwh_cog_conversation_twentytwo_01",
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
		name = "pdr_cog_conversation_twentytwo_02",
		response = "pdr_cog_conversation_twentytwo_02",
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
				"pwh_cog_conversation_twentytwo_02",
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
		name = "pdr_cog_conversation_two_01",
		response = "pdr_cog_conversation_two_01",
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
				"pwe_cog_conversation_two_01",
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
		name = "pdr_cog_conversation_two_02",
		response = "pdr_cog_conversation_two_02",
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
				"pwe_cog_conversation_two_02",
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
		name = "pdr_comet_conversation_seven_01",
		response = "pdr_comet_conversation_seven_01",
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
				"pwh_comet_conversation_seven_01",
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
		name = "pdr_comet_conversation_seven_02",
		response = "pdr_comet_conversation_seven_02",
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
				"pwh_comet_conversation_seven_02",
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
		name = "pdr_comet_conversation_three_01",
		response = "pdr_comet_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_three_01_done",
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
		},
	})
	define_rule({
		name = "pdr_comet_conversation_three_02",
		response = "pdr_comet_conversation_three_02",
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
				"pwe_comet_conversation_three_01",
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
		name = "pdr_whisper_conversation_eight_01",
		response = "pdr_whisper_conversation_eight_01",
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
				"nfl_whisper_conversation_eight_01",
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
		name = "pdr_whisper_conversation_twelve_01",
		response = "pdr_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pdr_whisper_conversation_twelve_01_a",
		response = "pdr_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pdr_whisper_conversation_twelve_01_b",
		response = "pdr_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pdr_whisper_conversation_twelve_01_c",
		response = "pdr_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pdr_whisper_conversation_twelve_02_1",
		response = "pdr_whisper_conversation_twelve_02_1",
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
				"pwh_whisper_conversation_twelve_01",
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
		name = "pdr_whisper_conversation_twelve_02_2",
		response = "pdr_whisper_conversation_twelve_02_2",
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
				"pbw_whisper_conversation_twelve_01",
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
		name = "pdr_whisper_conversation_twelve_02_3",
		response = "pdr_whisper_conversation_twelve_02_3",
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
				"pwe_whisper_conversation_twelve_01",
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
		name = "pdr_whisper_conversation_twelve_02_4",
		response = "pdr_whisper_conversation_twelve_02_4",
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
				"pes_whisper_conversation_twelve_01",
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
		name = "pdr_whisper_conversation_twelve_03_1",
		response = "pdr_whisper_conversation_twelve_03_1",
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
				"pwh_whisper_conversation_twelve_02",
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
		name = "pdr_whisper_conversation_twelve_03_2",
		response = "pdr_whisper_conversation_twelve_03_2",
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
				"pbw_whisper_conversation_twelve_02",
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
		name = "pdr_whisper_conversation_twelve_03_3",
		response = "pdr_whisper_conversation_twelve_03_3",
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
				"pwe_whisper_conversation_twelve_02",
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
		name = "pdr_whisper_conversation_twelve_03_4",
		response = "pdr_whisper_conversation_twelve_03_4",
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
				"pes_whisper_conversation_twelve_02",
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
		name = "pdr_whispers_conversation_three_01",
		response = "pdr_whispers_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_three_01_done",
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
		},
	})
	define_rule({
		name = "pes_cog_conversation_eighteen_01",
		response = "pes_cog_conversation_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pes_cog_conversation_eighteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_eighteen_01",
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
		name = "pes_cog_conversation_eighteen_02",
		response = "pes_cog_conversation_eighteen_02",
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
				"pdr_cog_conversation_eighteen_01",
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
		name = "pes_cog_conversation_fifteen_01",
		response = "pes_cog_conversation_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pes_cog_conversation_fifteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_fifteen_01",
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
		name = "pes_cog_conversation_fifteen_02",
		response = "pes_cog_conversation_fifteen_02",
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
				"pdr_cog_conversation_fifteen_01",
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
		name = "pes_cog_conversation_fourteen_01",
		response = "pes_cog_conversation_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pes_cog_conversation_fourteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_fourteen_01",
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
		name = "pes_cog_conversation_fourteen_02",
		response = "pes_cog_conversation_fourteen_02",
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
				"pdr_cog_conversation_fourteen_01",
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
		name = "pes_cog_conversation_seventeen_01",
		response = "pes_cog_conversation_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pes_cog_conversation_seventeen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_seventeen_01",
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
		name = "pes_cog_conversation_seventeen_02",
		response = "pes_cog_conversation_seventeen_02",
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
				"pdr_cog_conversation_seventeen_01",
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
		name = "pes_cog_conversation_sixteen_01",
		response = "pes_cog_conversation_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pes_cog_conversation_sixteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_sixteen_01",
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
		name = "pes_cog_conversation_sixteen_02",
		response = "pes_cog_conversation_sixteen_02",
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
				"pdr_cog_conversation_sixteen_01",
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
		name = "pes_cog_conversation_thirteen_01",
		response = "pes_cog_conversation_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pes_cog_conversation_thirteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_thirteen_01",
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
		name = "pes_cog_conversation_thirteen_02",
		response = "pes_cog_conversation_thirteen_02",
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
				"pdr_cog_conversation_thirteen_01",
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
		name = "pes_cog_conversation_thirtythree_01",
		response = "pes_cog_conversation_thirtythree_01",
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
				"pdr_cog_conversation_thirtythree_01",
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
		name = "pes_cog_conversation_twentyfive_01",
		response = "pes_cog_conversation_twentyfive_01",
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
				"pdr_cog_conversation_twentyfive_01",
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
		name = "pes_cog_conversation_twentyfive_02",
		response = "pes_cog_conversation_twentyfive_02",
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
				"pdr_cog_conversation_twentyfive_02",
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
		name = "pes_cog_conversation_twentysix_01",
		response = "pes_cog_conversation_twentysix_01",
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
				"pdr_cog_conversation_twentysix_01",
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
		name = "pes_cog_conversation_twentysix_02",
		response = "pes_cog_conversation_twentysix_02",
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
				"pdr_cog_conversation_twentysix_02",
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
		name = "pes_comet_conversation_five_01",
		response = "pes_comet_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_five_01_done",
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
		},
	})
	define_rule({
		name = "pes_comet_conversation_five_02",
		response = "pes_comet_conversation_five_02",
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
				"pbw_comet_conversation_five_01",
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
		},
	})
	define_rule({
		name = "pes_comet_conversation_nine_01",
		response = "pes_comet_conversation_nine_01",
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
				"pwh_comet_conversation_nine_01",
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
		name = "pes_comet_conversation_nine_02",
		response = "pes_comet_conversation_nine_02",
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
				"pwh_comet_conversation_nine_02",
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
		name = "pes_comet_conversation_one_01",
		response = "pes_comet_conversation_one_01",
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
				"pwh_comet_conversation_one_01",
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
		},
	})
	define_rule({
		name = "pes_comet_conversation_ten_01",
		response = "pes_comet_conversation_ten_01",
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
				"npp_comet_conversation_ten_01",
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
		name = "pes_comet_conversation_ten_02",
		response = "pes_comet_conversation_ten_02",
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
				"pwh_comet_conversation_ten_01",
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
		name = "pes_whisper_conversation_ten_01",
		response = "pes_whisper_conversation_ten_01",
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
				"nfl_whisper_conversation_ten_01",
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
		name = "pes_whisper_conversation_twelve_01",
		response = "pes_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pes_whisper_conversation_twelve_01_a",
		response = "pes_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pes_whisper_conversation_twelve_01_b",
		response = "pes_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pes_whisper_conversation_twelve_01_c",
		response = "pes_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pes_whisper_conversation_twelve_02_1",
		response = "pes_whisper_conversation_twelve_02_1",
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
				"pwh_whisper_conversation_twelve_01",
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
		name = "pes_whisper_conversation_twelve_02_2",
		response = "pes_whisper_conversation_twelve_02_2",
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
				"pbw_whisper_conversation_twelve_01",
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
		name = "pes_whisper_conversation_twelve_02_3",
		response = "pes_whisper_conversation_twelve_02_3",
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
				"pdr_whisper_conversation_twelve_01",
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
		name = "pes_whisper_conversation_twelve_02_4",
		response = "pes_whisper_conversation_twelve_02_4",
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
				"pwe_whisper_conversation_twelve_01",
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
		name = "pes_whisper_conversation_twelve_03_1",
		response = "pes_whisper_conversation_twelve_03_1",
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
				"pwh_whisper_conversation_twelve_02",
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
		name = "pes_whisper_conversation_twelve_03_2",
		response = "pes_whisper_conversation_twelve_03_2",
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
				"pbw_whisper_conversation_twelve_02",
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
		name = "pes_whisper_conversation_twelve_03_3",
		response = "pes_whisper_conversation_twelve_03_3",
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
				"pdr_whisper_conversation_twelve_02",
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
		name = "pes_whisper_conversation_twelve_03_4",
		response = "pes_whisper_conversation_twelve_03_4",
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
				"pwe_whisper_conversation_twelve_02",
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
		name = "pes_whispers_conversation_five_01",
		response = "pes_whispers_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_five_01_done",
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
		},
	})
	define_rule({
		name = "pwe_cog_conversation_five_01",
		response = "pwe_cog_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwe_cog_conversation_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_cog_conversation_five_01",
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
		name = "pwe_cog_conversation_five_02",
		response = "pwe_cog_conversation_five_02",
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
				"pdr_cog_conversation_five_01",
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
		name = "pwe_cog_conversation_four_01",
		response = "pwe_cog_conversation_four_01",
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
				"pdr_cog_conversation_four_01",
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
		name = "pwe_cog_conversation_four_02",
		response = "pwe_cog_conversation_four_02",
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
				"pdr_cog_conversation_four_02",
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
		name = "pwe_cog_conversation_one_01",
		response = "pwe_cog_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwe_cog_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_cog_conversation_one_01",
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
		name = "pwe_cog_conversation_one_02",
		response = "pwe_cog_conversation_one_02",
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
				"pdr_cog_conversation_one_01",
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
		name = "pwe_cog_conversation_six_01",
		response = "pwe_cog_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwe_cog_conversation_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_cog_conversation_six_01",
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
		name = "pwe_cog_conversation_six_02",
		response = "pwe_cog_conversation_six_02",
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
				"pdr_cog_conversation_six_01",
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
		name = "pwe_cog_conversation_six_03",
		response = "pwe_cog_conversation_six_03",
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
				"pdr_cog_conversation_six_02",
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
		name = "pwe_cog_conversation_six_04",
		response = "pwe_cog_conversation_six_04",
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
				"pdr_cog_conversation_six_03",
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
		name = "pwe_cog_conversation_three_01",
		response = "pwe_cog_conversation_three_01",
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
				"pdr_cog_conversation_three_01",
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
		name = "pwe_cog_conversation_three_02",
		response = "pwe_cog_conversation_three_02",
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
				"pdr_cog_conversation_three_02",
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
		name = "pwe_cog_conversation_two_01",
		response = "pwe_cog_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwe_cog_conversation_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_cog_conversation_two_01",
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
		name = "pwe_cog_conversation_two_02",
		response = "pwe_cog_conversation_two_02",
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
				"pdr_cog_conversation_two_01",
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
		name = "pwe_comet_conversation_eight_01",
		response = "pwe_comet_conversation_eight_01",
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
				"pwh_comet_conversation_eight_01",
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
		name = "pwe_comet_conversation_eight_02",
		response = "pwe_comet_conversation_eight_02",
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
				"pwh_comet_conversation_eight_02",
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
		name = "pwe_comet_conversation_four_01",
		response = "pwe_comet_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_four_01_done",
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
		},
	})
	define_rule({
		name = "pwe_comet_conversation_four_02",
		response = "pwe_comet_conversation_four_02",
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
				"pbw__comet_conversation_four_01",
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
		},
	})
	define_rule({
		name = "pwe_comet_conversation_three_01",
		response = "pwe_comet_conversation_three_01",
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
				"pdr_comet_conversation_three_01",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_whisper_conversation_nine_01",
		response = "pwe_whisper_conversation_nine_01",
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
				"nfl_whisper_conversation_nine_01",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_whisper_conversation_twelve_01",
		response = "pwe_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwe_whisper_conversation_twelve_01_a",
		response = "pwe_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwe_whisper_conversation_twelve_01_b",
		response = "pwe_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwe_whisper_conversation_twelve_01_c",
		response = "pwe_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwe_whisper_conversation_twelve_02_1",
		response = "pwe_whisper_conversation_twelve_02_1",
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
				"pwh_whisper_conversation_twelve_01",
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
		name = "pwe_whisper_conversation_twelve_02_2",
		response = "pwe_whisper_conversation_twelve_02_2",
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
				"pbw_whisper_conversation_twelve_01",
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
		name = "pwe_whisper_conversation_twelve_02_3",
		response = "pwe_whisper_conversation_twelve_02_3",
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
				"pdr_whisper_conversation_twelve_01",
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
		name = "pwe_whisper_conversation_twelve_02_4",
		response = "pwe_whisper_conversation_twelve_02_4",
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
				"pes_whisper_conversation_twelve_01",
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
		name = "pwe_whisper_conversation_twelve_03_1",
		response = "pwe_whisper_conversation_twelve_03_1",
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
				"pwh_whisper_conversation_twelve_02",
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
		name = "pwe_whisper_conversation_twelve_03_2",
		response = "pwe_whisper_conversation_twelve_03_2",
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
				"pbw_whisper_conversation_twelve_02",
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
		name = "pwe_whisper_conversation_twelve_03_3",
		response = "pwe_whisper_conversation_twelve_03_3",
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
				"pdr_whisper_conversation_twelve_02",
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
		name = "pwe_whisper_conversation_twelve_03_4",
		response = "pwe_whisper_conversation_twelve_03_4",
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
				"pes_whisper_conversation_twelve_02",
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
		name = "pwe_whispers_conversation_four_01",
		response = "pwe_whispers_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_four_01_done",
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
		},
	})
	define_rule({
		name = "pwh_cog_conversation_eighteen_03_optional",
		response = "pwh_cog_conversation_eighteen_03_optional",
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
				"pdr_cog_conversation_eighteen_02",
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
		name = "pwh_cog_conversation_nineteen_01",
		response = "pwh_cog_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwh_cog_conversation_nineteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_nineteen_01",
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
		name = "pwh_cog_conversation_nineteen_02",
		response = "pwh_cog_conversation_nineteen_02",
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
				"pdr_cog_conversation_nineteen_01",
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
		name = "pwh_cog_conversation_twenty_01",
		response = "pwh_cog_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwh_cog_conversation_twenty_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twenty_01",
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
		name = "pwh_cog_conversation_twenty_02",
		response = "pwh_cog_conversation_twenty_02",
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
				"pdr_cog_conversation_twenty_01",
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
		name = "pwh_cog_conversation_twenty_03",
		response = "pwh_cog_conversation_twenty_03",
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
				"pdr_cog_conversation_twenty_02",
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
		name = "pwh_cog_conversation_twentyfour_01",
		response = "pwh_cog_conversation_twentyfour_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwh_cog_conversation_twentyfour_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twentyfour_01",
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
		name = "pwh_cog_conversation_twentyfour_03",
		response = "pwh_cog_conversation_twentyfour_03",
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
				"pdr_cog_conversation_twentyfour_02",
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
		name = "pwh_cog_conversation_twentyone_01",
		response = "pwh_cog_conversation_twentyone_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwh_cog_conversation_twentyone_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twentyone_01",
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
		name = "pwh_cog_conversation_twentyone_02",
		response = "pwh_cog_conversation_twentyone_02",
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
				"pdr_cog_conversation_twentyone_01",
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
		name = "pwh_cog_conversation_twentythree_01",
		response = "pwh_cog_conversation_twentythree_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwh_cog_conversation_twentythree_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twentythree_01",
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
		name = "pwh_cog_conversation_twentythree_03",
		response = "pwh_cog_conversation_twentythree_03",
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
				"pdr_cog_conversation_twentythree_02",
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
		name = "pwh_cog_conversation_twentytwo_01",
		response = "pwh_cog_conversation_twentytwo_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1,
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
				"pwh_cog_conversation_twentytwo_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twentytwo_01",
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
		name = "pwh_cog_conversation_twentytwo_02",
		response = "pwh_cog_conversation_twentytwo_02",
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
				"pdr_cog_conversation_twentytwo_01",
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
		name = "pwh_comet_conversation_eight_01",
		response = "pwh_comet_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"we_thornsister",
				OP.EQ,
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
				"pwh_comet_conversation_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_comet_conversation_eight_01",
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
		name = "pwh_comet_conversation_eight_02",
		response = "pwh_comet_conversation_eight_02",
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
				"pwe_comet_conversation_eight_01",
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
		name = "pwh_comet_conversation_nine_01",
		response = "pwh_comet_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
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
				"pwh_comet_conversation_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_comet_conversation_nine_01",
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
		name = "pwh_comet_conversation_nine_02",
		response = "pwh_comet_conversation_nine_02",
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
				"pes_comet_conversation_nine_01",
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
		name = "pwh_comet_conversation_nine_03",
		response = "pwh_comet_conversation_nine_03",
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
				"pes_comet_conversation_nine_02",
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
		name = "pwh_comet_conversation_one_01",
		response = "pwh_comet_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_one_01_done",
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
		},
	})
	define_rule({
		name = "pwh_comet_conversation_one_02",
		response = "pwh_comet_conversation_one_02",
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
				"pes_comet_conversation_one_01",
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
		},
	})
	define_rule({
		name = "pwh_comet_conversation_seven_01",
		response = "pwh_comet_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
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
				"pwh_comet_conversation_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_comet_conversation_seven_01",
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
		name = "pwh_comet_conversation_seven_02",
		response = "pwh_comet_conversation_seven_02",
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
				"pdr_comet_conversation_seven_01",
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
		name = "pwh_comet_conversation_six_01",
		response = "pwh_comet_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
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
				"pwh_comet_conversation_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_comet_conversation_six_01",
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
		name = "pwh_comet_conversation_six_02",
		response = "pwh_comet_conversation_six_02",
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
				"pbw_comet_conversation_six_01",
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
		name = "pwh_comet_conversation_ten_01",
		response = "pwh_comet_conversation_ten_01",
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
				"pes_comet_conversation_ten_01",
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
		name = "pwh_comet_conversation_two_01",
		response = "pwh_comet_conversation_two_01",
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
				"pbw_comet_conversation_two_01",
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
		},
	})
	define_rule({
		name = "pwh_whisper_conversation_six_01",
		response = "pwh_whisper_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_six_01_done",
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
		},
	})
	define_rule({
		name = "pwh_whisper_conversation_twelve_01",
		response = "pwh_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwh_whisper_conversation_twelve_01_a",
		response = "pwh_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwh_whisper_conversation_twelve_01_b",
		response = "pwh_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwh_whisper_conversation_twelve_01_c",
		response = "pwh_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"friends_close",
				OP.GT,
				1,
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
				2400,
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
				"penny_epilogue",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwh_whisper_conversation_twelve_02_1",
		response = "pwh_whisper_conversation_twelve_02_1",
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
				"pbw_whisper_conversation_twelve_01",
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
		name = "pwh_whisper_conversation_twelve_02_2",
		response = "pwh_whisper_conversation_twelve_02_2",
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
				"pdr_whisper_conversation_twelve_01",
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
		name = "pwh_whisper_conversation_twelve_02_3",
		response = "pwh_whisper_conversation_twelve_02_3",
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
				"pwe_whisper_conversation_twelve_01",
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
		name = "pwh_whisper_conversation_twelve_02_4",
		response = "pwh_whisper_conversation_twelve_02_4",
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
				"pes_whisper_conversation_twelve_01",
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
		name = "pwh_whisper_conversation_twelve_03_1",
		response = "pwh_whisper_conversation_twelve_03_1",
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
				"pbw_whisper_conversation_twelve_02",
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
		name = "pwh_whisper_conversation_twelve_03_2",
		response = "pwh_whisper_conversation_twelve_03_2",
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
				"pdr_whisper_conversation_twelve_02",
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
		name = "pwh_whisper_conversation_twelve_03_3",
		response = "pwh_whisper_conversation_twelve_03_3",
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
				"pwe_whisper_conversation_twelve_02",
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
		name = "pwh_whisper_conversation_twelve_03_4",
		response = "pwh_whisper_conversation_twelve_03_4",
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
				"pes_whisper_conversation_twelve_02",
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
		name = "pwh_whispers_conversation_one_01",
		response = "pwh_whispers_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_one_01_done",
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
		},
	})
	add_dialogues({
		nfl_whisper_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "nfl_whisper_conversation_eight_01",
			},
			sound_events = {
				[1] = "nfl_whisper_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 5.9257707595825,
			},
		},
		nfl_whisper_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "nfl_whisper_conversation_nine_01",
			},
			sound_events = {
				[1] = "nfl_whisper_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 4.2305417060852,
			},
		},
		nfl_whisper_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "nfl_whisper_conversation_seven_01",
			},
			sound_events = {
				[1] = "nfl_whisper_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 5.6835832595825,
			},
		},
		nfl_whisper_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nfl_whisper_conversation_six_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nfl_whisper_conversation_six_01",
			},
			sound_events = {
				[1] = "nfl_whisper_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 5.0436873435974,
			},
		},
		nfl_whisper_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "nfl_whisper_conversation_ten_01",
			},
			sound_events = {
				[1] = "nfl_whisper_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 8.6325836181641,
			},
		},
		nik_cog_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "nik_cog_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "nik_cog_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 5.5999999046326,
			},
		},
		nik_cog_conversation_twentyfive_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "nik_cog_conversation_twentyfive_01",
			},
			sound_events = {
				[1] = "nik_cog_conversation_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 5.48202085495,
			},
		},
		nik_cog_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "nik_cog_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "nik_cog_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 4.691771030426,
			},
		},
		nik_cog_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "nik_cog_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "nik_cog_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 5.7794375419617,
			},
		},
		nik_comet_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_comet_conversation_five_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_comet_conversation_five_01",
			},
			sound_events = {
				[1] = "nik_comet_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 3.6712708473206,
			},
		},
		nik_comet_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_comet_conversation_four_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_comet_conversation_four_01",
			},
			sound_events = {
				[1] = "nik_comet_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 3.4497916698456,
			},
		},
		nik_comet_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_comet_conversation_one_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_comet_conversation_one_01",
			},
			sound_events = {
				[1] = "nik_comet_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 4.5180206298828,
			},
		},
		nik_comet_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_comet_conversation_three_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_comet_conversation_three_01",
			},
			sound_events = {
				[1] = "nik_comet_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 3.0081250667572,
			},
		},
		nik_comet_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_comet_conversation_two_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_comet_conversation_two_01",
			},
			sound_events = {
				[1] = "nik_comet_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.5139582157135,
			},
		},
		nik_whisper_conversation_eleven_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "nik_whisper_conversation_eleven_02",
			},
			sound_events = {
				[1] = "nik_whisper_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 1.811979174614,
			},
		},
		nik_whispers_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_whispers_conversation_five_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_whispers_conversation_five_01",
			},
			sound_events = {
				[1] = "nik_whispers_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 9.2056665420532,
			},
		},
		nik_whispers_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_whispers_conversation_four_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_whispers_conversation_four_01",
			},
			sound_events = {
				[1] = "nik_whispers_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 5.117645740509,
			},
		},
		nik_whispers_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_whispers_conversation_one_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_whispers_conversation_one_01",
			},
			sound_events = {
				[1] = "nik_whispers_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 6.9405207633972,
			},
		},
		nik_whispers_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_whispers_conversation_three_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_whispers_conversation_three_01",
			},
			sound_events = {
				[1] = "nik_whispers_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 5.6573543548584,
			},
		},
		nik_whispers_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "nik_whispers_conversation_two_01_done",
			sound_distance = 20,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_whispers_conversation_two_01",
			},
			sound_events = {
				[1] = "nik_whispers_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 8.4042081832886,
			},
		},
		npp_comet_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 30,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npp_comet_conversation_ten_01",
			},
			sound_events = {
				[1] = "npp_comet_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 5.9561457633972,
			},
		},
		npp_whisper_conversation_eleven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "npp_whisper_conversation_eleven_01",
			},
			sound_events = {
				[1] = "npp_whisper_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 10.045770645142,
			},
		},
		pbw__comet_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw__comet_conversation_four_01",
			},
			sound_events = {
				[1] = "pbw__comet_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 3.0111041069031,
			},
		},
		pbw_cog_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_eight_01",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 3.718291759491,
			},
		},
		pbw_cog_conversation_eight_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_eight_02",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 3.7156040668488,
			},
		},
		pbw_cog_conversation_eleven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 2.5271875858307,
			},
		},
		pbw_cog_conversation_eleven_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 2.3788750171661,
			},
		},
		pbw_cog_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_nine_01",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 6.4061040878296,
			},
		},
		pbw_cog_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_nine_02",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 4.5795831680298,
			},
		},
		pbw_cog_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_seven_01",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 2.7225415706634,
			},
		},
		pbw_cog_conversation_seven_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_seven_02",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 4.0853543281555,
			},
		},
		pbw_cog_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_ten_01",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 6.3131041526794,
			},
		},
		pbw_cog_conversation_ten_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_ten_02",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 6.5989165306091,
			},
		},
		pbw_cog_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.0466456413269,
			},
		},
		pbw_cog_conversation_twelve_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.2721042633057,
			},
		},
		pbw_cog_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_cog_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pbw_cog_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 5.0355625152588,
			},
		},
		pbw_comet_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_comet_conversation_five_01",
			},
			sound_events = {
				[1] = "pbw_comet_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 1.9875832796097,
			},
		},
		pbw_comet_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_comet_conversation_six_01",
			},
			sound_events = {
				[1] = "pbw_comet_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 3.9485416412353,
			},
		},
		pbw_comet_conversation_six_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_comet_conversation_six_02",
			},
			sound_events = {
				[1] = "pbw_comet_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 3.1821458339691,
			},
		},
		pbw_comet_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_comet_conversation_ten_01",
			},
			sound_events = {
				[1] = "pbw_comet_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 1.9469166994095,
			},
		},
		pbw_comet_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_comet_conversation_two_01",
			},
			sound_events = {
				[1] = "pbw_comet_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 5.6779999732971,
			},
		},
		pbw_comet_conversation_two_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_comet_conversation_two_02",
			},
			sound_events = {
				[1] = "pbw_comet_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 0.80383330583572,
			},
		},
		pbw_whisper_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_seven_01",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 5.8308749198914,
			},
		},
		pbw_whisper_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 9.0235004425049,
			},
		},
		pbw_whisper_conversation_twelve_01_a = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 9.0235004425049,
			},
		},
		pbw_whisper_conversation_twelve_01_b = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 9.0235004425049,
			},
		},
		pbw_whisper_conversation_twelve_01_c = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 9.0235004425049,
			},
		},
		pbw_whisper_conversation_twelve_02_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.8890209197998,
			},
		},
		pbw_whisper_conversation_twelve_02_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.8890209197998,
			},
		},
		pbw_whisper_conversation_twelve_02_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.8890209197998,
			},
		},
		pbw_whisper_conversation_twelve_02_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.8890209197998,
			},
		},
		pbw_whisper_conversation_twelve_03_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 2.4632916450501,
			},
		},
		pbw_whisper_conversation_twelve_03_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 2.4632916450501,
			},
		},
		pbw_whisper_conversation_twelve_03_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 2.4632916450501,
			},
		},
		pbw_whisper_conversation_twelve_03_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pbw_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 2.4632916450501,
			},
		},
		pbw_whispers_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pbw_whispers_conversation_two_01",
			},
			sound_events = {
				[1] = "pbw_whispers_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 2.6285207271576,
			},
		},
		pdr_cog_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_eight_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 3.8523540496826,
			},
		},
		pdr_cog_conversation_eight_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_eight_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 6.0779581069946,
			},
		},
		pdr_cog_conversation_eighteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_eighteen_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_eighteen_01",
			},
			sound_events_duration = {
				[1] = 3.9552500247955,
			},
		},
		pdr_cog_conversation_eighteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_eighteen_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_eighteen_02",
			},
			sound_events_duration = {
				[1] = 5.8000001907349,
			},
		},
		pdr_cog_conversation_eleven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 6.7773542404175,
			},
		},
		pdr_cog_conversation_eleven_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 6.8366875648499,
			},
		},
		pdr_cog_conversation_fifteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_fifteen_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_fifteen_01",
			},
			sound_events_duration = {
				[1] = 2.3834791183472,
			},
		},
		pdr_cog_conversation_fifteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_fifteen_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_fifteen_02",
			},
			sound_events_duration = {
				[1] = 3.6782290935516,
			},
		},
		pdr_cog_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_five_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 3.3094582557678,
			},
		},
		pdr_cog_conversation_five_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_five_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 10.867896080017,
			},
		},
		pdr_cog_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_four_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 14.887145996094,
			},
		},
		pdr_cog_conversation_four_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_four_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 7.6249165534973,
			},
		},
		pdr_cog_conversation_fourteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_fourteen_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_fourteen_01",
			},
			sound_events_duration = {
				[1] = 5.4086456298828,
			},
		},
		pdr_cog_conversation_fourteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_fourteen_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_fourteen_02",
			},
			sound_events_duration = {
				[1] = 4.379958152771,
			},
		},
		pdr_cog_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_nine_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 5.0505208969116,
			},
		},
		pdr_cog_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_nine_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 4.8000001907349,
			},
		},
		pdr_cog_conversation_nineteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_nineteen_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_nineteen_01",
			},
			sound_events_duration = {
				[1] = 6.6889791488647,
			},
		},
		pdr_cog_conversation_nineteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_nineteen_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_nineteen_02",
			},
			sound_events_duration = {
				[1] = 3.6843540668488,
			},
		},
		pdr_cog_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_one_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 2.2037498950958,
			},
		},
		pdr_cog_conversation_one_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_one_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 2.5466248989105,
			},
		},
		pdr_cog_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_seven_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 4.9110832214356,
			},
		},
		pdr_cog_conversation_seven_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_seven_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 2.1845207214356,
			},
		},
		pdr_cog_conversation_seventeen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_seventeen_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_seventeen_01",
			},
			sound_events_duration = {
				[1] = 4.3484168052673,
			},
		},
		pdr_cog_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_six_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 2.8353958129883,
			},
		},
		pdr_cog_conversation_six_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_six_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 10.091124534607,
			},
		},
		pdr_cog_conversation_six_03 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_six_03",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_six_03",
			},
			sound_events_duration = {
				[1] = 3.6500000953674,
			},
		},
		pdr_cog_conversation_sixteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_sixteen_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_sixteen_01",
			},
			sound_events_duration = {
				[1] = 1.6837500333786,
			},
		},
		pdr_cog_conversation_sixteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_sixteen_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_sixteen_02",
			},
			sound_events_duration = {
				[1] = 4.7122707366943,
			},
		},
		pdr_cog_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_ten_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 6.116729259491,
			},
		},
		pdr_cog_conversation_ten_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_ten_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 3.2525207996368,
			},
		},
		pdr_cog_conversation_thirteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_thirteen_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_thirteen_01",
			},
			sound_events_duration = {
				[1] = 5.9183750152588,
			},
		},
		pdr_cog_conversation_thirteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_thirteen_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_thirteen_02",
			},
			sound_events_duration = {
				[1] = 3.4449791908264,
			},
		},
		pdr_cog_conversation_thirtythree_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_thirtythree_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_thirtythree_01",
			},
			sound_events_duration = {
				[1] = 3.1781458854675,
			},
		},
		pdr_cog_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_three_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 4.5415205955505,
			},
		},
		pdr_cog_conversation_three_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_three_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 2.0420417785645,
			},
		},
		pdr_cog_conversation_three_03 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_three_03",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_three_03",
			},
			sound_events_duration = {
				[1] = 1.3155416250229,
			},
		},
		pdr_cog_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.8287498950958,
			},
		},
		pdr_cog_conversation_twelve_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.1914999485016,
			},
		},
		pdr_cog_conversation_twenty_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twenty_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twenty_01",
			},
			sound_events_duration = {
				[1] = 3.8791666030884,
			},
		},
		pdr_cog_conversation_twenty_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twenty_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twenty_02",
			},
			sound_events_duration = {
				[1] = 3.9562499523163,
			},
		},
		pdr_cog_conversation_twenty_03 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twenty_03",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twenty_03",
			},
			sound_events_duration = {
				[1] = 3.5379583835602,
			},
		},
		pdr_cog_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 4.0808334350586,
			},
		},
		pdr_cog_conversation_twentyfive_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentyfive_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 1.19431245327,
			},
		},
		pdr_cog_conversation_twentyfive_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentyfive_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 2.8175415992737,
			},
		},
		pdr_cog_conversation_twentyfour_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentyfour_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentyfour_02",
			},
			sound_events_duration = {
				[1] = 5.0818333625794,
			},
		},
		pdr_cog_conversation_twentyfour_04 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentyfour_04",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentyfour_04",
			},
			sound_events_duration = {
				[1] = 2.0934791564941,
			},
		},
		pdr_cog_conversation_twentyone_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentyone_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentyone_01",
			},
			sound_events_duration = {
				[1] = 6.1236248016357,
			},
		},
		pdr_cog_conversation_twentyone_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentyone_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentyone_02",
			},
			sound_events_duration = {
				[1] = 6.2073335647583,
			},
		},
		pdr_cog_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 5,
			},
		},
		pdr_cog_conversation_twentyseven_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentyseven_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentyseven_02",
			},
			sound_events_duration = {
				[1] = 5.8883123397827,
			},
		},
		pdr_cog_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 2.2151458263397,
			},
		},
		pdr_cog_conversation_twentysix_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentysix_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentysix_02",
			},
			sound_events_duration = {
				[1] = 4.5098123550415,
			},
		},
		pdr_cog_conversation_twentythree_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentythree_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentythree_02",
			},
			sound_events_duration = {
				[1] = 5.248583316803,
			},
		},
		pdr_cog_conversation_twentythree_04 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentythree_04",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentythree_04",
			},
			sound_events_duration = {
				[1] = 4.1367707252502,
			},
		},
		pdr_cog_conversation_twentytwo_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentytwo_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentytwo_01",
			},
			sound_events_duration = {
				[1] = 5.7153539657593,
			},
		},
		pdr_cog_conversation_twentytwo_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_twentytwo_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_twentytwo_02",
			},
			sound_events_duration = {
				[1] = 3.2482707500458,
			},
		},
		pdr_cog_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_two_01",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.3367290496826,
			},
		},
		pdr_cog_conversation_two_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_cog_conversation_two_02",
			},
			sound_events = {
				[1] = "pdr_cog_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 3.3457291126251,
			},
		},
		pdr_comet_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_comet_conversation_seven_01",
			},
			sound_events = {
				[1] = "pdr_comet_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 9.2746458053589,
			},
		},
		pdr_comet_conversation_seven_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_comet_conversation_seven_02",
			},
			sound_events = {
				[1] = "pdr_comet_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 6.9253540039063,
			},
		},
		pdr_comet_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_comet_conversation_three_01",
			},
			sound_events = {
				[1] = "pdr_comet_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 4.5940418243408,
			},
		},
		pdr_comet_conversation_three_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_comet_conversation_three_02",
			},
			sound_events = {
				[1] = "pdr_comet_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 4.929229259491,
			},
		},
		pdr_whisper_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_eight_01",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 6.1473331451416,
			},
		},
		pdr_whisper_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.2766456604004,
			},
		},
		pdr_whisper_conversation_twelve_01_a = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.2766456604004,
			},
		},
		pdr_whisper_conversation_twelve_01_b = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.2766456604004,
			},
		},
		pdr_whisper_conversation_twelve_01_c = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.2766456604004,
			},
		},
		pdr_whisper_conversation_twelve_02_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.46129155159,
			},
		},
		pdr_whisper_conversation_twelve_02_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.46129155159,
			},
		},
		pdr_whisper_conversation_twelve_02_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.46129155159,
			},
		},
		pdr_whisper_conversation_twelve_02_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.46129155159,
			},
		},
		pdr_whisper_conversation_twelve_03_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.8102083206177,
			},
		},
		pdr_whisper_conversation_twelve_03_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.8102083206177,
			},
		},
		pdr_whisper_conversation_twelve_03_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.8102083206177,
			},
		},
		pdr_whisper_conversation_twelve_03_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pdr_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.8102083206177,
			},
		},
		pdr_whispers_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pdr_whispers_conversation_three_01",
			},
			sound_events = {
				[1] = "pdr_whispers_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 4.7386665344238,
			},
		},
		pes_cog_conversation_eighteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_eighteen_01",
			},
			sound_events = {
				[1] = "pes_cog_conversation_eighteen_01",
			},
			sound_events_duration = {
				[1] = 4.2832708358765,
			},
		},
		pes_cog_conversation_eighteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_eighteen_02",
			},
			sound_events = {
				[1] = "pes_cog_conversation_eighteen_02",
			},
			sound_events_duration = {
				[1] = 3.7772707939148,
			},
		},
		pes_cog_conversation_fifteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_fifteen_01",
			},
			sound_events = {
				[1] = "pes_cog_conversation_fifteen_01",
			},
			sound_events_duration = {
				[1] = 4.8191456794739,
			},
		},
		pes_cog_conversation_fifteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_fifteen_02",
			},
			sound_events = {
				[1] = "pes_cog_conversation_fifteen_02",
			},
			sound_events_duration = {
				[1] = 5.6447081565857,
			},
		},
		pes_cog_conversation_fourteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_fourteen_01",
			},
			sound_events = {
				[1] = "pes_cog_conversation_fourteen_01",
			},
			sound_events_duration = {
				[1] = 5.0386877059936,
			},
		},
		pes_cog_conversation_fourteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_fourteen_02",
			},
			sound_events = {
				[1] = "pes_cog_conversation_fourteen_02",
			},
			sound_events_duration = {
				[1] = 4.6543750762939,
			},
		},
		pes_cog_conversation_seventeen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_seventeen_01",
			},
			sound_events = {
				[1] = "pes_cog_conversation_seventeen_01",
			},
			sound_events_duration = {
				[1] = 3.1968333721161,
			},
		},
		pes_cog_conversation_seventeen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_seventeen_02",
			},
			sound_events = {
				[1] = "pes_cog_conversation_seventeen_02",
			},
			sound_events_duration = {
				[1] = 3.7183542251587,
			},
		},
		pes_cog_conversation_sixteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_sixteen_01",
			},
			sound_events = {
				[1] = "pes_cog_conversation_sixteen_01",
			},
			sound_events_duration = {
				[1] = 4.9342918395996,
			},
		},
		pes_cog_conversation_sixteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_sixteen_02",
			},
			sound_events = {
				[1] = "pes_cog_conversation_sixteen_02",
			},
			sound_events_duration = {
				[1] = 3.3329792022705,
			},
		},
		pes_cog_conversation_thirteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_thirteen_01",
			},
			sound_events = {
				[1] = "pes_cog_conversation_thirteen_01",
			},
			sound_events_duration = {
				[1] = 4.0050415992737,
			},
		},
		pes_cog_conversation_thirteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_thirteen_02",
			},
			sound_events = {
				[1] = "pes_cog_conversation_thirteen_02",
			},
			sound_events_duration = {
				[1] = 4.5328540802002,
			},
		},
		pes_cog_conversation_thirtythree_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_thirtythree_01",
			},
			sound_events = {
				[1] = "pes_cog_conversation_thirtythree_01",
			},
			sound_events_duration = {
				[1] = 3.709625005722,
			},
		},
		pes_cog_conversation_twentyfive_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_twentyfive_01",
			},
			sound_events = {
				[1] = "pes_cog_conversation_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 5.3104791641235,
			},
		},
		pes_cog_conversation_twentyfive_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_twentyfive_02",
			},
			sound_events = {
				[1] = "pes_cog_conversation_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 3.2541875839233,
			},
		},
		pes_cog_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pes_cog_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 2.2315833568573,
			},
		},
		pes_cog_conversation_twentysix_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_cog_conversation_twentysix_02",
			},
			sound_events = {
				[1] = "pes_cog_conversation_twentysix_02",
			},
			sound_events_duration = {
				[1] = 0.73054164648056,
			},
		},
		pes_comet_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_comet_conversation_five_01",
			},
			sound_events = {
				[1] = "pes_comet_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 2.6592500209808,
			},
		},
		pes_comet_conversation_five_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_comet_conversation_five_02",
			},
			sound_events = {
				[1] = "pes_comet_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 2.9530625343323,
			},
		},
		pes_comet_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_comet_conversation_nine_01",
			},
			sound_events = {
				[1] = "pes_comet_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 2.3602707386017,
			},
		},
		pes_comet_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_comet_conversation_nine_02",
			},
			sound_events = {
				[1] = "pes_comet_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 6.9665832519531,
			},
		},
		pes_comet_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_comet_conversation_one_01",
			},
			sound_events = {
				[1] = "pes_comet_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 2.5339999198914,
			},
		},
		pes_comet_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_comet_conversation_ten_01",
			},
			sound_events = {
				[1] = "pes_comet_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 2.876312494278,
			},
		},
		pes_comet_conversation_ten_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_comet_conversation_ten_02",
			},
			sound_events = {
				[1] = "pes_comet_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 2.3201665878296,
			},
		},
		pes_whisper_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_ten_01",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 2.5439167022705,
			},
		},
		pes_whisper_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.7365000247955,
			},
		},
		pes_whisper_conversation_twelve_01_a = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.7365000247955,
			},
		},
		pes_whisper_conversation_twelve_01_b = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.7365000247955,
			},
		},
		pes_whisper_conversation_twelve_01_c = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.7365000247955,
			},
		},
		pes_whisper_conversation_twelve_02_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 1.8397916555405,
			},
		},
		pes_whisper_conversation_twelve_02_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 1.8397916555405,
			},
		},
		pes_whisper_conversation_twelve_02_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 1.8397916555405,
			},
		},
		pes_whisper_conversation_twelve_02_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 1.8397916555405,
			},
		},
		pes_whisper_conversation_twelve_03_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.066645860672,
			},
		},
		pes_whisper_conversation_twelve_03_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.066645860672,
			},
		},
		pes_whisper_conversation_twelve_03_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.066645860672,
			},
		},
		pes_whisper_conversation_twelve_03_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pes_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.066645860672,
			},
		},
		pes_whispers_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pes_whispers_conversation_five_01",
			},
			sound_events = {
				[1] = "pes_whispers_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 4.6915416717529,
			},
		},
		pwe_cog_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_five_01",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 3.4807500839233,
			},
		},
		pwe_cog_conversation_five_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_five_02",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 9.0612087249756,
			},
		},
		pwe_cog_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_four_01",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 1.6539583206177,
			},
		},
		pwe_cog_conversation_four_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_four_02",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 4.8628334999084,
			},
		},
		pwe_cog_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_one_01",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.7999999523163,
			},
		},
		pwe_cog_conversation_one_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_one_02",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 2.021666765213,
			},
		},
		pwe_cog_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_six_01",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 3.6344375610352,
			},
		},
		pwe_cog_conversation_six_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_six_02",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 2.6673958301544,
			},
		},
		pwe_cog_conversation_six_03 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_six_03",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_six_03",
			},
			sound_events_duration = {
				[1] = 2.8377709388733,
			},
		},
		pwe_cog_conversation_six_04 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_six_04",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_six_04",
			},
			sound_events_duration = {
				[1] = 2.020124912262,
			},
		},
		pwe_cog_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_three_01",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 5.8594164848328,
			},
		},
		pwe_cog_conversation_three_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_three_02",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 2.7198541164398,
			},
		},
		pwe_cog_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 2.165020942688,
			},
		},
		pwe_cog_conversation_two_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_cog_conversation_two_02",
			},
			sound_events = {
				[1] = "pwe_cog_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 4.0164375305176,
			},
		},
		pwe_comet_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_comet_conversation_eight_01",
			},
			sound_events = {
				[1] = "pwe_comet_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 6.3860206604004,
			},
		},
		pwe_comet_conversation_eight_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_comet_conversation_eight_02",
			},
			sound_events = {
				[1] = "pwe_comet_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 3.104875087738,
			},
		},
		pwe_comet_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_comet_conversation_four_01",
			},
			sound_events = {
				[1] = "pwe_comet_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 5.090416431427,
			},
		},
		pwe_comet_conversation_four_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_comet_conversation_four_02",
			},
			sound_events = {
				[1] = "pwe_comet_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 6.3502292633057,
			},
		},
		pwe_comet_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_comet_conversation_three_01",
			},
			sound_events = {
				[1] = "pwe_comet_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 2.2755417823791,
			},
		},
		pwe_whisper_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_nine_01",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 5.8071875572205,
			},
		},
		pwe_whisper_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 5.2204375267029,
			},
		},
		pwe_whisper_conversation_twelve_01_a = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 5.2204375267029,
			},
		},
		pwe_whisper_conversation_twelve_01_b = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 5.2204375267029,
			},
		},
		pwe_whisper_conversation_twelve_01_c = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 5.2204375267029,
			},
		},
		pwe_whisper_conversation_twelve_02_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.4909167289734,
			},
		},
		pwe_whisper_conversation_twelve_02_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.4909167289734,
			},
		},
		pwe_whisper_conversation_twelve_02_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.4909167289734,
			},
		},
		pwe_whisper_conversation_twelve_02_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.4909167289734,
			},
		},
		pwe_whisper_conversation_twelve_03_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.4925416707993,
			},
		},
		pwe_whisper_conversation_twelve_03_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.4925416707993,
			},
		},
		pwe_whisper_conversation_twelve_03_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.4925416707993,
			},
		},
		pwe_whisper_conversation_twelve_03_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pwe_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 1.4925416707993,
			},
		},
		pwe_whispers_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwe_whispers_conversation_four_01",
			},
			sound_events = {
				[1] = "pwe_whispers_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 2.9549791812897,
			},
		},
		pwh_cog_conversation_eighteen_03_optional = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_eighteen_03_optional",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_eighteen_03_optional",
			},
			sound_events_duration = {
				[1] = 1.1228541135788,
			},
		},
		pwh_cog_conversation_nineteen_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_nineteen_01",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_nineteen_01",
			},
			sound_events_duration = {
				[1] = 5.3496041297913,
			},
		},
		pwh_cog_conversation_nineteen_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_nineteen_02",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_nineteen_02",
			},
			sound_events_duration = {
				[1] = 4.6375832557678,
			},
		},
		pwh_cog_conversation_twenty_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twenty_01",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twenty_01",
			},
			sound_events_duration = {
				[1] = 5.5222082138061,
			},
		},
		pwh_cog_conversation_twenty_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twenty_02",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twenty_02",
			},
			sound_events_duration = {
				[1] = 1.3060208559036,
			},
		},
		pwh_cog_conversation_twenty_03 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twenty_03",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twenty_03",
			},
			sound_events_duration = {
				[1] = 1.3673750162125,
			},
		},
		pwh_cog_conversation_twentyfour_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twentyfour_01",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twentyfour_01",
			},
			sound_events_duration = {
				[1] = 6.809645652771,
			},
		},
		pwh_cog_conversation_twentyfour_03 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twentyfour_03",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twentyfour_03",
			},
			sound_events_duration = {
				[1] = 9.0544376373291,
			},
		},
		pwh_cog_conversation_twentyone_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twentyone_01",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twentyone_01",
			},
			sound_events_duration = {
				[1] = 4.6567707061768,
			},
		},
		pwh_cog_conversation_twentyone_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twentyone_02",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twentyone_02",
			},
			sound_events_duration = {
				[1] = 3.4999375343323,
			},
		},
		pwh_cog_conversation_twentythree_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twentythree_01",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twentythree_01",
			},
			sound_events_duration = {
				[1] = 6.6789999008179,
			},
		},
		pwh_cog_conversation_twentythree_03 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twentythree_03",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twentythree_03",
			},
			sound_events_duration = {
				[1] = 5.7148332595825,
			},
		},
		pwh_cog_conversation_twentytwo_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twentytwo_01",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twentytwo_01",
			},
			sound_events_duration = {
				[1] = 5.6853957176208,
			},
		},
		pwh_cog_conversation_twentytwo_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_cog_conversation_twentytwo_02",
			},
			sound_events = {
				[1] = "pwh_cog_conversation_twentytwo_02",
			},
			sound_events_duration = {
				[1] = 4.768458366394,
			},
		},
		pwh_comet_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_eight_01",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 6.1999998092651,
			},
		},
		pwh_comet_conversation_eight_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_eight_02",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 3.3627707958221,
			},
		},
		pwh_comet_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_nine_01",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 4.9106664657593,
			},
		},
		pwh_comet_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_nine_02",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 3.5392291545868,
			},
		},
		pwh_comet_conversation_nine_03 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_nine_03",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_nine_03",
			},
			sound_events_duration = {
				[1] = 3.4854373931885,
			},
		},
		pwh_comet_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_one_01",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 4.7072291374206,
			},
		},
		pwh_comet_conversation_one_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_one_02",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 3.701708316803,
			},
		},
		pwh_comet_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 11.811645507813,
			},
		},
		pwh_comet_conversation_seven_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_seven_02",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 2.9808542728424,
			},
		},
		pwh_comet_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_six_01",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 6.1003956794739,
			},
		},
		pwh_comet_conversation_six_02 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_six_02",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 3.0912916660309,
			},
		},
		pwh_comet_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_ten_01",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 4.7637915611267,
			},
		},
		pwh_comet_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_comet_conversation_two_01",
			},
			sound_events = {
				[1] = "pwh_comet_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 2.694000005722,
			},
		},
		pwh_whisper_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_six_01",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 6.5609169006348,
			},
		},
		pwh_whisper_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.2293748855591,
			},
		},
		pwh_whisper_conversation_twelve_01_a = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.2293748855591,
			},
		},
		pwh_whisper_conversation_twelve_01_b = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.2293748855591,
			},
		},
		pwh_whisper_conversation_twelve_01_c = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.2293748855591,
			},
		},
		pwh_whisper_conversation_twelve_02_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.7881457805634,
			},
		},
		pwh_whisper_conversation_twelve_02_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.7881457805634,
			},
		},
		pwh_whisper_conversation_twelve_02_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.7881457805634,
			},
		},
		pwh_whisper_conversation_twelve_02_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.7881457805634,
			},
		},
		pwh_whisper_conversation_twelve_03_1 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 0.43252083659172,
			},
		},
		pwh_whisper_conversation_twelve_03_2 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 0.43252083659172,
			},
		},
		pwh_whisper_conversation_twelve_03_3 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 0.43252083659172,
			},
		},
		pwh_whisper_conversation_twelve_03_4 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whisper_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pwh_whisper_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 0.43252083659172,
			},
		},
		pwh_whispers_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_cog",
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
				[1] = "pwh_whispers_conversation_one_01",
			},
			sound_events = {
				[1] = "pwh_whispers_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.7157707214356,
			},
		},
	})
end
