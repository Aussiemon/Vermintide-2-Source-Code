-- chunkname: @dialogues/generated/hub_conversations_crawl.lua

return function ()
	define_rule({
		name = "nik_crawl_keep_level_complete_fail",
		response = "nik_crawl_keep_level_complete_fail",
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
				"nik_crawl_level_complete_fail",
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"dlc_celebrate_crawl",
			},
		},
	})
	define_rule({
		name = "nik_crawl_keep_level_complete_success",
		response = "nik_crawl_keep_level_complete_success",
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
				"nik_crawl_level_complete_success",
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"dlc_celebrate_crawl",
			},
		},
	})
	define_rule({
		name = "nik_greeting_evening_crawl",
		response = "nik_greeting_evening_crawl",
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
				"nik_greeting_evening",
			},
		},
	})
	define_rule({
		name = "nik_hub_backstory_interaction_crawl",
		response = "nik_hub_backstory_interaction_crawl",
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
				"nik_backstory_interacting",
			},
		},
	})
	define_rule({
		name = "nik_hub_quiet_drink_01_a",
		response = "nik_hub_quiet_drink_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwh_hub_quiet_drink_01_dummy_done",
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
		name = "nik_hub_quiet_drink_02_a",
		response = "nik_hub_quiet_drink_02_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_hub_quiet_drink_02_dummy_done",
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
		name = "nik_hub_quiet_drink_03_a",
		response = "nik_hub_quiet_drink_03_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pbw_hub_quiet_drink_05_dummy_done",
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
		name = "nik_hub_quiet_drink_04_a",
		response = "nik_hub_quiet_drink_04_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwe_hub_quiet_drink_04_dummy_done",
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
		name = "nik_hub_quiet_drink_05_a",
		response = "nik_hub_quiet_drink_05_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_hub_quiet_drink_05_dummy_done",
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
		name = "nik_hub_quiet_drink_06_a",
		response = "nik_hub_quiet_drink_06_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwe_hub_quiet_drink_06_dummy_done",
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
		name = "nik_hub_quiet_drink_07_a",
		response = "nik_hub_quiet_drink_07_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwh_hub_quiet_drink_07_dummy_done",
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
		name = "nik_hub_quiet_drink_08_a",
		response = "nik_hub_quiet_drink_08_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_hub_quiet_drink_08_dummy_done",
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
		name = "nik_hub_quiet_drink_09_a",
		response = "nik_hub_quiet_drink_09_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwe_hub_quiet_drink_09_dummy_done",
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
		name = "nik_hub_quiet_drink_10_a",
		response = "nik_hub_quiet_drink_10_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pbw_hub_quiet_drink_10_dummy_done",
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
		name = "pbw_hub_quiet_drink_01_e",
		response = "pbw_hub_quiet_drink_01_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_01_d_01",
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
		name = "pbw_hub_quiet_drink_02_e",
		response = "pbw_hub_quiet_drink_02_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_02_d_01",
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
		name = "pbw_hub_quiet_drink_03_b",
		response = "pbw_hub_quiet_drink_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_05_a_01",
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
		name = "pbw_hub_quiet_drink_03_dummy",
		response = "pbw_hub_quiet_drink_03_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_03",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_03",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_hub_quiet_drink_04_e",
		response = "pbw_hub_quiet_drink_04_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_04_d_01",
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
		name = "pbw_hub_quiet_drink_05_d",
		response = "pbw_hub_quiet_drink_05_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_05_c_01",
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
		name = "pbw_hub_quiet_drink_06_c",
		response = "pbw_hub_quiet_drink_06_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_06_b_01",
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
		name = "pbw_hub_quiet_drink_07_c",
		response = "pbw_hub_quiet_drink_07_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_hub_quiet_drink_07_b_01",
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
		name = "pbw_hub_quiet_drink_08_e",
		response = "pbw_hub_quiet_drink_08_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_08_d_01",
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
		name = "pbw_hub_quiet_drink_09_e",
		response = "pbw_hub_quiet_drink_09_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_09_d_01",
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
		name = "pbw_hub_quiet_drink_10_b",
		response = "pbw_hub_quiet_drink_10_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_10_a_01",
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
		name = "pbw_hub_quiet_drink_10_dummy",
		response = "pbw_hub_quiet_drink_10_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_10",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_10",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_hub_quiet_drink_11_b",
		response = "pbw_hub_quiet_drink_11_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_11_a_01",
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
		name = "pbw_hub_quiet_drink_12_a",
		response = "pbw_hub_quiet_drink_12_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_12",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_12",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_hub_quiet_drink_13_c",
		response = "pbw_hub_quiet_drink_13_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_hub_quiet_drink_15_b_01",
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
		name = "pbw_hub_quiet_drink_14_b",
		response = "pbw_hub_quiet_drink_14_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_14_a_01",
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
		name = "pbw_hub_quiet_drink_15_a",
		response = "pbw_hub_quiet_drink_15_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_15",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_15",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_hub_quiet_drink_17_c",
		response = "pbw_hub_quiet_drink_17_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_17_b_01",
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
		name = "pbw_hub_quiet_drink_18_b",
		response = "pbw_hub_quiet_drink_18_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_hub_quiet_drink_18_a_01",
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
		name = "pbw_hub_quiet_drink_18_d",
		response = "pbw_hub_quiet_drink_18_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_18_c_01",
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
		name = "pbw_hub_quiet_drink_19_a",
		response = "pbw_hub_quiet_drink_19_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_19",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_19",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_hub_quiet_drink_19_c",
		response = "pbw_hub_quiet_drink_19_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_19_b_01",
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
		name = "pbw_hub_quiet_drink_19_two_d",
		response = "pbw_hub_quiet_drink_19_two_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_19_c_01",
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
		name = "pbw_hub_quiet_drink_20_d",
		response = "pbw_hub_quiet_drink_20_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_20_c_01",
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
		name = "pdr_hub_quiet_drink_01_e",
		response = "pdr_hub_quiet_drink_01_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_01_d_01",
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
		name = "pdr_hub_quiet_drink_02_b",
		response = "pdr_hub_quiet_drink_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_02_a_01",
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
		name = "pdr_hub_quiet_drink_02_dummy",
		response = "pdr_hub_quiet_drink_02_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_02",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_02",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_hub_quiet_drink_03_e",
		response = "pdr_hub_quiet_drink_03_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_05_d_01",
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
		name = "pdr_hub_quiet_drink_04_c",
		response = "pdr_hub_quiet_drink_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_04_b_01",
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
		name = "pdr_hub_quiet_drink_05_b",
		response = "pdr_hub_quiet_drink_05_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_05_a_01",
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
		name = "pdr_hub_quiet_drink_05_dummy",
		response = "pdr_hub_quiet_drink_05_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_05",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_05",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_hub_quiet_drink_06_e",
		response = "pdr_hub_quiet_drink_06_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_06_d_01",
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
		name = "pdr_hub_quiet_drink_07_e",
		response = "pdr_hub_quiet_drink_07_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_07_d_01",
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
		name = "pdr_hub_quiet_drink_08_d",
		response = "pdr_hub_quiet_drink_08_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_08_c_01",
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
		name = "pdr_hub_quiet_drink_09_d",
		response = "pdr_hub_quiet_drink_09_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_09_c_01",
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
		name = "pdr_hub_quiet_drink_10_c",
		response = "pdr_hub_quiet_drink_10_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_10_b_01",
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
		name = "pdr_hub_quiet_drink_11_d",
		response = "pdr_hub_quiet_drink_11_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_11_c_01",
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
		name = "pdr_hub_quiet_drink_12_d",
		response = "pdr_hub_quiet_drink_12_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_12_c_01",
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
		name = "pdr_hub_quiet_drink_13_d",
		response = "pdr_hub_quiet_drink_13_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_15_c_01",
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
		name = "pdr_hub_quiet_drink_14_c",
		response = "pdr_hub_quiet_drink_14_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_14_b_01",
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
		name = "pdr_hub_quiet_drink_15_c",
		response = "pdr_hub_quiet_drink_15_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_15_b_01",
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
		name = "pdr_hub_quiet_drink_17_b",
		response = "pdr_hub_quiet_drink_17_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_17_a_01",
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
		name = "pdr_hub_quiet_drink_17_d",
		response = "pdr_hub_quiet_drink_17_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_17_c_01",
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
		name = "pdr_hub_quiet_drink_18_c",
		response = "pdr_hub_quiet_drink_18_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_18_b_01",
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
		name = "pdr_hub_quiet_drink_19_e",
		response = "pdr_hub_quiet_drink_19_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_19_d_01",
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
		name = "pdr_hub_quiet_drink_19_two_f",
		response = "pdr_hub_quiet_drink_19_two_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_19_e_01",
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
		name = "pdr_hub_quiet_drink_20_a",
		response = "pdr_hub_quiet_drink_20_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_20",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_20",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_hub_quiet_drink_20_c",
		response = "pdr_hub_quiet_drink_20_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_hub_quiet_drink_20_b_01",
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
		name = "pes_hub_quiet_drink_01_d",
		response = "pes_hub_quiet_drink_01_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_01_c_01",
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
		name = "pes_hub_quiet_drink_02_c",
		response = "pes_hub_quiet_drink_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_02_b_01",
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
		name = "pes_hub_quiet_drink_03_d",
		response = "pes_hub_quiet_drink_03_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_hub_quiet_drink_05_c_01",
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
		name = "pes_hub_quiet_drink_04_d",
		response = "pes_hub_quiet_drink_04_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_04_c_01",
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
		name = "pes_hub_quiet_drink_05_c",
		response = "pes_hub_quiet_drink_05_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_05_b_01",
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
		name = "pes_hub_quiet_drink_06_d",
		response = "pes_hub_quiet_drink_06_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_06_c_01",
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
		name = "pes_hub_quiet_drink_07_d",
		response = "pes_hub_quiet_drink_07_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_07_c_01",
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
		name = "pes_hub_quiet_drink_08_b",
		response = "pes_hub_quiet_drink_08_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_08_a_01",
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
		name = "pes_hub_quiet_drink_08_dummy",
		response = "pes_hub_quiet_drink_08_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_08",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_08",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hub_quiet_drink_09_c",
		response = "pes_hub_quiet_drink_09_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_09_b_01",
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
		name = "pes_hub_quiet_drink_10_d",
		response = "pes_hub_quiet_drink_10_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_10_c_01",
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
		name = "pes_hub_quiet_drink_11_a",
		response = "pes_hub_quiet_drink_11_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_11",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_11",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hub_quiet_drink_12_c",
		response = "pes_hub_quiet_drink_12_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_12_b_01",
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
		name = "pes_hub_quiet_drink_13_a",
		response = "pes_hub_quiet_drink_13_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_13",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_13",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hub_quiet_drink_14_d",
		response = "pes_hub_quiet_drink_14_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_14_c_01",
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
		name = "pes_hub_quiet_drink_15_b",
		response = "pes_hub_quiet_drink_15_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_15_a_01",
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
		name = "pes_hub_quiet_drink_16_b",
		response = "pes_hub_quiet_drink_16_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_hub_quiet_drink_16_a_01",
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
		name = "pes_hub_quiet_drink_16_d",
		response = "pes_hub_quiet_drink_16_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_hub_quiet_drink_16_c_01",
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
		name = "pes_hub_quiet_drink_17_d",
		response = "pes_hub_quiet_drink_17_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_17_d_01",
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
		name = "pes_hub_quiet_drink_18_d",
		response = "pes_hub_quiet_drink_18_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_18_d_01",
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
		name = "pes_hub_quiet_drink_19_b",
		response = "pes_hub_quiet_drink_19_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_19_a_01",
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
		name = "pes_hub_quiet_drink_19_two_a",
		response = "pes_hub_quiet_drink_19_two_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_19_two",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_19_two",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hub_quiet_drink_19_two_c",
		response = "pes_hub_quiet_drink_19_two_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_19_b_01",
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
		name = "pes_hub_quiet_drink_19_two_e",
		response = "pes_hub_quiet_drink_19_two_e",
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
				"hub_quiet_drink_19_two_d",
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
		name = "pes_hub_quiet_drink_20_e",
		response = "pes_hub_quiet_drink_20_e",
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
				"hub_quiet_drink_20_d",
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
		name = "pwe_hub_quiet_drink_01_c",
		response = "pwe_hub_quiet_drink_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_hub_quiet_drink_01_b_01",
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
		name = "pwe_hub_quiet_drink_02_d",
		response = "pwe_hub_quiet_drink_02_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_02_c_01",
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
		name = "pwe_hub_quiet_drink_03_e",
		response = "pwe_hub_quiet_drink_03_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_05_d_01",
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
		name = "pwe_hub_quiet_drink_04_b",
		response = "pwe_hub_quiet_drink_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_04_a_01",
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
		name = "pwe_hub_quiet_drink_04_dummy",
		response = "pwe_hub_quiet_drink_04_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_04",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_04",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_hub_quiet_drink_05_e",
		response = "pwe_hub_quiet_drink_05_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_05_d_01",
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
		name = "pwe_hub_quiet_drink_06_b",
		response = "pwe_hub_quiet_drink_06_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_06_a_01",
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
		name = "pwe_hub_quiet_drink_06_dummy",
		response = "pwe_hub_quiet_drink_06_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_06",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_06",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_hub_quiet_drink_07_e",
		response = "pwe_hub_quiet_drink_07_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_07_d_01",
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
		name = "pwe_hub_quiet_drink_08_c",
		response = "pwe_hub_quiet_drink_08_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_08_b_01",
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
		name = "pwe_hub_quiet_drink_09_b",
		response = "pwe_hub_quiet_drink_09_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_09_a_01",
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
		name = "pwe_hub_quiet_drink_09_dummy",
		response = "pwe_hub_quiet_drink_09_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_09",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_09",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_hub_quiet_drink_10_e",
		response = "pwe_hub_quiet_drink_10_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_10_d_01",
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
		name = "pwe_hub_quiet_drink_11_c",
		response = "pwe_hub_quiet_drink_11_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_11_b_01",
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
		name = "pwe_hub_quiet_drink_12_b",
		response = "pwe_hub_quiet_drink_12_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_12_a_01",
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
		name = "pwe_hub_quiet_drink_13_d",
		response = "pwe_hub_quiet_drink_13_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_15_c_01",
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
		name = "pwe_hub_quiet_drink_14_a",
		response = "pwe_hub_quiet_drink_14_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"bright_wizard",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_14",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_14",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_hub_quiet_drink_15_d",
		response = "pwe_hub_quiet_drink_15_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_15_c_01",
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
		name = "pwe_hub_quiet_drink_17_a",
		response = "pwe_hub_quiet_drink_17_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"friends_close",
				OP.GT,
				2,
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_17",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_17",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_hub_quiet_drink_19_d",
		response = "pwe_hub_quiet_drink_19_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_19_c_01",
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
		name = "pwe_hub_quiet_drink_19_two_b",
		response = "pwe_hub_quiet_drink_19_two_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_19_a_01",
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
		name = "pwe_hub_quiet_drink_20_d",
		response = "pwe_hub_quiet_drink_20_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_20_c_01",
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
		name = "pwh_hub_quiet_drink_01_b",
		response = "pwh_hub_quiet_drink_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_01_a_01",
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
		name = "pwh_hub_quiet_drink_01_dummy",
		response = "pwh_hub_quiet_drink_01_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_01",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_01",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_hub_quiet_drink_02_e",
		response = "pwh_hub_quiet_drink_02_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_02_d_01",
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
		name = "pwh_hub_quiet_drink_03_c",
		response = "pwh_hub_quiet_drink_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_05_b_01",
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
		name = "pwh_hub_quiet_drink_04_e",
		response = "pwh_hub_quiet_drink_04_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_04_d_01",
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
		name = "pwh_hub_quiet_drink_05_e",
		response = "pwh_hub_quiet_drink_05_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_hub_quiet_drink_05_d_01",
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
		name = "pwh_hub_quiet_drink_06_e",
		response = "pwh_hub_quiet_drink_06_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_06_d_01",
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
		name = "pwh_hub_quiet_drink_07_b",
		response = "pwh_hub_quiet_drink_07_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_quiet_drink_07_a_01",
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
		name = "pwh_hub_quiet_drink_07_dummy",
		response = "pwh_hub_quiet_drink_07_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"query_context",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_07",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_07",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_hub_quiet_drink_08_e",
		response = "pwh_hub_quiet_drink_08_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_08_d_01",
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
		name = "pwh_hub_quiet_drink_09_e",
		response = "pwh_hub_quiet_drink_09_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_09_d_01",
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
		name = "pwh_hub_quiet_drink_10_e",
		response = "pwh_hub_quiet_drink_10_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_10_d_01",
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
		name = "pwh_hub_quiet_drink_11_d",
		response = "pwh_hub_quiet_drink_11_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_11_c_01",
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
		name = "pwh_hub_quiet_drink_12_d",
		response = "pwh_hub_quiet_drink_12_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_12_c_01",
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
		name = "pwh_hub_quiet_drink_13_b",
		response = "pwh_hub_quiet_drink_13_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_15_a_01",
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
		name = "pwh_hub_quiet_drink_14_d",
		response = "pwh_hub_quiet_drink_14_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_14_c_01",
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
		name = "pwh_hub_quiet_drink_15_d",
		response = "pwh_hub_quiet_drink_15_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_15_c_01",
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
		name = "pwh_hub_quiet_drink_16_a",
		response = "pwh_hub_quiet_drink_16_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				OP.GTEQ,
				0,
			},
			{
				"query_context",
				"friends_close",
				OP.GTEQ,
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_16",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_16",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_hub_quiet_drink_16_c",
		response = "pwh_hub_quiet_drink_16_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_16_b_01",
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
		name = "pwh_hub_quiet_drink_16_d",
		response = "pwh_hub_quiet_drink_16_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_hub_quiet_drink_16_c_01",
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
		name = "pwh_hub_quiet_drink_18_a",
		response = "pwh_hub_quiet_drink_18_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"global_context",
				"bright_wizard",
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
				"query_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"query_context",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"crawl_conversation_18",
				OP.LT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_18",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"crawl_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_hub_quiet_drink_19_e",
		response = "pwh_hub_quiet_drink_19_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_hub_quiet_drink_19_d_01",
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
		name = "pwh_hub_quiet_drink_19_two_d",
		response = "pwh_hub_quiet_drink_19_two_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_hub_quiet_drink_19_c_01",
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
		name = "pwh_hub_quiet_drink_20_b",
		response = "pwh_hub_quiet_drink_20_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hub_quiet_drink_20_a_01",
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
		nik_crawl_keep_level_complete_fail = {
			category = "npc_talk",
			database = "hub_conversations_crawl",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"nik_crawl_keep_level_complete_fail_01",
				"nik_crawl_keep_level_complete_fail_02",
				"nik_crawl_keep_level_complete_fail_03",
				"nik_crawl_keep_level_complete_fail_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_crawl_keep_level_complete_fail_01",
				"nik_crawl_keep_level_complete_fail_02",
				"nik_crawl_keep_level_complete_fail_03",
				"nik_crawl_keep_level_complete_fail_04",
			},
			sound_events_duration = {
				6.0726041793823,
				5.3595209121704,
				2.6684792041779,
				7.3787708282471,
			},
		},
		nik_crawl_keep_level_complete_success = {
			category = "npc_talk",
			database = "hub_conversations_crawl",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"nik_crawl_keep_level_complete_success_01",
				"nik_crawl_keep_level_complete_success_02",
				"nik_crawl_keep_level_complete_success_03",
				"nik_crawl_keep_level_complete_success_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_crawl_keep_level_complete_success_01",
				"nik_crawl_keep_level_complete_success_02",
				"nik_crawl_keep_level_complete_success_03",
				"nik_crawl_keep_level_complete_success_04",
			},
			sound_events_duration = {
				9.010853767395,
				8.7184162139893,
				9.5816669464111,
				8.1269578933716,
			},
		},
		nik_greeting_evening_crawl = {
			category = "npc_talk",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 8,
			face_animations_n = 8,
			randomize_indexes_n = 0,
			sound_events_n = 8,
			dialogue_animations = {
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"nik_keep_idle_01",
				"nik_keep_idle_06",
				"nik_keep_idle_08",
				"nik_keep_idle_10",
				"nik_keep_idle_13",
				"nik_keep_idle_22",
				"nik_keep_idle_23",
				"nik_hub_greeting_evening_32",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_keep_idle_01",
				"nik_keep_idle_06",
				"nik_keep_idle_08",
				"nik_keep_idle_10",
				"nik_keep_idle_13",
				"nik_keep_idle_22",
				"nik_keep_idle_23",
				"nik_hub_greeting_evening_32",
			},
			sound_events_duration = {
				4.719229221344,
				5.4015002250671,
				8.8776664733887,
				6.4083333015442,
				4.4263124465942,
				10.569812774658,
				15.338541984558,
				1.0735000371933,
			},
		},
		nik_hub_backstory_interaction_crawl = {
			category = "npc_talk",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 9,
			face_animations_n = 9,
			randomize_indexes_n = 0,
			sound_events_n = 9,
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
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"nik_keep_endtimes_07",
				"nik_keep_endtimes_08",
				"nik_keep_endtimes_12",
				"nik_keep_endtimes_09",
				"nik_keep_endtimes_14",
				"nik_keep_endtimes_11",
				"nik_keep_endtimes_13",
				"nik_keep_endtimes_10",
				"nik_keep_idle_12",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_keep_endtimes_07",
				"nik_keep_endtimes_08",
				"nik_keep_endtimes_12",
				"nik_keep_endtimes_09",
				"nik_keep_endtimes_14",
				"nik_keep_endtimes_11",
				"nik_keep_endtimes_13",
				"nik_keep_endtimes_10",
				"nik_keep_idle_12",
			},
			sound_events_duration = {
				8.7913961410522,
				9.5934791564941,
				6.7096042633057,
				5.8461875915527,
				7.9246249198914,
				7.8400206565857,
				9.9928541183472,
				7.9879374504089,
				6.561999797821,
			},
		},
		nik_hub_quiet_drink_01_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_01_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_01_a_01",
			},
			sound_events_duration = {
				[1] = 3.2281250953674,
			},
		},
		nik_hub_quiet_drink_02_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_02_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_02_a_01",
			},
			sound_events_duration = {
				[1] = 3.4767916202545,
			},
		},
		nik_hub_quiet_drink_03_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_03_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_03_a_01",
			},
			sound_events_duration = {
				[1] = 4.4576668739319,
			},
		},
		nik_hub_quiet_drink_04_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_04_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_04_a_01",
			},
			sound_events_duration = {
				[1] = 6.2944793701172,
			},
		},
		nik_hub_quiet_drink_05_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_05_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_05_a_01",
			},
			sound_events_duration = {
				[1] = 3.6702082157135,
			},
		},
		nik_hub_quiet_drink_06_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_06_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_06_a_01",
			},
			sound_events_duration = {
				[1] = 5.1714582443237,
			},
		},
		nik_hub_quiet_drink_07_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_07_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_07_a_01",
			},
			sound_events_duration = {
				[1] = 4.4314789772034,
			},
		},
		nik_hub_quiet_drink_08_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_08_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_08_a_01",
			},
			sound_events_duration = {
				[1] = 4.5037083625794,
			},
		},
		nik_hub_quiet_drink_09_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_09_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_09_a_01",
			},
			sound_events_duration = {
				[1] = 3.6471874713898,
			},
		},
		nik_hub_quiet_drink_10_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 25,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "nik_hub_quiet_drink_10_a_01",
			},
			sound_events = {
				[1] = "nik_hub_quiet_drink_10_a_01",
			},
			sound_events_duration = {
				[1] = 7.7229585647583,
			},
		},
		pbw_hub_quiet_drink_01_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_01_e_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_01_e_01",
			},
			sound_events_duration = {
				[1] = 2.8553540706634,
			},
		},
		pbw_hub_quiet_drink_02_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_02_e_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_02_e_01",
			},
			sound_events_duration = {
				[1] = 2.5812292098999,
			},
		},
		pbw_hub_quiet_drink_03_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_03_b_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.1989793777466,
			},
		},
		pbw_hub_quiet_drink_03_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pbw_hub_quiet_drink_03_dummy_done",
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
		pbw_hub_quiet_drink_04_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_04_e_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_04_e_01",
			},
			sound_events_duration = {
				[1] = 3.1420834064484,
			},
		},
		pbw_hub_quiet_drink_05_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_05_d_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_05_d_01",
			},
			sound_events_duration = {
				[1] = 4.2129373550415,
			},
		},
		pbw_hub_quiet_drink_06_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_06_c_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_06_c_01",
			},
			sound_events_duration = {
				[1] = 7.1205835342407,
			},
		},
		pbw_hub_quiet_drink_07_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_07_c_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_07_c_01",
			},
			sound_events_duration = {
				[1] = 1.9439375400543,
			},
		},
		pbw_hub_quiet_drink_08_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_08_e_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_08_e_01",
			},
			sound_events_duration = {
				[1] = 3.7349374294281,
			},
		},
		pbw_hub_quiet_drink_09_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_09_e_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_09_e_01",
			},
			sound_events_duration = {
				[1] = 6.3600625991821,
			},
		},
		pbw_hub_quiet_drink_10_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_10_b_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_10_b_01",
			},
			sound_events_duration = {
				[1] = 4.7170834541321,
			},
		},
		pbw_hub_quiet_drink_10_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pbw_hub_quiet_drink_10_dummy_done",
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
		pbw_hub_quiet_drink_11_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_11_b_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_11_b_01",
			},
			sound_events_duration = {
				[1] = 4.9859166145325,
			},
		},
		pbw_hub_quiet_drink_12_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_12_a_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_12_a_01",
			},
			sound_events_duration = {
				[1] = 4.2921252250671,
			},
		},
		pbw_hub_quiet_drink_13_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_13_c_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_13_c_01",
			},
			sound_events_duration = {
				[1] = 7.262083530426,
			},
		},
		pbw_hub_quiet_drink_14_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_14_b_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_14_b_01",
			},
			sound_events_duration = {
				[1] = 5.6679167747498,
			},
		},
		pbw_hub_quiet_drink_15_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_15_a_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_15_a_01",
			},
			sound_events_duration = {
				[1] = 2.9931666851044,
			},
		},
		pbw_hub_quiet_drink_17_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_17_c_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_17_c_01",
			},
			sound_events_duration = {
				[1] = 2.6736874580383,
			},
		},
		pbw_hub_quiet_drink_18_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_18_b_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_18_b_01",
			},
			sound_events_duration = {
				[1] = 2.8977084159851,
			},
		},
		pbw_hub_quiet_drink_18_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_18_d_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_18_d_01",
			},
			sound_events_duration = {
				[1] = 6.5427708625794,
			},
		},
		pbw_hub_quiet_drink_19_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_19_a_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_19_a_01",
			},
			sound_events_duration = {
				[1] = 3.4643750190735,
			},
		},
		pbw_hub_quiet_drink_19_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_19_c_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_19_c_01",
			},
			sound_events_duration = {
				[1] = 3.0997500419617,
			},
		},
		pbw_hub_quiet_drink_19_two_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_19_d_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_19_d_01",
			},
			sound_events_duration = {
				[1] = 4.4315209388733,
			},
		},
		pbw_hub_quiet_drink_20_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_hub_quiet_drink_20_d_01",
			},
			sound_events = {
				[1] = "pbw_hub_quiet_drink_20_d_01",
			},
			sound_events_duration = {
				[1] = 3.134604215622,
			},
		},
		pdr_hub_quiet_drink_01_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_01_e_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_01_e_01",
			},
			sound_events_duration = {
				[1] = 3.5214166641235,
			},
		},
		pdr_hub_quiet_drink_02_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_02_b_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.2714581489563,
			},
		},
		pdr_hub_quiet_drink_02_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pdr_hub_quiet_drink_02_dummy_done",
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
		pdr_hub_quiet_drink_03_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_03_e_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_03_e_01",
			},
			sound_events_duration = {
				[1] = 2.4489998817444,
			},
		},
		pdr_hub_quiet_drink_04_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_04_c_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_04_c_01",
			},
			sound_events_duration = {
				[1] = 4.218770980835,
			},
		},
		pdr_hub_quiet_drink_05_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_05_b_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.1401875019074,
			},
		},
		pdr_hub_quiet_drink_05_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pdr_hub_quiet_drink_05_dummy_done",
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
		pdr_hub_quiet_drink_06_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_06_e_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_06_e_01",
			},
			sound_events_duration = {
				[1] = 2.779000043869,
			},
		},
		pdr_hub_quiet_drink_07_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_07_e_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_07_e_01",
			},
			sound_events_duration = {
				[1] = 3.8011040687561,
			},
		},
		pdr_hub_quiet_drink_08_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_08_d_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_08_d_01",
			},
			sound_events_duration = {
				[1] = 3.1588957309723,
			},
		},
		pdr_hub_quiet_drink_09_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_09_d_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_09_d_01",
			},
			sound_events_duration = {
				[1] = 11.471625328064,
			},
		},
		pdr_hub_quiet_drink_10_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_10_c_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_10_c_01",
			},
			sound_events_duration = {
				[1] = 3.6620416641235,
			},
		},
		pdr_hub_quiet_drink_11_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_11_d_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_11_d_01",
			},
			sound_events_duration = {
				[1] = 5.5637292861939,
			},
		},
		pdr_hub_quiet_drink_12_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_12_d_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_12_d_01",
			},
			sound_events_duration = {
				[1] = 2.5692083835602,
			},
		},
		pdr_hub_quiet_drink_13_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_13_d_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_13_d_01",
			},
			sound_events_duration = {
				[1] = 2.2551040649414,
			},
		},
		pdr_hub_quiet_drink_14_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_14_c_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_14_c_01",
			},
			sound_events_duration = {
				[1] = 4.4324164390564,
			},
		},
		pdr_hub_quiet_drink_15_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_15_c_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_15_c_01",
			},
			sound_events_duration = {
				[1] = 1.7653541564941,
			},
		},
		pdr_hub_quiet_drink_17_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_17_b_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_17_b_01",
			},
			sound_events_duration = {
				[1] = 5.4295206069946,
			},
		},
		pdr_hub_quiet_drink_17_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_17_d_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_17_d_01",
			},
			sound_events_duration = {
				[1] = 9.2083749771118,
			},
		},
		pdr_hub_quiet_drink_18_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_18_c_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_18_c_01",
			},
			sound_events_duration = {
				[1] = 7.0624375343323,
			},
		},
		pdr_hub_quiet_drink_19_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_19_e_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_19_e_01",
			},
			sound_events_duration = {
				[1] = 6.3684582710266,
			},
		},
		pdr_hub_quiet_drink_19_two_f = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_19_f_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_19_f_01",
			},
			sound_events_duration = {
				[1] = 2.8631665706634,
			},
		},
		pdr_hub_quiet_drink_20_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_20_a_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_20_a_01",
			},
			sound_events_duration = {
				[1] = 5.5831251144409,
			},
		},
		pdr_hub_quiet_drink_20_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_hub_quiet_drink_20_c_01",
			},
			sound_events = {
				[1] = "pdr_hub_quiet_drink_20_c_01",
			},
			sound_events_duration = {
				[1] = 5.0455207824707,
			},
		},
		pes_hub_quiet_drink_01_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_01_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_01_d_01",
			},
			sound_events_duration = {
				[1] = 2.4280624389648,
			},
		},
		pes_hub_quiet_drink_02_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_02_c_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_02_c_01",
			},
			sound_events_duration = {
				[1] = 1.5169583559036,
			},
		},
		pes_hub_quiet_drink_03_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_03_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_03_d_01",
			},
			sound_events_duration = {
				[1] = 4.3888125419617,
			},
		},
		pes_hub_quiet_drink_04_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_04_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_04_d_01",
			},
			sound_events_duration = {
				[1] = 4.6329584121704,
			},
		},
		pes_hub_quiet_drink_05_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_05_c_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_05_c_01",
			},
			sound_events_duration = {
				[1] = 6.5689373016357,
			},
		},
		pes_hub_quiet_drink_06_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_06_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_06_d_01",
			},
			sound_events_duration = {
				[1] = 5.0648126602173,
			},
		},
		pes_hub_quiet_drink_07_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_07_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_07_d_01",
			},
			sound_events_duration = {
				[1] = 4.3874793052673,
			},
		},
		pes_hub_quiet_drink_08_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_08_b_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_08_b_01",
			},
			sound_events_duration = {
				[1] = 4.8606457710266,
			},
		},
		pes_hub_quiet_drink_08_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pes_hub_quiet_drink_08_dummy_done",
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
		pes_hub_quiet_drink_09_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_09_c_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_09_c_01",
			},
			sound_events_duration = {
				[1] = 2.7458748817444,
			},
		},
		pes_hub_quiet_drink_10_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_10_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_10_d_01",
			},
			sound_events_duration = {
				[1] = 4.7091665267944,
			},
		},
		pes_hub_quiet_drink_11_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_11_a_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_11_a_01",
			},
			sound_events_duration = {
				[1] = 11.125749588013,
			},
		},
		pes_hub_quiet_drink_12_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_12_c_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_12_c_01",
			},
			sound_events_duration = {
				[1] = 6.3583750724792,
			},
		},
		pes_hub_quiet_drink_13_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_13_a_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_13_a_01",
			},
			sound_events_duration = {
				[1] = 6.5207710266113,
			},
		},
		pes_hub_quiet_drink_14_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_14_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_14_d_01",
			},
			sound_events_duration = {
				[1] = 7.8063960075378,
			},
		},
		pes_hub_quiet_drink_15_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_15_b_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_15_b_01",
			},
			sound_events_duration = {
				[1] = 4.5629377365112,
			},
		},
		pes_hub_quiet_drink_16_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_16_b_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_16_b_01",
			},
			sound_events_duration = {
				[1] = 4.8580622673035,
			},
		},
		pes_hub_quiet_drink_16_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_16_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_16_d_01",
			},
			sound_events_duration = {
				[1] = 2.9298124313355,
			},
		},
		pes_hub_quiet_drink_17_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_17_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_17_d_01",
			},
			sound_events_duration = {
				[1] = 7.5881042480469,
			},
		},
		pes_hub_quiet_drink_18_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_18_d_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_18_d_01",
			},
			sound_events_duration = {
				[1] = 5.4745626449585,
			},
		},
		pes_hub_quiet_drink_19_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_19_b_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_19_b_01",
			},
			sound_events_duration = {
				[1] = 4.1288542747498,
			},
		},
		pes_hub_quiet_drink_19_two_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_19_a_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_19_a_01",
			},
			sound_events_duration = {
				[1] = 7.0175623893738,
			},
		},
		pes_hub_quiet_drink_19_two_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_19_c_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_19_c_01",
			},
			sound_events_duration = {
				[1] = 3.6937708854675,
			},
		},
		pes_hub_quiet_drink_19_two_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_19_e_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_19_e_01",
			},
			sound_events_duration = {
				[1] = 4.676374912262,
			},
		},
		pes_hub_quiet_drink_20_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hub_quiet_drink_20_e_01",
			},
			sound_events = {
				[1] = "pes_hub_quiet_drink_20_e_01",
			},
			sound_events_duration = {
				[1] = 4.0648956298828,
			},
		},
		pwe_hub_quiet_drink_01_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_01_c_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_01_c_01",
			},
			sound_events_duration = {
				[1] = 1.851979136467,
			},
		},
		pwe_hub_quiet_drink_02_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_02_d_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_02_d_01",
			},
			sound_events_duration = {
				[1] = 1.6230624914169,
			},
		},
		pwe_hub_quiet_drink_03_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_03_e_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_03_e_01",
			},
			sound_events_duration = {
				[1] = 8.3012704849243,
			},
		},
		pwe_hub_quiet_drink_04_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_04_b_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.2121875286102,
			},
		},
		pwe_hub_quiet_drink_04_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pwe_hub_quiet_drink_04_dummy_done",
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
		pwe_hub_quiet_drink_05_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_05_e_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_05_e_01",
			},
			sound_events_duration = {
				[1] = 5.9716458320618,
			},
		},
		pwe_hub_quiet_drink_06_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_06_b_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_06_b_01",
			},
			sound_events_duration = {
				[1] = 6.2891664505005,
			},
		},
		pwe_hub_quiet_drink_06_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pwe_hub_quiet_drink_06_dummy_done",
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
		pwe_hub_quiet_drink_07_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_07_e_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_07_e_01",
			},
			sound_events_duration = {
				[1] = 2.9894165992737,
			},
		},
		pwe_hub_quiet_drink_08_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_08_c_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_08_c_01",
			},
			sound_events_duration = {
				[1] = 4.9184789657593,
			},
		},
		pwe_hub_quiet_drink_09_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_09_b_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_09_b_01",
			},
			sound_events_duration = {
				[1] = 6.4237289428711,
			},
		},
		pwe_hub_quiet_drink_09_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pwe_hub_quiet_drink_09_dummy_done",
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
		pwe_hub_quiet_drink_10_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_10_e_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_10_e_01",
			},
			sound_events_duration = {
				[1] = 4.6224789619446,
			},
		},
		pwe_hub_quiet_drink_11_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_11_c_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_11_c_01",
			},
			sound_events_duration = {
				[1] = 11.621728897095,
			},
		},
		pwe_hub_quiet_drink_12_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_12_b_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_12_b_01",
			},
			sound_events_duration = {
				[1] = 3.167729139328,
			},
		},
		pwe_hub_quiet_drink_13_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_13_d_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_13_d_01",
			},
			sound_events_duration = {
				[1] = 6.7219166755676,
			},
		},
		pwe_hub_quiet_drink_14_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_14_a_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_14_a_01",
			},
			sound_events_duration = {
				[1] = 8.3652086257935,
			},
		},
		pwe_hub_quiet_drink_15_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_15_d_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_15_d_01",
			},
			sound_events_duration = {
				[1] = 4.021999835968,
			},
		},
		pwe_hub_quiet_drink_17_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_17_a_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_17_a_01",
			},
			sound_events_duration = {
				[1] = 8.0355415344238,
			},
		},
		pwe_hub_quiet_drink_19_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_19_d_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_19_d_01",
			},
			sound_events_duration = {
				[1] = 4.8178334236145,
			},
		},
		pwe_hub_quiet_drink_19_two_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_19_b_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_19_b_01",
			},
			sound_events_duration = {
				[1] = 6.4911875724792,
			},
		},
		pwe_hub_quiet_drink_20_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_hub_quiet_drink_20_d_01",
			},
			sound_events = {
				[1] = "pwe_hub_quiet_drink_20_d_01",
			},
			sound_events_duration = {
				[1] = 6.2117290496826,
			},
		},
		pwh_hub_quiet_drink_01_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_01_b_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_01_b_01",
			},
			sound_events_duration = {
				[1] = 9.4091873168945,
			},
		},
		pwh_hub_quiet_drink_01_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pwh_hub_quiet_drink_01_dummy_done",
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
		pwh_hub_quiet_drink_02_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_02_e_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_02_e_01",
			},
			sound_events_duration = {
				[1] = 8.3499584197998,
			},
		},
		pwh_hub_quiet_drink_03_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_03_c_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_03_c_01",
			},
			sound_events_duration = {
				[1] = 9.0163545608521,
			},
		},
		pwh_hub_quiet_drink_04_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_04_e_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_04_e_01",
			},
			sound_events_duration = {
				[1] = 7.4990210533142,
			},
		},
		pwh_hub_quiet_drink_05_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_05_e_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_05_e_01",
			},
			sound_events_duration = {
				[1] = 7.8561668395996,
			},
		},
		pwh_hub_quiet_drink_06_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_06_e_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_06_e_01",
			},
			sound_events_duration = {
				[1] = 6.2922916412353,
			},
		},
		pwh_hub_quiet_drink_07_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_07_b_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_07_b_01",
			},
			sound_events_duration = {
				[1] = 9.4004793167114,
			},
		},
		pwh_hub_quiet_drink_07_dummy = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "pwh_hub_quiet_drink_07_dummy_done",
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
		pwh_hub_quiet_drink_08_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_08_e_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_08_e_01",
			},
			sound_events_duration = {
				[1] = 5.1852707862854,
			},
		},
		pwh_hub_quiet_drink_09_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_09_e_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_09_e_01",
			},
			sound_events_duration = {
				[1] = 5.6160001754761,
			},
		},
		pwh_hub_quiet_drink_10_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_10_e_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_10_e_01",
			},
			sound_events_duration = {
				[1] = 5.4422082901001,
			},
		},
		pwh_hub_quiet_drink_11_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_11_d_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_11_d_01",
			},
			sound_events_duration = {
				[1] = 5.0440831184387,
			},
		},
		pwh_hub_quiet_drink_12_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_12_d_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_12_d_01",
			},
			sound_events_duration = {
				[1] = 5.6769585609436,
			},
		},
		pwh_hub_quiet_drink_13_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_13_b_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_13_b_01",
			},
			sound_events_duration = {
				[1] = 14.161812782288,
			},
		},
		pwh_hub_quiet_drink_14_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_14_d_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_14_d_01",
			},
			sound_events_duration = {
				[1] = 8.132791519165,
			},
		},
		pwh_hub_quiet_drink_15_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_15_d_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_15_d_01",
			},
			sound_events_duration = {
				[1] = 8.9481248855591,
			},
		},
		pwh_hub_quiet_drink_16_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_16_a_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_16_a_01",
			},
			sound_events_duration = {
				[1] = 6.7564792633057,
			},
		},
		pwh_hub_quiet_drink_16_c = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_16_c_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_16_c_01",
			},
			sound_events_duration = {
				[1] = 5.2111043930054,
			},
		},
		pwh_hub_quiet_drink_16_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_16_d_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_16_d_01",
			},
			sound_events_duration = {
				[1] = 5.2797918319702,
			},
		},
		pwh_hub_quiet_drink_18_a = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_18_a_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_18_a_01",
			},
			sound_events_duration = {
				[1] = 7.551854133606,
			},
		},
		pwh_hub_quiet_drink_19_e = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_19_e_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_19_e_01",
			},
			sound_events_duration = {
				[1] = 9.2328128814697,
			},
		},
		pwh_hub_quiet_drink_19_two_d = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_19_d_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_19_d_01",
			},
			sound_events_duration = {
				[1] = 8.6000003814697,
			},
		},
		pwh_hub_quiet_drink_20_b = {
			category = "story_talk_keep",
			database = "hub_conversations_crawl",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_hub_quiet_drink_20_b_01",
			},
			sound_events = {
				[1] = "pwh_hub_quiet_drink_20_b_01",
			},
			sound_events_duration = {
				[1] = 3.346958398819,
			},
		},
	})
end
