-- chunkname: @dialogues/generated/hero_conversations_dlc_morris_extras.lua

return function ()
	define_rule({
		name = "pbw_morris_bardin_song_sienna_13",
		probability = 1,
		response = "pbw_morris_bardin_song_sienna_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_13_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pbw_morris_bardin_song_sienna_14",
		probability = 1,
		response = "pbw_morris_bardin_song_sienna_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_14_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pbw_morris_bardin_song_sienna_15",
		probability = 1,
		response = "pbw_morris_bardin_song_sienna_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_15_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pbw_morris_bardin_song_sienna_16",
		probability = 1,
		response = "pbw_morris_bardin_song_sienna_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_16_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pbw_morris_extra_eighteen_01",
		probability = 1,
		response = "pbw_morris_extra_eighteen_01",
		criterias = {
			{
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
		name = "pbw_morris_extra_fifteen_01",
		probability = 1,
		response = "pbw_morris_extra_fifteen_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"morris_extra_conversation_15",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_15",
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
		name = "pbw_morris_extra_fifteen_02",
		probability = 1,
		response = "pbw_morris_extra_fifteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_catacombs_story_ten_01",
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
		name = "pbw_morris_extra_fifteen_03",
		probability = 1,
		response = "pbw_morris_extra_fifteen_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_catacombs_story_ten_01",
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
		name = "pbw_morris_extra_fourteen_01",
		probability = 1,
		response = "pbw_morris_extra_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_backstory_five_01",
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
		name = "pbw_morris_extra_fourteen_02",
		probability = 1,
		response = "pbw_morris_extra_fourteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_backstory_five_02",
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
		name = "pbw_morris_extra_thirteen_01",
		probability = 1,
		response = "pbw_morris_extra_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bw_backstory_seven_03",
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
		name = "pbw_morris_extra_thirteen_02",
		probability = 1,
		response = "pbw_morris_extra_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bw_backstory_seven_04",
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
		name = "pbw_morris_extra_twelve_01",
		probability = 1,
		response = "pbw_morris_extra_twelve_01",
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
				0,
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
				240,
			},
			{
				"faction_memory",
				"morris_extra_conversation_12",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_12",
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
		name = "pbw_morris_extra_twelve_02",
		probability = 1,
		response = "pbw_morris_extra_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_one_01",
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
		name = "pbw_morris_extra_twelve_03",
		probability = 1,
		response = "pbw_morris_extra_twelve_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_one_02",
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
		name = "pbw_morris_extra_two_01",
		probability = 1,
		response = "pbw_morris_extra_two_01",
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
				0,
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
				240,
			},
			{
				"faction_memory",
				"morris_extra_conversation_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_02",
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
		name = "pbw_morris_extra_two_02",
		probability = 1,
		response = "pbw_morris_extra_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bw_backstory_three_01",
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
		name = "pbw_morris_extra_two_03",
		probability = 1,
		response = "pbw_morris_extra_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bw_backstory_three_02",
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
		name = "pdr_morris_bardin_song",
		probability = 1,
		response = "pdr_morris_bardin_song",
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
				7,
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
				"level_time",
				OP.GT,
				600,
			},
			{
				"global_context",
				"times_map_visited",
				OP.GT,
				1,
			},
			{
				"user_memory",
				"pdr_morris_bardin_song_solo",
				OP.EQ,
				0,
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				300,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
			{
				"user_memory",
				"pdr_morris_bardin_song_solo",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_bardin_song_09",
		probability = 1,
		response = "pdr_morris_bardin_song_09",
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
				7,
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
				"level_time",
				OP.GT,
				660,
			},
			{
				"global_context",
				"times_map_visited",
				OP.GT,
				2,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.EQ,
				0,
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				300,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_bardin_song_10",
		probability = 1,
		response = "pdr_morris_bardin_song_10",
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
				7,
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
				"level_time",
				OP.GT,
				660,
			},
			{
				"global_context",
				"times_map_visited",
				OP.GT,
				2,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.EQ,
				0,
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				300,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_bardin_song_13",
		probability = 1,
		response = "pdr_morris_bardin_song_13",
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
				7,
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
				"level_time",
				OP.GT,
				660,
			},
			{
				"global_context",
				"times_map_visited",
				OP.GT,
				2,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.EQ,
				0,
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				300,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_bardin_song_14",
		probability = 1,
		response = "pdr_morris_bardin_song_14",
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
				7,
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
				"level_time",
				OP.GT,
				660,
			},
			{
				"global_context",
				"times_map_visited",
				OP.GT,
				2,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.EQ,
				0,
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				300,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_bardin_song_15",
		probability = 1,
		response = "pdr_morris_bardin_song_15",
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
				7,
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
				"level_time",
				OP.GT,
				660,
			},
			{
				"global_context",
				"times_map_visited",
				OP.GT,
				2,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.EQ,
				0,
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				300,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_bardin_song_16",
		probability = 1,
		response = "pdr_morris_bardin_song_16",
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
				7,
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
				"level_time",
				OP.GT,
				660,
			},
			{
				"global_context",
				"times_map_visited",
				OP.GT,
				2,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.EQ,
				0,
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
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				300,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_extra_eight_01",
		probability = 1,
		response = "pdr_morris_extra_eight_01",
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
				"wood_elf",
				OP.EQ,
				1,
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
				"morris_extra_conversation_08",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_08",
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
		name = "pdr_morris_extra_eight_02",
		probability = 1,
		response = "pdr_morris_extra_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_eleven_01",
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
		name = "pdr_morris_extra_eight_03",
		probability = 1,
		response = "pdr_morris_extra_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_eleven_02",
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
		name = "pdr_morris_extra_eight_04",
		probability = 1,
		response = "pdr_morris_extra_eight_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_eleven_03",
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
		name = "pdr_morris_extra_fifteen_01",
		probability = 1,
		response = "pdr_morris_extra_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_ten_02",
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
		name = "pdr_morris_extra_four_01",
		probability = 1,
		response = "pdr_morris_extra_four_01",
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
				"wood_elf",
				OP.EQ,
				1,
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
				"morris_extra_conversation_04",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_04",
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
		name = "pdr_morris_extra_four_02",
		probability = 1,
		response = "pdr_morris_extra_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_backstory_five_02",
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
		name = "pdr_morris_extra_four_03",
		probability = 1,
		response = "pdr_morris_extra_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_five_02",
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
		name = "pdr_morris_extra_fourteen_01",
		probability = 1,
		response = "pdr_morris_extra_fourteen_01",
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
				0,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
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
				"morris_extra_conversation_14",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_14",
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
		name = "pdr_morris_extra_fourteen_02",
		probability = 1,
		response = "pdr_morris_extra_fourteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_five_01",
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
		name = "pdr_morris_extra_nine_01",
		probability = 1,
		response = "pdr_morris_extra_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_fort_story_on_the_way_five_01",
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
		name = "pdr_morris_extra_nine_02",
		probability = 1,
		response = "pdr_morris_extra_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_fort_story_on_the_way_five_02",
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
		name = "pes_morris_bardin_song_09",
		probability = 1,
		response = "pes_morris_bardin_song_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_09_pes",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pes_morris_bardin_song_10",
		probability = 1,
		response = "pes_morris_bardin_song_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_10_pes",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pes_morris_bardin_song_kruber_13",
		probability = 1,
		response = "pes_morris_bardin_song_kruber_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_13_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pes_morris_bardin_song_kruber_14",
		probability = 1,
		response = "pes_morris_bardin_song_kruber_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_14_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pes_morris_bardin_song_kruber_15",
		probability = 1,
		response = "pes_morris_bardin_song_kruber_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_15_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pes_morris_bardin_song_kruber_16",
		probability = 1,
		response = "pes_morris_bardin_song_kruber_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_16_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pes_morris_extra_eighteen_01",
		probability = 1,
		response = "pes_morris_extra_eighteen_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"morris_extra_conversation_18",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_18",
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
		name = "pes_morris_extra_eighteen_02",
		probability = 1,
		response = "pes_morris_extra_eighteen_02",
		criterias = {
			{
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
		name = "pes_morris_extra_four_01",
		probability = 1,
		response = "pes_morris_extra_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_five_01",
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
		name = "pes_morris_extra_four_02",
		probability = 1,
		response = "pes_morris_extra_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_five_01",
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
		name = "pes_morris_extra_one_01",
		probability = 1,
		response = "pes_morris_extra_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_fourteen_01",
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
		name = "pes_morris_extra_seven_01",
		probability = 1,
		response = "pes_morris_extra_seven_01",
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
				"witch_hunter",
				OP.EQ,
				1,
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
				"morris_extra_conversation_07",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_07",
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
		name = "pes_morris_extra_seven_02",
		probability = 1,
		response = "pes_morris_extra_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_elven_ruins_story_nine_01",
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
		name = "pes_morris_extra_seventeen_01",
		probability = 1,
		response = "pes_morris_extra_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_crater_conversation_ten_01",
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
		name = "pes_morris_extra_seventeen_02",
		probability = 1,
		response = "pes_morris_extra_seventeen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_crater_conversation_ten_02",
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
		name = "pes_morris_extra_six_01",
		probability = 1,
		response = "pes_morris_extra_six_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"morris_extra_conversation_06",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_06",
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
		name = "pes_morris_extra_six_02",
		probability = 1,
		response = "pes_morris_extra_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_four_01",
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
		name = "pes_morris_extra_six_03",
		probability = 1,
		response = "pes_morris_extra_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_four_02",
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
		name = "pes_morris_extra_sixteen_01",
		probability = 1,
		response = "pes_morris_extra_sixteen_01",
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
				"user_context",
				"player_career",
				OP.NEQ,
				"es_questingknight",
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
				240,
			},
			{
				"faction_memory",
				"morris_extra_conversation_16",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_16",
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
		name = "pes_morris_extra_sixteen_02",
		probability = 1,
		response = "pes_morris_extra_sixteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_twelve_01",
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
		name = "pes_morris_extra_sixteen_03",
		probability = 1,
		response = "pes_morris_extra_sixteen_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_twelve_02",
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
		name = "pes_morris_extra_thirteen_01",
		probability = 1,
		response = "pes_morris_extra_thirteen_01",
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
				0,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
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
				"morris_extra_conversation_13",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_13",
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
		name = "pes_morris_extra_thirteen_02",
		probability = 1,
		response = "pes_morris_extra_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_seven_03",
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
		name = "pes_morris_extra_thirteen_03",
		probability = 1,
		response = "pes_morris_extra_thirteen_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_seven_04",
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
		name = "pes_morris_extra_three_01",
		probability = 1,
		response = "pes_morris_extra_three_01",
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
				0,
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
				240,
			},
			{
				"faction_memory",
				"morris_extra_conversation_03",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_03",
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
		name = "pes_morris_extra_three_02",
		probability = 1,
		response = "pes_morris_extra_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_es_backstory_three_01",
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
		name = "pes_morris_extra_three_03",
		probability = 1,
		response = "pes_morris_extra_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_es_backstory_three_02",
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
		name = "pwe_morris_bardin_song_kerillian_13",
		probability = 1,
		response = "pwe_morris_bardin_song_kerillian_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_13_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pwe_morris_bardin_song_kerillian_14",
		probability = 1,
		response = "pwe_morris_bardin_song_kerillian_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_14_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pwe_morris_bardin_song_kerillian_15",
		probability = 1,
		response = "pwe_morris_bardin_song_kerillian_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_15_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pwe_morris_bardin_song_kerillian_16",
		probability = 1,
		response = "pwe_morris_bardin_song_kerillian_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_morris_bardin_song_16",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pwe_morris_extra_eight_01",
		probability = 1,
		response = "pwe_morris_extra_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eleven_01",
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
		name = "pwe_morris_extra_eight_02",
		probability = 1,
		response = "pwe_morris_extra_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eleven_02",
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
		name = "pwe_morris_extra_eight_03",
		probability = 1,
		response = "pwe_morris_extra_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eleven_03",
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
		name = "pwe_morris_extra_eight_04",
		probability = 1,
		response = "pwe_morris_extra_eight_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eleven_04",
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
		name = "pwe_morris_extra_eighteen_01",
		probability = 1,
		response = "pwe_morris_extra_eighteen_01",
		criterias = {
			{
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
		name = "pwe_morris_extra_eleven_01",
		probability = 1,
		response = "pwe_morris_extra_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_backstory_two_01",
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
		name = "pwe_morris_extra_eleven_02",
		probability = 1,
		response = "pwe_morris_extra_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_backstory_two_02",
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
		name = "pwe_morris_extra_fifteen_01",
		probability = 1,
		response = "pwe_morris_extra_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_ten_01",
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
		name = "pwe_morris_extra_five_01",
		probability = 1,
		response = "pwe_morris_extra_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_ground_zero_story_eight_01",
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
		name = "pwe_morris_extra_five_02",
		probability = 1,
		response = "pwe_morris_extra_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_ground_zero_story_eight_02",
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
		name = "pwe_morris_extra_four_01",
		probability = 1,
		response = "pwe_morris_extra_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_backstory_five_01",
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
		name = "pwe_morris_extra_four_02",
		probability = 1,
		response = "pwe_morris_extra_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_five_02",
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
		name = "pwe_morris_extra_four_03",
		probability = 1,
		response = "pwe_morris_extra_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_five_03",
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
		name = "pwe_morris_extra_nine_01",
		probability = 1,
		response = "pwe_morris_extra_nine_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
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
				"morris_extra_conversation_09",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_09",
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
		name = "pwe_morris_extra_nine_02",
		probability = 1,
		response = "pwe_morris_extra_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_fort_story_on_the_way_five_01",
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
		name = "pwe_morris_extra_six_01",
		probability = 1,
		response = "pwe_morris_extra_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_four_01",
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
		name = "pwe_morris_extra_six_02",
		probability = 1,
		response = "pwe_morris_extra_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_four_02",
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
		name = "pwe_morris_extra_ten_01",
		probability = 1,
		response = "pwe_morris_extra_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_two_01",
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
		name = "pwe_morris_extra_ten_02",
		probability = 1,
		response = "pwe_morris_extra_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_two_02",
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
		name = "pwe_morris_extra_ten_03",
		probability = 1,
		response = "pwe_morris_extra_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_two_03",
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
		name = "pwe_morris_extra_ten_04",
		probability = 1,
		response = "pwe_morris_extra_ten_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_two_04",
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
		name = "pwe_morris_extra_twelve_01",
		probability = 1,
		response = "pwe_morris_extra_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_backstory_one_01",
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
		name = "pwe_morris_extra_twelve_02",
		probability = 1,
		response = "pwe_morris_extra_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_backstory_one_02",
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
		name = "pwe_morris_extra_twelve_03",
		probability = 1,
		response = "pwe_morris_extra_twelve_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_backstory_one_03",
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
		name = "pwh_morris_bardin_song_victor_13",
		probability = 1,
		response = "pwh_morris_bardin_song_victor_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_13_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pwh_morris_bardin_song_victor_14",
		probability = 1,
		response = "pwh_morris_bardin_song_victor_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_14_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pwh_morris_bardin_song_victor_15",
		probability = 1,
		response = "pwh_morris_bardin_song_victor_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_15_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pwh_morris_bardin_song_victor_16",
		probability = 1,
		response = "pwh_morris_bardin_song_victor_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_morris_bardin_song_16_done",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
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
		name = "pwh_morris_extra_eleven_01",
		probability = 1,
		response = "pwh_morris_extra_eleven_01",
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
				0,
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
				240,
			},
			{
				"faction_memory",
				"morris_extra_conversation_11",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_11",
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
		name = "pwh_morris_extra_eleven_02",
		probability = 1,
		response = "pwh_morris_extra_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_two_02",
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
		name = "pwh_morris_extra_eleven_03",
		probability = 1,
		response = "pwh_morris_extra_eleven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_two_03",
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
		name = "pwh_morris_extra_five_01",
		probability = 1,
		response = "pwh_morris_extra_five_01",
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
				"wood_elf",
				OP.EQ,
				1,
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
				"morris_extra_conversation_05",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_05",
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
		name = "pwh_morris_extra_five_02",
		probability = 1,
		response = "pwh_morris_extra_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_ground_zero_story_eight_01",
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
		name = "pwh_morris_extra_one_01",
		probability = 1,
		response = "pwh_morris_extra_one_01",
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
				"empire_soldier",
				OP.EQ,
				1,
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
				"morris_extra_conversation_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_01",
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
		name = "pwh_morris_extra_one_02",
		probability = 1,
		response = "pwh_morris_extra_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_fourteen_01",
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
		name = "pwh_morris_extra_seven_01",
		probability = 1,
		response = "pwh_morris_extra_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_nine_01",
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
		name = "pwh_morris_extra_seven_02",
		probability = 1,
		response = "pwh_morris_extra_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_nine_02",
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
		name = "pwh_morris_extra_seventeen_01",
		probability = 1,
		response = "pwh_morris_extra_seventeen_01",
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
				"empire_soldier",
				OP.EQ,
				1,
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
				"morris_extra_conversation_17",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_17",
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
		name = "pwh_morris_extra_seventeen_02",
		probability = 1,
		response = "pwh_morris_extra_seventeen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_crater_conversation_ten_01",
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
		name = "pwh_morris_extra_sixteen_01",
		probability = 1,
		response = "pwh_morris_extra_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_twelve_01",
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
		name = "pwh_morris_extra_sixteen_02",
		probability = 1,
		response = "pwh_morris_extra_sixteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_twelve_02",
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
		name = "pwh_morris_extra_ten_01",
		probability = 1,
		response = "pwh_morris_extra_ten_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"morris_extra_conversation_10",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_10",
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
		name = "pwh_morris_extra_ten_02",
		probability = 1,
		response = "pwh_morris_extra_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_backstory_two_01",
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
		name = "pwh_morris_extra_ten_03",
		probability = 1,
		response = "pwh_morris_extra_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_backstory_two_02",
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
		name = "pwh_morris_extra_ten_04",
		probability = 1,
		response = "pwh_morris_extra_ten_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_backstory_two_03",
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
		name = "pwh_morris_extra_ten_05",
		probability = 1,
		response = "pwh_morris_extra_ten_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_backstory_two_04",
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
		name = "pwh_morris_extra_three_01",
		probability = 1,
		response = "pwh_morris_extra_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_three_01",
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
		name = "pwh_morris_extra_three_02",
		probability = 1,
		response = "pwh_morris_extra_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_three_02",
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
		name = "pwh_morris_extra_three_03",
		probability = 1,
		response = "pwh_morris_extra_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_three_03",
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
		name = "pwh_morris_extra_two_01",
		probability = 1,
		response = "pwh_morris_extra_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_three_01",
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
		name = "pwh_morris_extra_two_02",
		probability = 1,
		response = "pwh_morris_extra_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_three_02",
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
		name = "pwh_morris_extra_two_03",
		probability = 1,
		response = "pwh_morris_extra_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_three_03",
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
		pbw_morris_bardin_song_sienna_13 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_morris_bardin_song_sienna_13",
			},
			sound_events = {
				[1] = "pbw_morris_bardin_song_sienna_13",
			},
			sound_events_duration = {
				[1] = 8.0235004425049,
			},
		},
		pbw_morris_bardin_song_sienna_14 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_morris_bardin_song_sienna_14",
			},
			sound_events = {
				[1] = "pbw_morris_bardin_song_sienna_14",
			},
			sound_events_duration = {
				[1] = 8.4096040725708,
			},
		},
		pbw_morris_bardin_song_sienna_15 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_morris_bardin_song_sienna_15",
			},
			sound_events = {
				[1] = "pbw_morris_bardin_song_sienna_15",
			},
			sound_events_duration = {
				[1] = 8.0593128204346,
			},
		},
		pbw_morris_bardin_song_sienna_16 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_morris_bardin_song_sienna_16",
			},
			sound_events = {
				[1] = "pbw_morris_bardin_song_sienna_16",
			},
			sound_events_duration = {
				[1] = 8.3352918624878,
			},
		},
		pbw_morris_extra_eighteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
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
		pbw_morris_extra_fifteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pbw_level_catacombs_story_ten_01",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_ten_01",
			},
			sound_events_duration = {
				[1] = 2.6924374103546,
			},
		},
		pbw_morris_extra_fifteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_ten_02",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_ten_02",
			},
			sound_events_duration = {
				[1] = 1.9482707977295,
			},
		},
		pbw_morris_extra_fifteen_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_ten_03",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_ten_03",
			},
			sound_events_duration = {
				[1] = 8.8697919845581,
			},
		},
		pbw_morris_extra_fourteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_bw_backstory_five_01",
			},
			sound_events = {
				[1] = "pbw_bw_backstory_five_01",
			},
			sound_events_duration = {
				[1] = 8.2277498245239,
			},
		},
		pbw_morris_extra_fourteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_bw_backstory_five_02",
			},
			sound_events = {
				[1] = "pbw_bw_backstory_five_02",
			},
			sound_events_duration = {
				[1] = 10.121083259583,
			},
		},
		pbw_morris_extra_thirteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_bw_backstory_seven_03",
			},
			sound_events = {
				[1] = "pbw_bw_backstory_seven_03",
			},
			sound_events_duration = {
				[1] = 5.6063957214356,
			},
		},
		pbw_morris_extra_thirteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_bw_backstory_seven_04",
			},
			sound_events = {
				[1] = "pbw_bw_backstory_seven_04",
			},
			sound_events_duration = {
				[1] = 8.9575004577637,
			},
		},
		pbw_morris_extra_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pbw_we_backstory_one_01",
			},
			sound_events = {
				[1] = "pbw_we_backstory_one_01",
			},
			sound_events_duration = {
				[1] = 3.5214791297913,
			},
		},
		pbw_morris_extra_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_we_backstory_one_02",
			},
			sound_events = {
				[1] = "pbw_we_backstory_one_02",
			},
			sound_events_duration = {
				[1] = 1.0568333864212,
			},
		},
		pbw_morris_extra_twelve_03 = {
			category = "story_talk_keep",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_we_backstory_one_03",
			},
			sound_events = {
				[1] = "pbw_we_backstory_one_03",
			},
			sound_events_duration = {
				[1] = 1.6452708244324,
			},
		},
		pbw_morris_extra_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pbw_bw_backstory_three_01",
			},
			sound_events = {
				[1] = "pbw_bw_backstory_three_01",
			},
			sound_events_duration = {
				[1] = 2.8146874904633,
			},
		},
		pbw_morris_extra_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_bw_backstory_three_02",
			},
			sound_events = {
				[1] = "pbw_bw_backstory_three_02",
			},
			sound_events_duration = {
				[1] = 2.1752707958221,
			},
		},
		pbw_morris_extra_two_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_bw_backstory_three_03",
			},
			sound_events = {
				[1] = "pbw_bw_backstory_three_03",
			},
			sound_events_duration = {
				[1] = 1.3995208740234,
			},
		},
		pdr_morris_bardin_song = {
			category = "casual_singing_01",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 12,
			face_animations_n = 12,
			randomize_indexes_n = 0,
			sound_events_n = 12,
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
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_neutral",
				"face_happy",
				"face_neutral",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
			},
			localization_strings = {
				"pdr_morris_bardin_song_01",
				"pdr_morris_bardin_song_02",
				"pdr_morris_bardin_song_03",
				"pdr_morris_bardin_song_04",
				"pdr_morris_bardin_song_05",
				"pdr_morris_bardin_song_06",
				"pdr_morris_bardin_song_07",
				"pdr_morris_bardin_song_08",
				"pdr_morris_bardin_song_09",
				"pdr_morris_bardin_song_10",
				"pdr_morris_bardin_song_11",
				"pdr_morris_bardin_song_12",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_bardin_song_01",
				"pdr_morris_bardin_song_02",
				"pdr_morris_bardin_song_03",
				"pdr_morris_bardin_song_04",
				"pdr_morris_bardin_song_05",
				"pdr_morris_bardin_song_06",
				"pdr_morris_bardin_song_07",
				"pdr_morris_bardin_song_08",
				"pdr_morris_bardin_song_09",
				"pdr_morris_bardin_song_10",
				"pdr_morris_bardin_song_11",
				"pdr_morris_bardin_song_12",
			},
			sound_events_duration = {
				4.9493751525879,
				8.2154998779297,
				10.848187446594,
				6.8586039543152,
				4.7080416679382,
				7.3645834922791,
				7.2409377098083,
				9.6389579772949,
				10.927624702454,
				8.935604095459,
				6.1999998092651,
				3.4129583835602,
			},
		},
		pdr_morris_bardin_song_09 = {
			additional_trigger_heard = "pdr_morris_bardin_song_09_pes",
			category = "casual_singing_01",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_morris_bardin_song_09",
			},
			sound_events = {
				[1] = "pdr_morris_bardin_song_09",
			},
			sound_events_duration = {
				[1] = 10.927624702454,
			},
		},
		pdr_morris_bardin_song_10 = {
			additional_trigger_heard = "pdr_morris_bardin_song_10_pes",
			category = "casual_singing_01",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_morris_bardin_song_10",
			},
			sound_events = {
				[1] = "pdr_morris_bardin_song_10",
			},
			sound_events_duration = {
				[1] = 8.935604095459,
			},
		},
		pdr_morris_bardin_song_13 = {
			additional_trigger_heard = "pdr_morris_bardin_song_13_done",
			category = "casual_singing_01",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_morris_bardin_song_13",
			},
			sound_events = {
				[1] = "pdr_morris_bardin_song_13",
			},
			sound_events_duration = {
				[1] = 8.1756038665772,
			},
		},
		pdr_morris_bardin_song_14 = {
			additional_trigger_heard = "pdr_morris_bardin_song_14_done",
			category = "casual_singing_01",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_morris_bardin_song_14",
			},
			sound_events = {
				[1] = "pdr_morris_bardin_song_14",
			},
			sound_events_duration = {
				[1] = 8.4987916946411,
			},
		},
		pdr_morris_bardin_song_15 = {
			additional_trigger_heard = "pdr_morris_bardin_song_15_done",
			category = "casual_singing_01",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_morris_bardin_song_15",
			},
			sound_events = {
				[1] = "pdr_morris_bardin_song_15",
			},
			sound_events_duration = {
				[1] = 8.4710416793823,
			},
		},
		pdr_morris_bardin_song_16 = {
			additional_trigger_heard = "pdr_morris_bardin_song_16_done",
			category = "casual_singing_01",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_morris_bardin_song_16",
			},
			sound_events = {
				[1] = "pdr_morris_bardin_song_16",
			},
			sound_events_duration = {
				[1] = 8.0511245727539,
			},
		},
		pdr_morris_extra_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pdr_level_elven_ruins_story_eleven_01",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 6.3811874389648,
			},
		},
		pdr_morris_extra_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_eleven_02",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 1.4435625076294,
			},
		},
		pdr_morris_extra_eight_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_eleven_03",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_eleven_03",
			},
			sound_events_duration = {
				[1] = 2.8186874389648,
			},
		},
		pdr_morris_extra_eight_04 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_eleven_04",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_eleven_04",
			},
			sound_events_duration = {
				[1] = 5.3024792671204,
			},
		},
		pdr_morris_extra_fifteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_catacombs_story_ten_01",
			},
			sound_events = {
				[1] = "pdr_level_catacombs_story_ten_01",
			},
			sound_events_duration = {
				[1] = 4.4097084999084,
			},
		},
		pdr_morris_extra_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pdr_we_backstory_five_01",
			},
			sound_events = {
				[1] = "pdr_we_backstory_five_01",
			},
			sound_events_duration = {
				[1] = 3.228354215622,
			},
		},
		pdr_morris_extra_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_we_backstory_five_02",
			},
			sound_events = {
				[1] = "pdr_we_backstory_five_02",
			},
			sound_events_duration = {
				[1] = 4.7444581985474,
			},
		},
		pdr_morris_extra_four_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_we_backstory_five_03",
			},
			sound_events = {
				[1] = "pdr_we_backstory_five_03",
			},
			sound_events_duration = {
				[1] = 1.376416683197,
			},
		},
		pdr_morris_extra_fourteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pdr_bw_backstory_five_01",
			},
			sound_events = {
				[1] = "pdr_bw_backstory_five_01",
			},
			sound_events_duration = {
				[1] = 3.4642915725708,
			},
		},
		pdr_morris_extra_fourteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_bw_backstory_five_02",
			},
			sound_events = {
				[1] = "pdr_bw_backstory_five_02",
			},
			sound_events_duration = {
				[1] = 2.229875087738,
			},
		},
		pdr_morris_extra_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_fort_story_on_the_way_five_01",
			},
			sound_events = {
				[1] = "pdr_level_fort_story_on_the_way_five_01",
			},
			sound_events_duration = {
				[1] = 1.9148958921433,
			},
		},
		pdr_morris_extra_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_fort_story_on_the_way_five_02",
			},
			sound_events = {
				[1] = "pdr_level_fort_story_on_the_way_five_02",
			},
			sound_events_duration = {
				[1] = 5.5929789543152,
			},
		},
		pes_morris_bardin_song_09 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_morris_bardin_song_09",
			},
			sound_events = {
				[1] = "pes_morris_bardin_song_09",
			},
			sound_events_duration = {
				[1] = 11.813145637512,
			},
		},
		pes_morris_bardin_song_10 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_morris_bardin_song_10",
			},
			sound_events = {
				[1] = "pes_morris_bardin_song_10",
			},
			sound_events_duration = {
				[1] = 10.0616979599,
			},
		},
		pes_morris_bardin_song_kruber_13 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_morris_bardin_song_kruber_13",
			},
			sound_events = {
				[1] = "pes_morris_bardin_song_kruber_13",
			},
			sound_events_duration = {
				[1] = 8.7186870574951,
			},
		},
		pes_morris_bardin_song_kruber_14 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_morris_bardin_song_kruber_14",
			},
			sound_events = {
				[1] = "pes_morris_bardin_song_kruber_14",
			},
			sound_events_duration = {
				[1] = 8.3886871337891,
			},
		},
		pes_morris_bardin_song_kruber_15 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_morris_bardin_song_kruber_15",
			},
			sound_events = {
				[1] = "pes_morris_bardin_song_kruber_15",
			},
			sound_events_duration = {
				[1] = 8.7989587783813,
			},
		},
		pes_morris_bardin_song_kruber_16 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pes_morris_bardin_song_kruber_16",
			},
			sound_events = {
				[1] = "pes_morris_bardin_song_kruber_16",
			},
			sound_events_duration = {
				[1] = 8.8527917861938,
			},
		},
		pes_morris_extra_eighteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
		pes_morris_extra_eighteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
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
		pes_morris_extra_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_we_backstory_five_01",
			},
			sound_events = {
				[1] = "pes_we_backstory_five_01",
			},
			sound_events_duration = {
				[1] = 4.6642708778381,
			},
		},
		pes_morris_extra_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_we_backstory_five_02",
			},
			sound_events = {
				[1] = "pes_we_backstory_five_02",
			},
			sound_events_duration = {
				[1] = 2.0471665859222,
			},
		},
		pes_morris_extra_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_fourteen_01",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_fourteen_01",
			},
			sound_events_duration = {
				[1] = 4.8675208091736,
			},
		},
		pes_morris_extra_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pes_level_elven_ruins_story_nine_01",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_nine_01",
			},
			sound_events_duration = {
				[1] = 2.2701354026794,
			},
		},
		pes_morris_extra_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_elven_ruins_story_nine_02",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_nine_02",
			},
			sound_events_duration = {
				[1] = 3.5850207805634,
			},
		},
		pes_morris_extra_seventeen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_crater_conversation_ten_01",
			},
			sound_events = {
				[1] = "pes_crater_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 2.0619790554047,
			},
		},
		pes_morris_extra_seventeen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_crater_conversation_ten_02",
			},
			sound_events = {
				[1] = "pes_crater_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 3.1550936698914,
			},
		},
		pes_morris_extra_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pes_level_elven_ruins_story_four_01",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_four_01",
			},
			sound_events_duration = {
				[1] = 3.8480000495911,
			},
		},
		pes_morris_extra_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_elven_ruins_story_four_02",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_four_02",
			},
			sound_events_duration = {
				[1] = 5.804229259491,
			},
		},
		pes_morris_extra_six_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_elven_ruins_story_four_03",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_four_03",
			},
			sound_events_duration = {
				[1] = 4.9957709312439,
			},
		},
		pes_morris_extra_sixteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pes_level_bogenhafen_slum_story_twelve_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.1581041812897,
			},
		},
		pes_morris_extra_sixteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 4.5505623817444,
			},
		},
		pes_morris_extra_sixteen_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_03",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_03",
			},
			sound_events_duration = {
				[1] = 3.701812505722,
			},
		},
		pes_morris_extra_thirteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pes_bw_backstory_seven_03",
			},
			sound_events = {
				[1] = "pes_bw_backstory_seven_03",
			},
			sound_events_duration = {
				[1] = 5.1843748092651,
			},
		},
		pes_morris_extra_thirteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_bw_backstory_seven_04",
			},
			sound_events = {
				[1] = "pes_bw_backstory_seven_04",
			},
			sound_events_duration = {
				[1] = 0.87479168176651,
			},
		},
		pes_morris_extra_thirteen_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_bw_backstory_seven_05",
			},
			sound_events = {
				[1] = "pes_bw_backstory_seven_05",
			},
			sound_events_duration = {
				[1] = 1.9123333692551,
			},
		},
		pes_morris_extra_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pes_es_backstory_three_01",
			},
			sound_events = {
				[1] = "pes_es_backstory_three_01",
			},
			sound_events_duration = {
				[1] = 4.1442289352417,
			},
		},
		pes_morris_extra_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_es_backstory_three_02",
			},
			sound_events = {
				[1] = "pes_es_backstory_three_02",
			},
			sound_events_duration = {
				[1] = 6.4248957633972,
			},
		},
		pes_morris_extra_three_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_es_backstory_three_03",
			},
			sound_events = {
				[1] = "pes_es_backstory_three_03",
			},
			sound_events_duration = {
				[1] = 7.544041633606,
			},
		},
		pwe_morris_bardin_song_kerillian_13 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwe_morris_bardin_song_kerillian_13",
			},
			sound_events = {
				[1] = "pwe_morris_bardin_song_kerillian_13",
			},
			sound_events_duration = {
				[1] = 10.297854423523,
			},
		},
		pwe_morris_bardin_song_kerillian_14 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwe_morris_bardin_song_kerillian_14",
			},
			sound_events = {
				[1] = "pwe_morris_bardin_song_kerillian_14",
			},
			sound_events_duration = {
				[1] = 10.998125076294,
			},
		},
		pwe_morris_bardin_song_kerillian_15 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwe_morris_bardin_song_kerillian_15",
			},
			sound_events = {
				[1] = "pwe_morris_bardin_song_kerillian_15",
			},
			sound_events_duration = {
				[1] = 10.832562446594,
			},
		},
		pwe_morris_bardin_song_kerillian_16 = {
			category = "casual_singing_03",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_morris_bardin_song_kerillian_16",
			},
			sound_events = {
				[1] = "pwe_morris_bardin_song_kerillian_16",
			},
			sound_events_duration = {
				[1] = 8.7779788970947,
			},
		},
		pwe_morris_extra_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_eleven_01",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.3473958969116,
			},
		},
		pwe_morris_extra_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_eleven_02",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 3.7037084102631,
			},
		},
		pwe_morris_extra_eight_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_eleven_03",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_eleven_03",
			},
			sound_events_duration = {
				[1] = 3.6988542079926,
			},
		},
		pwe_morris_extra_eight_04 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_eleven_04",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_eleven_04",
			},
			sound_events_duration = {
				[1] = 1.9796458482742,
			},
		},
		pwe_morris_extra_eighteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
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
		pwe_morris_extra_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_we_backstory_two_02",
			},
			sound_events = {
				[1] = "pwe_we_backstory_two_02",
			},
			sound_events_duration = {
				[1] = 3.5494999885559,
			},
		},
		pwe_morris_extra_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_we_backstory_two_03",
			},
			sound_events = {
				[1] = "pwe_we_backstory_two_03",
			},
			sound_events_duration = {
				[1] = 2.1905832290649,
			},
		},
		pwe_morris_extra_fifteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_catacombs_story_ten_01",
			},
			sound_events = {
				[1] = "pwe_level_catacombs_story_ten_01",
			},
			sound_events_duration = {
				[1] = 3.2149999141693,
			},
		},
		pwe_morris_extra_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_eight_01",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_eight_01",
			},
			sound_events_duration = {
				[1] = 1.829958319664,
			},
		},
		pwe_morris_extra_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_eight_02",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_eight_02",
			},
			sound_events_duration = {
				[1] = 5.9905624389648,
			},
		},
		pwe_morris_extra_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_we_backstory_five_01",
			},
			sound_events = {
				[1] = "pwe_we_backstory_five_01",
			},
			sound_events_duration = {
				[1] = 2.0916874408722,
			},
		},
		pwe_morris_extra_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_we_backstory_five_02",
			},
			sound_events = {
				[1] = "pwe_we_backstory_five_02",
			},
			sound_events_duration = {
				[1] = 6.1680417060852,
			},
		},
		pwe_morris_extra_four_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_we_backstory_five_03",
			},
			sound_events = {
				[1] = "pwe_we_backstory_five_03",
			},
			sound_events_duration = {
				[1] = 2.2940833568573,
			},
		},
		pwe_morris_extra_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pwe_level_fort_story_on_the_way_five_01",
			},
			sound_events = {
				[1] = "pwe_level_fort_story_on_the_way_five_01",
			},
			sound_events_duration = {
				[1] = 6.2733335494995,
			},
		},
		pwe_morris_extra_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_fort_story_on_the_way_five_02",
			},
			sound_events = {
				[1] = "pwe_level_fort_story_on_the_way_five_02",
			},
			sound_events_duration = {
				[1] = 6.5626459121704,
			},
		},
		pwe_morris_extra_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_four_01",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_four_01",
			},
			sound_events_duration = {
				[1] = 6.1950001716614,
			},
		},
		pwe_morris_extra_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_four_02",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_four_02",
			},
			sound_events_duration = {
				[1] = 3.7526249885559,
			},
		},
		pwe_morris_extra_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wh_backstory_two_01",
			},
			sound_events = {
				[1] = "pwe_wh_backstory_two_01",
			},
			sound_events_duration = {
				[1] = 1.9249166250229,
			},
		},
		pwe_morris_extra_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wh_backstory_two_02",
			},
			sound_events = {
				[1] = "pwe_wh_backstory_two_02",
			},
			sound_events_duration = {
				[1] = 3.0732917785645,
			},
		},
		pwe_morris_extra_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wh_backstory_two_03",
			},
			sound_events = {
				[1] = "pwe_wh_backstory_two_03",
			},
			sound_events_duration = {
				[1] = 7.5326042175293,
			},
		},
		pwe_morris_extra_ten_04 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wh_backstory_two_04",
			},
			sound_events = {
				[1] = "pwe_wh_backstory_two_04",
			},
			sound_events_duration = {
				[1] = 2.4274582862854,
			},
		},
		pwe_morris_extra_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_we_backstory_one_01",
			},
			sound_events = {
				[1] = "pwe_we_backstory_one_01",
			},
			sound_events_duration = {
				[1] = 3.344583272934,
			},
		},
		pwe_morris_extra_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_we_backstory_one_02",
			},
			sound_events = {
				[1] = "pwe_we_backstory_one_02",
			},
			sound_events_duration = {
				[1] = 7.2468333244324,
			},
		},
		pwe_morris_extra_twelve_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_we_backstory_one_03",
			},
			sound_events = {
				[1] = "pwe_we_backstory_one_03",
			},
			sound_events_duration = {
				[1] = 2.8041458129883,
			},
		},
		pwh_morris_bardin_song_victor_13 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_morris_bardin_song_victor_13",
			},
			sound_events = {
				[1] = "pwh_morris_bardin_song_victor_13",
			},
			sound_events_duration = {
				[1] = 7.4259166717529,
			},
		},
		pwh_morris_bardin_song_victor_14 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_morris_bardin_song_victor_14",
			},
			sound_events = {
				[1] = "pwh_morris_bardin_song_victor_14",
			},
			sound_events_duration = {
				[1] = 9.3889999389648,
			},
		},
		pwh_morris_bardin_song_victor_15 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_morris_bardin_song_victor_15",
			},
			sound_events = {
				[1] = "pwh_morris_bardin_song_victor_15",
			},
			sound_events_duration = {
				[1] = 12.581125259399,
			},
		},
		pwh_morris_bardin_song_victor_16 = {
			category = "casual_singing_02",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
			},
			localization_strings = {
				[1] = "pwh_morris_bardin_song_victor_16",
			},
			sound_events = {
				[1] = "pwh_morris_bardin_song_victor_16",
			},
			sound_events_duration = {
				[1] = 7.6693749427795,
			},
		},
		pwh_morris_extra_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pwh_we_backstory_two_01",
			},
			sound_events = {
				[1] = "pwh_we_backstory_two_01",
			},
			sound_events_duration = {
				[1] = 2.246333360672,
			},
		},
		pwh_morris_extra_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_we_backstory_two_02",
			},
			sound_events = {
				[1] = "pwh_we_backstory_two_02",
			},
			sound_events_duration = {
				[1] = 5.0313749313355,
			},
		},
		pwh_morris_extra_eleven_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_we_backstory_two_03",
			},
			sound_events = {
				[1] = "pwh_we_backstory_two_03",
			},
			sound_events_duration = {
				[1] = 3.8466665744781,
			},
		},
		pwh_morris_extra_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pwh_level_ground_zero_story_eight_01",
			},
			sound_events = {
				[1] = "pwh_level_ground_zero_story_eight_01",
			},
			sound_events_duration = {
				[1] = 5.5637083053589,
			},
		},
		pwh_morris_extra_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_ground_zero_story_eight_02",
			},
			sound_events = {
				[1] = "pwh_level_ground_zero_story_eight_02",
			},
			sound_events_duration = {
				[1] = 1.7372708320618,
			},
		},
		pwh_morris_extra_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pwh_level_farmlands_story_fourteen_01",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_fourteen_01",
			},
			sound_events_duration = {
				[1] = 2.4721667766571,
			},
		},
		pwh_morris_extra_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_fourteen_02",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_fourteen_02",
			},
			sound_events_duration = {
				[1] = 8.541895866394,
			},
		},
		pwh_morris_extra_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_elven_ruins_story_nine_01",
			},
			sound_events = {
				[1] = "pwh_level_elven_ruins_story_nine_01",
			},
			sound_events_duration = {
				[1] = 6.1801042556763,
			},
		},
		pwh_morris_extra_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_elven_ruins_story_nine_02",
			},
			sound_events = {
				[1] = "pwh_level_elven_ruins_story_nine_02",
			},
			sound_events_duration = {
				[1] = 5.0540623664856,
			},
		},
		pwh_morris_extra_seventeen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pwh_crater_conversation_ten_01",
			},
			sound_events = {
				[1] = "pwh_crater_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 5.8779792785644,
			},
		},
		pwh_morris_extra_seventeen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_crater_conversation_ten_02",
			},
			sound_events = {
				[1] = "pwh_crater_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 3.8659791946411,
			},
		},
		pwh_morris_extra_sixteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_twelve_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.4518749713898,
			},
		},
		pwh_morris_extra_sixteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_twelve_02",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 7.39297914505,
			},
		},
		pwh_morris_extra_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
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
				[1] = "pwh_wh_backstory_two_01",
			},
			sound_events = {
				[1] = "pwh_wh_backstory_two_01",
			},
			sound_events_duration = {
				[1] = 4.570291519165,
			},
		},
		pwh_morris_extra_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wh_backstory_two_02",
			},
			sound_events = {
				[1] = "pwh_wh_backstory_two_02",
			},
			sound_events_duration = {
				[1] = 4.8822498321533,
			},
		},
		pwh_morris_extra_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wh_backstory_two_03",
			},
			sound_events = {
				[1] = "pwh_wh_backstory_two_03",
			},
			sound_events_duration = {
				[1] = 2.2073957920074,
			},
		},
		pwh_morris_extra_ten_04 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wh_backstory_two_04",
			},
			sound_events = {
				[1] = "pwh_wh_backstory_two_04",
			},
			sound_events_duration = {
				[1] = 10.645041465759,
			},
		},
		pwh_morris_extra_ten_05 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wh_backstory_two_05",
			},
			sound_events = {
				[1] = "pwh_wh_backstory_two_05",
			},
			sound_events_duration = {
				[1] = 5.1951665878296,
			},
		},
		pwh_morris_extra_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_es_backstory_three_01",
			},
			sound_events = {
				[1] = "pwh_es_backstory_three_01",
			},
			sound_events_duration = {
				[1] = 4.8949584960938,
			},
		},
		pwh_morris_extra_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_es_backstory_three_02",
			},
			sound_events = {
				[1] = "pwh_es_backstory_three_02",
			},
			sound_events_duration = {
				[1] = 5.2699375152588,
			},
		},
		pwh_morris_extra_three_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_es_backstory_three_03",
			},
			sound_events = {
				[1] = "pwh_es_backstory_three_03",
			},
			sound_events_duration = {
				[1] = 6.9128332138061,
			},
		},
		pwh_morris_extra_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_bw_backstory_three_01",
			},
			sound_events = {
				[1] = "pwh_bw_backstory_three_01",
			},
			sound_events_duration = {
				[1] = 2.1572499275208,
			},
		},
		pwh_morris_extra_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_bw_backstory_three_02",
			},
			sound_events = {
				[1] = "pwh_bw_backstory_three_02",
			},
			sound_events_duration = {
				[1] = 5.830020904541,
			},
		},
		pwh_morris_extra_two_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_extras",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_bw_backstory_three_03",
			},
			sound_events = {
				[1] = "pwh_bw_backstory_three_03",
			},
			sound_events_duration = {
				[1] = 9.5503540039063,
			},
		},
	})
end
