-- chunkname: @dialogues/generated/dlc_shovel.lua

return function ()
	define_rule({
		name = "pbw_nm_shovel_conversation_eighteen_01",
		response = "pbw_nm_shovel_conversation_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_eighteen_01",
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
		name = "pbw_nm_shovel_conversation_eighteen_02",
		response = "pbw_nm_shovel_conversation_eighteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_eighteen_02",
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
		name = "pbw_nm_shovel_conversation_eleven_01",
		response = "pbw_nm_shovel_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_eleven_01",
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
		name = "pbw_nm_shovel_conversation_eleven_02",
		response = "pbw_nm_shovel_conversation_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_eleven_02",
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
		name = "pbw_nm_shovel_conversation_fifteen_01",
		response = "pbw_nm_shovel_conversation_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_fifteen_01",
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
		name = "pbw_nm_shovel_conversation_fifteen_02",
		response = "pbw_nm_shovel_conversation_fifteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_fifteen_02",
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
		name = "pbw_nm_shovel_conversation_four_01",
		response = "pbw_nm_shovel_conversation_four_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_three_four",
				OP.EQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_three_four",
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
		name = "pbw_nm_shovel_conversation_four_02",
		response = "pbw_nm_shovel_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_four_01",
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
		name = "pbw_nm_shovel_conversation_four_03",
		response = "pbw_nm_shovel_conversation_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_four_02",
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
		name = "pbw_nm_shovel_conversation_fourteen_01",
		response = "pbw_nm_shovel_conversation_fourteen_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
				1,
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_fourteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_fourteen",
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
		name = "pbw_nm_shovel_conversation_fourteen_02",
		response = "pbw_nm_shovel_conversation_fourteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_fourteen_01",
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
		name = "pbw_nm_shovel_conversation_nine_01",
		response = "pbw_nm_shovel_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_nine_01",
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
		name = "pbw_nm_shovel_conversation_nine_02",
		response = "pbw_nm_shovel_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_nine_02",
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
		name = "pbw_nm_shovel_conversation_nineteen_01",
		response = "pbw_nm_shovel_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_nineteen_01",
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
		name = "pbw_nm_shovel_conversation_nineteen_02",
		response = "pbw_nm_shovel_conversation_nineteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_nineteen_02",
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
		name = "pbw_nm_shovel_conversation_one_01",
		response = "pbw_nm_shovel_conversation_one_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_one",
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
		name = "pbw_nm_shovel_conversation_one_02",
		response = "pbw_nm_shovel_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_one_01",
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
		name = "pbw_nm_shovel_conversation_one_a_01",
		response = "pbw_nm_shovel_conversation_one_a_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
			},
			{
				"global_context",
				"we_thornsister",
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
				"shovel_conversation_one_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_one_a",
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
		name = "pbw_nm_shovel_conversation_one_a_02",
		response = "pbw_nm_shovel_conversation_one_a_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_st_shovel_conversation_one_a_01",
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
		name = "pbw_nm_shovel_conversation_one_a_03",
		response = "pbw_nm_shovel_conversation_one_a_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_st_shovel_conversation_one_a_02",
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
		name = "pbw_nm_shovel_conversation_seventeen_01",
		response = "pbw_nm_shovel_conversation_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_seventeen_01",
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
		name = "pbw_nm_shovel_conversation_seventeen_02",
		response = "pbw_nm_shovel_conversation_seventeen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_seventeen_02",
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
		name = "pbw_nm_shovel_conversation_sixteen_01",
		response = "pbw_nm_shovel_conversation_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_sixteen_01",
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
		name = "pbw_nm_shovel_conversation_sixteen_02",
		response = "pbw_nm_shovel_conversation_sixteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_sixteen_02",
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
		name = "pbw_nm_shovel_conversation_ten_01",
		response = "pbw_nm_shovel_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_ten_01",
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
		name = "pbw_nm_shovel_conversation_ten_02",
		response = "pbw_nm_shovel_conversation_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_ten_02",
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
		name = "pbw_nm_shovel_conversation_ten_03",
		response = "pbw_nm_shovel_conversation_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_ten_03",
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
		name = "pbw_nm_shovel_conversation_thirteen_01",
		response = "pbw_nm_shovel_conversation_thirteen_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
				1,
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_thirteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_thirteen",
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
		name = "pbw_nm_shovel_conversation_thirteen_02",
		response = "pbw_nm_shovel_conversation_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_thirteen_01",
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
		name = "pbw_nm_shovel_conversation_three_01",
		response = "pbw_nm_shovel_conversation_three_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_three_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_three_four",
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
		name = "pbw_nm_shovel_conversation_three_02",
		response = "pbw_nm_shovel_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_three_01",
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
		name = "pbw_nm_shovel_conversation_three_03",
		response = "pbw_nm_shovel_conversation_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_three_02",
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
		name = "pbw_nm_shovel_conversation_twelve_01",
		response = "pbw_nm_shovel_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_twelve_01",
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
		name = "pbw_nm_shovel_conversation_twelve_02",
		response = "pbw_nm_shovel_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_twelve_02",
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
		name = "pbw_nm_shovel_conversation_twenty_01",
		response = "pbw_nm_shovel_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twenty_01",
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
		name = "pbw_nm_shovel_conversation_twenty_02",
		response = "pbw_nm_shovel_conversation_twenty_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twenty_02",
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
		name = "pbw_nm_shovel_conversation_twentyfive_01",
		response = "pbw_nm_shovel_conversation_twentyfive_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_twentyfive",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twentyfive",
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
		name = "pbw_nm_shovel_conversation_twentyfive_02",
		response = "pbw_nm_shovel_conversation_twentyfive_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentyfive_02",
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
		name = "pbw_nm_shovel_conversation_twentyfour_01",
		response = "pbw_nm_shovel_conversation_twentyfour_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentyfour_01",
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
		name = "pbw_nm_shovel_conversation_twentyfour_02",
		response = "pbw_nm_shovel_conversation_twentyfour_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentyfour_02",
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
		name = "pbw_nm_shovel_conversation_twentyone_01",
		response = "pbw_nm_shovel_conversation_twentyone_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentyone_01",
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
		name = "pbw_nm_shovel_conversation_twentyone_02",
		response = "pbw_nm_shovel_conversation_twentyone_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentyone_02",
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
		name = "pbw_nm_shovel_conversation_twentythree_01",
		response = "pbw_nm_shovel_conversation_twentythree_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_twentythree",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twentythree",
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
		name = "pbw_nm_shovel_conversation_twentythree_02",
		response = "pbw_nm_shovel_conversation_twentythree_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentythree_02",
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
		name = "pbw_nm_shovel_conversation_twentythree_03",
		response = "pbw_nm_shovel_conversation_twentythree_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentythree_03",
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
		name = "pbw_nm_shovel_conversation_twentytwo_01",
		response = "pbw_nm_shovel_conversation_twentytwo_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentytwo_01",
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
		name = "pbw_nm_shovel_conversation_twentytwo_02",
		response = "pbw_nm_shovel_conversation_twentytwo_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentytwo_02",
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
		name = "pbw_nm_shovel_conversation_two_01",
		response = "pbw_nm_shovel_conversation_two_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_two",
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
		name = "pbw_nm_shovel_conversation_two_02",
		response = "pbw_nm_shovel_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_two_01",
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
		name = "pbw_nm_shovel_conversation_two_03",
		response = "pbw_nm_shovel_conversation_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_two_02",
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
		name = "pbw_nm_shovel_conversation_two_a_01",
		response = "pbw_nm_shovel_conversation_two_a_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"bw_necromancer",
			},
			{
				"global_context",
				"we_thornsister",
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
				"shovel_conversation_two_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_two_a",
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
		name = "pbw_nm_shovel_conversation_two_a_02",
		response = "pbw_nm_shovel_conversation_two_a_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_st_shovel_conversation_two_a_01",
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
		name = "pbw_nm_shovel_conversation_two_a_03",
		response = "pbw_nm_shovel_conversation_two_a_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_st_shovel_conversation_two_a_02",
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
		name = "pdr_shovel_conversation_eight_01",
		response = "pdr_shovel_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_eight_01",
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
		name = "pdr_shovel_conversation_eleven_01",
		response = "pdr_shovel_conversation_eleven_01",
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
				"bw_necromancer",
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
				"shovel_conversation_eleven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_eleven",
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
		name = "pdr_shovel_conversation_eleven_02",
		response = "pdr_shovel_conversation_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_eleven_01",
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
		name = "pdr_shovel_conversation_five_01",
		response = "pdr_shovel_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_five_01",
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
		name = "pdr_shovel_conversation_nine_01",
		response = "pdr_shovel_conversation_nine_01",
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
				"bw_necromancer",
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
				"shovel_conversation_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_nine",
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
		name = "pdr_shovel_conversation_nine_02",
		response = "pdr_shovel_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_nine_01",
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
		name = "pdr_shovel_conversation_seven_01",
		response = "pdr_shovel_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_seven_01",
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
		name = "pdr_shovel_conversation_six_01",
		response = "pdr_shovel_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_six_01",
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
		name = "pdr_shovel_conversation_ten_01",
		response = "pdr_shovel_conversation_ten_01",
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
				"bw_necromancer",
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
				"shovel_conversation_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_ten",
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
		name = "pdr_shovel_conversation_ten_02",
		response = "pdr_shovel_conversation_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_ten_01",
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
		name = "pdr_shovel_conversation_ten_03",
		response = "pdr_shovel_conversation_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_ten_02",
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
		name = "pdr_shovel_conversation_twelve_01",
		response = "pdr_shovel_conversation_twelve_01",
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
				"bw_necromancer",
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
				"shovel_conversation_twelve",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twelve",
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
		name = "pdr_shovel_conversation_twelve_02",
		response = "pdr_shovel_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twelve_01",
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
		name = "pdr_shovel_conversation_twelve_03",
		response = "pdr_shovel_conversation_twelve_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twelve_02",
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
		name = "pdr_shovel_conversation_twentynine_01",
		response = "pdr_shovel_conversation_twentynine_01",
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
				0,
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				50,
			},
			{
				"faction_memory",
				"shovel_conversation_twentysix-nine",
				OP.EQ,
				3,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twentysix-nine",
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
		name = "pdr_shovel_conversation_twentynine_02",
		response = "pdr_shovel_conversation_twentynine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gk_shovel_conversation_twentynine_01",
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
		name = "pdr_shovel_conversation_twentyseven_01",
		response = "pdr_shovel_conversation_twentyseven_01",
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
				0,
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_twentysix-nine",
				OP.EQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twentysix-nine",
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
		name = "pdr_shovel_conversation_twentysix_01",
		response = "pdr_shovel_conversation_twentysix_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_twentysix_02",
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
		name = "pes_gk_shovel_conversation_twentyeight_01",
		response = "pes_gk_shovel_conversation_twentyeight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wp_shovel_conversation_twentyeight_01",
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
		name = "pes_gk_shovel_conversation_twentyeight_02",
		response = "pes_gk_shovel_conversation_twentyeight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wp_shovel_conversation_twentyeight_02",
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
		name = "pes_gk_shovel_conversation_twentynine_01",
		response = "pes_gk_shovel_conversation_twentynine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wp_shovel_conversation_twentynine_01",
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
		name = "pes_shovel_conversation_eight_01",
		response = "pes_shovel_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_eight_01",
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
		name = "pes_shovel_conversation_five_01",
		response = "pes_shovel_conversation_five_01",
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
				2,
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
				"dwarf_ranger",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_five",
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
		name = "pes_shovel_conversation_seven_01",
		response = "pes_shovel_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_seven_01",
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
		name = "pes_shovel_conversation_six_01",
		response = "pes_shovel_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_six_01",
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
		name = "pes_shovel_conversation_twenty_01",
		response = "pes_shovel_conversation_twenty_01",
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
				"bw_necromancer",
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
				"shovel_conversation_twenty_twentyone_twentyfour",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twenty_twentyone_twentyfour",
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
		name = "pes_shovel_conversation_twenty_02",
		response = "pes_shovel_conversation_twenty_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twenty_01",
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
		name = "pes_shovel_conversation_twentyfive_02",
		response = "pes_shovel_conversation_twentyfive_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twentyfive_01",
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
		name = "pes_shovel_conversation_twentyfour_01",
		response = "pes_shovel_conversation_twentyfour_01",
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
				"bw_necromancer",
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
				"shovel_conversation_twenty_twentyone_twentyfour",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twenty_twentyone_twentyfour",
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
		name = "pes_shovel_conversation_twentyfour_02",
		response = "pes_shovel_conversation_twentyfour_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twentyfour_01",
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
		name = "pes_shovel_conversation_twentyfour_03",
		response = "pes_shovel_conversation_twentyfour_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twentyfour_02",
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
		name = "pes_shovel_conversation_twentyone_01",
		response = "pes_shovel_conversation_twentyone_01",
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
				"bw_necromancer",
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
				"shovel_conversation_twenty_twentyone_twentyfour",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twenty_twentyone_twentyfour",
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
		name = "pes_shovel_conversation_twentyone_02",
		response = "pes_shovel_conversation_twentyone_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twentyone_01",
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
		name = "pes_shovel_conversation_twentyseven_01",
		response = "pes_shovel_conversation_twentyseven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_twentyseven_01",
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
		name = "pes_shovel_conversation_twentyseven_02",
		response = "pes_shovel_conversation_twentyseven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_twentyseven_01",
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
		name = "pes_shovel_conversation_twentysix_01",
		response = "pes_shovel_conversation_twentysix_01",
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
				"empire_soldier",
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
				"shovel_conversation_twentysix-nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twentysix-nine",
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
		name = "pes_shovel_conversation_twentysix_02",
		response = "pes_shovel_conversation_twentysix_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_twentysix_01",
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
		name = "pes_shovel_conversation_twentythree_02",
		response = "pes_shovel_conversation_twentythree_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twentythree_01",
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
		name = "pes_shovel_conversation_twentythree_03",
		response = "pes_shovel_conversation_twentythree_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twentythree_02",
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
		name = "pes_shovel_conversation_twentytwo_01",
		response = "pes_shovel_conversation_twentytwo_01",
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
				"bw_necromancer",
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
				"shovel_conversation_twentytwo",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twentytwo",
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
		name = "pes_shovel_conversation_twentytwo_02",
		response = "pes_shovel_conversation_twentytwo_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_twentytwo_01",
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
		name = "pwe_shovel_conversation_eight_01",
		response = "pwe_shovel_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_eight_01",
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
		name = "pwe_shovel_conversation_five_01",
		response = "pwe_shovel_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_five_01",
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
		name = "pwe_shovel_conversation_four_01",
		response = "pwe_shovel_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_four_01",
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
		name = "pwe_shovel_conversation_four_02",
		response = "pwe_shovel_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_four_02",
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
		name = "pwe_shovel_conversation_one_01",
		response = "pwe_shovel_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_one_01",
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
		name = "pwe_shovel_conversation_one_02",
		response = "pwe_shovel_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_one_02",
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
		name = "pwe_shovel_conversation_seven_01",
		response = "pwe_shovel_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shovel_conversation_seven_01",
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
		name = "pwe_shovel_conversation_six_01",
		response = "pwe_shovel_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_six_01",
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
		name = "pwe_shovel_conversation_three_01",
		response = "pwe_shovel_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_three_01",
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
		name = "pwe_shovel_conversation_three_02",
		response = "pwe_shovel_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_three_02",
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
		name = "pwe_shovel_conversation_two_01",
		response = "pwe_shovel_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_two_01",
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
		name = "pwe_shovel_conversation_two_02",
		response = "pwe_shovel_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_two_02",
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
		name = "pwe_shovel_conversation_two_03",
		response = "pwe_shovel_conversation_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_two_03",
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
		name = "pwe_st_shovel_conversation_one_a_01",
		response = "pwe_st_shovel_conversation_one_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_one_a_01",
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
		name = "pwe_st_shovel_conversation_one_a_02",
		response = "pwe_st_shovel_conversation_one_a_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_one_a_02",
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
		name = "pwe_st_shovel_conversation_two_a_01",
		response = "pwe_st_shovel_conversation_two_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_two_a_01",
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
		name = "pwe_st_shovel_conversation_two_a_02",
		response = "pwe_st_shovel_conversation_two_a_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_two_a_02",
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
		name = "pwe_st_shovel_conversation_two_a_03",
		response = "pwe_st_shovel_conversation_two_a_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_two_a_03",
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
		name = "pwh_shovel_conversation_eight_01",
		response = "pwh_shovel_conversation_eight_01",
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
				2,
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_eight",
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
		name = "pwh_shovel_conversation_eighteen_01",
		response = "pwh_shovel_conversation_eighteen_01",
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
				"bw_necromancer",
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
				"shovel_conversation_eighteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_eighteen",
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
		name = "pwh_shovel_conversation_eighteen_02",
		response = "pwh_shovel_conversation_eighteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_eighteen_01",
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
		name = "pwh_shovel_conversation_fifteen_01",
		response = "pwh_shovel_conversation_fifteen_01",
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
				"bw_necromancer",
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
				"shovel_conversation_fifteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_fifteen",
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
		name = "pwh_shovel_conversation_fifteen_02",
		response = "pwh_shovel_conversation_fifteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_fifteen_01",
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
		name = "pwh_shovel_conversation_five_01",
		response = "pwh_shovel_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_five_01",
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
		name = "pwh_shovel_conversation_fourteen_01",
		response = "pwh_shovel_conversation_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_fourteen_01",
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
		name = "pwh_shovel_conversation_fourteen_02",
		response = "pwh_shovel_conversation_fourteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_fourteen_02",
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
		name = "pwh_shovel_conversation_nineteen_01",
		response = "pwh_shovel_conversation_nineteen_01",
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
				"bw_necromancer",
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
				"shovel_conversation_nineteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_nineteen",
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
		name = "pwh_shovel_conversation_nineteen_02",
		response = "pwh_shovel_conversation_nineteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_nineteen_01",
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
		name = "pwh_shovel_conversation_nineteen_03",
		response = "pwh_shovel_conversation_nineteen_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_nineteen_02",
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
		name = "pwh_shovel_conversation_seven_01",
		response = "pwh_shovel_conversation_seven_01",
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
				2,
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_seven",
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
		name = "pwh_shovel_conversation_seventeen_01",
		response = "pwh_shovel_conversation_seventeen_01",
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
				"bw_necromancer",
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
				"shovel_conversation_seventeen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_seventeen",
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
		name = "pwh_shovel_conversation_seventeen_02",
		response = "pwh_shovel_conversation_seventeen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_seventeen_01",
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
		name = "pwh_shovel_conversation_six_01",
		response = "pwh_shovel_conversation_six_01",
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
				2,
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
				60,
			},
			{
				"faction_memory",
				"shovel_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_six",
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
		name = "pwh_shovel_conversation_six_02",
		response = "pwh_shovel_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shovel_conversation_six_01",
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
		name = "pwh_shovel_conversation_sixteen_01",
		response = "pwh_shovel_conversation_sixteen_01",
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
				"bw_necromancer",
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
				"shovel_conversation_sixteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_sixteen",
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
		name = "pwh_shovel_conversation_sixteen_02",
		response = "pwh_shovel_conversation_sixteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_sixteen_01",
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
		name = "pwh_shovel_conversation_thirteen_01",
		response = "pwh_shovel_conversation_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_nm_shovel_conversation_thirteen_01",
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
		name = "pwh_shovel_conversation_twentynine_02",
		response = "pwh_shovel_conversation_twentynine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_twentynine_02",
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
		name = "pwh_shovel_conversation_twentyseven_01",
		response = "pwh_shovel_conversation_twentyseven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentyseven_01",
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
		name = "pwh_shovel_conversation_twentyseven_02",
		response = "pwh_shovel_conversation_twentyseven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentyseven_02",
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
		name = "pwh_shovel_conversation_twentysix_01",
		response = "pwh_shovel_conversation_twentysix_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentysix_01",
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
		name = "pwh_shovel_conversation_twentysix_02",
		response = "pwh_shovel_conversation_twentysix_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shovel_conversation_twentysix_02",
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
		name = "pwh_wp_shovel_conversation_twentyeight_01",
		response = "pwh_wp_shovel_conversation_twentyeight_01",
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
				"player_career",
				OP.EQ,
				"wh_priest",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
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
				"shovel_conversation_twentysix-nine",
				OP.EQ,
				2,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shovel_conversation_twentysix-nine",
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
		name = "pwh_wp_shovel_conversation_twentyeight_02",
		response = "pwh_wp_shovel_conversation_twentyeight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gk_shovel_conversation_twentyeight_01",
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
		name = "pwh_wp_shovel_conversation_twentynine_01",
		response = "pwh_wp_shovel_conversation_twentynine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shovel_conversation_twentynine_01",
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
		pbw_nm_shovel_conversation_eighteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_eighteen_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_eighteen_01",
			},
			sound_events_duration = {
				[1] = 5.1089792251587,
			},
		},
		pbw_nm_shovel_conversation_eighteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_eighteen_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_eighteen_02",
			},
			sound_events_duration = {
				[1] = 4.6089792251587,
			},
		},
		pbw_nm_shovel_conversation_eleven_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.1099998950958,
			},
		},
		pbw_nm_shovel_conversation_eleven_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 2.3259792327881,
			},
		},
		pbw_nm_shovel_conversation_fifteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_fifteen_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_fifteen_01",
			},
			sound_events_duration = {
				[1] = 5.6079998016357,
			},
		},
		pbw_nm_shovel_conversation_fifteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_fifteen_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_fifteen_02",
			},
			sound_events_duration = {
				[1] = 1.4869791269302,
			},
		},
		pbw_nm_shovel_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_four_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 7.8819789886475,
			},
		},
		pbw_nm_shovel_conversation_four_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_four_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 3.1119792461395,
			},
		},
		pbw_nm_shovel_conversation_four_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_four_03",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_four_03",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pbw_nm_shovel_conversation_fourteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_fourteen_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_fourteen_01",
			},
			sound_events_duration = {
				[1] = 6.4460000991821,
			},
		},
		pbw_nm_shovel_conversation_fourteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_fourteen_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_fourteen_02",
			},
			sound_events_duration = {
				[1] = 5.9179792404175,
			},
		},
		pbw_nm_shovel_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_nine_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 1.0140000581741,
			},
		},
		pbw_nm_shovel_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_nine_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 0.630979180336,
			},
		},
		pbw_nm_shovel_conversation_nineteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_nineteen_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_nineteen_01",
			},
			sound_events_duration = {
				[1] = 8.0739793777466,
			},
		},
		pbw_nm_shovel_conversation_nineteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_nineteen_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_nineteen_02",
			},
			sound_events_duration = {
				[1] = 2.9969792366028,
			},
		},
		pbw_nm_shovel_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_one_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.8929998874664,
			},
		},
		pbw_nm_shovel_conversation_one_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_one_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 2.7599999904633,
			},
		},
		pbw_nm_shovel_conversation_one_a_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_one_a_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_one_a_01",
			},
			sound_events_duration = {
				[1] = 6.3069791793823,
			},
		},
		pbw_nm_shovel_conversation_one_a_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_one_a_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_one_a_02",
			},
			sound_events_duration = {
				[1] = 4.0890002250671,
			},
		},
		pbw_nm_shovel_conversation_one_a_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_one_a_03",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_one_a_03",
			},
			sound_events_duration = {
				[1] = 4.3439998626709,
			},
		},
		pbw_nm_shovel_conversation_seventeen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_seventeen_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_seventeen_01",
			},
			sound_events_duration = {
				[1] = 7.0890002250671,
			},
		},
		pbw_nm_shovel_conversation_seventeen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_seventeen_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_seventeen_02",
			},
			sound_events_duration = {
				[1] = 3.9270000457764,
			},
		},
		pbw_nm_shovel_conversation_sixteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_sixteen_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_sixteen_01",
			},
			sound_events_duration = {
				[1] = 2.5009791851044,
			},
		},
		pbw_nm_shovel_conversation_sixteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_sixteen_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_sixteen_02",
			},
			sound_events_duration = {
				[1] = 1.699979186058,
			},
		},
		pbw_nm_shovel_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_ten_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 1.8880000114441,
			},
		},
		pbw_nm_shovel_conversation_ten_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_ten_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 4.1849999427795,
			},
		},
		pbw_nm_shovel_conversation_ten_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_ten_03",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_ten_03",
			},
			sound_events_duration = {
				[1] = 3.8469998836517,
			},
		},
		pbw_nm_shovel_conversation_thirteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_thirteen_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_thirteen_01",
			},
			sound_events_duration = {
				[1] = 2.694000005722,
			},
		},
		pbw_nm_shovel_conversation_thirteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_thirteen_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_thirteen_02",
			},
			sound_events_duration = {
				[1] = 2.7699999809265,
			},
		},
		pbw_nm_shovel_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_three_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 9.1189794540405,
			},
		},
		pbw_nm_shovel_conversation_three_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_three_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 7.4359793663025,
			},
		},
		pbw_nm_shovel_conversation_three_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_three_03",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_three_03",
			},
			sound_events_duration = {
				[1] = 2.6919791698456,
			},
		},
		pbw_nm_shovel_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.8619790077209,
			},
		},
		pbw_nm_shovel_conversation_twelve_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 6.4899792671204,
			},
		},
		pbw_nm_shovel_conversation_twenty_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twenty_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twenty_01",
			},
			sound_events_duration = {
				[1] = 7.3229999542236,
			},
		},
		pbw_nm_shovel_conversation_twenty_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twenty_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twenty_02",
			},
			sound_events_duration = {
				[1] = 2.0909790992737,
			},
		},
		pbw_nm_shovel_conversation_twentyfive_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_twentyfive_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 2.2630000114441,
			},
		},
		pbw_nm_shovel_conversation_twentyfive_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twentyfive_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 6.1269793510437,
			},
		},
		pbw_nm_shovel_conversation_twentyfour_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twentyfour_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentyfour_01",
			},
			sound_events_duration = {
				[1] = 1.8400000333786,
			},
		},
		pbw_nm_shovel_conversation_twentyfour_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twentyfour_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentyfour_02",
			},
			sound_events_duration = {
				[1] = 10.080979347229,
			},
		},
		pbw_nm_shovel_conversation_twentyone_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twentyone_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentyone_01",
			},
			sound_events_duration = {
				[1] = 6.8029789924622,
			},
		},
		pbw_nm_shovel_conversation_twentyone_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twentyone_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentyone_02",
			},
			sound_events_duration = {
				[1] = 2.5889999866486,
			},
		},
		pbw_nm_shovel_conversation_twentythree_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_twentythree_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentythree_01",
			},
			sound_events_duration = {
				[1] = 5.0120000839233,
			},
		},
		pbw_nm_shovel_conversation_twentythree_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twentythree_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentythree_02",
			},
			sound_events_duration = {
				[1] = 4.6349792480469,
			},
		},
		pbw_nm_shovel_conversation_twentythree_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twentythree_03",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentythree_03",
			},
			sound_events_duration = {
				[1] = 3.7179999351502,
			},
		},
		pbw_nm_shovel_conversation_twentytwo_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twentytwo_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentytwo_01",
			},
			sound_events_duration = {
				[1] = 3.0439999103546,
			},
		},
		pbw_nm_shovel_conversation_twentytwo_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_twentytwo_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_twentytwo_02",
			},
			sound_events_duration = {
				[1] = 4.5589790344238,
			},
		},
		pbw_nm_shovel_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_two_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 7.8539791107178,
			},
		},
		pbw_nm_shovel_conversation_two_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_two_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 3.2539792060852,
			},
		},
		pbw_nm_shovel_conversation_two_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_two_03",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_two_03",
			},
			sound_events_duration = {
				[1] = 3.6899790763855,
			},
		},
		pbw_nm_shovel_conversation_two_a_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pbw_nm_shovel_conversation_two_a_01",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_two_a_01",
			},
			sound_events_duration = {
				[1] = 2.9879791736603,
			},
		},
		pbw_nm_shovel_conversation_two_a_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_two_a_02",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_two_a_02",
			},
			sound_events_duration = {
				[1] = 1.6819791793823,
			},
		},
		pbw_nm_shovel_conversation_two_a_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_shovel_conversation_two_a_03",
			},
			sound_events = {
				[1] = "pbw_nm_shovel_conversation_two_a_03",
			},
			sound_events_duration = {
				[1] = 6.0099792480469,
			},
		},
		pdr_shovel_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_eight_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 6.6669793128967,
			},
		},
		pdr_shovel_conversation_eleven_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pdr_shovel_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 5.0329790115356,
			},
		},
		pdr_shovel_conversation_eleven_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 5.8299789428711,
			},
		},
		pdr_shovel_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_five_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 7.9829792976379,
			},
		},
		pdr_shovel_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pdr_shovel_conversation_nine_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 6.4839792251587,
			},
		},
		pdr_shovel_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_nine_02",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 3.4659790992737,
			},
		},
		pdr_shovel_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_seven_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 5.8229789733887,
			},
		},
		pdr_shovel_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_six_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 6.4369792938232,
			},
		},
		pdr_shovel_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pdr_shovel_conversation_ten_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 8.8159790039063,
			},
		},
		pdr_shovel_conversation_ten_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_ten_02",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 6.245979309082,
			},
		},
		pdr_shovel_conversation_ten_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_ten_03",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_ten_03",
			},
			sound_events_duration = {
				[1] = 1.8379791975021,
			},
		},
		pdr_shovel_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pdr_shovel_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.4179792404175,
			},
		},
		pdr_shovel_conversation_twelve_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 4.4399790763855,
			},
		},
		pdr_shovel_conversation_twelve_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 2.198979139328,
			},
		},
		pdr_shovel_conversation_twentynine_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pdr_shovel_conversation_twentynine_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_twentynine_01",
			},
			sound_events_duration = {
				[1] = 7.2799792289734,
			},
		},
		pdr_shovel_conversation_twentynine_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_twentynine_02",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_twentynine_02",
			},
			sound_events_duration = {
				[1] = 3.5819792747498,
			},
		},
		pdr_shovel_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pdr_shovel_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 4.8629789352417,
			},
		},
		pdr_shovel_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_shovel_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pdr_shovel_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 2.7059791088104,
			},
		},
		pes_gk_shovel_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_gk_shovel_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "pes_gk_shovel_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 2.2509999275208,
			},
		},
		pes_gk_shovel_conversation_twentyeight_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_gk_shovel_conversation_twentyeight_02",
			},
			sound_events = {
				[1] = "pes_gk_shovel_conversation_twentyeight_02",
			},
			sound_events_duration = {
				[1] = 5.8999791145325,
			},
		},
		pes_gk_shovel_conversation_twentynine_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_gk_shovel_conversation_twentynine_01",
			},
			sound_events = {
				[1] = "pes_gk_shovel_conversation_twentynine_01",
			},
			sound_events_duration = {
				[1] = 3.8780000209808,
			},
		},
		pes_shovel_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_eight_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 4.4279789924622,
			},
		},
		pes_shovel_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pes_shovel_conversation_five_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 6.4719791412353,
			},
		},
		pes_shovel_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_seven_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 5.0149998664856,
			},
		},
		pes_shovel_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_six_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 6.6019792556763,
			},
		},
		pes_shovel_conversation_twenty_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pes_shovel_conversation_twenty_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twenty_01",
			},
			sound_events_duration = {
				[1] = 3.3429999351502,
			},
		},
		pes_shovel_conversation_twenty_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twenty_02",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twenty_02",
			},
			sound_events_duration = {
				[1] = 5.1119790077209,
			},
		},
		pes_shovel_conversation_twentyfive_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentyfive_02",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 3.0130000114441,
			},
		},
		pes_shovel_conversation_twentyfour_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pes_shovel_conversation_twentyfour_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentyfour_01",
			},
			sound_events_duration = {
				[1] = 5.9339790344238,
			},
		},
		pes_shovel_conversation_twentyfour_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentyfour_02",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentyfour_02",
			},
			sound_events_duration = {
				[1] = 2.6579792499542,
			},
		},
		pes_shovel_conversation_twentyfour_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentyfour_03",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentyfour_03",
			},
			sound_events_duration = {
				[1] = 5.0839791297913,
			},
		},
		pes_shovel_conversation_twentyone_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pes_shovel_conversation_twentyone_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentyone_01",
			},
			sound_events_duration = {
				[1] = 2.5259792804718,
			},
		},
		pes_shovel_conversation_twentyone_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentyone_02",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentyone_02",
			},
			sound_events_duration = {
				[1] = 4.7449793815613,
			},
		},
		pes_shovel_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 3.3389792442322,
			},
		},
		pes_shovel_conversation_twentyseven_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentyseven_02",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentyseven_02",
			},
			sound_events_duration = {
				[1] = 7.4629793167114,
			},
		},
		pes_shovel_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pes_shovel_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 3.1019792556763,
			},
		},
		pes_shovel_conversation_twentysix_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentysix_02",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentysix_02",
			},
			sound_events_duration = {
				[1] = 7.9249792098999,
			},
		},
		pes_shovel_conversation_twentythree_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentythree_02",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentythree_02",
			},
			sound_events_duration = {
				[1] = 5.0489792823792,
			},
		},
		pes_shovel_conversation_twentythree_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentythree_03",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentythree_03",
			},
			sound_events_duration = {
				[1] = 3.3539791107178,
			},
		},
		pes_shovel_conversation_twentytwo_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pes_shovel_conversation_twentytwo_01",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentytwo_01",
			},
			sound_events_duration = {
				[1] = 4.7929792404175,
			},
		},
		pes_shovel_conversation_twentytwo_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_shovel_conversation_twentytwo_02",
			},
			sound_events = {
				[1] = "pes_shovel_conversation_twentytwo_02",
			},
			sound_events_duration = {
				[1] = 3.2479791641235,
			},
		},
		pwe_shovel_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_eight_01",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 6.3549790382385,
			},
		},
		pwe_shovel_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_five_01",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 4.040979385376,
			},
		},
		pwe_shovel_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_four_01",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 2.2619791030884,
			},
		},
		pwe_shovel_conversation_four_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_four_02",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 5.9459791183472,
			},
		},
		pwe_shovel_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_one_01",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.977979183197,
			},
		},
		pwe_shovel_conversation_one_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_one_02",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 1.1809791326523,
			},
		},
		pwe_shovel_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 8.4319791793823,
			},
		},
		pwe_shovel_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_six_01",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 3.7529792785645,
			},
		},
		pwe_shovel_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_three_01",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 3.8229792118073,
			},
		},
		pwe_shovel_conversation_three_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_three_02",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 3.9179792404175,
			},
		},
		pwe_shovel_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 4.5879998207092,
			},
		},
		pwe_shovel_conversation_two_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_two_02",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 4.4079790115356,
			},
		},
		pwe_shovel_conversation_two_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_shovel_conversation_two_03",
			},
			sound_events = {
				[1] = "pwe_shovel_conversation_two_03",
			},
			sound_events_duration = {
				[1] = 0.79297918081284,
			},
		},
		pwe_st_shovel_conversation_one_a_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_st_shovel_conversation_one_a_01",
			},
			sound_events = {
				[1] = "pwe_st_shovel_conversation_one_a_01",
			},
			sound_events_duration = {
				[1] = 1.6559791564941,
			},
		},
		pwe_st_shovel_conversation_one_a_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_st_shovel_conversation_one_a_02",
			},
			sound_events = {
				[1] = "pwe_st_shovel_conversation_one_a_02",
			},
			sound_events_duration = {
				[1] = 5.0159792900085,
			},
		},
		pwe_st_shovel_conversation_two_a_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_st_shovel_conversation_two_a_01",
			},
			sound_events = {
				[1] = "pwe_st_shovel_conversation_two_a_01",
			},
			sound_events_duration = {
				[1] = 0.84397917985916,
			},
		},
		pwe_st_shovel_conversation_two_a_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_st_shovel_conversation_two_a_02",
			},
			sound_events = {
				[1] = "pwe_st_shovel_conversation_two_a_02",
			},
			sound_events_duration = {
				[1] = 5.4289793968201,
			},
		},
		pwe_st_shovel_conversation_two_a_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_st_shovel_conversation_two_a_03",
			},
			sound_events = {
				[1] = "pwe_st_shovel_conversation_two_a_03",
			},
			sound_events_duration = {
				[1] = 2.073979139328,
			},
		},
		pwh_shovel_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pwh_shovel_conversation_eight_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 8.6149787902832,
			},
		},
		pwh_shovel_conversation_eighteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pwh_shovel_conversation_eighteen_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_eighteen_01",
			},
			sound_events_duration = {
				[1] = 7.249979019165,
			},
		},
		pwh_shovel_conversation_eighteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_eighteen_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_eighteen_02",
			},
			sound_events_duration = {
				[1] = 8.4589796066284,
			},
		},
		pwh_shovel_conversation_fifteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pwh_shovel_conversation_fifteen_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_fifteen_01",
			},
			sound_events_duration = {
				[1] = 7.2379789352417,
			},
		},
		pwh_shovel_conversation_fifteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_fifteen_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_fifteen_02",
			},
			sound_events_duration = {
				[1] = 10.754979133606,
			},
		},
		pwh_shovel_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_five_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 4.2889790534973,
			},
		},
		pwh_shovel_conversation_fourteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_fourteen_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_fourteen_01",
			},
			sound_events_duration = {
				[1] = 5.7739791870117,
			},
		},
		pwh_shovel_conversation_fourteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_fourteen_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_fourteen_02",
			},
			sound_events_duration = {
				[1] = 4.2699790000916,
			},
		},
		pwh_shovel_conversation_nineteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pwh_shovel_conversation_nineteen_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_nineteen_01",
			},
			sound_events_duration = {
				[1] = 3.4759790897369,
			},
		},
		pwh_shovel_conversation_nineteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_nineteen_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_nineteen_02",
			},
			sound_events_duration = {
				[1] = 2.4439792633057,
			},
		},
		pwh_shovel_conversation_nineteen_03 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_nineteen_03",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_nineteen_03",
			},
			sound_events_duration = {
				[1] = 6.879979133606,
			},
		},
		pwh_shovel_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pwh_shovel_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 6.9359793663025,
			},
		},
		pwh_shovel_conversation_seventeen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pwh_shovel_conversation_seventeen_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_seventeen_01",
			},
			sound_events_duration = {
				[1] = 3.2669792175293,
			},
		},
		pwh_shovel_conversation_seventeen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_seventeen_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_seventeen_02",
			},
			sound_events_duration = {
				[1] = 6.9469790458679,
			},
		},
		pwh_shovel_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pwh_shovel_conversation_six_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 6.5559792518616,
			},
		},
		pwh_shovel_conversation_six_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_six_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 6.0999794006348,
			},
		},
		pwh_shovel_conversation_sixteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pwh_shovel_conversation_sixteen_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_sixteen_01",
			},
			sound_events_duration = {
				[1] = 11.417979240418,
			},
		},
		pwh_shovel_conversation_sixteen_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_sixteen_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_sixteen_02",
			},
			sound_events_duration = {
				[1] = 0.57697916030884,
			},
		},
		pwh_shovel_conversation_thirteen_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_thirteen_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_thirteen_01",
			},
			sound_events_duration = {
				[1] = 9.5729789733887,
			},
		},
		pwh_shovel_conversation_twentynine_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_twentynine_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_twentynine_02",
			},
			sound_events_duration = {
				[1] = 5.0509791374206,
			},
		},
		pwh_shovel_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 1.8499791622162,
			},
		},
		pwh_shovel_conversation_twentyseven_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_twentyseven_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_twentyseven_02",
			},
			sound_events_duration = {
				[1] = 7.504979133606,
			},
		},
		pwh_shovel_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 5.816978931427,
			},
		},
		pwh_shovel_conversation_twentysix_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_shovel_conversation_twentysix_02",
			},
			sound_events = {
				[1] = "pwh_shovel_conversation_twentysix_02",
			},
			sound_events_duration = {
				[1] = 1.9649791717529,
			},
		},
		pwh_wp_shovel_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
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
				[1] = "pwh_wp_shovel_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "pwh_wp_shovel_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 6.6139793395996,
			},
		},
		pwh_wp_shovel_conversation_twentyeight_02 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wp_shovel_conversation_twentyeight_02",
			},
			sound_events = {
				[1] = "pwh_wp_shovel_conversation_twentyeight_02",
			},
			sound_events_duration = {
				[1] = 8.9419794082642,
			},
		},
		pwh_wp_shovel_conversation_twentynine_01 = {
			category = "story_talk_keep",
			database = "dlc_shovel",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wp_shovel_conversation_twentynine_01",
			},
			sound_events = {
				[1] = "pwh_wp_shovel_conversation_twentynine_01",
			},
			sound_events_duration = {
				[1] = 2.6629791259766,
			},
		},
	})
end
