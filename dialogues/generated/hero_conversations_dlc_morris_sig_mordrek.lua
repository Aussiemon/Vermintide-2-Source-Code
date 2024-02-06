-- chunkname: @dialogues/generated/hero_conversations_dlc_morris_sig_mordrek.lua

return function ()
	define_rule({
		name = "pbw_morris_level_conversations_mordrek_ten_01",
		response = "pbw_morris_level_conversations_mordrek_ten_01",
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
				"pbw_morris_level_conversations_mordrek_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_mordrek_ten_01",
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
		name = "pbw_morris_mordrek_breach",
		response = "pbw_morris_mordrek_breach",
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
				"sig_mordrek_breach",
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
				"faction_memory",
				"pbw_morris_mordrek_breach",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mordrek_breach",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_morris_mordrek_end",
		response = "pbw_morris_mordrek_end",
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
				"sig_mordrek_end",
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
				"faction_memory",
				"pbw_morris_mordrek_end",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mordrek_end",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_morris_mordrek_pits",
		response = "pbw_morris_mordrek_pits",
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
				"sig_mordrek_pits",
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
				"faction_memory",
				"pbw_morris_mordrek_pits",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mordrek_pits",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_morris_mordrek_siege_camp",
		response = "pbw_morris_mordrek_siege_camp",
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
				"sig_mordrek_siege_camp",
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
				"faction_memory",
				"pbw_morris_mordrek_siege_camp",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mordrek_siege_camp",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_morris_mordrek_ward",
		response = "pbw_morris_mordrek_ward",
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
				"sig_mordrek_ward",
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
				"faction_memory",
				"pbw_morris_mordrek_ward",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_mordrek_ward",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_level_conversations_mordrek_eleven_01",
		response = "pdr_morris_level_conversations_mordrek_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_morris_level_conversations_mordrek_eleven_01",
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
		name = "pdr_morris_level_conversations_mordrek_eleven_02",
		response = "pdr_morris_level_conversations_mordrek_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_morris_level_conversations_mordrek_eleven_02",
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
		name = "pdr_morris_mordrek_breach",
		response = "pdr_morris_mordrek_breach",
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
				"sig_mordrek_breach",
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
				"faction_memory",
				"pdr_morris_mordrek_breach",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mordrek_breach",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_mordrek_end",
		response = "pdr_morris_mordrek_end",
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
				"sig_mordrek_end",
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
				"faction_memory",
				"pdr_morris_mordrek_end",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mordrek_end",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_mordrek_pits",
		response = "pdr_morris_mordrek_pits",
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
				"sig_mordrek_pits",
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
				"faction_memory",
				"pdr_morris_mordrek_pits",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mordrek_pits",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_mordrek_siege_camp",
		response = "pdr_morris_mordrek_siege_camp",
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
				"sig_mordrek_siege_camp",
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
				"faction_memory",
				"pdr_morris_mordrek_siege_camp",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mordrek_siege_camp",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_morris_mordrek_ward",
		response = "pdr_morris_mordrek_ward",
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
				"sig_mordrek_ward",
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
				"faction_memory",
				"pdr_morris_mordrek_ward",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_mordrek_ward",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_morris_level_conversations_mordrek_ten_01",
		response = "pes_morris_level_conversations_mordrek_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_morris_level_conversations_mordrek_ten_01",
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
		name = "pes_morris_level_conversations_mordrek_ten_02",
		response = "pes_morris_level_conversations_mordrek_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_morris_level_conversations_mordrek_ten_02",
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
		name = "pes_morris_mordrek_breach",
		response = "pes_morris_mordrek_breach",
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
				"sig_mordrek_breach",
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
				"faction_memory",
				"pes_morris_mordrek_breach",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mordrek_breach",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_morris_mordrek_end",
		response = "pes_morris_mordrek_end",
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
				"sig_mordrek_end",
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
				"faction_memory",
				"pes_morris_mordrek_end",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mordrek_end",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_morris_mordrek_pits",
		response = "pes_morris_mordrek_pits",
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
				"sig_mordrek_pits",
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
				"faction_memory",
				"pes_morris_mordrek_pits",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mordrek_pits",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_morris_mordrek_siege_camp",
		response = "pes_morris_mordrek_siege_camp",
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
				"sig_mordrek_siege_camp",
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
				"faction_memory",
				"pes_morris_mordrek_siege_camp",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mordrek_siege_camp",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_morris_mordrek_ward",
		response = "pes_morris_mordrek_ward",
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
				"sig_mordrek_ward",
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
				"faction_memory",
				"pes_morris_mordrek_ward",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_mordrek_ward",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_morris_level_conversations_mordrek_eleven_01",
		response = "pwe_morris_level_conversations_mordrek_eleven_01",
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
				120,
			},
			{
				"faction_memory",
				"pwe_morris_level_conversations_mordrek_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_level_conversations_mordrek_eleven_01",
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
		name = "pwe_morris_level_conversations_mordrek_eleven_02",
		response = "pwe_morris_level_conversations_mordrek_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_morris_level_conversations_mordrek_eleven_01",
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
		name = "pwe_morris_mordrek_breach",
		response = "pwe_morris_mordrek_breach",
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
				"sig_mordrek_breach",
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
				"faction_memory",
				"pwe_morris_mordrek_breach",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mordrek_breach",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_morris_mordrek_end",
		response = "pwe_morris_mordrek_end",
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
				"sig_mordrek_end",
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
				"faction_memory",
				"pwe_morris_mordrek_end",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mordrek_end",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_morris_mordrek_pits",
		response = "pwe_morris_mordrek_pits",
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
				"sig_mordrek_pits",
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
				"faction_memory",
				"pwe_morris_mordrek_pits",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mordrek_pits",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_morris_mordrek_siege_camp",
		response = "pwe_morris_mordrek_siege_camp",
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
				"sig_mordrek_siege_camp",
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
				"faction_memory",
				"pwe_morris_mordrek_siege_camp",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mordrek_siege_camp",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_morris_mordrek_ward",
		response = "pwe_morris_mordrek_ward",
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
				"sig_mordrek_ward",
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
				"faction_memory",
				"pwe_morris_mordrek_ward",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_mordrek_ward",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_morris_level_conversations_mordrek_ten_01",
		response = "pwh_morris_level_conversations_mordrek_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_morris_level_conversations_mordrek_ten_01",
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
		name = "pwh_morris_level_conversations_mordrek_ten_02",
		response = "pwh_morris_level_conversations_mordrek_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_morris_level_conversations_mordrek_ten_01",
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
		name = "pwh_morris_mordrek_breach",
		response = "pwh_morris_mordrek_breach",
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
				"sig_mordrek_breach",
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
				"faction_memory",
				"pwh_morris_mordrek_breach",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mordrek_breach",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_morris_mordrek_end",
		response = "pwh_morris_mordrek_end",
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
				"sig_mordrek_end",
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
				"faction_memory",
				"pwh_morris_mordrek_end",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mordrek_end",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_morris_mordrek_pits",
		response = "pwh_morris_mordrek_pits",
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
				"sig_mordrek_pits",
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
				"faction_memory",
				"pwh_morris_mordrek_pits",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mordrek_pits",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_morris_mordrek_siege_camp",
		response = "pwh_morris_mordrek_siege_camp",
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
				"sig_mordrek_siege_camp",
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
				"faction_memory",
				"pwh_morris_mordrek_siege_camp",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mordrek_siege_camp",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_morris_mordrek_ward",
		response = "pwh_morris_mordrek_ward",
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
				"sig_mordrek_ward",
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
				"faction_memory",
				"pwh_morris_mordrek_ward",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_mordrek_ward",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_morris_level_conversations_mordrek_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
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
				[1] = "pbw_morris_level_conversations_mordrek_ten_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_mordrek_ten_01",
			},
			sound_events_duration = {
				[1] = 1.7461249828339,
			},
		},
		pbw_morris_mordrek_breach = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_morris_mordrek_breach_01",
				"pbw_morris_mordrek_breach_02",
				"pbw_morris_mordrek_breach_03",
				"pbw_morris_mordrek_breach_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mordrek_breach_01",
				"pbw_morris_mordrek_breach_02",
				"pbw_morris_mordrek_breach_03",
				"pbw_morris_mordrek_breach_04",
			},
			sound_events_duration = {
				3.3617708683014,
				3.3438124656677,
				2.6459584236145,
				2.0494582653046,
			},
		},
		pbw_morris_mordrek_end = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_morris_mordrek_end_01",
				"pbw_morris_mordrek_end_02",
				"pbw_morris_mordrek_end_03",
				"pbw_morris_mordrek_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mordrek_end_01",
				"pbw_morris_mordrek_end_02",
				"pbw_morris_mordrek_end_03",
				"pbw_morris_mordrek_end_04",
			},
			sound_events_duration = {
				3.1462082862854,
				4.7419581413269,
				3.0745625495911,
				5.1782293319702,
			},
		},
		pbw_morris_mordrek_pits = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_morris_mordrek_pits_01",
				"pbw_morris_mordrek_pits_02",
				"pbw_morris_mordrek_pits_03",
				"pbw_morris_mordrek_pits_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mordrek_pits_01",
				"pbw_morris_mordrek_pits_02",
				"pbw_morris_mordrek_pits_03",
				"pbw_morris_mordrek_pits_04",
			},
			sound_events_duration = {
				2.7827916145325,
				3.3989584445953,
				4.7066459655762,
				2.9737708568573,
			},
		},
		pbw_morris_mordrek_siege_camp = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_morris_mordrek_siege_camp_01",
				"pbw_morris_mordrek_siege_camp_02",
				"pbw_morris_mordrek_siege_camp_03",
				"pbw_morris_mordrek_siege_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mordrek_siege_camp_01",
				"pbw_morris_mordrek_siege_camp_02",
				"pbw_morris_mordrek_siege_camp_03",
				"pbw_morris_mordrek_siege_camp_04",
			},
			sound_events_duration = {
				2.7904167175293,
				4.5760626792908,
				4.2818956375122,
				3.9918124675751,
			},
		},
		pbw_morris_mordrek_ward = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_morris_mordrek_ward_01",
				"pbw_morris_mordrek_ward_02",
				"pbw_morris_mordrek_ward_03",
				"pbw_morris_mordrek_ward_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_mordrek_ward_01",
				"pbw_morris_mordrek_ward_02",
				"pbw_morris_mordrek_ward_03",
				"pbw_morris_mordrek_ward_04",
			},
			sound_events_duration = {
				3.8144166469574,
				3.1658124923706,
				3.3378748893738,
				2.7712500095367,
			},
		},
		pdr_morris_level_conversations_mordrek_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_morris_level_conversations_mordrek_eleven_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_mordrek_eleven_01",
			},
			sound_events_duration = {
				[1] = 2.6414999961853,
			},
		},
		pdr_morris_level_conversations_mordrek_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_morris_level_conversations_mordrek_eleven_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_mordrek_eleven_02",
			},
			sound_events_duration = {
				[1] = 1.1530833244324,
			},
		},
		pdr_morris_mordrek_breach = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_morris_mordrek_breach_01",
				"pdr_morris_mordrek_breach_02",
				"pdr_morris_mordrek_breach_03",
				"pdr_morris_mordrek_breach_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mordrek_breach_01",
				"pdr_morris_mordrek_breach_02",
				"pdr_morris_mordrek_breach_03",
				"pdr_morris_mordrek_breach_04",
			},
			sound_events_duration = {
				2.6295729875565,
				4.9156354665756,
				5.3546144962311,
				3.8678957223892,
			},
		},
		pdr_morris_mordrek_end = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_morris_mordrek_end_01",
				"pdr_morris_mordrek_end_02",
				"pdr_morris_mordrek_end_03",
				"pdr_morris_mordrek_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mordrek_end_01",
				"pdr_morris_mordrek_end_02",
				"pdr_morris_mordrek_end_03",
				"pdr_morris_mordrek_end_04",
			},
			sound_events_duration = {
				1.7351875305176,
				5.4075627326965,
				2.476104259491,
				4.2430210113525,
			},
		},
		pdr_morris_mordrek_pits = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_morris_mordrek_pits_01",
				"pdr_morris_mordrek_pits_02",
				"pdr_morris_mordrek_pits_03",
				"pdr_morris_mordrek_pits_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mordrek_pits_01",
				"pdr_morris_mordrek_pits_02",
				"pdr_morris_mordrek_pits_03",
				"pdr_morris_mordrek_pits_04",
			},
			sound_events_duration = {
				3.5228854417801,
				3.3348542451858,
				4.603635430336,
				3.9865312576294,
			},
		},
		pdr_morris_mordrek_siege_camp = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_morris_mordrek_siege_camp_01",
				"pdr_morris_mordrek_siege_camp_02",
				"pdr_morris_mordrek_siege_camp_03",
				"pdr_morris_mordrek_siege_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mordrek_siege_camp_01",
				"pdr_morris_mordrek_siege_camp_02",
				"pdr_morris_mordrek_siege_camp_03",
				"pdr_morris_mordrek_siege_camp_04",
			},
			sound_events_duration = {
				2.6499166488648,
				3.4661771059036,
				4.9003019332886,
				3.295739531517,
			},
		},
		pdr_morris_mordrek_ward = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_morris_mordrek_ward_01",
				"pdr_morris_mordrek_ward_02",
				"pdr_morris_mordrek_ward_03",
				"pdr_morris_mordrek_ward_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_mordrek_ward_01",
				"pdr_morris_mordrek_ward_02",
				"pdr_morris_mordrek_ward_03",
				"pdr_morris_mordrek_ward_04",
			},
			sound_events_duration = {
				4.5521976947784,
				4.0671144723892,
				4.0296040773392,
				3.2404583692551,
			},
		},
		pes_morris_level_conversations_mordrek_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_morris_level_conversations_mordrek_ten_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_mordrek_ten_01",
			},
			sound_events_duration = {
				[1] = 1.0143749713898,
			},
		},
		pes_morris_level_conversations_mordrek_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_morris_level_conversations_mordrek_ten_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_mordrek_ten_02",
			},
			sound_events_duration = {
				[1] = 1.0766249895096,
			},
		},
		pes_morris_mordrek_breach = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_morris_mordrek_breach_01",
				"pes_morris_mordrek_breach_02",
				"pes_morris_mordrek_breach_03",
				"pes_morris_mordrek_breach_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mordrek_breach_01",
				"pes_morris_mordrek_breach_02",
				"pes_morris_mordrek_breach_03",
				"pes_morris_mordrek_breach_04",
			},
			sound_events_duration = {
				2.5262498855591,
				3.0886874198914,
				1.1261041164398,
				1.2403333187103,
			},
		},
		pes_morris_mordrek_end = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_morris_mordrek_end_01",
				"pes_morris_mordrek_end_02",
				"pes_morris_mordrek_end_03",
				"pes_morris_mordrek_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mordrek_end_01",
				"pes_morris_mordrek_end_02",
				"pes_morris_mordrek_end_03",
				"pes_morris_mordrek_end_04",
			},
			sound_events_duration = {
				1.8268333673477,
				3.4955832958221,
				2.0024166107178,
				1.9286458492279,
			},
		},
		pes_morris_mordrek_pits = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_morris_mordrek_pits_01",
				"pes_morris_mordrek_pits_02",
				"pes_morris_mordrek_pits_03",
				"pes_morris_mordrek_pits_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mordrek_pits_01",
				"pes_morris_mordrek_pits_02",
				"pes_morris_mordrek_pits_03",
				"pes_morris_mordrek_pits_04",
			},
			sound_events_duration = {
				2.9395208358765,
				1.8403958082199,
				2.5746250152588,
				2.4405624866486,
			},
		},
		pes_morris_mordrek_siege_camp = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_morris_mordrek_siege_camp_01",
				"pes_morris_mordrek_siege_camp_02",
				"pes_morris_mordrek_siege_camp_03",
				"pes_morris_mordrek_siege_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mordrek_siege_camp_01",
				"pes_morris_mordrek_siege_camp_02",
				"pes_morris_mordrek_siege_camp_03",
				"pes_morris_mordrek_siege_camp_04",
			},
			sound_events_duration = {
				1.8118749856949,
				3.6644999980927,
				2.6672084331513,
				4.3441042900085,
			},
		},
		pes_morris_mordrek_ward = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_morris_mordrek_ward_01",
				"pes_morris_mordrek_ward_02",
				"pes_morris_mordrek_ward_03",
				"pes_morris_mordrek_ward_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_mordrek_ward_01",
				"pes_morris_mordrek_ward_02",
				"pes_morris_mordrek_ward_03",
				"pes_morris_mordrek_ward_04",
			},
			sound_events_duration = {
				1.4052916765213,
				1.9460624456406,
				2.2632501125336,
				0.97402083873749,
			},
		},
		pwe_morris_level_conversations_mordrek_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
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
				[1] = "pwe_morris_level_conversations_mordrek_eleven_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_mordrek_eleven_01",
			},
			sound_events_duration = {
				[1] = 6.0424585342407,
			},
		},
		pwe_morris_level_conversations_mordrek_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_morris_level_conversations_mordrek_eleven_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_mordrek_eleven_02",
			},
			sound_events_duration = {
				[1] = 8.2913541793823,
			},
		},
		pwe_morris_mordrek_breach = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_morris_mordrek_breach_01",
				"pwe_morris_mordrek_breach_02",
				"pwe_morris_mordrek_breach_03",
				"pwe_morris_mordrek_breach_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mordrek_breach_01",
				"pwe_morris_mordrek_breach_02",
				"pwe_morris_mordrek_breach_03",
				"pwe_morris_mordrek_breach_04",
			},
			sound_events_duration = {
				2.596937417984,
				2.7022292613983,
				5.3356041908264,
				3.914541721344,
			},
		},
		pwe_morris_mordrek_end = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_morris_mordrek_end_01",
				"pwe_morris_mordrek_end_02",
				"pwe_morris_mordrek_end_03",
				"pwe_morris_mordrek_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mordrek_end_01",
				"pwe_morris_mordrek_end_02",
				"pwe_morris_mordrek_end_03",
				"pwe_morris_mordrek_end_04",
			},
			sound_events_duration = {
				4.4720001220703,
				3.091979265213,
				4.6647291183472,
				3.8442499637604,
			},
		},
		pwe_morris_mordrek_pits = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_morris_mordrek_pits_01",
				"pwe_morris_mordrek_pits_02",
				"pwe_morris_mordrek_pits_03",
				"pwe_morris_mordrek_pits_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mordrek_pits_01",
				"pwe_morris_mordrek_pits_02",
				"pwe_morris_mordrek_pits_03",
				"pwe_morris_mordrek_pits_04",
			},
			sound_events_duration = {
				2.3802499771118,
				2.6645624637604,
				3.6997082233429,
				5.6866874694824,
			},
		},
		pwe_morris_mordrek_siege_camp = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_morris_mordrek_siege_camp_01",
				"pwe_morris_mordrek_siege_camp_02",
				"pwe_morris_mordrek_siege_camp_03",
				"pwe_morris_mordrek_siege_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mordrek_siege_camp_01",
				"pwe_morris_mordrek_siege_camp_02",
				"pwe_morris_mordrek_siege_camp_03",
				"pwe_morris_mordrek_siege_camp_04",
			},
			sound_events_duration = {
				5.2223334312439,
				4.1322083473206,
				3.4310207366943,
				5.069375038147,
			},
		},
		pwe_morris_mordrek_ward = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_morris_mordrek_ward_01",
				"pwe_morris_mordrek_ward_02",
				"pwe_morris_mordrek_ward_03",
				"pwe_morris_mordrek_ward_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_mordrek_ward_01",
				"pwe_morris_mordrek_ward_02",
				"pwe_morris_mordrek_ward_03",
				"pwe_morris_mordrek_ward_04",
			},
			sound_events_duration = {
				4.2874794006348,
				3.0387291908264,
				2.9235208034515,
				3.5151875019074,
			},
		},
		pwh_morris_level_conversations_mordrek_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_morris_level_conversations_mordrek_ten_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_mordrek_ten_01",
			},
			sound_events_duration = {
				[1] = 5.2728958129883,
			},
		},
		pwh_morris_level_conversations_mordrek_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_morris_level_conversations_mordrek_ten_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_mordrek_ten_02",
			},
			sound_events_duration = {
				[1] = 2.6717500686645,
			},
		},
		pwh_morris_mordrek_breach = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwh_morris_mordrek_breach_01",
				"pwh_morris_mordrek_breach_02",
				"pwh_morris_mordrek_breach_03",
				"pwh_morris_mordrek_breach_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mordrek_breach_01",
				"pwh_morris_mordrek_breach_02",
				"pwh_morris_mordrek_breach_03",
				"pwh_morris_mordrek_breach_04",
			},
			sound_events_duration = {
				1.8890000581741,
				5.1642918586731,
				4.1789999008179,
				2.4440624713898,
			},
		},
		pwh_morris_mordrek_end = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwh_morris_mordrek_end_01",
				"pwh_morris_mordrek_end_02",
				"pwh_morris_mordrek_end_03",
				"pwh_morris_mordrek_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mordrek_end_01",
				"pwh_morris_mordrek_end_02",
				"pwh_morris_mordrek_end_03",
				"pwh_morris_mordrek_end_04",
			},
			sound_events_duration = {
				6.6747918128967,
				5.4203958511353,
				4.5714168548584,
				5.023916721344,
			},
		},
		pwh_morris_mordrek_pits = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwh_morris_mordrek_pits_01",
				"pwh_morris_mordrek_pits_02",
				"pwh_morris_mordrek_pits_03",
				"pwh_morris_mordrek_pits_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mordrek_pits_01",
				"pwh_morris_mordrek_pits_02",
				"pwh_morris_mordrek_pits_03",
				"pwh_morris_mordrek_pits_04",
			},
			sound_events_duration = {
				4.3064999580383,
				5.3552083969116,
				3.2930417060852,
				6.8399791717529,
			},
		},
		pwh_morris_mordrek_siege_camp = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwh_morris_mordrek_siege_camp_01",
				"pwh_morris_mordrek_siege_camp_02",
				"pwh_morris_mordrek_siege_camp_03",
				"pwh_morris_mordrek_siege_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mordrek_siege_camp_01",
				"pwh_morris_mordrek_siege_camp_02",
				"pwh_morris_mordrek_siege_camp_03",
				"pwh_morris_mordrek_siege_camp_04",
			},
			sound_events_duration = {
				5.6578125953674,
				5.7633123397827,
				2.911229133606,
				5.1541666984558,
			},
		},
		pwh_morris_mordrek_ward = {
			category = "level_talk",
			database = "hero_conversations_dlc_morris_sig_mordrek",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwh_morris_mordrek_ward_01",
				"pwh_morris_mordrek_ward_02",
				"pwh_morris_mordrek_ward_03",
				"pwh_morris_mordrek_ward_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_mordrek_ward_01",
				"pwh_morris_mordrek_ward_02",
				"pwh_morris_mordrek_ward_03",
				"pwh_morris_mordrek_ward_04",
			},
			sound_events_duration = {
				5.9040622711182,
				4.2625207901001,
				2.964124917984,
				6.2891459465027,
			},
		},
	})
end
