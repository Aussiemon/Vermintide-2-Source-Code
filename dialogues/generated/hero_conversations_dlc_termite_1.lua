-- chunkname: @dialogues/generated/hero_conversations_dlc_termite_1.lua

return function ()
	define_rule({
		name = "nik_temple_lake_crossing_elevator_conversation_no_elf_01_a",
		probability = 1,
		response = "nik_temple_lake_crossing_elevator_conversation_no_elf_01_a",
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
				"temple_lake_crossing_elevator_conversation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
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
		name = "nik_temple_lake_crossing_elevator_conversation_no_elf_02_a",
		probability = 1,
		response = "nik_temple_lake_crossing_elevator_conversation_no_elf_02_a",
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
				"temple_lake_crossing_elevator_conversation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
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
		name = "nik_temple_lake_crossing_elevator_conversation_no_elf_03_a",
		probability = 1,
		response = "nik_temple_lake_crossing_elevator_conversation_no_elf_03_a",
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
				"temple_lake_crossing_elevator_conversation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
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
		name = "nik_temple_lake_crossing_elevator_conversation_no_elf_04_a",
		probability = 1,
		response = "nik_temple_lake_crossing_elevator_conversation_no_elf_04_a",
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
				"temple_lake_crossing_elevator_conversation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
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
		name = "nik_temple_lake_crossing_first_conversation_no_elf_01_a",
		probability = 1,
		response = "nik_temple_lake_crossing_first_conversation_no_elf_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_01_a_DUMMYTRIGGER",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_first_conversation_no_elf_01_a_DUMMYTRIGGER",
		probability = 1,
		response = "nik_temple_lake_crossing_first_conversation_no_elf_01_a_DUMMYTRIGGER",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
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
		name = "nik_temple_lake_crossing_first_conversation_no_elf_02_b",
		probability = 1,
		response = "nik_temple_lake_crossing_first_conversation_no_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_02_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_first_conversation_no_elf_03_a",
		probability = 1,
		response = "nik_temple_lake_crossing_first_conversation_no_elf_03_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_03_a_DUMMYTRIGGER",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_first_conversation_no_elf_03_a_DUMMYTRIGGER",
		probability = 1,
		response = "nik_temple_lake_crossing_first_conversation_no_elf_03_a_DUMMYTRIGGER",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
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
		name = "nik_temple_lake_crossing_first_conversation_no_elf_04_a",
		probability = 1,
		response = "nik_temple_lake_crossing_first_conversation_no_elf_04_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_04_a_DUMMYTRIGGER",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_first_conversation_no_elf_04_a_DUMMYTRIGGER",
		probability = 1,
		response = "nik_temple_lake_crossing_first_conversation_no_elf_04_a_DUMMYTRIGGER",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
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
		name = "nik_temple_lake_crossing_second_conversation_no_elf_01_a",
		probability = 1,
		response = "nik_temple_lake_crossing_second_conversation_no_elf_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_01_a_DUMMYTRIGGER",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_second_conversation_no_elf_01_a_DUMMYTRIGGER",
		probability = 1,
		response = "nik_temple_lake_crossing_second_conversation_no_elf_01_a_DUMMYTRIGGER",
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
				CombiningOP.OR_NEXT,
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
				"dwarf_ranger",
				CombiningOP.OR_NEXT,
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
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "nik_temple_lake_crossing_second_conversation_no_elf_02_a",
		probability = 1,
		response = "nik_temple_lake_crossing_second_conversation_no_elf_02_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_02_a_DUMMYTRIGGER",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_second_conversation_no_elf_02_a_DUMMYTRIGGER",
		probability = 1,
		response = "nik_temple_lake_crossing_second_conversation_no_elf_02_a_DUMMYTRIGGER",
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
				CombiningOP.OR_NEXT,
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
				"bright_wizard",
				CombiningOP.OR_NEXT,
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
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "nik_temple_lake_crossing_second_conversation_no_elf_03_a",
		probability = 1,
		response = "nik_temple_lake_crossing_second_conversation_no_elf_03_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_03_a_DUMMYTRIGGER",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_second_conversation_no_elf_03_a_DUMMYTRIGGER",
		probability = 1,
		response = "nik_temple_lake_crossing_second_conversation_no_elf_03_a_DUMMYTRIGGER",
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
				CombiningOP.OR_NEXT,
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
				"dwarf_ranger",
				CombiningOP.OR_NEXT,
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
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "nik_temple_lake_crossing_second_conversation_no_elf_04_a",
		probability = 1,
		response = "nik_temple_lake_crossing_second_conversation_no_elf_04_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_04_a_DUMMYTRIGGER",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_second_conversation_no_elf_04_a_DUMMYTRIGGER",
		probability = 1,
		response = "nik_temple_lake_crossing_second_conversation_no_elf_04_a_DUMMYTRIGGER",
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
				CombiningOP.OR_NEXT,
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
				"bright_wizard",
				CombiningOP.OR_NEXT,
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
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "pbw_temple_lake_crossing_elevator_conversation_elf_02_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_elevator_conversation_elf_02_a",
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
				"temple_lake_crossing_elevator_conversation",
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
				OP.GTEQ,
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
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
		name = "pbw_temple_lake_crossing_elevator_conversation_elf_03_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_elevator_conversation_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_03_b",
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
		name = "pbw_temple_lake_crossing_elevator_conversation_no_elf_02_b",
		probability = 1,
		response = "pbw_temple_lake_crossing_elevator_conversation_no_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_02_a",
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
		name = "pbw_temple_lake_crossing_elevator_conversation_no_elf_03_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_elevator_conversation_no_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_03_b",
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
		name = "pbw_temple_lake_crossing_first_conversation_elf_01_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_first_conversation_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_first_conversation_elf_02_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_first_conversation_elf_02_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
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
		name = "pbw_temple_lake_crossing_first_conversation_elf_03_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_first_conversation_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_first_conversation_elf_04_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_first_conversation_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_first_conversation_no_elf_01_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_first_conversation_no_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_first_conversation_no_elf_02_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_first_conversation_no_elf_02_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
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
		name = "pbw_temple_lake_crossing_first_conversation_no_elf_03_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_first_conversation_no_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_first_conversation_no_elf_04_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_first_conversation_no_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_second_conversation_elf_01_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_second_conversation_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_second_conversation_elf_02_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_second_conversation_elf_02_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "pbw_temple_lake_crossing_second_conversation_elf_03_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_second_conversation_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_second_conversation_elf_04_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_second_conversation_elf_04_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "pbw_temple_lake_crossing_second_conversation_no_elf_01_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_second_conversation_no_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_second_conversation_no_elf_02_b",
		probability = 1,
		response = "pbw_temple_lake_crossing_second_conversation_no_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_02_a",
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
				OP.LT,
				7,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_second_conversation_no_elf_03_c",
		probability = 1,
		response = "pbw_temple_lake_crossing_second_conversation_no_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_crossing_second_conversation_no_elf_04_b",
		probability = 1,
		response = "pbw_temple_lake_crossing_second_conversation_no_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_04_a",
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
				OP.LT,
				7,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_temple_lake_landing_stage_conversation_02_a",
		probability = 1,
		response = "pbw_temple_lake_landing_stage_conversation_02_a",
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
				"temple_lake_landing_stage_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
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
		name = "pbw_temple_lake_landing_stage_conversation_03_b",
		probability = 1,
		response = "pbw_temple_lake_landing_stage_conversation_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_landing_stage_conversation_03_a",
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
		name = "pbw_temple_wilds_conversation_elf_02_a",
		probability = 1,
		response = "pbw_temple_wilds_conversation_elf_02_a",
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
				"global_context",
				"wood_elf",
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
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_temple_wilds_conversation_elf_04_c",
		probability = 1,
		response = "pbw_temple_wilds_conversation_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_elf_04_b",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pbw_temple_wilds_conversation_no_elf_02_a",
		probability = 1,
		response = "pbw_temple_wilds_conversation_no_elf_02_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_temple_wilds_conversation_no_elf_03_b",
		probability = 1,
		response = "pbw_temple_wilds_conversation_no_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_no_elf_03_a",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pbw_temple_wilds_conversation_no_elf_04_c",
		probability = 1,
		response = "pbw_temple_wilds_conversation_no_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_no_elf_04_b",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pbw_temple_wilds_felled_trees_conversation_01_b",
		probability = 1,
		response = "pbw_temple_wilds_felled_trees_conversation_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_01_a",
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
		name = "pbw_temple_wilds_felled_trees_conversation_02_a",
		probability = 1,
		response = "pbw_temple_wilds_felled_trees_conversation_02_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_temple_wilds_felled_trees_conversation_07_a",
		probability = 1,
		response = "pbw_temple_wilds_felled_trees_conversation_07_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_temple_wilds_felled_trees_conversation_09_b",
		probability = 1,
		response = "pbw_temple_wilds_felled_trees_conversation_09_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_09_a",
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
		name = "pdr_temple_lake_crossing_elevator_conversation_elf_01_b",
		probability = 1,
		response = "pdr_temple_lake_crossing_elevator_conversation_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_01_a",
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
		name = "pdr_temple_lake_crossing_elevator_conversation_elf_02_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_elevator_conversation_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_02_b",
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
		name = "pdr_temple_lake_crossing_elevator_conversation_elf_03_b",
		probability = 1,
		response = "pdr_temple_lake_crossing_elevator_conversation_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_03_a",
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
		name = "pdr_temple_lake_crossing_elevator_conversation_elf_04_b",
		probability = 1,
		response = "pdr_temple_lake_crossing_elevator_conversation_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_04_a",
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
		name = "pdr_temple_lake_crossing_elevator_conversation_no_elf_01_b",
		probability = 1,
		response = "pdr_temple_lake_crossing_elevator_conversation_no_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_01_a",
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
		name = "pdr_temple_lake_crossing_elevator_conversation_no_elf_02_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_elevator_conversation_no_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_02_b",
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
		name = "pdr_temple_lake_crossing_elevator_conversation_no_elf_03_b",
		probability = 1,
		response = "pdr_temple_lake_crossing_elevator_conversation_no_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_03_a",
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
		name = "pdr_temple_lake_crossing_elevator_conversation_no_elf_04_b",
		probability = 1,
		response = "pdr_temple_lake_crossing_elevator_conversation_no_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_04_a",
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
		name = "pdr_temple_lake_crossing_first_conversation_elf_01_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_first_conversation_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_first_conversation_elf_02_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_first_conversation_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_first_conversation_elf_03_a",
		probability = 1,
		response = "pdr_temple_lake_crossing_first_conversation_elf_03_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
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
		name = "pdr_temple_lake_crossing_first_conversation_elf_04_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_first_conversation_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_first_conversation_no_elf_01_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_first_conversation_no_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_first_conversation_no_elf_02_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_first_conversation_no_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_first_conversation_no_elf_03_b",
		probability = 1,
		response = "pdr_temple_lake_crossing_first_conversation_no_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_03_a",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_first_conversation_no_elf_04_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_first_conversation_no_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_second_conversation_elf_01_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_second_conversation_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_second_conversation_elf_02_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_second_conversation_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_second_conversation_elf_03_a",
		probability = 1,
		response = "pdr_temple_lake_crossing_second_conversation_elf_03_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "pdr_temple_lake_crossing_second_conversation_elf_04_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_second_conversation_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_second_conversation_no_elf_01_b",
		probability = 1,
		response = "pdr_temple_lake_crossing_second_conversation_no_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_01_a",
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
				OP.LT,
				7,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_second_conversation_no_elf_02_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_second_conversation_no_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_second_conversation_no_elf_03_b",
		probability = 1,
		response = "pdr_temple_lake_crossing_second_conversation_no_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_03_a",
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
				OP.LT,
				7,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_crossing_second_conversation_no_elf_04_c",
		probability = 1,
		response = "pdr_temple_lake_crossing_second_conversation_no_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_temple_lake_landing_stage_conversation_03_a",
		probability = 1,
		response = "pdr_temple_lake_landing_stage_conversation_03_a",
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
				"temple_lake_landing_stage_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
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
		name = "pdr_temple_lake_landing_stage_conversation_03_c",
		probability = 1,
		response = "pdr_temple_lake_landing_stage_conversation_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_landing_stage_conversation_03_b",
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
		name = "pdr_temple_lake_landing_stage_conversation_04_b",
		probability = 1,
		response = "pdr_temple_lake_landing_stage_conversation_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_landing_stage_conversation_04_a",
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
		name = "pdr_temple_wilds_conversation_elf_01_c",
		probability = 1,
		response = "pdr_temple_wilds_conversation_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_elf_01_b",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pdr_temple_wilds_conversation_elf_03_a",
		probability = 1,
		response = "pdr_temple_wilds_conversation_elf_03_a",
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
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_temple_wilds_conversation_no_elf_01_c",
		probability = 1,
		response = "pdr_temple_wilds_conversation_no_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_no_elf_01_b",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pdr_temple_wilds_conversation_no_elf_03_a",
		probability = 1,
		response = "pdr_temple_wilds_conversation_no_elf_03_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_temple_wilds_felled_trees_conversation_02_b",
		probability = 1,
		response = "pdr_temple_wilds_felled_trees_conversation_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_02_a",
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
		name = "pdr_temple_wilds_felled_trees_conversation_03_a",
		probability = 1,
		response = "pdr_temple_wilds_felled_trees_conversation_03_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_temple_wilds_felled_trees_conversation_08_a",
		probability = 1,
		response = "pdr_temple_wilds_felled_trees_conversation_08_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_temple_wilds_felled_trees_conversation_10_b",
		probability = 1,
		response = "pdr_temple_wilds_felled_trees_conversation_10_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_10_a",
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
		name = "pes_temple_lake_crossing_elevator_conversation_elf_01_c",
		probability = 1,
		response = "pes_temple_lake_crossing_elevator_conversation_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_01_b",
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
		name = "pes_temple_lake_crossing_elevator_conversation_elf_02_a",
		probability = 1,
		response = "pes_temple_lake_crossing_elevator_conversation_elf_02_a",
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
				"temple_lake_crossing_elevator_conversation",
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
				OP.GTEQ,
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
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
		name = "pes_temple_lake_crossing_elevator_conversation_elf_03_b",
		probability = 1,
		response = "pes_temple_lake_crossing_elevator_conversation_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_03_a",
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
		name = "pes_temple_lake_crossing_elevator_conversation_elf_04_b",
		probability = 1,
		response = "pes_temple_lake_crossing_elevator_conversation_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_04_a",
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
		name = "pes_temple_lake_crossing_elevator_conversation_no_elf_01_c",
		probability = 1,
		response = "pes_temple_lake_crossing_elevator_conversation_no_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_01_b",
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
		name = "pes_temple_lake_crossing_elevator_conversation_no_elf_02_b",
		probability = 1,
		response = "pes_temple_lake_crossing_elevator_conversation_no_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_02_a",
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
		name = "pes_temple_lake_crossing_elevator_conversation_no_elf_03_b",
		probability = 1,
		response = "pes_temple_lake_crossing_elevator_conversation_no_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_03_a",
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
		name = "pes_temple_lake_crossing_elevator_conversation_no_elf_04_c",
		probability = 1,
		response = "pes_temple_lake_crossing_elevator_conversation_no_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_04_b",
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
		name = "pes_temple_lake_crossing_first_conversation_elf_01_c",
		probability = 1,
		response = "pes_temple_lake_crossing_first_conversation_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_first_conversation_elf_02_c",
		probability = 1,
		response = "pes_temple_lake_crossing_first_conversation_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_first_conversation_elf_03_c",
		probability = 1,
		response = "pes_temple_lake_crossing_first_conversation_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_first_conversation_elf_04_a",
		probability = 1,
		response = "pes_temple_lake_crossing_first_conversation_elf_04_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
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
		name = "pes_temple_lake_crossing_first_conversation_no_elf_01_c",
		probability = 1,
		response = "pes_temple_lake_crossing_first_conversation_no_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_first_conversation_no_elf_02_c",
		probability = 1,
		response = "pes_temple_lake_crossing_first_conversation_no_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_first_conversation_no_elf_03_c",
		probability = 1,
		response = "pes_temple_lake_crossing_first_conversation_no_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_first_conversation_no_elf_04_b",
		probability = 1,
		response = "pes_temple_lake_crossing_first_conversation_no_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_04_a",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_second_conversation_elf_01_a",
		probability = 1,
		response = "pes_temple_lake_crossing_second_conversation_elf_01_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "pes_temple_lake_crossing_second_conversation_elf_02_a",
		probability = 1,
		response = "pes_temple_lake_crossing_second_conversation_elf_02_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "pes_temple_lake_crossing_second_conversation_elf_03_a",
		probability = 1,
		response = "pes_temple_lake_crossing_second_conversation_elf_03_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "pes_temple_lake_crossing_second_conversation_elf_04_c",
		probability = 1,
		response = "pes_temple_lake_crossing_second_conversation_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_second_conversation_no_elf_01_c",
		probability = 1,
		response = "pes_temple_lake_crossing_second_conversation_no_elf_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_01_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_second_conversation_no_elf_02_b",
		probability = 1,
		response = "pes_temple_lake_crossing_second_conversation_no_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_02_a",
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
				OP.LT,
				7,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_second_conversation_no_elf_03_c",
		probability = 1,
		response = "pes_temple_lake_crossing_second_conversation_no_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_crossing_second_conversation_no_elf_04_b",
		probability = 1,
		response = "pes_temple_lake_crossing_second_conversation_no_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_04_a",
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
				OP.LT,
				7,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_temple_lake_landing_stage_conversation_01_b",
		probability = 1,
		response = "pes_temple_lake_landing_stage_conversation_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_landing_stage_conversation_01_a",
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
		name = "pes_temple_lake_landing_stage_conversation_01_d",
		probability = 1,
		response = "pes_temple_lake_landing_stage_conversation_01_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_landing_stage_conversation_01_c",
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
		name = "pes_temple_lake_landing_stage_conversation_05_a",
		probability = 1,
		response = "pes_temple_lake_landing_stage_conversation_05_a",
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
				"temple_lake_landing_stage_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
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
		name = "pes_temple_wilds_conversation_elf_02_c",
		probability = 1,
		response = "pes_temple_wilds_conversation_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_elf_02_b",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pes_temple_wilds_conversation_elf_04_a",
		probability = 1,
		response = "pes_temple_wilds_conversation_elf_04_a",
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
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_temple_wilds_conversation_elf_04_d",
		probability = 1,
		response = "pes_temple_wilds_conversation_elf_04_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_elf_04_c",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pes_temple_wilds_conversation_no_elf_01_b",
		probability = 1,
		response = "pes_temple_wilds_conversation_no_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_no_elf_01_a",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pes_temple_wilds_conversation_no_elf_02_c",
		probability = 1,
		response = "pes_temple_wilds_conversation_no_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_no_elf_02_b",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pes_temple_wilds_conversation_no_elf_04_a",
		probability = 1,
		response = "pes_temple_wilds_conversation_no_elf_04_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_temple_wilds_felled_trees_conversation_04_b",
		probability = 1,
		response = "pes_temple_wilds_felled_trees_conversation_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_04_a",
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
		name = "pes_temple_wilds_felled_trees_conversation_05_a",
		probability = 1,
		response = "pes_temple_wilds_felled_trees_conversation_05_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_temple_wilds_felled_trees_conversation_07_b",
		probability = 1,
		response = "pes_temple_wilds_felled_trees_conversation_07_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_07_a",
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
		name = "pes_temple_wilds_felled_trees_conversation_10_a",
		probability = 1,
		response = "pes_temple_wilds_felled_trees_conversation_10_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_temple_lake_crossing_elevator_conversation_elf_01_a",
		probability = 1,
		response = "pwe_temple_lake_crossing_elevator_conversation_elf_01_a",
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
				"temple_lake_crossing_elevator_conversation",
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
				OP.GTEQ,
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
				"temple_lake_crossing_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
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
		name = "pwe_temple_lake_crossing_elevator_conversation_elf_02_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_elevator_conversation_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_02_a",
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
		name = "pwe_temple_lake_crossing_elevator_conversation_elf_03_a",
		probability = 1,
		response = "pwe_temple_lake_crossing_elevator_conversation_elf_03_a",
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
				"temple_lake_crossing_elevator_conversation",
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
				OP.GTEQ,
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
				"temple_lake_crossing_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
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
		name = "pwe_temple_lake_crossing_elevator_conversation_elf_04_a",
		probability = 1,
		response = "pwe_temple_lake_crossing_elevator_conversation_elf_04_a",
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
				"temple_lake_crossing_elevator_conversation",
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
				OP.GTEQ,
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
				"temple_lake_crossing_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_elevator_conversation",
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
		name = "pwe_temple_lake_crossing_first_conversation_elf_01_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_first_conversation_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_01_a",
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
		name = "pwe_temple_lake_crossing_first_conversation_elf_02_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_first_conversation_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_02_a",
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
		name = "pwe_temple_lake_crossing_first_conversation_elf_03_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_first_conversation_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_03_a",
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
		name = "pwe_temple_lake_crossing_first_conversation_elf_04_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_first_conversation_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_04_a",
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
		name = "pwe_temple_lake_crossing_second_conversation_elf_01_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_second_conversation_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_01_a",
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
		name = "pwe_temple_lake_crossing_second_conversation_elf_02_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_second_conversation_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_02_a",
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
		name = "pwe_temple_lake_crossing_second_conversation_elf_03_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_second_conversation_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_03_a",
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
		name = "pwe_temple_lake_crossing_second_conversation_elf_04_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_second_conversation_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_04_a",
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
		name = "pwe_temple_lake_landing_stage_conversation_04_a",
		probability = 1,
		response = "pwe_temple_lake_landing_stage_conversation_04_a",
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
				"temple_lake_landing_stage_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
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
		name = "pwe_temple_lake_landing_stage_conversation_05_b",
		probability = 1,
		response = "pwe_temple_lake_landing_stage_conversation_05_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_landing_stage_conversation_05_a",
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
		name = "pwe_temple_wilds_conversation_elf_01_b",
		probability = 1,
		response = "pwe_temple_wilds_conversation_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_elf_01_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwe_temple_wilds_conversation_elf_02_b",
		probability = 1,
		response = "pwe_temple_wilds_conversation_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_elf_02_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwe_temple_wilds_conversation_elf_03_b",
		probability = 1,
		response = "pwe_temple_wilds_conversation_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_elf_03_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwe_temple_wilds_conversation_elf_04_b",
		probability = 1,
		response = "pwe_temple_wilds_conversation_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_elf_04_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwe_temple_wilds_felled_trees_conversation_03_b",
		probability = 1,
		response = "pwe_temple_wilds_felled_trees_conversation_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_03_a",
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
		name = "pwe_temple_wilds_felled_trees_conversation_04_a",
		probability = 1,
		response = "pwe_temple_wilds_felled_trees_conversation_04_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_temple_wilds_felled_trees_conversation_06_b",
		probability = 1,
		response = "pwe_temple_wilds_felled_trees_conversation_06_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_06_a",
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
		name = "pwe_temple_wilds_felled_trees_conversation_09_a",
		probability = 1,
		response = "pwe_temple_wilds_felled_trees_conversation_09_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_elevator_conversation_elf_01_b",
		probability = 1,
		response = "pwh_temple_lake_crossing_elevator_conversation_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_01_a",
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
		name = "pwh_temple_lake_crossing_elevator_conversation_elf_04_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_elevator_conversation_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_elf_04_b",
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
		name = "pwh_temple_lake_crossing_elevator_conversation_no_elf_01_b",
		probability = 1,
		response = "pwh_temple_lake_crossing_elevator_conversation_no_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_01_a",
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
		name = "pwh_temple_lake_crossing_elevator_conversation_no_elf_04_b",
		probability = 1,
		response = "pwh_temple_lake_crossing_elevator_conversation_no_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_elevator_conversation_no_elf_04_a",
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
		name = "pwh_temple_lake_crossing_first_conversation_elf_01_a",
		probability = 1,
		response = "pwh_temple_lake_crossing_first_conversation_elf_01_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_first_conversation",
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
		name = "pwh_temple_lake_crossing_first_conversation_elf_02_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_first_conversation_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_first_conversation_elf_03_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_first_conversation_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_first_conversation_elf_04_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_first_conversation_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_first_conversation_no_elf_01_b",
		probability = 1,
		response = "pwh_temple_lake_crossing_first_conversation_no_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_01_a",
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
		name = "pwh_temple_lake_crossing_first_conversation_no_elf_02_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_first_conversation_no_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_first_conversation_no_elf_03_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_first_conversation_no_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_first_conversation_no_elf_04_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_first_conversation_no_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_first_conversation_no_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_second_conversation_elf_01_a",
		probability = 1,
		response = "pwh_temple_lake_crossing_second_conversation_elf_01_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "pwh_temple_lake_crossing_second_conversation_elf_02_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_second_conversation_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_second_conversation_elf_03_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_second_conversation_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_elf_03_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_second_conversation_elf_04_a",
		probability = 1,
		response = "pwh_temple_lake_crossing_second_conversation_elf_04_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_second_conversation",
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
		name = "pwh_temple_lake_crossing_second_conversation_no_elf_01_b",
		probability = 1,
		response = "pwh_temple_lake_crossing_second_conversation_no_elf_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_01_a",
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
				OP.LT,
				7,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_second_conversation_no_elf_02_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_second_conversation_no_elf_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_02_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_second_conversation_no_elf_03_b",
		probability = 1,
		response = "pwh_temple_lake_crossing_second_conversation_no_elf_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_03_a",
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
				OP.LT,
				7,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_second_conversation_no_elf_04_c",
		probability = 1,
		response = "pwh_temple_lake_crossing_second_conversation_no_elf_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_crossing_second_conversation_no_elf_04_b",
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
				OP.LT,
				7,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_landing_stage_conversation_01_a",
		probability = 1,
		response = "pwh_temple_lake_landing_stage_conversation_01_a",
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
				"temple_lake_landing_stage_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_landing_stage_conversation",
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
		name = "pwh_temple_lake_landing_stage_conversation_01_c",
		probability = 1,
		response = "pwh_temple_lake_landing_stage_conversation_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_landing_stage_conversation_01_b",
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
		name = "pwh_temple_lake_landing_stage_conversation_02_b",
		probability = 1,
		response = "pwh_temple_lake_landing_stage_conversation_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_lake_landing_stage_conversation_02_a",
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
				OP.GTEQ,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_conversation_elf_01_a",
		probability = 1,
		response = "pwh_temple_wilds_conversation_elf_01_a",
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
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_conversation_elf_03_c",
		probability = 1,
		response = "pwh_temple_wilds_conversation_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_elf_03_b",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_conversation_no_elf_01_a",
		probability = 1,
		response = "pwh_temple_wilds_conversation_no_elf_01_a",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_conversation_no_elf_02_b",
		probability = 1,
		response = "pwh_temple_wilds_conversation_no_elf_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_no_elf_02_a",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_conversation_no_elf_03_c",
		probability = 1,
		response = "pwh_temple_wilds_conversation_no_elf_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_no_elf_03_b",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_conversation_no_elf_04_b",
		probability = 1,
		response = "pwh_temple_wilds_conversation_no_elf_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_conversation_no_elf_04_a",
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
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_felled_trees_conversation_01_a",
		probability = 1,
		response = "pwh_temple_wilds_felled_trees_conversation_01_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_felled_trees_conversation_05_b",
		probability = 1,
		response = "pwh_temple_wilds_felled_trees_conversation_05_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_05_a",
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
		name = "pwh_temple_wilds_felled_trees_conversation_06_a",
		probability = 1,
		response = "pwh_temple_wilds_felled_trees_conversation_06_a",
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
				"temple_wilds_felled_trees_conversation",
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
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_felled_trees_conversation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_felled_trees_conversation_08_b",
		probability = 1,
		response = "pwh_temple_wilds_felled_trees_conversation_08_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_wilds_felled_trees_conversation_08_a",
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
		nik_temple_lake_crossing_elevator_conversation_no_elf_01_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_elevator_conversation_no_elf_01_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_elevator_conversation_no_elf_01_a_01",
			},
			sound_events_duration = {
				[1] = 5.6544585227966,
			},
		},
		nik_temple_lake_crossing_elevator_conversation_no_elf_02_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_elevator_conversation_no_elf_02_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_elevator_conversation_no_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 5.4452710151672,
			},
		},
		nik_temple_lake_crossing_elevator_conversation_no_elf_03_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_elevator_conversation_no_elf_03_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_elevator_conversation_no_elf_03_a_01",
			},
			sound_events_duration = {
				[1] = 7.2499585151672,
			},
		},
		nik_temple_lake_crossing_elevator_conversation_no_elf_04_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_elevator_conversation_no_elf_04_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_elevator_conversation_no_elf_04_a_01",
			},
			sound_events_duration = {
				[1] = 4.3895001411438,
			},
		},
		nik_temple_lake_crossing_first_conversation_no_elf_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_first_conversation_no_elf_01_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_first_conversation_no_elf_01_a_01",
			},
			sound_events_duration = {
				[1] = 5.1750206947327,
			},
		},
		nik_temple_lake_crossing_first_conversation_no_elf_01_a_DUMMYTRIGGER = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "temple_lake_crossing_first_conversation_no_elf_01_a_DUMMYTRIGGER",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		nik_temple_lake_crossing_first_conversation_no_elf_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_first_conversation_no_elf_02_b_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_first_conversation_no_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.6735000610352,
			},
		},
		nik_temple_lake_crossing_first_conversation_no_elf_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_first_conversation_no_elf_03_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_first_conversation_no_elf_03_a_01",
			},
			sound_events_duration = {
				[1] = 6.0759582519531,
			},
		},
		nik_temple_lake_crossing_first_conversation_no_elf_03_a_DUMMYTRIGGER = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "temple_lake_crossing_first_conversation_no_elf_03_a_DUMMYTRIGGER",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		nik_temple_lake_crossing_first_conversation_no_elf_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_first_conversation_no_elf_04_a_01",
			},
			sound_events = {
				[1] = "nik_temple_lake_crossing_first_conversation_no_elf_04_a_01",
			},
			sound_events_duration = {
				[1] = 7.0233960151672,
			},
		},
		nik_temple_lake_crossing_first_conversation_no_elf_04_a_DUMMYTRIGGER = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "temple_lake_crossing_first_conversation_no_elf_04_a_DUMMYTRIGGER",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		nik_temple_lake_crossing_second_conversation_no_elf_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_second_conversation_no_elf_01_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_second_conversation_no_elf_01_a_01",
			},
			sound_events_duration = {
				[1] = 5.8097081184387,
			},
		},
		nik_temple_lake_crossing_second_conversation_no_elf_01_a_DUMMYTRIGGER = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "temple_lake_crossing_second_conversation_no_elf_01_a_DUMMYTRIGGER",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		nik_temple_lake_crossing_second_conversation_no_elf_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_second_conversation_no_elf_02_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_second_conversation_no_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 5.1204581260681,
			},
		},
		nik_temple_lake_crossing_second_conversation_no_elf_02_a_DUMMYTRIGGER = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "temple_lake_crossing_second_conversation_no_elf_02_a_DUMMYTRIGGER",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		nik_temple_lake_crossing_second_conversation_no_elf_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_second_conversation_no_elf_03_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_second_conversation_no_elf_03_a_01",
			},
			sound_events_duration = {
				[1] = 6.898937702179,
			},
		},
		nik_temple_lake_crossing_second_conversation_no_elf_03_a_DUMMYTRIGGER = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "temple_lake_crossing_second_conversation_no_elf_03_a_DUMMYTRIGGER",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		nik_temple_lake_crossing_second_conversation_no_elf_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "nik_temple_lake_crossing_second_conversation_no_elf_04_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_temple_lake_crossing_second_conversation_no_elf_04_a_01",
			},
			sound_events_duration = {
				[1] = 6.9963750839233,
			},
		},
		nik_temple_lake_crossing_second_conversation_no_elf_04_a_DUMMYTRIGGER = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "temple_lake_crossing_second_conversation_no_elf_04_a_DUMMYTRIGGER",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pbw_temple_lake_crossing_elevator_conversation_elf_02_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_elevator_conversation_elf_02_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_elevator_conversation_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 6.8435626029968,
			},
		},
		pbw_temple_lake_crossing_elevator_conversation_elf_03_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_elevator_conversation_elf_03_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_elevator_conversation_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 4.3917918205261,
			},
		},
		pbw_temple_lake_crossing_elevator_conversation_no_elf_02_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_elevator_conversation_no_elf_02_b_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_elevator_conversation_no_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 2.9831666946411,
			},
		},
		pbw_temple_lake_crossing_elevator_conversation_no_elf_03_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_elevator_conversation_no_elf_03_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_elevator_conversation_no_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 3.1954166889191,
			},
		},
		pbw_temple_lake_crossing_first_conversation_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_first_conversation_elf_01_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_first_conversation_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 4.1543960571289,
			},
		},
		pbw_temple_lake_crossing_first_conversation_elf_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_first_conversation_elf_02_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_first_conversation_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 5.2430000305176,
			},
		},
		pbw_temple_lake_crossing_first_conversation_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_first_conversation_elf_03_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_first_conversation_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 6.8108749389648,
			},
		},
		pbw_temple_lake_crossing_first_conversation_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_first_conversation_elf_04_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_first_conversation_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 5.8300833702087,
			},
		},
		pbw_temple_lake_crossing_first_conversation_no_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_first_conversation_no_elf_01_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_first_conversation_no_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 3.4825832843781,
			},
		},
		pbw_temple_lake_crossing_first_conversation_no_elf_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_first_conversation_no_elf_02_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_first_conversation_no_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 2.5260000228882,
			},
		},
		pbw_temple_lake_crossing_first_conversation_no_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_first_conversation_no_elf_03_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_first_conversation_no_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 5.552312374115,
			},
		},
		pbw_temple_lake_crossing_first_conversation_no_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_first_conversation_no_elf_04_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_first_conversation_no_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 4.2356877326965,
			},
		},
		pbw_temple_lake_crossing_second_conversation_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_second_conversation_elf_01_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_second_conversation_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 3.2322082519531,
			},
		},
		pbw_temple_lake_crossing_second_conversation_elf_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_second_conversation_elf_02_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_second_conversation_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 5.9656248092651,
			},
		},
		pbw_temple_lake_crossing_second_conversation_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_second_conversation_elf_03_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_second_conversation_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 3.0801041126251,
			},
		},
		pbw_temple_lake_crossing_second_conversation_elf_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_second_conversation_elf_04_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_second_conversation_elf_04_a_01",
			},
			sound_events_duration = {
				[1] = 5.6009998321533,
			},
		},
		pbw_temple_lake_crossing_second_conversation_no_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_second_conversation_no_elf_01_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_second_conversation_no_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 4.7140831947327,
			},
		},
		pbw_temple_lake_crossing_second_conversation_no_elf_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_second_conversation_no_elf_02_b_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_second_conversation_no_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.4416041374206,
			},
		},
		pbw_temple_lake_crossing_second_conversation_no_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_second_conversation_no_elf_03_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_second_conversation_no_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 6.58047914505,
			},
		},
		pbw_temple_lake_crossing_second_conversation_no_elf_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_second_conversation_no_elf_04_b_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_second_conversation_no_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 5.6433334350586,
			},
		},
		pbw_temple_lake_landing_stage_conversation_02_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_landing_stage_conversation_02_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_landing_stage_conversation_02_a_01",
			},
			sound_events_duration = {
				[1] = 3.8525624275208,
			},
		},
		pbw_temple_lake_landing_stage_conversation_03_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_lake_landing_stage_conversation_03_b_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_landing_stage_conversation_03_b_01",
			},
			sound_events_duration = {
				[1] = 2.5812709331513,
			},
		},
		pbw_temple_wilds_conversation_elf_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_conversation_elf_02_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_wilds_conversation_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 6.0586252212524,
			},
		},
		pbw_temple_wilds_conversation_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_conversation_elf_04_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_wilds_conversation_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 5.3214373588562,
			},
		},
		pbw_temple_wilds_conversation_no_elf_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_conversation_no_elf_02_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_wilds_conversation_no_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 4.6909790039063,
			},
		},
		pbw_temple_wilds_conversation_no_elf_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_conversation_no_elf_03_b_01",
			},
			sound_events = {
				[1] = "pbw_temple_wilds_conversation_no_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.319812297821,
			},
		},
		pbw_temple_wilds_conversation_no_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_conversation_no_elf_04_c_01",
			},
			sound_events = {
				[1] = "pbw_temple_wilds_conversation_no_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 4.0156664848328,
			},
		},
		pbw_temple_wilds_felled_trees_conversation_01_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_felled_trees_conversation_01_b_01",
			},
			sound_events = {
				[1] = "pbw_temple_wilds_felled_trees_conversation_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.6193957328796,
			},
		},
		pbw_temple_wilds_felled_trees_conversation_02_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_felled_trees_conversation_02_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_wilds_felled_trees_conversation_02_a_01",
			},
			sound_events_duration = {
				[1] = 2.7065832614899,
			},
		},
		pbw_temple_wilds_felled_trees_conversation_07_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_felled_trees_conversation_07_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_wilds_felled_trees_conversation_07_a_01",
			},
			sound_events_duration = {
				[1] = 4.6256041526794,
			},
		},
		pbw_temple_wilds_felled_trees_conversation_09_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_felled_trees_conversation_09_b_01",
			},
			sound_events = {
				[1] = "pbw_temple_wilds_felled_trees_conversation_09_b_01",
			},
			sound_events_duration = {
				[1] = 5.1544585227966,
			},
		},
		pdr_temple_lake_crossing_elevator_conversation_elf_01_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_elevator_conversation_elf_01_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_elevator_conversation_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 1.8351666927338,
			},
		},
		pdr_temple_lake_crossing_elevator_conversation_elf_02_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_elevator_conversation_elf_02_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_elevator_conversation_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 2.9732916355133,
			},
		},
		pdr_temple_lake_crossing_elevator_conversation_elf_03_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_elevator_conversation_elf_03_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_elevator_conversation_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 2.7912292480469,
			},
		},
		pdr_temple_lake_crossing_elevator_conversation_elf_04_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_elevator_conversation_elf_04_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_elevator_conversation_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.4258124828339,
			},
		},
		pdr_temple_lake_crossing_elevator_conversation_no_elf_01_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_elevator_conversation_no_elf_01_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_elevator_conversation_no_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 5.7456250190735,
			},
		},
		pdr_temple_lake_crossing_elevator_conversation_no_elf_02_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_elevator_conversation_no_elf_02_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_elevator_conversation_no_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 6.9491457939148,
			},
		},
		pdr_temple_lake_crossing_elevator_conversation_no_elf_03_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_elevator_conversation_no_elf_03_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_elevator_conversation_no_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 2.4113125801086,
			},
		},
		pdr_temple_lake_crossing_elevator_conversation_no_elf_04_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_elevator_conversation_no_elf_04_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_elevator_conversation_no_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 5.5067291259766,
			},
		},
		pdr_temple_lake_crossing_first_conversation_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_first_conversation_elf_01_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_first_conversation_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 3.4999792575836,
			},
		},
		pdr_temple_lake_crossing_first_conversation_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_first_conversation_elf_02_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_first_conversation_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 3.9782707691193,
			},
		},
		pdr_temple_lake_crossing_first_conversation_elf_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_first_conversation_elf_03_a_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_first_conversation_elf_03_a_01",
			},
			sound_events_duration = {
				[1] = 4.5506873130798,
			},
		},
		pdr_temple_lake_crossing_first_conversation_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_first_conversation_elf_04_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_first_conversation_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 2.2266874313355,
			},
		},
		pdr_temple_lake_crossing_first_conversation_no_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_first_conversation_no_elf_01_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_first_conversation_no_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 3.5365834236145,
			},
		},
		pdr_temple_lake_crossing_first_conversation_no_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_first_conversation_no_elf_02_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_first_conversation_no_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 2.7326874732971,
			},
		},
		pdr_temple_lake_crossing_first_conversation_no_elf_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_first_conversation_no_elf_03_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_first_conversation_no_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 1.3735208511352,
			},
		},
		pdr_temple_lake_crossing_first_conversation_no_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_first_conversation_no_elf_04_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_first_conversation_no_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 5.210458278656,
			},
		},
		pdr_temple_lake_crossing_second_conversation_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_second_conversation_elf_01_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_second_conversation_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 5.4923543930054,
			},
		},
		pdr_temple_lake_crossing_second_conversation_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_second_conversation_elf_02_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_second_conversation_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 3.2384791374206,
			},
		},
		pdr_temple_lake_crossing_second_conversation_elf_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_second_conversation_elf_03_a_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_second_conversation_elf_03_a_01",
			},
			sound_events_duration = {
				[1] = 6.3199167251587,
			},
		},
		pdr_temple_lake_crossing_second_conversation_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_second_conversation_elf_04_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_second_conversation_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 2.9736874103546,
			},
		},
		pdr_temple_lake_crossing_second_conversation_no_elf_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_second_conversation_no_elf_01_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_second_conversation_no_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.3030834197998,
			},
		},
		pdr_temple_lake_crossing_second_conversation_no_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_second_conversation_no_elf_02_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_second_conversation_no_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 3.370854139328,
			},
		},
		pdr_temple_lake_crossing_second_conversation_no_elf_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_second_conversation_no_elf_03_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_second_conversation_no_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 7.4852914810181,
			},
		},
		pdr_temple_lake_crossing_second_conversation_no_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_crossing_second_conversation_no_elf_04_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_crossing_second_conversation_no_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 4.8361043930054,
			},
		},
		pdr_temple_lake_landing_stage_conversation_03_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_landing_stage_conversation_03_a_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_landing_stage_conversation_03_a_01",
			},
			sound_events_duration = {
				[1] = 3.869062423706,
			},
		},
		pdr_temple_lake_landing_stage_conversation_03_c = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_landing_stage_conversation_03_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_landing_stage_conversation_03_c_01",
			},
			sound_events_duration = {
				[1] = 2.6403958797455,
			},
		},
		pdr_temple_lake_landing_stage_conversation_04_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_lake_landing_stage_conversation_04_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_lake_landing_stage_conversation_04_b_01",
			},
			sound_events_duration = {
				[1] = 4.6999793052673,
			},
		},
		pdr_temple_wilds_conversation_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_wilds_conversation_elf_01_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_wilds_conversation_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 2.7088541984558,
			},
		},
		pdr_temple_wilds_conversation_elf_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_wilds_conversation_elf_03_a_01",
			},
			sound_events = {
				[1] = "pdr_temple_wilds_conversation_elf_03_a_01",
			},
			sound_events_duration = {
				[1] = 5.1336460113525,
			},
		},
		pdr_temple_wilds_conversation_no_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_wilds_conversation_no_elf_01_c_01",
			},
			sound_events = {
				[1] = "pdr_temple_wilds_conversation_no_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 2.2535834312439,
			},
		},
		pdr_temple_wilds_conversation_no_elf_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_wilds_conversation_no_elf_03_a_01",
			},
			sound_events = {
				[1] = "pdr_temple_wilds_conversation_no_elf_03_a_01",
			},
			sound_events_duration = {
				[1] = 3.7347500324249,
			},
		},
		pdr_temple_wilds_felled_trees_conversation_02_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_wilds_felled_trees_conversation_02_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_wilds_felled_trees_conversation_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.192479133606,
			},
		},
		pdr_temple_wilds_felled_trees_conversation_03_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_wilds_felled_trees_conversation_03_a_01",
			},
			sound_events = {
				[1] = "pdr_temple_wilds_felled_trees_conversation_03_a_01",
			},
			sound_events_duration = {
				[1] = 3.1526041030884,
			},
		},
		pdr_temple_wilds_felled_trees_conversation_08_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_wilds_felled_trees_conversation_08_a_01",
			},
			sound_events = {
				[1] = "pdr_temple_wilds_felled_trees_conversation_08_a_01",
			},
			sound_events_duration = {
				[1] = 4.6082501411438,
			},
		},
		pdr_temple_wilds_felled_trees_conversation_10_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pdr_temple_wilds_felled_trees_conversation_10_b_01",
			},
			sound_events = {
				[1] = "pdr_temple_wilds_felled_trees_conversation_10_b_01",
			},
			sound_events_duration = {
				[1] = 3.5236666202545,
			},
		},
		pes_temple_lake_crossing_elevator_conversation_elf_01_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_elevator_conversation_elf_01_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_elevator_conversation_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 2.5009791851044,
			},
		},
		pes_temple_lake_crossing_elevator_conversation_elf_02_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_elevator_conversation_elf_02_a_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_elevator_conversation_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 6.7897915840149,
			},
		},
		pes_temple_lake_crossing_elevator_conversation_elf_03_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_elevator_conversation_elf_03_b_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_elevator_conversation_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.2961668968201,
			},
		},
		pes_temple_lake_crossing_elevator_conversation_elf_04_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_elevator_conversation_elf_04_b_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_elevator_conversation_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 4.8453330993652,
			},
		},
		pes_temple_lake_crossing_elevator_conversation_no_elf_01_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_elevator_conversation_no_elf_01_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_elevator_conversation_no_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 3.2255833148956,
			},
		},
		pes_temple_lake_crossing_elevator_conversation_no_elf_02_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_elevator_conversation_no_elf_02_b_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_elevator_conversation_no_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.064374923706,
			},
		},
		pes_temple_lake_crossing_elevator_conversation_no_elf_03_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_elevator_conversation_no_elf_03_b_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_elevator_conversation_no_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.7645626068115,
			},
		},
		pes_temple_lake_crossing_elevator_conversation_no_elf_04_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_elevator_conversation_no_elf_04_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_elevator_conversation_no_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 4.1715626716614,
			},
		},
		pes_temple_lake_crossing_first_conversation_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_first_conversation_elf_01_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_first_conversation_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 2.0402708053589,
			},
		},
		pes_temple_lake_crossing_first_conversation_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_first_conversation_elf_02_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_first_conversation_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 3.170916557312,
			},
		},
		pes_temple_lake_crossing_first_conversation_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_first_conversation_elf_03_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_first_conversation_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 3.8289165496826,
			},
		},
		pes_temple_lake_crossing_first_conversation_elf_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_first_conversation_elf_04_a_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_first_conversation_elf_04_a_01",
			},
			sound_events_duration = {
				[1] = 6.3728542327881,
			},
		},
		pes_temple_lake_crossing_first_conversation_no_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_first_conversation_no_elf_01_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_first_conversation_no_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 3.2373750209808,
			},
		},
		pes_temple_lake_crossing_first_conversation_no_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_first_conversation_no_elf_02_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_first_conversation_no_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 3.688333272934,
			},
		},
		pes_temple_lake_crossing_first_conversation_no_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_first_conversation_no_elf_03_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_first_conversation_no_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 3.2845833301544,
			},
		},
		pes_temple_lake_crossing_first_conversation_no_elf_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_first_conversation_no_elf_04_b_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_first_conversation_no_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.374041557312,
			},
		},
		pes_temple_lake_crossing_second_conversation_elf_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_second_conversation_elf_01_a_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_second_conversation_elf_01_a_01",
			},
			sound_events_duration = {
				[1] = 4.6180000305176,
			},
		},
		pes_temple_lake_crossing_second_conversation_elf_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_second_conversation_elf_02_a_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_second_conversation_elf_02_a_01",
			},
			sound_events_duration = {
				[1] = 3.6138541698456,
			},
		},
		pes_temple_lake_crossing_second_conversation_elf_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_second_conversation_elf_03_a_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_second_conversation_elf_03_a_01",
			},
			sound_events_duration = {
				[1] = 5.2986040115356,
			},
		},
		pes_temple_lake_crossing_second_conversation_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_second_conversation_elf_04_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_second_conversation_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 7.7839164733887,
			},
		},
		pes_temple_lake_crossing_second_conversation_no_elf_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_second_conversation_no_elf_01_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_second_conversation_no_elf_01_c_01",
			},
			sound_events_duration = {
				[1] = 5.8155832290649,
			},
		},
		pes_temple_lake_crossing_second_conversation_no_elf_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_second_conversation_no_elf_02_b_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_second_conversation_no_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.035749912262,
			},
		},
		pes_temple_lake_crossing_second_conversation_no_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_second_conversation_no_elf_03_c_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_second_conversation_no_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 3.9582917690277,
			},
		},
		pes_temple_lake_crossing_second_conversation_no_elf_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_second_conversation_no_elf_04_b_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_second_conversation_no_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 4.3523750305176,
			},
		},
		pes_temple_lake_landing_stage_conversation_01_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_landing_stage_conversation_01_b_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_landing_stage_conversation_01_b_01",
			},
			sound_events_duration = {
				[1] = 2.8997707366943,
			},
		},
		pes_temple_lake_landing_stage_conversation_01_d = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_landing_stage_conversation_01_d_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_landing_stage_conversation_01_d_01",
			},
			sound_events_duration = {
				[1] = 0.58327084779739,
			},
		},
		pes_temple_lake_landing_stage_conversation_05_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_lake_landing_stage_conversation_05_a_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_landing_stage_conversation_05_a_01",
			},
			sound_events_duration = {
				[1] = 4.424708366394,
			},
		},
		pes_temple_wilds_conversation_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_conversation_elf_02_c_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_conversation_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 4.3274998664856,
			},
		},
		pes_temple_wilds_conversation_elf_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_conversation_elf_04_a_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_conversation_elf_04_a_01",
			},
			sound_events_duration = {
				[1] = 3.6245625019074,
			},
		},
		pes_temple_wilds_conversation_elf_04_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_conversation_elf_04_d_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_conversation_elf_04_d_01",
			},
			sound_events_duration = {
				[1] = 4.4498543739319,
			},
		},
		pes_temple_wilds_conversation_no_elf_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_conversation_no_elf_01_b_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_conversation_no_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.3399999141693,
			},
		},
		pes_temple_wilds_conversation_no_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_conversation_no_elf_02_c_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_conversation_no_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 3.9891042709351,
			},
		},
		pes_temple_wilds_conversation_no_elf_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_conversation_no_elf_04_a_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_conversation_no_elf_04_a_01",
			},
			sound_events_duration = {
				[1] = 3.756041765213,
			},
		},
		pes_temple_wilds_felled_trees_conversation_04_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_felled_trees_conversation_04_b_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_felled_trees_conversation_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.5323333740234,
			},
		},
		pes_temple_wilds_felled_trees_conversation_05_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_felled_trees_conversation_05_a_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_felled_trees_conversation_05_a_01",
			},
			sound_events_duration = {
				[1] = 5.1693959236145,
			},
		},
		pes_temple_wilds_felled_trees_conversation_07_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_felled_trees_conversation_07_b_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_felled_trees_conversation_07_b_01",
			},
			sound_events_duration = {
				[1] = 3.7851667404175,
			},
		},
		pes_temple_wilds_felled_trees_conversation_10_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pes_temple_wilds_felled_trees_conversation_10_a_01",
			},
			sound_events = {
				[1] = "pes_temple_wilds_felled_trees_conversation_10_a_01",
			},
			sound_events_duration = {
				[1] = 3.6664166450501,
			},
		},
		pwe_temple_lake_crossing_elevator_conversation_elf_01_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_elevator_conversation_elf_01_a_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_elevator_conversation_elf_01_a_01",
			},
			sound_events_duration = {
				[1] = 8.3954162597656,
			},
		},
		pwe_temple_lake_crossing_elevator_conversation_elf_02_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_elevator_conversation_elf_02_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_elevator_conversation_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 7.6635417938232,
			},
		},
		pwe_temple_lake_crossing_elevator_conversation_elf_03_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_elevator_conversation_elf_03_a_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_elevator_conversation_elf_03_a_01",
			},
			sound_events_duration = {
				[1] = 7.1739997863769,
			},
		},
		pwe_temple_lake_crossing_elevator_conversation_elf_04_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_elevator_conversation_elf_04_a_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_elevator_conversation_elf_04_a_01",
			},
			sound_events_duration = {
				[1] = 4.9743957519531,
			},
		},
		pwe_temple_lake_crossing_first_conversation_elf_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_first_conversation_elf_01_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_first_conversation_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 7.0380835533142,
			},
		},
		pwe_temple_lake_crossing_first_conversation_elf_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_first_conversation_elf_02_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_first_conversation_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 7.1653957366943,
			},
		},
		pwe_temple_lake_crossing_first_conversation_elf_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_first_conversation_elf_03_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_first_conversation_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 6.3099164962769,
			},
		},
		pwe_temple_lake_crossing_first_conversation_elf_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_first_conversation_elf_04_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_first_conversation_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 6.3817291259766,
			},
		},
		pwe_temple_lake_crossing_second_conversation_elf_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_second_conversation_elf_01_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_second_conversation_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 6.5130414962769,
			},
		},
		pwe_temple_lake_crossing_second_conversation_elf_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_second_conversation_elf_02_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_second_conversation_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.6941876411438,
			},
		},
		pwe_temple_lake_crossing_second_conversation_elf_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_second_conversation_elf_03_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_second_conversation_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 6.3213124275208,
			},
		},
		pwe_temple_lake_crossing_second_conversation_elf_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_second_conversation_elf_04_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_second_conversation_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 7.3339581489563,
			},
		},
		pwe_temple_lake_landing_stage_conversation_04_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_landing_stage_conversation_04_a_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_landing_stage_conversation_04_a_01",
			},
			sound_events_duration = {
				[1] = 4.2709584236145,
			},
		},
		pwe_temple_lake_landing_stage_conversation_05_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_lake_landing_stage_conversation_05_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_landing_stage_conversation_05_b_01",
			},
			sound_events_duration = {
				[1] = 4.1652708053589,
			},
		},
		pwe_temple_wilds_conversation_elf_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_wilds_conversation_elf_01_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_wilds_conversation_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 9.0436458587647,
			},
		},
		pwe_temple_wilds_conversation_elf_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_wilds_conversation_elf_02_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_wilds_conversation_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 6.0260624885559,
			},
		},
		pwe_temple_wilds_conversation_elf_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_wilds_conversation_elf_03_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_wilds_conversation_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 7.8362498283386,
			},
		},
		pwe_temple_wilds_conversation_elf_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_wilds_conversation_elf_04_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_wilds_conversation_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 9.2288541793823,
			},
		},
		pwe_temple_wilds_felled_trees_conversation_03_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_wilds_felled_trees_conversation_03_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_wilds_felled_trees_conversation_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.2583334445953,
			},
		},
		pwe_temple_wilds_felled_trees_conversation_04_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_wilds_felled_trees_conversation_04_a_01",
			},
			sound_events = {
				[1] = "pwe_temple_wilds_felled_trees_conversation_04_a_01",
			},
			sound_events_duration = {
				[1] = 4.6362915039063,
			},
		},
		pwe_temple_wilds_felled_trees_conversation_06_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_wilds_felled_trees_conversation_06_b_01",
			},
			sound_events = {
				[1] = "pwe_temple_wilds_felled_trees_conversation_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.9809999465942,
			},
		},
		pwe_temple_wilds_felled_trees_conversation_09_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwe_temple_wilds_felled_trees_conversation_09_a_01",
			},
			sound_events = {
				[1] = "pwe_temple_wilds_felled_trees_conversation_09_a_01",
			},
			sound_events_duration = {
				[1] = 3.3976874351502,
			},
		},
		pwh_temple_lake_crossing_elevator_conversation_elf_01_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_elevator_conversation_elf_01_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_elevator_conversation_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 1.5977292060852,
			},
		},
		pwh_temple_lake_crossing_elevator_conversation_elf_04_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_elevator_conversation_elf_04_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_elevator_conversation_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 4.2429165840149,
			},
		},
		pwh_temple_lake_crossing_elevator_conversation_no_elf_01_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_elevator_conversation_no_elf_01_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_elevator_conversation_no_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.4660000801086,
			},
		},
		pwh_temple_lake_crossing_elevator_conversation_no_elf_04_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_elevator_conversation_no_elf_04_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_elevator_conversation_no_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 7.8308124542236,
			},
		},
		pwh_temple_lake_crossing_first_conversation_elf_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_first_conversation_elf_01_a_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_first_conversation_elf_01_a_01",
			},
			sound_events_duration = {
				[1] = 8.7378330230713,
			},
		},
		pwh_temple_lake_crossing_first_conversation_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_first_conversation_elf_02_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_first_conversation_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 4.0391874313355,
			},
		},
		pwh_temple_lake_crossing_first_conversation_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_first_conversation_elf_03_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_first_conversation_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 6.7037706375122,
			},
		},
		pwh_temple_lake_crossing_first_conversation_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_first_conversation_elf_04_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_first_conversation_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 7.2728748321533,
			},
		},
		pwh_temple_lake_crossing_first_conversation_no_elf_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_first_conversation_no_elf_01_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_first_conversation_no_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 6.0249376296997,
			},
		},
		pwh_temple_lake_crossing_first_conversation_no_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_first_conversation_no_elf_02_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_first_conversation_no_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 4.9155206680298,
			},
		},
		pwh_temple_lake_crossing_first_conversation_no_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_first_conversation_no_elf_03_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_first_conversation_no_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 6.0972084999084,
			},
		},
		pwh_temple_lake_crossing_first_conversation_no_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_first_conversation_no_elf_04_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_first_conversation_no_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 4.5104165077209,
			},
		},
		pwh_temple_lake_crossing_second_conversation_elf_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_second_conversation_elf_01_a_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_second_conversation_elf_01_a_01",
			},
			sound_events_duration = {
				[1] = 5.6325831413269,
			},
		},
		pwh_temple_lake_crossing_second_conversation_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_second_conversation_elf_02_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_second_conversation_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 3.4063541889191,
			},
		},
		pwh_temple_lake_crossing_second_conversation_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_second_conversation_elf_03_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_second_conversation_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 4.5320625305176,
			},
		},
		pwh_temple_lake_crossing_second_conversation_elf_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_second_conversation_elf_04_a_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_second_conversation_elf_04_a_01",
			},
			sound_events_duration = {
				[1] = 5.8479585647583,
			},
		},
		pwh_temple_lake_crossing_second_conversation_no_elf_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_second_conversation_no_elf_01_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_second_conversation_no_elf_01_b_01",
			},
			sound_events_duration = {
				[1] = 7.7860207557678,
			},
		},
		pwh_temple_lake_crossing_second_conversation_no_elf_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_second_conversation_no_elf_02_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_second_conversation_no_elf_02_c_01",
			},
			sound_events_duration = {
				[1] = 4.5563750267029,
			},
		},
		pwh_temple_lake_crossing_second_conversation_no_elf_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_second_conversation_no_elf_03_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_second_conversation_no_elf_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.8107500076294,
			},
		},
		pwh_temple_lake_crossing_second_conversation_no_elf_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_second_conversation_no_elf_04_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_second_conversation_no_elf_04_c_01",
			},
			sound_events_duration = {
				[1] = 5.1213126182556,
			},
		},
		pwh_temple_lake_landing_stage_conversation_01_a = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_landing_stage_conversation_01_a_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_landing_stage_conversation_01_a_01",
			},
			sound_events_duration = {
				[1] = 2.687979221344,
			},
		},
		pwh_temple_lake_landing_stage_conversation_01_c = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_landing_stage_conversation_01_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_landing_stage_conversation_01_c_01",
			},
			sound_events_duration = {
				[1] = 3.6475417613983,
			},
		},
		pwh_temple_lake_landing_stage_conversation_02_b = {
			category = "level_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_lake_landing_stage_conversation_02_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_landing_stage_conversation_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.8460001945496,
			},
		},
		pwh_temple_wilds_conversation_elf_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_conversation_elf_01_a_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_conversation_elf_01_a_01",
			},
			sound_events_duration = {
				[1] = 8.4532289505005,
			},
		},
		pwh_temple_wilds_conversation_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_conversation_elf_03_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_conversation_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 6.8054585456848,
			},
		},
		pwh_temple_wilds_conversation_no_elf_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_conversation_no_elf_01_a_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_conversation_no_elf_01_a_01",
			},
			sound_events_duration = {
				[1] = 3.6862292289734,
			},
		},
		pwh_temple_wilds_conversation_no_elf_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_conversation_no_elf_02_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_conversation_no_elf_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.0967707633972,
			},
		},
		pwh_temple_wilds_conversation_no_elf_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_conversation_no_elf_03_c_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_conversation_no_elf_03_c_01",
			},
			sound_events_duration = {
				[1] = 4.8433542251587,
			},
		},
		pwh_temple_wilds_conversation_no_elf_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_conversation_no_elf_04_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_conversation_no_elf_04_b_01",
			},
			sound_events_duration = {
				[1] = 6.1013956069946,
			},
		},
		pwh_temple_wilds_felled_trees_conversation_01_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_felled_trees_conversation_01_a_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_felled_trees_conversation_01_a_01",
			},
			sound_events_duration = {
				[1] = 2.8181874752045,
			},
		},
		pwh_temple_wilds_felled_trees_conversation_05_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_felled_trees_conversation_05_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_felled_trees_conversation_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.91441655159,
			},
		},
		pwh_temple_wilds_felled_trees_conversation_06_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_felled_trees_conversation_06_a_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_felled_trees_conversation_06_a_01",
			},
			sound_events_duration = {
				[1] = 4.6255207061768,
			},
		},
		pwh_temple_wilds_felled_trees_conversation_08_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_felled_trees_conversation_08_b_01",
			},
			sound_events = {
				[1] = "pwh_temple_wilds_felled_trees_conversation_08_b_01",
			},
			sound_events_duration = {
				[1] = 5.8296875953674,
			},
		},
	})
end
