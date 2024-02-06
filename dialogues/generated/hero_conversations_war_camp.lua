-- chunkname: @dialogues/generated/hero_conversations_war_camp.lua

return function ()
	define_rule({
		name = "pbw_level_chaos_war_camp_story_four_01",
		response = "pbw_level_chaos_war_camp_story_four_01",
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
				"level_chaos_war_camp_battering_ram",
				OP.NOT,
				"level_chaos_war_camp_battering_ram",
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
				"once_per_level_pbw_level_chaos_war_camp_story_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_chaos_war_camp_story_four_01",
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
		name = "pbw_level_chaos_war_camp_story_four_02",
		response = "pbw_level_chaos_war_camp_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_chaos_war_camp_story_four_01",
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
		name = "pbw_level_chaos_war_camp_story_nine_02",
		response = "pbw_level_chaos_war_camp_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_chaos_war_camp_story_nine_01",
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
		name = "pbw_level_chaos_war_camp_story_nine_03",
		response = "pbw_level_chaos_war_camp_story_nine_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_chaos_war_camp_story_nine_02",
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
		name = "pbw_level_chaos_war_camp_story_seven_01",
		response = "pbw_level_chaos_war_camp_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_seven_01",
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
		name = "pbw_level_chaos_war_camp_story_seven_02",
		response = "pbw_level_chaos_war_camp_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_seven_02",
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
		name = "pdr_level_chaos_war_camp_story_eleven_01",
		response = "pdr_level_chaos_war_camp_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_chaos_war_camp_story_eleven_01",
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
		name = "pdr_level_chaos_war_camp_story_eleven_02",
		response = "pdr_level_chaos_war_camp_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_chaos_war_camp_story_eleven_02",
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
		name = "pdr_level_chaos_war_camp_story_five_01",
		response = "pdr_level_chaos_war_camp_story_five_01",
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
				"friends_close",
				OP.GT,
				1,
			},
			{
				"user_context",
				"intensity",
				OP.EQ,
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
				"empire_soldier",
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
				"once_per_level_pdr_level_chaos_war_camp_story_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_chaos_war_camp_story_five_01",
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
		name = "pdr_level_chaos_war_camp_story_five_02",
		response = "pdr_level_chaos_war_camp_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_five_01",
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
		name = "pdr_level_chaos_war_camp_story_five_03",
		response = "pdr_level_chaos_war_camp_story_five_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_five_02",
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
		name = "pdr_level_chaos_war_camp_story_nine_01",
		response = "pdr_level_chaos_war_camp_story_nine_01",
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
				"faction_memory",
				"level_chaos_war_camp_battering_ram",
				OP.NOT,
				"level_chaos_war_camp_battering_ram",
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
				"once_per_level_pdr_level_chaos_war_camp_story_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_chaos_war_camp_story_nine_01",
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
		name = "pdr_level_chaos_war_camp_story_nine_02",
		response = "pdr_level_chaos_war_camp_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_chaos_war_camp_story_nine_02",
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
		name = "pdr_level_chaos_war_camp_story_twelve_01",
		response = "pdr_level_chaos_war_camp_story_twelve_01",
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
				"level_chaos_war_camp_battering_ram",
				OP.NOT,
				"level_chaos_war_camp_battering_ram",
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
				"once_per_level_pdr_level_chaos_war_camp_story_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_chaos_war_camp_story_twelve_01",
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
		name = "pdr_level_chaos_war_camp_story_twelve_02",
		response = "pdr_level_chaos_war_camp_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_twelve_01",
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
		name = "pdr_level_chaos_war_camp_story_two_01",
		response = "pdr_level_chaos_war_camp_story_two_01",
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
				"level_chaos_war_camp_battering_ram",
				OP.NOT,
				"level_chaos_war_camp_battering_ram",
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
				"once_per_level_pdr_level_chaos_war_camp_story_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_chaos_war_camp_story_two_01",
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
		name = "pdr_level_chaos_war_camp_story_two_02",
		response = "pdr_level_chaos_war_camp_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_chaos_war_camp_story_two_01",
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
		name = "pdr_level_chaos_war_camp_story_two_03",
		response = "pdr_level_chaos_war_camp_story_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_chaos_war_camp_story_two_02",
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
		name = "pes_level_chaos_war_camp_story_eight_01",
		response = "pes_level_chaos_war_camp_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_chaos_war_camp_story_eight_01",
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
		name = "pes_level_chaos_war_camp_story_eight_02",
		response = "pes_level_chaos_war_camp_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_chaos_war_camp_story_eight_02",
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
		name = "pes_level_chaos_war_camp_story_eight_03",
		response = "pes_level_chaos_war_camp_story_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_chaos_war_camp_story_eight_03",
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
		name = "pes_level_chaos_war_camp_story_five_01",
		response = "pes_level_chaos_war_camp_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_chaos_war_camp_story_five_01",
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
		name = "pes_level_chaos_war_camp_story_five_02",
		response = "pes_level_chaos_war_camp_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_chaos_war_camp_story_five_02",
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
		name = "pes_level_chaos_war_camp_story_seven_01",
		response = "pes_level_chaos_war_camp_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"user_context",
				"item_tag",
				OP.EQ,
				"pes_level_chaos_war_camp_story_seven_01",
			},
			{
				"user_context",
				"enemies_close",
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
				"once_per_level_pes_level_chaos_war_camp_story_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_chaos_war_camp_story_seven_01",
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
		name = "pes_level_chaos_war_camp_story_seven_02",
		response = "pes_level_chaos_war_camp_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_chaos_war_camp_story_seven_01",
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
		name = "pes_level_chaos_war_camp_story_ten_01",
		response = "pes_level_chaos_war_camp_story_ten_01",
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
				"level_chaos_war_camp_battering_ram",
				OP.NOT,
				"level_chaos_war_camp_battering_ram",
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
				"once_per_level_pes_level_chaos_war_camp_story_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_chaos_war_camp_story_ten_01",
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
		name = "pes_level_chaos_war_camp_story_ten_02",
		response = "pes_level_chaos_war_camp_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_chaos_war_camp_story_ten_01",
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
		name = "pes_level_chaos_war_camp_story_ten_03",
		response = "pes_level_chaos_war_camp_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_chaos_war_camp_story_ten_02",
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
		name = "pes_level_chaos_war_camp_story_three_01",
		response = "pes_level_chaos_war_camp_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_chaos_war_camp_story_three_01",
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
		name = "pes_level_chaos_war_camp_story_three_02",
		response = "pes_level_chaos_war_camp_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_chaos_war_camp_story_three_02",
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
		name = "pes_level_chaos_war_camp_story_twelve_01",
		response = "pes_level_chaos_war_camp_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_chaos_war_camp_story_twelve_01",
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
		name = "pes_level_chaos_war_camp_story_twelve_02",
		response = "pes_level_chaos_war_camp_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_chaos_war_camp_story_twelve_02",
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
		name = "pwe_level_chaos_war_camp_story_eight_01",
		response = "pwe_level_chaos_war_camp_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pwe_level_chaos_war_camp_story_eight_01",
			},
			{
				"user_context",
				"enemies_close",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pwe_level_chaos_war_camp_story_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_chaos_war_camp_story_eight_01",
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
		name = "pwe_level_chaos_war_camp_story_eight_02",
		response = "pwe_level_chaos_war_camp_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_eight_01",
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
		name = "pwe_level_chaos_war_camp_story_eight_03",
		response = "pwe_level_chaos_war_camp_story_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_eight_02",
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
		name = "pwe_level_chaos_war_camp_story_four_01",
		response = "pwe_level_chaos_war_camp_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_chaos_war_camp_story_four_01",
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
		name = "pwe_level_chaos_war_camp_story_four_02",
		response = "pwe_level_chaos_war_camp_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_chaos_war_camp_story_four_02",
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
		name = "pwe_level_chaos_war_camp_story_ten_01",
		response = "pwe_level_chaos_war_camp_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_ten_01",
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
		name = "pwe_level_chaos_war_camp_story_ten_02",
		response = "pwe_level_chaos_war_camp_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_ten_02",
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
		name = "pwe_level_chaos_war_camp_story_two_01",
		response = "pwe_level_chaos_war_camp_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_chaos_war_camp_story_two_01",
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
		name = "pwe_level_chaos_war_camp_story_two_02",
		response = "pwe_level_chaos_war_camp_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_chaos_war_camp_story_two_02",
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
		name = "pwh_level_chaos_war_camp_story_eleven_01",
		response = "pwh_level_chaos_war_camp_story_eleven_01",
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
				"faction_memory",
				"level_chaos_war_camp_battering_ram",
				OP.NOT,
				"level_chaos_war_camp_battering_ram",
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
				"once_per_level_pwh_level_chaos_war_camp_story_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_chaos_war_camp_story_eleven_01",
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
		name = "pwh_level_chaos_war_camp_story_eleven_02",
		response = "pwh_level_chaos_war_camp_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_chaos_war_camp_story_eleven_01",
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
		name = "pwh_level_chaos_war_camp_story_three_01",
		response = "pwh_level_chaos_war_camp_story_three_01",
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
				"level_chaos_war_camp_battering_ram",
				OP.NOT,
				"level_chaos_war_camp_battering_ram",
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
				"once_per_level_pwh_level_chaos_war_camp_story_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_chaos_war_camp_story_three_01",
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
		name = "pwh_level_chaos_war_camp_story_three_02",
		response = "pwh_level_chaos_war_camp_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_three_01",
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
		name = "pwh_level_chaos_war_camp_story_three_03",
		response = "pwh_level_chaos_war_camp_story_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_chaos_war_camp_story_three_02",
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
		pbw_level_chaos_war_camp_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pbw_level_chaos_war_camp_story_four_01",
			},
			sound_events = {
				[1] = "pbw_level_chaos_war_camp_story_four_01",
			},
			sound_events_duration = {
				[1] = 3.680645942688,
			},
		},
		pbw_level_chaos_war_camp_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_chaos_war_camp_story_four_02",
			},
			sound_events = {
				[1] = "pbw_level_chaos_war_camp_story_four_02",
			},
			sound_events_duration = {
				[1] = 1.200291633606,
			},
		},
		pbw_level_chaos_war_camp_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_chaos_war_camp_story_nine_02",
			},
			sound_events = {
				[1] = "pbw_level_chaos_war_camp_story_nine_02",
			},
			sound_events_duration = {
				[1] = 4.35702085495,
			},
		},
		pbw_level_chaos_war_camp_story_nine_03 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_chaos_war_camp_story_nine_03",
			},
			sound_events = {
				[1] = "pbw_level_chaos_war_camp_story_nine_03",
			},
			sound_events_duration = {
				[1] = 8.9883337020874,
			},
		},
		pbw_level_chaos_war_camp_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_chaos_war_camp_story_seven_01",
			},
			sound_events = {
				[1] = "pbw_level_chaos_war_camp_story_seven_01",
			},
			sound_events_duration = {
				[1] = 5.7680625915527,
			},
		},
		pbw_level_chaos_war_camp_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_chaos_war_camp_story_seven_02",
			},
			sound_events = {
				[1] = "pbw_level_chaos_war_camp_story_seven_02",
			},
			sound_events_duration = {
				[1] = 5.6370625495911,
			},
		},
		pdr_level_chaos_war_camp_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_chaos_war_camp_story_eleven_01",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.6261043548584,
			},
		},
		pdr_level_chaos_war_camp_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_chaos_war_camp_story_eleven_02",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 4.2334585189819,
			},
		},
		pdr_level_chaos_war_camp_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pdr_level_chaos_war_camp_story_five_01",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_five_01",
			},
			sound_events_duration = {
				[1] = 6.3722081184387,
			},
		},
		pdr_level_chaos_war_camp_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_chaos_war_camp_story_five_02",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_five_02",
			},
			sound_events_duration = {
				[1] = 2.2197916507721,
			},
		},
		pdr_level_chaos_war_camp_story_five_03 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_chaos_war_camp_story_five_03",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_five_03",
			},
			sound_events_duration = {
				[1] = 5.162145614624,
			},
		},
		pdr_level_chaos_war_camp_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pdr_level_chaos_war_camp_story_nine_01",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_nine_01",
			},
			sound_events_duration = {
				[1] = 3.0233540534973,
			},
		},
		pdr_level_chaos_war_camp_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_chaos_war_camp_story_nine_02",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_nine_02",
			},
			sound_events_duration = {
				[1] = 1.2930833101273,
			},
		},
		pdr_level_chaos_war_camp_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pdr_level_chaos_war_camp_story_twelve_01",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 5.3093957901001,
			},
		},
		pdr_level_chaos_war_camp_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_chaos_war_camp_story_twelve_02",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 8.0771245956421,
			},
		},
		pdr_level_chaos_war_camp_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pdr_level_chaos_war_camp_story_two_01",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_two_01",
			},
			sound_events_duration = {
				[1] = 4.8902916908264,
			},
		},
		pdr_level_chaos_war_camp_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_chaos_war_camp_story_two_02",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_two_02",
			},
			sound_events_duration = {
				[1] = 6.571249961853,
			},
		},
		pdr_level_chaos_war_camp_story_two_03 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_chaos_war_camp_story_two_03",
			},
			sound_events = {
				[1] = "pdr_level_chaos_war_camp_story_two_03",
			},
			sound_events_duration = {
				[1] = 8.2045412063599,
			},
		},
		pes_level_chaos_war_camp_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_eight_01",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_eight_01",
			},
			sound_events_duration = {
				[1] = 5.303270816803,
			},
		},
		pes_level_chaos_war_camp_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_eight_02",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_eight_02",
			},
			sound_events_duration = {
				[1] = 0.61770832538605,
			},
		},
		pes_level_chaos_war_camp_story_eight_03 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_eight_03",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_eight_03",
			},
			sound_events_duration = {
				[1] = 3.5789375305176,
			},
		},
		pes_level_chaos_war_camp_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_five_01",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_five_01",
			},
			sound_events_duration = {
				[1] = 4.7306876182556,
			},
		},
		pes_level_chaos_war_camp_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_five_02",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_five_02",
			},
			sound_events_duration = {
				[1] = 6.4616456031799,
			},
		},
		pes_level_chaos_war_camp_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pes_level_chaos_war_camp_story_seven_01",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_seven_01",
			},
			sound_events_duration = {
				[1] = 4.1542501449585,
			},
		},
		pes_level_chaos_war_camp_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_seven_02",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_seven_02",
			},
			sound_events_duration = {
				[1] = 4.2782292366028,
			},
		},
		pes_level_chaos_war_camp_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pes_level_chaos_war_camp_story_ten_01",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_ten_01",
			},
			sound_events_duration = {
				[1] = 2.7273540496826,
			},
		},
		pes_level_chaos_war_camp_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_ten_02",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_ten_02",
			},
			sound_events_duration = {
				[1] = 0.87479168176651,
			},
		},
		pes_level_chaos_war_camp_story_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_ten_03",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_ten_03",
			},
			sound_events_duration = {
				[1] = 3.2479374408722,
			},
		},
		pes_level_chaos_war_camp_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_three_01",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_three_01",
			},
			sound_events_duration = {
				[1] = 1.722833275795,
			},
		},
		pes_level_chaos_war_camp_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_three_02",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_three_02",
			},
			sound_events_duration = {
				[1] = 0.80004167556763,
			},
		},
		pes_level_chaos_war_camp_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_twelve_01",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 2.1958749294281,
			},
		},
		pes_level_chaos_war_camp_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_chaos_war_camp_story_twelve_02",
			},
			sound_events = {
				[1] = "pes_level_chaos_war_camp_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.7376666069031,
			},
		},
		pwe_level_chaos_war_camp_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pwe_level_chaos_war_camp_story_eight_01",
			},
			sound_events = {
				[1] = "pwe_level_chaos_war_camp_story_eight_01",
			},
			sound_events_duration = {
				[1] = 2.3187084197998,
			},
		},
		pwe_level_chaos_war_camp_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_chaos_war_camp_story_eight_02",
			},
			sound_events = {
				[1] = "pwe_level_chaos_war_camp_story_eight_02",
			},
			sound_events_duration = {
				[1] = 2.5628333091736,
			},
		},
		pwe_level_chaos_war_camp_story_eight_03 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_chaos_war_camp_story_eight_03",
			},
			sound_events = {
				[1] = "pwe_level_chaos_war_camp_story_eight_03",
			},
			sound_events_duration = {
				[1] = 5.1072502136231,
			},
		},
		pwe_level_chaos_war_camp_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_chaos_war_camp_story_four_01",
			},
			sound_events = {
				[1] = "pwe_level_chaos_war_camp_story_four_01",
			},
			sound_events_duration = {
				[1] = 7.6807918548584,
			},
		},
		pwe_level_chaos_war_camp_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_chaos_war_camp_story_four_02",
			},
			sound_events = {
				[1] = "pwe_level_chaos_war_camp_story_four_02",
			},
			sound_events_duration = {
				[1] = 8.4686670303345,
			},
		},
		pwe_level_chaos_war_camp_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_chaos_war_camp_story_ten_01",
			},
			sound_events = {
				[1] = "pwe_level_chaos_war_camp_story_ten_01",
			},
			sound_events_duration = {
				[1] = 6.3944373130798,
			},
		},
		pwe_level_chaos_war_camp_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_chaos_war_camp_story_ten_02",
			},
			sound_events = {
				[1] = "pwe_level_chaos_war_camp_story_ten_02",
			},
			sound_events_duration = {
				[1] = 2.2469582557678,
			},
		},
		pwe_level_chaos_war_camp_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_chaos_war_camp_story_two_01",
			},
			sound_events = {
				[1] = "pwe_level_chaos_war_camp_story_two_01",
			},
			sound_events_duration = {
				[1] = 2.3003957271576,
			},
		},
		pwe_level_chaos_war_camp_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_chaos_war_camp_story_two_02",
			},
			sound_events = {
				[1] = "pwe_level_chaos_war_camp_story_two_02",
			},
			sound_events_duration = {
				[1] = 2.2473125457764,
			},
		},
		pwh_level_chaos_war_camp_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pwh_level_chaos_war_camp_story_eleven_01",
			},
			sound_events = {
				[1] = "pwh_level_chaos_war_camp_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.320333480835,
			},
		},
		pwh_level_chaos_war_camp_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_chaos_war_camp_story_eleven_02",
			},
			sound_events = {
				[1] = "pwh_level_chaos_war_camp_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 12.172583580017,
			},
		},
		pwh_level_chaos_war_camp_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
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
				[1] = "pwh_level_chaos_war_camp_story_three_01",
			},
			sound_events = {
				[1] = "pwh_level_chaos_war_camp_story_three_01",
			},
			sound_events_duration = {
				[1] = 4.3832292556763,
			},
		},
		pwh_level_chaos_war_camp_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_chaos_war_camp_story_three_02",
			},
			sound_events = {
				[1] = "pwh_level_chaos_war_camp_story_three_02",
			},
			sound_events_duration = {
				[1] = 3.9353957176209,
			},
		},
		pwh_level_chaos_war_camp_story_three_03 = {
			category = "story_talk",
			database = "hero_conversations_war_camp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_chaos_war_camp_story_three_03",
			},
			sound_events = {
				[1] = "pwh_level_chaos_war_camp_story_three_03",
			},
			sound_events_duration = {
				[1] = 6.1353540420532,
			},
		},
	})
end
