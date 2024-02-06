﻿-- chunkname: @dialogues/generated/hero_conversations_elven_ruins.lua

return function ()
	define_rule({
		name = "pbw_level_elven_ruins_story_eight_01",
		response = "pbw_level_elven_ruins_story_eight_01",
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
				600,
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_elven_ruins_story_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_elven_ruins_story_eight_01",
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
		name = "pbw_level_elven_ruins_story_eight_02",
		response = "pbw_level_elven_ruins_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eight_01",
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
		name = "pbw_level_elven_ruins_story_eight_03",
		response = "pbw_level_elven_ruins_story_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eight_02",
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
		name = "pbw_level_elven_ruins_story_five_01",
		response = "pbw_level_elven_ruins_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_five_01",
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
		name = "pbw_level_elven_ruins_story_seven_01",
		response = "pbw_level_elven_ruins_story_seven_01",
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
				"empire_soldier",
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
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_elven_ruins_story_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_elven_ruins_story_seven_01",
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
		name = "pbw_level_elven_ruins_story_seven_02",
		response = "pbw_level_elven_ruins_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_seven_01",
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
		name = "pbw_level_elven_ruins_story_ten_01",
		response = "pbw_level_elven_ruins_story_ten_01",
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
				600,
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_elven_ruins_story_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_elven_ruins_story_ten_01",
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
		name = "pbw_level_elven_ruins_story_ten_02",
		response = "pbw_level_elven_ruins_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_elven_ruins_story_ten_01",
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
		name = "pbw_level_elven_ruins_story_twelve_02",
		response = "pbw_level_elven_ruins_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_twelve_01",
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
		name = "pbw_level_elven_ruins_story_twelve_03",
		response = "pbw_level_elven_ruins_story_twelve_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_twelve_02",
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
		name = "pbw_level_elven_ruins_story_two_01",
		response = "pbw_level_elven_ruins_story_two_01",
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
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_elven_ruins_story_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_elven_ruins_story_two_01",
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
		name = "pbw_level_elven_ruins_story_two_02",
		response = "pbw_level_elven_ruins_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_two_01",
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
		name = "pdr_level_elven_ruins_story_eight_01",
		response = "pdr_level_elven_ruins_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_eight_01",
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
		name = "pdr_level_elven_ruins_story_eight_02",
		response = "pdr_level_elven_ruins_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_eight_02",
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
		name = "pdr_level_elven_ruins_story_eleven_01",
		response = "pdr_level_elven_ruins_story_eleven_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pdr_level_elven_ruins_story_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_elven_ruins_story_eleven_01",
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
		name = "pdr_level_elven_ruins_story_eleven_02",
		response = "pdr_level_elven_ruins_story_eleven_02",
		criterias = {
			{
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
		name = "pdr_level_elven_ruins_story_eleven_03",
		response = "pdr_level_elven_ruins_story_eleven_03",
		criterias = {
			{
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
		name = "pdr_level_elven_ruins_story_eleven_04",
		response = "pdr_level_elven_ruins_story_eleven_04",
		criterias = {
			{
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
		name = "pdr_level_elven_ruins_story_five_01",
		response = "pdr_level_elven_ruins_story_five_01",
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
				"bright_wizard",
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
				600,
			},
			{
				"faction_memory",
				"once_per_level_pdr_level_elven_ruins_story_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_elven_ruins_story_five_01",
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
		name = "pdr_level_elven_ruins_story_five_02",
		response = "pdr_level_elven_ruins_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_five_01",
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
		name = "pdr_level_elven_ruins_story_one_01",
		response = "pdr_level_elven_ruins_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_one_01",
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
		name = "pdr_level_elven_ruins_story_seven_01",
		response = "pdr_level_elven_ruins_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_seven_02",
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
		name = "pdr_level_elven_ruins_story_six_01",
		response = "pdr_level_elven_ruins_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_elven_ruins_story_six_01",
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
		name = "pdr_level_elven_ruins_story_three_01",
		response = "pdr_level_elven_ruins_story_three_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pdr_level_elven_ruins_story_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_elven_ruins_story_three_01",
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
		name = "pdr_level_elven_ruins_story_three_02",
		response = "pdr_level_elven_ruins_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_three_01",
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
		name = "pes_level_elven_ruins_story_five_01",
		response = "pes_level_elven_ruins_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_five_02",
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
		name = "pes_level_elven_ruins_story_four_01",
		response = "pes_level_elven_ruins_story_four_01",
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
				600,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_elven_ruins_story_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_elven_ruins_story_four_01",
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
		name = "pes_level_elven_ruins_story_four_02",
		response = "pes_level_elven_ruins_story_four_02",
		criterias = {
			{
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
		name = "pes_level_elven_ruins_story_four_03",
		response = "pes_level_elven_ruins_story_four_03",
		criterias = {
			{
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
		name = "pes_level_elven_ruins_story_nine_01",
		response = "pes_level_elven_ruins_story_nine_01",
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
				600,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_elven_ruins_story_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_elven_ruins_story_nine_01",
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
		name = "pes_level_elven_ruins_story_nine_02",
		response = "pes_level_elven_ruins_story_nine_02",
		criterias = {
			{
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
		name = "pes_level_elven_ruins_story_seven_01",
		response = "pes_level_elven_ruins_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_seven_01",
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
		name = "pes_level_elven_ruins_story_seven_02",
		response = "pes_level_elven_ruins_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_seven_02",
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
		name = "pes_level_elven_ruins_story_twelve_01",
		response = "pes_level_elven_ruins_story_twelve_01",
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
				600,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_elven_ruins_story_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_elven_ruins_story_twelve_01",
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
		name = "pes_level_elven_ruins_story_twelve_02",
		response = "pes_level_elven_ruins_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_twelve_02",
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
		name = "pwe_level_elven_ruins_story_eleven_01",
		response = "pwe_level_elven_ruins_story_eleven_01",
		criterias = {
			{
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
		name = "pwe_level_elven_ruins_story_eleven_02",
		response = "pwe_level_elven_ruins_story_eleven_02",
		criterias = {
			{
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
		name = "pwe_level_elven_ruins_story_eleven_03",
		response = "pwe_level_elven_ruins_story_eleven_03",
		criterias = {
			{
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
		name = "pwe_level_elven_ruins_story_eleven_04",
		response = "pwe_level_elven_ruins_story_eleven_04",
		criterias = {
			{
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
		name = "pwe_level_elven_ruins_story_four_01",
		response = "pwe_level_elven_ruins_story_four_01",
		criterias = {
			{
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
		name = "pwe_level_elven_ruins_story_four_02",
		response = "pwe_level_elven_ruins_story_four_02",
		criterias = {
			{
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
		name = "pwe_level_elven_ruins_story_one_01",
		response = "pwe_level_elven_ruins_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_elven_ruins_story_one_01",
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
		name = "pwe_level_elven_ruins_story_six_01",
		response = "pwe_level_elven_ruins_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_six_01",
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
		name = "pwe_level_elven_ruins_story_three_01",
		response = "pwe_level_elven_ruins_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_three_01",
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
		name = "pwe_level_elven_ruins_story_three_02",
		response = "pwe_level_elven_ruins_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_three_02",
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
		name = "pwe_level_elven_ruins_story_two_01",
		response = "pwe_level_elven_ruins_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_two_01",
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
		name = "pwe_level_elven_ruins_story_two_02",
		response = "pwe_level_elven_ruins_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_two_02",
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
		name = "pwh_level_elven_ruins_story_nine_01",
		response = "pwh_level_elven_ruins_story_nine_01",
		criterias = {
			{
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
		name = "pwh_level_elven_ruins_story_nine_02",
		response = "pwh_level_elven_ruins_story_nine_02",
		criterias = {
			{
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
		name = "pwh_level_elven_ruins_story_one_01",
		response = "pwh_level_elven_ruins_story_one_01",
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
				600,
			},
			{
				"faction_memory",
				"once_per_level_pwh_level_elven_ruins_story_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_elven_ruins_story_one_01",
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
		name = "pwh_level_elven_ruins_story_one_02",
		response = "pwh_level_elven_ruins_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_one_01",
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
		name = "pwh_level_elven_ruins_story_six_01",
		response = "pwh_level_elven_ruins_story_six_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pwh_level_elven_ruins_story_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_elven_ruins_story_six_01",
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
		name = "pwh_level_elven_ruins_story_ten_01",
		response = "pwh_level_elven_ruins_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_ten_01",
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
		name = "pwh_level_elven_ruins_story_ten_02",
		response = "pwh_level_elven_ruins_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_elven_ruins_story_ten_02",
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
		pbw_level_elven_ruins_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
				[1] = "pbw_level_elven_ruins_story_eight_01",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_eight_01",
			},
			sound_events_duration = {
				[1] = 2.870374917984,
			},
		},
		pbw_level_elven_ruins_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_elven_ruins_story_eight_02",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_eight_02",
			},
			sound_events_duration = {
				[1] = 0.94999998807907,
			},
		},
		pbw_level_elven_ruins_story_eight_03 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_elven_ruins_story_eight_03",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_eight_03",
			},
			sound_events_duration = {
				[1] = 2.9850208759308,
			},
		},
		pbw_level_elven_ruins_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_elven_ruins_story_five_01",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_five_01",
			},
			sound_events_duration = {
				[1] = 5.2618751525879,
			},
		},
		pbw_level_elven_ruins_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
				[1] = "pbw_level_elven_ruins_story_seven_01",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_seven_01",
			},
			sound_events_duration = {
				[1] = 3.7363541126251,
			},
		},
		pbw_level_elven_ruins_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_elven_ruins_story_seven_02",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_seven_02",
			},
			sound_events_duration = {
				[1] = 3.9451875686645,
			},
		},
		pbw_level_elven_ruins_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
				[1] = "pbw_level_elven_ruins_story_ten_01",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_ten_01",
			},
			sound_events_duration = {
				[1] = 4.7380623817444,
			},
		},
		pbw_level_elven_ruins_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_elven_ruins_story_ten_02",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_ten_02",
			},
			sound_events_duration = {
				[1] = 4.5434584617615,
			},
		},
		pbw_level_elven_ruins_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_elven_ruins_story_twelve_02",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 7.2718544006348,
			},
		},
		pbw_level_elven_ruins_story_twelve_03 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_elven_ruins_story_twelve_03",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_twelve_03",
			},
			sound_events_duration = {
				[1] = 6.4198331832886,
			},
		},
		pbw_level_elven_ruins_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
				[1] = "pbw_level_elven_ruins_story_two_01",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_two_01",
			},
			sound_events_duration = {
				[1] = 2.4844374656677,
			},
		},
		pbw_level_elven_ruins_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_elven_ruins_story_two_02",
			},
			sound_events = {
				[1] = "pbw_level_elven_ruins_story_two_02",
			},
			sound_events_duration = {
				[1] = 2.4205832481384,
			},
		},
		pdr_level_elven_ruins_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_eight_01",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_eight_01",
			},
			sound_events_duration = {
				[1] = 6.8415207862854,
			},
		},
		pdr_level_elven_ruins_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_eight_02",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_eight_02",
			},
			sound_events_duration = {
				[1] = 8.8025207519531,
			},
		},
		pdr_level_elven_ruins_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
		pdr_level_elven_ruins_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pdr_level_elven_ruins_story_eleven_03 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pdr_level_elven_ruins_story_eleven_04 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pdr_level_elven_ruins_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
				[1] = "pdr_level_elven_ruins_story_five_01",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_five_01",
			},
			sound_events_duration = {
				[1] = 7.528416633606,
			},
		},
		pdr_level_elven_ruins_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_five_02",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_five_02",
			},
			sound_events_duration = {
				[1] = 2.0361874103546,
			},
		},
		pdr_level_elven_ruins_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_one_01",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_one_01",
			},
			sound_events_duration = {
				[1] = 5.3132500648499,
			},
		},
		pdr_level_elven_ruins_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_seven_01",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_seven_01",
			},
			sound_events_duration = {
				[1] = 8.5593128204346,
			},
		},
		pdr_level_elven_ruins_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_six_01",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_six_01",
			},
			sound_events_duration = {
				[1] = 7.3347291946411,
			},
		},
		pdr_level_elven_ruins_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
				[1] = "pdr_level_elven_ruins_story_three_01",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_three_01",
			},
			sound_events_duration = {
				[1] = 4.4914164543152,
			},
		},
		pdr_level_elven_ruins_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_elven_ruins_story_three_02",
			},
			sound_events = {
				[1] = "pdr_level_elven_ruins_story_three_02",
			},
			sound_events_duration = {
				[1] = 3.4912083148956,
			},
		},
		pes_level_elven_ruins_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_elven_ruins_story_five_01",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_five_01",
			},
			sound_events_duration = {
				[1] = 4.5272707939148,
			},
		},
		pes_level_elven_ruins_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
		pes_level_elven_ruins_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pes_level_elven_ruins_story_four_03 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pes_level_elven_ruins_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
		pes_level_elven_ruins_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pes_level_elven_ruins_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_elven_ruins_story_seven_01",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_seven_01",
			},
			sound_events_duration = {
				[1] = 4.581666469574,
			},
		},
		pes_level_elven_ruins_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_elven_ruins_story_seven_02",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_seven_02",
			},
			sound_events_duration = {
				[1] = 5.1917915344238,
			},
		},
		pes_level_elven_ruins_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
				[1] = "pes_level_elven_ruins_story_twelve_01",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.3752293586731,
			},
		},
		pes_level_elven_ruins_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_elven_ruins_story_twelve_02",
			},
			sound_events = {
				[1] = "pes_level_elven_ruins_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 5.0324583053589,
			},
		},
		pwe_level_elven_ruins_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pwe_level_elven_ruins_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pwe_level_elven_ruins_story_eleven_03 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pwe_level_elven_ruins_story_eleven_04 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pwe_level_elven_ruins_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pwe_level_elven_ruins_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pwe_level_elven_ruins_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_one_01",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_one_01",
			},
			sound_events_duration = {
				[1] = 8.8853330612183,
			},
		},
		pwe_level_elven_ruins_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_six_01",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_six_01",
			},
			sound_events_duration = {
				[1] = 5.2375416755676,
			},
		},
		pwe_level_elven_ruins_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_three_01",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_three_01",
			},
			sound_events_duration = {
				[1] = 8.2994585037231,
			},
		},
		pwe_level_elven_ruins_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_three_02",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_three_02",
			},
			sound_events_duration = {
				[1] = 7.892541885376,
			},
		},
		pwe_level_elven_ruins_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_two_01",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_two_01",
			},
			sound_events_duration = {
				[1] = 4.9800834655762,
			},
		},
		pwe_level_elven_ruins_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_elven_ruins_story_two_02",
			},
			sound_events = {
				[1] = "pwe_level_elven_ruins_story_two_02",
			},
			sound_events_duration = {
				[1] = 9.1235418319702,
			},
		},
		pwh_level_elven_ruins_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pwh_level_elven_ruins_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
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
		pwh_level_elven_ruins_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
				[1] = "pwh_level_elven_ruins_story_one_01",
			},
			sound_events = {
				[1] = "pwh_level_elven_ruins_story_one_01",
			},
			sound_events_duration = {
				[1] = 3.588770866394,
			},
		},
		pwh_level_elven_ruins_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_elven_ruins_story_one_02",
			},
			sound_events = {
				[1] = "pwh_level_elven_ruins_story_one_02",
			},
			sound_events_duration = {
				[1] = 1.4946041107178,
			},
		},
		pwh_level_elven_ruins_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
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
				[1] = "pwh_level_elven_ruins_story_six_01",
			},
			sound_events = {
				[1] = "pwh_level_elven_ruins_story_six_01",
			},
			sound_events_duration = {
				[1] = 3.8639376163483,
			},
		},
		pwh_level_elven_ruins_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_elven_ruins_story_ten_01",
			},
			sound_events = {
				[1] = "pwh_level_elven_ruins_story_ten_01",
			},
			sound_events_duration = {
				[1] = 2.5592291355133,
			},
		},
		pwh_level_elven_ruins_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_elven_ruins",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_elven_ruins_story_ten_02",
			},
			sound_events = {
				[1] = "pwh_level_elven_ruins_story_ten_02",
			},
			sound_events_duration = {
				[1] = 4.8910207748413,
			},
		},
	})
end
