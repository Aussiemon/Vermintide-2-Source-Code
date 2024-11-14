-- chunkname: @dialogues/generated/hero_conversations_dlc_drachenfels_castle.lua

return function ()
	define_rule({
		name = "pbw_castle_conversation_four_01",
		probability = 1,
		response = "pbw_castle_conversation_four_01",
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
				"witch_hunter",
				OP.EQ,
				1,
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
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pbw_castle_conversation_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_castle_conversation_four_01",
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
		name = "pbw_castle_conversation_four_02",
		probability = 1,
		response = "pbw_castle_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_four_01",
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
		name = "pbw_castle_conversation_nine_01",
		probability = 1,
		response = "pbw_castle_conversation_nine_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pbw_castle_conversation_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_castle_conversation_nine_01",
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
		name = "pbw_castle_conversation_nine_02",
		probability = 1,
		response = "pbw_castle_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_castle_conversation_nine_01",
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
		name = "pbw_castle_conversation_one_01",
		probability = 1,
		response = "pbw_castle_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_one_01",
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
		name = "pbw_castle_conversation_six_01",
		probability = 1,
		response = "pbw_castle_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_six_01",
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
		name = "pbw_castle_conversation_six_02",
		probability = 1,
		response = "pbw_castle_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_six_02",
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
		name = "pbw_castle_conversation_twelve_01",
		probability = 1,
		response = "pbw_castle_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_twelve_01",
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
		name = "pdr_castle_conversation_eleven_01",
		probability = 1,
		response = "pdr_castle_conversation_eleven_01",
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
				"wood_elf",
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
				120,
			},
			{
				"faction_memory",
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pdr_castle_conversation_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_castle_conversation_eleven_01",
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
		name = "pdr_castle_conversation_nine_01",
		probability = 1,
		response = "pdr_castle_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_nine_01",
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
		name = "pdr_castle_conversation_seven_01",
		probability = 1,
		response = "pdr_castle_conversation_seven_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pdr_castle_conversation_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_castle_conversation_seven_01",
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
		name = "pdr_castle_conversation_seven_02",
		probability = 1,
		response = "pdr_castle_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_seven_01",
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
		name = "pes_castle_conversation_eight_01",
		probability = 1,
		response = "pes_castle_conversation_eight_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_eight_01",
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
		name = "pes_castle_conversation_eight_02",
		probability = 1,
		response = "pes_castle_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_eight_01",
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
		name = "pes_castle_conversation_one_01",
		probability = 1,
		response = "pes_castle_conversation_one_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_one_01",
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
		name = "pes_castle_conversation_six_01",
		probability = 1,
		response = "pes_castle_conversation_six_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_six_01",
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
		name = "pes_castle_conversation_six_02",
		probability = 1,
		response = "pes_castle_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_six_01",
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
		name = "pes_castle_conversation_ten_01",
		probability = 1,
		response = "pes_castle_conversation_ten_01",
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
				"wood_elf",
				OP.EQ,
				1,
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
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_ten_01",
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
		name = "pes_castle_conversation_three_01",
		probability = 1,
		response = "pes_castle_conversation_three_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_three_01",
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
		name = "pes_castle_conversation_three_02",
		probability = 1,
		response = "pes_castle_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_three_01",
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
		name = "pes_castle_conversation_twelve_01",
		probability = 1,
		response = "pes_castle_conversation_twelve_01",
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
				"witch_hunter",
				OP.EQ,
				1,
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
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_twelve_01",
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
		name = "pes_castle_conversation_twelve_02",
		probability = 1,
		response = "pes_castle_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_twelve_01",
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
		name = "pes_castle_conversation_two_01",
		probability = 1,
		response = "pes_castle_conversation_two_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_two_01",
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
		name = "pes_castle_conversation_two_02",
		probability = 1,
		response = "pes_castle_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_two_01",
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
		name = "pwe_castle_conversation_eleven_01",
		probability = 1,
		response = "pwe_castle_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_castle_conversation_eleven_01",
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
		name = "pwe_castle_conversation_eleven_02",
		probability = 1,
		response = "pwe_castle_conversation_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_eleven_01",
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
		name = "pwe_castle_conversation_five_01",
		probability = 1,
		response = "pwe_castle_conversation_five_01",
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
				"witch_hunter",
				OP.EQ,
				1,
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
				"castle_vo_find_a_way_up",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pwe_castle_conversation_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_castle_conversation_five_01",
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
		name = "pwe_castle_conversation_five_02",
		probability = 1,
		response = "pwe_castle_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_five_01",
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
		name = "pwe_castle_conversation_ten_01",
		probability = 1,
		response = "pwe_castle_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_ten_01",
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
		name = "pwe_castle_conversation_three_01",
		probability = 1,
		response = "pwe_castle_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_three_01",
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
		name = "pwe_castle_conversation_three_02",
		probability = 1,
		response = "pwe_castle_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_three_02",
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
		name = "pwe_castle_conversation_two_01",
		probability = 1,
		response = "pwe_castle_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_two_01",
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
		name = "pwe_castle_conversation_two_02",
		probability = 1,
		response = "pwe_castle_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_two_02",
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
		name = "pwh_castle_conversation_eight_01",
		probability = 1,
		response = "pwh_castle_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_eight_01",
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
		name = "pwh_castle_conversation_eight_02",
		probability = 1,
		response = "pwh_castle_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_eight_02",
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
		name = "pwh_castle_conversation_eleven_01",
		probability = 1,
		response = "pwh_castle_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_eleven_01",
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
		name = "pwh_castle_conversation_five_01",
		probability = 1,
		response = "pwh_castle_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_five_01",
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
		name = "pwh_castle_conversation_five_02",
		probability = 1,
		response = "pwh_castle_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_five_02",
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
		name = "pwh_castle_conversation_four_01",
		probability = 1,
		response = "pwh_castle_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_four_01",
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
		name = "pwh_castle_conversation_four_02",
		probability = 1,
		response = "pwh_castle_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_four_02",
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
		name = "pwh_castle_conversation_seven_01",
		probability = 1,
		response = "pwh_castle_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_castle_conversation_seven_01",
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
		name = "pwh_castle_conversation_ten_01",
		probability = 1,
		response = "pwh_castle_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_ten_01",
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
		name = "pwh_castle_conversation_ten_02",
		probability = 1,
		response = "pwh_castle_conversation_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_ten_01",
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
		name = "pwh_castle_conversation_twelve_01",
		probability = 1,
		response = "pwh_castle_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_twelve_02",
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
		pbw_castle_conversation_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pbw_castle_conversation_four_01",
			},
			sound_events = {
				[1] = "pbw_castle_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 9.0179796218872,
			},
		},
		pbw_castle_conversation_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_castle_conversation_four_02",
			},
			sound_events = {
				[1] = "pbw_castle_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 2.1579792499542,
			},
		},
		pbw_castle_conversation_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pbw_castle_conversation_nine_01",
			},
			sound_events = {
				[1] = "pbw_castle_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 4.2839789390564,
			},
		},
		pbw_castle_conversation_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_castle_conversation_nine_02",
			},
			sound_events = {
				[1] = "pbw_castle_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 3.0099792480469,
			},
		},
		pbw_castle_conversation_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_castle_conversation_one_01",
			},
			sound_events = {
				[1] = "pbw_castle_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 2.4229791164398,
			},
		},
		pbw_castle_conversation_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_castle_conversation_six_01",
			},
			sound_events = {
				[1] = "pbw_castle_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 6.7489790916443,
			},
		},
		pbw_castle_conversation_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_castle_conversation_six_02",
			},
			sound_events = {
				[1] = "pbw_castle_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 3.9459791183472,
			},
		},
		pbw_castle_conversation_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_castle_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pbw_castle_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.129979133606,
			},
		},
		pdr_castle_conversation_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pdr_castle_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pdr_castle_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.2659792900085,
			},
		},
		pdr_castle_conversation_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_castle_conversation_nine_01",
			},
			sound_events = {
				[1] = "pdr_castle_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 6.0109791755676,
			},
		},
		pdr_castle_conversation_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pdr_castle_conversation_seven_01",
			},
			sound_events = {
				[1] = "pdr_castle_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 4.1759791374206,
			},
		},
		pdr_castle_conversation_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_castle_conversation_seven_02",
			},
			sound_events = {
				[1] = "pdr_castle_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 5.9869790077209,
			},
		},
		pes_castle_conversation_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pes_castle_conversation_eight_01",
			},
			sound_events = {
				[1] = "pes_castle_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 7.5199790000916,
			},
		},
		pes_castle_conversation_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_castle_conversation_eight_02",
			},
			sound_events = {
				[1] = "pes_castle_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 5.745979309082,
			},
		},
		pes_castle_conversation_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pes_castle_conversation_one_01",
			},
			sound_events = {
				[1] = "pes_castle_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 2.345999956131,
			},
		},
		pes_castle_conversation_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pes_castle_conversation_six_01",
			},
			sound_events = {
				[1] = "pes_castle_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 4.5149793624878,
			},
		},
		pes_castle_conversation_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_castle_conversation_six_02",
			},
			sound_events = {
				[1] = "pes_castle_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 0.9139791727066,
			},
		},
		pes_castle_conversation_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pes_castle_conversation_ten_01",
			},
			sound_events = {
				[1] = "pes_castle_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 2.2821249961853,
			},
		},
		pes_castle_conversation_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pes_castle_conversation_three_01",
			},
			sound_events = {
				[1] = "pes_castle_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 1.784979224205,
			},
		},
		pes_castle_conversation_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_castle_conversation_three_02",
			},
			sound_events = {
				[1] = "pes_castle_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 6.1701667308807,
			},
		},
		pes_castle_conversation_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pes_castle_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pes_castle_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 7.0159792900085,
			},
		},
		pes_castle_conversation_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_castle_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pes_castle_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.2789790630341,
			},
		},
		pes_castle_conversation_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pes_castle_conversation_two_01",
			},
			sound_events = {
				[1] = "pes_castle_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.7309792041779,
			},
		},
		pes_castle_conversation_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_castle_conversation_two_02",
			},
			sound_events = {
				[1] = "pes_castle_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 4.4879789352417,
			},
		},
		pwe_castle_conversation_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_castle_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pwe_castle_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.2539792060852,
			},
		},
		pwe_castle_conversation_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_castle_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pwe_castle_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 2.0749790668488,
			},
		},
		pwe_castle_conversation_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
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
				[1] = "pwe_castle_conversation_five_01",
			},
			sound_events = {
				[1] = "pwe_castle_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 7.004979133606,
			},
		},
		pwe_castle_conversation_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_castle_conversation_five_02",
			},
			sound_events = {
				[1] = "pwe_castle_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 8.2849788665772,
			},
		},
		pwe_castle_conversation_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_castle_conversation_ten_01",
			},
			sound_events = {
				[1] = "pwe_castle_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 3.0729792118073,
			},
		},
		pwe_castle_conversation_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_castle_conversation_three_01",
			},
			sound_events = {
				[1] = "pwe_castle_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 0.81097918748856,
			},
		},
		pwe_castle_conversation_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_castle_conversation_three_02",
			},
			sound_events = {
				[1] = "pwe_castle_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 2.8880000114441,
			},
		},
		pwe_castle_conversation_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_castle_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_castle_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.3879792690277,
			},
		},
		pwe_castle_conversation_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_castle_conversation_two_02",
			},
			sound_events = {
				[1] = "pwe_castle_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 4.4269790649414,
			},
		},
		pwh_castle_conversation_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_eight_01",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 3.7149791717529,
			},
		},
		pwh_castle_conversation_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_eight_02",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 2.1059792041779,
			},
		},
		pwh_castle_conversation_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 1.9289791584015,
			},
		},
		pwh_castle_conversation_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_five_01",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 4.9849791526794,
			},
		},
		pwh_castle_conversation_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_five_02",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 4.4939789772034,
			},
		},
		pwh_castle_conversation_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_four_01",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 8.2899789810181,
			},
		},
		pwh_castle_conversation_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_four_02",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 1.5099791288376,
			},
		},
		pwh_castle_conversation_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 9.3859786987305,
			},
		},
		pwh_castle_conversation_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_ten_01",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 3.506979227066,
			},
		},
		pwh_castle_conversation_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_ten_02",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 2.158979177475,
			},
		},
		pwh_castle_conversation_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_castle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_castle_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwh_castle_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 2.8929791450501,
			},
		},
	})
end
