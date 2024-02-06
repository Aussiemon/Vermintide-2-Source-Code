-- chunkname: @dialogues/generated/hero_conversations_dlc_morris_level_banter_themed.lua

return function ()
	define_rule({
		name = "pbw_morris_level_conversations_khorne_twentyfour_01",
		response = "pbw_morris_level_conversations_khorne_twentyfour_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_morris_level_conversations_khorne_twentyfour_01",
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
		name = "pbw_morris_level_conversations_tzeentch_twentyseven_01",
		response = "pbw_morris_level_conversations_tzeentch_twentyseven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_morris_level_conversations_tzeentch_twentyseven_01",
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
		name = "pbw_morris_level_conversations_tzeentch_twentysix_01",
		response = "pbw_morris_level_conversations_tzeentch_twentysix_01",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"tzeentch",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_tzeentch_twentysix_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_tzeentch_twentysix_01",
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
		name = "pbw_morris_level_conversations_tzeentch_twentysix_02",
		response = "pbw_morris_level_conversations_tzeentch_twentysix_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_morris_level_conversations_tzeentch_twentysix_01",
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
		name = "pdr_morris_level_conversations_khorne_twentyfour_01",
		response = "pdr_morris_level_conversations_khorne_twentyfour_01",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"khorne",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pdr_morris_level_conversations_khorne_twentyfour_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_level_conversations_khorne_twentyfour_01",
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
		name = "pdr_morris_level_conversations_khorne_twentyfour_02",
		response = "pdr_morris_level_conversations_khorne_twentyfour_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_morris_level_conversations_khorne_twentyfour_01",
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
		name = "pdr_morris_level_conversations_nurgle_twentynine_01",
		response = "pdr_morris_level_conversations_nurgle_twentynine_01",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"nurgle",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pdr_morris_level_conversations_nurgle_twentynine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_level_conversations_nurgle_twentynine_01",
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
		name = "pdr_morris_level_conversations_nurgle_twentynine_02",
		response = "pdr_morris_level_conversations_nurgle_twentynine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_morris_level_conversations_nurgle_twentynine_01",
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
		name = "pdr_morris_level_conversations_slaanesh_thirtyone_01",
		response = "pdr_morris_level_conversations_slaanesh_thirtyone_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_morris_level_conversations_slaanesh_thirtyone_01",
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
		name = "pdr_morris_level_conversations_tzeentch_twentyseven_01",
		response = "pdr_morris_level_conversations_tzeentch_twentyseven_01",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"tzeentch",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pdr_morris_level_conversations_tzeentch_twentyseven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_level_conversations_tzeentch_twentyseven_01",
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
		name = "pes_morris_level_conversations_khorne_twentyfive_01",
		response = "pes_morris_level_conversations_khorne_twentyfive_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_morris_level_conversations_khorne_twentyfive_01",
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
		name = "pes_morris_level_conversations_khorne_twentyfive_02",
		response = "pes_morris_level_conversations_khorne_twentyfive_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_morris_level_conversations_khorne_twentyfive_02",
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
		name = "pes_morris_level_conversations_nurgle_twentyeight_01",
		response = "pes_morris_level_conversations_nurgle_twentyeight_01",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"current_theme",
				OP.EQ,
				"nurgle",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_nurgle_twentyeight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_nurgle_twentyeight_01",
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
		name = "pes_morris_level_conversations_nurgle_twentyeight_02",
		response = "pes_morris_level_conversations_nurgle_twentyeight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_morris_level_conversations_nurgle_twentyeight_01",
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
		name = "pes_morris_level_conversations_nurgle_twentynine_01",
		response = "pes_morris_level_conversations_nurgle_twentynine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_morris_level_conversations_nurgle_twentynine_01",
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
		name = "pes_morris_level_conversations_nurgle_twentynine_02",
		response = "pes_morris_level_conversations_nurgle_twentynine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_morris_level_conversations_nurgle_twentynine_02",
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
		name = "pes_morris_level_conversations_slaanesh_thirty_01",
		response = "pes_morris_level_conversations_slaanesh_thirty_01",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"current_theme",
				OP.EQ,
				"slaanesh",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_slaanesh_thirty_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_slaanesh_thirty_01",
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
		name = "pes_morris_level_conversations_slaanesh_thirty_02",
		response = "pes_morris_level_conversations_slaanesh_thirty_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_morris_level_conversations_slaanesh_thirty_01",
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
		name = "pes_morris_level_conversations_slaanesh_thirty_03",
		response = "pes_morris_level_conversations_slaanesh_thirty_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_morris_level_conversations_slaanesh_thirty_02",
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
		name = "pwe_morris_level_conversations_khorne_twentyfive_01",
		response = "pwe_morris_level_conversations_khorne_twentyfive_01",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"khorne",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pwe_morris_level_conversations_khorne_twentyfive_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_level_conversations_khorne_twentyfive_01",
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
		name = "pwe_morris_level_conversations_khorne_twentyfive_02",
		response = "pwe_morris_level_conversations_khorne_twentyfive_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_morris_level_conversations_khorne_twentyfive_01",
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
		name = "pwe_morris_level_conversations_nurgle_twentyeight_01",
		response = "pwe_morris_level_conversations_nurgle_twentyeight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_morris_level_conversations_nurgle_twentyeight_01",
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
		name = "pwe_morris_level_conversations_nurgle_twentyeight_02",
		response = "pwe_morris_level_conversations_nurgle_twentyeight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_morris_level_conversations_nurgle_twentyeight_02",
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
		name = "pwe_morris_level_conversations_slaanesh_thirty_01",
		response = "pwe_morris_level_conversations_slaanesh_thirty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_morris_level_conversations_slaanesh_thirty_01",
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
		name = "pwe_morris_level_conversations_slaanesh_thirty_02",
		response = "pwe_morris_level_conversations_slaanesh_thirty_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_morris_level_conversations_slaanesh_thirty_02",
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
		name = "pwh_morris_level_conversations_slaanesh_thirtyone_01",
		response = "pwh_morris_level_conversations_slaanesh_thirtyone_01",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"slaanesh",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pwh_morris_level_conversations_slaanesh_thirtyone_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_level_conversations_slaanesh_thirtyone_01",
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
		name = "pwh_morris_level_conversations_slaanesh_thirtyone_02",
		response = "pwh_morris_level_conversations_slaanesh_thirtyone_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_morris_level_conversations_slaanesh_thirtyone_01",
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
		name = "pwh_morris_level_conversations_tzeentch_twentysix_01",
		response = "pwh_morris_level_conversations_tzeentch_twentysix_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_morris_level_conversations_tzeentch_twentysix_01",
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
		name = "pwh_morris_level_conversations_tzeentch_twentysix_02",
		response = "pwh_morris_level_conversations_tzeentch_twentysix_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_morris_level_conversations_tzeentch_twentysix_02",
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
		pbw_morris_level_conversations_khorne_twentyfour_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_morris_level_conversations_khorne_twentyfour_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_khorne_twentyfour_01",
			},
			sound_events_duration = {
				[1] = 5.1674790382385,
			},
		},
		pbw_morris_level_conversations_tzeentch_twentyseven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_morris_level_conversations_tzeentch_twentyseven_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_tzeentch_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 4.2238335609436,
			},
		},
		pbw_morris_level_conversations_tzeentch_twentysix_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
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
				[1] = "pbw_morris_level_conversations_tzeentch_twentysix_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_tzeentch_twentysix_01",
			},
			sound_events_duration = {
				[1] = 7.106062412262,
			},
		},
		pbw_morris_level_conversations_tzeentch_twentysix_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_morris_level_conversations_tzeentch_twentysix_02",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_tzeentch_twentysix_02",
			},
			sound_events_duration = {
				[1] = 7.9500832557678,
			},
		},
		pdr_morris_level_conversations_khorne_twentyfour_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
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
				[1] = "pdr_morris_level_conversations_khorne_twentyfour_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_khorne_twentyfour_01",
			},
			sound_events_duration = {
				[1] = 2.4539375305176,
			},
		},
		pdr_morris_level_conversations_khorne_twentyfour_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_morris_level_conversations_khorne_twentyfour_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_khorne_twentyfour_02",
			},
			sound_events_duration = {
				[1] = 3.3144373893738,
			},
		},
		pdr_morris_level_conversations_nurgle_twentynine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
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
				[1] = "pdr_morris_level_conversations_nurgle_twentynine_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_nurgle_twentynine_01",
			},
			sound_events_duration = {
				[1] = 4.3611040115356,
			},
		},
		pdr_morris_level_conversations_nurgle_twentynine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_morris_level_conversations_nurgle_twentynine_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_nurgle_twentynine_02",
			},
			sound_events_duration = {
				[1] = 3.0793957710266,
			},
		},
		pdr_morris_level_conversations_slaanesh_thirtyone_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_morris_level_conversations_slaanesh_thirtyone_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_slaanesh_thirtyone_01",
			},
			sound_events_duration = {
				[1] = 3.1492917537689,
			},
		},
		pdr_morris_level_conversations_tzeentch_twentyseven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
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
				[1] = "pdr_morris_level_conversations_tzeentch_twentyseven_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_tzeentch_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 8.3637294769287,
			},
		},
		pes_morris_level_conversations_khorne_twentyfive_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_morris_level_conversations_khorne_twentyfive_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_khorne_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 1.2056875228882,
			},
		},
		pes_morris_level_conversations_khorne_twentyfive_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_morris_level_conversations_khorne_twentyfive_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_khorne_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 2.1561458110809,
			},
		},
		pes_morris_level_conversations_nurgle_twentyeight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
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
				[1] = "pes_morris_level_conversations_nurgle_twentyeight_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_nurgle_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 8.7251253128052,
			},
		},
		pes_morris_level_conversations_nurgle_twentyeight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_morris_level_conversations_nurgle_twentyeight_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_nurgle_twentyeight_02",
			},
			sound_events_duration = {
				[1] = 2.2034375667572,
			},
		},
		pes_morris_level_conversations_nurgle_twentynine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_morris_level_conversations_nurgle_twentynine_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_nurgle_twentynine_01",
			},
			sound_events_duration = {
				[1] = 1.6353332996368,
			},
		},
		pes_morris_level_conversations_nurgle_twentynine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_morris_level_conversations_nurgle_twentynine_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_nurgle_twentynine_02",
			},
			sound_events_duration = {
				[1] = 2.6536667346954,
			},
		},
		pes_morris_level_conversations_slaanesh_thirty_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
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
				[1] = "pes_morris_level_conversations_slaanesh_thirty_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_slaanesh_thirty_01",
			},
			sound_events_duration = {
				[1] = 6.2740001678467,
			},
		},
		pes_morris_level_conversations_slaanesh_thirty_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_morris_level_conversations_slaanesh_thirty_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_slaanesh_thirty_02",
			},
			sound_events_duration = {
				[1] = 2.5013542175293,
			},
		},
		pes_morris_level_conversations_slaanesh_thirty_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_morris_level_conversations_slaanesh_thirty_03",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_slaanesh_thirty_03",
			},
			sound_events_duration = {
				[1] = 2.2461874485016,
			},
		},
		pwe_morris_level_conversations_khorne_twentyfive_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
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
				[1] = "pwe_morris_level_conversations_khorne_twentyfive_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_khorne_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 5.0829582214356,
			},
		},
		pwe_morris_level_conversations_khorne_twentyfive_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_morris_level_conversations_khorne_twentyfive_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_khorne_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 5.4178123474121,
			},
		},
		pwe_morris_level_conversations_nurgle_twentyeight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_morris_level_conversations_nurgle_twentyeight_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_nurgle_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 2.722895860672,
			},
		},
		pwe_morris_level_conversations_nurgle_twentyeight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_morris_level_conversations_nurgle_twentyeight_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_nurgle_twentyeight_02",
			},
			sound_events_duration = {
				[1] = 1.454958319664,
			},
		},
		pwe_morris_level_conversations_slaanesh_thirty_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_morris_level_conversations_slaanesh_thirty_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_slaanesh_thirty_01",
			},
			sound_events_duration = {
				[1] = 5.7202501296997,
			},
		},
		pwe_morris_level_conversations_slaanesh_thirty_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_morris_level_conversations_slaanesh_thirty_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_slaanesh_thirty_02",
			},
			sound_events_duration = {
				[1] = 1.114041686058,
			},
		},
		pwh_morris_level_conversations_slaanesh_thirtyone_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
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
				[1] = "pwh_morris_level_conversations_slaanesh_thirtyone_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_slaanesh_thirtyone_01",
			},
			sound_events_duration = {
				[1] = 7.0671458244324,
			},
		},
		pwh_morris_level_conversations_slaanesh_thirtyone_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_morris_level_conversations_slaanesh_thirtyone_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_slaanesh_thirtyone_02",
			},
			sound_events_duration = {
				[1] = 2.6515207290649,
			},
		},
		pwh_morris_level_conversations_tzeentch_twentysix_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_morris_level_conversations_tzeentch_twentysix_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_tzeentch_twentysix_01",
			},
			sound_events_duration = {
				[1] = 3.7522916793823,
			},
		},
		pwh_morris_level_conversations_tzeentch_twentysix_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter_themed",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_morris_level_conversations_tzeentch_twentysix_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_tzeentch_twentysix_02",
			},
			sound_events_duration = {
				[1] = 3.2571249008179,
			},
		},
	})
end
